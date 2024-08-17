package cn.bugstack.trigger.listener;

import cn.bugstack.domain.activity.service.IRaffleActivitySkuStockService;
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

import javax.annotation.Resource;
import java.io.IOException;

/**
 * @author Luckysj @刘仕杰
 * @description 活动sku库存耗尽消息监听
 * @create 2024/03/31 20:42:51
 */
@Slf4j
@Component
public class ActivitySkuStockZeroCustomer {
    @Value("${spring.rabbitmq.topic.activity_sku_stock_zero}")
    private String topic;

    @Resource
    private IRaffleActivitySkuStockService skuStock;

    // ackMode指定为手动提交模式
    @RabbitListener(queuesToDeclare = @Queue("${spring.rabbitmq.topic.activity_sku_stock_zero}"), ackMode = "MANUAL")
    public void stockUpdateHandler(String json, Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("监听活动sku库存消耗为0消息，topic: {} message: {}", topic, json);
            // 1.转换格式
            BaseEvent.EventMessage<Long> eventMessage = JSON.parseObject(json, new TypeReference<BaseEvent.EventMessage<Long>>() {
            }.getType());
            Long sku = eventMessage.getData();

            // 2.消费消息
            skuStock.clearQueue();               //清空队列 「此时就不需要延迟更新数据库记录了」
            skuStock.clearActivitySkuStock(sku); //清空数据库中的库存

            // 3.手动ACK确认
            channel.basicAck(deliveryTag, false);

            log.info("监听活动sku库存消耗为0消息，消费完成，topic: {} message: {}", topic, json);
        } catch (Exception e) {
            log.error("监听活动sku库存消耗为0消息，消费失败 topic: {} message: {}", topic, json);
            try {
                //唯一索引异常，代表重复消费，直接ACK即可
                channel.basicAck(deliveryTag, false);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
