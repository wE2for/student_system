-- 设置数据库客户端连接字符集为utf8mb4，支持完整中文及emoji表情
SET NAMES utf8mb4;
-- 临时关闭外键约束检查，避免删除/创建表时触发外键报错
SET FOREIGN_KEY_CHECKS = 0;

-- 如果选课系统数据库bs_xk已存在，则删除，避免重复创建报错
DROP DATABASE IF EXISTS `bs_xk`;
-- 创建选课系统数据库bs_xk
CREATE DATABASE `bs_xk`;
-- 切换当前操作的数据库为bs_xk
use `bs_xk`;

-- ----------------------------
-- Table structure for admin_info 管理员信息表
-- ----------------------------
-- 如果管理员信息表已存在，则删除
DROP TABLE IF EXISTS `admin_info`;
-- 创建管理员信息表，存储系统管理员账号、密码、个人信息及权限等级
CREATE TABLE `admin_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID，主键自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名，管理员登录账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码，管理员登录密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `level` int(10) NULL DEFAULT 1 COMMENT '权限等级，默认1为最高管理员权限',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin_info 管理员表初始化数据
-- ----------------------------
INSERT INTO `admin_info` VALUES (1, 'admin', '123456', '男', '29', '18888888888', 1);
INSERT INTO `admin_info` VALUES (15, 'admin2', '123456', '男', '23', '18877778888', 1);
INSERT INTO `admin_info` VALUES (16, 'admin3', '123456', '女', '23', '18877778888', 1);
INSERT INTO `admin_info` VALUES (17, 'admin4', '123456', '女', '23', '18877778888', 1);
INSERT INTO `admin_info` VALUES (22, 'admin5', '123456', '女', '23', '18877778888', 1);
INSERT INTO `admin_info` VALUES (23, 'admin6', '123456', '女', '23', '18877778888', 1);
INSERT INTO `admin_info` VALUES (24, 'admin7', '123456', '女', '23', '18877778888', 1);
INSERT INTO `admin_info` VALUES (25, 'admin8', '123456', '女', '23', '18877778888', 1);

-- ----------------------------
-- Table structure for class_info 课程信息表
-- ----------------------------
-- 如果课程信息表已存在，则删除
DROP TABLE IF EXISTS `class_info`;
-- 创建课程信息表，存储所有可选课程的详细信息
CREATE TABLE `class_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程介绍/说明',
  `zhuanyeId` bigint(20) NULL DEFAULT NULL COMMENT '专业ID，关联专业表，标识课程归属专业',
  `score` int(10) NULL DEFAULT NULL COMMENT '课程学分',
  `teacherId` bigint(20) NULL DEFAULT NULL COMMENT '教师ID，关联教师表，授课老师',
  `kaiban` int(10) NULL DEFAULT 0 COMMENT '开班人数，课程最大可选人数',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时段，如周一第一大节',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课地点，如教室号',
  `yixuan` int(10) NULL DEFAULT 0 COMMENT '已选人数，当前已选课学生数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info 课程表初始化数据
-- ----------------------------
INSERT INTO `class_info` VALUES (13, 'Java基础', '学会Java基础', 8, 3, 26, 20, '周一第一大节', '3A101', 2);
INSERT INTO `class_info` VALUES (14, 'Python基础', '学会Python基础', 8, 3, 27, 20, '周二第一大节', '3A102', 2);

