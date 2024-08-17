package cn.bugstack.trigger.listener;

import cn.bugstack.domain.activity.model.entity.SkuRechargeEntity;
import cn.bugstack.domain.activity.service.IRaffleActivityAccountQuotaService;
import cn.bugstack.domain.award.event.SendAwardMessageEvent;
import cn.bugstack.domain.credit.model.entity.TradeEntity;
import cn.bugstack.domain.credit.model.valobj.TradeNameVO;
import cn.bugstack.domain.credit.model.valobj.TradeTypeVO;
import cn.bugstack.domain.credit.service.ICreditAdjustService;
import cn.bugstack.domain.rebate.event.SendRebateMessageEvent;
import cn.bugstack.domain.rebate.model.valobj.RebateTypeVO;
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
import java.math.BigDecimal;

/**
 * @author Luckysj @刘仕杰
 * @description 用户返利行为消息监听
 * @create 2024/05/04 18:36:48
 */
@Slf4j
@Component
public class UserRebateBeviorCustomer {
    @Value("${spring.rabbitmq.topic.rebate_send}")
    private String topic;
    @Resource
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;

    @Resource
    private ICreditAdjustService creditAdjustService;

    // ackMode指定为手动提交模式
    @RabbitListener(queuesToDeclare = @Queue("${spring.rabbitmq.topic.rebate_send}"), ackMode = "MANUAL")
    public void sendRebateHandler(String json, Message message, Channel channel) throws IOException {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("监听用户返利行为消息，topic: {} message: {}", topic, json);
            // 1.转换消息
            BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage> eventMessage = JSON.parseObject(json, new TypeReference<BaseEvent.EventMessage<SendRebateMessageEvent.RebateMessage>>() {
            }.getType());
            SendRebateMessageEvent.RebateMessage rebateMessage = eventMessage.getData();

            // 2. 入账奖励
            switch (rebateMessage.getRebateType()) {
                case "sku":
                    SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
                    skuRechargeEntity.setUserId(rebateMessage.getUserId());
                    skuRechargeEntity.setSku(Long.valueOf(rebateMessage.getRebateConfig()));
                    skuRechargeEntity.setOutBusinessNo(rebateMessage.getBizId());
                    raffleActivityAccountQuotaService.createOrder(skuRechargeEntity);
                    break;
                case "integral":
                    TradeEntity tradeEntity = new TradeEntity();
                    tradeEntity.setUserId(rebateMessage.getUserId());
                    tradeEntity.setTradeName(TradeNameVO.REBATE);
                    tradeEntity.setTradeType(TradeTypeVO.FORWARD);
                    tradeEntity.setAmount(new BigDecimal(rebateMessage.getRebateConfig()));
                    tradeEntity.setOutBusinessNo(rebateMessage.getBizId());
                    creditAdjustService.createOrder(tradeEntity);
                    break;
            }
            // 3.手动ACK
            channel.basicAck(deliveryTag, false);
            log.info("用户返利行为消息消费完成，返利业务id：{}，返利类型：{},用户ID：{}", rebateMessage.getBizId(), rebateMessage.getRebateType(), rebateMessage.getUserId());
        } catch (Exception e)  {
            log.info("监听用户返利行为消息消费失败 唯一索引异常，topic：{}，message：{}", topic, message);
            try {
                //唯一索引异常，代表重复消费，直接ACK即可
                channel.basicAck(deliveryTag, false);
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
