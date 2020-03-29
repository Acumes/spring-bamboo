/*
Navicat MySQL Data Transfer

Source Server         : 192.168.1.105
Source Server Version : 80019
Source Host           : 192.168.1.105:3306
Source Database       : bamboo

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2020-03-29 17:18:47
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
-- Records of bamboo_basic_information
-- ----------------------------
INSERT INTO `bamboo_basic_information` VALUES ('1', 'sh600745', '闻泰科技', '105.56', '102.00', '130.00', '10.00', '118.00', null, null, '100.00', null, '1', '-2.500', '5G', null, '0', null, '2020-03-27 09:09:50');
INSERT INTO `bamboo_basic_information` VALUES ('123', 'sh600547', '山东黄金', '35.16', '29.00', null, '3.40', '37.40', null, null, '30.60', null, null, '2.170', '黄金', null, '0', null, '2020-03-10 20:39:14');
INSERT INTO `bamboo_basic_information` VALUES ('343', 'sz002792', '通宇通讯', '29.48', '27.00', null, '3.12', '34.35', null, null, '28.11', null, null, '-2.440', '5G', null, '0', null, '2020-03-10 20:28:54');
INSERT INTO `bamboo_basic_information` VALUES ('431', 'sz002341', '新纶科技', '6.45', '5.00', '8.00', '0.66', '7.25', null, null, '5.93', null, null, '0.460', '口罩', null, '0', null, '2020-03-16 09:05:13');
INSERT INTO `bamboo_basic_information` VALUES ('432', 'sh603301', '振德医疗', '41.81', '35.00', null, '4.07', '44.81', null, null, '36.67', null, null, '1.160', '医疗', null, '0', null, '2020-03-10 20:33:34');
INSERT INTO `bamboo_basic_information` VALUES ('3241', 'sz002567', '唐人神', '7.61', '6.70', null, '0.76', '8.35', null, null, '6.83', null, null, '-1.670', '猪肉', null, '0', null, '2020-03-10 20:41:15');
INSERT INTO `bamboo_basic_information` VALUES ('12313', 'sz128097', '奥佳转债', '124.55', '115.00', '150.00', '12.10', '133.05', null, null, '108.85', null, null, '1.840', null, null, '0', null, '2020-03-23 09:21:16');
INSERT INTO `bamboo_basic_information` VALUES ('65464', 'sz002446', '盛路通信', '8.09', '8.20', null, '0.85', '9.39', null, null, '7.69', null, null, '-1.340', '5G', null, '0', null, '2020-03-10 21:26:30');
INSERT INTO `bamboo_basic_information` VALUES ('342342', 'sz002008', '大族激光', '28.62', '25.20', null, '2.94', '32.29', null, null, '26.41', null, null, '0.380', null, null, '0', null, '2020-03-10 14:17:19');
INSERT INTO `bamboo_basic_information` VALUES ('543893', 'sz300688', '创业黑马', '21.05', '19.50', null, '2.17', '23.83', null, null, '19.49', null, null, '-0.040', '创投', null, '0', null, '2020-03-10 21:41:30');
INSERT INTO `bamboo_basic_information` VALUES ('1231231', 'sh600635', '大众公用', '4.05', '3.90', '4.60', '0.41', '4.52', null, null, '3.70', null, null, '0.240', null, null, '1', '6.000', '2020-02-26 09:14:28');
INSERT INTO `bamboo_basic_information` VALUES ('3453453', 'sz000735', '罗 牛 山', '10.29', '9.70', '12.00', '1.01', '11.10', null, null, '9.08', null, null, '-1.340', null, null, '1', '4.000', '2020-02-26 09:14:28');
INSERT INTO `bamboo_basic_information` VALUES ('4234234', 'sz002466', '天齐锂业', '20.33', '20.60', null, '2.22', '24.45', null, null, '20.01', null, null, '-3.190', null, null, '0', null, '2020-03-09 10:15:52');
INSERT INTO `bamboo_basic_information` VALUES ('4321467', 'sh600498', '烽火通信', '35.66', '32.00', null, '3.92', '43.07', null, null, '35.23', null, null, '-3.770', '5G', null, '0', null, '2020-03-10 20:58:42');
INSERT INTO `bamboo_basic_information` VALUES ('5468982', 'sz300059', '东方财富', '16.64', '15.70', null, '1.69', '18.57', null, null, '15.19', null, null, '0.300', null, null, '0', null, '2020-03-11 11:28:52');
INSERT INTO `bamboo_basic_information` VALUES ('21312313', 'sz002153', '石基信息', '31.22', '28.00', null, '3.10', '34.05', null, null, '27.85', null, null, '1.620', '软件', null, '1', '4.000', '2020-03-09 09:46:42');
INSERT INTO `bamboo_basic_information` VALUES ('34253453', 'sz300698', '万马科技', '21.51', '17.00', null, '2.48', '27.31', null, null, '22.35', null, null, '-3.750', '5G', null, '0', null, '2020-03-11 11:34:41');
INSERT INTO `bamboo_basic_information` VALUES ('45654654', 'sz300229', '拓尔思', '16.61', '15.50', null, '1.67', '18.38', null, null, '15.04', null, null, '-1.010', '科技,软件', null, '0', null, '2020-03-10 21:28:14');
INSERT INTO `bamboo_basic_information` VALUES ('53470768', 'sz002324', '普利特', '17.69', '14.70', null, '1.83', '20.13', null, null, '16.47', null, null, '-2.310', '口罩', null, '0', null, '2020-03-10 22:21:17');
INSERT INTO `bamboo_basic_information` VALUES ('54223445', 'sz300502', '新易盛', '60.53', '52.00', null, '6.32', '69.50', null, null, '56.86', null, null, '-1.060', '5G', null, '0', null, '2020-03-10 20:59:54');
INSERT INTO `bamboo_basic_information` VALUES ('123214435', 'sh600138', '中青旅', '10.25', '10.00', null, '1.05', '11.55', null, null, '9.45', null, null, '0.000', '在线旅游,旅游酒店', null, '0', null, '2020-03-09 08:23:42');
INSERT INTO `bamboo_basic_information` VALUES ('123214436', 'sz002596', '海南瑞泽', '8.34', '6.50', null, '0.82', '9.03', null, null, '7.39', null, null, '-2.110', '赛马,海南', null, '0', null, '2020-03-09 08:21:32');
INSERT INTO `bamboo_basic_information` VALUES ('657658643', 'sz300265', '通光线缆', '12.97', '8.20', null, '1.40', '15.40', null, null, '12.60', null, null, '-5.670', '5G,特高压', null, '0', null, '2020-03-10 21:23:54');
INSERT INTO `bamboo_basic_information` VALUES ('12312543534568', 'sz000070', '特发信息', '9.78', '9.40', null, '1.03', '11.31', null, null, '9.25', null, null, '-1.410', '5G', null, '0', null, '2020-03-09 08:20:11');
INSERT INTO `bamboo_basic_information` VALUES ('343534543213423', 'sz002796', '世嘉科技', '38.06', '34.00', null, '3.99', '43.88', null, null, '35.90', null, null, '-1.780', '5G', null, '0', null, '2020-03-09 08:21:58');
INSERT INTO `bamboo_basic_information` VALUES ('5676545798086754', 'sz300615', '欣天科技', '17.90', '18.00', null, '1.95', '21.49', null, null, '17.59', null, null, '-2.500', '5G', null, '0', '2.000', '2020-03-09 08:22:37');
INSERT INTO `bamboo_basic_information` VALUES ('6575643245324233', 'sz300818', '耐普矿机', '33.41', '28.00', null, '3.43', '37.71', null, null, '30.85', null, null, '0.170', '机械设备', null, '0', null, '2020-03-09 08:23:09');
INSERT INTO `bamboo_basic_information` VALUES ('43242342342341221', 'sh603156', '养元饮品', '25.06', '22.00', null, '2.48', '27.27', null, null, '22.31', null, null, '0.280', '食品,饮料', null, '0', null, '2020-03-09 08:19:33');
INSERT INTO `bamboo_basic_information` VALUES ('235436869780678674', 'sz000987', '越秀金控', '8.24', '7.50', null, '0.82', '8.98', null, null, '7.34', null, null, '2.230', '多元金融', null, '0', null, '2020-03-09 08:20:47');
INSERT INTO `bamboo_basic_information` VALUES ('1233321485859340289', 'sh600362', '江西铜业', '12.70', '11.00', null, '1.29', '14.16', null, null, '11.58', null, null, '0.150', '有色金属,黄金概念,稀缺资源', '', '0', null, '2020-02-28 17:22:11');
INSERT INTO `bamboo_basic_information` VALUES ('1236814839041548289', 'sh600903', '贵州燃气', '10.81', '11.00', null, '1.10', '12.13', null, null, '9.93', null, null, '-0.640', '天然气', '', '0', null, '2020-03-09 08:43:31');
INSERT INTO `bamboo_basic_information` VALUES ('1236814924303360001', 'sz300490', '华自科技', '9.42', '8.30', null, '0.96', '10.58', null, null, '8.66', null, null, '-0.100', '', '', '0', null, '2020-03-09 08:43:52');
INSERT INTO `bamboo_basic_information` VALUES ('1236815040221339650', 'sz000779', '甘咨询', '10.43', '9.10', null, '0.98', '10.73', null, null, '8.77', null, null, '8.750', '工程设备,一带一路', '', '0', null, '2020-03-09 08:44:19');
INSERT INTO `bamboo_basic_information` VALUES ('1236815186283782146', 'sh600864', '哈投股份', '6.67', '6.40', null, '0.68', '7.49', null, null, '6.13', null, null, '0.300', '券商概念', '', '0', null, '2020-03-09 08:44:54');
INSERT INTO `bamboo_basic_information` VALUES ('1236815305284575234', 'sh600867', '通化东宝', '10.67', '9.50', null, '1.08', '11.84', null, null, '9.68', null, null, '-1.380', '医疗', '', '0', null, '2020-03-09 08:45:22');
INSERT INTO `bamboo_basic_information` VALUES ('1236815435639349250', 'sz300663', '科蓝软件', '21.62', '20.00', null, '2.23', '24.54', null, null, '20.08', null, null, '-2.390', '软件', '', '1', '9.000', '2020-03-09 08:45:53');
INSERT INTO `bamboo_basic_information` VALUES ('1236815682658689026', 'sh600258', '首旅酒店', '14.46', '12.00', null, '1.47', '16.16', null, null, '13.22', null, null, '-0.680', '酒店', '', '0', null, '2020-03-09 08:46:52');
INSERT INTO `bamboo_basic_information` VALUES ('1236815777324130305', 'sz002806', '华锋股份', '12.32', '12.00', null, '1.29', '14.21', null, null, '11.63', null, null, '-1.200', '', '', '0', null, '2020-03-09 08:47:15');
INSERT INTO `bamboo_basic_information` VALUES ('1236815900737331202', 'sh603169', '兰石重装', '4.63', '4.20', null, '0.48', '5.28', null, null, '4.32', null, null, '-0.640', '一带一路,工程设备', '', '0', null, '2020-03-09 08:47:44');
INSERT INTO `bamboo_basic_information` VALUES ('1236816039270998018', 'sz002235', '安妮股份', '8.60', '8.30', null, '0.88', '9.71', null, null, '7.95', null, null, '-1.600', '知识产权,区块链', '', '0', null, '2020-03-09 08:48:17');
INSERT INTO `bamboo_basic_information` VALUES ('1236816177653669889', 'sh600599', '熊猫金控', '7.32', '6.50', null, '0.75', '8.29', null, null, '6.79', null, null, '0.000', '多元金融', '', '0', null, '2020-03-09 08:48:50');
INSERT INTO `bamboo_basic_information` VALUES ('1236816318074773506', 'sz002583', '海能达', '6.48', '6.70', null, '0.69', '7.60', null, null, '6.22', null, null, '-3.130', '', '', '0', null, '2020-03-09 08:49:24');
INSERT INTO `bamboo_basic_information` VALUES ('1236816457644433410', 'sz300284', '苏交科', '9.25', '8.20', null, '0.92', '10.11', null, null, '8.27', null, null, '3.230', '基建', '', '0', null, '2020-03-09 08:49:57');
INSERT INTO `bamboo_basic_information` VALUES ('1236816557707943938', 'sh601162', '天风证券', '5.47', '5.30', null, '0.57', '6.22', null, null, '5.08', null, null, '-0.180', '券商', '', '0', null, '2020-03-09 08:50:21');
INSERT INTO `bamboo_basic_information` VALUES ('1236816677400797186', 'sz300674', '宇信科技', '35.70', '28.00', null, '3.65', '40.17', null, null, '32.87', null, null, '1.130', '区块链,软件', '', '0', null, '2020-03-09 08:50:50');
INSERT INTO `bamboo_basic_information` VALUES ('1236816772015906817', 'sh600004', '白云机场', '13.23', '12.50', null, '1.38', '15.17', null, null, '12.41', null, null, '-2.360', '机场', '', '0', null, '2020-03-09 08:51:12');
INSERT INTO `bamboo_basic_information` VALUES ('1236816867432128513', 'sh603043', '广州酒家', '28.48', '24.00', null, '2.77', '30.42', null, null, '24.88', null, null, '2.920', '酒店', '', '0', null, '2020-03-09 08:51:35');
INSERT INTO `bamboo_basic_information` VALUES ('1236817006796267522', 'sh603777', '来伊份', '12.39', '10.50', null, '1.31', '14.40', null, null, '11.78', null, null, '-3.870', '食品', '', '0', null, '2020-03-09 08:52:08');
INSERT INTO `bamboo_basic_information` VALUES ('1236817089667325953', 'sh600766', '园城黄金', '7.91', '7.50', null, '0.84', '9.26', null, null, '7.58', null, null, '-1.730', '黄金', '', '0', null, '2020-03-09 08:52:28');
INSERT INTO `bamboo_basic_information` VALUES ('1236817211809652737', 'sz300414', '中光防雷', '13.40', '12.20', null, '1.43', '15.73', null, null, '12.87', null, null, '-6.680', '5G', '', '0', null, '2020-03-09 08:52:57');

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
-- Records of bamboo_basic_information_tips
-- ----------------------------
INSERT INTO `bamboo_basic_information_tips` VALUES ('1236816039270998018', 'sz002235', '安妮股份', '9.54', '9.60', '1', '-3.440', '2020-03-11 23:28:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237764256976384001', 'sz002235', '安妮股份', '9.54', '9.60', '1', '-3.440', '2020-03-11 23:36:10', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237764568562880513', 'sz002235', '安妮股份', '9.54', '9.60', '1', '-3.440', '2020-03-11 23:37:24', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237765251114532866', 'sz000735', '罗 牛 山', '10.79', null, '2', '4.450', '2020-03-11 23:40:07', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237765322115710978', 'sz000735', '罗 牛 山', '10.79', null, '2', '4.450', '2020-03-11 23:40:24', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237773388823408641', 'sz002235', '安妮股份', '9.54', '9.60', '1', '-3.440', '2020-03-12 00:12:27', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237773891040980994', 'sh603301', '振德医疗', '46.55', '47.00', '1', '9.990', '2020-03-12 00:14:27', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237773966538452993', 'sh603301', '振德医疗', '46.55', '47.00', '1', '9.990', '2020-03-12 00:14:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237891244219203585', 'sz000735', '罗 牛 山', '10.79', null, '2', '4.450', '2020-03-12 08:00:46', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237891390323589121', 'sz000735', '罗 牛 山', '10.79', null, '2', '4.450', '2020-03-12 08:01:21', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237891478487859201', 'sz002235', '安妮股份', '9.54', '9.60', '1', '-3.440', '2020-03-12 08:01:42', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237891591595655170', 'sz002235', '安妮股份', '9.54', '9.60', '1', '-3.440', '2020-03-12 08:02:09', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237913176004120577', 'sz300688', '创业黑马', '25.06', '25.80', '1', '-4.890', '2020-03-12 09:27:55', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237913176041869314', 'sz002153', '石基信息', '36.00', '36.30', '1', '-1.120', '2020-03-12 09:27:55', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237913176046063617', 'sz300663', '科蓝软件', '24.13', '24.30', '1', '-2.700', '2020-03-12 09:27:55', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237913825596952577', 'sz002153', '石基信息', '35.39', '35.50', '1', '-2.800', '2020-03-12 09:30:30', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237913926264442881', 'sz002153', '石基信息', '34.88', '35.50', '2', '-4.200', '2020-03-12 09:30:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237914467342241793', 'sh600004', '白云机场', '15.15', '15.20', '1', '-2.940', '2020-03-12 09:33:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237914567988760577', 'sh603156', '养元饮品', '25.96', '26.00', '1', '-1.810', '2020-03-12 09:33:27', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237914945467731970', 'sz002324', '普利特', '16.88', '17.00', '1', '-2.480', '2020-03-12 09:34:57', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237914970650333185', 'sh603169', '兰石重装', '4.99', '5.00', '1', '-2.530', '2020-03-12 09:35:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237921501173272577', 'sh603156', '养元饮品', '25.95', '26.00', '1', '-1.850', '2020-03-12 10:01:00', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237921941604552705', 'sh600903', '贵州燃气', '11.99', '12.00', '1', '-2.360', '2020-03-12 10:02:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237922079999807489', 'sz002153', '石基信息', '35.40', '35.50', '1', '-2.770', '2020-03-12 10:03:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237922721728319490', 'sh600867', '通化东宝', '11.58', '11.60', '1', '-2.360', '2020-03-12 10:05:51', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237925552866742274', 'sz300818', '耐普矿机', '36.99', '37.00', '1', '-2.010', '2020-03-12 10:17:06', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237929000588824578', 'sh600867', '通化东宝', '11.56', '11.60', '1', '-2.520', '2020-03-12 10:30:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237929025771425794', 'sh600867', '通化东宝', '11.56', '11.60', '1', '-2.520', '2020-03-12 10:30:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237929113830838273', 'sh600867', '通化东宝', '11.56', '11.60', '1', '-2.520', '2020-03-12 10:31:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237929139017633794', 'sh600867', '通化东宝', '11.56', '11.60', '1', '-2.520', '2020-03-12 10:31:21', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237968737458475009', 'sz300818', '耐普矿机', '36.99', '37.00', '1', '-2.010', '2020-03-12 13:08:42', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237973997077942274', 'sz002324', '普利特', '16.39', '16.40', '1', '-5.310', '2020-03-12 13:29:36', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237974299076218881', 'sh603156', '养元饮品', '25.79', '25.80', '1', '-2.450', '2020-03-12 13:30:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237974349441421313', 'sz300688', '创业黑马', '24.77', '24.80', '1', '-5.990', '2020-03-12 13:31:00', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237982956119674881', 'sz002324', '普利特', '16.18', '16.20', '1', '-6.520', '2020-03-12 14:05:12', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237983094523318274', 'sz002324', '普利特', '16.08', '16.20', '1', '-7.100', '2020-03-12 14:05:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237988001854803969', 'sz000987', '越秀金控', '8.49', '8.50', '1', '-2.410', '2020-03-12 14:25:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237988731684671489', 'sz300818', '耐普矿机', '36.58', '36.60', '1', '-3.090', '2020-03-12 14:28:09', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237988756829523970', 'sz000987', '越秀金控', '8.49', '8.50', '1', '-2.410', '2020-03-12 14:28:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1237989046249082882', 'sz000987', '越秀金控', '8.46', '8.50', '1', '-2.750', '2020-03-12 14:29:24', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238276773079277570', 'sz000735', '罗 牛 山', '10.18', null, '2', '-5.650', '2020-03-13 09:32:43', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169831075841', 'sh600547', '山东黄金', '30.68', '31.00', '1', '-8.690', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169839464450', 'sz002008', '大族激光', '32.12', '33.00', '1', '-6.080', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169839464451', 'sz300688', '创业黑马', '23.45', '24.50', '1', '-6.160', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169847853058', 'sz002153', '石基信息', '33.54', '34.60', '1', '-5.460', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169847853059', 'sz002324', '普利特', '15.23', '15.70', '1', '-6.560', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169847853060', 'sz300502', '新易盛', '60.97', '62.00', '1', '-6.220', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169852047361', 'sz300818', '耐普矿机', '34.76', '36.40', '1', '-5.100', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169852047362', 'sh603156', '养元饮品', '24.71', '25.60', '1', '-3.960', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169852047363', 'sh600903', '贵州燃气', '11.32', '11.90', '1', '-5.350', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169852047364', 'sz300490', '华自科技', '9.86', '10.00', '1', '-4.270', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169860435970', 'sz000779', '甘咨询', '9.67', '10.00', '1', '-5.000', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169860435971', 'sh600867', '通化东宝', '10.98', '11.30', '1', '-4.180', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169860435972', 'sz300663', '科蓝软件', '22.86', '24.10', '1', '-5.770', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169864630274', 'sh603169', '兰石重装', '4.67', '4.80', '1', '-5.650', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169864630275', 'sz002235', '安妮股份', '8.59', '9.00', '1', '-6.220', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277169873018882', 'sh600004', '白云机场', '14.40', '14.82', '1', '-3.800', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277170221146113', 'sh600635', '大众公用', '4.24', null, '2', '-4.280', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277170225340418', 'sz002153', '石基信息', '33.54', '34.60', '2', '-5.460', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277170233729025', 'sz300663', '科蓝软件', '22.86', '24.10', '2', '-5.770', '2020-03-13 09:34:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277371157667842', 'sz000735', '罗 牛 山', '9.73', null, '2', '-4.420', '2020-03-13 09:35:06', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238277396298326017', 'sz000987', '越秀金控', '8.19', '8.20', '1', '-4.090', '2020-03-13 09:35:12', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238278151285628929', 'sz002153', '石基信息', '33.56', '34.60', '1', '-5.410', '2020-03-13 09:38:12', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238305670089007106', 'sz002153', '石基信息', '34.05', '32.00', '2', '-4.030', '2020-03-13 11:27:33', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238312779371372545', 'sz002153', '石基信息', '34.00', '32.00', '2', '-4.170', '2020-03-13 11:55:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238329112028897282', 'sz000735', '罗 牛 山', '10.60', null, '2', '4.120', '2020-03-13 13:00:42', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238348340094095362', 'sz000735', '罗 牛 山', '11.00', null, '3', '8.050', '2020-03-13 14:17:06', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238348867246804994', 'sz000735', '罗 牛 山', '10.96', null, '3', '7.660', '2020-03-13 14:19:12', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238349111602761729', 'sz000735', '罗 牛 山', '10.95', null, '3', '7.560', '2020-03-13 14:19:35', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238350806537814018', 'sz000735', '罗 牛 山', '11.03', null, '3', '8.340', '2020-03-13 14:26:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238352869673984001', 'sz000735', '罗 牛 山', '10.99', '10.00', '3', '7.950', '2020-03-13 14:35:06', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1238706428777140225', 'sz000735', '罗 牛 山', '11.02', null, '2', '8.250', '2020-03-14 14:00:01', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239024560020439041', 'sz000735', '罗 牛 山', '11.02', null, '2', '8.250', '2020-03-15 11:04:09', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239362725973397505', 'sz002341', '新纶科技', '2.00', '7.00', '1', null, '2020-03-16 09:27:55', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239362976113299458', 'sz000735', '罗 牛 山', '11.02', null, '2', '8.250', '2020-03-16 09:28:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239365163883237377', 'sz000735', '罗 牛 山', '11.20', '11.19', '3', '1.630', '2020-03-16 09:37:36', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239420516251537409', 'sz002466', '天齐锂业', '27.99', '28.00', '1', '-4.950', '2020-03-16 13:17:33', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239420732354662401', 'sz002466', '天齐锂业', '27.93', '28.00', '1', '-5.160', '2020-03-16 13:18:25', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239422416095088642', 'sh600635', '大众公用', '4.29', '4.30', '1', '-0.230', '2020-03-16 13:25:06', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239424693467942913', 'sz300688', '创业黑马', '23.42', '23.50', '1', '-1.380', '2020-03-16 13:34:09', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239424819431280642', 'sh600004', '白云机场', '13.99', '14.00', '1', '-3.510', '2020-03-16 13:34:39', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239427023428980737', 'sz002792', '通宇通讯', '29.99', '30.00', '1', '-9.990', '2020-03-16 13:43:24', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239431589050519553', 'sz002153', '石基信息', '33.40', '32.00', '2', '-4.050', '2020-03-16 14:01:33', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239431855023919105', 'sz300663', '科蓝软件', '22.49', '22.50', '1', '-4.940', '2020-03-16 14:02:36', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239432056639918081', 'sh600635', '大众公用', '4.21', '4.22', '1', '-2.090', '2020-03-16 14:03:24', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239432469841776642', 'sz300688', '创业黑马', '22.48', '22.50', '1', '-5.340', '2020-03-16 14:05:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239433275152338945', 'sz000735', '罗 牛 山', '10.69', '10.70', '1', '-2.990', '2020-03-16 14:08:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239433467926745090', 'sz002008', '大族激光', '30.99', '31.00', '1', '-6.880', '2020-03-16 14:09:01', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239440249378115585', 'sh600004', '白云机场', '13.49', '13.50', '1', '-6.960', '2020-03-16 14:35:58', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239440321562087425', 'sz000735', '罗 牛 山', '10.56', '10.70', '2', '-4.170', '2020-03-16 14:36:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239441592461365249', 'sh600864', '哈投股份', '6.99', '7.00', '1', '-9.100', '2020-03-16 14:41:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1239445458544300034', 'sz300818', '耐普矿机', '34.30', '34.40', '1', '-3.620', '2020-03-16 14:56:40', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240088927101067266', 'sz002341', '新纶科技', '6.71', '7.00', '1', '-1.610', '2020-03-18 09:33:34', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240088927122038786', 'sz300688', '创业黑马', '22.05', '22.50', '1', '1.140', '2020-03-18 09:33:34', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240088927122038787', 'sz002466', '天齐锂业', '25.96', '26.60', '1', '0.620', '2020-03-18 09:33:34', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240089083959648257', 'sz300818', '耐普矿机', '34.32', '34.40', '1', '0.050', '2020-03-18 09:34:12', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240146466488524802', 'sz300615', '欣天科技', '17.99', '18.00', '1', '0.550', '2020-03-18 13:22:13', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240147732979589122', 'sh600867', '通化东宝', '10.49', '10.50', '1', '-0.560', '2020-03-18 13:27:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240148638890532865', 'sh600599', '熊猫金控', '7.99', '8.00', '1', '-1.230', '2020-03-18 13:30:51', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240154341457862658', 'sz002796', '世嘉科技', '37.97', '38.00', '1', '-1.630', '2020-03-18 13:53:31', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240155182092853249', 'sh600362', '江西铜业', '12.99', '13.00', '1', '-1.880', '2020-03-18 13:56:51', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240155447483244545', 'sz000735', '罗 牛 山', '10.09', '9.70', '2', '-4.080', '2020-03-18 13:57:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240159535667159041', 'sh600258', '首旅酒店', '14.98', '15.00', '1', '-2.470', '2020-03-18 14:14:09', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240166468843282434', 'sz002153', '石基信息', '31.98', '32.00', '1', '-2.910', '2020-03-18 14:41:42', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240166696661098498', 'sh603043', '广州酒家', '27.38', '27.40', '1', '-4.060', '2020-03-18 14:42:36', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240166959610404865', 'sz300490', '华自科技', '9.29', '9.30', '1', '-2.410', '2020-03-18 14:43:39', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240168696043872258', 'sz002153', '石基信息', '31.60', '32.00', '2', '-4.060', '2020-03-18 14:50:33', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1240169137678917634', 'sz000070', '特发信息', '10.19', '10.20', '1', '-5.640', '2020-03-18 14:52:18', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439916945410', 'sz002341', '新纶科技', '6.49', '7.00', '1', '0.770', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439916945411', 'sz300688', '创业黑马', '21.75', '22.50', '1', '-0.820', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439916945412', 'sz002466', '天齐锂业', '23.22', '26.60', '1', '-1.020', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439916945413', 'sz300818', '耐普矿机', '34.17', '34.40', '1', '1.960', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439916945414', 'sh600362', '江西铜业', '12.61', '13.00', '1', '2.430', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439937916929', 'sh600258', '首旅酒店', '14.86', '15.00', '1', '3.050', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439937916930', 'sh600599', '熊猫金控', '7.62', '8.00', '1', '-0.390', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899439937916931', 'sh601162', '天风证券', '5.86', '6.50', '1', '0.510', '2020-03-23 09:27:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899690061041666', 'sz000735', '罗 牛 山', '10.62', '9.70', '2', '5.980', '2020-03-23 09:28:54', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727319044097', 'sz002008', '大族激光', '28.33', '29.20', '1', '-3.630', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727319044098', 'sz002153', '石基信息', '31.14', '32.00', '1', '-2.710', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727323238401', 'sz300229', '拓尔思', '16.41', '16.50', '1', '-3.470', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727323238402', 'sz000070', '特发信息', '10.04', '10.20', '1', '-3.180', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727323238403', 'sz002796', '世嘉科技', '37.80', '38.00', '1', '-3.890', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727323238404', 'sh603156', '养元饮品', '24.30', '24.40', '1', '-1.810', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727323238405', 'sh600867', '通化东宝', '10.26', '10.50', '1', '-2.470', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241899727323238406', 'sh603043', '广州酒家', '26.78', '27.40', '1', '-3.070', '2020-03-23 09:29:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241900017497772034', 'sz300490', '华自科技', '9.29', '9.30', '1', '-2.510', '2020-03-23 09:30:12', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901128141082626', 'sz002341', '新纶科技', '6.66', '7.00', '1', '2.610', '2020-03-23 09:34:37', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901128149471233', 'sz300688', '创业黑马', '21.20', '22.50', '1', '-2.520', '2020-03-23 09:34:37', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901136500330498', 'sz300818', '耐普矿机', '33.51', '34.40', '1', '-1.930', '2020-03-23 09:34:39', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901136508719106', 'sh600258', '首旅酒店', '14.23', '15.00', '1', '-4.230', '2020-03-23 09:34:39', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901151213948929', 'sz002153', '石基信息', '31.12', '32.00', '1', '-2.780', '2020-03-23 09:34:43', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901151222337537', 'sh600599', '熊猫金控', '7.38', '8.00', '1', '-3.140', '2020-03-23 09:34:43', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901151222337538', 'sh601162', '天风证券', '5.73', '6.50', '1', '-2.210', '2020-03-23 09:34:43', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901161661960194', 'sz002341', '新纶科技', '6.68', '7.00', '1', '2.920', '2020-03-23 09:34:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901161661960195', 'sz300688', '创业黑马', '21.26', '22.50', '1', '-2.250', '2020-03-23 09:34:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901161661960196', 'sz300818', '耐普矿机', '33.51', '34.40', '1', '-1.930', '2020-03-23 09:34:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901161661960197', 'sh600258', '首旅酒店', '14.26', '15.00', '1', '-4.030', '2020-03-23 09:34:45', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901174261649410', 'sz002008', '大族激光', '28.50', '29.20', '1', '-3.060', '2020-03-23 09:34:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901174261649411', 'sz002466', '天齐锂业', '21.86', '26.60', '1', '-5.850', '2020-03-23 09:34:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901174261649412', 'sz002153', '石基信息', '31.13', '32.00', '1', '-2.740', '2020-03-23 09:34:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901174261649413', 'sh600362', '江西铜业', '12.26', '13.00', '1', '-2.770', '2020-03-23 09:34:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901174261649414', 'sh600599', '熊猫金控', '7.39', '8.00', '1', '-3.010', '2020-03-23 09:34:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901174261649415', 'sh601162', '天风证券', '5.73', '6.50', '1', '-2.210', '2020-03-23 09:34:48', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200580907009', 'sz002341', '新纶科技', '6.68', '7.00', '1', '2.920', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295617', 'sz002008', '大族激光', '28.48', '29.20', '1', '-3.120', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295618', 'sz300688', '创业黑马', '21.22', '22.50', '1', '-2.430', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295619', 'sz002466', '天齐锂业', '21.86', '26.60', '1', '-5.850', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295620', 'sz002153', '石基信息', '31.16', '32.00', '1', '-2.650', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295621', 'sz300818', '耐普矿机', '33.51', '34.40', '1', '-1.930', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295622', 'sh600362', '江西铜业', '12.26', '13.00', '1', '-2.770', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295623', 'sh600867', '通化东宝', '10.36', '10.50', '1', '-1.520', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901200589295624', 'sh600258', '首旅酒店', '14.26', '15.00', '1', '-4.030', '2020-03-23 09:34:54', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901212031356930', 'sh600599', '熊猫金控', '7.39', '8.00', '1', '-3.010', '2020-03-23 09:34:57', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901212031356931', 'sh601162', '天风证券', '5.75', '6.50', '1', '-1.870', '2020-03-23 09:34:57', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901238379974657', 'sz002341', '新纶科技', '6.69', '7.00', '1', '3.080', '2020-03-23 09:35:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901238379974658', 'sz002008', '大族激光', '28.51', '29.20', '1', '-3.020', '2020-03-23 09:35:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901238379974659', 'sz300688', '创业黑马', '21.26', '22.50', '1', '-2.250', '2020-03-23 09:35:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901238379974660', 'sz002466', '天齐锂业', '21.85', '26.60', '1', '-5.900', '2020-03-23 09:35:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901238379974661', 'sz002153', '石基信息', '31.18', '32.00', '1', '-2.590', '2020-03-23 09:35:03', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241901339420758017', 'sz300229', '拓尔思', '16.48', '16.50', '1', '-3.050', '2020-03-23 09:35:27', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241906006053720065', 'sz002153', '石基信息', '30.70', '30.00', '2', '-4.090', '2020-03-23 09:54:00', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241910131202035713', 'sz002153', '石基信息', '29.98', '30.00', '1', '-6.340', '2020-03-23 10:10:24', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241968481411371010', 'sz002567', '唐人神', '7.29', '7.30', '1', '-4.700', '2020-03-23 14:02:15', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241976180995887105', 'sh603301', '振德医疗', '37.94', '38.00', '1', '-9.010', '2020-03-23 14:32:51', '0');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241977554437509122', 'sh600903', '贵州燃气', '10.98', '11.00', '1', '-3.850', '2020-03-23 14:38:18', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241977628055932929', 'sz300229', '拓尔思', '15.46', '15.50', '1', '-9.050', '2020-03-23 14:38:36', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1241977690936938497', 'sz002583', '海能达', '6.69', '6.70', '1', '-5.640', '2020-03-23 14:38:51', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242624215711043585', 'sz300229', '拓尔思', '15.30', '15.50', '1', '-10.000', '2020-03-25 09:27:54', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242624215711043586', 'sh600903', '贵州燃气', '10.77', '11.00', '1', '-5.690', '2020-03-25 09:27:54', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242624215711043587', 'sz002583', '海能达', '6.60', '6.70', '1', '-6.910', '2020-03-25 09:27:54', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242624467767742466', 'sz000735', '罗 牛 山', '10.08', '9.70', '2', '-5.080', '2020-03-25 09:28:55', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242624467771936769', 'sz002153', '石基信息', '30.27', '28.00', '2', '-5.430', '2020-03-25 09:28:55', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242991665984118785', 'sh600903', '贵州燃气', '10.95', '11.00', '1', '-0.720', '2020-03-26 09:48:01', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1242993938055372801', 'sz000735', '罗 牛 山', '10.50', '9.70', '2', '4.060', '2020-03-26 09:57:03', '1');
INSERT INTO `bamboo_basic_information_tips` VALUES ('1243015630236491777', 'sz002583', '海能达', '6.69', '6.70', '1', '-3.180', '2020-03-26 11:23:15', '1');

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
-- Records of bamboo_coin_info
-- ----------------------------
INSERT INTO `bamboo_coin_info` VALUES ('31231', 'btc', '6696.670000', '4900.000000', '6600.000000', 'btcusdt', '2020-03-13 16:29:20');

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
-- Records of bamboo_coin_symbol
-- ----------------------------
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416393056257', 'trio', 'btc', '10', '2', 'innovation', 'triobtc', 'online', '8', '1.0000000', '330000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416409833473', 'cro', 'ht', '4', '2', 'innovation', 'croht', 'online', '8', '1.0000000', '15000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416409833474', 'wxt', 'btc', '10', '2', 'innovation', 'wxtbtc', 'online', '8', '1.0000000', '200000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416418222081', 'ae', 'eth', '6', '4', 'innovation', 'aeeth', 'online', '8', '0.0100000', '200000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416422416385', 'wicc', 'eth', '8', '2', 'innovation', 'wicceth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416439193602', 'get', 'btc', '10', '2', 'innovation', 'getbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416439193603', 'pax', 'husd', '4', '4', 'main', 'paxhusd', 'online', '8', '0.1000000', '1500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416443387905', 'gsc', 'eth', '8', '2', 'innovation', 'gsceth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416451776513', 'mtn', 'btc', '10', '2', 'innovation', 'mtnbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416455970818', 'dgb', 'btc', '10', '2', 'innovation', 'dgbbtc', 'online', '8', '1.0000000', '35000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416455970819', 'xmx', 'eth', '8', '2', 'innovation', 'xmxeth', 'online', '8', '1.0000000', '250000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416455970820', 'mt', 'btc', '10', '2', 'innovation', 'mtbtc', 'online', '8', '1.0000000', '125000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416455970821', 'pay', 'eth', '8', '2', 'innovation', 'payeth', 'online', '8', '0.1000000', '500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416468553729', 'iota', 'eth', '6', '4', 'main', 'iotaeth', 'online', '8', '0.0100000', '500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416468553730', 'cvnt', 'eth', '8', '4', 'innovation', 'cvnteth', 'online', '8', '1.0000000', '85000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416481136641', 'uip', 'usdt', '6', '2', 'innovation', 'uipusdt', 'online', '8', '1.0000000', '30000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416489525250', 'cvcoin', 'btc', '8', '2', 'innovation', 'cvcoinbtc', 'online', '8', '0.1000000', '1900000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416493719554', 'ssp', 'eth', '8', '2', 'innovation', 'sspeth', 'online', '8', '1.0000000', '1100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416502108162', 'lol', 'ht', '6', '4', 'innovation', 'lolht', 'online', '8', '1.0000000', '750000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416502108163', 'soc', 'eth', '8', '2', 'innovation', 'soceth', 'online', '8', '1.0000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416506302466', 'vsys', 'btc', '8', '2', 'innovation', 'vsysbtc', 'online', '8', '0.1000000', '5600000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416514691074', 'for', 'ht', '6', '2', 'innovation', 'forht', 'online', '8', '1.0000000', '30000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416514691075', 'ven', 'btc', '8', '2', 'innovation', 'venbtc', 'offline', '8', '0.0100000', '100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416518885378', 'zjlt', 'btc', '10', '2', 'innovation', 'zjltbtc', 'online', '8', '1.0000000', '443099.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416527273986', 'ncash', 'btc', '10', '2', 'innovation', 'ncashbtc', 'online', '8', '1.0000000', '610477.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416527273987', 'mana', 'eth', '8', '0', 'innovation', 'manaeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416531468290', 'egt', 'ht', '6', '2', 'innovation', 'egtht', 'online', '8', '1.0000000', '350000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416544051202', 'edu', 'eth', '10', '2', 'innovation', 'edueth', 'online', '8', '1.0000000', '2500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416544051203', 'man', 'eth', '6', '4', 'innovation', 'maneth', 'online', '8', '0.1000000', '500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416548245505', 'gtc', 'btc', '10', '2', 'innovation', 'gtcbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416548245506', 'cova', 'btc', '10', '2', 'innovation', 'covabtc', 'online', '8', '1.0000000', '40000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416556634113', 'bat', 'usdt', '4', '2', 'innovation', 'batusdt', 'online', '8', '0.1000000', '6000000.000', '5.0000000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416556634114', 'nas', 'usdt', '4', '4', 'innovation', 'nasusdt', 'online', '8', '0.0100000', '100000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416560828418', 'doge', 'eth', '8', '2', 'innovation', 'dogeeth', 'online', '8', '1.0000000', '200000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416560828419', 'dat', 'eth', '8', '2', 'innovation', 'dateth', 'online', '8', '1.0000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416565022722', 'hb10', 'usdt', '4', '4', 'main', 'hb10usdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416565022723', 'xtz', 'btc', '8', '2', 'innovation', 'xtzbtc', 'online', '8', '0.1000000', '2000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416573411330', 'mtl', 'btc', '8', '4', 'innovation', 'mtlbtc', 'online', '8', '0.0100000', '2100.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416573411331', 'ogo', 'ht', '6', '2', 'innovation', 'ogoht', 'online', '8', '1.0000000', '40000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416577605634', 'ht', 'btc', '8', '2', 'main', 'htbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416577605635', 'ada', 'btc', '8', '2', 'main', 'adabtc', 'online', '8', '0.1000000', '5000000.000', '0.0001000', '2.5000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416577605636', 'dac', 'btc', '10', '2', 'innovation', 'dacbtc', 'online', '8', '1.0000000', '300000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416585994242', 'aidoc', 'btc', '10', '2', 'innovation', 'aidocbtc', 'online', '8', '1.0000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416585994243', 'xmr', 'eth', '6', '4', 'main', 'xmreth', 'online', '8', '0.0001000', '5000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416590188546', 'zil', 'usdt', '6', '4', 'innovation', 'zilusdt', 'online', '8', '1.0000000', '10000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416590188547', 'nas', 'eth', '6', '4', 'innovation', 'naseth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416590188548', 'cre', 'ht', '6', '2', 'innovation', 'creht', 'online', '8', '1.0000000', '80000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416590188549', 'omg', 'usdt', '4', '4', 'innovation', 'omgusdt', 'online', '8', '0.0100000', '1000000.000', '5.0000000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771457', 'tos', 'btc', '10', '2', 'innovation', 'tosbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771458', 'qsp', 'eth', '10', '0', 'innovation', 'qspeth', 'online', '8', '1.0000000', '48000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771459', 'poly', 'btc', '8', '2', 'innovation', 'polybtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771460', 'act', 'usdt', '6', '2', 'innovation', 'actusdt', 'online', '8', '0.1000000', '5000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771461', 'ost', 'eth', '8', '2', 'innovation', 'osteth', 'online', '8', '0.1000000', '44400.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771462', 'waves', 'eth', '6', '4', 'innovation', 'waveseth', 'online', '8', '0.0100000', '200000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771463', 'dash', 'btc', '6', '4', 'main', 'dashbtc', 'online', '8', '0.0010000', '10000.000', '0.0001000', '2.5000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416602771464', 'elf', 'eth', '8', '0', 'innovation', 'elfeth', 'online', '8', '1.0000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416623742977', 'steem', 'eth', '6', '4', 'innovation', 'steemeth', 'online', '8', '0.0100000', '300000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416623742978', 'xmr', 'usdt', '2', '4', 'main', 'xmrusdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416623742979', 'btc', 'usdt', '2', '6', 'main', 'btcusdt', 'online', '8', '0.0001000', '1000.000', '5.0000000', '5.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416627937281', 'mex', 'btc', '10', '2', 'innovation', 'mexbtc', 'online', '8', '1.0000000', '1800000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416627937282', 'appc', 'eth', '6', '4', 'innovation', 'appceth', 'online', '8', '0.0100000', '16952.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416627937283', 'hit', 'usdt', '6', '4', 'innovation', 'hitusdt', 'online', '8', '1.0000000', '6873879.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416627937284', 'act', 'eth', '8', '2', 'innovation', 'acteth', 'online', '8', '0.1000000', '500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416627937285', 'req', 'btc', '8', '1', 'innovation', 'reqbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416636325889', 'zrx', 'eth', '8', '2', 'innovation', 'zrxeth', 'online', '8', '0.1000000', '2000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416636325890', 'let', 'usdt', '6', '4', 'innovation', 'letusdt', 'online', '8', '1.0000000', '295000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416636325891', 'zil', 'eth', '8', '2', 'innovation', 'zileth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416636325892', 'bch', 'husd', '2', '4', 'main', 'bchhusd', 'online', '8', '0.0010000', '5000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416640520193', 'cnns', 'usdt', '6', '2', 'innovation', 'cnnsusdt', 'online', '8', '1.0000000', '100000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416640520194', 'ruff', 'btc', '10', '2', 'innovation', 'ruffbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416640520195', 'ycc', 'btc', '10', '2', 'innovation', 'yccbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416640520196', 'gxc', 'btc', '8', '2', 'innovation', 'gxcbtc', 'online', '8', '0.0100000', '250000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908802', 'atp', 'btc', '10', '2', 'innovation', 'atpbtc', 'online', '8', '1.0000000', '30000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908803', 'ncc', 'btc', '10', '2', 'innovation', 'nccbtc', 'online', '8', '1.0000000', '394000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908804', 'snt', 'btc', '8', '0', 'innovation', 'sntbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908805', 'ftt', 'usdt', '4', '4', 'innovation', 'fttusdt', 'online', '8', '0.0100000', '700000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908806', 'stk', 'eth', '8', '2', 'innovation', 'stketh', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908807', 'npxs', 'eth', '8', '2', 'innovation', 'npxseth', 'online', '8', '1.0000000', '1200000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416648908808', 'pc', 'btc', '10', '2', 'innovation', 'pcbtc', 'online', '8', '1.0000000', '5733000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416653103105', 'mtx', 'btc', '8', '2', 'innovation', 'mtxbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416653103106', 'theta', 'eth', '8', '2', 'innovation', 'thetaeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416653103107', 'fair', 'eth', '8', '2', 'innovation', 'faireth', 'online', '8', '1.0000000', '500000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416653103108', 'nexo', 'eth', '6', '4', 'innovation', 'nexoeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416661491713', 'kcash', 'eth', '8', '2', 'innovation', 'kcasheth', 'online', '8', '1.0000000', '25000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416661491714', 'em', 'btc', '10', '2', 'innovation', 'embtc', 'online', '8', '1.0000000', '120000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416661491715', 'neo', 'usdt', '2', '4', 'innovation', 'neousdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '2.5000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416661491716', 'ae', 'usdt', '4', '2', 'innovation', 'aeusdt', 'online', '8', '0.1000000', '2000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416661491717', 'tnb', 'eth', '8', '0', 'innovation', 'tnbeth', 'online', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416665686018', 'ogo', 'btc', '8', '2', 'innovation', 'ogobtc', 'online', '8', '1.0000000', '40000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416665686019', 'soc', 'usdt', '6', '2', 'innovation', 'socusdt', 'online', '8', '0.1000000', '3000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416665686020', 'lym', 'eth', '8', '2', 'innovation', 'lymeth', 'online', '8', '1.0000000', '9000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416665686021', 'gve', 'btc', '10', '2', 'innovation', 'gvebtc', 'online', '8', '1.0000000', '450000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416665686022', 'mx', 'btc', '8', '2', 'innovation', 'mxbtc', 'online', '8', '0.1000000', '7000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416665686023', 'dta', 'btc', '10', '2', 'innovation', 'dtabtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074626', 'smt', 'usdt', '6', '4', 'innovation', 'smtusdt', 'online', '8', '1.0000000', '15000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074627', 'algo', 'btc', '8', '2', 'innovation', 'algobtc', 'online', '8', '0.0100000', '300000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074628', 'iost', 'eth', '8', '2', 'innovation', 'iosteth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074629', 'lun', 'btc', '6', '4', 'innovation', 'lunbtc', 'online', '8', '0.0010000', '600.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074630', 'bcv', 'eth', '8', '2', 'innovation', 'bcveth', 'online', '8', '1.0000000', '22000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074631', 'ren', 'eth', '6', '4', 'innovation', 'reneth', 'online', '8', '1.0000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416674074632', 'chat', 'btc', '10', '2', 'innovation', 'chatbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416678268929', 'xem', 'btc', '8', '2', 'innovation', 'xembtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416678268930', 'cvc', 'btc', '8', '0', 'innovation', 'cvcbtc', 'online', '8', '0.1000000', '2000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416678268931', 'vsys', 'ht', '6', '2', 'innovation', 'vsysht', 'online', '8', '0.1000000', '5600000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416678268932', 'ht', 'husd', '4', '2', 'main', 'hthusd', 'online', '8', '0.1000000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416678268933', 'dash', 'husd', '2', '4', 'main', 'dashhusd', 'online', '8', '0.0010000', '13000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416678268934', 'gnt', 'eth', '8', '2', 'innovation', 'gnteth', 'online', '8', '0.1000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416690851841', 'wpr', 'btc', '10', '2', 'innovation', 'wprbtc', 'online', '8', '0.1000000', '86735.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416690851842', 'iost', 'usdt', '6', '4', 'innovation', 'iostusdt', 'online', '8', '1.0000000', '20000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416690851843', '18c', 'btc', '10', '2', 'innovation', '18cbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416690851844', 'cro', 'usdt', '4', '2', 'innovation', 'crousdt', 'online', '8', '1.0000000', '15000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416690851845', 'pai', 'usdt', '6', '4', 'innovation', 'paiusdt', 'online', '8', '0.1000000', '250000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416690851846', 'btt', 'eth', '8', '2', 'innovation', 'btteth', 'online', '8', '1.0000000', '750000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416699240450', 'xzc', 'eth', '6', '4', 'innovation', 'xzceth', 'online', '8', '0.0100000', '55000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416699240451', 'kan', 'btc', '10', '2', 'innovation', 'kanbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416699240452', 'mxc', 'btc', '10', '2', 'innovation', 'mxcbtc', 'online', '8', '1.0000000', '220000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416699240453', 'xvg', 'btc', '10', '2', 'innovation', 'xvgbtc', 'online', '8', '1.0000000', '30000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416699240454', 'trx', 'eth', '8', '2', 'main', 'trxeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416699240455', 'ugas', 'btc', '8', '2', 'innovation', 'ugasbtc', 'online', '8', '0.1000000', '3300000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416703434753', 'gt', 'btc', '8', '2', 'innovation', 'gtbtc', 'online', '8', '0.1000000', '1700000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416703434754', 'gnt', 'usdt', '4', '4', 'innovation', 'gntusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416703434755', 'trx', 'usdt', '6', '2', 'main', 'trxusdt', 'online', '8', '1.0000000', '10000000.000', '5.0000000', '4.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416703434756', 'dgd', 'eth', '6', '4', 'innovation', 'dgdeth', 'online', '8', '0.0010000', '10000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416703434757', 'lxt', 'btc', '10', '2', 'innovation', 'lxtbtc', 'online', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416711823362', 'arpa', 'btc', '8', '2', 'innovation', 'arpabtc', 'online', '8', '1.0000000', '50000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416711823363', 'eko', 'btc', '10', '2', 'innovation', 'ekobtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416711823364', 'egt', 'usdt', '6', '2', 'innovation', 'egtusdt', 'online', '8', '1.0000000', '350000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416711823365', 'topc', 'eth', '8', '2', 'innovation', 'topceth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416716017666', 'nano', 'btc', '7', '2', 'innovation', 'nanobtc', 'online', '8', '0.0100000', '345000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416716017667', 'qash', 'btc', '8', '4', 'innovation', 'qashbtc', 'online', '8', '0.1000000', '17000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416716017668', 'nuls', 'usdt', '4', '2', 'innovation', 'nulsusdt', 'online', '8', '0.1000000', '800000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416716017669', 'fti', 'btc', '10', '2', 'innovation', 'ftibtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416716017670', 'nano', 'usdt', '4', '4', 'innovation', 'nanousdt', 'online', '8', '0.1000000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416728600577', 'let', 'eth', '8', '2', 'innovation', 'leteth', 'online', '8', '1.0000000', '295000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416728600578', 'rcn', 'eth', '10', '0', 'innovation', 'rcneth', 'online', '8', '1.0000000', '10000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416728600579', 'vet', 'btc', '10', '2', 'innovation', 'vetbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416728600580', 'tnt', 'btc', '10', '0', 'innovation', 'tntbtc', 'online', '8', '1.0000000', '11000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416728600581', 'ardr', 'btc', '8', '2', 'innovation', 'ardrbtc', 'online', '8', '1.0000000', '6000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416728600582', 'top', 'usdt', '6', '4', 'innovation', 'topusdt', 'online', '8', '1.0000000', '100000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416736989185', 'lamb', 'ht', '6', '4', 'innovation', 'lambht', 'online', '8', '0.1000000', '7000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416736989186', 'pnt', 'btc', '10', '2', 'innovation', 'pntbtc', 'online', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416736989187', 'bts', 'btc', '8', '2', 'innovation', 'btsbtc', 'online', '8', '0.1000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416736989188', 'ont', 'btc', '8', '4', 'innovation', 'ontbtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416736989189', 'ont', 'eth', '8', '4', 'innovation', 'onteth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416736989190', 'powr', 'eth', '8', '0', 'innovation', 'powreth', 'online', '8', '0.1000000', '500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416741183490', 'eos', 'btc', '8', '2', 'main', 'eosbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416741183491', 'iris', 'eth', '6', '4', 'innovation', 'iriseth', 'online', '8', '0.1000000', '4500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416741183492', 'ctxc', 'btc', '8', '2', 'innovation', 'ctxcbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416741183493', 'uuu', 'btc', '10', '2', 'innovation', 'uuubtc', 'online', '8', '10.0000000', '400000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416741183494', 'mx', 'ht', '6', '2', 'innovation', 'mxht', 'online', '8', '0.1000000', '7000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416741183495', 'em', 'ht', '8', '2', 'innovation', 'emht', 'online', '8', '1.0000000', '120000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416749572097', 'etc', 'husd', '4', '4', 'main', 'etchusd', 'online', '8', '0.0100000', '250000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416749572098', 'zen', 'eth', '6', '4', 'innovation', 'zeneth', 'online', '8', '0.0010000', '52000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416749572099', 'link', 'eth', '8', '2', 'innovation', 'linketh', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416749572100', 'rccc', 'eth', '8', '4', 'innovation', 'rccceth', 'online', '8', '1.0000000', '5900000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416749572101', 'theta', 'usdt', '4', '4', 'innovation', 'thetausdt', 'online', '8', '0.1000000', '3000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416749572102', 'smt', 'btc', '10', '0', 'innovation', 'smtbtc', 'online', '8', '1.0000000', '15000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416753766402', 'utk', 'eth', '8', '2', 'innovation', 'utketh', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416753766403', 'icx', 'btc', '8', '4', 'innovation', 'icxbtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416753766404', 'mana', 'usdt', '4', '2', 'innovation', 'manausdt', 'online', '8', '1.0000000', '35000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416753766405', 'tt', 'ht', '6', '4', 'innovation', 'ttht', 'online', '8', '1.0000000', '20000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416753766406', 'dock', 'eth', '6', '4', 'innovation', 'docketh', 'online', '8', '1.0000000', '70000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416753766407', 'bft', 'eth', '8', '4', 'innovation', 'bfteth', 'online', '8', '0.1000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416762155010', 'rte', 'btc', '10', '2', 'innovation', 'rtebtc', 'online', '8', '1.0000000', '1200000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416762155011', 'dash', 'ht', '6', '4', 'main', 'dashht', 'online', '8', '0.0001000', '2500.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416762155012', 'hpt', 'btc', '10', '2', 'innovation', 'hptbtc', 'online', '8', '10.0000000', '70000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416762155013', 'aac', 'eth', '8', '2', 'innovation', 'aaceth', 'online', '8', '0.1000000', '22000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416762155014', 'itc', 'usdt', '4', '4', 'innovation', 'itcusdt', 'online', '8', '0.0100000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416762155015', 'for', 'btc', '8', '2', 'innovation', 'forbtc', 'online', '8', '1.0000000', '30000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416766349314', 'elf', 'usdt', '4', '4', 'innovation', 'elfusdt', 'online', '8', '0.1000000', '500000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416766349315', 'propy', 'btc', '8', '2', 'innovation', 'propybtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416766349316', 'pc', 'eth', '8', '4', 'innovation', 'pceth', 'online', '8', '1.0000000', '5733000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416766349317', 'usdt', 'husd', '4', '4', 'main', 'usdthusd', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416766349318', 'dock', 'btc', '8', '2', 'innovation', 'dockbtc', 'online', '8', '1.0000000', '70000000.000', '0.0001000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416766349319', 'ltc', 'usdt', '2', '4', 'main', 'ltcusdt', 'online', '8', '0.0010000', '100000.000', '5.0000000', '4.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416774737922', 'itc', 'eth', '8', '0', 'innovation', 'itceth', 'online', '8', '0.1000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416774737923', 'ven', 'usdt', '4', '4', 'innovation', 'venusdt', 'offline', '8', '0.0100000', '100000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416774737924', 'smt', 'eth', '8', '0', 'innovation', 'smteth', 'online', '8', '1.0000000', '15000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416774737925', 'bat', 'btc', '8', '0', 'innovation', 'batbtc', 'online', '8', '1.0000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416778932225', 'uc', 'eth', '10', '2', 'innovation', 'uceth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416778932226', 'dcr', 'eth', '6', '4', 'innovation', 'dcreth', 'online', '8', '0.0010000', '10000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416778932227', 'pnt', 'eth', '8', '2', 'innovation', 'pnteth', 'online', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416778932228', 'lba', 'eth', '6', '4', 'innovation', 'lbaeth', 'online', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416778932229', 'omg', 'btc', '6', '4', 'innovation', 'omgbtc', 'online', '8', '0.0100000', '200000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416778932230', 'omg', 'eth', '6', '4', 'innovation', 'omgeth', 'online', '8', '0.0100000', '200000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416787320834', 'bft', 'btc', '8', '2', 'innovation', 'bftbtc', 'online', '8', '0.1000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416787320835', 'bt1', 'btc', '6', '4', 'bifurcation', 'bt1btc', 'offline', '8', '0.0010000', '10000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416787320836', 'ardr', 'eth', '6', '4', 'innovation', 'ardreth', 'online', '8', '1.0000000', '6000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416787320837', 'bhd', 'usdt', '4', '4', 'innovation', 'bhdusdt', 'online', '8', '0.0010000', '100000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416787320838', 'lba', 'btc', '8', '2', 'innovation', 'lbabtc', 'online', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416787320839', 'meet', 'btc', '10', '2', 'innovation', 'meetbtc', 'online', '8', '1.0000000', '200000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416791515138', 'waves', 'usdt', '4', '2', 'innovation', 'wavesusdt', 'online', '8', '0.0100000', '300000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416791515139', 'bht', 'ht', '6', '2', 'innovation', 'bhtht', 'online', '8', '0.1000000', '18000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416791515140', 'yee', 'btc', '10', '2', 'innovation', 'yeebtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416791515141', 'arpa', 'ht', '6', '2', 'innovation', 'arpaht', 'online', '8', '1.0000000', '50000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416791515142', 'nexo', 'btc', '8', '2', 'innovation', 'nexobtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416791515143', 'eos', 'husd', '4', '4', 'main', 'eoshusd', 'online', '8', '0.0100000', '100000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416799903746', 'lsk', 'eth', '6', '4', 'innovation', 'lsketh', 'online', '8', '0.0010000', '50000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416799903747', 'sc', 'eth', '8', '2', 'innovation', 'sceth', 'online', '8', '1.0000000', '300000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416799903748', 'bch', 'ht', '6', '4', 'main', 'bchht', 'online', '8', '0.0001000', '700.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416799903749', 'nuls', 'btc', '8', '2', 'innovation', 'nulsbtc', 'online', '8', '0.1000000', '2500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416799903750', 'zla', 'btc', '8', '2', 'innovation', 'zlabtc', 'online', '8', '0.1000000', '94000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416799903751', 'cre', 'usdt', '6', '2', 'innovation', 'creusdt', 'online', '8', '1.0000000', '80000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416812486658', 'gnx', 'eth', '8', '0', 'innovation', 'gnxeth', 'online', '8', '0.1000000', '1000000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416812486659', 'mx', 'usdt', '4', '2', 'innovation', 'mxusdt', 'online', '8', '0.1000000', '7000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416812486660', 'aidoc', 'eth', '8', '2', 'innovation', 'aidoceth', 'online', '8', '1.0000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416812486661', 'dac', 'eth', '8', '2', 'innovation', 'daceth', 'online', '8', '1.0000000', '300000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875265', 'dgd', 'btc', '6', '4', 'innovation', 'dgdbtc', 'online', '8', '0.0010000', '10000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875266', 'wpr', 'eth', '8', '2', 'innovation', 'wpreth', 'online', '8', '0.0100000', '86735.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875267', 'egt', 'btc', '10', '2', 'innovation', 'egtbtc', 'online', '8', '1.0000000', '350000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875268', 'node', 'btc', '10', '2', 'innovation', 'nodebtc', 'online', '8', '1.0000000', '640000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875269', 'abt', 'btc', '8', '2', 'innovation', 'abtbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875270', 'eth', 'husd', '2', '4', 'main', 'ethhusd', 'online', '8', '0.0010000', '5000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416820875271', 'eng', 'eth', '6', '4', 'innovation', 'engeth', 'online', '8', '0.0100000', '1200.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069569', 'zrx', 'usdt', '4', '2', 'innovation', 'zrxusdt', 'online', '8', '0.1000000', '2000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069570', 'iic', 'eth', '10', '2', 'innovation', 'iiceth', 'online', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069571', 'storj', 'usdt', '4', '4', 'innovation', 'storjusdt', 'online', '8', '0.0100000', '100000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069572', 'lamb', 'btc', '8', '2', 'innovation', 'lambbtc', 'online', '8', '0.1000000', '7000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069573', 'dcr', 'usdt', '4', '4', 'innovation', 'dcrusdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069574', 'npxs', 'btc', '10', '2', 'innovation', 'npxsbtc', 'online', '8', '1.0000000', '1200000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416825069575', 'lol', 'btc', '10', '2', 'innovation', 'lolbtc', 'online', '8', '1.0000000', '750000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458177', 'but', 'eth', '8', '2', 'innovation', 'buteth', 'online', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458178', 'cvc', 'usdt', '4', '2', 'innovation', 'cvcusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458179', 'gve', 'eth', '8', '2', 'innovation', 'gveeth', 'online', '8', '1.0000000', '450000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458180', 'uuu', 'eth', '10', '2', 'innovation', 'uuueth', 'online', '8', '10.0000000', '400000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458181', 'seele', 'btc', '10', '2', 'innovation', 'seelebtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458182', 'cro', 'btc', '8', '2', 'innovation', 'crobtc', 'online', '8', '1.0000000', '15000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458183', 'hc', 'eth', '6', '4', 'innovation', 'hceth', 'online', '8', '0.0100000', '20000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458184', 'uip', 'eth', '8', '2', 'innovation', 'uipeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458185', 'one', 'usdt', '6', '2', 'innovation', 'oneusdt', 'online', '8', '1.0000000', '240000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458186', 'nas', 'btc', '8', '4', 'innovation', 'nasbtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458187', 'nkn', 'ht', '6', '2', 'innovation', 'nknht', 'online', '8', '1.0000000', '10000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458188', 'pvt', 'ht', '6', '2', 'innovation', 'pvtht', 'online', '8', '1.0000000', '300000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416833458189', 'snt', 'usdt', '6', '4', 'innovation', 'sntusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416841846785', 'bcd', 'btc', '6', '4', 'bifurcation', 'bcdbtc', 'online', '8', '0.0010000', '600000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416841846786', 'blz', 'eth', '8', '2', 'innovation', 'blzeth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416841846787', 'cvcoin', 'eth', '6', '4', 'innovation', 'cvcoineth', 'online', '8', '0.1000000', '1900000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416841846788', 'tt', 'usdt', '6', '2', 'innovation', 'ttusdt', 'online', '8', '1.0000000', '20000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416850235393', 'arpa', 'usdt', '6', '2', 'innovation', 'arpausdt', 'online', '8', '1.0000000', '50000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416850235394', 'idt', 'eth', '8', '2', 'innovation', 'idteth', 'online', '8', '1.0000000', '20000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416850235395', 'xlm', 'usdt', '6', '4', 'innovation', 'xlmusdt', 'online', '8', '0.1000000', '10000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416850235396', 'link', 'usdt', '4', '2', 'innovation', 'linkusdt', 'online', '8', '0.1000000', '5000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416850235397', 'iris', 'usdt', '6', '2', 'innovation', 'irisusdt', 'online', '8', '1.0000000', '6500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416850235398', 'qash', 'eth', '6', '4', 'innovation', 'qasheth', 'online', '8', '0.1000000', '17000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416854429698', 'egcc', 'btc', '10', '2', 'innovation', 'egccbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416854429699', 'algo', 'eth', '6', '4', 'innovation', 'algoeth', 'online', '8', '0.0100000', '300000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416854429700', 'nkn', 'usdt', '6', '2', 'innovation', 'nknusdt', 'online', '8', '1.0000000', '10000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416854429701', 'algo', 'usdt', '4', '2', 'innovation', 'algousdt', 'online', '8', '0.0100000', '300000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416854429702', 'cmt', 'btc', '8', '2', 'innovation', 'cmtbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416854429703', 'eth', 'btc', '6', '4', 'main', 'ethbtc', 'online', '4', '0.0010000', '10000.000', '0.0001000', '5.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818305', 'rcn', 'btc', '10', '0', 'innovation', 'rcnbtc', 'online', '8', '1.0000000', '10000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818306', 'evx', 'eth', '8', '2', 'innovation', 'evxeth', 'online', '8', '0.0100000', '2200.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818307', '18c', 'eth', '8', '2', 'innovation', '18ceth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818308', 'cnn', 'btc', '10', '2', 'innovation', 'cnnbtc', 'online', '8', '100.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818309', 'ugas', 'eth', '6', '4', 'innovation', 'ugaseth', 'online', '8', '0.1000000', '3300000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818310', 'gnt', 'btc', '8', '2', 'innovation', 'gntbtc', 'online', '8', '0.1000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416862818311', 'ast', 'btc', '8', '0', 'innovation', 'astbtc', 'online', '8', '1.0000000', '30000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416875401217', 'ncc', 'eth', '10', '2', 'innovation', 'ncceth', 'online', '8', '1.0000000', '392000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416875401218', 'xlm', 'eth', '6', '4', 'innovation', 'xlmeth', 'online', '8', '0.1000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416875401219', 'nano', 'eth', '6', '4', 'innovation', 'nanoeth', 'online', '8', '0.0100000', '345000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416875401220', 'pvt', 'usdt', '6', '2', 'innovation', 'pvtusdt', 'online', '8', '1.0000000', '300000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416875401221', 'ekt', 'btc', '10', '2', 'innovation', 'ektbtc', 'online', '8', '0.1000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416875401222', 'bsv', 'usdt', '4', '4', 'main', 'bsvusdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595522', 'bch', 'usdt', '2', '4', 'main', 'bchusdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '4.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595523', 'skm', 'btc', '10', '2', 'innovation', 'skmbtc', 'online', '8', '1.0000000', '390000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595524', 'em', 'usdt', '6', '2', 'innovation', 'emusdt', 'online', '8', '1.0000000', '120000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595525', 'srn', 'btc', '10', '2', 'innovation', 'srnbtc', 'online', '8', '0.0100000', '300000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595526', 'dbc', 'eth', '8', '2', 'innovation', 'dbceth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595527', 'ssp', 'btc', '10', '2', 'innovation', 'sspbtc', 'online', '8', '1.0000000', '1100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416879595528', 'hc', 'usdt', '4', '4', 'innovation', 'hcusdt', 'online', '8', '0.0100000', '20000.000', '5.0000000', '2.5000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416887984129', 'elf', 'btc', '8', '0', 'innovation', 'elfbtc', 'online', '8', '1.0000000', '1000000.000', '0.0001000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416887984130', 'kan', 'eth', '8', '2', 'innovation', 'kaneth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416887984131', 'xem', 'usdt', '4', '4', 'innovation', 'xemusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416887984132', 'one', 'ht', '6', '2', 'innovation', 'oneht', 'online', '8', '1.0000000', '240000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416887984133', 'waves', 'btc', '8', '4', 'innovation', 'wavesbtc', 'online', '8', '0.0100000', '200000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416887984134', 'zjlt', 'eth', '8', '2', 'innovation', 'zjlteth', 'online', '8', '1.0000000', '443099.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178434', 'ven', 'eth', '8', '2', 'innovation', 'veneth', 'offline', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178435', 'neo', 'btc', '6', '4', 'innovation', 'neobtc', 'online', '8', '0.0010000', '10000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178436', 'sbtc', 'btc', '6', '4', 'bifurcation', 'sbtcbtc', 'online', '8', '0.0001000', '630.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178437', 'mana', 'btc', '8', '0', 'innovation', 'manabtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178438', 'xvg', 'eth', '8', '2', 'innovation', 'xvgeth', 'online', '8', '1.0000000', '30000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178439', 'ht', 'eth', '8', '2', 'main', 'hteth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416892178440', 'ada', 'eth', '6', '4', 'main', 'adaeth', 'online', '8', '0.1000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567042', 'vidy', 'btc', '10', '2', 'innovation', 'vidybtc', 'online', '8', '1.0000000', '530000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567043', 'cvc', 'eth', '8', '0', 'innovation', 'cvceth', 'online', '8', '0.1000000', '2000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567044', 'fsn', 'ht', '6', '4', 'innovation', 'fsnht', 'online', '8', '0.0100000', '900000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567045', 'lxt', 'usdt', '6', '2', 'innovation', 'lxtusdt', 'online', '8', '1.0000000', '35000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567046', 'eth', 'usdt', '2', '4', 'main', 'ethusdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '5.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567047', 'uuu', 'usdt', '6', '2', 'innovation', 'uuuusdt', 'online', '8', '1.0000000', '400000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567048', 'pay', 'btc', '8', '2', 'innovation', 'paybtc', 'online', '8', '0.1000000', '500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416900567049', 'bht', 'usdt', '6', '2', 'innovation', 'bhtusdt', 'online', '8', '0.1000000', '18000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761345', 'cnn', 'eth', '10', '2', 'innovation', 'cnneth', 'online', '8', '100.0000000', '3500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761346', 'ltc', 'ht', '6', '4', 'main', 'ltcht', 'online', '8', '0.0010000', '7000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761347', 'cmt', 'usdt', '6', '4', 'innovation', 'cmtusdt', 'online', '8', '1.0000000', '3500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761348', 'ren', 'btc', '8', '2', 'innovation', 'renbtc', 'online', '8', '1.0000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761349', 'get', 'eth', '8', '2', 'innovation', 'geteth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761350', 'mt', 'eth', '8', '2', 'innovation', 'mteth', 'online', '8', '1.0000000', '125000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761351', 'gxc', 'usdt', '4', '4', 'innovation', 'gxcusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761352', 'zec', 'husd', '2', '4', 'main', 'zechusd', 'online', '8', '0.0010000', '20000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416904761353', 'edu', 'btc', '10', '2', 'innovation', 'edubtc', 'online', '8', '1.0000000', '2500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149954', 'gtc', 'eth', '8', '2', 'innovation', 'gtceth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149955', 'cova', 'eth', '8', '4', 'innovation', 'covaeth', 'online', '8', '1.0000000', '40000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149956', 'ckb', 'ht', '6', '2', 'innovation', 'ckbht', 'online', '8', '1.0000000', '140000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149957', 'akro', 'ht', '6', '2', 'innovation', 'akroht', 'online', '8', '1.0000000', '500000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149958', 'bix', 'btc', '8', '2', 'innovation', 'bixbtc', 'online', '8', '0.1000000', '950000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149959', 'lamb', 'eth', '8', '2', 'innovation', 'lambeth', 'online', '8', '0.1000000', '7000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149960', 'zec', 'btc', '6', '4', 'main', 'zecbtc', 'online', '8', '0.0010000', '5000.000', '0.0001000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416913149961', 'kmd', 'eth', '6', '4', 'innovation', 'kmdeth', 'online', '8', '0.1000000', '800000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344257', 'adx', 'eth', '10', '2', 'innovation', 'adxeth', 'online', '8', '0.0100000', '9000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344258', 'tos', 'eth', '8', '2', 'innovation', 'toseth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344259', 'tt', 'btc', '8', '2', 'innovation', 'ttbtc', 'online', '8', '1.0000000', '20000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344260', 'bhd', 'ht', '4', '4', 'innovation', 'bhdht', 'online', '8', '0.0010000', '100000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344261', 'ftt', 'btc', '8', '2', 'innovation', 'fttbtc', 'online', '8', '0.0100000', '700000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344262', 'node', 'ht', '6', '2', 'innovation', 'nodeht', 'online', '8', '1.0000000', '640000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344263', 'ncash', 'eth', '10', '2', 'innovation', 'ncasheth', 'online', '8', '1.0000000', '617208.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416917344264', 'lym', 'btc', '10', '2', 'innovation', 'lymbtc', 'online', '8', '1.0000000', '9000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732865', 'wicc', 'btc', '8', '2', 'innovation', 'wiccbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732866', 'mtn', 'eth', '8', '2', 'innovation', 'mtneth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732867', 'rdn', 'btc', '8', '0', 'innovation', 'rdnbtc', 'online', '8', '0.1000000', '4175.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732868', 'xmx', 'btc', '10', '2', 'innovation', 'xmxbtc', 'online', '8', '1.0000000', '250000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732869', 'steem', 'btc', '8', '2', 'innovation', 'steembtc', 'online', '8', '0.0100000', '300000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732870', 'mds', 'usdt', '6', '2', 'innovation', 'mdsusdt', 'online', '8', '0.1000000', '200000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416925732871', 'soc', 'btc', '10', '2', 'innovation', 'socbtc', 'online', '8', '1.0000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927170', 'qun', 'btc', '10', '2', 'innovation', 'qunbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927171', 'xmr', 'btc', '6', '4', 'main', 'xmrbtc', 'online', '8', '0.0001000', '5000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927172', 'gsc', 'btc', '10', '2', 'innovation', 'gscbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927173', 'atp', 'usdt', '5', '2', 'innovation', 'atpusdt', 'online', '8', '1.0000000', '30000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927174', 'qsp', 'btc', '8', '0', 'innovation', 'qspbtc', 'online', '8', '1.0000000', '49000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927175', 'dat', 'btc', '10', '2', 'innovation', 'datbtc', 'online', '8', '1.0000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416929927176', 'ont', 'usdt', '4', '4', 'innovation', 'ontusdt', 'online', '8', '0.0100000', '200000.000', '5.0000000', '2.5000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315777', 'hpt', 'ht', '6', '4', 'innovation', 'hptht', 'online', '8', '10.0000000', '70000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315778', 'iota', 'btc', '8', '2', 'main', 'iotabtc', 'online', '8', '0.0100000', '500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315779', 'lsk', 'btc', '8', '4', 'innovation', 'lskbtc', 'online', '8', '0.0010000', '50000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315780', 'zrx', 'btc', '8', '2', 'innovation', 'zrxbtc', 'online', '8', '1.0000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315781', 'theta', 'btc', '8', '2', 'innovation', 'thetabtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315782', 'dock', 'usdt', '6', '2', 'innovation', 'dockusdt', 'online', '8', '1.0000000', '110000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315783', 'qtum', 'usdt', '4', '4', 'innovation', 'qtumusdt', 'online', '8', '0.0100000', '1000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416938315784', 'act', 'btc', '10', '2', 'innovation', 'actbtc', 'online', '8', '0.1000000', '500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510082', 'zil', 'btc', '10', '2', 'innovation', 'zilbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510083', 'poly', 'eth', '6', '4', 'innovation', 'polyeth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510084', 'ctxc', 'usdt', '4', '4', 'innovation', 'ctxcusdt', 'online', '8', '0.1000000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510085', 'bsv', 'husd', '4', '4', 'main', 'bsvhusd', 'online', '8', '0.0010000', '10000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510086', 'req', 'eth', '8', '1', 'innovation', 'reqeth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510087', 'ae', 'btc', '8', '2', 'innovation', 'aebtc', 'online', '8', '0.0100000', '200000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416942510088', 'ada', 'usdt', '6', '4', 'main', 'adausdt', 'online', '8', '0.1000000', '5000000.000', '5.0000000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416950898689', 'ost', 'btc', '8', '2', 'innovation', 'ostbtc', 'online', '8', '0.1000000', '43000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416950898690', 'mex', 'eth', '10', '2', 'innovation', 'mexeth', 'online', '8', '1.0000000', '1800000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416950898691', 'itc', 'btc', '8', '0', 'innovation', 'itcbtc', 'online', '8', '0.1000000', '5000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416950898692', 'but', 'btc', '10', '2', 'innovation', 'butbtc', 'online', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416950898693', 'iic', 'btc', '10', '2', 'innovation', 'iicbtc', 'online', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416950898694', 'ht', 'usdt', '4', '2', 'main', 'htusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416959287298', 'musk', 'btc', '10', '2', 'innovation', 'muskbtc', 'online', '8', '1.0000000', '25000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416959287299', 'salt', 'eth', '8', '4', 'innovation', 'salteth', 'online', '8', '0.1000000', '5900.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416959287300', 'abt', 'eth', '8', '2', 'innovation', 'abteth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416959287301', 'uc', 'btc', '10', '2', 'innovation', 'ucbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416963481601', 'mco', 'eth', '6', '4', 'innovation', 'mcoeth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416963481602', 'blz', 'btc', '8', '2', 'innovation', 'blzbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416963481603', 'srn', 'eth', '8', '2', 'innovation', 'srneth', 'online', '8', '0.0100000', '300000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416963481604', 'grs', 'eth', '6', '4', 'innovation', 'grseth', 'online', '8', '0.1000000', '1350000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416963481605', 'dash', 'usdt', '2', '4', 'main', 'dashusdt', 'online', '8', '0.0010000', '10000.000', '5.0000000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870210', 'appc', 'btc', '8', '2', 'innovation', 'appcbtc', 'online', '8', '0.0100000', '16952.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870211', 'btc', 'husd', '2', '6', 'main', 'btchusd', 'online', '8', '0.0001000', '100.000', '5.0000000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870212', 'one', 'btc', '10', '2', 'innovation', 'onebtc', 'online', '8', '1.0000000', '240000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870213', 'etc', 'btc', '6', '4', 'main', 'etcbtc', 'online', '4', '0.0100000', '200000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870214', 'box', 'btc', '10', '2', 'innovation', 'boxbtc', 'online', '8', '1.0000000', '30000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870215', 'atom', 'btc', '8', '2', 'innovation', 'atombtc', 'online', '8', '0.0100000', '500000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416971870216', 'gnx', 'btc', '10', '0', 'innovation', 'gnxbtc', 'online', '8', '0.1000000', '1000000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064513', 'vsys', 'usdt', '4', '2', 'innovation', 'vsysusdt', 'online', '8', '0.1000000', '5600000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064514', 'bifi', 'btc', '10', '4', 'bifurcation', 'bifibtc', 'online', '8', '1.0000000', '350000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064515', 'zla', 'eth', '10', '2', 'innovation', 'zlaeth', 'online', '8', '0.1000000', '94000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064516', 'vidy', 'ht', '6', '2', 'innovation', 'vidyht', 'online', '8', '1.0000000', '530000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064517', 'lba', 'usdt', '6', '4', 'innovation', 'lbausdt', 'online', '8', '1.0000000', '16000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064518', 'hot', 'eth', '8', '2', 'innovation', 'hoteth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064519', 'wtc', 'eth', '6', '4', 'innovation', 'wtceth', 'online', '8', '0.1000000', '300000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064520', 'ocn', 'usdt', '8', '4', 'innovation', 'ocnusdt', 'online', '8', '1.0000000', '100000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064521', 'hit', 'btc', '10', '2', 'innovation', 'hitbtc', 'online', '8', '1.0000000', '6873879.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416976064522', 'swftc', 'eth', '8', '2', 'innovation', 'swftceth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416984453121', 'doge', 'btc', '10', '2', 'innovation', 'dogebtc', 'online', '8', '1.0000000', '200000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416984453122', 'bsv', 'btc', '6', '4', 'main', 'bsvbtc', 'online', '8', '0.0010000', '5000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416984453123', 'cmt', 'eth', '8', '2', 'innovation', 'cmteth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416984453124', 'datx', 'btc', '10', '2', 'innovation', 'datxbtc', 'online', '8', '1.0000000', '2600000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416984453125', 'man', 'btc', '8', '2', 'innovation', 'manbtc', 'online', '8', '0.1000000', '500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416988647425', 'xtz', 'eth', '6', '4', 'innovation', 'xtzeth', 'online', '8', '0.1000000', '2000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416988647426', 'seele', 'eth', '8', '2', 'innovation', 'seeleeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416988647427', 'new', 'usdt', '6', '4', 'innovation', 'newusdt', 'online', '8', '1.0000000', '100000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416988647428', 'eng', 'btc', '8', '2', 'innovation', 'engbtc', 'online', '8', '0.0100000', '1200.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416988647429', 'ekt', 'usdt', '4', '2', 'innovation', 'ektusdt', 'online', '8', '0.1000000', '10000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416988647430', 'xzc', 'usdt', '4', '4', 'innovation', 'xzcusdt', 'online', '8', '0.0100000', '160000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416997036033', 'btt', 'usdt', '8', '0', 'innovation', 'bttusdt', 'online', '8', '1.0000000', '750000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416997036034', 'skm', 'usdt', '6', '2', 'innovation', 'skmusdt', 'online', '8', '1.0000000', '390000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416997036035', 'ast', 'eth', '8', '2', 'innovation', 'asteth', 'online', '8', '0.1000000', '30000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416997036036', 'bts', 'usdt', '4', '2', 'innovation', 'btsusdt', 'online', '8', '0.1000000', '5000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416997036037', 'new', 'ht', '6', '4', 'innovation', 'newht', 'online', '8', '1.0000000', '100000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372416997036038', 'dgb', 'eth', '8', '2', 'innovation', 'dgbeth', 'online', '8', '1.0000000', '35000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417013813249', 'she', 'btc', '10', '2', 'innovation', 'shebtc', 'online', '8', '1.0000000', '300000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417013813250', 'dbc', 'btc', '10', '2', 'innovation', 'dbcbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417013813251', 'nuls', 'eth', '6', '4', 'innovation', 'nulseth', 'online', '8', '0.1000000', '2500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417013813252', 'fsn', 'btc', '8', '2', 'innovation', 'fsnbtc', 'online', '8', '0.0100000', '900000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417013813253', 'cvnt', 'btc', '10', '2', 'innovation', 'cvntbtc', 'online', '8', '1.0000000', '85000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007554', 'bts', 'eth', '8', '2', 'innovation', 'btseth', 'online', '8', '0.1000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007555', 'wan', 'eth', '6', '4', 'innovation', 'waneth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007556', 'xrp', 'husd', '4', '2', 'main', 'xrphusd', 'online', '8', '0.1000000', '2500000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007557', 'lamb', 'usdt', '6', '4', 'innovation', 'lambusdt', 'online', '8', '0.1000000', '7000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007558', 'egcc', 'eth', '10', '2', 'innovation', 'egcceth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007559', 'seele', 'usdt', '6', '2', 'innovation', 'seeleusdt', 'online', '8', '1.0000000', '25000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417018007560', 'vet', 'eth', '8', '2', 'innovation', 'veteth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417026396161', 'ekt', 'eth', '8', '4', 'innovation', 'ekteth', 'online', '8', '0.1000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417026396162', 'gas', 'btc', '6', '4', 'innovation', 'gasbtc', 'online', '8', '0.0010000', '10000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417026396163', 'tusd', 'husd', '4', '4', 'main', 'tusdhusd', 'online', '8', '0.1000000', '1500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417026396164', 'idt', 'btc', '10', '2', 'innovation', 'idtbtc', 'online', '8', '1.0000000', '20000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417026396165', 'rbtc', 'btc', '6', '4', 'innovation', 'rbtcbtc', 'suspend', '8', '0.0001000', '0.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417026396166', 'yee', 'eth', '8', '2', 'innovation', 'yeeeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590466', 'rsr', 'btc', '10', '2', 'innovation', 'rsrbtc', 'online', '8', '1.0000000', '650000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590467', 'powr', 'btc', '8', '0', 'innovation', 'powrbtc', 'online', '8', '0.1000000', '500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590468', 'akro', 'usdt', '5', '2', 'innovation', 'akrousdt', 'online', '8', '1.0000000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590469', 'knc', 'eth', '8', '2', 'innovation', 'knceth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590470', 'btm', 'btc', '8', '2', 'innovation', 'btmbtc', 'online', '8', '0.1000000', '4000000.000', '0.0001000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590471', 'ela', 'btc', '8', '2', 'innovation', 'elabtc', 'online', '8', '0.0100000', '50000.000', '0.0001000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590472', 'portal', 'eth', '8', '2', 'innovation', 'portaleth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417030590473', 'evx', 'btc', '8', '2', 'innovation', 'evxbtc', 'online', '8', '0.0100000', '2200.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784770', 'top', 'ht', '6', '4', 'innovation', 'topht', 'online', '8', '1.0000000', '100000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784771', 'ckb', 'usdt', '6', '2', 'innovation', 'ckbusdt', 'online', '8', '1.0000000', '140000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784772', 'storj', 'btc', '8', '2', 'innovation', 'storjbtc', 'online', '8', '0.1000000', '2000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784773', 'sc', 'btc', '10', '2', 'innovation', 'scbtc', 'online', '8', '1.0000000', '300000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784774', 'skm', 'ht', '6', '2', 'innovation', 'skmht', 'online', '8', '1.0000000', '390000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784775', 'vet', 'usdt', '6', '4', 'innovation', 'vetusdt', 'online', '8', '1.0000000', '100000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784776', 'iris', 'btc', '10', '2', 'innovation', 'irisbtc', 'online', '8', '0.1000000', '4500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784777', 'steem', 'usdt', '4', '4', 'innovation', 'steemusdt', 'online', '8', '0.0100000', '300000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417034784778', 'pai', 'btc', '8', '2', 'innovation', 'paibtc', 'online', '8', '0.1000000', '4500000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173378', 'xlm', 'btc', '8', '2', 'innovation', 'xlmbtc', 'online', '8', '0.1000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173379', 'rccc', 'btc', '10', '2', 'innovation', 'rcccbtc', 'online', '8', '1.0000000', '5900000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173380', 'rte', 'eth', '8', '2', 'innovation', 'rteeth', 'online', '8', '1.0000000', '1200000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173381', 'wtc', 'usdt', '4', '4', 'innovation', 'wtcusdt', 'online', '8', '0.1000000', '300000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173382', 'eko', 'eth', '8', '2', 'innovation', 'ekoeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173383', 'zen', 'btc', '8', '2', 'innovation', 'zenbtc', 'online', '8', '0.0010000', '52000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173384', 'link', 'btc', '8', '2', 'innovation', 'linkbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173385', 'waxp', 'eth', '6', '4', 'innovation', 'waxpeth', 'online', '8', '1.0000000', '17000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417043173386', 'qtum', 'eth', '6', '4', 'innovation', 'qtumeth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367681', 'bch', 'btc', '6', '4', 'main', 'bchbtc', 'online', '4', '0.0010000', '10000.000', '0.0001000', '4.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367682', 'iost', 'ht', '8', '4', 'innovation', 'iostht', 'online', '8', '1.0000000', '20000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367683', 'bkbt', 'eth', '8', '2', 'innovation', 'bkbteth', 'online', '8', '1.0000000', '1200000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367684', 'loom', 'eth', '6', '4', 'innovation', 'loometh', 'online', '8', '1.0000000', '14000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367685', 'bkbt', 'btc', '10', '2', 'innovation', 'bkbtbtc', 'online', '8', '1.0000000', '1200000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367686', 'kcash', 'ht', '6', '4', 'innovation', 'kcashht', 'online', '8', '1.0000000', '10000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367687', 'ctxc', 'eth', '8', '2', 'innovation', 'ctxceth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367688', 'xtz', 'usdt', '4', '4', 'innovation', 'xtzusdt', 'online', '8', '0.0100000', '1000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367689', 'ocn', 'btc', '10', '2', 'innovation', 'ocnbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417047367690', 'knc', 'btc', '8', '0', 'innovation', 'kncbtc', 'online', '8', '0.1000000', '2000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756289', 'pai', 'eth', '6', '4', 'innovation', 'paieth', 'online', '8', '0.1000000', '4500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756290', 'etc', 'usdt', '4', '4', 'main', 'etcusdt', 'online', '8', '0.0100000', '200000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756291', 'bcx', 'btc', '10', '4', 'bifurcation', 'bcxbtc', 'online', '8', '1.0000000', '1100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756292', 'snc', 'eth', '8', '2', 'innovation', 'snceth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756293', 'btm', 'usdt', '4', '2', 'innovation', 'btmusdt', 'online', '8', '0.1000000', '4000000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756294', 'cnns', 'btc', '8', '2', 'innovation', 'cnnsbtc', 'online', '8', '1.0000000', '3500000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756295', 'xrp', 'btc', '8', '0', 'main', 'xrpbtc', 'online', '8', '1.0000000', '5000000.000', '0.0001000', '5.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756296', 'ocn', 'eth', '8', '2', 'innovation', 'ocneth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756297', 'qtum', 'btc', '6', '4', 'innovation', 'qtumbtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417055756298', 'bt2', 'btc', '6', '4', 'bifurcation', 'bt2btc', 'offline', '8', '0.0010000', '10000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417059950594', 'icx', 'eth', '6', '4', 'innovation', 'icxeth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417059950595', 'pvt', 'btc', '10', '2', 'innovation', 'pvtbtc', 'online', '8', '1.0000000', '300000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417059950596', 'tnt', 'eth', '8', '0', 'innovation', 'tnteth', 'online', '8', '1.0000000', '11000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417059950597', 'nkn', 'btc', '8', '2', 'innovation', 'nknbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339201', 'gt', 'usdt', '4', '2', 'innovation', 'gtusdt', 'online', '8', '0.1000000', '1700000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339202', 'atom', 'usdt', '4', '2', 'innovation', 'atomusdt', 'online', '8', '0.0100000', '500000.000', '5.0000000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339203', 'bhd', 'btc', '6', '4', 'innovation', 'bhdbtc', 'online', '8', '0.0010000', '100000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339204', 'snc', 'btc', '8', '2', 'innovation', 'sncbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339205', 'hc', 'btc', '8', '4', 'innovation', 'hcbtc', 'online', '8', '0.0100000', '20000.000', '0.0001000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339206', 'eos', 'eth', '8', '2', 'main', 'eoseth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339207', 'uip', 'btc', '10', '2', 'innovation', 'uipbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339208', 'cdc', 'btc', '10', '2', 'innovation', 'cdcbtc', 'offline', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339209', 'propy', 'eth', '8', '2', 'innovation', 'propyeth', 'online', '8', '0.0100000', '100000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417068339210', 'cre', 'btc', '10', '2', 'innovation', 'crebtc', 'online', '8', '1.0000000', '80000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533505', 'btg', 'btc', '6', '4', 'bifurcation', 'btgbtc', 'online', '8', '0.0010000', '130000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533506', 'loom', 'btc', '8', '2', 'innovation', 'loombtc', 'online', '8', '1.0000000', '14000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533507', 'waxp', 'btc', '8', '4', 'innovation', 'waxpbtc', 'online', '8', '1.0000000', '17000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533508', 'ren', 'usdt', '6', '2', 'innovation', 'renusdt', 'online', '8', '1.0000000', '25000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533509', 'etn', 'btc', '10', '2', 'innovation', 'etnbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533510', 'ftt', 'ht', '6', '4', 'innovation', 'fttht', 'online', '8', '0.0100000', '700000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533511', 'ltc', 'btc', '6', '4', 'main', 'ltcbtc', 'online', '4', '0.0010000', '100000.000', '0.0001000', '4.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417072533512', 'fti', 'eth', '8', '2', 'innovation', 'ftieth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922114', 'let', 'btc', '10', '2', 'innovation', 'letbtc', 'online', '8', '1.0000000', '295000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922115', 'tnb', 'btc', '10', '0', 'innovation', 'tnbbtc', 'online', '8', '1.0000000', '50000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922116', 'bat', 'eth', '8', '0', 'innovation', 'bateth', 'online', '8', '1.0000000', '5000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922117', 'phx', 'btc', '10', '2', 'innovation', 'phxbtc', 'online', '8', '1.0000000', '120000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922118', 'utk', 'btc', '8', '2', 'innovation', 'utkbtc', 'online', '8', '0.1000000', '1000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922119', 'ycc', 'eth', '8', '2', 'innovation', 'ycceth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922120', 'vidy', 'usdt', '6', '2', 'innovation', 'vidyusdt', 'online', '8', '1.0000000', '530000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417080922121', 'mds', 'btc', '10', '0', 'innovation', 'mdsbtc', 'online', '8', '1.0000000', '200000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116418', 'bht', 'btc', '8', '2', 'innovation', 'bhtbtc', 'online', '8', '1.0000000', '18000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116419', 'lol', 'usdt', '6', '4', 'innovation', 'lolusdt', 'online', '8', '1.0000000', '750000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116420', 'aac', 'btc', '10', '2', 'innovation', 'aacbtc', 'online', '8', '0.1000000', '22000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116421', 'meet', 'eth', '8', '2', 'innovation', 'meeteth', 'online', '8', '1.0000000', '200000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116422', 'atp', 'ht', '6', '2', 'innovation', 'atpht', 'online', '8', '1.0000000', '30000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116423', 'etn', 'eth', '8', '4', 'innovation', 'etneth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116424', 'bix', 'usdt', '6', '4', 'innovation', 'bixusdt', 'online', '8', '0.1000000', '200000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417085116425', 'dcr', 'btc', '6', '4', 'innovation', 'dcrbtc', 'online', '8', '0.0010000', '10000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417093505025', 'node', 'usdt', '6', '2', 'innovation', 'nodeusdt', 'online', '8', '1.0000000', '640000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417093505026', 'wxt', 'ht', '6', '2', 'innovation', 'wxtht', 'online', '8', '1.0000000', '200000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417093505027', 'for', 'usdt', '6', '2', 'innovation', 'forusdt', 'online', '8', '1.0000000', '30000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417093505028', 'cdc', 'eth', '8', '2', 'innovation', 'cdceth', 'offline', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417093505029', 'ogo', 'usdt', '6', '2', 'innovation', 'ogousdt', 'online', '8', '1.0000000', '40000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699329', 'mds', 'eth', '8', '0', 'innovation', 'mdseth', 'online', '8', '1.0000000', '200000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699330', 'kcash', 'btc', '10', '2', 'innovation', 'kcashbtc', 'online', '8', '1.0000000', '25000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699331', 'usdc', 'husd', '4', '4', 'main', 'usdchusd', 'online', '8', '0.1000000', '1500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699332', 'lun', 'eth', '6', '4', 'innovation', 'luneth', 'online', '8', '0.0010000', '600.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699333', 'hit', 'eth', '8', '2', 'innovation', 'hiteth', 'online', '8', '1.0000000', '6873879.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699334', 'hot', 'btc', '10', '2', 'innovation', 'hotbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699335', 'iost', 'btc', '10', '2', 'innovation', 'iostbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699336', 'wicc', 'usdt', '4', '4', 'innovation', 'wiccusdt', 'online', '8', '0.0100000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417097699337', 'mtx', 'eth', '8', '2', 'innovation', 'mtxeth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417106087937', 'cnns', 'ht', '6', '2', 'innovation', 'cnnsht', 'online', '8', '1.0000000', '100000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417106087938', 'fair', 'btc', '10', '2', 'innovation', 'fairbtc', 'online', '8', '1.0000000', '500000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417106087939', 'bcv', 'btc', '10', '2', 'innovation', 'bcvbtc', 'online', '8', '1.0000000', '22000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417106087940', 'btm', 'eth', '8', '2', 'innovation', 'btmeth', 'online', '8', '0.1000000', '4000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282241', 'dta', 'eth', '8', '2', 'innovation', 'dtaeth', 'online', '8', '1.0000000', '100000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282242', 'rdn', 'eth', '10', '0', 'innovation', 'rdneth', 'online', '8', '0.1000000', '4200.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282243', 'xrp', 'usdt', '5', '2', 'main', 'xrpusdt', 'online', '8', '1.0000000', '5000000.000', '5.0000000', '5.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282244', 'eos', 'ht', '6', '4', 'main', 'eosht', 'online', '8', '0.1000000', '60000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282245', 'mt', 'ht', '6', '4', 'innovation', 'mtht', 'online', '8', '1.0000000', '50000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282246', 'mco', 'btc', '6', '4', 'innovation', 'mcobtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417110282247', 'bix', 'eth', '6', '4', 'innovation', 'bixeth', 'online', '8', '0.1000000', '950000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670849', 'kmd', 'btc', '8', '2', 'innovation', 'kmdbtc', 'online', '8', '0.1000000', '800000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670850', 'chat', 'eth', '8', '2', 'innovation', 'chateth', 'online', '8', '0.1000000', '1000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670851', 'fsn', 'usdt', '4', '4', 'innovation', 'fsnusdt', 'online', '8', '0.0100000', '900000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670852', 'adx', 'btc', '8', '2', 'innovation', 'adxbtc', 'online', '8', '0.0100000', '9000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670853', 'gxc', 'eth', '6', '4', 'innovation', 'gxceth', 'online', '8', '0.0100000', '250000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670854', 'qun', 'eth', '8', '2', 'innovation', 'quneth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670855', 'wxt', 'usdt', '6', '2', 'innovation', 'wxtusdt', 'online', '8', '1.0000000', '200000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417118670856', 'rsr', 'usdt', '6', '2', 'innovation', 'rsrusdt', 'online', '8', '1.0000000', '650000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417122865153', 'zec', 'usdt', '2', '4', 'main', 'zecusdt', 'online', '8', '0.0010000', '5000.000', '5.0000000', '3.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417122865154', 'kan', 'usdt', '6', '4', 'innovation', 'kanusdt', 'online', '8', '1.0000000', '125000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417122865155', 'grs', 'btc', '8', '2', 'innovation', 'grsbtc', 'online', '8', '0.1000000', '1350000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417122865156', 'swftc', 'btc', '10', '2', 'innovation', 'swftcbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417122865157', 'akro', 'btc', '8', '2', 'innovation', 'akrobtc', 'online', '8', '1.0000000', '500000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417122865158', 'hpt', 'usdt', '6', '4', 'innovation', 'hptusdt', 'online', '8', '10.0000000', '70000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253761', 'iota', 'usdt', '4', '4', 'main', 'iotausdt', 'online', '8', '0.0100000', '500000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253762', 'wtc', 'btc', '8', '2', 'innovation', 'wtcbtc', 'online', '8', '0.1000000', '300000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253763', 'datx', 'eth', '8', '2', 'innovation', 'datxeth', 'online', '8', '1.0000000', '2600000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253764', 'btt', 'trx', '6', '4', 'innovation', 'btttrx', 'online', '8', '1.0000000', '1700000000.000', '1.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253765', 'ela', 'usdt', '4', '2', 'innovation', 'elausdt', 'online', '8', '0.0100000', '10000.000', '5.0000000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253766', 'ckb', 'btc', '8', '2', 'innovation', 'ckbbtc', 'online', '8', '1.0000000', '140000000.000', '0.0000100', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417131253767', 'eos', 'usdt', '4', '4', 'main', 'eosusdt', 'online', '8', '0.1000000', '1000000.000', '5.0000000', '5.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448066', 'gas', 'eth', '6', '4', 'innovation', 'gaseth', 'online', '8', '0.0010000', '10000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448067', 'doge', 'usdt', '6', '2', 'innovation', 'dogeusdt', 'online', '8', '1.0000000', '200000000.000', '5.0000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448068', 'ela', 'eth', '8', '2', 'innovation', 'elaeth', 'online', '8', '0.0100000', '50000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448069', 'lxt', 'eth', '8', '2', 'innovation', 'lxteth', 'online', '8', '1.0000000', '50000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448070', 'atom', 'eth', '6', '4', 'innovation', 'atometh', 'online', '8', '0.0100000', '500000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448071', 'xrp', 'ht', '6', '4', 'main', 'xrpht', 'online', '8', '0.1000000', '1000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448072', 'portal', 'btc', '10', '2', 'innovation', 'portalbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448073', 'trx', 'btc', '10', '2', 'main', 'trxbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '2.5000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417135448074', 'etc', 'ht', '6', '4', 'main', 'etcht', 'online', '8', '0.0100000', '50000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836673', 'ruff', 'eth', '8', '2', 'innovation', 'ruffeth', 'online', '8', '1.0000000', '10000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836674', 'she', 'eth', '10', '2', 'innovation', 'sheeth', 'online', '8', '1.0000000', '300000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836675', 'dta', 'usdt', '8', '4', 'innovation', 'dtausdt', 'online', '8', '1.0000000', '20000000.000', '5.0000000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836676', 'gt', 'ht', '6', '2', 'innovation', 'gtht', 'online', '8', '0.1000000', '1700000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836677', 'trio', 'eth', '10', '2', 'innovation', 'trioeth', 'online', '8', '1.0000000', '330000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836678', 'topc', 'btc', '10', '2', 'innovation', 'topcbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836679', 'xzc', 'btc', '6', '4', 'innovation', 'xzcbtc', 'online', '8', '0.0100000', '55000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836680', 'btt', 'btc', '10', '2', 'innovation', 'bttbtc', 'online', '8', '1.0000000', '750000000.000', '0.0001000', '2.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836681', 'new', 'btc', '10', '2', 'innovation', 'newbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417143836682', 'stk', 'btc', '10', '2', 'innovation', 'stkbtc', 'online', '8', '1.0000000', '10000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030977', 'ruff', 'usdt', '6', '4', 'innovation', 'ruffusdt', 'online', '8', '1.0000000', '5000000.000', '5.0000000', '1.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030978', 'rsr', 'ht', '6', '2', 'innovation', 'rsrht', 'online', '8', '1.0000000', '650000000.000', '0.1000000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030979', 'wan', 'btc', '8', '2', 'innovation', 'wanbtc', 'online', '8', '0.0100000', '100000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030980', 'box', 'eth', '8', '2', 'innovation', 'boxeth', 'online', '8', '1.0000000', '30000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030981', 'salt', 'btc', '10', '4', 'innovation', 'saltbtc', 'online', '8', '0.1000000', '5753.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030982', 'musk', 'eth', '8', '2', 'innovation', 'musketh', 'online', '8', '1.0000000', '25000000.000', '0.0100000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030983', 'top', 'btc', '10', '2', 'innovation', 'topbtc', 'online', '8', '1.0000000', '100000000.000', '0.0001000', '0.0000000');
INSERT INTO `bamboo_coin_symbol` VALUES ('1238372417148030984', 'ltc', 'husd', '2', '4', 'main', 'ltchusd', 'online', '8', '0.0010000', '30000.000', '5.0000000', '0.0000000');

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
-- Records of bamboo_menu
-- ----------------------------
INSERT INTO `bamboo_menu` VALUES ('1', '0', 'desk', '工作台', 'menu', '/desk', 'desktop', '1', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('2', '1', 'notice', '通知公告', 'menu', '/desk/notice', null, '1', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('3', '0', 'system', '系统管理', 'menu', '/system', 'setting', '2', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('4', '3', 'user', '用户管理', 'menu', '/system/user', null, '1', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('5', '3', 'dept', '部门管理', 'menu', '/system/dept', null, '2', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('6', '3', 'dict', '字典管理', 'menu', '/system/dict', null, '3', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('7', '3', 'menu', '菜单管理', 'menu', '/system/menu', null, '4', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('8', '3', 'role', '角色管理', 'menu', '/system/role', null, '5', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('9', '3', 'param', '参数管理', 'menu', '/system/param', null, '6', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('10', '0', 'monitor', '系统监控', 'menu', '/monitor', 'fund', '3', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('11', '10', 'doc', '接口文档', 'menu', 'http://localhost/doc.html', null, '1', '1', '0', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('12', '10', 'admin', '服务治理', 'menu', 'http://localhost:7002', null, '2', '1', '0', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('13', '10', 'log', '日志管理', 'menu', '/monitor/log', null, '3', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('14', '13', 'log_usual', '通用日志', 'menu', '/monitor/log/usual', null, '1', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('15', '13', 'log_api', '接口日志', 'menu', '/monitor/log/api', null, '2', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('16', '13', 'log_error', '错误日志', 'menu', '/monitor/log/error', null, '3', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('17', '0', 'tool', '研发工具', 'menu', '/tool', 'tool', '4', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('18', '17', 'code', '代码生成', 'menu', '/tool/code', null, '1', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('19', '2', 'notice_add', '新增', 'add', '/desk/notice/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('20', '2', 'notice_edit', '修改', 'edit', '/desk/notice/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('21', '2', 'notice_delete', '删除', 'delete', '/api/blade-desk/notice/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('22', '2', 'notice_view', '查看', 'view', '/desk/notice/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('23', '4', 'user_add', '新增', 'add', '/system/user/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('24', '4', 'user_edit', '修改', 'edit', '/system/user/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('25', '4', 'user_delete', '删除', 'delete', '/api/blade-user/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('26', '4', 'user_role', '角色配置', 'role', null, 'user-add', '4', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('27', '4', 'user_reset', '密码重置', 'reset-password', '/api/blade-user/reset-password', 'retweet', '5', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('28', '4', 'user_view', '查看', 'view', '/system/user/view', 'file-text', '6', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('29', '5', 'dept_add', '新增', 'add', '/system/dept/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('30', '5', 'dept_edit', '修改', 'edit', '/system/dept/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('31', '5', 'dept_delete', '删除', 'delete', '/api/blade-system/dept/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('32', '5', 'dept_view', '查看', 'view', '/system/dept/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('33', '6', 'dict_add', '新增', 'add', '/system/dict/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('34', '6', 'dict_edit', '修改', 'edit', '/system/dict/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('35', '6', 'dict_delete', '删除', 'delete', '/api/blade-system/dict/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('36', '6', 'dict_view', '查看', 'view', '/system/dict/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('37', '7', 'menu_add', '新增', 'add', '/system/menu/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('38', '7', 'menu_edit', '修改', 'edit', '/system/menu/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('39', '7', 'menu_delete', '删除', 'delete', '/api/blade-system/menu/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('40', '7', 'menu_view', '查看', 'view', '/system/menu/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('41', '8', 'role_add', '新增', 'add', '/system/role/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('42', '8', 'role_edit', '修改', 'edit', '/system/role/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('43', '8', 'role_delete', '删除', 'delete', '/api/blade-system/role/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('44', '8', 'role_view', '查看', 'view', '/system/role/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('45', '9', 'param_add', '新增', 'add', '/system/param/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('46', '9', 'param_edit', '修改', 'edit', '/system/param/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('47', '9', 'param_delete', '删除', 'delete', '/api/blade-system/param/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('48', '9', 'param_view', '查看', 'view', '/system/param/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('49', '14', 'log_usual_view', '查看', 'view', '/monitor/log/usual/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('50', '15', 'log_api_view', '查看', 'view', '/monitor/log/api/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('51', '16', 'log_error_view', '查看', 'view', '/monitor/log/error/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('52', '18', 'code_add', '新增', 'add', '/tool/code/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('53', '18', 'code_edit', '修改', 'edit', '/tool/code/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('54', '18', 'code_delete', '删除', 'delete', '/api/blade-system/code/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('55', '18', 'code_view', '查看', 'view', '/tool/code/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('56', '3', 'tenant', '租户管理', 'menu', '/system/tenant', null, '7', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('57', '56', 'tenant_add', '新增', 'add', '/system/tenant/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('58', '56', 'tenant_edit', '修改', 'edit', '/system/tenant/edit', 'form', '2', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('59', '56', 'tenant_delete', '删除', 'delete', '/api/blade-system/tenant/remove', 'delete', '3', '2', '3', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('60', '56', 'tenant_view', '查看', 'view', '/system/tenant/view', 'file-text', '4', '2', '2', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('61', '3', 'client', '应用管理', 'menu', '/system/client', null, '8', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('62', '61', 'client_add', '新增', 'add', '/system/client/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('63', '61', 'client_edit', '修改', 'edit', '/system/client/edit', 'form', '2', '2', '2', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('64', '61', 'client_delete', '删除', 'delete', '/api/blade-system/client/remove', 'delete', '3', '2', '3', '3', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('65', '61', 'client_view', '查看', 'view', '/system/client/view', 'file-text', '4', '2', '2', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('66', '17', 'datasource', '数据源管理', 'menu', '/tool/datasource', '', '2', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('67', '66', 'datasource_add', '新增', 'add', '/tool/datasource/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('68', '66', 'datasource_edit', '修改', 'edit', '/tool/datasource/edit', 'form', '2', '2', '2', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('69', '66', 'datasource_delete', '删除', 'delete', '/api/blade-develop/datasource/remove', 'delete', '3', '2', '3', '3', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('70', '66', 'datasource_view', '查看', 'view', '/tool/datasource/view', 'file-text', '4', '2', '2', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('71', '17', 'datasource', '数据源管理', 'menu', '/tool/datasource', 'iconfont icon-caidanguanli', '2', '1', '0', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('72', '71', 'datasource_add', '新增', 'add', '/tool/datasource/add', 'plus', '1', '2', '1', '1', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('73', '71', 'datasource_edit', '修改', 'edit', '/tool/datasource/edit', 'form', '2', '2', '2', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('74', '71', 'datasource_delete', '删除', 'delete', '/api/blade-develop/datasource/remove', 'delete', '3', '2', '3', '3', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('75', '71', 'datasource_view', '查看', 'view', '/tool/datasource/view', 'file-text', '4', '2', '2', '2', null, null, null, null, null, '0');
INSERT INTO `bamboo_menu` VALUES ('76', '3', 'basic', '基础管理', 'menu', '/system/basic', 'iconfont iconicon_cloud_history', '0', '1', '0', '1', '', null, '2020-02-28 17:15:50', null, null, '0');

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
-- Records of bamboo_role
-- ----------------------------

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
-- Records of bamboo_role_menu
-- ----------------------------

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

-- ----------------------------
-- Records of bamboo_user
-- ----------------------------
INSERT INTO `bamboo_user` VALUES ('1231231344322131231', 'admin', '2fd5a06f991f85746815d4c11ece12d0', '5ffp24b5h', 'admin', 'admin', 'admin', 'admin', '2019-11-06 11:13:03', '1', '1', '1', '2019-11-06 11:13:11', null, null, '1', '0');
