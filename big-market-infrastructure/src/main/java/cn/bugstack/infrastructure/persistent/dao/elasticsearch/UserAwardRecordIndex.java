package cn.bugstack.infrastructure.persistent.dao.elasticsearch;

import cn.bugstack.infrastructure.persistent.doc.UserAwardRecordDoc;
import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.elasticsearch._types.SortOrder;
import co.elastic.clients.elasticsearch._types.query_dsl.Query;
import co.elastic.clients.elasticsearch.core.*;
import co.elastic.clients.elasticsearch.core.search.Hit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Luckysj @刘仕杰
 * @description 用户获奖记录索引服务类
 * @create 2024/05/14 15:02:54
 */
@Component
public class UserAwardRecordIndex {
    @Resource
    private ElasticsearchClient client;

    /**
    * @description 添加用户中奖记录文档信息
    * @param recordDoc 中奖记录文档
    * @return
    * @date 2024/05/14 16:01:24
    */
    public void addUserAwardRecordDoc(UserAwardRecordDoc recordDoc) throws IOException {
        IndexRequest<UserAwardRecordDoc> request = IndexRequest.of(b -> b
                .index("user_award_record") // 索引名称
                .id(recordDoc.getOrderId()) // 订单ID作为文档ID
                .document(recordDoc) // 文档内容
        );

        client.index(request);
    }

    /**
    * @description 根据活动id查询活动最新的中奖记录
    * @param activityId 活动id
    * @param size 查询数量
    * @return
    * @date 2024/05/14 16:01:50
    */
    public List<UserAwardRecordDoc> queryLastestDocByActivityId(Long activityId, int size) throws IOException {
        // 1.构建查询请求
        SearchRequest searchRequest = SearchRequest.of(s -> s
                .index("user_award_record") // 索引名称
                .size(size) // 请求的数量
                .query(q -> q
                        .term(t -> t
                                .field("activity_id")
                                .value(activityId)
                        )
                )
                .sort(f -> f.field(o -> o.field("award_time").order(SortOrder.Desc))) // 根据中奖时间降序排序
        );

        // 2.执行查询
        SearchResponse<UserAwardRecordDoc> searchResponse = client.search(searchRequest, UserAwardRecordDoc.class);

        // 3.处理查询结果
        List<UserAwardRecordDoc> userAwardRecords = new ArrayList<>();
        for (Hit<UserAwardRecordDoc> hit : searchResponse.hits().hits()) {
            userAwardRecords.add(hit.source());
        }

        return userAwardRecords;
    }

    /**
    * @description 删除指定活动下的获奖记录文档，一般在活动结束后一段时间后可以执行
    * @param activityId 活动id
    * @return
    * @date 2024/05/14 19:43:13
    */
    public void deleteAllAwardRecordByActivityId(Long activityId) throws IOException {
        // 1.构建查询条件
        Query query = Query.of(q -> q
                .term(t -> t
                        .field("activity_id")
                        .value(activityId)
                )
        );

        // 2.创建删除请求
        DeleteByQueryRequest request = DeleteByQueryRequest.of(d -> d
                .index("user_award_record")
                .query(query)
        );

        // 3.执行删除操作
        client.deleteByQuery(request);
    }
}
