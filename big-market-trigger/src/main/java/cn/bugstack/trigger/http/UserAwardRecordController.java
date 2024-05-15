package cn.bugstack.trigger.http;

import cn.bugstack.domain.auth.service.IAuthService;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.service.IAwardService;
import cn.bugstack.trigger.api.IUserAwardRecordService;
import cn.bugstack.trigger.api.dto.LatestAwardRecordRequestDTO;
import cn.bugstack.trigger.api.dto.LatestAwardRecordResponseDTO;
import cn.bugstack.trigger.api.dto.UserAwardRecordRequestDTO;
import cn.bugstack.trigger.api.dto.UserAwardRecordResponseDTO;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.PageData;
import cn.bugstack.types.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Luckysj @刘仕杰
 * @description 用户获奖记录接口
 * @create 2024/05/07 15:01:01
 */
@Slf4j
@RestController()
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/award/")
public class UserAwardRecordController implements IUserAwardRecordService {
    @Resource
    private IAwardService awardService;
    @Resource
    private IAuthService authService;


    @RequestMapping(value = "query_page_award_record", method = RequestMethod.POST)
    @Override
    public Response<PageData<UserAwardRecordResponseDTO>> queryPageAwardRecord(@RequestBody UserAwardRecordRequestDTO requestDTO, @RequestHeader("Authorization") String token) {
        try {
            // 1.身份校验
            String userId = authService.parseToken(token);
            if (userId == null) {
                return Response.<PageData<UserAwardRecordResponseDTO>>builder()
                        .code(ResponseCode.AUTH_ERROR.getCode())
                        .info(ResponseCode.AUTH_ERROR.getInfo())
                        .build();
            }

            // 2.参数校验
            if(requestDTO.getPage() < 0 || requestDTO.getPageSize() < 1){
                return Response.<PageData<UserAwardRecordResponseDTO>>builder()
                        .code(ResponseCode.ILLEGAL_PARAMETER.getCode())
                        .info(ResponseCode.ILLEGAL_PARAMETER.getInfo())
                        .build();
            }

            // 3.查询数据
            PageData<UserAwardRecordEntity> userAwardRecordEntities = awardService.queryUserAwardingRecord(requestDTO.getPage(), requestDTO.getPageSize(), userId);
            // 4.转为DTO对象
            List<UserAwardRecordResponseDTO> userAwardRecordResponseDTOS = userAwardRecordEntities.getData().stream()
                    .map(recordEntity -> UserAwardRecordResponseDTO.builder()
                            .awardId(recordEntity.getAwardId())
                            .awardTitle(recordEntity.getAwardTitle())
                            .awardImage(recordEntity.getAwardImage())
                            .awardState(recordEntity.getAwardState().getCode())
                            .orderId(recordEntity.getOrderId())
                            .awardTime(recordEntity.getAwardTime()).build()).collect(Collectors.toList());
            // 5.拼装为分页返回结果
            PageData<UserAwardRecordResponseDTO> responseDto = PageData.<UserAwardRecordResponseDTO>builder()
                    .data(userAwardRecordResponseDTOS)
                    .total(userAwardRecordEntities.getTotal())
                    .current(userAwardRecordEntities.getCurrent())
                    .pageSize(userAwardRecordEntities.getPageSize())
                    .build();

            return Response.<PageData<UserAwardRecordResponseDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(responseDto)
                    .build();
        } catch (AppException e) {
            log.error("用户查询获奖记录信息时异常", e);
            return Response.<PageData<UserAwardRecordResponseDTO>>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .build();
        } catch (Exception e) {
            log.error("用户查询获奖记录信息时异常", e);
            return Response.<PageData<UserAwardRecordResponseDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    @RequestMapping(value = "query_activity_award_record", method = RequestMethod.POST)
    @Override
    public Response<List<LatestAwardRecordResponseDTO>> queryActivityLatestRecord(@RequestBody LatestAwardRecordRequestDTO requestDTO) {
        try {
            // 1.参数校验
            if (requestDTO.getActivityId() == null || requestDTO.getSize() == null || requestDTO.getSize() < 0 || requestDTO.getSize() > 40){
                return Response.<List<LatestAwardRecordResponseDTO>>builder()
                        .code(ResponseCode.ILLEGAL_PARAMETER.getCode())
                        .info(ResponseCode.ILLEGAL_PARAMETER.getInfo())
                        .build();
            }

            // 2.查询数据
            List<UserAwardRecordEntity> userAwardRecordEntities = awardService.queryLastestAwardingRecord(requestDTO.getActivityId(), requestDTO.getSize());

            // 3.转换为DTO对象
            List<LatestAwardRecordResponseDTO> recordResponseDTOS = userAwardRecordEntities.stream().map(userAwardRecordEntity ->
                    LatestAwardRecordResponseDTO.builder()
                            .userId(userAwardRecordEntity.getUserId())
                            .awardTitle(userAwardRecordEntity.getAwardTitle())
                            .awardTime(userAwardRecordEntity.getAwardTime())
                            .build()).collect(Collectors.toList());

            return Response.<List<LatestAwardRecordResponseDTO>>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(recordResponseDTOS)
                    .build();
        } catch (AppException e) {
            log.error("查询活动最新获奖记录信息时异常", e);
            return Response.<List<LatestAwardRecordResponseDTO>>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .build();
        } catch (Exception e) {
            log.error("查询活动最新获奖记录信息时异常", e);
            return Response.<List<LatestAwardRecordResponseDTO>>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }


    
}
