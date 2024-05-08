package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.activity.service.quota.rule.factory.DefaultActivityChainFactory;
import cn.bugstack.domain.strategy.model.entity.StrategyAwardEntity;
import cn.bugstack.domain.strategy.model.entity.StrategyEntity;
import cn.bugstack.domain.strategy.model.entity.StrategyRuleEntity;
import cn.bugstack.domain.strategy.model.valobj.*;
import cn.bugstack.domain.strategy.repository.IStrategyRepository;
import cn.bugstack.domain.strategy.service.rule.chain.factory.DefaultChainFactory;
import cn.bugstack.infrastructure.persistent.dao.*;
import cn.bugstack.infrastructure.persistent.po.*;
import cn.bugstack.infrastructure.persistent.redis.IRedisService;
import cn.bugstack.types.common.Constants;
import cn.bugstack.types.exception.AppException;
import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBlockingQueue;
import org.redisson.api.RDelayedQueue;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

import static cn.bugstack.types.enums.ResponseCode.UN_ASSEMBLED_STRATEGY_ARMORY;

/**
 * @author Luckysj @刘仕杰
 * @description 策略服务仓储实现
 * @create 2023-12-23 10:33
 */
@Slf4j
@Repository
public class StrategyRepository implements IStrategyRepository {

    @Resource
    private IStrategyDao strategyDao;
    @Resource
    private IStrategyRuleDao strategyRuleDao;
    @Resource
    private IStrategyAwardDao strategyAwardDao;
    @Resource
    private IRedisService redisService;
    @Resource
    private IRuleTreeDao ruleTreeDao;
    @Resource
    private IRuleTreeNodeDao ruleTreeNodeDao;
    @Resource
    private IRuleTreeNodeLineDao ruleTreeNodeLineDao;

    @Resource
    private IRaffleActivityDao raffleActivityDao;

    @Resource
    private IRaffleActivityAccountDayDao raffleActivityAccountDayDao;

    @Resource
    private IRaffleActivityAccountDao raffleActivityAccountDao;

    @Resource
    private IRaffleActivityAccountMonthDao raffleActivityAccountMonthDao;

    @Override
    public List<StrategyAwardEntity> queryStrategyAwardList(Long strategyId) {
        // 优先从缓存获取
        String cacheKey = Constants.RedisKey.STRATEGY_AWARD_LIST_KEY + strategyId;
        List<StrategyAwardEntity> strategyAwardEntities = redisService.getValue(cacheKey);
        if (null != strategyAwardEntities && !strategyAwardEntities.isEmpty()) return strategyAwardEntities;
        // 从库中获取数据
        List<StrategyAward> strategyAwards = strategyAwardDao.queryStrategyAwardListByStrategyId(strategyId);
        strategyAwardEntities = new ArrayList<>(strategyAwards.size());
        for (StrategyAward strategyAward : strategyAwards) {
            StrategyAwardEntity strategyAwardEntity = StrategyAwardEntity.builder()
                    .strategyId(strategyAward.getStrategyId())
                    .awardId(strategyAward.getAwardId())
                    .awardTitle(strategyAward.getAwardTitle())
                    .awardSubtitle(strategyAward.getAwardSubtitle())
                    .awardImage(strategyAward.getAwardImage())
                    .awardCount(strategyAward.getAwardCount())
                    .awardCountSurplus(strategyAward.getAwardCountSurplus())
                    .awardRate(strategyAward.getAwardRate())
                    .ruleModels(strategyAward.getRuleModels())
                    .sort(strategyAward.getSort())
                    .build();
            strategyAwardEntities.add(strategyAwardEntity);
        }
        redisService.setValue(cacheKey, strategyAwardEntities);
        return strategyAwardEntities;
    }

    @Override
    public void storeStrategyAwardSearchRateTable(String key, Integer rateRange, Map<Integer, Integer> strategyAwardSearchRateTable) {
        // 1. 存储抽奖策略范围值，如10000，用于生成1000以内的随机数
        redisService.setValue(Constants.RedisKey.STRATEGY_RATE_RANGE_KEY + key, rateRange);
        // 2. 存储概率查找表
        Map<Integer, Integer> cacheRateTable = redisService.getMap(Constants.RedisKey.STRATEGY_RATE_TABLE_KEY + key);
        cacheRateTable.putAll(strategyAwardSearchRateTable);
    }

