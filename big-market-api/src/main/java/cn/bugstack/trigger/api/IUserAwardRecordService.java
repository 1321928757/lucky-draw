package cn.bugstack.trigger.api;

import cn.bugstack.trigger.api.dto.LatestAwardRecordRequestDTO;
import cn.bugstack.trigger.api.dto.LatestAwardRecordResponseDTO;
import cn.bugstack.trigger.api.dto.UserAwardRecordRequestDTO;
import cn.bugstack.trigger.api.dto.UserAwardRecordResponseDTO;
import cn.bugstack.types.model.PageData;
import cn.bugstack.types.model.Response;

import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 用户获奖记录服务接口
 * @create 2024/05/07 14:58:12
 */
public interface IUserAwardRecordService {
    /**
    * @description 分页查询自己的获奖记录
    * @param requestDTO 请求dto
    * @param token 用户token
    * @return PageData 分页数据
    * @date 2024/05/07 14:58:30
    */
    Response<PageData<UserAwardRecordResponseDTO>> queryPageAwardRecord(UserAwardRecordRequestDTO requestDTO, String token);

    /**
    * @description 查询活动的最新获奖记录
    * @param requestDTO 查询DTO
    * @return LatestAwardRecordResponseDTO 获奖记录【脱敏】
    * @date 2024/05/15 10:32:00
    */
    Response<List<LatestAwardRecordResponseDTO>> queryActivityLatestRecord(LatestAwardRecordRequestDTO requestDTO);
}
