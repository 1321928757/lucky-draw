package cn.bugstack.domain.task.repository;

import cn.bugstack.domain.task.model.entity.TaskEntity;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 任务仓储服务
 * @create 2024/04/26 21:33:56
 */
public interface ITaskRepository {
    /**
    * @description 查询未未执行成功的任务列表
    * @param
    * @return 任务数组
    * @date 2024/04/26 21:34:35
    */
    List<TaskEntity> queryNoSendMessageTaskList();
}
