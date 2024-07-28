package cn.bugstack.infrastructure.persistent.dao.mysql;

import cn.bugstack.infrastructure.persistent.po.Award;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 奖品表DAO
 * @create 2023-12-16 13:23
 */
@Mapper
public interface IAwardDao {
    /**
    * @description 根据id查询奖品配置
    * @param awardId 奖品id
    * @return 奖品配置
    * @date 2023-12-16 13:23
    */
    String queryAwardConfigById(Integer awardId);

    /**
    * @description 根据id查询奖品key
    * @param awardId 奖品id
    * @return 奖品key
    * @date 2024/07/28 19:39:07
    */
    String queryAwardKeyById(Integer awardId);
}
