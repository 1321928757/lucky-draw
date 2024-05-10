package cn.bugstack.trigger.api.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖奖品列表，应答对象
 * @create 2024-02-14 09:43
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleAwardListResponseDTO {

    // 奖品ID
    private Integer awardId;
    // 奖品标题
    private String awardTitle;
    // 奖品副标题【抽奖1次后解锁】
    private String awardSubtitle;
    // 奖品展示图片
    private String awardImage;
    // 排序编号
    private Integer sort;
    // 奖品次数规则
    private Integer awardRuleLockCount;
    // 奖品是否解释
    private Boolean isAwardUnlock;
    // 剩余解锁次数
    private Integer waitUnLockCount;
    // 奖品的中奖概率
    private BigDecimal awardRate;
}
