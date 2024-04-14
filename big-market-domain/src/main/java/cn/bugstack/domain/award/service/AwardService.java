package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.TaskEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.valobj.TaskStateVO;
import cn.bugstack.domain.award.repository.IAwardRepository;
import cn.bugstack.types.event.BaseEvent;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 奖品服务
 * @create 2024/04/13 21:53:12
 */
@Service
public class AwardService implements IAwardService{
    @Resource
    private IAwardRepository awardRepository;
    @Resource
    private SendAwardMessageEvent sendAwardMessageEvent;
    @Override
    public void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity) {
        // 1.构建消息对象
        SendAwardMessageEvent.SendAwardMessage sendAwardMessage = new SendAwardMessageEvent.SendAwardMessage();
        sendAwardMessage.setUserId(userAwardRecordEntity.getUserId());
        sendAwardMessage.setAwardId(userAwardRecordEntity.getAwardId());
        sendAwardMessage.setAwardTitle(userAwardRecordEntity.getAwardTitle());
        BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> sendAwardMessageEventMessage = sendAwardMessageEvent.buildEventMessage(sendAwardMessage);

        // 2.构建任务对象
        TaskEntity taskEntity = new TaskEntity();
        taskEntity.setTopic(sendAwardMessageEvent.topic());
        taskEntity.setUserId(userAwardRecordEntity.getUserId());
        taskEntity.setMessageId(sendAwardMessageEventMessage.getId());
        taskEntity.setMessage(sendAwardMessageEventMessage);
        taskEntity.setState(TaskStateVO.create);

        // 3.构建中奖记录聚合对象
        UserAwardRecordAggregate userAwardRecordAggregate = new UserAwardRecordAggregate();
        userAwardRecordAggregate.setTaskEntity(taskEntity);
        userAwardRecordAggregate.setUserAwardRecordEntity(userAwardRecordEntity);

        // 4.中奖记录聚合对象处理(在一个事务下)
        awardRepository.saveUserAwardRecord(userAwardRecordAggregate);
    }
}
