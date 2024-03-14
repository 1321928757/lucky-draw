
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE database if NOT EXISTS `big_market_02` default character set utf8mb4;
use `big_market_02`;

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
	(1,'VLhpfQGTMDYpsBZxvfBoeygjb',100301,'测试活动',100006,'314745789987','2024-03-09 03:25:37','not_used','2024-03-09 11:25:36','2024-03-09 11:25:36'),
	(2,'VLhpfQGTMDYpsBZxvfBoeygjb',100301,'测试活动',100006,'802678186818','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(3,'sPB',100301,'测试活动',100006,'386117127681','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(4,'dwprLNbgNvZUMpqAXLJbjE',100301,'测试活动',100006,'630135022229','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(5,'TiQaUNWftniOAotnzWvkQt',100301,'测试活动',100006,'668336432237','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(6,'zGVyIdgFUYNdkFYkkjNIeENlreqFLC',100301,'测试活动',100006,'066613643245','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

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
	(1,'qszYL',100301,'测试活动',100006,'423380233225','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(2,'Oxm',100301,'测试活动',100006,'489659017919','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(3,'WoaMAzEEplqjJ',100301,'测试活动',100006,'391068935114','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(4,'FthRIkE',100301,'测试活动',100006,'637291005591','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(5,'M',100301,'测试活动',100006,'778618097552','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(6,'YFBlWcoVdFXlfhbUilkMpiHDMU',100301,'测试活动',100006,'055063606056','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(7,'etqguztl',100301,'测试活动',100006,'217340491197','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

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
	(1,'RYtGKbgicZaHCBRQDSx',100301,'测试活动',100006,'783284094247','2024-03-09 03:25:37','not_used','2024-03-09 11:25:36','2024-03-09 11:25:36'),
	(2,'RYtGKbgicZaHCBRQDSx',100301,'测试活动',100006,'471443186437','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(3,'dpHYZGhtgdntugzvvKAXLhM',100301,'测试活动',100006,'797027363416','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(4,'QvBQYuxiXXVytGCxzVllpgTJKhRQq',100301,'测试活动',100006,'530161328086','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(5,'yIvpRgmgQsYEKk',100301,'测试活动',100006,'957795906178','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(6,'PBzMiJFouxILNv',100301,'测试活动',100006,'259893275923','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(7,'HuubOREhRXJoDCVcLCRmll',100301,'测试活动',100006,'382217786710','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(8,'teOlrImKiDpJbLDnvK',100301,'测试活动',100006,'838543435677','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

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
	(1,'JxkyvRnL',100301,'测试活动',100006,'229047885085','2024-03-09 03:25:37','not_used','2024-03-09 11:25:36','2024-03-09 11:25:36'),
	(2,'JxkyvRnL',100301,'测试活动',100006,'556047236578','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(3,'UMaAIKKIkknjWEXJUfPxxQHeWKEJ',100301,'测试活动',100006,'546781384958','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(4,'LlN',100301,'测试活动',100006,'661315751679','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(5,'QIn',100301,'测试活动',100006,'566029186766','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(6,'pIoQM',100301,'测试活动',100006,'834741267461','2024-03-09 06:26:20','not_used','2024-03-09 14:26:19','2024-03-09 14:26:19'),
	(7,'gEYzhlSTPkcSUyTSbBkU',100301,'测试活动',100006,'162529919327','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(8,'OV',100301,'测试活动',100006,'673368061494','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20'),
	(9,'O',100301,'测试活动',100006,'718325174688','2024-03-09 06:26:20','not_used','2024-03-09 14:26:20','2024-03-09 14:26:20');

/*!40000 ALTER TABLE `raffle_activity_order_003` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
