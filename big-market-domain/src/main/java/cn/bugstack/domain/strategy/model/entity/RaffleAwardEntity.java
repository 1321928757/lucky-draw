package cn.bugstack.domain.strategy.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖奖品实体
 * @create 2024-01-06 09:20
 */
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class RaffleAwardEntity {

    /** 奖品ID */
    private Integer awardId;
    /** 奖品配置信息 */
    private String awardConfig;
    /** 奖品的信息标题 */
    private String awardTitle;
    /** 奖品的图片 */
    private String awardImage;
    /** 奖品顺序号 */
    private Integer sort;

}
