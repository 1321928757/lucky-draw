package cn.bugstack.domain.activity.service.rule.impl;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.model.valobj.ActivityStateVO;
import cn.bugstack.domain.activity.service.rule.AbstractActionChain;
import cn.bugstack.domain.activity.service.rule.factory.DefaultActivityChainFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author  Luckysj @刘仕杰
 * @description 活动规则过滤【日期、状态】
 * @create 2024-03-23 10:23
 */
@Slf4j
@Component("activity_base_action")
public class ActivityBaseActionChain extends AbstractActionChain {


    @Override
    public DefaultActivityChainFactory.LogicCheckTypeVo action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity) {
        log.info("活动责任链-基础信息【有效期、状态】校验开始。");
        // 1.校验活动的状态
        if(ActivityStateVO.posted != activityEntity.getState()){
            return DefaultActivityChainFactory.LogicCheckTypeVo.REFUSE_INVALID_STATE;
        }
        // 2.校验时间是否合法
        Date beginDateTime = activityEntity.getBeginDateTime();
        Date endDataTime = activityEntity.getEndDateTime();
        Date now = new Date();
        if(now.before(beginDateTime)){
            return DefaultActivityChainFactory.LogicCheckTypeVo.REFUSE_NOBEGIN_TIME;
        }
        if(now.after(endDataTime)){
            return DefaultActivityChainFactory.LogicCheckTypeVo.REFUSE_END_TIME;
        }

        return next().action(activitySkuEntity, activityEntity, activityCountEntity);
    }

}
