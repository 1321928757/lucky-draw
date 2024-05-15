package cn.bugstack.trigger.listener;

import cn.bugstack.domain.activity.model.entity.SkuRechargeEntity;
import cn.bugstack.domain.activity.service.IRaffleActivityAccountQuotaService;
import cn.bugstack.domain.award.event.SyncAwardRecordEvent;
import cn.bugstack.domain.award.model.entity.UserAwardRecordDocEntity;
import cn.bugstack.domain.award.service.IAwardService;
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

/**
 * @author Luckysj @刘仕杰
 * @description 同步获奖记录数据【ES】消息监听
 * @create 2024/05/04 18:36:48
 */
@Slf4j
@Component
public class SyncAwardRecordDocCustomer {
    @Value("${spring.rabbitmq.topic.record_sync}")
    private String topic;
    @Resource
    private IAwardService awardService;

    // ackMode指定为手动提交模式
    @RabbitListener(queuesToDeclare = @Queue("${spring.rabbitmq.topic.record_sync}"), ackMode = "MANUAL")
    public void sendRebateHandler(String json, Message message, Channel channel) {
        //  如果手动ACK,消息会被监听消费,但是消息在队列中依旧存在,如果 未配置 acknowledge-mode 默认是会在消费完毕后自动ACK掉
        final long deliveryTag = message.getMessageProperties().getDeliveryTag();
        try {
            log.info("监听中奖记录数据同步消息，topic: {} message: {}", topic, json);
            // 1.转换消息
            BaseEvent.EventMessage<SyncAwardRecordEvent.SyncRecordMessage> eventMessage = JSON.parseObject(json, new TypeReference<BaseEvent.EventMessage<SyncAwardRecordEvent.SyncRecordMessage>>() {
            }.getType());
            SyncAwardRecordEvent.SyncRecordMessage syncRecordMessage = eventMessage.getData();

            // 2.消费消息
            UserAwardRecordDocEntity userAwardRecordDoc = new UserAwardRecordDocEntity();
            userAwardRecordDoc.setUserId(syncRecordMessage.getUserId());
            userAwardRecordDoc.setActivityId(syncRecordMessage.getActivityId());
            userAwardRecordDoc.setOrderId(syncRecordMessage.getOrderId());
            userAwardRecordDoc.setAwardTitle(syncRecordMessage.getAwardTitle());
            userAwardRecordDoc.setAwardTime(syncRecordMessage.getAwardTime());

            awardService.saveUserAwardRecordDoc(userAwardRecordDoc);

            // 3.手动ACK
            channel.basicAck(deliveryTag, false);
            log.info("监听中奖记录数据同步消息消费完成，订单id：{}，用户id：{}, 活动id：{}", syncRecordMessage.getOrderId(), syncRecordMessage.getUserId(), syncRecordMessage.getActivityId());
        } catch (DuplicateKeyException e) {
            log.info("监听中奖记录数据同步消息消费失败 唯一索引异常，topic：{}，message：{}", topic, message);
            try {
                //唯一索引异常，代表重复消费，直接ACK即可
                channel.basicAck(deliveryTag, false);
            } catch (IOException e1) {
                e1.printStackTrace();
            }

        } catch (Exception e) {
            log.info("监听中奖记录数据同步消息消费失败，topic：{}，message：{}", topic, message);
            try {
                // 处理失败,重新压入MQ
                channel.basicRecover();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
        }
    }
}
