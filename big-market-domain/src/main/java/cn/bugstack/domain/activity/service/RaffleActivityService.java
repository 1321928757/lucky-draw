package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.aggregate.CreateOrderAggregate;
import cn.bugstack.domain.activity.model.entity.*;
import cn.bugstack.domain.activity.model.valobj.OrderStateVO;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.rule.IActionChain;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
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
public class RaffleActivityService extends AbstractRaffleActivity {


    public RaffleActivityService(DefaultActivityChainFactory activityChainFactory, IActivityRepository activityRepository, SnowflakeGenerator snowflakeGenerator) {
        super(activityChainFactory, activityRepository, snowflakeGenerator);
    }

    @Override
    protected void doCreateOrder(CreateOrderAggregate createOrderAggregate) {
        activityRepository.saveOrder(createOrderAggregate);
    }

    @Override
    protected CreateOrderAggregate buildCreateOrderAggregate(SkuRechargeEntity skuRechargeEntity, ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
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
        // 我们这里订单ID采用雪花算法生成(使用hutool工具)
        activityOrderEntity.setOrderId(String.valueOf(snowflakeGenerator.next()));

        return CreateOrderAggregate.builder()
                .userId(skuRechargeEntity.getUserId())
                .totalCount(activityCountEntity.getTotalCount())
                .dayCount(activityCountEntity.getDayCount())
                .monthCount(activityCountEntity.getMonthCount())
                .activityId(activityEntity.getActivityId())
                .activityOrderEntity(activityOrderEntity)
                .build();
    }

    @Override
    protected Boolean activityCheckChain(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        IActionChain iActionChain = activityChainFactory.openActionChain();
        return iActionChain.action(activitySkuEntity, activityEntity, activityCountEntity);
    }
}
