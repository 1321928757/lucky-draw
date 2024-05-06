package cn.bugstack.domain.activity.service.quota;

import cn.bugstack.domain.activity.model.aggregate.CreateQuotaOrderAggregate;
import cn.bugstack.domain.activity.model.entity.*;
import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.activity.model.valobj.OrderStateVO;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.IRaffleActivitySkuStockService;
import cn.bugstack.domain.activity.service.quota.rule.IActionChain;
import cn.bugstack.domain.activity.service.quota.rule.factory.DefaultActivityChainFactory;
import cn.hutool.core.lang.generator.SnowflakeGenerator;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动服务
 * @create 2024/03/17 10:55:17
 */
@Service
public class RaffleActivityAccountQuotaService extends AbstractRaffleActivityAccountQuota implements IRaffleActivitySkuStockService {


    public RaffleActivityAccountQuotaService(DefaultActivityChainFactory activityChainFactory, IActivityRepository activityRepository, SnowflakeGenerator snowflakeGenerator) {
        super(activityChainFactory, activityRepository, snowflakeGenerator);
    }

    @Override
    protected void doCreateOrder(CreateQuotaOrderAggregate createOrderAggregate) {
        activityRepository.saveOrder(createOrderAggregate);
    }

    @Override
    protected CreateQuotaOrderAggregate buildCreateOrderAggregate(SkuRechargeEntity skuRechargeEntity, ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        // 组装基本信息
        ActivityOrderEntity activityOrderEntity = new ActivityOrderEntity();
        activityOrderEntity.setTotalCount(activityCountEntity.getTotalCount());
        activityOrderEntity.setDayCount(activityCountEntity.getDayCount());
        activityOrderEntity.setMonthCount(activityCountEntity.getMonthCount());
        activityOrderEntity.setUserId(skuRechargeEntity.getUserId());
        activityOrderEntity.setSku(skuRechargeEntity.getSku());
        activityOrderEntity.setOutBusinessNo(skuRechargeEntity.getOutBusinessNo());
        activityOrderEntity.setActivityId(activityEntity.getActivityId());
        activityOrderEntity.setSku(activitySkuEntity.getSku());
        activityOrderEntity.setActivityName(activityEntity.getActivityName());
        activityOrderEntity.setStrategyId(activityEntity.getStrategyId());
        activityOrderEntity.setUserId(skuRechargeEntity.getUserId());
        activityOrderEntity.setState(OrderStateVO.no_used);
        activityOrderEntity.setOrderTime(new Date());
        activityOrderEntity.setOutBusinessNo(skuRechargeEntity.getOutBusinessNo());
        activityOrderEntity.setOrderId(RandomStringUtils.randomNumeric(12));

        return CreateQuotaOrderAggregate.builder()
                .userId(skuRechargeEntity.getUserId())
                .totalCount(activityCountEntity.getTotalCount())
                .dayCount(activityCountEntity.getDayCount())
                .monthCount(activityCountEntity.getMonthCount())
                .activityId(activityEntity.getActivityId())
                .activityOrderEntity(activityOrderEntity)
                .build();
    }

    @Override
    protected void activityCheckChain(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        IActionChain iActionChain = activityChainFactory.openActionChain();
        iActionChain.action(activitySkuEntity, activityEntity, activityCountEntity);
    }

    @Override
    public ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException {
        return activityRepository.takeQueueValue();
    }

    @Override
    public void clearQueue() {
        activityRepository.clearQueueValue();
    }

    @Override
    public void updateActivitySkuStock(Long sku) {
        activityRepository.updateActivitySkuStock(sku);
    }

    @Override
    public void clearActivitySkuStock(Long sku) {
        activityRepository.clearActivitySkuStock(sku);
    }

    @Override
    public Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId) {
        return activityRepository.queryRaffleActivityAccountDayPartakeCount(activityId, userId);
    }

    @Override
    public Integer queryRaffleActivityAccountTotalPartakeCount(Long activityId, String userId) {
        return activityRepository.queryRaffleActivityAccountTotalPartakeCount(activityId, userId);
    }

    @Override
    public ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId) {
        return activityRepository.queryActivityAccountEntity(activityId, userId);
    }
}
