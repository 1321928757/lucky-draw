package cn.bugstack.domain.activity.service.rule.impl;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.armory.IActivityDispatch;
import cn.bugstack.domain.activity.service.rule.AbstractActionChain;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import cn.bugstack.domain.strategy.repository.IStrategyRepository;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 商品库存规则节点
 * @create 2024-03-23 10:25
 */
@Slf4j
@Component("activity_sku_stock_action")
public class ActivitySkuStockActionChain extends AbstractActionChain {
    @Resource
    private IActivityDispatch activityDispatch;

    @Resource
    private IActivityRepository activityRepository;


    @Override
    public void action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity,
                       ActivityCountEntity activityCountEntity) {

        log.info("活动责任链-活动次数库存处理开始，sku：{}，activityId：{}", activitySkuEntity.getSku(), activityEntity.getActivityId());

        // 1. 尝试扣减库存
        boolean status = activityDispatch.subtractionActivitySkuStock(activitySkuEntity.getSku(), activityEntity.getEndDateTime());

        if (status) {
            log.info("活动责任链-活动次数库存扣减成功。sku:{} activityId:{}", activitySkuEntity.getSku(), activityEntity.getActivityId());

            // 2. 扣减成功，将库存更新任务加入延时队列，减缓数据库操作压力
            activityRepository.skuCountStockConsumeSendQueue(ActivitySkuStockKeyVO.builder()
                    .activityId(activityEntity.getActivityId())
                    .sku(activitySkuEntity.getSku())
                    .build());
        }else{
            // 2. 扣减失败，抛出业务异常
            throw new AppException(ResponseCode.ACTIVITY_NO_STOCK.getCode(), ResponseCode.ACTIVITY_NO_STOCK.getInfo());
        }

    }

}