    @Override
    public Integer getStrategyAwardAssemble(String key, Integer rateKey) {
        return redisService.getFromMap(Constants.RedisKey.STRATEGY_RATE_TABLE_KEY + key, rateKey);
    }

    @Override
    public int getRateRange(Long strategyId) {
        return getRateRange(String.valueOf(strategyId));
    }

    @Override
    public int getRateRange(String key) {
        String cacheKey = Constants.RedisKey.STRATEGY_RATE_RANGE_KEY + key;
        if (!redisService.isExists(cacheKey)) {
            throw new AppException(UN_ASSEMBLED_STRATEGY_ARMORY.getCode(), cacheKey + Constants.COLON + UN_ASSEMBLED_STRATEGY_ARMORY.getInfo());
        }
        return redisService.getValue(cacheKey);
    }

    @Override
    public StrategyEntity queryStrategyEntityByStrategyId(Long strategyId) {
        // 优先从缓存获取
        String cacheKey = Constants.RedisKey.STRATEGY_KEY + strategyId;
        StrategyEntity strategyEntity = redisService.getValue(cacheKey);
        if (null != strategyEntity) return strategyEntity;
        Strategy strategy = strategyDao.queryStrategyByStrategyId(strategyId);
        if (null == strategy) return StrategyEntity.builder().build();
        strategyEntity = StrategyEntity.builder()
                .strategyId(strategy.getStrategyId())
                .strategyDesc(strategy.getStrategyDesc())
                .ruleModels(strategy.getRuleModels())
                .build();
        redisService.setValue(cacheKey, strategyEntity);
        return strategyEntity;
    }

    @Override
    public StrategyRuleEntity queryStrategyRule(Long strategyId, String ruleModel) {
        StrategyRule strategyRuleReq = new StrategyRule();
        strategyRuleReq.setStrategyId(strategyId);
        strategyRuleReq.setRuleModel(ruleModel);
        StrategyRule strategyRuleRes = strategyRuleDao.queryStrategyRule(strategyRuleReq);
        if (null == strategyRuleRes) return null;
        return StrategyRuleEntity.builder()
                .strategyId(strategyRuleRes.getStrategyId())
                .awardId(strategyRuleRes.getAwardId())
                .ruleType(strategyRuleRes.getRuleType())
                .ruleModel(strategyRuleRes.getRuleModel())
                .ruleValue(strategyRuleRes.getRuleValue())
                .ruleDesc(strategyRuleRes.getRuleDesc())
                .build();
    }

    @Override
    public String queryStrategyRuleValue(Long strategyId, String ruleModel) {
        return queryStrategyRuleValue(strategyId, null, ruleModel);
    }

    @Override
    public String queryStrategyRuleValue(Long strategyId, Integer awardId, String ruleModel) {
        StrategyRule strategyRule = new StrategyRule();
        strategyRule.setStrategyId(strategyId);
        strategyRule.setAwardId(awardId);
        strategyRule.setRuleModel(ruleModel);
        return strategyRuleDao.queryStrategyRuleValue(strategyRule);
    }

    @Override
    public StrategyAwardRuleModelVO queryStrategyAwardRuleModelVO(Long strategyId, Integer awardId) {
        StrategyAward strategyAward = new StrategyAward();
        strategyAward.setStrategyId(strategyId);
        strategyAward.setAwardId(awardId);
        String ruleModels = strategyAwardDao.queryStrategyAwardRuleModels(strategyAward);
        if (null == ruleModels) return null;
        return StrategyAwardRuleModelVO.builder().ruleModels(ruleModels).build();
    }

