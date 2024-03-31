package cn.bugstack.domain.activity.service.armory;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 活动库存操作接口
 * @create 2024/03/31 14:04:51
 */
public interface IActivityDispatch {
    /**
    * @description 扣减活动SKU库存
    * @param sku 活动sku
    * @param endDateTime 活动结束时间
    * @return boolean 是否扣减成功
    * @date 2024/03/31 17:43:53
    */
    boolean subtractionActivitySkuStock(Long sku, Date endDateTime);
}
