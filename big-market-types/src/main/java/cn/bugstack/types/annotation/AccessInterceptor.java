package cn.bugstack.types.annotation;

import java.lang.annotation.*;

/**
 * @author Luckysj @刘仕杰
 * @description 限流注解
 * @create 2024/04/29 19:45:47
 */
@Documented
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD})
public @interface AccessInterceptor {

    /** 用哪个字段作为拦截标识符，配置all则是对整个接口限流，配置request_ip，
     * 则是对访问ip限流，配置其他str，则会到参数中寻找对应名称的属性值（包括对象内部属性） */
    String key() default "all";

    /** 限制频次（每秒请求次数） */
    long permitsPerSecond();

    /** 黑名单拦截（多少次限制后加入黑名单）0 不限制 */
    double blacklistCount() default 0;

    /** 拦截后的执行方法 */
    String fallbackMethod();

}
