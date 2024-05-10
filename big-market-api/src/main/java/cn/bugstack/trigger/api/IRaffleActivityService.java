package cn.bugstack.trigger.api;

import cn.bugstack.trigger.api.dto.ActivityBaseResponseDTO;
import cn.bugstack.trigger.api.dto.ActivityDrawRequestDTO;
import cn.bugstack.trigger.api.dto.ActivityDrawResponseDTO;
import cn.bugstack.trigger.api.dto.UserActivityAccountResponseDTO;
import cn.bugstack.types.model.Response;
import org.springframework.web.bind.annotation.RequestHeader;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动服务接口
 * @create 2024/04/15 20:48:41
 */
public interface IRaffleActivityService {

    /**
     * 活动装配，数据预热缓存
     * @param activityId 活动ID
     * @return 装配结果
     */
    Response<Boolean> armory(Long activityId, String token);

    /**
     * 活动抽奖接口
     * @param request 请求对象
     * @return 抽奖结果
     */
    Response<ActivityDrawResponseDTO> draw(ActivityDrawRequestDTO request, String token);

    /**
     * 签到返利接口
     * @param
     * @return 是否签到成功
     */
    public Response<Boolean> calendarSignRebate(String token);

    /**
     * 判断是否签到过接口
     * @param
     * @return 是否签到成功
     */
    public Response<Boolean> isCalendarSignRebate(@RequestHeader("Authorization") String token);

    /**
     * 查询当前用户在活动中的次数账户
     * @param activityId 活动id
     * @return 用户额度信息对象
     */
    Response<UserActivityAccountResponseDTO> queryUserActivityAccount(Long activityId, String token);

    /**
     * 查询活动信息
     * @param activityId 活动id
     * @return 活动信息对象
     */
    Response<ActivityBaseResponseDTO> queryActivityById(Long activityId);
}
