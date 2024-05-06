package cn.bugstack.trigger.api.dto;

import lombok.Data;

/**
 * @author Luckysj @刘仕杰
 * @description 参与活动抽奖，请求参数
 * @create 2024/04/15 20:50:35
 */
@Data
public class ActivityDrawRequestDTO {

    /**
     * 活动ID
     */
    private Long activityId;
}
