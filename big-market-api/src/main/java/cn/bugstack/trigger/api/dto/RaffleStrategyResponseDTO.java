package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖策略应答结果
 * @create 2024-02-14 17:26
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleStrategyResponseDTO {

    /**
     * 奖品ID
     */
    private Integer awardId;
    /**
     * 排序编号【策略奖品配置的奖品顺序编号】
     */
    private Integer awardIndex;

}
