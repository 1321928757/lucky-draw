package cn.bugstack.domain.strategy.repository;

import cn.bugstack.domain.strategy.model.entity.StrategyAwardEntity;
import cn.bugstack.domain.strategy.model.entity.StrategyEntity;
import cn.bugstack.domain.strategy.model.entity.StrategyRuleEntity;
import cn.bugstack.domain.strategy.model.valobj.RuleTreeVO;
import cn.bugstack.domain.strategy.model.valobj.StrategyAwardRuleModelVO;
import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

import java.util.List;
import java.util.Map;

/**
 * @author Luckysj @刘仕杰
 * @description 策略服务仓储接口
 * @create 2023-12-23 09:33
 */
public interface IStrategyRepository {

    /**
     * 根据策略ID查询策略下的奖品列表
     *
     * @param strategyId 策略id
     * @return 奖品列表
     */
    List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId);

    /**
     * 保存概率范围和概率抽取Map到缓存中
     *
     * @param key 缓存key
     * @param rateRange 抽取范围
     * @param strategyAwardSearchRateTable 抽取概率分布Map
     */
    void storeStrategyAwardSearchRateTable(String key, Integer rateRange, Map<Integer, Integer> strategyAwardSearchRateTable);

    /**
     * 获取 key Map中key为rateKey的value值
     *
     * @param key 缓存key
     * @param rateKey 抽取范围
     * @return 获取到的奖品编号值
     */
    Integer getStrategyAwardAssemble(String key, Integer rateKey);

    /**
     * 获取对应id策略的抽取范围
     *
     * @param strategyId 策略ID
     * @return 策略范围
     */
    int getRateRange(Long strategyId);

    /**
     * 获取对应key的抽取范围
     *
     * @param key key
     * @return 策略范围
     */
    int getRateRange(String key);

    /**
     * 根据策略ID查询策略信息
     *
     * @param strategyId 策略ID
     * @return 策略实体
     */
    StrategyEntity queryStrategyEntityByStrategyId(Long strategyId);

    /**
     * 根据策略ID和策略规则ID查询规则实体
     *
     * @param strategyId 策略ID
     * @param ruleModel 策略规则ID
     * @return 策略规则实体
     */
    StrategyRuleEntity queryStrategyRule(Long strategyId, String ruleModel);

    /**
     * 根据策略ID和策略规则ID查询规则值
     *
     * @param strategyId 策略ID
     * @param ruleModel 策略规则ID
     * @return 策略规则值
     */
    String queryStrategyRuleValue(Long strategyId, String ruleModel);

    /**
     * 根据策略ID和策略规则ID和奖品ID查询规则值
     *
     * @param strategyId 策略ID
     * @param ruleModel 策略规则ID
     * @param awardId 奖品ID
     * @return 策略规则值
     */
    String queryStrategyRuleValue(Long strategyId, Integer awardId, String ruleModel);

    /**
     * 根据策略id和奖品id查询对应奖品的抽奖规则
     *
     * @param strategyId 策略ID
     * @param awardId 奖品ID
     * @return 策略规则实体
     */
    StrategyAwardRuleModelVO queryStrategyAwardRuleModelVO(Long strategyId, Integer awardId);

    /**
     * 根据规则树ID，查询树结构信息
     *
     * @param treeId 规则树ID
     * @return 树结构信息
     */
    RuleTreeVO queryRuleTreeVOByTreeId(String treeId);

    /**
     * 缓存奖品库存
     *
     * @param cacheKey   key
     * @param awardCount 库存值
     */
    void cacheStrategyAwardCount(String cacheKey, Integer awardCount);

    /**
     * 缓存key，decr 方式扣减库存
     *
     * @param cacheKey 缓存Key
     * @return 扣减结果
     */
    Boolean subtractionAwardStock(String cacheKey);

    /**
     * 写入奖品库存消费队列
     *
     * @param strategyAwardStockKeyVO 对象值对象
     */
    void awardStockConsumeSendQueue(StrategyAwardStockKeyVO strategyAwardStockKeyVO);

    /**
     * 获取奖品库存消费队列
     */
    StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException;

    /**
     * 更新奖品库存消耗
     *
     * @param strategyId 策略ID
     * @param awardId    奖品ID
     */
    void updateStrategyAwardStock(Long strategyId, Integer awardId);

    /**
     * 根据策略ID+奖品ID的唯一值组合，查询奖品信息
     *
     * @param strategyId 策略ID
     * @param awardId    奖品ID
     * @return 奖品信息
     */
    StrategyAwardEntity queryStrategyAwardEntity(Long strategyId, Integer awardId);

    /**
     * 根据活动id查询策略id
     *
     * @param activityId 活动id
     * @return 奖品信息
     */
    Long queryStrategyIdByActivityId(Long activityId);

    /**
     * 查询用户在活动中当天抽奖过的次数
     *
     * @param userId 用户id
     * @param strategyId 抽奖策略id
     * @return 奖品信息
     */
    Integer queryTodayUserRaffleCount(String userId, Long strategyId);

    /**
     * 查询用户在活动中当月抽奖过的次数
     *
     * @param userId 用户id
     * @param strategyId 抽奖策略id
     * @return 奖品信息
     */
    Integer queryMonthUserRaffleCount(String userId, Long strategyId);

    /**
     * 查询用户在活动中总共抽奖过的次数
     *
     * @param userId 用户id
     * @param strategyId 抽奖策略id
     * @return 奖品信息
     */
    Integer queryAllUserRaffleCount(String userId, Long strategyId);


    /**
    * @description 根据id批量查询对应规则树下的次数锁的值
    * @param treeIds 规则树id数组
    * @return Map id-次数锁的值
    * @date 2024/04/24 17:39:49
    */
    Map<String, Integer> queryAwardRuleLockCountByRuleIds(String[] treeIds);
}
