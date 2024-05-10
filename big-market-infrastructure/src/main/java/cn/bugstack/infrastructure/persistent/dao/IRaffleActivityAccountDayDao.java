package cn.bugstack.infrastructure.persistent.dao;

import cn.bugstack.infrastructure.persistent.po.RaffleActivityAccountDay;
import cn.bugstack.infrastructure.persistent.po.RaffleActivityAccountMonth;
import cn.bugstack.middleware.db.router.annotation.DBRouter;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动账户日记录表Dao
 * @create 2024/04/07 09:25:01
 */
@Mapper
public interface IRaffleActivityAccountDayDao {

    // 根据用户id和活动id查询对应日次数账户
    @DBRouter
    RaffleActivityAccountDay queryActivityAccountDayByUserId(RaffleActivityAccountDay activityAccountDay);

    // 扣减日次数账户额度
    int updateActivityAccountDaySubtractionQuota(RaffleActivityAccountDay raffleActivityAccountMonth);

    // 插入日次数账户
    void insertActivityAccountDay(RaffleActivityAccountDay build);

    // 根据用户id和活动id查询用户在活动中的抽奖次数
    @DBRouter
    Integer queryRaffleActivityAccountDayPartakeCount(RaffleActivityAccountDay raffleActivityAccountDay);

    // 添加账户额度
    void addAccountQuota(RaffleActivityAccountDay raffleActivityAccountDay);
}
