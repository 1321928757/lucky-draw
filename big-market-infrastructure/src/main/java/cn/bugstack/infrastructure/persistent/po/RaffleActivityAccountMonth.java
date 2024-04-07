package cn.bugstack.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 用户次数账户月记录，总库存表只是为了方便统计，每个月都会生成一个月记录，抽奖就会扣减月记录的次数
 * @create 2024/04/07 09:23:47
 */
@Data
public class RaffleActivityAccountMonth {
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

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;
}
