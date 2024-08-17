package cn.bugstack.domain.credit.service;

import cn.bugstack.domain.credit.model.aggregate.TradeAggregate;
import cn.bugstack.domain.credit.model.entity.CreditAccountEntity;
import cn.bugstack.domain.credit.model.entity.CreditOrderEntity;
import cn.bugstack.domain.credit.model.entity.TradeEntity;
import cn.bugstack.domain.credit.repository.ICreditRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 积分调度服务类
 * @create 2024/08/10 14:47:04
 */
@Slf4j
@Service
public class CreditAdjustService implements ICreditAdjustService {

    @Resource
    private ICreditRepository creditRepository;

    @Override
    public String createOrder(TradeEntity tradeEntity) {
        log.info("增加账户积分额度开始 userId:{} tradeName:{} amount:{}", tradeEntity.getUserId(), tradeEntity.getTradeName(), tradeEntity.getAmount());

        // 1.构建账户积分实体
        CreditAccountEntity creditAccountEntity = TradeAggregate.createCreditAccountEntity(
                tradeEntity.getUserId(),
                tradeEntity.getAmount());

        // 2.创建账户订单实体
        CreditOrderEntity creditOrderEntity = TradeAggregate.createCreditOrderEntity(
                tradeEntity.getUserId(),
                tradeEntity.getTradeName(),
                tradeEntity.getTradeType(),
                tradeEntity.getAmount(),
                tradeEntity.getOutBusinessNo());

        // 3.构建交易聚合对象
        TradeAggregate tradeAggregate = TradeAggregate.builder().userId(tradeEntity.getUserId())
                .creditOrderEntity(creditOrderEntity)
                .creditAccountEntity(creditAccountEntity)
                .build();

        // 4.处理聚合对象，积分信息入库
        log.info("增加账户积分额度完成 userId:{} orderId:{}", tradeEntity.getUserId(), creditOrderEntity.getOrderId());
        creditRepository.saveUserCreditTradeOrder(tradeAggregate);

        return creditOrderEntity.getOrderId();
    }
}
