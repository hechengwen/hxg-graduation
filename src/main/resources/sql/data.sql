# 管理员信息表
CREATE TABLE `admin` (
  `warden` int(30) NOT NULL AUTO_INCREMENT COMMENT '员工号',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `role` varchar(30) DEFAULT NULL COMMENT '姓名',
  `user_type` varchar(5) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`warden`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('20', 'E10ADC3949BA59ABBE56E057F20F883E', '小明', '1');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('21', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('22', 'E10ADC3949BA59ABBE56E057F20F883E', '小红', '1');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('23', 'E10ADC3949BA59ABBE56E057F20F883E', '小红蛋', '1');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('24', 'E10ADC3949BA59ABBE56E057F20F883E', '小裤衩', '1');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('25', '96E79218965EB72C92A549DD5A330112', '何承文', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('26', 'E10ADC3949BA59ABBE56E057F20F883E', '胡小刚', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('27', 'E10ADC3949BA59ABBE56E057F20F883E', '戴建明', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('28', 'E10ADC3949BA59ABBE56E057F20F883E', '戴建天', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('29', 'E10ADC3949BA59ABBE56E057F20F883E', '戴建条', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('30', 'E10ADC3949BA59ABBE56E057F20F883E', '戴小鸡', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('31', 'E10ADC3949BA59ABBE56E057F20F883E', '黄亚鹏', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('32', 'E10ADC3949BA59ABBE56E057F20F883E', '黄亚琼', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('33', 'E10ADC3949BA59ABBE56E057F20F883E', '黄亚风', '0');
INSERT INTO `hxg_bishe`.`admin` (`warden`, `password`, `role`, `user_type`) VALUES ('34', 'E10ADC3949BA59ABBE56E057F20F883E', '黄小鸡', '0');


# 医生信息表
CREATE TABLE `doctor` (
  `sno` int(30) NOT NULL AUTO_INCREMENT COMMENT '医生编号',
  `name` varchar(30) DEFAULT '' COMMENT '姓名',
  `sex` varchar(5) DEFAULT '' COMMENT '性别',
  `birth` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `cynf` varchar(20) DEFAULT NULL COMMENT '从业年份',
  `positional_titles` varchar(30) DEFAULT NULL COMMENT '职称',
  `tel` varchar(20) DEFAULT '' COMMENT '联系电话',
  `email` varchar(30) CHARACTER SET utf32 DEFAULT NULL COMMENT '邮箱',
  `department` varchar(30) DEFAULT NULL COMMENT '所属科室',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('26', '何承文', '男', '1993-06-26', '2018-02-12', '主治医师', '17710363894', 'nihao@163.com', '心脏内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('27', '胡小刚', '男', '1996-06-02', '1996-06-02', '主治医师', '17710256984', '123@qq.com', '消化内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('28', '戴建明', '男', '1996-06-02', '1996-06-02', '副主治医师', '17710256984', '123@qq.com', '西医内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('29', '戴建天', '男', '1996-06-02', '1996-06-02', '副主治医师', '17710256984', '123@qq.com', '西医内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('30', '戴建条', '男', '1996-06-02', '1996-06-02', '副主治医师', '17710256984', '123@qq.com', '西医内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('31', '戴小鸡', '男', '1996-06-02', '1996-06-02', '主治医师', '17710256966', '123@qq.com', '西医内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('32', '黄亚鹏', '男', '1996-06-02', '1996-06-02', '主治医师', '17710256934', '123@qq.com', '心脏内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('33', '黄亚琼', '女', '1996-06-02', '1996-06-02', '主治医师', '17710256934', '123@qq.com', '心脏内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('34', '黄亚风', '男', '1996-06-02', '1996-06-18', '主治医师', '17710256934', '123@qq.com', '心脏内科');
INSERT INTO `hxg_bishe`.`doctor` (`sno`, `name`, `sex`, `birth`, `cynf`, `positional_titles`, `tel`, `email`, `department`) VALUES ('35', '黄小鸡', '男', '1996-06-02', '1996-06-18', '主治医师', '17710256934', '123@qq.com', '消化内科');


# 意见反馈表
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(30) DEFAULT NULL COMMENT '反馈人',
  `desc` varchar(1000) DEFAULT NULL COMMENT '反馈意见',
  `feed_time` datetime DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO `hxg_bishe`.`feedback` (`id`, `stu_name`, `desc`, `feed_time`) VALUES ('10', '小明', '1231312312案发当时嘎嘎水果 ', '2018-04-13 16:20:22');
INSERT INTO `hxg_bishe`.`feedback` (`id`, `stu_name`, `desc`, `feed_time`) VALUES ('11', '小明', '微软运维人员微软跟我去二哥岁的法国', '2018-04-13 16:24:29');
INSERT INTO `hxg_bishe`.`feedback` (`id`, `stu_name`, `desc`, `feed_time`) VALUES ('12', '小明', '阿迪斯发的发送', '2018-04-13 16:24:58');
INSERT INTO `hxg_bishe`.`feedback` (`id`, `stu_name`, `desc`, `feed_time`) VALUES ('13', '小明', '3台湾行业他和几个回去让我说的复合弓', '2018-04-13 16:25:26');
INSERT INTO `hxg_bishe`.`feedback` (`id`, `stu_name`, `desc`, `feed_time`) VALUES ('14', '小明', '651 55困5放入口屠龙阔库头发咯uk', '2018-04-13 16:28:18');



# 就诊记录表
CREATE TABLE `medical_records` (
  `stu_name` varchar(30) DEFAULT NULL COMMENT '患者姓名',
  `dco_name` varchar(30) DEFAULT NULL COMMENT '就诊医生',
  `jzrq` datetime DEFAULT NULL COMMENT '就诊日期',
  `description` varchar(100) DEFAULT NULL COMMENT '病情描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 药品信息表
CREATE TABLE `medicine` (
  `drug_num` int(20) NOT NULL AUTO_INCREMENT COMMENT '药品编号',
  `drug_name` varchar(50) DEFAULT NULL COMMENT '药品名称',
  `drug_type` varchar(50) DEFAULT NULL COMMENT '药品类型',
  `production_date` varchar(20) DEFAULT NULL COMMENT '生产日期',
  `effective_date` varchar(10) DEFAULT NULL COMMENT '有效期',
  `production_enterprise` varchar(50) DEFAULT NULL COMMENT '生产企业',
  `buy_price` decimal(10,2) DEFAULT NULL COMMENT '进货价格',
  `seller_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `number` varchar(11) DEFAULT NULL COMMENT '数量',
  `stock_units` varchar(50) DEFAULT NULL COMMENT '进货单位',
  `contact_person` varchar(30) DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`drug_num`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


# 消费记录表
CREATE TABLE `purchase_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `bh` varchar(30) DEFAULT NULL COMMENT '编号',
  `clinic_date` datetime DEFAULT NULL  COMMENT '就诊时间',
  `drug_num` varchar(30) DEFAULT NULL COMMENT '药品编号',
  `drug_price` decimal(10,2) DEFAULT NULL COMMENT '药品进价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '医疗费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 挂号表
CREATE TABLE `register` (
  `serial_number` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `registration_time` datetime DEFAULT NULL COMMENT '挂号时间',
  `registered_project` varchar(30) DEFAULT NULL COMMENT '挂号项目',
  `doctor` varchar(30) DEFAULT NULL COMMENT '预约医生',
  `name` varchar(30) DEFAULT NULL COMMENT '学生姓名',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '挂号费',
  `status` varchar(10) DEFAULT '0' COMMENT '就诊状态',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('17', '2018-04-13 15:56:07', '肾内科', '何承文', '小明', '5.00', '0');
INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('18', '2018-04-13 16:28:36', '感染科', '何承文', '小明', '5.00', '0');
INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('20', '2018-04-13 17:04:15', '心脏内科', '何承文', '小明', '5.00', '0');
INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('21', '2018-04-13 17:04:40', '心脏内科', '何承文', '小明', '5.00', '0');
INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('22', '2018-04-13 17:05:38', '心脏内科', '何承文', '小明', '5.00', '0');
INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('23', '2018-04-13 17:12:49', '心脏内科', '黄亚琼', '小明', '5.00', '0');
INSERT INTO `hxg_bishe`.`register` (`serial_number`, `registration_time`, `registered_project`, `doctor`, `name`, `cost`, `status`) VALUES ('24', '2018-04-14 22:14:54', '心脏内科', '黄亚琼', '小明', '5.00', '0');



# 学生信息表
CREATE TABLE `student` (
  `sno` int(30) NOT NULL AUTO_INCREMENT COMMENT '学号',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `sex` varchar(5) NOT NULL DEFAULT '' COMMENT '性别',
  `birth` varchar(20) DEFAULT NULL COMMENT '出生日期',
  `rxsj` varchar(20) DEFAULT NULL COMMENT '入学时间',
  `xz` varchar(20) DEFAULT NULL COMMENT '学制',
  `xb` varchar(30) DEFAULT '' COMMENT '系部',
  `bj` varchar(30) DEFAULT '' COMMENT '班级',
  `room` varchar(30) DEFAULT '' COMMENT '宿舍',
  `tel` varchar(30) DEFAULT '' COMMENT '联系电话',
  `email` varchar(30) DEFAULT '' COMMENT '邮箱',
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

INSERT INTO `hxg_bishe`.`student` (`sno`, `name`, `sex`, `birth`, `rxsj`, `xz`, `xb`, `bj`, `room`, `tel`, `email`) VALUES ('4', '小明', '男', '1993-11-26', '2012-09-01', '四年制', '经济管理学院', '1208', '408', '17710363984', '123@qq.com');
INSERT INTO `hxg_bishe`.`student` (`sno`, `name`, `sex`, `birth`, `rxsj`, `xz`, `xb`, `bj`, `room`, `tel`, `email`) VALUES ('5', '小红', '男', '1993-08-20', '2012-09-01', '四年制', '自动化学院', '1209', '406', '17710638945', '312@qq.com');
INSERT INTO `hxg_bishe`.`student` (`sno`, `name`, `sex`, `birth`, `rxsj`, `xz`, `xb`, `bj`, `room`, `tel`, `email`) VALUES ('6', '小红蛋', '男', '1993-06-05', '2012-09-01', '四年制', '自动化学院', '1204', '402', '17710363894', '123@qq.com');
INSERT INTO `hxg_bishe`.`student` (`sno`, `name`, `sex`, `birth`, `rxsj`, `xz`, `xb`, `bj`, `room`, `tel`, `email`) VALUES ('7', '小裤衩', '男', '1993-06-05', '2012-09-01', '四年制', '自动化学院', '1204', '402', '17710363894', '123@qq.com');
