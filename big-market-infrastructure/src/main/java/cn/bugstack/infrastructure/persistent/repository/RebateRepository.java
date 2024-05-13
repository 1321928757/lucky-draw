package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import cn.bugstack.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import cn.bugstack.domain.rebate.model.entity.TaskEntity;
import cn.bugstack.domain.rebate.model.valobj.BehaviorTypeVO;
import cn.bugstack.domain.rebate.model.valobj.DailyBehaviorRebateVO;
import cn.bugstack.domain.rebate.repository.IRebateRepository;
import cn.bugstack.infrastructure.event.EventPublisher;
import cn.bugstack.infrastructure.persistent.dao.mysql.IDailyBehaviorRebateDao;
import cn.bugstack.infrastructure.persistent.dao.mysql.ITaskDao;
import cn.bugstack.infrastructure.persistent.dao.mysql.IUserBehaviorRebateOrderDao;
import cn.bugstack.infrastructure.persistent.po.DailyBehaviorRebate;
import cn.bugstack.infrastructure.persistent.po.Task;
import cn.bugstack.infrastructure.persistent.po.UserBehaviorRebateOrder;
import cn.bugstack.middleware.db.router.strategy.IDBRouterStrategy;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.stream.Collectors;

/**
 * @author Luckysj @刘仕杰
 * @description 返利仓储服务
 * @create 2024/05/04 16:41:22
 */
@Slf4j
@Repository
public class RebateRepository implements IRebateRepository {
    @Resource
    private IDailyBehaviorRebateDao dailyBehaviorRebateDao;
    @Resource
    private IDBRouterStrategy dbRouter;
    @Resource
    private TransactionTemplate transactionTemplate;
    @Resource
    private IUserBehaviorRebateOrderDao userBehaviorRebateOrderDao;
    @Resource
    private ITaskDao taskDao;
    @Resource
    private ThreadPoolExecutor threadPoolExecutor;
    @Resource
    private EventPublisher eventPublisher;

    @Override
    public List<DailyBehaviorRebateVO> queryDailyBehaviorRebateConfig(BehaviorTypeVO behaviorTypeVO) {
        // 1.查询数据
        List<DailyBehaviorRebate> dailyBehaviorRebates = dailyBehaviorRebateDao.queryDailyBehaviorRebateByBehaviorType(behaviorTypeVO.getCode());
        if(dailyBehaviorRebates == null) return null;
        // 2.转换为值对象返回
        return dailyBehaviorRebates.stream().map(entity -> DailyBehaviorRebateVO.builder()
                .behaviorType(entity.getBehaviorType())
                .rebateConfig(entity.getRebateConfig())
                .rebateType(entity.getRebateType())
                .rebateDesc(entity.getRebateDesc())
                .build()).collect(Collectors.toList());
    }

