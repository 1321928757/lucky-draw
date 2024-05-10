package cn.bugstack.aop;


import cn.bugstack.types.annotation.AccessInterceptor;
import cn.bugstack.types.exception.AppException;
import cn.bugstack.types.utils.IPUtils;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.redisson.api.*;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

@Slf4j
@Aspect
@Component
public class RateLimiterAOP {
    @Resource
    private RedissonClient redissonClient;

    // 限流RateLimiter缓存前缀
    private static final String rateLimiterName = "bigmarket:RateLimiter:";
    // 黑名单原子计数器缓存前缀
    private static final String blacklistPrefix = "bigmarket:RateBlockList:";

    @Around("@annotation(accessInterceptor)")
    public Object doRouter(ProceedingJoinPoint jp, AccessInterceptor accessInterceptor) throws Throwable {
        // 获取注解配置的字段key
        String key = accessInterceptor.key();
        if (StringUtils.isBlank(key)) {
            log.error("限流RateLimiter注解中的 Key 属性为空！");
            throw new RuntimeException("RateLimiter注解中的 Key 属性为空！");
        }
        log.info("限流拦截关键字为 {}", key);

        // 根据key获取拦截标识符字段
        String keyAttr = getAttrValue(key, jp.getArgs());

        // 黑名单拦截，非法访问次数超过黑名单阈值
        if (!"all".equals(keyAttr) && accessInterceptor.blacklistCount() != 0 && redissonClient.getAtomicLong(blacklistPrefix + keyAttr).get() > accessInterceptor.blacklistCount()) {
            log.info("限流-黑名单拦截：{}", keyAttr);
            return fallbackMethodResult(jp, accessInterceptor.fallbackMethod());
        }

        // 获取限流器 -> Redisson RRateLimiter
        RRateLimiter rateLimiter = redissonClient.getRateLimiter(rateLimiterName + keyAttr);

        if (!rateLimiter.isExists()) {
            // 创建令牌桶数据模型，单位时间内产生多少令牌
            rateLimiter.trySetRate(RateType.PER_CLIENT, accessInterceptor.permitsPerSecond(),1, RateIntervalUnit.MINUTES);
        }

        // 限流判断,没有获取到令牌，超出频率
        if (!rateLimiter.tryAcquire()) {
            // 如果开启了黑名单限制，那么就记录当前的非法访问次数
            if (accessInterceptor.blacklistCount() != 0) {
                RAtomicLong atomicLong = redissonClient.getAtomicLong(blacklistPrefix + keyAttr);
                atomicLong.incrementAndGet(); // 原子自增
                atomicLong.expire(24, TimeUnit.HOURS); // 刷新黑名单原子计数器器过期时间为24小时
            }
            log.info("限流-频率过高拦截：{}", keyAttr);
            return fallbackMethodResult(jp, accessInterceptor.fallbackMethod());
        }

        // 返回结果
        return jp.proceed();
    }

    /**
     * 调用用户配置的回调方法，使用反射机制实现。
     */
    private Object fallbackMethodResult(JoinPoint jp, String fallbackMethod) throws AppException, InvocationTargetException, IllegalAccessException {
        // 通过JoinPoint对象获取方法的签名（Signature）
        Signature sig = jp.getSignature();
        // 将方法签名转换为MethodSignature对象，以便获取方法的详细信息
        MethodSignature methodSignature = (MethodSignature) sig;
        // 获取到具体的方法对象,通过方法名和参数（所以回调函数参数一定要和原方法一致）
        Method method = null;
        try {
            method = jp.getTarget().getClass().getMethod(fallbackMethod, methodSignature.getParameterTypes());
        } catch (NoSuchMethodException e) {
            throw new AppException("错误，绑定的限流降级方法[" + fallbackMethod +"]不存在");
        }
        // 调用目标对象的方法，并传入当前对象（jp.getThis()）和方法的参数（jp.getArgs()）。
        return method.invoke(jp.getThis(), jp.getArgs());
    }

    /**
     * 根据JoinPoint对象获取其所代表的方法对象
     */
    private Method getMethod(JoinPoint jp) throws NoSuchMethodException {
        Signature sig = jp.getSignature();
        MethodSignature methodSignature = (MethodSignature) sig;
        return jp.getTarget().getClass().getMethod(methodSignature.getName(), methodSignature.getParameterTypes());
    }

    /**
     * 实际根据自身业务调整，主要是为了获取通过某个值做拦截
     */
    public String getAttrValue(String attr, Object[] args) {
        String filedValue = null;

        for (Object arg : args) {
            try {
                // 根据ip拦截
                if ("request_ip".equals(attr) && arg instanceof HttpServletRequest) {
                    HttpServletRequest request = (HttpServletRequest) arg;
                    filedValue = IPUtils.getIpAddr(request);
                }
                // 找到了值，返回
                if (StringUtils.isNotBlank(filedValue)) {
                    break;
                }
                // fix: 使用lombok时，uId这种字段的get方法与idea生成的get方法不同，会导致获取不到属性值，改成反射获取解决
                filedValue = String.valueOf(this.getValueByName(arg, attr));
            } catch (Exception e) {
                log.error("获取路由属性值失败 attr：{}", attr, e);
            }
        }
        return filedValue;
    }

    /**
     * 获取对象的特定属性值（反射）
     *
     * @param item 对象
     * @param name 属性名
     * @return 属性值
     * @author tang
     */
    private Object getValueByName(Object item, String name) {
        try {
            // 获取指定对象中对应属性名的Field对象
            Field field = getFieldByName(item, name);
            // 获取到的Field对象为null，表示属性不存在，直接返回null。
            if (field == null) {
                return null;
            }
            // 将Field对象设置为可访问，以便获取私有属性的值。
            field.setAccessible(true);
            // 获取属性值，并将其赋值给变量o。
            Object o = field.get(item);
            // 将Field对象设置为不可访问，以保持对象的封装性。
            field.setAccessible(false);
            return o;
        } catch (IllegalAccessException e) {
            return null;
        }
    }

    /**
     * 根据名称获取方法，该方法同时兼顾继承类获取父类的属性
     *
     * @param item 对象
     * @param name 属性名
     * @return 该属性对应方法
     * @author tang
     */
    private Field getFieldByName(Object item, String name) {
        try {
            Field field;
            try {
                // 获取指定对象中对应属性名的Field对象。
                field = item.getClass().getDeclaredField(name);
            } catch (NoSuchFieldException e) {
                // 没有找到，抛出NoSuchFieldException异常，尝试获取父类中对应属性名的Field对象
                field = item.getClass().getSuperclass().getDeclaredField(name);
            }
            return field;
        } catch (NoSuchFieldException e) {
            // 父类也没找到对应属性名的Field对象，寄，返回null
            return null;
        }
    }

}
