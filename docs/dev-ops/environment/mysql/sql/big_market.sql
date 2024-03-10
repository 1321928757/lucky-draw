# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20050
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.6.39)
# 数据库: big_market
# 生成时间: 2024-02-15 05:21:27 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market` default character set utf8mb4 collate utf8mb4_0900_ai_ci;
use `big_market`;

# 转储表 award
# ------------------------------------------------------------

DROP TABLE IF EXISTS `award`;

CREATE TABLE `award` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `award_id` int(8) NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
  `award_key` varchar(32) NOT NULL COMMENT '奖品对接标识 - 每一个都是一个对应的发奖策略',
  `award_config` varchar(32) NOT NULL COMMENT '奖品配置信息',
  `award_desc` varchar(128) NOT NULL COMMENT '奖品内容描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `award` WRITE;
/*!40000 ALTER TABLE `award` DISABLE KEYS */;

INSERT INTO `award` (`id`, `award_id`, `award_key`, `award_config`, `award_desc`, `create_time`, `update_time`)
VALUES
	(1,101,'user_credit_random','1,100','用户积分【优先透彻规则范围，如果没有则走配置】','2023-12-09 11:07:06','2023-12-09 11:21:31'),
	(2,102,'openai_use_count','5','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:59'),
	(3,103,'openai_use_count','10','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:59'),
	(4,104,'openai_use_count','20','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:58'),
	(5,105,'openai_model','gpt-4','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:01'),
	(6,106,'openai_model','dall-e-2','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:08'),
	(7,107,'openai_model','dall-e-3','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:10'),
	(8,108,'openai_use_count','100','OpenAI 增加使用次数','2023-12-09 11:07:06','2023-12-09 11:12:55'),
	(9,109,'openai_model','gpt-4,dall-e-2,dall-e-3','OpenAI 增加模型','2023-12-09 11:07:06','2023-12-09 11:12:39'),
	(10,100,'user_credit_blacklist','1','黑名单积分','2024-01-06 12:30:40','2024-01-06 12:30:46');

/*!40000 ALTER TABLE `award` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 rule_tree
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rule_tree`;

CREATE TABLE `rule_tree` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tree_id` varchar(32) NOT NULL COMMENT '规则树ID',
  `tree_name` varchar(64) NOT NULL COMMENT '规则树名称',
  `tree_desc` varchar(128) DEFAULT NULL COMMENT '规则树描述',
  `tree_node_rule_key` varchar(32) NOT NULL COMMENT '规则树根入口规则',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_tree_id` (`tree_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `rule_tree` WRITE;
/*!40000 ALTER TABLE `rule_tree` DISABLE KEYS */;

INSERT INTO `rule_tree` (`id`, `tree_id`, `tree_name`, `tree_desc`, `tree_node_rule_key`, `create_time`, `update_time`)
VALUES
	(1,'tree_lock_1','规则树','规则树','rule_lock','2024-01-27 10:01:59','2024-02-15 07:49:59'),
	(2,'tree_luck_award','规则树-兜底奖励','规则树-兜底奖励','rule_stock','2024-02-15 07:35:06','2024-02-15 07:50:20'),
	(3,'tree_lock_2','规则树','规则树','rule_lock','2024-01-27 10:01:59','2024-02-15 07:49:59');

/*!40000 ALTER TABLE `rule_tree` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 rule_tree_node
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rule_tree_node`;

CREATE TABLE `rule_tree_node` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tree_id` varchar(32) NOT NULL COMMENT '规则树ID',
  `rule_key` varchar(32) NOT NULL COMMENT '规则Key',
  `rule_desc` varchar(64) NOT NULL COMMENT '规则描述',
  `rule_value` varchar(128) DEFAULT NULL COMMENT '规则比值',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `rule_tree_node` WRITE;
/*!40000 ALTER TABLE `rule_tree_node` DISABLE KEYS */;

INSERT INTO `rule_tree_node` (`id`, `tree_id`, `rule_key`, `rule_desc`, `rule_value`, `create_time`, `update_time`)
VALUES
	(1,'tree_lock_1','rule_lock','限定用户已完成N次抽奖后解锁','1','2024-01-27 10:03:09','2024-02-15 07:50:57'),
	(2,'tree_lock_1','rule_luck_award','兜底奖品随机积分','101:1,100','2024-01-27 10:03:09','2024-02-15 07:51:00'),
	(3,'tree_lock_1','rule_stock','库存扣减规则',NULL,'2024-01-27 10:04:43','2024-02-15 07:51:02'),
	(4,'tree_luck_award','rule_stock','库存扣减规则',NULL,'2024-02-15 07:35:55','2024-02-15 07:39:19'),
	(5,'tree_luck_award','rule_luck_award','兜底奖品随机积分','101:1,100','2024-02-15 07:35:55','2024-02-15 07:39:23'),
	(6,'tree_lock_2','rule_lock','限定用户已完成N次抽奖后解锁','2','2024-01-27 10:03:09','2024-02-15 07:52:20'),
	(7,'tree_lock_2','rule_luck_award','兜底奖品随机积分','101:1,100','2024-01-27 10:03:09','2024-02-08 19:59:43'),
	(8,'tree_lock_2','rule_stock','库存扣减规则',NULL,'2024-01-27 10:04:43','2024-02-03 10:40:21');

