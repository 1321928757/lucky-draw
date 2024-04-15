package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 参与活动抽奖，响应对象
 * @create 2024/04/15 20:50:35
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ActivityDrawResponseDTO {
    // 奖品ID
    private Integer awardId;
    // 奖品标题
    private String awardTitle;
    // 排序编号【策略奖品配置的奖品顺序编号】
    private Integer awardIndex;
}
