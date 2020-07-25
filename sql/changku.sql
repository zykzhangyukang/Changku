/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : localhost:3306
 Source Schema         : changku

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/07/2020 21:05:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bus_customer
-- ----------------------------
DROP TABLE IF EXISTS `bus_customer`;
CREATE TABLE `bus_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_customer
-- ----------------------------
INSERT INTO `bus_customer` VALUES (1, '小张超市', '111', '武汉', '027-9123131', '张大明', '13812312312321312', '中国银行', '654431331343413', '213123@sina.com', '430000', 1);
INSERT INTO `bus_customer` VALUES (2, '小明超市', '222', '深圳', '0755-9123131', '张小明', '13812312312321312', '中国银行', '654431331343413', '213123@sina.com', '430000', 1);
INSERT INTO `bus_customer` VALUES (3, '快七超市', '430000', '武汉', '027-11011011', '雷生', '13434134131', '招商银行', '6543123341334133', '6666@66.com', '545341', 1);

-- ----------------------------
-- Table structure for bus_goods
-- ----------------------------
DROP TABLE IF EXISTS `bus_goods`;
CREATE TABLE `bus_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `produceplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodspackage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `promitcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` double NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `dangernum` int(11) NULL DEFAULT NULL,
  `goodsimg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  `providerid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sq0btr2v2lq8gt8b4gb8tlk0i`(`providerid`) USING BTREE,
  CONSTRAINT `bus_goods_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_goods
-- ----------------------------
INSERT INTO `bus_goods` VALUES (1, '娃哈哈', '武汉', '120ML', '瓶', 'PH12345', 'PZ1234', '小孩子都爱的', 2, 488, 10, '2018-12-25/userface1.jpg', 1, 3);
INSERT INTO `bus_goods` VALUES (2, '旺旺雪饼[小包]', '仙桃', '包', '袋', 'PH12312312', 'PZ12312', '好吃不上火', 4, 1100, 10, '2018-12-25/userface2.jpg', 1, 1);
INSERT INTO `bus_goods` VALUES (3, '旺旺大礼包', '仙桃', '盒', '盒', '11', '11', '111', 28, 1021, 100, '2018-12-25/userface3.jpg', 1, 1);
INSERT INTO `bus_goods` VALUES (4, '娃哈哈', '武汉', '200ML', '瓶', '11', '111', '12321', 3, 1100, 10, '2018-12-25/userface4.jpg', 1, 3);
INSERT INTO `bus_goods` VALUES (5, '娃哈哈', '武汉', '300ML', '瓶', '1234', '12321', '22221111', 3, 1000, 100, '2018-12-25/userface5.jpg', 1, 3);

-- ----------------------------
-- Table structure for bus_inport
-- ----------------------------
DROP TABLE IF EXISTS `bus_inport`;
CREATE TABLE `bus_inport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inporttime` datetime(0) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inportprice` double NULL DEFAULT NULL,
  `providerid` int(11) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_1o4bujsyd2kl4iqw48fie224v`(`providerid`) USING BTREE,
  INDEX `FK_ho29poeu4o2dxu4rg1ammeaql`(`goodsid`) USING BTREE,
  CONSTRAINT `bus_inport_ibfk_1` FOREIGN KEY (`providerid`) REFERENCES `bus_provider` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bus_inport_ibfk_2` FOREIGN KEY (`goodsid`) REFERENCES `bus_goods` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_inport
-- ----------------------------
INSERT INTO `bus_inport` VALUES (1, '微信', '2018-05-07 00:00:00', '张三', 100, '备注', 3.5, 1, 1);
INSERT INTO `bus_inport` VALUES (2, '支付宝', '2018-05-07 00:00:00', '张三', 1000, '无', 2.5, 3, 3);
INSERT INTO `bus_inport` VALUES (3, '银联', '2018-05-07 00:00:00', '张三', 100, '1231', 111, 3, 3);
INSERT INTO `bus_inport` VALUES (4, '银联', '2018-05-07 00:00:00', '张三', 1000, '无', 2, 3, 1);
INSERT INTO `bus_inport` VALUES (5, '银联', '2018-05-07 00:00:00', '张三', 100, '无', 1, 3, 1);
INSERT INTO `bus_inport` VALUES (6, '银联', '2018-05-07 00:00:00', '张三', 100, '1231', 2.5, 1, 2);
INSERT INTO `bus_inport` VALUES (8, '支付宝', '2018-05-07 00:00:00', '张三', 100, '', 1, 3, 1);
INSERT INTO `bus_inport` VALUES (10, '支付宝', '2018-08-07 17:17:57', '超级管理员', 100, 'sadfasfdsa', 1.5, 3, 1);
INSERT INTO `bus_inport` VALUES (11, '支付宝', '2018-09-17 16:12:25', '超级管理员', 21, '21', 21, 1, 3);
INSERT INTO `bus_inport` VALUES (12, '微信', '2018-12-25 16:48:24', '超级管理员', 100, '123213213', 12321321, 3, 1);

-- ----------------------------
-- Table structure for bus_outport
-- ----------------------------
DROP TABLE IF EXISTS `bus_outport`;
CREATE TABLE `bus_outport`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providerid` int(11) NULL DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outputtime` datetime(0) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `outportprice` double(10, 2) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_outport
-- ----------------------------
INSERT INTO `bus_outport` VALUES (1, 3, '微信', '2019-08-16 08:19:50', '超级管理员', 12321321.00, 1, '', 1);
INSERT INTO `bus_outport` VALUES (2, 3, '微信', '2019-08-16 08:26:54', '超级管理员', 12321321.00, 11, '11', 1);

-- ----------------------------
-- Table structure for bus_provider
-- ----------------------------
DROP TABLE IF EXISTS `bus_provider`;
CREATE TABLE `bus_provider`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `providername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `connectionperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_provider
-- ----------------------------
INSERT INTO `bus_provider` VALUES (1, '旺旺食品', '434000', '仙桃', '0728-4124312', '小明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', 1);
INSERT INTO `bus_provider` VALUES (2, '达利园食品', '430000', '汉川', '0728-4124312', '大明', '13413441141', '中国农业银行', '654124345131', '12312321@sina.com', '5123123', 1);
INSERT INTO `bus_provider` VALUES (3, '娃哈哈集团', '513131', '杭州', '21312', '小晨', '12312', '建设银行', '512314141541', '123131', '312312', 1);

-- ----------------------------
-- Table structure for bus_sales
-- ----------------------------
DROP TABLE IF EXISTS `bus_sales`;
CREATE TABLE `bus_sales`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NULL DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salestime` datetime(0) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `saleprice` decimal(10, 2) NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_sales
-- ----------------------------

-- ----------------------------
-- Table structure for bus_salesback
-- ----------------------------
DROP TABLE IF EXISTS `bus_salesback`;
CREATE TABLE `bus_salesback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerid` int(11) NULL DEFAULT NULL,
  `paytype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salesbacktime` datetime(0) NULL DEFAULT NULL,
  `salebackprice` double(10, 2) NULL DEFAULT NULL,
  `operateperson` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bus_salesback
-- ----------------------------

-- ----------------------------
-- Table structure for oa_customer_list
-- ----------------------------
DROP TABLE IF EXISTS `oa_customer_list`;
CREATE TABLE `oa_customer_list`  (
  `fid` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `CustomerNo` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '客户编号',
  `CustomerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '客户名称',
  `CustomerTell` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '联系电话',
  `birthday` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '出生日期',
  `sh` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '税号',
  `bank` varchar(30) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '开户行',
  `bankno` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '银行账户',
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '地址',
  `carpinpai` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '车辆编号',
  `cartype` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '车辆型号',
  `carno` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '车牌号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '客户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_customer_list
-- ----------------------------
INSERT INTO `oa_customer_list` VALUES ('437469246BE0419D83268BE600564A86', '006', 'coderman zhang', '15079437282', '2018-11-30 10:25:54', '121541151', '125661521646151', '121510351651561', 'china jiangxi', '五菱宏光', '3434', '赣N721', '本次保养里程：9958KM 保养内容：帕克龙5W-30 180*3 空气滤芯：485空调滤芯：175本次保养日期：2019年10月2日建议下次保养日期：2020年5月', NULL, NULL, '');
INSERT INTO `oa_customer_list` VALUES ('A1DF70F6AD9F4A51876DF0A6060923BC', '005', '林俊杰', '121212', '1999-07-35', '11015151', '12152151', '45151515', '12154545', '路虎', '飞度1.5L', 'S45112', '本次保养里程：9958KM 保养内容：帕克龙5W-30 180*3 空气滤芯：485空调滤芯：175本次保养日期：2019年10月2日建议下次保养日期：2020年5月', NULL, NULL, '');
INSERT INTO `oa_customer_list` VALUES ('C89F8D6267C00001EA5FFCEB4BBB7820', '001', '张泽', '123456789', '2019-10-03', '11212121212', '123234535', '4515151545', '河南', '福特', '福克斯', '云A123456', '本次保养里程：9958KM 保养内容：帕克龙5W-30 180*3 空气滤芯：485空调滤芯：175本次保养日期：2019年10月2日建议下次保养日期：2020年5月', 3, NULL, '管理员');
INSERT INTO `oa_customer_list` VALUES ('C89F8EE061200001F16488F358502B70', '002', '周佳旺', '13888499035', '2018-11-28 10:25:54', '20121212', '13121212', '4515151545', '北京', '本田', '飞度1.5L', '云A 96Q57', '本次保养里程：9958KM \n保养内容：\n帕克龙5W-30 180*3 \n空气滤芯：485\n空调滤芯：175\n本次保养日期：2019年10月2日\n建议下次保养日期：2020年5月', 5, NULL, '管理员');
INSERT INTO `oa_customer_list` VALUES ('C89F8F33D1A000017EF8CEB5708042F0', '003', '汤经纶', '13807412127', '2018-11-30 10:25:54', '312154515', '12122312', '4515151545', '上海', '别克', '捷达1.6L', '湘B 0871A', '本次保养里程：94842KM\n保养内容：\n地狱火伯爵5-40 110*4\n空气滤芯：35\n空调滤芯：55\n本次保养日期：2019年9-28\n建议下次保养日期：2020年5月', 3, NULL, '管理员');

-- ----------------------------
-- Table structure for oa_customerbuy_record
-- ----------------------------
DROP TABLE IF EXISTS `oa_customerbuy_record`;
CREATE TABLE `oa_customerbuy_record`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '主键',
  `CustomerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '客户名称',
  `cid` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '外键',
  `buyitem` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '消费项',
  `buymoney` decimal(11, 2) NULL DEFAULT NULL COMMENT '消费金额',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '消费时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '客户消费记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_customerbuy_record
-- ----------------------------

-- ----------------------------
-- Table structure for oa_product_cong
-- ----------------------------
DROP TABLE IF EXISTS `oa_product_cong`;
CREATE TABLE `oa_product_cong`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `productbrand` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `productmodel` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品型号',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '规格',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '备注',
  `typeid` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '类型外键',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `fcor` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '商品维护表（2019-9-24）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_product_cong
-- ----------------------------
INSERT INTO `oa_product_cong` VALUES ('009376AEEE304E6382B03456972A3923', '康佩森1', '195/55R15', 'K737', '//监听行单击事件（单击事件为：rowDouble）\n  table.on(\'row(test)\', function(obj){\n    var data = obj.data;\n    \n    layer.alert(JSON.stringify(data), {\n      title: \'当前行数据：\'\n    });', 'CA98BC18780B48AAADB9DB73CF7B0263', 5, NULL);
INSERT INTO `oa_product_cong` VALUES ('2A86845B26124BF0BEA5C509629E4018', '娃娃2', '185/65R14', '737', 'good', 'CA98BC18780B48AAADB9DB73CF7B0263', 6, NULL);
INSERT INTO `oa_product_cong` VALUES ('36BC50E255834B5792B4CD227F9921F3', '康佩森', '195/65R15', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 5, NULL);
INSERT INTO `oa_product_cong` VALUES ('38EBA3A5119A443F960120C7FC359FAC', '螺丝一号', 'S542', '500Kg', NULL, NULL, NULL, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('39BA68E93F514CFEA465D8358214E74C', '康佩森', '185/55R15', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('440C03FF04554339B5436512FA8D21F4', '康佩森', '195/45R16', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('5A774D52C57C406E9813525DE9068C11', '康佩森', '205/65R16', 'H202', '好用的轮胎', 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('5B529BEECF854C8CA5A29ED3C1B26ACA', '国产气筒', 'N450', '500ml', '国产气筒真的好用', 'CE2ABC25AD8C489E834025AD2C79E6B8', 5, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('67E15B38A40440138FE8A75584747CD5', '螺丝一号', 'S542', '500Kg', NULL, NULL, NULL, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('6C025047163943418DB8056932F709D8', '佳洁士', 'M4-90', '500l', '佳洁士油漆真的好用', '519E6FA72E184581B62E1C4357F99763', 5, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('72152613A661452BB6890B6327C43899', '康佩森', '185/65R15', '801', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('8F9F522603694D029558DCD07F0088D4', '康佩森', '185/70R14', '737', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('AA2DCF246B3241BB93556BEA2CF07C8A', '康佩森', '195/60R14', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 5, NULL);
INSERT INTO `oa_product_cong` VALUES ('AB6919FD1D9B48218F09D9CE8C85D0F4', '康佩森', '165/65R13', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('ADF8189024CB4361AB676B426EE3AC76', '康佩森', '175/60R15', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('BC9251645B6C42F8A77A8EAFE8A47B91', '米其林', '195/65R15', 'XM2', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C42A035C21CC46ACA3FC37A4B6D1C090', '康佩森', '195/60R15', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C5F9AA92444346A29C1EE273B1A78CC5', '螺丝一号', 'S542', '500Kg', '好用的螺丝', '401A7C27A29C4663ABB6EFA48A63C521', 2, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('C89F800787600001FCFA18FB18146FE0', '康佩森', '195/60R16', 'H202', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F805FCA600001D98FB7E0B332132B', '地狱火机油', '公爵', '0W-40 SN', '好用的机油', 'C89F802C65E00001C67D1E601DE069C0', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F809A1F6000013F921C00BCA0AD90', '安耐特', '215/70R16', 'AN626', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F80A261700001B64915EAEA50EB70', '康佩森', '215/65R16', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F80A2B17000017762189053A52D10', '康佩森', '215/60R17', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F80A2BB70000114721984973E10AD', '康佩森', '215/55R17', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F80AF0D600001C2F7B91AA0CC1E6D', '康佩森', '215/50R17', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F80AF33700001D4731A00DB60151B', '康佩森', '215/45R17', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F80AF3CE00001ACBB1C80BD8011DF', '康佩森', '215/60R16', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F834B8B8000017FF547308F5C101E', '康佩森', '225/70R16', 'RS23', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F834C520000012A99109012704310', '康佩森', '235/70R16', 'RS23', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8369D10000011859DF64F7E03630', '康佩森', '225/60R18', 'RS23', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8369FC8000013D5FB285C9E83EC0', '康佩森', '235/65R17', 'RS23', NULL, 'C89F3E0597600001D6F3B4501E091312', 5, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A2100000150FB16BECEF067F0', '康佩森', '235/50R18', 'S2000', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A2B800001806517EA15001B58', '康佩森', '235/45R18', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A3680000183D37008199B1AF9', '康佩森', '235/40R18', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A4100000184D51A7755B0ED40', '康佩森', '225/65R17', 'RS23', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A59800001EB5418D51E422BD0', '康佩森', '225/60R17', 'RS23', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A62000001B06014A3D08093E0', '康佩森', '225/55R17', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A7000000183A61A8AB88616B0', '康佩森', '225/50R17', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F836A7B000001771A47E4173E1B15', '康佩森', '225/45R17', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F848CFEA00001E68117B613201141', '邓喜禄', '215/55R17', 'D8', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F85FB3EB0000189921480903AA1C0', '玲珑', '165R13LT', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F85FB653000019B22370FF590118D', '玲珑', '175/75R14LT', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F85FB6F40000184218670F1201100', '玲珑', '175/70R14LT', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F85FB79300001C97E14EC478C1671', '玲珑', '165/70R13LT', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86092A3000012CCCB120130032D0', NULL, '165R14LT', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86A824B000019E6DCBF052BA7B90', '地狱火机油', '骑士', '5W-40 SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86A84130000135D2380C144F5710', '地狱火机油', '骑士', '5W-30 SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86AD20B00001DB9FC97C17A01693', '地狱火机油', '伯爵', '5W-40 SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86AD3FB00001E95C7BA012901520', '地狱火机油', '骑士', '5W-30  SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86B670300001D3C3127686D05800', '地狱火机油', '伯爵', '0W-20 SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 5, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F86B73830000166D32AD8FA401E67', '帕克龙机油', '伯爵', '5W-30 SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 4, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F89F434600001B024C40771F03010', '邓喜禄轮胎', '185/65R14', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A0044600001CC8130173F745DA0', '康佩森', '235/60R16', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A111CE00001CB671B2612E9CB10', '韩泰轮胎', '185/65R15', 'H728', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A114CE00001C6F776F0A7001E0F', '韩泰轮胎', '185/65R15', 'K407', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A3650D00001A872CD5EC80617B5', '横滨轮胎', '245/75R16', 'G91A', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A5094E000011EC614901C211F61', '韩泰轮胎', '195/65R15', 'K415', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A5DF3E00001605D1DA010D0CA60', '佳通轮胎', '205/55R16', '228', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8A69A6E000019A9310A070A14090', '佳通轮胎', '205/55R16', '228v1', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8AA93170000161C414D01EC08690', '邓喜禄', '205/65R15', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8AD8C470000161982310B340AC40', '康佩森', '235/55R19', 'HS26', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8BD4768000013E3C1090E32018AC', '康佩森', '265/65R17', 'RS26', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8CC1D3F000019D1C151015001193', '康佩森', '175/70R14', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8CCC530000017F32B5C01A806E20', '康佩森', '245/40R18', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8CFB34800001326EB61A8CCC1610', '康佩森', '225/55R16', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8D24B000000156AF8810D387126C', '康佩森', '235/55R17', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8D437C900001EE69C090E1CDDC40', '康佩森', '215/60R17', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8D6EC0100001F88E1215EC001F1C', '福麦斯', '235/45R18', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8E143BA000015A31175311EA9D60', '康佩森', '245/45R18', '3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8E3741900001405D1870BF705620', '康佩森', '195/55R16', 'K3000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8E5DF6A00001B5EE103713C82310', '康佩森', '225/50RFT17', 'S2000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8E62BC20000189541D9C1830A890', '康佩森', '225/45RFT17', 'S2000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8E62C6200001A58D1792BC1014D5', '康佩森', '225/55R17RFT', 'S2000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89F8E62E39000018985134C16801E83', '康佩森', '245/45RFT18', 'S2000', NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89FA0FEA56000011AB3179B1660154F', '嘉实多', '极护', '0W-40 SN ', NULL, 'C89F802C65E00001C67D1E601DE069C0', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89FA0FEC8500001C9F81D1135F05260', '嘉实多', '磁护', ' 5W-30  SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89FA0FED8600001EAA110A0AA002A60', '嘉实多', '磁护', '5W-40 SN', NULL, 'C89F802C65E00001C67D1E601DE069C0', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89FA1182CD000019222142011A3E240', 'GS加德士', '凯升', '10W-40 SJ', NULL, 'C89F802C65E00001C67D1E601DE069C0', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('C89FA19AD5E00001AFDAE6B5B4605170', '玲珑', '165R14LT', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('CA96190441E447E3980EC3AE08CE45A9', '旺旺', 'YYY', '88', '1', '401A7C27A29C4663ABB6EFA48A63C521', 1, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('D6674192F2D944219776587FDD1EB822', '康佩森', '165/60R14', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);
INSERT INTO `oa_product_cong` VALUES ('DD7CCA47557D4ED5A9A082102B4568B9', '康佩森', '205/55R16', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('E4864448211A46AA91BC297809A0A71B', '卫龙辣条', 'HHH', '500Ml', '卫龙辣条牌螺丝', '401A7C27A29C4663ABB6EFA48A63C521', NULL, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('E7AFB29ADF644DF4BF1CC8CD06052BB2', '康佩森', '205/65R15', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 2, NULL);
INSERT INTO `oa_product_cong` VALUES ('EF9631FF0E18488D9D9A6BA986FBF2CB', '章鱼牌油漆', 'SFISH', '500毫升', '好用的油漆', '519E6FA72E184581B62E1C4357F99763', 5, '超级管理员');
INSERT INTO `oa_product_cong` VALUES ('EFBB7FDE9C104802BF469FC1F1C8FF81', '康佩森', '205/60R16', 'K737', NULL, 'C89F3E0597600001D6F3B4501E091312', 3, NULL);
INSERT INTO `oa_product_cong` VALUES ('F4499E80D0C64E2AB177ED75B85C3935', '康佩森', '175/65R14', NULL, NULL, 'C89F3E0597600001D6F3B4501E091312', 1, NULL);

-- ----------------------------
-- Table structure for oa_product_main
-- ----------------------------
DROP TABLE IF EXISTS `oa_product_main`;
CREATE TABLE `oa_product_main`  (
  `fid` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `producttype` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品类别',
  `addtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '添加时间',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作人',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '商品维护字典主表（oa_product_main2019-10-2）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_product_main
-- ----------------------------
INSERT INTO `oa_product_main` VALUES ('401A7C27A29C4663ABB6EFA48A63C521', '螺丝', 'Fri Nov 01 11:47:22 CST 2019', '超级管理员', 1);
INSERT INTO `oa_product_main` VALUES ('519E6FA72E184581B62E1C4357F99763', '油漆', 'Fri Nov 01 14:00:03 CST 2019', '超级管理员', NULL);
INSERT INTO `oa_product_main` VALUES ('5A6414C90E744894AC125A59ACE9ACCF', '硅胶', 'Fri Nov 01 11:52:37 CST 2019', '超级管理员', NULL);
INSERT INTO `oa_product_main` VALUES ('6D1E8AA9973C46C896C4732A23227887', '铁钉', 'Fri Nov 01 11:53:07 CST 2019', '超级管理员', NULL);
INSERT INTO `oa_product_main` VALUES ('C89F3E0597600001D6F3B4501E091312', '轮胎', '2019-10-02 14:34:36', '管理员', 1);
INSERT INTO `oa_product_main` VALUES ('C89F802C65E00001C67D1E601DE069C0', '机油', '2019-10-03 09:53:37', '管理员', 1);
INSERT INTO `oa_product_main` VALUES ('C89F802E6D60000152BAE740F1933680', '滤芯', '2019-10-03 09:53:45', '管理员', 1);
INSERT INTO `oa_product_main` VALUES ('CA98BC18780B48AAADB9DB73CF7B0263', '娃娃', 'Fri Nov 01 11:52:22 CST 2019', '超级管理员', NULL);
INSERT INTO `oa_product_main` VALUES ('CE2ABC25AD8C489E834025AD2C79E6B8', '气筒', NULL, NULL, 1);

-- ----------------------------
-- Table structure for oa_products
-- ----------------------------
DROP TABLE IF EXISTS `oa_products`;
CREATE TABLE `oa_products`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `producttype` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品类别',
  `MerchantName` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商家名称',
  `productbrand` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `productmodel` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品型号',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '单位',
  `model` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '规格',
  `productcount` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `productsingleprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `productsprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总价',
  `addtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '入库时间',
  `manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '经办人',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作人',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '规格',
  `state` int(11) NULL DEFAULT 0 COMMENT '状态',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '入库管理表（2019-9-25）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_products
