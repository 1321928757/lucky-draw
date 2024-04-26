package cn.bugstack.domain.award.repository;

import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;

/**
 * @author Luckysj @刘仕杰
 * @description 奖品仓储服务接口
 * @create 2024/04/13 21:12:12
 */
public interface IAwardRepository {
    /**
    * @description 保存用户中奖学习
    * @param userAwardRecordAggregate 用户中奖记录聚合对象
    * @return
    * @date 2024/04/13 21:12:12
    */
    void saveUserAwardRecord(UserAwardRecordAggregate userAwardRecordAggregate);
}
