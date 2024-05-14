package cn.bugstack.domain.award.repository;

import cn.bugstack.domain.award.model.aggregate.UserAwardRecordAggregate;
import cn.bugstack.domain.award.model.entity.UserAwardRecordDocEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.types.model.PageData;

import java.io.IOException;
import java.util.List;

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

    /**
    * @description 批量查询最新获奖记录
    * @param activityId 活动id
    * @param count 查询数量
    * @return 获奖数据数组 UserAwardRecordEntity
    * @date 2024/05/07 13:42:43
    */
    List<UserAwardRecordEntity> queryLastestAwardingRecord(Long activityId ,int count);

    /**
    * @description 分页查询自己的获奖记录
    * @param page 当前页
    * @param pageSize 页码大小
    * @param userId 用户ID
    * @return
    * @date 2024/05/07 15:19:12
    */
    PageData<UserAwardRecordEntity> queryUserAwardingRecord(int page, int pageSize, String userId);

    /**
    * @description 保存用户中奖记录文档
    * @param userAwardRecordDoc 用户中奖记录
    * @return
    * @date 2024/05/14 19:59:05
    */
    void saveUserAwardRecordDoc(UserAwardRecordDocEntity userAwardRecordDoc) throws IOException;
}
