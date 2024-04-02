package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import cn.hutool.core.lang.generator.SnowflakeGenerator;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动的支持类，比如一些零散信息的查询方法，我们可以将其抽离出来
 * @create 2024/03/23 20:35:11
 */
public class RaffleActivitySupport {
    protected DefaultActivityChainFactory activityChainFactory;

    protected IActivityRepository activityRepository;

    protected SnowflakeGenerator snowflakeGenerator;


    public RaffleActivitySupport(DefaultActivityChainFactory activityChainFactory, IActivityRepository activityRepository, SnowflakeGenerator snowflakeGenerator) {
        this.activityChainFactory = activityChainFactory;
        this.activityRepository = activityRepository;
        this.snowflakeGenerator = snowflakeGenerator;
    }

    public ActivitySkuEntity queryActivitySku(Long sku) {
        return activityRepository.queryActivitySku(sku);
    }

    public ActivityEntity queryActivity(Long activityId) {
        return activityRepository.queryRaffleActivityByActivityId(activityId);
    }

    public ActivityCountEntity queryActivityCount(Long activityCountId) {
        return activityRepository.queryRaffleActivityCountByActivityCountId(activityCountId);
    }


}
