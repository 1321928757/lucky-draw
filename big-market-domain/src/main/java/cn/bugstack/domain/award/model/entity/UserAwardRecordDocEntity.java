package cn.bugstack.domain.award.model.entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 中奖记录文档 实体对象
 * @create 2024/05/14 19:55:56
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAwardRecordDocEntity {
    /**
     * 用户ID
     */
    private String userId;
    /**
     * 活动ID
     */
    private Long activityId;
    /**
     * 订单ID
     */
    private String orderId;
    /**
     * 奖品名称
     */
    private String awardTitle;

    /**
     * 中奖时间
     */
    private Date awardTime;
}
