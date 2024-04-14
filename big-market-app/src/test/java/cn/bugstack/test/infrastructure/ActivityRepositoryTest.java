package cn.bugstack.test.infrastructure;

import cn.bugstack.domain.activity.model.entity.PartakeRaffleActivityEntity;
import cn.bugstack.domain.activity.model.entity.UserRaffleOrderEntity;
import cn.bugstack.domain.activity.repository.IActivityRepository;
import cn.bugstack.infrastructure.persistent.po.Award;
import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 活动仓储单元测试
 * @create 2023-12-16 13:36
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class ActivityRepositoryTest {

    @Resource
    private IActivityRepository activityRepository;

    @Test
    public void test_queryNoUseUserOrder() {
        PartakeRaffleActivityEntity partakeRaffleActivityEntity = new PartakeRaffleActivityEntity();
        partakeRaffleActivityEntity.setActivityId(100301L);
        partakeRaffleActivityEntity.setUserId("xiaofuge");
        UserRaffleOrderEntity userRaffleOrderEntity = activityRepository.queryNoUsedRaffleOrder(partakeRaffleActivityEntity);
        log.info("测试结果：{}", JSON.toJSONString(userRaffleOrderEntity));
    }
}
