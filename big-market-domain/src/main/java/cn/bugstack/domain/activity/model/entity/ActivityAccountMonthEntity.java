package cn.bugstack.domain.activity.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 活动月次数账户实体对象
 * @create 2024/04/09 16:23:03
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActivityAccountMonthEntity {

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;

    /**
     * 记录日期（yyyy-mm）
     */
    private String month;

    /**
     * 月次数
     */
    private Integer monthCount;

    /**
     * 月次数-剩余
     */
    private Integer monthCountSurplus;

}
