package cn.bugstack.domain.activity.service.armory;

/**
 * @author Luckysj @刘仕杰
 * @description 活动装配接口
 * @create 2024/03/31 14:00:29
 */
public interface IActivityArmory {
    /**
    * @description 为活动装配库存信息
    * @param id 活动id
    * @return Boolean 装配结果
    * @date 2024/03/31 14:02:44
    */
    Boolean assembleActivitySkuStock(Long id);
}
