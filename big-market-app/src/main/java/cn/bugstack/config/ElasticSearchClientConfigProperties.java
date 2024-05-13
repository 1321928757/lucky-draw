package cn.bugstack.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "elastic.config", ignoreInvalidFields = true)
public class ElasticSearchClientConfigProperties {
    private String username;
    private String password;
    private String ip;
    private int port;

}
