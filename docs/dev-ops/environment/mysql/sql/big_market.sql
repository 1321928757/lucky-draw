/*
 Navicat Premium Data Transfer

 Source Server         : 香港新
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : 154.201.80.213:3306
 Source Schema         : big_market

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 08/05/2024 21:13:19
*/

DROP DATABASE IF EXISTS big_market;

CREATE DATABASE IF NOT EXISTS big_market;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for award
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award`  (
                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                          `award_id` int NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
                          `award_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品对接标识 - 每一个都是一个对应的发奖策略',
                          `award_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品配置信息',
                          `award_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品内容描述',
                          `award_image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖品展示图片',
                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '奖品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES (1, 101, 'user_credit_random', '1,100', '用户积分【优先透彻规则范围，如果没有则走配置】', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:47');
INSERT INTO `award` VALUES (2, 102, 'openai_use_count', '5', 'OpenAI 增加使用次数', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:47');
INSERT INTO `award` VALUES (3, 103, 'openai_use_count', '10', 'OpenAI 增加使用次数', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:48');
INSERT INTO `award` VALUES (4, 104, 'openai_use_count', '20', 'OpenAI 增加使用次数', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:49');
INSERT INTO `award` VALUES (5, 105, 'openai_model', 'gpt-4', 'OpenAI 增加模型', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:50');
INSERT INTO `award` VALUES (6, 106, 'openai_model', 'dall-e-2', 'OpenAI 增加模型', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:51');
INSERT INTO `award` VALUES (7, 107, 'openai_model', 'dall-e-3', 'OpenAI 增加模型', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:50');
INSERT INTO `award` VALUES (8, 108, 'openai_use_count', '100', 'OpenAI 增加使用次数', 'https://img-blog.csdnimg.cn/direct/1ff3ab1f85b247b7861b0e09535e2b4e.jpeg', '2023-12-09 11:07:06', '2024-04-28 11:13:53');
INSERT INTO `award` VALUES (9, 109, 'openai_model', 'gpt-4,dall-e-2,dall-e-3', 'OpenAI 增加模型', '', '2023-12-09 11:07:06', '2023-12-09 11:12:39');
INSERT INTO `award` VALUES (10, 100, 'user_credit_blacklist', '1', '黑名单积分', '', '2024-01-06 12:30:40', '2024-01-06 12:30:46');

-- ----------------------------
-- Table structure for daily_behavior_rebate
-- ----------------------------
DROP TABLE IF EXISTS `daily_behavior_rebate`;
CREATE TABLE `daily_behavior_rebate`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                          `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                          `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
                                          `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                          `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置',
                                          `state` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（open 开启、close 关闭）',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          INDEX `idx_behavior_type`(`behavior_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日常行为返利活动配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of daily_behavior_rebate
-- ----------------------------
INSERT INTO `daily_behavior_rebate` VALUES (1, 'sign', '签到返利-sku额度', 'sku', '9011', 'open', '2024-04-30 09:32:46', '2024-04-30 18:05:23');
INSERT INTO `daily_behavior_rebate` VALUES (2, 'sign', '签到返利-积分', 'integral', '10', 'open', '2024-04-30 09:32:46', '2024-04-30 18:05:27');

-- ----------------------------
-- Table structure for raffle_activity
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity`;
CREATE TABLE `raffle_activity`  (
                                    `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                    `activity_id` bigint NOT NULL COMMENT '活动ID',
                                    `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                    `activity_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动描述',
                                    `begin_date_time` datetime NOT NULL COMMENT '开始时间',
                                    `end_date_time` datetime NOT NULL COMMENT '结束时间',
                                    `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                    `state` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '活动状态',
                                    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                    PRIMARY KEY (`id`) USING BTREE,
                                    UNIQUE INDEX `uq_activity_id`(`activity_id` ASC) USING BTREE,
                                    INDEX `idx_begin_date_time`(`begin_date_time` ASC) USING BTREE,
                                    INDEX `idx_end_date_time`(`end_date_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity
-- ----------------------------
INSERT INTO `raffle_activity` VALUES (1, 100301, '原神自选五星', '不甚，哥们，乖乖吃大保底吧~', '2024-03-09 10:15:10', '2024-06-01 10:15:10', 100006, 'open', '2024-03-09 10:15:10', '2024-05-07 20:14:33');

