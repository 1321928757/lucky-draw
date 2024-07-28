package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.award.model.aggregate.GiveOutPrizesAggregate;
import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.TaskEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordDocEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.entity.UserCreditAwardEntity;
import cn.bugstack.domain.award.model.valobj.AccountStatusVO;
import cn.bugstack.domain.award.model.valobj.AwardStateVO;
import cn.bugstack.domain.award.repository.IAwardRepository;
import cn.bugstack.infrastructure.event.EventPublisher;
import cn.bugstack.infrastructure.persistent.dao.elasticsearch.UserAwardRecordIndex;
import cn.bugstack.infrastructure.persistent.dao.mysql.*;
import cn.bugstack.infrastructure.persistent.doc.UserAwardRecordDoc;
import cn.bugstack.infrastructure.persistent.po.Task;
import cn.bugstack.infrastructure.persistent.po.UserAwardRecord;
import cn.bugstack.infrastructure.persistent.po.UserCreditAccount;
import cn.bugstack.middleware.db.router.strategy.IDBRouterStrategy;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.PageData;
import cn.hutool.core.util.DesensitizedUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.stream.Collectors;

@Slf4j
@Repository
public class AwardRepository implements IAwardRepository {

    @Resource
    private IUserAwardRecordDao userAwardRecordDao;

    @Resource
    private ITaskDao taskDao;

    @Resource
    private IUserRaffleOrderDao userRaffleOrderDao;

    @Resource
    private IAwardDao awardDao;

    @Resource
    private IUserCreditAccountDao creditAccountDao;

    @Resource
    private UserAwardRecordIndex userAwardRecordIndex;

    @Resource
    private ThreadPoolExecutor threadPoolExecutor;

    @Resource
    private EventPublisher eventPublisher;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Resource
    private IDBRouterStrategy dbRouter;


