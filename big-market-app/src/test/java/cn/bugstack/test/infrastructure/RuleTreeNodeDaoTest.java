package cn.bugstack.test.infrastructure;

import cn.bugstack.domain.strategy.model.valobj.RuleTreeVO;
import cn.bugstack.infrastructure.persistent.dao.IRuleTreeNodeDao;
import cn.bugstack.infrastructure.persistent.po.RuleTreeNode;
import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 决策树结点dao测试
 * @create 2024/04/24 17:49:31
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class RuleTreeNodeDaoTest {
    @Resource
    private IRuleTreeNodeDao ruleTreeNodeDao;

    @Test
    public void queryRuleTreeVOByTreeId() {
        String[] test = {"tree_lock_1", "tree_lock_2"};
        List<RuleTreeNode> ruleTreeNodes = ruleTreeNodeDao.queryRuleLocksByRuleIds(test);
        log.info("测试结果：{}", JSON.toJSONString(ruleTreeNodes));
    }

}
