package cn.bugstack.infrastructure.persistent.doc;

import com.alibaba.fastjson2.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @author Luckysj @刘仕杰
 * @description 用户中奖记录文档【ES】，作为聚合展示
 * @create 2024/05/14 15:15:43
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAwardRecordDoc {
    /**
     * 用户ID
     */
    @JsonProperty("user_id")
    private String userId;
    /**
     * 活动ID
     */
    @JsonProperty("activity_id")
    private Long activityId;
    /**
     * 订单ID
     */
    @JsonProperty("order_id")
    private String orderId;
    /**
     * 奖品名称
     */
    @JsonProperty("award_title")
    private String awardTitle;

    /**
     * 中奖时间
     */
    @JsonProperty("award_time")
    @JSONField(format = "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    private Date awardTime;
}
