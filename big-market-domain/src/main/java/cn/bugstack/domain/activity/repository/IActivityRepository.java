package cn.bugstack.domain.activity.repository;

import cn.bugstack.domain.activity.model.aggregate.CreateOrderAggregate;
import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivityOrderEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.model.valobj.ActivitySkuStockKeyVO;
import cn.bugstack.domain.strategy.model.valobj.StrategyAwardStockKeyVO;

import java.util.Date;

public interface IActivityRepository {
    // 根据SKU号查询活动sku信息
    ActivitySkuEntity queryActivitySku(Long sku);

    // 根据活动id查询活动信息
    ActivityEntity queryRaffleActivityByActivityId(Long activityId);

    // 根据活动参与次数id查询活动参与次数
    ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId);

    // 保存订单
    void saveOrder(CreateOrderAggregate createOrderAggregate);

    void cacheActivityStock(String cacheKey, Integer stockCount);

    boolean subtractionActivitySkuStock(Long sku, String cacheKey, Date endDateTime);


    /**
     * 写入活动sku库存消费队列
     * @param activitySkuStockKeyVO 对象值对象
     */
    void skuCountStockConsumeSendQueue(ActivitySkuStockKeyVO activitySkuStockKeyVO);

    /**
     * 获取活动sku库存消费队列
     */
    ActivitySkuStockKeyVO takeQueueValue() throws InterruptedException;
}
