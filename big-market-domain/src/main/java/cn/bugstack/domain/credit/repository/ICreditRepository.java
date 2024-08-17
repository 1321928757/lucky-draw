package cn.bugstack.domain.credit.repository;

import cn.bugstack.domain.credit.model.aggregate.TradeAggregate;

/**
 * @author Luckysj @刘仕杰
 * @description 积分仓储服务
 * @create 2024/08/10 14:48:15
 */
public interface ICreditRepository {
    /**
    * @description 保存积分订单交易信息
    * @param tradeAggregate 交易聚合对象
    * @return
    * @date 2024/08/10 15:03:40
    */
    void saveUserCreditTradeOrder(TradeAggregate tradeAggregate);
}
