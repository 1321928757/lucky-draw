package cn.bugstack.domain.activity.service.rule.impl;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.service.rule.AbstractActionChain;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

/**
 * @author  Luckysj @刘仕杰
 * @description 商品库存规则节点
 * @create 2024-03-23 10:25
 */
@Slf4j
@Component("activity_sku_stock_action")
public class ActivitySkuStockActionChain extends AbstractActionChain {

    @Override
    public DefaultActivityChainFactory.LogicCheckTypeVo action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        log.info("活动责任链-商品库存处理【校验&扣减】开始。");

        // TODO【校验&扣减】

        return DefaultActivityChainFactory.LogicCheckTypeVo.SUCCESS;
    }

}
