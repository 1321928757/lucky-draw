package cn.bugstack.domain.task.service;

import cn.bugstack.domain.task.model.entity.TaskEntity;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 任务服务接口
 * @create 2024/04/14 20:46:20
 */
public interface ITaskService {
    /**
     * 查询发送MQ失败和超时1分钟未发送的MQ

     * @return 未发送的任务消息列表10条
     */
    List<TaskEntity> queryNoSendMessageTaskList();

    /**
     * 发送消息
     */
    void sendMessage(TaskEntity taskEntity);

    /**
     * 更新任务状态为完成
     */
    void updateTaskSendMessageCompleted(String userId, String messageId);

    /**
     * 更新任务状态为失败
     */
    void updateTaskSendMessageFail(String userId, String messageId);
}
