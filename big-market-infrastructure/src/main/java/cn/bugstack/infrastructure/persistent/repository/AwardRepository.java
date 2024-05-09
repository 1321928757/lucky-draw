package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.TaskEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.valobj.AwardStateVO;
import cn.bugstack.domain.award.model.valobj.TaskStateVO;
import cn.bugstack.domain.award.repository.IAwardRepository;
import cn.bugstack.infrastructure.event.EventPublisher;
import cn.bugstack.infrastructure.persistent.dao.ITaskDao;
import cn.bugstack.infrastructure.persistent.dao.IUserAwardRecordDao;
import cn.bugstack.infrastructure.persistent.dao.IUserRaffleOrderDao;
import cn.bugstack.infrastructure.persistent.po.Task;
import cn.bugstack.infrastructure.persistent.po.UserAwardRecord;
import cn.bugstack.infrastructure.persistent.redis.IRedisService;
import cn.bugstack.middleware.db.router.strategy.IDBRouterStrategy;
import cn.bugstack.types.common.Constants;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.PageData;
import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
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
    private ThreadPoolExecutor threadPoolExecutor;

    @Resource
    private EventPublisher eventPublisher;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Resource
    private IDBRouterStrategy dbRouter;

    @Resource
    private IRedisService redisService;


    @Override
    public void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate) {
        // 1.提取数据，转换实体对象为po对象
        UserAwardRecordEntity userAwardRecordEntity = userAwardRecordAggregate.getUserAwardRecordEntity();
        TaskEntity taskEntity = userAwardRecordAggregate.getTaskEntity();
        String userId = userAwardRecordEntity.getUserId();
        Long activityId = userAwardRecordEntity.getActivityId();
        Integer awardId = userAwardRecordEntity.getAwardId();
        String orderId = userAwardRecordAggregate.getOrderId();

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

        Task task = new Task();
        task.setTopic(taskEntity.getTopic());
        task.setMessage(JSON.toJSONString(taskEntity.getMessage()));
        task.setState(taskEntity.getState().getCode());
        task.setMessageId(taskEntity.getMessageId());
        task.setUserId(taskEntity.getUserId());

        // 2.事务操作，保存中奖消息和发货任务(异步线程池)
        try{
            // 2.1 开启数据库路由
            dbRouter.doRouter(userId);
            // 2.2 编程式事务
            transactionTemplate.execute(status -> {
                try {
                    // 2.3 中奖记录入库
                    userAwardRecordDao.insert(userAwardRecord);
                    // 2.4 修改订单状态
                    if(userRaffleOrderDao.updateOrderStateUsed(orderId) == 0){
                        status.setRollbackOnly();
                        log.error("抽奖订单状态流转为Used时失败，唯一索引冲突 userId: {} activityId: {} orderID: {}", userId, activityId, orderId);
                    }
                    // 2.4 任务记录入库
                    taskDao.insert(task);

                    return true;
                } catch (DuplicateKeyException e) {
                    // 事务回滚
                    status.setRollbackOnly();
                    log.error("写入中奖记录，唯一索引冲突 userId: {} activityId: {} awardId: {}", userId, activityId, awardId, e);
                    throw new AppException(ResponseCode.INDEX_DUP.getCode(), ResponseCode.INDEX_DUP.getInfo());
                }
            });
        }finally {
            // 3.清空路由
            dbRouter.clear();
        }
        // 4.异步线程池发送mq消息，更新任务表
        threadPoolExecutor.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    eventPublisher.publish(task.getTopic(), task.getMessage());
                    taskDao.updateTaskSendMessageCompleted(task);
                } catch (Exception e) {
                    log.error("写入中奖记录，发送mq消息失败 userId: {}  awardId: {}", userId, awardId, e);
                    taskDao.updateTaskSendMessageFailed(task);
                }
            }
        });
    }

    @Override
    public List<UserAwardRecordEntity> queryLastestAwardingRecord(Long activityId, int count) {
        return null;
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
        if(userAwardRecords.isEmpty()) {
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
}
