package cn.bugstack.domain.auth.model.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Luckysj @刘仕杰
 * @description 校验结果类
 * @create 2024/04/29 18:44:19
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AuthStateEntity {

    private String code;
    private String info;
    private String openId;
    private String token;

}