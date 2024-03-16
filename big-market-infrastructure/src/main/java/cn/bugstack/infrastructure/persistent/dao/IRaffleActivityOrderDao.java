package cn.bugstack.infrastructure.persistent.dao;

import cn.bugstack.infrastructure.persistent.po.RaffleActivityOrder;
import cn.bugstack.middleware.db.router.annotation.DBRouter;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动单Dao
 * @create 2024/03/14 14:48:15
 */
@Mapper
@DBRouterStrategy(splitTable = true) // 开启分库分表路由，splitTable参数为true就代表开启分库
public interface IRaffleActivityOrderDao {


    @DBRouter(key = "userId") //DBRouter注解指定哪些方法需要走分表，key就是路由关键字
    void insert(RaffleActivityOrder raffleActivityOrder);

    @DBRouter
    List<RaffleActivityOrder> queryRaffleActivityOrderByUserId(String userId);

}
