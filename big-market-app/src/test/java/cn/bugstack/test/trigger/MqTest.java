package cn.bugstack.test.trigger;

import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.concurrent.CountDownLatch;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class MqTest {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    // 发送mq消息测试
    @Test
    public void test_mq() throws InterruptedException {
        // 发送消息
        rabbitTemplate.convertAndSend("bigmarket.stock.exchange", "bigmarket.stock.key", "基本消息");
        // 等待
        // new CountDownLatch(1).await();
    }

    // 发送延时消息测试
    @Test
    public void test_delay() throws InterruptedException {
        // 发送消息
        rabbitTemplate.convertAndSend("market.direct.delay", "基本消息", message -> {
            message.getMessageProperties().setDelay(15000);
            return message;
        });
        // 等待
        // new CountDownLatch(1).await();
    }

    // 发送延时消息测试
    @Test
    public void test_delay2(){

        rabbitTemplate.convertAndSend("delay_exchange",
                "delay_key",
                "123123",
                message -> {
                    message.getMessageProperties().setHeader("x-delay", 15000);
                    return message;
                }
        );
    }

}
