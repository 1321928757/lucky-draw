package cn.bugstack.domain.activity.service.armory;

/**
 * @author Luckysj @刘仕杰
 * @description 活动装配接口
 * @create 2024/03/31 14:00:29
 */
public interface IActivityArmory {
    /**
    * @description 为活动装配库存信息
    * @param sku 活动sku
    * @return Boolean 装配结果
    * @date 2024/03/31 14:02:44
    */
    Boolean assembleActivitySkuStock(Long sku);

    /**
    * @description 检查对应sku库存数据是否装配
    * @param sku 活动sku
    * @return Boolean 是否装配
    * @date 2024/03/31 21:34:20
    */
    Boolean skuStockAssembleCheck(Long sku);
}
