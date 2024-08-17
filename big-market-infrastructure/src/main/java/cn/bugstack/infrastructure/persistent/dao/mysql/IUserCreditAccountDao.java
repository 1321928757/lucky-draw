package cn.bugstack.infrastructure.persistent.dao.mysql;

import cn.bugstack.infrastructure.persistent.po.UserCreditAccount;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author Luckysj @刘仕杰
 * @description 用户积分账户
 * @create 2024/08/10 15:09:40
 */
@Mapper
public interface IUserCreditAccountDao {
    /**
    * @description 新增积分账户
    * @param userCreditAccountReq 积分账户
    * @return
    * @date 2024/08/10 15:10:42
    */
    void insert(UserCreditAccount userCreditAccountReq);

    /**
    * @description 更新积分额度
    * @param userCreditAccountReq
    * @return
    * @date 2024/08/10 15:11:00
    */
    int updateAddAmount(UserCreditAccount userCreditAccountReq);

    /**
    * @description 查询积分账户
    * @param
    * @return
    * @date 2024/08/10 15:11:18
    */
    UserCreditAccount queryUserCreditAccount(UserCreditAccount userCreditAccountReq);

}
