package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.entity.ActivityAccountEntity;
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

    /**
    * @description 根据活动id和用户id查询用户在活动中当日的抽取次数
    * @param activityId 活动id
    * @param userId 用户id
    * @return 用户抽取的次数
    * @date 2024/04/24 18:24:36
    */
    Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId);

    /**
     * @description 根据活动id和用户id查询用户在活动中总的抽取次数
     * @param activityId 活动id
     * @param userId 用户id
     * @return 用户抽取的次数
     * @date 2024/04/24 18:24:36
     */
    Integer queryRaffleActivityAccountTotalPartakeCount(Long activityId, String userId);
    /**
    * @description 查询用户的次数账户[总，月，日]
    * @param activityId 活动id
    * @param userId 用户id
    * @return ActivityAccountEntity 次数账户信息
    * @date 2024/05/05 20:16:30
    */
    ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId);
}
