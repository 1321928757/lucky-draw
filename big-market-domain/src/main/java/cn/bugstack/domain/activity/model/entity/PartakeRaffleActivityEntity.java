package cn.bugstack.domain.activity.model.entity;

import lombok.Data;

/**
 * @author Luckysj @刘仕杰
 * @description 参与抽奖活动实体对象
 * @create 2024/04/09 15:50:06
 */
@Data
public class PartakeRaffleActivityEntity {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;

}
