package cn.bugstack.domain.auth.service;

import cn.bugstack.domain.auth.model.entity.AuthStateEntity;

/**
 * @author Luckysj @刘仕杰
 * @description 认证服务接口
 * @create 2024/04/29 18:38:04
 */
public interface IAuthService {
    /**
    * @description 用户登录校验
    * @param code 验证码
    * @return 登录验证状态实体
    * @date 2024/04/29 18:46:46
    */
    public AuthStateEntity doLogin(String code);

    /**
    * @description 根据jwt token解析出用户id，如果失效就返回null
    * @param token jwt
    * @return String 用户id
    * @date 2024/05/02 16:22:45
    */
    public String parseToken(String token);
}
