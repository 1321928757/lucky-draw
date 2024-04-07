package cn.bugstack.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 用户次数账户日记录，总库存表只是为了方便统计，每天都会生成一个日记录，抽奖就会扣减日记录的次数
 * @create 2024/04/07 09:15:02
 */
@Data
public class RaffleActivityAccountDay {
    /**
     * 自增ID
     */
    private Long id;

    /**
     * 用户ID
     */
    private String userId;

    /**
     * 活动ID
     */
    private Long activityId;

    /**
     * 记录日期（yyyy-mm-dd）
     */
    private String day;

    /**
     * 日次数
     */
    private Integer dayCount;

    /**
     * 日次数-剩余
     */
    private Integer dayCountSurplus;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}
