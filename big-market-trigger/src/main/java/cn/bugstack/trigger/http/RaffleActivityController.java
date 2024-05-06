package cn.bugstack.trigger.http;

import cn.bugstack.domain.activity.model.entity.ActivityAccountEntity;
import cn.bugstack.domain.activity.model.entity.UserRaffleOrderEntity;
import cn.bugstack.domain.activity.service.IRaffleActivityAccountQuotaService;
import cn.bugstack.domain.activity.service.IRaffleActivityPartakeService;
import cn.bugstack.domain.activity.service.armory.IActivityArmory;
import cn.bugstack.domain.auth.service.IAuthService;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.valobj.AwardStateVO;
import cn.bugstack.domain.award.service.IAwardService;
import cn.bugstack.domain.rebate.model.entity.BehaviorEntity;
import cn.bugstack.domain.rebate.model.entity.BehaviorRebateOrderEntity;
import cn.bugstack.domain.rebate.model.valobj.BehaviorTypeVO;
import cn.bugstack.domain.rebate.service.IRebateService;
import cn.bugstack.domain.strategy.model.entity.RaffleAwardEntity;
import cn.bugstack.domain.strategy.model.entity.RaffleFactorEntity;
import cn.bugstack.domain.strategy.service.IRaffleStrategy;
import cn.bugstack.domain.strategy.service.armory.IStrategyArmory;
import cn.bugstack.trigger.api.IRaffleActivityService;
import cn.bugstack.trigger.api.IRaffleStrategyService;
import cn.bugstack.trigger.api.dto.*;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Slf4j
@RestController()
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/activity/")
public class RaffleActivityController implements IRaffleActivityService {
    private final SimpleDateFormat dateFormatDay = new SimpleDateFormat("yyyyMMdd");

    @Resource
    private IActivityArmory activityArmory;

    @Resource
    private IStrategyArmory strategyArmory;

    @Resource
    private IRaffleActivityPartakeService raffleActivityPartakeService;

    @Resource
    private IRaffleStrategy raffleStrategy;

    @Resource
    private IAwardService awardService;

    @Resource
    private IAuthService authService;

    @Resource
    private IRebateService rebateService;

    @Resource
    private IRaffleActivityAccountQuotaService raffleActivityAccountQuotaService;

