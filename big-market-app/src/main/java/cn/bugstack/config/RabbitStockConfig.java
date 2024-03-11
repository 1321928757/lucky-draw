package cn.bugstack.config;

import cn.bugstack.types.common.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author www.luckysj.top 刘仕杰
 * @description 库存更新mq配置
 * @create 2024/03/05 11:34:08
 */
@Configuration
@Slf4j
public class RabbitStockConfig {

    // 声明交换机
    @Bean
    public DirectExchange delayExchange() {
        // 对于普通交换机，不需要特殊的参数
        return new DirectExchange(Constants.MessageQueueKey.StockUpdateExchange);
    }
    // 声明队列
    @Bean
    public Queue delayQueue() {
        // 普通队列的声明不需要特殊参数
        return new Queue(Constants.MessageQueueKey.StockUpdateQueue, true);
    }
    // 声明路由，绑定交换机和队列
    @Bean
    public Binding delayBinding(Queue delayQueue, DirectExchange delayExchange) {
        // 使用普通交换机时，绑定不需要特殊参数
        return BindingBuilder.bind(delayQueue).to(delayExchange).with(Constants.MessageQueueKey.StockUpdateKey);
    }

}