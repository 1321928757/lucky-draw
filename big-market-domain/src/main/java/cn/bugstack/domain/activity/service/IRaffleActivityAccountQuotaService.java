package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.entity.SkuRechargeEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动获取额度接口
 * @create 2024/03/17 10:55:12
 */
public interface IRaffleActivityAccountQuotaService {

    /**
     * 以sku创建抽奖活动订单，获得参与抽奖资格（可消耗的次数）
     *
     * @param activityShopCartEntity 活动sku实体，通过sku领取活动。
     * @return 活动参与记录实体
     */
    String createSkuRechargeOrder(SkuRechargeEntity activityShopCartEntity);

}
