package cn.bugstack.domain.strategy.service;

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
}
