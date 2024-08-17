package cn.bugstack.test.domain.award;

import cn.bugstack.domain.award.model.entity.DistributeAwardEntity;
import cn.bugstack.domain.award.model.entity.UserAwardRecordEntity;
import cn.bugstack.domain.award.model.valobj.AwardStateVO;
import cn.bugstack.domain.award.service.IAwardService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.Date;
import java.util.concurrent.CountDownLatch;

/**
 * @author Luckysj @刘仕杰
 * @description 奖品服务测试
 * @create 2024/04/14 20:28:56
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class AwardServiceTest {

    @Resource
    private IAwardService awardService;

    /**
     * 模拟发放抽奖记录
     */
    @Test
    public void test_saveUserAwardRecord() throws InterruptedException {
        for (int i = 0; i < 100; i++) {
            UserAwardRecordEntity userAwardRecordEntity = new UserAwardRecordEntity();
            userAwardRecordEntity.setUserId("xiaofuge");
            userAwardRecordEntity.setActivityId(100301L);
            userAwardRecordEntity.setStrategyId(100006L);
            userAwardRecordEntity.setOrderId(RandomStringUtils.randomNumeric(12));
            userAwardRecordEntity.setAwardId(101);
            userAwardRecordEntity.setAwardTitle("OpenAI 增加使用次数");
            userAwardRecordEntity.setAwardTime(new Date());
            userAwardRecordEntity.setAwardState(AwardStateVO.create);
            awardService.saveUserAwardRecord(userAwardRecordEntity);
            Thread.sleep(500);
        }

        new CountDownLatch(1).await();
    }

    // 分发奖品测试
    @Test
    public void test_distributeAward() throws InterruptedException {
        DistributeAwardEntity distributeAwardEntity = new DistributeAwardEntity();
        distributeAwardEntity.setUserId("ogdb46DaYxN6nliqjeveqnZMfqmI");
        distributeAwardEntity.setOrderId("73711884112312313");
        distributeAwardEntity.setAwardId(101);
        distributeAwardEntity.setAwardConfig("0.01,1"); // 如果没有传递AwardConfig则会走库中奖品默认的配置

        awardService.distributeAward(distributeAwardEntity);
    }
}
