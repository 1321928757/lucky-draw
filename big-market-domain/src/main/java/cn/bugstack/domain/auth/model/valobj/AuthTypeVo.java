package cn.bugstack.domain.auth.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public enum AuthTypeVo {
    CODE_SUCCESS("0000","验证成功"),
    CODE_NOT_EXIST("0001","验证码不存在"),
    CODE_INVALIDATION("0002","验证码无效");
    private String code;
    private String info;
}