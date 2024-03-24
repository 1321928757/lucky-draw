package cn.bugstack.domain.activity.service.rule;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 下单规则过滤接口
 * @create 2024/03/23 20:19:06
 */
public interface IActionChain extends IActionChainArmory {

    boolean action(ActivitySkuEntity activitySkuEntity, ActivityEntity activityEntity, ActivityCountEntity activityCountEntity);

}