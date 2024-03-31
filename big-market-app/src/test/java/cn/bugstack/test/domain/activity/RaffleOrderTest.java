package cn.bugstack.test.domain.activity;

import cn.bugstack.domain.activity.model.entity.SkuRechargeEntity;
import cn.bugstack.domain.activity.service.IRaffleOrder;
import cn.bugstack.domain.activity.service.armory.IActivityArmory;
import cn.bugstack.types.exception.AppException;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.concurrent.CountDownLatch;

/**
 * @author Luckysj @刘仕杰
 * @description 抽奖活动订单测试
 * @create 2024/03/23 21:49:50
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RaffleOrderTest {

    @Resource
    private IRaffleOrder raffleOrder;

    @Resource
    private IActivityArmory activityArmory;

    // 测试用户对SKU下单----->幂等性测试，创建业务单号相同的订单
    @Test
    public void test_createSkuRechargeOrderUnique() {
        SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
        skuRechargeEntity.setUserId("123123123123");
        skuRechargeEntity.setSku(9011L);
        // outBusinessNo 作为幂等仿重使用，同一个业务单号2次使用会抛出索引冲突 Duplicate entry '700091009111' for key 'uq_out_business_no' 确保唯一性。
        skuRechargeEntity.setOutBusinessNo("700091009111");
        String orderId = raffleOrder.createSkuRechargeOrder(skuRechargeEntity);
        raffleOrder.createSkuRechargeOrder(skuRechargeEntity); //多次执行，正常会报索引重复
        log.info("测试结果：{}", orderId);
    }

    // 测试用户对SKU下单----->整体流程测试(库存校验完成)
    @Test
    public void test_createSkuRechargeOrder() throws InterruptedException {
        // 装配sku库存
        activityArmory.assembleActivitySkuStock(9011L);

        // 对sku下单20次
        for (int i = 0; i < 20; i++) {
            try {
                SkuRechargeEntity skuRechargeEntity = new SkuRechargeEntity();
                skuRechargeEntity.setUserId("123123123123");
                skuRechargeEntity.setSku(9011L);
                // outBusinessNo 作为幂等仿重使用，同一个业务单号2次使用会抛出索引冲突 Duplicate entry '700091009111' for key 'uq_out_business_no' 确保唯一性。
                skuRechargeEntity.setOutBusinessNo(RandomStringUtils.randomNumeric(12));
                String orderId = raffleOrder.createSkuRechargeOrder(skuRechargeEntity);
                log.info("测试结果：{}", orderId);
            } catch (AppException e) {
                log.warn(e.getInfo());
            }
        }

        // 让当前线程等待，让定时任务执行，方便看测试结果
        new CountDownLatch(1).await();
    }

}
