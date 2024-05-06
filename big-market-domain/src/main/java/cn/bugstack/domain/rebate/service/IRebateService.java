package cn.bugstack.domain.rebate.service;

import cn.bugstack.domain.rebate.model.entity.BehaviorEntity;
import cn.bugstack.domain.rebate.model.entity.BehaviorRebateOrderEntity;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 行为返利服务接口
 * @create 2024/05/04 15:44:12
 */
public interface IRebateService {
    /**
     * 创建行为动作的入账订单
     *
     * @param behaviorEntity 行为实体对象
     * @return 订单ID
     */
    List<String> createOrder(BehaviorEntity behaviorEntity);

    /**
     * 根据业务ID查询返利订单
     *
     * @param userId 用户id
     * @param outBusinessNo 订单业务id
     * @return 订单ID
     */
    List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo);
}
