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

    /**
    * @description 插入中奖记录
    * @param userAwardRecord 中奖记录
    * @return
    * @date 2024/07/28 16:35:19
    */
    void insert(UserAwardRecord userAwardRecord);

    /**
    * @description 分页查询用户的获奖记录
    * @param page 当前页
    * @param pageSize 页大小
    * @param userId 用户id
    * @return 获奖记录
    * @date 2024/07/28 16:35:44
    */
    List<UserAwardRecord> pageUserAwardRecord(@Param("page") int page,@Param("pageSize") int pageSize,@Param("userId") String userId);

    /**
    * @description 查询用户的所有获奖记录数
    * @param userId 用户id
    * @return 获奖记录数
    * @date 2024/07/28 16:36:36
    */
    int queryTotalNumberUserAwardRecord(String userId);

    /**
    * @description 更新获奖记录的状态为完成
    * @param awardRecordUpdateReq 待更新的获奖记录
    * @return
    * @date 2024/07/28 16:37:05
    */
    int updateRecordCompleteStatus(UserAwardRecord awardRecordUpdateReq);
}