    @Override
    public RuleTreeVO queryRuleTreeVOByTreeId(String treeId) {
        // 优先从缓存获取组装好的决策树
        String cacheKey = Constants.RedisKey.RULE_TREE_VO_KEY + treeId;
        RuleTreeVO ruleTreeVOCache = redisService.getValue(cacheKey);
        if (null != ruleTreeVOCache) return ruleTreeVOCache;

        // 从数据库获取决策树，决策树结点，决策树路径等信息
        RuleTree ruleTree = ruleTreeDao.queryRuleTreeByTreeId(treeId);
        List<RuleTreeNode> ruleTreeNodes = ruleTreeNodeDao.queryRuleTreeNodeListByTreeId(treeId);
        List<RuleTreeNodeLine> ruleTreeNodeLines = ruleTreeNodeLineDao.queryRuleTreeNodeLineListByTreeId(treeId);

        // 1. 我们根据决策树下的节点和路径信息，将路径信息转为map结构，key为当前位置，value为当前位置的下级路径
        Map<String, List<RuleTreeNodeLineVO>> ruleTreeNodeLineMap = new HashMap<>();
        for (RuleTreeNodeLine ruleTreeNodeLine : ruleTreeNodeLines) {
            RuleTreeNodeLineVO ruleTreeNodeLineVO = RuleTreeNodeLineVO.builder()
                    .treeId(ruleTreeNodeLine.getTreeId())
                    .ruleNodeFrom(ruleTreeNodeLine.getRuleNodeFrom())
                    .ruleNodeTo(ruleTreeNodeLine.getRuleNodeTo())
                    .ruleLimitType(RuleLimitTypeVO.valueOf(ruleTreeNodeLine.getRuleLimitType()))
                    .ruleLimitValue(RuleLogicCheckTypeVO.valueOf(ruleTreeNodeLine.getRuleLimitValue()))
                    .build();

            // 从map中取出对应key的list(如果不存在就会自动创建，如果存在会直接返回拿取到)
            List<RuleTreeNodeLineVO> ruleTreeNodeLineVOList = ruleTreeNodeLineMap.computeIfAbsent(ruleTreeNodeLine.getRuleNodeFrom(), k -> new ArrayList<>());
            // 向List中添加路径
            ruleTreeNodeLineVOList.add(ruleTreeNodeLineVO);
        }

        // 2. 将所有的结点转为Map结构，我们利用了第一步生成的ruleTreeNodeLineMap，可获取到本结点下的所有路径
        Map<String, RuleTreeNodeVO> treeNodeMap = new HashMap<>();
        for (RuleTreeNode ruleTreeNode : ruleTreeNodes) {
            RuleTreeNodeVO ruleTreeNodeVO = RuleTreeNodeVO.builder()
                    .treeId(ruleTreeNode.getTreeId())
                    .ruleKey(ruleTreeNode.getRuleKey())
                    .ruleDesc(ruleTreeNode.getRuleDesc())
                    .ruleValue(ruleTreeNode.getRuleValue())
                    .treeNodeLineVOList(ruleTreeNodeLineMap.get(ruleTreeNode.getRuleKey()))
                    .build();
            treeNodeMap.put(ruleTreeNode.getRuleKey(), ruleTreeNodeVO);
        }

        // 3. 构建 Rule Tree
        RuleTreeVO ruleTreeVODB = RuleTreeVO.builder()
                .treeId(ruleTree.getTreeId())
                .treeName(ruleTree.getTreeName())
                .treeDesc(ruleTree.getTreeDesc())
                .treeRootRuleNode(ruleTree.getTreeRootRuleKey())
                .treeNodeMap(treeNodeMap)
                .build();

        // 4. 存入缓存中，减少下次组装决策树的时耗
        redisService.setValue(cacheKey, ruleTreeVODB);
        return ruleTreeVODB;
    }

    @Override
    public void cacheStrategyAwardCount(String cacheKey, Integer awardCount) {
        if (redisService.isExists(cacheKey)) return;
        redisService.setAtomicLong(cacheKey, awardCount);
    }

    @Override
    public Boolean subtractionAwardStock(String cacheKey) {
        // 1.decr扣减库存
        long surplus = redisService.decr(cacheKey);
        if (surplus < 0) {
            // 库存小于0，恢复为0个
            redisService.setAtomicLong(cacheKey, 0);
            return false;
        }

        // 2. 加锁为了兜底，如果后续有恢复库存，手动处理等，也不会超卖。因为所有的可用库存key，都被加锁了。
        String lockKey = cacheKey + Constants.UNDERLINE + surplus;
        Boolean lock = redisService.setNx(lockKey);
        if (!lock) {
            log.info("策略奖品库存加锁失败 {}", lockKey);
        }
        return lock;
    }

