SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- 创建数据库
DROP DATABASE IF EXISTS `bs_xk`;
CREATE DATABASE `bs_xk` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `bs_xk`;

-- 1. 管理员信息表
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `level` int(10) NULL DEFAULT 1 COMMENT '权限等级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员信息表' ROW_FORMAT = DYNAMIC;

-- 2. 学院信息表
DROP TABLE IF EXISTS `xueyuan_info`;
CREATE TABLE `xueyuan_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学院介绍',
  `score` int(10) NULL DEFAULT NULL COMMENT '学分限制',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学院信息表' ROW_FORMAT = Dynamic;

-- 3. 专业信息表（含外键关联学院）
DROP TABLE IF EXISTS `zhuanye_info`;
CREATE TABLE `zhuanye_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '专业名称',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '系名',
  `xueyuanId` bigint(20) NULL DEFAULT NULL COMMENT '学院ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_zhuanye_xueyuan` (`xueyuanId`),
  CONSTRAINT `fk_zhuanye_xueyuan` FOREIGN KEY (`xueyuanId`) REFERENCES `xueyuan_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '专业信息表' ROW_FORMAT = Dynamic;

-- 4. 教师信息表（含外键关联专业）
DROP TABLE IF EXISTS `teacher_info`;
CREATE TABLE `teacher_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `zhicheng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '职称',
  `level` int(10) NULL DEFAULT 2 COMMENT '权限等级',
  `zhuanyeId` bigint(20) NULL DEFAULT NULL COMMENT '专业ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_teacher_zhuanye` (`zhuanyeId`),
  CONSTRAINT `fk_teacher_zhuanye` FOREIGN KEY (`zhuanyeId`) REFERENCES `zhuanye_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教师信息表' ROW_FORMAT = DYNAMIC;

-- 5. 学生信息表（含外键关联学院）
DROP TABLE IF EXISTS `student_info`;
CREATE TABLE `student_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '年龄',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '学号',
  `level` int(10) NULL DEFAULT 3 COMMENT '权限等级',
  `xueyuanId` bigint(20) NULL DEFAULT NULL COMMENT '学院ID',
  `score` int(10) NULL DEFAULT 0 COMMENT '总学分',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_student_xueyuan` (`xueyuanId`),
  CONSTRAINT `fk_student_xueyuan` FOREIGN KEY (`xueyuanId`) REFERENCES `xueyuan_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '学生信息表' ROW_FORMAT = DYNAMIC;

-- 6. 课程信息表（含外键关联专业、教师）
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程介绍',
  `zhuanyeId` bigint(20) NULL DEFAULT NULL COMMENT '专业ID',
  `score` int(10) NULL DEFAULT NULL COMMENT '课程学分',
  `teacherId` bigint(20) NULL DEFAULT NULL COMMENT '教师ID',
  `kaiban` int(10) NULL DEFAULT 0 COMMENT '开班人数',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时段',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课地点',
  `yixuan` int(10) NULL DEFAULT 0 COMMENT '已选人数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_class_zhuanye` (`zhuanyeId`),
  KEY `fk_class_teacher` (`teacherId`),
  CONSTRAINT `fk_class_zhuanye` FOREIGN KEY (`zhuanyeId`) REFERENCES `zhuanye_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_class_teacher` FOREIGN KEY (`teacherId`) REFERENCES `teacher_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '课程信息表' ROW_FORMAT = Dynamic;

-- 7. 选课信息表（含外键关联专业、教师、学生）
DROP TABLE IF EXISTS `xuanke_info`;
CREATE TABLE `xuanke_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程介绍',
  `zhuanyeId` bigint(20) NULL DEFAULT NULL COMMENT '专业ID',
  `score` int(10) NULL DEFAULT NULL COMMENT '课程学分',
  `teacherId` bigint(20) NULL DEFAULT NULL COMMENT '教师ID',
  `kaiban` int(10) NULL DEFAULT 0 COMMENT '开班人数',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课时段',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '上课地点',
  `studentId` bigint(20) NULL DEFAULT NULL COMMENT '学生ID',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '课程状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_xuanke_zhuanye` (`zhuanyeId`),
  KEY `fk_xuanke_teacher` (`teacherId`),
  KEY `fk_xuanke_student` (`studentId`),
  CONSTRAINT `fk_xuanke_zhuanye` FOREIGN KEY (`zhuanyeId`) REFERENCES `zhuanye_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_xuanke_teacher` FOREIGN KEY (`teacherId`) REFERENCES `teacher_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_xuanke_student` FOREIGN KEY (`studentId`) REFERENCES `student_info` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '选课信息表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;