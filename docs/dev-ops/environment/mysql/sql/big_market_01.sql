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
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户表';



# 转储表 raffle_activity_account_flow_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_flow_000`;

CREATE TABLE `raffle_activity_account_flow_000` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `flow_id` varchar(32) NOT NULL COMMENT '流水ID - 生成的唯一ID',
  `flow_channel` varchar(12) NOT NULL DEFAULT 'activity' COMMENT '流水渠道（activity-活动领取、sale-购买、redeem-兑换、free-免费赠送）',
  `biz_id` varchar(12) NOT NULL COMMENT '业务ID（外部透传，活动ID、订单ID）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_flow_id` (`flow_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户流水表';



# 转储表 raffle_activity_account_flow_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_flow_001`;

CREATE TABLE `raffle_activity_account_flow_001` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `flow_id` varchar(32) NOT NULL COMMENT '流水ID - 生成的唯一ID',
  `flow_channel` varchar(12) NOT NULL DEFAULT 'activity' COMMENT '流水渠道（activity-活动领取、sale-购买、redeem-兑换、free-免费赠送）',
  `biz_id` varchar(12) NOT NULL COMMENT '业务ID（外部透传，活动ID、订单ID）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_flow_id` (`flow_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户流水表';



# 转储表 raffle_activity_account_flow_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_flow_002`;

CREATE TABLE `raffle_activity_account_flow_002` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `flow_id` varchar(32) NOT NULL COMMENT '流水ID - 生成的唯一ID',
  `flow_channel` varchar(12) NOT NULL DEFAULT 'activity' COMMENT '流水渠道（activity-活动领取、sale-购买、redeem-兑换、free-免费赠送）',
  `biz_id` varchar(12) NOT NULL COMMENT '业务ID（外部透传，活动ID、订单ID）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_flow_id` (`flow_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户流水表';



# 转储表 raffle_activity_account_flow_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_account_flow_003`;

