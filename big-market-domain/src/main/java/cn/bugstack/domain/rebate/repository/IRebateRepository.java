package cn.bugstack.domain.rebate.repository;

import cn.bugstack.domain.rebate.model.aggregate.BehaviorRebateAggregate;
import cn.bugstack.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import cn.bugstack.domain.rebate.model.valobj.BehaviorTypeVO;
import cn.bugstack.domain.rebate.model.valobj.DailyBehaviorRebateVO;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 返利仓储服务接口
 * @create 2024/05/04 15:56:29
 */
public interface IRebateRepository {
    // 根据返利行为查询对应的返利配置
    List<DailyBehaviorRebateVO> queryDailyBehaviorRebateConfig(BehaviorTypeVO behaviorTypeVO);

    // 保存用户返利聚合对象
    void saveUserRebateRecord(String userId, List<BehaviorRebateAggregate> behaviorRebateAggregates);

    // 根据业务ID查询返利订单
    List<BehaviorRebateOrderEntity> queryOrderByOutBusinessNo(String userId, String outBusinessNo);
}
