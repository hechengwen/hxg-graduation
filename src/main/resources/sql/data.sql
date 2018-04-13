# 管理员信息表
CREATE TABLE `admin` (
  `warden` int(30) NOT NULL AUTO_INCREMENT COMMENT '员工号',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `role` varchar(30) DEFAULT NULL COMMENT '姓名',
  `user_type` varchar(5) DEFAULT NULL COMMENT '用户类型',
  PRIMARY KEY (`warden`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


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

# 意见反馈表
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(30) DEFAULT NULL COMMENT '反馈人',
  `desc` varchar(1000) DEFAULT NULL COMMENT '反馈意见',
  `feed_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '反馈时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

# 就诊记录表
CREATE TABLE `medical_records` (
  `stu_name` varchar(30) DEFAULT NULL COMMENT '患者姓名',
  `dco_name` varchar(30) DEFAULT NULL COMMENT '就诊医生',
  `jzrq` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '就诊日期',
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
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `stock_units` varchar(50) DEFAULT NULL COMMENT '进货单位',
  `contact_person` varchar(30) DEFAULT NULL COMMENT '联系人',
  PRIMARY KEY (`drug_num`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;


# 消费记录表
CREATE TABLE `purchase_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `bh` varchar(30) DEFAULT NULL COMMENT '编号',
  `clinic_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '就诊时间',
  `drug_num` varchar(30) DEFAULT NULL COMMENT '药品编号',
  `drug_price` decimal(10,2) DEFAULT NULL COMMENT '药品进价',
  `price` decimal(10,2) DEFAULT NULL COMMENT '销售价',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '医疗费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

# 挂号表
CREATE TABLE `register` (
  `serial_number` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `registration_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '挂号时间',
  `registered_project` varchar(30) DEFAULT NULL COMMENT '挂号项目',
  `doctor` varchar(30) DEFAULT NULL COMMENT '预约医生',
  `name` varchar(30) DEFAULT NULL COMMENT '学生姓名',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '挂号费',
  PRIMARY KEY (`serial_number`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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