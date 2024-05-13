package cn.bugstack.infrastructure.persistent.dao.mysql;

import cn.bugstack.infrastructure.persistent.po.UserAwardRecord;
import cn.bugstack.middleware.db.router.annotation.DBRouter;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 用户获奖记录表Dao
 * @create 2024/04/07 09:40:05
 */
@Mapper
@DBRouterStrategy(splitTable = true) // 用户中奖记录开启分库分表
public interface IUserAwardRecordDao {

    void insert(UserAwardRecord userAwardRecord);

    // 分页查询用户的获奖记录
    List<UserAwardRecord> pageUserAwardRecord(@Param("page") int page,@Param("pageSize") int pageSize,@Param("userId") String userId);
    // 查询用户的所有获奖记录数
    int queryTotalNumberUserAwardRecord(String userId);
}
