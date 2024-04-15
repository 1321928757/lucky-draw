package cn.bugstack.trigger.http;

import cn.bugstack.domain.activity.service.armory.IActivityArmory;
import cn.bugstack.domain.strategy.service.armory.IStrategyArmory;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Slf4j
@RestController()
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/activity/")
public class RaffleActivityController {

    @Resource
    private IActivityArmory activityArmory;

    @Resource
    private IStrategyArmory strategyArmory;

    /**
    * @description 活动缓存预热
    * @param activityId 活动id
    * @return Boolean 是否预热成功
    * @date 2024/04/15 20:55:16
    */
    @RequestMapping(value = "armory", method = RequestMethod.GET)
    public Response<Boolean> armory(@RequestParam  Long activityId){
        try {
            log.info("活动装配，数据预热，开始 activityId:{}", activityId);
            // 1.活动装配
            activityArmory.assembleActivitySkuByActivityId(activityId);
            // 2.策略装配
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
            return Response.<Boolean>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .data(false)
                    .build();
        } catch (Exception e){
            log.info("活动装配，数据预热，失败 activityId:{},error:{}", activityId, e.getMessage());
            return Response.<Boolean>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .data(false)
                    .build();
        }

    }
}
