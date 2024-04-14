package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 奖品服务接口
 * @create 2024/04/13 21:09:44
 */
public interface IAwardService {

    /**
    * @description 保存用户中奖记录
    * @param userAwardRecordEntity 用户中奖消息实体
    * @date 2024/04/13 21:10:29
    */
    void saveUserAwardRecord(UserAwardRecordEntity userAwardRecordEntity);

}
