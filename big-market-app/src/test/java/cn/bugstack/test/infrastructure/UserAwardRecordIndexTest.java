package cn.bugstack.test.infrastructure;

import cn.bugstack.infrastructure.persistent.dao.elasticsearch.UserAwardRecordIndex;
import cn.bugstack.infrastructure.persistent.doc.UserAwardRecordDoc;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 中奖记录文档服务测试
 * @create 2024/05/14 15:59:19
 */
@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserAwardRecordIndexTest {
    @Resource
    private UserAwardRecordIndex userAwardRecordIndex;

    @Test
    public void testAdd() throws IOException {
        // 格式化日期时间为Elasticsearch接受的格式
        UserAwardRecordDoc userAwardRecordDoc = new UserAwardRecordDoc();
        userAwardRecordDoc.setAwardTitle("测试数据奖品");
        userAwardRecordDoc.setAwardTime(new Date());
        userAwardRecordDoc.setUserId("123123123");
        userAwardRecordDoc.setOrderId("12");
        userAwardRecordDoc.setActivityId(100301L);
        userAwardRecordIndex.addUserAwardRecordDoc(userAwardRecordDoc);

    }

    @Test
    public void testQuery() throws IOException {
        List<UserAwardRecordDoc> last20UserAwardRecordsByActivityId = userAwardRecordIndex.queryLastestDocByActivityId(100302L, 20);
        System.out.println(last20UserAwardRecordsByActivityId);
    }
}
