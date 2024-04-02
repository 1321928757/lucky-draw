package cn.bugstack.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动sku持久化对象,SKU是一个独一无二的字母数字组合,用于唯一标识一种商品或产品。
 * 通过SKU,可以精确地识别库存单品、跟踪库存水平、订单状态等。用户参加活动都会有一一对应的SKU
 * @create 2024-03-16 20:30
 */
@Data
public class RaffleActivitySku {

    private Long id;
    /**
     * 商品sku
     */
    private Long sku;
    /**
     * 活动ID
     */
    private Long activityId;
    /**
     * 活动个人参与次数ID
     */
    private Long activityCountId;
    /**
     * 库存总量
     */
    private Integer stockCount;
    /**
     * 剩余库存
     */
    private Integer stockCountSurplus;
    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

}