    @Override
    public void saveUserRebateRecord(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates) {
        try {
            // 1.开启库表路由
            dbRouter.doRouter(userId);
            transactionTemplate.execute(status -> {
                try {
                    for (BehaviorRebateAggregate behaviorRebateAggregate : behaviorRebateAggregates) {
                        // 2.保存用户行为返利订单
                        BehaviorRebateOrderEntity behaviorRebateOrderEntity = behaviorRebateAggregate.getBehaviorRebateOrderEntity();
                        UserBehaviorRebateOrder userBehaviorRebateOrder = new UserBehaviorRebateOrder();
                        userBehaviorRebateOrder.setUserId(behaviorRebateOrderEntity.getUserId());
                        userBehaviorRebateOrder.setOrderId(behaviorRebateOrderEntity.getOrderId());
                        userBehaviorRebateOrder.setBehaviorType(behaviorRebateOrderEntity.getBehaviorType());
                        userBehaviorRebateOrder.setRebateDesc(behaviorRebateOrderEntity.getRebateDesc());
                        userBehaviorRebateOrder.setRebateType(behaviorRebateOrderEntity.getRebateType());
                        userBehaviorRebateOrder.setRebateConfig(behaviorRebateOrderEntity.getRebateConfig());
                        userBehaviorRebateOrder.setOutBusinessNo(behaviorRebateOrderEntity.getOutBusinessNo());
                        userBehaviorRebateOrder.setBizId(behaviorRebateOrderEntity.getBizId());
                        userBehaviorRebateOrderDao.insert(userBehaviorRebateOrder);

                        // 3.保存Mq消息任务
                        TaskEntity taskEntity = behaviorRebateAggregate.getTaskEntity();
                        Task task = new Task();
                        task.setUserId(taskEntity.getUserId());
                        task.setTopic(taskEntity.getTopic());
                        task.setMessage(JSON.toJSONString(taskEntity.getMessage()));
                        task.setMessageId(taskEntity.getMessageId());
                        task.setState(taskEntity.getState().getCode());
                        taskDao.insert(task);

                    }

                    return 1;
                } catch (DuplicateKeyException e) {
                    status.setRollbackOnly();
                    log.error("写入返利记录，唯一索引冲突 userId: {}", userId, e);
                    throw new AppException(ResponseCode.INDEX_DUP.getCode(), e);
                }
            });
        } finally {
            dbRouter.clear();
        }

        // 4.异步发送Mq消息进行返利操作
        // threadPoolExecutor.execute(() -> {
        //     for (BehaviorRebateAggregate behaviorRebateAggregate : behaviorRebateAggregates) {
        //         TaskEntity taskEntity = behaviorRebateAggregate.getTaskEntity();
        //         Task task = new Task();
        //         task.setUserId(taskEntity.getUserId());
        //         task.setMessageId(taskEntity.getMessageId());
        //         try {
        //             // 发送消息【在事务外执行，如果失败还有任务补偿】
        //             eventPublisher.publish(taskEntity.getTopic(), taskEntity.getMessage());
        //             // 更新数据库记录，task 任务表
        //             taskDao.updateTaskSendMessageCompleted(task);
        //         } catch (Exception e) {
        //             log.error("写入返利记录，发送MQ消息失败 userId: {} topic: {}", userId, task.getTopic());
        //             taskDao.updateTaskSendMessageFailed(task);
        //         }
        //     }
        // });
        for (BehaviorRebateAggregate behaviorRebateAggregate : behaviorRebateAggregates) {
            TaskEntity taskEntity = behaviorRebateAggregate.getTaskEntity();
            Task task = new Task();
            task.setUserId(taskEntity.getUserId());
            task.setMessageId(taskEntity.getMessageId());
            try {
                // 发送消息【在事务外执行，如果失败还有任务补偿】
                eventPublisher.publish(taskEntity.getTopic(), taskEntity.getMessage());
                // 更新数据库记录，task 任务表
                taskDao.updateTaskSendMessageCompleted(task);
            } catch (Exception e) {
                log.error("写入返利记录，发送MQ消息失败 userId: {} topic: {}", userId, task.getTopic());
                taskDao.updateTaskSendMessageFailed(task);
            }
        }
    }

    @Override
    public List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo) {
        // 1.构建查询对象
        UserBehaviorRebateOrder rebateOrderReq = new UserBehaviorRebateOrder();
        rebateOrderReq.setUserId(userId);
        rebateOrderReq.setOutBusinessNo(outBusinessNo);

        // 2.查询订单
        List<UserBehaviorRebateOrder> userBehaviorRebateOrders = userBehaviorRebateOrderDao.queryOrderByOutBusinessNo(rebateOrderReq);
        if(userBehaviorRebateOrders == null) return new ArrayList<>();

        // 3.转为实体对象返回
        return userBehaviorRebateOrders.stream().map((rebateOrder) -> BehaviorRebateOrderEntity.builder()
                .userId(rebateOrder.getUserId())
                .orderId(rebateOrder.getOrderId())
                .bizId(rebateOrder.getBizId())
                .rebateType(rebateOrder.getRebateType())
                .rebateDesc(rebateOrder.getRebateDesc())
                .rebateConfig(rebateOrder.getRebateConfig())
                .behaviorType(rebateOrder.getBehaviorType())
                .build()).collect(Collectors.toList());
    }
}
