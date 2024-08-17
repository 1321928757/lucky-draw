package cn.bugstack.domain.award.service.distribute;

import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 分发奖品接口
 * @create 2024/07/27 16:05:25
 */
public interface IDistributeAward {
    /**
    * @description 分发奖品
    * @param distributeAwardEntity 分发奖品实体对象
    * @return
    * @date 2024/08/10 14:37:06
    */

    void giveOutPrizes(DistributeAwardEntity distributeAwardEntity);

}