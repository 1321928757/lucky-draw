package cn.bugstack.types.common;

public class Constants {

    public final static String SPLIT = ",";
    public final static String COLON = ":";
    public final static String SPACE = " ";
    public final static String UNDERLINE = "_";

    public static class RedisKey {


        public static String ACTIVITY_KEY = "big_market_activity_key_";
        public static String ACTIVITY_SKU_KEY = "big_market_activity_sku_key_";
        public static String ACTIVITY_COUNT_KEY = "big_market_activity_count_key_";
        public static String STRATEGY_KEY = "big_market_strategy_key_";
        public static String STRATEGY_AWARD_KEY = "big_market_strategy_award_key_";
        public static String STRATEGY_AWARD_LIST_KEY = "big_market_strategy_award_list_key_";
        public static String STRATEGY_RATE_TABLE_KEY = "big_market_strategy_rate_table_key_";
        public static String STRATEGY_RATE_RANGE_KEY = "big_market_strategy_rate_range_key_";
        /** 规则决策树 key*/
        public static String RULE_TREE_VO_KEY = "rule_tree_vo_key_";
        /** 策略奖品库存 key*/
        public static String STRATEGY_AWARD_COUNT_KEY = "strategy_award_count_key_";
        /** 策略奖品库存延迟队列 key*/
        public static String STRATEGY_AWARD_COUNT_QUERY_KEY = "strategy_award_count_query_key";
        /** 策略权重信息 key*/
        public static String STRATEGY_RULE_WEIGHT_KEY = "strategy_rule_weight_key";
        /** 活动SKU库存 key*/
        public static String ACTIVITY_SKU_STOCK_COUNT_KEY = "strategy_sku_stock_count_key_";
        /** 活动SKU次数库存延迟队列 key*/
        public static String ACTIVITY_SKU_COUNT_QUERY_KEY = "strategy_sku_count_query_key";
        /** 最新获奖记录 Key*/
        public static  String AWARD_LASTEST_LIST = "award_lastest_list";

    }

    public static class MessageQueueKey {
        public static String StockUpdateExchange = "bigmarket.stock.update.exchange";
        public static String StockUpdateQueue = "bigmarket.stock.update.queue";
        public static String StockUpdateKey = "bigmarket.stock.update.key";
    }

}
