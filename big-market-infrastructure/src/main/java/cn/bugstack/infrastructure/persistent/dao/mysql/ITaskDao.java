package cn.bugstack.infrastructure.persistent.dao.mysql;

import cn.bugstack.infrastructure.persistent.po.Task;
import cn.bugstack.middleware.db.router.annotation.DBRouter;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description mq任务表Dao
 * @create 2024/04/07 09:24:43
 */
@Mapper
public interface ITaskDao {
    // 保存任务
    void insert(Task task);
    // 更新任务状态
    @DBRouter
    void updateTaskSendMessageCompleted(Task task);

    @DBRouter
    void updateTaskSendMessageFailed(Task task);

    // 查询发送失败的任务(失败六秒以上的任务)
    List<Task> queryNoSendMessageTaskList();
}
