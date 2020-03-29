/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.105
Source Server Version : 80019
Source Host           : 192.168.1.105:3306
Source Database       : bamboo

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-03-29 17:18:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bamboo_basic_information
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_basic_information`;
CREATE TABLE `bamboo_basic_information` (
  `id` bigint NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '当前价格',
  `target_price` decimal(10,2) DEFAULT NULL COMMENT '目标价格',
  `sale_price` decimal(10,2) DEFAULT NULL COMMENT '卖出价',
  `limit_price_amplitude` decimal(10,2) DEFAULT NULL,
  `limit_up_price` decimal(10,2) DEFAULT NULL COMMENT '涨停价',
  `limit_up_sealing_sheet` bigint DEFAULT NULL COMMENT '涨停封单数',
  `limit_up_sealing_sheet_tip` bigint DEFAULT NULL COMMENT '涨停封单预警数',
  `limit_down_price` decimal(10,2) DEFAULT NULL COMMENT '跌停价',
  `limit_down_sealing_sheet` bigint DEFAULT NULL COMMENT '跌停封单数',
  `limit_down_sealing_sheet_tip` bigint DEFAULT NULL COMMENT '跌停封单预警数',
  `amplitude` decimal(6,3) DEFAULT NULL COMMENT '振幅',
  `concept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '概念',
  `remark` text,
  `do_t` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0' COMMENT '做T',
  `do_t_amplitude` decimal(6,3) DEFAULT NULL COMMENT '做T幅度',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bamboo_basic_information_tips
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_basic_information_tips`;
CREATE TABLE `bamboo_basic_information_tips` (
  `id` bigint NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '当前价格',
  `target_price` decimal(10,2) DEFAULT NULL COMMENT '目标价格',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '类型: 1.目标价. 2. 做T',
  `amplitude` decimal(6,3) DEFAULT NULL COMMENT '振幅',
  `create_time` datetime DEFAULT NULL,
  `is_delete` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '1' COMMENT '是否删除 1.未删除, 0 删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bamboo_coin_info
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_coin_info`;
CREATE TABLE `bamboo_coin_info` (
  `id` bigint NOT NULL,
  `coin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '币种名称',
  `current_price` decimal(13,6) DEFAULT NULL COMMENT '当前价格',
  `target_price` decimal(13,6) DEFAULT NULL COMMENT '目标价格',
  `sale_price` decimal(13,6) DEFAULT NULL COMMENT '卖出价',
  `symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='币种信息表';

-- ----------------------------
-- Table structure for bamboo_coin_info_history
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_coin_info_history`;
CREATE TABLE `bamboo_coin_info_history` (
  `coin_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '币种名称',
  `current_price` decimal(13,6) DEFAULT NULL COMMENT '当前价格',
  `target_price` decimal(13,6) DEFAULT NULL COMMENT '目标价格',
  `sale_price` decimal(13,6) DEFAULT NULL COMMENT '卖出价',
  `symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对',
  `create_time` datetime DEFAULT NULL,
  KEY `coin_name` (`coin_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='币种信息历史表';

-- ----------------------------
-- Table structure for bamboo_coin_symbol
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_coin_symbol`;
CREATE TABLE `bamboo_coin_symbol` (
  `id` bigint NOT NULL,
  `base_currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交易对中的基础币种',
  `quote_currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '交易对中的报价币种',
  `prices_precision` int DEFAULT NULL COMMENT '交易对报价的精度（小数点后位数）',
  `amount_precision` int DEFAULT NULL COMMENT '交易对基础币种计数精度（小数点后位数）',
  `symbol_partition` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易区，可能值: [main，innovation]',
  `symbol` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对',
  `state` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '交易对状态；可能值: [online，offline,suspend] online - 已上线；offline - 交易对已下线，不可交易；suspend -- 交易暂停',
  `value_precision` bigint DEFAULT NULL COMMENT '交易对交易金额的精度（小数点后位数）',
  `min_order_amt` decimal(15,7) DEFAULT NULL COMMENT '交易对最小下单量 (下单量指当订单类型为限价单或sell-market时，下单接口传的)',
  `max_order_amt` decimal(30,3) DEFAULT NULL COMMENT '交易对最大下单量',
  `min_order_value` decimal(15,7) DEFAULT NULL COMMENT '最小下单金额 （下单金额指当订单类型为限价单时，下单接口传入的(amount * price)。当订单类型为buy-market时，下单接口传的）',
  `leverage_ratio` decimal(15,7) DEFAULT NULL COMMENT '交易对杠杆最大倍数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='币种交易对';

-- ----------------------------
-- Table structure for bamboo_information_history
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_information_history`;
CREATE TABLE `bamboo_information_history` (
  `id` bigint NOT NULL,
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '名称',
  `opening_price` decimal(10,2) DEFAULT NULL COMMENT '开盘价',
  `highest_price` decimal(10,2) DEFAULT NULL COMMENT '最高价',
  `minimum_price` decimal(10,2) DEFAULT NULL COMMENT '最低价',
  `current_price` decimal(10,2) DEFAULT NULL COMMENT '当前价格',
  `yesterday_closing_price` decimal(10,2) DEFAULT NULL COMMENT '昨收',
  `closing_price` decimal(10,2) DEFAULT NULL COMMENT '收盘价',
  `rate` decimal(6,3) DEFAULT NULL COMMENT '比例',
  `current_turnover_amount` decimal(18,2) DEFAULT NULL COMMENT '当前成交金额',
  `turnover_amount` decimal(18,2) DEFAULT NULL COMMENT '成交金额',
  `current_transaction_number` int DEFAULT NULL COMMENT '当前成交数',
  `transaction_number` int DEFAULT NULL COMMENT '成交数',
  `trading_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '1.买，2.卖',
  `buy_one` decimal(15,2) DEFAULT NULL COMMENT '买一',
  `sell_one` decimal(15,2) DEFAULT NULL COMMENT '卖一',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_time_stamp` bigint DEFAULT NULL COMMENT '创建时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for bamboo_menu
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_menu`;
CREATE TABLE `bamboo_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int DEFAULT '0' COMMENT '父级菜单',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单名称',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单别名',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求地址',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '菜单资源',
  `sort` int DEFAULT NULL COMMENT '排序',
  `category` int DEFAULT NULL COMMENT '菜单类型',
  `action` int DEFAULT '0' COMMENT '操作按钮类型',
  `is_open` int DEFAULT '1' COMMENT '是否打开新页面',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='菜单表';

-- ----------------------------
-- Table structure for bamboo_role
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_role`;
CREATE TABLE `bamboo_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '000000' COMMENT '租户ID',
  `parent_id` int DEFAULT '0' COMMENT '父主键',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色名',
  `sort` int DEFAULT NULL COMMENT '排序',
  `role_alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '角色别名',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Table structure for bamboo_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_role_menu`;
CREATE TABLE `bamboo_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Table structure for bamboo_user
-- ----------------------------
DROP TABLE IF EXISTS `bamboo_user`;
CREATE TABLE `bamboo_user` (
  `id` bigint NOT NULL COMMENT '主键',
  `account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `salt` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '盐值',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `real_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '真名',
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '手机',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` smallint DEFAULT NULL COMMENT '性别',
  `role_id` bigint DEFAULT NULL COMMENT '角色id',
  `create_user` bigint DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` bigint DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int DEFAULT NULL COMMENT '状态',
  `is_deleted` int DEFAULT '0' COMMENT '是否已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='用户表';
