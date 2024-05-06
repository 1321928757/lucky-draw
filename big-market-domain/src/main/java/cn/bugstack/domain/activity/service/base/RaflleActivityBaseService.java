package cn.bugstack.domain.activity.service.base;

import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.IRaffleActivityBaseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 活动基础信息服务类
 * @create 2024/05/06 11:23:28
 */
@Service
public class RaflleActivityBaseService implements IRaffleActivityBaseService {
    @Resource
    private IActivityRepository repository;
    @Override
    public ActivityEntity queryActivityById(Long activityId) {
        return repository.queryRaffleActivityByActivityId(activityId);
    }
}