    @Override
    public void awardStockConsumeSendQueue(StrategyAwardStockKeyVO strategyAwardStockKeyVO) {
        // 获取redisson的延迟队列，将消息放入延迟队列中，等待定时任务消费，对库操作进行双重减缓
        String cacheKey = Constants.RedisKey.STRATEGY_AWARD_COUNT_QUERY_KEY;
        RBlockingQueue<StrategyAwardStockKeyVO> blockingQueue = redisService.getBlockingQueue(cacheKey);
        RDelayedQueue<StrategyAwardStockKeyVO> delayedQueue = redisService.getDelayedQueue(blockingQueue);
        delayedQueue.offer(strategyAwardStockKeyVO, 3, TimeUnit.SECONDS);

        // 以下方式为使用Mq来进行更新降速，但不好控制消费速度
        // // 将对象序列化为Json
        // String jsonString = JSON.toJSONString(strategyAwardStockKeyVO);
        // // 发送到rabbit消息队列中
        // rabbitTemplate.convertAndSend(Constants.MessageQueueKey.StockUpdateExchange, Constants.MessageQueueKey.StockUpdateKey, jsonString);

    }

    // 这个方法是用来获取堵塞队列的，换成mq后就用不到了
    @Override
    public StrategyAwardStockKeyVO takeQueueValue() throws InterruptedException {
        String cacheKey = Constants.RedisKey.STRATEGY_AWARD_COUNT_QUERY_KEY;
        RBlockingQueue<StrategyAwardStockKeyVO> destinationQueue = redisService.getBlockingQueue(cacheKey);
        return destinationQueue.poll();
    }

    @Override
    public void updateStrategyAwardStock(Long strategyId, Integer awardId) {
        StrategyAward strategyAward = new StrategyAward();
        strategyAward.setStrategyId(strategyId);
        strategyAward.setAwardId(awardId);
        strategyAwardDao.updateStrategyAwardStock(strategyAward);
    }

    @Override
    public StrategyAwardEntity queryStrategyAwardEntity(Long strategyId, Integer awardId) {
        // 优先从缓存获取
        String cacheKey = Constants.RedisKey.STRATEGY_AWARD_KEY + strategyId + Constants.UNDERLINE + awardId;
        StrategyAwardEntity strategyAwardEntity = redisService.getValue(cacheKey);
        if (null != strategyAwardEntity) return strategyAwardEntity;
        // 查询数据
        StrategyAward strategyAwardReq = new StrategyAward();
        strategyAwardReq.setStrategyId(strategyId);
        strategyAwardReq.setAwardId(awardId);
        StrategyAward strategyAwardRes = strategyAwardDao.queryStrategyAward(strategyAwardReq);
        // 转换数据
        strategyAwardEntity = StrategyAwardEntity.builder()
                .strategyId(strategyAwardRes.getStrategyId())
                .awardId(strategyAwardRes.getAwardId())
                .awardTitle(strategyAwardRes.getAwardTitle())
                .awardImage(strategyAwardRes.getAwardImage())
                .awardSubtitle(strategyAwardRes.getAwardSubtitle())
                .awardCount(strategyAwardRes.getAwardCount())
                .awardCountSurplus(strategyAwardRes.getAwardCountSurplus())
                .awardRate(strategyAwardRes.getAwardRate())
                .sort(strategyAwardRes.getSort())
                .build();
        // 缓存结果
        redisService.setValue(cacheKey, strategyAwardEntity);
        // 返回数据
        return strategyAwardEntity;
    }

    @Override
    public Long queryStrategyIdByActivityId(Long activityId) {
        return raffleActivityDao.queryStrategyIdByActivityId(activityId);
    }

