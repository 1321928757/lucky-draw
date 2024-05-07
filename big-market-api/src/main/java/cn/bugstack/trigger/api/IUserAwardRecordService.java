package cn.bugstack.trigger.api;

import cn.bugstack.trigger.api.dto.RaffleStrategyRuleWeightResponseDTO;
import cn.bugstack.trigger.api.dto.UserAwardRecordRequestDTO;
import cn.bugstack.trigger.api.dto.UserAwardRecordResponseDto;
import cn.bugstack.types.model.PageData;
import cn.bugstack.types.model.Response;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 用户获奖记录服务接口
 * @create 2024/05/07 14:58:12
 */
public interface IUserAwardRecordService {
    Response<PageData<UserAwardRecordResponseDto>> queryRaffleStrategyRuleWeight(UserAwardRecordRequestDTO requestDTO, String token);
}
