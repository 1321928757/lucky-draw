package cn.bugstack.domain.activity.repository;

import cn.bugstack.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import cn.bugstack.domain.activity.model.aggregate.CreateQuotaOrderAggregate;
import cn.bugstack.domain.activity.model.entity.*;
import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

import java.util.Date;
import java.util.List;

public interface IActivityRepository {
    // 根据SKU号查询活动sku信息
    ActivitySkuEntity queryActivitySku(Long sku);

    // 根据活动id查询活动信息
    ActivityEntity queryRaffleActivityByActivityId(Long activityId);

    // 根据活动参与次数id查询活动参与次数
    ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId);

    // 保存订单
    void saveOrder(CreateQuotaOrderAggregate createOrderAggregate);

    // 缓存活动sku库存数据
    void cacheActivityStock(String cacheKey, Integer stockCount);

    // 扣减sku库存数据(缓存)
    boolean subtractionActivitySkuStock(Long sku, String cacheKey, Date endDateTime);


    // 写入活动sku库存消费队列
    void skuCountStockConsumeSendQueue(ActivitySkuStockKeyVO activitySkuStockKeyVO);

    // 获取活动sku库存消费队列
    ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException;

    // 清空sku库存更新消费队列
    void clearQueueValue();

    // 扣减sku库存数据(数据库)
    void updateActivitySkuStock(Long sku);

    // 清空sku库存数据(数据库)
    void clearActivitySkuStock(Long sku);

    // 检查对应sku的库存数据是否已经装配
    Boolean skuStockAssembleCheck(String cacheKey);

    // 查询未使用的的活动抽奖订单
    UserRaffleOrderEntity queryNoUsedRaffleOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity);

    void saveCreatePartakeOrderAggregate(CreatePartakeOrderAggregate createPartakeOrderAggregate);

    // 根据id查询次数账户
    ActivityAccountEntity queryActivityAccountByUserId(String userId, Long activityId);

    // 根据id查询月次数账户
    ActivityAccountMonthEntity queryActivityAccountMonthByUserId(String userId, Long activityId, String month);

    // 根据id查询日次数账户
    ActivityAccountDayEntity queryActivityAccountDayByUserId(String userId, Long activityId, String day);

    List<ActivitySkuEntity> queryActivitySkuListByActivityId(Long activityId);
}
