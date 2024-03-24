package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.aggregate.CreateOrderAggregate;
import cn.bugstack.domain.activity.model.entity.*;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.hutool.core.lang.generator.SnowflakeGenerator;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动抽象类，定义标准的流程
 * @create 2024/03/17 10:55:04
 */
@Slf4j
public abstract class AbstractRaffleActivity extends RaffleActivitySupport implements IRaffleOrder {


    public AbstractRaffleActivity(DefaultActivityChainFactory activityChainFactory, IActivityRepository activityRepository, SnowflakeGenerator snowflakeGenerator) {
        super(activityChainFactory, activityRepository, snowflakeGenerator);
    }

    @Override
    public String createSkuRechargeOrder(SkuRechargeEntity skuRechargeEntity) {
        // 1.参数校验
        if(skuRechargeEntity.getSku() == null || Strings.isEmpty(skuRechargeEntity.getUserId()) ||
                Strings.isEmpty(skuRechargeEntity.getOutBusinessNo())){
            throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
        }

        // 2.查询信息
        // 2.1 查询活动SKU信息
        ActivitySkuEntity activitySkuEntity = queryActivitySku(skuRechargeEntity.getSku());
        // 2.2 查询活动信息
        ActivityEntity activityEntity = queryActivity(activitySkuEntity.getActivityId());
        // 2.3 查询次数信息
        ActivityCountEntity activityCountEntity = queryActivityCount(activitySkuEntity.getActivityCountId());

        // 3.活动责任链规则校验(主要是判断活动的有效性),这里我们暂时返回Boolean值，实际会返回校验结果实体
        Boolean result = this.activityCheckChain(activitySkuEntity, activityEntity, activityCountEntity);
        if(!result){
            throw new AppException("fail");//后面会改，先写个大概
        }

        // 4.构建抽奖订单聚合对象
        CreateOrderAggregate createOrderAggregate = this.buildCreateOrderAggregate(skuRechargeEntity, activitySkuEntity,activityEntity,activityCountEntity);

        // 5.保存订单
        this.doCreateOrder(createOrderAggregate);

        // 6.返回信息，我们这里先默认返回订单号
        return createOrderAggregate.getActivityOrderEntity().getOrderId();
    }

    protected abstract void doCreateOrder(CreateOrderAggregate createOrderAggregate);

    protected abstract CreateOrderAggregate buildCreateOrderAggregate(SkuRechargeEntity skuRechargeEntity, ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity);


    protected abstract Boolean activityCheckChain(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity);

    
}