    @Override
    public Integer queryTodayUserRaffleCount(String userId, Long strategyId) {
        // 1.首先根据策略id查询出活动id
        Long activityId = raffleActivityDao.queryActivityIdByStrategyId(strategyId);

        // 2.根据活动id和用户id查询出用户日次数账户
        RaffleActivityAccountDay raffleActivityAccountDayReq = new RaffleActivityAccountDay();
        raffleActivityAccountDayReq.setDay(raffleActivityAccountDayReq.currentDay());
        raffleActivityAccountDayReq.setUserId(userId);
        raffleActivityAccountDayReq.setActivityId(activityId);
        RaffleActivityAccountDay raffleActivityAccountDay = raffleActivityAccountDayDao.queryActivityAccountDayByUserId(raffleActivityAccountDayReq);

        // 3.总次数 - 剩余次数 = 使用次数
        return raffleActivityAccountDay.getDayCount() - raffleActivityAccountDay.getDayCountSurplus();
    }

    @Override
    public Integer queryMonthUserRaffleCount(String userId, Long strategyId) {
        // 1.首先根据策略id查询出活动id
        Long activityId = raffleActivityDao.queryActivityIdByStrategyId(strategyId);

        // 2.根据活动id和用户id查询出用户日次数账户
        RaffleActivityAccountMonth raffleActivityAccountMonthReq = new RaffleActivityAccountMonth();
        raffleActivityAccountMonthReq.setMonth(raffleActivityAccountMonthReq.currentMonth());
        raffleActivityAccountMonthReq.setUserId(userId);
        raffleActivityAccountMonthReq.setActivityId(activityId);
        RaffleActivityAccountMonth raffleActivityAccountMonth = raffleActivityAccountMonthDao.queryActivityAccountMonthByUserId(raffleActivityAccountMonthReq);

        // 3.总次数 - 剩余次数 = 使用次数
        return raffleActivityAccountMonth.getMonthCount() - raffleActivityAccountMonth.getMonthCountSurplus();
    }

    @Override
    public Integer queryAllUserRaffleCount(String userId, Long strategyId) {
        // 1.首先根据策略id查询出活动id
        Long activityId = raffleActivityDao.queryActivityIdByStrategyId(strategyId);

        // 2.根据活动id和用户id查询出用户总次数账户
        RaffleActivityAccount raffleActivityAccountReq = new RaffleActivityAccount();
        raffleActivityAccountReq.setUserId(userId);
        raffleActivityAccountReq.setActivityId(activityId);
        RaffleActivityAccount raffleActivityAccount = raffleActivityAccountDao.queryActivityAccountByUserId(raffleActivityAccountReq);

        // 3.总次数 - 剩余次数 = 使用次数
        return raffleActivityAccount.getTotalCount() - raffleActivityAccount.getTotalCountSurplus();
    }

    @Override
    public Map<String, Integer> queryAwardRuleLockCountByRuleIds(String[] treeIds) {
        if (treeIds == null || treeIds.length == 0) return new HashMap<>();
        // 1.根据决策树id数组批量查询决策树结点信息
        List<RuleTreeNode> ruleTreeNodes = ruleTreeNodeDao.queryRuleLocksByRuleIds(treeIds);

        // 2.将结点信息组装成map
        Map<String, Integer> resultMap = new HashMap<>();
        for (RuleTreeNode ruleTreeNode : ruleTreeNodes) {
            resultMap.put(ruleTreeNode.getTreeId(), Integer.valueOf(ruleTreeNode.getRuleValue()));
        }
        return resultMap;
    }