    @Override
    public void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate) {
        // 1.提取数据，转换实体对象为po对象
        UserAwardRecordEntity userAwardRecordEntity = userAwardRecordAggregate.getUserAwardRecordEntity();
        TaskEntity sendAwardTaskEntity = userAwardRecordAggregate.getSendAwardTaskEntity();
        TaskEntity syncRecordTaskEntity = userAwardRecordAggregate.getSyncRecordTaskEntity();
        String userId = userAwardRecordEntity.getUserId();
        Long activityId = userAwardRecordEntity.getActivityId();
        Integer awardId = userAwardRecordEntity.getAwardId();
        String orderId = userAwardRecordAggregate.getOrderId();

        // 1.1中奖订单对象
        UserAwardRecord userAwardRecord = new UserAwardRecord();
        userAwardRecord.setUserId(userAwardRecordEntity.getUserId());
        userAwardRecord.setActivityId(userAwardRecordEntity.getActivityId());
        userAwardRecord.setStrategyId(userAwardRecordEntity.getStrategyId());
        userAwardRecord.setOrderId(userAwardRecordEntity.getOrderId());
        userAwardRecord.setAwardId(userAwardRecordEntity.getAwardId());
        userAwardRecord.setAwardTitle(userAwardRecordEntity.getAwardTitle());
        userAwardRecord.setAwardImage(userAwardRecordEntity.getAwardImage());
        userAwardRecord.setAwardTime(userAwardRecordEntity.getAwardTime());
        userAwardRecord.setAwardState(userAwardRecordEntity.getAwardState().getCode());

        // 1.2发货任务对象
        Task sendAwardTask = new Task();
        sendAwardTask.setTopic(sendAwardTaskEntity.getTopic());
        sendAwardTask.setMessage(JSON.toJSONString(sendAwardTaskEntity.getMessage()));
        sendAwardTask.setState(sendAwardTaskEntity.getState().getCode());
        sendAwardTask.setMessageId(sendAwardTaskEntity.getMessageId());
        sendAwardTask.setUserId(sendAwardTaskEntity.getUserId());

        // 1.3数据同步对象
        Task syncRecordTask = new Task();
        syncRecordTask.setTopic(syncRecordTaskEntity.getTopic());
        syncRecordTask.setMessage(JSON.toJSONString(syncRecordTaskEntity.getMessage()));
        syncRecordTask.setState(syncRecordTaskEntity.getState().getCode());
        syncRecordTask.setMessageId(syncRecordTaskEntity.getMessageId());
        syncRecordTask.setUserId(syncRecordTaskEntity.getUserId());

        // 2.事务操作，保存中奖消息和发货任务(异步线程池)
        try {
            // 2.1 开启数据库路由
            dbRouter.doRouter(userId);
            // 2.2 编程式事务
            transactionTemplate.execute(status -> {
                try {
                    // 2.3 中奖记录入库
                    userAwardRecordDao.insert(userAwardRecord);
                    // 2.4 修改订单状态
                    if (userRaffleOrderDao.updateOrderStateUsed(orderId) == 0) {
                        status.setRollbackOnly();
                        log.error("抽奖订单状态流转为Used时失败，唯一索引冲突 userId: {} activityId: {} orderID: {}", userId, activityId, orderId);
                    }
                    // 2.4 任务记录入库
                    taskDao.insert(sendAwardTask);

                    return true;
                } catch (DuplicateKeyException e) {
                    // 事务回滚
                    status.setRollbackOnly();
                    log.error("写入中奖记录，唯一索引冲突 userId: {} activityId: {} awardId: {}", userId, activityId, awardId, e);
                    throw new AppException(ResponseCode.INDEX_DUP.getCode(), ResponseCode.INDEX_DUP.getInfo());
                }
            });
        } finally {
            // 3.清空路由
            dbRouter.clear();
        }

        // 4.异步线程池发送mq消息，进行商品发货，并同步获奖记录到ES
        threadPoolExecutor.execute(new Runnable() {
            @Override
            public void run() {
                // 奖品发货消息
                try {
                    eventPublisher.publish(sendAwardTask.getTopic(), sendAwardTask.getMessage());
                    taskDao.updateTaskSendMessageCompleted(sendAwardTask);
                } catch (Exception e) {
                    log.error("写入中奖记录，发送mq消息(商品发货)失败 userId: {}  awardId: {}", userId, awardId, e);
                    taskDao.updateTaskSendMessageFailed(sendAwardTask);
                }
                // 获奖记录同步到ES
                try {
                    eventPublisher.publish(syncRecordTask.getTopic(), syncRecordTask.getMessage());
                    taskDao.updateTaskSendMessageCompleted(syncRecordTask);
                } catch (Exception e) {
                    log.error("写入中奖记录，发送mq消息(数据同步，如ES)失败 userId: {}  awardId: {}", userId, awardId, e);
                    taskDao.updateTaskSendMessageFailed(syncRecordTask);
                }
            }
        });
    }

    @Override
    public List<UserAwardRecordEntity> queryLastestAwardingRecord(Long activityId, int count) throws IOException {
        // 1.查询数据
        List<UserAwardRecordDoc> userAwardRecordDocs = userAwardRecordIndex.queryLastestDocByActivityId(activityId, count);

        // 2.使用hutool工具对用户id脱敏，可以引入缓存+定时任务来优化性能，但是及时性没有直接查询好
        for (UserAwardRecordDoc userAwardRecordDoc : userAwardRecordDocs) {
            // 从第七位开始截取 TODO 这里暂时硬编码了，微信的openid很长，前六位相等，所以截取七位以后的，可以根据系统用户id情况改写这个
            String userid = StrUtil.subSuf(userAwardRecordDoc.getUserId(), 7);
            // 数据脱敏
            userAwardRecordDoc.setUserId(DesensitizedUtil.idCardNum(userid, 5, 5));
        }

        // 3.数据转换
        return userAwardRecordDocs.stream().map(userAwardRecordDoc -> UserAwardRecordEntity.builder()
                .userId(userAwardRecordDoc.getUserId())
                .awardTitle(userAwardRecordDoc.getAwardTitle())
                .awardTime(userAwardRecordDoc.getAwardTime()).build())
                .collect(Collectors.toList());
    }

    @Override
    public PageData<UserAwardRecordEntity> queryUserAwardingRecord(int page, int pageSize, String userId) {
        // 1.计算分页参数
        int current = (page - 1) * pageSize;
        // 2.查询分页数据
        // 开启路由
        dbRouter.doRouter(userId);
        List<UserAwardRecord> userAwardRecords = userAwardRecordDao.pageUserAwardRecord(current, pageSize, userId);
        // 3.查询数据总量
        int total = userAwardRecordDao.queryTotalNumberUserAwardRecord(userId);
        dbRouter.clear();
        if (userAwardRecords.isEmpty()) {
            return PageData.<UserAwardRecordEntity>builder()
                    .total(total)
                    .current(page)
                    .pageSize(pageSize)
                    .data(new ArrayList<>())
                    .build();
        }
        // 4.转为实体对象
        List<UserAwardRecordEntity> userAwardRecordEntities = userAwardRecords.stream().map(record -> UserAwardRecordEntity.builder()
                .awardId(record.getAwardId())
                .awardTitle(record.getAwardTitle())
                .awardImage(record.getAwardImage())
                .awardState(AwardStateVO.valueOf(record.getAwardState()))
                .awardTime(record.getAwardTime())
                .orderId(record.getOrderId()).build()).collect(Collectors.toList());

        // 5.组装对象
        return PageData.<UserAwardRecordEntity>builder()
                .total(total)
                .current(page)
                .pageSize(pageSize)
                .data(userAwardRecordEntities)
                .build();
    }

    @Override
    public void saveUserAwardRecordDoc(UserAwardRecordDocEntity userAwardRecordDocEntity) throws IOException {
        // 1.转换格式
        UserAwardRecordDoc userAwardRecordDoc = new UserAwardRecordDoc();
        userAwardRecordDoc.setUserId(userAwardRecordDocEntity.getUserId());
        userAwardRecordDoc.setActivityId(userAwardRecordDocEntity.getActivityId());
        userAwardRecordDoc.setOrderId(userAwardRecordDocEntity.getOrderId());
        userAwardRecordDoc.setAwardTitle(userAwardRecordDocEntity.getAwardTitle());
        userAwardRecordDoc.setAwardTime(userAwardRecordDocEntity.getAwardTime());

        // 2.保存数据
        userAwardRecordIndex.addUserAwardRecordDoc(userAwardRecordDoc);
    }

    @Override
    public String queryAwardConfig(Integer awardId) {
        return awardDao.queryAwardConfigById(awardId);
    }

    @Override
    public void saveGiveOutPrizesAggregate(GiveOutPrizesAggregate giveOutPrizesAggregate) {
        String userId = giveOutPrizesAggregate.getUserId();
        UserAwardRecordEntity userAwardRecordEntity = giveOutPrizesAggregate.getUserAwardRecordEntity();
        UserCreditAwardEntity userCreditAwardEntity = giveOutPrizesAggregate.getUserCreditAwardEntity();

        // 1.更新中奖记录发奖状态
        UserAwardRecord awardRecordUpdateReq = new UserAwardRecord();
        awardRecordUpdateReq.setUserId(userAwardRecordEntity.getUserId());
        awardRecordUpdateReq.setOrderId(userAwardRecordEntity.getOrderId());
        awardRecordUpdateReq.setAwardState(userAwardRecordEntity.getAwardState().getCode());

        // 2.待添加的积分实体(如果没有积分账户就创建
        UserCreditAccount creditUpdateReq = new UserCreditAccount();
        creditUpdateReq.setAvailableAmount(userCreditAwardEntity.getCreditAmount());
        creditUpdateReq.setTotalAmount(userCreditAwardEntity.getCreditAmount());
        creditUpdateReq.setUserId(userCreditAwardEntity.getUserId());
        creditUpdateReq.setAccountStatus(AccountStatusVO.open.getCode());

        // 3.同一事务下统一路由
        try {
            dbRouter.doRouter(userId);
            transactionTemplate.execute(status -> {
                try {
                    // 尝试更新用户积分账户
                    int row1 = creditAccountDao.updateAddAmount(creditUpdateReq);
                    if(row1 == 0){
                        // row为0说明对应积分账户记录不存在，则插入
                        creditAccountDao.insert(creditUpdateReq);
                    }
                    // 更新中奖记录状态
                    int row2 = userAwardRecordDao.updateRecordCompleteStatus(awardRecordUpdateReq);
                    if(row2 == 0){
                        log.warn("更新中奖记录，发现重复更新，用户id：{}，聚合对象：{}", userId, JSON.toJSONString(giveOutPrizesAggregate));
                        status.setRollbackOnly();
                    }
                } catch (DuplicateKeyException e) {
                    log.error("更新中奖记录，唯一索引冲突，用户id：{}，聚合对象：{}", userId, JSON.toJSONString(giveOutPrizesAggregate));
                    status.setRollbackOnly();
                    throw new AppException(ResponseCode.INDEX_DUP.getCode(), e);
                }

                return 1;
            });
        } finally {
            dbRouter.clear();
        }
    }

    @Override
    public String queryAwardKey(Integer awardId) {
        return awardDao.queryAwardKeyById(awardId);
    }


}
