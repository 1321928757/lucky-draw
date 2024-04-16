package cn.bugstack.domain.task.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 任务实体对象,这里充血模型的概念就体现出来了，task子领域和award子领域都用到了TaskEntity，
 * 但是他们的职责不同，使用的也不是一个TaskEntity，防腐处理
 * @create 2024/04/14 20:47:36
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TaskEntity {

    /** 活动ID */
    private String userId;
    /** 消息主题 */
    private String topic;
    /** 消息编号 */
    private String messageId;
    /** 消息主体 */
    private String message;

}
