package cn.bugstack.trigger.api.dto;

import lombok.Data;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖奖品列表，请求对象
 * @create 2024-02-14 09:46
 */
@Data
public class RaffleAwardListRequestDTO {

    // Todo (这个id我们后续会通过token获取)
    // 用户ID
    private String userId;
    // 活动id
    private Long activityId;


}
