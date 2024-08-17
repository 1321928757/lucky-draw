package cn.bugstack.infrastructure.persistent.po;

import lombok.Data;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 用户积分流水单
 * @create 2024/08/10 15:12:09
 */
@Data
public class UserCreditOrder {

    /** 自增ID */
    private Long id;
    /** 用户ID */
    private String userId;
    /** 订单ID */
    private String orderId;
    /** 交易名称 */
    private String tradeName;
    /** 交易类型；交易类型；forward-正向、reverse-逆向 */
    private String tradeType;
    /** 交易金额 */
    private BigDecimal tradeAmount;
    /** 业务仿重ID - 外部透传。返利、行为等唯一标识 */
    private String outBusinessNo;
    /** 创建时间 */
    private Date createTime;
    /** 更新时间 */
    private Date updateTime;

}
