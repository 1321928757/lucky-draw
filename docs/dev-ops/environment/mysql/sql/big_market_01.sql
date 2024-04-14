# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market_01
# 生成时间: 2024-04-06 08:41:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market_01` default character set utf8mb4;
use `big_market_01`;

# 转储表 raffle_activity_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account`;

CREATE TABLE `raffle_activity_account` (
                                           `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                           `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                           `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                           `total_count` int(8) NOT NULL COMMENT '总次数',
                                           `total_count_surplus` int(8) NOT NULL COMMENT '总次数-剩余',
                                           `day_count` int(8) NOT NULL COMMENT '日次数',
                                           `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
                                           `month_count` int(8) NOT NULL COMMENT '月次数',
                                           `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
                                           `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                           `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                           PRIMARY KEY (`id`),
                                           UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表';

LOCK TABLES `raffle_activity_account` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account` DISABLE KEYS */;

INSERT INTO `raffle_activity_account` (`id`, `user_id`, `activity_id`, `total_count`, `total_count_surplus`, `day_count`, `day_count_surplus`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
    (3,'xiaofuge',100301,45,44,45,45,45,45,'2024-03-23 16:38:57','2024-04-05 17:10:31');

/*!40000 ALTER TABLE `raffle_activity_account` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_day
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_day`;

CREATE TABLE `raffle_activity_account_day` (
                                               `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                               `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                               `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                               `day` varchar(10) NOT NULL COMMENT '日期（yyyy-mm-dd）',
                                               `day_count` int(8) NOT NULL COMMENT '日次数',
                                               `day_count_surplus` int(8) NOT NULL COMMENT '日次数-剩余',
                                               `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                               `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                               PRIMARY KEY (`id`),
                                               UNIQUE KEY `uq_user_id_activity_id_day` (`user_id`,`activity_id`,`day`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-日次数';

LOCK TABLES `raffle_activity_account_day` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_day` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_day` (`id`, `user_id`, `activity_id`, `day`, `day_count`, `day_count_surplus`, `create_time`, `update_time`)
VALUES
    (2,'xiaofuge',100301,'2024-04-05',45,44,'2024-04-05 17:10:31','2024-04-05 17:10:31');

/*!40000 ALTER TABLE `raffle_activity_account_day` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_account_month
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_month`;

CREATE TABLE `raffle_activity_account_month` (
                                                 `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                                 `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                                 `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                                 `month` varchar(7) NOT NULL COMMENT '月（yyyy-mm）',
                                                 `month_count` int(8) NOT NULL COMMENT '月次数',
                                                 `month_count_surplus` int(8) NOT NULL COMMENT '月次数-剩余',
                                                 `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                                 `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                                 PRIMARY KEY (`id`),
                                                 UNIQUE KEY `uq_user_id_activity_id_month` (`user_id`,`activity_id`,`month`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表-月次数';

LOCK TABLES `raffle_activity_account_month` WRITE;
/*!40000 ALTER TABLE `raffle_activity_account_month` DISABLE KEYS */;

INSERT INTO `raffle_activity_account_month` (`id`, `user_id`, `activity_id`, `month`, `month_count`, `month_count_surplus`, `create_time`, `update_time`)
VALUES
    (5,'xiaofuge',100301,'2024-04',45,44,'2024-04-05 17:10:31','2024-04-05 17:10:31');

/*!40000 ALTER TABLE `raffle_activity_account_month` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_000`;

CREATE TABLE `raffle_activity_order_000` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 raffle_activity_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_001`;

CREATE TABLE `raffle_activity_order_001` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_001` (`id`, `user_id`, `sku`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `total_count`, `day_count`, `month_count`, `state`, `out_business_no`, `create_time`, `update_time`)
VALUES
    (10,'xiaofuge',9011,100301,'测试活动',100006,'973296627434','2024-03-23 08:38:58',1,1,1,'completed','700091009111','2024-03-23 16:38:57','2024-03-23 16:38:57'),
    (11,'xiaofuge',9011,100301,'测试活动',100006,'659722993182','2024-03-23 09:38:54',1,1,1,'completed','700091009112','2024-03-23 17:38:54','2024-03-23 17:38:54'),
    (13,'xiaofuge',9011,100301,'测试活动',100006,'773767968094','2024-03-23 09:40:11',1,1,1,'completed','700091009113','2024-03-23 17:40:10','2024-03-23 17:40:10'),
    (14,'xiaofuge',9011,100301,'测试活动',100006,'977898032977','2024-03-30 04:13:20',1,1,1,'completed','562827683573','2024-03-30 12:13:20','2024-03-30 12:13:20'),
    (15,'xiaofuge',9011,100301,'测试活动',100006,'981492025457','2024-03-30 05:17:51',1,1,1,'completed','827130794336','2024-03-30 13:17:51','2024-03-30 13:17:51'),
    (16,'xiaofuge',9011,100301,'测试活动',100006,'119662227336','2024-03-30 05:17:51',1,1,1,'completed','150844059982','2024-03-30 13:17:51','2024-03-30 13:17:51'),
    (17,'xiaofuge',9011,100301,'测试活动',100006,'690133201288','2024-03-30 05:33:39',1,1,1,'completed','953370122326','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (18,'xiaofuge',9011,100301,'测试活动',100006,'593200667289','2024-03-30 05:33:39',1,1,1,'completed','111390727659','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (19,'xiaofuge',9011,100301,'测试活动',100006,'980711076393','2024-03-30 05:33:39',1,1,1,'completed','039423474452','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (20,'xiaofuge',9011,100301,'测试活动',100006,'551375935033','2024-03-30 05:33:39',1,1,1,'completed','280668320055','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (21,'xiaofuge',9011,100301,'测试活动',100006,'716528762190','2024-03-30 05:33:39',1,1,1,'completed','330472003431','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (22,'xiaofuge',9011,100301,'测试活动',100006,'644880195681','2024-03-30 05:33:39',1,1,1,'completed','896655771302','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (23,'xiaofuge',9011,100301,'测试活动',100006,'918009421723','2024-03-30 05:33:39',1,1,1,'completed','223114193931','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (24,'xiaofuge',9011,100301,'测试活动',100006,'414038400484','2024-03-30 05:33:39',1,1,1,'completed','669801912616','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (25,'xiaofuge',9011,100301,'测试活动',100006,'819052152409','2024-03-30 05:33:40',1,1,1,'completed','968823148813','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (26,'xiaofuge',9011,100301,'测试活动',100006,'013685589273','2024-03-30 05:33:40',1,1,1,'completed','281985691959','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (27,'xiaofuge',9011,100301,'测试活动',100006,'694790983278','2024-03-30 05:33:40',1,1,1,'completed','812013952722','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (28,'xiaofuge',9011,100301,'测试活动',100006,'601285862715','2024-03-30 05:33:40',1,1,1,'completed','102122841078','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (29,'xiaofuge',9011,100301,'测试活动',100006,'278549779124','2024-03-30 05:33:40',1,1,1,'completed','795697718772','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (30,'xiaofuge',9011,100301,'测试活动',100006,'867889977246','2024-03-30 05:33:40',1,1,1,'completed','419196278242','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (31,'xiaofuge',9011,100301,'测试活动',100006,'270946272407','2024-03-30 05:33:40',1,1,1,'completed','297043861965','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (32,'xiaofuge',9011,100301,'测试活动',100006,'798392711746','2024-03-30 05:33:40',1,1,1,'completed','721157339512','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (33,'xiaofuge',9011,100301,'测试活动',100006,'037305996439','2024-03-30 05:33:40',1,1,1,'completed','088008719855','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (34,'xiaofuge',9011,100301,'测试活动',100006,'015056893123','2024-03-30 05:33:40',1,1,1,'completed','885793880817','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (35,'xiaofuge',9011,100301,'测试活动',100006,'422734098553','2024-03-30 05:33:40',1,1,1,'completed','048066377262','2024-03-30 13:33:39','2024-03-30 13:33:39'),
    (36,'xiaofuge',9011,100301,'测试活动',100006,'125534021547','2024-03-30 09:10:06',1,1,1,'completed','237913144976','2024-03-30 17:10:05','2024-03-30 17:10:05'),
    (37,'xiaofuge',9011,100301,'测试活动',100006,'906577205018','2024-03-30 09:10:06',1,1,1,'completed','257763123780','2024-03-30 17:10:05','2024-03-30 17:10:05'),
    (38,'xiaofuge',9011,100301,'测试活动',100006,'577878467308','2024-03-30 09:10:06',1,1,1,'completed','690370155629','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (39,'xiaofuge',9011,100301,'测试活动',100006,'130934158588','2024-03-30 09:10:06',1,1,1,'completed','864303749107','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (40,'xiaofuge',9011,100301,'测试活动',100006,'484575318240','2024-03-30 09:10:06',1,1,1,'completed','355946107906','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (41,'xiaofuge',9011,100301,'测试活动',100006,'334219563572','2024-03-30 09:10:06',1,1,1,'completed','629679608889','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (42,'xiaofuge',9011,100301,'测试活动',100006,'905424061364','2024-03-30 09:10:06',1,1,1,'completed','766840362369','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (43,'xiaofuge',9011,100301,'测试活动',100006,'081184848765','2024-03-30 09:10:06',1,1,1,'completed','805402859227','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (44,'xiaofuge',9011,100301,'测试活动',100006,'245273095853','2024-03-30 09:10:06',1,1,1,'completed','333924242550','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (45,'xiaofuge',9011,100301,'测试活动',100006,'645786614176','2024-03-30 09:10:06',1,1,1,'completed','709012965465','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (46,'xiaofuge',9011,100301,'测试活动',100006,'976098448519','2024-03-30 09:10:06',1,1,1,'completed','076464685314','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (47,'xiaofuge',9011,100301,'测试活动',100006,'359533807959','2024-03-30 09:10:06',1,1,1,'completed','501769140520','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (48,'xiaofuge',9011,100301,'测试活动',100006,'069825222776','2024-03-30 09:10:06',1,1,1,'completed','362857642896','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (49,'xiaofuge',9011,100301,'测试活动',100006,'793595913277','2024-03-30 09:10:06',1,1,1,'completed','886499146967','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (50,'xiaofuge',9011,100301,'测试活动',100006,'591290337369','2024-03-30 09:10:06',1,1,1,'completed','756466322485','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (51,'xiaofuge',9011,100301,'测试活动',100006,'216203170946','2024-03-30 09:10:06',1,1,1,'completed','616831586240','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (52,'xiaofuge',9011,100301,'测试活动',100006,'331973376483','2024-03-30 09:10:06',1,1,1,'completed','809200206672','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (53,'xiaofuge',9011,100301,'测试活动',100006,'358968919391','2024-03-30 09:10:06',1,1,1,'completed','619112026689','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (54,'xiaofuge',9011,100301,'测试活动',100006,'094263379883','2024-03-30 09:10:06',1,1,1,'completed','746237303851','2024-03-30 17:10:06','2024-03-30 17:10:06'),
    (56,'xiaofuge',9011,100301,'测试活动',100006,'381900087970','2024-04-05 06:19:30',1,1,1,'completed','700091009119','2024-04-05 14:19:30','2024-04-05 14:19:30');

/*!40000 ALTER TABLE `raffle_activity_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_002`;

CREATE TABLE `raffle_activity_order_002` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 raffle_activity_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_003`;

CREATE TABLE `raffle_activity_order_003` (
                                             `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                             `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                             `sku` bigint(12) NOT NULL COMMENT '商品sku',
                                             `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                             `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                             `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                             `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                             `order_time` datetime NOT NULL COMMENT '下单时间',
                                             `total_count` int(8) NOT NULL COMMENT '总次数',
                                             `day_count` int(8) NOT NULL COMMENT '日次数',
                                             `month_count` int(8) NOT NULL COMMENT '月次数',
                                             `state` varchar(16) NOT NULL DEFAULT 'complete' COMMENT '订单状态（complete）',
                                             `out_business_no` varchar(64) NOT NULL COMMENT '业务仿重ID - 外部透传的，确保幂等',
                                             `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                             `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
                                             PRIMARY KEY (`id`),
                                             UNIQUE KEY `uq_order_id` (`order_id`),
                                             UNIQUE KEY `uq_out_business_no` (`out_business_no`),
                                             KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';



# 转储表 task
# ------------------------------------------------------------

DROP TABLE IF EXISTS `task`;

CREATE TABLE `task` (
                        `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                        `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                        `topic` varchar(32) NOT NULL COMMENT '消息主题',
                        `message_id` varchar(11) DEFAULT NULL COMMENT '消息编号',
                        `message` varchar(512) NOT NULL COMMENT '消息主体',
                        `state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '任务状态；create-创建、completed-完成、fail-失败',
                        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `uq_message_id` (`message_id`),
                        KEY `idx_state` (`state`),
                        KEY `idx_create_time` (`update_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='任务表，发送MQ';

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;

INSERT INTO `task` (`id`, `user_id`, `topic`, `message_id`, `message`, `state`, `create_time`, `update_time`)
VALUES
    (1,'xiaofuge','send_award','23913710462','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"23913710462\",\"timestamp\":1712374909975}','completed','2024-04-06 11:41:50','2024-04-06 12:14:50'),
    (2,'xiaofuge','send_award','33004806135','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33004806135\",\"timestamp\":1712375273609}','completed','2024-04-06 11:47:54','2024-04-06 12:14:50'),
    (3,'xiaofuge','send_award','61315401992','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61315401992\",\"timestamp\":1712377009778}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (4,'xiaofuge','send_award','74920280321','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"74920280321\",\"timestamp\":1712377010878}','completed','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (5,'xiaofuge','send_award','71692388884','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"71692388884\",\"timestamp\":1712377011390}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (6,'xiaofuge','send_award','11524874230','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11524874230\",\"timestamp\":1712377011913}','completed','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (7,'xiaofuge','send_award','39972412889','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39972412889\",\"timestamp\":1712377012434}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (8,'xiaofuge','send_award','79019640497','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"79019640497\",\"timestamp\":1712377012955}','completed','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (9,'xiaofuge','send_award','97077031398','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97077031398\",\"timestamp\":1712377013498}','completed','2024-04-06 12:16:53','2024-04-06 12:16:53'),
    (10,'xiaofuge','send_award','08720582836','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08720582836\",\"timestamp\":1712377014017}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (11,'xiaofuge','send_award','60787815183','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"60787815183\",\"timestamp\":1712377014529}','completed','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (12,'xiaofuge','send_award','97145040946','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"97145040946\",\"timestamp\":1712377015040}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (13,'xiaofuge','send_award','40165031868','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"40165031868\",\"timestamp\":1712377015553}','completed','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (14,'xiaofuge','send_award','31142176572','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"31142176572\",\"timestamp\":1712377016066}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (15,'xiaofuge','send_award','54723488249','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"54723488249\",\"timestamp\":1712377016577}','completed','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (16,'xiaofuge','send_award','94553316274','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"94553316274\",\"timestamp\":1712377017090}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
    (17,'xiaofuge','send_award','47638237311','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"47638237311\",\"timestamp\":1712377017601}','completed','2024-04-06 12:16:57','2024-04-06 16:07:00'),
    (18,'xiaofuge','send_award','08472548108','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"08472548108\",\"timestamp\":1712377018112}','completed','2024-04-06 12:16:58','2024-04-06 16:07:00'),
    (19,'xiaofuge','send_award','01704262897','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"01704262897\",\"timestamp\":1712391038041}','completed','2024-04-06 16:10:38','2024-04-06 16:10:38'),
    (20,'xiaofuge','send_award','96818112357','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96818112357\",\"timestamp\":1712391039234}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (21,'xiaofuge','send_award','39815817631','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"39815817631\",\"timestamp\":1712391039751}','completed','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (22,'xiaofuge','send_award','44228382875','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"44228382875\",\"timestamp\":1712391040268}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (23,'xiaofuge','send_award','61240314870','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"61240314870\",\"timestamp\":1712391040784}','completed','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (24,'xiaofuge','send_award','30911821347','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"30911821347\",\"timestamp\":1712391041333}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (25,'xiaofuge','send_award','41575602711','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"41575602711\",\"timestamp\":1712391041849}','completed','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (26,'xiaofuge','send_award','72379603310','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"72379603310\",\"timestamp\":1712391042361}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (27,'xiaofuge','send_award','51671684313','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"51671684313\",\"timestamp\":1712391042875}','completed','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (28,'xiaofuge','send_award','11840468669','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"11840468669\",\"timestamp\":1712391043390}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (29,'xiaofuge','send_award','18467905170','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"18467905170\",\"timestamp\":1712391043908}','completed','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (30,'xiaofuge','send_award','33233781451','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"33233781451\",\"timestamp\":1712391044424}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (31,'xiaofuge','send_award','09679212052','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"09679212052\",\"timestamp\":1712391044938}','completed','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (32,'xiaofuge','send_award','96862889309','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"96862889309\",\"timestamp\":1712391045450}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (33,'xiaofuge','send_award','69912628282','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"69912628282\",\"timestamp\":1712391045962}','completed','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (34,'xiaofuge','send_award','26021447219','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"26021447219\",\"timestamp\":1712391046477}','create','2024-04-06 16:10:46','2024-04-06 16:41:41'),
    (35,'xiaofuge','send_award','29510804265','{\"data\":{\"awardId\":101,\"awardTitle\":\"OpenAI 增加使用次数\",\"userId\":\"xiaofuge\"},\"id\":\"29510804265\",\"timestamp\":1712391047005}','fail','2024-04-06 16:10:47','2024-04-06 16:10:47');

/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_000`;

CREATE TABLE `user_award_record_000` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_001`;

CREATE TABLE `user_award_record_001` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';

LOCK TABLES `user_award_record_001` WRITE;
/*!40000 ALTER TABLE `user_award_record_001` DISABLE KEYS */;

INSERT INTO `user_award_record_001` (`id`, `user_id`, `activity_id`, `strategy_id`, `order_id`, `award_id`, `award_title`, `award_time`, `award_state`, `create_time`, `update_time`)
VALUES
    (1,'xiaofuge',100301,100006,'313091076458',101,'OpenAI 增加使用次数','2024-04-06 03:41:50','create','2024-04-06 11:41:50','2024-04-06 11:41:50'),
    (3,'xiaofuge',100301,100006,'313091076459',101,'OpenAI 增加使用次数','2024-04-06 03:47:54','create','2024-04-06 11:47:54','2024-04-06 11:47:54'),
    (6,'xiaofuge',100301,100006,'658772889112',101,'OpenAI 增加使用次数','2024-04-06 04:16:50','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (7,'xiaofuge',100301,100006,'623291703218',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:50','2024-04-06 12:16:50'),
    (8,'xiaofuge',100301,100006,'619841045154',101,'OpenAI 增加使用次数','2024-04-06 04:16:51','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (9,'xiaofuge',100301,100006,'696947604604',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:51','2024-04-06 12:16:51'),
    (10,'xiaofuge',100301,100006,'239997053403',101,'OpenAI 增加使用次数','2024-04-06 04:16:52','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (11,'xiaofuge',100301,100006,'837228766840',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:52','2024-04-06 12:16:52'),
    (12,'xiaofuge',100301,100006,'012609968231',101,'OpenAI 增加使用次数','2024-04-06 04:16:53','create','2024-04-06 12:16:53','2024-04-06 12:16:53'),
    (13,'xiaofuge',100301,100006,'540056227059',101,'OpenAI 增加使用次数','2024-04-06 04:16:54','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (14,'xiaofuge',100301,100006,'757384073568',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:54','2024-04-06 12:16:54'),
    (15,'xiaofuge',100301,100006,'270533634609',101,'OpenAI 增加使用次数','2024-04-06 04:16:55','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (16,'xiaofuge',100301,100006,'143517041178',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:55','2024-04-06 12:16:55'),
    (17,'xiaofuge',100301,100006,'880610933571',101,'OpenAI 增加使用次数','2024-04-06 04:16:56','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (18,'xiaofuge',100301,100006,'288939138548',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:56','2024-04-06 12:16:56'),
    (19,'xiaofuge',100301,100006,'401825045013',101,'OpenAI 增加使用次数','2024-04-06 04:16:57','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
    (20,'xiaofuge',100301,100006,'644483213191',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:57','2024-04-06 12:16:57'),
    (21,'xiaofuge',100301,100006,'126942948062',101,'OpenAI 增加使用次数','2024-04-06 04:16:58','create','2024-04-06 12:16:58','2024-04-06 12:16:58'),
    (22,'xiaofuge',100301,100006,'388415276639',101,'OpenAI 增加使用次数','2024-04-06 08:10:38','create','2024-04-06 16:10:38','2024-04-06 16:10:38'),
    (23,'xiaofuge',100301,100006,'295404830039',101,'OpenAI 增加使用次数','2024-04-06 08:10:39','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (24,'xiaofuge',100301,100006,'396378174546',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:39','2024-04-06 16:10:39'),
    (25,'xiaofuge',100301,100006,'216034880115',101,'OpenAI 增加使用次数','2024-04-06 08:10:40','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (26,'xiaofuge',100301,100006,'587083012812',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:40','2024-04-06 16:10:40'),
    (27,'xiaofuge',100301,100006,'179931564604',101,'OpenAI 增加使用次数','2024-04-06 08:10:41','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (28,'xiaofuge',100301,100006,'266603270575',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:41','2024-04-06 16:10:41'),
    (29,'xiaofuge',100301,100006,'708306230375',101,'OpenAI 增加使用次数','2024-04-06 08:10:42','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (30,'xiaofuge',100301,100006,'099363576226',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:42','2024-04-06 16:10:42'),
    (31,'xiaofuge',100301,100006,'330354920093',101,'OpenAI 增加使用次数','2024-04-06 08:10:43','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (32,'xiaofuge',100301,100006,'824752758415',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:43','2024-04-06 16:10:43'),
    (33,'xiaofuge',100301,100006,'064058506146',101,'OpenAI 增加使用次数','2024-04-06 08:10:44','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (34,'xiaofuge',100301,100006,'923475474250',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:44','2024-04-06 16:10:44'),
    (35,'xiaofuge',100301,100006,'565064446034',101,'OpenAI 增加使用次数','2024-04-06 08:10:45','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (36,'xiaofuge',100301,100006,'665449773785',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:45','2024-04-06 16:10:45'),
    (37,'xiaofuge',100301,100006,'099294776536',101,'OpenAI 增加使用次数','2024-04-06 08:10:46','create','2024-04-06 16:10:46','2024-04-06 16:10:46'),
    (38,'xiaofuge',100301,100006,'166766849249',101,'OpenAI 增加使用次数','2024-04-06 08:10:47','create','2024-04-06 16:10:47','2024-04-06 16:10:47');

/*!40000 ALTER TABLE `user_award_record_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_award_record_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_002`;

CREATE TABLE `user_award_record_002` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_award_record_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_award_record_003`;

CREATE TABLE `user_award_record_003` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '抽奖订单ID【作为幂等使用】',
                                         `award_id` int(11) NOT NULL COMMENT '奖品ID',
                                         `award_title` varchar(128) NOT NULL COMMENT '奖品标题（名称）',
                                         `award_time` datetime NOT NULL COMMENT '中奖时间',
                                         `award_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '奖品状态；create-创建、completed-发奖完成',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id` (`user_id`),
                                         KEY `idx_activity_id` (`activity_id`),
                                         KEY `idx_award_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户中奖记录表';



# 转储表 user_raffle_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_000`;

CREATE TABLE `user_raffle_order_000` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_001`;

CREATE TABLE `user_raffle_order_001` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';

LOCK TABLES `user_raffle_order_001` WRITE;
/*!40000 ALTER TABLE `user_raffle_order_001` DISABLE KEYS */;

INSERT INTO `user_raffle_order_001` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `order_state`, `create_time`, `update_time`)
VALUES
    (4,'xiaofuge',100301,'测试活动',100006,'313091076458','2024-04-05 09:10:31','create','2024-04-05 17:10:31','2024-04-05 17:10:31');

/*!40000 ALTER TABLE `user_raffle_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user_raffle_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_002`;

CREATE TABLE `user_raffle_order_002` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';



# 转储表 user_raffle_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_raffle_order_003`;

CREATE TABLE `user_raffle_order_003` (
                                         `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
                                         `user_id` varchar(32) NOT NULL COMMENT '用户ID',
                                         `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
                                         `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
                                         `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
                                         `order_id` varchar(12) NOT NULL COMMENT '订单ID',
                                         `order_time` datetime NOT NULL COMMENT '下单时间',
                                         `order_state` varchar(16) NOT NULL DEFAULT 'create' COMMENT '订单状态；create-创建、used-已使用、cancel-已作废',
                                         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
                                         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                                         PRIMARY KEY (`id`),
                                         UNIQUE KEY `uq_order_id` (`order_id`),
                                         KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户抽奖订单表';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
