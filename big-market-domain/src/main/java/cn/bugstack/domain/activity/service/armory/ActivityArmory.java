package cn.bugstack.domain.activity.service.armory;

import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.types.common.Constants;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 
 * @create 2024/03/31 14:04:12
 */
@Component
public class ActivityArmory implements IActivityArmory, IActivityDispatch{
    @Resource
    private IActivityRepository activityRepository;
    @Override
    public Boolean assembleActivitySkuStock(Long sku) {
        // 1.查询出对应的活动信息
        ActivitySkuEntity activitySkuEntity = activityRepository.queryActivitySku(sku);
        // 2.装配库存
        cacheActivityStock(sku, activitySkuEntity.getStockCount());

        // 3.顺便预热一下活动信息和sku次数信息【查询时会加入缓存】
        activityRepository.queryRaffleActivityByActivityId(activitySkuEntity.getActivityId());
        activityRepository.queryRaffleActivityCountByActivityCountId(activitySkuEntity.getActivityCountId());

        return null;
    }


    private void cacheActivityStock(Long sku, Integer stockCount) {
        // 1.拼接key
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;

        activityRepository.cacheActivityStock(cacheKey, stockCount);
    }

    @Override
    public boolean subtractionActivitySkuStock(Long sku, Date endDateTime) {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        return activityRepository.subtractionActivitySkuStock(sku, cacheKey, endDateTime);
    }

    @Override
    public Boolean skuStockAssembleCheck(Long sku) {
        String cacheKey = Constants.RedisKey.ACTIVITY_SKU_STOCK_COUNT_KEY + sku;
        return activityRepository.skuStockAssembleCheck(cacheKey);
    }
}
