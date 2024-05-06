package cn.bugstack.domain.activity.service;

import cn.bugstack.domain.activity.model.entity.ActivityEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 活动基础信息服务接口
 * @create 2024/05/06 11:23:58
 */
public interface IRaffleActivityBaseService {
    ActivityEntity queryActivityById(Long activityId);
}