    @Override
    public List<RuleWeightVO> queryAwardRuleWeight(Long strategyId, String userId) {

        // 1.查询对应的策略值
        List<RuleWeightVO> ruleWeightVOS = new ArrayList<RuleWeightVO>();
        StrategyRule strategyRuleReq = new StrategyRule();
        strategyRuleReq.setStrategyId(strategyId);
        strategyRuleReq.setRuleModel(DefaultChainFactory.LogicModel.RULE_WEIGHT.getCode());
        String ruleValue = strategyRuleDao.queryStrategyRuleValue(strategyRuleReq);

        // 2.解析权重规则值【原值格式为：4000:102,103,104,105 5000:102,103,104,105,106,107，空格分割每个权重组，冒号分割权重值和权重奖品】
        StrategyRuleEntity strategyRule = new StrategyRuleEntity();
        strategyRule.setRuleModel(DefaultChainFactory.LogicModel.RULE_WEIGHT.getCode());
        strategyRule.setRuleValue(ruleValue);
        Map<String, List<Integer>> ruleWeightValues = strategyRule.getRuleWeightValues();
        List<RuleWeightVO.Award> awardList = new ArrayList<>();

        // 3.遍历权重规则组装配置信息
        for (String ruleWeightKey : ruleWeightValues.keySet()) {
            Long weightValue = Long.valueOf(ruleWeightKey.split(Constants.COLON)[0]);

            // 4.1 根据权重值找出用户在对应权重策略的抽奖次数
            String counterCacheKey = Constants.RedisKey.STRATEGY_RULE_WEIGHT_COUNTER_KEY + Constants.UNDERLINE + weightValue
                    + Constants.UNDERLINE + userId + Constants.UNDERLINE + strategyId;
            Long useCount = redisService.getAtomicLong(counterCacheKey);

            // 4.2 根据奖品ID查询出奖品的详细信息【先查缓存 TODO 后续可以添加活动的结束时间为缓存过期时间】
            String awardsCacheKey = Constants.RedisKey.STRATEGY_RULE_WEIGHT_AWARDS_KEY + Constants.UNDERLINE + weightValue
                    + Constants.UNDERLINE + userId + Constants.UNDERLINE + strategyId;
            List<RuleWeightVO.Award> awards = redisService.getValue(awardsCacheKey);
            List<Integer> awardIds = ruleWeightValues.get(ruleWeightKey);

            // 4.3缓存不存在就查库
            if(awards == null || awards.isEmpty()){
                List<StrategyAward> strategyAwards = strategyAwardDao.queryStrategyAwardListByIds(awardIds, strategyId);
                awards = strategyAwards.stream().map(award -> RuleWeightVO.Award.builder()
                        .awardId(award.getAwardId())
                        .awardTitle(award.getAwardTitle())
                        .build()).collect(Collectors.toList());
                redisService.setValue(awardsCacheKey, awards);
            }

            // 4.4组装信息
            ruleWeightVOS.add(RuleWeightVO.builder()
                    .awardList(awards)
                    .weight(Integer.valueOf(ruleWeightKey.split(Constants.COLON)[0]))
                    .awardIds(awardIds)
                    .userWeightUseCount(useCount)
                    .ruleValue(ruleValue)
                    .build());
        }

        // 5.根据权重值排序，方便前端展示
        ruleWeightVOS.sort(Comparator.comparingInt(RuleWeightVO::getWeight));

        return ruleWeightVOS;
    }

    @Override
    public Long computeRuleWeightCounter(Map<Long, String> analyticalValueGroup, String userid, Long strategyId) {

        // 1.找出最优权重
        long priorWeight = -1L;
        long priorCount = 0;
        for (Long weight : analyticalValueGroup.keySet()) {
            // 1.1.计数器key
            String counterCacheKey = Constants.RedisKey.STRATEGY_RULE_WEIGHT_COUNTER_KEY + Constants.UNDERLINE + weight
                    + Constants.UNDERLINE + userid + Constants.UNDERLINE + strategyId;

            // 1.2.原子递增
            long atomicLong = redisService.incr(counterCacheKey);

            // 1.3.如果满足权重值，记录最优权重(我们这里优先级就是权重值，权重值越大，一般奖励越珍贵，就像原神的大保底比小保底更优先)
            if (atomicLong >= weight && weight > priorWeight) {
                priorWeight = weight;
                priorCount = atomicLong;
            }
        }

        // 2.清空最优权重的计数
        if (priorWeight != -1) {
            String counterCacheKey = Constants.RedisKey.STRATEGY_RULE_WEIGHT_COUNTER_KEY + Constants.UNDERLINE + priorWeight
                    + Constants.UNDERLINE + userid + Constants.UNDERLINE + strategyId;
            redisService.setAtomicLong(counterCacheKey, priorCount - priorWeight);
            return priorWeight;
        }

        return null;
    }


}
