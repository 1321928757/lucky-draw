package cn.bugstack.types.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public enum ResponseCode {

    SUCCESS("0000", "调用成功"),
    UN_ERROR("0001", "调用失败"),
    ILLEGAL_PARAMETER("0002", "非法参数"),
    INDEX_DUP("0003", "唯一索引冲突"),
    STRATEGY_RULE_WEIGHT_IS_NULL("ERR_BIZ_001", "业务异常，策略规则中 rule_weight 权重规则已适用但未配置"),
    UN_ASSEMBLED_STRATEGY_ARMORY("ERR_BIZ_002", "抽奖策略配置未装配，请通过IStrategyArmory完成装配"),
    STRATEGY_ID_ERROR("ERR_BIZ_003", "对应的抽奖策略未配置"),
    ACTIVITY_NO_OPEN("ERR_BIZ_004", "活动未开启"),
    ACTIVITY_NOT_TIME("ERR_BIZ_005", "非活动日期范围"),
    ACTIVITY_NO_STOCK("ERR_BIZ_006", "活动库存不足"),
    ACTIVITY_SKU_NO_ASSEMBLE("ERR_BIZ_007", "活动对应sku配置未装配，请通过IActivityArmory完成装配");


    private String code;
    private String info;

}
