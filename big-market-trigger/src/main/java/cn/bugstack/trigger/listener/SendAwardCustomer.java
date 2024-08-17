package cn.bugstack.trigger.listener;

import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.service.IAwardService;
import cn.bugstack.domain.award.service.distribute.IDistributeAward;
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
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
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

    @Resource
    private IAwardService awardService;

    // ackMode指定为手动提交模式
    @RabbitListener(queuesToDeclare = @Queue("${spring.rabbitmq.topic.award_send}"), ackMode="MANUAL")
    public void sendAwardHandler(String json , Message message, Channel channel) throws IOException {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("监听中奖发货消息，topic: {} message: {}", topic, json);
            // 1.转换消息
            BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage> eventMessage = JSON.parseObject(json, new TypeReference<BaseEvent.EventMessage<SendAwardMessageEvent.SendAwardMessage>>() {
            }.getType());
            SendAwardMessageEvent.SendAwardMessage sendAwardMessage = eventMessage.getData();

            // 2.发放奖品
            DistributeAwardEntity distributeAwardEntity = new DistributeAwardEntity();
            distributeAwardEntity.setUserId(sendAwardMessage.getUserId());
            distributeAwardEntity.setOrderId(sendAwardMessage.getOrderId());
            distributeAwardEntity.setAwardId(sendAwardMessage.getAwardId());
            distributeAwardEntity.setAwardConfig(sendAwardMessage.getAwardConfig());
            awardService.distributeAward(distributeAwardEntity);

            // 3.手动ACK
            channel.basicAck(deliveryTag, false);
            log.info("中奖发货消息消费完成，奖品ID：{},用户ID：{}",sendAwardMessage.getAwardId(),sendAwardMessage.getUserId());
        } catch (Exception e)  {
            log.info("监听中奖发货消息消费失败 发生异常，topic：{}，message：{}，exception：{}", topic, message, e);
            try {
                //唯一索引异常，代表重复消费，直接ACK即可
                channel.basicAck(deliveryTag, false);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
