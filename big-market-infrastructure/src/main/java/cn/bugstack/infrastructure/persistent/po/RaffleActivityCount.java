package cn.bugstack.infrastructure.persistent.po;

import lombok.Data;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动次数配置表 持久化对象
 * @create 2024/03/14 14:09:19
 */
@Data
public class RaffleActivityCount {

    /**
     * 自增ID
     */
    private Long id;

    /**
     * 活动次数编号
     */
    private Long activityCountId;

    /**
     * 总次数
     */
    private Integer totalCount;

    /**
     * 日次数
     */
    private Integer dayCount;

    /**
     * 月次数
     */
    private Integer monthCount;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 更新时间
     */
    private Date updateTime;

}


