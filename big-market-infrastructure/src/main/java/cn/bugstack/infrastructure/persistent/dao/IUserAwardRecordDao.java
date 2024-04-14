package cn.bugstack.infrastructure.persistent.dao;

import cn.bugstack.infrastructure.persistent.po.UserAwardRecord;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;
/**
 * @author Luckysj @刘仕杰
 * @description 用户获奖记录表Dao
 * @create 2024/04/07 09:40:05
 */
@Mapper
@DBRouterStrategy(splitTable = true) // 用户中奖记录开启分库分表
public interface IUserAwardRecordDao {

    void insert(UserAwardRecord userAwardRecord);
}
