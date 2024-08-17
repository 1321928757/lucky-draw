package cn.bugstack.domain.credit.service;

import cn.bugstack.domain.credit.model.entity.TradeEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 积分调度服务接口
 * @create 2024/08/10 14:43:09
 */
public interface ICreditAdjustService {

    /**
     * 创建增加积分额度订单
     * @param tradeEntity 交易实体对象
     * @return 单号
     */
    String createOrder(TradeEntity tradeEntity);

}