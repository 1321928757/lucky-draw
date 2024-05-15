/*
 Navicat Premium Data Transfer

 Source Server         : 香港新
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : 154.201.80.213:3306
 Source Schema         : big_market_02

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 08/05/2024 21:14:51
*/

DROP DATABASE IF EXISTS big_market;

CREATE DATABASE IF NOT EXISTS big_market;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for raffle_activity_account
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account`;
CREATE TABLE `raffle_activity_account`  (
                                            `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                            `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                            `activity_id` bigint NOT NULL COMMENT '活动ID',
                                            `total_count` int NOT NULL COMMENT '总次数',
                                            `total_count_surplus` int NOT NULL COMMENT '总次数-剩余',
                                            `day_count` int NOT NULL COMMENT '日次数',
                                            `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
                                            `month_count` int NOT NULL COMMENT '月次数',
                                            `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
                                            `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                            `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                            PRIMARY KEY (`id`) USING BTREE,
                                            UNIQUE INDEX `uq_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_account
-- ----------------------------
INSERT INTO `raffle_activity_account` VALUES (6, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, 1008, 993, 1008, 1007, 1008, 1008, '2024-05-07 13:29:49', '2024-05-08 13:09:31');

-- ----------------------------
-- Table structure for raffle_activity_account_day
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_day`;
CREATE TABLE `raffle_activity_account_day`  (
                                                `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                                `activity_id` bigint NOT NULL COMMENT '活动ID',
                                                `day` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日期（yyyy-mm-dd）',
                                                `day_count` int NOT NULL COMMENT '日次数',
                                                `day_count_surplus` int NOT NULL COMMENT '日次数-剩余',
                                                `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                PRIMARY KEY (`id`) USING BTREE,
                                                UNIQUE INDEX `uq_user_id_activity_id_day`(`user_id` ASC, `activity_id` ASC, `day` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-日次数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_account_day
-- ----------------------------
INSERT INTO `raffle_activity_account_day` VALUES (6, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '2024-05-07', 1000, 987, '2024-05-07 13:29:53', '2024-05-07 14:00:31');
INSERT INTO `raffle_activity_account_day` VALUES (7, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '2024-05-08', 1008, 1006, '2024-05-08 03:33:05', '2024-05-08 13:09:31');

-- ----------------------------
-- Table structure for raffle_activity_account_month
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_month`;
CREATE TABLE `raffle_activity_account_month`  (
                                                  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                                  `activity_id` bigint NOT NULL COMMENT '活动ID',
                                                  `month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '月（yyyy-mm）',
                                                  `month_count` int NOT NULL COMMENT '月次数',
                                                  `month_count_surplus` int NOT NULL COMMENT '月次数-剩余',
                                                  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                  PRIMARY KEY (`id`) USING BTREE,
                                                  UNIQUE INDEX `uq_user_id_activity_id_month`(`user_id` ASC, `activity_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-月次数' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_account_month
-- ----------------------------
INSERT INTO `raffle_activity_account_month` VALUES (4, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '2024-05', 1008, 993, '2024-05-07 13:29:53', '2024-05-08 13:09:31');

-- ----------------------------
-- Table structure for raffle_activity_order_000
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_000`;
CREATE TABLE `raffle_activity_order_000`  (
                                              `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                              `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                              `sku` bigint NOT NULL COMMENT '商品sku',
                                              `activity_id` bigint NOT NULL COMMENT '活动ID',
                                              `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                              `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                              `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                              `order_time` datetime NOT NULL COMMENT '下单时间',
                                              `total_count` int NOT NULL COMMENT '总次数',
                                              `day_count` int NOT NULL COMMENT '日次数',
                                              `month_count` int NOT NULL COMMENT '月次数',
                                              `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                              `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                              UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
                                              INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_order_000
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_001
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_001`;
CREATE TABLE `raffle_activity_order_001`  (
                                              `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                              `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                              `sku` bigint NOT NULL COMMENT '商品sku',
                                              `activity_id` bigint NOT NULL COMMENT '活动ID',
                                              `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                              `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                              `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                              `order_time` datetime NOT NULL COMMENT '下单时间',
                                              `total_count` int NOT NULL COMMENT '总次数',
                                              `day_count` int NOT NULL COMMENT '日次数',
                                              `month_count` int NOT NULL COMMENT '月次数',
                                              `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                              `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                              UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
                                              INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_order_001
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_002
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_002`;
CREATE TABLE `raffle_activity_order_002`  (
                                              `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                              `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                              `sku` bigint NOT NULL COMMENT '商品sku',
                                              `activity_id` bigint NOT NULL COMMENT '活动ID',
                                              `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                              `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                              `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                              `order_time` datetime NOT NULL COMMENT '下单时间',
                                              `total_count` int NOT NULL COMMENT '总次数',
                                              `day_count` int NOT NULL COMMENT '日次数',
                                              `month_count` int NOT NULL COMMENT '月次数',
                                              `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                              `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                              UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
                                              INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_003
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_003`;
CREATE TABLE `raffle_activity_order_003`  (
                                              `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                              `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                              `sku` bigint NOT NULL COMMENT '商品sku',
                                              `activity_id` bigint NOT NULL COMMENT '活动ID',
                                              `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                              `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                              `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                              `order_time` datetime NOT NULL COMMENT '下单时间',
                                              `total_count` int NOT NULL COMMENT '总次数',
                                              `day_count` int NOT NULL COMMENT '日次数',
                                              `month_count` int NOT NULL COMMENT '月次数',
                                              `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                              `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                              `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                              `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                              PRIMARY KEY (`id`) USING BTREE,
                                              UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                              UNIQUE INDEX `uq_out_business_no`(`out_business_no` ASC) USING BTREE,
                                              INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of raffle_activity_order_003
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
                         `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                         `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                         `topic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主题',
                         `message_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消息编号',
                         `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主体',
                         `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                         PRIMARY KEY (`id`) USING BTREE,
                         UNIQUE INDEX `uq_message_id`(`message_id` ASC) USING BTREE,
                         INDEX `idx_state`(`state` ASC) USING BTREE,
                         INDEX `idx_create_time`(`update_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表，发送MQ' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (83, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '85954351244', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240507\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"85954351244\",\"timestamp\":1715088442177}', 'complete', '2024-05-07 13:27:22', '2024-05-07 13:27:23');
INSERT INTO `task` VALUES (84, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '01709191252', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240507\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"01709191252\",\"timestamp\":1715088442192}', 'complete', '2024-05-07 13:27:23', '2024-05-07 13:27:23');
INSERT INTO `task` VALUES (85, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '06605710608', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240507\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"06605710608\",\"timestamp\":1715088589281}', 'complete', '2024-05-07 13:29:49', '2024-05-07 13:29:49');
INSERT INTO `task` VALUES (86, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '07331382784', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240507\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"07331382784\",\"timestamp\":1715088589281}', 'complete', '2024-05-07 13:29:49', '2024-05-07 13:29:49');
INSERT INTO `task` VALUES (87, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '49970237100', '{\"data\":{\"awardId\":101,\"awardTitle\":\"100莫拉\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"49970237100\",\"timestamp\":\"2024-05-07 21:29:53.78\"}', 'complete', '2024-05-07 13:29:53', '2024-05-07 13:29:53');
INSERT INTO `task` VALUES (88, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '95998375239', '{\"data\":{\"awardId\":105,\"awardTitle\":\"科莱\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"95998375239\",\"timestamp\":\"2024-05-07 21:54:31.633\"}', 'complete', '2024-05-07 13:54:31', '2024-05-07 13:54:31');
INSERT INTO `task` VALUES (89, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '76662763371', '{\"data\":{\"awardId\":101,\"awardTitle\":\"100莫拉\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"76662763371\",\"timestamp\":\"2024-05-07 21:54:38.205\"}', 'complete', '2024-05-07 13:54:38', '2024-05-07 13:54:38');
INSERT INTO `task` VALUES (90, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '94370348414', '{\"data\":{\"awardId\":102,\"awardTitle\":\"无锋剑\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"94370348414\",\"timestamp\":\"2024-05-07 21:54:44.438\"}', 'complete', '2024-05-07 13:54:44', '2024-05-07 13:54:44');
INSERT INTO `task` VALUES (91, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '13311908605', '{\"data\":{\"awardId\":103,\"awardTitle\":\"黎明神剑\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"13311908605\",\"timestamp\":\"2024-05-07 21:54:50.842\"}', 'complete', '2024-05-07 13:54:50', '2024-05-07 13:54:50');
INSERT INTO `task` VALUES (92, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '42026494185', '{\"data\":{\"awardId\":101,\"awardTitle\":\"100莫拉\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"42026494185\",\"timestamp\":\"2024-05-07 21:59:09.387\"}', 'complete', '2024-05-07 13:59:09', '2024-05-07 13:59:09');
INSERT INTO `task` VALUES (93, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '67819157620', '{\"data\":{\"awardId\":103,\"awardTitle\":\"黎明神剑\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"67819157620\",\"timestamp\":\"2024-05-07 21:59:36.417\"}', 'complete', '2024-05-07 13:59:36', '2024-05-07 13:59:36');
INSERT INTO `task` VALUES (94, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '55575990696', '{\"data\":{\"awardId\":101,\"awardTitle\":\"100莫拉\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"55575990696\",\"timestamp\":\"2024-05-07 21:59:51.465\"}', 'complete', '2024-05-07 13:59:51', '2024-05-07 13:59:51');
INSERT INTO `task` VALUES (95, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '06846384063', '{\"data\":{\"awardId\":106,\"awardTitle\":\"	珐露珊\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"06846384063\",\"timestamp\":\"2024-05-07 21:59:58.728\"}', 'complete', '2024-05-07 13:59:58', '2024-05-07 13:59:58');
INSERT INTO `task` VALUES (96, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '32931830113', '{\"data\":{\"awardId\":102,\"awardTitle\":\"无锋剑\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"32931830113\",\"timestamp\":\"2024-05-07 22:00:05.994\"}', 'complete', '2024-05-07 14:00:06', '2024-05-07 14:00:06');
INSERT INTO `task` VALUES (97, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '73810703310', '{\"data\":{\"awardId\":103,\"awardTitle\":\"黎明神剑\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"73810703310\",\"timestamp\":\"2024-05-07 22:00:12.414\"}', 'complete', '2024-05-07 14:00:12', '2024-05-07 14:00:12');
INSERT INTO `task` VALUES (98, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '04682640665', '{\"data\":{\"awardId\":103,\"awardTitle\":\"黎明神剑\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"04682640665\",\"timestamp\":\"2024-05-07 22:00:18.82\"}', 'complete', '2024-05-07 14:00:18', '2024-05-07 14:00:18');
INSERT INTO `task` VALUES (99, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '14730804712', '{\"data\":{\"awardId\":105,\"awardTitle\":\"科莱\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"14730804712\",\"timestamp\":\"2024-05-07 22:00:25.098\"}', 'complete', '2024-05-07 14:00:25', '2024-05-07 14:00:25');
INSERT INTO `task` VALUES (100, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '22115411303', '{\"data\":{\"awardId\":105,\"awardTitle\":\"科莱\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"22115411303\",\"timestamp\":\"2024-05-07 22:00:31.996\"}', 'complete', '2024-05-07 14:00:32', '2024-05-07 14:00:32');
INSERT INTO `task` VALUES (101, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '38427675402', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"38427675402\",\"timestamp\":1715133189861}', 'complete', '2024-05-08 01:53:09', '2024-05-08 01:53:09');
INSERT INTO `task` VALUES (102, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '19797347255', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"19797347255\",\"timestamp\":1715133189862}', 'complete', '2024-05-08 01:53:09', '2024-05-08 01:53:09');
INSERT INTO `task` VALUES (103, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '52558599057', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"52558599057\",\"timestamp\":1715133321973}', 'complete', '2024-05-08 01:55:21', '2024-05-08 01:55:22');
INSERT INTO `task` VALUES (104, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '46175975974', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"46175975974\",\"timestamp\":1715133321973}', 'complete', '2024-05-08 01:55:21', '2024-05-08 01:55:22');
INSERT INTO `task` VALUES (105, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '93565187529', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"93565187529\",\"timestamp\":1715133418155}', 'complete', '2024-05-08 01:56:58', '2024-05-08 01:56:58');
INSERT INTO `task` VALUES (106, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '16288757164', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"16288757164\",\"timestamp\":1715133418155}', 'complete', '2024-05-08 01:56:58', '2024-05-08 01:56:58');
INSERT INTO `task` VALUES (107, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '52248025765', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"52248025765\",\"timestamp\":1715133566535}', 'complete', '2024-05-08 01:59:26', '2024-05-08 01:59:26');
INSERT INTO `task` VALUES (108, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '68167952970', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"68167952970\",\"timestamp\":1715133566550}', 'complete', '2024-05-08 01:59:26', '2024-05-08 01:59:26');
INSERT INTO `task` VALUES (109, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '55755833790', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"55755833790\",\"timestamp\":1715134349369}', 'complete', '2024-05-08 02:12:29', '2024-05-08 02:12:29');
INSERT INTO `task` VALUES (110, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '66002785212', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"66002785212\",\"timestamp\":1715134349422}', 'complete', '2024-05-08 02:12:29', '2024-05-08 02:12:29');
INSERT INTO `task` VALUES (111, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '07409079564', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"07409079564\",\"timestamp\":1715134397290}', 'complete', '2024-05-08 02:13:17', '2024-05-08 02:13:17');
INSERT INTO `task` VALUES (112, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '16345805612', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"16345805612\",\"timestamp\":1715134397290}', 'complete', '2024-05-08 02:13:17', '2024-05-08 02:13:17');
INSERT INTO `task` VALUES (113, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '93732297307', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"93732297307\",\"timestamp\":1715134609288}', 'complete', '2024-05-08 02:16:49', '2024-05-08 02:16:49');
INSERT INTO `task` VALUES (114, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '84688550668', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"84688550668\",\"timestamp\":1715134609293}', 'complete', '2024-05-08 02:16:49', '2024-05-08 02:16:49');
INSERT INTO `task` VALUES (115, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '33233357746', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"33233357746\",\"timestamp\":1715134626193}', 'complete', '2024-05-08 02:17:06', '2024-05-08 02:17:06');
INSERT INTO `task` VALUES (116, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '20659429836', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"20659429836\",\"timestamp\":1715134626193}', 'complete', '2024-05-08 02:17:06', '2024-05-08 02:17:06');
INSERT INTO `task` VALUES (117, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '14152936605', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_sku_20240508\",\"rebateConfig\":\"9011\",\"rebateType\":\"sku\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"14152936605\",\"timestamp\":1715134940102}', 'complete', '2024-05-08 02:22:20', '2024-05-08 02:22:20');
INSERT INTO `task` VALUES (118, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.send_rebate', '73474384006', '{\"data\":{\"bizId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI_integral_20240508\",\"rebateConfig\":\"10\",\"rebateType\":\"integral\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"73474384006\",\"timestamp\":1715134940102}', 'complete', '2024-05-08 02:22:20', '2024-05-08 02:22:20');
INSERT INTO `task` VALUES (119, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 'bigmarket.award_send', '34416220298', '{\"data\":{\"awardId\":101,\"awardTitle\":\"100莫拉\",\"userId\":\"ogdb46DaYxN6nliqjeveqnZMfqmI\"},\"id\":\"34416220298\",\"timestamp\":\"2024-05-08 11:33:06.199\"}', 'complete', '2024-05-08 03:33:06', '2024-05-08 03:33:06');

-- ----------------------------
-- Table structure for user_award_record_000
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_000`;
CREATE TABLE `user_award_record_000`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                          `award_id` int NOT NULL COMMENT '奖品ID',
                                          `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
                                          `award_image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖品预览图片',
                                          `award_time` datetime NOT NULL COMMENT '中奖时间',
                                          `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                          INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
                                          INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_award_record_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_001
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_001`;
CREATE TABLE `user_award_record_001`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                          `award_id` int NOT NULL COMMENT '奖品ID',
                                          `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
                                          `award_image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖品预览图片',
                                          `award_time` datetime NOT NULL COMMENT '中奖时间',
                                          `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                          INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
                                          INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_award_record_001
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_002
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_002`;
CREATE TABLE `user_award_record_002`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                          `award_id` int NOT NULL COMMENT '奖品ID',
                                          `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
                                          `award_image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖品预览图片',
                                          `award_time` datetime NOT NULL COMMENT '中奖时间',
                                          `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                          INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
                                          INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_award_record_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_003
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_003`;
CREATE TABLE `user_award_record_003`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                          `award_id` int NOT NULL COMMENT '奖品ID',
                                          `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
                                          `award_image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '奖品预览图片',
                                          `award_time` datetime NOT NULL COMMENT '中奖时间',
                                          `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                          INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
                                          INDEX `idx_award_id`(`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_award_record_003
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_000
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_000`;
CREATE TABLE `user_behavior_rebate_order_000`  (
                                                   `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                                   `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                                   `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                   `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
                                                   `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                   `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                   `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                   `biz_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                   PRIMARY KEY (`id`) USING BTREE,
                                                   UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                                   UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
                                                   INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_behavior_rebate_order_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_001
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_001`;
CREATE TABLE `user_behavior_rebate_order_001`  (
                                                   `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                                   `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                                   `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                   `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
                                                   `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                   `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                   `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                   `biz_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                   PRIMARY KEY (`id`) USING BTREE,
                                                   UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                                   UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
                                                   INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_behavior_rebate_order_001
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_002
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_002`;
CREATE TABLE `user_behavior_rebate_order_002`  (
                                                   `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                                   `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                                   `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                   `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
                                                   `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                   `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                   `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                   `biz_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                   PRIMARY KEY (`id`) USING BTREE,
                                                   UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                                   UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
                                                   INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_behavior_rebate_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_behavior_rebate_order_003
-- ----------------------------
DROP TABLE IF EXISTS `user_behavior_rebate_order_003`;
CREATE TABLE `user_behavior_rebate_order_003`  (
                                                   `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                   `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                                   `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                                   `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '行为类型（sign 签到、openai_pay 支付）',
                                                   `rebate_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
                                                   `rebate_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利类型（sku 活动库存充值商品、integral 用户活动积分）',
                                                   `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利配置【sku值，积分值】',
                                                   `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传，方便查询使用',
                                                   `biz_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务ID - 拼接的唯一值。拼接 out_business_no + 自身枚举',
                                                   `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                   `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                   PRIMARY KEY (`id`) USING BTREE,
                                                   UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                                   UNIQUE INDEX `uq_biz_id`(`biz_id` ASC) USING BTREE,
                                                   INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户行为返利流水订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_behavior_rebate_order_003
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_000
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_000`;
CREATE TABLE `user_raffle_order_000`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                          `order_time` datetime NOT NULL COMMENT '下单时间',
                                          `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_raffle_order_000
-- ----------------------------
INSERT INTO `user_raffle_order_000` VALUES (48, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '367108750005', '2024-05-07 13:29:53', 'used', '2024-05-07 13:29:53', '2024-05-07 13:29:53');
INSERT INTO `user_raffle_order_000` VALUES (49, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '867424405607', '2024-05-07 13:54:31', 'used', '2024-05-07 13:54:31', '2024-05-07 13:54:31');
INSERT INTO `user_raffle_order_000` VALUES (50, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '814426020185', '2024-05-07 13:54:38', 'used', '2024-05-07 13:54:37', '2024-05-07 13:54:38');
INSERT INTO `user_raffle_order_000` VALUES (51, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '848406161439', '2024-05-07 13:54:44', 'used', '2024-05-07 13:54:44', '2024-05-07 13:54:44');
INSERT INTO `user_raffle_order_000` VALUES (52, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '704845461715', '2024-05-07 13:54:50', 'used', '2024-05-07 13:54:50', '2024-05-07 13:54:50');
INSERT INTO `user_raffle_order_000` VALUES (53, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '222525341623', '2024-05-07 13:59:09', 'used', '2024-05-07 13:59:09', '2024-05-07 13:59:09');
INSERT INTO `user_raffle_order_000` VALUES (54, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '319355181604', '2024-05-07 13:59:36', 'used', '2024-05-07 13:59:36', '2024-05-07 13:59:36');
INSERT INTO `user_raffle_order_000` VALUES (55, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '195223305361', '2024-05-07 13:59:51', 'used', '2024-05-07 13:59:51', '2024-05-07 13:59:51');
INSERT INTO `user_raffle_order_000` VALUES (56, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '542045193826', '2024-05-07 13:59:58', 'used', '2024-05-07 13:59:58', '2024-05-07 13:59:58');
INSERT INTO `user_raffle_order_000` VALUES (57, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '250484877474', '2024-05-07 14:00:06', 'used', '2024-05-07 14:00:05', '2024-05-07 14:00:06');
INSERT INTO `user_raffle_order_000` VALUES (58, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '598815177061', '2024-05-07 14:00:12', 'used', '2024-05-07 14:00:12', '2024-05-07 14:00:12');
INSERT INTO `user_raffle_order_000` VALUES (59, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '100543311382', '2024-05-07 14:00:19', 'used', '2024-05-07 14:00:18', '2024-05-07 14:00:18');
INSERT INTO `user_raffle_order_000` VALUES (60, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '289144637082', '2024-05-07 14:00:25', 'used', '2024-05-07 14:00:24', '2024-05-07 14:00:25');
INSERT INTO `user_raffle_order_000` VALUES (61, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '366667750288', '2024-05-07 14:00:32', 'used', '2024-05-07 14:00:31', '2024-05-07 14:00:32');
INSERT INTO `user_raffle_order_000` VALUES (62, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '406398291520', '2024-05-08 03:33:06', 'used', '2024-05-08 03:33:05', '2024-05-08 03:33:06');
INSERT INTO `user_raffle_order_000` VALUES (63, 'ogdb46DaYxN6nliqjeveqnZMfqmI', 100301, '原神自选五星', 100006, '898407757072', '2024-05-08 13:09:32', 'create', '2024-05-08 13:09:31', '2024-05-08 13:09:31');

-- ----------------------------
-- Table structure for user_raffle_order_001
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_001`;
CREATE TABLE `user_raffle_order_001`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                          `order_time` datetime NOT NULL COMMENT '下单时间',
                                          `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_raffle_order_001
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_002
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_002`;
CREATE TABLE `user_raffle_order_002`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                          `order_time` datetime NOT NULL COMMENT '下单时间',
                                          `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_raffle_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_003
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_003`;
CREATE TABLE `user_raffle_order_003`  (
                                          `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                          `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
                                          `activity_id` bigint NOT NULL COMMENT '活动ID',
                                          `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
                                          `strategy_id` bigint NOT NULL COMMENT '抽奖策略ID',
                                          `order_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
                                          `order_time` datetime NOT NULL COMMENT '下单时间',
                                          `order_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                          `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                          `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `uq_order_id`(`order_id` ASC) USING BTREE,
                                          INDEX `idx_user_id_activity_id`(`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_raffle_order_003
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
