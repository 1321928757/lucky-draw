package cn.bugstack.domain.activity.service.partake;

import cn.bugstack.domain.activity.model.aggregate.CreatePartakeOrderAggregate;
import cn.bugstack.domain.activity.model.entity.ActivityEntity;
import cn.bugstack.domain.activity.model.entity.PartakeRaffleActivityEntity;
import cn.bugstack.domain.activity.model.entity.UserRaffleOrderEntity;
import cn.bugstack.domain.activity.model.valobj.ActivityStateVO;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.domain.activity.service.IRaffleActivityPartakeService;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;

import javax.annotation.Resource;
import java.util.Date;

@Slf4j
public abstract class AbstractRaffleActivityPartake implements IRaffleActivityPartakeService {

    /** 活动仓储服务*/
    protected final IActivityRepository activityRepository;

    protected AbstractRaffleActivityPartake(IActivityRepository activityRepository) {
        this.activityRepository = activityRepository;
    }

    @Override
    public UserRaffleOrderEntity createOrder(String userid, Long activityId) {
        PartakeRaffleActivityEntity partakeRaffleActivityEntity = new PartakeRaffleActivityEntity();
        partakeRaffleActivityEntity.setUserId(userid);
        partakeRaffleActivityEntity.setActivityId(activityId);
        return createOrder(partakeRaffleActivityEntity);
    }

    /** 定义模板方法*/
    @Override
    public UserRaffleOrderEntity createOrder(PartakeRaffleActivityEntity partakeRaffleActivityEntity) {
        // 1.查询活动基础信息
        String userId = partakeRaffleActivityEntity.getUserId();
        Long activityId = partakeRaffleActivityEntity.getActivityId();
        Date currentDate = new Date();
        ActivityEntity activityEntity = activityRepository.queryRaffleActivityByActivityId(activityId);

        // 2.活动相关校验(较为简单就没用责任链了)
        // 2.1.活动状态校验
        if(!ActivityStateVO.open.equals(activityEntity.getState())){
            throw new AppException(ResponseCode.ACTIVITY_NO_OPEN.getCode(), ResponseCode.ACTIVITY_NO_OPEN.getInfo());
        }
        // 2.2 活动日期校验
        System.out.println(currentDate.after(activityEntity.getEndDateTime()));
        System.out.println(currentDate.before(activityEntity.getBeginDateTime()));
        if(currentDate.before(activityEntity.getBeginDateTime()) || currentDate.after(activityEntity.getEndDateTime())){
            throw new AppException(ResponseCode.ACTIVITY_NOT_TIME.getCode(), ResponseCode.ACTIVITY_NOT_TIME.getInfo());
        }

        // 3.查询是否存在未使用的活动参与抽奖订单
        UserRaffleOrderEntity userRaffleOrderEntity = activityRepository.queryNoUsedRaffleOrder(partakeRaffleActivityEntity);
        if(userRaffleOrderEntity !=  null){
            log.info("存在未使用的活动参与抽奖订单 userId:{}, activityId:{}, userRaffleOrderEntity:{}", userId, activityId, userRaffleOrderEntity.toString());
            return userRaffleOrderEntity;
        }

        // 4.账户额度校验 & 返回账户构建对象
        CreatePartakeOrderAggregate createPartakeOrderAggregate = this.doFilterAccount(userId, activityId, currentDate);

        // 5.构建订单
        UserRaffleOrderEntity userRaffleOrder = this.buildUserRaffleOrder(userId, activityId, currentDate);

        // 6。填充订单实体对象
        createPartakeOrderAggregate.setUserRaffleOrderEntity(userRaffleOrder);

        // 7.保存聚合对象(聚合下的事务操作，包括次数扣减，订单创建等操作)
        activityRepository.saveCreatePartakeOrderAggregate(createPartakeOrderAggregate);

        // 8.返回订单信息
        return userRaffleOrder;
    }

    // 构建订单
    protected abstract UserRaffleOrderEntity buildUserRaffleOrder(String userId, Long activityId, Date currentDate);

    // 账户额度校验，封装账户构建对象
    protected abstract CreatePartakeOrderAggregate doFilterAccount(String userId, Long activityId, Date currentDate);
}
