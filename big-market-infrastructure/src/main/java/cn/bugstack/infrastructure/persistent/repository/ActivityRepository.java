package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.activity.event.ActivitySkuStockZeroMessageEvent;
import cn.bugstack.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import cn.bugstack.domain.activity.model.aggregate.CreateQuotaOrderAggregate;
import cn.bugstack.domain.activity.model.entity.*;
import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.activity.model.valobj.ActivityStateVO;
import cn.bugstack.domain.activity.model.valobj.UserRaffleOrderStateVO;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.infrastructure.event.EventPublisher;
import cn.bugstack.infrastructure.persistent.dao.mysql.*;
import cn.bugstack.infrastructure.persistent.po.*;
import cn.bugstack.infrastructure.persistent.redis.IRedisService;
import cn.bugstack.middleware.db.router.strategy.IDBRouterStrategy;
import cn.bugstack.types.common.Constants;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.redisson.api.RBlockingQueue;
import org.redisson.api.RDelayedQueue;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.support.TransactionTemplate;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * @author Luckysj @刘仕杰
 * @description 活动服务仓储实现
 * @create 2024/03/23 21:46:48
 */
@Slf4j
@Repository
public class ActivityRepository implements IActivityRepository {
    @Resource
    private IRaffleActivitySkuDao raffleActivitySkuDao;

    @Resource
    private IRaffleActivityDao raffleActivityDao;

    @Resource
    private IRaffleActivityOrderDao raffleActivityOrderDao;

    @Resource
    private IRaffleActivityAccountDao raffleActivityAccountDao;

    @Resource
    private IRaffleActivityAccountDayDao raffleActivityAccountDayDao;

    @Resource
    private IRaffleActivityAccountMonthDao raffleActivityAccountMonthDao;

    @Resource
    private IRaffleActivityCountDao raffleActivityCountDao;

    @Resource
    private IRedisService redisService;

    @Resource
    private IDBRouterStrategy dbRouter;

    @Resource
    private TransactionTemplate transactionTemplate;

    @Resource
    private ActivitySkuStockZeroMessageEvent activitySkuStockZeroMessageEvent;

    @Resource
    private EventPublisher eventPublisher;

    @Resource
    private IUserRaffleOrderDao userRaffleOrderDao;


    @Override
    public ActivitySkuEntity queryActivitySku(Long sku) {

        RaffleActivitySku raffleActivitySku = raffleActivitySkuDao.queryActivitySku(sku);
        if (raffleActivitySku == null) return null;

        return ActivitySkuEntity.builder()
                .sku(raffleActivitySku.getSku())
                .activityId(raffleActivitySku.getActivityId())
                .activityCountId(raffleActivitySku.getActivityCountId())
                .stockCount(raffleActivitySku.getStockCount())
                .stockCountSurplus(raffleActivitySku.getStockCountSurplus())
                .build();
    }

    @Override
    public ActivityEntity queryRaffleActivityByActivityId(Long activityId) {
        // 1.首先从缓存中读取
        String cacheKey = Constants.RedisKey.ACTIVITY_KEY + activityId;
        ActivityEntity activityEntity = redisService.getValue(cacheKey);
        if (activityEntity != null) return activityEntity;

        // 2.缓存不存在，查库
        RaffleActivity raffleActivity = raffleActivityDao.queryRaffleActivityByActivityId(activityId);
        if (raffleActivity == null) return null;
        activityEntity = ActivityEntity.builder()
                .activityId(raffleActivity.getActivityId())
                .activityName(raffleActivity.getActivityName())
                .activityDesc(raffleActivity.getActivityDesc())
                .beginDateTime(raffleActivity.getBeginDateTime())
                .endDateTime(raffleActivity.getEndDateTime())
                .strategyId(raffleActivity.getStrategyId())
                .state(ActivityStateVO.valueOf(raffleActivity.getState()))
                .build();

        // 3.存入缓存
        redisService.setValue(cacheKey, activityEntity);

        return activityEntity;
    }

