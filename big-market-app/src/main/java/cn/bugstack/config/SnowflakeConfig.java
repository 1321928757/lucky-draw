package cn.bugstack.config;

import cn.hutool.core.lang.generator.SnowflakeGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author Luckysj @刘仕杰
 * @description hutool雪花算法生成工具
 * @create 2024/03/23 21:16:51
 */
@Configuration
public class SnowflakeConfig {

    @Bean
    public SnowflakeGenerator snowflakeGenerator(){
        return new SnowflakeGenerator(1,0);
    }
}