-- ----------------------------
-- Table structure for raffle_activity_count
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_count`;
CREATE TABLE `raffle_activity_count`  (
                                          `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                          `activity_count_id` bigint NOT NULL COMMENT '活动次数编号',
                                          `total_count` int NOT NULL COMMENT '总次数',
                                          `day_count` int NOT NULL COMMENT '日次数',
                                          `month_count` int NOT NULL COMMENT '月次数',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_activity_count_id`(`activity_count_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动次数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_count
-- ----------------------------
INSERT INTO `raffle_activity_count` VALUES (1, 11101, 1, 1, 1, '2024-03-09 10:15:42', '2024-03-16 12:30:54');

-- ----------------------------
-- Table structure for raffle_activity_sku
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_sku`;
CREATE TABLE `raffle_activity_sku`  (
                                        `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                        `sku` bigint NOT NULL COMMENT '商品sku - 把每一个组合当做一个商品',
                                        `activity_id` bigint NOT NULL COMMENT '活动ID',
                                        `activity_count_id` bigint NOT NULL COMMENT '活动个人参与次数ID',
                                        `stock_count` int NOT NULL COMMENT '商品库存',
                                        `stock_count_surplus` int NOT NULL COMMENT '剩余库存',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        PRIMARY KEY (`id`) USING BTREE,
                                        UNIQUE INDEX `uq_sku`(`sku` ASC) USING BTREE,
                                        INDEX `idx_activity_id_activity_count_id`(`activity_id` ASC, `activity_count_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_sku
-- ----------------------------
INSERT INTO `raffle_activity_sku` VALUES (1, 9011, 100301, 11101, 200, 162, '2024-03-16 11:41:09', '2024-05-08 02:22:25');

-- ----------------------------
-- Table structure for rule_tree
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree`;
CREATE TABLE `rule_tree`  (
                              `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                              `tree_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树ID',
                              `tree_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树名称',
                              `tree_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则树描述',
                              `tree_node_rule_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树根入口规则',
                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                              PRIMARY KEY (`id`) USING BTREE,
                              UNIQUE INDEX `uq_tree_id`(`tree_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '规则表-树' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rule_tree
-- ----------------------------
INSERT INTO `rule_tree` VALUES (1, 'tree_lock_1', '规则树', '规则树', 'rule_lock', '2024-01-27 10:01:59', '2024-02-15 07:49:59');
INSERT INTO `rule_tree` VALUES (2, 'tree_luck_award', '规则树-兜底奖励', '规则树-兜底奖励', 'rule_stock', '2024-02-15 07:35:06', '2024-02-15 07:50:20');
INSERT INTO `rule_tree` VALUES (3, 'tree_lock_2', '规则树', '规则树', 'rule_lock', '2024-01-27 10:01:59', '2024-02-15 07:49:59');

-- ----------------------------
-- Table structure for rule_tree_node
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree_node`;
CREATE TABLE `rule_tree_node`  (
                                   `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                   `tree_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树ID',
                                   `rule_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则Key',
                                   `rule_desc` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则描述',
                                   `rule_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则比值',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '规则表-树节点' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rule_tree_node
-- ----------------------------
INSERT INTO `rule_tree_node` VALUES (1, 'tree_lock_1', 'rule_lock', '限定用户已完成40次抽奖后解锁', '40', '2024-01-27 10:03:09', '2024-05-07 20:37:06');
INSERT INTO `rule_tree_node` VALUES (2, 'tree_lock_1', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2024-01-27 10:03:09', '2024-02-15 07:51:00');
INSERT INTO `rule_tree_node` VALUES (3, 'tree_lock_1', 'rule_stock', '库存扣减规则', NULL, '2024-01-27 10:04:43', '2024-02-15 07:51:02');
INSERT INTO `rule_tree_node` VALUES (4, 'tree_luck_award', 'rule_stock', '库存扣减规则', NULL, '2024-02-15 07:35:55', '2024-02-15 07:39:19');
INSERT INTO `rule_tree_node` VALUES (5, 'tree_luck_award', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2024-02-15 07:35:55', '2024-02-15 07:39:23');
INSERT INTO `rule_tree_node` VALUES (6, 'tree_lock_2', 'rule_lock', '限定用户已完成50次抽奖后解锁', '50', '2024-01-27 10:03:09', '2024-05-07 20:37:08');
INSERT INTO `rule_tree_node` VALUES (7, 'tree_lock_2', 'rule_luck_award', '兜底奖品随机积分', '101:1,100', '2024-01-27 10:03:09', '2024-02-08 19:59:43');
INSERT INTO `rule_tree_node` VALUES (8, 'tree_lock_2', 'rule_stock', '库存扣减规则', NULL, '2024-01-27 10:04:43', '2024-02-03 10:40:21');

-- ----------------------------
-- Table structure for rule_tree_node_line
-- ----------------------------
DROP TABLE IF EXISTS `rule_tree_node_line`;
CREATE TABLE `rule_tree_node_line`  (
                                        `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                        `tree_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则树ID',
                                        `rule_node_from` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则Key节点 From',
                                        `rule_node_to` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '规则Key节点 To',
                                        `rule_limit_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '限定类型；1:=;2:>;3:<;4:>=;5<=;6:enum[枚举范围];',
                                        `rule_limit_value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '限定值（到下个节点）',
                                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                        PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '规则表-树节点连线' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rule_tree_node_line
-- ----------------------------
INSERT INTO `rule_tree_node_line` VALUES (1, 'tree_lock_1', 'rule_lock', 'rule_stock', 'EQUAL', 'ALLOW', '2024-05-04 00:00:00', '2024-02-15 07:55:08');
INSERT INTO `rule_tree_node_line` VALUES (2, 'tree_lock_1', 'rule_lock', 'rule_luck_award', 'EQUAL', 'TAKE_OVER', '2024-05-04 00:00:00', '2024-02-15 07:55:11');
INSERT INTO `rule_tree_node_line` VALUES (3, 'tree_lock_1', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2024-05-04 00:00:00', '2024-02-15 07:55:13');
INSERT INTO `rule_tree_node_line` VALUES (4, 'tree_luck_award', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2024-02-15 07:37:31', '2024-02-15 07:39:28');
INSERT INTO `rule_tree_node_line` VALUES (5, 'tree_lock_2', 'rule_lock', 'rule_stock', 'EQUAL', 'ALLOW', '2024-05-04 00:00:00', '2024-02-15 07:55:08');
INSERT INTO `rule_tree_node_line` VALUES (6, 'tree_lock_2', 'rule_lock', 'rule_luck_award', 'EQUAL', 'TAKE_OVER', '2024-05-04 00:00:00', '2024-02-15 07:55:11');
INSERT INTO `rule_tree_node_line` VALUES (7, 'tree_lock_2', 'rule_stock', 'rule_luck_award', 'EQUAL', 'ALLOW', '2024-05-04 00:00:00', '2024-02-15 07:55:13');

-- ----------------------------
-- Table structure for strategy
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy`  (
                             `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                             `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                             `strategy_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖策略描述',
                             `rule_models` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                             PRIMARY KEY (`id`) USING BTREE,
                             INDEX `idx_strategy_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖策略' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES (6, 100006, '抽奖策略-规则树', 'rule_blacklist,rule_weight', '2024-02-03 09:53:40', '2024-05-06 20:00:07');

-- ----------------------------
-- Table structure for strategy_award
-- ----------------------------
DROP TABLE IF EXISTS `strategy_award`;
CREATE TABLE `strategy_award`  (
                                   `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                   `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                   `award_id` int NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
                                   `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖奖品标题',
                                   `award_subtitle` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '抽奖奖品副标题',
                                   `award_image` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖品展示图片',
                                   `award_count` int NOT NULL DEFAULT 0 COMMENT '奖品库存总量',
                                   `award_count_surplus` int NOT NULL DEFAULT 0 COMMENT '奖品库存剩余',
                                   `award_rate` decimal(6, 4) NOT NULL COMMENT '奖品中奖概率',
                                   `rule_models` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
                                   `sort` int NOT NULL DEFAULT 0 COMMENT '排序',
                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
                                   PRIMARY KEY (`id`) USING BTREE,
                                   INDEX `idx_strategy_id_award_id`(`strategy_id` ASC, `award_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖策略奖品概率' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of strategy_award
-- ----------------------------
INSERT INTO `strategy_award` VALUES (22, 100006, 101, '100莫拉', '金光闪闪的莫拉', 'https://luckysj-1314434715.cos.ap-shanghai.myqcloud.com/7a1c1849-b840-4678-afd1-bf3e8fe72855.png', 10000, 9998, 0.3000, 'tree_luck_award', 1, '2023-12-09 09:38:31', '2024-05-08 13:07:02');
INSERT INTO `strategy_award` VALUES (23, 100006, 102, '无锋剑', '如果剑不够锋利，那就用勇气补足吧。', 'https://patchwiki.biligame.com/images/ys/0/0d/i5smc85ma234uzd3jzx3u9onhy28i94.png', 10000, 9997, 0.2000, 'tree_luck_award', 2, '2023-12-09 09:38:31', '2024-05-08 13:09:40');
INSERT INTO `strategy_award` VALUES (24, 100006, 103, '黎明神剑', '一把曾经耀若朝阳的宝剑', 'https://patchwiki.biligame.com/images/ys/9/94/p0mzw27obtfktcgzhwu3y4vnq8nn4vn.png', 10000, 9997, 0.2000, 'tree_luck_award', 3, '2023-12-09 09:38:31', '2024-05-08 13:07:22');
INSERT INTO `strategy_award` VALUES (25, 100006, 104, '海渊终曲', '如神秘海渊一般沉默的长剑', 'https://patchwiki.biligame.com/images/ys/8/84/ndbcgqpimkebuo232ipomls00godnzz.png', 10000, 10000, 0.1000, 'tree_luck_award', 4, '2023-12-09 09:38:31', '2024-05-08 13:08:08');
INSERT INTO `strategy_award` VALUES (26, 100006, 105, '柯莱', '活跃于道成林的见习巡林员', 'https://patchwiki.biligame.com/images/ys/2/21/s0xi3unv8y860tefgz49gi56vf0or8z.png', 10000, 9998, 0.1000, 'tree_luck_award', 5, '2023-12-09 09:38:31', '2024-05-08 13:08:51');
INSERT INTO `strategy_award` VALUES (27, 100006, 106, '	珐露珊', '老阿姨', 'https://patchwiki.biligame.com/images/ys/d/d2/lrf5xycxg48dchq27stnpawuvselk4i.png', 10000, 9999, 0.1000, 'tree_luck_award', 6, '2023-12-09 09:38:31', '2024-05-08 13:08:56');
INSERT INTO `strategy_award` VALUES (28, 100006, 107, '七七', '抽奖20次后解锁', 'https://patchwiki.biligame.com/images/ys/0/05/049fpv6jcr66mln0nmbbfgigfrkgrzo.png', 10000, 10000, 0.0500, 'tree_lock_1', 7, '2023-12-09 09:38:31', '2024-05-08 13:05:50');
INSERT INTO `strategy_award` VALUES (29, 100006, 108, '阿蕾奇诺', '抽奖30次后解锁', 'https://patchwiki.biligame.com/images/ys/2/2c/6vhlw45lkuwa9b5aqr86e2bew2ln4jp.png', 10000, 10000, 0.0250, 'tree_lock_2', 8, '2023-12-09 09:38:31', '2024-05-08 13:05:50');

-- ----------------------------
-- Table structure for strategy_rule
-- ----------------------------
DROP TABLE IF EXISTS `strategy_rule`;
CREATE TABLE `strategy_rule`  (
                                  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                  `strategy_id` int NOT NULL COMMENT '抽奖策略ID',
                                  `award_id` int NULL DEFAULT NULL COMMENT '抽奖奖品ID【规则类型为策略，则不需要奖品ID】',
                                  `rule_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '抽象规则类型；1-策略规则、2-奖品规则',
                                  `rule_model` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则类型【rule_random - 随机值计算、rule_lock - 抽奖几次后解锁、rule_luck_award - 幸运奖(兜底奖品)】',
                                  `rule_value` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则比值',
                                  `rule_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖规则描述',
                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                  PRIMARY KEY (`id`) USING BTREE,
                                  INDEX `idx_strategy_id_award_id`(`strategy_id` ASC, `award_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖策略规则' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of strategy_rule
-- ----------------------------
INSERT INTO `strategy_rule` VALUES (15, 100006, NULL, 1, 'rule_weight', '80:107,108 180:108', '抽奖一定次数，必中奖范围', '2023-12-09 10:30:43', '2024-05-07 13:12:49');
INSERT INTO `strategy_rule` VALUES (16, 100006, NULL, 1, 'rule_blacklist', '101:user001,user002,user003', '黑名单抽奖，兜底抽取', '2023-12-09 12:59:45', '2024-05-07 13:03:40');

SET FOREIGN_KEY_CHECKS = 1;
