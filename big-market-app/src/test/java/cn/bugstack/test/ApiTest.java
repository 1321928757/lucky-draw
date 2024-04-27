package cn.bugstack.test;

import cn.bugstack.trigger.api.dto.RaffleAwardListRequestDTO;
import com.alibaba.fastjson2.JSON;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;

/**
 * @author Luckysj @刘仕杰
 * @description 功能测试
 * @create 2023-12-23 11:39
 */
@Slf4j
//@RunWith(SpringRunner.class)
//@SpringBootTest
public class ApiTest {

    @Test
    public void test() {
    }

    private double convert(double min){
        double current = min;
        double max = 1;
        while (current < 1){
            current = current * 10;
            max = max * 10;
        }
        return max;
    }

}
