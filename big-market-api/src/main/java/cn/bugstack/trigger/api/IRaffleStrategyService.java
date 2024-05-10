package cn.bugstack.trigger.api;

import cn.bugstack.trigger.api.dto.*;
import cn.bugstack.types.model.Response;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖策略服务接口
 * @create 2024-02-14 09:33
 */
public interface IRaffleStrategyService {

    /**
     * 查询抽奖奖品列表配置
     *
     * @param requestDTO 抽奖奖品列表查询请求参数
     * @return 奖品列表数据
     */
    Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(RaffleAwardListRequestDTO requestDTO, String token);

    /**
     * 查询用户在当前活动策略的抽取权重情况
     *
     * @param activityId 活动id
     * @return 权重情况
     */
    Response<List<RaffleStrategyRuleWeightResponseDTO>> queryRaffleStrategyRuleWeight(Long activityId, String token);

}
