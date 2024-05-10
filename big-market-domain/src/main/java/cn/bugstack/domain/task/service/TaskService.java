package cn.bugstack.domain.task.service;

import cn.bugstack.domain.task.model.entity.TaskEntity;
import cn.bugstack.domain.task.repository.ITaskRepository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 任务服务
 * @create 2024/04/14 20:46:42
 */
@Service
public class TaskService implements ITaskService{
    @Resource
    private ITaskRepository taskRepository;
    @Override
    public List<TaskEntity> queryNoSendMessageTaskList() {
        return taskRepository.queryNoSendMessageTaskList();
    }

    @Override
    public void sendMessage(TaskEntity taskEntity) {

    }

    @Override
    public void updateTaskSendMessageCompleted(String userId, String messageId) {

    }

    @Override
    public void updateTaskSendMessageFail(String userId, String messageId) {

    }
}
