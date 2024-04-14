package cn.bugstack.domain.activity.service.quota.rule;

/**
 * @author Luckysj @刘仕杰
 * @description 责任链抽象父类，定义链上节点的常用方法
 * @create 2024/03/23 21:47:32
 */
public abstract class AbstractActionChain implements IActionChain{
    private IActionChain next;

    @Override
    public IActionChain next() {
        return next;
    }

    @Override
    public IActionChain appendNext(IActionChain next) {
        this.next = next;
        return next;
    }
}
