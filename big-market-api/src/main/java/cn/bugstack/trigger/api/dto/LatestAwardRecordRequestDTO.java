package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 活动最新获奖记录 请求DTO
 * @create 2024/05/15 10:29:29
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LatestAwardRecordRequestDTO {
    /**
     * 活动ID
     */
    private Long activityId;
    /**
     * 查询数量
     */
    private Integer size;
}
