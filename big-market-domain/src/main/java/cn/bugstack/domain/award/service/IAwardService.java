package cn.bugstack.domain.award.service;

import cn.bugstack.domain.award.model.entity.UserAwardRecordDocEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.types.model.PageData;

import java.io.IOException;
import java.util.List;

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


    /**
    * @description 批量查询最新的获奖记录(前端展示用)
    * * @param count 查询数量
    * @return 抽奖记录数组
    * @date 2024/05/07 13:41:26
    */
    List<UserAwardRecordEntity> queryLastestAwardingRecord(Long activityId, int count) throws IOException;

    /**
    * @description 分页查询自己
    * @param
    * @return
    * @date 2024/05/07 14:52:43
    */
    PageData<UserAwardRecordEntity> queryUserAwardingRecord(int page, int pageSize, String userId);

    /**
    * @description 保存用户中奖记录文档
    * @param
    * @return
    * @date 2024/05/14 19:58:07
    */
    void saveUserAwardRecordDoc(UserAwardRecordDocEntity userAwardRecordDoc) throws IOException;
}
