package cn.bugstack.domain.strategy.service;

import cn.bugstack.domain.strategy.model.valobj.RuleWeightVO;

import java.util.List;
import java.util.Map;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖规则接口；主要提供对规则的业务功能查询
 * @create 2024/04/24 17:15:50
 */
public interface IRaffleRule {

    /**
    * @description 根据规则树id数组查询所有规则树下的次数锁的值
    * @param treeIds 规则
    * @return treeId-次数锁值
    * @date 2024/04/24 17:20:34
    */
    Map<String, Integer> queryAwardRuleLockCountByRuleIds(String[] treeIds);


    /**
    * @description 根据策略id查询奖品权重配置
    * @param strategyId 策略id
    * @return 权重值对象数组
    * @date 2024/05/05 21:00:34
    */
    List<RuleWeightVO> queryAwardRuleWeight(Long strategyId, String userId);

    /**
    * @description 根据活动id查询策略下的权重信息
    * @param activityId 活动id
    * @return 权重值对象数组
    * @date 2024/05/05 20:58:32
    */
    List<RuleWeightVO> queryAwardRuleWeightByActivityId(Long activityId, String userId);
}
