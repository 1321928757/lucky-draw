package cn.bugstack.domain.award.event;

import cn.bugstack.types.event.BaseEvent;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 用户中奖记录同步事件消息
 * @create 2024/05/13 16:10:54
 */
@Component
public class SyncAwardRecordEvent extends BaseEvent<SyncAwardRecordEvent.SyncRecordMessage>{
    @Value("${spring.rabbitmq.topic.record_sync}")
    private String topic;

    @Override
    public BaseEvent.EventMessage<SyncAwardRecordEvent.SyncRecordMessage> buildEventMessage(SyncAwardRecordEvent.SyncRecordMessage data) {
        return BaseEvent.EventMessage.<SyncAwardRecordEvent.SyncRecordMessage>builder()
                .id(RandomStringUtils.randomNumeric(11))
                .timestamp(new Date())
                .data(data)
                .build();
    }

    @Override
    public String topic() {
        return topic;
    }

    @Data
    @Builder
    @AllArgsConstructor
    @NoArgsConstructor
    public static class SyncRecordMessage implements Message{
        /**
         * 用户ID
         */
        private String userId;
        /**
         * 活动ID
         */
        private Long activityId;
        /**
         * 订单ID
         */
        private String orderId;
        /**
         * 奖品名称
         */
        private String awardTitle;

        /**
         * 中奖时间
         */
        private Date awardTime;

    }
}