/*!40000 ALTER TABLE `rule_tree_node` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 rule_tree_node_line
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rule_tree_node_line`;

CREATE TABLE `rule_tree_node_line` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tree_id` varchar(32) NOT NULL COMMENT '规则树ID',
  `rule_node_from` varchar(32) NOT NULL COMMENT '规则Key节点 From',
  `rule_node_to` varchar(32) NOT NULL COMMENT '规则Key节点 To',
  `rule_limit_type` varchar(8) NOT NULL COMMENT '限定类型；1:=;2:>;3:<;4:>=;5<=;6:enum[枚举范围];',
  `rule_limit_value` varchar(32) NOT NULL COMMENT '限定值（到下个节点）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `rule_tree_node_line` WRITE;
/*!40000 ALTER TABLE `rule_tree_node_line` DISABLE KEYS */;

INSERT INTO `rule_tree_node_line` (`id`, `tree_id`, `rule_node_from`, `rule_node_to`, `rule_limit_type`, `rule_limit_value`, `create_time`, `update_time`)
VALUES
	(1,'tree_lock_1','rule_lock','rule_stock','EQUAL','ALLOW','0000-00-00 00:00:00','2024-02-15 07:55:08'),
	(2,'tree_lock_1','rule_lock','rule_luck_award','EQUAL','TAKE_OVER','0000-00-00 00:00:00','2024-02-15 07:55:11'),
	(3,'tree_lock_1','rule_stock','rule_luck_award','EQUAL','ALLOW','0000-00-00 00:00:00','2024-02-15 07:55:13'),
	(4,'tree_luck_award','rule_stock','rule_luck_award','EQUAL','ALLOW','2024-02-15 07:37:31','2024-02-15 07:39:28'),
	(5,'tree_lock_2','rule_lock','rule_stock','EQUAL','ALLOW','0000-00-00 00:00:00','2024-02-15 07:55:08'),
	(6,'tree_lock_2','rule_lock','rule_luck_award','EQUAL','TAKE_OVER','0000-00-00 00:00:00','2024-02-15 07:55:11'),
	(7,'tree_lock_2','rule_stock','rule_luck_award','EQUAL','ALLOW','0000-00-00 00:00:00','2024-02-15 07:55:13');

/*!40000 ALTER TABLE `rule_tree_node_line` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 strategy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strategy`;

CREATE TABLE `strategy` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `strategy_desc` varchar(128) NOT NULL COMMENT '抽奖策略描述',
  `rule_models` varchar(256) DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_strategy_id` (`strategy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strategy` WRITE;
/*!40000 ALTER TABLE `strategy` DISABLE KEYS */;

INSERT INTO `strategy` (`id`, `strategy_id`, `strategy_desc`, `rule_models`, `create_time`, `update_time`)
VALUES
	(1,100001,'抽奖策略','rule_blacklist,rule_weight','2023-12-09 09:37:19','2024-01-20 11:39:23'),
	(2,100003,'抽奖策略-验证lock','rule_blacklist','2024-01-13 10:34:06','2024-01-20 15:03:19'),
	(3,100002,'抽奖策略-非完整1概率',NULL,'2023-12-09 09:37:19','2024-02-03 10:14:17'),
	(4,100004,'抽奖策略-随机抽奖',NULL,'2023-12-09 09:37:19','2024-01-20 19:21:03'),
	(5,100005,'抽奖策略-测试概率计算',NULL,'2023-12-09 09:37:19','2024-01-21 21:54:58'),
	(6,100006,'抽奖策略-规则树',NULL,'2024-02-03 09:53:40','2024-02-03 09:53:40');

/*!40000 ALTER TABLE `strategy` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 strategy_award
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strategy_award`;

CREATE TABLE `strategy_award` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `award_id` int(8) NOT NULL COMMENT '抽奖奖品ID - 内部流转使用',
  `award_title` varchar(128) NOT NULL COMMENT '抽奖奖品标题',
  `award_subtitle` varchar(128) DEFAULT NULL COMMENT '抽奖奖品副标题',
  `award_count` int(8) NOT NULL DEFAULT '0' COMMENT '奖品库存总量',
  `award_count_surplus` int(8) NOT NULL DEFAULT '0' COMMENT '奖品库存剩余',
  `award_rate` decimal(6,4) NOT NULL COMMENT '奖品中奖概率',
  `rule_models` varchar(256) DEFAULT NULL COMMENT '规则模型，rule配置的模型同步到此表，便于使用',
  `sort` int(2) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_strategy_id_award_id` (`strategy_id`,`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strategy_award` WRITE;
/*!40000 ALTER TABLE `strategy_award` DISABLE KEYS */;

