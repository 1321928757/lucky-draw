package cn.bugstack.domain.credit.model.entity;

import cn.bugstack.domain.credit.model.valobj.TradeNameVO;
import cn.bugstack.domain.credit.model.valobj.TradeTypeVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Luckysj @刘仕杰
 * @description 增加额度实体
 * @create 2024/08/10 14:44:27
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TradeEntity {

    /** 用户ID */
    private String userId;
    /** 交易名称 */
    private TradeNameVO tradeName;
    /** 交易类型；交易类型；forward-正向、reverse-逆向 */
    private TradeTypeVO tradeType;
    /** 交易金额 */
    private BigDecimal amount;
    /** 业务仿重ID - 外部透传。返利、行为等唯一标识 */
    private String outBusinessNo;

}
