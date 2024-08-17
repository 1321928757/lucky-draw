package cn.bugstack.infrastructure.persistent.dao.mysql;

import cn.bugstack.infrastructure.persistent.po.UserCreditOrder;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Luckysj @刘仕杰
 * @description 用户积分流水单 DAO
 * @create 2024/08/10 15:09:29
 */
@Mapper
@DBRouterStrategy(splitTable = true)
public interface IUserCreditOrderDao {

    void insert(UserCreditOrder userCreditOrderReq);

}
