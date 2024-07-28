package cn.bugstack.infrastructure.persistent.dao.mysql;


import cn.bugstack.infrastructure.persistent.po.UserCreditAccount;
import cn.bugstack.middleware.db.router.annotation.DBRouterStrategy;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Luckysj @刘仕杰
 * @description 用户积分账户Dao
 * @create 2024/07/27 21:43:59
 */
@Mapper
@DBRouterStrategy(splitTable = false)
public interface IUserCreditAccountDao {
    /**
    * @description 新增积分账户记录
    * @param userCreditAccount 新增的积分账号记录
    * @return
    * @date 2024/07/27 21:45:07
    */
    void insert(UserCreditAccount userCreditAccount);

    /**
    * @description 更新账户额度
    * @param userCreditAccountReq 更新积分账户记得
    * @return
    * @date 2024/07/27 21:50:13
    */
    int updateAddAmount(UserCreditAccount userCreditAccountReq);
}
