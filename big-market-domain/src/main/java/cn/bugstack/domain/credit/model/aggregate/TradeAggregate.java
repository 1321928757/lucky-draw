package cn.bugstack.domain.credit.model.aggregate;

import cn.bugstack.domain.credit.model.entity.CreditAccountEntity;
import cn.bugstack.domain.credit.model.entity.CreditOrderEntity;
import cn.bugstack.domain.credit.model.valobj.TradeNameVO;
import cn.bugstack.domain.credit.model.valobj.TradeTypeVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;

import java.math.BigDecimal;

/**
 * @author Luckysj @刘仕杰
 * @description 交易聚合对象
 * @create 2024/08/10 14:50:41
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TradeAggregate {

    /**
     * 用户id
     */
    private String userId;
    /**
     * 积分账户实体
     */
    private CreditAccountEntity creditAccountEntity;
    /**
     * 积分订单实体
     */
    private CreditOrderEntity creditOrderEntity;

    /**
     * 构建积分账户实体
     * @param userId 用户id
     * @param adjustAmount 调整的值
     * @return CreditAccountEntity
     */
    public static CreditAccountEntity createCreditAccountEntity(String userId, BigDecimal adjustAmount) {
        return CreditAccountEntity.builder().userId(userId).adjustAmount(adjustAmount).build();
    }

    /**
     * 构建积分订单实体
     * @param userId 用户id
     * @param tradeName 交易名称
     * @param tradeType 交易类型
     * @param tradeAmount 交易额度
     * @param outBusinessNo 业务编号
     * @return
     */
    public static CreditOrderEntity createCreditOrderEntity(String userId,
                                                            TradeNameVO tradeName,
                                                            TradeTypeVO tradeType,
                                                            BigDecimal tradeAmount,
                                                            String outBusinessNo) {
        return CreditOrderEntity.builder()
                .userId(userId)
                .orderId(RandomStringUtils.randomNumeric(12))
                .tradeName(tradeName)
                .tradeType(tradeType)
                .tradeAmount(tradeAmount)
                .outBusinessNo(outBusinessNo)
                .build();
    }

}
