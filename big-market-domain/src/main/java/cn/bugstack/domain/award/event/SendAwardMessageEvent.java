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
 * @description 用户奖品发货事件消息
 * @create 2024/04/13 21:53:00
 */
@Component
public class SendAwardMessageEvent extends BaseEvent<SendAwardMessageEvent.SendAwardMessage> {

    @Value("${spring.rabbitmq.topic.award_send}")
    private String topic;

    @Override
    public EventMessage<SendAwardMessage> buildEventMessage(SendAwardMessage data) {
        return EventMessage.<SendAwardMessage>builder()
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
    public static class SendAwardMessage implements Message{
        /**
         * 订单ID
         */
        private String orderId;
        /**
         * 用户ID
         */
        private String userId;
        /**
         * 奖品ID
         */
        private Integer awardId;
        /**
         * 奖品标题（名称）
         */
        private String awardTitle;
        /**
         * 奖品配置信息
         */
        private String awardConfig;

    }

}
