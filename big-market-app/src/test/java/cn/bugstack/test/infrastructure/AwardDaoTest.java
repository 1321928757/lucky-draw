package cn.bugstack.test.infrastructure;

import cn.bugstack.infrastructure.persistent.dao.mysql.IAwardDao;
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
 * @description 奖品持久化单元测试
 * @create 2023-12-16 13:36
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class AwardDaoTest {

    @Resource
    private IAwardDao awardDao;

}
