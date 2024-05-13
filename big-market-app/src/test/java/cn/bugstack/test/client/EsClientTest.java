package cn.bugstack.test.client;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch.core.IndexRequest;
import co.elastic.clients.elasticsearch.core.SearchRequest;
import co.elastic.clients.elasticsearch.ingest.simulate.Document;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.io.IOException;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest
public class EsClientTest {
    @Resource
    private ElasticsearchClient client;

    @Test
    public void testClient() throws IOException {
        Product product = new Product("abc", "Bag", 42);

        IndexRequest<Object> indexRequest = new IndexRequest.Builder<>()
                .index("products")
                .id("abc")
                .document(product)
                .build();

        client.index(indexRequest);

        Product product1 = new Product("efg", "Bag", 42);

        client.index(builder -> builder
                .index("products")
                .id(product1.getId())
                .document(product1)
        );

    }
}
