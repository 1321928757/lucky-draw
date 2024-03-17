package cn.bugstack.domain.activity.repository;

import cn.bugstack.domain.activity.model.entity.ActivityCountEntity;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.ActivitySkuEntity;

public interface IActivityRepository {
    // 根据SKU号查询活动sku信息
    ActivitySkuEntity queryActivitySku(Long sku);

    // 根据活动id查询活动信息
    ActivityEntity queryRaffleActivityByActivityId(Long activityId);

    // 根据活动参与次数id查询活动参与次数
    ActivityCountEntity queryRaffleActivityCountByActivityCountId(Long activityCountId);
}
