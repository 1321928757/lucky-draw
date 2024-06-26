package cn.bugstack.trigger.http;

import cn.bugstack.domain.activity.service.IRaffleActivityAccountQuotaService;
import cn.bugstack.domain.auth.service.IAuthService;
import cn.bugstack.domain.strategy.model.entity.RaffleAwardEntity;
import cn.bugstack.domain.strategy.model.entity.RaffleFactorEntity;
import cn.bugstack.domain.strategy.model.entity.StrategyAwardEntity;
import cn.bugstack.domain.strategy.model.valobj.RuleWeightVO;
import cn.bugstack.domain.strategy.service.IRaffleAward;
import cn.bugstack.domain.strategy.service.IRaffleRule;
import cn.bugstack.domain.strategy.service.IRaffleStrategy;
import cn.bugstack.domain.strategy.service.armory.IStrategyArmory;
import cn.bugstack.trigger.api.IRaffleStrategyService;
import cn.bugstack.trigger.api.dto.*;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.Response;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * @author Luckysj @刘仕杰
 * @description 营销抽奖服务
 * @create 2024-02-14 09:21
 */
@Slf4j
@RestController()
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/strategy/")
public class RaffleStrategyController implements IRaffleStrategyService {

    @Resource
    private IRaffleAward raffleAward;
    @Resource
    private IRaffleStrategy raffleStrategy;
    @Resource
    private IStrategyArmory strategyArmory;
    @Resource
    private IRaffleRule raffleRule;
    @Resource
    private IRaffleActivityAccountQuotaService accountQuotaService;
    @Resource
    private IAuthService authService;

    /**
     * 查询奖品列表
     *
     * @param requestDTO 请求对象
     * @return 奖品列表
     */
    @RequestMapping(value = "query_raffle_award_list", method = RequestMethod.POST)
    @Override
    public Response<List<RaffleAwardListResponseDTO>> queryRaffleAwardList(
            @RequestBody RaffleAwardListRequestDTO requestDTO, @RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验
            String userId = authService.parseToken(token);
            if (userId == null) {
                return Response.<List<RaffleAwardListResponseDTO>>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.参数校验
            if (requestDTO.getActivityId() == null) {
                return Response.<List<RaffleAwardListResponseDTO>>builder()
                        .code(ResponseCode.ILLEGAL_PARAMETER.getCode())
                        .info(ResponseCode.ILLEGAL_PARAMETER.getInfo())
                        .build();
            }
            // 3.查询奖品配置
            List<StrategyAwardEntity> strategyAwardEntities = raffleAward.queryRaffleStrategyAwardListByActivityId(requestDTO.getActivityId());

            // 4.从奖品中筛选出奖品规则树
            String[] treeIds = strategyAwardEntities.stream().map(StrategyAwardEntity::getRuleModels)
                    .filter(ruleModel -> ruleModel != null && !ruleModel.isEmpty())
                    .toArray(String[]::new);

            // 5.根据规则树ID数组查询规则书配置
            Map<String, Integer> stringIntegerMap = raffleRule.queryAwardRuleLockCountByRuleIds(treeIds);

            // 6.查询用户剩余解锁次数
            Integer dayPartakeCount = accountQuotaService.queryRaffleActivityAccountTotalPartakeCount(requestDTO.getActivityId(), userId);

            // 7.装配剩余解锁次数
            List<RaffleAwardListResponseDTO> awardListResponseDTOS = strategyAwardEntities.stream().map(strategyAward -> {
                // 从map中取出对应的锁次数
                Integer awardRuleLockCount = stringIntegerMap.get(strategyAward.getRuleModels());
                return RaffleAwardListResponseDTO.builder()
                        .awardId(strategyAward.getAwardId())
                        .awardTitle(strategyAward.getAwardTitle())
                        .awardSubtitle(strategyAward.getAwardSubtitle())
                        .awardImage(strategyAward.getAwardImage())
                        .awardRate(strategyAward.getAwardRate())
                        .sort(strategyAward.getSort())
                        .awardRuleLockCount(awardRuleLockCount)
                        .isAwardUnlock(null == awardRuleLockCount || dayPartakeCount >= awardRuleLockCount)
                        .waitUnLockCount(null == awardRuleLockCount || awardRuleLockCount <= dayPartakeCount ? 0 : awardRuleLockCount - dayPartakeCount)
                        .build();

            }).collect(Collectors.toList());

            // 8.返回结果
            return Response.<List<RaffleAwardListResponseDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(awardListResponseDTOS)
                    .build();
        } catch (Exception e) {
            log.error("查询抽奖奖品列表配置失败 strategyId：{}", null, e);
            return Response.<List<RaffleAwardListResponseDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    /**
     * 查询活动权重信息
     *
     * @param activityId 活动id
     * @return 权重信息(多个)
     */
    @RequestMapping(value = "query_raffle_strategy_rule_weight", method = RequestMethod.GET)
    @Override
    public Response<List<RaffleStrategyRuleWeightResponseDTO>> queryRaffleStrategyRuleWeight(Long activityId,@RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验
            String userId = authService.parseToken(token);
            if (userId == null) {
                return Response.<List<RaffleStrategyRuleWeightResponseDTO>>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.查询权重策略
            List<RuleWeightVO> ruleWeightVOList = raffleRule.queryAwardRuleWeightByActivityId(activityId, userId);

            // 3.封装结果
            List<RaffleStrategyRuleWeightResponseDTO> raffleStrategyRuleWeightList = new ArrayList<>();
            for (RuleWeightVO ruleWeightVO : ruleWeightVOList) {
                List<RuleWeightVO.Award> awardList = ruleWeightVO.getAwardList();
                List<RaffleStrategyRuleWeightResponseDTO.StrategyAward> strategyAwards = awardList.stream()
                        .map(award -> RaffleStrategyRuleWeightResponseDTO.StrategyAward.builder()
                                .awardId(award.getAwardId())
                                .awardTitle(award.getAwardTitle())
                                .build()).collect(Collectors.toList());

                RaffleStrategyRuleWeightResponseDTO raffleStrategyRuleWeightResponseDTO = new RaffleStrategyRuleWeightResponseDTO();
                raffleStrategyRuleWeightResponseDTO.setStrategyAwards(strategyAwards);
                raffleStrategyRuleWeightResponseDTO.setRuleWeightCount(ruleWeightVO.getWeight());
                raffleStrategyRuleWeightResponseDTO.setUserWeightUseCount(ruleWeightVO.getUserWeightUseCount());
                raffleStrategyRuleWeightList.add(raffleStrategyRuleWeightResponseDTO);
            }

            return Response.<List<RaffleStrategyRuleWeightResponseDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(raffleStrategyRuleWeightList)
                    .build();
        } catch (AppException e) {
            log.error("用户查询活动权重信息时异常", e);
            return Response.<List<RaffleStrategyRuleWeightResponseDTO>>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .build();
        } catch (Exception e) {
            log.error("用户查询活动权重信息时异常", e);
            return Response.<List<RaffleStrategyRuleWeightResponseDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

}
