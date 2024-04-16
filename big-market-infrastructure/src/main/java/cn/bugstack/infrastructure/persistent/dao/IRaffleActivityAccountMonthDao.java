package cn.bugstack.infrastructure.persistent.dao;

import cn.bugstack.infrastructure.persistent.po.RaffleActivityAccountMonth;
import cn.bugstack.middleware.db.router.annotation.DBRouter;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动账户月记录表Dao
 * @create 2024/04/07 09:25:15
 */
@Mapper
public interface IRaffleActivityAccountMonthDao {
    // 根据用户id和活动id查询对应月次数账户
    @DBRouter
    RaffleActivityAccountMonth queryActivityAccountMonthByUserId(RaffleActivityAccountMonth activityAccountMonth);
    // 扣减月次数账户额度
    int updateActivityAccountMonthSubtractionQuota(RaffleActivityAccountMonth raffleActivityAccountMonth);

    // 保存月次数账户额度记录
    void insertActivityAccountMonth(RaffleActivityAccountMonth raffleActivityAccountMonth);
}
