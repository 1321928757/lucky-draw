package cn.bugstack.test.domain.rebate;

import cn.bugstack.domain.rebate.model.entity.BehaviorEntity;
import cn.bugstack.domain.rebate.model.valobj.BehaviorTypeVO;
import cn.bugstack.domain.rebate.service.IRebateService;
import cn.bugstack.domain.strategy.model.valobj.*;
import cn.bugstack.domain.strategy.service.rule.tree.factory.DefaultTreeFactory;
import cn.bugstack.domain.strategy.service.rule.tree.factory.engine.IDecisionTreeEngine;
import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author Luckysj @刘仕杰
 * @description 返利领域服务测试
 * @create 2024/05/04 16:41:49
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RebateServiceTest {

    @Resource
    private IRebateService rebateService;

    @Test
    public void test_create_rebate_order() {
        BehaviorEntity behaviorEntity = new BehaviorEntity();
        behaviorEntity.setUserId("ogdb46DaYxN6nliqjeveqnZMfqmI");
        behaviorEntity.setOutBusinessNo("20250511");
        behaviorEntity.setBehaviorTypeVO(BehaviorTypeVO.SIGN);
        rebateService.createOrder(behaviorEntity);
    }

}
