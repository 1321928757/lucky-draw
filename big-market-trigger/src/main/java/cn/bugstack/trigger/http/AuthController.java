package cn.bugstack.trigger.http;


import cn.bugstack.domain.auth.model.entity.AuthStateEntity;
import cn.bugstack.domain.auth.model.valobj.AuthTypeVo;
import cn.bugstack.domain.auth.service.IAuthService;
import cn.bugstack.types.annotation.AccessInterceptor;
import cn.bugstack.types.enums.ResponseCode;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.model.Response;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @author Luckysj @刘仕杰
 * @description 权限校验接口层
 * @create 2024/04/29 19:49:51
 */
@Slf4j
@RestController()
@CrossOrigin("${app.config.cross-origin}")
@RequestMapping("/api/${app.config.api-version}/raffle/auth/")
public class AuthController {
    @Resource
    private IAuthService authService;

    /**
    * @description 用户登录访问
    * @param code 验证码
    * @return Response<String> JWT token
    * @date 2024/04/29 19:50:07
    */
    @PostMapping(value = "/login")
    @AccessInterceptor(key = "request_ip", fallbackMethod = "limitError", permitsPerSecond = 3L, blacklistCount = 10)
    public Response<String> doLogin(@RequestParam String code, HttpServletRequest request){
        try {
            AuthStateEntity authStateEntity = authService.doLogin(code);
            // 校验不通过
            if(!authStateEntity.getCode().equals(AuthTypeVo.CODE_SUCCESS.getCode())){
                return Response.<String>builder()
                        .code(ResponseCode.CODE_ERROR.getCode())
                        .info(ResponseCode.CODE_ERROR.getInfo())
                        .build();
            }

            //校验通过，放行，携带token信息
            return Response.<String>builder()
                    .code(ResponseCode.SUCCESS.getCode())
                    .info(ResponseCode.SUCCESS.getInfo())
                    .data(authStateEntity.getToken())
                    .build();
        } catch (AppException e) {
            log.error("鉴权登录校验失败，验证码: {}，错误消息：{}", code, e.getMessage());
            return Response.<String>builder()
                    .code(e.getCode())
                    .info(e.getInfo())
                    .build();
        } catch (Exception e){
            log.error("鉴权登录校验失败，验证码: {}，错误消息：{}", code, e.getMessage());
            e.printStackTrace();
            return Response.<String>builder()
                    .code(ResponseCode.UN_ERROR.getCode())
                    .info(ResponseCode.UN_ERROR.getInfo())
                    .build();
        }
    }

    // 绑定的限流降级方法,直接返回限流信息即可
    public Response<String> limitError(String code, HttpServletRequest request){
        return Response.<String>builder()
                .code(ResponseCode.VIEW_LIMIT.getCode())
                .info(ResponseCode.VIEW_LIMIT.getInfo())
                .build();
    }
}
