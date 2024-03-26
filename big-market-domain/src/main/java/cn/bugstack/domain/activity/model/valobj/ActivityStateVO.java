package cn.bugstack.domain.activity.model.valobj;

import lombok.AllArgsConstructor;
import lombok.Getter;

/**
 * @author Luckysj @刘仕杰
 * @description 活动状态值对象
 * @create 2024/03/16 21:57:07
 */
@Getter
@AllArgsConstructor
public enum ActivityStateVO {

    // 这里后续根据业务场景改动
    created("create", "创建"),
    posted("create", "发布"),
    closed("create", "关闭");

    private final String code;
    private final String desc;

}
