package cn.bugstack.domain.award.model.aggregate;

import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.award.event.SyncAwardRecordEvent;
import cn.bugstack.domain.award.model.entity.TaskEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 用户中奖记录聚合对象,一个聚合可以理解为一个事务下的操作数据对象
 * @create 2024/04/13 21:27:14
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAwardRecordAggregate {
    private TaskEntity<SendAwardMessageEvent.SendAwardMessage> sendAwardTaskEntity;
    private TaskEntity<SyncAwardRecordEvent.SyncRecordMessage> syncRecordTaskEntity;
    private UserAwardRecordEntity userAwardRecordEntity;
    private String orderId;

}