INSERT INTO `strategy_award` (`id`, `strategy_id`, `award_id`, `award_title`, `award_subtitle`, `award_count`, `award_count_surplus`, `award_rate`, `rule_models`, `sort`, `create_time`, `update_time`)
VALUES
	(1,100001,101,'随机积分',NULL,80000,80000,0.3000,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 07:42:09'),
	(2,100001,102,'5次使用',NULL,10000,10000,0.2000,'tree_luck_award',2,'2023-12-09 09:39:18','2024-02-15 07:42:11'),
	(3,100001,103,'10次使用',NULL,5000,5000,0.2000,'tree_luck_award',3,'2023-12-09 09:42:36','2024-02-15 07:42:12'),
	(4,100001,104,'20次使用',NULL,4000,4000,0.1000,'tree_luck_award',4,'2023-12-09 09:43:15','2024-02-15 07:42:12'),
	(5,100001,105,'增加gpt-4对话模型',NULL,600,600,0.1000,'tree_luck_award',5,'2023-12-09 09:43:47','2024-02-15 07:42:13'),
	(6,100001,106,'增加dall-e-2画图模型',NULL,200,200,0.0500,'tree_luck_award',6,'2023-12-09 09:44:20','2024-02-15 07:42:14'),
	(7,100001,107,'增加dall-e-3画图模型','抽奖1次后解锁',200,200,0.0400,'tree_luck_award',7,'2023-12-09 09:45:38','2024-02-15 07:42:17'),
	(8,100001,108,'增加100次使用','抽奖2次后解锁',199,199,0.0099,'tree_luck_award',8,'2023-12-09 09:46:02','2024-02-15 07:42:21'),
	(9,100001,109,'解锁全部模型','抽奖6次后解锁',1,1,0.0001,'tree_luck_award',9,'2023-12-09 09:46:39','2024-02-15 07:42:26'),
	(10,100002,101,'随机积分',NULL,1,1,0.5000,'tree_luck_award',1,'2023-12-09 09:46:39','2024-02-15 07:42:29'),
	(11,100002,102,'5次使用',NULL,1,1,0.1000,'tree_luck_award',2,'2023-12-09 09:46:39','2024-02-15 07:42:32'),
	(12,100002,106,'增加dall-e-2画图模型',NULL,1,1,0.0100,'tree_luck_award',3,'2023-12-09 09:46:39','2024-02-15 07:42:35'),
	(13,100003,107,'增加dall-e-3画图模型','抽奖1次后解锁',200,200,0.0400,'tree_luck_award',7,'2023-12-09 09:45:38','2024-02-15 07:42:38'),
	(14,100003,108,'增加100次使用','抽奖2次后解锁',199,199,0.0099,'tree_luck_award',8,'2023-12-09 09:46:02','2024-02-15 07:42:41'),
	(15,100003,109,'解锁全部模型','抽奖6次后解锁',1,1,0.0001,'tree_luck_award',9,'2023-12-09 09:46:39','2024-02-15 07:42:44'),
	(16,100004,109,'解锁全部模型','抽奖6次后解锁',1,1,1.0000,'tree_luck_award',9,'2023-12-09 09:46:39','2024-02-15 07:42:46'),
	(17,100005,101,'随机积分',NULL,80000,80000,0.0300,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 07:42:47'),
	(18,100005,102,'随机积分',NULL,80000,80000,0.0300,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 07:42:48'),
	(19,100005,103,'随机积分',NULL,80000,80000,0.0300,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 07:42:50'),
	(20,100005,104,'随机积分',NULL,80000,80000,0.0300,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 07:42:51'),
	(21,100005,105,'随机积分',NULL,80000,80000,0.0010,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 07:42:52'),
	(22,100006,101,'随机积分',NULL,100,88,0.0200,'tree_luck_award',1,'2023-12-09 09:38:31','2024-02-15 12:34:20'),
	(23,100006,102,'7等奖',NULL,100,62,0.0300,'tree_luck_award',2,'2023-12-09 09:38:31','2024-02-15 12:34:25'),
	(24,100006,103,'6等奖',NULL,100,71,0.0300,'tree_luck_award',3,'2023-12-09 09:38:31','2024-02-15 12:34:30'),
	(25,100006,104,'5等奖',NULL,100,68,0.0300,'tree_luck_award',4,'2023-12-09 09:38:31','2024-02-15 12:34:10'),
	(26,100006,105,'4等奖',NULL,100,74,0.0300,'tree_luck_award',5,'2023-12-09 09:38:31','2024-02-15 12:32:45'),
	(27,100006,106,'3等奖','抽奖1次后解锁',100,68,0.0300,'tree_lock_1',6,'2023-12-09 09:38:31','2024-02-15 12:34:00'),
	(28,100006,107,'2等奖','抽奖1次后解锁',100,72,0.0300,'tree_lock_1',7,'2023-12-09 09:38:31','2024-02-15 12:33:50'),
	(29,100006,108,'1等奖','抽奖2次后解锁',100,74,0.0300,'tree_lock_2',8,'2023-12-09 09:38:31','2024-02-15 12:32:55');

/*!40000 ALTER TABLE `strategy_award` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 strategy_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `strategy_rule`;

CREATE TABLE `strategy_rule` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `strategy_id` int(8) NOT NULL COMMENT '抽奖策略ID',
  `award_id` int(8) DEFAULT NULL COMMENT '抽奖奖品ID【规则类型为策略，则不需要奖品ID】',
  `rule_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '抽象规则类型；1-策略规则、2-奖品规则',
  `rule_model` varchar(16) NOT NULL COMMENT '抽奖规则类型【rule_random - 随机值计算、rule_lock - 抽奖几次后解锁、rule_luck_award - 幸运奖(兜底奖品)】',
  `rule_value` varchar(256) NOT NULL COMMENT '抽奖规则比值',
  `rule_desc` varchar(128) NOT NULL COMMENT '抽奖规则描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_strategy_id_award_id` (`strategy_id`,`award_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `strategy_rule` WRITE;
/*!40000 ALTER TABLE `strategy_rule` DISABLE KEYS */;

INSERT INTO `strategy_rule` (`id`, `strategy_id`, `award_id`, `rule_type`, `rule_model`, `rule_value`, `rule_desc`, `create_time`, `update_time`)
VALUES
	(1,100001,101,2,'rule_random','1,1000','随机积分策略','2023-12-09 10:05:30','2023-12-09 12:55:52'),
	(2,100001,107,2,'rule_lock','1','抽奖1次后解锁','2023-12-09 10:16:41','2023-12-09 12:55:53'),
	(3,100001,108,2,'rule_lock','2','抽奖2次后解锁','2023-12-09 10:17:43','2023-12-09 12:55:54'),
	(4,100001,109,2,'rule_lock','6','抽奖6次后解锁','2023-12-09 10:17:43','2023-12-09 12:55:54'),
	(5,100001,107,2,'rule_luck_award','1,100','兜底奖品100以内随机积分','2023-12-09 10:30:12','2023-12-09 12:55:55'),
	(6,100001,108,2,'rule_luck_award','1,100','兜底奖品100以内随机积分','2023-12-09 10:30:43','2023-12-09 12:55:56'),
	(7,100001,101,2,'rule_luck_award','1,10','兜底奖品10以内随机积分','2023-12-09 10:30:43','2023-12-09 12:55:57'),
	(8,100001,102,2,'rule_luck_award','1,20','兜底奖品20以内随机积分','2023-12-09 10:30:43','2023-12-09 12:55:57'),
	(9,100001,103,2,'rule_luck_award','1,30','兜底奖品30以内随机积分','2023-12-09 10:30:43','2023-12-09 12:55:58'),
	(10,100001,104,2,'rule_luck_award','1,40','兜底奖品40以内随机积分','2023-12-09 10:30:43','2023-12-09 12:55:59'),
	(11,100001,105,2,'rule_luck_award','1,50','兜底奖品50以内随机积分','2023-12-09 10:30:43','2023-12-09 12:56:00'),
	(12,100001,106,2,'rule_luck_award','1,60','兜底奖品60以内随机积分','2023-12-09 10:30:43','2023-12-09 12:56:00'),
	(13,100001,NULL,1,'rule_weight','4000:102,103,104,105 5000:102,103,104,105,106,107 6000:102,103,104,105,106,107,108,109','消耗6000分，必中奖范围','2023-12-09 10:30:43','2023-12-31 14:51:50'),
	(14,100001,NULL,1,'rule_blacklist','101:user001,user002,user003','黑名单抽奖，积分兜底','2023-12-09 12:59:45','2024-02-14 18:16:20'),
	(15,100003,107,2,'rule_lock','1','抽奖1次后解锁','2023-12-09 10:16:41','2023-12-09 12:55:53'),
	(16,100003,108,2,'rule_lock','2','抽奖2次后解锁','2023-12-09 10:17:43','2024-01-13 10:56:48'),
	(17,100003,109,2,'rule_lock','6','抽奖6次后解锁','2023-12-09 10:17:43','2023-12-09 12:55:54');

/*!40000 ALTER TABLE `strategy_rule` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
