package cn.bugstack.trigger.mq;

import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;
import cn.bugstack.domain.strategy.service.IRaffleStock;
import com.alibaba.fastjson2.JSON;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;

/**
 * @author Luckysj @刘仕杰
 * @description 库存更新mq消费者
 * @create 2024/03/11 20:43:39
 */
@Slf4j
@Component
public class StockUpdateMqListener {
    @Resource
    private IRaffleStock raffleStock;

    // ackMode指定为手动提交模式
    @RabbitListener(queuesToDeclare = @Queue("bigmarket.stock.update.queue"), ackMode="MANUAL")
    public void stockUpdateHandler(String json , Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("库存更新消息开始消费，接收消息：{}", json.toString());
            // 消费消息
            StrategyAwardStockKeyVO stockKeyVO = JSON.parseObject(json, StrategyAwardStockKeyVO.class);
            raffleStock.updateStrategyAwardStock(stockKeyVO.getStrategyId(), stockKeyVO.getAwardId());

            // 通知 MQ 消息已被成功消费,可以ACK了
            channel.basicAck(deliveryTag, false);
            log.info("库存更新消息消费完成，策略ID：{},奖品ID：{}",stockKeyVO.getStrategyId(),stockKeyVO.getAwardId());
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