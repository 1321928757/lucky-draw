package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 活动最新获奖记录 响应DTO
 * @create 2024/05/15 10:29:29
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LatestAwardRecordResponseDTO {
    /**
     * 脱敏后的用户ID
     */
    private String userId;
    /**
     * 奖品名称
     */
    private String awardTitle;
    /**
     * 中奖时间
     */
    private Date awardTime;
}
