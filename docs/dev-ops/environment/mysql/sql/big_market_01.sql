# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_01
# 生成时间: 2024-03-23 07:33:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO', SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

CREATE database if NOT EXISTS `big_market_01` default character set utf8mb4;
use `big_market_01`;

# 转储表 raffle_activity_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account`;

CREATE TABLE `raffle_activity_account`
(
    `id`                  bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`             varchar(32)         NOT NULL COMMENT '用户ID',
    `activity_id`         bigint(12)          NOT NULL COMMENT '活动ID',
    `total_count`         int(8)              NOT NULL COMMENT '总次数',
    `total_count_surplus` int(8)              NOT NULL COMMENT '总次数-剩余',
    `day_count`           int(8)              NOT NULL COMMENT '日次数',
    `day_count_surplus`   int(8)              NOT NULL COMMENT '日次数-剩余',
    `month_count`         int(8)              NOT NULL COMMENT '月次数',
    `month_count_surplus` int(8)              NOT NULL COMMENT '月次数-剩余',
    `create_time`         datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`         datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_user_id_activity_id` (`user_id`, `activity_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动账户表';

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account`
    DISABLE KEYS */;

INSERT INTO `raffle_activity_account` (`id`, `user_id`, `activity_id`, `total_count`, `total_count_surplus`,
                                       `day_count`, `day_count_surplus`, `month_count`, `month_count_surplus`,
                                       `create_time`, `update_time`)
VALUES (2, 'xiaofuge', 100301, 4, 3, 4, 3, 4, 3, '2024-03-23 12:40:56', '2024-03-23 13:16:40');

/*!40000 ALTER TABLE `raffle_activity_account`
    ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_000`;

CREATE TABLE `raffle_activity_order_000`
(
    `id`              bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32)         NOT NULL COMMENT '用户ID',
    `sku`             bigint(12)          NOT NULL COMMENT '商品sku',
    `activity_id`     bigint(12)          NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64)         NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint(8)           NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(19)         NOT NULL COMMENT '订单ID',
    `order_time`      datetime            NOT NULL COMMENT '下单时间',
    `total_count`     int(8)              NOT NULL COMMENT '总次数',
    `day_count`       int(8)              NOT NULL COMMENT '日次数',
    `month_count`     int(8)              NOT NULL COMMENT '月次数',
    `state`           varchar(16)         NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64)         NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_order_id` (`order_id`),
    UNIQUE KEY `uq_out_business_no` (`out_business_no`),
    KEY `idx_user_id_activity_id` (`user_id`, `activity_id`, `state`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动单';



# 转储表 raffle_activity_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_001`;

CREATE TABLE `raffle_activity_order_001`
(
    `id`              bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32)         NOT NULL COMMENT '用户ID',
    `sku`             bigint(12)          NOT NULL COMMENT '商品sku',
    `activity_id`     bigint(12)          NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64)         NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint(8)           NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(19)         NOT NULL COMMENT '订单ID',
    `order_time`      datetime            NOT NULL COMMENT '下单时间',
    `total_count`     int(8)              NOT NULL COMMENT '总次数',
    `day_count`       int(8)              NOT NULL COMMENT '日次数',
    `month_count`     int(8)              NOT NULL COMMENT '月次数',
    `state`           varchar(16)         NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64)         NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_order_id` (`order_id`),
    UNIQUE KEY `uq_out_business_no` (`out_business_no`),
    KEY `idx_user_id_activity_id` (`user_id`, `activity_id`, `state`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动单';


# 转储表 raffle_activity_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_002`;

CREATE TABLE `raffle_activity_order_002`
(
    `id`              bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32)         NOT NULL COMMENT '用户ID',
    `sku`             bigint(12)          NOT NULL COMMENT '商品sku',
    `activity_id`     bigint(12)          NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64)         NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint(8)           NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(19)         NOT NULL COMMENT '订单ID',
    `order_time`      datetime            NOT NULL COMMENT '下单时间',
    `total_count`     int(8)              NOT NULL COMMENT '总次数',
    `day_count`       int(8)              NOT NULL COMMENT '日次数',
    `month_count`     int(8)              NOT NULL COMMENT '月次数',
    `state`           varchar(16)         NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64)         NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_order_id` (`order_id`),
    UNIQUE KEY `uq_out_business_no` (`out_business_no`),
    KEY `idx_user_id_activity_id` (`user_id`, `activity_id`, `state`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动单';



# 转储表 raffle_activity_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_003`;

CREATE TABLE `raffle_activity_order_003`
(
    `id`              bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
    `user_id`         varchar(32)         NOT NULL COMMENT '用户ID',
    `sku`             bigint(12)          NOT NULL COMMENT '商品sku',
    `activity_id`     bigint(12)          NOT NULL COMMENT '活动ID',
    `activity_name`   varchar(64)         NOT NULL COMMENT '活动名称',
    `strategy_id`     bigint(8)           NOT NULL COMMENT '抽奖策略ID',
    `order_id`        varchar(19)         NOT NULL COMMENT '订单ID',
    `order_time`      datetime            NOT NULL COMMENT '下单时间',
    `total_count`     int(8)              NOT NULL COMMENT '总次数',
    `day_count`       int(8)              NOT NULL COMMENT '日次数',
    `month_count`     int(8)              NOT NULL COMMENT '月次数',
    `state`           varchar(16)         NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
    `out_business_no` varchar(64)         NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
    `create_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`     datetime            NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_order_id` (`order_id`),
    UNIQUE KEY `uq_out_business_no` (`out_business_no`),
    KEY `idx_user_id_activity_id` (`user_id`, `activity_id`, `state`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4 COMMENT ='抽奖活动单';



/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
