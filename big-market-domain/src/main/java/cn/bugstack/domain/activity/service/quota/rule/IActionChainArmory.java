package cn.bugstack.domain.activity.service.quota.rule;

/**
 * @author Luckysj @刘仕杰
 * @description 下单规则组装接口
 * @create 2024/03/23 20:21:12
 */
public interface IActionChainArmory {
    IActionChain next();

    IActionChain appendNext(IActionChain next);
}
