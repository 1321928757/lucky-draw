package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.award.event.SyncAwardRecordEvent;
import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.model.entity.TaskEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordDocEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.valobj.TaskStateVO;
import cn.bugstack.domain.award.repository.IAwardRepository;
import cn.bugstack.domain.award.service.distribute.IDistributeAward;
import cn.bugstack.types.event.BaseEvent;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.PageData;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * @author Luckysj @刘仕杰
 * @description 奖品服务
 * @create 2024/04/13 21:53:12
 */
@Slf4j
@Service
public class AwardService implements IAwardService{
    @Resource
    private IAwardRepository awardRepository;
    @Resource
    private SendAwardMessageEvent sendAwardMessageEvent;
    @Resource
    private SyncAwardRecordEvent syncAwardRecordEvent;

    private final Map<String, IDistributeAward> distributeAwardMap;

    public AwardService(Map<String, IDistributeAward> distributeAwardMap) {
        this.distributeAwardMap = distributeAwardMap;
    }

    @Override
    public void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity) {
        // 1.构建发货消息对象
        SendAwardMessageEvent.SendAwardMessage sendAwardMessage = new SendAwardMessageEvent.SendAwardMessage();
        sendAwardMessage.setUserId(userAwardRecordEntity.getUserId());
        sendAwardMessage.setAwardId(userAwardRecordEntity.getAwardId());
        sendAwardMessage.setAwardTitle(userAwardRecordEntity.getAwardTitle());
        sendAwardMessage.setUserId(userAwardRecordEntity.getUserId());
        sendAwardMessage.setOrderId(userAwardRecordEntity.getOrderId());
        BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> sendAwardMessageEventMessage = sendAwardMessageEvent.buildEventMessage(sendAwardMessage);

        // 2.构建中奖记录同步消息对象【可以改用Canal同步数据到ES】
        SyncAwardRecordEvent.SyncRecordMessage syncRecordMessage = new SyncAwardRecordEvent.SyncRecordMessage();
        syncRecordMessage.setUserId(userAwardRecordEntity.getUserId());
        syncRecordMessage.setAwardTitle(userAwardRecordEntity.getAwardTitle());
        syncRecordMessage.setAwardTime(userAwardRecordEntity.getAwardTime());
        syncRecordMessage.setOrderId(userAwardRecordEntity.getOrderId());
        syncRecordMessage.setActivityId(userAwardRecordEntity.getActivityId());
        BaseEvent.EventMessage<SyncAwardRecordEvent.SyncRecordMessage> syncRecordMessageEventMessage = syncAwardRecordEvent.buildEventMessage(syncRecordMessage);

        // 3.构建发货消息任务对象
        TaskEntity<SendAwardMessageEvent.SendAwardMessage> sendAwardMessageTaskEntity= new TaskEntity<SendAwardMessageEvent.SendAwardMessage>();
        sendAwardMessageTaskEntity.setTopic(sendAwardMessageEvent.topic());
        sendAwardMessageTaskEntity.setUserId(userAwardRecordEntity.getUserId());
        sendAwardMessageTaskEntity.setMessageId(sendAwardMessageEventMessage.getId());
        sendAwardMessageTaskEntity.setMessage(sendAwardMessageEventMessage);
        sendAwardMessageTaskEntity.setState(TaskStateVO.create);

        // 4.构建同步消息任务对象
        TaskEntity<SyncAwardRecordEvent.SyncRecordMessage> syncRecordMessageTaskEntity = new TaskEntity<SyncAwardRecordEvent.SyncRecordMessage>();
        syncRecordMessageTaskEntity.setTopic(syncAwardRecordEvent.topic());
        syncRecordMessageTaskEntity.setUserId(userAwardRecordEntity.getUserId());
        syncRecordMessageTaskEntity.setMessageId(syncRecordMessageEventMessage.getId());
        syncRecordMessageTaskEntity.setMessage(syncRecordMessageEventMessage);
        syncRecordMessageTaskEntity.setState(TaskStateVO.create);

        // 5.构建中奖记录聚合对象
        UserAwardRecordAggregate userAwardRecordAggregate = new UserAwardRecordAggregate();
        userAwardRecordAggregate.setSendAwardTaskEntity(sendAwardMessageTaskEntity);
        userAwardRecordAggregate.setSyncRecordTaskEntity(syncRecordMessageTaskEntity);
        userAwardRecordAggregate.setUserAwardRecordEntity(userAwardRecordEntity);
        userAwardRecordAggregate.setOrderId(userAwardRecordEntity.getOrderId());

        // 6.中奖记录聚合对象处理(在一个事务下)
        awardRepository.saveUserAwardRecord(userAwardRecordAggregate);
    }

    @Override
    public List<UserAwardRecordEntity> queryLastestAwardingRecord(Long activityId, int count) throws IOException {
        return awardRepository.queryLastestAwardingRecord(activityId, count);
    }

    @Override
    public PageData<UserAwardRecordEntity> queryUserAwardingRecord(int page, int pageSize, String userId) {
        return awardRepository.queryUserAwardingRecord(page,pageSize, userId);
    }

    @Override
    public void saveUserAwardRecordDoc(UserAwardRecordDocEntity userAwardRecordDoc) throws IOException {
        awardRepository.saveUserAwardRecordDoc(userAwardRecordDoc);
    }

    @Override
    public void distributeAward(DistributeAwardEntity distributeAwardEntity) {
        // 1.根据奖品id查询到对应的奖品服务key
        String awardKey = awardRepository.queryAwardKey(distributeAwardEntity.getAwardId());
        if(StringUtils.isEmpty(awardKey)){
            log.error("分发奖品，对应的奖品key不存在，奖品id:{}", distributeAwardEntity.getAwardId());
            return;
        }

        // 2.根据key获取到对应的分发服务
        IDistributeAward distributeAward = distributeAwardMap.get(awardKey);
        if(null == distributeAward){
            log.error("分发奖品，awardKey对应的分发服务不存在，awardKey:{}", awardKey);
            throw new AppException("分发奖品，奖品" + awardKey + "对应的分发服务不存在");
        }

        // 3.分发奖品
        distributeAward.giveOutPrizes(distributeAwardEntity);
    }


}
