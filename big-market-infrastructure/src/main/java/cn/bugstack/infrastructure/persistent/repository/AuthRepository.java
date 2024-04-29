package cn.bugstack.infrastructure.persistent.repository;

import cn.bugstack.domain.auth.repository.IAuthRepository;
import cn.bugstack.infrastructure.persistent.redis.IRedisService;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

@Repository
public class AuthRepository implements IAuthRepository {
    @Resource
    private IRedisService redisService;

    private static final String Key = "weixin_code:";
    @Override
    public String getCodeUserOpenId(String code) {
        return redisService.getValue(Key + code);
    }

    @Override
    public void removeCodeByOpenId(String code, String openId) {
        // redisService.remove(Key + code);
        // redisService.remove(Key + openId);
    }
}
