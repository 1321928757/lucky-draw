package cn.bugstack.domain.auth.repository;

/**
 * @author Luckysj @刘仕杰
 * @description 验证仓储接口
 * @create 2024/04/29 18:47:27
 */
public interface IAuthRepository {

    /**
    * @description 根据验证码获取用户openId
    * @param code 验证码
    * @return openid 用户的openid
    * @date 2024/04/29 18:56:29
    */
    String getCodeUserOpenId(String code);

    /**
    * @description 根据openId移动对应缓存值
    * @param code 验证码
    * @param openId openId
    * @return
    * @date 2024/04/29 18:57:36
    */
    void removeCodeByOpenId(String code, String openId);
}
