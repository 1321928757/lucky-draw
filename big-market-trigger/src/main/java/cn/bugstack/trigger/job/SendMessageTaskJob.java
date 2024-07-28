package cn.bugstack.trigger.job;

import cn.bugstack.domain.task.model.entity.TaskEntity;
import cn.bugstack.domain.task.service.ITaskService;
import cn.bugstack.middleware.db.router.strategy.IDBRouterStrategy;
import com.xxl.job.core.handler.annotation.XxlJob;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

/**
 * @author Luckysj @刘仕杰
 * @description 补偿任务 - mq发送消息
 * @create 2024/04/14 20:43:14
 */
// @Slf4j
// @Component
// public class SendMessageTaskJob {
//     @Resource
//     private ThreadPoolExecutor executor;
//     @Resource
//     private IDBRouterStrategy dbRouter;
//     @Resource
//     private ITaskService taskService;
//
//     // 五秒执行一次扫库
//     @XxlJob("sendMessageTaskJobHandler")
//     public void doJob() {
//         log.info("定时任务-开始执行MQ消息补偿");
//         // 1.获取分库数量
//         int dbCount = dbRouter.dbCount();
//
//         // 2.扫描每一个库的任务表(分库索引从1开始，而不是0)
//         for (int dbIdx = 1; dbIdx <= dbCount; dbIdx++) {
//             int finalI = dbIdx;
//             executor.execute(() -> {
//                 try {
//                     dbRouter.setDBKey(finalI);
//                     dbRouter.setTBKey(0); //设置0代表不分表，我们任务表并没有分表
//
//                     List<TaskEntity> taskEntities = taskService.queryNoSendMessageTaskList();
//                     if(taskEntities.isEmpty()) return;
//
//                     // 3.通过异步线程池发送消息
//                     taskEntities.forEach(taskEntity -> {
//                         executor.execute(() ->{
//                             try {
//                                 log.error("定时任务，尝试重新发送 失败的MQ任务 userId: {} topic: {}", taskEntity.getUserId(), taskEntity.getTopic());
//                                 taskService.sendMessage(taskEntity);
//                                 taskService.updateTaskSendMessageCompleted(taskEntity.getUserId(), taskEntity.getMessageId());
//                             } catch (Exception e) {
//                                 log.error("定时任务，发送MQ消息失败 userId: {} topic: {}", taskEntity.getUserId(), taskEntity.getTopic());
//                                 taskService.updateTaskSendMessageFail(taskEntity.getUserId(), taskEntity.getMessageId());
//                             }
//                         });
//                     });
//                 } finally {
//                     dbRouter.clear();
//                 }
//             });
//         }
//
//         log.info("定时任务-MQ消息补偿结束");
//     }
//
// }

@Slf4j
@Component
public class SendMessageTaskJob {

    @Resource
    private ThreadPoolExecutor executor;
    @Resource
    private IDBRouterStrategy dbRouter;

    @Resource
    private ITaskService taskService;
    // 五秒执行一次扫库
    @Scheduled(cron = "0/5 * * * * ?")
    public void exec(){
        // 1.获取分库数量
        int dbCount = dbRouter.dbCount();

        // 2.扫描每一个库的任务表(分库索引从1开始，而不是0)
        for (int dbIdx = 1; dbIdx <= dbCount; dbIdx++) {
            int finalI = dbIdx;
            executor.execute(() -> {
                try {
                    dbRouter.setDBKey(finalI);
                    dbRouter.setTBKey(0); //设置0代表不分表，我们任务表并没有分表

                    List<TaskEntity> taskEntities = taskService.queryNoSendMessageTaskList();
                    if(taskEntities.isEmpty()) return;

                    // 3.通过异步线程池发送消息
                    taskEntities.forEach(taskEntity -> {
                        executor.execute(() ->{
                            try {
                                log.error("定时任务，尝试重新发送 失败的MQ任务 userId: {} topic: {}", taskEntity.getUserId(), taskEntity.getTopic());
                                taskService.sendMessage(taskEntity);
                                taskService.updateTaskSendMessageCompleted(taskEntity.getUserId(), taskEntity.getMessageId());
                            } catch (Exception e) {
                                log.error("定时任务，发送MQ消息失败 userId: {} topic: {}", taskEntity.getUserId(), taskEntity.getTopic());
                                taskService.updateTaskSendMessageFail(taskEntity.getUserId(), taskEntity.getMessageId());
                            }
                        });
                    });
                } finally {
                    dbRouter.clear();
                }
            });
        }
    }
}
