package cn.bugstack.domain.auth.service;

import cn.bugstack.domain.auth.model.entity.AuthStateEntity;
import cn.bugstack.domain.auth.model.valobj.AuthTypeVo;
import cn.bugstack.domain.auth.repository.IAuthRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Luckysj @刘仕杰
 * @description 认证服务
 * @create 2024/04/29 18:38:04
 */
@Slf4j
@Service
public class AuthService extends AbstractAuthService{
    @Resource
    private IAuthRepository authRepository;

    @Override
    protected AuthStateEntity checkCode(String code) {
// 从缓存中读取验证码
        String openId = authRepository.getCodeUserOpenId(code);
        if(StringUtils.isBlank(openId)){
            log.info("鉴权失败，用户输入的验证码不存在 {}", code);
            return AuthStateEntity.builder()
                    .code(AuthTypeVo.CODE_NOT_EXIST.getCode())
                    .info(AuthTypeVo.CODE_NOT_EXIST.getInfo())
                    .build();
        }

        // 移除缓存Key值
        authRepository.removeCodeByOpenId(code, openId);

        // 返回校验成功结果
        return AuthStateEntity.builder()
                .code(AuthTypeVo.CODE_SUCCESS.getCode())
                .info(AuthTypeVo.CODE_SUCCESS.getInfo())
                .openId(openId)
                .build();
    }
}