    /**
     * @param activityId 活动id
     * @return Boolean 是否预热成功
     * @description 活动缓存预热
     * @date 2024/04/15 20:55:16
     */
    @RequestMapping(value = "armory", method = RequestMethod.GET)
    public Response<Boolean> armory(@RequestParam Long activityId,@RequestHeader("Authorization")  String token) {
        try {
            log.info("活动装配，数据预热，开始 activityId:{}", activityId);
            // 1.身份校验 TODO 这里后面可能要校验权限
            String userId = authService.parseToken(token);
            if(userId == null){
                return Response.<Boolean>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.参数校验
            if (activityId == null) {
                throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
            }

            // 3.活动装配
            activityArmory.assembleActivitySkuByActivityId(activityId);
            // 4.策略装配
            strategyArmory.assembleLotteryStrategyByActivityId(activityId);

            Response<Boolean> response = Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(true)
                    .build();
            log.info("活动装配，数据预热，完成 activityId:{}", activityId);
            return response;
        } catch (AppException e) {
            log.info("活动装配，数据预热，失败 activityId:{},error:{}", activityId, e.getMessage());
            e.printStackTrace();
            return Response.<Boolean>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .data(false)
                    .build();
        } catch (Exception e) {
            log.info("活动装配，数据预热，失败 activityId:{},error:{}", activityId, e.getMessage());
            e.printStackTrace();
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .data(false)
                    .build();
        }

    }

    /**
     * @param request 活动抽奖，请求对象
     * @return ActivityDrawResponseDTO 抽奖结果
     * @description 用户参与活动抽奖
     * @date 2024/04/15 22:04:15
     */
    @Override
    @RequestMapping(value = "draw", method = RequestMethod.POST)
    public Response<ActivityDrawResponseDTO> draw(@RequestBody ActivityDrawRequestDTO request,  @RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验
            String userId = authService.parseToken(token);
            if(userId == null){
                return Response.<ActivityDrawResponseDTO>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.参数校验
            if (request.getActivityId() == null) {
                throw new AppException(ResponseCode.ILLEGAL_PARAMETER.getCode(), ResponseCode.ILLEGAL_PARAMETER.getInfo());
            }

            // 3.参与活动 - 创建活动订单
            UserRaffleOrderEntity orderEntity = raffleActivityPartakeService.createOrder(userId, request.getActivityId());
            log.info("活动抽奖，创建订单 userId:{} activityId:{} orderId:{}", userId, request.getActivityId(), orderEntity.getOrderId());

            // 4.抽奖策略 - 执行抽奖
            RaffleAwardEntity raffleAwardEntity = raffleStrategy.performRaffle(RaffleFactorEntity.builder()
                    .userId(orderEntity.getUserId())
                    .strategyId(orderEntity.getStrategyId())
                    .build());
            log.info("活动抽奖，执行抽奖 userId:{} activityId:{} awardId:{}", userId, request.getActivityId(), raffleAwardEntity.getAwardId());


            // 5. 保存记录 - 中奖记录入库
            UserAwardRecordEntity userAwardRecord = UserAwardRecordEntity.builder()
                    .userId(orderEntity.getUserId())
                    .activityId(orderEntity.getActivityId())
                    .strategyId(orderEntity.getStrategyId())
                    .orderId(orderEntity.getOrderId())
                    .awardId(raffleAwardEntity.getAwardId())
                    .awardTitle(raffleAwardEntity.getAwardTitle())
                    .awardTime(new Date())
                    .awardState(AwardStateVO.create)
                    .build();
            awardService.saveUserAwardRecord(userAwardRecord);

            // 6.返回中奖结果
            return Response.<ActivityDrawResponseDTO>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(ActivityDrawResponseDTO.builder()
                            .awardId(raffleAwardEntity.getAwardId())
                            .awardIndex(raffleAwardEntity.getSort())
                            .awardTitle(raffleAwardEntity.getAwardTitle())
                            .build())
                    .build();
        } catch (AppException e) {
            log.info("活动抽奖，失败 activityId:{},error:{}", request.getActivityId(), e.getMessage());
            return Response.<ActivityDrawResponseDTO>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .build();
        } catch (Exception e){
            log.info("活动抽奖，失败 activityId:{},error:{}", request.getActivityId(), e.getMessage());
            return Response.<ActivityDrawResponseDTO>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }


    /**
    * @description 日历签到返利
    * @param
    * @return 是否签到成功
    * @date 2024/05/05 16:23:50
    */
    @RequestMapping(value = "calendar_sign_rebate", method = RequestMethod.POST)
    @Override
    public Response<Boolean> calendarSignRebate(@RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验 & 获取用户ID
            String userId = authService.parseToken(token);
            if(userId == null){
                return Response.<Boolean>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.签到返利
            BehaviorEntity behaviorEntity = new BehaviorEntity();
            behaviorEntity.setUserId(userId);
            behaviorEntity.setBehaviorTypeVO(BehaviorTypeVO.SIGN);
            // 使用当前日期作为业务id，每个用户当天只能签到一次
            behaviorEntity.setOutBusinessNo(dateFormatDay.format(new Date()));
            rebateService.createOrder(behaviorEntity);
            return Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(true)
                    .build();
        } catch (AppException e) {
            log.error("日历签到返利异常", e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.ACCOUNT_SIGN_ERROR.getCode())
                    .info(ResponseCode.ACCOUNT_SIGN_ERROR.getInfo())
                    .data(false)
                    .build();
        } catch (Exception e){
            log.error("日历签到返利异常", e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .data(false)
                    .build();
        }

    }


    /**
    * @description 判断是否签到接口
    * @param token 用户token
    * @return 今天是否签到过
    * @date 2024/05/05 19:19:31
    */
    @RequestMapping(value = "is_calendar_sign_rebate", method = RequestMethod.GET)
    @Override
    public Response<Boolean> isCalendarSignRebate(@RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验 & 获取用户ID
            String userId = authService.parseToken(token);
            if(userId == null){
                return Response.<Boolean>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.查询用户当日的签到返利记录
            String outBusinessNo = dateFormatDay.format(new Date());
            List<BehaviorRebateOrderEntity> orders = rebateService.queryOrderByOutBusinessNo(userId, outBusinessNo);

            // 3.返回结果
            return Response.<Boolean>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(!orders.isEmpty())
                    .build();
        } catch (Exception e) {
            log.error("查询日历签到异常", e);
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .data(false)
                    .build();
        }


    }

    /**
    * @description 查询当前账户额度
    * @param activityId 活动id
    * @return UserActivityAccountResponseDTO 次数账户对象
    * @date 2024/05/05 20:03:25
    */
    @RequestMapping(value = "query_user_activity_account", method = RequestMethod.GET)
    @Override
    public Response<UserActivityAccountResponseDTO> queryUserActivityAccount(@RequestParam Long activityId, @RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验 & 获取用户ID
            String userId = authService.parseToken(token);
            if(userId == null){
                return Response.<UserActivityAccountResponseDTO>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }
            // 2.参数校验
            if(activityId == null){
                return Response.<UserActivityAccountResponseDTO>builder()
                        .code(ResponseCode.ILLEGAL_PARAMETER.getCode())
                        .info(ResponseCode.ILLEGAL_PARAMETER.getInfo())
                        .build();
            }
            // 3.查询次数账户
            ActivityAccountEntity activityAccountEntity = raffleActivityAccountQuotaService.queryActivityAccountEntity(activityId, userId);

            // 4.拼接返回结果
            UserActivityAccountResponseDTO activityAccountResponseDTO = UserActivityAccountResponseDTO.builder()
                    .totalCount(activityAccountEntity.getTotalCount())
                    .totalCountSurplus(activityAccountEntity.getTotalCountSurplus())
                    .dayCount(activityAccountEntity.getDayCount())
                    .dayCountSurplus(activityAccountEntity.getDayCountSurplus())
                    .monthCount(activityAccountEntity.getMonthCount())
                    .monthCountSurplus(activityAccountEntity.getMonthCountSurplus())
                    .build();
            return Response.<UserActivityAccountResponseDTO>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(activityAccountResponseDTO)
                    .build();
        } catch (AppException e) {
            log.error("查询用户的次数账户信息异常", e);
            return Response.<UserActivityAccountResponseDTO>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .build();
        } catch (Exception e){
            log.error("查询用户的次数账户信息异常", e);
            return Response.<UserActivityAccountResponseDTO>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }

    }

}
