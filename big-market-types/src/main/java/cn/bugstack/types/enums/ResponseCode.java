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
    TOKEN_ERROR("0004", "权限拦截"),
    VIEW_LIMIT("0005", "访问频率限制"),
    CODE_ERROR("0006", "访问码不存在或已过期"),
    AUTH_ERROR("0007", "身份信息验证失败"),
    STRATEGY_RULE_WEIGHT_IS_NULL("ERR_BIZ_001", "业务异常，策略规则中 rule_weight 权重规则已适用但未配置"),
    UN_ASSEMBLED_STRATEGY_ARMORY("ERR_BIZ_002", "抽奖策略配置未装配，请通过IStrategyArmory完成装配"),
    STRATEGY_ID_ERROR("ERR_BIZ_003", "对应的抽奖策略未配置"),
    ACTIVITY_NO_OPEN("ERR_BIZ_004", "活动未开启"),
    ACTIVITY_NOT_TIME("ERR_BIZ_005", "非活动日期范围"),
    ACTIVITY_NO_STOCK("ERR_BIZ_006", "活动库存不足"),
    ACTIVITY_SKU_NO_ASSEMBLE("ERR_BIZ_007", "活动对应sku配置未装配，请通过IActivityArmory完成装配"),
    ACCOUNT_TOTAL_QUOTA_ERROR("ERR_BIZ_008", "账户总额度不足"),
    ACCOUNT_DAY_QUOTA_ERROR("ERR_BIZ_009", "账户日额度不足"),
    ACCOUNT_MONTH_QUOTA_ERROR("ERR_BIZ_010", "账户月额度不足"),
    ACCOUNT_SIGN_ERROR("ERR_BIZ_009", "用户当日已经签到过啦~");

    private String code;
    private String info;

}