-- ----------------------------
-- Table structure for student_info 学生信息表
-- ----------------------------
-- 如果学生信息表已存在，则删除
DROP TABLE IF EXISTS `student_info`;
-- 创建学生信息表，存储学生登录账号、个人信息、学院、学分等数据
CREATE TABLE `student_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID，主键自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名，学生姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码，学生登录密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学号，学生唯一标识',
  `level` int(10) NULL DEFAULT 3 COMMENT '权限等级，默认3为学生权限',
  `xueyuanId` bigint(20) NULL DEFAULT NULL COMMENT '学院ID，关联学院表，学生所属学院',
  `score` int(10) NULL DEFAULT 0 COMMENT '总学分，学生已修总学分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student_info 学生表初始化数据
-- ----------------------------
INSERT INTO `student_info` VALUES (27, '张三', '123456', '男', '24', '20000', 3, 1, 3);
INSERT INTO `student_info` VALUES (28, '李四', '123456', '男', '23', '20001', 3, 2, 2);
INSERT INTO `student_info` VALUES (29, '王五', '123456', '男', '23', '20002', 3, 3, 2);
INSERT INTO `student_info` VALUES (30, '赵六', '123456', '男', '23', '20003', 3, 4, 3);
INSERT INTO `student_info` VALUES (31, '李七', '123456', '女', '24', '20005', 3, 7, 2);

-- ----------------------------
-- Table structure for teacher_info 教师信息表
-- ----------------------------
-- 如果教师信息表已存在，则删除
DROP TABLE IF EXISTS `teacher_info`;
-- 创建教师信息表，存储教师登录账号、个人信息、职称、授课专业等信息
CREATE TABLE `teacher_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID，主键自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名，教师姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码，教师登录密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `zhicheng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称，如教授、副教授',
  `level` int(10) NULL DEFAULT 2 COMMENT '权限等级，默认2为教师权限',
  `zhuanyeId` bigint(20) NULL DEFAULT NULL COMMENT '专业ID，关联专业表，教师所属专业',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '教师信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher_info 教师表初始化数据
-- ----------------------------
INSERT INTO `teacher_info` VALUES (26, '张老师', '123456', '女', '35', '教授', 2, 8);
INSERT INTO `teacher_info` VALUES (27, '赵老师', '123456', '男', '29', '教授', 2, 8);
INSERT INTO `teacher_info` VALUES (28, '王老师', '123456', '女', '28', '副教授', 2, 9);
INSERT INTO `teacher_info` VALUES (31, '李老师', '123456', '女', '28', '副教授', 2, 9);
INSERT INTO `teacher_info` VALUES (32, '夏老张', '123456', '女', '28', '副教授', 2, 12);
INSERT INTO `teacher_info` VALUES (33, '倪老师', '123456', '女', '28', '副教授', 2, 9);

-- ----------------------------
-- Table structure for xuanke_info 选课信息表
-- ----------------------------
-- 如果选课信息表已存在，则删除
DROP TABLE IF EXISTS `xuanke_info`;
-- 创建选课信息表，核心关联表，记录学生选课的所有信息
CREATE TABLE `xuanke_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程介绍',
  `zhuanyeId` bigint(20) NULL DEFAULT NULL COMMENT '专业ID，课程归属专业',
  `score` int(10) NULL DEFAULT NULL COMMENT '课程学分',
  `teacherId` bigint(20) NULL DEFAULT NULL COMMENT '教师ID，授课教师',
  `kaiban` int(10) NULL DEFAULT 0 COMMENT '开班人数，课程最大容量',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时段',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课地点',
  `studentId` bigint(20) NULL DEFAULT NULL COMMENT '学生ID，关联学生表，选课学生',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程状态，如已开课/待开课',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '选课信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xuanke_info 选课表初始化数据
-- ----------------------------
INSERT INTO `xuanke_info` VALUES (23, 'Java基础', '学会Java基础', 8, 3, 26, 20, '周一第一大节', '3A101', 28, '已开课');
INSERT INTO `xuanke_info` VALUES (24, 'Python基础', '学会Python基础', 8, 3, 27, 20, '周二第一大节', '3A102', 28, '待开课');
INSERT INTO `xuanke_info` VALUES (29, 'Java基础', '学会Java基础', 8, 3, 26, 20, '周一第一大节', '3A101', 27, '已开课');
INSERT INTO `xuanke_info` VALUES (32, 'Python基础', '学会Python基础', 8, 3, 27, 20, '周二第一大节', '3A102', 27, '待开课');

-- ----------------------------
-- Table structure for xueyuan_info 学院信息表
-- ----------------------------
-- 如果学院信息表已存在，则删除
DROP TABLE IF EXISTS `xueyuan_info`;
-- 创建学院信息表，存储学校所有学院信息
CREATE TABLE `xueyuan_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院介绍',
  `score` int(10) NULL DEFAULT NULL COMMENT '学分限制，学院学生最高可修学分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '学院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xueyuan_info 学院表初始化数据
-- ----------------------------
INSERT INTO `xueyuan_info` VALUES (1, '信息工程学院', '巴拉巴拉巴拉', 20);
INSERT INTO `xueyuan_info` VALUES (2, '计算机学院', '巴拉巴拉巴拉', 25);
INSERT INTO `xueyuan_info` VALUES (3, '软件学院', '巴拉巴拉巴拉', 30);
INSERT INTO `xueyuan_info` VALUES (4, '外国语学院', '巴拉巴拉巴拉', 25);
INSERT INTO `xueyuan_info` VALUES (7, '文学院', '巴拉巴拉巴拉', 30);

-- ----------------------------
-- Table structure for zhuanye_info 专业信息表
-- ----------------------------
-- 如果专业信息表已存在，则删除
DROP TABLE IF EXISTS `zhuanye_info`;
-- 创建专业信息表，存储各学院下属专业信息
CREATE TABLE `zhuanye_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业名称',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系名，专业所属系部',
  `xueyuanId` bigint(20) NULL DEFAULT NULL COMMENT '学院ID，关联学院表，专业所属学院',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT = '专业信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zhuanye_info 专业表初始化数据
-- ----------------------------
INSERT INTO `zhuanye_info` VALUES (8, '电子信息工程', '电子系', 1);
INSERT INTO `zhuanye_info` VALUES (9, '软件工程', '软件系', 3);
INSERT INTO `zhuanye_info` VALUES (12, '古汉语信息', '文学系', 7);

-- 恢复外键约束检查，保证数据库数据完整性
SET FOREIGN_KEY_CHECKS = 1;