    @Override
    public ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId) {
        // 1.首先从缓存读取
        String cacheKey = Constants.RedisKey.ACTIVITY_COUNT_KEY + activityCountId;
        ActivityCountEntity activityCountEntity = redisService.getValue(cacheKey);
        if (activityCountEntity != null) return activityCountEntity;
        // 2.缓存不存在，查库
        RaffleActivityCount raffleActivityCount = raffleActivityCountDao.queryRaffleActivityCountByActivityCountId(activityCountId);
        activityCountEntity = ActivityCountEntity.builder()
                .activityCountId(raffleActivityCount.getActivityCountId())
                .totalCount(raffleActivityCount.getTotalCount())
                .dayCount(raffleActivityCount.getDayCount())
                .monthCount(raffleActivityCount.getMonthCount())
                .build();

        // 3.存入缓存
        redisService.setValue(cacheKey, activityCountEntity);

        return activityCountEntity;
    }

    @Override
    public void saveOrder(CreateQuotaOrderAggregate createOrderAggregate) {
        //我们这里创建订单要操作两张表，分别是次数订单表和次数账户表，保存订单并更新账号的次数(如果账号不存在还需要创建)
        try {
            // 1.构建实体对象
            // 1.1订单对象
            ActivityOrderEntity activityOrderEntity = createOrderAggregate.getActivityOrderEntity();
            RaffleActivityOrder raffleActivityOrder = new RaffleActivityOrder();
            raffleActivityOrder.setUserId(activityOrderEntity.getUserId());
            raffleActivityOrder.setSku(activityOrderEntity.getSku());
            raffleActivityOrder.setActivityId(activityOrderEntity.getActivityId());
            raffleActivityOrder.setActivityName(activityOrderEntity.getActivityName());
            raffleActivityOrder.setStrategyId(activityOrderEntity.getStrategyId());
            raffleActivityOrder.setOrderId(activityOrderEntity.getOrderId());
            raffleActivityOrder.setOrderTime(activityOrderEntity.getOrderTime());
            raffleActivityOrder.setTotalCount(activityOrderEntity.getTotalCount());
            raffleActivityOrder.setDayCount(activityOrderEntity.getDayCount());
            raffleActivityOrder.setMonthCount(activityOrderEntity.getMonthCount());
            raffleActivityOrder.setTotalCount(createOrderAggregate.getTotalCount());
            raffleActivityOrder.setDayCount(createOrderAggregate.getDayCount());
            raffleActivityOrder.setMonthCount(createOrderAggregate.getMonthCount());
            raffleActivityOrder.setState(activityOrderEntity.getState().getCode());
            raffleActivityOrder.setOutBusinessNo(activityOrderEntity.getOutBusinessNo());

            // 1.2账户对象-总
            RaffleActivityAccount raffleActivityAccount = new RaffleActivityAccount();
            raffleActivityAccount.setUserId(createOrderAggregate.getUserId());
            raffleActivityAccount.setActivityId(createOrderAggregate.getActivityId());
            raffleActivityAccount.setTotalCount(createOrderAggregate.getTotalCount());
            raffleActivityAccount.setTotalCountSurplus(createOrderAggregate.getTotalCount());
            raffleActivityAccount.setDayCount(createOrderAggregate.getDayCount());
            raffleActivityAccount.setDayCountSurplus(createOrderAggregate.getDayCount());
            raffleActivityAccount.setMonthCount(createOrderAggregate.getMonthCount());
            raffleActivityAccount.setMonthCountSurplus(createOrderAggregate.getMonthCount());

            // 1.3账户对象-月
            RaffleActivityAccountMonth raffleActivityAccountMonth = new RaffleActivityAccountMonth();
            raffleActivityAccountMonth.setUserId(createOrderAggregate.getUserId());
            raffleActivityAccountMonth.setActivityId(createOrderAggregate.getActivityId());
            raffleActivityAccountMonth.setMonthCount(createOrderAggregate.getMonthCount());
            raffleActivityAccountMonth.setMonthCountSurplus(createOrderAggregate.getMonthCount());
            raffleActivityAccountMonth.setMonth(raffleActivityAccountMonth.currentMonth());

            // 1.4账户对象-日
            RaffleActivityAccountDay raffleActivityAccountDay = new RaffleActivityAccountDay();
            raffleActivityAccountDay.setUserId(createOrderAggregate.getUserId());
            raffleActivityAccountDay.setActivityId(createOrderAggregate.getActivityId());
            raffleActivityAccountDay.setDayCount(createOrderAggregate.getDayCount());
            raffleActivityAccountDay.setDayCountSurplus(createOrderAggregate.getDayCount());
            raffleActivityAccountDay.setDay(raffleActivityAccountDay.currentDay());

            // 2.设定路由(保证两表操作在同一库下，这样才能保证事务,如果还是跟之前一样各自通过注解路由，
            dbRouter.doRouter(createOrderAggregate.getUserId());
            // 3.编程式事务
            transactionTemplate.execute(status -> {
                try {
                    // 1. 写入订单
                    raffleActivityOrderDao.insert(raffleActivityOrder);
                    // 2. 更新总次数账户
                    RaffleActivityAccount raffleActivityAccountRes = raffleActivityAccountDao.queryActivityAccountByUserId(raffleActivityAccount);
                    if (null == raffleActivityAccountRes) {
                        raffleActivityAccountDao.insert(raffleActivityAccount);
                    } else {
                        raffleActivityAccountDao.updateAccountQuota(raffleActivityAccount);
                    }
                    // 4.更新月次数账户
                    raffleActivityAccountMonthDao.addAccountQuota(raffleActivityAccountMonth);
                    // 5.更新日次数账户
                    raffleActivityAccountDayDao.addAccountQuota(raffleActivityAccountDay);
                    return 1;
                } catch (DuplicateKeyException e) {
                    status.setRollbackOnly(); //事务回滚
                    log.error("写入订单记录，唯一索引冲突 userId: {} activityId: {} sku: {}", activityOrderEntity.getUserId(), activityOrderEntity.getActivityId(), activityOrderEntity.getSku(), e);
                    throw new AppException(ResponseCode.INDEX_DUP.getCode());
                }
            });
        } finally {
            // 记得清除分库分表路由，防止干扰本次连接的其他请求
            dbRouter.clear();
        }
    }

    @Override
    public void cacheActivityStock(String cacheKey, Integer stockCount) {
        if (redisService.isExists(cacheKey)) return;
        redisService.setAtomicLong(cacheKey, stockCount);
    }

    @Override
    public boolean subtractionActivitySkuStock(Long sku, String cacheKey, Date endDateTime) {
        // 1.使用decr原子操作扣减库存,返回值为扣减后的库存
        long surplus = redisService.decr(cacheKey);
        if (surplus == 0) {
            // 当库存消耗完毕后，发送mq消息，清空堵塞队列和更新数据库
            eventPublisher.publish(activitySkuStockZeroMessageEvent.topic(), activitySkuStockZeroMessageEvent.buildEventMessage(sku));
            return false;
        } else if (surplus < 0) {
            // 恢复库存到0，直接返回false
            redisService.setAtomicLong(cacheKey, 0);
            return false;
        }

        // 2.我们这里需要加锁来预防超卖问题，锁的过期时间为活动结束时间 + 延迟一段时间，这样在活动结束后会自动释放锁
        String lockKey = cacheKey + Constants.UNDERLINE + surplus;
        // 计算锁存活时间(活动结束时间 + 1天 - 当前时间)
        Long expiresMills = endDateTime.getTime() + TimeUnit.DAYS.toMillis(1) - System.currentTimeMillis();
        Boolean lock = redisService.setNx(lockKey, expiresMills, TimeUnit.MILLISECONDS);
        if (!lock) log.warn("活动SKU次数库存上锁失败，SKU:{}，库存数:{}", sku, surplus);

        return lock; //加锁成功即说明本次扣减的库存是有效的
    }

    @Override
    public void skuCountStockConsumeSendQueue(ActivitySkuStockKeyVO activitySkuStockKeyVO) {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_COUNT_QUERY_KEY;
        RBlockingQueue<ActivitySkuStockKeyVO> blockingQueue = redisService.getBlockingQueue(cacheKey);
        RDelayedQueue<ActivitySkuStockKeyVO> delayedQueue = redisService.getDelayedQueue(blockingQueue);
        delayedQueue.offer(activitySkuStockKeyVO, 3, TimeUnit.SECONDS);
    }

    @Override
    public ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_COUNT_QUERY_KEY;
        RBlockingQueue<ActivitySkuStockKeyVO> blockingQueue = redisService.getBlockingQueue(cacheKey);
        return blockingQueue.poll();
    }

    @Override
    public void clearQueueValue() {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_COUNT_QUERY_KEY;
        redisService.getBlockingQueue(cacheKey).clear();
    }

    @Override
    public void updateActivitySkuStock(Long sku) {
        raffleActivitySkuDao.updateActivitySkuStock(sku);
    }

    @Override
    public void clearActivitySkuStock(Long sku) {
        raffleActivitySkuDao.clearActivitySkuStock(sku);
    }

    @Override
    public Boolean skuStockAssembleCheck(String cacheKey) {
        return redisService.isExists(cacheKey);
    }

    @Override
    public UserRaffleOrderEntity queryNoUsedRaffleOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity) {
        // 1.查询记录
        UserRaffleOrder userRaffleOrderReq = new UserRaffleOrder();
        userRaffleOrderReq.setUserId(partakeRaffleActivityEntity.getUserId());
        userRaffleOrderReq.setActivityId(partakeRaffleActivityEntity.getActivityId());
        UserRaffleOrder userRaffleOrderRes = userRaffleOrderDao.queryNoUsedRaffleOrder(userRaffleOrderReq);
        if (userRaffleOrderRes == null) return null;

        // 2.封装数据
        UserRaffleOrderEntity userRaffleOrderEntity = new UserRaffleOrderEntity();
        userRaffleOrderEntity.setUserId(userRaffleOrderRes.getUserId());
        userRaffleOrderEntity.setActivityId(userRaffleOrderRes.getActivityId());
        userRaffleOrderEntity.setActivityName(userRaffleOrderRes.getActivityName());
        userRaffleOrderEntity.setStrategyId(userRaffleOrderRes.getStrategyId());
        userRaffleOrderEntity.setOrderId(userRaffleOrderRes.getOrderId());
        userRaffleOrderEntity.setOrderTime(userRaffleOrderRes.getOrderTime());
        userRaffleOrderEntity.setOrderState(UserRaffleOrderStateVO.valueOf(userRaffleOrderRes.getOrderState()));
        return userRaffleOrderEntity;
    }

    @Override
    public void saveCreatePartakeOrderAggregate(CreatePartakeOrderAggregate createPartakeOrderAggregate) {
        try {
            // 1.从参与活动聚合对象中提取各类数据对象
            String userId = createPartakeOrderAggregate.getUserId();
            Long activityId = createPartakeOrderAggregate.getActivityId();
            ActivityAccountEntity activityAccountEntity = createPartakeOrderAggregate.getActivityAccountEntity();
            ActivityAccountDayEntity activityAccountDayEntity = createPartakeOrderAggregate.getActivityAccountDayEntity();
            ActivityAccountMonthEntity activityAccountMonthEntity = createPartakeOrderAggregate.getActivityAccountMonthEntity();
            UserRaffleOrderEntity userRaffleOrderEntity = createPartakeOrderAggregate.getUserRaffleOrderEntity();

            // 2.开启数据库路由，让后面事务下的操作都走统一的路由
            dbRouter.doRouter(userId);

            // 3.开启编程式事务
            transactionTemplate.execute((status) -> {
                try {
                    // 1.更新总次数额度账户
                    RaffleActivityAccount raffleActivityAccount = new RaffleActivityAccount();
                    raffleActivityAccount.setUserId(userId);
                    raffleActivityAccount.setActivityId(activityId);
                    int totalUpdateState = raffleActivityAccountDao.updateActivityAccountSubtractionQuota(raffleActivityAccount);

                    if (totalUpdateState == 0) {
                        status.setRollbackOnly();
                        log.warn("写入创建参与活动记录，更新总账户额度不足，异常 userId: {} activityId: {}", userId, activityId);
                        throw new AppException(ResponseCode.ACCOUNT_TOTAL_QUOTA_ERROR.getCode(), ResponseCode.ACCOUNT_TOTAL_QUOTA_ERROR.getInfo());

                    }
                    // 2.更新月次数额度账户
                    if (createPartakeOrderAggregate.isExistAccountMonth()) {
                        // 2.1 存在月次数额度账户，扣减额度
                        RaffleActivityAccountMonth raffleActivityAccountMonth = new RaffleActivityAccountMonth();
                        raffleActivityAccountMonth.setUserId(userId);
                        raffleActivityAccountMonth.setActivityId(activityId);
                        raffleActivityAccountMonth.setMonth(activityAccountMonthEntity.getMonth());
                        int monthUpdateState = raffleActivityAccountMonthDao.updateActivityAccountMonthSubtractionQuota(raffleActivityAccountMonth);

                        if (monthUpdateState == 0) {
                            status.setRollbackOnly();
                            log.warn("写入创建参与活动记录，更新月账户额度不足，异常 userId: {} activityId: {}", userId, activityId);
                            throw new AppException(ResponseCode.ACCOUNT_MONTH_QUOTA_ERROR.getCode(), ResponseCode.ACCOUNT_MONTH_QUOTA_ERROR.getInfo());

                        }
                    } else {
                        // 2.1 不存在月次数额度账户，插入扣减次数后的记录
                        raffleActivityAccountMonthDao.insertActivityAccountMonth(RaffleActivityAccountMonth.builder()
                                .userId(activityAccountMonthEntity.getUserId())
                                .activityId(activityAccountMonthEntity.getActivityId())
                                .month(activityAccountMonthEntity.getMonth())
                                .monthCount(activityAccountMonthEntity.getMonthCount())
                                .monthCountSurplus(activityAccountMonthEntity.getMonthCountSurplus() - 1)
                                .build());

                        //  2.2 新创建月账户，则更新总账表中月镜像额度
                        raffleActivityAccountDao.updateActivityAccountMonthSurplusImageQuota(RaffleActivityAccount.builder()
                                .userId(userId)
                                .activityId(activityId)
                                .monthCountSurplus(activityAccountEntity.getMonthCountSurplus())
                                .build());
                    }


                    // 3. 创建或更新日账户，true - 存在则更新，false - 不存在则插入
                    if (createPartakeOrderAggregate.isExistAccountDay()) {
                        // 3.1 存在日次数额度账户，扣减额度
                        int updateDayCount = raffleActivityAccountDayDao.updateActivityAccountDaySubtractionQuota(RaffleActivityAccountDay.builder()
                                .userId(userId)
                                .activityId(activityId)
                                .day(activityAccountDayEntity.getDay())
                                .build());
                        if (1 != updateDayCount) {
                            // 未更新成功则回滚
                            status.setRollbackOnly();
                            log.warn("写入创建参与活动记录，更新日账户额度不足，异常 userId: {} activityId: {} day: {}", userId, activityId, activityAccountDayEntity.getDay());
                            throw new AppException(ResponseCode.ACCOUNT_DAY_QUOTA_ERROR.getCode(), ResponseCode.ACCOUNT_DAY_QUOTA_ERROR.getInfo());
                        }
                    } else {
                        // 3.1 不存在日次数额度账户，插入扣减次数后的记录
                        raffleActivityAccountDayDao.insertActivityAccountDay(RaffleActivityAccountDay.builder()
                                .userId(activityAccountDayEntity.getUserId())
                                .activityId(activityAccountDayEntity.getActivityId())
                                .day(activityAccountDayEntity.getDay())
                                .dayCount(activityAccountDayEntity.getDayCount())
                                .dayCountSurplus(activityAccountDayEntity.getDayCountSurplus() - 1)
                                .build());
                        // 3.2 新创建日账户，则更新总账表中日镜像额度
                        raffleActivityAccountDao.updateActivityAccountDaySurplusImageQuota(RaffleActivityAccount.builder()
                                .userId(userId)
                                .activityId(activityId)
                                .dayCountSurplus(activityAccountEntity.getDayCountSurplus())
                                .build());
                    }
                    // 4.保存参与活动订单
                    UserRaffleOrder userRaffleOrder = new UserRaffleOrder();
                    userRaffleOrder.setUserId(userRaffleOrderEntity.getUserId());
                    userRaffleOrder.setActivityId(userRaffleOrderEntity.getActivityId());
                    userRaffleOrder.setActivityName(userRaffleOrderEntity.getActivityName());
                    userRaffleOrder.setStrategyId(userRaffleOrderEntity.getStrategyId());
                    userRaffleOrder.setOrderId(userRaffleOrderEntity.getOrderId());
                    userRaffleOrder.setOrderTime(userRaffleOrderEntity.getOrderTime());
                    userRaffleOrder.setOrderState(userRaffleOrderEntity.getOrderState().getCode());

                    userRaffleOrderDao.insert(userRaffleOrder);
                } catch (DuplicateKeyException e) {
                    // 回滚事务
                    status.setRollbackOnly();
                    log.error("写入创建参与活动记录，唯一索引冲突 userId: {} activityId: {}", userId, activityId, e);
                    throw new AppException(ResponseCode.INDEX_DUP.getCode(), e);
                }

                return true;
            });
        } finally {
            // 清空数据库路由
            dbRouter.clear();
        }

    }

    @Override
    public ActivityAccountEntity queryActivityAccountByUserId(String userId, Long activityId) {
        // 1.根据用户id和活动id查询对应次数账户
        RaffleActivityAccount activityAccount = new RaffleActivityAccount();
        activityAccount.setActivityId(activityId);
        activityAccount.setUserId(userId);
        RaffleActivityAccount activityAccountEntity = raffleActivityAccountDao.queryActivityAccountByUserId(activityAccount);
        if (activityAccountEntity == null) return null;

        // 2.转换为实体对象返回
        return ActivityAccountEntity.builder()
                .userId(activityAccountEntity.getUserId())
                .activityId(activityAccountEntity.getActivityId())
                .totalCount(activityAccountEntity.getTotalCount())
                .totalCountSurplus(activityAccountEntity.getTotalCountSurplus())
                .dayCount(activityAccountEntity.getDayCount())
                .dayCountSurplus(activityAccountEntity.getDayCountSurplus())
                .monthCount(activityAccountEntity.getMonthCount())
                .monthCountSurplus(activityAccountEntity.getMonthCountSurplus())
                .build();
    }

    @Override
    public ActivityAccountMonthEntity queryActivityAccountMonthByUserId(String userId, Long activityId, String month) {
        // 1.根据用户id和活动id查询对应月次数账户
        RaffleActivityAccountMonth activityAccountMonth = new RaffleActivityAccountMonth();
        activityAccountMonth.setActivityId(activityId);
        activityAccountMonth.setUserId(userId);
        activityAccountMonth.setMonth(month);
        activityAccountMonth = raffleActivityAccountMonthDao.queryActivityAccountMonthByUserId(activityAccountMonth);
        if (activityAccountMonth == null) return null;

        // 2.转换为实体对象返回
        return ActivityAccountMonthEntity.builder()
                .userId(activityAccountMonth.getUserId())
                .activityId(activityAccountMonth.getActivityId())
                .monthCount(activityAccountMonth.getMonthCount())
                .monthCountSurplus(activityAccountMonth.getMonthCountSurplus())
                .month(activityAccountMonth.getMonth())
                .build();
    }

    @Override
    public ActivityAccountDayEntity queryActivityAccountDayByUserId(String userId, Long activityId, String day) {
        // 1.根据用户id和活动id查询对应日次数账户
        RaffleActivityAccountDay activityAccountDay = new RaffleActivityAccountDay();
        activityAccountDay.setActivityId(activityId);
        activityAccountDay.setUserId(userId);
        activityAccountDay.setDay(day);
        activityAccountDay = raffleActivityAccountDayDao.queryActivityAccountDayByUserId(activityAccountDay);
        if (activityAccountDay == null) return null;

        // 2.转换为实体对象返回
        return ActivityAccountDayEntity.builder()
                .userId(activityAccountDay.getUserId())
                .activityId(activityAccountDay.getActivityId())
                .dayCount(activityAccountDay.getDayCount())
                .dayCountSurplus(activityAccountDay.getDayCountSurplus())
                .day(activityAccountDay.getDay())
                .build();
    }

    @Override
    public List<ActivitySkuEntity> queryActivitySkuListByActivityId(Long activityId) {
        // 1.查询数据
        List<RaffleActivitySku> activitySkus = raffleActivitySkuDao.queryActivitySkuListByActivityId(activityId);
        // 2.转换为实体对象
        return activitySkus.stream().map(raffleActivitySku -> ActivitySkuEntity.builder()
                .activityId(raffleActivitySku.getActivityId())
                .sku(raffleActivitySku.getSku())
                .activityCountId(raffleActivitySku.getActivityCountId())
                .stockCount(raffleActivitySku.getStockCount())
                .stockCountSurplus(raffleActivitySku.getStockCountSurplus())
                .build()
        ).collect(Collectors.toList());
    }

    @Override
    public Integer queryRaffleActivityAccountDayPartakeCount(Long activityId, String userId) {
        RaffleActivityAccountDay raffleActivityAccountDay = new RaffleActivityAccountDay();
        raffleActivityAccountDay.setActivityId(activityId);
        raffleActivityAccountDay.setUserId(userId);
        raffleActivityAccountDay.setDay(raffleActivityAccountDay.currentDay());
        Integer count = raffleActivityAccountDayDao.queryRaffleActivityAccountDayPartakeCount(raffleActivityAccountDay);
        return null == count ? 0 : count;
    }

    @Override
    public Integer queryRaffleActivityAccountTotalPartakeCount(Long activityId, String userId) {
        RaffleActivityAccount raffleActivityAccountDay = new RaffleActivityAccount();
        raffleActivityAccountDay.setActivityId(activityId);
        raffleActivityAccountDay.setUserId(userId);
        Integer count = raffleActivityAccountDao.queryRaffleActivityAccountTotalPartakeCount(raffleActivityAccountDay);
        return null == count ? 0 : count;
    }

    @Override
    public ActivityAccountEntity queryActivityAccountEntity(Long activityId, String userId) {
        // 1.查询总账户信息
        RaffleActivityAccount raffleActivityAccount = raffleActivityAccountDao.queryActivityAccountByUserId(RaffleActivityAccount.builder()
                .userId(userId)
                .activityId(activityId)
                .build());
        // 1.1 不存在次数账户，返回0即可
        if (null == raffleActivityAccount) {
            return ActivityAccountEntity.builder()
                    .userId(userId)
                    .activityId(activityId)
                    .totalCount(0)
                    .totalCountSurplus(0)
                    .monthCount(0)
                    .monthCountSurplus(0)
                    .dayCount(0)
                    .dayCountSurplus(0)
                    .build();
        }
        // 2.查询月账户信息
        RaffleActivityAccountMonth raffleActivityAccountMonth = new RaffleActivityAccountMonth();
        raffleActivityAccountMonth.setUserId(userId);
        raffleActivityAccountMonth.setActivityId(activityId);
        raffleActivityAccountMonth.setMonth(raffleActivityAccountMonth.currentMonth());
        raffleActivityAccountMonth = raffleActivityAccountMonthDao.queryActivityAccountMonthByUserId(raffleActivityAccountMonth);
        // 3.查询日账户信息
        RaffleActivityAccountDay raffleActivityAccountDay = new RaffleActivityAccountDay();
        raffleActivityAccountDay.setUserId(userId);
        raffleActivityAccountDay.setActivityId(activityId);
        raffleActivityAccountDay.setDay(raffleActivityAccountDay.currentDay());
        raffleActivityAccountDay = raffleActivityAccountDayDao.queryActivityAccountDayByUserId(raffleActivityAccountDay);
        // 4.拼接各次数信息
        ActivityAccountEntity activityAccountEntity = new ActivityAccountEntity();
        activityAccountEntity.setUserId(userId);
        activityAccountEntity.setActivityId(activityId);
        activityAccountEntity.setTotalCount(raffleActivityAccount.getTotalCount());
        activityAccountEntity.setTotalCountSurplus(raffleActivityAccount.getTotalCountSurplus());
        // 如果日月不存在，则从总次数账户中填充
        if (raffleActivityAccountMonth == null) {
            activityAccountEntity.setMonthCount(raffleActivityAccount.getMonthCount());
            activityAccountEntity.setMonthCountSurplus(raffleActivityAccount.getMonthCount());
        } else {
            activityAccountEntity.setMonthCount(raffleActivityAccountMonth.getMonthCount());
            activityAccountEntity.setMonthCountSurplus(raffleActivityAccountMonth.getMonthCountSurplus());
        }
        if (raffleActivityAccountDay == null) {
            activityAccountEntity.setDayCount(raffleActivityAccount.getDayCount());
            activityAccountEntity.setDayCountSurplus(raffleActivityAccount.getDayCount());
        } else {
            activityAccountEntity.setDayCount(raffleActivityAccountDay.getDayCount());
            activityAccountEntity.setDayCountSurplus(raffleActivityAccountDay.getDayCountSurplus());
        }

        return activityAccountEntity;
    }
}