-- ----------------------------
INSERT INTO `oa_products` VALUES ('08A866A747D044D3AEA07C3947A0FD61', '螺丝', '昆明齐悦铭商贸', '卫龙辣条', 'HHH', '瓶', NULL, 10, 1.00, 10.00, 'Wed Nov 27 21:39:18 CST 2019', '超级管理员', '超级管理员', '500Ml', 0, NULL);
INSERT INTO `oa_products` VALUES ('13B5F4C1B099485885B5B197B8BD9B4D', '机油', '昆明齐悦铭商贸', '地狱火机油', '公爵', '瓶', NULL, 1, 1.00, 1.00, 'Sun Nov 03 18:49:50 CST 2019', '超级管理员', '超级管理员', '0W-40 SN', 0, NULL);
INSERT INTO `oa_products` VALUES ('14BC6E6FD42C4BE6B463BEF37363F3E5', '螺丝', '昆明齐悦铭商贸', '旺旺', 'YYY', '瓶', NULL, 12, 1.00, 12.00, 'Wed Nov 06 13:38:09 CST 2019', '超级管理员', '超级管理员', '88', 0, NULL);
INSERT INTO `oa_products` VALUES ('25FFBA73A52045F08769BE21AA83D25E', '油漆', '昆明齐悦铭商贸', '章鱼牌油漆', 'SFISH', '瓶', NULL, 34, 34.00, 1156.00, 'Sat Nov 02 22:33:08 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('2BA8D3E09B814F34ADEAD8C3491DB7DF', '娃娃', '昆明齐悦铭商贸', '康佩森12222', '195/55R15', '瓶', NULL, 23, 23.00, 529.00, 'Sun Nov 03 18:44:25 CST 2019', '超级管理员', '超级管理员', 'K737', 0, NULL);
INSERT INTO `oa_products` VALUES ('2E70C2D36409408A881C7FA55BC96132', '轮胎', '宝乐商贸', '米其林', '195/65R15', '条', 'TNT', 12, 2.00, 24.00, 'Sat Nov 02 14:38:01 CST 2019', '超级管理员', '超级管理员', 'XM2', 0, NULL);
INSERT INTO `oa_products` VALUES ('2EF3F02169BE42A084FA21395A4F6E24', '娃娃', '昆明新鼎盛商贸', '康佩森1', '195/55R15', '瓶', NULL, 100, 25.00, 2500.00, 'Wed Nov 27 21:37:29 CST 2019', '超级管理员', '超级管理员', 'K737', 0, NULL);
INSERT INTO `oa_products` VALUES ('3824E985834E49A5B5DAD72F19100D56', '油漆', '正新玛吉斯', '章鱼牌油漆', 'SFISH', '瓶', NULL, 12, 12.30, 147.60, 'Sat Nov 02 18:28:04 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('3F5F417B36BA4FCCB0263615D1897233', '油漆', '昆明齐悦铭商贸', '章鱼牌油漆', 'SFISH', '瓶', NULL, 1, 1.00, 1.00, 'Sun Nov 03 18:10:04 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('57DBCCCDC772421D948460B9A00C4B20', '油漆', '昆明齐悦铭商贸', '章鱼牌油漆', 'SFISH', '瓶', NULL, 12, 12.00, 144.00, 'Sun Nov 03 18:55:27 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('583CEFA386264E0F8E52CED7C50A56CC', '娃娃', '昆明齐悦铭商贸', '康佩森1', '195/55R15', '瓶', NULL, 1, 1.00, 1.00, 'Mon Nov 04 11:51:03 CST 2019', '超级管理员', '超级管理员', 'K737', 0, NULL);
INSERT INTO `oa_products` VALUES ('621D566C2038447B88F308E84861D6E1', '油漆', '宝乐商贸', '章鱼牌油漆', 'SFISH', '箱', NULL, 1, 1.00, 1.00, 'Sun Nov 03 18:11:00 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('741A121915F34DA6B150E2973AACE6B7', '轮胎', '昆明齐悦铭商贸', '佳通轮胎', '205/55R16', '条', 'NHF', 12, 11.00, 132.00, '2019-10-08 11:20:20', 'system', 'system', '228', 0, 1);
INSERT INTO `oa_products` VALUES ('97B4FCEDDABA468D99898BEECAA7CE73', '轮胎', '百壮轮胎', '米其林', '195/65R15', '条', NULL, 100, 25.00, 2500.00, 'Thu Nov 07 17:58:22 CST 2019', '超级管理员', '超级管理员', 'K415', 0, NULL);
INSERT INTO `oa_products` VALUES ('980BEEE2BEF748C882576969CB729D63', '油漆', '昆明齐悦铭商贸', '章鱼牌油漆', 'SFISH', '瓶', NULL, 34, 34.00, 1156.00, 'Sun Nov 03 09:49:34 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('9EC7B55B2C87436FA9AE22272DD6C0AA', '娃娃', '小张车行', '娃娃2', '185/65R14', '辆', NULL, 1, 13.00, 13.00, 'Sun Nov 03 18:07:56 CST 2019', '超级管理员', '超级管理员', '737', 0, NULL);
INSERT INTO `oa_products` VALUES ('A7847D16AF7E4FC3A1D1DCAF9D24025E', '油漆', '昆明齐悦铭商贸', '章鱼牌油漆', 'SFISH', '台', NULL, 1, 1.00, 1.00, 'Wed Nov 06 13:36:17 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('AFE5B73D9EC54CDBAFFC798C07AD627E', '油漆', '昆明新鼎盛商贸', '章鱼牌油漆', 'SFISH', '瓶', NULL, 1, 1.00, 1.00, 'Wed Nov 06 13:39:50 CST 2019', '超级管理员', '超级管理员', '500毫升', 0, NULL);
INSERT INTO `oa_products` VALUES ('B60D24EAE79F49BF86F7152E5F3111BB', '螺丝', '车网联盟', '旺旺', 'YYY', '瓶', NULL, 1, 1.00, 1.00, 'Sun Nov 03 18:57:47 CST 2019', '超级管理员', '超级管理员', '88', 0, NULL);
INSERT INTO `oa_products` VALUES ('B6C90EA815214F7F9FD767939E071408', '娃娃', '小张车行', '娃娃2', '185/65R14', '箱', NULL, 1, 100.00, 100.00, 'Sun Nov 03 18:05:55 CST 2019', '超级管理员', '超级管理员', '737', 0, NULL);
INSERT INTO `oa_products` VALUES ('B6D9687697B946B5BA68C38E5C6DBE1F', '轮胎', '百壮轮胎', '邓喜禄', '205/65R15', '条', 'TND', 12, 12.00, 12.00, 'Sat Nov 02 14:36:17 CST 2019', '超级管理员', '超级管理员', 'K737', 0, NULL);
INSERT INTO `oa_products` VALUES ('C5A43BB9CE464499A6BE3FDF6373CB8C', '气筒', '小张车行', '国产气筒', 'N450', '瓶', NULL, 1, 1.00, 1.00, 'Sun Nov 03 18:16:38 CST 2019', '超级管理员', '超级管理员', '500ml', 0, NULL);
INSERT INTO `oa_products` VALUES ('C7B16CAC53544F25AF565F637D3C34CF', '气筒', '昆明齐悦铭商贸', '国产气筒', 'N450', '瓶', NULL, 1, 1.00, 1.00, 'Sun Nov 03 18:17:39 CST 2019', '超级管理员', '超级管理员', '500ml', 0, NULL);
INSERT INTO `oa_products` VALUES ('C7F2434830064FB1981C082118BA491C', '轮胎', '车网联盟', '邓喜禄', '205/65R15', '辆', NULL, 12, 12.00, 144.00, 'Sat Nov 02 18:24:38 CST 2019', '超级管理员', '超级管理员', 'K737', 0, NULL);
INSERT INTO `oa_products` VALUES ('DF2FC5AD9A6843A099D8D28D3F1FD7FB', '轮胎', '宝乐商贸', '米其林', '195/65R15', '条', 'TYD', 234, 12.00, 10.00, 'Sat Nov 02 14:11:05 CST 2019', '超级管理员', '超级管理员', 'XM2', 0, NULL);

-- ----------------------------
-- Table structure for oa_products_data
-- ----------------------------
DROP TABLE IF EXISTS `oa_products_data`;
CREATE TABLE `oa_products_data`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `producttype` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品类别',
  `MerchantName` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商家名称',
  `productbrand` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `productmodel` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品型号',
  `unit` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '单位',
  `productsingleprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `productsprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总价',
  `addtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '入库时间',
  `manager` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '经办人',
  `operator` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作人',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '规格',
  `state` int(11) NULL DEFAULT 0 COMMENT '状态',
  `allsum` int(1) NULL DEFAULT 0 COMMENT '库存数',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `productcount` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '库存表（2019-9-25）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_products_data
-- ----------------------------
INSERT INTO `oa_products_data` VALUES ('8D86792E368247CDADFE96D50563C1C6', '螺丝', '昆明齐悦铭商贸', '卫龙辣条', 'HHH', '瓶', 1.00, 9.00, 'Wed Nov 27 21:39:18 CST 2019', '超级管理员', '超级管理员', '500Ml', 0, 9, NULL, NULL);
INSERT INTO `oa_products_data` VALUES ('A3D72BA365F0469EA1A8300F52BD0098', '娃娃', '昆明新鼎盛商贸', '康佩森1', '195/55R15', '瓶', 25.00, 2500.00, 'Wed Nov 27 21:37:29 CST 2019', '超级管理员', '超级管理员', 'K737', 0, 100, NULL, NULL);
INSERT INTO `oa_products_data` VALUES ('E3D0E1B0220C4267849074A10E092860', '轮胎', '百壮轮胎', '米其林', '195/65R15', '条', 25.00, 2400.00, 'Thu Nov 07 17:58:22 CST 2019', '超级管理员', '超级管理员', 'K415', 0, 96, NULL, NULL);

-- ----------------------------
-- Table structure for oa_products_outcong
-- ----------------------------
DROP TABLE IF EXISTS `oa_products_outcong`;
CREATE TABLE `oa_products_outcong`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `producttype` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品类别',
  `productbrand` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `productcount` int(11) NULL DEFAULT NULL COMMENT '商品数量',
  `productunit` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品单位',
  `productmodel` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品规格',
  `type` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商品型号',
  `productsingleprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `productallprice` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品总价',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `ffid` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '外键',
  `fcor` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '出库商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_products_outcong
-- ----------------------------
INSERT INTO `oa_products_outcong` VALUES ('C00B6B952F3C499D889CDD0A173C83B0', '螺丝', '卫龙辣条', NULL, NULL, 'HHH', '500Ml', 1.00, 1.00, NULL, 'A9D1E340173545A393A05D17C1B64215', NULL);
INSERT INTO `oa_products_outcong` VALUES ('C506C613DAAF4209B580F2CBD9984AA3', '轮胎', '米其林', NULL, NULL, '195/65R15', 'K415', 25.00, 100.00, NULL, '104B58B2771C43EB8561773E83D9A7B6', NULL);

-- ----------------------------
-- Table structure for oa_products_outmain
-- ----------------------------
DROP TABLE IF EXISTS `oa_products_outmain`;
CREATE TABLE `oa_products_outmain`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `CustomerName` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '客户名称',
  `CustomerTell` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '客户联系电话',
  `CarPinPai` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '车辆品牌',
  `CarType` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '车辆型号',
  `CarNo` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '车牌号',
  `CarDistance` double(11, 2) NULL DEFAULT NULL COMMENT '车辆里程数',
  `Money` int(11) NULL DEFAULT NULL COMMENT '工时费',
  `allsum` decimal(11, 2) NULL DEFAULT NULL COMMENT '总价',
  `manager` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '经办人',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作人',
  `addtime` datetime(0) NULL DEFAULT NULL COMMENT '出库时间',
  `remark` varchar(1024) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '备注',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  `fcor` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作',
  `myallsum` decimal(11, 2) NULL DEFAULT NULL COMMENT '商品总价',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '出库主表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_products_outmain
-- ----------------------------
INSERT INTO `oa_products_outmain` VALUES ('104B58B2771C43EB8561773E83D9A7B6', '林俊杰', '121212', '路虎', '飞度1.5L', 'S45112', 1200.00, NULL, NULL, '超级管理员', '超级管理员', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oa_products_outmain` VALUES ('A9D1E340173545A393A05D17C1B64215', '林俊杰', '121212', '路虎', '飞度1.5L', 'S45112', 200.00, NULL, NULL, '超级管理员', '超级管理员', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oa_supply_bususiness
-- ----------------------------
DROP TABLE IF EXISTS `oa_supply_bususiness`;
CREATE TABLE `oa_supply_bususiness`  (
  `fID` varchar(32) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL COMMENT '主键',
  `MerchantNo` int(11) NULL DEFAULT NULL COMMENT '商家编号',
  `MerchantName` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商家名称',
  `MerchantTell` varchar(12) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商家联系电话',
  `Merchantperson` varchar(15) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '商家联系人',
  `sh` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '税号',
  `bank` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bankcard` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '银行账户',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '单位地址',
  `addtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '添加时间',
  `operator` varchar(100) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL COMMENT '操作人',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本号',
  PRIMARY KEY (`fID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci COMMENT = '供货商维护表（2019-9-24）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oa_supply_bususiness
-- ----------------------------
INSERT INTO `oa_supply_bususiness` VALUES ('C89CEACA915000015EF0168019525F40', 1, '昆明齐悦铭商贸', '15079437282', '小张', '10086', '4512121244', '199212', '上海1', '2019-09-25 09:12:11', 'system', 4);
INSERT INTO `oa_supply_bususiness` VALUES ('C89CEADA748000011765999D144A1EB0', 2, '昆明新鼎盛商贸', '15079437282', '小王', '10086', '4512121244', '199212', '上海', '2019-09-25 09:13:16', 'system', 4);
INSERT INTO `oa_supply_bususiness` VALUES ('C89F8049E9E000014F461F0014E0E430', 3, '车网联盟', '15079437282', '小章', '10086', '4512121244', '199212', '上海', '2019-10-03 09:55:38', '管理员', 2);
INSERT INTO `oa_supply_bususiness` VALUES ('C89F860FDAC0000188FB113414D911CB', 4, '昆明广轮源', '15079437282', '小李', '10086', '4512121244', '199212', '上海', '2019-10-03 11:36:32', '管理员', 1);
INSERT INTO `oa_supply_bususiness` VALUES ('C89F8772E8500001E7F2A76C16704800', 5, '宝乐商贸', '15079437282', '小王', '10086', '4512121244', '199212', '上海', '2019-10-03 12:00:46', '管理员', 2);
INSERT INTO `oa_supply_bususiness` VALUES ('C89F8A38D1E00001F6CD141012201D00', 6, '百壮轮胎', '15079437282', '老王', '10086', '4512121244', '199212', '上海', '2019-10-03 12:49:14', '管理员', 2);
INSERT INTO `oa_supply_bususiness` VALUES ('C89F8A63A3700001933E129B91301881', 7, '驰奔达', '15079437282', '小孙', '10086', '4512121244', '199212', '上海', '2019-10-03 12:52:09', '管理员', 3);
INSERT INTO `oa_supply_bususiness` VALUES ('C89F936B171000011A401DD334751ACB', 8, '昆明奔德乐', '15079437282', '大炮', '10086', '4512121244', '199212', '上海', '2019-10-03 15:29:57', '管理员', 2);
INSERT INTO `oa_supply_bususiness` VALUES ('C89FA0DF3F5000013147F9D01EAD77D0', 9, '正新玛吉斯', '15079437282', '小毛', '10086', '4512121244', '199212', '上海', '2019-10-03 19:25:04', '管理员', 2);
INSERT INTO `oa_supply_bususiness` VALUES ('C89FA0EF86D00001FDC4D13B1F441A99', 10, '小张车行', '15079437282', '小天', '10086', '4512121244', '199212', '上海', '2019-10-03 19:26:11', '管理员', 3);

-- ----------------------------
-- Table structure for oa_unit
-- ----------------------------
DROP TABLE IF EXISTS `oa_unit`;
CREATE TABLE `oa_unit`  (
  `fid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `creator` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oa_unit
-- ----------------------------
INSERT INTO `oa_unit` VALUES ('2096FB2F6C4A4ABC861ADC58AAA02C3F', '瓶', '2019-11-02 10:16:03', '超级管理员');
INSERT INTO `oa_unit` VALUES ('49D643A359E64E6297DCC947F1BA08AF', '包', '2019-11-03 10:49:26', '超级管理员');
INSERT INTO `oa_unit` VALUES ('5C93FD6B19AE4D93866167ECDA37B97A', '辆', '2019-11-02 10:16:16', '超级管理员');
INSERT INTO `oa_unit` VALUES ('606F2F7FCE734E9C9D934389434891D4', '台', '2019-11-03 10:49:21', '超级管理员');
INSERT INTO `oa_unit` VALUES ('68789115C3654674AD3787A6047E0B6B', '盒', '2019-11-03 10:49:34', '超级管理员');
INSERT INTO `oa_unit` VALUES ('83805A510A8E4B7AB042247805FC1242', '条', '2019-11-03 10:49:12', '超级管理员');
INSERT INTO `oa_unit` VALUES ('EF646038CDFB44F5BCEB39A7F1801548', '把', '2019-11-03 10:49:16', '超级管理员');
INSERT INTO `oa_unit` VALUES ('fsdafdasf', '箱', '2019-11-02 18:02:03', 'system');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  `ordernum` int(11) NULL DEFAULT NULL COMMENT '排序码【为了调事显示顺序】',
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, 0, '总部', 1, 'Coderman', '深圳', 0, 1, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (2, 1, '销售部', 1, '程序员屌丝', '武汉', 1, 2, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (3, 1, '运营部', 1, 'pppppppp', '广东', 1, 3, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (4, 1, '生产部', 0, 'lalalalalal', '武汉', 1, 4, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (5, 2, '销售一部', 0, '销售一部', '武汉', 1, 5, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (6, 2, '销售二部', 0, '销售二部', '武汉', 1, 6, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (7, 3, '运营一部', 0, '运营一部', '武汉', 1, 7, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (8, 2, '销售三部', 0, '销售三部', '重庆', 1, 8, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (9, 2, '销售四部', 0, '销售四部', '江西', 1, 9, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (10, 2, '销售五部', 0, '销售五部', '青海', 1, 10, '2019-04-10 14:06:32');
INSERT INTO `sys_dept` VALUES (18, 4, '生产一部', 0, '生产食品', '武汉', 1, 11, '2019-04-13 09:49:38');
INSERT INTO `sys_dept` VALUES (20, 3, '运营二部', 0, '勾搭客户~', '河北', 0, 12, '2019-10-27 11:01:59');
INSERT INTO `sys_dept` VALUES (22, 4, '生产二部', 0, '生产鞋子', '江西', 1, 13, '2019-10-27 11:22:45');
INSERT INTO `sys_dept` VALUES (23, 4, '生产三部', 0, '生产美女', '重庆', 1, 14, '2019-10-27 11:23:42');
INSERT INTO `sys_dept` VALUES (38, 1, '测试部', 1, '开发时候用来测试的部门', '共青城', 1, 22, '2019-10-29 10:15:24');
INSERT INTO `sys_dept` VALUES (39, 38, '美女', 1, '美女', '东莞', 1, 23, '2019-10-29 10:16:20');
INSERT INTO `sys_dept` VALUES (40, 38, '帅哥', 1, '帅哥', '江西', 1, 24, '2019-10-29 10:16:48');

-- ----------------------------
-- Table structure for sys_image
-- ----------------------------
DROP TABLE IF EXISTS `sys_image`;
CREATE TABLE `sys_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `gmt_create` bigint(20) NULL DEFAULT NULL,
  `gmt_modified` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_image
-- ----------------------------
INSERT INTO `sys_image` VALUES (17, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', 1572510917330, 1572510917330, '超级管理员');
INSERT INTO `sys_image` VALUES (18, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (19, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (20, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (21, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (22, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (23, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (24, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (25, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (26, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (27, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (28, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (29, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (30, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (31, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (32, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (33, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (34, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (35, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (36, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (37, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (38, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (39, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (40, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (41, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (42, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (43, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (44, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (45, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (46, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (47, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (48, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15725105859129671d08d-7e93-43d3-a119-bb86d5e911e5u%3D517936985%2C3506678543%26fm%3D26%26gp%3D0.jpgfa738226-759b-47d5-b139-916ceedfa6fdu%3D2846001291%2C2079543271%26fm%3D11%26gp%3D0.jpgcc18f9b1-b553-4d12-862e-f5af1ff3460estring.PNG2063126a-b687-42ec-aad7-5af96280a1cf47490129.jpg88547026-77fb-40f6-853f-6bb584d16bbcf.PNG98f51130-664c-4ffb-8fe1-dd3ba0580cb4fdsafdasfadsf.jpg7850e06d-4857-41d2-bfe9-5f673d96a559fdf.PNG1d158cd7-083e-4f3a-8e64-4d9caf8db2bdQQ%E5%9B%BE%E7%89%8720191015124850.gif80c7cb34-e9c8-49e2-8b0c-b6d3a521168eb.PNGc2a58603-3e1b-4946-bac2-193970d7c5f6%E9%93%BE%E8%A1%A8%E7%9A%84%E6%8F%92%E5%85%A5%E7%AE%97%E6%B3%95.PNG4d82adc8-5687-4402-b073-bb9e9d00cd2c%E9%93%BE%E8%A1%A8%E7%9A%84%E5%88%9B%E5%BB%BA.PNG51cab42a-8e4c-4f8f-936f-73aed0552574QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667118917&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=QyS1%2FfagrKxnx8IERDNqApl4Bq4%3D', NULL, NULL, NULL);
INSERT INTO `sys_image` VALUES (49, 'http://coderman.oss-cn-beijing.aliyuncs.com/changku/images/15730183642705ac2eb4f-359c-4e69-b99a-b16323cb6d84QQ%E5%9B%BE%E7%89%8720191015124850.gif?Expires=1667626745&OSSAccessKeyId=LTAI6EW8bTwlXoZD&Signature=3jAiKgrbDVL6B9iRZTF%2FFW8i3%2Fs%3D', 1573018745988, 1573018745988, '超级管理员');

-- ----------------------------
-- Table structure for sys_login_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_info`;
CREATE TABLE `sys_login_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime(0) NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 846 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_login_info
-- ----------------------------
INSERT INTO `sys_login_info` VALUES (6, '超级管理员-system', '127.0.0.1', '2018-12-22 09:20:43', NULL);
INSERT INTO `sys_login_info` VALUES (7, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (8, '超级管理员-system', '127.0.0.2', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (9, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (10, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (11, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (12, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (13, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (14, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (15, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (16, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (17, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (18, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (19, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (20, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (21, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (22, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (23, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (24, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (25, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (26, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (27, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (28, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (29, '超级管理员-system', '127.0.0.1', '2019-10-23 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (30, '超级管理员-system', '127.0.0.1', '2018-12-24 10:00:26', NULL);
INSERT INTO `sys_login_info` VALUES (31, '超级管理员-system', '127.0.0.1', '2018-12-24 10:10:58', NULL);
INSERT INTO `sys_login_info` VALUES (32, '超级管理员-system', '127.0.0.1', '2018-12-24 10:21:28', NULL);
INSERT INTO `sys_login_info` VALUES (33, '超级管理员-system', '127.0.0.1', '2018-12-24 11:22:27', NULL);
INSERT INTO `sys_login_info` VALUES (34, '超级管理员-system', '127.0.0.1', '2018-12-24 11:35:28', NULL);
INSERT INTO `sys_login_info` VALUES (35, '超级管理员-system', '127.0.0.1', '2018-12-24 14:05:28', NULL);
INSERT INTO `sys_login_info` VALUES (36, '超级管理员-system', '127.0.0.1', '2018-12-24 15:16:29', NULL);
INSERT INTO `sys_login_info` VALUES (37, '李四-ls', '127.0.0.1', '2018-12-24 15:16:50', NULL);
INSERT INTO `sys_login_info` VALUES (38, '王五-ww', '127.0.0.1', '2018-12-24 15:17:36', NULL);
INSERT INTO `sys_login_info` VALUES (39, '赵六-zl', '127.0.0.1', '2018-12-24 15:17:47', NULL);
INSERT INTO `sys_login_info` VALUES (40, '孙七-sq', '127.0.0.1', '2018-12-24 15:17:58', NULL);
INSERT INTO `sys_login_info` VALUES (41, '刘八-lb', '127.0.0.1', '2018-12-24 15:18:09', NULL);
INSERT INTO `sys_login_info` VALUES (42, '超级管理员-system', '127.0.0.1', '2018-12-24 15:34:59', NULL);
INSERT INTO `sys_login_info` VALUES (43, '超级管理员-system', '127.0.0.1', '2018-12-24 15:35:09', NULL);
INSERT INTO `sys_login_info` VALUES (44, '刘八-lb', '127.0.0.1', '2018-12-24 15:36:09', NULL);
INSERT INTO `sys_login_info` VALUES (45, '刘八-lb', '127.0.0.1', '2018-12-24 15:42:58', NULL);
INSERT INTO `sys_login_info` VALUES (46, '刘八-lb', '127.0.0.1', '2018-12-24 15:43:04', NULL);
INSERT INTO `sys_login_info` VALUES (48, '超级管理员-system', '127.0.0.1', '2018-12-24 17:03:54', NULL);
INSERT INTO `sys_login_info` VALUES (50, '超级管理员-system', '127.0.0.1', '2018-12-25 09:07:42', NULL);
INSERT INTO `sys_login_info` VALUES (51, '超级管理员-system', '127.0.0.1', '2018-12-25 09:16:27', NULL);
INSERT INTO `sys_login_info` VALUES (52, '超级管理员-system', '127.0.0.1', '2018-12-25 09:59:03', NULL);
INSERT INTO `sys_login_info` VALUES (53, '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:13', NULL);
INSERT INTO `sys_login_info` VALUES (54, '超级管理员-system', '127.0.0.1', '2018-12-25 10:05:47', NULL);
INSERT INTO `sys_login_info` VALUES (55, '超级管理员-system', '127.0.0.1', '2018-12-25 10:11:17', NULL);
INSERT INTO `sys_login_info` VALUES (56, '超级管理员-system', '127.0.0.1', '2018-12-25 10:14:06', NULL);
INSERT INTO `sys_login_info` VALUES (57, '超级管理员-system', '127.0.0.1', '2018-12-25 10:36:16', NULL);
INSERT INTO `sys_login_info` VALUES (58, '超级管理员-system', '127.0.0.1', '2018-12-25 14:17:21', NULL);
INSERT INTO `sys_login_info` VALUES (59, '超级管理员-system', '127.0.0.1', '2018-12-25 14:20:00', NULL);
INSERT INTO `sys_login_info` VALUES (60, '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:22', NULL);
INSERT INTO `sys_login_info` VALUES (61, '超级管理员-system', '127.0.0.1', '2018-12-25 14:34:27', NULL);
INSERT INTO `sys_login_info` VALUES (62, '超级管理员-system', '127.0.0.1', '2018-12-25 14:38:37', NULL);
INSERT INTO `sys_login_info` VALUES (63, '超级管理员-system', '127.0.0.1', '2018-12-25 14:50:37', NULL);
INSERT INTO `sys_login_info` VALUES (64, '超级管理员-system', '127.0.0.1', '2018-12-25 16:01:35', NULL);
INSERT INTO `sys_login_info` VALUES (65, '超级管理员-system', '127.0.0.1', '2018-12-25 16:25:28', NULL);
INSERT INTO `sys_login_info` VALUES (66, '超级管理员-system', '127.0.0.1', '2018-12-25 16:27:37', NULL);
INSERT INTO `sys_login_info` VALUES (67, '超级管理员-system', '127.0.0.1', '2018-12-25 16:28:28', NULL);
INSERT INTO `sys_login_info` VALUES (68, '超级管理员-system', '127.0.0.1', '2018-12-25 16:44:02', NULL);
INSERT INTO `sys_login_info` VALUES (69, '超级管理员-system', '127.0.0.1', '2018-12-25 16:47:55', NULL);
INSERT INTO `sys_login_info` VALUES (70, '超级管理员-system', '127.0.0.1', '2018-12-28 15:59:34', NULL);
INSERT INTO `sys_login_info` VALUES (71, '超级管理员-system', '127.0.0.1', '2018-12-28 17:27:16', NULL);
INSERT INTO `sys_login_info` VALUES (72, '超级管理员-system', '127.0.0.1', '2018-12-28 17:29:40', NULL);
INSERT INTO `sys_login_info` VALUES (73, '超级管理员-system', '127.0.0.1', '2018-12-28 17:51:10', NULL);
INSERT INTO `sys_login_info` VALUES (74, '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:02', NULL);
INSERT INTO `sys_login_info` VALUES (75, '超级管理员-system', '127.0.0.1', '2019-04-15 17:05:12', NULL);
INSERT INTO `sys_login_info` VALUES (76, '超级管理员-system', '127.0.0.1', '2019-04-15 17:10:22', NULL);
INSERT INTO `sys_login_info` VALUES (77, '刘八-lb', '127.0.0.1', '2019-04-15 17:11:45', NULL);
INSERT INTO `sys_login_info` VALUES (78, '刘八-lb', '127.0.0.1', '2019-04-15 17:28:50', NULL);
INSERT INTO `sys_login_info` VALUES (79, '超级管理员-system', '127.0.0.1', '2019-04-15 17:29:13', NULL);
INSERT INTO `sys_login_info` VALUES (80, '刘八-lb', '127.0.0.1', '2019-04-15 17:30:59', NULL);
INSERT INTO `sys_login_info` VALUES (81, '刘八-lb', '127.0.0.1', '2019-04-15 17:32:42', NULL);
INSERT INTO `sys_login_info` VALUES (82, '刘八-lb', '127.0.0.1', '2019-04-15 17:33:48', NULL);
INSERT INTO `sys_login_info` VALUES (83, '刘八-lb', '127.0.0.1', '2019-04-15 17:34:17', NULL);
INSERT INTO `sys_login_info` VALUES (84, '超级管理员-system', '127.0.0.1', '2019-04-15 17:36:40', NULL);
INSERT INTO `sys_login_info` VALUES (85, '超级管理员-system', '127.0.0.1', '2019-04-15 17:47:21', NULL);
INSERT INTO `sys_login_info` VALUES (86, '超级管理员-system', '127.0.0.1', '2019-04-15 17:54:10', NULL);
INSERT INTO `sys_login_info` VALUES (87, '超级管理员-system', '127.0.0.1', '2019-04-15 17:55:52', NULL);
INSERT INTO `sys_login_info` VALUES (88, '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:01', NULL);
INSERT INTO `sys_login_info` VALUES (89, '超级管理员-system', '127.0.0.1', '2019-04-16 09:26:25', NULL);
INSERT INTO `sys_login_info` VALUES (90, '超级管理员-system', '127.0.0.1', '2019-04-16 09:46:54', NULL);
INSERT INTO `sys_login_info` VALUES (91, '超级管理员-system', '127.0.0.1', '2019-04-16 10:07:48', NULL);
INSERT INTO `sys_login_info` VALUES (92, '超级管理员-system', '127.0.0.1', '2019-04-16 10:10:30', NULL);
INSERT INTO `sys_login_info` VALUES (93, '超级管理员-system', '127.0.0.1', '2019-04-16 10:14:29', NULL);
INSERT INTO `sys_login_info` VALUES (94, '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:04', NULL);
INSERT INTO `sys_login_info` VALUES (95, '超级管理员-system', '127.0.0.1', '2019-04-16 10:15:58', NULL);
INSERT INTO `sys_login_info` VALUES (96, '超级管理员-system', '127.0.0.1', '2019-04-16 10:28:14', NULL);
INSERT INTO `sys_login_info` VALUES (97, '超级管理员-system', '127.0.0.1', '2019-04-16 10:32:42', NULL);
INSERT INTO `sys_login_info` VALUES (98, '超级管理员-system', '127.0.0.1', '2019-04-16 10:33:03', NULL);
INSERT INTO `sys_login_info` VALUES (100, '超级管理员-system', '127.0.0.1', '2019-04-16 11:03:09', NULL);
INSERT INTO `sys_login_info` VALUES (101, '超级管理员-system', '127.0.0.1', '2019-04-16 11:13:42', NULL);
INSERT INTO `sys_login_info` VALUES (102, '超级管理员-system', '127.0.0.1', '2019-04-16 11:24:55', NULL);
INSERT INTO `sys_login_info` VALUES (104, '超级管理员-system', '127.0.0.1', '2019-08-14 01:11:34', NULL);
INSERT INTO `sys_login_info` VALUES (105, '超级管理员-system', '127.0.0.1', '2019-08-14 01:24:03', NULL);
INSERT INTO `sys_login_info` VALUES (106, '李四-ls', '127.0.0.1', '2019-10-23 01:25:47', NULL);
INSERT INTO `sys_login_info` VALUES (107, '李四-ls', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (108, '孙七-sq', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (109, '刘八-lb', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (110, '超级管理员-system', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (111, '超级管理员-system', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (112, '超级管理员-system', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (113, '李四-ls', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (114, '李四-ls', '127.0.0.1', '2019-10-24 02:18:44', NULL);
INSERT INTO `sys_login_info` VALUES (115, '李四-ls', '127.0.0.1', '2019-08-14 03:01:31', NULL);
INSERT INTO `sys_login_info` VALUES (116, '李四-ls', '127.0.0.1', '2019-10-20 03:01:39', NULL);
INSERT INTO `sys_login_info` VALUES (117, '李四-ls', '127.0.0.1', '2019-10-21 03:02:25', NULL);
INSERT INTO `sys_login_info` VALUES (118, '李四-ls', '127.0.0.1', '2019-10-22 03:04:57', NULL);
INSERT INTO `sys_login_info` VALUES (119, '李四-ls', '127.0.0.1', '2019-10-23 03:07:19', NULL);
INSERT INTO `sys_login_info` VALUES (120, '李四-ls', '127.0.0.1', '2019-10-24 03:07:54', NULL);
INSERT INTO `sys_login_info` VALUES (122, '李四-ls', '127.0.0.1', '2019-10-25 03:14:46', NULL);
INSERT INTO `sys_login_info` VALUES (202, '赵六-超级管理员', '0:0:0:0:0:0:0:1', '2019-10-26 11:55:51', NULL);
INSERT INTO `sys_login_info` VALUES (205, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 12:03:14', NULL);
INSERT INTO `sys_login_info` VALUES (206, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 12:25:15', NULL);
INSERT INTO `sys_login_info` VALUES (207, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 12:37:45', NULL);
INSERT INTO `sys_login_info` VALUES (208, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 12:38:42', NULL);
INSERT INTO `sys_login_info` VALUES (209, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 12:38:56', NULL);
INSERT INTO `sys_login_info` VALUES (210, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 12:39:25', NULL);
INSERT INTO `sys_login_info` VALUES (211, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 13:40:43', NULL);
INSERT INTO `sys_login_info` VALUES (212, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 14:16:35', NULL);
INSERT INTO `sys_login_info` VALUES (213, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 14:19:40', NULL);
INSERT INTO `sys_login_info` VALUES (214, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:02:22', NULL);
INSERT INTO `sys_login_info` VALUES (215, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:03:13', NULL);
INSERT INTO `sys_login_info` VALUES (216, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:04:24', NULL);
INSERT INTO `sys_login_info` VALUES (217, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:10:21', NULL);
INSERT INTO `sys_login_info` VALUES (218, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:11:47', NULL);
INSERT INTO `sys_login_info` VALUES (219, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:13:17', NULL);
INSERT INTO `sys_login_info` VALUES (220, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:22:15', NULL);
INSERT INTO `sys_login_info` VALUES (221, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:22:43', NULL);
INSERT INTO `sys_login_info` VALUES (222, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:24:16', NULL);
INSERT INTO `sys_login_info` VALUES (223, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:24:43', NULL);
INSERT INTO `sys_login_info` VALUES (224, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:25:23', NULL);
INSERT INTO `sys_login_info` VALUES (225, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:35:48', NULL);
INSERT INTO `sys_login_info` VALUES (226, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-26 15:39:23', NULL);
INSERT INTO `sys_login_info` VALUES (227, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 01:52:47', NULL);
INSERT INTO `sys_login_info` VALUES (228, '章宇康-系统深处的男人', '127.0.0.1', '2019-10-27 02:24:38', NULL);
INSERT INTO `sys_login_info` VALUES (229, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 02:24:55', NULL);
INSERT INTO `sys_login_info` VALUES (230, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 02:43:01', NULL);
INSERT INTO `sys_login_info` VALUES (231, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 03:09:44', NULL);
INSERT INTO `sys_login_info` VALUES (232, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 03:11:57', NULL);
INSERT INTO `sys_login_info` VALUES (233, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 03:46:31', NULL);
INSERT INTO `sys_login_info` VALUES (235, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 03:52:36', NULL);
INSERT INTO `sys_login_info` VALUES (236, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 04:02:17', NULL);
INSERT INTO `sys_login_info` VALUES (237, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 05:20:23', NULL);
INSERT INTO `sys_login_info` VALUES (238, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 05:27:46', NULL);
INSERT INTO `sys_login_info` VALUES (239, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 06:36:31', NULL);
INSERT INTO `sys_login_info` VALUES (240, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 07:26:45', NULL);
INSERT INTO `sys_login_info` VALUES (241, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 07:27:32', NULL);
INSERT INTO `sys_login_info` VALUES (242, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 07:41:51', NULL);
INSERT INTO `sys_login_info` VALUES (243, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 07:44:56', NULL);
INSERT INTO `sys_login_info` VALUES (244, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 07:48:07', NULL);
INSERT INTO `sys_login_info` VALUES (245, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 07:51:04', NULL);
INSERT INTO `sys_login_info` VALUES (246, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 08:07:48', NULL);
INSERT INTO `sys_login_info` VALUES (247, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 08:20:41', NULL);
INSERT INTO `sys_login_info` VALUES (248, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 09:43:35', NULL);
INSERT INTO `sys_login_info` VALUES (249, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 10:24:30', NULL);
INSERT INTO `sys_login_info` VALUES (250, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 10:25:49', NULL);
INSERT INTO `sys_login_info` VALUES (251, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 10:33:38', NULL);
INSERT INTO `sys_login_info` VALUES (252, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 10:46:28', NULL);
INSERT INTO `sys_login_info` VALUES (253, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 10:49:43', NULL);
INSERT INTO `sys_login_info` VALUES (254, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 10:55:46', NULL);
INSERT INTO `sys_login_info` VALUES (255, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:06:11', NULL);
INSERT INTO `sys_login_info` VALUES (256, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:25:38', NULL);
INSERT INTO `sys_login_info` VALUES (257, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:27:00', NULL);
INSERT INTO `sys_login_info` VALUES (258, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:39:24', NULL);
INSERT INTO `sys_login_info` VALUES (259, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:44:29', NULL);
INSERT INTO `sys_login_info` VALUES (260, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:45:40', NULL);
INSERT INTO `sys_login_info` VALUES (261, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:49:47', NULL);
INSERT INTO `sys_login_info` VALUES (262, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:53:06', NULL);
INSERT INTO `sys_login_info` VALUES (263, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 11:54:39', NULL);
INSERT INTO `sys_login_info` VALUES (264, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 12:07:53', NULL);
INSERT INTO `sys_login_info` VALUES (265, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 12:13:00', NULL);
INSERT INTO `sys_login_info` VALUES (266, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 12:49:11', NULL);
INSERT INTO `sys_login_info` VALUES (267, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 13:22:37', NULL);
INSERT INTO `sys_login_info` VALUES (268, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 13:23:36', NULL);
INSERT INTO `sys_login_info` VALUES (269, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 13:48:27', NULL);
INSERT INTO `sys_login_info` VALUES (270, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:03:17', NULL);
INSERT INTO `sys_login_info` VALUES (271, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:04:15', NULL);
INSERT INTO `sys_login_info` VALUES (272, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:06:45', NULL);
INSERT INTO `sys_login_info` VALUES (273, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:10:00', NULL);
INSERT INTO `sys_login_info` VALUES (274, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:13:03', NULL);
INSERT INTO `sys_login_info` VALUES (275, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:15:00', NULL);
INSERT INTO `sys_login_info` VALUES (276, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:19:24', NULL);
INSERT INTO `sys_login_info` VALUES (277, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:26:26', NULL);
INSERT INTO `sys_login_info` VALUES (278, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:27:45', NULL);
INSERT INTO `sys_login_info` VALUES (279, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:28:32', NULL);
INSERT INTO `sys_login_info` VALUES (280, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:33:44', NULL);
INSERT INTO `sys_login_info` VALUES (281, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:35:05', NULL);
INSERT INTO `sys_login_info` VALUES (282, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:36:39', NULL);
INSERT INTO `sys_login_info` VALUES (283, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:39:13', NULL);
INSERT INTO `sys_login_info` VALUES (284, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-27 14:45:07', NULL);
INSERT INTO `sys_login_info` VALUES (285, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:17:18', NULL);
INSERT INTO `sys_login_info` VALUES (286, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:33:11', NULL);
INSERT INTO `sys_login_info` VALUES (287, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:35:41', NULL);
INSERT INTO `sys_login_info` VALUES (288, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:40:03', NULL);
INSERT INTO `sys_login_info` VALUES (289, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:40:48', NULL);
INSERT INTO `sys_login_info` VALUES (290, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:43:18', NULL);
INSERT INTO `sys_login_info` VALUES (291, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:44:34', NULL);
INSERT INTO `sys_login_info` VALUES (292, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:46:10', NULL);
INSERT INTO `sys_login_info` VALUES (293, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:47:24', NULL);
INSERT INTO `sys_login_info` VALUES (294, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:48:41', NULL);
INSERT INTO `sys_login_info` VALUES (295, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 02:55:42', NULL);
INSERT INTO `sys_login_info` VALUES (296, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:00:55', NULL);
INSERT INTO `sys_login_info` VALUES (297, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:03:34', NULL);
INSERT INTO `sys_login_info` VALUES (298, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:06:43', NULL);
INSERT INTO `sys_login_info` VALUES (299, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:07:37', NULL);
INSERT INTO `sys_login_info` VALUES (300, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:08:54', NULL);
INSERT INTO `sys_login_info` VALUES (301, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:20:17', NULL);
INSERT INTO `sys_login_info` VALUES (302, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:22:29', NULL);
INSERT INTO `sys_login_info` VALUES (303, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:27:44', NULL);
INSERT INTO `sys_login_info` VALUES (304, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:37:10', NULL);
INSERT INTO `sys_login_info` VALUES (305, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:39:41', NULL);
INSERT INTO `sys_login_info` VALUES (306, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:40:41', NULL);
INSERT INTO `sys_login_info` VALUES (307, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:46:17', NULL);
INSERT INTO `sys_login_info` VALUES (308, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:52:55', NULL);
INSERT INTO `sys_login_info` VALUES (309, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:54:53', NULL);
INSERT INTO `sys_login_info` VALUES (310, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 03:58:50', NULL);
INSERT INTO `sys_login_info` VALUES (311, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 04:24:31', NULL);
INSERT INTO `sys_login_info` VALUES (312, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 04:31:53', NULL);
INSERT INTO `sys_login_info` VALUES (313, '李四-justin', '127.0.0.1', '2019-10-28 04:45:37', NULL);
INSERT INTO `sys_login_info` VALUES (314, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 04:48:38', NULL);
INSERT INTO `sys_login_info` VALUES (315, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 05:02:40', NULL);
INSERT INTO `sys_login_info` VALUES (316, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 05:09:27', NULL);
INSERT INTO `sys_login_info` VALUES (317, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 07:30:46', NULL);
INSERT INTO `sys_login_info` VALUES (318, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 07:39:30', NULL);
INSERT INTO `sys_login_info` VALUES (319, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 07:42:50', NULL);
INSERT INTO `sys_login_info` VALUES (320, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 07:43:41', NULL);
INSERT INTO `sys_login_info` VALUES (321, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:11:14', NULL);
INSERT INTO `sys_login_info` VALUES (322, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:13:05', NULL);
INSERT INTO `sys_login_info` VALUES (323, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:21:54', NULL);
INSERT INTO `sys_login_info` VALUES (324, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:25:40', NULL);
INSERT INTO `sys_login_info` VALUES (325, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:35:11', NULL);
INSERT INTO `sys_login_info` VALUES (326, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:37:08', NULL);
INSERT INTO `sys_login_info` VALUES (327, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:39:56', NULL);
INSERT INTO `sys_login_info` VALUES (328, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:42:43', NULL);
INSERT INTO `sys_login_info` VALUES (329, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:52:10', NULL);
INSERT INTO `sys_login_info` VALUES (330, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 08:55:02', NULL);
INSERT INTO `sys_login_info` VALUES (331, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:00:47', NULL);
INSERT INTO `sys_login_info` VALUES (332, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:35:31', NULL);
INSERT INTO `sys_login_info` VALUES (333, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:37:22', NULL);
INSERT INTO `sys_login_info` VALUES (334, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:38:51', NULL);
INSERT INTO `sys_login_info` VALUES (335, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:44:19', NULL);
INSERT INTO `sys_login_info` VALUES (336, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:46:01', NULL);
INSERT INTO `sys_login_info` VALUES (337, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:47:09', NULL);
INSERT INTO `sys_login_info` VALUES (338, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:50:06', NULL);
INSERT INTO `sys_login_info` VALUES (339, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:52:37', NULL);
INSERT INTO `sys_login_info` VALUES (340, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 09:58:05', NULL);
INSERT INTO `sys_login_info` VALUES (341, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 10:02:44', NULL);
INSERT INTO `sys_login_info` VALUES (342, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 10:14:37', NULL);
INSERT INTO `sys_login_info` VALUES (343, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 11:21:41', NULL);
INSERT INTO `sys_login_info` VALUES (344, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 11:22:36', NULL);
INSERT INTO `sys_login_info` VALUES (345, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 11:28:30', NULL);
INSERT INTO `sys_login_info` VALUES (346, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 11:29:08', NULL);
INSERT INTO `sys_login_info` VALUES (347, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 11:58:05', NULL);
INSERT INTO `sys_login_info` VALUES (348, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:06:08', NULL);
INSERT INTO `sys_login_info` VALUES (349, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:08:30', NULL);
INSERT INTO `sys_login_info` VALUES (350, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:12:05', NULL);
INSERT INTO `sys_login_info` VALUES (351, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:14:27', NULL);
INSERT INTO `sys_login_info` VALUES (352, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:15:40', NULL);
INSERT INTO `sys_login_info` VALUES (353, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:17:51', NULL);
INSERT INTO `sys_login_info` VALUES (354, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:46:28', NULL);
INSERT INTO `sys_login_info` VALUES (355, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 12:47:26', NULL);
INSERT INTO `sys_login_info` VALUES (356, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 13:09:21', NULL);
INSERT INTO `sys_login_info` VALUES (357, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 14:02:42', NULL);
INSERT INTO `sys_login_info` VALUES (358, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 14:04:17', NULL);
INSERT INTO `sys_login_info` VALUES (359, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 14:05:11', NULL);
INSERT INTO `sys_login_info` VALUES (360, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 14:06:42', NULL);
INSERT INTO `sys_login_info` VALUES (361, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 14:45:03', NULL);
INSERT INTO `sys_login_info` VALUES (362, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 14:56:12', NULL);
INSERT INTO `sys_login_info` VALUES (363, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 15:00:38', NULL);
INSERT INTO `sys_login_info` VALUES (364, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 15:01:16', NULL);
INSERT INTO `sys_login_info` VALUES (365, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-28 15:04:00', NULL);
INSERT INTO `sys_login_info` VALUES (366, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:17:51', NULL);
INSERT INTO `sys_login_info` VALUES (367, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:42:36', NULL);
INSERT INTO `sys_login_info` VALUES (368, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:45:20', NULL);
INSERT INTO `sys_login_info` VALUES (369, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:46:35', NULL);
INSERT INTO `sys_login_info` VALUES (370, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:48:24', NULL);
INSERT INTO `sys_login_info` VALUES (371, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:51:16', NULL);
INSERT INTO `sys_login_info` VALUES (372, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:52:25', NULL);
INSERT INTO `sys_login_info` VALUES (373, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:55:42', NULL);
INSERT INTO `sys_login_info` VALUES (374, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:57:03', NULL);
INSERT INTO `sys_login_info` VALUES (375, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 02:59:43', NULL);
INSERT INTO `sys_login_info` VALUES (376, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:00:30', NULL);
INSERT INTO `sys_login_info` VALUES (377, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:01:50', NULL);
INSERT INTO `sys_login_info` VALUES (378, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:02:56', NULL);
INSERT INTO `sys_login_info` VALUES (379, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:05:58', NULL);
INSERT INTO `sys_login_info` VALUES (380, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:08:56', NULL);
INSERT INTO `sys_login_info` VALUES (381, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:10:07', NULL);
INSERT INTO `sys_login_info` VALUES (382, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:12:54', NULL);
INSERT INTO `sys_login_info` VALUES (383, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:15:41', NULL);
INSERT INTO `sys_login_info` VALUES (384, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:17:55', NULL);
INSERT INTO `sys_login_info` VALUES (385, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:21:16', NULL);
INSERT INTO `sys_login_info` VALUES (386, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:23:05', NULL);
INSERT INTO `sys_login_info` VALUES (387, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:25:41', NULL);
INSERT INTO `sys_login_info` VALUES (388, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:27:44', NULL);
INSERT INTO `sys_login_info` VALUES (389, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:31:52', NULL);
INSERT INTO `sys_login_info` VALUES (390, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:32:57', NULL);
INSERT INTO `sys_login_info` VALUES (391, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:47:01', NULL);
INSERT INTO `sys_login_info` VALUES (392, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 03:49:51', NULL);
INSERT INTO `sys_login_info` VALUES (393, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 04:25:38', NULL);
INSERT INTO `sys_login_info` VALUES (394, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 06:39:41', NULL);
INSERT INTO `sys_login_info` VALUES (395, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 07:14:05', NULL);
INSERT INTO `sys_login_info` VALUES (396, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 07:27:42', NULL);
INSERT INTO `sys_login_info` VALUES (397, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 07:29:06', NULL);
INSERT INTO `sys_login_info` VALUES (398, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 07:32:10', NULL);
INSERT INTO `sys_login_info` VALUES (399, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 08:52:29', NULL);
INSERT INTO `sys_login_info` VALUES (400, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 08:57:29', NULL);
INSERT INTO `sys_login_info` VALUES (401, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 09:06:50', NULL);
INSERT INTO `sys_login_info` VALUES (402, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 09:47:43', NULL);
INSERT INTO `sys_login_info` VALUES (403, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 09:55:24', NULL);
INSERT INTO `sys_login_info` VALUES (404, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 09:58:08', NULL);
INSERT INTO `sys_login_info` VALUES (405, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 10:20:24', NULL);
INSERT INTO `sys_login_info` VALUES (406, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 11:35:39', NULL);
INSERT INTO `sys_login_info` VALUES (407, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 11:39:27', '本机IP');
INSERT INTO `sys_login_info` VALUES (409, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 11:45:54', '本机IP');
INSERT INTO `sys_login_info` VALUES (410, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 11:54:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (411, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 11:58:37', '本机IP');
INSERT INTO `sys_login_info` VALUES (412, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 11:59:50', '本机IP');
INSERT INTO `sys_login_info` VALUES (413, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 12:04:01', '本机IP');
INSERT INTO `sys_login_info` VALUES (414, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 12:21:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (415, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 12:31:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (416, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 12:35:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (417, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 12:40:45', '本机IP');
INSERT INTO `sys_login_info` VALUES (418, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 12:59:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (419, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 13:19:50', '本机IP');
INSERT INTO `sys_login_info` VALUES (420, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 13:44:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (421, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 13:54:06', '本机IP');
INSERT INTO `sys_login_info` VALUES (422, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:03:00', '本机IP');
INSERT INTO `sys_login_info` VALUES (423, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:05:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (424, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:07:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (425, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:22:30', '本机IP');
INSERT INTO `sys_login_info` VALUES (426, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:26:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (427, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:28:05', '本机IP');
INSERT INTO `sys_login_info` VALUES (428, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:30:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (429, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 14:31:00', '本机IP');
INSERT INTO `sys_login_info` VALUES (430, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 14:32:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (431, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 14:35:26', '本机IP');
INSERT INTO `sys_login_info` VALUES (432, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 14:42:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (433, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 14:44:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (434, '王祖贤-wangzhuxian', '0:0:0:0:0:0:0:1', '2019-10-29 14:46:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (435, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:47:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (436, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:50:34', '本机IP');
INSERT INTO `sys_login_info` VALUES (437, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:56:50', '本机IP');
INSERT INTO `sys_login_info` VALUES (438, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 14:58:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (439, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 15:03:13', '本机IP');
INSERT INTO `sys_login_info` VALUES (440, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 15:05:25', '本机IP');
INSERT INTO `sys_login_info` VALUES (441, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 15:06:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (442, '林俊杰-linjunjie', '0:0:0:0:0:0:0:1', '2019-10-29 15:07:32', '本机IP');
INSERT INTO `sys_login_info` VALUES (443, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-29 15:07:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (444, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 02:20:05', '本机IP');
INSERT INTO `sys_login_info` VALUES (445, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:20:35', '本机IP');
INSERT INTO `sys_login_info` VALUES (446, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:23:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (447, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 02:23:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (448, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:23:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (449, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:34:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (450, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:37:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (451, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:56:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (452, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 02:59:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (453, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:02:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (454, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:04:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (455, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:05:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (456, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:11:01', '本机IP');
INSERT INTO `sys_login_info` VALUES (457, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:11:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (458, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:11:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (459, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:14:37', '本机IP');
INSERT INTO `sys_login_info` VALUES (460, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:15:37', '本机IP');
INSERT INTO `sys_login_info` VALUES (461, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:16:27', '本机IP');
INSERT INTO `sys_login_info` VALUES (462, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:21:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (463, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:25:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (464, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:30:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (465, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:44:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (466, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 03:47:15', '本机IP');
INSERT INTO `sys_login_info` VALUES (467, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:50:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (468, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:52:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (469, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:54:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (470, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 03:58:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (472, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:04:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (473, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:07:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (474, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:11:54', '本机IP');
INSERT INTO `sys_login_info` VALUES (475, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:14:32', '本机IP');
INSERT INTO `sys_login_info` VALUES (476, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:15:05', '本机IP');
INSERT INTO `sys_login_info` VALUES (477, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:17:10', '本机IP');
INSERT INTO `sys_login_info` VALUES (478, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:17:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (479, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:22:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (480, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:24:56', '本机IP');
INSERT INTO `sys_login_info` VALUES (483, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:26:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (484, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:26:35', '本机IP');
INSERT INTO `sys_login_info` VALUES (485, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:28:34', '本机IP');
INSERT INTO `sys_login_info` VALUES (486, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:29:01', '本机IP');
INSERT INTO `sys_login_info` VALUES (487, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:31:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (488, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:32:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (489, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:32:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (490, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:33:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (491, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:36:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (492, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:38:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (493, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:40:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (494, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:41:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (495, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:41:53', NULL);
INSERT INTO `sys_login_info` VALUES (496, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:50:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (497, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:53:23', '本机IP');
INSERT INTO `sys_login_info` VALUES (498, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:55:50', '本机IP');
INSERT INTO `sys_login_info` VALUES (499, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 04:57:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (500, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 04:57:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (501, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 05:00:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (504, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 05:33:59', NULL);
INSERT INTO `sys_login_info` VALUES (505, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 05:35:38', NULL);
INSERT INTO `sys_login_info` VALUES (507, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 05:37:46', NULL);
INSERT INTO `sys_login_info` VALUES (508, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 05:38:12', NULL);
INSERT INTO `sys_login_info` VALUES (509, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 05:41:40', NULL);
INSERT INTO `sys_login_info` VALUES (510, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 05:44:46', NULL);
INSERT INTO `sys_login_info` VALUES (512, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 05:51:47', '本机IP');
INSERT INTO `sys_login_info` VALUES (513, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 05:52:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (514, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 05:59:50', '本机IP');
INSERT INTO `sys_login_info` VALUES (515, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:04:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (516, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:07:30', '本机IP');
INSERT INTO `sys_login_info` VALUES (517, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:08:41', '本机IP');
INSERT INTO `sys_login_info` VALUES (518, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:13:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (519, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:14:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (520, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:15:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (521, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:15:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (522, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:15:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (523, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:16:11', '本机IP');
INSERT INTO `sys_login_info` VALUES (524, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:16:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (525, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:16:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (526, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:20:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (527, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:22:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (528, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:26:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (529, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:27:18', '本机IP');
INSERT INTO `sys_login_info` VALUES (530, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:29:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (531, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:31:29', '本机IP');
INSERT INTO `sys_login_info` VALUES (532, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:33:49', NULL);
INSERT INTO `sys_login_info` VALUES (534, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:35:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (535, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:38:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (536, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:41:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (537, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:46:11', '本机IP');
INSERT INTO `sys_login_info` VALUES (538, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:48:20', '本机IP');
INSERT INTO `sys_login_info` VALUES (539, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:48:35', '本机IP');
INSERT INTO `sys_login_info` VALUES (540, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:51:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (541, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:53:30', '本机IP');
INSERT INTO `sys_login_info` VALUES (542, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:54:52', '本机IP');
INSERT INTO `sys_login_info` VALUES (543, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:55:22', '本机IP');
INSERT INTO `sys_login_info` VALUES (544, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 06:56:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (545, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 06:58:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (546, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:00:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (547, '李四-justin', '0:0:0:0:0:0:0:1', '2019-10-30 07:02:13', '本机IP');
INSERT INTO `sys_login_info` VALUES (548, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:03:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (549, '小章鱼-justin', '0:0:0:0:0:0:0:1', '2019-10-30 07:05:56', '本机IP');
INSERT INTO `sys_login_info` VALUES (550, '小章鱼-justin', '0:0:0:0:0:0:0:1', '2019-10-30 07:22:25', '本机IP');
INSERT INTO `sys_login_info` VALUES (551, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:22:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (552, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:23:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (553, '测试用户-test', '0:0:0:0:0:0:0:1', '2019-10-30 07:24:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (554, '测试用户-test', '0:0:0:0:0:0:0:1', '2019-10-30 07:26:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (555, '测试用户-test', '0:0:0:0:0:0:0:1', '2019-10-30 07:30:56', '本机IP');
INSERT INTO `sys_login_info` VALUES (556, '测试用户-test', '0:0:0:0:0:0:0:1', '2019-10-30 07:31:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (557, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:33:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (558, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:36:44', '本机IP');
INSERT INTO `sys_login_info` VALUES (559, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 07:38:08', '本机IP');
INSERT INTO `sys_login_info` VALUES (560, '测试用户-test', '0:0:0:0:0:0:0:1', '2019-10-30 07:38:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (561, '测试用户-test', '0:0:0:0:0:0:0:1', '2019-10-30 07:50:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (562, '测试用户-test', '223.83.126.11', '2019-10-30 07:59:53', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (563, '章宇康-系统深处的男人', '223.83.126.11', '2019-10-30 08:08:58', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (564, '测试用户-test', '223.83.126.11', '2019-10-30 08:11:43', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (565, '测试用户-test', '61.181.124.27', '2019-10-30 08:11:50', '天津天津XX联通');
INSERT INTO `sys_login_info` VALUES (566, '测试用户-test', '61.181.124.27', '2019-10-30 08:13:31', '天津天津XX联通');
INSERT INTO `sys_login_info` VALUES (567, '测试用户-test', '115.61.102.223', '2019-10-30 08:18:29', '河南开封XX联通');
INSERT INTO `sys_login_info` VALUES (568, '章宇康-系统深处的男人', '223.83.126.11', '2019-10-30 08:21:30', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (571, '测试用户-test', '36.251.38.144', '2019-10-30 08:30:25', '福建福州XX联通');
INSERT INTO `sys_login_info` VALUES (572, '测试用户-test', '36.251.38.37', '2019-10-30 08:31:46', '福建福州XX联通');
INSERT INTO `sys_login_info` VALUES (573, '章宇康-系统深处的男人', '223.83.126.11', '2019-10-30 08:33:35', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (574, '测试用户-test', '223.104.21.99', '2019-10-30 08:42:57', '湖南长沙XX移动');
INSERT INTO `sys_login_info` VALUES (575, '测试用户-test', '223.104.21.99', '2019-10-30 08:43:51', '湖南长沙XX移动');
INSERT INTO `sys_login_info` VALUES (576, '测试用户-test', '182.150.42.165', '2019-10-30 08:46:52', '四川成都XX电信');
INSERT INTO `sys_login_info` VALUES (577, '测试用户-test', '223.104.172.55', '2019-10-30 09:19:55', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (578, '测试用户-test', '117.136.89.71', '2019-10-30 09:31:31', '湖南长沙XX移动');
INSERT INTO `sys_login_info` VALUES (579, '测试用户-test', '182.150.42.165', '2019-10-30 09:43:54', '四川成都XX电信');
INSERT INTO `sys_login_info` VALUES (580, '章宇康-系统深处的男人', '223.83.126.11', '2019-10-30 09:46:35', '江西九江XX移动');
INSERT INTO `sys_login_info` VALUES (582, '测试用户-test', '61.181.124.27', '2019-10-30 10:44:24', '天津天津XX联通');
INSERT INTO `sys_login_info` VALUES (583, '章宇康-系统深处的男人', '0:0:0:0:0:0:0:1', '2019-10-30 12:50:15', '本机IP');
INSERT INTO `sys_login_info` VALUES (584, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-30 12:57:52', '本机IP');
INSERT INTO `sys_login_info` VALUES (585, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-30 13:30:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (586, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 02:39:21', NULL);
INSERT INTO `sys_login_info` VALUES (587, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 03:21:27', '本机IP');
INSERT INTO `sys_login_info` VALUES (588, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 03:27:26', '本机IP');
INSERT INTO `sys_login_info` VALUES (589, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 03:28:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (590, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 03:34:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (591, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 03:54:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (592, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:03:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (593, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:08:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (594, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:09:54', '本机IP');
INSERT INTO `sys_login_info` VALUES (595, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:11:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (596, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:11:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (597, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:13:12', '本机IP');
INSERT INTO `sys_login_info` VALUES (598, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:13:52', '本机IP');
INSERT INTO `sys_login_info` VALUES (599, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:17:07', NULL);
INSERT INTO `sys_login_info` VALUES (600, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:22:25', '本机IP');
INSERT INTO `sys_login_info` VALUES (601, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:29:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (602, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:32:26', '本机IP');
INSERT INTO `sys_login_info` VALUES (603, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:35:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (604, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:36:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (605, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:45:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (606, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:51:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (607, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 04:52:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (608, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:12:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (609, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:13:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (610, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:15:44', '本机IP');
INSERT INTO `sys_login_info` VALUES (611, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:16:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (612, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:21:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (613, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:31:00', '本机IP');
INSERT INTO `sys_login_info` VALUES (614, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 05:36:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (615, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 06:04:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (616, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 06:07:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (617, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 06:09:08', '本机IP');
INSERT INTO `sys_login_info` VALUES (618, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 06:14:29', '本机IP');
INSERT INTO `sys_login_info` VALUES (619, 'admin-admin', '0:0:0:0:0:0:0:1', '2019-10-31 06:39:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (620, '超级管理员-system', '127.0.0.1', '2019-10-31 07:14:32', 'XX内网IP内网IP内网IP');
INSERT INTO `sys_login_info` VALUES (621, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:20:12', '本机IP');
INSERT INTO `sys_login_info` VALUES (622, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:27:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (623, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:29:17', '本机IP');
INSERT INTO `sys_login_info` VALUES (624, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:33:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (625, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:35:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (626, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:41:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (627, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:41:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (628, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:43:44', '本机IP');
INSERT INTO `sys_login_info` VALUES (629, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 07:54:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (630, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:05:41', '本机IP');
INSERT INTO `sys_login_info` VALUES (631, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:18:25', '本机IP');
INSERT INTO `sys_login_info` VALUES (632, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:20:15', '本机IP');
INSERT INTO `sys_login_info` VALUES (633, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:21:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (634, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:23:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (635, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:29:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (636, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:42:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (637, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 08:46:23', '本机IP');
INSERT INTO `sys_login_info` VALUES (638, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:01:26', '本机IP');
INSERT INTO `sys_login_info` VALUES (639, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:27:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (640, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:29:35', '本机IP');
INSERT INTO `sys_login_info` VALUES (641, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:29:44', '本机IP');
INSERT INTO `sys_login_info` VALUES (642, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:30:06', '本机IP');
INSERT INTO `sys_login_info` VALUES (643, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:30:22', '本机IP');
INSERT INTO `sys_login_info` VALUES (644, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:30:32', '本机IP');
INSERT INTO `sys_login_info` VALUES (645, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:30:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (646, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:31:20', '本机IP');
INSERT INTO `sys_login_info` VALUES (647, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:31:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (648, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 09:34:10', '本机IP');
INSERT INTO `sys_login_info` VALUES (649, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 10:15:26', NULL);
INSERT INTO `sys_login_info` VALUES (650, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 10:33:07', NULL);
INSERT INTO `sys_login_info` VALUES (651, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 10:35:05', NULL);
INSERT INTO `sys_login_info` VALUES (652, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 10:49:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (653, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-10-31 11:16:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (654, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:04:04', NULL);
INSERT INTO `sys_login_info` VALUES (655, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:10:45', NULL);
INSERT INTO `sys_login_info` VALUES (656, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:12:48', NULL);
INSERT INTO `sys_login_info` VALUES (657, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:14:29', NULL);
INSERT INTO `sys_login_info` VALUES (658, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:16:45', NULL);
INSERT INTO `sys_login_info` VALUES (659, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:19:48', NULL);
INSERT INTO `sys_login_info` VALUES (660, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:20:36', NULL);
INSERT INTO `sys_login_info` VALUES (661, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 02:21:48', NULL);
INSERT INTO `sys_login_info` VALUES (662, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 03:07:12', '本机IP');
INSERT INTO `sys_login_info` VALUES (663, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 03:09:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (664, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 03:23:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (665, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 03:26:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (666, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 03:43:35', '本机IP');
INSERT INTO `sys_login_info` VALUES (667, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 03:47:06', '本机IP');
INSERT INTO `sys_login_info` VALUES (668, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 04:43:10', NULL);
INSERT INTO `sys_login_info` VALUES (669, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 04:48:14', NULL);
INSERT INTO `sys_login_info` VALUES (670, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 05:05:39', NULL);
INSERT INTO `sys_login_info` VALUES (671, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 05:17:33', NULL);
INSERT INTO `sys_login_info` VALUES (672, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 05:19:09', NULL);
INSERT INTO `sys_login_info` VALUES (673, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 05:47:32', '本机IP');
INSERT INTO `sys_login_info` VALUES (674, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 05:48:40', '本机IP');
INSERT INTO `sys_login_info` VALUES (675, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 05:55:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (676, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 09:03:42', '本机IP');
INSERT INTO `sys_login_info` VALUES (677, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 09:05:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (678, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 10:01:10', '本机IP');
INSERT INTO `sys_login_info` VALUES (679, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 10:02:52', '本机IP');
INSERT INTO `sys_login_info` VALUES (680, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 10:04:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (681, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 10:23:32', '本机IP');
INSERT INTO `sys_login_info` VALUES (682, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 10:28:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (683, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 11:41:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (684, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 12:02:52', '本机IP');
INSERT INTO `sys_login_info` VALUES (685, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 12:09:00', '本机IP');
INSERT INTO `sys_login_info` VALUES (686, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 12:58:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (687, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-01 14:15:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (688, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 02:59:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (689, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 03:01:00', '本机IP');
INSERT INTO `sys_login_info` VALUES (690, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 03:48:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (691, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:12:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (692, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:18:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (693, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:35:47', '本机IP');
INSERT INTO `sys_login_info` VALUES (694, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:36:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (695, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:38:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (696, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:44:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (697, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:45:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (698, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:49:27', '本机IP');
INSERT INTO `sys_login_info` VALUES (699, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:50:46', '本机IP');
INSERT INTO `sys_login_info` VALUES (700, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:55:35', '本机IP');
INSERT INTO `sys_login_info` VALUES (701, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 04:57:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (702, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:08:54', NULL);
INSERT INTO `sys_login_info` VALUES (703, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:10:59', '本机IP');
INSERT INTO `sys_login_info` VALUES (704, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:12:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (705, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:25:30', '本机IP');
INSERT INTO `sys_login_info` VALUES (706, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:49:30', '本机IP');
INSERT INTO `sys_login_info` VALUES (707, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:57:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (708, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 05:59:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (709, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 06:01:00', '本机IP');
INSERT INTO `sys_login_info` VALUES (710, '超级管理员-system', '127.0.0.1', '2019-11-02 06:03:38', 'XX内网IP内网IP内网IP');
INSERT INTO `sys_login_info` VALUES (711, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 06:05:57', '本机IP');
INSERT INTO `sys_login_info` VALUES (712, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 06:10:29', '本机IP');
INSERT INTO `sys_login_info` VALUES (713, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 06:34:43', NULL);
INSERT INTO `sys_login_info` VALUES (714, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 09:31:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (715, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 10:03:54', '本机IP');
INSERT INTO `sys_login_info` VALUES (716, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 10:05:11', '本机IP');
INSERT INTO `sys_login_info` VALUES (717, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 10:07:34', '本机IP');
INSERT INTO `sys_login_info` VALUES (718, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 10:15:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (719, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 10:22:26', '本机IP');
INSERT INTO `sys_login_info` VALUES (720, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 13:50:08', '本机IP');
INSERT INTO `sys_login_info` VALUES (721, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 14:09:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (722, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-02 14:17:24', '本机IP');
INSERT INTO `sys_login_info` VALUES (723, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 01:48:20', NULL);
INSERT INTO `sys_login_info` VALUES (724, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 09:31:20', '本机IP');
INSERT INTO `sys_login_info` VALUES (725, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 09:44:17', '本机IP');
INSERT INTO `sys_login_info` VALUES (726, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 09:46:24', '本机IP');
INSERT INTO `sys_login_info` VALUES (727, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 09:49:47', '本机IP');
INSERT INTO `sys_login_info` VALUES (728, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:05:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (729, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:07:27', '本机IP');
INSERT INTO `sys_login_info` VALUES (730, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:09:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (731, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:16:06', '本机IP');
INSERT INTO `sys_login_info` VALUES (732, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:25:22', '本机IP');
INSERT INTO `sys_login_info` VALUES (733, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:28:54', '本机IP');
INSERT INTO `sys_login_info` VALUES (734, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:31:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (735, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:45:54', NULL);
INSERT INTO `sys_login_info` VALUES (736, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:48:31', '本机IP');
INSERT INTO `sys_login_info` VALUES (737, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 10:51:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (738, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 11:23:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (739, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-03 11:26:18', '本机IP');
INSERT INTO `sys_login_info` VALUES (740, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-04 03:50:23', '本机IP');
INSERT INTO `sys_login_info` VALUES (741, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 05:30:52', '本机IP');
INSERT INTO `sys_login_info` VALUES (742, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 05:33:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (743, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 05:52:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (744, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 05:54:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (745, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 05:55:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (746, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 05:58:34', '本机IP');
INSERT INTO `sys_login_info` VALUES (747, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:02:34', '本机IP');
INSERT INTO `sys_login_info` VALUES (748, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:03:51', '本机IP');
INSERT INTO `sys_login_info` VALUES (749, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:07:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (750, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:11:45', '本机IP');
INSERT INTO `sys_login_info` VALUES (751, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:14:06', NULL);
INSERT INTO `sys_login_info` VALUES (752, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:15:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (753, '超级管理员-system', '127.0.0.1', '2019-11-06 06:21:44', NULL);
INSERT INTO `sys_login_info` VALUES (754, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:23:04', '本机IP');
INSERT INTO `sys_login_info` VALUES (755, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:24:05', '本机IP');
INSERT INTO `sys_login_info` VALUES (756, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:26:12', '本机IP');
INSERT INTO `sys_login_info` VALUES (757, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:31:19', '本机IP');
INSERT INTO `sys_login_info` VALUES (758, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:33:16', '本机IP');
INSERT INTO `sys_login_info` VALUES (759, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:33:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (760, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:34:09', '本机IP');
INSERT INTO `sys_login_info` VALUES (761, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:35:25', '本机IP');
INSERT INTO `sys_login_info` VALUES (762, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:36:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (763, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:38:28', NULL);
INSERT INTO `sys_login_info` VALUES (764, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:39:36', NULL);
INSERT INTO `sys_login_info` VALUES (765, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:40:30', '本机IP');
INSERT INTO `sys_login_info` VALUES (766, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:42:40', NULL);
INSERT INTO `sys_login_info` VALUES (767, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:43:54', NULL);
INSERT INTO `sys_login_info` VALUES (768, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:44:42', '本机IP');
INSERT INTO `sys_login_info` VALUES (769, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:46:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (770, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:49:43', '本机IP');
INSERT INTO `sys_login_info` VALUES (771, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:54:20', '本机IP');
INSERT INTO `sys_login_info` VALUES (772, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:55:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (773, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 06:56:01', NULL);
INSERT INTO `sys_login_info` VALUES (774, '超级管理员-system', '127.0.0.1', '2019-11-06 06:59:13', NULL);
INSERT INTO `sys_login_info` VALUES (775, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 07:00:00', NULL);
INSERT INTO `sys_login_info` VALUES (776, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 07:02:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (777, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 07:47:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (778, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 08:03:13', '本机IP');
INSERT INTO `sys_login_info` VALUES (779, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 08:08:24', '本机IP');
INSERT INTO `sys_login_info` VALUES (780, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 08:29:33', '本机IP');
INSERT INTO `sys_login_info` VALUES (781, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 08:48:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (782, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:15:39', '本机IP');
INSERT INTO `sys_login_info` VALUES (783, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:16:45', '本机IP');
INSERT INTO `sys_login_info` VALUES (784, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:22:24', '本机IP');
INSERT INTO `sys_login_info` VALUES (785, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:23:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (786, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:33:11', '本机IP');
INSERT INTO `sys_login_info` VALUES (787, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:37:29', '本机IP');
INSERT INTO `sys_login_info` VALUES (788, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:39:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (789, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:41:45', '本机IP');
INSERT INTO `sys_login_info` VALUES (790, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:43:13', '本机IP');
INSERT INTO `sys_login_info` VALUES (791, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 09:46:22', '本机IP');
INSERT INTO `sys_login_info` VALUES (792, '超级管理员-system', '127.0.0.1', '2019-11-06 09:58:32', 'XX内网IP内网IP内网IP');
INSERT INTO `sys_login_info` VALUES (793, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:00:15', '本机IP');
INSERT INTO `sys_login_info` VALUES (794, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:01:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (795, '超级管理员-system', '127.0.0.1', '2019-11-06 10:03:16', 'XX内网IP内网IP内网IP');
INSERT INTO `sys_login_info` VALUES (796, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:04:07', '本机IP');
INSERT INTO `sys_login_info` VALUES (797, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:12:04', NULL);
INSERT INTO `sys_login_info` VALUES (798, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:13:55', '本机IP');
INSERT INTO `sys_login_info` VALUES (799, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:19:13', '本机IP');
INSERT INTO `sys_login_info` VALUES (800, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:27:06', '本机IP');
INSERT INTO `sys_login_info` VALUES (801, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-06 10:32:22', '本机IP');
INSERT INTO `sys_login_info` VALUES (802, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 07:40:20', '本机IP');
INSERT INTO `sys_login_info` VALUES (803, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 07:42:44', '本机IP');
INSERT INTO `sys_login_info` VALUES (804, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 07:45:38', '本机IP');
INSERT INTO `sys_login_info` VALUES (805, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 07:47:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (806, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:05:49', '本机IP');
INSERT INTO `sys_login_info` VALUES (807, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:06:36', '本机IP');
INSERT INTO `sys_login_info` VALUES (808, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:10:45', '本机IP');
INSERT INTO `sys_login_info` VALUES (809, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:12:48', '本机IP');
INSERT INTO `sys_login_info` VALUES (810, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:14:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (811, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:16:53', '本机IP');
INSERT INTO `sys_login_info` VALUES (812, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:22:33', '本机IP');
INSERT INTO `sys_login_info` VALUES (813, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:23:46', '本机IP');
INSERT INTO `sys_login_info` VALUES (814, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:26:02', '本机IP');
INSERT INTO `sys_login_info` VALUES (815, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:28:28', '本机IP');
INSERT INTO `sys_login_info` VALUES (816, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:32:03', '本机IP');
INSERT INTO `sys_login_info` VALUES (817, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:33:22', '本机IP');
INSERT INTO `sys_login_info` VALUES (818, '超级管理员-system', '127.0.0.1', '2019-11-07 08:35:41', 'XX内网IP内网IP内网IP');
INSERT INTO `sys_login_info` VALUES (819, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:36:01', '本机IP');
INSERT INTO `sys_login_info` VALUES (820, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:37:12', '本机IP');
INSERT INTO `sys_login_info` VALUES (821, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 08:51:11', '本机IP');
INSERT INTO `sys_login_info` VALUES (822, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 09:57:17', NULL);
INSERT INTO `sys_login_info` VALUES (823, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:09:32', NULL);
INSERT INTO `sys_login_info` VALUES (824, '超级管理员-system', '127.0.0.1', '2019-11-07 10:10:39', NULL);
INSERT INTO `sys_login_info` VALUES (825, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:12:40', NULL);
INSERT INTO `sys_login_info` VALUES (826, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:13:28', NULL);
INSERT INTO `sys_login_info` VALUES (827, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:15:26', NULL);
INSERT INTO `sys_login_info` VALUES (828, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:17:25', NULL);
INSERT INTO `sys_login_info` VALUES (829, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:18:48', NULL);
INSERT INTO `sys_login_info` VALUES (830, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:20:09', NULL);
INSERT INTO `sys_login_info` VALUES (831, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:29:47', '本机IP');
INSERT INTO `sys_login_info` VALUES (832, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:30:54', '本机IP');
INSERT INTO `sys_login_info` VALUES (833, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:32:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (834, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-07 10:33:14', '本机IP');
INSERT INTO `sys_login_info` VALUES (835, '超级管理员-system', '127.0.0.1', '2019-11-12 02:33:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_login_info` VALUES (836, '超级管理员-system', '127.0.0.1', '2019-11-12 02:48:00', '中国|华东|江西省|0|移动');
INSERT INTO `sys_login_info` VALUES (837, '超级管理员-system', '127.0.0.1', '2019-11-12 02:48:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_login_info` VALUES (838, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-12 02:52:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `sys_login_info` VALUES (839, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-12 03:00:15', '本机IP');
INSERT INTO `sys_login_info` VALUES (840, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-12 03:01:22', '天津天津教育网SC-201902221401【Chrome】');
INSERT INTO `sys_login_info` VALUES (841, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-27 13:35:21', '本机IP');
INSERT INTO `sys_login_info` VALUES (842, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-27 13:44:58', '本机IP');
INSERT INTO `sys_login_info` VALUES (843, '超级管理员-system', '0:0:0:0:0:0:0:1', '2019-11-27 13:46:34', '本机IP');
INSERT INTO `sys_login_info` VALUES (844, '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-04-02 13:12:50', '本机IP');
INSERT INTO `sys_login_info` VALUES (845, '超级管理员-system', '0:0:0:0:0:0:0:1', '2020-07-25 13:03:58', '获取地址失败�?SC-201902221401【Chrome】');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  `opername` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (26, '我爱北京天安门', '<pre><span>&lt;div </span><span>id=</span><span>\"noticeToolBar\" </span><span>style=</span><span>\"</span><span>display</span>: <span>none</span><span>;</span><span>\"</span><span>&gt;<br></span><span>    &lt;button </span><span>type=</span><span>\"button\"  </span><span>lay-event=</span><span>\"batchDelete\"  </span><span>class=</span><span>\"layui-btn layui-btn-sm layui-btn-danger\"</span><span>&gt;&lt;span </span><span>class=</span><span>\"layui-icon layui-icon-delete\"</span><span>&gt;&lt;/span&gt;</span><span>批量删除</span><span>&lt;/button&gt;<br></span><span>    &lt;button </span><span>type=</span><span>\"button\"  </span><span>lay-event=</span><span>\"add\"  </span><span>class=</span><span>\"layui-btn layui-btn-sm layui-btn-warning\"</span><span>&gt;&lt;span </span><span>class=</span><span>\"layui-icon layui-icon-add-1\"</span><span>&gt;&lt;/span&gt;</span><span>添加</span><span>&lt;/button&gt;<br></span><span>&lt;/div&gt;</span></pre>', '2019-10-26 11:33:46', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (28, '好好学习，天天向上', 'dffdf', '2019-10-26 11:44:23', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (29, '中华人民共和国', '<pre><span>//</span><span>打开添加的弹出层<br></span><span>function </span><span>openAddModal</span>(){<br>    $(<span>\"#key\"</span>).<span>val</span>(<span>\"\"</span>)<span>;<br></span><span>    </span>mainIndex=layer.<span>open</span>({<br>        <span>type</span>:<span>1</span><span>,<br></span><span>        </span><span>content</span>: $(<span>\"#addOrUpdateModal\"</span>)<span>,<br></span><span>        </span><span>area</span>:[<span>\'800px\'</span><span>,</span><span>\'520px\'</span>]<span>,<br></span><span>        </span><span>title</span>:<span>\'</span><span>发布公告</span><span>\'</span><span>,<br></span><span>        </span><span>success</span>:<span>function</span>(){<br>            $(<span>\"#dataFrm\"</span>)[<span>0</span>].<span>reset</span>()<span>;<br></span><span>            </span>$(<span>\"#dataFrm\"</span>)<br>            layedit.<span>setContent</span>(editIndex<span>,</span><span>\"\"</span>)<span>;<br></span><span>            </span>url=<span>\"/notice/add\"</span><span>;<br></span><span>        </span>}<br>    })<span>;<br></span>}</pre>', '2019-10-26 11:44:31', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (30, '终于解决了这个bug了', '<pre><span>//</span><span>点击更新弹出更新框<br></span><span>function </span><span>openUpdateNoticeModal</span>(data){<br>    mainIndex=layer.<span>open</span>({<br>        <span>type</span>:<span>1</span><span>,<br></span><span>        </span><span>content</span>:$(<span>\"#addOrUpdateModal\"</span>)<span>,<br></span><span>        </span><span>area</span>:[<span>\'800px\'</span><span>,</span><span>\'550\'</span>]<span>,<br></span><span>        </span><span>title</span>:<span>\'</span><span>修改公告</span><span>\'</span><span>,<br></span><span>        </span><span>success</span>:<span>function</span>(){<br>            $(<span>\"#dataFrm\"</span>)[<span>0</span>].<span>reset</span>()<span>;<br></span><span>            </span><span>//</span><span>装载新的数据<br></span><span>            </span><span>//</span><span>装载新的数据<br></span><span>            </span>form.val(<span>\"dataFrm\"</span><span>,</span>data)<span>;<br></span><span>            </span>layedit.<span>setContent</span>(editIndex<span>,</span>data.<span>content</span>)<span>;<br></span><span>            </span>url=<span>\"/notice/update\"</span><span>;<br></span><span>        </span>}<br>    })<span>;<br></span>}</pre>', '2019-10-26 11:48:33', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (31, '高士大夫股份的时光dsfg', '&nbsp;是大风刮过手动给对方是个但是打发单方事故手动打发', '2019-10-26 11:49:52', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (32, '我的公告呀', '打发大水范德萨发生大', '2019-10-26 11:54:04', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (33, '测试公告', '24235325235', '2019-10-26 11:54:17', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (34, '章宇康的一个的公告', '<p>章宇康的一个的公告</p>', '2019-10-26 11:54:37', '系统深处的男人');
INSERT INTO `sys_notice` VALUES (35, '我是赵六', '<p>我是赵六我是赵六我是赵六我是赵六我是赵六我是赵六</p>', '2019-10-26 11:56:40', '赵六');
INSERT INTO `sys_notice` VALUES (36, '妈妈我想吃靠山药', '<ol class=\"layui-code-ol\"><li>Lay.fn.event = function(modName, events, params){</li><li>  var that = this, result = null, filter = events.match(/\\(.*\\)$/)||[];</li><li>  var set = (events = modName + \'.\'+ events).replace(filter, \'\'); </li><li>};</li><li>      <pre class=\"layui-code layui-box layui-code-view layui-code-notepad\" lay-skin=\"notepad\"><h3 class=\"layui-code-h3\">code<a href=\"http://www.layui.com/doc/modules/code.html\" target=\"_blank\">layui.code</a></h3><ol class=\"layui-code-ol\"><li>//代码区域</li><li>Lay.fn.event = function(modName, events, params){</li><li>  var that = this, result = null, filter = events.match(/\\(.*\\)$/)||[];</li><li>  var set = (events = modName + \'.\'+ events).replace(filter, \'\'); </li><li>};</li><li><pre class=\"layui-code layui-box layui-code-view layui-code-notepad\" lay-skin=\"notepad\"><h3 class=\"layui-code-h3\">code<a href=\"http://www.layui.com/doc/modules/code.html\" target=\"_blank\">layui.code</a></h3><ol class=\"layui-code-ol\"><li>//代码区域</li><li>Lay.fn.event = function(modName, events, params){</li><li>  var that = this, result = null, filter = events.match(/\\(.*\\)$/)||[];</li><li>  var set = (events = modName + \'.\'+ events).replace(filter, \'\'); </li><li>};</li><li><pre class=\"layui-code layui-box layui-code-view layui-code-notepad\" lay-skin=\"notepad\"><h3 class=\"layui-code-h3\">code<a href=\"http://www.layui.com/doc/modules/code.html\" target=\"_blank\">layui.code</a></h3><ol class=\"layui-code-ol\"><li>//代码区域</li><li>Lay.fn.event = function(modName, events, params){</li><li>  var that = this, result = null, filter = events.match(/\\(.*\\)$/)||[];</li></ol></pre></li></ol></pre></li></ol></pre></li></ol>', '2019-10-26 12:06:21', '章宇康');
INSERT INTO `sys_notice` VALUES (37, '窝窝头，一块钱四个~，嘿嘿~', '<p>我又来写bug了</p>', '2019-10-27 05:28:43', '章宇康');
INSERT INTO `sys_notice` VALUES (39, '学校运动会放假4天', '<p>学校运动会放假4天，美滋滋</p>', '2019-10-30 08:25:32', '测试用户');
INSERT INTO `sys_notice` VALUES (40, '该系统的默认密码是123456', '<p>该系统的默认密码是123456<br></p>', '2019-10-30 08:39:45', '章宇康');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限类型[menu/permission]',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `percode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码[只有type= permission才有  user:view]',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `open` int(11) NULL DEFAULT NULL,
  `ordernum` int(11) NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL COMMENT '状态【0不可用1可用】',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 0, 'menu', '佳超轮胎店进销存系统', NULL, '&#xe68e;', '', '0', 1, 1, 1);
INSERT INTO `sys_permission` VALUES (5, 1, 'menu', '系统维护', NULL, '&#xe614;', '', '', 0, 1, 1);
INSERT INTO `sys_permission` VALUES (6, 1, 'menu', '基础信息', NULL, '&#xe628;', '', '', 0, 2, 1);
INSERT INTO `sys_permission` VALUES (14, 5, 'menu', '部门管理', NULL, '&#xe770;', '/sys/toDeptManager', '', 1, 14, 0);
INSERT INTO `sys_permission` VALUES (15, 5, 'menu', '菜单管理', NULL, '&#xe857;', '/sys/toMenuManager', '', 0, 15, 1);
INSERT INTO `sys_permission` VALUES (16, 5, 'menu', '权限管理', '', 'layui-icon layui-icon-auz', '/sys/toPermissionManager', '', 0, 16, 1);
INSERT INTO `sys_permission` VALUES (17, 5, 'menu', '角色管理', '', '&#xe650;', '/sys/toRoleManager', '', 0, 17, 1);
INSERT INTO `sys_permission` VALUES (18, 5, 'menu', '用户管理', '', '&#xe612;', '/sys/toUserManager', '', 0, 18, 1);
INSERT INTO `sys_permission` VALUES (21, 6, 'menu', '登陆日志', NULL, 'layui-icon layui-icon-list', '/sys/toLoginInfoManager', '', 0, 21, 1);
INSERT INTO `sys_permission` VALUES (22, 6, 'menu', '系统公告', NULL, '&#xe756;', '/sys/toNoticeManager', NULL, 0, 22, 1);
INSERT INTO `sys_permission` VALUES (23, 6, 'menu', '图标管理', NULL, '&#xe670;', '/sys/toIconManager', '', 1, 23, 1);
INSERT INTO `sys_permission` VALUES (30, 14, 'permission', '添加部门', 'dept:create', '', NULL, '', 0, 24, 1);
INSERT INTO `sys_permission` VALUES (31, 14, 'permission', '修改部门', 'dept:update', '', NULL, NULL, 0, 26, 1);
INSERT INTO `sys_permission` VALUES (32, 14, 'permission', '删除部门', 'dept:delete', '', NULL, NULL, 0, 27, 1);
INSERT INTO `sys_permission` VALUES (34, 15, 'permission', '添加菜单', 'menu:create', '', '', '', 0, 29, 1);
INSERT INTO `sys_permission` VALUES (35, 15, 'permission', '修改菜单', 'menu:update', '', NULL, NULL, 0, 30, 1);
INSERT INTO `sys_permission` VALUES (36, 15, 'permission', '删除菜单', 'menu:delete', '', NULL, NULL, 0, 31, 1);
INSERT INTO `sys_permission` VALUES (38, 16, 'permission', '添加权限', 'permission:create', '', NULL, NULL, 0, 33, 1);
INSERT INTO `sys_permission` VALUES (39, 16, 'permission', '修改权限', 'permission:update', '', NULL, NULL, 0, 34, 1);
INSERT INTO `sys_permission` VALUES (40, 16, 'permission', '删除权限', 'permission:delete', '', NULL, NULL, 0, 35, 1);
INSERT INTO `sys_permission` VALUES (42, 17, 'permission', '添加角色', 'role:add', '', NULL, NULL, 0, 37, 1);
INSERT INTO `sys_permission` VALUES (43, 17, 'permission', '修改角色', 'role:update', '', NULL, '', 0, 38, 1);
INSERT INTO `sys_permission` VALUES (44, 17, 'permission', '角色删除', 'role:delete', '', NULL, NULL, 0, 39, 1);
INSERT INTO `sys_permission` VALUES (46, 17, 'permission', '分配权限', 'role:saveRolePermission', '', NULL, NULL, 0, 41, 1);
INSERT INTO `sys_permission` VALUES (47, 18, 'permission', '添加用户', 'user:add', '', NULL, NULL, 0, 42, 1);
INSERT INTO `sys_permission` VALUES (48, 18, 'permission', '修改用户', 'user:update', '', NULL, NULL, 0, 43, 1);
INSERT INTO `sys_permission` VALUES (49, 18, 'permission', '删除用户', 'user:delete', '', NULL, NULL, 0, 44, 1);
INSERT INTO `sys_permission` VALUES (51, 18, 'permission', '用户分配角色', 'user:saveUserRoles', '', NULL, NULL, 0, 46, 1);
INSERT INTO `sys_permission` VALUES (52, 18, 'permission', '重置密码', 'user:resetPwd', NULL, NULL, NULL, 0, 47, 1);
INSERT INTO `sys_permission` VALUES (53, 14, 'permission', '部门查询', 'dept:view', NULL, NULL, NULL, 0, 48, 1);
INSERT INTO `sys_permission` VALUES (54, 15, 'permission', '菜单查询', 'menu:view', NULL, NULL, NULL, 0, 49, 1);
INSERT INTO `sys_permission` VALUES (55, 16, 'permission', '权限查询', 'permission:view', NULL, NULL, NULL, 0, 50, 1);
INSERT INTO `sys_permission` VALUES (56, 17, 'permission', '角色查询', 'role:view', NULL, NULL, NULL, 0, 51, 1);
INSERT INTO `sys_permission` VALUES (57, 18, 'permission', '用户查询', 'user:view', NULL, NULL, NULL, 0, 52, 1);
INSERT INTO `sys_permission` VALUES (73, 21, 'permission', '日志查询', 'loginInfo:view', NULL, NULL, '', 1, 65, 1);
INSERT INTO `sys_permission` VALUES (74, 21, 'permission', '日志删除', 'loginInfo:delete', NULL, NULL, '', 1, 66, 1);
INSERT INTO `sys_permission` VALUES (75, 21, 'permission', '日志批量删除', 'loginInfo:batchdelete', NULL, NULL, '', 1, 67, 1);
INSERT INTO `sys_permission` VALUES (76, 22, 'permission', '公告查询', 'notice:view', NULL, NULL, NULL, NULL, 68, 1);
INSERT INTO `sys_permission` VALUES (77, 22, 'permission', '公告添加', 'notice:add', NULL, NULL, NULL, NULL, 69, 1);
INSERT INTO `sys_permission` VALUES (78, 22, 'permission', '公告修改', 'notice:update', NULL, NULL, NULL, NULL, 70, 1);
INSERT INTO `sys_permission` VALUES (79, 22, 'permission', '公告删除', 'notice:delete', NULL, NULL, NULL, NULL, 71, 1);
INSERT INTO `sys_permission` VALUES (86, 22, 'permission', '公告查看', 'notice:viewnotice', NULL, NULL, NULL, NULL, 78, 1);
INSERT INTO `sys_permission` VALUES (93, 6, 'menu', '图片管理', NULL, '&#xe770;', '/sys/toImageManager', '', 1, 11, 1);
INSERT INTO `sys_permission` VALUES (107, 6, 'menu', '供应商管理', NULL, '&#xe66f;', '/biz/toProviderManager', '', 1, 23, 1);
INSERT INTO `sys_permission` VALUES (108, 6, 'menu', '商品管理', NULL, '&#xe63c;', '/biz/toProductManager', '', 1, 24, 1);
INSERT INTO `sys_permission` VALUES (109, 6, 'menu', '单位字典', NULL, '&#xe663;', '/biz/toUnitManager', '', 1, 25, 1);
INSERT INTO `sys_permission` VALUES (110, 1, 'menu', '入库管理', NULL, '&#xe62a;', '', '', 0, 26, 1);
INSERT INTO `sys_permission` VALUES (111, 110, 'menu', '入库管理', NULL, '&#xe614;', '/biz/toProductsManager', '', 1, 26, 1);
INSERT INTO `sys_permission` VALUES (112, 110, 'menu', '库存信息', NULL, '&#xe68e;', '/biz/toProductsDataManager', '', 1, 27, 1);
INSERT INTO `sys_permission` VALUES (113, 1, 'menu', '客户管理', NULL, '&#xe613;', '', '', 0, 28, 1);
INSERT INTO `sys_permission` VALUES (114, 113, 'menu', '客户列表', NULL, '&#xe770;', '/biz/toCustomerManager', '', 1, 29, 1);
INSERT INTO `sys_permission` VALUES (115, 1, 'menu', '出库管理', NULL, '&#xe663;', '', '', 0, 30, 1);
INSERT INTO `sys_permission` VALUES (116, 115, 'menu', '出库管理', NULL, '&#xe698;', '/biz/toProductOutManager', '', 1, 31, 1);
INSERT INTO `sys_permission` VALUES (117, 114, 'permission', '删除客户', 'customer:delete', NULL, NULL, '', 1, 1, 1);
INSERT INTO `sys_permission` VALUES (118, 114, 'permission', '更新客户', 'customer:update', NULL, NULL, '', 1, 2, 1);
INSERT INTO `sys_permission` VALUES (119, 115, 'menu', '出库记录', NULL, '&#xe705;', '/biz/toProductRecordManager', '', 1, 32, 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  `createtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1, '2019-04-10 14:06:32');
INSERT INTO `sys_role` VALUES (4, '管理员', '管理员', 1, '2019-04-10 14:06:32');

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`pid`, `rid`) USING BTREE,
  INDEX `FK_tcsr9ucxypb3ce1q5qngsfk33`(`rid`) USING BTREE,
  CONSTRAINT `sys_role_permission_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `sys_permission` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_permission_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (1, 1);
INSERT INTO `sys_role_permission` VALUES (1, 5);
INSERT INTO `sys_role_permission` VALUES (1, 6);
INSERT INTO `sys_role_permission` VALUES (1, 15);
INSERT INTO `sys_role_permission` VALUES (1, 16);
INSERT INTO `sys_role_permission` VALUES (1, 17);
INSERT INTO `sys_role_permission` VALUES (1, 18);
INSERT INTO `sys_role_permission` VALUES (1, 21);
INSERT INTO `sys_role_permission` VALUES (1, 22);
INSERT INTO `sys_role_permission` VALUES (1, 23);
INSERT INTO `sys_role_permission` VALUES (1, 34);
INSERT INTO `sys_role_permission` VALUES (1, 35);
INSERT INTO `sys_role_permission` VALUES (1, 36);
INSERT INTO `sys_role_permission` VALUES (1, 38);
INSERT INTO `sys_role_permission` VALUES (1, 39);
INSERT INTO `sys_role_permission` VALUES (1, 40);
INSERT INTO `sys_role_permission` VALUES (1, 42);
INSERT INTO `sys_role_permission` VALUES (1, 43);
INSERT INTO `sys_role_permission` VALUES (1, 44);
INSERT INTO `sys_role_permission` VALUES (1, 46);
INSERT INTO `sys_role_permission` VALUES (1, 47);
INSERT INTO `sys_role_permission` VALUES (1, 48);
INSERT INTO `sys_role_permission` VALUES (1, 49);
INSERT INTO `sys_role_permission` VALUES (1, 51);
INSERT INTO `sys_role_permission` VALUES (1, 52);
INSERT INTO `sys_role_permission` VALUES (1, 54);
INSERT INTO `sys_role_permission` VALUES (1, 55);
INSERT INTO `sys_role_permission` VALUES (1, 56);
INSERT INTO `sys_role_permission` VALUES (1, 57);
INSERT INTO `sys_role_permission` VALUES (1, 73);
INSERT INTO `sys_role_permission` VALUES (1, 74);
INSERT INTO `sys_role_permission` VALUES (1, 75);
INSERT INTO `sys_role_permission` VALUES (1, 76);
INSERT INTO `sys_role_permission` VALUES (1, 77);
INSERT INTO `sys_role_permission` VALUES (1, 78);
INSERT INTO `sys_role_permission` VALUES (1, 79);
INSERT INTO `sys_role_permission` VALUES (1, 86);
INSERT INTO `sys_role_permission` VALUES (1, 93);
INSERT INTO `sys_role_permission` VALUES (1, 110);
INSERT INTO `sys_role_permission` VALUES (1, 111);
INSERT INTO `sys_role_permission` VALUES (1, 112);
INSERT INTO `sys_role_permission` VALUES (1, 113);
INSERT INTO `sys_role_permission` VALUES (1, 114);
INSERT INTO `sys_role_permission` VALUES (1, 115);
INSERT INTO `sys_role_permission` VALUES (1, 116);
INSERT INTO `sys_role_permission` VALUES (4, 1);
INSERT INTO `sys_role_permission` VALUES (4, 6);
INSERT INTO `sys_role_permission` VALUES (4, 93);
INSERT INTO `sys_role_permission` VALUES (4, 110);
INSERT INTO `sys_role_permission` VALUES (4, 111);
INSERT INTO `sys_role_permission` VALUES (4, 112);
INSERT INTO `sys_role_permission` VALUES (4, 113);
INSERT INTO `sys_role_permission` VALUES (4, 114);
INSERT INTO `sys_role_permission` VALUES (4, 115);
INSERT INTO `sys_role_permission` VALUES (4, 116);
INSERT INTO `sys_role_permission` VALUES (4, 118);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`, `rid`) USING BTREE,
  INDEX `FK_203gdpkwgtow7nxlo2oap5jru`(`rid`) USING BTREE,
  CONSTRAINT `sys_role_user_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `sys_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (1, 4);
INSERT INTO `sys_role_user` VALUES (1, 6);
INSERT INTO `sys_role_user` VALUES (1, 18);
INSERT INTO `sys_role_user` VALUES (4, 4);
INSERT INTO `sys_role_user` VALUES (4, 6);
INSERT INTO `sys_role_user` VALUES (4, 19);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `deptid` int(11) NULL DEFAULT NULL,
  `hiredate` datetime(0) NULL DEFAULT NULL,
  `mgr` int(11) NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT 1,
  `ordernum` int(11) NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT NULL COMMENT '用户类型[0超级管理员1，管理员，2普通用户]',
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `salt` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_3rrcpvho2w1mx1sfiuuyir1h`(`deptid`) USING BTREE,
  CONSTRAINT `sys_user_ibfk_1` FOREIGN KEY (`deptid`) REFERENCES `sys_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, '超级管理员', 'system', '江西', 1, '超级管理员', '6650684300ab01466f1227dc88873651', 1, '2018-06-25 11:06:34', NULL, 1, 1, 0, '../resources/images/defaultusertitle.jpg', '04A93C74C8294AA09A8B974FD1F4ECBB');
INSERT INTO `sys_user` VALUES (4, '小狗狗', 'dog', '武汉', 1, '程序员', '0c5e7c3a9cd54c69b3ee2297240da523', 4, '2019-10-29 09:52:25', 5, 1, 4, 1, '../resources/images/defaultusertitle.jpg', '5B047F1E-DEE6-4FEC-83E7-86C01D02614F');
INSERT INTO `sys_user` VALUES (6, '刘八', 'lb', '深圳', 1, '程序员', 'de562c70a15f8f888c66419a0b2103ad', 4, '2018-08-06 11:21:12', 8, 0, 6, 1, '../resources/images/defaultusertitle.jpg', '5139EBB7-C79C-479D-9A26-755DE533113C');
INSERT INTO `sys_user` VALUES (18, 'sytem', 'system', '北京', 1, '系统用户', '165f412d9e1e5d8de7f7e214f827b54b', 1, '2019-10-30 12:54:23', 19, 1, 1, 1, NULL, '04AB5C55-195A-4E2A-A58D-5CB55D895BD9');
INSERT INTO `sys_user` VALUES (19, 'admin', 'admin', '北京', 1, '普通用户', 'a92645e5d2b35d6932916ff64f75634c', 1, '2019-10-30 12:54:53', 1, 1, 2, 1, NULL, '8C38CEF8-49C4-414A-BC10-FCF554E1C3F7');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept`  (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级部门ID',
  `DEPT_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `ORDER_NUM` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES (1, 0, '开发部', 1, '2019-06-14 20:56:41', NULL);
INSERT INTO `t_dept` VALUES (2, 1, '开发一部', 1, '2019-06-14 20:58:46', NULL);
INSERT INTO `t_dept` VALUES (3, 1, '开发二部', 2, '2019-06-14 20:58:56', NULL);
INSERT INTO `t_dept` VALUES (4, 0, '采购部', 2, '2019-06-14 20:59:56', NULL);
INSERT INTO `t_dept` VALUES (5, 0, '财务部', 3, '2019-06-14 21:00:08', NULL);
INSERT INTO `t_dept` VALUES (6, 0, '销售部', 4, '2019-06-14 21:00:15', NULL);
INSERT INTO `t_dept` VALUES (7, 0, '工程部', 5, '2019-06-14 21:00:42', NULL);
INSERT INTO `t_dept` VALUES (8, 0, '行政部', 6, '2019-06-14 21:00:49', NULL);
INSERT INTO `t_dept` VALUES (9, 0, '人力资源部', 8, '2019-06-14 21:01:14', '2019-06-14 21:01:34');
INSERT INTO `t_dept` VALUES (10, 0, '系统部', 7, '2019-06-14 21:01:31', NULL);

-- ----------------------------
-- Table structure for t_eximport
-- ----------------------------
DROP TABLE IF EXISTS `t_eximport`;
CREATE TABLE `t_eximport`  (
  `FIELD1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段1',
  `FIELD2` int(11) NOT NULL COMMENT '字段2',
  `FIELD3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段3',
  `CREATE_TIME` datetime(0) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Excel导入导出测试' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_eximport
-- ----------------------------
INSERT INTO `t_eximport` VALUES ('字段1', 1, 'mrbird0@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 2, 'mrbird1@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 3, 'mrbird2@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 4, 'mrbird3@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 5, 'mrbird4@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 6, 'mrbird5@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 7, 'mrbird6@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 8, 'mrbird7@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 9, 'mrbird8@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 10, 'mrbird9@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 11, 'mrbird10@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 12, 'mrbird11@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 13, 'mrbird12@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 14, 'mrbird13@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 15, 'mrbird14@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 16, 'mrbird15@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 17, 'mrbird16@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 18, 'mrbird17@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 19, 'mrbird18@gmail.com', '2019-06-13 03:14:06');
INSERT INTO `t_eximport` VALUES ('字段1', 20, 'mrbird19@gmail.com', '2019-06-13 03:14:06');

-- ----------------------------
-- Table structure for t_generator_config
-- ----------------------------
DROP TABLE IF EXISTS `t_generator_config`;
CREATE TABLE `t_generator_config`  (
  `id` int(11) NOT NULL COMMENT '主键',
  `author` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `base_package` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基础包名',
  `entity_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'entity文件存放路径',
  `mapper_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper文件存放路径',
  `mapper_xml_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'mapper xml文件存放路径',
  `service_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'servcie文件存放路径',
  `service_impl_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'serviceImpl文件存放路径',
  `controller_package` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'controller文件存放路径',
  `is_trim` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否去除前缀 1是 0否',
  `trim_value` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_generator_config
-- ----------------------------
INSERT INTO `t_generator_config` VALUES (1, 'MrBird', 'cc.mrbird.febs.gen', 'entity', 'mapper', 'mapper', 'service', 'service.impl', 'controller', '1', 't_');

-- ----------------------------
-- Table structure for t_job
-- ----------------------------
DROP TABLE IF EXISTS `t_job`;
CREATE TABLE `t_job`  (
  `JOB_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `BEAN_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `PARAMS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `CRON_EXPRESSION` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态  0：正常  1：暂停',
  `REMARK` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`JOB_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_job
-- ----------------------------
INSERT INTO `t_job` VALUES (1, 'testTask', 'test', 'mrbird', '0/1 * * * * ?', '1', '有参任务调度测试~~', '2018-02-24 16:26:14');
INSERT INTO `t_job` VALUES (2, 'testTask', 'test1', NULL, '0/10 * * * * ?', '1', '无参任务调度测试', '2018-02-24 17:06:23');
INSERT INTO `t_job` VALUES (3, 'testTask', 'test', 'hello world', '0/1 * * * * ?', '1', '有参任务调度测试,每隔一秒触发', '2018-02-26 09:28:26');
INSERT INTO `t_job` VALUES (11, 'testTask', 'test2', NULL, '0/5 * * * * ?', '1', '测试异常', '2018-02-26 11:15:30');

-- ----------------------------
-- Table structure for t_job_log
-- ----------------------------
DROP TABLE IF EXISTS `t_job_log`;
CREATE TABLE `t_job_log`  (
  `LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `JOB_ID` bigint(20) NOT NULL COMMENT '任务id',
  `BEAN_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'spring bean名称',
  `METHOD_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '方法名',
  `PARAMS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `STATUS` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `ERROR` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '失败信息',
  `TIMES` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时(单位：毫秒)',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`LOG_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2562 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_job_log
-- ----------------------------
INSERT INTO `t_job_log` VALUES (2472, 2, 'testTask', 'test1', NULL, '0', NULL, 14, '2018-04-02 17:29:50');
INSERT INTO `t_job_log` VALUES (2473, 2, 'testTask', 'test1', NULL, '0', NULL, 1, '2018-04-02 17:30:00');
INSERT INTO `t_job_log` VALUES (2474, 2, 'testTask', 'test1', NULL, '0', NULL, 0, '2018-04-02 17:30:10');
INSERT INTO `t_job_log` VALUES (2475, 2, 'testTask', 'test1', NULL, '0', NULL, 1, '2018-04-02 17:30:20');
INSERT INTO `t_job_log` VALUES (2476, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 08:49:24');
INSERT INTO `t_job_log` VALUES (2477, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 08:49:25');
INSERT INTO `t_job_log` VALUES (2478, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 08:49:26');
INSERT INTO `t_job_log` VALUES (2479, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 08:49:27');
INSERT INTO `t_job_log` VALUES (2480, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 08:49:28');
INSERT INTO `t_job_log` VALUES (2481, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 08:49:29');
INSERT INTO `t_job_log` VALUES (2482, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 08:49:30');
INSERT INTO `t_job_log` VALUES (2483, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 08:49:31');
INSERT INTO `t_job_log` VALUES (2484, 1, 'testTask', 'test', 'mrbird', '0', NULL, 4, '2019-06-11 10:43:36');
INSERT INTO `t_job_log` VALUES (2485, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:37');
INSERT INTO `t_job_log` VALUES (2486, 1, 'testTask', 'test', 'mrbird', '0', NULL, 15, '2019-06-11 10:43:38');
INSERT INTO `t_job_log` VALUES (2487, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:39');
INSERT INTO `t_job_log` VALUES (2488, 1, 'testTask', 'test', 'mrbird', '0', NULL, 53, '2019-06-11 10:43:40');
INSERT INTO `t_job_log` VALUES (2489, 1, 'testTask', 'test', 'mrbird', '0', NULL, 3, '2019-06-11 10:43:41');
INSERT INTO `t_job_log` VALUES (2490, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:43:42');
INSERT INTO `t_job_log` VALUES (2491, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:43');
INSERT INTO `t_job_log` VALUES (2492, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:43:44');
INSERT INTO `t_job_log` VALUES (2493, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:45');
INSERT INTO `t_job_log` VALUES (2494, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:46');
INSERT INTO `t_job_log` VALUES (2495, 1, 'testTask', 'test', 'mrbird', '0', NULL, 13, '2019-06-11 10:43:47');
INSERT INTO `t_job_log` VALUES (2496, 1, 'testTask', 'test', 'mrbird', '0', NULL, 35, '2019-06-11 10:43:48');
INSERT INTO `t_job_log` VALUES (2497, 1, 'testTask', 'test', 'mrbird', '0', NULL, 3, '2019-06-11 10:43:49');
INSERT INTO `t_job_log` VALUES (2498, 1, 'testTask', 'test', 'mrbird', '0', NULL, 7, '2019-06-11 10:43:50');
INSERT INTO `t_job_log` VALUES (2499, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:51');
INSERT INTO `t_job_log` VALUES (2500, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:52');
INSERT INTO `t_job_log` VALUES (2501, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:43:53');
INSERT INTO `t_job_log` VALUES (2502, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:54');
INSERT INTO `t_job_log` VALUES (2503, 1, 'testTask', 'test', 'mrbird', '0', NULL, 14, '2019-06-11 10:43:55');
INSERT INTO `t_job_log` VALUES (2504, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:43:56');
INSERT INTO `t_job_log` VALUES (2505, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:57');
INSERT INTO `t_job_log` VALUES (2506, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:43:58');
INSERT INTO `t_job_log` VALUES (2507, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:43:59');
INSERT INTO `t_job_log` VALUES (2508, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:44:00');
INSERT INTO `t_job_log` VALUES (2509, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:01');
INSERT INTO `t_job_log` VALUES (2510, 1, 'testTask', 'test', 'mrbird', '0', NULL, 37, '2019-06-11 10:44:02');
INSERT INTO `t_job_log` VALUES (2511, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:03');
INSERT INTO `t_job_log` VALUES (2512, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:04');
INSERT INTO `t_job_log` VALUES (2513, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:05');
INSERT INTO `t_job_log` VALUES (2514, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:44:06');
INSERT INTO `t_job_log` VALUES (2515, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:44:07');
INSERT INTO `t_job_log` VALUES (2516, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:08');
INSERT INTO `t_job_log` VALUES (2517, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:09');
INSERT INTO `t_job_log` VALUES (2518, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:10');
INSERT INTO `t_job_log` VALUES (2519, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:11');
INSERT INTO `t_job_log` VALUES (2520, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:12');
INSERT INTO `t_job_log` VALUES (2521, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:13');
INSERT INTO `t_job_log` VALUES (2522, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:16');
INSERT INTO `t_job_log` VALUES (2523, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:16');
INSERT INTO `t_job_log` VALUES (2524, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:16');
INSERT INTO `t_job_log` VALUES (2525, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:17');
INSERT INTO `t_job_log` VALUES (2526, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:18');
INSERT INTO `t_job_log` VALUES (2527, 1, 'testTask', 'test', 'mrbird', '0', NULL, 145, '2019-06-11 10:44:19');
INSERT INTO `t_job_log` VALUES (2528, 1, 'testTask', 'test', 'mrbird', '0', NULL, 11, '2019-06-11 10:44:20');
INSERT INTO `t_job_log` VALUES (2529, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:21');
INSERT INTO `t_job_log` VALUES (2530, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:22');
INSERT INTO `t_job_log` VALUES (2531, 1, 'testTask', 'test', 'mrbird', '0', NULL, 206, '2019-06-11 10:44:23');
INSERT INTO `t_job_log` VALUES (2532, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:44:24');
INSERT INTO `t_job_log` VALUES (2533, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:44:25');
INSERT INTO `t_job_log` VALUES (2534, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:26');
INSERT INTO `t_job_log` VALUES (2535, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:44:27');
INSERT INTO `t_job_log` VALUES (2536, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:44:28');
INSERT INTO `t_job_log` VALUES (2537, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:45:54');
INSERT INTO `t_job_log` VALUES (2538, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:45:55');
INSERT INTO `t_job_log` VALUES (2539, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:45:56');
INSERT INTO `t_job_log` VALUES (2540, 1, 'testTask', 'test', 'mrbird', '0', NULL, 4, '2019-06-11 10:45:57');
INSERT INTO `t_job_log` VALUES (2541, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:45:58');
INSERT INTO `t_job_log` VALUES (2542, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:45:59');
INSERT INTO `t_job_log` VALUES (2543, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:46:00');
INSERT INTO `t_job_log` VALUES (2544, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:01');
INSERT INTO `t_job_log` VALUES (2545, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:02');
INSERT INTO `t_job_log` VALUES (2546, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:46:03');
INSERT INTO `t_job_log` VALUES (2547, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:04');
INSERT INTO `t_job_log` VALUES (2548, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:46:05');
INSERT INTO `t_job_log` VALUES (2549, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:46:06');
INSERT INTO `t_job_log` VALUES (2550, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:07');
INSERT INTO `t_job_log` VALUES (2551, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:46:45');
INSERT INTO `t_job_log` VALUES (2552, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:46');
INSERT INTO `t_job_log` VALUES (2553, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:47');
INSERT INTO `t_job_log` VALUES (2554, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:46:48');
INSERT INTO `t_job_log` VALUES (2555, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:49');
INSERT INTO `t_job_log` VALUES (2556, 1, 'testTask', 'test', 'mrbird', '0', NULL, 10, '2019-06-11 10:46:50');
INSERT INTO `t_job_log` VALUES (2557, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:46:51');
INSERT INTO `t_job_log` VALUES (2558, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:52');
INSERT INTO `t_job_log` VALUES (2559, 1, 'testTask', 'test', 'mrbird', '0', NULL, 2, '2019-06-11 10:46:53');
INSERT INTO `t_job_log` VALUES (2560, 1, 'testTask', 'test', 'mrbird', '0', NULL, 0, '2019-06-11 10:46:54');
INSERT INTO `t_job_log` VALUES (2561, 1, 'testTask', 'test', 'mrbird', '0', NULL, 1, '2019-06-11 10:46:55');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `OPERATION` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作内容',
  `TIME` decimal(11, 0) NULL DEFAULT NULL COMMENT '耗时',
  `METHOD` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '操作方法',
  `PARAMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '方法参数',
  `IP` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者IP',
  `CREATE_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作地点',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1008 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (890, 'MrBird', '修改角色', 1144, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:40:57 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:40:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (891, 'MrBird', '修改角色', 267, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=75, roleName=可怜, remark=, createTime=null, modifyTime=Thu Jun 13 16:47:00 CST 2019, menuIds=115)\"', '127.0.0.1', '2019-06-13 08:47:01', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (892, 'MrBird', '修改角色', 478, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:47:15 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:47:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (893, 'MrBird', '删除角色', 233, 'cc.mrbird.febs.system.controller.RoleController.deleteRoles()', ' roleIds: \"75\"', '127.0.0.1', '2019-06-13 08:47:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (894, 'MrBird', '修改用户', 128, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=tester, password=null, deptId=6, email=tester@qq.com, mobile=13888888888, status=1, createTime=null, modifyTime=Thu Jun 13 16:56:29 CST 2019, lastLoginTime=null, sex=1, avatar=null, theme=null, isTab=null, description=我是测试用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '127.0.0.1', '2019-06-13 08:56:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (895, 'MrBird', '修改用户', 323, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=tester, password=null, deptId=6, email=tester@qq.com, mobile=13888888888, status=1, createTime=null, modifyTime=Thu Jun 13 16:56:36 CST 2019, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是测试用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '127.0.0.1', '2019-06-13 08:56:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (896, 'MrBird', '修改菜单/按钮', 172, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 16:57:10 CST 2019)\"', '127.0.0.1', '2019-06-13 08:57:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (897, 'MrBird', '修改菜单/按钮', 164, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=4, parentId=1, menuName=角色管理, url=/system/role, perms=role:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 16:57:18 CST 2019)\"', '127.0.0.1', '2019-06-13 08:57:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (898, 'MrBird', '修改菜单/按钮', 81, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=5, parentId=1, menuName=菜单管理, url=/system/menu, perms=menu:view, icon=, type=0, orderNum=3, createTime=null, modifyTime=Thu Jun 13 16:57:33 CST 2019)\"', '127.0.0.1', '2019-06-13 08:57:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (899, 'MrBird', '修改角色', 436, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:59:24 CST 2019, menuIds=1,3,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:59:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (900, 'MrBird', '修改角色', 329, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 16:59:55 CST 2019, menuIds=1,3,11,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 08:59:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (901, 'MrBird', '修改角色', 270, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:00:39 CST 2019, menuIds=1,3,11,12,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:00:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (902, 'MrBird', '修改角色', 238, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:01:47 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:01:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (903, 'MrBird', '修改角色', 202, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:02:28 CST 2019, menuIds=1,3,11,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:02:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (904, 'MrBird', '修改角色', 446, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:14:28 CST 2019, menuIds=1,3,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:14:29', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (905, 'MrBird', '修改角色', 150, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:14:47 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:14:48', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (906, 'MrBird', '修改角色', 88, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:14:55 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:14:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (907, 'MrBird', '修改角色', 177, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:18:58 CST 2019, menuIds=1,3,11,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:18:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (908, 'MrBird', '修改角色', 286, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:22:52 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:22:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (909, 'MrBird', '修改角色', 105, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:23:08 CST 2019, menuIds=1,3,11,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:23:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (910, 'MrBird', '修改角色', 275, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 17:32:55 CST 2019, menuIds=1,3,11,13,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 09:32:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (911, 'MrBird', '修改角色', 348, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:53:31 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:53:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (912, 'MrBird', '修改角色', 114, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:53:49 CST 2019, menuIds=1,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:53:50', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (913, 'MrBird', '修改角色', 255, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:54:08 CST 2019, menuIds=1,3,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:54:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (914, 'MrBird', '修改菜单/按钮', 51, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view啊, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 18:54:28 CST 2019)\"', '127.0.0.1', '2019-06-13 10:54:28', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (915, 'MrBird', '修改菜单/按钮', 150, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 18:54:46 CST 2019)\"', '127.0.0.1', '2019-06-13 10:54:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (916, 'MrBird', '修改角色', 259, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 18:55:01 CST 2019, menuIds=1,3,11,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 10:55:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (917, 'MrBird', '修改菜单/按钮', 118, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:viewa, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 18:57:57 CST 2019)\"', '127.0.0.1', '2019-06-13 10:57:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (918, 'MrBird', '修改角色', 431, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 19:13:30 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '127.0.0.1', '2019-06-13 11:13:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (919, 'MrBird', '修改菜单/按钮', 157, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 19:13:44 CST 2019)\"', '127.0.0.1', '2019-06-13 11:13:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (920, 'MrBird', '修改菜单/按钮', 149, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=3, parentId=1, menuName=用户管理, url=/system/user, perms=user:view, icon=layui-icon-meh, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 19:13:55 CST 2019)\"', '127.0.0.1', '2019-06-13 11:13:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (921, 'MrBird', '修改菜单/按钮', 163, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, url=, perms=, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 19:14:34 CST 2019)\"', '127.0.0.1', '2019-06-13 11:14:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (922, 'MrBird', '修改菜单/按钮', 146, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=2, parentId=0, menuName=系统监控, url=, perms=, icon=layui-icon-alert, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 19:20:40 CST 2019)\"', '127.0.0.1', '2019-06-13 11:20:40', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (923, 'MrBird', '修改角色', 70, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 21:24:53 CST 2019, menuIds=1,3,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 13:24:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (924, 'MrBird', '修改角色', 22, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Thu Jun 13 21:25:06 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,5,17,18,19,6,20,21,22,2,8,23,10,24,136,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,109,110,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 13:25:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (925, 'MrBird', '修改角色', 60, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:24:09 CST 2019, menuIds=1,3,4,14,5,6,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:24:10', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (926, 'MrBird', '修改角色', 69, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:24:58 CST 2019, menuIds=1,3,4,5,6,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:24:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (927, 'scott', '新增角色', 5, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=76, roleName=1341234, remark=, createTime=Thu Jun 13 22:25:21 CST 2019, modifyTime=null, menuIds=)\"', '127.0.0.1', '2019-06-13 14:25:21', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (928, 'MrBird', '新增菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=162, parentId=4, menuName=导出角色, url=null, perms=role:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:29:00 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:29:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (929, 'MrBird', '修改菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=162, parentId=4, menuName=导出Excel, url=null, perms=role:export, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:29:11 CST 2019)\"', '172.18.96.1', '2019-06-13 14:29:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (930, 'MrBird', '新增菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=163, parentId=5, menuName=导出Excel, url=null, perms=menu:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:29:32 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:29:32', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (931, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=164, parentId=6, menuName=导出Excel, url=null, perms=dept:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:29:58 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:29:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (932, 'MrBird', '修改菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=8, parentId=2, menuName=在线用户, url=/monitor/online, perms=online:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 22:30:30 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (933, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=10, parentId=2, menuName=系统日志, url=/monitor/log, perms=log:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 22:30:37 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (934, 'MrBird', '修改菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=113, parentId=2, menuName=Redis监控, url=/monitor/redis/info, perms=redis:view, icon=, type=0, orderNum=4, createTime=null, modifyTime=Thu Jun 13 22:30:44 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:45', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (935, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=114, parentId=2, menuName=Redis终端, url=/monitor/redis/terminal, perms=redis:terminal:view, icon=, type=0, orderNum=5, createTime=null, modifyTime=Thu Jun 13 22:30:53 CST 2019)\"', '172.18.96.1', '2019-06-13 14:30:54', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (936, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=139, parentId=137, menuName=代码生成, url=/generator/generator, perms=generator:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 22:31:38 CST 2019)\"', '172.18.96.1', '2019-06-13 14:31:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (937, 'MrBird', '新增菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=165, parentId=138, menuName=修改配置, url=null, perms=configure:config:update, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:32:08 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:32:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (938, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=165, parentId=138, menuName=修改配置, url=null, perms=generator:configure:update, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:32:19 CST 2019)\"', '172.18.96.1', '2019-06-13 14:32:20', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (939, 'MrBird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=166, parentId=139, menuName=生成代码, url=null, perms=generator:generate, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:32:50 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:32:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (940, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=167, parentId=125, menuName=模板下载, url=null, perms=eximport:template, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:33:36 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:33:37', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (941, 'MrBird', '新增菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=168, parentId=125, menuName=导出Excel, url=null, perms=eximport:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:33:56 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:33:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (942, 'MrBird', '新增菜单/按钮', 4, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=169, parentId=125, menuName=导入Excel, url=null, perms=eximport:import, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:34:19 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:34:19', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (943, 'MrBird', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=170, parentId=10, menuName=导出Excel, url=null, perms=log:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:34:55 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:34:55', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (944, 'MrBird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=171, parentId=136, menuName=删除日志, url=null, perms=loginLog:delete, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:35:26 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:35:27', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (945, 'MrBird', '修改菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=136, parentId=2, menuName=登录日志, url=/monitor/loginlog, perms=loginlog:view, icon=, type=0, orderNum=3, createTime=null, modifyTime=Thu Jun 13 22:35:56 CST 2019)\"', '172.18.96.1', '2019-06-13 14:35:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (946, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=171, parentId=136, menuName=删除日志, url=null, perms=loginlog:delete, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:36:07 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (947, 'MrBird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=172, parentId=136, menuName=导出Excel, url=null, perms=loginlog:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:36:25 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:36:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (948, 'MrBird', '修改菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=127, parentId=2, menuName=请求追踪, url=/monitor/httptrace, perms=httptrace:view, icon=, type=0, orderNum=6, createTime=null, modifyTime=Thu Jun 13 22:36:43 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (949, 'MrBird', '修改菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=129, parentId=128, menuName=JVM信息, url=/monitor/jvm, perms=jvm:view, icon=, type=0, orderNum=1, createTime=null, modifyTime=Thu Jun 13 22:36:50 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:51', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (950, 'MrBird', '修改菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=130, parentId=128, menuName=Tomcat信息, url=/monitor/tomcat, perms=tomcat:view, icon=, type=0, orderNum=2, createTime=null, modifyTime=Thu Jun 13 22:36:57 CST 2019)\"', '172.18.96.1', '2019-06-13 14:36:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (951, 'MrBird', '修改菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=131, parentId=128, menuName=服务器信息, url=/monitor/server, perms=server:view, icon=, type=0, orderNum=3, createTime=null, modifyTime=Thu Jun 13 22:37:03 CST 2019)\"', '172.18.96.1', '2019-06-13 14:37:04', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (952, 'MrBird', '新增菜单/按钮', 4, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=173, parentId=102, menuName=导出Excel, url=null, perms=job:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:37:24 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:37:25', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (953, 'MrBird', '新增菜单/按钮', 5, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=174, parentId=109, menuName=导出Excel, url=null, perms=joblog:export, icon=null, type=1, orderNum=null, createTime=Thu Jun 13 22:37:46 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-13 14:37:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (954, 'MrBird', '修改菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=174, parentId=109, menuName=导出Excel, url=null, perms=job:log:export, icon=null, type=1, orderNum=null, createTime=null, modifyTime=Thu Jun 13 22:38:02 CST 2019)\"', '172.18.96.1', '2019-06-13 14:38:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (955, 'MrBird', '修改角色', 75, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:39:57 CST 2019, menuIds=1,3,4,5,163,6,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:39:57', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (956, 'MrBird', '修改角色', 67, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，只可查看，不可操作, createTime=null, modifyTime=Thu Jun 13 22:42:14 CST 2019, menuIds=1,3,4,5,163,6,164,2,8,10,136,113,114,127,128,129,130,131,101,102,109,137,138,139,115,132,133,135,134,126,116,117,119,120,121,122,123,118,125)\"', '172.18.96.1', '2019-06-13 14:42:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (957, 'MrBird', '删除角色', 129, 'cc.mrbird.febs.system.controller.RoleController.deleteRoles()', ' roleIds: \"76\"', '192.168.33.1', '2019-06-14 05:58:39', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (958, 'MrBird', '修改角色', 242, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=管理员, remark=管理员，拥有所有操作权限, createTime=null, modifyTime=Fri Jun 14 14:38:42 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '192.168.33.1', '2019-06-14 06:38:43', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (959, 'MrBird', '修改用户', 112, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=tester, password=null, deptId=6, email=tester@qq.com, mobile=13888888888, status=1, createTime=null, modifyTime=Fri Jun 14 15:04:29 CST 2019, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是测试用户, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=68, roleName=null)\"', '192.168.33.1', '2019-06-14 07:04:30', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (960, 'MrBird', '修改角色', 768, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=68, roleName=系统监控员, remark=负责系统监控模块, createTime=null, modifyTime=Fri Jun 14 15:05:10 CST 2019, menuIds=2,8,23,10,24,136,113,114,127,128,129,130,131)\"', '192.168.33.1', '2019-06-14 07:05:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (961, 'MrBird', '修改菜单/按钮', 57, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=6, parentId=1, menuName=部门管理, url=/system/dept, perms=dept:view, icon=, type=0, orderNum=4, createTime=null, modifyTime=Fri Jun 14 19:55:59 CST 2019)\"', '172.18.96.1', '2019-06-14 19:56:00', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (962, 'MrBird', '修改角色', 77, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限, createTime=null, modifyTime=Fri Jun 14 20:47:47 CST 2019, menuIds=1,3,161,4,14,162,5,17,163,6,20,164,2,8,10,170,136,172,113,114,127,128,129,130,131,101,102,173,109,174,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '172.18.96.1', '2019-06-14 20:47:47', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (963, 'MrBird', '新增角色', 61, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=77, roleName=Redis监控员, remark=负责Redis模块, createTime=Fri Jun 14 20:49:21 CST 2019, modifyTime=null, menuIds=2,113,114)\"', '172.18.96.1', '2019-06-14 20:49:22', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (964, 'MrBird', '新增角色', 66, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=78, roleName=系统监控员, remark=负责整个系统监控模块, createTime=Fri Jun 14 20:50:06 CST 2019, modifyTime=null, menuIds=2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131)\"', '172.18.96.1', '2019-06-14 20:50:07', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (965, 'MrBird', '新增角色', 62, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=79, roleName=跑批人员, remark=负责任务调度跑批模块, createTime=Fri Jun 14 20:51:01 CST 2019, modifyTime=null, menuIds=101,102,103,104,105,106,107,108,173,109,110,174)\"', '172.18.96.1', '2019-06-14 20:51:02', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (966, 'MrBird', '新增角色', 58, 'cc.mrbird.febs.system.controller.RoleController.addRole()', ' role: \"Role(roleId=80, roleName=开发人员, remark=拥有代码生成模块的权限, createTime=Fri Jun 14 20:51:25 CST 2019, modifyTime=null, menuIds=137,138,165,139,166)\"', '172.18.96.1', '2019-06-14 20:51:26', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (967, 'MrBird', '修改角色', 72, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限(●\'◡\'●), createTime=null, modifyTime=Fri Jun 14 20:51:57 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '172.18.96.1', '2019-06-14 20:51:58', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (968, 'MrBird', '修改角色', 27, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Fri Jun 14 20:52:14 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '172.18.96.1', '2019-06-14 20:52:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (969, 'MrBird', '新增用户', 20, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=45, username=Scott, password=1d685729d113cfd03872f154939bee1c, deptId=null, email=scott@gmail.com, mobile=17722222222, status=1, createTime=Fri Jun 14 20:55:52 CST 2019, modifyTime=null, lastLoginTime=null, sex=0, avatar=default.jpg, theme=black, isTab=1, description=我是scott。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '172.18.96.1', '2019-06-14 20:55:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (970, 'MrBird', '新增部门', 14, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=7, parentId=0, deptName=开发部, orderNum=1, createTime=Fri Jun 14 20:56:40 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:56:41', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (971, 'MrBird', '新增部门', 17, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=2, parentId=1, deptName=开发一部, orderNum=1, createTime=Fri Jun 14 20:58:46 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:58:46', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (972, 'MrBird', '新增部门', 5, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=3, parentId=1, deptName=开发二部, orderNum=2, createTime=Fri Jun 14 20:58:55 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:58:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (973, 'MrBird', '新增部门', 6, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=4, parentId=0, deptName=采购部, orderNum=2, createTime=Fri Jun 14 20:59:55 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 20:59:56', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (974, 'MrBird', '新增部门', 13, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=5, parentId=0, deptName=财务部, orderNum=3, createTime=Fri Jun 14 21:00:08 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:08', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (975, 'MrBird', '新增部门', 5, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=6, parentId=0, deptName=销售部, orderNum=4, createTime=Fri Jun 14 21:00:15 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:15', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (976, 'MrBird', '新增部门', 5, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=7, parentId=0, deptName=工程部, orderNum=5, createTime=Fri Jun 14 21:00:41 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:42', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (977, 'MrBird', '新增部门', 12, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=8, parentId=0, deptName=行政部, orderNum=6, createTime=Fri Jun 14 21:00:48 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:00:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (978, 'MrBird', '新增部门', 4, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=9, parentId=0, deptName=人力资源部, orderNum=7, createTime=Fri Jun 14 21:01:14 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:01:14', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (979, 'MrBird', '新增部门', 12, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=10, parentId=0, deptName=系统部, orderNum=7, createTime=Fri Jun 14 21:01:30 CST 2019, modifyTime=null)\"', '172.18.96.1', '2019-06-14 21:01:31', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (980, 'MrBird', '修改部门', 15, 'cc.mrbird.febs.system.controller.DeptController.updateDept()', ' dept: \"Dept(deptId=9, parentId=0, deptName=人力资源部, orderNum=8, createTime=null, modifyTime=Fri Jun 14 21:01:34 CST 2019)\"', '172.18.96.1', '2019-06-14 21:01:34', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (981, 'MrBird', '修改用户', 26, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=2, username=Scott, password=null, deptId=10, email=scott@gmail.com, mobile=17722222222, status=1, createTime=null, modifyTime=Fri Jun 14 21:02:10 CST 2019, lastLoginTime=null, sex=0, avatar=null, theme=null, isTab=null, description=我是scott。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=2, roleName=null)\"', '172.18.96.1', '2019-06-14 21:02:11', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (982, 'MrBird', '新增用户', 15, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=3, username=Reina, password=1461afff857c02afbfb768aa3771503d, deptId=4, email=Reina@hotmail.com, mobile=17711111111, status=1, createTime=Fri Jun 14 21:07:37 CST 2019, modifyTime=null, lastLoginTime=null, sex=1, avatar=default.jpg, theme=black, isTab=1, description=由于公款私用，已被封禁。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=77, roleName=null)\"', '172.18.96.1', '2019-06-14 21:07:38', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (983, 'MrBird', '修改用户', 15, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=3, username=Reina, password=null, deptId=4, email=Reina@hotmail.com, mobile=17711111111, status=0, createTime=null, modifyTime=Fri Jun 14 21:08:48 CST 2019, lastLoginTime=null, sex=1, avatar=null, theme=null, isTab=null, description=由于公款私用，已被封禁。, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=77, roleName=null)\"', '172.18.96.1', '2019-06-14 21:08:49', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (984, 'MrBird', '新增用户', 14, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=4, username=Micaela, password=9f2daa2c7bed6870fcbb5b9a51d6300e, deptId=10, email=Micaela@163.com, mobile=17733333333, status=1, createTime=Fri Jun 14 21:10:13 CST 2019, modifyTime=null, lastLoginTime=null, sex=0, avatar=default.jpg, theme=black, isTab=1, description=我叫米克拉, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=78, roleName=null)\"', '172.18.96.1', '2019-06-14 21:10:13', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (985, 'MrBird', '新增用户', 6, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=5, username=Jana, password=176679b77b3c3e352bd3b30ddc81083e, deptId=8, email=Jana@126.com, mobile=17744444444, status=1, createTime=Fri Jun 14 21:12:16 CST 2019, modifyTime=null, lastLoginTime=null, sex=1, avatar=default.jpg, theme=black, isTab=1, description=大家好，我叫简娜, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=79, roleName=null)\"', '172.18.96.1', '2019-06-14 21:12:16', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (986, 'MrBird', '新增用户', 63, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=6, username=Georgie, password=dffc683378cdaa015a0ee9554c532225, deptId=3, email=Georgie@qq.com, mobile=17766666666, status=1, createTime=Fri Jun 14 21:15:09 CST 2019, modifyTime=null, lastLoginTime=null, sex=2, avatar=default.jpg, theme=black, isTab=1, description=生产环境执行rm -rf *，账号封禁中T T, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=80, roleName=null)\"', '172.18.96.1', '2019-06-14 21:15:09', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (987, 'MrBird', '修改用户', 54, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=6, username=Georgie, password=null, deptId=3, email=Georgie@qq.com, mobile=17766666666, status=1, createTime=null, modifyTime=Fri Jun 14 21:15:44 CST 2019, lastLoginTime=null, sex=2, avatar=null, theme=null, isTab=null, description=生产执行rm -rf *，账号封禁T T, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=80, roleName=null)\"', '172.18.96.1', '2019-06-14 21:15:44', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (988, 'MrBird', '新增用户', 24, 'cc.mrbird.febs.system.controller.UserController.addUser()', ' user: \"User(userId=7, username=Margot, password=31379841b9f4bfde22b8b40471e9a6ce, deptId=9, email=Margot@qq.com, mobile=13444444444, status=1, createTime=Fri Jun 14 21:17:52 CST 2019, modifyTime=null, lastLoginTime=null, sex=1, avatar=default.jpg, theme=black, isTab=1, description=大家好我叫玛戈, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=77,78, roleName=null)\"', '172.18.96.1', '2019-06-14 21:17:53', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (989, 'MrBird', '修改用户', 67, 'cc.mrbird.febs.system.controller.UserController.updateUser()', ' user: \"User(userId=7, username=Margot, password=null, deptId=9, email=Margot@qq.com, mobile=13444444444, status=1, createTime=null, modifyTime=Fri Jun 14 21:18:59 CST 2019, lastLoginTime=null, sex=1, avatar=null, theme=null, isTab=null, description=大家好我叫玛戈, deptName=null, createTimeFrom=null, createTimeTo=null, roleId=78,79,80, roleName=null)\"', '172.18.96.1', '2019-06-14 21:18:59', '内网IP|0|0|内网IP|内网IP');
INSERT INTO `t_log` VALUES (990, 'MrBird', '新增菜单/按钮', 12, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=176, parentId=0, menuName=测试bug, url=, perms=, icon=, type=0, orderNum=null, createTime=Sun Aug 11 20:12:50 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:12:51', '');
INSERT INTO `t_log` VALUES (991, 'MrBird', '新增菜单/按钮', 11, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=175, parentId=0, menuName=测试bug, url=, perms=, icon=, type=0, orderNum=null, createTime=Sun Aug 11 20:12:50 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:12:51', '');
INSERT INTO `t_log` VALUES (992, 'MrBird', '新增部门', 14, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=11, parentId=0, deptName=测试, orderNum=null, createTime=Sun Aug 11 20:13:01 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:13:02', '');
INSERT INTO `t_log` VALUES (993, 'MrBird', '新增部门', 15, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=12, parentId=0, deptName=测试, orderNum=null, createTime=Sun Aug 11 20:13:01 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:13:02', '');
INSERT INTO `t_log` VALUES (994, 'MrBird', '删除部门', 20, 'cc.mrbird.febs.system.controller.DeptController.deleteDepts()', ' deptIds: \"11,12\"', '192.168.56.1', '2019-08-11 20:13:07', '');
INSERT INTO `t_log` VALUES (995, 'MrBird', '删除菜单/按钮', 19, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"175,176\"', '192.168.56.1', '2019-08-11 20:13:13', '');
INSERT INTO `t_log` VALUES (996, 'MrBird', '新增菜单/按钮', 6, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=177, parentId=0, menuName=21341, url=, perms=, icon=, type=0, orderNum=null, createTime=Sun Aug 11 20:16:08 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:16:08', '');
INSERT INTO `t_log` VALUES (997, 'MrBird', '删除菜单/按钮', 9, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"177\"', '192.168.56.1', '2019-08-11 20:16:46', '');
INSERT INTO `t_log` VALUES (998, 'MrBird', '新增菜单/按钮', 7, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=178, parentId=0, menuName=我却认为人, url=, perms=, icon=, type=0, orderNum=null, createTime=Sun Aug 11 20:16:50 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:16:50', '');
INSERT INTO `t_log` VALUES (999, 'MrBird', '新增部门', 7, 'cc.mrbird.febs.system.controller.DeptController.addDept()', ' dept: \"Dept(deptId=13, parentId=0, deptName=发士大夫, orderNum=null, createTime=Sun Aug 11 20:16:55 CST 2019, modifyTime=null)\"', '192.168.56.1', '2019-08-11 20:16:56', '');
INSERT INTO `t_log` VALUES (1000, 'MrBird', '删除部门', 15, 'cc.mrbird.febs.system.controller.DeptController.deleteDepts()', ' deptIds: \"13\"', '192.168.56.1', '2019-08-11 20:17:00', '');
INSERT INTO `t_log` VALUES (1001, 'MrBird', '删除菜单/按钮', 15, 'cc.mrbird.febs.system.controller.MenuController.deleteMenus()', ' menuIds: \"178\"', '192.168.56.1', '2019-08-11 20:17:04', '');
INSERT INTO `t_log` VALUES (1002, 'MrBird', '新增菜单/按钮', 17, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=175, parentId=2, menuName=Swagger文档, url=, perms=, icon=, type=0, orderNum=8, createTime=Sun Aug 18 17:25:35 CST 2019, modifyTime=null)\"', '127.0.0.1', '2019-08-18 17:25:36', '');
INSERT INTO `t_log` VALUES (1003, 'MrBird', '修改菜单/按钮', 16, 'cc.mrbird.febs.system.controller.MenuController.updateMenu()', ' menu: \"Menu(menuId=175, parentId=2, menuName=Swagger文档, url=/monitor/swagger, perms=swagger:view, icon=, type=0, orderNum=8, createTime=null, modifyTime=Sun Aug 18 17:25:58 CST 2019)\"', '127.0.0.1', '2019-08-18 17:25:59', '');
INSERT INTO `t_log` VALUES (1004, 'MrBird', '修改角色', 44, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=1, roleName=系统管理员, remark=系统管理员，拥有所有操作权限 ^_^, createTime=null, modifyTime=Sun Aug 18 17:26:19 CST 2019, menuIds=1,3,11,12,13,160,161,4,14,15,16,162,5,17,18,19,163,6,20,21,22,164,2,8,23,10,24,170,136,171,172,113,114,127,128,129,130,131,175,101,102,103,104,105,106,107,108,173,109,110,174,137,138,165,139,166,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '127.0.0.1', '2019-08-18 17:26:19', '');
INSERT INTO `t_log` VALUES (1005, 'MrBird', '修改角色', 17, 'cc.mrbird.febs.system.controller.RoleController.updateRole()', ' role: \"Role(roleId=2, roleName=注册账户, remark=注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限, createTime=null, modifyTime=Sun Aug 18 17:36:01 CST 2019, menuIds=1,3,161,4,14,162,5,17,163,6,20,164,2,8,10,170,136,172,113,114,127,128,129,130,131,175,101,102,173,109,174,137,138,139,115,132,133,135,134,126,159,116,117,119,120,121,122,123,118,125,167,168,169)\"', '127.0.0.1', '2019-08-18 17:36:02', '');
INSERT INTO `t_log` VALUES (1006, 'Scott', '新增菜单/按钮', 13, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=176, parentId=0, menuName=1234, url=null, perms=null, icon=null, type=1, orderNum=null, createTime=Sun Aug 18 17:37:09 CST 2019, modifyTime=null)\"', '127.0.0.1', '2019-08-18 17:37:10', '');
INSERT INTO `t_log` VALUES (1007, 'Scott', '新增菜单/按钮', 14, 'cc.mrbird.febs.system.controller.MenuController.addMenu()', ' menu: \"Menu(menuId=177, parentId=0, menuName=513241, url=, perms=, icon=, type=0, orderNum=null, createTime=Sun Aug 18 17:38:30 CST 2019, modifyTime=null)\"', '127.0.0.1', '2019-08-18 17:38:30', '');

-- ----------------------------
-- Table structure for t_login_log
-- ----------------------------
DROP TABLE IF EXISTS `t_login_log`;
CREATE TABLE `t_login_log`  (
  `ID` bigint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `LOGIN_TIME` datetime(0) NOT NULL COMMENT '登录时间',
  `LOCATION` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录地点',
  `IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `SYSTEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `BROWSER` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_login_log
-- ----------------------------
INSERT INTO `t_login_log` VALUES (64, 'mrbird', '2019-08-11 20:12:31', '', '192.168.56.1', 'Windows 10', 'Chrome 75');
INSERT INTO `t_login_log` VALUES (65, 'mrbird', '2019-08-18 17:10:27', '', '127.0.0.1', 'Windows 10', 'Chrome 75');
INSERT INTO `t_login_log` VALUES (66, 'scott', '2019-08-18 17:35:32', '', '127.0.0.1', 'Windows 10', 'Chrome 75');
INSERT INTO `t_login_log` VALUES (67, 'mrbird', '2019-08-18 17:35:53', '', '127.0.0.1', 'Windows 10', 'Chrome 75');
INSERT INTO `t_login_log` VALUES (68, 'scott', '2019-08-18 17:36:17', '', '127.0.0.1', 'Windows 10', 'Chrome 75');
INSERT INTO `t_login_log` VALUES (69, 'mrbird', '2019-08-18 17:39:24', '', '127.0.0.1', 'Windows 10', 'Chrome 75');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单/按钮ID',
  `PARENT_ID` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `MENU_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单/按钮名称',
  `URL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单URL',
  `PERMS` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限标识',
  `ICON` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `TYPE` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型 0菜单 1按钮',
  `ORDER_NUM` bigint(20) NULL DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 178 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, 0, '系统管理', NULL, NULL, 'layui-icon-setting', '0', 1, '2017-12-27 16:39:07', NULL);
INSERT INTO `t_menu` VALUES (2, 0, '系统监控', '', '', 'layui-icon-alert', '0', 2, '2017-12-27 16:45:51', '2019-06-13 11:20:40');
INSERT INTO `t_menu` VALUES (3, 1, '用户管理', '/system/user', 'user:view', 'layui-icon-meh', '0', 1, '2017-12-27 16:47:13', '2019-06-13 11:13:55');
INSERT INTO `t_menu` VALUES (4, 1, '角色管理', '/system/role', 'role:view', '', '0', 2, '2017-12-27 16:48:09', '2019-06-13 08:57:19');
INSERT INTO `t_menu` VALUES (5, 1, '菜单管理', '/system/menu', 'menu:view', '', '0', 3, '2017-12-27 16:48:57', '2019-06-13 08:57:34');
INSERT INTO `t_menu` VALUES (6, 1, '部门管理', '/system/dept', 'dept:view', '', '0', 4, '2017-12-27 16:57:33', '2019-06-14 19:56:00');
INSERT INTO `t_menu` VALUES (8, 2, '在线用户', '/monitor/online', 'online:view', '', '0', 1, '2017-12-27 16:59:33', '2019-06-13 14:30:31');
INSERT INTO `t_menu` VALUES (10, 2, '系统日志', '/monitor/log', 'log:view', '', '0', 2, '2017-12-27 17:00:50', '2019-06-13 14:30:37');
INSERT INTO `t_menu` VALUES (11, 3, '新增用户', NULL, 'user:add', NULL, '1', NULL, '2017-12-27 17:02:58', NULL);
INSERT INTO `t_menu` VALUES (12, 3, '修改用户', NULL, 'user:update', NULL, '1', NULL, '2017-12-27 17:04:07', NULL);
INSERT INTO `t_menu` VALUES (13, 3, '删除用户', NULL, 'user:delete', NULL, '1', NULL, '2017-12-27 17:04:58', NULL);
INSERT INTO `t_menu` VALUES (14, 4, '新增角色', NULL, 'role:add', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (15, 4, '修改角色', NULL, 'role:update', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (16, 4, '删除角色', NULL, 'role:delete', NULL, '1', NULL, '2017-12-27 17:06:38', NULL);
INSERT INTO `t_menu` VALUES (17, 5, '新增菜单', NULL, 'menu:add', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (18, 5, '修改菜单', NULL, 'menu:update', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (19, 5, '删除菜单', NULL, 'menu:delete', NULL, '1', NULL, '2017-12-27 17:08:02', NULL);
INSERT INTO `t_menu` VALUES (20, 6, '新增部门', NULL, 'dept:add', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (21, 6, '修改部门', NULL, 'dept:update', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (22, 6, '删除部门', NULL, 'dept:delete', NULL, '1', NULL, '2017-12-27 17:09:24', NULL);
INSERT INTO `t_menu` VALUES (23, 8, '踢出用户', NULL, 'user:kickout', NULL, '1', NULL, '2017-12-27 17:11:13', NULL);
INSERT INTO `t_menu` VALUES (24, 10, '删除日志', NULL, 'log:delete', NULL, '1', NULL, '2017-12-27 17:11:45', '2019-06-06 05:56:40');
INSERT INTO `t_menu` VALUES (101, 0, '任务调度', NULL, NULL, 'layui-icon-time-circle', '0', 3, '2018-02-24 15:52:57', NULL);
INSERT INTO `t_menu` VALUES (102, 101, '定时任务', '/job/job', 'job:view', '', '0', 1, '2018-02-24 15:53:53', '2018-04-25 09:05:12');
INSERT INTO `t_menu` VALUES (103, 102, '新增任务', NULL, 'job:add', NULL, '1', NULL, '2018-02-24 15:55:10', NULL);
INSERT INTO `t_menu` VALUES (104, 102, '修改任务', NULL, 'job:update', NULL, '1', NULL, '2018-02-24 15:55:53', NULL);
INSERT INTO `t_menu` VALUES (105, 102, '删除任务', NULL, 'job:delete', NULL, '1', NULL, '2018-02-24 15:56:18', NULL);
INSERT INTO `t_menu` VALUES (106, 102, '暂停任务', NULL, 'job:pause', NULL, '1', NULL, '2018-02-24 15:57:08', NULL);
INSERT INTO `t_menu` VALUES (107, 102, '恢复任务', NULL, 'job:resume', NULL, '1', NULL, '2018-02-24 15:58:21', NULL);
INSERT INTO `t_menu` VALUES (108, 102, '立即执行任务', NULL, 'job:run', NULL, '1', NULL, '2018-02-24 15:59:45', NULL);
INSERT INTO `t_menu` VALUES (109, 101, '调度日志', '/job/log', 'job:log:view', '', '0', 2, '2018-02-24 16:00:45', '2019-06-09 02:48:19');
INSERT INTO `t_menu` VALUES (110, 109, '删除日志', NULL, 'job:log:delete', NULL, '1', NULL, '2018-02-24 16:01:21', NULL);
INSERT INTO `t_menu` VALUES (113, 2, 'Redis监控', '/monitor/redis/info', 'redis:view', '', '0', 4, '2018-06-28 14:29:42', '2019-06-13 14:30:45');
INSERT INTO `t_menu` VALUES (114, 2, 'Redis终端', '/monitor/redis/terminal', 'redis:terminal:view', '', '0', 5, '2018-06-28 15:35:21', '2019-06-13 14:30:54');
INSERT INTO `t_menu` VALUES (115, 0, '其他模块', NULL, NULL, 'layui-icon-gift', '0', 5, '2019-05-27 10:18:07', NULL);
INSERT INTO `t_menu` VALUES (116, 115, 'Apex图表', '', '', NULL, '0', 2, '2019-05-27 10:21:35', NULL);
INSERT INTO `t_menu` VALUES (117, 116, '线性图表', '/others/apex/line', 'apex:line:view', NULL, '0', 1, '2019-05-27 10:24:49', NULL);
INSERT INTO `t_menu` VALUES (118, 115, '高德地图', '/others/map', 'map:view', '', '0', 3, '2019-05-27 17:13:12', '2019-06-12 15:33:00');
INSERT INTO `t_menu` VALUES (119, 116, '面积图表', '/others/apex/area', 'apex:area:view', NULL, '0', 2, '2019-05-27 18:49:22', NULL);
INSERT INTO `t_menu` VALUES (120, 116, '柱形图表', '/others/apex/column', 'apex:column:view', NULL, '0', 3, '2019-05-27 18:51:33', NULL);
INSERT INTO `t_menu` VALUES (121, 116, '雷达图表', '/others/apex/radar', 'apex:radar:view', NULL, '0', 4, '2019-05-27 18:56:05', NULL);
INSERT INTO `t_menu` VALUES (122, 116, '条形图表', '/others/apex/bar', 'apex:bar:view', NULL, '0', 5, '2019-05-27 18:57:02', NULL);
INSERT INTO `t_menu` VALUES (123, 116, '混合图表', '/others/apex/mix', 'apex:mix:view', '', '0', 6, '2019-05-27 18:58:04', '2019-06-06 02:55:23');
INSERT INTO `t_menu` VALUES (125, 115, '导入导出', '/others/eximport', 'others:eximport:view', '', '0', 4, '2019-05-27 19:01:57', '2019-06-13 01:20:14');
INSERT INTO `t_menu` VALUES (126, 132, '系统图标', '/others/febs/icon', 'febs:icons:view', '', '0', 4, '2019-05-27 19:03:18', '2019-06-06 03:05:26');
INSERT INTO `t_menu` VALUES (127, 2, '请求追踪', '/monitor/httptrace', 'httptrace:view', '', '0', 6, '2019-05-27 19:06:38', '2019-06-13 14:36:43');
INSERT INTO `t_menu` VALUES (128, 2, '系统信息', NULL, NULL, NULL, '0', 7, '2019-05-27 19:08:23', NULL);
INSERT INTO `t_menu` VALUES (129, 128, 'JVM信息', '/monitor/jvm', 'jvm:view', '', '0', 1, '2019-05-27 19:08:50', '2019-06-13 14:36:51');
INSERT INTO `t_menu` VALUES (130, 128, 'Tomcat信息', '/monitor/tomcat', 'tomcat:view', '', '0', 2, '2019-05-27 19:09:26', '2019-06-13 14:36:57');
INSERT INTO `t_menu` VALUES (131, 128, '服务器信息', '/monitor/server', 'server:view', '', '0', 3, '2019-05-27 19:10:07', '2019-06-13 14:37:04');
INSERT INTO `t_menu` VALUES (132, 115, 'FEBS组件', '', '', NULL, '0', 1, '2019-05-27 19:13:54', NULL);
INSERT INTO `t_menu` VALUES (133, 132, '表单组件', '/others/febs/form', 'febs:form:view', NULL, '0', 1, '2019-05-27 19:14:45', NULL);
INSERT INTO `t_menu` VALUES (134, 132, 'FEBS工具', '/others/febs/tools', 'febs:tools:view', '', '0', 3, '2019-05-29 10:11:22', '2019-06-12 13:21:27');
INSERT INTO `t_menu` VALUES (135, 132, '表单组合', '/others/febs/form/group', 'febs:formgroup:view', NULL, '0', 2, '2019-05-29 10:16:19', NULL);
INSERT INTO `t_menu` VALUES (136, 2, '登录日志', '/monitor/loginlog', 'loginlog:view', '', '0', 3, '2019-05-29 15:56:15', '2019-06-13 14:35:56');
INSERT INTO `t_menu` VALUES (137, 0, '代码生成', '', NULL, 'layui-icon-verticalright', '0', 4, '2019-06-03 15:35:58', NULL);
INSERT INTO `t_menu` VALUES (138, 137, '生成配置', '/generator/configure', 'generator:configure:view', NULL, '0', 1, '2019-06-03 15:38:36', NULL);
INSERT INTO `t_menu` VALUES (139, 137, '代码生成', '/generator/generator', 'generator:view', '', '0', 2, '2019-06-03 15:39:15', '2019-06-13 14:31:38');
INSERT INTO `t_menu` VALUES (159, 132, '其他组件', '/others/febs/others', 'others:febs:others', '', '0', 5, '2019-06-12 07:51:08', '2019-06-12 07:51:40');
INSERT INTO `t_menu` VALUES (160, 3, '密码重置', NULL, 'user:password:reset', NULL, '1', NULL, '2019-06-13 08:40:13', NULL);
INSERT INTO `t_menu` VALUES (161, 3, '导出Excel', NULL, 'user:export', NULL, '1', NULL, '2019-06-13 08:40:34', NULL);
INSERT INTO `t_menu` VALUES (162, 4, '导出Excel', NULL, 'role:export', NULL, '1', NULL, '2019-06-13 14:29:00', '2019-06-13 14:29:11');
INSERT INTO `t_menu` VALUES (163, 5, '导出Excel', NULL, 'menu:export', NULL, '1', NULL, '2019-06-13 14:29:32', NULL);
INSERT INTO `t_menu` VALUES (164, 6, '导出Excel', NULL, 'dept:export', NULL, '1', NULL, '2019-06-13 14:29:59', NULL);
INSERT INTO `t_menu` VALUES (165, 138, '修改配置', NULL, 'generator:configure:update', NULL, '1', NULL, '2019-06-13 14:32:09', '2019-06-13 14:32:20');
INSERT INTO `t_menu` VALUES (166, 139, '生成代码', NULL, 'generator:generate', NULL, '1', NULL, '2019-06-13 14:32:51', NULL);
INSERT INTO `t_menu` VALUES (167, 125, '模板下载', NULL, 'eximport:template', NULL, '1', NULL, '2019-06-13 14:33:37', NULL);
INSERT INTO `t_menu` VALUES (168, 125, '导出Excel', NULL, 'eximport:export', NULL, '1', NULL, '2019-06-13 14:33:57', NULL);
INSERT INTO `t_menu` VALUES (169, 125, '导入Excel', NULL, 'eximport:import', NULL, '1', NULL, '2019-06-13 14:34:19', NULL);
INSERT INTO `t_menu` VALUES (170, 10, '导出Excel', NULL, 'log:export', NULL, '1', NULL, '2019-06-13 14:34:55', NULL);
INSERT INTO `t_menu` VALUES (171, 136, '删除日志', NULL, 'loginlog:delete', NULL, '1', NULL, '2019-06-13 14:35:27', '2019-06-13 14:36:08');
INSERT INTO `t_menu` VALUES (172, 136, '导出Excel', NULL, 'loginlog:export', NULL, '1', NULL, '2019-06-13 14:36:26', NULL);
INSERT INTO `t_menu` VALUES (173, 102, '导出Excel', NULL, 'job:export', NULL, '1', NULL, '2019-06-13 14:37:25', NULL);
INSERT INTO `t_menu` VALUES (174, 109, '导出Excel', NULL, 'job:log:export', NULL, '1', NULL, '2019-06-13 14:37:46', '2019-06-13 14:38:02');
INSERT INTO `t_menu` VALUES (175, 2, 'Swagger文档', '/monitor/swagger', 'swagger:view', '', '0', 8, '2019-08-18 17:25:36', '2019-08-18 17:25:59');
INSERT INTO `t_menu` VALUES (176, 0, '1234', NULL, NULL, NULL, '1', NULL, '2019-08-18 17:37:10', NULL);
INSERT INTO `t_menu` VALUES (177, 0, '513241', '', '', '', '0', NULL, '2019-08-18 17:38:30', NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `REMARK` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '系统管理员，拥有所有操作权限 ^_^', '2019-06-14 16:23:11', '2019-08-18 17:26:19');
INSERT INTO `t_role` VALUES (2, '注册账户', '注册账户，拥有查看，新增权限（新增用户除外）和导出Excel权限', '2019-06-14 16:00:15', '2019-08-18 17:36:02');
INSERT INTO `t_role` VALUES (77, 'Redis监控员', '负责Redis模块', '2019-06-14 20:49:22', NULL);
INSERT INTO `t_role` VALUES (78, '系统监控员', '负责整个系统监控模块', '2019-06-14 20:50:07', NULL);
INSERT INTO `t_role` VALUES (79, '跑批人员', '负责任务调度跑批模块', '2019-06-14 20:51:02', NULL);
INSERT INTO `t_role` VALUES (80, '开发人员', '拥有代码生成模块的权限', '2019-06-14 20:51:26', NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID',
  `MENU_ID` bigint(20) NOT NULL COMMENT '菜单/按钮ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (77, 2);
INSERT INTO `t_role_menu` VALUES (77, 113);
INSERT INTO `t_role_menu` VALUES (77, 114);
INSERT INTO `t_role_menu` VALUES (78, 2);
INSERT INTO `t_role_menu` VALUES (78, 8);
INSERT INTO `t_role_menu` VALUES (78, 23);
INSERT INTO `t_role_menu` VALUES (78, 10);
INSERT INTO `t_role_menu` VALUES (78, 24);
INSERT INTO `t_role_menu` VALUES (78, 170);
INSERT INTO `t_role_menu` VALUES (78, 136);
INSERT INTO `t_role_menu` VALUES (78, 171);
INSERT INTO `t_role_menu` VALUES (78, 172);
INSERT INTO `t_role_menu` VALUES (78, 113);
INSERT INTO `t_role_menu` VALUES (78, 114);
INSERT INTO `t_role_menu` VALUES (78, 127);
INSERT INTO `t_role_menu` VALUES (78, 128);
INSERT INTO `t_role_menu` VALUES (78, 129);
INSERT INTO `t_role_menu` VALUES (78, 130);
INSERT INTO `t_role_menu` VALUES (78, 131);
INSERT INTO `t_role_menu` VALUES (79, 101);
INSERT INTO `t_role_menu` VALUES (79, 102);
INSERT INTO `t_role_menu` VALUES (79, 103);
INSERT INTO `t_role_menu` VALUES (79, 104);
INSERT INTO `t_role_menu` VALUES (79, 105);
INSERT INTO `t_role_menu` VALUES (79, 106);
INSERT INTO `t_role_menu` VALUES (79, 107);
INSERT INTO `t_role_menu` VALUES (79, 108);
INSERT INTO `t_role_menu` VALUES (79, 173);
INSERT INTO `t_role_menu` VALUES (79, 109);
INSERT INTO `t_role_menu` VALUES (79, 110);
INSERT INTO `t_role_menu` VALUES (79, 174);
INSERT INTO `t_role_menu` VALUES (80, 137);
INSERT INTO `t_role_menu` VALUES (80, 138);
INSERT INTO `t_role_menu` VALUES (80, 165);
INSERT INTO `t_role_menu` VALUES (80, 139);
INSERT INTO `t_role_menu` VALUES (80, 166);
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 11);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 13);
INSERT INTO `t_role_menu` VALUES (1, 160);
INSERT INTO `t_role_menu` VALUES (1, 161);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 15);
INSERT INTO `t_role_menu` VALUES (1, 16);
INSERT INTO `t_role_menu` VALUES (1, 162);
INSERT INTO `t_role_menu` VALUES (1, 5);
INSERT INTO `t_role_menu` VALUES (1, 17);
INSERT INTO `t_role_menu` VALUES (1, 18);
INSERT INTO `t_role_menu` VALUES (1, 19);
INSERT INTO `t_role_menu` VALUES (1, 163);
INSERT INTO `t_role_menu` VALUES (1, 6);
INSERT INTO `t_role_menu` VALUES (1, 20);
INSERT INTO `t_role_menu` VALUES (1, 21);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 164);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 8);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (1, 10);
INSERT INTO `t_role_menu` VALUES (1, 24);
INSERT INTO `t_role_menu` VALUES (1, 170);
INSERT INTO `t_role_menu` VALUES (1, 136);
INSERT INTO `t_role_menu` VALUES (1, 171);
INSERT INTO `t_role_menu` VALUES (1, 172);
INSERT INTO `t_role_menu` VALUES (1, 113);
INSERT INTO `t_role_menu` VALUES (1, 114);
INSERT INTO `t_role_menu` VALUES (1, 127);
INSERT INTO `t_role_menu` VALUES (1, 128);
INSERT INTO `t_role_menu` VALUES (1, 129);
INSERT INTO `t_role_menu` VALUES (1, 130);
INSERT INTO `t_role_menu` VALUES (1, 131);
INSERT INTO `t_role_menu` VALUES (1, 175);
INSERT INTO `t_role_menu` VALUES (1, 101);
INSERT INTO `t_role_menu` VALUES (1, 102);
INSERT INTO `t_role_menu` VALUES (1, 103);
INSERT INTO `t_role_menu` VALUES (1, 104);
INSERT INTO `t_role_menu` VALUES (1, 105);
INSERT INTO `t_role_menu` VALUES (1, 106);
INSERT INTO `t_role_menu` VALUES (1, 107);
INSERT INTO `t_role_menu` VALUES (1, 108);
INSERT INTO `t_role_menu` VALUES (1, 173);
INSERT INTO `t_role_menu` VALUES (1, 109);
INSERT INTO `t_role_menu` VALUES (1, 110);
INSERT INTO `t_role_menu` VALUES (1, 174);
INSERT INTO `t_role_menu` VALUES (1, 137);
INSERT INTO `t_role_menu` VALUES (1, 138);
INSERT INTO `t_role_menu` VALUES (1, 165);
INSERT INTO `t_role_menu` VALUES (1, 139);
INSERT INTO `t_role_menu` VALUES (1, 166);
INSERT INTO `t_role_menu` VALUES (1, 115);
INSERT INTO `t_role_menu` VALUES (1, 132);
INSERT INTO `t_role_menu` VALUES (1, 133);
INSERT INTO `t_role_menu` VALUES (1, 135);
INSERT INTO `t_role_menu` VALUES (1, 134);
INSERT INTO `t_role_menu` VALUES (1, 126);
INSERT INTO `t_role_menu` VALUES (1, 159);
INSERT INTO `t_role_menu` VALUES (1, 116);
INSERT INTO `t_role_menu` VALUES (1, 117);
INSERT INTO `t_role_menu` VALUES (1, 119);
INSERT INTO `t_role_menu` VALUES (1, 120);
INSERT INTO `t_role_menu` VALUES (1, 121);
INSERT INTO `t_role_menu` VALUES (1, 122);
INSERT INTO `t_role_menu` VALUES (1, 123);
INSERT INTO `t_role_menu` VALUES (1, 118);
INSERT INTO `t_role_menu` VALUES (1, 125);
INSERT INTO `t_role_menu` VALUES (1, 167);
INSERT INTO `t_role_menu` VALUES (1, 168);
INSERT INTO `t_role_menu` VALUES (1, 169);
INSERT INTO `t_role_menu` VALUES (2, 1);
INSERT INTO `t_role_menu` VALUES (2, 3);
INSERT INTO `t_role_menu` VALUES (2, 161);
INSERT INTO `t_role_menu` VALUES (2, 4);
INSERT INTO `t_role_menu` VALUES (2, 14);
INSERT INTO `t_role_menu` VALUES (2, 162);
INSERT INTO `t_role_menu` VALUES (2, 5);
INSERT INTO `t_role_menu` VALUES (2, 17);
INSERT INTO `t_role_menu` VALUES (2, 163);
INSERT INTO `t_role_menu` VALUES (2, 6);
INSERT INTO `t_role_menu` VALUES (2, 20);
INSERT INTO `t_role_menu` VALUES (2, 164);
INSERT INTO `t_role_menu` VALUES (2, 2);
INSERT INTO `t_role_menu` VALUES (2, 8);
INSERT INTO `t_role_menu` VALUES (2, 10);
INSERT INTO `t_role_menu` VALUES (2, 170);
INSERT INTO `t_role_menu` VALUES (2, 136);
INSERT INTO `t_role_menu` VALUES (2, 172);
INSERT INTO `t_role_menu` VALUES (2, 113);
INSERT INTO `t_role_menu` VALUES (2, 114);
INSERT INTO `t_role_menu` VALUES (2, 127);
INSERT INTO `t_role_menu` VALUES (2, 128);
INSERT INTO `t_role_menu` VALUES (2, 129);
INSERT INTO `t_role_menu` VALUES (2, 130);
INSERT INTO `t_role_menu` VALUES (2, 131);
INSERT INTO `t_role_menu` VALUES (2, 175);
INSERT INTO `t_role_menu` VALUES (2, 101);
INSERT INTO `t_role_menu` VALUES (2, 102);
INSERT INTO `t_role_menu` VALUES (2, 173);
INSERT INTO `t_role_menu` VALUES (2, 109);
INSERT INTO `t_role_menu` VALUES (2, 174);
INSERT INTO `t_role_menu` VALUES (2, 137);
INSERT INTO `t_role_menu` VALUES (2, 138);
INSERT INTO `t_role_menu` VALUES (2, 139);
INSERT INTO `t_role_menu` VALUES (2, 115);
INSERT INTO `t_role_menu` VALUES (2, 132);
INSERT INTO `t_role_menu` VALUES (2, 133);
INSERT INTO `t_role_menu` VALUES (2, 135);
INSERT INTO `t_role_menu` VALUES (2, 134);
INSERT INTO `t_role_menu` VALUES (2, 126);
INSERT INTO `t_role_menu` VALUES (2, 159);
INSERT INTO `t_role_menu` VALUES (2, 116);
INSERT INTO `t_role_menu` VALUES (2, 117);
INSERT INTO `t_role_menu` VALUES (2, 119);
INSERT INTO `t_role_menu` VALUES (2, 120);
INSERT INTO `t_role_menu` VALUES (2, 121);
INSERT INTO `t_role_menu` VALUES (2, 122);
INSERT INTO `t_role_menu` VALUES (2, 123);
INSERT INTO `t_role_menu` VALUES (2, 118);
INSERT INTO `t_role_menu` VALUES (2, 125);
INSERT INTO `t_role_menu` VALUES (2, 167);
INSERT INTO `t_role_menu` VALUES (2, 168);
INSERT INTO `t_role_menu` VALUES (2, 169);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `DEPT_ID` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `EMAIL` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `MOBILE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `STATUS` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 0锁定 1有效',
  `CREATE_TIME` datetime(0) NOT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `LAST_LOGIN_TIME` datetime(0) NULL DEFAULT NULL COMMENT '最近访问时间',
  `SSEX` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 0男 1女 2保密',
  `IS_TAB` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启tab，0关闭 1开启',
  `THEME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题',
  `AVATAR` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'MrBird', 'cb62ad1497597283961545d608f80241', 1, 'mrbird@qq.com', '17788888888', '1', '2019-06-14 20:39:22', '2019-06-14 20:44:42', '2019-08-18 17:39:25', '0', '1', 'white', 'cnrhVkzwxjPwAaCfPbdc.png', '我是帅比作者。');
INSERT INTO `t_user` VALUES (2, 'Scott', '1d685729d113cfd03872f154939bee1c', 10, 'scott@gmail.com', '17722222222', '1', '2019-06-14 20:55:53', '2019-06-14 21:05:43', '2019-08-18 17:36:18', '0', '1', 'black', 'gaOngJwsRYRaVAuXXcmB.png', '我是scott。');
INSERT INTO `t_user` VALUES (3, 'Reina', '1461afff857c02afbfb768aa3771503d', 4, 'Reina@hotmail.com', '17711111111', '0', '2019-06-14 21:07:38', '2019-06-14 21:09:06', '2019-06-14 21:08:26', '1', '1', 'black', '5997fedcc7bd4cffbd350b40d1b5b987.jpg', '由于公款私用，已被封禁。');
INSERT INTO `t_user` VALUES (4, 'Micaela', '9f2daa2c7bed6870fcbb5b9a51d6300e', 10, 'Micaela@163.com', '17733333333', '1', '2019-06-14 21:10:13', '2019-06-14 21:11:26', '2019-06-14 21:10:37', '0', '0', 'white', '20180414165909.jpg', '我叫米克拉');
INSERT INTO `t_user` VALUES (5, 'Jana', '176679b77b3c3e352bd3b30ddc81083e', 8, 'Jana@126.com', '17744444444', '1', '2019-06-14 21:12:16', '2019-06-14 21:12:52', '2019-06-14 21:12:32', '1', '1', 'white', '20180414165821.jpg', '大家好，我叫简娜');
INSERT INTO `t_user` VALUES (6, 'Georgie', 'dffc683378cdaa015a0ee9554c532225', 3, 'Georgie@qq.com', '17766666666', '0', '2019-06-14 21:15:09', '2019-06-14 21:16:25', '2019-06-14 21:16:11', '2', '0', 'black', 'BiazfanxmamNRoxxVxka.png', '生产执行rm -rf *，账号封禁T T');
INSERT INTO `t_user` VALUES (7, 'Margot', '31379841b9f4bfde22b8b40471e9a6ce', 9, 'Margot@qq.com', '13444444444', '1', '2019-06-14 21:17:53', '2019-06-14 21:18:59', '2019-06-14 21:18:07', '1', '1', 'white', '20180414165834.jpg', '大家好我叫玛戈');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `USER_ID` bigint(20) NOT NULL COMMENT '用户ID',
  `ROLE_ID` bigint(20) NOT NULL COMMENT '角色ID'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (2, 2);
INSERT INTO `t_user_role` VALUES (3, 77);
INSERT INTO `t_user_role` VALUES (4, 78);
INSERT INTO `t_user_role` VALUES (5, 79);
INSERT INTO `t_user_role` VALUES (6, 80);
INSERT INTO `t_user_role` VALUES (7, 78);
INSERT INTO `t_user_role` VALUES (7, 79);
INSERT INTO `t_user_role` VALUES (7, 80);

SET FOREIGN_KEY_CHECKS = 1;
