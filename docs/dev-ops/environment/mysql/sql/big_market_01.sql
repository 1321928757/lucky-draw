/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : big_market_01

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 28/04/2024 21:29:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for raffle_activity_account
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account`;
CREATE TABLE `raffle_activity_account`
(
    `id`                  bigint UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`         bigint                                                       NOT NULL COMMENT '活动ID',
    `total_count`         int                                                          NOT NULL COMMENT '总次数',
    `total_count_surplus` int                                                          NOT NULL COMMENT '总次数-剩余',
    `day_count`           int                                                          NOT NULL COMMENT '日次数',
    `day_count_surplus`   int                                                          NOT NULL COMMENT '日次数-剩余',
    `month_count`         int                                                          NOT NULL COMMENT '月次数',
    `month_count_surplus` int                                                          NOT NULL COMMENT '月次数-剩余',
    `create_time`         datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_user_id_activity_id` (`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account
-- ----------------------------
INSERT INTO `raffle_activity_account`
VALUES (3, 'xiaofuge', 100301, 45, 42, 45, 45, 45, 45, '2024-03-23 16:38:57', '2024-04-28 21:28:43');

-- ----------------------------
-- Table structure for raffle_activity_account_day
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_day`;
CREATE TABLE `raffle_activity_account_day`
(
    `id`                int UNSIGNED                                                 NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`           varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`       bigint                                                       NOT NULL COMMENT '活动ID',
    `day`               varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日期（yyyy-mm-dd）',
    `day_count`         int                                                          NOT NULL COMMENT '日次数',
    `day_count_surplus` int                                                          NOT NULL COMMENT '日次数-剩余',
    `create_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`       datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_user_id_activity_id_day` (`user_id` ASC, `activity_id` ASC, `day` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-日次数'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account_day
-- ----------------------------
INSERT INTO `raffle_activity_account_day`
VALUES (3, 'xiaofuge', 100301, '2024-03-15', 45, 45, '2024-04-16 20:20:44', '2024-04-16 21:10:03');
INSERT INTO `raffle_activity_account_day`
VALUES (4, 'xiaofuge', 100301, '2024-04-16', 45, 30, '2024-04-16 20:25:53', '2024-04-16 21:16:41');
INSERT INTO `raffle_activity_account_day`
VALUES (5, 'xiaofuge', 100301, '2024-04-24', 45, 45, '2024-04-24 19:38:30', '2024-04-24 19:58:30');
INSERT INTO `raffle_activity_account_day`
VALUES (6, 'xiaofuge', 100301, '2024-04-26', 45, 15, '2024-04-26 21:27:35', '2024-04-26 21:32:56');
INSERT INTO `raffle_activity_account_day`
VALUES (7, 'xiaofuge', 100301, '2024-04-27', 45, 3, '2024-04-27 16:55:20', '2024-04-27 21:51:47');
INSERT INTO `raffle_activity_account_day`
VALUES (8, 'xiaofuge', 100301, '2024-04-28', 45, 42, '2024-04-28 15:36:57', '2024-04-28 21:28:43');

-- ----------------------------
-- Table structure for raffle_activity_account_month
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_account_month`;
CREATE TABLE `raffle_activity_account_month`
(
    `id`                  int UNSIGNED                                                 NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`             varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`         bigint                                                       NOT NULL COMMENT '活动ID',
    `month`               varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '月（yyyy-mm）',
    `month_count`         int                                                          NOT NULL COMMENT '月次数',
    `month_count_surplus` int                                                          NOT NULL COMMENT '月次数-剩余',
    `create_time`         datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_user_id_activity_id_month` (`user_id` ASC, `activity_id` ASC, `month` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动账户表-月次数'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_account_month
-- ----------------------------
INSERT INTO `raffle_activity_account_month`
VALUES (6, 'xiaofuge', 100301, '2024-03', 45, 45, '2024-04-16 20:20:44', '2024-04-16 21:10:06');
INSERT INTO `raffle_activity_account_month`
VALUES (7, 'xiaofuge', 100301, '2024-04', 45, 42, '2024-04-16 20:25:53', '2024-04-28 21:28:43');

-- ----------------------------
-- Table structure for raffle_activity_order_000
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_000`;
CREATE TABLE `raffle_activity_order_000`
(
    `id`              bigint UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `sku`             bigint                                                       NOT NULL COMMENT '商品sku',
    `activity_id`     bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`      datetime                                                     NOT NULL COMMENT '下单时间',
    `total_count`     int                                                          NOT NULL COMMENT '总次数',
    `day_count`       int                                                          NOT NULL COMMENT '日次数',
    `month_count`     int                                                          NOT NULL COMMENT '月次数',
    `state`           varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    UNIQUE INDEX `uq_out_business_no` (`out_business_no` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_000
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_001
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_001`;
CREATE TABLE `raffle_activity_order_001`
(
    `id`              bigint UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `sku`             bigint                                                       NOT NULL COMMENT '商品sku',
    `activity_id`     bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`      datetime                                                     NOT NULL COMMENT '下单时间',
    `total_count`     int                                                          NOT NULL COMMENT '总次数',
    `day_count`       int                                                          NOT NULL COMMENT '日次数',
    `month_count`     int                                                          NOT NULL COMMENT '月次数',
    `state`           varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    UNIQUE INDEX `uq_out_business_no` (`out_business_no` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 56
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_001
-- ----------------------------
INSERT INTO `raffle_activity_order_001`
VALUES (10, 'xiaofuge', 9011, 100301, '测试活动', 100006, '973296627434', '2024-03-23 08:38:58', 1, 1, 1, 'completed',
        '700091009111', '2024-03-23 16:38:57', '2024-03-23 16:38:57');
INSERT INTO `raffle_activity_order_001`
VALUES (11, 'xiaofuge', 9011, 100301, '测试活动', 100006, '659722993182', '2024-03-23 09:38:54', 1, 1, 1, 'completed',
        '700091009112', '2024-03-23 17:38:54', '2024-03-23 17:38:54');
INSERT INTO `raffle_activity_order_001`
VALUES (13, 'xiaofuge', 9011, 100301, '测试活动', 100006, '773767968094', '2024-03-23 09:40:11', 1, 1, 1, 'completed',
        '700091009113', '2024-03-23 17:40:10', '2024-03-23 17:40:10');
INSERT INTO `raffle_activity_order_001`
VALUES (14, 'xiaofuge', 9011, 100301, '测试活动', 100006, '977898032977', '2024-03-30 04:13:20', 1, 1, 1, 'completed',
        '562827683573', '2024-03-30 12:13:20', '2024-03-30 12:13:20');
INSERT INTO `raffle_activity_order_001`
VALUES (15, 'xiaofuge', 9011, 100301, '测试活动', 100006, '981492025457', '2024-03-30 05:17:51', 1, 1, 1, 'completed',
        '827130794336', '2024-03-30 13:17:51', '2024-03-30 13:17:51');
INSERT INTO `raffle_activity_order_001`
VALUES (16, 'xiaofuge', 9011, 100301, '测试活动', 100006, '119662227336', '2024-03-30 05:17:51', 1, 1, 1, 'completed',
        '150844059982', '2024-03-30 13:17:51', '2024-03-30 13:17:51');
INSERT INTO `raffle_activity_order_001`
VALUES (17, 'xiaofuge', 9011, 100301, '测试活动', 100006, '690133201288', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '953370122326', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (18, 'xiaofuge', 9011, 100301, '测试活动', 100006, '593200667289', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '111390727659', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (19, 'xiaofuge', 9011, 100301, '测试活动', 100006, '980711076393', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '039423474452', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (20, 'xiaofuge', 9011, 100301, '测试活动', 100006, '551375935033', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '280668320055', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (21, 'xiaofuge', 9011, 100301, '测试活动', 100006, '716528762190', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '330472003431', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (22, 'xiaofuge', 9011, 100301, '测试活动', 100006, '644880195681', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '896655771302', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (23, 'xiaofuge', 9011, 100301, '测试活动', 100006, '918009421723', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '223114193931', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (24, 'xiaofuge', 9011, 100301, '测试活动', 100006, '414038400484', '2024-03-30 05:33:39', 1, 1, 1, 'completed',
        '669801912616', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (25, 'xiaofuge', 9011, 100301, '测试活动', 100006, '819052152409', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '968823148813', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (26, 'xiaofuge', 9011, 100301, '测试活动', 100006, '013685589273', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '281985691959', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (27, 'xiaofuge', 9011, 100301, '测试活动', 100006, '694790983278', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '812013952722', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (28, 'xiaofuge', 9011, 100301, '测试活动', 100006, '601285862715', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '102122841078', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (29, 'xiaofuge', 9011, 100301, '测试活动', 100006, '278549779124', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '795697718772', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (30, 'xiaofuge', 9011, 100301, '测试活动', 100006, '867889977246', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '419196278242', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (31, 'xiaofuge', 9011, 100301, '测试活动', 100006, '270946272407', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '297043861965', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (32, 'xiaofuge', 9011, 100301, '测试活动', 100006, '798392711746', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '721157339512', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (33, 'xiaofuge', 9011, 100301, '测试活动', 100006, '037305996439', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '088008719855', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (34, 'xiaofuge', 9011, 100301, '测试活动', 100006, '015056893123', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '885793880817', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (35, 'xiaofuge', 9011, 100301, '测试活动', 100006, '422734098553', '2024-03-30 05:33:40', 1, 1, 1, 'completed',
        '048066377262', '2024-03-30 13:33:39', '2024-03-30 13:33:39');
INSERT INTO `raffle_activity_order_001`
VALUES (36, 'xiaofuge', 9011, 100301, '测试活动', 100006, '125534021547', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '237913144976', '2024-03-30 17:10:05', '2024-03-30 17:10:05');
INSERT INTO `raffle_activity_order_001`
VALUES (37, 'xiaofuge', 9011, 100301, '测试活动', 100006, '906577205018', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '257763123780', '2024-03-30 17:10:05', '2024-03-30 17:10:05');
INSERT INTO `raffle_activity_order_001`
VALUES (38, 'xiaofuge', 9011, 100301, '测试活动', 100006, '577878467308', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '690370155629', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (39, 'xiaofuge', 9011, 100301, '测试活动', 100006, '130934158588', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '864303749107', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (40, 'xiaofuge', 9011, 100301, '测试活动', 100006, '484575318240', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '355946107906', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (41, 'xiaofuge', 9011, 100301, '测试活动', 100006, '334219563572', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '629679608889', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (42, 'xiaofuge', 9011, 100301, '测试活动', 100006, '905424061364', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '766840362369', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (43, 'xiaofuge', 9011, 100301, '测试活动', 100006, '081184848765', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '805402859227', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (44, 'xiaofuge', 9011, 100301, '测试活动', 100006, '245273095853', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '333924242550', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (45, 'xiaofuge', 9011, 100301, '测试活动', 100006, '645786614176', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '709012965465', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (46, 'xiaofuge', 9011, 100301, '测试活动', 100006, '976098448519', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '076464685314', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (47, 'xiaofuge', 9011, 100301, '测试活动', 100006, '359533807959', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '501769140520', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (48, 'xiaofuge', 9011, 100301, '测试活动', 100006, '069825222776', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '362857642896', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (49, 'xiaofuge', 9011, 100301, '测试活动', 100006, '793595913277', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '886499146967', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (50, 'xiaofuge', 9011, 100301, '测试活动', 100006, '591290337369', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '756466322485', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (51, 'xiaofuge', 9011, 100301, '测试活动', 100006, '216203170946', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '616831586240', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (52, 'xiaofuge', 9011, 100301, '测试活动', 100006, '331973376483', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '809200206672', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (53, 'xiaofuge', 9011, 100301, '测试活动', 100006, '358968919391', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '619112026689', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (54, 'xiaofuge', 9011, 100301, '测试活动', 100006, '094263379883', '2024-03-30 09:10:06', 1, 1, 1, 'completed',
        '746237303851', '2024-03-30 17:10:06', '2024-03-30 17:10:06');
INSERT INTO `raffle_activity_order_001`
VALUES (56, 'xiaofuge', 9011, 100301, '测试活动', 100006, '381900087970', '2024-04-05 06:19:30', 1, 1, 1, 'completed',
        '700091009119', '2024-04-05 14:19:30', '2024-04-05 14:19:30');

-- ----------------------------
-- Table structure for raffle_activity_order_002
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_002`;
CREATE TABLE `raffle_activity_order_002`
(
    `id`              bigint UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `sku`             bigint                                                       NOT NULL COMMENT '商品sku',
    `activity_id`     bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`      datetime                                                     NOT NULL COMMENT '下单时间',
    `total_count`     int                                                          NOT NULL COMMENT '总次数',
    `day_count`       int                                                          NOT NULL COMMENT '日次数',
    `month_count`     int                                                          NOT NULL COMMENT '月次数',
    `state`           varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    UNIQUE INDEX `uq_out_business_no` (`out_business_no` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for raffle_activity_order_003
-- ----------------------------
DROP TABLE IF EXISTS `raffle_activity_order_003`;
CREATE TABLE `raffle_activity_order_003`
(
    `id`              bigint UNSIGNED                                              NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `sku`             bigint                                                       NOT NULL COMMENT '商品sku',
    `activity_id`     bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`      datetime                                                     NOT NULL COMMENT '下单时间',
    `total_count`     int                                                          NOT NULL COMMENT '总次数',
    `day_count`       int                                                          NOT NULL COMMENT '日次数',
    `month_count`     int                                                          NOT NULL COMMENT '月次数',
    `state`           varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    UNIQUE INDEX `uq_out_business_no` (`out_business_no` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC, `state` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '抽奖活动单'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of raffle_activity_order_003
-- ----------------------------

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`
(
    `id`          int UNSIGNED                                                  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `topic`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '消息主题',
    `message_id`  varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL     DEFAULT NULL COMMENT '消息编号',
    `message`     varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息主体',
    `state`       varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
    `create_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_message_id` (`message_id` ASC) USING BTREE,
    INDEX `idx_state` (`state` ASC) USING BTREE,
    INDEX `idx_create_time` (`update_time` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 588
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务表，发送MQ'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task`
VALUES (1, 'xiaofuge', 'send_award', '23913710462',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"23913710462\",\"timestamp\":1712374909975}',
        'completed', '2024-04-06 11:41:50', '2024-04-06 12:14:50');
INSERT INTO `task`
VALUES (2, 'xiaofuge', 'send_award', '33004806135',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33004806135\",\"timestamp\":1712375273609}',
        'completed', '2024-04-06 11:47:54', '2024-04-06 12:14:50');
INSERT INTO `task`
VALUES (3, 'xiaofuge', 'send_award', '61315401992',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61315401992\",\"timestamp\":1712377009778}',
        'completed', '2024-04-06 12:16:50', '2024-04-06 12:16:50');
INSERT INTO `task`
VALUES (4, 'xiaofuge', 'send_award', '74920280321',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74920280321\",\"timestamp\":1712377010878}',
        'completed', '2024-04-06 12:16:50', '2024-04-06 12:16:50');
INSERT INTO `task`
VALUES (5, 'xiaofuge', 'send_award', '71692388884',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71692388884\",\"timestamp\":1712377011390}',
        'completed', '2024-04-06 12:16:51', '2024-04-06 12:16:51');
INSERT INTO `task`
VALUES (6, 'xiaofuge', 'send_award', '11524874230',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11524874230\",\"timestamp\":1712377011913}',
        'completed', '2024-04-06 12:16:51', '2024-04-06 12:16:51');
INSERT INTO `task`
VALUES (7, 'xiaofuge', 'send_award', '39972412889',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39972412889\",\"timestamp\":1712377012434}',
        'completed', '2024-04-06 12:16:52', '2024-04-06 12:16:52');
INSERT INTO `task`
VALUES (8, 'xiaofuge', 'send_award', '79019640497',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"79019640497\",\"timestamp\":1712377012955}',
        'completed', '2024-04-06 12:16:52', '2024-04-06 12:16:52');
INSERT INTO `task`
VALUES (9, 'xiaofuge', 'send_award', '97077031398',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97077031398\",\"timestamp\":1712377013498}',
        'completed', '2024-04-06 12:16:53', '2024-04-06 12:16:53');
INSERT INTO `task`
VALUES (10, 'xiaofuge', 'send_award', '08720582836',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08720582836\",\"timestamp\":1712377014017}',
        'completed', '2024-04-06 12:16:54', '2024-04-06 12:16:54');
INSERT INTO `task`
VALUES (11, 'xiaofuge', 'send_award', '60787815183',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"60787815183\",\"timestamp\":1712377014529}',
        'completed', '2024-04-06 12:16:54', '2024-04-06 12:16:54');
INSERT INTO `task`
VALUES (12, 'xiaofuge', 'send_award', '97145040946',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97145040946\",\"timestamp\":1712377015040}',
        'completed', '2024-04-06 12:16:55', '2024-04-06 12:16:55');
INSERT INTO `task`
VALUES (13, 'xiaofuge', 'send_award', '40165031868',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"40165031868\",\"timestamp\":1712377015553}',
        'completed', '2024-04-06 12:16:55', '2024-04-06 12:16:55');
INSERT INTO `task`
VALUES (14, 'xiaofuge', 'send_award', '31142176572',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"31142176572\",\"timestamp\":1712377016066}',
        'completed', '2024-04-06 12:16:56', '2024-04-06 12:16:56');
INSERT INTO `task`
VALUES (15, 'xiaofuge', 'send_award', '54723488249',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"54723488249\",\"timestamp\":1712377016577}',
        'completed', '2024-04-06 12:16:56', '2024-04-06 12:16:56');
INSERT INTO `task`
VALUES (16, 'xiaofuge', 'send_award', '94553316274',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"94553316274\",\"timestamp\":1712377017090}',
        'completed', '2024-04-06 12:16:57', '2024-04-06 16:07:00');
INSERT INTO `task`
VALUES (17, 'xiaofuge', 'send_award', '47638237311',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"47638237311\",\"timestamp\":1712377017601}',
        'completed', '2024-04-06 12:16:57', '2024-04-06 16:07:00');
INSERT INTO `task`
VALUES (18, 'xiaofuge', 'send_award', '08472548108',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08472548108\",\"timestamp\":1712377018112}',
        'completed', '2024-04-06 12:16:58', '2024-04-06 16:07:00');
INSERT INTO `task`
VALUES (19, 'xiaofuge', 'send_award', '01704262897',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"01704262897\",\"timestamp\":1712391038041}',
        'completed', '2024-04-06 16:10:38', '2024-04-06 16:10:38');
INSERT INTO `task`
VALUES (20, 'xiaofuge', 'send_award', '96818112357',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96818112357\",\"timestamp\":1712391039234}',
        'completed', '2024-04-06 16:10:39', '2024-04-06 16:10:39');
INSERT INTO `task`
VALUES (21, 'xiaofuge', 'send_award', '39815817631',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39815817631\",\"timestamp\":1712391039751}',
        'completed', '2024-04-06 16:10:39', '2024-04-06 16:10:39');
INSERT INTO `task`
VALUES (22, 'xiaofuge', 'send_award', '44228382875',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44228382875\",\"timestamp\":1712391040268}',
        'completed', '2024-04-06 16:10:40', '2024-04-06 16:10:40');
INSERT INTO `task`
VALUES (23, 'xiaofuge', 'send_award', '61240314870',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61240314870\",\"timestamp\":1712391040784}',
        'completed', '2024-04-06 16:10:40', '2024-04-06 16:10:40');
INSERT INTO `task`
VALUES (24, 'xiaofuge', 'send_award', '30911821347',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"30911821347\",\"timestamp\":1712391041333}',
        'completed', '2024-04-06 16:10:41', '2024-04-06 16:10:41');
INSERT INTO `task`
VALUES (25, 'xiaofuge', 'send_award', '41575602711',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"41575602711\",\"timestamp\":1712391041849}',
        'completed', '2024-04-06 16:10:41', '2024-04-06 16:10:41');
INSERT INTO `task`
VALUES (26, 'xiaofuge', 'send_award', '72379603310',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"72379603310\",\"timestamp\":1712391042361}',
        'completed', '2024-04-06 16:10:42', '2024-04-06 16:10:42');
INSERT INTO `task`
VALUES (27, 'xiaofuge', 'send_award', '51671684313',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51671684313\",\"timestamp\":1712391042875}',
        'completed', '2024-04-06 16:10:42', '2024-04-06 16:10:42');
INSERT INTO `task`
VALUES (28, 'xiaofuge', 'send_award', '11840468669',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11840468669\",\"timestamp\":1712391043390}',
        'completed', '2024-04-06 16:10:43', '2024-04-06 16:10:43');
INSERT INTO `task`
VALUES (29, 'xiaofuge', 'send_award', '18467905170',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"18467905170\",\"timestamp\":1712391043908}',
        'completed', '2024-04-06 16:10:43', '2024-04-06 16:10:43');
INSERT INTO `task`
VALUES (30, 'xiaofuge', 'send_award', '33233781451',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33233781451\",\"timestamp\":1712391044424}',
        'completed', '2024-04-06 16:10:44', '2024-04-06 16:10:44');
INSERT INTO `task`
VALUES (31, 'xiaofuge', 'send_award', '09679212052',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"09679212052\",\"timestamp\":1712391044938}',
        'completed', '2024-04-06 16:10:44', '2024-04-06 16:10:44');
INSERT INTO `task`
VALUES (32, 'xiaofuge', 'send_award', '96862889309',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96862889309\",\"timestamp\":1712391045450}',
        'completed', '2024-04-06 16:10:45', '2024-04-06 16:10:45');
INSERT INTO `task`
VALUES (33, 'xiaofuge', 'send_award', '69912628282',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69912628282\",\"timestamp\":1712391045962}',
        'completed', '2024-04-06 16:10:45', '2024-04-06 16:10:45');
INSERT INTO `task`
VALUES (37, 'xiaofuge', 'bigmarket.award_send', '96610005638',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96610005638\",\"timestamp\":\"2024-04-14 20:39:24.439\"}',
        'complete', '2024-04-14 20:39:24', '2024-04-14 20:39:24');
INSERT INTO `task`
VALUES (38, 'xiaofuge', 'bigmarket.award_send', '46930355403',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"46930355403\",\"timestamp\":\"2024-04-14 21:18:30.339\"}',
        'complete', '2024-04-14 21:18:30', '2024-04-14 21:18:30');
INSERT INTO `task`
VALUES (39, 'xiaofuge', 'bigmarket.award_send', '99207118324',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"99207118324\",\"timestamp\":\"2024-04-14 21:18:31.096\"}',
        'complete', '2024-04-14 21:18:31', '2024-04-14 21:18:31');
INSERT INTO `task`
VALUES (40, 'xiaofuge', 'bigmarket.award_send', '53568575040',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53568575040\",\"timestamp\":\"2024-04-14 21:18:31.609\"}',
        'complete', '2024-04-14 21:18:31', '2024-04-14 21:18:31');
INSERT INTO `task`
VALUES (41, 'xiaofuge', 'bigmarket.award_send', '03402302594',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"03402302594\",\"timestamp\":\"2024-04-14 21:18:32.123\"}',
        'complete', '2024-04-14 21:18:32', '2024-04-14 21:18:32');
INSERT INTO `task`
VALUES (42, 'xiaofuge', 'bigmarket.award_send', '54358311878',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"54358311878\",\"timestamp\":\"2024-04-14 21:18:32.64\"}',
        'complete', '2024-04-14 21:18:32', '2024-04-14 21:18:32');
INSERT INTO `task`
VALUES (43, 'xiaofuge', 'bigmarket.award_send', '46966160291',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"46966160291\",\"timestamp\":\"2024-04-14 21:18:33.157\"}',
        'complete', '2024-04-14 21:18:33', '2024-04-14 21:18:33');
INSERT INTO `task`
VALUES (44, 'xiaofuge', 'bigmarket.award_send', '56043178805',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"56043178805\",\"timestamp\":\"2024-04-14 21:18:33.673\"}',
        'complete', '2024-04-14 21:18:33', '2024-04-14 21:18:33');
INSERT INTO `task`
VALUES (45, 'xiaofuge', 'bigmarket.award_send', '92429621348',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"92429621348\",\"timestamp\":\"2024-04-14 21:18:34.188\"}',
        'complete', '2024-04-14 21:18:34', '2024-04-14 21:18:34');
INSERT INTO `task`
VALUES (46, 'xiaofuge', 'bigmarket.award_send', '76213922844',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"76213922844\",\"timestamp\":\"2024-04-14 21:18:34.7\"}',
        'complete', '2024-04-14 21:18:34', '2024-04-14 21:18:34');
INSERT INTO `task`
VALUES (47, 'xiaofuge', 'bigmarket.award_send', '52409214239',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"52409214239\",\"timestamp\":\"2024-04-14 21:18:35.215\"}',
        'complete', '2024-04-14 21:18:35', '2024-04-14 21:18:35');
INSERT INTO `task`
VALUES (48, 'xiaofuge', 'bigmarket.award_send', '14532428106',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"14532428106\",\"timestamp\":\"2024-04-14 21:18:35.731\"}',
        'complete', '2024-04-14 21:18:35', '2024-04-14 21:18:35');
INSERT INTO `task`
VALUES (49, 'xiaofuge', 'bigmarket.award_send', '96722038399',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96722038399\",\"timestamp\":\"2024-04-14 21:18:36.249\"}',
        'complete', '2024-04-14 21:18:36', '2024-04-14 21:18:36');
INSERT INTO `task`
VALUES (50, 'xiaofuge', 'bigmarket.award_send', '63486710438',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"63486710438\",\"timestamp\":\"2024-04-14 21:18:36.764\"}',
        'complete', '2024-04-14 21:18:36', '2024-04-14 21:18:36');
INSERT INTO `task`
VALUES (51, 'xiaofuge', 'bigmarket.award_send', '20136260569',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20136260569\",\"timestamp\":\"2024-04-14 21:18:37.281\"}',
        'complete', '2024-04-14 21:18:37', '2024-04-14 21:18:37');
INSERT INTO `task`
VALUES (52, 'xiaofuge', 'bigmarket.award_send', '74536441697',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74536441697\",\"timestamp\":\"2024-04-14 21:18:37.797\"}',
        'complete', '2024-04-14 21:18:37', '2024-04-14 21:18:37');
INSERT INTO `task`
VALUES (53, 'xiaofuge', 'bigmarket.award_send', '29361873379',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"29361873379\",\"timestamp\":\"2024-04-14 21:18:38.316\"}',
        'complete', '2024-04-14 21:18:38', '2024-04-14 21:18:38');
INSERT INTO `task`
VALUES (54, 'xiaofuge', 'bigmarket.award_send', '38407694479',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"38407694479\",\"timestamp\":\"2024-04-14 21:18:38.832\"}',
        'complete', '2024-04-14 21:18:38', '2024-04-14 21:18:38');
INSERT INTO `task`
VALUES (55, 'xiaofuge', 'bigmarket.award_send', '93629449958',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"93629449958\",\"timestamp\":\"2024-04-14 21:18:39.351\"}',
        'complete', '2024-04-14 21:18:39', '2024-04-14 21:18:39');
INSERT INTO `task`
VALUES (56, 'xiaofuge', 'bigmarket.award_send', '00866775546',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"00866775546\",\"timestamp\":\"2024-04-14 21:18:39.866\"}',
        'complete', '2024-04-14 21:18:39', '2024-04-14 21:18:39');
INSERT INTO `task`
VALUES (57, 'xiaofuge', 'bigmarket.award_send', '20570480438',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20570480438\",\"timestamp\":\"2024-04-14 21:18:40.383\"}',
        'complete', '2024-04-14 21:18:40', '2024-04-14 21:18:40');
INSERT INTO `task`
VALUES (58, 'xiaofuge', 'bigmarket.award_send', '44716997919',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44716997919\",\"timestamp\":\"2024-04-14 21:18:40.899\"}',
        'complete', '2024-04-14 21:18:40', '2024-04-14 21:18:40');
INSERT INTO `task`
VALUES (59, 'xiaofuge', 'bigmarket.award_send', '61597645683',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61597645683\",\"timestamp\":\"2024-04-14 21:18:41.414\"}',
        'complete', '2024-04-14 21:18:41', '2024-04-14 21:18:41');
INSERT INTO `task`
VALUES (60, 'xiaofuge', 'bigmarket.award_send', '97700558043',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97700558043\",\"timestamp\":\"2024-04-14 21:18:41.93\"}',
        'complete', '2024-04-14 21:18:41', '2024-04-14 21:18:41');
INSERT INTO `task`
VALUES (61, 'xiaofuge', 'bigmarket.award_send', '39061038121',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39061038121\",\"timestamp\":\"2024-04-14 21:18:42.446\"}',
        'complete', '2024-04-14 21:18:42', '2024-04-14 21:18:42');
INSERT INTO `task`
VALUES (62, 'xiaofuge', 'bigmarket.award_send', '17923984569',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"17923984569\",\"timestamp\":\"2024-04-14 21:18:42.962\"}',
        'complete', '2024-04-14 21:18:42', '2024-04-14 21:18:42');
INSERT INTO `task`
VALUES (63, 'xiaofuge', 'bigmarket.award_send', '32006687532',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32006687532\",\"timestamp\":\"2024-04-14 21:18:43.476\"}',
        'complete', '2024-04-14 21:18:43', '2024-04-14 21:18:43');
INSERT INTO `task`
VALUES (64, 'xiaofuge', 'bigmarket.award_send', '93036459168',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"93036459168\",\"timestamp\":\"2024-04-14 21:18:43.991\"}',
        'complete', '2024-04-14 21:18:43', '2024-04-14 21:18:44');
INSERT INTO `task`
VALUES (65, 'xiaofuge', 'bigmarket.award_send', '56804821040',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"56804821040\",\"timestamp\":\"2024-04-14 21:18:44.506\"}',
        'complete', '2024-04-14 21:18:44', '2024-04-14 21:18:44');
INSERT INTO `task`
VALUES (66, 'xiaofuge', 'bigmarket.award_send', '04153786286',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"04153786286\",\"timestamp\":\"2024-04-14 21:18:45.019\"}',
        'complete', '2024-04-14 21:18:45', '2024-04-14 21:18:45');
INSERT INTO `task`
VALUES (67, 'xiaofuge', 'bigmarket.award_send', '92899400330',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"92899400330\",\"timestamp\":\"2024-04-14 21:18:45.532\"}',
        'complete', '2024-04-14 21:18:45', '2024-04-14 21:18:45');
INSERT INTO `task`
VALUES (68, 'xiaofuge', 'bigmarket.award_send', '67188465638',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"67188465638\",\"timestamp\":\"2024-04-14 21:18:46.048\"}',
        'complete', '2024-04-14 21:18:46', '2024-04-14 21:18:46');
INSERT INTO `task`
VALUES (69, 'xiaofuge', 'bigmarket.award_send', '35286372291',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"35286372291\",\"timestamp\":\"2024-04-14 21:18:46.565\"}',
        'complete', '2024-04-14 21:18:46', '2024-04-14 21:18:46');
INSERT INTO `task`
VALUES (70, 'xiaofuge', 'bigmarket.award_send', '35064509726',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"35064509726\",\"timestamp\":\"2024-04-14 21:18:47.077\"}',
        'complete', '2024-04-14 21:18:47', '2024-04-14 21:18:47');
INSERT INTO `task`
VALUES (71, 'xiaofuge', 'bigmarket.award_send', '18416481413',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"18416481413\",\"timestamp\":\"2024-04-14 21:18:47.593\"}',
        'complete', '2024-04-14 21:18:47', '2024-04-14 21:18:47');
INSERT INTO `task`
VALUES (72, 'xiaofuge', 'bigmarket.award_send', '47159026220',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"47159026220\",\"timestamp\":\"2024-04-14 21:18:48.105\"}',
        'complete', '2024-04-14 21:18:48', '2024-04-14 21:18:48');
INSERT INTO `task`
VALUES (73, 'xiaofuge', 'bigmarket.award_send', '79987212875',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"79987212875\",\"timestamp\":\"2024-04-14 21:18:48.613\"}',
        'complete', '2024-04-14 21:18:48', '2024-04-14 21:18:48');
INSERT INTO `task`
VALUES (74, 'xiaofuge', 'bigmarket.award_send', '43680388113',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"43680388113\",\"timestamp\":\"2024-04-14 21:18:49.122\"}',
        'complete', '2024-04-14 21:18:49', '2024-04-14 21:18:49');
INSERT INTO `task`
VALUES (75, 'xiaofuge', 'bigmarket.award_send', '82721412173',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"82721412173\",\"timestamp\":\"2024-04-14 21:18:49.637\"}',
        'complete', '2024-04-14 21:18:49', '2024-04-14 21:18:49');
INSERT INTO `task`
VALUES (76, 'xiaofuge', 'bigmarket.award_send', '24979467809',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"24979467809\",\"timestamp\":\"2024-04-14 21:18:50.149\"}',
        'complete', '2024-04-14 21:18:50', '2024-04-14 21:18:50');
INSERT INTO `task`
VALUES (77, 'xiaofuge', 'bigmarket.award_send', '97282043448',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97282043448\",\"timestamp\":\"2024-04-14 21:18:50.666\"}',
        'complete', '2024-04-14 21:18:50', '2024-04-14 21:18:50');
INSERT INTO `task`
VALUES (78, 'xiaofuge', 'bigmarket.award_send', '55961118229',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55961118229\",\"timestamp\":\"2024-04-14 21:18:51.179\"}',
        'complete', '2024-04-14 21:18:51', '2024-04-14 21:18:51');
INSERT INTO `task`
VALUES (79, 'xiaofuge', 'bigmarket.award_send', '97233633017',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97233633017\",\"timestamp\":\"2024-04-14 21:18:51.694\"}',
        'complete', '2024-04-14 21:18:51', '2024-04-14 21:18:51');
INSERT INTO `task`
VALUES (80, 'xiaofuge', 'bigmarket.award_send', '00053492006',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"00053492006\",\"timestamp\":\"2024-04-14 21:18:52.21\"}',
        'complete', '2024-04-14 21:18:52', '2024-04-14 21:18:52');
INSERT INTO `task`
VALUES (81, 'xiaofuge', 'bigmarket.award_send', '43164328976',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"43164328976\",\"timestamp\":\"2024-04-14 21:18:52.725\"}',
        'complete', '2024-04-14 21:18:52', '2024-04-14 21:18:52');
INSERT INTO `task`
VALUES (82, 'xiaofuge', 'bigmarket.award_send', '60111143561',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"60111143561\",\"timestamp\":\"2024-04-14 21:18:53.24\"}',
        'complete', '2024-04-14 21:18:53', '2024-04-14 21:18:53');
INSERT INTO `task`
VALUES (83, 'xiaofuge', 'bigmarket.award_send', '72024286287',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"72024286287\",\"timestamp\":\"2024-04-14 21:18:53.758\"}',
        'complete', '2024-04-14 21:18:53', '2024-04-14 21:18:53');
INSERT INTO `task`
VALUES (84, 'xiaofuge', 'bigmarket.award_send', '21680797418',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"21680797418\",\"timestamp\":\"2024-04-14 21:18:54.275\"}',
        'complete', '2024-04-14 21:18:54', '2024-04-14 21:18:54');
INSERT INTO `task`
VALUES (85, 'xiaofuge', 'bigmarket.award_send', '05639994680',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"05639994680\",\"timestamp\":\"2024-04-14 21:18:54.793\"}',
        'complete', '2024-04-14 21:18:54', '2024-04-14 21:18:54');
INSERT INTO `task`
VALUES (86, 'xiaofuge', 'bigmarket.award_send', '43858931599',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"43858931599\",\"timestamp\":\"2024-04-14 21:18:55.307\"}',
        'complete', '2024-04-14 21:18:55', '2024-04-14 21:18:55');
INSERT INTO `task`
VALUES (87, 'xiaofuge', 'bigmarket.award_send', '91363328306',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"91363328306\",\"timestamp\":\"2024-04-14 21:18:55.823\"}',
        'complete', '2024-04-14 21:18:55', '2024-04-14 21:18:55');
INSERT INTO `task`
VALUES (88, 'xiaofuge', 'bigmarket.award_send', '72736137706',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"72736137706\",\"timestamp\":\"2024-04-14 21:18:56.339\"}',
        'complete', '2024-04-14 21:18:56', '2024-04-14 21:18:56');
INSERT INTO `task`
VALUES (89, 'xiaofuge', 'bigmarket.award_send', '84203727265',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"84203727265\",\"timestamp\":\"2024-04-14 21:18:56.855\"}',
        'complete', '2024-04-14 21:18:56', '2024-04-14 21:18:56');
INSERT INTO `task`
VALUES (90, 'xiaofuge', 'bigmarket.award_send', '34562953340',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"34562953340\",\"timestamp\":\"2024-04-14 21:18:57.371\"}',
        'complete', '2024-04-14 21:18:57', '2024-04-14 21:18:57');
INSERT INTO `task`
VALUES (91, 'xiaofuge', 'bigmarket.award_send', '50052099330',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"50052099330\",\"timestamp\":\"2024-04-14 21:18:57.889\"}',
        'complete', '2024-04-14 21:18:57', '2024-04-14 21:18:57');
INSERT INTO `task`
VALUES (92, 'xiaofuge', 'bigmarket.award_send', '53500398998',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53500398998\",\"timestamp\":\"2024-04-14 21:18:58.406\"}',
        'complete', '2024-04-14 21:18:58', '2024-04-14 21:18:58');
INSERT INTO `task`
VALUES (93, 'xiaofuge', 'bigmarket.award_send', '13007061382',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13007061382\",\"timestamp\":\"2024-04-14 21:18:58.92\"}',
        'complete', '2024-04-14 21:18:58', '2024-04-14 21:18:58');
INSERT INTO `task`
VALUES (94, 'xiaofuge', 'bigmarket.award_send', '26919819974',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"26919819974\",\"timestamp\":\"2024-04-14 21:18:59.439\"}',
        'complete', '2024-04-14 21:18:59', '2024-04-14 21:18:59');
INSERT INTO `task`
VALUES (95, 'xiaofuge', 'bigmarket.award_send', '48354179285',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"48354179285\",\"timestamp\":\"2024-04-14 21:18:59.949\"}',
        'complete', '2024-04-14 21:18:59', '2024-04-14 21:18:59');
INSERT INTO `task`
VALUES (96, 'xiaofuge', 'bigmarket.award_send', '14836388471',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"14836388471\",\"timestamp\":\"2024-04-14 21:19:00.468\"}',
        'complete', '2024-04-14 21:19:00', '2024-04-14 21:19:00');
INSERT INTO `task`
VALUES (97, 'xiaofuge', 'bigmarket.award_send', '16834128057',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"16834128057\",\"timestamp\":\"2024-04-14 21:19:00.981\"}',
        'complete', '2024-04-14 21:19:00', '2024-04-14 21:19:00');
INSERT INTO `task`
VALUES (98, 'xiaofuge', 'bigmarket.award_send', '15145254401',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"15145254401\",\"timestamp\":\"2024-04-14 21:19:01.496\"}',
        'complete', '2024-04-14 21:19:01', '2024-04-14 21:19:01');
INSERT INTO `task`
VALUES (99, 'xiaofuge', 'bigmarket.award_send', '67570615812',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"67570615812\",\"timestamp\":\"2024-04-14 21:19:02.01\"}',
        'complete', '2024-04-14 21:19:02', '2024-04-14 21:19:02');
INSERT INTO `task`
VALUES (100, 'xiaofuge', 'bigmarket.award_send', '73037956830',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"73037956830\",\"timestamp\":\"2024-04-14 21:19:02.523\"}',
        'complete', '2024-04-14 21:19:02', '2024-04-14 21:19:02');
INSERT INTO `task`
VALUES (101, 'xiaofuge', 'bigmarket.award_send', '70449344147',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"70449344147\",\"timestamp\":\"2024-04-14 21:19:03.04\"}',
        'complete', '2024-04-14 21:19:03', '2024-04-14 21:19:03');
INSERT INTO `task`
VALUES (102, 'xiaofuge', 'bigmarket.award_send', '08919562158',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08919562158\",\"timestamp\":\"2024-04-14 21:19:03.557\"}',
        'complete', '2024-04-14 21:19:03', '2024-04-14 21:19:03');
INSERT INTO `task`
VALUES (103, 'xiaofuge', 'bigmarket.award_send', '51181812281',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51181812281\",\"timestamp\":\"2024-04-14 21:19:04.072\"}',
        'complete', '2024-04-14 21:19:04', '2024-04-14 21:19:04');
INSERT INTO `task`
VALUES (104, 'xiaofuge', 'bigmarket.award_send', '56824363746',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"56824363746\",\"timestamp\":\"2024-04-14 21:19:04.589\"}',
        'complete', '2024-04-14 21:19:04', '2024-04-14 21:19:04');
INSERT INTO `task`
VALUES (105, 'xiaofuge', 'bigmarket.award_send', '27001834292',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"27001834292\",\"timestamp\":\"2024-04-14 21:19:05.105\"}',
        'complete', '2024-04-14 21:19:05', '2024-04-14 21:19:05');
INSERT INTO `task`
VALUES (106, 'xiaofuge', 'bigmarket.award_send', '55658631175',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55658631175\",\"timestamp\":\"2024-04-14 21:19:05.619\"}',
        'complete', '2024-04-14 21:19:05', '2024-04-14 21:19:05');
INSERT INTO `task`
VALUES (107, 'xiaofuge', 'bigmarket.award_send', '76198738295',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"76198738295\",\"timestamp\":\"2024-04-14 21:19:06.135\"}',
        'complete', '2024-04-14 21:19:06', '2024-04-14 21:19:06');
INSERT INTO `task`
VALUES (108, 'xiaofuge', 'bigmarket.award_send', '25287093433',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"25287093433\",\"timestamp\":\"2024-04-14 21:19:06.65\"}',
        'complete', '2024-04-14 21:19:06', '2024-04-14 21:19:06');
INSERT INTO `task`
VALUES (109, 'xiaofuge', 'bigmarket.award_send', '03032521349',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"03032521349\",\"timestamp\":\"2024-04-14 21:19:07.166\"}',
        'complete', '2024-04-14 21:19:07', '2024-04-14 21:19:07');
INSERT INTO `task`
VALUES (110, 'xiaofuge', 'bigmarket.award_send', '91221016693',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"91221016693\",\"timestamp\":\"2024-04-14 21:19:07.68\"}',
        'complete', '2024-04-14 21:19:07', '2024-04-14 21:19:07');
INSERT INTO `task`
VALUES (111, 'xiaofuge', 'bigmarket.award_send', '67661915551',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"67661915551\",\"timestamp\":\"2024-04-14 21:19:08.197\"}',
        'complete', '2024-04-14 21:19:08', '2024-04-14 21:19:08');
INSERT INTO `task`
VALUES (112, 'xiaofuge', 'bigmarket.award_send', '78180886036',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"78180886036\",\"timestamp\":\"2024-04-14 21:19:08.712\"}',
        'complete', '2024-04-14 21:19:08', '2024-04-14 21:19:08');
INSERT INTO `task`
VALUES (113, 'xiaofuge', 'bigmarket.award_send', '35915883627',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"35915883627\",\"timestamp\":\"2024-04-14 21:19:09.225\"}',
        'complete', '2024-04-14 21:19:09', '2024-04-14 21:19:09');
INSERT INTO `task`
VALUES (114, 'xiaofuge', 'bigmarket.award_send', '88603475255',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"88603475255\",\"timestamp\":\"2024-04-14 21:19:09.741\"}',
        'complete', '2024-04-14 21:19:09', '2024-04-14 21:19:09');
INSERT INTO `task`
VALUES (115, 'xiaofuge', 'bigmarket.award_send', '87961754657',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"87961754657\",\"timestamp\":\"2024-04-14 21:19:10.255\"}',
        'complete', '2024-04-14 21:19:10', '2024-04-14 21:19:10');
INSERT INTO `task`
VALUES (116, 'xiaofuge', 'bigmarket.award_send', '39929243547',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39929243547\",\"timestamp\":\"2024-04-14 21:19:10.773\"}',
        'complete', '2024-04-14 21:19:10', '2024-04-14 21:19:10');
INSERT INTO `task`
VALUES (117, 'xiaofuge', 'bigmarket.award_send', '33680429333',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33680429333\",\"timestamp\":\"2024-04-14 21:19:11.29\"}',
        'complete', '2024-04-14 21:19:11', '2024-04-14 21:19:11');
INSERT INTO `task`
VALUES (118, 'xiaofuge', 'bigmarket.award_send', '15659400295',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"15659400295\",\"timestamp\":\"2024-04-14 21:19:11.812\"}',
        'complete', '2024-04-14 21:19:11', '2024-04-14 21:19:11');
INSERT INTO `task`
VALUES (119, 'xiaofuge', 'bigmarket.award_send', '70747455476',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"70747455476\",\"timestamp\":\"2024-04-14 21:19:12.326\"}',
        'complete', '2024-04-14 21:19:12', '2024-04-14 21:19:12');
INSERT INTO `task`
VALUES (120, 'xiaofuge', 'bigmarket.award_send', '08315545248',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08315545248\",\"timestamp\":\"2024-04-14 21:19:12.842\"}',
        'complete', '2024-04-14 21:19:12', '2024-04-14 21:19:12');
INSERT INTO `task`
VALUES (121, 'xiaofuge', 'bigmarket.award_send', '55445652081',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55445652081\",\"timestamp\":\"2024-04-14 21:19:13.357\"}',
        'complete', '2024-04-14 21:19:13', '2024-04-14 21:19:13');
INSERT INTO `task`
VALUES (122, 'xiaofuge', 'bigmarket.award_send', '71719313771',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71719313771\",\"timestamp\":\"2024-04-14 21:19:13.876\"}',
        'complete', '2024-04-14 21:19:13', '2024-04-14 21:19:13');
INSERT INTO `task`
VALUES (123, 'xiaofuge', 'bigmarket.award_send', '85582900830',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"85582900830\",\"timestamp\":\"2024-04-14 21:19:14.387\"}',
        'complete', '2024-04-14 21:19:14', '2024-04-14 21:19:14');
INSERT INTO `task`
VALUES (124, 'xiaofuge', 'bigmarket.award_send', '89613579807',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"89613579807\",\"timestamp\":\"2024-04-14 21:19:14.906\"}',
        'complete', '2024-04-14 21:19:14', '2024-04-14 21:19:14');
INSERT INTO `task`
VALUES (125, 'xiaofuge', 'bigmarket.award_send', '45360464922',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"45360464922\",\"timestamp\":\"2024-04-14 21:19:15.423\"}',
        'complete', '2024-04-14 21:19:15', '2024-04-14 21:19:15');
INSERT INTO `task`
VALUES (126, 'xiaofuge', 'bigmarket.award_send', '38117397550',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"38117397550\",\"timestamp\":\"2024-04-14 21:19:15.94\"}',
        'complete', '2024-04-14 21:19:15', '2024-04-14 21:19:15');
INSERT INTO `task`
VALUES (127, 'xiaofuge', 'bigmarket.award_send', '04655311789',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"04655311789\",\"timestamp\":\"2024-04-14 21:19:16.457\"}',
        'complete', '2024-04-14 21:19:16', '2024-04-14 21:19:16');
INSERT INTO `task`
VALUES (128, 'xiaofuge', 'bigmarket.award_send', '45672657610',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"45672657610\",\"timestamp\":\"2024-04-14 21:19:16.976\"}',
        'complete', '2024-04-14 21:19:16', '2024-04-14 21:19:16');
INSERT INTO `task`
VALUES (129, 'xiaofuge', 'bigmarket.award_send', '22304627752',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"22304627752\",\"timestamp\":\"2024-04-14 21:19:17.495\"}',
        'complete', '2024-04-14 21:19:17', '2024-04-14 21:19:17');
INSERT INTO `task`
VALUES (130, 'xiaofuge', 'bigmarket.award_send', '65422359778',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"65422359778\",\"timestamp\":\"2024-04-14 21:19:18.01\"}',
        'complete', '2024-04-14 21:19:18', '2024-04-14 21:19:18');
INSERT INTO `task`
VALUES (131, 'xiaofuge', 'bigmarket.award_send', '42586845966',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"42586845966\",\"timestamp\":\"2024-04-14 21:19:18.521\"}',
        'complete', '2024-04-14 21:19:18', '2024-04-14 21:19:18');
INSERT INTO `task`
VALUES (132, 'xiaofuge', 'bigmarket.award_send', '23527023475',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"23527023475\",\"timestamp\":\"2024-04-14 21:19:19.036\"}',
        'complete', '2024-04-14 21:19:19', '2024-04-14 21:19:19');
INSERT INTO `task`
VALUES (133, 'xiaofuge', 'bigmarket.award_send', '32570517555',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32570517555\",\"timestamp\":\"2024-04-14 21:19:19.552\"}',
        'complete', '2024-04-14 21:19:19', '2024-04-14 21:19:19');
INSERT INTO `task`
VALUES (134, 'xiaofuge', 'bigmarket.award_send', '99892219137',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"99892219137\",\"timestamp\":\"2024-04-14 21:19:20.066\"}',
        'complete', '2024-04-14 21:19:20', '2024-04-14 21:19:20');
INSERT INTO `task`
VALUES (135, 'xiaofuge', 'bigmarket.award_send', '53124123292',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53124123292\",\"timestamp\":\"2024-04-14 21:19:20.581\"}',
        'complete', '2024-04-14 21:19:20', '2024-04-14 21:19:20');
INSERT INTO `task`
VALUES (136, 'xiaofuge', 'bigmarket.award_send', '14314466924',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"14314466924\",\"timestamp\":\"2024-04-14 21:19:21.098\"}',
        'complete', '2024-04-14 21:19:21', '2024-04-14 21:19:21');
INSERT INTO `task`
VALUES (137, 'xiaofuge', 'bigmarket.award_send', '74197191582',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74197191582\",\"timestamp\":\"2024-04-14 21:19:21.615\"}',
        'complete', '2024-04-14 21:19:21', '2024-04-14 21:19:21');
INSERT INTO `task`
VALUES (138, 'xiaofuge', 'bigmarket.award_send', '01846896258',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"01846896258\",\"timestamp\":\"2024-04-14 21:21:36.527\"}',
        'complete', '2024-04-14 21:21:36', '2024-04-14 21:21:36');
INSERT INTO `task`
VALUES (139, 'xiaofuge', 'bigmarket.award_send', '44384504408',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44384504408\",\"timestamp\":\"2024-04-14 21:21:37.343\"}',
        'complete', '2024-04-14 21:21:37', '2024-04-14 21:21:37');
INSERT INTO `task`
VALUES (140, 'xiaofuge', 'bigmarket.award_send', '76821248047',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"76821248047\",\"timestamp\":\"2024-04-14 21:21:37.862\"}',
        'complete', '2024-04-14 21:21:37', '2024-04-14 21:21:37');
INSERT INTO `task`
VALUES (141, 'xiaofuge', 'bigmarket.award_send', '50433560656',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"50433560656\",\"timestamp\":\"2024-04-14 21:21:38.379\"}',
        'complete', '2024-04-14 21:21:38', '2024-04-14 21:21:38');
INSERT INTO `task`
VALUES (142, 'xiaofuge', 'bigmarket.award_send', '42502775151',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"42502775151\",\"timestamp\":\"2024-04-14 21:21:38.895\"}',
        'complete', '2024-04-14 21:21:38', '2024-04-14 21:21:38');
INSERT INTO `task`
VALUES (143, 'xiaofuge', 'bigmarket.award_send', '09900623456',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"09900623456\",\"timestamp\":\"2024-04-14 21:21:39.413\"}',
        'complete', '2024-04-14 21:21:39', '2024-04-14 21:21:39');
INSERT INTO `task`
VALUES (144, 'xiaofuge', 'bigmarket.award_send', '51047816191',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51047816191\",\"timestamp\":\"2024-04-14 21:21:39.928\"}',
        'complete', '2024-04-14 21:21:39', '2024-04-14 21:21:39');
INSERT INTO `task`
VALUES (145, 'xiaofuge', 'bigmarket.award_send', '20575426885',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20575426885\",\"timestamp\":\"2024-04-14 21:21:40.446\"}',
        'complete', '2024-04-14 21:21:40', '2024-04-14 21:21:40');
INSERT INTO `task`
VALUES (146, 'xiaofuge', 'bigmarket.award_send', '69597218156',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69597218156\",\"timestamp\":\"2024-04-14 21:21:40.963\"}',
        'complete', '2024-04-14 21:21:40', '2024-04-14 21:21:40');
INSERT INTO `task`
VALUES (147, 'xiaofuge', 'bigmarket.award_send', '55339133813',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55339133813\",\"timestamp\":\"2024-04-14 21:21:41.478\"}',
        'complete', '2024-04-14 21:21:41', '2024-04-14 21:21:41');
INSERT INTO `task`
VALUES (148, 'xiaofuge', 'bigmarket.award_send', '62627516078',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"62627516078\",\"timestamp\":\"2024-04-14 21:21:41.994\"}',
        'complete', '2024-04-14 21:21:41', '2024-04-14 21:21:42');
INSERT INTO `task`
VALUES (149, 'xiaofuge', 'bigmarket.award_send', '03552408166',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"03552408166\",\"timestamp\":\"2024-04-14 21:21:42.511\"}',
        'complete', '2024-04-14 21:21:42', '2024-04-14 21:21:42');
INSERT INTO `task`
VALUES (150, 'xiaofuge', 'bigmarket.award_send', '11426521860',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11426521860\",\"timestamp\":\"2024-04-14 21:21:43.026\"}',
        'complete', '2024-04-14 21:21:43', '2024-04-14 21:21:43');
INSERT INTO `task`
VALUES (151, 'xiaofuge', 'bigmarket.award_send', '56894468522',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"56894468522\",\"timestamp\":\"2024-04-14 21:21:43.54\"}',
        'complete', '2024-04-14 21:21:43', '2024-04-14 21:21:43');
INSERT INTO `task`
VALUES (152, 'xiaofuge', 'bigmarket.award_send', '71969048494',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71969048494\",\"timestamp\":\"2024-04-14 21:21:44.056\"}',
        'complete', '2024-04-14 21:21:44', '2024-04-14 21:21:44');
INSERT INTO `task`
VALUES (153, 'xiaofuge', 'bigmarket.award_send', '33304071898',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33304071898\",\"timestamp\":\"2024-04-14 21:21:44.57\"}',
        'complete', '2024-04-14 21:21:44', '2024-04-14 21:21:44');
INSERT INTO `task`
VALUES (154, 'xiaofuge', 'bigmarket.award_send', '19033659473',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"19033659473\",\"timestamp\":\"2024-04-14 21:21:45.087\"}',
        'complete', '2024-04-14 21:21:45', '2024-04-14 21:21:45');
INSERT INTO `task`
VALUES (155, 'xiaofuge', 'bigmarket.award_send', '44383684576',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44383684576\",\"timestamp\":\"2024-04-14 21:21:45.601\"}',
        'complete', '2024-04-14 21:21:45', '2024-04-14 21:21:45');
INSERT INTO `task`
VALUES (156, 'xiaofuge', 'bigmarket.award_send', '30121018859',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"30121018859\",\"timestamp\":\"2024-04-14 21:21:46.118\"}',
        'complete', '2024-04-14 21:21:46', '2024-04-14 21:21:46');
INSERT INTO `task`
VALUES (157, 'xiaofuge', 'bigmarket.award_send', '45512591462',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"45512591462\",\"timestamp\":\"2024-04-14 21:21:46.636\"}',
        'complete', '2024-04-14 21:21:46', '2024-04-14 21:21:46');
INSERT INTO `task`
VALUES (158, 'xiaofuge', 'bigmarket.award_send', '84650266393',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"84650266393\",\"timestamp\":\"2024-04-14 21:21:47.149\"}',
        'complete', '2024-04-14 21:21:47', '2024-04-14 21:21:47');
INSERT INTO `task`
VALUES (159, 'xiaofuge', 'bigmarket.award_send', '32122548469',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32122548469\",\"timestamp\":\"2024-04-14 21:21:47.666\"}',
        'complete', '2024-04-14 21:21:47', '2024-04-14 21:21:47');
INSERT INTO `task`
VALUES (160, 'xiaofuge', 'bigmarket.award_send', '58146532398',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"58146532398\",\"timestamp\":\"2024-04-14 21:21:48.183\"}',
        'complete', '2024-04-14 21:21:48', '2024-04-14 21:21:48');
INSERT INTO `task`
VALUES (161, 'xiaofuge', 'bigmarket.award_send', '89821505044',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"89821505044\",\"timestamp\":\"2024-04-14 21:21:48.696\"}',
        'complete', '2024-04-14 21:21:48', '2024-04-14 21:21:48');
INSERT INTO `task`
VALUES (162, 'xiaofuge', 'bigmarket.award_send', '75930543227',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"75930543227\",\"timestamp\":\"2024-04-14 21:21:49.209\"}',
        'complete', '2024-04-14 21:21:49', '2024-04-14 21:21:49');
INSERT INTO `task`
VALUES (163, 'xiaofuge', 'bigmarket.award_send', '97365588515',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97365588515\",\"timestamp\":\"2024-04-14 21:21:49.723\"}',
        'complete', '2024-04-14 21:21:49', '2024-04-14 21:21:49');
INSERT INTO `task`
VALUES (164, 'xiaofuge', 'bigmarket.award_send', '99024428203',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"99024428203\",\"timestamp\":\"2024-04-14 21:21:50.242\"}',
        'complete', '2024-04-14 21:21:50', '2024-04-14 21:21:50');
INSERT INTO `task`
VALUES (165, 'xiaofuge', 'bigmarket.award_send', '80083322029',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"80083322029\",\"timestamp\":\"2024-04-14 21:21:50.759\"}',
        'complete', '2024-04-14 21:21:50', '2024-04-14 21:21:50');
INSERT INTO `task`
VALUES (166, 'xiaofuge', 'bigmarket.award_send', '15504371388',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"15504371388\",\"timestamp\":\"2024-04-14 21:21:51.265\"}',
        'complete', '2024-04-14 21:21:51', '2024-04-14 21:21:51');
INSERT INTO `task`
VALUES (167, 'xiaofuge', 'bigmarket.award_send', '13512170732',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13512170732\",\"timestamp\":\"2024-04-14 21:21:51.782\"}',
        'complete', '2024-04-14 21:21:51', '2024-04-14 21:21:51');
INSERT INTO `task`
VALUES (168, 'xiaofuge', 'bigmarket.award_send', '71773356556',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71773356556\",\"timestamp\":\"2024-04-14 21:21:52.3\"}',
        'complete', '2024-04-14 21:21:52', '2024-04-14 21:21:52');
INSERT INTO `task`
VALUES (169, 'xiaofuge', 'bigmarket.award_send', '05679056028',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"05679056028\",\"timestamp\":\"2024-04-14 21:21:52.816\"}',
        'complete', '2024-04-14 21:21:52', '2024-04-14 21:21:52');
INSERT INTO `task`
VALUES (170, 'xiaofuge', 'bigmarket.award_send', '36505233307',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"36505233307\",\"timestamp\":\"2024-04-14 21:21:53.334\"}',
        'complete', '2024-04-14 21:21:53', '2024-04-14 21:21:53');
INSERT INTO `task`
VALUES (171, 'xiaofuge', 'bigmarket.award_send', '92836667311',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"92836667311\",\"timestamp\":\"2024-04-14 21:21:53.85\"}',
        'complete', '2024-04-14 21:21:53', '2024-04-14 21:21:53');
INSERT INTO `task`
VALUES (172, 'xiaofuge', 'bigmarket.award_send', '75485204968',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"75485204968\",\"timestamp\":\"2024-04-14 21:21:54.363\"}',
        'complete', '2024-04-14 21:21:54', '2024-04-14 21:21:54');
INSERT INTO `task`
VALUES (173, 'xiaofuge', 'bigmarket.award_send', '97497124056',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97497124056\",\"timestamp\":\"2024-04-14 21:21:54.881\"}',
        'complete', '2024-04-14 21:21:54', '2024-04-14 21:21:54');
INSERT INTO `task`
VALUES (174, 'xiaofuge', 'bigmarket.award_send', '71414380190',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71414380190\",\"timestamp\":\"2024-04-14 21:21:55.395\"}',
        'complete', '2024-04-14 21:21:55', '2024-04-14 21:21:55');
INSERT INTO `task`
VALUES (175, 'xiaofuge', 'bigmarket.award_send', '48426744450',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"48426744450\",\"timestamp\":\"2024-04-14 21:21:55.909\"}',
        'complete', '2024-04-14 21:21:55', '2024-04-14 21:21:55');
INSERT INTO `task`
VALUES (176, 'xiaofuge', 'bigmarket.award_send', '70695182934',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"70695182934\",\"timestamp\":\"2024-04-14 21:21:56.424\"}',
        'complete', '2024-04-14 21:21:56', '2024-04-14 21:21:56');
INSERT INTO `task`
VALUES (177, 'xiaofuge', 'bigmarket.award_send', '96368394052',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96368394052\",\"timestamp\":\"2024-04-14 21:21:56.937\"}',
        'complete', '2024-04-14 21:21:56', '2024-04-14 21:21:56');
INSERT INTO `task`
VALUES (178, 'xiaofuge', 'bigmarket.award_send', '51524957084',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51524957084\",\"timestamp\":\"2024-04-14 21:21:57.453\"}',
        'complete', '2024-04-14 21:21:57', '2024-04-14 21:21:57');
INSERT INTO `task`
VALUES (179, 'xiaofuge', 'bigmarket.award_send', '32819239146',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32819239146\",\"timestamp\":\"2024-04-14 21:21:57.967\"}',
        'complete', '2024-04-14 21:21:57', '2024-04-14 21:21:57');
INSERT INTO `task`
VALUES (180, 'xiaofuge', 'bigmarket.award_send', '94293074441',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"94293074441\",\"timestamp\":\"2024-04-14 21:21:58.483\"}',
        'complete', '2024-04-14 21:21:58', '2024-04-14 21:21:58');
INSERT INTO `task`
VALUES (181, 'xiaofuge', 'bigmarket.award_send', '12293070526',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"12293070526\",\"timestamp\":\"2024-04-14 21:21:59.002\"}',
        'complete', '2024-04-14 21:21:59', '2024-04-14 21:21:59');
INSERT INTO `task`
VALUES (182, 'xiaofuge', 'bigmarket.award_send', '53237281727',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53237281727\",\"timestamp\":\"2024-04-14 21:21:59.518\"}',
        'complete', '2024-04-14 21:21:59', '2024-04-14 21:21:59');
INSERT INTO `task`
VALUES (183, 'xiaofuge', 'bigmarket.award_send', '35783621951',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"35783621951\",\"timestamp\":\"2024-04-14 21:22:00.036\"}',
        'complete', '2024-04-14 21:22:00', '2024-04-14 21:22:00');
INSERT INTO `task`
VALUES (184, 'xiaofuge', 'bigmarket.award_send', '64473008214',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"64473008214\",\"timestamp\":\"2024-04-14 21:22:00.553\"}',
        'complete', '2024-04-14 21:22:00', '2024-04-14 21:22:00');
INSERT INTO `task`
VALUES (185, 'xiaofuge', 'bigmarket.award_send', '20386917707',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20386917707\",\"timestamp\":\"2024-04-14 21:22:01.067\"}',
        'complete', '2024-04-14 21:22:01', '2024-04-14 21:22:01');
INSERT INTO `task`
VALUES (186, 'xiaofuge', 'bigmarket.award_send', '69595975750',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69595975750\",\"timestamp\":\"2024-04-14 21:22:01.583\"}',
        'complete', '2024-04-14 21:22:01', '2024-04-14 21:22:01');
INSERT INTO `task`
VALUES (187, 'xiaofuge', 'bigmarket.award_send', '08542982589',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08542982589\",\"timestamp\":\"2024-04-14 21:22:02.099\"}',
        'complete', '2024-04-14 21:22:02', '2024-04-14 21:22:02');
INSERT INTO `task`
VALUES (188, 'xiaofuge', 'bigmarket.award_send', '82651053392',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"82651053392\",\"timestamp\":\"2024-04-14 21:22:02.618\"}',
        'complete', '2024-04-14 21:22:02', '2024-04-14 21:22:02');
INSERT INTO `task`
VALUES (189, 'xiaofuge', 'bigmarket.award_send', '54084985016',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"54084985016\",\"timestamp\":\"2024-04-14 21:22:03.131\"}',
        'complete', '2024-04-14 21:22:03', '2024-04-14 21:22:03');
INSERT INTO `task`
VALUES (190, 'xiaofuge', 'bigmarket.award_send', '14419548512',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"14419548512\",\"timestamp\":\"2024-04-14 21:22:03.65\"}',
        'complete', '2024-04-14 21:22:03', '2024-04-14 21:22:03');
INSERT INTO `task`
VALUES (191, 'xiaofuge', 'bigmarket.award_send', '46575261791',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"46575261791\",\"timestamp\":\"2024-04-14 21:22:04.169\"}',
        'complete', '2024-04-14 21:22:04', '2024-04-14 21:22:04');
INSERT INTO `task`
VALUES (192, 'xiaofuge', 'bigmarket.award_send', '16507218727',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"16507218727\",\"timestamp\":\"2024-04-14 21:22:04.684\"}',
        'complete', '2024-04-14 21:22:04', '2024-04-14 21:22:04');
INSERT INTO `task`
VALUES (193, 'xiaofuge', 'bigmarket.award_send', '63527396593',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"63527396593\",\"timestamp\":\"2024-04-14 21:22:05.201\"}',
        'complete', '2024-04-14 21:22:05', '2024-04-14 21:22:05');
INSERT INTO `task`
VALUES (194, 'xiaofuge', 'bigmarket.award_send', '20170161140',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20170161140\",\"timestamp\":\"2024-04-14 21:22:05.714\"}',
        'complete', '2024-04-14 21:22:05', '2024-04-14 21:22:05');
INSERT INTO `task`
VALUES (195, 'xiaofuge', 'bigmarket.award_send', '82888367837',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"82888367837\",\"timestamp\":\"2024-04-14 21:22:06.23\"}',
        'complete', '2024-04-14 21:22:06', '2024-04-14 21:22:06');
INSERT INTO `task`
VALUES (196, 'xiaofuge', 'bigmarket.award_send', '45519429170',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"45519429170\",\"timestamp\":\"2024-04-14 21:22:06.747\"}',
        'complete', '2024-04-14 21:22:06', '2024-04-14 21:22:06');
INSERT INTO `task`
VALUES (197, 'xiaofuge', 'bigmarket.award_send', '12513612133',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"12513612133\",\"timestamp\":\"2024-04-14 21:22:07.262\"}',
        'complete', '2024-04-14 21:22:07', '2024-04-14 21:22:07');
INSERT INTO `task`
VALUES (198, 'xiaofuge', 'bigmarket.award_send', '78661329564',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"78661329564\",\"timestamp\":\"2024-04-14 21:22:07.779\"}',
        'complete', '2024-04-14 21:22:07', '2024-04-14 21:22:07');
INSERT INTO `task`
VALUES (199, 'xiaofuge', 'bigmarket.award_send', '08280774852',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08280774852\",\"timestamp\":\"2024-04-14 21:22:08.293\"}',
        'complete', '2024-04-14 21:22:08', '2024-04-14 21:22:08');
INSERT INTO `task`
VALUES (200, 'xiaofuge', 'bigmarket.award_send', '66610928144',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"66610928144\",\"timestamp\":\"2024-04-14 21:22:08.811\"}',
        'complete', '2024-04-14 21:22:08', '2024-04-14 21:22:08');
INSERT INTO `task`
VALUES (201, 'xiaofuge', 'bigmarket.award_send', '25705745955',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"25705745955\",\"timestamp\":\"2024-04-14 21:22:09.324\"}',
        'complete', '2024-04-14 21:22:09', '2024-04-14 21:22:09');
INSERT INTO `task`
VALUES (202, 'xiaofuge', 'bigmarket.award_send', '87286292313',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"87286292313\",\"timestamp\":\"2024-04-14 21:22:09.84\"}',
        'complete', '2024-04-14 21:22:09', '2024-04-14 21:22:09');
INSERT INTO `task`
VALUES (203, 'xiaofuge', 'bigmarket.award_send', '55034873864',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55034873864\",\"timestamp\":\"2024-04-14 21:22:10.354\"}',
        'complete', '2024-04-14 21:22:10', '2024-04-14 21:22:10');
INSERT INTO `task`
VALUES (204, 'xiaofuge', 'bigmarket.award_send', '80721699460',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"80721699460\",\"timestamp\":\"2024-04-14 21:22:10.871\"}',
        'complete', '2024-04-14 21:22:10', '2024-04-14 21:22:10');
INSERT INTO `task`
VALUES (205, 'xiaofuge', 'bigmarket.award_send', '27933638915',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"27933638915\",\"timestamp\":\"2024-04-14 21:22:11.387\"}',
        'complete', '2024-04-14 21:22:11', '2024-04-14 21:22:11');
INSERT INTO `task`
VALUES (206, 'xiaofuge', 'bigmarket.award_send', '51954399830',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51954399830\",\"timestamp\":\"2024-04-14 21:22:11.905\"}',
        'complete', '2024-04-14 21:22:11', '2024-04-14 21:22:11');
INSERT INTO `task`
VALUES (207, 'xiaofuge', 'bigmarket.award_send', '56822055660',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"56822055660\",\"timestamp\":\"2024-04-14 21:22:12.42\"}',
        'complete', '2024-04-14 21:22:12', '2024-04-14 21:22:12');
INSERT INTO `task`
VALUES (208, 'xiaofuge', 'bigmarket.award_send', '41999595812',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"41999595812\",\"timestamp\":\"2024-04-14 21:22:12.933\"}',
        'complete', '2024-04-14 21:22:12', '2024-04-14 21:22:12');
INSERT INTO `task`
VALUES (209, 'xiaofuge', 'bigmarket.award_send', '87070288538',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"87070288538\",\"timestamp\":\"2024-04-14 21:22:13.464\"}',
        'complete', '2024-04-14 21:22:13', '2024-04-14 21:22:13');
INSERT INTO `task`
VALUES (210, 'xiaofuge', 'bigmarket.award_send', '46670928955',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"46670928955\",\"timestamp\":\"2024-04-14 21:22:13.982\"}',
        'complete', '2024-04-14 21:22:13', '2024-04-14 21:22:13');
INSERT INTO `task`
VALUES (211, 'xiaofuge', 'bigmarket.award_send', '32274672582',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32274672582\",\"timestamp\":\"2024-04-14 21:22:14.498\"}',
        'complete', '2024-04-14 21:22:14', '2024-04-14 21:22:14');
INSERT INTO `task`
VALUES (212, 'xiaofuge', 'bigmarket.award_send', '38042354431',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"38042354431\",\"timestamp\":\"2024-04-14 21:22:15.014\"}',
        'complete', '2024-04-14 21:22:15', '2024-04-14 21:22:15');
INSERT INTO `task`
VALUES (213, 'xiaofuge', 'bigmarket.award_send', '77548394550',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"77548394550\",\"timestamp\":\"2024-04-14 21:22:15.526\"}',
        'complete', '2024-04-14 21:22:15', '2024-04-14 21:22:15');
INSERT INTO `task`
VALUES (214, 'xiaofuge', 'bigmarket.award_send', '32703214805',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32703214805\",\"timestamp\":\"2024-04-14 21:22:16.042\"}',
        'complete', '2024-04-14 21:22:16', '2024-04-14 21:22:16');
INSERT INTO `task`
VALUES (215, 'xiaofuge', 'bigmarket.award_send', '03808671427',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"03808671427\",\"timestamp\":\"2024-04-14 21:22:16.556\"}',
        'complete', '2024-04-14 21:22:16', '2024-04-14 21:22:16');
INSERT INTO `task`
VALUES (216, 'xiaofuge', 'bigmarket.award_send', '06439500839',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"06439500839\",\"timestamp\":\"2024-04-14 21:22:17.064\"}',
        'complete', '2024-04-14 21:22:17', '2024-04-14 21:22:17');
INSERT INTO `task`
VALUES (217, 'xiaofuge', 'bigmarket.award_send', '12346656264',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"12346656264\",\"timestamp\":\"2024-04-14 21:22:17.571\"}',
        'complete', '2024-04-14 21:22:17', '2024-04-14 21:22:17');
INSERT INTO `task`
VALUES (218, 'xiaofuge', 'bigmarket.award_send', '73099283305',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"73099283305\",\"timestamp\":\"2024-04-14 21:22:18.089\"}',
        'complete', '2024-04-14 21:22:18', '2024-04-14 21:22:18');
INSERT INTO `task`
VALUES (219, 'xiaofuge', 'bigmarket.award_send', '50577516024',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"50577516024\",\"timestamp\":\"2024-04-14 21:22:18.604\"}',
        'complete', '2024-04-14 21:22:18', '2024-04-14 21:22:18');
INSERT INTO `task`
VALUES (220, 'xiaofuge', 'bigmarket.award_send', '51669111372',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51669111372\",\"timestamp\":\"2024-04-14 21:22:19.119\"}',
        'complete', '2024-04-14 21:22:19', '2024-04-14 21:22:19');
INSERT INTO `task`
VALUES (221, 'xiaofuge', 'bigmarket.award_send', '88606424802',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"88606424802\",\"timestamp\":\"2024-04-14 21:22:19.632\"}',
        'complete', '2024-04-14 21:22:19', '2024-04-14 21:22:19');
INSERT INTO `task`
VALUES (222, 'xiaofuge', 'bigmarket.award_send', '73238613362',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"73238613362\",\"timestamp\":\"2024-04-14 21:22:20.148\"}',
        'complete', '2024-04-14 21:22:20', '2024-04-14 21:22:20');
INSERT INTO `task`
VALUES (223, 'xiaofuge', 'bigmarket.award_send', '04714612627',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"04714612627\",\"timestamp\":\"2024-04-14 21:22:20.663\"}',
        'complete', '2024-04-14 21:22:20', '2024-04-14 21:22:20');
INSERT INTO `task`
VALUES (224, 'xiaofuge', 'bigmarket.award_send', '69880974350',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69880974350\",\"timestamp\":\"2024-04-14 21:22:21.18\"}',
        'complete', '2024-04-14 21:22:21', '2024-04-14 21:22:21');
INSERT INTO `task`
VALUES (225, 'xiaofuge', 'bigmarket.award_send', '89627750648',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"89627750648\",\"timestamp\":\"2024-04-14 21:22:21.695\"}',
        'complete', '2024-04-14 21:22:21', '2024-04-14 21:22:21');
INSERT INTO `task`
VALUES (226, 'xiaofuge', 'bigmarket.award_send', '80400426474',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"80400426474\",\"timestamp\":\"2024-04-14 21:22:22.208\"}',
        'complete', '2024-04-14 21:22:22', '2024-04-14 21:22:22');
INSERT INTO `task`
VALUES (227, 'xiaofuge', 'bigmarket.award_send', '93756590698',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"93756590698\",\"timestamp\":\"2024-04-14 21:22:22.725\"}',
        'complete', '2024-04-14 21:22:22', '2024-04-14 21:22:22');
INSERT INTO `task`
VALUES (228, 'xiaofuge', 'bigmarket.award_send', '46951361767',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"46951361767\",\"timestamp\":\"2024-04-14 21:22:23.242\"}',
        'complete', '2024-04-14 21:22:23', '2024-04-14 21:22:23');
INSERT INTO `task`
VALUES (229, 'xiaofuge', 'bigmarket.award_send', '15773656716',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"15773656716\",\"timestamp\":\"2024-04-14 21:22:23.759\"}',
        'complete', '2024-04-14 21:22:23', '2024-04-14 21:22:23');
INSERT INTO `task`
VALUES (230, 'xiaofuge', 'bigmarket.award_send', '60461289435',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"60461289435\",\"timestamp\":\"2024-04-14 21:22:24.274\"}',
        'complete', '2024-04-14 21:22:24', '2024-04-14 21:22:24');
INSERT INTO `task`
VALUES (231, 'xiaofuge', 'bigmarket.award_send', '19330681146',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"19330681146\",\"timestamp\":\"2024-04-14 21:22:24.788\"}',
        'complete', '2024-04-14 21:22:24', '2024-04-14 21:22:24');
INSERT INTO `task`
VALUES (232, 'xiaofuge', 'bigmarket.award_send', '61804917149',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61804917149\",\"timestamp\":\"2024-04-14 21:22:25.305\"}',
        'complete', '2024-04-14 21:22:25', '2024-04-14 21:22:25');
INSERT INTO `task`
VALUES (233, 'xiaofuge', 'bigmarket.award_send', '32845973457',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32845973457\",\"timestamp\":\"2024-04-14 21:22:25.821\"}',
        'complete', '2024-04-14 21:22:25', '2024-04-14 21:22:25');
INSERT INTO `task`
VALUES (234, 'xiaofuge', 'bigmarket.award_send', '07389998764',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"07389998764\",\"timestamp\":\"2024-04-14 21:22:26.335\"}',
        'complete', '2024-04-14 21:22:26', '2024-04-14 21:22:26');
INSERT INTO `task`
VALUES (235, 'xiaofuge', 'bigmarket.award_send', '02415603276',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"02415603276\",\"timestamp\":\"2024-04-14 21:22:26.851\"}',
        'complete', '2024-04-14 21:22:26', '2024-04-14 21:22:26');
INSERT INTO `task`
VALUES (236, 'xiaofuge', 'bigmarket.award_send', '25134313935',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"25134313935\",\"timestamp\":\"2024-04-14 21:22:27.365\"}',
        'complete', '2024-04-14 21:22:27', '2024-04-14 21:22:27');
INSERT INTO `task`
VALUES (237, 'xiaofuge', 'bigmarket.award_send', '86158069855',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"86158069855\",\"timestamp\":\"2024-04-14 21:22:27.88\"}',
        'complete', '2024-04-14 21:22:27', '2024-04-14 21:22:27');
INSERT INTO `task`
VALUES (238, 'xiaofuge', 'bigmarket.award_send', '94597027880',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"94597027880\",\"timestamp\":\"2024-04-14 21:23:43.972\"}',
        'complete', '2024-04-14 21:23:44', '2024-04-14 21:23:44');
INSERT INTO `task`
VALUES (239, 'xiaofuge', 'bigmarket.award_send', '58977118454',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"58977118454\",\"timestamp\":\"2024-04-14 21:23:44.775\"}',
        'complete', '2024-04-14 21:23:44', '2024-04-14 21:23:44');
INSERT INTO `task`
VALUES (240, 'xiaofuge', 'bigmarket.award_send', '10777260141',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"10777260141\",\"timestamp\":\"2024-04-14 21:23:45.289\"}',
        'complete', '2024-04-14 21:23:45', '2024-04-14 21:23:45');
INSERT INTO `task`
VALUES (241, 'xiaofuge', 'bigmarket.award_send', '12686267969',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"12686267969\",\"timestamp\":\"2024-04-14 21:23:45.804\"}',
        'complete', '2024-04-14 21:23:45', '2024-04-14 21:23:45');
INSERT INTO `task`
VALUES (242, 'xiaofuge', 'bigmarket.award_send', '19639517552',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"19639517552\",\"timestamp\":\"2024-04-14 21:23:46.319\"}',
        'complete', '2024-04-14 21:23:46', '2024-04-14 21:23:46');
INSERT INTO `task`
VALUES (243, 'xiaofuge', 'bigmarket.award_send', '14627500754',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"14627500754\",\"timestamp\":\"2024-04-14 21:23:46.837\"}',
        'complete', '2024-04-14 21:23:46', '2024-04-14 21:23:46');
INSERT INTO `task`
VALUES (244, 'xiaofuge', 'bigmarket.award_send', '29183856889',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"29183856889\",\"timestamp\":\"2024-04-14 21:23:47.354\"}',
        'complete', '2024-04-14 21:23:47', '2024-04-14 21:23:47');
INSERT INTO `task`
VALUES (245, 'xiaofuge', 'bigmarket.award_send', '44558250871',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44558250871\",\"timestamp\":\"2024-04-14 21:23:47.873\"}',
        'complete', '2024-04-14 21:23:47', '2024-04-14 21:23:47');
INSERT INTO `task`
VALUES (246, 'xiaofuge', 'bigmarket.award_send', '09301604481',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"09301604481\",\"timestamp\":\"2024-04-14 21:23:48.39\"}',
        'complete', '2024-04-14 21:23:48', '2024-04-14 21:23:48');
INSERT INTO `task`
VALUES (247, 'xiaofuge', 'bigmarket.award_send', '45533920923',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"45533920923\",\"timestamp\":\"2024-04-14 21:23:48.903\"}',
        'complete', '2024-04-14 21:23:48', '2024-04-14 21:23:48');
INSERT INTO `task`
VALUES (248, 'xiaofuge', 'bigmarket.award_send', '13033943626',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13033943626\",\"timestamp\":\"2024-04-14 21:23:49.425\"}',
        'complete', '2024-04-14 21:23:49', '2024-04-14 21:23:49');
INSERT INTO `task`
VALUES (249, 'xiaofuge', 'bigmarket.award_send', '74593418447',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74593418447\",\"timestamp\":\"2024-04-14 21:23:49.941\"}',
        'complete', '2024-04-14 21:23:49', '2024-04-14 21:23:49');
INSERT INTO `task`
VALUES (250, 'xiaofuge', 'bigmarket.award_send', '05442809981',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"05442809981\",\"timestamp\":\"2024-04-14 21:23:50.459\"}',
        'complete', '2024-04-14 21:23:50', '2024-04-14 21:23:50');
INSERT INTO `task`
VALUES (251, 'xiaofuge', 'bigmarket.award_send', '54669939677',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"54669939677\",\"timestamp\":\"2024-04-14 21:23:50.977\"}',
        'complete', '2024-04-14 21:23:50', '2024-04-14 21:23:50');
INSERT INTO `task`
VALUES (252, 'xiaofuge', 'bigmarket.award_send', '48076079854',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"48076079854\",\"timestamp\":\"2024-04-14 21:23:51.491\"}',
        'complete', '2024-04-14 21:23:51', '2024-04-14 21:23:51');
INSERT INTO `task`
VALUES (253, 'xiaofuge', 'bigmarket.award_send', '69880071024',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69880071024\",\"timestamp\":\"2024-04-14 21:23:52.007\"}',
        'complete', '2024-04-14 21:23:52', '2024-04-14 21:23:52');
INSERT INTO `task`
VALUES (254, 'xiaofuge', 'bigmarket.award_send', '43438693925',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"43438693925\",\"timestamp\":\"2024-04-14 21:23:52.524\"}',
        'complete', '2024-04-14 21:23:52', '2024-04-14 21:23:52');
INSERT INTO `task`
VALUES (255, 'xiaofuge', 'bigmarket.award_send', '25770280970',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"25770280970\",\"timestamp\":\"2024-04-14 21:23:53.041\"}',
        'complete', '2024-04-14 21:23:53', '2024-04-14 21:23:53');
INSERT INTO `task`
VALUES (256, 'xiaofuge', 'bigmarket.award_send', '35823633811',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"35823633811\",\"timestamp\":\"2024-04-14 21:23:53.556\"}',
        'complete', '2024-04-14 21:23:53', '2024-04-14 21:23:53');
INSERT INTO `task`
VALUES (257, 'xiaofuge', 'bigmarket.award_send', '98322349928',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"98322349928\",\"timestamp\":\"2024-04-14 21:23:54.07\"}',
        'complete', '2024-04-14 21:23:54', '2024-04-14 21:23:54');
INSERT INTO `task`
VALUES (258, 'xiaofuge', 'bigmarket.award_send', '22251768052',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"22251768052\",\"timestamp\":\"2024-04-14 21:23:54.588\"}',
        'complete', '2024-04-14 21:23:54', '2024-04-14 21:23:54');
INSERT INTO `task`
VALUES (259, 'xiaofuge', 'bigmarket.award_send', '32934509095',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32934509095\",\"timestamp\":\"2024-04-14 21:23:55.099\"}',
        'complete', '2024-04-14 21:23:55', '2024-04-14 21:23:55');
INSERT INTO `task`
VALUES (260, 'xiaofuge', 'bigmarket.award_send', '53235397420',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53235397420\",\"timestamp\":\"2024-04-14 21:23:55.614\"}',
        'complete', '2024-04-14 21:23:55', '2024-04-14 21:23:55');
INSERT INTO `task`
VALUES (261, 'xiaofuge', 'bigmarket.award_send', '33663006329',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33663006329\",\"timestamp\":\"2024-04-14 21:23:56.131\"}',
        'complete', '2024-04-14 21:23:56', '2024-04-14 21:23:56');
INSERT INTO `task`
VALUES (262, 'xiaofuge', 'bigmarket.award_send', '00474288143',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"00474288143\",\"timestamp\":\"2024-04-14 21:23:56.644\"}',
        'complete', '2024-04-14 21:23:56', '2024-04-14 21:23:56');
INSERT INTO `task`
VALUES (263, 'xiaofuge', 'bigmarket.award_send', '49474264093',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"49474264093\",\"timestamp\":\"2024-04-14 21:23:57.158\"}',
        'complete', '2024-04-14 21:23:57', '2024-04-14 21:23:57');
INSERT INTO `task`
VALUES (264, 'xiaofuge', 'bigmarket.award_send', '13558908100',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13558908100\",\"timestamp\":\"2024-04-14 21:23:57.675\"}',
        'complete', '2024-04-14 21:23:57', '2024-04-14 21:23:57');
INSERT INTO `task`
VALUES (265, 'xiaofuge', 'bigmarket.award_send', '34398279358',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"34398279358\",\"timestamp\":\"2024-04-14 21:23:58.189\"}',
        'complete', '2024-04-14 21:23:58', '2024-04-14 21:23:58');
INSERT INTO `task`
VALUES (266, 'xiaofuge', 'bigmarket.award_send', '32370284582',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"32370284582\",\"timestamp\":\"2024-04-14 21:23:58.705\"}',
        'complete', '2024-04-14 21:23:58', '2024-04-14 21:23:58');
INSERT INTO `task`
VALUES (267, 'xiaofuge', 'bigmarket.award_send', '02018457075',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"02018457075\",\"timestamp\":\"2024-04-14 21:23:59.224\"}',
        'complete', '2024-04-14 21:23:59', '2024-04-14 21:23:59');
INSERT INTO `task`
VALUES (268, 'xiaofuge', 'bigmarket.award_send', '88016845783',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"88016845783\",\"timestamp\":\"2024-04-14 21:23:59.74\"}',
        'complete', '2024-04-14 21:23:59', '2024-04-14 21:23:59');
INSERT INTO `task`
VALUES (269, 'xiaofuge', 'bigmarket.award_send', '15685259583',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"15685259583\",\"timestamp\":\"2024-04-14 21:24:00.254\"}',
        'complete', '2024-04-14 21:24:00', '2024-04-14 21:24:00');
INSERT INTO `task`
VALUES (270, 'xiaofuge', 'bigmarket.award_send', '55640131680',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55640131680\",\"timestamp\":\"2024-04-14 21:24:00.77\"}',
        'complete', '2024-04-14 21:24:00', '2024-04-14 21:24:00');
INSERT INTO `task`
VALUES (271, 'xiaofuge', 'bigmarket.award_send', '21689245783',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"21689245783\",\"timestamp\":\"2024-04-14 21:24:01.287\"}',
        'complete', '2024-04-14 21:24:01', '2024-04-14 21:24:01');
INSERT INTO `task`
VALUES (272, 'xiaofuge', 'bigmarket.award_send', '17908394544',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"17908394544\",\"timestamp\":\"2024-04-14 21:24:01.8\"}',
        'complete', '2024-04-14 21:24:01', '2024-04-14 21:24:01');
INSERT INTO `task`
VALUES (273, 'xiaofuge', 'bigmarket.award_send', '08827522375',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08827522375\",\"timestamp\":\"2024-04-14 21:24:02.316\"}',
        'complete', '2024-04-14 21:24:02', '2024-04-14 21:24:02');
INSERT INTO `task`
VALUES (274, 'xiaofuge', 'bigmarket.award_send', '20031426689',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20031426689\",\"timestamp\":\"2024-04-14 21:24:02.83\"}',
        'complete', '2024-04-14 21:24:02', '2024-04-14 21:24:02');
INSERT INTO `task`
VALUES (275, 'xiaofuge', 'bigmarket.award_send', '38456099777',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"38456099777\",\"timestamp\":\"2024-04-14 21:24:03.347\"}',
        'complete', '2024-04-14 21:24:03', '2024-04-14 21:24:03');
INSERT INTO `task`
VALUES (276, 'xiaofuge', 'bigmarket.award_send', '28392365148',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"28392365148\",\"timestamp\":\"2024-04-14 21:24:03.86\"}',
        'complete', '2024-04-14 21:24:03', '2024-04-14 21:24:03');
INSERT INTO `task`
VALUES (277, 'xiaofuge', 'bigmarket.award_send', '40094670644',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"40094670644\",\"timestamp\":\"2024-04-14 21:24:04.378\"}',
        'complete', '2024-04-14 21:24:04', '2024-04-14 21:24:04');
INSERT INTO `task`
VALUES (278, 'xiaofuge', 'bigmarket.award_send', '61136600800',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61136600800\",\"timestamp\":\"2024-04-14 21:24:04.894\"}',
        'complete', '2024-04-14 21:24:04', '2024-04-14 21:24:04');
INSERT INTO `task`
VALUES (279, 'xiaofuge', 'bigmarket.award_send', '69632235100',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69632235100\",\"timestamp\":\"2024-04-14 21:24:05.408\"}',
        'complete', '2024-04-14 21:24:05', '2024-04-14 21:24:05');
INSERT INTO `task`
VALUES (280, 'xiaofuge', 'bigmarket.award_send', '70673928681',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"70673928681\",\"timestamp\":\"2024-04-14 21:24:05.922\"}',
        'complete', '2024-04-14 21:24:05', '2024-04-14 21:24:05');
INSERT INTO `task`
VALUES (281, 'xiaofuge', 'bigmarket.award_send', '61559168257',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61559168257\",\"timestamp\":\"2024-04-14 21:24:06.438\"}',
        'complete', '2024-04-14 21:24:06', '2024-04-14 21:24:06');
INSERT INTO `task`
VALUES (282, 'xiaofuge', 'bigmarket.award_send', '87684169930',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"87684169930\",\"timestamp\":\"2024-04-14 21:24:06.952\"}',
        'complete', '2024-04-14 21:24:06', '2024-04-14 21:24:06');
INSERT INTO `task`
VALUES (283, 'xiaofuge', 'bigmarket.award_send', '13378830869',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13378830869\",\"timestamp\":\"2024-04-14 21:24:07.473\"}',
        'complete', '2024-04-14 21:24:07', '2024-04-14 21:24:07');
INSERT INTO `task`
VALUES (284, 'xiaofuge', 'bigmarket.award_send', '50225592309',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"50225592309\",\"timestamp\":\"2024-04-14 21:24:07.99\"}',
        'complete', '2024-04-14 21:24:07', '2024-04-14 21:24:07');
INSERT INTO `task`
VALUES (285, 'xiaofuge', 'bigmarket.award_send', '34107885820',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"34107885820\",\"timestamp\":\"2024-04-14 21:24:08.509\"}',
        'complete', '2024-04-14 21:24:08', '2024-04-14 21:24:08');
INSERT INTO `task`
VALUES (286, 'xiaofuge', 'bigmarket.award_send', '52256490389',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"52256490389\",\"timestamp\":\"2024-04-14 21:24:09.025\"}',
        'complete', '2024-04-14 21:24:09', '2024-04-14 21:24:09');
INSERT INTO `task`
VALUES (287, 'xiaofuge', 'bigmarket.award_send', '92493994027',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"92493994027\",\"timestamp\":\"2024-04-14 21:24:09.542\"}',
        'complete', '2024-04-14 21:24:09', '2024-04-14 21:24:09');
INSERT INTO `task`
VALUES (288, 'xiaofuge', 'bigmarket.award_send', '55061954210',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"55061954210\",\"timestamp\":\"2024-04-14 21:24:10.058\"}',
        'complete', '2024-04-14 21:24:10', '2024-04-14 21:24:10');
INSERT INTO `task`
VALUES (289, 'xiaofuge', 'bigmarket.award_send', '74788699086',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74788699086\",\"timestamp\":\"2024-04-14 21:24:10.574\"}',
        'complete', '2024-04-14 21:24:10', '2024-04-14 21:24:10');
INSERT INTO `task`
VALUES (290, 'xiaofuge', 'bigmarket.award_send', '07905102529',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"07905102529\",\"timestamp\":\"2024-04-14 21:24:11.093\"}',
        'complete', '2024-04-14 21:24:11', '2024-04-14 21:24:11');
INSERT INTO `task`
VALUES (291, 'xiaofuge', 'bigmarket.award_send', '49454222256',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"49454222256\",\"timestamp\":\"2024-04-14 21:24:11.61\"}',
        'complete', '2024-04-14 21:24:11', '2024-04-14 21:24:11');
INSERT INTO `task`
VALUES (292, 'xiaofuge', 'bigmarket.award_send', '87965135185',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"87965135185\",\"timestamp\":\"2024-04-14 21:24:12.127\"}',
        'complete', '2024-04-14 21:24:12', '2024-04-14 21:24:12');
INSERT INTO `task`
VALUES (293, 'xiaofuge', 'bigmarket.award_send', '31701498992',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"31701498992\",\"timestamp\":\"2024-04-14 21:24:12.643\"}',
        'complete', '2024-04-14 21:24:12', '2024-04-14 21:24:12');
INSERT INTO `task`
VALUES (294, 'xiaofuge', 'bigmarket.award_send', '99237847744',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"99237847744\",\"timestamp\":\"2024-04-14 21:24:13.158\"}',
        'complete', '2024-04-14 21:24:13', '2024-04-14 21:24:13');
INSERT INTO `task`
VALUES (295, 'xiaofuge', 'bigmarket.award_send', '75766556344',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"75766556344\",\"timestamp\":\"2024-04-14 21:24:13.677\"}',
        'complete', '2024-04-14 21:24:13', '2024-04-14 21:24:13');
INSERT INTO `task`
VALUES (296, 'xiaofuge', 'bigmarket.award_send', '50614771951',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"50614771951\",\"timestamp\":\"2024-04-14 21:24:14.192\"}',
        'complete', '2024-04-14 21:24:14', '2024-04-14 21:24:14');
INSERT INTO `task`
VALUES (297, 'xiaofuge', 'bigmarket.award_send', '46152380967',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"46152380967\",\"timestamp\":\"2024-04-14 21:24:14.711\"}',
        'complete', '2024-04-14 21:24:14', '2024-04-14 21:24:14');
INSERT INTO `task`
VALUES (298, 'xiaofuge', 'bigmarket.award_send', '24180913240',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"24180913240\",\"timestamp\":\"2024-04-14 21:24:15.226\"}',
        'complete', '2024-04-14 21:24:15', '2024-04-14 21:24:15');
INSERT INTO `task`
VALUES (299, 'xiaofuge', 'bigmarket.award_send', '53430343838',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53430343838\",\"timestamp\":\"2024-04-14 21:24:15.742\"}',
        'complete', '2024-04-14 21:24:15', '2024-04-14 21:24:15');
INSERT INTO `task`
VALUES (300, 'xiaofuge', 'bigmarket.award_send', '36998548537',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"36998548537\",\"timestamp\":\"2024-04-14 21:24:16.256\"}',
        'complete', '2024-04-14 21:24:16', '2024-04-14 21:24:16');
INSERT INTO `task`
VALUES (301, 'xiaofuge', 'bigmarket.award_send', '89268659139',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"89268659139\",\"timestamp\":\"2024-04-14 21:24:16.771\"}',
        'complete', '2024-04-14 21:24:16', '2024-04-14 21:24:16');
INSERT INTO `task`
VALUES (302, 'xiaofuge', 'bigmarket.award_send', '90552083744',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"90552083744\",\"timestamp\":\"2024-04-14 21:24:17.285\"}',
        'complete', '2024-04-14 21:24:17', '2024-04-14 21:24:17');
INSERT INTO `task`
VALUES (303, 'xiaofuge', 'bigmarket.award_send', '98401412645',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"98401412645\",\"timestamp\":\"2024-04-14 21:24:17.799\"}',
        'complete', '2024-04-14 21:24:17', '2024-04-14 21:24:17');
INSERT INTO `task`
VALUES (304, 'xiaofuge', 'bigmarket.award_send', '48559204188',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"48559204188\",\"timestamp\":\"2024-04-14 21:24:18.32\"}',
        'complete', '2024-04-14 21:24:18', '2024-04-14 21:24:18');
INSERT INTO `task`
VALUES (305, 'xiaofuge', 'bigmarket.award_send', '02748957867',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"02748957867\",\"timestamp\":\"2024-04-14 21:24:18.835\"}',
        'complete', '2024-04-14 21:24:18', '2024-04-14 21:24:18');
INSERT INTO `task`
VALUES (306, 'xiaofuge', 'bigmarket.award_send', '20825193347',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20825193347\",\"timestamp\":\"2024-04-14 21:24:19.353\"}',
        'complete', '2024-04-14 21:24:19', '2024-04-14 21:24:19');
INSERT INTO `task`
VALUES (307, 'xiaofuge', 'bigmarket.award_send', '71286849040',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71286849040\",\"timestamp\":\"2024-04-14 21:24:19.87\"}',
        'complete', '2024-04-14 21:24:19', '2024-04-14 21:24:19');
INSERT INTO `task`
VALUES (308, 'xiaofuge', 'bigmarket.award_send', '47364981959',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"47364981959\",\"timestamp\":\"2024-04-14 21:24:20.387\"}',
        'complete', '2024-04-14 21:24:20', '2024-04-14 21:24:20');
INSERT INTO `task`
VALUES (309, 'xiaofuge', 'bigmarket.award_send', '26059826625',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"26059826625\",\"timestamp\":\"2024-04-14 21:24:20.904\"}',
        'complete', '2024-04-14 21:24:20', '2024-04-14 21:24:20');
INSERT INTO `task`
VALUES (310, 'xiaofuge', 'bigmarket.award_send', '64888332028',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"64888332028\",\"timestamp\":\"2024-04-14 21:24:21.419\"}',
        'complete', '2024-04-14 21:24:21', '2024-04-14 21:24:21');
INSERT INTO `task`
VALUES (311, 'xiaofuge', 'bigmarket.award_send', '68479415808',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"68479415808\",\"timestamp\":\"2024-04-14 21:24:21.935\"}',
        'complete', '2024-04-14 21:24:21', '2024-04-14 21:24:21');
INSERT INTO `task`
VALUES (312, 'xiaofuge', 'bigmarket.award_send', '05915532632',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"05915532632\",\"timestamp\":\"2024-04-14 21:24:22.453\"}',
        'complete', '2024-04-14 21:24:22', '2024-04-14 21:24:22');
INSERT INTO `task`
VALUES (313, 'xiaofuge', 'bigmarket.award_send', '57318725109',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"57318725109\",\"timestamp\":\"2024-04-14 21:24:22.966\"}',
        'complete', '2024-04-14 21:24:22', '2024-04-14 21:24:22');
INSERT INTO `task`
VALUES (314, 'xiaofuge', 'bigmarket.award_send', '98866715343',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"98866715343\",\"timestamp\":\"2024-04-14 21:24:23.485\"}',
        'complete', '2024-04-14 21:24:23', '2024-04-14 21:24:23');
INSERT INTO `task`
VALUES (315, 'xiaofuge', 'bigmarket.award_send', '18225883475',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"18225883475\",\"timestamp\":\"2024-04-14 21:24:24\"}',
        'complete', '2024-04-14 21:24:24', '2024-04-14 21:24:24');
INSERT INTO `task`
VALUES (316, 'xiaofuge', 'bigmarket.award_send', '37452885681',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"37452885681\",\"timestamp\":\"2024-04-14 21:24:24.516\"}',
        'complete', '2024-04-14 21:24:24', '2024-04-14 21:24:24');
INSERT INTO `task`
VALUES (317, 'xiaofuge', 'bigmarket.award_send', '37717046432',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"37717046432\",\"timestamp\":\"2024-04-14 21:24:25.035\"}',
        'complete', '2024-04-14 21:24:25', '2024-04-14 21:24:25');
INSERT INTO `task`
VALUES (318, 'xiaofuge', 'bigmarket.award_send', '19281065275',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"19281065275\",\"timestamp\":\"2024-04-14 21:24:25.552\"}',
        'complete', '2024-04-14 21:24:25', '2024-04-14 21:24:25');
INSERT INTO `task`
VALUES (319, 'xiaofuge', 'bigmarket.award_send', '08002662671',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08002662671\",\"timestamp\":\"2024-04-14 21:24:26.068\"}',
        'complete', '2024-04-14 21:24:26', '2024-04-14 21:24:26');
INSERT INTO `task`
VALUES (320, 'xiaofuge', 'bigmarket.award_send', '20142219110',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"20142219110\",\"timestamp\":\"2024-04-14 21:24:26.584\"}',
        'complete', '2024-04-14 21:24:26', '2024-04-14 21:24:26');
INSERT INTO `task`
VALUES (321, 'xiaofuge', 'bigmarket.award_send', '89667440948',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"89667440948\",\"timestamp\":\"2024-04-14 21:24:27.098\"}',
        'complete', '2024-04-14 21:24:27', '2024-04-14 21:24:27');
INSERT INTO `task`
VALUES (322, 'xiaofuge', 'bigmarket.award_send', '19058975637',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"19058975637\",\"timestamp\":\"2024-04-14 21:24:27.616\"}',
        'complete', '2024-04-14 21:24:27', '2024-04-14 21:24:27');
INSERT INTO `task`
VALUES (323, 'xiaofuge', 'bigmarket.award_send', '03076537337',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"03076537337\",\"timestamp\":\"2024-04-14 21:24:28.13\"}',
        'complete', '2024-04-14 21:24:28', '2024-04-14 21:24:28');
INSERT INTO `task`
VALUES (324, 'xiaofuge', 'bigmarket.award_send', '74292422301',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74292422301\",\"timestamp\":\"2024-04-14 21:24:28.646\"}',
        'complete', '2024-04-14 21:24:28', '2024-04-14 21:24:28');
INSERT INTO `task`
VALUES (325, 'xiaofuge', 'bigmarket.award_send', '79600984644',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"79600984644\",\"timestamp\":\"2024-04-14 21:24:29.152\"}',
        'complete', '2024-04-14 21:24:29', '2024-04-14 21:24:29');
INSERT INTO `task`
VALUES (326, 'xiaofuge', 'bigmarket.award_send', '09173060823',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"09173060823\",\"timestamp\":\"2024-04-14 21:24:29.664\"}',
        'complete', '2024-04-14 21:24:29', '2024-04-14 21:24:29');
INSERT INTO `task`
VALUES (327, 'xiaofuge', 'bigmarket.award_send', '53464935662',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"53464935662\",\"timestamp\":\"2024-04-14 21:24:30.179\"}',
        'complete', '2024-04-14 21:24:30', '2024-04-14 21:24:30');
INSERT INTO `task`
VALUES (328, 'xiaofuge', 'bigmarket.award_send', '00684267622',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"00684267622\",\"timestamp\":\"2024-04-14 21:24:30.695\"}',
        'complete', '2024-04-14 21:24:30', '2024-04-14 21:24:30');
INSERT INTO `task`
VALUES (329, 'xiaofuge', 'bigmarket.award_send', '24433457730',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"24433457730\",\"timestamp\":\"2024-04-14 21:24:31.207\"}',
        'complete', '2024-04-14 21:24:31', '2024-04-14 21:24:31');
INSERT INTO `task`
VALUES (330, 'xiaofuge', 'bigmarket.award_send', '69910229807',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69910229807\",\"timestamp\":\"2024-04-14 21:24:31.723\"}',
        'complete', '2024-04-14 21:24:31', '2024-04-14 21:24:31');
INSERT INTO `task`
VALUES (331, 'xiaofuge', 'bigmarket.award_send', '58876860645',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"58876860645\",\"timestamp\":\"2024-04-14 21:24:32.238\"}',
        'complete', '2024-04-14 21:24:32', '2024-04-14 21:24:32');
INSERT INTO `task`
VALUES (332, 'xiaofuge', 'bigmarket.award_send', '34370356621',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"34370356621\",\"timestamp\":\"2024-04-14 21:24:32.756\"}',
        'complete', '2024-04-14 21:24:32', '2024-04-14 21:24:32');
INSERT INTO `task`
VALUES (333, 'xiaofuge', 'bigmarket.award_send', '35859191390',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"35859191390\",\"timestamp\":\"2024-04-14 21:24:33.272\"}',
        'complete', '2024-04-14 21:24:33', '2024-04-14 21:24:33');
INSERT INTO `task`
VALUES (334, 'xiaofuge', 'bigmarket.award_send', '71963949022',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71963949022\",\"timestamp\":\"2024-04-14 21:24:33.788\"}',
        'complete', '2024-04-14 21:24:33', '2024-04-14 21:24:33');
INSERT INTO `task`
VALUES (335, 'xiaofuge', 'bigmarket.award_send', '13012267240',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13012267240\",\"timestamp\":\"2024-04-14 21:24:34.303\"}',
        'complete', '2024-04-14 21:24:34', '2024-04-14 21:24:34');
INSERT INTO `task`
VALUES (336, 'xiaofuge', 'bigmarket.award_send', '13876598904',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"13876598904\",\"timestamp\":\"2024-04-14 21:24:34.819\"}',
        'complete', '2024-04-14 21:24:34', '2024-04-14 21:24:34');
INSERT INTO `task`
VALUES (337, 'xiaofuge', 'bigmarket.award_send', '52930675468',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"52930675468\",\"timestamp\":\"2024-04-14 21:24:35.334\"}',
        'complete', '2024-04-14 21:24:35', '2024-04-14 21:24:35');
INSERT INTO `task`
VALUES (338, 'xiaofuge', 'bigmarket.award_send', '58373254669',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"58373254669\",\"timestamp\":\"2024-04-16 17:57:58.916\"}',
        'complete', '2024-04-16 17:57:58', '2024-04-16 17:57:58');
INSERT INTO `task`
VALUES (339, 'xiaofuge', 'bigmarket.award_send', '44633046025',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"44633046025\",\"timestamp\":\"2024-04-16 18:30:14.419\"}',
        'complete', '2024-04-16 18:30:14', '2024-04-16 18:30:14');
INSERT INTO `task`
VALUES (340, 'xiaofuge', 'bigmarket.award_send', '50917585403',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"50917585403\",\"timestamp\":\"2024-04-16 18:30:16.581\"}',
        'complete', '2024-04-16 18:30:16', '2024-04-16 18:30:16');
INSERT INTO `task`
VALUES (341, 'xiaofuge', 'bigmarket.award_send', '81379037719',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"81379037719\",\"timestamp\":\"2024-04-16 18:30:17.417\"}',
        'complete', '2024-04-16 18:30:17', '2024-04-16 18:30:17');
INSERT INTO `task`
VALUES (342, 'xiaofuge', 'bigmarket.award_send', '20936684041',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"20936684041\",\"timestamp\":\"2024-04-16 18:30:18.164\"}',
        'complete', '2024-04-16 18:30:18', '2024-04-16 18:30:18');
INSERT INTO `task`
VALUES (343, 'xiaofuge', 'bigmarket.award_send', '90952728751',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"90952728751\",\"timestamp\":\"2024-04-16 18:30:26.543\"}',
        'complete', '2024-04-16 18:30:26', '2024-04-16 18:30:26');
INSERT INTO `task`
VALUES (344, 'xiaofuge', 'bigmarket.award_send', '66111442259',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"66111442259\",\"timestamp\":\"2024-04-16 18:30:36.036\"}',
        'complete', '2024-04-16 18:30:36', '2024-04-16 18:30:36');
INSERT INTO `task`
VALUES (345, 'xiaofuge', 'bigmarket.award_send', '16662665468',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"16662665468\",\"timestamp\":\"2024-04-16 19:27:09.132\"}',
        'complete', '2024-04-16 19:27:09', '2024-04-16 19:27:09');
INSERT INTO `task`
VALUES (346, 'xiaofuge', 'bigmarket.award_send', '09019951104',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"09019951104\",\"timestamp\":\"2024-04-16 19:27:10.335\"}',
        'complete', '2024-04-16 19:27:10', '2024-04-16 19:27:10');
INSERT INTO `task`
VALUES (347, 'xiaofuge', 'bigmarket.award_send', '90474605918',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"90474605918\",\"timestamp\":\"2024-04-16 19:27:11.202\"}',
        'complete', '2024-04-16 19:27:11', '2024-04-16 19:27:11');
INSERT INTO `task`
VALUES (348, 'xiaofuge', 'bigmarket.award_send', '85272231852',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"85272231852\",\"timestamp\":\"2024-04-16 19:27:11.933\"}',
        'complete', '2024-04-16 19:27:11', '2024-04-16 19:27:11');
INSERT INTO `task`
VALUES (349, 'xiaofuge', 'bigmarket.award_send', '26414163319',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"26414163319\",\"timestamp\":\"2024-04-16 19:27:12.757\"}',
        'complete', '2024-04-16 19:27:12', '2024-04-16 19:27:12');
INSERT INTO `task`
VALUES (350, 'xiaofuge', 'bigmarket.award_send', '65165632658',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"65165632658\",\"timestamp\":\"2024-04-16 19:27:13.453\"}',
        'complete', '2024-04-16 19:27:13', '2024-04-16 19:27:13');
INSERT INTO `task`
VALUES (351, 'xiaofuge', 'bigmarket.award_send', '88771399884',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"88771399884\",\"timestamp\":\"2024-04-16 19:27:14.056\"}',
        'complete', '2024-04-16 19:27:14', '2024-04-16 19:27:14');
INSERT INTO `task`
VALUES (352, 'xiaofuge', 'bigmarket.award_send', '73823577443',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"73823577443\",\"timestamp\":\"2024-04-16 19:27:14.664\"}',
        'complete', '2024-04-16 19:27:14', '2024-04-16 19:27:14');
INSERT INTO `task`
VALUES (353, 'xiaofuge', 'bigmarket.award_send', '99281118478',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"99281118478\",\"timestamp\":\"2024-04-16 19:27:15.213\"}',
        'complete', '2024-04-16 19:27:15', '2024-04-16 19:27:15');
INSERT INTO `task`
VALUES (354, 'xiaofuge', 'bigmarket.award_send', '95329149951',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"95329149951\",\"timestamp\":\"2024-04-16 19:27:15.795\"}',
        'complete', '2024-04-16 19:27:15', '2024-04-16 19:27:15');
INSERT INTO `task`
VALUES (355, 'xiaofuge', 'bigmarket.award_send', '86900699621',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"86900699621\",\"timestamp\":\"2024-04-16 19:27:16.301\"}',
        'complete', '2024-04-16 19:27:16', '2024-04-16 19:27:16');
INSERT INTO `task`
VALUES (356, 'xiaofuge', 'bigmarket.award_send', '75310166330',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"75310166330\",\"timestamp\":\"2024-04-16 19:27:16.791\"}',
        'complete', '2024-04-16 19:27:16', '2024-04-16 19:27:16');
INSERT INTO `task`
VALUES (357, 'xiaofuge', 'bigmarket.award_send', '60765267448',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"60765267448\",\"timestamp\":\"2024-04-16 19:27:17.28\"}',
        'complete', '2024-04-16 19:27:17', '2024-04-16 19:27:17');
INSERT INTO `task`
VALUES (358, 'xiaofuge', 'bigmarket.award_send', '68823015437',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"68823015437\",\"timestamp\":\"2024-04-16 19:27:17.762\"}',
        'complete', '2024-04-16 19:27:17', '2024-04-16 19:27:17');
INSERT INTO `task`
VALUES (359, 'xiaofuge', 'bigmarket.award_send', '53760850010',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"53760850010\",\"timestamp\":\"2024-04-16 19:27:18.263\"}',
        'complete', '2024-04-16 19:27:18', '2024-04-16 19:27:18');
INSERT INTO `task`
VALUES (360, 'xiaofuge', 'bigmarket.award_send', '49690164283',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"49690164283\",\"timestamp\":\"2024-04-16 19:27:18.766\"}',
        'complete', '2024-04-16 19:27:18', '2024-04-16 19:27:18');
INSERT INTO `task`
VALUES (361, 'xiaofuge', 'bigmarket.award_send', '35511068756',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"35511068756\",\"timestamp\":\"2024-04-16 19:27:19.303\"}',
        'complete', '2024-04-16 19:27:19', '2024-04-16 19:27:19');
INSERT INTO `task`
VALUES (362, 'xiaofuge', 'bigmarket.award_send', '74549007648',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"74549007648\",\"timestamp\":\"2024-04-16 19:28:28.326\"}',
        'complete', '2024-04-16 19:28:28', '2024-04-16 19:28:28');
INSERT INTO `task`
VALUES (363, 'xiaofuge', 'bigmarket.award_send', '45713691767',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"45713691767\",\"timestamp\":\"2024-04-16 19:28:29.583\"}',
        'complete', '2024-04-16 19:28:29', '2024-04-16 19:28:29');
INSERT INTO `task`
VALUES (364, 'xiaofuge', 'bigmarket.award_send', '77400308222',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"77400308222\",\"timestamp\":\"2024-04-16 19:28:30.42\"}',
        'complete', '2024-04-16 19:28:30', '2024-04-16 19:28:30');
INSERT INTO `task`
VALUES (365, 'xiaofuge', 'bigmarket.award_send', '54249385466',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"54249385466\",\"timestamp\":\"2024-04-16 19:29:02.195\"}',
        'complete', '2024-04-16 19:29:02', '2024-04-16 19:29:02');
INSERT INTO `task`
VALUES (366, 'xiaofuge', 'bigmarket.award_send', '92615899336',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"92615899336\",\"timestamp\":\"2024-04-16 19:29:02.867\"}',
        'complete', '2024-04-16 19:29:02', '2024-04-16 19:29:02');
INSERT INTO `task`
VALUES (367, 'xiaofuge', 'bigmarket.award_send', '50347679572',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"50347679572\",\"timestamp\":\"2024-04-16 19:29:05.056\"}',
        'complete', '2024-04-16 19:29:05', '2024-04-16 19:29:05');
INSERT INTO `task`
VALUES (368, 'xiaofuge', 'bigmarket.award_send', '21267731622',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"21267731622\",\"timestamp\":\"2024-04-16 19:29:05.627\"}',
        'complete', '2024-04-16 19:29:05', '2024-04-16 19:29:05');
INSERT INTO `task`
VALUES (369, 'xiaofuge', 'bigmarket.award_send', '08395680864',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"08395680864\",\"timestamp\":\"2024-04-16 19:29:06.485\"}',
        'complete', '2024-04-16 19:29:06', '2024-04-16 19:29:06');
INSERT INTO `task`
VALUES (370, 'xiaofuge', 'bigmarket.award_send', '90759525069',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"90759525069\",\"timestamp\":\"2024-04-16 19:29:07.005\"}',
        'complete', '2024-04-16 19:29:07', '2024-04-16 19:29:07');
INSERT INTO `task`
VALUES (371, 'xiaofuge', 'bigmarket.award_send', '25380232322',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"25380232322\",\"timestamp\":\"2024-04-16 19:36:53.909\"}',
        'complete', '2024-04-16 19:36:54', '2024-04-16 19:36:54');
INSERT INTO `task`
VALUES (372, 'xiaofuge', 'bigmarket.award_send', '36910604568',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"36910604568\",\"timestamp\":\"2024-04-16 19:36:54.753\"}',
        'complete', '2024-04-16 19:36:54', '2024-04-16 19:36:54');
INSERT INTO `task`
VALUES (373, 'xiaofuge', 'bigmarket.award_send', '34666162421',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"34666162421\",\"timestamp\":\"2024-04-16 19:43:36.46\"}',
        'complete', '2024-04-16 19:43:36', '2024-04-16 19:43:36');
INSERT INTO `task`
VALUES (374, 'xiaofuge', 'bigmarket.award_send', '05057763922',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"05057763922\",\"timestamp\":\"2024-04-16 19:45:31.282\"}',
        'complete', '2024-04-16 19:45:31', '2024-04-16 19:45:31');
INSERT INTO `task`
VALUES (375, 'xiaofuge', 'bigmarket.award_send', '45974406441',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"45974406441\",\"timestamp\":\"2024-04-16 19:45:31.861\"}',
        'complete', '2024-04-16 19:45:31', '2024-04-16 19:45:31');
INSERT INTO `task`
VALUES (376, 'xiaofuge', 'bigmarket.award_send', '38794632787',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"38794632787\",\"timestamp\":\"2024-04-16 19:45:32.412\"}',
        'complete', '2024-04-16 19:45:32', '2024-04-16 19:45:32');
INSERT INTO `task`
VALUES (377, 'xiaofuge', 'bigmarket.award_send', '14955305751',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"14955305751\",\"timestamp\":\"2024-04-16 19:45:32.987\"}',
        'complete', '2024-04-16 19:45:32', '2024-04-16 19:45:32');
INSERT INTO `task`
VALUES (378, 'xiaofuge', 'bigmarket.award_send', '50002363482',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"50002363482\",\"timestamp\":\"2024-04-16 19:45:33.499\"}',
        'complete', '2024-04-16 19:45:33', '2024-04-16 19:45:33');
INSERT INTO `task`
VALUES (379, 'xiaofuge', 'bigmarket.award_send', '78136641035',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"78136641035\",\"timestamp\":\"2024-04-16 19:45:34.033\"}',
        'complete', '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `task`
VALUES (380, 'xiaofuge', 'bigmarket.award_send', '61534269220',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"61534269220\",\"timestamp\":\"2024-04-16 19:45:34.516\"}',
        'complete', '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `task`
VALUES (381, 'xiaofuge', 'bigmarket.award_send', '56535045117',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"56535045117\",\"timestamp\":\"2024-04-16 19:45:34.949\"}',
        'complete', '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `task`
VALUES (382, 'xiaofuge', 'bigmarket.award_send', '45815252909',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"45815252909\",\"timestamp\":\"2024-04-16 19:45:35.441\"}',
        'complete', '2024-04-16 19:45:35', '2024-04-16 19:45:35');
INSERT INTO `task`
VALUES (383, 'xiaofuge', 'bigmarket.award_send', '98189337259',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"98189337259\",\"timestamp\":\"2024-04-16 19:45:35.905\"}',
        'complete', '2024-04-16 19:45:35', '2024-04-16 19:45:35');
INSERT INTO `task`
VALUES (384, 'xiaofuge', 'bigmarket.award_send', '19776582798',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"19776582798\",\"timestamp\":\"2024-04-16 19:45:36.335\"}',
        'complete', '2024-04-16 19:45:36', '2024-04-16 19:45:36');
INSERT INTO `task`
VALUES (385, 'xiaofuge', 'bigmarket.award_send', '41639296416',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"41639296416\",\"timestamp\":\"2024-04-16 19:46:06.084\"}',
        'complete', '2024-04-16 19:46:06', '2024-04-16 19:46:06');
INSERT INTO `task`
VALUES (386, 'xiaofuge', 'bigmarket.award_send', '88779130036',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"88779130036\",\"timestamp\":\"2024-04-16 19:46:13.601\"}',
        'complete', '2024-04-16 19:46:13', '2024-04-16 19:46:13');
INSERT INTO `task`
VALUES (387, 'xiaofuge', 'bigmarket.award_send', '03131287485',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"03131287485\",\"timestamp\":\"2024-04-16 19:46:20.305\"}',
        'complete', '2024-04-16 19:46:20', '2024-04-16 19:46:20');
INSERT INTO `task`
VALUES (388, 'xiaofuge', 'bigmarket.award_send', '27729841650',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"27729841650\",\"timestamp\":\"2024-04-16 19:47:00.879\"}',
        'complete', '2024-04-16 19:47:00', '2024-04-16 19:47:00');
INSERT INTO `task`
VALUES (389, 'xiaofuge', 'bigmarket.award_send', '16020092122',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"16020092122\",\"timestamp\":\"2024-04-16 19:47:09.25\"}',
        'complete', '2024-04-16 19:47:09', '2024-04-16 19:47:09');
INSERT INTO `task`
VALUES (390, 'xiaofuge', 'bigmarket.award_send', '11745863079',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"11745863079\",\"timestamp\":\"2024-04-16 19:47:10.385\"}',
        'complete', '2024-04-16 19:47:10', '2024-04-16 19:47:10');
INSERT INTO `task`
VALUES (391, 'xiaofuge', 'bigmarket.award_send', '90023351677',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"90023351677\",\"timestamp\":\"2024-04-16 19:48:26.573\"}',
        'complete', '2024-04-16 19:48:26', '2024-04-16 19:48:26');
INSERT INTO `task`
VALUES (392, 'xiaofuge', 'bigmarket.award_send', '02076731557',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"02076731557\",\"timestamp\":\"2024-04-16 19:48:28.092\"}',
        'complete', '2024-04-16 19:48:28', '2024-04-16 19:48:28');
INSERT INTO `task`
VALUES (393, 'xiaofuge', 'bigmarket.award_send', '50991619368',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"50991619368\",\"timestamp\":\"2024-04-16 19:50:43.223\"}',
        'complete', '2024-04-16 19:50:43', '2024-04-16 19:50:43');
INSERT INTO `task`
VALUES (394, 'xiaofuge', 'bigmarket.award_send', '09925103156',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"09925103156\",\"timestamp\":\"2024-04-16 19:50:44.092\"}',
        'complete', '2024-04-16 19:50:44', '2024-04-16 19:50:44');
INSERT INTO `task`
VALUES (395, 'xiaofuge', 'bigmarket.award_send', '65561646952',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"65561646952\",\"timestamp\":\"2024-04-16 19:50:44.874\"}',
        'complete', '2024-04-16 19:50:44', '2024-04-16 19:50:44');
INSERT INTO `task`
VALUES (396, 'xiaofuge', 'bigmarket.award_send', '39371223856',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39371223856\",\"timestamp\":\"2024-04-16 19:50:45.589\"}',
        'complete', '2024-04-16 19:50:45', '2024-04-16 19:50:45');
INSERT INTO `task`
VALUES (397, 'xiaofuge', 'bigmarket.award_send', '71302989276',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"71302989276\",\"timestamp\":\"2024-04-16 19:50:46.524\"}',
        'complete', '2024-04-16 19:50:46', '2024-04-16 19:50:46');
INSERT INTO `task`
VALUES (398, 'xiaofuge', 'bigmarket.award_send', '26401325782',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"26401325782\",\"timestamp\":\"2024-04-16 19:52:23.757\"}',
        'complete', '2024-04-16 19:52:23', '2024-04-16 19:52:23');
INSERT INTO `task`
VALUES (399, 'xiaofuge', 'bigmarket.award_send', '23275442952',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"23275442952\",\"timestamp\":\"2024-04-16 19:52:27.453\"}',
        'complete', '2024-04-16 19:52:27', '2024-04-16 19:52:27');
INSERT INTO `task`
VALUES (400, 'xiaofuge', 'bigmarket.award_send', '43300467506',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"43300467506\",\"timestamp\":\"2024-04-16 20:00:26.427\"}',
        'complete', '2024-04-16 20:00:26', '2024-04-16 20:00:26');
INSERT INTO `task`
VALUES (401, 'xiaofuge', 'bigmarket.award_send', '47981556808',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"47981556808\",\"timestamp\":\"2024-04-16 20:00:27.007\"}',
        'complete', '2024-04-16 20:00:27', '2024-04-16 20:00:27');
INSERT INTO `task`
VALUES (402, 'xiaofuge', 'bigmarket.award_send', '57127339089',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"57127339089\",\"timestamp\":\"2024-04-16 20:00:27.55\"}',
        'complete', '2024-04-16 20:00:27', '2024-04-16 20:00:27');
INSERT INTO `task`
VALUES (403, 'xiaofuge', 'bigmarket.award_send', '50698715991',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"50698715991\",\"timestamp\":\"2024-04-16 20:00:28.066\"}',
        'complete', '2024-04-16 20:00:28', '2024-04-16 20:00:28');
INSERT INTO `task`
VALUES (404, 'xiaofuge', 'bigmarket.award_send', '43539125672',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"43539125672\",\"timestamp\":\"2024-04-16 20:00:28.603\"}',
        'complete', '2024-04-16 20:00:28', '2024-04-16 20:00:28');
INSERT INTO `task`
VALUES (405, 'xiaofuge', 'bigmarket.award_send', '12591641119',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"12591641119\",\"timestamp\":\"2024-04-16 20:00:29.086\"}',
        'complete', '2024-04-16 20:00:29', '2024-04-16 20:00:29');
INSERT INTO `task`
VALUES (406, 'xiaofuge', 'bigmarket.award_send', '87351104933',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"87351104933\",\"timestamp\":\"2024-04-16 20:00:29.635\"}',
        'complete', '2024-04-16 20:00:29', '2024-04-16 20:00:29');
INSERT INTO `task`
VALUES (407, 'xiaofuge', 'bigmarket.award_send', '00407549402',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"00407549402\",\"timestamp\":\"2024-04-16 20:00:30.142\"}',
        'complete', '2024-04-16 20:00:30', '2024-04-16 20:00:30');
INSERT INTO `task`
VALUES (408, 'xiaofuge', 'bigmarket.award_send', '21443271937',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"21443271937\",\"timestamp\":\"2024-04-16 20:00:30.622\"}',
        'complete', '2024-04-16 20:00:30', '2024-04-16 20:00:30');
INSERT INTO `task`
VALUES (409, 'xiaofuge', 'bigmarket.award_send', '08192662015',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"08192662015\",\"timestamp\":\"2024-04-16 20:00:31.131\"}',
        'complete', '2024-04-16 20:00:31', '2024-04-16 20:00:31');
INSERT INTO `task`
VALUES (410, 'xiaofuge', 'bigmarket.award_send', '60300771053',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"60300771053\",\"timestamp\":\"2024-04-16 20:00:31.561\"}',
        'complete', '2024-04-16 20:00:31', '2024-04-16 20:00:31');
INSERT INTO `task`
VALUES (411, 'xiaofuge', 'bigmarket.award_send', '36800024783',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"36800024783\",\"timestamp\":\"2024-04-16 20:00:32.117\"}',
        'complete', '2024-04-16 20:00:32', '2024-04-16 20:00:32');
INSERT INTO `task`
VALUES (412, 'xiaofuge', 'bigmarket.award_send', '69721279777',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"69721279777\",\"timestamp\":\"2024-04-16 20:00:32.619\"}',
        'complete', '2024-04-16 20:00:32', '2024-04-16 20:00:32');
INSERT INTO `task`
VALUES (413, 'xiaofuge', 'bigmarket.award_send', '20600316632',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"20600316632\",\"timestamp\":\"2024-04-16 20:00:33.12\"}',
        'complete', '2024-04-16 20:00:33', '2024-04-16 20:00:33');
INSERT INTO `task`
VALUES (414, 'xiaofuge', 'bigmarket.award_send', '73947290691',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"73947290691\",\"timestamp\":\"2024-04-16 20:00:33.639\"}',
        'complete', '2024-04-16 20:00:33', '2024-04-16 20:00:33');
INSERT INTO `task`
VALUES (415, 'xiaofuge', 'bigmarket.award_send', '62910180786',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"62910180786\",\"timestamp\":\"2024-04-16 20:00:43.173\"}',
        'complete', '2024-04-16 20:00:43', '2024-04-16 20:00:43');
INSERT INTO `task`
VALUES (416, 'xiaofuge', 'bigmarket.award_send', '66804711269',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"66804711269\",\"timestamp\":\"2024-04-16 20:00:58.333\"}',
        'complete', '2024-04-16 20:00:58', '2024-04-16 20:00:58');
INSERT INTO `task`
VALUES (417, 'xiaofuge', 'bigmarket.award_send', '90656379824',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"90656379824\",\"timestamp\":\"2024-04-16 20:00:58.764\"}',
        'complete', '2024-04-16 20:00:58', '2024-04-16 20:00:58');
INSERT INTO `task`
VALUES (418, 'xiaofuge', 'bigmarket.award_send', '66757148377',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"66757148377\",\"timestamp\":\"2024-04-16 20:01:00.058\"}',
        'complete', '2024-04-16 20:01:00', '2024-04-16 20:01:00');
INSERT INTO `task`
VALUES (419, 'xiaofuge', 'bigmarket.award_send', '92033405072',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"92033405072\",\"timestamp\":\"2024-04-16 20:01:00.558\"}',
        'complete', '2024-04-16 20:01:00', '2024-04-16 20:01:00');
INSERT INTO `task`
VALUES (420, 'xiaofuge', 'bigmarket.award_send', '36932005682',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"36932005682\",\"timestamp\":\"2024-04-16 20:01:01.09\"}',
        'complete', '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `task`
VALUES (421, 'xiaofuge', 'bigmarket.award_send', '57518631069',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"57518631069\",\"timestamp\":\"2024-04-16 20:01:01.57\"}',
        'complete', '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `task`
VALUES (422, 'xiaofuge', 'bigmarket.award_send', '95367386243',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"95367386243\",\"timestamp\":\"2024-04-16 20:01:01.99\"}',
        'complete', '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `task`
VALUES (423, 'xiaofuge', 'bigmarket.award_send', '26212708723',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"26212708723\",\"timestamp\":\"2024-04-16 20:01:02.389\"}',
        'complete', '2024-04-16 20:01:02', '2024-04-16 20:01:02');
INSERT INTO `task`
VALUES (424, 'xiaofuge', 'bigmarket.award_send', '56716912694',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"56716912694\",\"timestamp\":\"2024-04-16 20:01:02.803\"}',
        'complete', '2024-04-16 20:01:02', '2024-04-16 20:01:02');
INSERT INTO `task`
VALUES (425, 'xiaofuge', 'bigmarket.award_send', '61828364603',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"61828364603\",\"timestamp\":\"2024-04-16 20:01:03.193\"}',
        'complete', '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `task`
VALUES (426, 'xiaofuge', 'bigmarket.award_send', '54510006236',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"54510006236\",\"timestamp\":\"2024-04-16 20:01:03.58\"}',
        'complete', '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `task`
VALUES (427, 'xiaofuge', 'bigmarket.award_send', '78813940503',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"78813940503\",\"timestamp\":\"2024-04-16 20:01:03.954\"}',
        'complete', '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `task`
VALUES (428, 'xiaofuge', 'bigmarket.award_send', '08290007595',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"08290007595\",\"timestamp\":\"2024-04-16 20:01:04.426\"}',
        'complete', '2024-04-16 20:01:04', '2024-04-16 20:01:04');
INSERT INTO `task`
VALUES (429, 'xiaofuge', 'bigmarket.award_send', '80600413004',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"80600413004\",\"timestamp\":\"2024-04-16 20:01:09.438\"}',
        'complete', '2024-04-16 20:01:09', '2024-04-16 20:01:09');
INSERT INTO `task`
VALUES (430, 'xiaofuge', 'bigmarket.award_send', '22464502361',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"22464502361\",\"timestamp\":\"2024-04-16 20:01:09.908\"}',
        'complete', '2024-04-16 20:01:09', '2024-04-16 20:01:09');
INSERT INTO `task`
VALUES (431, 'xiaofuge', 'bigmarket.award_send', '00044042690',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"00044042690\",\"timestamp\":\"2024-04-16 20:01:10.37\"}',
        'complete', '2024-04-16 20:01:10', '2024-04-16 20:01:10');
INSERT INTO `task`
VALUES (432, 'xiaofuge', 'bigmarket.award_send', '96704224475',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"96704224475\",\"timestamp\":\"2024-04-16 20:01:10.869\"}',
        'complete', '2024-04-16 20:01:10', '2024-04-16 20:01:10');
INSERT INTO `task`
VALUES (433, 'xiaofuge', 'bigmarket.award_send', '37875064846',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"37875064846\",\"timestamp\":\"2024-04-16 20:20:44.106\"}',
        'complete', '2024-04-16 20:20:44', '2024-04-16 20:20:44');
INSERT INTO `task`
VALUES (434, 'xiaofuge', 'bigmarket.award_send', '02367431017',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"02367431017\",\"timestamp\":\"2024-04-16 20:22:05.597\"}',
        'complete', '2024-04-16 20:22:05', '2024-04-16 20:22:05');
INSERT INTO `task`
VALUES (435, 'xiaofuge', 'bigmarket.award_send', '39443786151',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39443786151\",\"timestamp\":\"2024-04-16 20:22:28.424\"}',
        'complete', '2024-04-16 20:22:28', '2024-04-16 20:22:28');
INSERT INTO `task`
VALUES (436, 'xiaofuge', 'bigmarket.award_send', '70765661051',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"70765661051\",\"timestamp\":\"2024-04-16 20:25:53.351\"}',
        'complete', '2024-04-16 20:25:53', '2024-04-16 20:25:53');
INSERT INTO `task`
VALUES (437, 'xiaofuge', 'bigmarket.award_send', '54533808510',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"54533808510\",\"timestamp\":\"2024-04-16 20:26:16.353\"}',
        'complete', '2024-04-16 20:26:16', '2024-04-16 20:26:16');
INSERT INTO `task`
VALUES (438, 'xiaofuge', 'bigmarket.award_send', '14068018906',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"14068018906\",\"timestamp\":\"2024-04-16 20:26:17.07\"}',
        'complete', '2024-04-16 20:26:17', '2024-04-16 20:26:17');
INSERT INTO `task`
VALUES (439, 'xiaofuge', 'bigmarket.award_send', '67162302128',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"67162302128\",\"timestamp\":\"2024-04-16 20:26:17.934\"}',
        'complete', '2024-04-16 20:26:17', '2024-04-16 20:26:17');
INSERT INTO `task`
VALUES (440, 'xiaofuge', 'bigmarket.award_send', '74705128852',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"74705128852\",\"timestamp\":\"2024-04-16 20:26:18.541\"}',
        'complete', '2024-04-16 20:26:18', '2024-04-16 20:26:18');
INSERT INTO `task`
VALUES (441, 'xiaofuge', 'bigmarket.award_send', '98347081722',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"98347081722\",\"timestamp\":\"2024-04-16 20:26:19.137\"}',
        'complete', '2024-04-16 20:26:19', '2024-04-16 20:26:19');
INSERT INTO `task`
VALUES (442, 'xiaofuge', 'bigmarket.award_send', '36992359430',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"36992359430\",\"timestamp\":\"2024-04-16 20:26:19.746\"}',
        'complete', '2024-04-16 20:26:19', '2024-04-16 20:26:19');
INSERT INTO `task`
VALUES (443, 'xiaofuge', 'bigmarket.award_send', '72551430310',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"72551430310\",\"timestamp\":\"2024-04-16 20:27:00.495\"}',
        'complete', '2024-04-16 20:27:00', '2024-04-16 20:27:00');
INSERT INTO `task`
VALUES (444, 'xiaofuge', 'bigmarket.award_send', '78904974142',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"78904974142\",\"timestamp\":\"2024-04-16 20:27:00.833\"}',
        'complete', '2024-04-16 20:27:00', '2024-04-16 20:27:00');
INSERT INTO `task`
VALUES (445, 'xiaofuge', 'bigmarket.award_send', '99237591078',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"99237591078\",\"timestamp\":\"2024-04-16 20:27:01.231\"}',
        'complete', '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `task`
VALUES (446, 'xiaofuge', 'bigmarket.award_send', '70101314761',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"70101314761\",\"timestamp\":\"2024-04-16 20:27:01.548\"}',
        'complete', '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `task`
VALUES (447, 'xiaofuge', 'bigmarket.award_send', '84058654029',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"84058654029\",\"timestamp\":\"2024-04-16 20:27:01.949\"}',
        'complete', '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `task`
VALUES (448, 'xiaofuge', 'bigmarket.award_send', '45283929164',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"45283929164\",\"timestamp\":\"2024-04-16 20:27:02.436\"}',
        'complete', '2024-04-16 20:27:02', '2024-04-16 20:27:02');
INSERT INTO `task`
VALUES (449, 'xiaofuge', 'bigmarket.award_send', '44287747400',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"44287747400\",\"timestamp\":\"2024-04-16 20:27:02.831\"}',
        'complete', '2024-04-16 20:27:02', '2024-04-16 20:27:02');
INSERT INTO `task`
VALUES (450, 'xiaofuge', 'bigmarket.award_send', '54038652980',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"54038652980\",\"timestamp\":\"2024-04-16 20:27:03.243\"}',
        'complete', '2024-04-16 20:27:03', '2024-04-16 20:27:03');
INSERT INTO `task`
VALUES (451, 'xiaofuge', 'bigmarket.award_send', '68535928983',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"68535928983\",\"timestamp\":\"2024-04-16 20:27:03.681\"}',
        'complete', '2024-04-16 20:27:03', '2024-04-16 20:27:03');
INSERT INTO `task`
VALUES (452, 'xiaofuge', 'bigmarket.award_send', '82488560919',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"82488560919\",\"timestamp\":\"2024-04-16 20:27:04.138\"}',
        'complete', '2024-04-16 20:27:04', '2024-04-16 20:27:04');
INSERT INTO `task`
VALUES (453, 'xiaofuge', 'bigmarket.award_send', '18461817227',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"18461817227\",\"timestamp\":\"2024-04-16 21:10:10.849\"}',
        'complete', '2024-04-16 21:10:10', '2024-04-16 21:10:10');
INSERT INTO `task`
VALUES (454, 'xiaofuge', 'bigmarket.award_send', '43696513900',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"43696513900\",\"timestamp\":\"2024-04-16 21:10:12.054\"}',
        'complete', '2024-04-16 21:10:12', '2024-04-16 21:10:12');
INSERT INTO `task`
VALUES (455, 'xiaofuge', 'bigmarket.award_send', '90654493507',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"90654493507\",\"timestamp\":\"2024-04-16 21:10:12.683\"}',
        'complete', '2024-04-16 21:10:12', '2024-04-16 21:10:12');
INSERT INTO `task`
VALUES (456, 'xiaofuge', 'bigmarket.award_send', '24104942539',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"24104942539\",\"timestamp\":\"2024-04-16 21:10:13.239\"}',
        'complete', '2024-04-16 21:10:13', '2024-04-16 21:10:13');
INSERT INTO `task`
VALUES (457, 'xiaofuge', 'bigmarket.award_send', '13835736083',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"13835736083\",\"timestamp\":\"2024-04-16 21:10:13.764\"}',
        'complete', '2024-04-16 21:10:13', '2024-04-16 21:10:13');
INSERT INTO `task`
VALUES (458, 'xiaofuge', 'bigmarket.award_send', '24723889252',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"24723889252\",\"timestamp\":\"2024-04-16 21:10:14.33\"}',
        'complete', '2024-04-16 21:10:14', '2024-04-16 21:10:14');
INSERT INTO `task`
VALUES (459, 'xiaofuge', 'bigmarket.award_send', '77247264598',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"77247264598\",\"timestamp\":\"2024-04-16 21:10:14.783\"}',
        'complete', '2024-04-16 21:10:14', '2024-04-16 21:10:14');
INSERT INTO `task`
VALUES (460, 'xiaofuge', 'bigmarket.award_send', '76165446501',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"76165446501\",\"timestamp\":\"2024-04-16 21:10:15.195\"}',
        'complete', '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `task`
VALUES (461, 'xiaofuge', 'bigmarket.award_send', '34550834554',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"34550834554\",\"timestamp\":\"2024-04-16 21:10:15.572\"}',
        'complete', '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `task`
VALUES (462, 'xiaofuge', 'bigmarket.award_send', '30888785074',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"30888785074\",\"timestamp\":\"2024-04-16 21:10:15.978\"}',
        'complete', '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `task`
VALUES (463, 'xiaofuge', 'bigmarket.award_send', '86125297514',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"86125297514\",\"timestamp\":\"2024-04-16 21:10:16.415\"}',
        'complete', '2024-04-16 21:10:16', '2024-04-16 21:10:16');
INSERT INTO `task`
VALUES (464, 'xiaofuge', 'bigmarket.award_send', '32236092620',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"32236092620\",\"timestamp\":\"2024-04-16 21:10:16.762\"}',
        'complete', '2024-04-16 21:10:16', '2024-04-16 21:10:16');
INSERT INTO `task`
VALUES (465, 'xiaofuge', 'bigmarket.award_send', '14933356747',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"14933356747\",\"timestamp\":\"2024-04-16 21:14:15.039\"}',
        'complete', '2024-04-16 21:14:15', '2024-04-16 21:14:15');
INSERT INTO `task`
VALUES (466, 'xiaofuge', 'bigmarket.award_send', '16474935273',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"16474935273\",\"timestamp\":\"2024-04-16 21:14:31.384\"}',
        'complete', '2024-04-16 21:14:31', '2024-04-16 21:14:31');
INSERT INTO `task`
VALUES (467, 'xiaofuge', 'bigmarket.award_send', '69103381880',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"69103381880\",\"timestamp\":\"2024-04-16 21:16:47.098\"}',
        'complete', '2024-04-16 21:16:47', '2024-04-16 21:16:47');
INSERT INTO `task`
VALUES (468, 'xiaofuge', 'bigmarket.award_send', '92131333818',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"92131333818\",\"timestamp\":\"2024-04-24 19:38:30.815\"}',
        'complete', '2024-04-24 19:38:30', '2024-04-24 19:38:30');
INSERT INTO `task`
VALUES (469, 'xiaofuge', 'bigmarket.award_send', '20176704236',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"20176704236\",\"timestamp\":\"2024-04-24 19:38:34.509\"}',
        'complete', '2024-04-24 19:38:34', '2024-04-24 19:38:34');
INSERT INTO `task`
VALUES (470, 'xiaofuge', 'bigmarket.award_send', '68607364159',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"68607364159\",\"timestamp\":\"2024-04-24 19:38:35.264\"}',
        'complete', '2024-04-24 19:38:35', '2024-04-24 19:38:35');
INSERT INTO `task`
VALUES (471, 'xiaofuge', 'bigmarket.award_send', '47824076305',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"47824076305\",\"timestamp\":\"2024-04-24 19:38:36.121\"}',
        'complete', '2024-04-24 19:38:36', '2024-04-24 19:38:36');
INSERT INTO `task`
VALUES (472, 'xiaofuge', 'bigmarket.award_send', '04963226642',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"04963226642\",\"timestamp\":\"2024-04-24 19:38:36.725\"}',
        'complete', '2024-04-24 19:38:36', '2024-04-24 19:38:36');
INSERT INTO `task`
VALUES (473, 'xiaofuge', 'bigmarket.award_send', '30099557688',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"30099557688\",\"timestamp\":\"2024-04-24 19:38:37.373\"}',
        'complete', '2024-04-24 19:38:37', '2024-04-24 19:38:37');
INSERT INTO `task`
VALUES (474, 'xiaofuge', 'bigmarket.award_send', '73873613964',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"73873613964\",\"timestamp\":\"2024-04-24 19:46:46.513\"}',
        'complete', '2024-04-24 19:46:46', '2024-04-24 19:46:46');
INSERT INTO `task`
VALUES (475, 'xiaofuge', 'bigmarket.award_send', '60894037901',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"60894037901\",\"timestamp\":\"2024-04-24 19:47:14.705\"}',
        'complete', '2024-04-24 19:47:14', '2024-04-24 19:47:14');
INSERT INTO `task`
VALUES (476, 'xiaofuge', 'bigmarket.award_send', '52589252238',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"52589252238\",\"timestamp\":\"2024-04-24 19:47:15.344\"}',
        'complete', '2024-04-24 19:47:15', '2024-04-24 19:47:15');
INSERT INTO `task`
VALUES (477, 'xiaofuge', 'bigmarket.award_send', '73586135969',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"73586135969\",\"timestamp\":\"2024-04-24 19:47:15.902\"}',
        'complete', '2024-04-24 19:47:15', '2024-04-24 19:47:15');
INSERT INTO `task`
VALUES (478, 'xiaofuge', 'bigmarket.award_send', '46057038911',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"46057038911\",\"timestamp\":\"2024-04-24 19:47:16.416\"}',
        'complete', '2024-04-24 19:47:16', '2024-04-24 19:47:16');
INSERT INTO `task`
VALUES (479, 'xiaofuge', 'bigmarket.award_send', '06917392820',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"06917392820\",\"timestamp\":\"2024-04-24 19:47:16.856\"}',
        'complete', '2024-04-24 19:47:16', '2024-04-24 19:47:16');
INSERT INTO `task`
VALUES (480, 'xiaofuge', 'bigmarket.award_send', '24836287334',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"24836287334\",\"timestamp\":\"2024-04-24 19:50:52.104\"}',
        'complete', '2024-04-24 19:50:52', '2024-04-24 19:50:52');
INSERT INTO `task`
VALUES (481, 'xiaofuge', 'bigmarket.award_send', '86791275417',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"86791275417\",\"timestamp\":\"2024-04-24 19:50:52.895\"}',
        'complete', '2024-04-24 19:50:52', '2024-04-24 19:50:52');
INSERT INTO `task`
VALUES (482, 'xiaofuge', 'bigmarket.award_send', '73396804149',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"73396804149\",\"timestamp\":\"2024-04-24 19:50:53.626\"}',
        'complete', '2024-04-24 19:50:53', '2024-04-24 19:50:53');
INSERT INTO `task`
VALUES (483, 'xiaofuge', 'bigmarket.award_send', '20312258249',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"20312258249\",\"timestamp\":\"2024-04-24 19:50:54.344\"}',
        'complete', '2024-04-24 19:50:54', '2024-04-24 19:50:54');
INSERT INTO `task`
VALUES (484, 'xiaofuge', 'bigmarket.award_send', '11625612755',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"11625612755\",\"timestamp\":\"2024-04-24 19:50:55.042\"}',
        'complete', '2024-04-24 19:50:55', '2024-04-24 19:50:55');
INSERT INTO `task`
VALUES (485, 'xiaofuge', 'bigmarket.award_send', '19376930303',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"19376930303\",\"timestamp\":\"2024-04-24 19:50:55.661\"}',
        'complete', '2024-04-24 19:50:55', '2024-04-24 19:50:55');
INSERT INTO `task`
VALUES (486, 'xiaofuge', 'bigmarket.award_send', '10333661562',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"10333661562\",\"timestamp\":\"2024-04-24 19:50:56.334\"}',
        'complete', '2024-04-24 19:50:56', '2024-04-24 19:50:56');
INSERT INTO `task`
VALUES (487, 'xiaofuge', 'bigmarket.award_send', '68720269124',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"68720269124\",\"timestamp\":\"2024-04-24 19:50:56.921\"}',
        'complete', '2024-04-24 19:50:56', '2024-04-24 19:50:56');
INSERT INTO `task`
VALUES (488, 'xiaofuge', 'bigmarket.award_send', '81519325522',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"81519325522\",\"timestamp\":\"2024-04-24 19:50:57.568\"}',
        'complete', '2024-04-24 19:50:57', '2024-04-24 19:50:57');
INSERT INTO `task`
VALUES (489, 'xiaofuge', 'bigmarket.award_send', '35734197404',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"35734197404\",\"timestamp\":\"2024-04-24 19:50:58.282\"}',
        'complete', '2024-04-24 19:50:58', '2024-04-24 19:50:58');
INSERT INTO `task`
VALUES (490, 'xiaofuge', 'bigmarket.award_send', '44870995860',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"44870995860\",\"timestamp\":\"2024-04-24 19:50:58.891\"}',
        'complete', '2024-04-24 19:50:58', '2024-04-24 19:50:58');
INSERT INTO `task`
VALUES (491, 'xiaofuge', 'bigmarket.award_send', '71393786167',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"71393786167\",\"timestamp\":\"2024-04-24 19:51:00.139\"}',
        'complete', '2024-04-24 19:51:00', '2024-04-24 19:51:00');
INSERT INTO `task`
VALUES (492, 'xiaofuge', 'bigmarket.award_send', '88853158162',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"88853158162\",\"timestamp\":\"2024-04-24 19:51:01.031\"}',
        'complete', '2024-04-24 19:51:01', '2024-04-24 19:51:01');
INSERT INTO `task`
VALUES (493, 'xiaofuge', 'bigmarket.award_send', '59274467522',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"59274467522\",\"timestamp\":\"2024-04-24 19:51:02.197\"}',
        'complete', '2024-04-24 19:51:02', '2024-04-24 19:51:02');
INSERT INTO `task`
VALUES (494, 'xiaofuge', 'bigmarket.award_send', '52802626635',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"52802626635\",\"timestamp\":\"2024-04-24 19:51:54.439\"}',
        'complete', '2024-04-24 19:51:54', '2024-04-24 19:51:54');
INSERT INTO `task`
VALUES (495, 'xiaofuge', 'bigmarket.award_send', '57100778650',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"57100778650\",\"timestamp\":\"2024-04-24 19:51:55.188\"}',
        'complete', '2024-04-24 19:51:55', '2024-04-24 19:51:55');
INSERT INTO `task`
VALUES (496, 'xiaofuge', 'bigmarket.award_send', '06994157258',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"06994157258\",\"timestamp\":\"2024-04-24 19:51:55.833\"}',
        'complete', '2024-04-24 19:51:55', '2024-04-24 19:51:55');
INSERT INTO `task`
VALUES (497, 'xiaofuge', 'bigmarket.award_send', '94206220571',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"94206220571\",\"timestamp\":\"2024-04-24 19:51:56.59\"}',
        'complete', '2024-04-24 19:51:56', '2024-04-24 19:51:56');
INSERT INTO `task`
VALUES (498, 'xiaofuge', 'bigmarket.award_send', '33489030876',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"33489030876\",\"timestamp\":\"2024-04-26 21:27:35.112\"}',
        'complete', '2024-04-26 21:27:35', '2024-04-26 21:27:35');
INSERT INTO `task`
VALUES (499, 'xiaofuge', 'bigmarket.award_send', '44902632314',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"44902632314\",\"timestamp\":\"2024-04-26 21:32:24.301\"}',
        'complete', '2024-04-26 21:32:24', '2024-04-26 21:32:24');
INSERT INTO `task`
VALUES (500, 'xiaofuge', 'bigmarket.award_send', '91059153325',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"91059153325\",\"timestamp\":\"2024-04-26 21:32:25.565\"}',
        'complete', '2024-04-26 21:32:25', '2024-04-26 21:32:25');
INSERT INTO `task`
VALUES (501, 'xiaofuge', 'bigmarket.award_send', '20785392728',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"20785392728\",\"timestamp\":\"2024-04-26 21:32:26.572\"}',
        'complete', '2024-04-26 21:32:26', '2024-04-26 21:32:26');
INSERT INTO `task`
VALUES (502, 'xiaofuge', 'bigmarket.award_send', '31200913864',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"31200913864\",\"timestamp\":\"2024-04-26 21:32:27.477\"}',
        'complete', '2024-04-26 21:32:27', '2024-04-26 21:32:27');
INSERT INTO `task`
VALUES (503, 'xiaofuge', 'bigmarket.award_send', '97823620218',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"97823620218\",\"timestamp\":\"2024-04-26 21:32:28.235\"}',
        'complete', '2024-04-26 21:32:28', '2024-04-26 21:32:28');
INSERT INTO `task`
VALUES (504, 'xiaofuge', 'bigmarket.award_send', '51799608467',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"51799608467\",\"timestamp\":\"2024-04-26 21:32:28.968\"}',
        'complete', '2024-04-26 21:32:28', '2024-04-26 21:32:28');
INSERT INTO `task`
VALUES (505, 'xiaofuge', 'bigmarket.award_send', '96509365937',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"96509365937\",\"timestamp\":\"2024-04-26 21:32:29.716\"}',
        'complete', '2024-04-26 21:32:29', '2024-04-26 21:32:29');
INSERT INTO `task`
VALUES (506, 'xiaofuge', 'bigmarket.award_send', '64097140474',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"64097140474\",\"timestamp\":\"2024-04-26 21:32:30.413\"}',
        'complete', '2024-04-26 21:32:30', '2024-04-26 21:32:30');
INSERT INTO `task`
VALUES (507, 'xiaofuge', 'bigmarket.award_send', '55449866384',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"55449866384\",\"timestamp\":\"2024-04-26 21:32:31.062\"}',
        'complete', '2024-04-26 21:32:31', '2024-04-26 21:32:31');
INSERT INTO `task`
VALUES (508, 'xiaofuge', 'bigmarket.award_send', '03733974566',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"03733974566\",\"timestamp\":\"2024-04-26 21:32:31.729\"}',
        'complete', '2024-04-26 21:32:31', '2024-04-26 21:32:31');
INSERT INTO `task`
VALUES (509, 'xiaofuge', 'bigmarket.award_send', '81790538628',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"81790538628\",\"timestamp\":\"2024-04-26 21:32:39.289\"}',
        'complete', '2024-04-26 21:32:39', '2024-04-26 21:32:39');
INSERT INTO `task`
VALUES (510, 'xiaofuge', 'bigmarket.award_send', '12399562920',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"12399562920\",\"timestamp\":\"2024-04-26 21:32:39.854\"}',
        'complete', '2024-04-26 21:32:39', '2024-04-26 21:32:39');
INSERT INTO `task`
VALUES (511, 'xiaofuge', 'bigmarket.award_send', '71156900368',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"71156900368\",\"timestamp\":\"2024-04-26 21:32:40.412\"}',
        'complete', '2024-04-26 21:32:40', '2024-04-26 21:32:40');
INSERT INTO `task`
VALUES (512, 'xiaofuge', 'bigmarket.award_send', '78728799678',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"78728799678\",\"timestamp\":\"2024-04-26 21:32:42.175\"}',
        'complete', '2024-04-26 21:32:42', '2024-04-26 21:32:42');
INSERT INTO `task`
VALUES (513, 'xiaofuge', 'bigmarket.award_send', '56462459362',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"56462459362\",\"timestamp\":\"2024-04-26 21:32:44.862\"}',
        'complete', '2024-04-26 21:32:44', '2024-04-26 21:32:44');
INSERT INTO `task`
VALUES (514, 'xiaofuge', 'bigmarket.award_send', '51953559666',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"51953559666\",\"timestamp\":\"2024-04-26 21:32:46.539\"}',
        'complete', '2024-04-26 21:32:46', '2024-04-26 21:32:46');
INSERT INTO `task`
VALUES (515, 'xiaofuge', 'bigmarket.award_send', '59947425063',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"59947425063\",\"timestamp\":\"2024-04-26 21:32:47.87\"}',
        'complete', '2024-04-26 21:32:47', '2024-04-26 21:32:47');
INSERT INTO `task`
VALUES (516, 'xiaofuge', 'bigmarket.award_send', '73196015091',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"73196015091\",\"timestamp\":\"2024-04-26 21:32:49.36\"}',
        'complete', '2024-04-26 21:32:49', '2024-04-26 21:32:49');
INSERT INTO `task`
VALUES (517, 'xiaofuge', 'bigmarket.award_send', '80759184798',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"80759184798\",\"timestamp\":\"2024-04-26 21:32:50.642\"}',
        'complete', '2024-04-26 21:32:50', '2024-04-26 21:32:50');
INSERT INTO `task`
VALUES (518, 'xiaofuge', 'bigmarket.award_send', '95334010012',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"95334010012\",\"timestamp\":\"2024-04-26 21:32:51.255\"}',
        'complete', '2024-04-26 21:32:51', '2024-04-26 21:32:51');
INSERT INTO `task`
VALUES (519, 'xiaofuge', 'bigmarket.award_send', '77313293195',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"77313293195\",\"timestamp\":\"2024-04-26 21:32:52.001\"}',
        'complete', '2024-04-26 21:32:52', '2024-04-26 21:32:52');
INSERT INTO `task`
VALUES (520, 'xiaofuge', 'bigmarket.award_send', '32502327732',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"32502327732\",\"timestamp\":\"2024-04-26 21:32:52.557\"}',
        'complete', '2024-04-26 21:32:52', '2024-04-26 21:32:52');
INSERT INTO `task`
VALUES (521, 'xiaofuge', 'bigmarket.award_send', '24616326498',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"24616326498\",\"timestamp\":\"2024-04-26 21:32:53.204\"}',
        'complete', '2024-04-26 21:32:53', '2024-04-26 21:32:53');
INSERT INTO `task`
VALUES (522, 'xiaofuge', 'bigmarket.award_send', '16109710450',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"16109710450\",\"timestamp\":\"2024-04-26 21:32:53.763\"}',
        'complete', '2024-04-26 21:32:53', '2024-04-26 21:32:53');
INSERT INTO `task`
VALUES (523, 'xiaofuge', 'bigmarket.award_send', '20270139922',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"20270139922\",\"timestamp\":\"2024-04-26 21:32:54.352\"}',
        'complete', '2024-04-26 21:32:54', '2024-04-26 21:32:54');
INSERT INTO `task`
VALUES (524, 'xiaofuge', 'bigmarket.award_send', '42133398203',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"42133398203\",\"timestamp\":\"2024-04-26 21:32:54.939\"}',
        'complete', '2024-04-26 21:32:54', '2024-04-26 21:32:54');
INSERT INTO `task`
VALUES (525, 'xiaofuge', 'bigmarket.award_send', '06768738970',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"06768738970\",\"timestamp\":\"2024-04-26 21:32:55.497\"}',
        'complete', '2024-04-26 21:32:55', '2024-04-26 21:32:55');
INSERT INTO `task`
VALUES (526, 'xiaofuge', 'bigmarket.award_send', '41043720239',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"41043720239\",\"timestamp\":\"2024-04-26 21:32:56.107\"}',
        'complete', '2024-04-26 21:32:56', '2024-04-26 21:32:56');
INSERT INTO `task`
VALUES (527, 'xiaofuge', 'bigmarket.award_send', '88906604347',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"88906604347\",\"timestamp\":\"2024-04-26 21:32:56.785\"}',
        'complete', '2024-04-26 21:32:56', '2024-04-26 21:32:56');
INSERT INTO `task`
VALUES (528, 'xiaofuge', 'bigmarket.award_send', '43260479248',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"43260479248\",\"timestamp\":\"2024-04-27 16:55:20.783\"}',
        'complete', '2024-04-27 16:55:20', '2024-04-27 16:55:20');
INSERT INTO `task`
VALUES (529, 'xiaofuge', 'bigmarket.award_send', '24699613481',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"24699613481\",\"timestamp\":\"2024-04-27 16:55:21.957\"}',
        'complete', '2024-04-27 16:55:21', '2024-04-27 16:55:21');
INSERT INTO `task`
VALUES (530, 'xiaofuge', 'bigmarket.award_send', '39704383703',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39704383703\",\"timestamp\":\"2024-04-27 16:55:22.675\"}',
        'complete', '2024-04-27 16:55:22', '2024-04-27 16:55:22');
INSERT INTO `task`
VALUES (531, 'xiaofuge', 'bigmarket.award_send', '86692671045',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"86692671045\",\"timestamp\":\"2024-04-27 16:55:23.267\"}',
        'complete', '2024-04-27 16:55:23', '2024-04-27 16:55:23');
INSERT INTO `task`
VALUES (532, 'xiaofuge', 'bigmarket.award_send', '76374322899',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"76374322899\",\"timestamp\":\"2024-04-27 17:06:21.233\"}',
        'complete', '2024-04-27 17:06:21', '2024-04-27 17:06:21');
INSERT INTO `task`
VALUES (533, 'xiaofuge', 'bigmarket.award_send', '81044778769',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"81044778769\",\"timestamp\":\"2024-04-27 17:12:20.706\"}',
        'complete', '2024-04-27 17:12:20', '2024-04-27 17:12:20');
INSERT INTO `task`
VALUES (534, 'xiaofuge', 'bigmarket.award_send', '39357607622',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39357607622\",\"timestamp\":\"2024-04-27 17:12:28.716\"}',
        'complete', '2024-04-27 17:12:28', '2024-04-27 17:12:28');
INSERT INTO `task`
VALUES (535, 'xiaofuge', 'bigmarket.award_send', '09180562166',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"09180562166\",\"timestamp\":\"2024-04-27 17:36:37.509\"}',
        'complete', '2024-04-27 17:36:37', '2024-04-27 17:36:37');
INSERT INTO `task`
VALUES (536, 'xiaofuge', 'bigmarket.award_send', '50499059566',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"50499059566\",\"timestamp\":\"2024-04-27 17:36:44.492\"}',
        'complete', '2024-04-27 17:36:44', '2024-04-27 17:36:44');
INSERT INTO `task`
VALUES (537, 'xiaofuge', 'bigmarket.award_send', '10239331354',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"10239331354\",\"timestamp\":\"2024-04-27 17:36:53.305\"}',
        'complete', '2024-04-27 17:36:53', '2024-04-27 17:36:53');
INSERT INTO `task`
VALUES (538, 'xiaofuge', 'bigmarket.award_send', '62506756225',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"62506756225\",\"timestamp\":\"2024-04-27 17:37:17.493\"}',
        'complete', '2024-04-27 17:37:17', '2024-04-27 17:37:17');
INSERT INTO `task`
VALUES (539, 'xiaofuge', 'bigmarket.award_send', '45562399755',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"45562399755\",\"timestamp\":\"2024-04-27 17:37:33.647\"}',
        'complete', '2024-04-27 17:37:33', '2024-04-27 17:37:33');
INSERT INTO `task`
VALUES (540, 'xiaofuge', 'bigmarket.award_send', '98117950419',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"98117950419\",\"timestamp\":\"2024-04-27 17:37:39.702\"}',
        'complete', '2024-04-27 17:37:39', '2024-04-27 17:37:39');
INSERT INTO `task`
VALUES (541, 'xiaofuge', 'bigmarket.award_send', '91540088526',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"91540088526\",\"timestamp\":\"2024-04-27 17:37:48.766\"}',
        'complete', '2024-04-27 17:37:48', '2024-04-27 17:37:48');
INSERT INTO `task`
VALUES (542, 'xiaofuge', 'bigmarket.award_send', '26739871833',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"26739871833\",\"timestamp\":\"2024-04-27 17:39:05.791\"}',
        'complete', '2024-04-27 17:39:05', '2024-04-27 17:39:05');
INSERT INTO `task`
VALUES (543, 'xiaofuge', 'bigmarket.award_send', '95738811354',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"95738811354\",\"timestamp\":\"2024-04-27 17:41:10.559\"}',
        'complete', '2024-04-27 17:41:10', '2024-04-27 17:41:10');
INSERT INTO `task`
VALUES (544, 'xiaofuge', 'bigmarket.award_send', '21886053039',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"21886053039\",\"timestamp\":\"2024-04-27 17:41:22.92\"}',
        'complete', '2024-04-27 17:41:22', '2024-04-27 17:41:22');
INSERT INTO `task`
VALUES (545, 'xiaofuge', 'bigmarket.award_send', '95511366880',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"95511366880\",\"timestamp\":\"2024-04-27 17:41:30.238\"}',
        'complete', '2024-04-27 17:41:30', '2024-04-27 17:41:30');
INSERT INTO `task`
VALUES (546, 'xiaofuge', 'bigmarket.award_send', '99014572161',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"99014572161\",\"timestamp\":\"2024-04-27 17:41:36.37\"}',
        'complete', '2024-04-27 17:41:36', '2024-04-27 17:41:36');
INSERT INTO `task`
VALUES (547, 'xiaofuge', 'bigmarket.award_send', '51291402630',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"51291402630\",\"timestamp\":\"2024-04-27 17:42:15.445\"}',
        'complete', '2024-04-27 17:42:15', '2024-04-27 17:42:15');
INSERT INTO `task`
VALUES (548, 'xiaofuge', 'bigmarket.award_send', '32124618256',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"32124618256\",\"timestamp\":\"2024-04-27 17:42:23.113\"}',
        'complete', '2024-04-27 17:42:23', '2024-04-27 17:42:23');
INSERT INTO `task`
VALUES (549, 'xiaofuge', 'bigmarket.award_send', '24241226206',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"24241226206\",\"timestamp\":\"2024-04-27 17:42:31.266\"}',
        'complete', '2024-04-27 17:42:31', '2024-04-27 17:42:31');
INSERT INTO `task`
VALUES (550, 'xiaofuge', 'bigmarket.award_send', '68684032955',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"68684032955\",\"timestamp\":\"2024-04-27 17:42:48.722\"}',
        'complete', '2024-04-27 17:42:48', '2024-04-27 17:42:48');
INSERT INTO `task`
VALUES (551, 'xiaofuge', 'bigmarket.award_send', '89069013168',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"89069013168\",\"timestamp\":\"2024-04-27 17:43:44.169\"}',
        'complete', '2024-04-27 17:43:44', '2024-04-27 17:43:44');
INSERT INTO `task`
VALUES (552, 'xiaofuge', 'bigmarket.award_send', '76915202643',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"76915202643\",\"timestamp\":\"2024-04-27 17:45:21.725\"}',
        'complete', '2024-04-27 17:45:21', '2024-04-27 17:45:21');
INSERT INTO `task`
VALUES (553, 'xiaofuge', 'bigmarket.award_send', '37331423004',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"37331423004\",\"timestamp\":\"2024-04-27 17:45:31.283\"}',
        'complete', '2024-04-27 17:45:31', '2024-04-27 17:45:31');
INSERT INTO `task`
VALUES (554, 'xiaofuge', 'bigmarket.award_send', '39198120401',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39198120401\",\"timestamp\":\"2024-04-27 17:47:41.428\"}',
        'complete', '2024-04-27 17:47:41', '2024-04-27 17:47:41');
INSERT INTO `task`
VALUES (555, 'xiaofuge', 'bigmarket.award_send', '44331897279',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"44331897279\",\"timestamp\":\"2024-04-27 17:50:16.315\"}',
        'complete', '2024-04-27 17:50:16', '2024-04-27 17:50:16');
INSERT INTO `task`
VALUES (556, 'xiaofuge', 'bigmarket.award_send', '51152222058',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"51152222058\",\"timestamp\":\"2024-04-27 17:52:52.902\"}',
        'complete', '2024-04-27 17:52:52', '2024-04-27 17:52:52');
INSERT INTO `task`
VALUES (557, 'xiaofuge', 'bigmarket.award_send', '99423679495',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"99423679495\",\"timestamp\":\"2024-04-27 17:58:02.828\"}',
        'complete', '2024-04-27 17:58:02', '2024-04-27 17:58:02');
INSERT INTO `task`
VALUES (558, 'xiaofuge', 'bigmarket.award_send', '03728823782',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"03728823782\",\"timestamp\":\"2024-04-27 17:58:17.114\"}',
        'complete', '2024-04-27 17:58:17', '2024-04-27 17:58:17');
INSERT INTO `task`
VALUES (559, 'xiaofuge', 'bigmarket.award_send', '66454912068',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"66454912068\",\"timestamp\":\"2024-04-27 18:01:26.368\"}',
        'complete', '2024-04-27 18:01:26', '2024-04-27 18:01:26');
INSERT INTO `task`
VALUES (560, 'xiaofuge', 'bigmarket.award_send', '34857113990',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"34857113990\",\"timestamp\":\"2024-04-27 18:10:19.75\"}',
        'complete', '2024-04-27 18:10:19', '2024-04-27 18:10:19');
INSERT INTO `task`
VALUES (561, 'xiaofuge', 'bigmarket.award_send', '94409766234',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"94409766234\",\"timestamp\":\"2024-04-27 18:47:08.815\"}',
        'complete', '2024-04-27 18:47:08', '2024-04-27 18:47:08');
INSERT INTO `task`
VALUES (562, 'xiaofuge', 'bigmarket.award_send', '83507109777',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"83507109777\",\"timestamp\":\"2024-04-27 18:57:43.161\"}',
        'complete', '2024-04-27 18:57:43', '2024-04-27 18:57:43');
INSERT INTO `task`
VALUES (563, 'xiaofuge', 'bigmarket.award_send', '03932172905',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"03932172905\",\"timestamp\":\"2024-04-27 18:58:18.174\"}',
        'complete', '2024-04-27 18:58:18', '2024-04-27 18:58:18');
INSERT INTO `task`
VALUES (564, 'xiaofuge', 'bigmarket.award_send', '35387087792',
        '{\"data\":{\"awardId\":106,\"awardTitle\":\"3等奖\",\"userId\":\"xiaofuge\"},\"id\":\"35387087792\",\"timestamp\":\"2024-04-27 19:04:22.299\"}',
        'complete', '2024-04-27 19:04:22', '2024-04-27 19:04:22');
INSERT INTO `task`
VALUES (565, 'xiaofuge', 'bigmarket.award_send', '54020049489',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"54020049489\",\"timestamp\":\"2024-04-27 19:04:30.18\"}',
        'complete', '2024-04-27 19:04:30', '2024-04-27 19:04:30');
INSERT INTO `task`
VALUES (566, 'xiaofuge', 'bigmarket.award_send', '39397238571',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39397238571\",\"timestamp\":\"2024-04-27 19:06:40.305\"}',
        'complete', '2024-04-27 19:06:40', '2024-04-27 19:06:40');
INSERT INTO `task`
VALUES (567, 'xiaofuge', 'bigmarket.award_send', '18271074843',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"18271074843\",\"timestamp\":\"2024-04-27 19:08:10.011\"}',
        'complete', '2024-04-27 19:08:10', '2024-04-27 19:08:10');
INSERT INTO `task`
VALUES (568, 'xiaofuge', 'bigmarket.award_send', '49965976959',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"49965976959\",\"timestamp\":\"2024-04-27 19:08:20.526\"}',
        'complete', '2024-04-27 19:08:20', '2024-04-27 19:08:20');
INSERT INTO `task`
VALUES (569, 'xiaofuge', 'bigmarket.award_send', '52368795397',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"52368795397\",\"timestamp\":\"2024-04-27 19:08:24.188\"}',
        'complete', '2024-04-27 19:08:24', '2024-04-27 19:08:24');
INSERT INTO `task`
VALUES (570, 'xiaofuge', 'bigmarket.award_send', '44510624189',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"44510624189\",\"timestamp\":\"2024-04-27 19:09:48.868\"}',
        'complete', '2024-04-27 19:09:48', '2024-04-27 19:09:48');
INSERT INTO `task`
VALUES (571, 'xiaofuge', 'bigmarket.award_send', '38334508182',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"38334508182\",\"timestamp\":\"2024-04-27 19:10:08.827\"}',
        'complete', '2024-04-27 19:10:08', '2024-04-27 19:10:08');
INSERT INTO `task`
VALUES (572, 'xiaofuge', 'bigmarket.award_send', '56344283506',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"56344283506\",\"timestamp\":\"2024-04-27 19:10:13.023\"}',
        'complete', '2024-04-27 19:10:13', '2024-04-27 19:10:13');
INSERT INTO `task`
VALUES (573, 'xiaofuge', 'bigmarket.award_send', '77663039638',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"77663039638\",\"timestamp\":\"2024-04-27 19:10:34.661\"}',
        'complete', '2024-04-27 19:10:34', '2024-04-27 19:10:34');
INSERT INTO `task`
VALUES (574, 'xiaofuge', 'bigmarket.award_send', '39433492619',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"39433492619\",\"timestamp\":\"2024-04-27 19:10:57.186\"}',
        'complete', '2024-04-27 19:10:57', '2024-04-27 19:10:57');
INSERT INTO `task`
VALUES (575, 'xiaofuge', 'bigmarket.award_send', '19515194510',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"19515194510\",\"timestamp\":\"2024-04-27 20:00:31.871\"}',
        'complete', '2024-04-27 20:00:31', '2024-04-27 20:00:31');
INSERT INTO `task`
VALUES (576, 'xiaofuge', 'bigmarket.award_send', '86834683299',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"86834683299\",\"timestamp\":\"2024-04-27 20:00:38.38\"}',
        'complete', '2024-04-27 20:00:38', '2024-04-27 20:00:38');
INSERT INTO `task`
VALUES (577, 'xiaofuge', 'bigmarket.award_send', '03370667524',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"03370667524\",\"timestamp\":\"2024-04-27 20:00:44.741\"}',
        'complete', '2024-04-27 20:00:44', '2024-04-27 20:00:44');
INSERT INTO `task`
VALUES (578, 'xiaofuge', 'bigmarket.award_send', '79082448931',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"79082448931\",\"timestamp\":\"2024-04-27 21:24:05.402\"}',
        'complete', '2024-04-27 21:24:05', '2024-04-27 21:24:05');
INSERT INTO `task`
VALUES (579, 'xiaofuge', 'bigmarket.award_send', '59991637526',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"59991637526\",\"timestamp\":\"2024-04-27 21:24:13.733\"}',
        'complete', '2024-04-27 21:24:13', '2024-04-27 21:24:13');
INSERT INTO `task`
VALUES (580, 'xiaofuge', 'bigmarket.award_send', '74033522693',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"74033522693\",\"timestamp\":\"2024-04-27 21:24:23.171\"}',
        'complete', '2024-04-27 21:24:23', '2024-04-27 21:24:23');
INSERT INTO `task`
VALUES (581, 'xiaofuge', 'bigmarket.award_send', '39964607517',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"39964607517\",\"timestamp\":\"2024-04-27 21:24:49.637\"}',
        'complete', '2024-04-27 21:24:49', '2024-04-27 21:24:49');
INSERT INTO `task`
VALUES (582, 'xiaofuge', 'bigmarket.award_send', '51660623836',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"51660623836\",\"timestamp\":\"2024-04-27 21:50:58.607\"}',
        'complete', '2024-04-27 21:50:58', '2024-04-27 21:50:58');
INSERT INTO `task`
VALUES (583, 'xiaofuge', 'bigmarket.award_send', '40309664649',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"40309664649\",\"timestamp\":\"2024-04-27 21:51:23.39\"}',
        'complete', '2024-04-27 21:51:23', '2024-04-27 21:51:23');
INSERT INTO `task`
VALUES (584, 'xiaofuge', 'bigmarket.award_send', '42566121805',
        '{\"data\":{\"awardId\":107,\"awardTitle\":\"2等奖\",\"userId\":\"xiaofuge\"},\"id\":\"42566121805\",\"timestamp\":\"2024-04-27 21:51:47.927\"}',
        'complete', '2024-04-27 21:51:47', '2024-04-27 21:51:47');
INSERT INTO `task`
VALUES (585, 'xiaofuge', 'bigmarket.award_send', '22267966325',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"22267966325\",\"timestamp\":\"2024-04-28 15:36:57.386\"}',
        'complete', '2024-04-28 15:36:57', '2024-04-28 15:36:57');
INSERT INTO `task`
VALUES (586, 'xiaofuge', 'bigmarket.award_send', '92748890262',
        '{\"data\":{\"awardId\":108,\"awardTitle\":\"1等奖\",\"userId\":\"xiaofuge\"},\"id\":\"92748890262\",\"timestamp\":\"2024-04-28 15:37:04.074\"}',
        'complete', '2024-04-28 15:37:04', '2024-04-28 15:37:04');
INSERT INTO `task`
VALUES (587, 'xiaofuge', 'bigmarket.award_send', '53448624425',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"53448624425\",\"timestamp\":\"2024-04-28 15:37:10.055\"}',
        'complete', '2024-04-28 15:37:10', '2024-04-28 15:37:10');
INSERT INTO `task`
VALUES (588, 'xiaofuge', 'bigmarket.award_send', '67929762550',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"67929762550\",\"timestamp\":\"2024-04-28 19:07:38.107\"}',
        'complete', '2024-04-28 19:07:38', '2024-04-28 19:07:38');
INSERT INTO `task`
VALUES (589, 'xiaofuge', 'bigmarket.award_send', '70965570050',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"70965570050\",\"timestamp\":\"2024-04-28 19:07:43.911\"}',
        'complete', '2024-04-28 19:07:43', '2024-04-28 19:07:43');
INSERT INTO `task`
VALUES (590, 'xiaofuge', 'bigmarket.award_send', '42291760585',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"42291760585\",\"timestamp\":\"2024-04-28 19:08:49.58\"}',
        'complete', '2024-04-28 19:08:49', '2024-04-28 19:08:49');
INSERT INTO `task`
VALUES (591, 'xiaofuge', 'bigmarket.award_send', '63669285153',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"63669285153\",\"timestamp\":\"2024-04-28 19:08:56.664\"}',
        'complete', '2024-04-28 19:08:56', '2024-04-28 19:08:56');
INSERT INTO `task`
VALUES (592, 'xiaofuge', 'bigmarket.award_send', '42309692064',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"42309692064\",\"timestamp\":\"2024-04-28 19:09:02.703\"}',
        'complete', '2024-04-28 19:09:02', '2024-04-28 19:09:02');
INSERT INTO `task`
VALUES (593, 'xiaofuge', 'bigmarket.award_send', '54180458059',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"54180458059\",\"timestamp\":\"2024-04-28 19:18:42.964\"}',
        'complete', '2024-04-28 19:18:42', '2024-04-28 19:18:42');
INSERT INTO `task`
VALUES (594, 'xiaofuge', 'bigmarket.award_send', '47122941920',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"47122941920\",\"timestamp\":\"2024-04-28 19:19:14.375\"}',
        'complete', '2024-04-28 19:19:14', '2024-04-28 19:19:14');
INSERT INTO `task`
VALUES (595, 'xiaofuge', 'bigmarket.award_send', '66952752603',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"66952752603\",\"timestamp\":\"2024-04-28 19:19:21.986\"}',
        'complete', '2024-04-28 19:19:21', '2024-04-28 19:19:21');
INSERT INTO `task`
VALUES (596, 'xiaofuge', 'bigmarket.award_send', '19414017891',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"19414017891\",\"timestamp\":\"2024-04-28 19:19:27.801\"}',
        'complete', '2024-04-28 19:19:27', '2024-04-28 19:19:27');
INSERT INTO `task`
VALUES (597, 'xiaofuge', 'bigmarket.award_send', '04026073594',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"04026073594\",\"timestamp\":\"2024-04-28 19:19:33.317\"}',
        'complete', '2024-04-28 19:19:33', '2024-04-28 19:19:33');
INSERT INTO `task`
VALUES (598, 'xiaofuge', 'bigmarket.award_send', '15580989127',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"15580989127\",\"timestamp\":\"2024-04-28 19:19:38.87\"}',
        'complete', '2024-04-28 19:19:38', '2024-04-28 19:19:38');
INSERT INTO `task`
VALUES (599, 'xiaofuge', 'bigmarket.award_send', '98453644136',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"98453644136\",\"timestamp\":\"2024-04-28 19:19:44.463\"}',
        'complete', '2024-04-28 19:19:44', '2024-04-28 19:19:44');
INSERT INTO `task`
VALUES (600, 'xiaofuge', 'bigmarket.award_send', '66952248294',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"66952248294\",\"timestamp\":\"2024-04-28 19:28:15.347\"}',
        'complete', '2024-04-28 19:28:15', '2024-04-28 19:28:15');
INSERT INTO `task`
VALUES (601, 'xiaofuge', 'bigmarket.award_send', '96806875983',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"96806875983\",\"timestamp\":\"2024-04-28 19:39:04.795\"}',
        'complete', '2024-04-28 19:39:04', '2024-04-28 19:39:04');
INSERT INTO `task`
VALUES (602, 'xiaofuge', 'bigmarket.award_send', '15853809833',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"15853809833\",\"timestamp\":\"2024-04-28 19:39:10.732\"}',
        'complete', '2024-04-28 19:39:10', '2024-04-28 19:39:10');
INSERT INTO `task`
VALUES (603, 'xiaofuge', 'bigmarket.award_send', '99667587980',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"99667587980\",\"timestamp\":\"2024-04-28 19:39:17.174\"}',
        'complete', '2024-04-28 19:39:17', '2024-04-28 19:39:17');
INSERT INTO `task`
VALUES (604, 'xiaofuge', 'bigmarket.award_send', '69864971156',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"69864971156\",\"timestamp\":\"2024-04-28 19:39:23.082\"}',
        'complete', '2024-04-28 19:39:23', '2024-04-28 19:39:23');
INSERT INTO `task`
VALUES (605, 'xiaofuge', 'bigmarket.award_send', '42658436048',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"42658436048\",\"timestamp\":\"2024-04-28 19:39:29.046\"}',
        'complete', '2024-04-28 19:39:29', '2024-04-28 19:39:29');
INSERT INTO `task`
VALUES (606, 'xiaofuge', 'bigmarket.award_send', '24791581665',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"24791581665\",\"timestamp\":\"2024-04-28 19:39:40.712\"}',
        'complete', '2024-04-28 19:39:40', '2024-04-28 19:39:40');
INSERT INTO `task`
VALUES (607, 'xiaofuge', 'bigmarket.award_send', '10754921267',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"10754921267\",\"timestamp\":\"2024-04-28 19:42:06.769\"}',
        'complete', '2024-04-28 19:42:06', '2024-04-28 19:42:06');
INSERT INTO `task`
VALUES (608, 'xiaofuge', 'bigmarket.award_send', '10278636628',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"10278636628\",\"timestamp\":\"2024-04-28 19:42:37.536\"}',
        'complete', '2024-04-28 19:42:37', '2024-04-28 19:42:37');
INSERT INTO `task`
VALUES (609, 'xiaofuge', 'bigmarket.award_send', '93470049498',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"93470049498\",\"timestamp\":\"2024-04-28 19:42:46.297\"}',
        'complete', '2024-04-28 19:42:46', '2024-04-28 19:42:46');
INSERT INTO `task`
VALUES (610, 'xiaofuge', 'bigmarket.award_send', '52655666906',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"52655666906\",\"timestamp\":\"2024-04-28 19:42:53.064\"}',
        'complete', '2024-04-28 19:42:53', '2024-04-28 19:42:53');
INSERT INTO `task`
VALUES (611, 'xiaofuge', 'bigmarket.award_send', '18937266796',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"18937266796\",\"timestamp\":\"2024-04-28 19:42:59.142\"}',
        'complete', '2024-04-28 19:42:59', '2024-04-28 19:42:59');
INSERT INTO `task`
VALUES (612, 'xiaofuge', 'bigmarket.award_send', '39751211073',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"39751211073\",\"timestamp\":\"2024-04-28 19:43:05.407\"}',
        'complete', '2024-04-28 19:43:05', '2024-04-28 19:43:05');
INSERT INTO `task`
VALUES (613, 'xiaofuge', 'bigmarket.award_send', '27674750357',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"27674750357\",\"timestamp\":\"2024-04-28 19:43:15.534\"}',
        'complete', '2024-04-28 19:43:15', '2024-04-28 19:43:15');
INSERT INTO `task`
VALUES (614, 'xiaofuge', 'bigmarket.award_send', '30040195131',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"30040195131\",\"timestamp\":\"2024-04-28 19:43:22.171\"}',
        'complete', '2024-04-28 19:43:22', '2024-04-28 19:43:22');
INSERT INTO `task`
VALUES (615, 'xiaofuge', 'bigmarket.award_send', '89192709671',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"89192709671\",\"timestamp\":\"2024-04-28 19:44:12.009\"}',
        'complete', '2024-04-28 19:44:12', '2024-04-28 19:44:12');
INSERT INTO `task`
VALUES (616, 'xiaofuge', 'bigmarket.award_send', '41721821159',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"41721821159\",\"timestamp\":\"2024-04-28 19:44:19.717\"}',
        'complete', '2024-04-28 19:44:19', '2024-04-28 19:44:19');
INSERT INTO `task`
VALUES (617, 'xiaofuge', 'bigmarket.award_send', '44755618995',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"44755618995\",\"timestamp\":\"2024-04-28 19:44:26.597\"}',
        'complete', '2024-04-28 19:44:26', '2024-04-28 19:44:26');
INSERT INTO `task`
VALUES (618, 'xiaofuge', 'bigmarket.award_send', '04979546626',
        '{\"data\":{\"awardId\":102,\"awardTitle\":\"7等奖\",\"userId\":\"xiaofuge\"},\"id\":\"04979546626\",\"timestamp\":\"2024-04-28 19:44:33.82\"}',
        'complete', '2024-04-28 19:44:33', '2024-04-28 19:44:33');
INSERT INTO `task`
VALUES (619, 'xiaofuge', 'bigmarket.award_send', '35016868552',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"35016868552\",\"timestamp\":\"2024-04-28 19:44:52.704\"}',
        'complete', '2024-04-28 19:44:52', '2024-04-28 19:44:52');
INSERT INTO `task`
VALUES (620, 'xiaofuge', 'bigmarket.award_send', '49008847355',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"49008847355\",\"timestamp\":\"2024-04-28 19:46:02.954\"}',
        'complete', '2024-04-28 19:46:02', '2024-04-28 19:46:02');
INSERT INTO `task`
VALUES (621, 'xiaofuge', 'bigmarket.award_send', '90782508641',
        '{\"data\":{\"awardId\":105,\"awardTitle\":\"4等奖\",\"userId\":\"xiaofuge\"},\"id\":\"90782508641\",\"timestamp\":\"2024-04-28 19:46:09.25\"}',
        'complete', '2024-04-28 19:46:09', '2024-04-28 19:46:09');
INSERT INTO `task`
VALUES (622, 'xiaofuge', 'bigmarket.award_send', '10378808508',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"10378808508\",\"timestamp\":\"2024-04-28 19:46:15.283\"}',
        'complete', '2024-04-28 19:46:15', '2024-04-28 19:46:15');
INSERT INTO `task`
VALUES (623, 'xiaofuge', 'bigmarket.award_send', '60634795460',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"60634795460\",\"timestamp\":\"2024-04-28 20:07:09.743\"}',
        'complete', '2024-04-28 20:07:09', '2024-04-28 20:07:09');
INSERT INTO `task`
VALUES (624, 'xiaofuge', 'bigmarket.award_send', '83727069842',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"83727069842\",\"timestamp\":\"2024-04-28 20:21:30.638\"}',
        'complete', '2024-04-28 20:21:30', '2024-04-28 20:21:30');
INSERT INTO `task`
VALUES (625, 'xiaofuge', 'bigmarket.award_send', '76386404964',
        '{\"data\":{\"awardId\":104,\"awardTitle\":\"5等奖\",\"userId\":\"xiaofuge\"},\"id\":\"76386404964\",\"timestamp\":\"2024-04-28 20:22:58.528\"}',
        'complete', '2024-04-28 20:22:58', '2024-04-28 20:22:58');
INSERT INTO `task`
VALUES (626, 'xiaofuge', 'bigmarket.award_send', '36175822342',
        '{\"data\":{\"awardId\":101,\"awardTitle\":\"随机积分\",\"userId\":\"xiaofuge\"},\"id\":\"36175822342\",\"timestamp\":\"2024-04-28 21:28:07.267\"}',
        'complete', '2024-04-28 21:28:07', '2024-04-28 21:28:07');
INSERT INTO `task`
VALUES (627, 'xiaofuge', 'bigmarket.award_send', '27124065497',
        '{\"data\":{\"awardId\":103,\"awardTitle\":\"6等奖\",\"userId\":\"xiaofuge\"},\"id\":\"27124065497\",\"timestamp\":\"2024-04-28 21:28:43.936\"}',
        'complete', '2024-04-28 21:28:43', '2024-04-28 21:28:43');

-- ----------------------------
-- Table structure for user_award_record_000
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_000`;
CREATE TABLE `user_award_record_000`
(
    `id`          int UNSIGNED                                                  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `activity_id` bigint                                                        NOT NULL COMMENT '活动ID',
    `strategy_id` bigint                                                        NOT NULL COMMENT '抽奖策略ID',
    `order_id`    varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
    `award_id`    int                                                           NOT NULL COMMENT '奖品ID',
    `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
    `award_time`  datetime                                                      NOT NULL COMMENT '中奖时间',
    `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
    `create_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id` (`user_id` ASC) USING BTREE,
    INDEX `idx_activity_id` (`activity_id` ASC) USING BTREE,
    INDEX `idx_award_id` (`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_001
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_001`;
CREATE TABLE `user_award_record_001`
(
    `id`          int UNSIGNED                                                  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `activity_id` bigint                                                        NOT NULL COMMENT '活动ID',
    `strategy_id` bigint                                                        NOT NULL COMMENT '抽奖策略ID',
    `order_id`    varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
    `award_id`    int                                                           NOT NULL COMMENT '奖品ID',
    `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
    `award_time`  datetime                                                      NOT NULL COMMENT '中奖时间',
    `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
    `create_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id` (`user_id` ASC) USING BTREE,
    INDEX `idx_activity_id` (`activity_id` ASC) USING BTREE,
    INDEX `idx_award_id` (`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 599
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_001
-- ----------------------------
INSERT INTO `user_award_record_001`
VALUES (3, 'xiaofuge', 100301, 100006, '313091076459', 101, 'OpenAI 增加使用次数', '2024-04-06 03:47:54', 'create',
        '2024-04-06 11:47:54', '2024-04-06 11:47:54');
INSERT INTO `user_award_record_001`
VALUES (6, 'xiaofuge', 100301, 100006, '658772889112', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:50', 'create',
        '2024-04-06 12:16:50', '2024-04-06 12:16:50');
INSERT INTO `user_award_record_001`
VALUES (7, 'xiaofuge', 100301, 100006, '623291703218', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:51', 'create',
        '2024-04-06 12:16:50', '2024-04-06 12:16:50');
INSERT INTO `user_award_record_001`
VALUES (8, 'xiaofuge', 100301, 100006, '619841045154', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:51', 'create',
        '2024-04-06 12:16:51', '2024-04-06 12:16:51');
INSERT INTO `user_award_record_001`
VALUES (9, 'xiaofuge', 100301, 100006, '696947604604', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:52', 'create',
        '2024-04-06 12:16:51', '2024-04-06 12:16:51');
INSERT INTO `user_award_record_001`
VALUES (10, 'xiaofuge', 100301, 100006, '239997053403', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:52', 'create',
        '2024-04-06 12:16:52', '2024-04-06 12:16:52');
INSERT INTO `user_award_record_001`
VALUES (11, 'xiaofuge', 100301, 100006, '837228766840', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:53', 'create',
        '2024-04-06 12:16:52', '2024-04-06 12:16:52');
INSERT INTO `user_award_record_001`
VALUES (12, 'xiaofuge', 100301, 100006, '012609968231', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:53', 'create',
        '2024-04-06 12:16:53', '2024-04-06 12:16:53');
INSERT INTO `user_award_record_001`
VALUES (13, 'xiaofuge', 100301, 100006, '540056227059', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:54', 'create',
        '2024-04-06 12:16:54', '2024-04-06 12:16:54');
INSERT INTO `user_award_record_001`
VALUES (14, 'xiaofuge', 100301, 100006, '757384073568', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:55', 'create',
        '2024-04-06 12:16:54', '2024-04-06 12:16:54');
INSERT INTO `user_award_record_001`
VALUES (15, 'xiaofuge', 100301, 100006, '270533634609', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:55', 'create',
        '2024-04-06 12:16:55', '2024-04-06 12:16:55');
INSERT INTO `user_award_record_001`
VALUES (16, 'xiaofuge', 100301, 100006, '143517041178', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:56', 'create',
        '2024-04-06 12:16:55', '2024-04-06 12:16:55');
INSERT INTO `user_award_record_001`
VALUES (17, 'xiaofuge', 100301, 100006, '880610933571', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:56', 'create',
        '2024-04-06 12:16:56', '2024-04-06 12:16:56');
INSERT INTO `user_award_record_001`
VALUES (18, 'xiaofuge', 100301, 100006, '288939138548', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:57', 'create',
        '2024-04-06 12:16:56', '2024-04-06 12:16:56');
INSERT INTO `user_award_record_001`
VALUES (19, 'xiaofuge', 100301, 100006, '401825045013', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:57', 'create',
        '2024-04-06 12:16:57', '2024-04-06 12:16:57');
INSERT INTO `user_award_record_001`
VALUES (20, 'xiaofuge', 100301, 100006, '644483213191', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:58', 'create',
        '2024-04-06 12:16:57', '2024-04-06 12:16:57');
INSERT INTO `user_award_record_001`
VALUES (21, 'xiaofuge', 100301, 100006, '126942948062', 101, 'OpenAI 增加使用次数', '2024-04-06 04:16:58', 'create',
        '2024-04-06 12:16:58', '2024-04-06 12:16:58');
INSERT INTO `user_award_record_001`
VALUES (22, 'xiaofuge', 100301, 100006, '388415276639', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:38', 'create',
        '2024-04-06 16:10:38', '2024-04-06 16:10:38');
INSERT INTO `user_award_record_001`
VALUES (23, 'xiaofuge', 100301, 100006, '295404830039', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:39', 'create',
        '2024-04-06 16:10:39', '2024-04-06 16:10:39');
INSERT INTO `user_award_record_001`
VALUES (24, 'xiaofuge', 100301, 100006, '396378174546', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:40', 'create',
        '2024-04-06 16:10:39', '2024-04-06 16:10:39');
INSERT INTO `user_award_record_001`
VALUES (25, 'xiaofuge', 100301, 100006, '216034880115', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:40', 'create',
        '2024-04-06 16:10:40', '2024-04-06 16:10:40');
INSERT INTO `user_award_record_001`
VALUES (26, 'xiaofuge', 100301, 100006, '587083012812', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:41', 'create',
        '2024-04-06 16:10:40', '2024-04-06 16:10:40');
INSERT INTO `user_award_record_001`
VALUES (27, 'xiaofuge', 100301, 100006, '179931564604', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:41', 'create',
        '2024-04-06 16:10:41', '2024-04-06 16:10:41');
INSERT INTO `user_award_record_001`
VALUES (28, 'xiaofuge', 100301, 100006, '266603270575', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:42', 'create',
        '2024-04-06 16:10:41', '2024-04-06 16:10:41');
INSERT INTO `user_award_record_001`
VALUES (29, 'xiaofuge', 100301, 100006, '708306230375', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:42', 'create',
        '2024-04-06 16:10:42', '2024-04-06 16:10:42');
INSERT INTO `user_award_record_001`
VALUES (30, 'xiaofuge', 100301, 100006, '099363576226', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:43', 'create',
        '2024-04-06 16:10:42', '2024-04-06 16:10:42');
INSERT INTO `user_award_record_001`
VALUES (31, 'xiaofuge', 100301, 100006, '330354920093', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:43', 'create',
        '2024-04-06 16:10:43', '2024-04-06 16:10:43');
INSERT INTO `user_award_record_001`
VALUES (32, 'xiaofuge', 100301, 100006, '824752758415', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:44', 'create',
        '2024-04-06 16:10:43', '2024-04-06 16:10:43');
INSERT INTO `user_award_record_001`
VALUES (33, 'xiaofuge', 100301, 100006, '064058506146', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:44', 'create',
        '2024-04-06 16:10:44', '2024-04-06 16:10:44');
INSERT INTO `user_award_record_001`
VALUES (34, 'xiaofuge', 100301, 100006, '923475474250', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:45', 'create',
        '2024-04-06 16:10:44', '2024-04-06 16:10:44');
INSERT INTO `user_award_record_001`
VALUES (35, 'xiaofuge', 100301, 100006, '565064446034', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:45', 'create',
        '2024-04-06 16:10:45', '2024-04-06 16:10:45');
INSERT INTO `user_award_record_001`
VALUES (36, 'xiaofuge', 100301, 100006, '665449773785', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:46', 'create',
        '2024-04-06 16:10:45', '2024-04-06 16:10:45');
INSERT INTO `user_award_record_001`
VALUES (37, 'xiaofuge', 100301, 100006, '099294776536', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:46', 'create',
        '2024-04-06 16:10:46', '2024-04-06 16:10:46');
INSERT INTO `user_award_record_001`
VALUES (38, 'xiaofuge', 100301, 100006, '166766849249', 101, 'OpenAI 增加使用次数', '2024-04-06 08:10:47', 'create',
        '2024-04-06 16:10:47', '2024-04-06 16:10:47');
INSERT INTO `user_award_record_001`
VALUES (41, 'xiaofuge', 100301, 100006, '485492518522', 101, 'OpenAI 增加使用次数', '2024-04-14 12:38:03', 'create',
        '2024-04-14 20:38:03', '2024-04-14 20:38:03');
INSERT INTO `user_award_record_001`
VALUES (42, 'xiaofuge', 100301, 100006, '184157885453', 101, 'OpenAI 增加使用次数', '2024-04-14 12:39:24', 'create',
        '2024-04-14 20:39:24', '2024-04-14 20:39:24');
INSERT INTO `user_award_record_001`
VALUES (43, 'xiaofuge', 100301, 100006, '619198239826', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:30', 'create',
        '2024-04-14 21:18:30', '2024-04-14 21:18:30');
INSERT INTO `user_award_record_001`
VALUES (44, 'xiaofuge', 100301, 100006, '632405264581', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:31', 'create',
        '2024-04-14 21:18:31', '2024-04-14 21:18:31');
INSERT INTO `user_award_record_001`
VALUES (45, 'xiaofuge', 100301, 100006, '500761679882', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:32', 'create',
        '2024-04-14 21:18:31', '2024-04-14 21:18:31');
INSERT INTO `user_award_record_001`
VALUES (46, 'xiaofuge', 100301, 100006, '287524148047', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:32', 'create',
        '2024-04-14 21:18:32', '2024-04-14 21:18:32');
INSERT INTO `user_award_record_001`
VALUES (47, 'xiaofuge', 100301, 100006, '037587180011', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:33', 'create',
        '2024-04-14 21:18:32', '2024-04-14 21:18:32');
INSERT INTO `user_award_record_001`
VALUES (48, 'xiaofuge', 100301, 100006, '690675900513', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:33', 'create',
        '2024-04-14 21:18:33', '2024-04-14 21:18:33');
INSERT INTO `user_award_record_001`
VALUES (49, 'xiaofuge', 100301, 100006, '674545388356', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:34', 'create',
        '2024-04-14 21:18:33', '2024-04-14 21:18:33');
INSERT INTO `user_award_record_001`
VALUES (50, 'xiaofuge', 100301, 100006, '188709460303', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:34', 'create',
        '2024-04-14 21:18:34', '2024-04-14 21:18:34');
INSERT INTO `user_award_record_001`
VALUES (51, 'xiaofuge', 100301, 100006, '661864273492', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:35', 'create',
        '2024-04-14 21:18:34', '2024-04-14 21:18:34');
INSERT INTO `user_award_record_001`
VALUES (52, 'xiaofuge', 100301, 100006, '396544642827', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:35', 'create',
        '2024-04-14 21:18:35', '2024-04-14 21:18:35');
INSERT INTO `user_award_record_001`
VALUES (53, 'xiaofuge', 100301, 100006, '558309089807', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:36', 'create',
        '2024-04-14 21:18:35', '2024-04-14 21:18:35');
INSERT INTO `user_award_record_001`
VALUES (54, 'xiaofuge', 100301, 100006, '748901625635', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:36', 'create',
        '2024-04-14 21:18:36', '2024-04-14 21:18:36');
INSERT INTO `user_award_record_001`
VALUES (55, 'xiaofuge', 100301, 100006, '311376539618', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:37', 'create',
        '2024-04-14 21:18:36', '2024-04-14 21:18:36');
INSERT INTO `user_award_record_001`
VALUES (56, 'xiaofuge', 100301, 100006, '759825177750', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:37', 'create',
        '2024-04-14 21:18:37', '2024-04-14 21:18:37');
INSERT INTO `user_award_record_001`
VALUES (57, 'xiaofuge', 100301, 100006, '449412858525', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:38', 'create',
        '2024-04-14 21:18:37', '2024-04-14 21:18:37');
INSERT INTO `user_award_record_001`
VALUES (58, 'xiaofuge', 100301, 100006, '418917441054', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:38', 'create',
        '2024-04-14 21:18:38', '2024-04-14 21:18:38');
INSERT INTO `user_award_record_001`
VALUES (59, 'xiaofuge', 100301, 100006, '458049972073', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:39', 'create',
        '2024-04-14 21:18:38', '2024-04-14 21:18:38');
INSERT INTO `user_award_record_001`
VALUES (60, 'xiaofuge', 100301, 100006, '447025791448', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:39', 'create',
        '2024-04-14 21:18:39', '2024-04-14 21:18:39');
INSERT INTO `user_award_record_001`
VALUES (61, 'xiaofuge', 100301, 100006, '230319669854', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:40', 'create',
        '2024-04-14 21:18:39', '2024-04-14 21:18:39');
INSERT INTO `user_award_record_001`
VALUES (62, 'xiaofuge', 100301, 100006, '787864811025', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:40', 'create',
        '2024-04-14 21:18:40', '2024-04-14 21:18:40');
INSERT INTO `user_award_record_001`
VALUES (63, 'xiaofuge', 100301, 100006, '104649812022', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:41', 'create',
        '2024-04-14 21:18:40', '2024-04-14 21:18:40');
INSERT INTO `user_award_record_001`
VALUES (64, 'xiaofuge', 100301, 100006, '776068322939', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:41', 'create',
        '2024-04-14 21:18:41', '2024-04-14 21:18:41');
INSERT INTO `user_award_record_001`
VALUES (65, 'xiaofuge', 100301, 100006, '298777773469', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:42', 'create',
        '2024-04-14 21:18:41', '2024-04-14 21:18:41');
INSERT INTO `user_award_record_001`
VALUES (66, 'xiaofuge', 100301, 100006, '924260722806', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:42', 'create',
        '2024-04-14 21:18:42', '2024-04-14 21:18:42');
INSERT INTO `user_award_record_001`
VALUES (67, 'xiaofuge', 100301, 100006, '582784462960', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:43', 'create',
        '2024-04-14 21:18:42', '2024-04-14 21:18:42');
INSERT INTO `user_award_record_001`
VALUES (68, 'xiaofuge', 100301, 100006, '636264591602', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:43', 'create',
        '2024-04-14 21:18:43', '2024-04-14 21:18:43');
INSERT INTO `user_award_record_001`
VALUES (69, 'xiaofuge', 100301, 100006, '797102058081', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:44', 'create',
        '2024-04-14 21:18:43', '2024-04-14 21:18:43');
INSERT INTO `user_award_record_001`
VALUES (70, 'xiaofuge', 100301, 100006, '753075806989', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:45', 'create',
        '2024-04-14 21:18:44', '2024-04-14 21:18:44');
INSERT INTO `user_award_record_001`
VALUES (71, 'xiaofuge', 100301, 100006, '295300935267', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:45', 'create',
        '2024-04-14 21:18:45', '2024-04-14 21:18:45');
INSERT INTO `user_award_record_001`
VALUES (72, 'xiaofuge', 100301, 100006, '622305480849', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:46', 'create',
        '2024-04-14 21:18:45', '2024-04-14 21:18:45');
INSERT INTO `user_award_record_001`
VALUES (73, 'xiaofuge', 100301, 100006, '761772050888', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:46', 'create',
        '2024-04-14 21:18:46', '2024-04-14 21:18:46');
INSERT INTO `user_award_record_001`
VALUES (74, 'xiaofuge', 100301, 100006, '964054923428', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:47', 'create',
        '2024-04-14 21:18:46', '2024-04-14 21:18:46');
INSERT INTO `user_award_record_001`
VALUES (75, 'xiaofuge', 100301, 100006, '480099400927', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:47', 'create',
        '2024-04-14 21:18:47', '2024-04-14 21:18:47');
INSERT INTO `user_award_record_001`
VALUES (76, 'xiaofuge', 100301, 100006, '028871327901', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:48', 'create',
        '2024-04-14 21:18:47', '2024-04-14 21:18:47');
INSERT INTO `user_award_record_001`
VALUES (77, 'xiaofuge', 100301, 100006, '084175274536', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:48', 'create',
        '2024-04-14 21:18:48', '2024-04-14 21:18:48');
INSERT INTO `user_award_record_001`
VALUES (78, 'xiaofuge', 100301, 100006, '929400887730', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:49', 'create',
        '2024-04-14 21:18:48', '2024-04-14 21:18:48');
INSERT INTO `user_award_record_001`
VALUES (79, 'xiaofuge', 100301, 100006, '161604391043', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:49', 'create',
        '2024-04-14 21:18:49', '2024-04-14 21:18:49');
INSERT INTO `user_award_record_001`
VALUES (80, 'xiaofuge', 100301, 100006, '130084326025', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:50', 'create',
        '2024-04-14 21:18:49', '2024-04-14 21:18:49');
INSERT INTO `user_award_record_001`
VALUES (81, 'xiaofuge', 100301, 100006, '454703821210', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:50', 'create',
        '2024-04-14 21:18:50', '2024-04-14 21:18:50');
INSERT INTO `user_award_record_001`
VALUES (82, 'xiaofuge', 100301, 100006, '468490992044', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:51', 'create',
        '2024-04-14 21:18:50', '2024-04-14 21:18:50');
INSERT INTO `user_award_record_001`
VALUES (83, 'xiaofuge', 100301, 100006, '193209168432', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:51', 'create',
        '2024-04-14 21:18:51', '2024-04-14 21:18:51');
INSERT INTO `user_award_record_001`
VALUES (84, 'xiaofuge', 100301, 100006, '771475144534', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:52', 'create',
        '2024-04-14 21:18:51', '2024-04-14 21:18:51');
INSERT INTO `user_award_record_001`
VALUES (85, 'xiaofuge', 100301, 100006, '240079929496', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:52', 'create',
        '2024-04-14 21:18:52', '2024-04-14 21:18:52');
INSERT INTO `user_award_record_001`
VALUES (86, 'xiaofuge', 100301, 100006, '153968536433', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:53', 'create',
        '2024-04-14 21:18:52', '2024-04-14 21:18:52');
INSERT INTO `user_award_record_001`
VALUES (87, 'xiaofuge', 100301, 100006, '131156495023', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:53', 'create',
        '2024-04-14 21:18:53', '2024-04-14 21:18:53');
INSERT INTO `user_award_record_001`
VALUES (88, 'xiaofuge', 100301, 100006, '146066505084', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:54', 'create',
        '2024-04-14 21:18:53', '2024-04-14 21:18:53');
INSERT INTO `user_award_record_001`
VALUES (89, 'xiaofuge', 100301, 100006, '644855446448', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:54', 'create',
        '2024-04-14 21:18:54', '2024-04-14 21:18:54');
INSERT INTO `user_award_record_001`
VALUES (90, 'xiaofuge', 100301, 100006, '335066550607', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:55', 'create',
        '2024-04-14 21:18:54', '2024-04-14 21:18:54');
INSERT INTO `user_award_record_001`
VALUES (91, 'xiaofuge', 100301, 100006, '321967761206', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:55', 'create',
        '2024-04-14 21:18:55', '2024-04-14 21:18:55');
INSERT INTO `user_award_record_001`
VALUES (92, 'xiaofuge', 100301, 100006, '823747564112', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:56', 'create',
        '2024-04-14 21:18:55', '2024-04-14 21:18:55');
INSERT INTO `user_award_record_001`
VALUES (93, 'xiaofuge', 100301, 100006, '479300495498', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:56', 'create',
        '2024-04-14 21:18:56', '2024-04-14 21:18:56');
INSERT INTO `user_award_record_001`
VALUES (94, 'xiaofuge', 100301, 100006, '020301214689', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:57', 'create',
        '2024-04-14 21:18:56', '2024-04-14 21:18:56');
INSERT INTO `user_award_record_001`
VALUES (95, 'xiaofuge', 100301, 100006, '090844307213', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:57', 'create',
        '2024-04-14 21:18:57', '2024-04-14 21:18:57');
INSERT INTO `user_award_record_001`
VALUES (96, 'xiaofuge', 100301, 100006, '087422814233', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:58', 'create',
        '2024-04-14 21:18:57', '2024-04-14 21:18:57');
INSERT INTO `user_award_record_001`
VALUES (97, 'xiaofuge', 100301, 100006, '623178250538', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:58', 'create',
        '2024-04-14 21:18:58', '2024-04-14 21:18:58');
INSERT INTO `user_award_record_001`
VALUES (98, 'xiaofuge', 100301, 100006, '229239107756', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:59', 'create',
        '2024-04-14 21:18:58', '2024-04-14 21:18:58');
INSERT INTO `user_award_record_001`
VALUES (99, 'xiaofuge', 100301, 100006, '658968144019', 101, 'OpenAI 增加使用次数', '2024-04-14 13:18:59', 'create',
        '2024-04-14 21:18:59', '2024-04-14 21:18:59');
INSERT INTO `user_award_record_001`
VALUES (100, 'xiaofuge', 100301, 100006, '744732019530', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:00', 'create',
        '2024-04-14 21:18:59', '2024-04-14 21:18:59');
INSERT INTO `user_award_record_001`
VALUES (101, 'xiaofuge', 100301, 100006, '273300969525', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:00', 'create',
        '2024-04-14 21:19:00', '2024-04-14 21:19:00');
INSERT INTO `user_award_record_001`
VALUES (102, 'xiaofuge', 100301, 100006, '830742369397', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:01', 'create',
        '2024-04-14 21:19:00', '2024-04-14 21:19:00');
INSERT INTO `user_award_record_001`
VALUES (103, 'xiaofuge', 100301, 100006, '598457064971', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:01', 'create',
        '2024-04-14 21:19:01', '2024-04-14 21:19:01');
INSERT INTO `user_award_record_001`
VALUES (104, 'xiaofuge', 100301, 100006, '927505830859', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:02', 'create',
        '2024-04-14 21:19:02', '2024-04-14 21:19:02');
INSERT INTO `user_award_record_001`
VALUES (105, 'xiaofuge', 100301, 100006, '027086914590', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:03', 'create',
        '2024-04-14 21:19:02', '2024-04-14 21:19:02');
INSERT INTO `user_award_record_001`
VALUES (106, 'xiaofuge', 100301, 100006, '766124558776', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:03', 'create',
        '2024-04-14 21:19:03', '2024-04-14 21:19:03');
INSERT INTO `user_award_record_001`
VALUES (107, 'xiaofuge', 100301, 100006, '462968896578', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:04', 'create',
        '2024-04-14 21:19:03', '2024-04-14 21:19:03');
INSERT INTO `user_award_record_001`
VALUES (108, 'xiaofuge', 100301, 100006, '022782308651', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:04', 'create',
        '2024-04-14 21:19:04', '2024-04-14 21:19:04');
INSERT INTO `user_award_record_001`
VALUES (109, 'xiaofuge', 100301, 100006, '897146197194', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:05', 'create',
        '2024-04-14 21:19:04', '2024-04-14 21:19:04');
INSERT INTO `user_award_record_001`
VALUES (110, 'xiaofuge', 100301, 100006, '689559392088', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:05', 'create',
        '2024-04-14 21:19:05', '2024-04-14 21:19:05');
INSERT INTO `user_award_record_001`
VALUES (111, 'xiaofuge', 100301, 100006, '679245082216', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:06', 'create',
        '2024-04-14 21:19:05', '2024-04-14 21:19:05');
INSERT INTO `user_award_record_001`
VALUES (112, 'xiaofuge', 100301, 100006, '647548541058', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:06', 'create',
        '2024-04-14 21:19:06', '2024-04-14 21:19:06');
INSERT INTO `user_award_record_001`
VALUES (113, 'xiaofuge', 100301, 100006, '120948554608', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:07', 'create',
        '2024-04-14 21:19:06', '2024-04-14 21:19:06');
INSERT INTO `user_award_record_001`
VALUES (114, 'xiaofuge', 100301, 100006, '076995884407', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:07', 'create',
        '2024-04-14 21:19:07', '2024-04-14 21:19:07');
INSERT INTO `user_award_record_001`
VALUES (115, 'xiaofuge', 100301, 100006, '619737652061', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:08', 'create',
        '2024-04-14 21:19:07', '2024-04-14 21:19:07');
INSERT INTO `user_award_record_001`
VALUES (116, 'xiaofuge', 100301, 100006, '724941411165', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:08', 'create',
        '2024-04-14 21:19:08', '2024-04-14 21:19:08');
INSERT INTO `user_award_record_001`
VALUES (117, 'xiaofuge', 100301, 100006, '644811271175', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:09', 'create',
        '2024-04-14 21:19:08', '2024-04-14 21:19:08');
INSERT INTO `user_award_record_001`
VALUES (118, 'xiaofuge', 100301, 100006, '331341919031', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:09', 'create',
        '2024-04-14 21:19:09', '2024-04-14 21:19:09');
INSERT INTO `user_award_record_001`
VALUES (119, 'xiaofuge', 100301, 100006, '021743514067', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:10', 'create',
        '2024-04-14 21:19:09', '2024-04-14 21:19:09');
INSERT INTO `user_award_record_001`
VALUES (120, 'xiaofuge', 100301, 100006, '395962860948', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:10', 'create',
        '2024-04-14 21:19:10', '2024-04-14 21:19:10');
INSERT INTO `user_award_record_001`
VALUES (121, 'xiaofuge', 100301, 100006, '139030916416', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:11', 'create',
        '2024-04-14 21:19:10', '2024-04-14 21:19:10');
INSERT INTO `user_award_record_001`
VALUES (122, 'xiaofuge', 100301, 100006, '958596784228', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:11', 'create',
        '2024-04-14 21:19:11', '2024-04-14 21:19:11');
INSERT INTO `user_award_record_001`
VALUES (123, 'xiaofuge', 100301, 100006, '552995561503', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:12', 'create',
        '2024-04-14 21:19:11', '2024-04-14 21:19:11');
INSERT INTO `user_award_record_001`
VALUES (124, 'xiaofuge', 100301, 100006, '362436994389', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:12', 'create',
        '2024-04-14 21:19:12', '2024-04-14 21:19:12');
INSERT INTO `user_award_record_001`
VALUES (125, 'xiaofuge', 100301, 100006, '864389498610', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:13', 'create',
        '2024-04-14 21:19:12', '2024-04-14 21:19:12');
INSERT INTO `user_award_record_001`
VALUES (126, 'xiaofuge', 100301, 100006, '276308486398', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:13', 'create',
        '2024-04-14 21:19:13', '2024-04-14 21:19:13');
INSERT INTO `user_award_record_001`
VALUES (127, 'xiaofuge', 100301, 100006, '511344558764', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:14', 'create',
        '2024-04-14 21:19:13', '2024-04-14 21:19:13');
INSERT INTO `user_award_record_001`
VALUES (128, 'xiaofuge', 100301, 100006, '687727809504', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:14', 'create',
        '2024-04-14 21:19:14', '2024-04-14 21:19:14');
INSERT INTO `user_award_record_001`
VALUES (129, 'xiaofuge', 100301, 100006, '446665069359', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:15', 'create',
        '2024-04-14 21:19:14', '2024-04-14 21:19:14');
INSERT INTO `user_award_record_001`
VALUES (130, 'xiaofuge', 100301, 100006, '262121200057', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:15', 'create',
        '2024-04-14 21:19:15', '2024-04-14 21:19:15');
INSERT INTO `user_award_record_001`
VALUES (131, 'xiaofuge', 100301, 100006, '733841459246', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:16', 'create',
        '2024-04-14 21:19:15', '2024-04-14 21:19:15');
INSERT INTO `user_award_record_001`
VALUES (132, 'xiaofuge', 100301, 100006, '879700449533', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:16', 'create',
        '2024-04-14 21:19:16', '2024-04-14 21:19:16');
INSERT INTO `user_award_record_001`
VALUES (133, 'xiaofuge', 100301, 100006, '967957223182', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:17', 'create',
        '2024-04-14 21:19:16', '2024-04-14 21:19:16');
INSERT INTO `user_award_record_001`
VALUES (134, 'xiaofuge', 100301, 100006, '133562824854', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:17', 'create',
        '2024-04-14 21:19:17', '2024-04-14 21:19:17');
INSERT INTO `user_award_record_001`
VALUES (135, 'xiaofuge', 100301, 100006, '614479142358', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:18', 'create',
        '2024-04-14 21:19:18', '2024-04-14 21:19:18');
INSERT INTO `user_award_record_001`
VALUES (136, 'xiaofuge', 100301, 100006, '730060933685', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:19', 'create',
        '2024-04-14 21:19:18', '2024-04-14 21:19:18');
INSERT INTO `user_award_record_001`
VALUES (137, 'xiaofuge', 100301, 100006, '205311989208', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:19', 'create',
        '2024-04-14 21:19:19', '2024-04-14 21:19:19');
INSERT INTO `user_award_record_001`
VALUES (138, 'xiaofuge', 100301, 100006, '504533996156', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:20', 'create',
        '2024-04-14 21:19:19', '2024-04-14 21:19:19');
INSERT INTO `user_award_record_001`
VALUES (139, 'xiaofuge', 100301, 100006, '363004108801', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:20', 'create',
        '2024-04-14 21:19:20', '2024-04-14 21:19:20');
INSERT INTO `user_award_record_001`
VALUES (140, 'xiaofuge', 100301, 100006, '781386196761', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:21', 'create',
        '2024-04-14 21:19:20', '2024-04-14 21:19:20');
INSERT INTO `user_award_record_001`
VALUES (141, 'xiaofuge', 100301, 100006, '362180493391', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:21', 'create',
        '2024-04-14 21:19:21', '2024-04-14 21:19:21');
INSERT INTO `user_award_record_001`
VALUES (142, 'xiaofuge', 100301, 100006, '711514730232', 101, 'OpenAI 增加使用次数', '2024-04-14 13:19:22', 'create',
        '2024-04-14 21:19:21', '2024-04-14 21:19:21');
INSERT INTO `user_award_record_001`
VALUES (143, 'xiaofuge', 100301, 100006, '541811162267', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:37', 'create',
        '2024-04-14 21:21:36', '2024-04-14 21:21:36');
INSERT INTO `user_award_record_001`
VALUES (144, 'xiaofuge', 100301, 100006, '179072433922', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:37', 'create',
        '2024-04-14 21:21:37', '2024-04-14 21:21:37');
INSERT INTO `user_award_record_001`
VALUES (145, 'xiaofuge', 100301, 100006, '656125281801', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:38', 'create',
        '2024-04-14 21:21:37', '2024-04-14 21:21:37');
INSERT INTO `user_award_record_001`
VALUES (146, 'xiaofuge', 100301, 100006, '486882190779', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:38', 'create',
        '2024-04-14 21:21:38', '2024-04-14 21:21:38');
INSERT INTO `user_award_record_001`
VALUES (147, 'xiaofuge', 100301, 100006, '104455598875', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:39', 'create',
        '2024-04-14 21:21:38', '2024-04-14 21:21:38');
INSERT INTO `user_award_record_001`
VALUES (148, 'xiaofuge', 100301, 100006, '364089687613', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:39', 'create',
        '2024-04-14 21:21:39', '2024-04-14 21:21:39');
INSERT INTO `user_award_record_001`
VALUES (149, 'xiaofuge', 100301, 100006, '522738443619', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:40', 'create',
        '2024-04-14 21:21:39', '2024-04-14 21:21:39');
INSERT INTO `user_award_record_001`
VALUES (150, 'xiaofuge', 100301, 100006, '834509264801', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:40', 'create',
        '2024-04-14 21:21:40', '2024-04-14 21:21:40');
INSERT INTO `user_award_record_001`
VALUES (151, 'xiaofuge', 100301, 100006, '524736927957', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:41', 'create',
        '2024-04-14 21:21:40', '2024-04-14 21:21:40');
INSERT INTO `user_award_record_001`
VALUES (152, 'xiaofuge', 100301, 100006, '644956026985', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:41', 'create',
        '2024-04-14 21:21:41', '2024-04-14 21:21:41');
INSERT INTO `user_award_record_001`
VALUES (153, 'xiaofuge', 100301, 100006, '098327846276', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:42', 'create',
        '2024-04-14 21:21:41', '2024-04-14 21:21:41');
INSERT INTO `user_award_record_001`
VALUES (154, 'xiaofuge', 100301, 100006, '664880337260', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:43', 'create',
        '2024-04-14 21:21:42', '2024-04-14 21:21:42');
INSERT INTO `user_award_record_001`
VALUES (155, 'xiaofuge', 100301, 100006, '679544645307', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:43', 'create',
        '2024-04-14 21:21:43', '2024-04-14 21:21:43');
INSERT INTO `user_award_record_001`
VALUES (156, 'xiaofuge', 100301, 100006, '894820380848', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:44', 'create',
        '2024-04-14 21:21:43', '2024-04-14 21:21:43');
INSERT INTO `user_award_record_001`
VALUES (157, 'xiaofuge', 100301, 100006, '701589749505', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:44', 'create',
        '2024-04-14 21:21:44', '2024-04-14 21:21:44');
INSERT INTO `user_award_record_001`
VALUES (158, 'xiaofuge', 100301, 100006, '540787093586', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:45', 'create',
        '2024-04-14 21:21:44', '2024-04-14 21:21:44');
INSERT INTO `user_award_record_001`
VALUES (159, 'xiaofuge', 100301, 100006, '506082668155', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:45', 'create',
        '2024-04-14 21:21:45', '2024-04-14 21:21:45');
INSERT INTO `user_award_record_001`
VALUES (160, 'xiaofuge', 100301, 100006, '604762670150', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:46', 'create',
        '2024-04-14 21:21:45', '2024-04-14 21:21:45');
INSERT INTO `user_award_record_001`
VALUES (161, 'xiaofuge', 100301, 100006, '741462543887', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:46', 'create',
        '2024-04-14 21:21:46', '2024-04-14 21:21:46');
INSERT INTO `user_award_record_001`
VALUES (162, 'xiaofuge', 100301, 100006, '290906151961', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:47', 'create',
        '2024-04-14 21:21:46', '2024-04-14 21:21:46');
INSERT INTO `user_award_record_001`
VALUES (163, 'xiaofuge', 100301, 100006, '377039027936', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:47', 'create',
        '2024-04-14 21:21:47', '2024-04-14 21:21:47');
INSERT INTO `user_award_record_001`
VALUES (164, 'xiaofuge', 100301, 100006, '370084936305', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:48', 'create',
        '2024-04-14 21:21:47', '2024-04-14 21:21:47');
INSERT INTO `user_award_record_001`
VALUES (165, 'xiaofuge', 100301, 100006, '495198646899', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:48', 'create',
        '2024-04-14 21:21:48', '2024-04-14 21:21:48');
INSERT INTO `user_award_record_001`
VALUES (166, 'xiaofuge', 100301, 100006, '161999494532', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:49', 'create',
        '2024-04-14 21:21:48', '2024-04-14 21:21:48');
INSERT INTO `user_award_record_001`
VALUES (167, 'xiaofuge', 100301, 100006, '684360405186', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:49', 'create',
        '2024-04-14 21:21:49', '2024-04-14 21:21:49');
INSERT INTO `user_award_record_001`
VALUES (168, 'xiaofuge', 100301, 100006, '552703546846', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:50', 'create',
        '2024-04-14 21:21:49', '2024-04-14 21:21:49');
INSERT INTO `user_award_record_001`
VALUES (169, 'xiaofuge', 100301, 100006, '986548293794', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:50', 'create',
        '2024-04-14 21:21:50', '2024-04-14 21:21:50');
INSERT INTO `user_award_record_001`
VALUES (170, 'xiaofuge', 100301, 100006, '940648583809', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:51', 'create',
        '2024-04-14 21:21:50', '2024-04-14 21:21:50');
INSERT INTO `user_award_record_001`
VALUES (171, 'xiaofuge', 100301, 100006, '847943532995', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:51', 'create',
        '2024-04-14 21:21:51', '2024-04-14 21:21:51');
INSERT INTO `user_award_record_001`
VALUES (172, 'xiaofuge', 100301, 100006, '027365686400', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:52', 'create',
        '2024-04-14 21:21:51', '2024-04-14 21:21:51');
INSERT INTO `user_award_record_001`
VALUES (173, 'xiaofuge', 100301, 100006, '287664473623', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:52', 'create',
        '2024-04-14 21:21:52', '2024-04-14 21:21:52');
INSERT INTO `user_award_record_001`
VALUES (174, 'xiaofuge', 100301, 100006, '054685908082', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:53', 'create',
        '2024-04-14 21:21:52', '2024-04-14 21:21:52');
INSERT INTO `user_award_record_001`
VALUES (175, 'xiaofuge', 100301, 100006, '179315988768', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:53', 'create',
        '2024-04-14 21:21:53', '2024-04-14 21:21:53');
INSERT INTO `user_award_record_001`
VALUES (176, 'xiaofuge', 100301, 100006, '793967497796', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:54', 'create',
        '2024-04-14 21:21:53', '2024-04-14 21:21:53');
INSERT INTO `user_award_record_001`
VALUES (177, 'xiaofuge', 100301, 100006, '779034318839', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:54', 'create',
        '2024-04-14 21:21:54', '2024-04-14 21:21:54');
INSERT INTO `user_award_record_001`
VALUES (178, 'xiaofuge', 100301, 100006, '550576779200', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:55', 'create',
        '2024-04-14 21:21:54', '2024-04-14 21:21:54');
INSERT INTO `user_award_record_001`
VALUES (179, 'xiaofuge', 100301, 100006, '379378959636', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:55', 'create',
        '2024-04-14 21:21:55', '2024-04-14 21:21:55');
INSERT INTO `user_award_record_001`
VALUES (180, 'xiaofuge', 100301, 100006, '015088751101', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:56', 'create',
        '2024-04-14 21:21:55', '2024-04-14 21:21:55');
INSERT INTO `user_award_record_001`
VALUES (181, 'xiaofuge', 100301, 100006, '550610667956', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:56', 'create',
        '2024-04-14 21:21:56', '2024-04-14 21:21:56');
INSERT INTO `user_award_record_001`
VALUES (182, 'xiaofuge', 100301, 100006, '513380345550', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:57', 'create',
        '2024-04-14 21:21:56', '2024-04-14 21:21:56');
INSERT INTO `user_award_record_001`
VALUES (183, 'xiaofuge', 100301, 100006, '177574413875', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:57', 'create',
        '2024-04-14 21:21:57', '2024-04-14 21:21:57');
INSERT INTO `user_award_record_001`
VALUES (184, 'xiaofuge', 100301, 100006, '340938251538', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:58', 'create',
        '2024-04-14 21:21:57', '2024-04-14 21:21:57');
INSERT INTO `user_award_record_001`
VALUES (185, 'xiaofuge', 100301, 100006, '004782076384', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:58', 'create',
        '2024-04-14 21:21:58', '2024-04-14 21:21:58');
INSERT INTO `user_award_record_001`
VALUES (186, 'xiaofuge', 100301, 100006, '018477546253', 101, 'OpenAI 增加使用次数', '2024-04-14 13:21:59', 'create',
        '2024-04-14 21:21:59', '2024-04-14 21:21:59');
INSERT INTO `user_award_record_001`
VALUES (187, 'xiaofuge', 100301, 100006, '365682407837', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:00', 'create',
        '2024-04-14 21:21:59', '2024-04-14 21:21:59');
INSERT INTO `user_award_record_001`
VALUES (188, 'xiaofuge', 100301, 100006, '369893493235', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:00', 'create',
        '2024-04-14 21:22:00', '2024-04-14 21:22:00');
INSERT INTO `user_award_record_001`
VALUES (189, 'xiaofuge', 100301, 100006, '612859440264', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:01', 'create',
        '2024-04-14 21:22:00', '2024-04-14 21:22:00');
INSERT INTO `user_award_record_001`
VALUES (190, 'xiaofuge', 100301, 100006, '513433927314', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:01', 'create',
        '2024-04-14 21:22:01', '2024-04-14 21:22:01');
INSERT INTO `user_award_record_001`
VALUES (191, 'xiaofuge', 100301, 100006, '200096229047', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:02', 'create',
        '2024-04-14 21:22:01', '2024-04-14 21:22:01');
INSERT INTO `user_award_record_001`
VALUES (192, 'xiaofuge', 100301, 100006, '993348908435', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:02', 'create',
        '2024-04-14 21:22:02', '2024-04-14 21:22:02');
INSERT INTO `user_award_record_001`
VALUES (193, 'xiaofuge', 100301, 100006, '083773400288', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:03', 'create',
        '2024-04-14 21:22:02', '2024-04-14 21:22:02');
INSERT INTO `user_award_record_001`
VALUES (194, 'xiaofuge', 100301, 100006, '770472441342', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:03', 'create',
        '2024-04-14 21:22:03', '2024-04-14 21:22:03');
INSERT INTO `user_award_record_001`
VALUES (195, 'xiaofuge', 100301, 100006, '477660625345', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:04', 'create',
        '2024-04-14 21:22:03', '2024-04-14 21:22:03');
INSERT INTO `user_award_record_001`
VALUES (196, 'xiaofuge', 100301, 100006, '209528476511', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:04', 'create',
        '2024-04-14 21:22:04', '2024-04-14 21:22:04');
INSERT INTO `user_award_record_001`
VALUES (197, 'xiaofuge', 100301, 100006, '750330011470', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:05', 'create',
        '2024-04-14 21:22:04', '2024-04-14 21:22:04');
INSERT INTO `user_award_record_001`
VALUES (198, 'xiaofuge', 100301, 100006, '305081754532', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:05', 'create',
        '2024-04-14 21:22:05', '2024-04-14 21:22:05');
INSERT INTO `user_award_record_001`
VALUES (199, 'xiaofuge', 100301, 100006, '723003883923', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:06', 'create',
        '2024-04-14 21:22:05', '2024-04-14 21:22:05');
INSERT INTO `user_award_record_001`
VALUES (200, 'xiaofuge', 100301, 100006, '967623301040', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:06', 'create',
        '2024-04-14 21:22:06', '2024-04-14 21:22:06');
INSERT INTO `user_award_record_001`
VALUES (201, 'xiaofuge', 100301, 100006, '988847273127', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:07', 'create',
        '2024-04-14 21:22:06', '2024-04-14 21:22:06');
INSERT INTO `user_award_record_001`
VALUES (202, 'xiaofuge', 100301, 100006, '034798446205', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:07', 'create',
        '2024-04-14 21:22:07', '2024-04-14 21:22:07');
INSERT INTO `user_award_record_001`
VALUES (203, 'xiaofuge', 100301, 100006, '054108283038', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:08', 'create',
        '2024-04-14 21:22:07', '2024-04-14 21:22:07');
INSERT INTO `user_award_record_001`
VALUES (204, 'xiaofuge', 100301, 100006, '592270434138', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:08', 'create',
        '2024-04-14 21:22:08', '2024-04-14 21:22:08');
INSERT INTO `user_award_record_001`
VALUES (205, 'xiaofuge', 100301, 100006, '443129728072', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:09', 'create',
        '2024-04-14 21:22:08', '2024-04-14 21:22:08');
INSERT INTO `user_award_record_001`
VALUES (206, 'xiaofuge', 100301, 100006, '159708722412', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:09', 'create',
        '2024-04-14 21:22:09', '2024-04-14 21:22:09');
INSERT INTO `user_award_record_001`
VALUES (207, 'xiaofuge', 100301, 100006, '785165065063', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:10', 'create',
        '2024-04-14 21:22:09', '2024-04-14 21:22:09');
INSERT INTO `user_award_record_001`
VALUES (208, 'xiaofuge', 100301, 100006, '563141406938', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:10', 'create',
        '2024-04-14 21:22:10', '2024-04-14 21:22:10');
INSERT INTO `user_award_record_001`
VALUES (209, 'xiaofuge', 100301, 100006, '997296537922', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:11', 'create',
        '2024-04-14 21:22:10', '2024-04-14 21:22:10');
INSERT INTO `user_award_record_001`
VALUES (210, 'xiaofuge', 100301, 100006, '967520932107', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:11', 'create',
        '2024-04-14 21:22:11', '2024-04-14 21:22:11');
INSERT INTO `user_award_record_001`
VALUES (211, 'xiaofuge', 100301, 100006, '102464232965', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:12', 'create',
        '2024-04-14 21:22:11', '2024-04-14 21:22:11');
INSERT INTO `user_award_record_001`
VALUES (212, 'xiaofuge', 100301, 100006, '714125910259', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:12', 'create',
        '2024-04-14 21:22:12', '2024-04-14 21:22:12');
INSERT INTO `user_award_record_001`
VALUES (213, 'xiaofuge', 100301, 100006, '325242573907', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:13', 'create',
        '2024-04-14 21:22:12', '2024-04-14 21:22:12');
INSERT INTO `user_award_record_001`
VALUES (214, 'xiaofuge', 100301, 100006, '650066947315', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:13', 'create',
        '2024-04-14 21:22:13', '2024-04-14 21:22:13');
INSERT INTO `user_award_record_001`
VALUES (215, 'xiaofuge', 100301, 100006, '921691387500', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:14', 'create',
        '2024-04-14 21:22:13', '2024-04-14 21:22:13');
INSERT INTO `user_award_record_001`
VALUES (216, 'xiaofuge', 100301, 100006, '754847630041', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:14', 'create',
        '2024-04-14 21:22:14', '2024-04-14 21:22:14');
INSERT INTO `user_award_record_001`
VALUES (217, 'xiaofuge', 100301, 100006, '401320745282', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:15', 'create',
        '2024-04-14 21:22:15', '2024-04-14 21:22:15');
INSERT INTO `user_award_record_001`
VALUES (218, 'xiaofuge', 100301, 100006, '397460552489', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:16', 'create',
        '2024-04-14 21:22:15', '2024-04-14 21:22:15');
INSERT INTO `user_award_record_001`
VALUES (219, 'xiaofuge', 100301, 100006, '888099895227', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:16', 'create',
        '2024-04-14 21:22:16', '2024-04-14 21:22:16');
INSERT INTO `user_award_record_001`
VALUES (220, 'xiaofuge', 100301, 100006, '556784799542', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:17', 'create',
        '2024-04-14 21:22:16', '2024-04-14 21:22:16');
INSERT INTO `user_award_record_001`
VALUES (221, 'xiaofuge', 100301, 100006, '673058887489', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:17', 'create',
        '2024-04-14 21:22:17', '2024-04-14 21:22:17');
INSERT INTO `user_award_record_001`
VALUES (222, 'xiaofuge', 100301, 100006, '451953704598', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:18', 'create',
        '2024-04-14 21:22:17', '2024-04-14 21:22:17');
INSERT INTO `user_award_record_001`
VALUES (223, 'xiaofuge', 100301, 100006, '003610107322', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:18', 'create',
        '2024-04-14 21:22:18', '2024-04-14 21:22:18');
INSERT INTO `user_award_record_001`
VALUES (224, 'xiaofuge', 100301, 100006, '760167700514', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:19', 'create',
        '2024-04-14 21:22:18', '2024-04-14 21:22:18');
INSERT INTO `user_award_record_001`
VALUES (225, 'xiaofuge', 100301, 100006, '691407827604', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:19', 'create',
        '2024-04-14 21:22:19', '2024-04-14 21:22:19');
INSERT INTO `user_award_record_001`
VALUES (226, 'xiaofuge', 100301, 100006, '132428541453', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:20', 'create',
        '2024-04-14 21:22:19', '2024-04-14 21:22:19');
INSERT INTO `user_award_record_001`
VALUES (227, 'xiaofuge', 100301, 100006, '426542516133', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:20', 'create',
        '2024-04-14 21:22:20', '2024-04-14 21:22:20');
INSERT INTO `user_award_record_001`
VALUES (228, 'xiaofuge', 100301, 100006, '761193182510', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:21', 'create',
        '2024-04-14 21:22:20', '2024-04-14 21:22:20');
INSERT INTO `user_award_record_001`
VALUES (229, 'xiaofuge', 100301, 100006, '322427834200', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:21', 'create',
        '2024-04-14 21:22:21', '2024-04-14 21:22:21');
INSERT INTO `user_award_record_001`
VALUES (230, 'xiaofuge', 100301, 100006, '404837678200', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:22', 'create',
        '2024-04-14 21:22:21', '2024-04-14 21:22:21');
INSERT INTO `user_award_record_001`
VALUES (231, 'xiaofuge', 100301, 100006, '674587165088', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:22', 'create',
        '2024-04-14 21:22:22', '2024-04-14 21:22:22');
INSERT INTO `user_award_record_001`
VALUES (232, 'xiaofuge', 100301, 100006, '072560169222', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:23', 'create',
        '2024-04-14 21:22:22', '2024-04-14 21:22:22');
INSERT INTO `user_award_record_001`
VALUES (233, 'xiaofuge', 100301, 100006, '784109220762', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:23', 'create',
        '2024-04-14 21:22:23', '2024-04-14 21:22:23');
INSERT INTO `user_award_record_001`
VALUES (234, 'xiaofuge', 100301, 100006, '813471025552', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:24', 'create',
        '2024-04-14 21:22:23', '2024-04-14 21:22:23');
INSERT INTO `user_award_record_001`
VALUES (235, 'xiaofuge', 100301, 100006, '589145649767', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:24', 'create',
        '2024-04-14 21:22:24', '2024-04-14 21:22:24');
INSERT INTO `user_award_record_001`
VALUES (236, 'xiaofuge', 100301, 100006, '285811930456', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:25', 'create',
        '2024-04-14 21:22:24', '2024-04-14 21:22:24');
INSERT INTO `user_award_record_001`
VALUES (237, 'xiaofuge', 100301, 100006, '656420672140', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:25', 'create',
        '2024-04-14 21:22:25', '2024-04-14 21:22:25');
INSERT INTO `user_award_record_001`
VALUES (238, 'xiaofuge', 100301, 100006, '674867367934', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:26', 'create',
        '2024-04-14 21:22:25', '2024-04-14 21:22:25');
INSERT INTO `user_award_record_001`
VALUES (239, 'xiaofuge', 100301, 100006, '184632020160', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:26', 'create',
        '2024-04-14 21:22:26', '2024-04-14 21:22:26');
INSERT INTO `user_award_record_001`
VALUES (240, 'xiaofuge', 100301, 100006, '008059902598', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:27', 'create',
        '2024-04-14 21:22:26', '2024-04-14 21:22:26');
INSERT INTO `user_award_record_001`
VALUES (241, 'xiaofuge', 100301, 100006, '731837802528', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:27', 'create',
        '2024-04-14 21:22:27', '2024-04-14 21:22:27');
INSERT INTO `user_award_record_001`
VALUES (242, 'xiaofuge', 100301, 100006, '629070715318', 101, 'OpenAI 增加使用次数', '2024-04-14 13:22:28', 'create',
        '2024-04-14 21:22:27', '2024-04-14 21:22:27');
INSERT INTO `user_award_record_001`
VALUES (243, 'xiaofuge', 100301, 100006, '568884706075', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:44', 'create',
        '2024-04-14 21:23:44', '2024-04-14 21:23:44');
INSERT INTO `user_award_record_001`
VALUES (244, 'xiaofuge', 100301, 100006, '761546940577', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:45', 'create',
        '2024-04-14 21:23:44', '2024-04-14 21:23:44');
INSERT INTO `user_award_record_001`
VALUES (245, 'xiaofuge', 100301, 100006, '268569466383', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:45', 'create',
        '2024-04-14 21:23:45', '2024-04-14 21:23:45');
INSERT INTO `user_award_record_001`
VALUES (246, 'xiaofuge', 100301, 100006, '572019805262', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:46', 'create',
        '2024-04-14 21:23:45', '2024-04-14 21:23:45');
INSERT INTO `user_award_record_001`
VALUES (247, 'xiaofuge', 100301, 100006, '860211527664', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:46', 'create',
        '2024-04-14 21:23:46', '2024-04-14 21:23:46');
INSERT INTO `user_award_record_001`
VALUES (248, 'xiaofuge', 100301, 100006, '072810195947', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:47', 'create',
        '2024-04-14 21:23:46', '2024-04-14 21:23:46');
INSERT INTO `user_award_record_001`
VALUES (249, 'xiaofuge', 100301, 100006, '681904800179', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:47', 'create',
        '2024-04-14 21:23:47', '2024-04-14 21:23:47');
INSERT INTO `user_award_record_001`
VALUES (250, 'xiaofuge', 100301, 100006, '784718891705', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:48', 'create',
        '2024-04-14 21:23:47', '2024-04-14 21:23:47');
INSERT INTO `user_award_record_001`
VALUES (251, 'xiaofuge', 100301, 100006, '715679058474', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:48', 'create',
        '2024-04-14 21:23:48', '2024-04-14 21:23:48');
INSERT INTO `user_award_record_001`
VALUES (252, 'xiaofuge', 100301, 100006, '283499552523', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:49', 'create',
        '2024-04-14 21:23:48', '2024-04-14 21:23:48');
INSERT INTO `user_award_record_001`
VALUES (253, 'xiaofuge', 100301, 100006, '684150671012', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:49', 'create',
        '2024-04-14 21:23:49', '2024-04-14 21:23:49');
INSERT INTO `user_award_record_001`
VALUES (254, 'xiaofuge', 100301, 100006, '280181925718', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:50', 'create',
        '2024-04-14 21:23:49', '2024-04-14 21:23:49');
INSERT INTO `user_award_record_001`
VALUES (255, 'xiaofuge', 100301, 100006, '472117714995', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:50', 'create',
        '2024-04-14 21:23:50', '2024-04-14 21:23:50');
INSERT INTO `user_award_record_001`
VALUES (256, 'xiaofuge', 100301, 100006, '962227006684', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:51', 'create',
        '2024-04-14 21:23:50', '2024-04-14 21:23:50');
INSERT INTO `user_award_record_001`
VALUES (257, 'xiaofuge', 100301, 100006, '094436890000', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:51', 'create',
        '2024-04-14 21:23:51', '2024-04-14 21:23:51');
INSERT INTO `user_award_record_001`
VALUES (258, 'xiaofuge', 100301, 100006, '484977656335', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:52', 'create',
        '2024-04-14 21:23:52', '2024-04-14 21:23:52');
INSERT INTO `user_award_record_001`
VALUES (259, 'xiaofuge', 100301, 100006, '686430320124', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:53', 'create',
        '2024-04-14 21:23:52', '2024-04-14 21:23:52');
INSERT INTO `user_award_record_001`
VALUES (260, 'xiaofuge', 100301, 100006, '632908405947', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:53', 'create',
        '2024-04-14 21:23:53', '2024-04-14 21:23:53');
INSERT INTO `user_award_record_001`
VALUES (261, 'xiaofuge', 100301, 100006, '344923431360', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:54', 'create',
        '2024-04-14 21:23:53', '2024-04-14 21:23:53');
INSERT INTO `user_award_record_001`
VALUES (262, 'xiaofuge', 100301, 100006, '511243887830', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:54', 'create',
        '2024-04-14 21:23:54', '2024-04-14 21:23:54');
INSERT INTO `user_award_record_001`
VALUES (263, 'xiaofuge', 100301, 100006, '493915548034', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:55', 'create',
        '2024-04-14 21:23:54', '2024-04-14 21:23:54');
INSERT INTO `user_award_record_001`
VALUES (264, 'xiaofuge', 100301, 100006, '250633197932', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:55', 'create',
        '2024-04-14 21:23:55', '2024-04-14 21:23:55');
INSERT INTO `user_award_record_001`
VALUES (265, 'xiaofuge', 100301, 100006, '291681024936', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:56', 'create',
        '2024-04-14 21:23:55', '2024-04-14 21:23:55');
INSERT INTO `user_award_record_001`
VALUES (266, 'xiaofuge', 100301, 100006, '294580375584', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:56', 'create',
        '2024-04-14 21:23:56', '2024-04-14 21:23:56');
INSERT INTO `user_award_record_001`
VALUES (267, 'xiaofuge', 100301, 100006, '525232342558', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:57', 'create',
        '2024-04-14 21:23:56', '2024-04-14 21:23:56');
INSERT INTO `user_award_record_001`
VALUES (268, 'xiaofuge', 100301, 100006, '889616657607', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:57', 'create',
        '2024-04-14 21:23:57', '2024-04-14 21:23:57');
INSERT INTO `user_award_record_001`
VALUES (269, 'xiaofuge', 100301, 100006, '558388841957', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:58', 'create',
        '2024-04-14 21:23:57', '2024-04-14 21:23:57');
INSERT INTO `user_award_record_001`
VALUES (270, 'xiaofuge', 100301, 100006, '053041626752', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:58', 'create',
        '2024-04-14 21:23:58', '2024-04-14 21:23:58');
INSERT INTO `user_award_record_001`
VALUES (271, 'xiaofuge', 100301, 100006, '480810484643', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:59', 'create',
        '2024-04-14 21:23:58', '2024-04-14 21:23:58');
INSERT INTO `user_award_record_001`
VALUES (272, 'xiaofuge', 100301, 100006, '966473799874', 101, 'OpenAI 增加使用次数', '2024-04-14 13:23:59', 'create',
        '2024-04-14 21:23:59', '2024-04-14 21:23:59');
INSERT INTO `user_award_record_001`
VALUES (273, 'xiaofuge', 100301, 100006, '813292540655', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:00', 'create',
        '2024-04-14 21:23:59', '2024-04-14 21:23:59');
INSERT INTO `user_award_record_001`
VALUES (274, 'xiaofuge', 100301, 100006, '156067566844', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:00', 'create',
        '2024-04-14 21:24:00', '2024-04-14 21:24:00');
INSERT INTO `user_award_record_001`
VALUES (275, 'xiaofuge', 100301, 100006, '722935033054', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:01', 'create',
        '2024-04-14 21:24:00', '2024-04-14 21:24:00');
INSERT INTO `user_award_record_001`
VALUES (276, 'xiaofuge', 100301, 100006, '873256091755', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:01', 'create',
        '2024-04-14 21:24:01', '2024-04-14 21:24:01');
INSERT INTO `user_award_record_001`
VALUES (277, 'xiaofuge', 100301, 100006, '711525206048', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:02', 'create',
        '2024-04-14 21:24:01', '2024-04-14 21:24:01');
INSERT INTO `user_award_record_001`
VALUES (278, 'xiaofuge', 100301, 100006, '009977406676', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:02', 'create',
        '2024-04-14 21:24:02', '2024-04-14 21:24:02');
INSERT INTO `user_award_record_001`
VALUES (279, 'xiaofuge', 100301, 100006, '381696551162', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:03', 'create',
        '2024-04-14 21:24:02', '2024-04-14 21:24:02');
INSERT INTO `user_award_record_001`
VALUES (280, 'xiaofuge', 100301, 100006, '720165976387', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:03', 'create',
        '2024-04-14 21:24:03', '2024-04-14 21:24:03');
INSERT INTO `user_award_record_001`
VALUES (281, 'xiaofuge', 100301, 100006, '976298609923', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:04', 'create',
        '2024-04-14 21:24:03', '2024-04-14 21:24:03');
INSERT INTO `user_award_record_001`
VALUES (282, 'xiaofuge', 100301, 100006, '904570887488', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:04', 'create',
        '2024-04-14 21:24:04', '2024-04-14 21:24:04');
INSERT INTO `user_award_record_001`
VALUES (283, 'xiaofuge', 100301, 100006, '164685634649', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:05', 'create',
        '2024-04-14 21:24:04', '2024-04-14 21:24:04');
INSERT INTO `user_award_record_001`
VALUES (284, 'xiaofuge', 100301, 100006, '497651804148', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:05', 'create',
        '2024-04-14 21:24:05', '2024-04-14 21:24:05');
INSERT INTO `user_award_record_001`
VALUES (285, 'xiaofuge', 100301, 100006, '715511138187', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:06', 'create',
        '2024-04-14 21:24:05', '2024-04-14 21:24:05');
INSERT INTO `user_award_record_001`
VALUES (286, 'xiaofuge', 100301, 100006, '134475473914', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:06', 'create',
        '2024-04-14 21:24:06', '2024-04-14 21:24:06');
INSERT INTO `user_award_record_001`
VALUES (287, 'xiaofuge', 100301, 100006, '834710001329', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:07', 'create',
        '2024-04-14 21:24:06', '2024-04-14 21:24:06');
INSERT INTO `user_award_record_001`
VALUES (288, 'xiaofuge', 100301, 100006, '789151351415', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:07', 'create',
        '2024-04-14 21:24:07', '2024-04-14 21:24:07');
INSERT INTO `user_award_record_001`
VALUES (289, 'xiaofuge', 100301, 100006, '822455754545', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:08', 'create',
        '2024-04-14 21:24:07', '2024-04-14 21:24:07');
INSERT INTO `user_award_record_001`
VALUES (290, 'xiaofuge', 100301, 100006, '049436224508', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:09', 'create',
        '2024-04-14 21:24:08', '2024-04-14 21:24:08');
INSERT INTO `user_award_record_001`
VALUES (291, 'xiaofuge', 100301, 100006, '092824091097', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:09', 'create',
        '2024-04-14 21:24:09', '2024-04-14 21:24:09');
INSERT INTO `user_award_record_001`
VALUES (292, 'xiaofuge', 100301, 100006, '612459399787', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:10', 'create',
        '2024-04-14 21:24:09', '2024-04-14 21:24:09');
INSERT INTO `user_award_record_001`
VALUES (293, 'xiaofuge', 100301, 100006, '569422110806', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:10', 'create',
        '2024-04-14 21:24:10', '2024-04-14 21:24:10');
INSERT INTO `user_award_record_001`
VALUES (294, 'xiaofuge', 100301, 100006, '868392683893', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:11', 'create',
        '2024-04-14 21:24:10', '2024-04-14 21:24:10');
INSERT INTO `user_award_record_001`
VALUES (295, 'xiaofuge', 100301, 100006, '246929840330', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:11', 'create',
        '2024-04-14 21:24:11', '2024-04-14 21:24:11');
INSERT INTO `user_award_record_001`
VALUES (296, 'xiaofuge', 100301, 100006, '732473889199', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:12', 'create',
        '2024-04-14 21:24:11', '2024-04-14 21:24:11');
INSERT INTO `user_award_record_001`
VALUES (297, 'xiaofuge', 100301, 100006, '287062696607', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:12', 'create',
        '2024-04-14 21:24:12', '2024-04-14 21:24:12');
INSERT INTO `user_award_record_001`
VALUES (298, 'xiaofuge', 100301, 100006, '529219230181', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:13', 'create',
        '2024-04-14 21:24:12', '2024-04-14 21:24:12');
INSERT INTO `user_award_record_001`
VALUES (299, 'xiaofuge', 100301, 100006, '527084805001', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:13', 'create',
        '2024-04-14 21:24:13', '2024-04-14 21:24:13');
INSERT INTO `user_award_record_001`
VALUES (300, 'xiaofuge', 100301, 100006, '323745453379', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:14', 'create',
        '2024-04-14 21:24:13', '2024-04-14 21:24:13');
INSERT INTO `user_award_record_001`
VALUES (301, 'xiaofuge', 100301, 100006, '026250714049', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:14', 'create',
        '2024-04-14 21:24:14', '2024-04-14 21:24:14');
INSERT INTO `user_award_record_001`
VALUES (302, 'xiaofuge', 100301, 100006, '158972995514', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:15', 'create',
        '2024-04-14 21:24:14', '2024-04-14 21:24:14');
INSERT INTO `user_award_record_001`
VALUES (303, 'xiaofuge', 100301, 100006, '610204470809', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:15', 'create',
        '2024-04-14 21:24:15', '2024-04-14 21:24:15');
INSERT INTO `user_award_record_001`
VALUES (304, 'xiaofuge', 100301, 100006, '708145026894', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:16', 'create',
        '2024-04-14 21:24:15', '2024-04-14 21:24:15');
INSERT INTO `user_award_record_001`
VALUES (305, 'xiaofuge', 100301, 100006, '535318552912', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:16', 'create',
        '2024-04-14 21:24:16', '2024-04-14 21:24:16');
INSERT INTO `user_award_record_001`
VALUES (306, 'xiaofuge', 100301, 100006, '133332091820', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:17', 'create',
        '2024-04-14 21:24:16', '2024-04-14 21:24:16');
INSERT INTO `user_award_record_001`
VALUES (307, 'xiaofuge', 100301, 100006, '118638363208', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:17', 'create',
        '2024-04-14 21:24:17', '2024-04-14 21:24:17');
INSERT INTO `user_award_record_001`
VALUES (308, 'xiaofuge', 100301, 100006, '746514961312', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:18', 'create',
        '2024-04-14 21:24:17', '2024-04-14 21:24:17');
INSERT INTO `user_award_record_001`
VALUES (309, 'xiaofuge', 100301, 100006, '835348395357', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:18', 'create',
        '2024-04-14 21:24:18', '2024-04-14 21:24:18');
INSERT INTO `user_award_record_001`
VALUES (310, 'xiaofuge', 100301, 100006, '496414303359', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:19', 'create',
        '2024-04-14 21:24:18', '2024-04-14 21:24:18');
INSERT INTO `user_award_record_001`
VALUES (311, 'xiaofuge', 100301, 100006, '489014335534', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:19', 'create',
        '2024-04-14 21:24:19', '2024-04-14 21:24:19');
INSERT INTO `user_award_record_001`
VALUES (312, 'xiaofuge', 100301, 100006, '185680500687', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:20', 'create',
        '2024-04-14 21:24:19', '2024-04-14 21:24:19');
INSERT INTO `user_award_record_001`
VALUES (313, 'xiaofuge', 100301, 100006, '659426246377', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:20', 'create',
        '2024-04-14 21:24:20', '2024-04-14 21:24:20');
INSERT INTO `user_award_record_001`
VALUES (314, 'xiaofuge', 100301, 100006, '707484356576', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:21', 'create',
        '2024-04-14 21:24:20', '2024-04-14 21:24:20');
INSERT INTO `user_award_record_001`
VALUES (315, 'xiaofuge', 100301, 100006, '141277617115', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:21', 'create',
        '2024-04-14 21:24:21', '2024-04-14 21:24:21');
INSERT INTO `user_award_record_001`
VALUES (316, 'xiaofuge', 100301, 100006, '087023829007', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:22', 'create',
        '2024-04-14 21:24:21', '2024-04-14 21:24:21');
INSERT INTO `user_award_record_001`
VALUES (317, 'xiaofuge', 100301, 100006, '892060070830', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:22', 'create',
        '2024-04-14 21:24:22', '2024-04-14 21:24:22');
INSERT INTO `user_award_record_001`
VALUES (318, 'xiaofuge', 100301, 100006, '074161560273', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:23', 'create',
        '2024-04-14 21:24:22', '2024-04-14 21:24:22');
INSERT INTO `user_award_record_001`
VALUES (319, 'xiaofuge', 100301, 100006, '803550588631', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:23', 'create',
        '2024-04-14 21:24:23', '2024-04-14 21:24:23');
INSERT INTO `user_award_record_001`
VALUES (320, 'xiaofuge', 100301, 100006, '858701819636', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:24', 'create',
        '2024-04-14 21:24:24', '2024-04-14 21:24:24');
INSERT INTO `user_award_record_001`
VALUES (321, 'xiaofuge', 100301, 100006, '129454280244', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:25', 'create',
        '2024-04-14 21:24:24', '2024-04-14 21:24:24');
INSERT INTO `user_award_record_001`
VALUES (322, 'xiaofuge', 100301, 100006, '905920566014', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:25', 'create',
        '2024-04-14 21:24:25', '2024-04-14 21:24:25');
INSERT INTO `user_award_record_001`
VALUES (323, 'xiaofuge', 100301, 100006, '900223487936', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:26', 'create',
        '2024-04-14 21:24:25', '2024-04-14 21:24:25');
INSERT INTO `user_award_record_001`
VALUES (324, 'xiaofuge', 100301, 100006, '141457627670', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:26', 'create',
        '2024-04-14 21:24:26', '2024-04-14 21:24:26');
INSERT INTO `user_award_record_001`
VALUES (325, 'xiaofuge', 100301, 100006, '740648467222', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:27', 'create',
        '2024-04-14 21:24:26', '2024-04-14 21:24:26');
INSERT INTO `user_award_record_001`
VALUES (326, 'xiaofuge', 100301, 100006, '050208276006', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:27', 'create',
        '2024-04-14 21:24:27', '2024-04-14 21:24:27');
INSERT INTO `user_award_record_001`
VALUES (327, 'xiaofuge', 100301, 100006, '660276305922', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:28', 'create',
        '2024-04-14 21:24:27', '2024-04-14 21:24:27');
INSERT INTO `user_award_record_001`
VALUES (328, 'xiaofuge', 100301, 100006, '587556266561', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:28', 'create',
        '2024-04-14 21:24:28', '2024-04-14 21:24:28');
INSERT INTO `user_award_record_001`
VALUES (329, 'xiaofuge', 100301, 100006, '848907748397', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:29', 'create',
        '2024-04-14 21:24:28', '2024-04-14 21:24:28');
INSERT INTO `user_award_record_001`
VALUES (330, 'xiaofuge', 100301, 100006, '504506005183', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:29', 'create',
        '2024-04-14 21:24:29', '2024-04-14 21:24:29');
INSERT INTO `user_award_record_001`
VALUES (331, 'xiaofuge', 100301, 100006, '159388139890', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:30', 'create',
        '2024-04-14 21:24:29', '2024-04-14 21:24:29');
INSERT INTO `user_award_record_001`
VALUES (332, 'xiaofuge', 100301, 100006, '667460628447', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:30', 'create',
        '2024-04-14 21:24:30', '2024-04-14 21:24:30');
INSERT INTO `user_award_record_001`
VALUES (333, 'xiaofuge', 100301, 100006, '789538703632', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:31', 'create',
        '2024-04-14 21:24:30', '2024-04-14 21:24:30');
INSERT INTO `user_award_record_001`
VALUES (334, 'xiaofuge', 100301, 100006, '933145578446', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:31', 'create',
        '2024-04-14 21:24:31', '2024-04-14 21:24:31');
INSERT INTO `user_award_record_001`
VALUES (335, 'xiaofuge', 100301, 100006, '665436421211', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:32', 'create',
        '2024-04-14 21:24:31', '2024-04-14 21:24:31');
INSERT INTO `user_award_record_001`
VALUES (336, 'xiaofuge', 100301, 100006, '080303255166', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:32', 'create',
        '2024-04-14 21:24:32', '2024-04-14 21:24:32');
INSERT INTO `user_award_record_001`
VALUES (337, 'xiaofuge', 100301, 100006, '571539037023', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:33', 'create',
        '2024-04-14 21:24:32', '2024-04-14 21:24:32');
INSERT INTO `user_award_record_001`
VALUES (338, 'xiaofuge', 100301, 100006, '914625441238', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:33', 'create',
        '2024-04-14 21:24:33', '2024-04-14 21:24:33');
INSERT INTO `user_award_record_001`
VALUES (339, 'xiaofuge', 100301, 100006, '188774111506', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:34', 'create',
        '2024-04-14 21:24:33', '2024-04-14 21:24:33');
INSERT INTO `user_award_record_001`
VALUES (340, 'xiaofuge', 100301, 100006, '494065869339', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:34', 'create',
        '2024-04-14 21:24:34', '2024-04-14 21:24:34');
INSERT INTO `user_award_record_001`
VALUES (341, 'xiaofuge', 100301, 100006, '652354106065', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:35', 'create',
        '2024-04-14 21:24:34', '2024-04-14 21:24:34');
INSERT INTO `user_award_record_001`
VALUES (342, 'xiaofuge', 100301, 100006, '528086000553', 101, 'OpenAI 增加使用次数', '2024-04-14 13:24:35', 'create',
        '2024-04-14 21:24:35', '2024-04-14 21:24:35');
INSERT INTO `user_award_record_001`
VALUES (345, 'xiaofuge', 100301, 100006, '313091076458', 107, '2等奖', '2024-04-16 09:57:59', 'create',
        '2024-04-16 17:57:58', '2024-04-16 17:57:58');
INSERT INTO `user_award_record_001`
VALUES (350, 'xiaofuge', 100301, 100006, '615085528101', 108, '1等奖', '2024-04-16 10:30:14', 'create',
        '2024-04-16 18:30:14', '2024-04-16 18:30:14');
INSERT INTO `user_award_record_001`
VALUES (351, 'xiaofuge', 100301, 100006, '399563191551', 104, '5等奖', '2024-04-16 10:30:17', 'create',
        '2024-04-16 18:30:16', '2024-04-16 18:30:16');
INSERT INTO `user_award_record_001`
VALUES (352, 'xiaofuge', 100301, 100006, '920549566808', 103, '6等奖', '2024-04-16 10:30:17', 'create',
        '2024-04-16 18:30:17', '2024-04-16 18:30:17');
INSERT INTO `user_award_record_001`
VALUES (353, 'xiaofuge', 100301, 100006, '721968614679', 107, '2等奖', '2024-04-16 10:30:18', 'create',
        '2024-04-16 18:30:18', '2024-04-16 18:30:18');
INSERT INTO `user_award_record_001`
VALUES (354, 'xiaofuge', 100301, 100006, '513063570114', 103, '6等奖', '2024-04-16 10:30:27', 'create',
        '2024-04-16 18:30:26', '2024-04-16 18:30:26');
INSERT INTO `user_award_record_001`
VALUES (355, 'xiaofuge', 100301, 100006, '408842022544', 108, '1等奖', '2024-04-16 10:30:36', 'create',
        '2024-04-16 18:30:36', '2024-04-16 18:30:36');
INSERT INTO `user_award_record_001`
VALUES (356, 'xiaofuge', 100301, 100006, '242700308687', 104, '5等奖', '2024-04-16 11:27:09', 'create',
        '2024-04-16 19:27:09', '2024-04-16 19:27:09');
INSERT INTO `user_award_record_001`
VALUES (357, 'xiaofuge', 100301, 100006, '223444445928', 101, '随机积分', '2024-04-16 11:27:10', 'create',
        '2024-04-16 19:27:10', '2024-04-16 19:27:10');
INSERT INTO `user_award_record_001`
VALUES (358, 'xiaofuge', 100301, 100006, '243039342622', 101, '随机积分', '2024-04-16 11:27:11', 'create',
        '2024-04-16 19:27:11', '2024-04-16 19:27:11');
INSERT INTO `user_award_record_001`
VALUES (359, 'xiaofuge', 100301, 100006, '625067212608', 104, '5等奖', '2024-04-16 11:27:12', 'create',
        '2024-04-16 19:27:11', '2024-04-16 19:27:11');
INSERT INTO `user_award_record_001`
VALUES (360, 'xiaofuge', 100301, 100006, '184866962414', 101, '随机积分', '2024-04-16 11:27:13', 'create',
        '2024-04-16 19:27:12', '2024-04-16 19:27:12');
INSERT INTO `user_award_record_001`
VALUES (361, 'xiaofuge', 100301, 100006, '251634372968', 102, '7等奖', '2024-04-16 11:27:13', 'create',
        '2024-04-16 19:27:13', '2024-04-16 19:27:13');
INSERT INTO `user_award_record_001`
VALUES (362, 'xiaofuge', 100301, 100006, '478502194266', 101, '随机积分', '2024-04-16 11:27:14', 'create',
        '2024-04-16 19:27:14', '2024-04-16 19:27:14');
INSERT INTO `user_award_record_001`
VALUES (363, 'xiaofuge', 100301, 100006, '011317059639', 101, '随机积分', '2024-04-16 11:27:15', 'create',
        '2024-04-16 19:27:14', '2024-04-16 19:27:14');
INSERT INTO `user_award_record_001`
VALUES (364, 'xiaofuge', 100301, 100006, '960221936802', 105, '4等奖', '2024-04-16 11:27:15', 'create',
        '2024-04-16 19:27:15', '2024-04-16 19:27:15');
INSERT INTO `user_award_record_001`
VALUES (365, 'xiaofuge', 100301, 100006, '282429153222', 105, '4等奖', '2024-04-16 11:27:16', 'create',
        '2024-04-16 19:27:15', '2024-04-16 19:27:15');
INSERT INTO `user_award_record_001`
VALUES (366, 'xiaofuge', 100301, 100006, '096637243029', 105, '4等奖', '2024-04-16 11:27:16', 'create',
        '2024-04-16 19:27:16', '2024-04-16 19:27:16');
INSERT INTO `user_award_record_001`
VALUES (367, 'xiaofuge', 100301, 100006, '395668378736', 101, '随机积分', '2024-04-16 11:27:17', 'create',
        '2024-04-16 19:27:16', '2024-04-16 19:27:16');
INSERT INTO `user_award_record_001`
VALUES (368, 'xiaofuge', 100301, 100006, '646746807910', 105, '4等奖', '2024-04-16 11:27:17', 'create',
        '2024-04-16 19:27:17', '2024-04-16 19:27:17');
INSERT INTO `user_award_record_001`
VALUES (369, 'xiaofuge', 100301, 100006, '664587256470', 101, '随机积分', '2024-04-16 11:27:18', 'create',
        '2024-04-16 19:27:17', '2024-04-16 19:27:17');
INSERT INTO `user_award_record_001`
VALUES (370, 'xiaofuge', 100301, 100006, '854977590108', 102, '7等奖', '2024-04-16 11:27:18', 'create',
        '2024-04-16 19:27:18', '2024-04-16 19:27:18');
INSERT INTO `user_award_record_001`
VALUES (371, 'xiaofuge', 100301, 100006, '248627555160', 101, '随机积分', '2024-04-16 11:27:19', 'create',
        '2024-04-16 19:27:18', '2024-04-16 19:27:18');
INSERT INTO `user_award_record_001`
VALUES (372, 'xiaofuge', 100301, 100006, '425252873958', 102, '7等奖', '2024-04-16 11:27:19', 'create',
        '2024-04-16 19:27:19', '2024-04-16 19:27:19');
INSERT INTO `user_award_record_001`
VALUES (373, 'xiaofuge', 100301, 100006, '637890105298', 102, '7等奖', '2024-04-16 11:28:28', 'create',
        '2024-04-16 19:28:28', '2024-04-16 19:28:28');
INSERT INTO `user_award_record_001`
VALUES (374, 'xiaofuge', 100301, 100006, '921480370583', 103, '6等奖', '2024-04-16 11:28:30', 'create',
        '2024-04-16 19:28:29', '2024-04-16 19:28:29');
INSERT INTO `user_award_record_001`
VALUES (375, 'xiaofuge', 100301, 100006, '230227786958', 101, '随机积分', '2024-04-16 11:28:30', 'create',
        '2024-04-16 19:28:30', '2024-04-16 19:28:30');
INSERT INTO `user_award_record_001`
VALUES (376, 'xiaofuge', 100301, 100006, '228858915993', 105, '4等奖', '2024-04-16 11:29:02', 'create',
        '2024-04-16 19:29:02', '2024-04-16 19:29:02');
INSERT INTO `user_award_record_001`
VALUES (377, 'xiaofuge', 100301, 100006, '293947655731', 107, '2等奖', '2024-04-16 11:29:03', 'create',
        '2024-04-16 19:29:02', '2024-04-16 19:29:02');
INSERT INTO `user_award_record_001`
VALUES (378, 'xiaofuge', 100301, 100006, '778430601457', 101, '随机积分', '2024-04-16 11:29:05', 'create',
        '2024-04-16 19:29:05', '2024-04-16 19:29:05');
INSERT INTO `user_award_record_001`
VALUES (379, 'xiaofuge', 100301, 100006, '286547252015', 103, '6等奖', '2024-04-16 11:29:06', 'create',
        '2024-04-16 19:29:05', '2024-04-16 19:29:05');
INSERT INTO `user_award_record_001`
VALUES (380, 'xiaofuge', 100301, 100006, '736808185119', 102, '7等奖', '2024-04-16 11:29:06', 'create',
        '2024-04-16 19:29:06', '2024-04-16 19:29:06');
INSERT INTO `user_award_record_001`
VALUES (381, 'xiaofuge', 100301, 100006, '621417252003', 107, '2等奖', '2024-04-16 11:29:07', 'create',
        '2024-04-16 19:29:07', '2024-04-16 19:29:07');
INSERT INTO `user_award_record_001`
VALUES (382, 'xiaofuge', 100301, 100006, '839164757694', 102, '7等奖', '2024-04-16 11:36:54', 'create',
        '2024-04-16 19:36:54', '2024-04-16 19:36:54');
INSERT INTO `user_award_record_001`
VALUES (383, 'xiaofuge', 100301, 100006, '102648043530', 106, '3等奖', '2024-04-16 11:36:55', 'create',
        '2024-04-16 19:36:54', '2024-04-16 19:36:54');
INSERT INTO `user_award_record_001`
VALUES (384, 'xiaofuge', 100301, 100006, '257878905072', 106, '3等奖', '2024-04-16 11:43:36', 'create',
        '2024-04-16 19:43:36', '2024-04-16 19:43:36');
INSERT INTO `user_award_record_001`
VALUES (385, 'xiaofuge', 100301, 100006, '801308310329', 108, '1等奖', '2024-04-16 11:45:31', 'create',
        '2024-04-16 19:45:31', '2024-04-16 19:45:31');
INSERT INTO `user_award_record_001`
VALUES (386, 'xiaofuge', 100301, 100006, '239361243225', 104, '5等奖', '2024-04-16 11:45:32', 'create',
        '2024-04-16 19:45:31', '2024-04-16 19:45:31');
INSERT INTO `user_award_record_001`
VALUES (387, 'xiaofuge', 100301, 100006, '982242155291', 106, '3等奖', '2024-04-16 11:45:32', 'create',
        '2024-04-16 19:45:32', '2024-04-16 19:45:32');
INSERT INTO `user_award_record_001`
VALUES (388, 'xiaofuge', 100301, 100006, '459592481371', 107, '2等奖', '2024-04-16 11:45:33', 'create',
        '2024-04-16 19:45:32', '2024-04-16 19:45:32');
INSERT INTO `user_award_record_001`
VALUES (389, 'xiaofuge', 100301, 100006, '348486191870', 105, '4等奖', '2024-04-16 11:45:33', 'create',
        '2024-04-16 19:45:33', '2024-04-16 19:45:33');
INSERT INTO `user_award_record_001`
VALUES (390, 'xiaofuge', 100301, 100006, '007209317899', 102, '7等奖', '2024-04-16 11:45:34', 'create',
        '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `user_award_record_001`
VALUES (391, 'xiaofuge', 100301, 100006, '775707959632', 103, '6等奖', '2024-04-16 11:45:35', 'create',
        '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `user_award_record_001`
VALUES (392, 'xiaofuge', 100301, 100006, '506568253078', 105, '4等奖', '2024-04-16 11:45:35', 'create',
        '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `user_award_record_001`
VALUES (393, 'xiaofuge', 100301, 100006, '000635924731', 108, '1等奖', '2024-04-16 11:45:35', 'create',
        '2024-04-16 19:45:35', '2024-04-16 19:45:35');
INSERT INTO `user_award_record_001`
VALUES (394, 'xiaofuge', 100301, 100006, '128588322577', 103, '6等奖', '2024-04-16 11:45:36', 'create',
        '2024-04-16 19:45:35', '2024-04-16 19:45:35');
INSERT INTO `user_award_record_001`
VALUES (395, 'xiaofuge', 100301, 100006, '933734192385', 102, '7等奖', '2024-04-16 11:45:36', 'create',
        '2024-04-16 19:45:36', '2024-04-16 19:45:36');
INSERT INTO `user_award_record_001`
VALUES (396, 'xiaofuge', 100301, 100006, '944755097295', 103, '6等奖', '2024-04-16 11:46:06', 'create',
        '2024-04-16 19:46:06', '2024-04-16 19:46:06');
INSERT INTO `user_award_record_001`
VALUES (397, 'xiaofuge', 100301, 100006, '360027972721', 105, '4等奖', '2024-04-16 11:46:14', 'create',
        '2024-04-16 19:46:13', '2024-04-16 19:46:13');
INSERT INTO `user_award_record_001`
VALUES (398, 'xiaofuge', 100301, 100006, '313775415836', 108, '1等奖', '2024-04-16 11:46:20', 'create',
        '2024-04-16 19:46:20', '2024-04-16 19:46:20');
INSERT INTO `user_award_record_001`
VALUES (399, 'xiaofuge', 100301, 100006, '834348744242', 103, '6等奖', '2024-04-16 11:47:01', 'create',
        '2024-04-16 19:47:00', '2024-04-16 19:47:00');
INSERT INTO `user_award_record_001`
VALUES (400, 'xiaofuge', 100301, 100006, '336272473433', 103, '6等奖', '2024-04-16 11:47:09', 'create',
        '2024-04-16 19:47:09', '2024-04-16 19:47:09');
INSERT INTO `user_award_record_001`
VALUES (401, 'xiaofuge', 100301, 100006, '461751642328', 101, '随机积分', '2024-04-16 11:47:10', 'create',
        '2024-04-16 19:47:10', '2024-04-16 19:47:10');
INSERT INTO `user_award_record_001`
VALUES (402, 'xiaofuge', 100301, 100006, '455208346781', 105, '4等奖', '2024-04-16 11:48:27', 'create',
        '2024-04-16 19:48:26', '2024-04-16 19:48:26');
INSERT INTO `user_award_record_001`
VALUES (403, 'xiaofuge', 100301, 100006, '090190683977', 101, '随机积分', '2024-04-16 11:48:28', 'create',
        '2024-04-16 19:48:28', '2024-04-16 19:48:28');
INSERT INTO `user_award_record_001`
VALUES (404, 'xiaofuge', 100301, 100006, '323999803802', 103, '6等奖', '2024-04-16 11:50:43', 'create',
        '2024-04-16 19:50:43', '2024-04-16 19:50:43');
INSERT INTO `user_award_record_001`
VALUES (405, 'xiaofuge', 100301, 100006, '401774544075', 102, '7等奖', '2024-04-16 11:50:44', 'create',
        '2024-04-16 19:50:44', '2024-04-16 19:50:44');
INSERT INTO `user_award_record_001`
VALUES (406, 'xiaofuge', 100301, 100006, '518277384304', 105, '4等奖', '2024-04-16 11:50:45', 'create',
        '2024-04-16 19:50:44', '2024-04-16 19:50:44');
INSERT INTO `user_award_record_001`
VALUES (407, 'xiaofuge', 100301, 100006, '227287996702', 102, '7等奖', '2024-04-16 11:50:46', 'create',
        '2024-04-16 19:50:45', '2024-04-16 19:50:45');
INSERT INTO `user_award_record_001`
VALUES (408, 'xiaofuge', 100301, 100006, '536821954082', 101, '随机积分', '2024-04-16 11:50:47', 'create',
        '2024-04-16 19:50:46', '2024-04-16 19:50:46');
INSERT INTO `user_award_record_001`
VALUES (409, 'xiaofuge', 100301, 100006, '202151786198', 101, '随机积分', '2024-04-16 11:52:24', 'create',
        '2024-04-16 19:52:23', '2024-04-16 19:52:23');
INSERT INTO `user_award_record_001`
VALUES (410, 'xiaofuge', 100301, 100006, '503104733306', 102, '7等奖', '2024-04-16 11:52:27', 'create',
        '2024-04-16 19:52:27', '2024-04-16 19:52:27');
INSERT INTO `user_award_record_001`
VALUES (411, 'xiaofuge', 100301, 100006, '444312518718', 105, '4等奖', '2024-04-16 12:00:26', 'create',
        '2024-04-16 20:00:26', '2024-04-16 20:00:26');
INSERT INTO `user_award_record_001`
VALUES (412, 'xiaofuge', 100301, 100006, '293482019626', 101, '随机积分', '2024-04-16 12:00:27', 'create',
        '2024-04-16 20:00:27', '2024-04-16 20:00:27');
INSERT INTO `user_award_record_001`
VALUES (413, 'xiaofuge', 100301, 100006, '816076535561', 103, '6等奖', '2024-04-16 12:00:28', 'create',
        '2024-04-16 20:00:27', '2024-04-16 20:00:27');
INSERT INTO `user_award_record_001`
VALUES (414, 'xiaofuge', 100301, 100006, '878541717140', 104, '5等奖', '2024-04-16 12:00:28', 'create',
        '2024-04-16 20:00:28', '2024-04-16 20:00:28');
INSERT INTO `user_award_record_001`
VALUES (415, 'xiaofuge', 100301, 100006, '400324699281', 101, '随机积分', '2024-04-16 12:00:29', 'create',
        '2024-04-16 20:00:28', '2024-04-16 20:00:28');
INSERT INTO `user_award_record_001`
VALUES (416, 'xiaofuge', 100301, 100006, '252478882129', 101, '随机积分', '2024-04-16 12:00:29', 'create',
        '2024-04-16 20:00:29', '2024-04-16 20:00:29');
INSERT INTO `user_award_record_001`
VALUES (417, 'xiaofuge', 100301, 100006, '518195328826', 103, '6等奖', '2024-04-16 12:00:30', 'create',
        '2024-04-16 20:00:29', '2024-04-16 20:00:29');
INSERT INTO `user_award_record_001`
VALUES (418, 'xiaofuge', 100301, 100006, '964961899096', 102, '7等奖', '2024-04-16 12:00:30', 'create',
        '2024-04-16 20:00:30', '2024-04-16 20:00:30');
INSERT INTO `user_award_record_001`
VALUES (419, 'xiaofuge', 100301, 100006, '745921218744', 102, '7等奖', '2024-04-16 12:00:31', 'create',
        '2024-04-16 20:00:30', '2024-04-16 20:00:30');
INSERT INTO `user_award_record_001`
VALUES (420, 'xiaofuge', 100301, 100006, '428051896072', 102, '7等奖', '2024-04-16 12:00:31', 'create',
        '2024-04-16 20:00:31', '2024-04-16 20:00:31');
INSERT INTO `user_award_record_001`
VALUES (421, 'xiaofuge', 100301, 100006, '755184367840', 101, '随机积分', '2024-04-16 12:00:32', 'create',
        '2024-04-16 20:00:31', '2024-04-16 20:00:31');
INSERT INTO `user_award_record_001`
VALUES (422, 'xiaofuge', 100301, 100006, '883260334180', 101, '随机积分', '2024-04-16 12:00:32', 'create',
        '2024-04-16 20:00:32', '2024-04-16 20:00:32');
INSERT INTO `user_award_record_001`
VALUES (423, 'xiaofuge', 100301, 100006, '313484595698', 101, '随机积分', '2024-04-16 12:00:33', 'create',
        '2024-04-16 20:00:32', '2024-04-16 20:00:32');
INSERT INTO `user_award_record_001`
VALUES (424, 'xiaofuge', 100301, 100006, '494855090202', 101, '随机积分', '2024-04-16 12:00:33', 'create',
        '2024-04-16 20:00:33', '2024-04-16 20:00:33');
INSERT INTO `user_award_record_001`
VALUES (425, 'xiaofuge', 100301, 100006, '698332412648', 107, '2等奖', '2024-04-16 12:00:34', 'create',
        '2024-04-16 20:00:33', '2024-04-16 20:00:33');
INSERT INTO `user_award_record_001`
VALUES (426, 'xiaofuge', 100301, 100006, '923640245980', 101, '随机积分', '2024-04-16 12:00:43', 'create',
        '2024-04-16 20:00:43', '2024-04-16 20:00:43');
INSERT INTO `user_award_record_001`
VALUES (427, 'xiaofuge', 100301, 100006, '102108411006', 106, '3等奖', '2024-04-16 12:00:58', 'create',
        '2024-04-16 20:00:58', '2024-04-16 20:00:58');
INSERT INTO `user_award_record_001`
VALUES (428, 'xiaofuge', 100301, 100006, '418363306217', 104, '5等奖', '2024-04-16 12:00:59', 'create',
        '2024-04-16 20:00:58', '2024-04-16 20:00:58');
INSERT INTO `user_award_record_001`
VALUES (429, 'xiaofuge', 100301, 100006, '394387287437', 108, '1等奖', '2024-04-16 12:01:00', 'create',
        '2024-04-16 20:01:00', '2024-04-16 20:01:00');
INSERT INTO `user_award_record_001`
VALUES (430, 'xiaofuge', 100301, 100006, '198230526034', 108, '1等奖', '2024-04-16 12:01:01', 'create',
        '2024-04-16 20:01:00', '2024-04-16 20:01:00');
INSERT INTO `user_award_record_001`
VALUES (431, 'xiaofuge', 100301, 100006, '741350699262', 106, '3等奖', '2024-04-16 12:01:01', 'create',
        '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `user_award_record_001`
VALUES (432, 'xiaofuge', 100301, 100006, '061239541486', 107, '2等奖', '2024-04-16 12:01:02', 'create',
        '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `user_award_record_001`
VALUES (433, 'xiaofuge', 100301, 100006, '236226143627', 101, '随机积分', '2024-04-16 12:01:02', 'create',
        '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `user_award_record_001`
VALUES (434, 'xiaofuge', 100301, 100006, '956963423680', 101, '随机积分', '2024-04-16 12:01:02', 'create',
        '2024-04-16 20:01:02', '2024-04-16 20:01:02');
INSERT INTO `user_award_record_001`
VALUES (435, 'xiaofuge', 100301, 100006, '388834492211', 108, '1等奖', '2024-04-16 12:01:03', 'create',
        '2024-04-16 20:01:02', '2024-04-16 20:01:02');
INSERT INTO `user_award_record_001`
VALUES (436, 'xiaofuge', 100301, 100006, '706787629999', 108, '1等奖', '2024-04-16 12:01:03', 'create',
        '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `user_award_record_001`
VALUES (437, 'xiaofuge', 100301, 100006, '493668005723', 103, '6等奖', '2024-04-16 12:01:04', 'create',
        '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `user_award_record_001`
VALUES (438, 'xiaofuge', 100301, 100006, '064908102891', 105, '4等奖', '2024-04-16 12:01:04', 'create',
        '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `user_award_record_001`
VALUES (439, 'xiaofuge', 100301, 100006, '067088758189', 108, '1等奖', '2024-04-16 12:01:04', 'create',
        '2024-04-16 20:01:04', '2024-04-16 20:01:04');
INSERT INTO `user_award_record_001`
VALUES (440, 'xiaofuge', 100301, 100006, '644100987551', 107, '2等奖', '2024-04-16 12:01:09', 'create',
        '2024-04-16 20:01:09', '2024-04-16 20:01:09');
INSERT INTO `user_award_record_001`
VALUES (441, 'xiaofuge', 100301, 100006, '651076021848', 101, '随机积分', '2024-04-16 12:01:10', 'create',
        '2024-04-16 20:01:09', '2024-04-16 20:01:09');
INSERT INTO `user_award_record_001`
VALUES (442, 'xiaofuge', 100301, 100006, '509447002787', 104, '5等奖', '2024-04-16 12:01:10', 'create',
        '2024-04-16 20:01:10', '2024-04-16 20:01:10');
INSERT INTO `user_award_record_001`
VALUES (443, 'xiaofuge', 100301, 100006, '563941619133', 104, '5等奖', '2024-04-16 12:01:11', 'create',
        '2024-04-16 20:01:10', '2024-04-16 20:01:10');
INSERT INTO `user_award_record_001`
VALUES (444, 'xiaofuge', 100301, 100006, '075673941243', 104, '5等奖', '2024-04-16 12:20:44', 'create',
        '2024-04-16 20:20:44', '2024-04-16 20:20:44');
INSERT INTO `user_award_record_001`
VALUES (445, 'xiaofuge', 100301, 100006, '042511738046', 101, '随机积分', '2024-04-16 12:22:06', 'create',
        '2024-04-16 20:22:05', '2024-04-16 20:22:05');
INSERT INTO `user_award_record_001`
VALUES (446, 'xiaofuge', 100301, 100006, '580022051242', 104, '5等奖', '2024-04-16 12:22:28', 'create',
        '2024-04-16 20:22:28', '2024-04-16 20:22:28');
INSERT INTO `user_award_record_001`
VALUES (447, 'xiaofuge', 100301, 100006, '422542624189', 102, '7等奖', '2024-04-16 12:25:53', 'create',
        '2024-04-16 20:25:53', '2024-04-16 20:25:53');
INSERT INTO `user_award_record_001`
VALUES (448, 'xiaofuge', 100301, 100006, '386176696010', 104, '5等奖', '2024-04-16 12:26:16', 'create',
        '2024-04-16 20:26:16', '2024-04-16 20:26:16');
INSERT INTO `user_award_record_001`
VALUES (449, 'xiaofuge', 100301, 100006, '682133402331', 103, '6等奖', '2024-04-16 12:26:17', 'create',
        '2024-04-16 20:26:17', '2024-04-16 20:26:17');
INSERT INTO `user_award_record_001`
VALUES (450, 'xiaofuge', 100301, 100006, '697609567403', 102, '7等奖', '2024-04-16 12:26:18', 'create',
        '2024-04-16 20:26:17', '2024-04-16 20:26:17');
INSERT INTO `user_award_record_001`
VALUES (451, 'xiaofuge', 100301, 100006, '901759999669', 105, '4等奖', '2024-04-16 12:26:19', 'create',
        '2024-04-16 20:26:18', '2024-04-16 20:26:18');
INSERT INTO `user_award_record_001`
VALUES (452, 'xiaofuge', 100301, 100006, '801021133965', 104, '5等奖', '2024-04-16 12:26:19', 'create',
        '2024-04-16 20:26:19', '2024-04-16 20:26:19');
INSERT INTO `user_award_record_001`
VALUES (453, 'xiaofuge', 100301, 100006, '364277406059', 105, '4等奖', '2024-04-16 12:26:20', 'create',
        '2024-04-16 20:26:19', '2024-04-16 20:26:19');
INSERT INTO `user_award_record_001`
VALUES (454, 'xiaofuge', 100301, 100006, '978944814947', 105, '4等奖', '2024-04-16 12:27:00', 'create',
        '2024-04-16 20:27:00', '2024-04-16 20:27:00');
INSERT INTO `user_award_record_001`
VALUES (455, 'xiaofuge', 100301, 100006, '798857082613', 108, '1等奖', '2024-04-16 12:27:01', 'create',
        '2024-04-16 20:27:00', '2024-04-16 20:27:00');
INSERT INTO `user_award_record_001`
VALUES (456, 'xiaofuge', 100301, 100006, '454716306171', 101, '随机积分', '2024-04-16 12:27:01', 'create',
        '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `user_award_record_001`
VALUES (457, 'xiaofuge', 100301, 100006, '974072865739', 107, '2等奖', '2024-04-16 12:27:02', 'create',
        '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `user_award_record_001`
VALUES (458, 'xiaofuge', 100301, 100006, '528448204228', 104, '5等奖', '2024-04-16 12:27:02', 'create',
        '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `user_award_record_001`
VALUES (459, 'xiaofuge', 100301, 100006, '351748749091', 102, '7等奖', '2024-04-16 12:27:02', 'create',
        '2024-04-16 20:27:02', '2024-04-16 20:27:02');
INSERT INTO `user_award_record_001`
VALUES (460, 'xiaofuge', 100301, 100006, '186969943723', 102, '7等奖', '2024-04-16 12:27:03', 'create',
        '2024-04-16 20:27:02', '2024-04-16 20:27:02');
INSERT INTO `user_award_record_001`
VALUES (461, 'xiaofuge', 100301, 100006, '984730604395', 106, '3等奖', '2024-04-16 12:27:03', 'create',
        '2024-04-16 20:27:03', '2024-04-16 20:27:03');
INSERT INTO `user_award_record_001`
VALUES (462, 'xiaofuge', 100301, 100006, '758577431458', 103, '6等奖', '2024-04-16 12:27:04', 'create',
        '2024-04-16 20:27:03', '2024-04-16 20:27:03');
INSERT INTO `user_award_record_001`
VALUES (463, 'xiaofuge', 100301, 100006, '149407472091', 101, '随机积分', '2024-04-16 12:27:04', 'create',
        '2024-04-16 20:27:04', '2024-04-16 20:27:04');
INSERT INTO `user_award_record_001`
VALUES (464, 'xiaofuge', 100301, 100006, '739746858194', 104, '5等奖', '2024-04-16 13:10:11', 'create',
        '2024-04-16 21:10:10', '2024-04-16 21:10:10');
INSERT INTO `user_award_record_001`
VALUES (465, 'xiaofuge', 100301, 100006, '069564772366', 105, '4等奖', '2024-04-16 13:10:12', 'create',
        '2024-04-16 21:10:12', '2024-04-16 21:10:12');
INSERT INTO `user_award_record_001`
VALUES (466, 'xiaofuge', 100301, 100006, '073364537170', 102, '7等奖', '2024-04-16 13:10:13', 'create',
        '2024-04-16 21:10:12', '2024-04-16 21:10:12');
INSERT INTO `user_award_record_001`
VALUES (467, 'xiaofuge', 100301, 100006, '735184202188', 101, '随机积分', '2024-04-16 13:10:13', 'create',
        '2024-04-16 21:10:13', '2024-04-16 21:10:13');
INSERT INTO `user_award_record_001`
VALUES (468, 'xiaofuge', 100301, 100006, '478379900972', 105, '4等奖', '2024-04-16 13:10:14', 'create',
        '2024-04-16 21:10:13', '2024-04-16 21:10:13');
INSERT INTO `user_award_record_001`
VALUES (469, 'xiaofuge', 100301, 100006, '708608427147', 101, '随机积分', '2024-04-16 13:10:14', 'create',
        '2024-04-16 21:10:14', '2024-04-16 21:10:14');
INSERT INTO `user_award_record_001`
VALUES (470, 'xiaofuge', 100301, 100006, '002534966954', 101, '随机积分', '2024-04-16 13:10:15', 'create',
        '2024-04-16 21:10:14', '2024-04-16 21:10:14');
INSERT INTO `user_award_record_001`
VALUES (471, 'xiaofuge', 100301, 100006, '123567253104', 102, '7等奖', '2024-04-16 13:10:15', 'create',
        '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `user_award_record_001`
VALUES (472, 'xiaofuge', 100301, 100006, '799052343025', 104, '5等奖', '2024-04-16 13:10:16', 'create',
        '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `user_award_record_001`
VALUES (473, 'xiaofuge', 100301, 100006, '337537967551', 102, '7等奖', '2024-04-16 13:10:16', 'create',
        '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `user_award_record_001`
VALUES (474, 'xiaofuge', 100301, 100006, '083208343605', 103, '6等奖', '2024-04-16 13:10:16', 'create',
        '2024-04-16 21:10:16', '2024-04-16 21:10:16');
INSERT INTO `user_award_record_001`
VALUES (475, 'xiaofuge', 100301, 100006, '651110440755', 103, '6等奖', '2024-04-16 13:10:17', 'create',
        '2024-04-16 21:10:16', '2024-04-16 21:10:16');
INSERT INTO `user_award_record_001`
VALUES (476, 'xiaofuge', 100301, 100006, '971219832040', 105, '4等奖', '2024-04-16 13:14:15', 'create',
        '2024-04-16 21:14:15', '2024-04-16 21:14:15');
INSERT INTO `user_award_record_001`
VALUES (477, 'xiaofuge', 100301, 100006, '156686831122', 101, '随机积分', '2024-04-16 13:14:31', 'create',
        '2024-04-16 21:14:31', '2024-04-16 21:14:31');
INSERT INTO `user_award_record_001`
VALUES (478, 'xiaofuge', 100301, 100006, '752161888163', 101, '随机积分', '2024-04-16 13:16:47', 'create',
        '2024-04-16 21:16:47', '2024-04-16 21:16:47');
INSERT INTO `user_award_record_001`
VALUES (479, 'xiaofuge', 100301, 100006, '643118972351', 101, '随机积分', '2024-04-24 11:38:31', 'create',
        '2024-04-24 19:38:30', '2024-04-24 19:38:30');
INSERT INTO `user_award_record_001`
VALUES (480, 'xiaofuge', 100301, 100006, '695413065940', 101, '随机积分', '2024-04-24 11:38:35', 'create',
        '2024-04-24 19:38:34', '2024-04-24 19:38:34');
INSERT INTO `user_award_record_001`
VALUES (481, 'xiaofuge', 100301, 100006, '712337688827', 104, '5等奖', '2024-04-24 11:38:35', 'create',
        '2024-04-24 19:38:35', '2024-04-24 19:38:35');
INSERT INTO `user_award_record_001`
VALUES (482, 'xiaofuge', 100301, 100006, '559207176141', 101, '随机积分', '2024-04-24 11:38:36', 'create',
        '2024-04-24 19:38:36', '2024-04-24 19:38:36');
INSERT INTO `user_award_record_001`
VALUES (483, 'xiaofuge', 100301, 100006, '112844379183', 104, '5等奖', '2024-04-24 11:38:37', 'create',
        '2024-04-24 19:38:36', '2024-04-24 19:38:36');
INSERT INTO `user_award_record_001`
VALUES (484, 'xiaofuge', 100301, 100006, '515668944329', 102, '7等奖', '2024-04-24 11:38:37', 'create',
        '2024-04-24 19:38:37', '2024-04-24 19:38:37');
INSERT INTO `user_award_record_001`
VALUES (485, 'xiaofuge', 100301, 100006, '956602156443', 105, '4等奖', '2024-04-24 11:46:47', 'create',
        '2024-04-24 19:46:46', '2024-04-24 19:46:46');
INSERT INTO `user_award_record_001`
VALUES (486, 'xiaofuge', 100301, 100006, '981680217441', 103, '6等奖', '2024-04-24 11:47:15', 'create',
        '2024-04-24 19:47:14', '2024-04-24 19:47:14');
INSERT INTO `user_award_record_001`
VALUES (487, 'xiaofuge', 100301, 100006, '399734717121', 105, '4等奖', '2024-04-24 11:47:15', 'create',
        '2024-04-24 19:47:15', '2024-04-24 19:47:15');
INSERT INTO `user_award_record_001`
VALUES (488, 'xiaofuge', 100301, 100006, '728611967870', 104, '5等奖', '2024-04-24 11:47:16', 'create',
        '2024-04-24 19:47:15', '2024-04-24 19:47:15');
INSERT INTO `user_award_record_001`
VALUES (489, 'xiaofuge', 100301, 100006, '094605855857', 101, '随机积分', '2024-04-24 11:47:16', 'create',
        '2024-04-24 19:47:16', '2024-04-24 19:47:16');
INSERT INTO `user_award_record_001`
VALUES (490, 'xiaofuge', 100301, 100006, '848386699696', 106, '3等奖', '2024-04-24 11:47:17', 'create',
        '2024-04-24 19:47:16', '2024-04-24 19:47:16');
INSERT INTO `user_award_record_001`
VALUES (491, 'xiaofuge', 100301, 100006, '472054004647', 106, '3等奖', '2024-04-24 11:50:52', 'create',
        '2024-04-24 19:50:52', '2024-04-24 19:50:52');
INSERT INTO `user_award_record_001`
VALUES (492, 'xiaofuge', 100301, 100006, '122567739619', 102, '7等奖', '2024-04-24 11:50:53', 'create',
        '2024-04-24 19:50:52', '2024-04-24 19:50:52');
INSERT INTO `user_award_record_001`
VALUES (493, 'xiaofuge', 100301, 100006, '411030832305', 106, '3等奖', '2024-04-24 11:50:54', 'create',
        '2024-04-24 19:50:53', '2024-04-24 19:50:53');
INSERT INTO `user_award_record_001`
VALUES (494, 'xiaofuge', 100301, 100006, '652705207303', 103, '6等奖', '2024-04-24 11:50:54', 'create',
        '2024-04-24 19:50:54', '2024-04-24 19:50:54');
INSERT INTO `user_award_record_001`
VALUES (495, 'xiaofuge', 100301, 100006, '165693794606', 107, '2等奖', '2024-04-24 11:50:55', 'create',
        '2024-04-24 19:50:55', '2024-04-24 19:50:55');
INSERT INTO `user_award_record_001`
VALUES (496, 'xiaofuge', 100301, 100006, '678819665907', 103, '6等奖', '2024-04-24 11:50:56', 'create',
        '2024-04-24 19:50:55', '2024-04-24 19:50:55');
INSERT INTO `user_award_record_001`
VALUES (497, 'xiaofuge', 100301, 100006, '644844776894', 108, '1等奖', '2024-04-24 11:50:56', 'create',
        '2024-04-24 19:50:56', '2024-04-24 19:50:56');
INSERT INTO `user_award_record_001`
VALUES (498, 'xiaofuge', 100301, 100006, '219183955813', 107, '2等奖', '2024-04-24 11:50:57', 'create',
        '2024-04-24 19:50:56', '2024-04-24 19:50:56');
INSERT INTO `user_award_record_001`
VALUES (499, 'xiaofuge', 100301, 100006, '070714513955', 102, '7等奖', '2024-04-24 11:50:58', 'create',
        '2024-04-24 19:50:57', '2024-04-24 19:50:57');
INSERT INTO `user_award_record_001`
VALUES (500, 'xiaofuge', 100301, 100006, '915309448571', 105, '4等奖', '2024-04-24 11:50:58', 'create',
        '2024-04-24 19:50:58', '2024-04-24 19:50:58');
INSERT INTO `user_award_record_001`
VALUES (501, 'xiaofuge', 100301, 100006, '836079441744', 102, '7等奖', '2024-04-24 11:50:59', 'create',
        '2024-04-24 19:50:58', '2024-04-24 19:50:58');
INSERT INTO `user_award_record_001`
VALUES (502, 'xiaofuge', 100301, 100006, '719256272480', 101, '随机积分', '2024-04-24 11:51:00', 'create',
        '2024-04-24 19:51:00', '2024-04-24 19:51:00');
INSERT INTO `user_award_record_001`
VALUES (503, 'xiaofuge', 100301, 100006, '420256311100', 105, '4等奖', '2024-04-24 11:51:01', 'create',
        '2024-04-24 19:51:01', '2024-04-24 19:51:01');
INSERT INTO `user_award_record_001`
VALUES (504, 'xiaofuge', 100301, 100006, '436341575889', 105, '4等奖', '2024-04-24 11:51:02', 'create',
        '2024-04-24 19:51:02', '2024-04-24 19:51:02');
INSERT INTO `user_award_record_001`
VALUES (505, 'xiaofuge', 100301, 100006, '500875419863', 102, '7等奖', '2024-04-24 11:51:54', 'create',
        '2024-04-24 19:51:54', '2024-04-24 19:51:54');
INSERT INTO `user_award_record_001`
VALUES (506, 'xiaofuge', 100301, 100006, '446323053241', 101, '随机积分', '2024-04-24 11:51:55', 'create',
        '2024-04-24 19:51:55', '2024-04-24 19:51:55');
INSERT INTO `user_award_record_001`
VALUES (507, 'xiaofuge', 100301, 100006, '632926849546', 108, '1等奖', '2024-04-24 11:51:56', 'create',
        '2024-04-24 19:51:55', '2024-04-24 19:51:55');
INSERT INTO `user_award_record_001`
VALUES (508, 'xiaofuge', 100301, 100006, '192992710988', 107, '2等奖', '2024-04-24 11:51:57', 'create',
        '2024-04-24 19:51:56', '2024-04-24 19:51:56');
INSERT INTO `user_award_record_001`
VALUES (509, 'xiaofuge', 100301, 100006, '247335925420', 101, '随机积分', '2024-04-26 13:27:35', 'create',
        '2024-04-26 21:27:35', '2024-04-26 21:27:35');
INSERT INTO `user_award_record_001`
VALUES (510, 'xiaofuge', 100301, 100006, '144726336338', 104, '5等奖', '2024-04-26 13:32:24', 'create',
        '2024-04-26 21:32:24', '2024-04-26 21:32:24');
INSERT INTO `user_award_record_001`
VALUES (511, 'xiaofuge', 100301, 100006, '250281606613', 102, '7等奖', '2024-04-26 13:32:26', 'create',
        '2024-04-26 21:32:25', '2024-04-26 21:32:25');
INSERT INTO `user_award_record_001`
VALUES (512, 'xiaofuge', 100301, 100006, '438795737251', 101, '随机积分', '2024-04-26 13:32:27', 'create',
        '2024-04-26 21:32:26', '2024-04-26 21:32:26');
INSERT INTO `user_award_record_001`
VALUES (513, 'xiaofuge', 100301, 100006, '035079908226', 101, '随机积分', '2024-04-26 13:32:27', 'create',
        '2024-04-26 21:32:27', '2024-04-26 21:32:27');
INSERT INTO `user_award_record_001`
VALUES (514, 'xiaofuge', 100301, 100006, '151362802626', 105, '4等奖', '2024-04-26 13:32:28', 'create',
        '2024-04-26 21:32:28', '2024-04-26 21:32:28');
INSERT INTO `user_award_record_001`
VALUES (515, 'xiaofuge', 100301, 100006, '257738408165', 105, '4等奖', '2024-04-26 13:32:29', 'create',
        '2024-04-26 21:32:28', '2024-04-26 21:32:28');
INSERT INTO `user_award_record_001`
VALUES (516, 'xiaofuge', 100301, 100006, '697127526249', 102, '7等奖', '2024-04-26 13:32:30', 'create',
        '2024-04-26 21:32:29', '2024-04-26 21:32:29');
INSERT INTO `user_award_record_001`
VALUES (517, 'xiaofuge', 100301, 100006, '497862658176', 104, '5等奖', '2024-04-26 13:32:30', 'create',
        '2024-04-26 21:32:30', '2024-04-26 21:32:30');
INSERT INTO `user_award_record_001`
VALUES (518, 'xiaofuge', 100301, 100006, '168246960367', 101, '随机积分', '2024-04-26 13:32:31', 'create',
        '2024-04-26 21:32:31', '2024-04-26 21:32:31');
INSERT INTO `user_award_record_001`
VALUES (519, 'xiaofuge', 100301, 100006, '867224007661', 104, '5等奖', '2024-04-26 13:32:32', 'create',
        '2024-04-26 21:32:31', '2024-04-26 21:32:31');
INSERT INTO `user_award_record_001`
VALUES (520, 'xiaofuge', 100301, 100006, '455669309677', 102, '7等奖', '2024-04-26 13:32:39', 'create',
        '2024-04-26 21:32:39', '2024-04-26 21:32:39');
INSERT INTO `user_award_record_001`
VALUES (521, 'xiaofuge', 100301, 100006, '644935852963', 101, '随机积分', '2024-04-26 13:32:40', 'create',
        '2024-04-26 21:32:39', '2024-04-26 21:32:39');
INSERT INTO `user_award_record_001`
VALUES (522, 'xiaofuge', 100301, 100006, '527522004144', 105, '4等奖', '2024-04-26 13:32:40', 'create',
        '2024-04-26 21:32:40', '2024-04-26 21:32:40');
INSERT INTO `user_award_record_001`
VALUES (523, 'xiaofuge', 100301, 100006, '140131960332', 101, '随机积分', '2024-04-26 13:32:42', 'create',
        '2024-04-26 21:32:42', '2024-04-26 21:32:42');
INSERT INTO `user_award_record_001`
VALUES (524, 'xiaofuge', 100301, 100006, '400474467470', 101, '随机积分', '2024-04-26 13:32:45', 'create',
        '2024-04-26 21:32:44', '2024-04-26 21:32:44');
INSERT INTO `user_award_record_001`
VALUES (525, 'xiaofuge', 100301, 100006, '359094914765', 103, '6等奖', '2024-04-26 13:32:47', 'create',
        '2024-04-26 21:32:46', '2024-04-26 21:32:46');
INSERT INTO `user_award_record_001`
VALUES (526, 'xiaofuge', 100301, 100006, '028871362850', 104, '5等奖', '2024-04-26 13:32:48', 'create',
        '2024-04-26 21:32:47', '2024-04-26 21:32:47');
INSERT INTO `user_award_record_001`
VALUES (527, 'xiaofuge', 100301, 100006, '898740343646', 101, '随机积分', '2024-04-26 13:32:49', 'create',
        '2024-04-26 21:32:49', '2024-04-26 21:32:49');
INSERT INTO `user_award_record_001`
VALUES (528, 'xiaofuge', 100301, 100006, '553107258790', 101, '随机积分', '2024-04-26 13:32:51', 'create',
        '2024-04-26 21:32:50', '2024-04-26 21:32:50');
INSERT INTO `user_award_record_001`
VALUES (529, 'xiaofuge', 100301, 100006, '788812386680', 105, '4等奖', '2024-04-26 13:32:51', 'create',
        '2024-04-26 21:32:51', '2024-04-26 21:32:51');
INSERT INTO `user_award_record_001`
VALUES (530, 'xiaofuge', 100301, 100006, '651410664768', 106, '3等奖', '2024-04-26 13:32:52', 'create',
        '2024-04-26 21:32:52', '2024-04-26 21:32:52');
INSERT INTO `user_award_record_001`
VALUES (531, 'xiaofuge', 100301, 100006, '288689742152', 105, '4等奖', '2024-04-26 13:32:53', 'create',
        '2024-04-26 21:32:52', '2024-04-26 21:32:52');
INSERT INTO `user_award_record_001`
VALUES (532, 'xiaofuge', 100301, 100006, '926747612266', 101, '随机积分', '2024-04-26 13:32:53', 'create',
        '2024-04-26 21:32:53', '2024-04-26 21:32:53');
INSERT INTO `user_award_record_001`
VALUES (533, 'xiaofuge', 100301, 100006, '866239624617', 106, '3等奖', '2024-04-26 13:32:54', 'create',
        '2024-04-26 21:32:53', '2024-04-26 21:32:53');
INSERT INTO `user_award_record_001`
VALUES (534, 'xiaofuge', 100301, 100006, '350364814930', 105, '4等奖', '2024-04-26 13:32:54', 'create',
        '2024-04-26 21:32:54', '2024-04-26 21:32:54');
INSERT INTO `user_award_record_001`
VALUES (535, 'xiaofuge', 100301, 100006, '069008524007', 103, '6等奖', '2024-04-26 13:32:55', 'create',
        '2024-04-26 21:32:54', '2024-04-26 21:32:54');
INSERT INTO `user_award_record_001`
VALUES (536, 'xiaofuge', 100301, 100006, '389664305851', 105, '4等奖', '2024-04-26 13:32:55', 'create',
        '2024-04-26 21:32:55', '2024-04-26 21:32:55');
INSERT INTO `user_award_record_001`
VALUES (537, 'xiaofuge', 100301, 100006, '841894358618', 106, '3等奖', '2024-04-26 13:32:56', 'create',
        '2024-04-26 21:32:56', '2024-04-26 21:32:56');
INSERT INTO `user_award_record_001`
VALUES (538, 'xiaofuge', 100301, 100006, '907767461610', 105, '4等奖', '2024-04-26 13:32:57', 'create',
        '2024-04-26 21:32:56', '2024-04-26 21:32:56');
INSERT INTO `user_award_record_001`
VALUES (539, 'xiaofuge', 100301, 100006, '618948997206', 106, '3等奖', '2024-04-27 08:55:21', 'create',
        '2024-04-27 16:55:20', '2024-04-27 16:55:20');
INSERT INTO `user_award_record_001`
VALUES (540, 'xiaofuge', 100301, 100006, '210852888465', 101, '随机积分', '2024-04-27 08:55:22', 'create',
        '2024-04-27 16:55:21', '2024-04-27 16:55:21');
INSERT INTO `user_award_record_001`
VALUES (541, 'xiaofuge', 100301, 100006, '401016807086', 106, '3等奖', '2024-04-27 08:55:23', 'create',
        '2024-04-27 16:55:22', '2024-04-27 16:55:22');
INSERT INTO `user_award_record_001`
VALUES (542, 'xiaofuge', 100301, 100006, '122681543586', 108, '1等奖', '2024-04-27 08:55:23', 'create',
        '2024-04-27 16:55:23', '2024-04-27 16:55:23');
INSERT INTO `user_award_record_001`
VALUES (543, 'xiaofuge', 100301, 100006, '163159327504', 106, '3等奖', '2024-04-27 09:06:21', 'create',
        '2024-04-27 17:06:21', '2024-04-27 17:06:21');
INSERT INTO `user_award_record_001`
VALUES (544, 'xiaofuge', 100301, 100006, '099626936234', 103, '6等奖', '2024-04-27 09:12:21', 'create',
        '2024-04-27 17:12:20', '2024-04-27 17:12:20');
INSERT INTO `user_award_record_001`
VALUES (545, 'xiaofuge', 100301, 100006, '548237938959', 103, '6等奖', '2024-04-27 09:12:29', 'create',
        '2024-04-27 17:12:28', '2024-04-27 17:12:28');
INSERT INTO `user_award_record_001`
VALUES (546, 'xiaofuge', 100301, 100006, '974255219654', 108, '1等奖', '2024-04-27 09:36:38', 'create',
        '2024-04-27 17:36:37', '2024-04-27 17:36:37');
INSERT INTO `user_award_record_001`
VALUES (547, 'xiaofuge', 100301, 100006, '694361457981', 105, '4等奖', '2024-04-27 09:36:44', 'create',
        '2024-04-27 17:36:44', '2024-04-27 17:36:44');
INSERT INTO `user_award_record_001`
VALUES (548, 'xiaofuge', 100301, 100006, '588717772228', 104, '5等奖', '2024-04-27 09:36:53', 'create',
        '2024-04-27 17:36:53', '2024-04-27 17:36:53');
INSERT INTO `user_award_record_001`
VALUES (549, 'xiaofuge', 100301, 100006, '027582962471', 108, '1等奖', '2024-04-27 09:37:17', 'create',
        '2024-04-27 17:37:17', '2024-04-27 17:37:17');
INSERT INTO `user_award_record_001`
VALUES (550, 'xiaofuge', 100301, 100006, '135137709696', 107, '2等奖', '2024-04-27 09:37:34', 'create',
        '2024-04-27 17:37:33', '2024-04-27 17:37:33');
INSERT INTO `user_award_record_001`
VALUES (551, 'xiaofuge', 100301, 100006, '271322587857', 106, '3等奖', '2024-04-27 09:37:40', 'create',
        '2024-04-27 17:37:39', '2024-04-27 17:37:39');
INSERT INTO `user_award_record_001`
VALUES (552, 'xiaofuge', 100301, 100006, '780560784261', 106, '3等奖', '2024-04-27 09:37:49', 'create',
        '2024-04-27 17:37:48', '2024-04-27 17:37:48');
INSERT INTO `user_award_record_001`
VALUES (553, 'xiaofuge', 100301, 100006, '863241463198', 105, '4等奖', '2024-04-27 09:39:06', 'create',
        '2024-04-27 17:39:05', '2024-04-27 17:39:05');
INSERT INTO `user_award_record_001`
VALUES (554, 'xiaofuge', 100301, 100006, '751998008662', 101, '随机积分', '2024-04-27 09:41:11', 'create',
        '2024-04-27 17:41:10', '2024-04-27 17:41:10');
INSERT INTO `user_award_record_001`
VALUES (555, 'xiaofuge', 100301, 100006, '915689828344', 102, '7等奖', '2024-04-27 09:41:23', 'create',
        '2024-04-27 17:41:22', '2024-04-27 17:41:22');
INSERT INTO `user_award_record_001`
VALUES (556, 'xiaofuge', 100301, 100006, '921730517213', 105, '4等奖', '2024-04-27 09:41:30', 'create',
        '2024-04-27 17:41:30', '2024-04-27 17:41:30');
INSERT INTO `user_award_record_001`
VALUES (557, 'xiaofuge', 100301, 100006, '377322610365', 104, '5等奖', '2024-04-27 09:41:36', 'create',
        '2024-04-27 17:41:36', '2024-04-27 17:41:36');
INSERT INTO `user_award_record_001`
VALUES (558, 'xiaofuge', 100301, 100006, '525164073881', 101, '随机积分', '2024-04-27 09:42:15', 'create',
        '2024-04-27 17:42:15', '2024-04-27 17:42:15');
INSERT INTO `user_award_record_001`
VALUES (559, 'xiaofuge', 100301, 100006, '130037011006', 101, '随机积分', '2024-04-27 09:42:23', 'create',
        '2024-04-27 17:42:23', '2024-04-27 17:42:23');
INSERT INTO `user_award_record_001`
VALUES (560, 'xiaofuge', 100301, 100006, '979822077992', 102, '7等奖', '2024-04-27 09:42:31', 'create',
        '2024-04-27 17:42:31', '2024-04-27 17:42:31');
INSERT INTO `user_award_record_001`
VALUES (561, 'xiaofuge', 100301, 100006, '688707068321', 101, '随机积分', '2024-04-27 09:42:49', 'create',
        '2024-04-27 17:42:48', '2024-04-27 17:42:48');
INSERT INTO `user_award_record_001`
VALUES (562, 'xiaofuge', 100301, 100006, '855043559884', 103, '6等奖', '2024-04-27 09:43:44', 'create',
        '2024-04-27 17:43:44', '2024-04-27 17:43:44');
INSERT INTO `user_award_record_001`
VALUES (563, 'xiaofuge', 100301, 100006, '091750964388', 101, '随机积分', '2024-04-27 09:45:22', 'create',
        '2024-04-27 17:45:21', '2024-04-27 17:45:21');
INSERT INTO `user_award_record_001`
VALUES (564, 'xiaofuge', 100301, 100006, '901542291184', 103, '6等奖', '2024-04-27 09:45:31', 'create',
        '2024-04-27 17:45:31', '2024-04-27 17:45:31');
INSERT INTO `user_award_record_001`
VALUES (565, 'xiaofuge', 100301, 100006, '786404822535', 102, '7等奖', '2024-04-27 09:47:41', 'create',
        '2024-04-27 17:47:41', '2024-04-27 17:47:41');
INSERT INTO `user_award_record_001`
VALUES (566, 'xiaofuge', 100301, 100006, '678654513346', 103, '6等奖', '2024-04-27 09:50:16', 'create',
        '2024-04-27 17:50:16', '2024-04-27 17:50:16');
INSERT INTO `user_award_record_001`
VALUES (567, 'xiaofuge', 100301, 100006, '051193263711', 102, '7等奖', '2024-04-27 09:52:53', 'create',
        '2024-04-27 17:52:52', '2024-04-27 17:52:52');
INSERT INTO `user_award_record_001`
VALUES (568, 'xiaofuge', 100301, 100006, '202635544086', 101, '随机积分', '2024-04-27 09:58:03', 'create',
        '2024-04-27 17:58:02', '2024-04-27 17:58:02');
INSERT INTO `user_award_record_001`
VALUES (569, 'xiaofuge', 100301, 100006, '329025476435', 104, '5等奖', '2024-04-27 09:58:17', 'create',
        '2024-04-27 17:58:17', '2024-04-27 17:58:17');
INSERT INTO `user_award_record_001`
VALUES (570, 'xiaofuge', 100301, 100006, '323291790783', 104, '5等奖', '2024-04-27 10:01:26', 'create',
        '2024-04-27 18:01:26', '2024-04-27 18:01:26');
INSERT INTO `user_award_record_001`
VALUES (571, 'xiaofuge', 100301, 100006, '734359306596', 105, '4等奖', '2024-04-27 10:10:20', 'create',
        '2024-04-27 18:10:19', '2024-04-27 18:10:19');
INSERT INTO `user_award_record_001`
VALUES (572, 'xiaofuge', 100301, 100006, '273852093653', 103, '6等奖', '2024-04-27 10:47:09', 'create',
        '2024-04-27 18:47:08', '2024-04-27 18:47:08');
INSERT INTO `user_award_record_001`
VALUES (573, 'xiaofuge', 100301, 100006, '875811485818', 101, '随机积分', '2024-04-27 10:57:43', 'create',
        '2024-04-27 18:57:43', '2024-04-27 18:57:43');
INSERT INTO `user_award_record_001`
VALUES (574, 'xiaofuge', 100301, 100006, '266979859562', 106, '3等奖', '2024-04-27 10:58:18', 'create',
        '2024-04-27 18:58:18', '2024-04-27 18:58:18');
INSERT INTO `user_award_record_001`
VALUES (575, 'xiaofuge', 100301, 100006, '028539187924', 106, '3等奖', '2024-04-27 11:04:22', 'create',
        '2024-04-27 19:04:22', '2024-04-27 19:04:22');
INSERT INTO `user_award_record_001`
VALUES (576, 'xiaofuge', 100301, 100006, '232388538686', 102, '7等奖', '2024-04-27 11:04:30', 'create',
        '2024-04-27 19:04:30', '2024-04-27 19:04:30');
INSERT INTO `user_award_record_001`
VALUES (577, 'xiaofuge', 100301, 100006, '150974751275', 107, '2等奖', '2024-04-27 11:06:40', 'create',
        '2024-04-27 19:06:40', '2024-04-27 19:06:40');
INSERT INTO `user_award_record_001`
VALUES (578, 'xiaofuge', 100301, 100006, '436419977678', 107, '2等奖', '2024-04-27 11:08:10', 'create',
        '2024-04-27 19:08:10', '2024-04-27 19:08:10');
INSERT INTO `user_award_record_001`
VALUES (579, 'xiaofuge', 100301, 100006, '159858374347', 102, '7等奖', '2024-04-27 11:08:21', 'create',
        '2024-04-27 19:08:20', '2024-04-27 19:08:20');
INSERT INTO `user_award_record_001`
VALUES (580, 'xiaofuge', 100301, 100006, '761305363586', 105, '4等奖', '2024-04-27 11:08:24', 'create',
        '2024-04-27 19:08:24', '2024-04-27 19:08:24');
INSERT INTO `user_award_record_001`
VALUES (581, 'xiaofuge', 100301, 100006, '929338705563', 101, '随机积分', '2024-04-27 11:09:49', 'create',
        '2024-04-27 19:09:48', '2024-04-27 19:09:48');
INSERT INTO `user_award_record_001`
VALUES (582, 'xiaofuge', 100301, 100006, '943974075634', 102, '7等奖', '2024-04-27 11:10:09', 'create',
        '2024-04-27 19:10:08', '2024-04-27 19:10:08');
INSERT INTO `user_award_record_001`
VALUES (583, 'xiaofuge', 100301, 100006, '250282259223', 104, '5等奖', '2024-04-27 11:10:13', 'create',
        '2024-04-27 19:10:13', '2024-04-27 19:10:13');
INSERT INTO `user_award_record_001`
VALUES (584, 'xiaofuge', 100301, 100006, '477532939653', 102, '7等奖', '2024-04-27 11:10:35', 'create',
        '2024-04-27 19:10:34', '2024-04-27 19:10:34');
INSERT INTO `user_award_record_001`
VALUES (585, 'xiaofuge', 100301, 100006, '931774512199', 101, '随机积分', '2024-04-27 11:10:57', 'create',
        '2024-04-27 19:10:57', '2024-04-27 19:10:57');
INSERT INTO `user_award_record_001`
VALUES (586, 'xiaofuge', 100301, 100006, '795694093310', 104, '5等奖', '2024-04-27 12:00:32', 'create',
        '2024-04-27 20:00:31', '2024-04-27 20:00:31');
INSERT INTO `user_award_record_001`
VALUES (587, 'xiaofuge', 100301, 100006, '222613264981', 102, '7等奖', '2024-04-27 12:00:38', 'create',
        '2024-04-27 20:00:38', '2024-04-27 20:00:38');
INSERT INTO `user_award_record_001`
VALUES (588, 'xiaofuge', 100301, 100006, '192368926161', 108, '1等奖', '2024-04-27 12:00:45', 'create',
        '2024-04-27 20:00:44', '2024-04-27 20:00:44');
INSERT INTO `user_award_record_001`
VALUES (589, 'xiaofuge', 100301, 100006, '217913955570', 105, '4等奖', '2024-04-27 13:24:05', 'create',
        '2024-04-27 21:24:05', '2024-04-27 21:24:05');
INSERT INTO `user_award_record_001`
VALUES (590, 'xiaofuge', 100301, 100006, '952513070008', 108, '1等奖', '2024-04-27 13:24:14', 'create',
        '2024-04-27 21:24:13', '2024-04-27 21:24:13');
INSERT INTO `user_award_record_001`
VALUES (591, 'xiaofuge', 100301, 100006, '942405402212', 102, '7等奖', '2024-04-27 13:24:23', 'create',
        '2024-04-27 21:24:23', '2024-04-27 21:24:23');
INSERT INTO `user_award_record_001`
VALUES (592, 'xiaofuge', 100301, 100006, '342248203959', 101, '随机积分', '2024-04-27 13:24:50', 'create',
        '2024-04-27 21:24:49', '2024-04-27 21:24:49');
INSERT INTO `user_award_record_001`
VALUES (593, 'xiaofuge', 100301, 100006, '442062095325', 101, '随机积分', '2024-04-27 13:50:59', 'create',
        '2024-04-27 21:50:58', '2024-04-27 21:50:58');
INSERT INTO `user_award_record_001`
VALUES (594, 'xiaofuge', 100301, 100006, '513966318334', 104, '5等奖', '2024-04-27 13:51:23', 'create',
        '2024-04-27 21:51:23', '2024-04-27 21:51:23');
INSERT INTO `user_award_record_001`
VALUES (595, 'xiaofuge', 100301, 100006, '320352223971', 107, '2等奖', '2024-04-27 13:51:48', 'create',
        '2024-04-27 21:51:47', '2024-04-27 21:51:47');
INSERT INTO `user_award_record_001`
VALUES (596, 'xiaofuge', 100301, 100006, '893193772901', 103, '6等奖', '2024-04-28 07:36:57', 'create',
        '2024-04-28 15:36:57', '2024-04-28 15:36:57');
INSERT INTO `user_award_record_001`
VALUES (597, 'xiaofuge', 100301, 100006, '461737349661', 108, '1等奖', '2024-04-28 07:37:04', 'create',
        '2024-04-28 15:37:04', '2024-04-28 15:37:04');
INSERT INTO `user_award_record_001`
VALUES (598, 'xiaofuge', 100301, 100006, '975786804524', 102, '7等奖', '2024-04-28 07:37:10', 'create',
        '2024-04-28 15:37:10', '2024-04-28 15:37:10');
INSERT INTO `user_award_record_001`
VALUES (599, 'xiaofuge', 100301, 100006, '978734956179', 101, '随机积分', '2024-04-28 11:07:38', 'create',
        '2024-04-28 19:07:38', '2024-04-28 19:07:38');
INSERT INTO `user_award_record_001`
VALUES (600, 'xiaofuge', 100301, 100006, '045645014886', 101, '随机积分', '2024-04-28 11:07:44', 'create',
        '2024-04-28 19:07:43', '2024-04-28 19:07:43');
INSERT INTO `user_award_record_001`
VALUES (601, 'xiaofuge', 100301, 100006, '913342953020', 103, '6等奖', '2024-04-28 11:08:50', 'create',
        '2024-04-28 19:08:49', '2024-04-28 19:08:49');
INSERT INTO `user_award_record_001`
VALUES (602, 'xiaofuge', 100301, 100006, '774626794326', 104, '5等奖', '2024-04-28 11:08:57', 'create',
        '2024-04-28 19:08:56', '2024-04-28 19:08:56');
INSERT INTO `user_award_record_001`
VALUES (603, 'xiaofuge', 100301, 100006, '717146108550', 101, '随机积分', '2024-04-28 11:09:03', 'create',
        '2024-04-28 19:09:02', '2024-04-28 19:09:02');
INSERT INTO `user_award_record_001`
VALUES (604, 'xiaofuge', 100301, 100006, '416340324165', 101, '随机积分', '2024-04-28 11:18:43', 'create',
        '2024-04-28 19:18:42', '2024-04-28 19:18:42');
INSERT INTO `user_award_record_001`
VALUES (605, 'xiaofuge', 100301, 100006, '064075606435', 103, '6等奖', '2024-04-28 11:19:14', 'create',
        '2024-04-28 19:19:14', '2024-04-28 19:19:14');
INSERT INTO `user_award_record_001`
VALUES (606, 'xiaofuge', 100301, 100006, '225600232609', 101, '随机积分', '2024-04-28 11:19:22', 'create',
        '2024-04-28 19:19:21', '2024-04-28 19:19:21');
INSERT INTO `user_award_record_001`
VALUES (607, 'xiaofuge', 100301, 100006, '190335519553', 101, '随机积分', '2024-04-28 11:19:28', 'create',
        '2024-04-28 19:19:27', '2024-04-28 19:19:27');
INSERT INTO `user_award_record_001`
VALUES (608, 'xiaofuge', 100301, 100006, '807971592042', 103, '6等奖', '2024-04-28 11:19:33', 'create',
        '2024-04-28 19:19:33', '2024-04-28 19:19:33');
INSERT INTO `user_award_record_001`
VALUES (609, 'xiaofuge', 100301, 100006, '056038658940', 105, '4等奖', '2024-04-28 11:19:39', 'create',
        '2024-04-28 19:19:38', '2024-04-28 19:19:38');
INSERT INTO `user_award_record_001`
VALUES (610, 'xiaofuge', 100301, 100006, '617672918562', 103, '6等奖', '2024-04-28 11:19:44', 'create',
        '2024-04-28 19:19:44', '2024-04-28 19:19:44');
INSERT INTO `user_award_record_001`
VALUES (611, 'xiaofuge', 100301, 100006, '248534142132', 105, '4等奖', '2024-04-28 11:28:15', 'create',
        '2024-04-28 19:28:15', '2024-04-28 19:28:15');
INSERT INTO `user_award_record_001`
VALUES (612, 'xiaofuge', 100301, 100006, '518781281451', 101, '随机积分', '2024-04-28 11:39:05', 'create',
        '2024-04-28 19:39:04', '2024-04-28 19:39:04');
INSERT INTO `user_award_record_001`
VALUES (613, 'xiaofuge', 100301, 100006, '547607636345', 101, '随机积分', '2024-04-28 11:39:11', 'create',
        '2024-04-28 19:39:10', '2024-04-28 19:39:10');
INSERT INTO `user_award_record_001`
VALUES (614, 'xiaofuge', 100301, 100006, '700018830503', 103, '6等奖', '2024-04-28 11:39:17', 'create',
        '2024-04-28 19:39:17', '2024-04-28 19:39:17');
INSERT INTO `user_award_record_001`
VALUES (615, 'xiaofuge', 100301, 100006, '787616893805', 102, '7等奖', '2024-04-28 11:39:23', 'create',
        '2024-04-28 19:39:23', '2024-04-28 19:39:23');
INSERT INTO `user_award_record_001`
VALUES (616, 'xiaofuge', 100301, 100006, '873287594422', 104, '5等奖', '2024-04-28 11:39:29', 'create',
        '2024-04-28 19:39:29', '2024-04-28 19:39:29');
INSERT INTO `user_award_record_001`
VALUES (617, 'xiaofuge', 100301, 100006, '257035888229', 102, '7等奖', '2024-04-28 11:39:41', 'create',
        '2024-04-28 19:39:40', '2024-04-28 19:39:40');
INSERT INTO `user_award_record_001`
VALUES (618, 'xiaofuge', 100301, 100006, '387566830398', 101, '随机积分', '2024-04-28 11:42:07', 'create',
        '2024-04-28 19:42:06', '2024-04-28 19:42:06');
INSERT INTO `user_award_record_001`
VALUES (619, 'xiaofuge', 100301, 100006, '925412938600', 101, '随机积分', '2024-04-28 11:42:38', 'create',
        '2024-04-28 19:42:37', '2024-04-28 19:42:37');
INSERT INTO `user_award_record_001`
VALUES (620, 'xiaofuge', 100301, 100006, '280640719706', 105, '4等奖', '2024-04-28 11:42:46', 'create',
        '2024-04-28 19:42:46', '2024-04-28 19:42:46');
INSERT INTO `user_award_record_001`
VALUES (621, 'xiaofuge', 100301, 100006, '327600334766', 102, '7等奖', '2024-04-28 11:42:53', 'create',
        '2024-04-28 19:42:53', '2024-04-28 19:42:53');
INSERT INTO `user_award_record_001`
VALUES (622, 'xiaofuge', 100301, 100006, '744816949240', 105, '4等奖', '2024-04-28 11:42:59', 'create',
        '2024-04-28 19:42:59', '2024-04-28 19:42:59');
INSERT INTO `user_award_record_001`
VALUES (623, 'xiaofuge', 100301, 100006, '960236602196', 104, '5等奖', '2024-04-28 11:43:05', 'create',
        '2024-04-28 19:43:05', '2024-04-28 19:43:05');
INSERT INTO `user_award_record_001`
VALUES (624, 'xiaofuge', 100301, 100006, '348372462424', 105, '4等奖', '2024-04-28 11:43:16', 'create',
        '2024-04-28 19:43:15', '2024-04-28 19:43:15');
INSERT INTO `user_award_record_001`
VALUES (625, 'xiaofuge', 100301, 100006, '288632943203', 101, '随机积分', '2024-04-28 11:43:22', 'create',
        '2024-04-28 19:43:22', '2024-04-28 19:43:22');
INSERT INTO `user_award_record_001`
VALUES (626, 'xiaofuge', 100301, 100006, '510423373500', 103, '6等奖', '2024-04-28 11:44:12', 'create',
        '2024-04-28 19:44:12', '2024-04-28 19:44:12');
INSERT INTO `user_award_record_001`
VALUES (627, 'xiaofuge', 100301, 100006, '785817771013', 101, '随机积分', '2024-04-28 11:44:20', 'create',
        '2024-04-28 19:44:19', '2024-04-28 19:44:19');
INSERT INTO `user_award_record_001`
VALUES (628, 'xiaofuge', 100301, 100006, '803561160229', 101, '随机积分', '2024-04-28 11:44:27', 'create',
        '2024-04-28 19:44:26', '2024-04-28 19:44:26');
INSERT INTO `user_award_record_001`
VALUES (629, 'xiaofuge', 100301, 100006, '461201719958', 102, '7等奖', '2024-04-28 11:44:34', 'create',
        '2024-04-28 19:44:33', '2024-04-28 19:44:33');
INSERT INTO `user_award_record_001`
VALUES (630, 'xiaofuge', 100301, 100006, '642439076011', 103, '6等奖', '2024-04-28 11:44:53', 'create',
        '2024-04-28 19:44:52', '2024-04-28 19:44:52');
INSERT INTO `user_award_record_001`
VALUES (631, 'xiaofuge', 100301, 100006, '639402032708', 104, '5等奖', '2024-04-28 11:46:03', 'create',
        '2024-04-28 19:46:02', '2024-04-28 19:46:02');
INSERT INTO `user_award_record_001`
VALUES (632, 'xiaofuge', 100301, 100006, '136951519719', 105, '4等奖', '2024-04-28 11:46:09', 'create',
        '2024-04-28 19:46:09', '2024-04-28 19:46:09');
INSERT INTO `user_award_record_001`
VALUES (633, 'xiaofuge', 100301, 100006, '090954195605', 103, '6等奖', '2024-04-28 11:46:15', 'create',
        '2024-04-28 19:46:15', '2024-04-28 19:46:15');
INSERT INTO `user_award_record_001`
VALUES (634, 'xiaofuge', 100301, 100006, '715083933134', 101, '随机积分', '2024-04-28 12:07:10', 'create',
        '2024-04-28 20:07:09', '2024-04-28 20:07:09');
INSERT INTO `user_award_record_001`
VALUES (635, 'xiaofuge', 100301, 100006, '088480240833', 101, '随机积分', '2024-04-28 12:21:31', 'create',
        '2024-04-28 20:21:30', '2024-04-28 20:21:30');
INSERT INTO `user_award_record_001`
VALUES (636, 'xiaofuge', 100301, 100006, '538675127691', 104, '5等奖', '2024-04-28 12:22:59', 'create',
        '2024-04-28 20:22:58', '2024-04-28 20:22:58');
INSERT INTO `user_award_record_001`
VALUES (637, 'xiaofuge', 100301, 100006, '952324644805', 101, '随机积分', '2024-04-28 13:28:07', 'create',
        '2024-04-28 21:28:07', '2024-04-28 21:28:07');
INSERT INTO `user_award_record_001`
VALUES (638, 'xiaofuge', 100301, 100006, '310767906901', 103, '6等奖', '2024-04-28 13:28:44', 'create',
        '2024-04-28 21:28:43', '2024-04-28 21:28:43');

-- ----------------------------
-- Table structure for user_award_record_002
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_002`;
CREATE TABLE `user_award_record_002`
(
    `id`          int UNSIGNED                                                  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `activity_id` bigint                                                        NOT NULL COMMENT '活动ID',
    `strategy_id` bigint                                                        NOT NULL COMMENT '抽奖策略ID',
    `order_id`    varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
    `award_id`    int                                                           NOT NULL COMMENT '奖品ID',
    `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
    `award_time`  datetime                                                      NOT NULL COMMENT '中奖时间',
    `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
    `create_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id` (`user_id` ASC) USING BTREE,
    INDEX `idx_activity_id` (`activity_id` ASC) USING BTREE,
    INDEX `idx_award_id` (`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_award_record_003
-- ----------------------------
DROP TABLE IF EXISTS `user_award_record_003`;
CREATE TABLE `user_award_record_003`
(
    `id`          int UNSIGNED                                                  NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`     varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `activity_id` bigint                                                        NOT NULL COMMENT '活动ID',
    `strategy_id` bigint                                                        NOT NULL COMMENT '抽奖策略ID',
    `order_id`    varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
    `award_id`    int                                                           NOT NULL COMMENT '奖品ID',
    `award_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品标题（名称）',
    `award_time`  datetime                                                      NOT NULL COMMENT '中奖时间',
    `award_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
    `create_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id` (`user_id` ASC) USING BTREE,
    INDEX `idx_activity_id` (`activity_id` ASC) USING BTREE,
    INDEX `idx_award_id` (`strategy_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户中奖记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_award_record_003
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_000
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_000`;
CREATE TABLE `user_raffle_order_000`
(
    `id`            int UNSIGNED                                                 NOT NULL AUTO_INCREMENT,
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`   bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`   bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`    datetime                                                     NOT NULL COMMENT '下单时间',
    `order_state`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
    `create_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_000
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_001
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_001`;
CREATE TABLE `user_raffle_order_001`
(
    `id`            int UNSIGNED                                                 NOT NULL AUTO_INCREMENT,
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`   bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`   bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`    datetime                                                     NOT NULL COMMENT '下单时间',
    `order_state`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
    `create_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 254
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_001
-- ----------------------------
INSERT INTO `user_raffle_order_001`
VALUES (5, 'xiaofuge', 100301, '测试活动', 100006, '615085528101', '2024-04-16 10:27:17', 'used', '2024-04-16 18:27:16',
        '2024-04-16 18:30:14');
INSERT INTO `user_raffle_order_001`
VALUES (6, 'xiaofuge', 100301, '测试活动', 100006, '399563191551', '2024-04-16 10:30:17', 'used', '2024-04-16 18:30:16',
        '2024-04-16 18:30:16');
INSERT INTO `user_raffle_order_001`
VALUES (7, 'xiaofuge', 100301, '测试活动', 100006, '920549566808', '2024-04-16 10:30:17', 'used', '2024-04-16 18:30:17',
        '2024-04-16 18:30:17');
INSERT INTO `user_raffle_order_001`
VALUES (8, 'xiaofuge', 100301, '测试活动', 100006, '721968614679', '2024-04-16 10:30:18', 'used', '2024-04-16 18:30:18',
        '2024-04-16 18:30:18');
INSERT INTO `user_raffle_order_001`
VALUES (9, 'xiaofuge', 100301, '测试活动', 100006, '513063570114', '2024-04-16 10:30:27', 'used', '2024-04-16 18:30:26',
        '2024-04-16 18:30:26');
INSERT INTO `user_raffle_order_001`
VALUES (10, 'xiaofuge', 100301, '测试活动', 100006, '408842022544', '2024-04-16 10:30:36', 'used',
        '2024-04-16 18:30:36', '2024-04-16 18:30:36');
INSERT INTO `user_raffle_order_001`
VALUES (11, 'xiaofuge', 100301, '测试活动', 100006, '242700308687', '2024-04-16 11:27:09', 'used',
        '2024-04-16 19:27:09', '2024-04-16 19:27:09');
INSERT INTO `user_raffle_order_001`
VALUES (12, 'xiaofuge', 100301, '测试活动', 100006, '223444445928', '2024-04-16 11:27:10', 'used',
        '2024-04-16 19:27:10', '2024-04-16 19:27:10');
INSERT INTO `user_raffle_order_001`
VALUES (13, 'xiaofuge', 100301, '测试活动', 100006, '243039342622', '2024-04-16 11:27:11', 'used',
        '2024-04-16 19:27:11', '2024-04-16 19:27:11');
INSERT INTO `user_raffle_order_001`
VALUES (14, 'xiaofuge', 100301, '测试活动', 100006, '625067212608', '2024-04-16 11:27:12', 'used',
        '2024-04-16 19:27:11', '2024-04-16 19:27:11');
INSERT INTO `user_raffle_order_001`
VALUES (15, 'xiaofuge', 100301, '测试活动', 100006, '184866962414', '2024-04-16 11:27:13', 'used',
        '2024-04-16 19:27:12', '2024-04-16 19:27:12');
INSERT INTO `user_raffle_order_001`
VALUES (16, 'xiaofuge', 100301, '测试活动', 100006, '251634372968', '2024-04-16 11:27:13', 'used',
        '2024-04-16 19:27:13', '2024-04-16 19:27:13');
INSERT INTO `user_raffle_order_001`
VALUES (17, 'xiaofuge', 100301, '测试活动', 100006, '478502194266', '2024-04-16 11:27:14', 'used',
        '2024-04-16 19:27:14', '2024-04-16 19:27:14');
INSERT INTO `user_raffle_order_001`
VALUES (18, 'xiaofuge', 100301, '测试活动', 100006, '011317059639', '2024-04-16 11:27:15', 'used',
        '2024-04-16 19:27:14', '2024-04-16 19:27:14');
INSERT INTO `user_raffle_order_001`
VALUES (19, 'xiaofuge', 100301, '测试活动', 100006, '960221936802', '2024-04-16 11:27:15', 'used',
        '2024-04-16 19:27:15', '2024-04-16 19:27:15');
INSERT INTO `user_raffle_order_001`
VALUES (20, 'xiaofuge', 100301, '测试活动', 100006, '282429153222', '2024-04-16 11:27:16', 'used',
        '2024-04-16 19:27:15', '2024-04-16 19:27:15');
INSERT INTO `user_raffle_order_001`
VALUES (21, 'xiaofuge', 100301, '测试活动', 100006, '096637243029', '2024-04-16 11:27:16', 'used',
        '2024-04-16 19:27:16', '2024-04-16 19:27:16');
INSERT INTO `user_raffle_order_001`
VALUES (22, 'xiaofuge', 100301, '测试活动', 100006, '395668378736', '2024-04-16 11:27:17', 'used',
        '2024-04-16 19:27:16', '2024-04-16 19:27:16');
INSERT INTO `user_raffle_order_001`
VALUES (23, 'xiaofuge', 100301, '测试活动', 100006, '646746807910', '2024-04-16 11:27:17', 'used',
        '2024-04-16 19:27:17', '2024-04-16 19:27:17');
INSERT INTO `user_raffle_order_001`
VALUES (24, 'xiaofuge', 100301, '测试活动', 100006, '664587256470', '2024-04-16 11:27:18', 'used',
        '2024-04-16 19:27:17', '2024-04-16 19:27:17');
INSERT INTO `user_raffle_order_001`
VALUES (25, 'xiaofuge', 100301, '测试活动', 100006, '854977590108', '2024-04-16 11:27:18', 'used',
        '2024-04-16 19:27:18', '2024-04-16 19:27:18');
INSERT INTO `user_raffle_order_001`
VALUES (26, 'xiaofuge', 100301, '测试活动', 100006, '248627555160', '2024-04-16 11:27:19', 'used',
        '2024-04-16 19:27:18', '2024-04-16 19:27:18');
INSERT INTO `user_raffle_order_001`
VALUES (27, 'xiaofuge', 100301, '测试活动', 100006, '425252873958', '2024-04-16 11:27:19', 'used',
        '2024-04-16 19:27:19', '2024-04-16 19:27:19');
INSERT INTO `user_raffle_order_001`
VALUES (28, 'xiaofuge', 100301, '测试活动', 100006, '637890105298', '2024-04-16 11:28:28', 'used',
        '2024-04-16 19:28:28', '2024-04-16 19:28:28');
INSERT INTO `user_raffle_order_001`
VALUES (29, 'xiaofuge', 100301, '测试活动', 100006, '921480370583', '2024-04-16 11:28:30', 'used',
        '2024-04-16 19:28:29', '2024-04-16 19:28:29');
INSERT INTO `user_raffle_order_001`
VALUES (30, 'xiaofuge', 100301, '测试活动', 100006, '230227786958', '2024-04-16 11:28:30', 'used',
        '2024-04-16 19:28:30', '2024-04-16 19:28:30');
INSERT INTO `user_raffle_order_001`
VALUES (31, 'xiaofuge', 100301, '测试活动', 100006, '228858915993', '2024-04-16 11:29:02', 'used',
        '2024-04-16 19:29:02', '2024-04-16 19:29:02');
INSERT INTO `user_raffle_order_001`
VALUES (32, 'xiaofuge', 100301, '测试活动', 100006, '293947655731', '2024-04-16 11:29:03', 'used',
        '2024-04-16 19:29:02', '2024-04-16 19:29:02');
INSERT INTO `user_raffle_order_001`
VALUES (33, 'xiaofuge', 100301, '测试活动', 100006, '778430601457', '2024-04-16 11:29:05', 'used',
        '2024-04-16 19:29:05', '2024-04-16 19:29:05');
INSERT INTO `user_raffle_order_001`
VALUES (34, 'xiaofuge', 100301, '测试活动', 100006, '286547252015', '2024-04-16 11:29:06', 'used',
        '2024-04-16 19:29:05', '2024-04-16 19:29:05');
INSERT INTO `user_raffle_order_001`
VALUES (35, 'xiaofuge', 100301, '测试活动', 100006, '736808185119', '2024-04-16 11:29:06', 'used',
        '2024-04-16 19:29:06', '2024-04-16 19:29:06');
INSERT INTO `user_raffle_order_001`
VALUES (36, 'xiaofuge', 100301, '测试活动', 100006, '621417252003', '2024-04-16 11:29:07', 'used',
        '2024-04-16 19:29:06', '2024-04-16 19:29:07');
INSERT INTO `user_raffle_order_001`
VALUES (37, 'xiaofuge', 100301, '测试活动', 100006, '839164757694', '2024-04-16 11:36:54', 'used',
        '2024-04-16 19:36:53', '2024-04-16 19:36:54');
INSERT INTO `user_raffle_order_001`
VALUES (38, 'xiaofuge', 100301, '测试活动', 100006, '102648043530', '2024-04-16 11:36:55', 'used',
        '2024-04-16 19:36:54', '2024-04-16 19:36:54');
INSERT INTO `user_raffle_order_001`
VALUES (39, 'xiaofuge', 100301, '测试活动', 100006, '257878905072', '2024-04-16 11:42:46', 'used',
        '2024-04-16 19:42:45', '2024-04-16 19:43:36');
INSERT INTO `user_raffle_order_001`
VALUES (40, 'xiaofuge', 100301, '测试活动', 100006, '801308310329', '2024-04-16 11:45:31', 'used',
        '2024-04-16 19:45:31', '2024-04-16 19:45:31');
INSERT INTO `user_raffle_order_001`
VALUES (41, 'xiaofuge', 100301, '测试活动', 100006, '239361243225', '2024-04-16 11:45:32', 'used',
        '2024-04-16 19:45:31', '2024-04-16 19:45:31');
INSERT INTO `user_raffle_order_001`
VALUES (42, 'xiaofuge', 100301, '测试活动', 100006, '982242155291', '2024-04-16 11:45:32', 'used',
        '2024-04-16 19:45:32', '2024-04-16 19:45:32');
INSERT INTO `user_raffle_order_001`
VALUES (43, 'xiaofuge', 100301, '测试活动', 100006, '459592481371', '2024-04-16 11:45:33', 'used',
        '2024-04-16 19:45:32', '2024-04-16 19:45:32');
INSERT INTO `user_raffle_order_001`
VALUES (44, 'xiaofuge', 100301, '测试活动', 100006, '348486191870', '2024-04-16 11:45:33', 'used',
        '2024-04-16 19:45:33', '2024-04-16 19:45:33');
INSERT INTO `user_raffle_order_001`
VALUES (45, 'xiaofuge', 100301, '测试活动', 100006, '007209317899', '2024-04-16 11:45:34', 'used',
        '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `user_raffle_order_001`
VALUES (46, 'xiaofuge', 100301, '测试活动', 100006, '775707959632', '2024-04-16 11:45:34', 'used',
        '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `user_raffle_order_001`
VALUES (47, 'xiaofuge', 100301, '测试活动', 100006, '506568253078', '2024-04-16 11:45:35', 'used',
        '2024-04-16 19:45:34', '2024-04-16 19:45:34');
INSERT INTO `user_raffle_order_001`
VALUES (48, 'xiaofuge', 100301, '测试活动', 100006, '000635924731', '2024-04-16 11:45:35', 'used',
        '2024-04-16 19:45:35', '2024-04-16 19:45:35');
INSERT INTO `user_raffle_order_001`
VALUES (49, 'xiaofuge', 100301, '测试活动', 100006, '128588322577', '2024-04-16 11:45:36', 'used',
        '2024-04-16 19:45:35', '2024-04-16 19:45:35');
INSERT INTO `user_raffle_order_001`
VALUES (50, 'xiaofuge', 100301, '测试活动', 100006, '933734192385', '2024-04-16 11:45:36', 'used',
        '2024-04-16 19:45:36', '2024-04-16 19:45:36');
INSERT INTO `user_raffle_order_001`
VALUES (51, 'xiaofuge', 100301, '测试活动', 100006, '944755097295', '2024-04-16 11:46:06', 'used',
        '2024-04-16 19:46:06', '2024-04-16 19:46:06');
INSERT INTO `user_raffle_order_001`
VALUES (52, 'xiaofuge', 100301, '测试活动', 100006, '360027972721', '2024-04-16 11:46:14', 'used',
        '2024-04-16 19:46:13', '2024-04-16 19:46:13');
INSERT INTO `user_raffle_order_001`
VALUES (53, 'xiaofuge', 100301, '测试活动', 100006, '313775415836', '2024-04-16 11:46:20', 'used',
        '2024-04-16 19:46:20', '2024-04-16 19:46:20');
INSERT INTO `user_raffle_order_001`
VALUES (54, 'xiaofuge', 100301, '测试活动', 100006, '834348744242', '2024-04-16 11:47:01', 'used',
        '2024-04-16 19:47:00', '2024-04-16 19:47:00');
INSERT INTO `user_raffle_order_001`
VALUES (55, 'xiaofuge', 100301, '测试活动', 100006, '336272473433', '2024-04-16 11:47:09', 'used',
        '2024-04-16 19:47:09', '2024-04-16 19:47:09');
INSERT INTO `user_raffle_order_001`
VALUES (56, 'xiaofuge', 100301, '测试活动', 100006, '461751642328', '2024-04-16 11:47:10', 'used',
        '2024-04-16 19:47:10', '2024-04-16 19:47:10');
INSERT INTO `user_raffle_order_001`
VALUES (57, 'xiaofuge', 100301, '测试活动', 100006, '455208346781', '2024-04-16 11:48:27', 'used',
        '2024-04-16 19:48:26', '2024-04-16 19:48:26');
INSERT INTO `user_raffle_order_001`
VALUES (58, 'xiaofuge', 100301, '测试活动', 100006, '090190683977', '2024-04-16 11:48:28', 'used',
        '2024-04-16 19:48:28', '2024-04-16 19:48:28');
INSERT INTO `user_raffle_order_001`
VALUES (59, 'xiaofuge', 100301, '测试活动', 100006, '323999803802', '2024-04-16 11:50:43', 'used',
        '2024-04-16 19:50:43', '2024-04-16 19:50:43');
INSERT INTO `user_raffle_order_001`
VALUES (60, 'xiaofuge', 100301, '测试活动', 100006, '401774544075', '2024-04-16 11:50:44', 'used',
        '2024-04-16 19:50:44', '2024-04-16 19:50:44');
INSERT INTO `user_raffle_order_001`
VALUES (61, 'xiaofuge', 100301, '测试活动', 100006, '518277384304', '2024-04-16 11:50:45', 'used',
        '2024-04-16 19:50:44', '2024-04-16 19:50:44');
INSERT INTO `user_raffle_order_001`
VALUES (62, 'xiaofuge', 100301, '测试活动', 100006, '227287996702', '2024-04-16 11:50:46', 'used',
        '2024-04-16 19:50:45', '2024-04-16 19:50:45');
INSERT INTO `user_raffle_order_001`
VALUES (63, 'xiaofuge', 100301, '测试活动', 100006, '536821954082', '2024-04-16 11:50:47', 'used',
        '2024-04-16 19:50:46', '2024-04-16 19:50:46');
INSERT INTO `user_raffle_order_001`
VALUES (64, 'xiaofuge', 100301, '测试活动', 100006, '202151786198', '2024-04-16 11:52:24', 'used',
        '2024-04-16 19:52:23', '2024-04-16 19:52:23');
INSERT INTO `user_raffle_order_001`
VALUES (65, 'xiaofuge', 100301, '测试活动', 100006, '503104733306', '2024-04-16 11:52:27', 'used',
        '2024-04-16 19:52:27', '2024-04-16 19:52:27');
INSERT INTO `user_raffle_order_001`
VALUES (66, 'xiaofuge', 100301, '测试活动', 100006, '444312518718', '2024-04-16 12:00:26', 'used',
        '2024-04-16 20:00:26', '2024-04-16 20:00:26');
INSERT INTO `user_raffle_order_001`
VALUES (67, 'xiaofuge', 100301, '测试活动', 100006, '293482019626', '2024-04-16 12:00:27', 'used',
        '2024-04-16 20:00:26', '2024-04-16 20:00:27');
INSERT INTO `user_raffle_order_001`
VALUES (68, 'xiaofuge', 100301, '测试活动', 100006, '816076535561', '2024-04-16 12:00:28', 'used',
        '2024-04-16 20:00:27', '2024-04-16 20:00:27');
INSERT INTO `user_raffle_order_001`
VALUES (69, 'xiaofuge', 100301, '测试活动', 100006, '878541717140', '2024-04-16 12:00:28', 'used',
        '2024-04-16 20:00:28', '2024-04-16 20:00:28');
INSERT INTO `user_raffle_order_001`
VALUES (70, 'xiaofuge', 100301, '测试活动', 100006, '400324699281', '2024-04-16 12:00:29', 'used',
        '2024-04-16 20:00:28', '2024-04-16 20:00:28');
INSERT INTO `user_raffle_order_001`
VALUES (71, 'xiaofuge', 100301, '测试活动', 100006, '252478882129', '2024-04-16 12:00:29', 'used',
        '2024-04-16 20:00:29', '2024-04-16 20:00:29');
INSERT INTO `user_raffle_order_001`
VALUES (72, 'xiaofuge', 100301, '测试活动', 100006, '518195328826', '2024-04-16 12:00:30', 'used',
        '2024-04-16 20:00:29', '2024-04-16 20:00:29');
INSERT INTO `user_raffle_order_001`
VALUES (73, 'xiaofuge', 100301, '测试活动', 100006, '964961899096', '2024-04-16 12:00:30', 'used',
        '2024-04-16 20:00:30', '2024-04-16 20:00:30');
INSERT INTO `user_raffle_order_001`
VALUES (74, 'xiaofuge', 100301, '测试活动', 100006, '745921218744', '2024-04-16 12:00:31', 'used',
        '2024-04-16 20:00:30', '2024-04-16 20:00:30');
INSERT INTO `user_raffle_order_001`
VALUES (75, 'xiaofuge', 100301, '测试活动', 100006, '428051896072', '2024-04-16 12:00:31', 'used',
        '2024-04-16 20:00:31', '2024-04-16 20:00:31');
INSERT INTO `user_raffle_order_001`
VALUES (76, 'xiaofuge', 100301, '测试活动', 100006, '755184367840', '2024-04-16 12:00:32', 'used',
        '2024-04-16 20:00:31', '2024-04-16 20:00:31');
INSERT INTO `user_raffle_order_001`
VALUES (77, 'xiaofuge', 100301, '测试活动', 100006, '883260334180', '2024-04-16 12:00:32', 'used',
        '2024-04-16 20:00:32', '2024-04-16 20:00:32');
INSERT INTO `user_raffle_order_001`
VALUES (78, 'xiaofuge', 100301, '测试活动', 100006, '313484595698', '2024-04-16 12:00:33', 'used',
        '2024-04-16 20:00:32', '2024-04-16 20:00:32');
INSERT INTO `user_raffle_order_001`
VALUES (79, 'xiaofuge', 100301, '测试活动', 100006, '494855090202', '2024-04-16 12:00:33', 'used',
        '2024-04-16 20:00:33', '2024-04-16 20:00:33');
INSERT INTO `user_raffle_order_001`
VALUES (80, 'xiaofuge', 100301, '测试活动', 100006, '698332412648', '2024-04-16 12:00:34', 'used',
        '2024-04-16 20:00:33', '2024-04-16 20:00:33');
INSERT INTO `user_raffle_order_001`
VALUES (81, 'xiaofuge', 100301, '测试活动', 100006, '923640245980', '2024-04-16 12:00:43', 'used',
        '2024-04-16 20:00:43', '2024-04-16 20:00:43');
INSERT INTO `user_raffle_order_001`
VALUES (82, 'xiaofuge', 100301, '测试活动', 100006, '102108411006', '2024-04-16 12:00:58', 'used',
        '2024-04-16 20:00:58', '2024-04-16 20:00:58');
INSERT INTO `user_raffle_order_001`
VALUES (83, 'xiaofuge', 100301, '测试活动', 100006, '418363306217', '2024-04-16 12:00:59', 'used',
        '2024-04-16 20:00:58', '2024-04-16 20:00:58');
INSERT INTO `user_raffle_order_001`
VALUES (84, 'xiaofuge', 100301, '测试活动', 100006, '394387287437', '2024-04-16 12:01:00', 'used',
        '2024-04-16 20:01:00', '2024-04-16 20:01:00');
INSERT INTO `user_raffle_order_001`
VALUES (85, 'xiaofuge', 100301, '测试活动', 100006, '198230526034', '2024-04-16 12:01:01', 'used',
        '2024-04-16 20:01:00', '2024-04-16 20:01:00');
INSERT INTO `user_raffle_order_001`
VALUES (86, 'xiaofuge', 100301, '测试活动', 100006, '741350699262', '2024-04-16 12:01:01', 'used',
        '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `user_raffle_order_001`
VALUES (87, 'xiaofuge', 100301, '测试活动', 100006, '061239541486', '2024-04-16 12:01:02', 'used',
        '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `user_raffle_order_001`
VALUES (88, 'xiaofuge', 100301, '测试活动', 100006, '236226143627', '2024-04-16 12:01:02', 'used',
        '2024-04-16 20:01:01', '2024-04-16 20:01:01');
INSERT INTO `user_raffle_order_001`
VALUES (89, 'xiaofuge', 100301, '测试活动', 100006, '956963423680', '2024-04-16 12:01:02', 'used',
        '2024-04-16 20:01:02', '2024-04-16 20:01:02');
INSERT INTO `user_raffle_order_001`
VALUES (90, 'xiaofuge', 100301, '测试活动', 100006, '388834492211', '2024-04-16 12:01:03', 'used',
        '2024-04-16 20:01:02', '2024-04-16 20:01:02');
INSERT INTO `user_raffle_order_001`
VALUES (91, 'xiaofuge', 100301, '测试活动', 100006, '706787629999', '2024-04-16 12:01:03', 'used',
        '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `user_raffle_order_001`
VALUES (92, 'xiaofuge', 100301, '测试活动', 100006, '493668005723', '2024-04-16 12:01:04', 'used',
        '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `user_raffle_order_001`
VALUES (93, 'xiaofuge', 100301, '测试活动', 100006, '064908102891', '2024-04-16 12:01:04', 'used',
        '2024-04-16 20:01:03', '2024-04-16 20:01:03');
INSERT INTO `user_raffle_order_001`
VALUES (94, 'xiaofuge', 100301, '测试活动', 100006, '067088758189', '2024-04-16 12:01:04', 'used',
        '2024-04-16 20:01:04', '2024-04-16 20:01:04');
INSERT INTO `user_raffle_order_001`
VALUES (95, 'xiaofuge', 100301, '测试活动', 100006, '644100987551', '2024-04-16 12:01:09', 'used',
        '2024-04-16 20:01:09', '2024-04-16 20:01:09');
INSERT INTO `user_raffle_order_001`
VALUES (96, 'xiaofuge', 100301, '测试活动', 100006, '651076021848', '2024-04-16 12:01:10', 'used',
        '2024-04-16 20:01:09', '2024-04-16 20:01:09');
INSERT INTO `user_raffle_order_001`
VALUES (97, 'xiaofuge', 100301, '测试活动', 100006, '509447002787', '2024-04-16 12:01:10', 'used',
        '2024-04-16 20:01:10', '2024-04-16 20:01:10');
INSERT INTO `user_raffle_order_001`
VALUES (98, 'xiaofuge', 100301, '测试活动', 100006, '563941619133', '2024-04-16 12:01:11', 'used',
        '2024-04-16 20:01:10', '2024-04-16 20:01:10');
INSERT INTO `user_raffle_order_001`
VALUES (99, 'xiaofuge', 100301, '测试活动', 100006, '075673941243', '2024-04-16 12:20:44', 'used',
        '2024-04-16 20:20:44', '2024-04-16 20:20:44');
INSERT INTO `user_raffle_order_001`
VALUES (100, 'xiaofuge', 100301, '测试活动', 100006, '042511738046', '2024-04-16 12:22:06', 'used',
        '2024-04-16 20:22:05', '2024-04-16 20:22:05');
INSERT INTO `user_raffle_order_001`
VALUES (101, 'xiaofuge', 100301, '测试活动', 100006, '580022051242', '2024-04-16 12:22:28', 'used',
        '2024-04-16 20:22:28', '2024-04-16 20:22:28');
INSERT INTO `user_raffle_order_001`
VALUES (102, 'xiaofuge', 100301, '测试活动', 100006, '422542624189', '2024-04-16 12:25:53', 'used',
        '2024-04-16 20:25:53', '2024-04-16 20:25:53');
INSERT INTO `user_raffle_order_001`
VALUES (103, 'xiaofuge', 100301, '测试活动', 100006, '386176696010', '2024-04-16 12:26:16', 'used',
        '2024-04-16 20:26:16', '2024-04-16 20:26:16');
INSERT INTO `user_raffle_order_001`
VALUES (104, 'xiaofuge', 100301, '测试活动', 100006, '682133402331', '2024-04-16 12:26:17', 'used',
        '2024-04-16 20:26:17', '2024-04-16 20:26:17');
INSERT INTO `user_raffle_order_001`
VALUES (105, 'xiaofuge', 100301, '测试活动', 100006, '697609567403', '2024-04-16 12:26:18', 'used',
        '2024-04-16 20:26:17', '2024-04-16 20:26:17');
INSERT INTO `user_raffle_order_001`
VALUES (106, 'xiaofuge', 100301, '测试活动', 100006, '901759999669', '2024-04-16 12:26:19', 'used',
        '2024-04-16 20:26:18', '2024-04-16 20:26:18');
INSERT INTO `user_raffle_order_001`
VALUES (107, 'xiaofuge', 100301, '测试活动', 100006, '801021133965', '2024-04-16 12:26:19', 'used',
        '2024-04-16 20:26:19', '2024-04-16 20:26:19');
INSERT INTO `user_raffle_order_001`
VALUES (108, 'xiaofuge', 100301, '测试活动', 100006, '364277406059', '2024-04-16 12:26:20', 'used',
        '2024-04-16 20:26:19', '2024-04-16 20:26:19');
INSERT INTO `user_raffle_order_001`
VALUES (109, 'xiaofuge', 100301, '测试活动', 100006, '978944814947', '2024-04-16 12:27:00', 'used',
        '2024-04-16 20:27:00', '2024-04-16 20:27:00');
INSERT INTO `user_raffle_order_001`
VALUES (110, 'xiaofuge', 100301, '测试活动', 100006, '798857082613', '2024-04-16 12:27:01', 'used',
        '2024-04-16 20:27:00', '2024-04-16 20:27:00');
INSERT INTO `user_raffle_order_001`
VALUES (111, 'xiaofuge', 100301, '测试活动', 100006, '454716306171', '2024-04-16 12:27:01', 'used',
        '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `user_raffle_order_001`
VALUES (112, 'xiaofuge', 100301, '测试活动', 100006, '974072865739', '2024-04-16 12:27:02', 'used',
        '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `user_raffle_order_001`
VALUES (113, 'xiaofuge', 100301, '测试活动', 100006, '528448204228', '2024-04-16 12:27:02', 'used',
        '2024-04-16 20:27:01', '2024-04-16 20:27:01');
INSERT INTO `user_raffle_order_001`
VALUES (114, 'xiaofuge', 100301, '测试活动', 100006, '351748749091', '2024-04-16 12:27:02', 'used',
        '2024-04-16 20:27:02', '2024-04-16 20:27:02');
INSERT INTO `user_raffle_order_001`
VALUES (115, 'xiaofuge', 100301, '测试活动', 100006, '186969943723', '2024-04-16 12:27:03', 'used',
        '2024-04-16 20:27:02', '2024-04-16 20:27:02');
INSERT INTO `user_raffle_order_001`
VALUES (116, 'xiaofuge', 100301, '测试活动', 100006, '984730604395', '2024-04-16 12:27:03', 'used',
        '2024-04-16 20:27:03', '2024-04-16 20:27:03');
INSERT INTO `user_raffle_order_001`
VALUES (117, 'xiaofuge', 100301, '测试活动', 100006, '758577431458', '2024-04-16 12:27:04', 'used',
        '2024-04-16 20:27:03', '2024-04-16 20:27:03');
INSERT INTO `user_raffle_order_001`
VALUES (118, 'xiaofuge', 100301, '测试活动', 100006, '149407472091', '2024-04-16 12:27:04', 'used',
        '2024-04-16 20:27:04', '2024-04-16 20:27:04');
INSERT INTO `user_raffle_order_001`
VALUES (119, 'xiaofuge', 100301, '测试活动', 100006, '739746858194', '2024-04-16 13:10:11', 'used',
        '2024-04-16 21:10:10', '2024-04-16 21:10:10');
INSERT INTO `user_raffle_order_001`
VALUES (120, 'xiaofuge', 100301, '测试活动', 100006, '069564772366', '2024-04-16 13:10:12', 'used',
        '2024-04-16 21:10:12', '2024-04-16 21:10:12');
INSERT INTO `user_raffle_order_001`
VALUES (121, 'xiaofuge', 100301, '测试活动', 100006, '073364537170', '2024-04-16 13:10:13', 'used',
        '2024-04-16 21:10:12', '2024-04-16 21:10:12');
INSERT INTO `user_raffle_order_001`
VALUES (122, 'xiaofuge', 100301, '测试活动', 100006, '735184202188', '2024-04-16 13:10:13', 'used',
        '2024-04-16 21:10:13', '2024-04-16 21:10:13');
INSERT INTO `user_raffle_order_001`
VALUES (123, 'xiaofuge', 100301, '测试活动', 100006, '478379900972', '2024-04-16 13:10:14', 'used',
        '2024-04-16 21:10:13', '2024-04-16 21:10:13');
INSERT INTO `user_raffle_order_001`
VALUES (124, 'xiaofuge', 100301, '测试活动', 100006, '708608427147', '2024-04-16 13:10:14', 'used',
        '2024-04-16 21:10:14', '2024-04-16 21:10:14');
INSERT INTO `user_raffle_order_001`
VALUES (125, 'xiaofuge', 100301, '测试活动', 100006, '002534966954', '2024-04-16 13:10:15', 'used',
        '2024-04-16 21:10:14', '2024-04-16 21:10:14');
INSERT INTO `user_raffle_order_001`
VALUES (126, 'xiaofuge', 100301, '测试活动', 100006, '123567253104', '2024-04-16 13:10:15', 'used',
        '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `user_raffle_order_001`
VALUES (127, 'xiaofuge', 100301, '测试活动', 100006, '799052343025', '2024-04-16 13:10:16', 'used',
        '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `user_raffle_order_001`
VALUES (128, 'xiaofuge', 100301, '测试活动', 100006, '337537967551', '2024-04-16 13:10:16', 'used',
        '2024-04-16 21:10:15', '2024-04-16 21:10:15');
INSERT INTO `user_raffle_order_001`
VALUES (129, 'xiaofuge', 100301, '测试活动', 100006, '083208343605', '2024-04-16 13:10:16', 'used',
        '2024-04-16 21:10:16', '2024-04-16 21:10:16');
INSERT INTO `user_raffle_order_001`
VALUES (130, 'xiaofuge', 100301, '测试活动', 100006, '651110440755', '2024-04-16 13:10:17', 'used',
        '2024-04-16 21:10:16', '2024-04-16 21:10:16');
INSERT INTO `user_raffle_order_001`
VALUES (131, 'xiaofuge', 100301, '测试活动', 100006, '971219832040', '2024-04-16 13:13:28', 'used',
        '2024-04-16 21:13:27', '2024-04-16 21:14:15');
INSERT INTO `user_raffle_order_001`
VALUES (132, 'xiaofuge', 100301, '测试活动', 100006, '156686831122', '2024-04-16 13:14:17', 'used',
        '2024-04-16 21:14:17', '2024-04-16 21:14:31');
INSERT INTO `user_raffle_order_001`
VALUES (133, 'xiaofuge', 100301, '测试活动', 100006, '752161888163', '2024-04-16 13:16:42', 'used',
        '2024-04-16 21:16:41', '2024-04-16 21:16:47');
INSERT INTO `user_raffle_order_001`
VALUES (134, 'xiaofuge', 100301, '测试活动', 100006, '643118972351', '2024-04-24 11:38:31', 'used',
        '2024-04-24 19:38:30', '2024-04-24 19:38:30');
INSERT INTO `user_raffle_order_001`
VALUES (135, 'xiaofuge', 100301, '测试活动', 100006, '695413065940', '2024-04-24 11:38:34', 'used',
        '2024-04-24 19:38:34', '2024-04-24 19:38:34');
INSERT INTO `user_raffle_order_001`
VALUES (136, 'xiaofuge', 100301, '测试活动', 100006, '712337688827', '2024-04-24 11:38:35', 'used',
        '2024-04-24 19:38:35', '2024-04-24 19:38:35');
INSERT INTO `user_raffle_order_001`
VALUES (137, 'xiaofuge', 100301, '测试活动', 100006, '559207176141', '2024-04-24 11:38:36', 'used',
        '2024-04-24 19:38:36', '2024-04-24 19:38:36');
INSERT INTO `user_raffle_order_001`
VALUES (138, 'xiaofuge', 100301, '测试活动', 100006, '112844379183', '2024-04-24 11:38:37', 'used',
        '2024-04-24 19:38:36', '2024-04-24 19:38:36');
INSERT INTO `user_raffle_order_001`
VALUES (139, 'xiaofuge', 100301, '测试活动', 100006, '515668944329', '2024-04-24 11:38:37', 'used',
        '2024-04-24 19:38:37', '2024-04-24 19:38:37');
INSERT INTO `user_raffle_order_001`
VALUES (140, 'xiaofuge', 100301, '测试活动', 100006, '956602156443', '2024-04-24 11:46:46', 'used',
        '2024-04-24 19:46:46', '2024-04-24 19:46:46');
INSERT INTO `user_raffle_order_001`
VALUES (141, 'xiaofuge', 100301, '测试活动', 100006, '981680217441', '2024-04-24 11:47:15', 'used',
        '2024-04-24 19:47:14', '2024-04-24 19:47:14');
INSERT INTO `user_raffle_order_001`
VALUES (142, 'xiaofuge', 100301, '测试活动', 100006, '399734717121', '2024-04-24 11:47:15', 'used',
        '2024-04-24 19:47:15', '2024-04-24 19:47:15');
INSERT INTO `user_raffle_order_001`
VALUES (143, 'xiaofuge', 100301, '测试活动', 100006, '728611967870', '2024-04-24 11:47:16', 'used',
        '2024-04-24 19:47:15', '2024-04-24 19:47:15');
INSERT INTO `user_raffle_order_001`
VALUES (144, 'xiaofuge', 100301, '测试活动', 100006, '094605855857', '2024-04-24 11:47:16', 'used',
        '2024-04-24 19:47:16', '2024-04-24 19:47:16');
INSERT INTO `user_raffle_order_001`
VALUES (145, 'xiaofuge', 100301, '测试活动', 100006, '848386699696', '2024-04-24 11:47:17', 'used',
        '2024-04-24 19:47:16', '2024-04-24 19:47:16');
INSERT INTO `user_raffle_order_001`
VALUES (146, 'xiaofuge', 100301, '测试活动', 100006, '472054004647', '2024-04-24 11:50:52', 'used',
        '2024-04-24 19:50:52', '2024-04-24 19:50:52');
INSERT INTO `user_raffle_order_001`
VALUES (147, 'xiaofuge', 100301, '测试活动', 100006, '122567739619', '2024-04-24 11:50:53', 'used',
        '2024-04-24 19:50:52', '2024-04-24 19:50:52');
INSERT INTO `user_raffle_order_001`
VALUES (148, 'xiaofuge', 100301, '测试活动', 100006, '411030832305', '2024-04-24 11:50:54', 'used',
        '2024-04-24 19:50:53', '2024-04-24 19:50:53');
INSERT INTO `user_raffle_order_001`
VALUES (149, 'xiaofuge', 100301, '测试活动', 100006, '652705207303', '2024-04-24 11:50:54', 'used',
        '2024-04-24 19:50:54', '2024-04-24 19:50:54');
INSERT INTO `user_raffle_order_001`
VALUES (150, 'xiaofuge', 100301, '测试活动', 100006, '165693794606', '2024-04-24 11:50:55', 'used',
        '2024-04-24 19:50:55', '2024-04-24 19:50:55');
INSERT INTO `user_raffle_order_001`
VALUES (151, 'xiaofuge', 100301, '测试活动', 100006, '678819665907', '2024-04-24 11:50:56', 'used',
        '2024-04-24 19:50:55', '2024-04-24 19:50:55');
INSERT INTO `user_raffle_order_001`
VALUES (152, 'xiaofuge', 100301, '测试活动', 100006, '644844776894', '2024-04-24 11:50:56', 'used',
        '2024-04-24 19:50:56', '2024-04-24 19:50:56');
INSERT INTO `user_raffle_order_001`
VALUES (153, 'xiaofuge', 100301, '测试活动', 100006, '219183955813', '2024-04-24 11:50:57', 'used',
        '2024-04-24 19:50:56', '2024-04-24 19:50:56');
INSERT INTO `user_raffle_order_001`
VALUES (154, 'xiaofuge', 100301, '测试活动', 100006, '070714513955', '2024-04-24 11:50:58', 'used',
        '2024-04-24 19:50:57', '2024-04-24 19:50:57');
INSERT INTO `user_raffle_order_001`
VALUES (155, 'xiaofuge', 100301, '测试活动', 100006, '915309448571', '2024-04-24 11:50:58', 'used',
        '2024-04-24 19:50:58', '2024-04-24 19:50:58');
INSERT INTO `user_raffle_order_001`
VALUES (156, 'xiaofuge', 100301, '测试活动', 100006, '836079441744', '2024-04-24 11:50:59', 'used',
        '2024-04-24 19:50:58', '2024-04-24 19:50:58');
INSERT INTO `user_raffle_order_001`
VALUES (157, 'xiaofuge', 100301, '测试活动', 100006, '719256272480', '2024-04-24 11:51:00', 'used',
        '2024-04-24 19:51:00', '2024-04-24 19:51:00');
INSERT INTO `user_raffle_order_001`
VALUES (158, 'xiaofuge', 100301, '测试活动', 100006, '420256311100', '2024-04-24 11:51:01', 'used',
        '2024-04-24 19:51:01', '2024-04-24 19:51:01');
INSERT INTO `user_raffle_order_001`
VALUES (159, 'xiaofuge', 100301, '测试活动', 100006, '436341575889', '2024-04-24 11:51:02', 'used',
        '2024-04-24 19:51:02', '2024-04-24 19:51:02');
INSERT INTO `user_raffle_order_001`
VALUES (160, 'xiaofuge', 100301, '测试活动', 100006, '500875419863', '2024-04-24 11:51:54', 'used',
        '2024-04-24 19:51:54', '2024-04-24 19:51:54');
INSERT INTO `user_raffle_order_001`
VALUES (161, 'xiaofuge', 100301, '测试活动', 100006, '446323053241', '2024-04-24 11:51:55', 'used',
        '2024-04-24 19:51:55', '2024-04-24 19:51:55');
INSERT INTO `user_raffle_order_001`
VALUES (162, 'xiaofuge', 100301, '测试活动', 100006, '632926849546', '2024-04-24 11:51:56', 'used',
        '2024-04-24 19:51:55', '2024-04-24 19:51:55');
INSERT INTO `user_raffle_order_001`
VALUES (163, 'xiaofuge', 100301, '测试活动', 100006, '192992710988', '2024-04-24 11:51:57', 'used',
        '2024-04-24 19:51:56', '2024-04-24 19:51:56');
INSERT INTO `user_raffle_order_001`
VALUES (164, 'xiaofuge', 100301, '测试活动', 100006, '247335925420', '2024-04-26 13:27:35', 'used',
        '2024-04-26 21:27:35', '2024-04-26 21:27:35');
INSERT INTO `user_raffle_order_001`
VALUES (165, 'xiaofuge', 100301, '测试活动', 100006, '144726336338', '2024-04-26 13:32:24', 'used',
        '2024-04-26 21:32:24', '2024-04-26 21:32:24');
INSERT INTO `user_raffle_order_001`
VALUES (166, 'xiaofuge', 100301, '测试活动', 100006, '250281606613', '2024-04-26 13:32:26', 'used',
        '2024-04-26 21:32:25', '2024-04-26 21:32:25');
INSERT INTO `user_raffle_order_001`
VALUES (167, 'xiaofuge', 100301, '测试活动', 100006, '438795737251', '2024-04-26 13:32:27', 'used',
        '2024-04-26 21:32:26', '2024-04-26 21:32:26');
INSERT INTO `user_raffle_order_001`
VALUES (168, 'xiaofuge', 100301, '测试活动', 100006, '035079908226', '2024-04-26 13:32:27', 'used',
        '2024-04-26 21:32:27', '2024-04-26 21:32:27');
INSERT INTO `user_raffle_order_001`
VALUES (169, 'xiaofuge', 100301, '测试活动', 100006, '151362802626', '2024-04-26 13:32:28', 'used',
        '2024-04-26 21:32:28', '2024-04-26 21:32:28');
INSERT INTO `user_raffle_order_001`
VALUES (170, 'xiaofuge', 100301, '测试活动', 100006, '257738408165', '2024-04-26 13:32:29', 'used',
        '2024-04-26 21:32:28', '2024-04-26 21:32:28');
INSERT INTO `user_raffle_order_001`
VALUES (171, 'xiaofuge', 100301, '测试活动', 100006, '697127526249', '2024-04-26 13:32:30', 'used',
        '2024-04-26 21:32:29', '2024-04-26 21:32:29');
INSERT INTO `user_raffle_order_001`
VALUES (172, 'xiaofuge', 100301, '测试活动', 100006, '497862658176', '2024-04-26 13:32:30', 'used',
        '2024-04-26 21:32:30', '2024-04-26 21:32:30');
INSERT INTO `user_raffle_order_001`
VALUES (173, 'xiaofuge', 100301, '测试活动', 100006, '168246960367', '2024-04-26 13:32:31', 'used',
        '2024-04-26 21:32:31', '2024-04-26 21:32:31');
INSERT INTO `user_raffle_order_001`
VALUES (174, 'xiaofuge', 100301, '测试活动', 100006, '867224007661', '2024-04-26 13:32:32', 'used',
        '2024-04-26 21:32:31', '2024-04-26 21:32:31');
INSERT INTO `user_raffle_order_001`
VALUES (175, 'xiaofuge', 100301, '测试活动', 100006, '455669309677', '2024-04-26 13:32:39', 'used',
        '2024-04-26 21:32:39', '2024-04-26 21:32:39');
INSERT INTO `user_raffle_order_001`
VALUES (176, 'xiaofuge', 100301, '测试活动', 100006, '644935852963', '2024-04-26 13:32:40', 'used',
        '2024-04-26 21:32:39', '2024-04-26 21:32:39');
INSERT INTO `user_raffle_order_001`
VALUES (177, 'xiaofuge', 100301, '测试活动', 100006, '527522004144', '2024-04-26 13:32:40', 'used',
        '2024-04-26 21:32:40', '2024-04-26 21:32:40');
INSERT INTO `user_raffle_order_001`
VALUES (178, 'xiaofuge', 100301, '测试活动', 100006, '140131960332', '2024-04-26 13:32:42', 'used',
        '2024-04-26 21:32:42', '2024-04-26 21:32:42');
INSERT INTO `user_raffle_order_001`
VALUES (179, 'xiaofuge', 100301, '测试活动', 100006, '400474467470', '2024-04-26 13:32:45', 'used',
        '2024-04-26 21:32:44', '2024-04-26 21:32:44');
INSERT INTO `user_raffle_order_001`
VALUES (180, 'xiaofuge', 100301, '测试活动', 100006, '359094914765', '2024-04-26 13:32:47', 'used',
        '2024-04-26 21:32:46', '2024-04-26 21:32:46');
INSERT INTO `user_raffle_order_001`
VALUES (181, 'xiaofuge', 100301, '测试活动', 100006, '028871362850', '2024-04-26 13:32:48', 'used',
        '2024-04-26 21:32:47', '2024-04-26 21:32:47');
INSERT INTO `user_raffle_order_001`
VALUES (182, 'xiaofuge', 100301, '测试活动', 100006, '898740343646', '2024-04-26 13:32:49', 'used',
        '2024-04-26 21:32:49', '2024-04-26 21:32:49');
INSERT INTO `user_raffle_order_001`
VALUES (183, 'xiaofuge', 100301, '测试活动', 100006, '553107258790', '2024-04-26 13:32:51', 'used',
        '2024-04-26 21:32:50', '2024-04-26 21:32:50');
INSERT INTO `user_raffle_order_001`
VALUES (184, 'xiaofuge', 100301, '测试活动', 100006, '788812386680', '2024-04-26 13:32:51', 'used',
        '2024-04-26 21:32:51', '2024-04-26 21:32:51');
INSERT INTO `user_raffle_order_001`
VALUES (185, 'xiaofuge', 100301, '测试活动', 100006, '651410664768', '2024-04-26 13:32:52', 'used',
        '2024-04-26 21:32:51', '2024-04-26 21:32:52');
INSERT INTO `user_raffle_order_001`
VALUES (186, 'xiaofuge', 100301, '测试活动', 100006, '288689742152', '2024-04-26 13:32:53', 'used',
        '2024-04-26 21:32:52', '2024-04-26 21:32:52');
INSERT INTO `user_raffle_order_001`
VALUES (187, 'xiaofuge', 100301, '测试活动', 100006, '926747612266', '2024-04-26 13:32:53', 'used',
        '2024-04-26 21:32:53', '2024-04-26 21:32:53');
INSERT INTO `user_raffle_order_001`
VALUES (188, 'xiaofuge', 100301, '测试活动', 100006, '866239624617', '2024-04-26 13:32:54', 'used',
        '2024-04-26 21:32:53', '2024-04-26 21:32:53');
INSERT INTO `user_raffle_order_001`
VALUES (189, 'xiaofuge', 100301, '测试活动', 100006, '350364814930', '2024-04-26 13:32:54', 'used',
        '2024-04-26 21:32:54', '2024-04-26 21:32:54');
INSERT INTO `user_raffle_order_001`
VALUES (190, 'xiaofuge', 100301, '测试活动', 100006, '069008524007', '2024-04-26 13:32:55', 'used',
        '2024-04-26 21:32:54', '2024-04-26 21:32:54');
INSERT INTO `user_raffle_order_001`
VALUES (191, 'xiaofuge', 100301, '测试活动', 100006, '389664305851', '2024-04-26 13:32:55', 'used',
        '2024-04-26 21:32:55', '2024-04-26 21:32:55');
INSERT INTO `user_raffle_order_001`
VALUES (192, 'xiaofuge', 100301, '测试活动', 100006, '841894358618', '2024-04-26 13:32:56', 'used',
        '2024-04-26 21:32:56', '2024-04-26 21:32:56');
INSERT INTO `user_raffle_order_001`
VALUES (193, 'xiaofuge', 100301, '测试活动', 100006, '907767461610', '2024-04-26 13:32:57', 'used',
        '2024-04-26 21:32:56', '2024-04-26 21:32:56');
INSERT INTO `user_raffle_order_001`
VALUES (194, 'xiaofuge', 100301, '测试活动', 100006, '618948997206', '2024-04-27 08:55:21', 'used',
        '2024-04-27 16:55:20', '2024-04-27 16:55:20');
INSERT INTO `user_raffle_order_001`
VALUES (195, 'xiaofuge', 100301, '测试活动', 100006, '210852888465', '2024-04-27 08:55:22', 'used',
        '2024-04-27 16:55:21', '2024-04-27 16:55:21');
INSERT INTO `user_raffle_order_001`
VALUES (196, 'xiaofuge', 100301, '测试活动', 100006, '401016807086', '2024-04-27 08:55:23', 'used',
        '2024-04-27 16:55:22', '2024-04-27 16:55:22');
INSERT INTO `user_raffle_order_001`
VALUES (197, 'xiaofuge', 100301, '测试活动', 100006, '122681543586', '2024-04-27 08:55:23', 'used',
        '2024-04-27 16:55:23', '2024-04-27 16:55:23');
INSERT INTO `user_raffle_order_001`
VALUES (198, 'xiaofuge', 100301, '测试活动', 100006, '163159327504', '2024-04-27 09:06:21', 'used',
        '2024-04-27 17:06:21', '2024-04-27 17:06:21');
INSERT INTO `user_raffle_order_001`
VALUES (199, 'xiaofuge', 100301, '测试活动', 100006, '099626936234', '2024-04-27 09:12:21', 'used',
        '2024-04-27 17:12:20', '2024-04-27 17:12:20');
INSERT INTO `user_raffle_order_001`
VALUES (200, 'xiaofuge', 100301, '测试活动', 100006, '548237938959', '2024-04-27 09:12:29', 'used',
        '2024-04-27 17:12:28', '2024-04-27 17:12:28');
INSERT INTO `user_raffle_order_001`
VALUES (201, 'xiaofuge', 100301, '测试活动', 100006, '974255219654', '2024-04-27 09:36:37', 'used',
        '2024-04-27 17:36:37', '2024-04-27 17:36:37');
INSERT INTO `user_raffle_order_001`
VALUES (202, 'xiaofuge', 100301, '测试活动', 100006, '694361457981', '2024-04-27 09:36:44', 'used',
        '2024-04-27 17:36:44', '2024-04-27 17:36:44');
INSERT INTO `user_raffle_order_001`
VALUES (203, 'xiaofuge', 100301, '测试活动', 100006, '588717772228', '2024-04-27 09:36:53', 'used',
        '2024-04-27 17:36:53', '2024-04-27 17:36:53');
INSERT INTO `user_raffle_order_001`
VALUES (204, 'xiaofuge', 100301, '测试活动', 100006, '027582962471', '2024-04-27 09:37:17', 'used',
        '2024-04-27 17:37:17', '2024-04-27 17:37:17');
INSERT INTO `user_raffle_order_001`
VALUES (205, 'xiaofuge', 100301, '测试活动', 100006, '135137709696', '2024-04-27 09:37:34', 'used',
        '2024-04-27 17:37:33', '2024-04-27 17:37:33');
INSERT INTO `user_raffle_order_001`
VALUES (206, 'xiaofuge', 100301, '测试活动', 100006, '271322587857', '2024-04-27 09:37:40', 'used',
        '2024-04-27 17:37:39', '2024-04-27 17:37:39');
INSERT INTO `user_raffle_order_001`
VALUES (207, 'xiaofuge', 100301, '测试活动', 100006, '780560784261', '2024-04-27 09:37:49', 'used',
        '2024-04-27 17:37:48', '2024-04-27 17:37:48');
INSERT INTO `user_raffle_order_001`
VALUES (208, 'xiaofuge', 100301, '测试活动', 100006, '863241463198', '2024-04-27 09:39:06', 'used',
        '2024-04-27 17:39:05', '2024-04-27 17:39:05');
INSERT INTO `user_raffle_order_001`
VALUES (209, 'xiaofuge', 100301, '测试活动', 100006, '751998008662', '2024-04-27 09:41:11', 'used',
        '2024-04-27 17:41:10', '2024-04-27 17:41:10');
INSERT INTO `user_raffle_order_001`
VALUES (210, 'xiaofuge', 100301, '测试活动', 100006, '915689828344', '2024-04-27 09:41:23', 'used',
        '2024-04-27 17:41:22', '2024-04-27 17:41:22');
INSERT INTO `user_raffle_order_001`
VALUES (211, 'xiaofuge', 100301, '测试活动', 100006, '921730517213', '2024-04-27 09:41:30', 'used',
        '2024-04-27 17:41:30', '2024-04-27 17:41:30');
INSERT INTO `user_raffle_order_001`
VALUES (212, 'xiaofuge', 100301, '测试活动', 100006, '377322610365', '2024-04-27 09:41:36', 'used',
        '2024-04-27 17:41:36', '2024-04-27 17:41:36');
INSERT INTO `user_raffle_order_001`
VALUES (213, 'xiaofuge', 100301, '测试活动', 100006, '525164073881', '2024-04-27 09:42:15', 'used',
        '2024-04-27 17:42:15', '2024-04-27 17:42:15');
INSERT INTO `user_raffle_order_001`
VALUES (214, 'xiaofuge', 100301, '测试活动', 100006, '130037011006', '2024-04-27 09:42:23', 'used',
        '2024-04-27 17:42:23', '2024-04-27 17:42:23');
INSERT INTO `user_raffle_order_001`
VALUES (215, 'xiaofuge', 100301, '测试活动', 100006, '979822077992', '2024-04-27 09:42:31', 'used',
        '2024-04-27 17:42:31', '2024-04-27 17:42:31');
INSERT INTO `user_raffle_order_001`
VALUES (216, 'xiaofuge', 100301, '测试活动', 100006, '688707068321', '2024-04-27 09:42:49', 'used',
        '2024-04-27 17:42:48', '2024-04-27 17:42:48');
INSERT INTO `user_raffle_order_001`
VALUES (217, 'xiaofuge', 100301, '测试活动', 100006, '855043559884', '2024-04-27 09:43:44', 'used',
        '2024-04-27 17:43:44', '2024-04-27 17:43:44');
INSERT INTO `user_raffle_order_001`
VALUES (218, 'xiaofuge', 100301, '测试活动', 100006, '091750964388', '2024-04-27 09:45:22', 'used',
        '2024-04-27 17:45:21', '2024-04-27 17:45:21');
INSERT INTO `user_raffle_order_001`
VALUES (219, 'xiaofuge', 100301, '测试活动', 100006, '901542291184', '2024-04-27 09:45:31', 'used',
        '2024-04-27 17:45:31', '2024-04-27 17:45:31');
INSERT INTO `user_raffle_order_001`
VALUES (220, 'xiaofuge', 100301, '测试活动', 100006, '786404822535', '2024-04-27 09:47:41', 'used',
        '2024-04-27 17:47:41', '2024-04-27 17:47:41');
INSERT INTO `user_raffle_order_001`
VALUES (221, 'xiaofuge', 100301, '测试活动', 100006, '678654513346', '2024-04-27 09:50:16', 'used',
        '2024-04-27 17:50:16', '2024-04-27 17:50:16');
INSERT INTO `user_raffle_order_001`
VALUES (222, 'xiaofuge', 100301, '测试活动', 100006, '051193263711', '2024-04-27 09:52:53', 'used',
        '2024-04-27 17:52:52', '2024-04-27 17:52:52');
INSERT INTO `user_raffle_order_001`
VALUES (223, 'xiaofuge', 100301, '测试活动', 100006, '202635544086', '2024-04-27 09:58:03', 'used',
        '2024-04-27 17:58:02', '2024-04-27 17:58:02');
INSERT INTO `user_raffle_order_001`
VALUES (224, 'xiaofuge', 100301, '测试活动', 100006, '329025476435', '2024-04-27 09:58:17', 'used',
        '2024-04-27 17:58:17', '2024-04-27 17:58:17');
INSERT INTO `user_raffle_order_001`
VALUES (225, 'xiaofuge', 100301, '测试活动', 100006, '323291790783', '2024-04-27 10:01:26', 'used',
        '2024-04-27 18:01:26', '2024-04-27 18:01:26');
INSERT INTO `user_raffle_order_001`
VALUES (226, 'xiaofuge', 100301, '测试活动', 100006, '734359306596', '2024-04-27 10:10:20', 'used',
        '2024-04-27 18:10:19', '2024-04-27 18:10:19');
INSERT INTO `user_raffle_order_001`
VALUES (227, 'xiaofuge', 100301, '测试活动', 100006, '273852093653', '2024-04-27 10:47:09', 'used',
        '2024-04-27 18:47:08', '2024-04-27 18:47:08');
INSERT INTO `user_raffle_order_001`
VALUES (228, 'xiaofuge', 100301, '测试活动', 100006, '875811485818', '2024-04-27 10:57:43', 'used',
        '2024-04-27 18:57:43', '2024-04-27 18:57:43');
INSERT INTO `user_raffle_order_001`
VALUES (229, 'xiaofuge', 100301, '测试活动', 100006, '266979859562', '2024-04-27 10:58:18', 'used',
        '2024-04-27 18:58:18', '2024-04-27 18:58:18');
INSERT INTO `user_raffle_order_001`
VALUES (230, 'xiaofuge', 100301, '测试活动', 100006, '028539187924', '2024-04-27 11:04:22', 'used',
        '2024-04-27 19:04:22', '2024-04-27 19:04:22');
INSERT INTO `user_raffle_order_001`
VALUES (231, 'xiaofuge', 100301, '测试活动', 100006, '232388538686', '2024-04-27 11:04:30', 'used',
        '2024-04-27 19:04:30', '2024-04-27 19:04:30');
INSERT INTO `user_raffle_order_001`
VALUES (232, 'xiaofuge', 100301, '测试活动', 100006, '150974751275', '2024-04-27 11:06:40', 'used',
        '2024-04-27 19:06:40', '2024-04-27 19:06:40');
INSERT INTO `user_raffle_order_001`
VALUES (233, 'xiaofuge', 100301, '测试活动', 100006, '436419977678', '2024-04-27 11:08:10', 'used',
        '2024-04-27 19:08:10', '2024-04-27 19:08:10');
INSERT INTO `user_raffle_order_001`
VALUES (234, 'xiaofuge', 100301, '测试活动', 100006, '159858374347', '2024-04-27 11:08:21', 'used',
        '2024-04-27 19:08:20', '2024-04-27 19:08:20');
INSERT INTO `user_raffle_order_001`
VALUES (235, 'xiaofuge', 100301, '测试活动', 100006, '761305363586', '2024-04-27 11:08:24', 'used',
        '2024-04-27 19:08:24', '2024-04-27 19:08:24');
INSERT INTO `user_raffle_order_001`
VALUES (236, 'xiaofuge', 100301, '测试活动', 100006, '929338705563', '2024-04-27 11:09:49', 'used',
        '2024-04-27 19:09:48', '2024-04-27 19:09:48');
INSERT INTO `user_raffle_order_001`
VALUES (237, 'xiaofuge', 100301, '测试活动', 100006, '943974075634', '2024-04-27 11:10:09', 'used',
        '2024-04-27 19:10:08', '2024-04-27 19:10:08');
INSERT INTO `user_raffle_order_001`
VALUES (238, 'xiaofuge', 100301, '测试活动', 100006, '250282259223', '2024-04-27 11:10:13', 'used',
        '2024-04-27 19:10:13', '2024-04-27 19:10:13');
INSERT INTO `user_raffle_order_001`
VALUES (239, 'xiaofuge', 100301, '测试活动', 100006, '477532939653', '2024-04-27 11:10:35', 'used',
        '2024-04-27 19:10:34', '2024-04-27 19:10:34');
INSERT INTO `user_raffle_order_001`
VALUES (240, 'xiaofuge', 100301, '测试活动', 100006, '931774512199', '2024-04-27 11:10:57', 'used',
        '2024-04-27 19:10:57', '2024-04-27 19:10:57');
INSERT INTO `user_raffle_order_001`
VALUES (241, 'xiaofuge', 100301, '测试活动', 100006, '795694093310', '2024-04-27 12:00:32', 'used',
        '2024-04-27 20:00:31', '2024-04-27 20:00:31');
INSERT INTO `user_raffle_order_001`
VALUES (242, 'xiaofuge', 100301, '测试活动', 100006, '222613264981', '2024-04-27 12:00:38', 'used',
        '2024-04-27 20:00:38', '2024-04-27 20:00:38');
INSERT INTO `user_raffle_order_001`
VALUES (243, 'xiaofuge', 100301, '测试活动', 100006, '192368926161', '2024-04-27 12:00:45', 'used',
        '2024-04-27 20:00:44', '2024-04-27 20:00:44');
INSERT INTO `user_raffle_order_001`
VALUES (244, 'xiaofuge', 100301, '测试活动', 100006, '217913955570', '2024-04-27 13:24:05', 'used',
        '2024-04-27 21:24:05', '2024-04-27 21:24:05');
INSERT INTO `user_raffle_order_001`
VALUES (245, 'xiaofuge', 100301, '测试活动', 100006, '952513070008', '2024-04-27 13:24:14', 'used',
        '2024-04-27 21:24:13', '2024-04-27 21:24:13');
INSERT INTO `user_raffle_order_001`
VALUES (246, 'xiaofuge', 100301, '测试活动', 100006, '942405402212', '2024-04-27 13:24:23', 'used',
        '2024-04-27 21:24:23', '2024-04-27 21:24:23');
INSERT INTO `user_raffle_order_001`
VALUES (247, 'xiaofuge', 100301, '测试活动', 100006, '342248203959', '2024-04-27 13:24:50', 'used',
        '2024-04-27 21:24:49', '2024-04-27 21:24:49');
INSERT INTO `user_raffle_order_001`
VALUES (248, 'xiaofuge', 100301, '测试活动', 100006, '442062095325', '2024-04-27 13:50:59', 'used',
        '2024-04-27 21:50:58', '2024-04-27 21:50:58');
INSERT INTO `user_raffle_order_001`
VALUES (249, 'xiaofuge', 100301, '测试活动', 100006, '513966318334', '2024-04-27 13:51:23', 'used',
        '2024-04-27 21:51:23', '2024-04-27 21:51:23');
INSERT INTO `user_raffle_order_001`
VALUES (250, 'xiaofuge', 100301, '测试活动', 100006, '320352223971', '2024-04-27 13:51:48', 'used',
        '2024-04-27 21:51:47', '2024-04-27 21:51:47');
INSERT INTO `user_raffle_order_001`
VALUES (251, 'xiaofuge', 100301, '测试活动', 100006, '893193772901', '2024-04-28 07:36:57', 'used',
        '2024-04-28 15:36:57', '2024-04-28 15:36:57');
INSERT INTO `user_raffle_order_001`
VALUES (252, 'xiaofuge', 100301, '测试活动', 100006, '461737349661', '2024-04-28 07:37:04', 'used',
        '2024-04-28 15:37:04', '2024-04-28 15:37:04');
INSERT INTO `user_raffle_order_001`
VALUES (253, 'xiaofuge', 100301, '测试活动', 100006, '975786804524', '2024-04-28 07:37:10', 'used',
        '2024-04-28 15:37:10', '2024-04-28 15:37:10');
INSERT INTO `user_raffle_order_001`
VALUES (254, 'xiaofuge', 100301, '测试活动', 100006, '978734956179', '2024-04-28 11:07:38', 'used',
        '2024-04-28 19:07:38', '2024-04-28 19:07:38');
INSERT INTO `user_raffle_order_001`
VALUES (255, 'xiaofuge', 100301, '测试活动', 100006, '045645014886', '2024-04-28 11:07:44', 'used',
        '2024-04-28 19:07:43', '2024-04-28 19:07:43');
INSERT INTO `user_raffle_order_001`
VALUES (256, 'xiaofuge', 100301, '测试活动', 100006, '913342953020', '2024-04-28 11:08:50', 'used',
        '2024-04-28 19:08:49', '2024-04-28 19:08:49');
INSERT INTO `user_raffle_order_001`
VALUES (257, 'xiaofuge', 100301, '测试活动', 100006, '774626794326', '2024-04-28 11:08:57', 'used',
        '2024-04-28 19:08:56', '2024-04-28 19:08:56');
INSERT INTO `user_raffle_order_001`
VALUES (258, 'xiaofuge', 100301, '测试活动', 100006, '717146108550', '2024-04-28 11:09:03', 'used',
        '2024-04-28 19:09:02', '2024-04-28 19:09:02');
INSERT INTO `user_raffle_order_001`
VALUES (259, 'xiaofuge', 100301, '测试活动', 100006, '416340324165', '2024-04-28 11:18:43', 'used',
        '2024-04-28 19:18:42', '2024-04-28 19:18:42');
INSERT INTO `user_raffle_order_001`
VALUES (260, 'xiaofuge', 100301, '测试活动', 100006, '064075606435', '2024-04-28 11:19:14', 'used',
        '2024-04-28 19:19:14', '2024-04-28 19:19:14');
INSERT INTO `user_raffle_order_001`
VALUES (261, 'xiaofuge', 100301, '测试活动', 100006, '225600232609', '2024-04-28 11:19:22', 'used',
        '2024-04-28 19:19:21', '2024-04-28 19:19:21');
INSERT INTO `user_raffle_order_001`
VALUES (262, 'xiaofuge', 100301, '测试活动', 100006, '190335519553', '2024-04-28 11:19:28', 'used',
        '2024-04-28 19:19:27', '2024-04-28 19:19:27');
INSERT INTO `user_raffle_order_001`
VALUES (263, 'xiaofuge', 100301, '测试活动', 100006, '807971592042', '2024-04-28 11:19:33', 'used',
        '2024-04-28 19:19:33', '2024-04-28 19:19:33');
INSERT INTO `user_raffle_order_001`
VALUES (264, 'xiaofuge', 100301, '测试活动', 100006, '056038658940', '2024-04-28 11:19:39', 'used',
        '2024-04-28 19:19:38', '2024-04-28 19:19:38');
INSERT INTO `user_raffle_order_001`
VALUES (265, 'xiaofuge', 100301, '测试活动', 100006, '617672918562', '2024-04-28 11:19:44', 'used',
        '2024-04-28 19:19:44', '2024-04-28 19:19:44');
INSERT INTO `user_raffle_order_001`
VALUES (266, 'xiaofuge', 100301, '测试活动', 100006, '248534142132', '2024-04-28 11:28:15', 'used',
        '2024-04-28 19:28:15', '2024-04-28 19:28:15');
INSERT INTO `user_raffle_order_001`
VALUES (267, 'xiaofuge', 100301, '测试活动', 100006, '518781281451', '2024-04-28 11:39:05', 'used',
        '2024-04-28 19:39:04', '2024-04-28 19:39:04');
INSERT INTO `user_raffle_order_001`
VALUES (268, 'xiaofuge', 100301, '测试活动', 100006, '547607636345', '2024-04-28 11:39:11', 'used',
        '2024-04-28 19:39:10', '2024-04-28 19:39:10');
INSERT INTO `user_raffle_order_001`
VALUES (269, 'xiaofuge', 100301, '测试活动', 100006, '700018830503', '2024-04-28 11:39:17', 'used',
        '2024-04-28 19:39:17', '2024-04-28 19:39:17');
INSERT INTO `user_raffle_order_001`
VALUES (270, 'xiaofuge', 100301, '测试活动', 100006, '787616893805', '2024-04-28 11:39:23', 'used',
        '2024-04-28 19:39:23', '2024-04-28 19:39:23');
INSERT INTO `user_raffle_order_001`
VALUES (271, 'xiaofuge', 100301, '测试活动', 100006, '873287594422', '2024-04-28 11:39:29', 'used',
        '2024-04-28 19:39:29', '2024-04-28 19:39:29');
INSERT INTO `user_raffle_order_001`
VALUES (272, 'xiaofuge', 100301, '测试活动', 100006, '257035888229', '2024-04-28 11:39:41', 'used',
        '2024-04-28 19:39:40', '2024-04-28 19:39:40');
INSERT INTO `user_raffle_order_001`
VALUES (273, 'xiaofuge', 100301, '测试活动', 100006, '387566830398', '2024-04-28 11:42:07', 'used',
        '2024-04-28 19:42:06', '2024-04-28 19:42:06');
INSERT INTO `user_raffle_order_001`
VALUES (274, 'xiaofuge', 100301, '测试活动', 100006, '925412938600', '2024-04-28 11:42:38', 'used',
        '2024-04-28 19:42:37', '2024-04-28 19:42:37');
INSERT INTO `user_raffle_order_001`
VALUES (275, 'xiaofuge', 100301, '测试活动', 100006, '280640719706', '2024-04-28 11:42:46', 'used',
        '2024-04-28 19:42:46', '2024-04-28 19:42:46');
INSERT INTO `user_raffle_order_001`
VALUES (276, 'xiaofuge', 100301, '测试活动', 100006, '327600334766', '2024-04-28 11:42:53', 'used',
        '2024-04-28 19:42:53', '2024-04-28 19:42:53');
INSERT INTO `user_raffle_order_001`
VALUES (277, 'xiaofuge', 100301, '测试活动', 100006, '744816949240', '2024-04-28 11:42:59', 'used',
        '2024-04-28 19:42:59', '2024-04-28 19:42:59');
INSERT INTO `user_raffle_order_001`
VALUES (278, 'xiaofuge', 100301, '测试活动', 100006, '960236602196', '2024-04-28 11:43:05', 'used',
        '2024-04-28 19:43:05', '2024-04-28 19:43:05');
INSERT INTO `user_raffle_order_001`
VALUES (279, 'xiaofuge', 100301, '测试活动', 100006, '348372462424', '2024-04-28 11:43:16', 'used',
        '2024-04-28 19:43:15', '2024-04-28 19:43:15');
INSERT INTO `user_raffle_order_001`
VALUES (280, 'xiaofuge', 100301, '测试活动', 100006, '288632943203', '2024-04-28 11:43:22', 'used',
        '2024-04-28 19:43:22', '2024-04-28 19:43:22');
INSERT INTO `user_raffle_order_001`
VALUES (281, 'xiaofuge', 100301, '测试活动', 100006, '510423373500', '2024-04-28 11:44:12', 'used',
        '2024-04-28 19:44:12', '2024-04-28 19:44:12');
INSERT INTO `user_raffle_order_001`
VALUES (282, 'xiaofuge', 100301, '测试活动', 100006, '785817771013', '2024-04-28 11:44:20', 'used',
        '2024-04-28 19:44:19', '2024-04-28 19:44:19');
INSERT INTO `user_raffle_order_001`
VALUES (283, 'xiaofuge', 100301, '测试活动', 100006, '803561160229', '2024-04-28 11:44:27', 'used',
        '2024-04-28 19:44:26', '2024-04-28 19:44:26');
INSERT INTO `user_raffle_order_001`
VALUES (284, 'xiaofuge', 100301, '测试活动', 100006, '461201719958', '2024-04-28 11:44:34', 'used',
        '2024-04-28 19:44:33', '2024-04-28 19:44:33');
INSERT INTO `user_raffle_order_001`
VALUES (285, 'xiaofuge', 100301, '测试活动', 100006, '642439076011', '2024-04-28 11:44:53', 'used',
        '2024-04-28 19:44:52', '2024-04-28 19:44:52');
INSERT INTO `user_raffle_order_001`
VALUES (286, 'xiaofuge', 100301, '测试活动', 100006, '639402032708', '2024-04-28 11:46:03', 'used',
        '2024-04-28 19:46:02', '2024-04-28 19:46:02');
INSERT INTO `user_raffle_order_001`
VALUES (287, 'xiaofuge', 100301, '测试活动', 100006, '136951519719', '2024-04-28 11:46:09', 'used',
        '2024-04-28 19:46:09', '2024-04-28 19:46:09');
INSERT INTO `user_raffle_order_001`
VALUES (288, 'xiaofuge', 100301, '测试活动', 100006, '090954195605', '2024-04-28 11:46:15', 'used',
        '2024-04-28 19:46:15', '2024-04-28 19:46:15');
INSERT INTO `user_raffle_order_001`
VALUES (289, 'xiaofuge', 100301, '测试活动', 100006, '715083933134', '2024-04-28 12:07:10', 'used',
        '2024-04-28 20:07:09', '2024-04-28 20:07:09');
INSERT INTO `user_raffle_order_001`
VALUES (290, 'xiaofuge', 100301, '测试活动', 100006, '088480240833', '2024-04-28 12:21:31', 'used',
        '2024-04-28 20:21:30', '2024-04-28 20:21:30');
INSERT INTO `user_raffle_order_001`
VALUES (291, 'xiaofuge', 100301, '测试活动', 100006, '538675127691', '2024-04-28 12:22:58', 'used',
        '2024-04-28 20:22:58', '2024-04-28 20:22:58');
INSERT INTO `user_raffle_order_001`
VALUES (292, 'xiaofuge', 100301, '测试活动', 100006, '952324644805', '2024-04-28 13:28:07', 'used',
        '2024-04-28 21:28:07', '2024-04-28 21:28:07');
INSERT INTO `user_raffle_order_001`
VALUES (293, 'xiaofuge', 100301, '测试活动', 100006, '310767906901', '2024-04-28 13:28:44', 'used',
        '2024-04-28 21:28:43', '2024-04-28 21:28:43');

-- ----------------------------
-- Table structure for user_raffle_order_002
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_002`;
CREATE TABLE `user_raffle_order_002`
(
    `id`            int UNSIGNED                                                 NOT NULL AUTO_INCREMENT,
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`   bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`   bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`    datetime                                                     NOT NULL COMMENT '下单时间',
    `order_state`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
    `create_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_002
-- ----------------------------

-- ----------------------------
-- Table structure for user_raffle_order_003
-- ----------------------------
DROP TABLE IF EXISTS `user_raffle_order_003`;
CREATE TABLE `user_raffle_order_003`
(
    `id`            int UNSIGNED                                                 NOT NULL AUTO_INCREMENT,
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
    `activity_id`   bigint                                                       NOT NULL COMMENT '活动ID',
    `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '活动名称',
    `strategy_id`   bigint                                                       NOT NULL COMMENT '抽奖策略ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订单ID',
    `order_time`    datetime                                                     NOT NULL COMMENT '下单时间',
    `order_state`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
    `create_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `uq_order_id` (`order_id` ASC) USING BTREE,
    INDEX `idx_user_id_activity_id` (`user_id` ASC, `activity_id` ASC) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户抽奖订单表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_raffle_order_003
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;


DROP TABLE IF EXISTS `user_behavior_rebate_order_000`;
CREATE TABLE `user_behavior_rebate_order_000`
(
    `id`            int                                                           NOT NULL COMMENT '自增ID',
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '订单id',
    `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '行为类型【签到，Openai支付】',
    `rebate_desc`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
    `rebate_type`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利类型：sku【sku发奖次数】、integral【积分】',
    `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利配置值',
    `biz_id`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '业务ID，唯一值',
    `create_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `user_behavior_rebate_order_001`;
CREATE TABLE `user_behavior_rebate_order_001`
(
    `id`            int                                                           NOT NULL COMMENT '自增ID',
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '订单id',
    `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '行为类型【签到，Openai支付】',
    `rebate_desc`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
    `rebate_type`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利类型：sku【sku发奖次数】、integral【积分】',
    `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利配置值',
    `biz_id`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '业务ID，唯一值',
    `create_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `user_behavior_rebate_order_002`;
CREATE TABLE `user_behavior_rebate_order_002`
(
    `id`            int                                                           NOT NULL COMMENT '自增ID',
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '订单id',
    `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '行为类型【签到，Openai支付】',
    `rebate_desc`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
    `rebate_type`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利类型：sku【sku发奖次数】、integral【积分】',
    `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利配置值',
    `biz_id`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '业务ID，唯一值',
    `create_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

DROP TABLE IF EXISTS `user_behavior_rebate_order_003`;
CREATE TABLE `user_behavior_rebate_order_003`
(
    `id`            int                                                           NOT NULL COMMENT '自增ID',
    `user_id`       varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '用户ID',
    `order_id`      varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '订单id',
    `behavior_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '行为类型【签到，Openai支付】',
    `rebate_desc`   varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '返利描述',
    `rebate_type`   varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利类型：sku【sku发奖次数】、integral【积分】',
    `rebate_config` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '返利配置值',
    `biz_id`        varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL COMMENT '业务ID，唯一值',
    `create_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`   datetime                                                      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;
