package cn.bugstack.trigger.listener;

import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;
import cn.bugstack.types.event.BaseEvent;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * @author Luckysj @刘仕杰
 * @description 中奖发货消息监听
 * @create 2024/04/14 21:12:50
 */
@Slf4j
@Component
public class SendAwardCustomer {
    @Value("${spring.rabbitmq.topic.award_send}")
    private String topic;

    // ackMode指定为手动提交模式
    @RabbitListener(queuesToDeclare = @Queue("${spring.rabbitmq.topic.award_send}"), ackMode="MANUAL")
    public void sendAwardHandler(String json , Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("监听中奖发货消息，topic: {} message: {}", topic, json);
            // 1.转换消息
            BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> eventMessage = JSON.parseObject(json, new TypeReference<BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage>>() {
            }.getType());
            SendAwardMessageEvent.SendAwardMessage sendAwardMessage = eventMessage.getData();

            // 2.消费消息 TODO

            // 3.手动ACK
            channel.basicAck(deliveryTag, false);
            log.info("中奖发货消息消费完成，奖品ID：{},用户ID：{}",sendAwardMessage.getAwardId(),sendAwardMessage.getUserId());
        } catch (IOException e) {
            try {
                // 处理失败,重新压入MQ
                channel.basicRecover();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
