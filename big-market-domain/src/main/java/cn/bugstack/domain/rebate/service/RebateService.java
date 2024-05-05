package cn.bugstack.domain.rebate.service;

import cn.bugstack.domain.rebate.event.SendRebateMessageEvent;
import cn.bugstack.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import cn.bugstack.domain.rebate.model.entity.BehaviorEntity;
import cn.bugstack.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import cn.bugstack.domain.rebate.model.entity.TaskEntity;
import cn.bugstack.domain.rebate.model.valobj.DailyBehaviorRebateVO;
import cn.bugstack.domain.rebate.model.valobj.TaskStateVO;
import cn.bugstack.domain.rebate.repository.IRebateRepository;
import cn.bugstack.types.common.Constants;
import cn.bugstack.types.event.BaseEvent;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 行为返利服务
 * @create 2024/05/04 15:44:42
 */
@Service
public class RebateService implements IRebateService {

    @Resource
    private IRebateRepository repository;

    @Resource
    private SendRebateMessageEvent sendRebateMessageEvent;

    @Override
    public List<String> createOrder(BehaviorEntity behaviorEntity) {
        // 1.查询返利配置
        List<DailyBehaviorRebateVO> behaviorRebateVOS = repository.queryDailyBehaviorRebateConfig(behaviorEntity.getBehaviorTypeVO());
        if (null == behaviorRebateVOS || behaviorRebateVOS.isEmpty()) return new ArrayList<>();
        // 2.构建聚合对象
        List<String> orderIds = new ArrayList<>();
        List<BehaviorRebateAggregate> behaviorRebateAggregates = new ArrayList<>();
        for (DailyBehaviorRebateVO behaviorRebateVO : behaviorRebateVOS) {
            // 2.1 行为返利订单实体
            String bizId = behaviorEntity.getUserId() + Constants.UNDERLINE + behaviorRebateVO.getRebateType() + Constants.UNDERLINE + behaviorEntity.getOutBusinessNo();
            BehaviorRebateOrderEntity behaviorRebateOrderEntity = BehaviorRebateOrderEntity.builder()
                    .behaviorType(behaviorRebateVO.getBehaviorType())
                    .rebateDesc(behaviorRebateVO.getRebateDesc())
                    .rebateType(behaviorRebateVO.getRebateType())
                    .rebateConfig(behaviorRebateVO.getRebateConfig())
                    .orderId(RandomStringUtils.randomNumeric(12)) //TODO 后面需要改为雪花算法获取唯一ID
                    .bizId(bizId)
                    .userId(behaviorEntity.getUserId())
                    .build();
            orderIds.add(behaviorRebateOrderEntity.getOrderId());

            // 2.2 Mq 消息对象
            SendRebateMessageEvent.RebateMessage rebateMessage = SendRebateMessageEvent.RebateMessage.builder()
                    .userId(behaviorEntity.getUserId())
                    .rebateType(behaviorRebateVO.getRebateType())
                    .rebateConfig(behaviorRebateVO.getRebateConfig())
                    .bizId(bizId)
                    .build();
            BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> rebateMessageEventMessage = sendRebateMessageEvent.buildEventMessage(rebateMessage);

            // 2.3 MQ任务实体
            TaskEntity taskEntity = TaskEntity.builder()
                    .userId(behaviorEntity.getUserId())
                    .topic(sendRebateMessageEvent.topic())
                    .message(rebateMessageEventMessage)
                    .messageId(rebateMessageEventMessage.getId())
                    .state(TaskStateVO.create)
                    .build();
            // 2.4 聚合对象构建
            BehaviorRebateAggregate behaviorRebateAggregate = BehaviorRebateAggregate.builder()
                    .userId(behaviorEntity.getUserId())
                    .behaviorRebateOrderEntity(behaviorRebateOrderEntity)
                    .taskEntity(taskEntity)
                    .build();

            behaviorRebateAggregates.add(behaviorRebateAggregate);
        }

        // 3.保存聚合对象
        repository.saveUserRebateRecord(behaviorEntity.getUserId(), behaviorRebateAggregates);

        return orderIds;
    }
}
