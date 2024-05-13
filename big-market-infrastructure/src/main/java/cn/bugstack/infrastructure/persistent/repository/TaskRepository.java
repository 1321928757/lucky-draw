package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.task.model.entity.TaskEntity;
import cn.bugstack.domain.task.repository.ITaskRepository;
import cn.bugstack.infrastructure.event.EventPublisher;
import cn.bugstack.infrastructure.persistent.dao.mysql.ITaskDao;
import cn.bugstack.infrastructure.persistent.po.Task;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class TaskRepository implements ITaskRepository {
    @Resource
    private ITaskDao taskDao;
    @Resource
    private EventPublisher eventPublisher;
    @Override
    public List<TaskEntity> queryNoSendMessageTaskList() {
        // 1.查询数据
        List<Task> tasks = taskDao.queryNoSendMessageTaskList();

        // 2.转换为实体对象
        return tasks.stream().map(task -> TaskEntity.builder()
                .message(task.getMessage())
                .topic(task.getTopic())
                .userId(task.getUserId())
                .messageId(task.getMessageId())
                .build()).collect(Collectors.toList());
    }
}
