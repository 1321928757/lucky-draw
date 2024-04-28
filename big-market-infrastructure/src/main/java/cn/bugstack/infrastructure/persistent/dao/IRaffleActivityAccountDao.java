package cn.bugstack.infrastructure.persistent.dao;

import cn.bugstack.domain.activity.model.entity.ActivityAccountEntity;
import cn.bugstack.infrastructure.persistent.po.RaffleActivityAccount;
import cn.bugstack.infrastructure.persistent.po.RaffleActivityAccountMonth;
import cn.bugstack.middleware.db.router.annotation.DBRouter;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动账户表Dao
 * @create 2024/03/14 14:47:24
 */
@Mapper
public interface IRaffleActivityAccountDao {
    // 为次数账户添加次数
    int updateAccountQuota(RaffleActivityAccount raffleActivityAccount);

    // 插入次数账户记录
    void insert(RaffleActivityAccount raffleActivityAccount);

    // 根据用户id和活动id查询对应总次数账户
    @DBRouter
    RaffleActivityAccount queryActivityAccountByUserId(RaffleActivityAccount activityAccount);

    // 扣减总账户额度
    int updateActivityAccountSubtractionQuota(RaffleActivityAccount raffleActivityAccount);

    // 扣减月次数
    void updateActivityAccountMonthSurplusImageQuota(RaffleActivityAccount raffleActivityAccount);

    // 扣减日次数
    void updateActivityAccountDaySurplusImageQuota(RaffleActivityAccount raffleActivityAccount);

    // 查询用户在对应活动中的总共抽取次数
    @DBRouter
    Integer queryRaffleActivityAccountTotalPartakeCount(RaffleActivityAccount raffleActivityAccountDay);
}
