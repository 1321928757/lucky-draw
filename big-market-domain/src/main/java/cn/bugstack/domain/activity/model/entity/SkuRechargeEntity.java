package cn.bugstack.domain.activity.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 活动sku创建订单实体对象，我们这里购物车其实就一个信息，哪个用户购买的哪个sku(活动)
 * @create 2024/03/16 21:54:41
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SkuRechargeEntity {

    /** 用户ID */
    private String userId;
    /** 商品SKU - activity + activity count */
    private Long sku;
    /** 幂等业务单号 */
    private String outBusinessNo;

}