CREATE TABLE `raffle_activity_account_flow_003` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `total_count` int(8) NOT NULL COMMENT '总次数',
  `day_count` int(8) NOT NULL COMMENT '日次数',
  `month_count` int(8) NOT NULL COMMENT '月次数',
  `flow_id` varchar(32) NOT NULL COMMENT '流水ID - 生成的唯一ID',
  `flow_channel` varchar(12) NOT NULL DEFAULT 'activity' COMMENT '流水渠道（activity-活动领取、sale-购买、redeem-兑换、free-免费赠送）',
  `biz_id` varchar(12) NOT NULL COMMENT '业务ID（外部透传，活动ID、订单ID）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_flow_id` (`flow_id`),
  UNIQUE KEY `uq_biz_id` (`biz_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动账户流水表';



# 转储表 raffle_activity_order_000
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_000`;

CREATE TABLE `raffle_activity_order_000` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_000` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_000` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_000` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `state`, `create_time`, `update_time`)
VALUES
	(1,'ODRhfGEfX',100301,'测试活动',100006,'826130522615','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(2,'IoTtOmcBeivNUYv',100301,'测试活动',100006,'469450480489','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

/*!40000 ALTER TABLE `raffle_activity_order_000` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_001
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_001`;

CREATE TABLE `raffle_activity_order_001` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_001` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_001` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_001` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `state`, `create_time`, `update_time`)
VALUES
	(3,'xiaofuge',100301,'测试活动',100006,'88675199','2024-03-09 03:15:49','not_used','2024-03-09 11:15:49','2024-03-09 11:15:49'),
	(4,'eOMtThyhVNLWUZNRcBaQKxI',100301,'测试活动',100006,'279528629287','2024-03-09 03:25:36','not_used','2024-03-09 11:25:36','2024-03-09 11:25:36'),
	(5,'xiaofuge',100301,'测试活动',100006,'382877096957','2024-03-09 06:24:14','not_used','2024-03-09 14:24:15','2024-03-09 14:24:15'),
	(6,'eOMtThyhVNLWUZNRcBaQKxI',100301,'测试活动',100006,'345528243615','2024-03-09 06:26:19','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(7,'gNfZBdyFGRajVfJNonEnOinZj',100301,'测试活动',100006,'687700892168','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(8,'YdvDhtAsLghPXAgtbprXPZkhnfLTBSX',100301,'测试活动',100006,'832108989179','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(9,'aofGvthLoyPLDADYzx',100301,'测试活动',100006,'529515193982','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(10,'JkjHewSlMWOIVYZjIEB',100301,'测试活动',100006,'170085904156','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(11,'WtKhlfZzDZ',100301,'测试活动',100006,'671565510828','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

/*!40000 ALTER TABLE `raffle_activity_order_001` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_002
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_002`;

CREATE TABLE `raffle_activity_order_002` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_002` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_002` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_002` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `state`, `create_time`, `update_time`)
VALUES
	(1,'yedUsFwdkelQbxeTeQOvaScfqIOOmaa',100301,'测试活动',100006,'836635667224','2024-03-09 03:25:37','not_used','2024-03-09 11:25:36','2024-03-09 11:25:36'),
	(2,'yedUsFwdkelQbxeTeQOvaScfqIOOmaa',100301,'测试活动',100006,'228793607062','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(3,'UfzQhdgLLfDTDGspDb',100301,'测试活动',100006,'513555903138','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(4,'AAAryjCRhLTuhnTodUewZQqaZErU',100301,'测试活动',100006,'505631724018','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(5,'jNBgpTmxx',100301,'测试活动',100006,'685095959679','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(6,'MFOPluIOMfSnzX',100301,'测试活动',100006,'289268406790','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(7,'oBeMdQkAoYZDjfWhbzkmA',100301,'测试活动',100006,'655070009261','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(8,'yybxVLsNlAeLWVhnIULZAyLBms',100301,'测试活动',100006,'028786517411','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(9,'jzlglRKAeamYUmWJtnJZLqwakeYcea',100301,'测试活动',100006,'782798709997','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(10,'xlpKnXmsjfwUTYgfExSOnq',100301,'测试活动',100006,'398438946303','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

/*!40000 ALTER TABLE `raffle_activity_order_002` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 raffle_activity_order_003
# ------------------------------------------------------------

DROP TABLE IF EXISTS `raffle_activity_order_003`;

CREATE TABLE `raffle_activity_order_003` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_id` varchar(32) NOT NULL COMMENT '用户ID',
  `activity_id` bigint(12) NOT NULL COMMENT '活动ID',
  `activity_name` varchar(64) NOT NULL COMMENT '活动名称',
  `strategy_id` bigint(8) NOT NULL COMMENT '抽奖策略ID',
  `order_id` varchar(12) NOT NULL COMMENT '订单ID',
  `order_time` datetime NOT NULL COMMENT '下单时间',
  `state` varchar(8) NOT NULL COMMENT '订单状态（not_used、used、expire）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_order_id` (`order_id`),
  KEY `idx_user_id_activity_id` (`user_id`,`activity_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='抽奖活动单';

LOCK TABLES `raffle_activity_order_003` WRITE;
/*!40000 ALTER TABLE `raffle_activity_order_003` DISABLE KEYS */;

INSERT INTO `raffle_activity_order_003` (`id`, `user_id`, `activity_id`, `activity_name`, `strategy_id`, `order_id`, `order_time`, `state`, `create_time`, `update_time`)
VALUES
	(2,'Wru',100301,'测试活动',100006,'321398329298','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(3,'NBaxYoMSiMNxLXFLxIok',100301,'测试活动',100006,'984818227562','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(4,'DiACnbEKIFidn',100301,'测试活动',100006,'756120722172','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(5,'AzTaco',100301,'测试活动',100006,'736897283068','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(6,'LcdeWTdXPlQgjMVXbpRYzBT',100301,'测试活动',100006,'320326966099','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(7,'veErKUBEqCrhrtgx',100301,'测试活动',100006,'519326185897','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

/*!40000 ALTER TABLE `raffle_activity_order_003` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
