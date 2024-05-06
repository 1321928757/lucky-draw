package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 活动基础信息响应DTO
 * @create 2024/05/06 11:12:57
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActivityBaseResponseDTO {
    /**
     * 活动ID
     */
    private Long activityId;

    /**
     * 活动名称
     */
    private String activityName;

    /**
     * 活动描述
     */
    private String activityDesc;

    /**
     * 开始时间
     */
    private Date beginDateTime;

    /**
     * 结束时间
     */
    private Date endDateTime;

}
