package cn.bugstack.domain.activity.service.rule.impl;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.model.valobj.ActivityStateVO;
import cn.bugstack.domain.activity.service.rule.AbstractActionChain;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author  Luckysj @刘仕杰
 * @description 活动规则过滤【日期、状态、库存等基本信息】
 * @create 2024-03-23 10:23
 */
@Slf4j
@Component("activity_base_action")
public class ActivityBaseActionChain extends AbstractActionChain {


    @Override
    public void action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        log.info("活动责任链-基础信息【有效期、状态、库存】校验开始，活动ID：{}，活动SKU：{}", activityEntity.getActivityId(), activitySkuEntity.getActivityId());
        // 1.校验活动的状态
        if(ActivityStateVO.opened != activityEntity.getState()){
            throw new AppException(ResponseCode.ACTIVITY_NO_OPEN.getCode(), ResponseCode.ACTIVITY_NO_OPEN.getInfo());
        }
        // 2.校验时间是否合法
        Date now = new Date();
        if(now.before(activityEntity.getBeginDateTime()) || now.after(activityEntity.getEndDateTime())){
            throw new AppException(ResponseCode.ACTIVITY_NOT_TIME.getCode(), ResponseCode.ACTIVITY_NOT_TIME.getInfo());
        }

        // 3.初步校验库存是否足够
        if(activitySkuEntity.getStockCount() <= 0){
            throw new AppException(ResponseCode.ACTIVITY_NO_STOCK.getCode(), ResponseCode.ACTIVITY_NO_STOCK.getInfo());
        }
    }

}
