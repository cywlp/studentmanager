/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80029 (8.0.29)
 Source Host           : localhost:3306
 Source Schema         : studentmanager

 Target Server Type    : MySQL
 Target Server Version : 80029 (8.0.29)
 File Encoding         : 65001

 Date: 22/09/2022 15:52:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for s_admin
-- ----------------------------
DROP TABLE IF EXISTS `s_admin`;
CREATE TABLE `s_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_admin
-- ----------------------------
INSERT INTO `s_admin` VALUES (1, 'admin', '123456', 1);

-- ----------------------------
-- Table structure for s_attendance
-- ----------------------------
DROP TABLE IF EXISTS `s_attendance`;
CREATE TABLE `s_attendance`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `student_id` int NOT NULL,
  `type` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `attendance_course_foreign_key`(`course_id` ASC) USING BTREE,
  INDEX `attendace_student_foreign_key`(`student_id` ASC) USING BTREE,
  CONSTRAINT `attendace_student_foreign_key` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `attendance_course_foreign_key` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_attendance
-- ----------------------------
INSERT INTO `s_attendance` VALUES (13, 1, 2, '上午', '2018-09-04');
INSERT INTO `s_attendance` VALUES (14, 1, 4, '上午', '2018-09-04');
INSERT INTO `s_attendance` VALUES (15, 2, 2, '上午', '2019-07-02');

-- ----------------------------
-- Table structure for s_clazz
-- ----------------------------
DROP TABLE IF EXISTS `s_clazz`;
CREATE TABLE `s_clazz`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_clazz
-- ----------------------------
INSERT INTO `s_clazz` VALUES (1, '软件一班', '信息工程学院');
INSERT INTO `s_clazz` VALUES (4, '软件二班', '信息工程学院');
INSERT INTO `s_clazz` VALUES (5, '软件三班', '信息工程学院');

-- ----------------------------
-- Table structure for s_course
-- ----------------------------
DROP TABLE IF EXISTS `s_course`;
CREATE TABLE `s_course`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher_id` int NOT NULL,
  `course_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `selected_num` int NOT NULL DEFAULT 0,
  `max_num` int NOT NULL DEFAULT 50,
  `info` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `course_teacher_foreign`(`teacher_id` ASC) USING BTREE,
  CONSTRAINT `course_teacher_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `s_teacher` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_course
-- ----------------------------
INSERT INTO `s_course` VALUES (1, '大学英语', 9, '周三上午8点', 15, 50, '英语。');
INSERT INTO `s_course` VALUES (2, '大学数学', 10, '周三上午10点', 10, 50, '数学。');
INSERT INTO `s_course` VALUES (3, '计算机基础', 11, '周三下午14点', 8, 50, '计算机课程。');
INSERT INTO `s_course` VALUES (4, '数据结构', 18, '周一下午14点', 10, 50, '计算机课程。');
INSERT INTO `s_course` VALUES (5, '概率论', 19, '周一上午8点', 14, 50, '数学。');
INSERT INTO `s_course` VALUES (6, '编译原理', 20, '周二上午10点', 12, 50, '计算机课程。');
INSERT INTO `s_course` VALUES (7, '计算机网络', 21, '周二下午19点', 11, 50, '计算机课程。');
INSERT INTO `s_course` VALUES (8, '需求分析', 22, '周五下午14点', 11, 50, '计算机课程。');

-- ----------------------------
-- Table structure for s_leave
-- ----------------------------
DROP TABLE IF EXISTS `s_leave`;
CREATE TABLE `s_leave`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `info` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `leave_student_foreign_key`(`student_id` ASC) USING BTREE,
  CONSTRAINT `leave_student_foreign_key` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_leave
-- ----------------------------
INSERT INTO `s_leave` VALUES (13, 2, '世界这么大，想去看看', 1, '同意，你很6');

-- ----------------------------
-- Table structure for s_score
-- ----------------------------
DROP TABLE IF EXISTS `s_score`;
CREATE TABLE `s_score`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  `score` double(5, 2) NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id` ASC) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id` ASC) USING BTREE,
  CONSTRAINT `s_score_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `s_score_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 378 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_score
-- ----------------------------
INSERT INTO `s_score` VALUES (1, 2, 1, 78.00, '中等');
INSERT INTO `s_score` VALUES (2, 4, 1, 50.00, '不及格');
INSERT INTO `s_score` VALUES (3, 9, 1, 65.00, '中等');
INSERT INTO `s_score` VALUES (4, 10, 1, 79.00, '中等');
INSERT INTO `s_score` VALUES (5, 11, 1, 90.00, '优秀');
INSERT INTO `s_score` VALUES (6, 12, 1, 82.00, '优秀');
INSERT INTO `s_score` VALUES (7, 13, 1, 76.00, '中等');
INSERT INTO `s_score` VALUES (8, 14, 1, 58.00, '不及格');
INSERT INTO `s_score` VALUES (9, 15, 1, 77.00, '中等');
INSERT INTO `s_score` VALUES (10, 16, 1, 45.00, '不及格');
INSERT INTO `s_score` VALUES (11, 17, 1, 54.00, '不及格');
INSERT INTO `s_score` VALUES (12, 18, 1, 66.00, '中等');
INSERT INTO `s_score` VALUES (13, 19, 1, 72.00, '中等');
INSERT INTO `s_score` VALUES (14, 20, 1, 88.00, '优秀');
INSERT INTO `s_score` VALUES (15, 21, 1, 94.00, '优秀');
INSERT INTO `s_score` VALUES (16, 4, 2, 60.00, '中等');
INSERT INTO `s_score` VALUES (17, 13, 2, 58.00, '不及格');
INSERT INTO `s_score` VALUES (18, 15, 2, 69.00, '中等');
INSERT INTO `s_score` VALUES (19, 20, 2, 90.00, '优秀');
INSERT INTO `s_score` VALUES (20, 21, 2, 92.00, '优秀');
INSERT INTO `s_score` VALUES (21, 25, 2, 51.00, '不及格');
INSERT INTO `s_score` VALUES (22, 29, 2, 49.00, '不及格');
INSERT INTO `s_score` VALUES (23, 30, 2, 75.00, '中等');
INSERT INTO `s_score` VALUES (24, 35, 2, 85.00, '优秀');
INSERT INTO `s_score` VALUES (25, 36, 2, 92.00, '优秀');
INSERT INTO `s_score` VALUES (26, 9, 3, 86.00, '优秀');
INSERT INTO `s_score` VALUES (27, 14, 3, 81.00, '优秀');
INSERT INTO `s_score` VALUES (28, 19, 3, 78.00, '中等');
INSERT INTO `s_score` VALUES (29, 22, 3, 59.00, '不及格');
INSERT INTO `s_score` VALUES (30, 24, 3, 64.00, '中等');
INSERT INTO `s_score` VALUES (31, 28, 3, 95.00, '优秀');
INSERT INTO `s_score` VALUES (32, 33, 3, 55.00, '不及格');
INSERT INTO `s_score` VALUES (33, 36, 3, 81.00, '优秀');
INSERT INTO `s_score` VALUES (34, 2, 4, 74.00, '中等');
INSERT INTO `s_score` VALUES (35, 9, 4, 49.00, '不及格');
INSERT INTO `s_score` VALUES (36, 17, 4, 83.00, '优秀');
INSERT INTO `s_score` VALUES (37, 20, 4, 92.00, '优秀');
INSERT INTO `s_score` VALUES (38, 22, 4, 68.00, '中等');
INSERT INTO `s_score` VALUES (39, 26, 4, 57.00, '不及格');
INSERT INTO `s_score` VALUES (40, 27, 4, 77.00, '中等');
INSERT INTO `s_score` VALUES (41, 28, 4, 89.00, '优秀');
INSERT INTO `s_score` VALUES (42, 30, 4, 95.00, '优秀');
INSERT INTO `s_score` VALUES (43, 34, 4, 93.00, '优秀');
INSERT INTO `s_score` VALUES (44, 4, 5, 67.00, '中等');
INSERT INTO `s_score` VALUES (45, 9, 5, 44.00, '不及格');
INSERT INTO `s_score` VALUES (46, 10, 5, 71.00, '中等');
INSERT INTO `s_score` VALUES (47, 13, 5, 80.00, '优秀');
INSERT INTO `s_score` VALUES (48, 16, 5, 85.00, '优秀');
INSERT INTO `s_score` VALUES (49, 17, 5, 53.00, '不及格');
INSERT INTO `s_score` VALUES (50, 23, 5, 94.00, '优秀');
INSERT INTO `s_score` VALUES (51, 24, 5, 86.00, '优秀');
INSERT INTO `s_score` VALUES (52, 26, 5, 74.00, '中等');
INSERT INTO `s_score` VALUES (53, 30, 5, 79.00, '中等');
INSERT INTO `s_score` VALUES (54, 32, 5, 58.00, '不及格');
INSERT INTO `s_score` VALUES (55, 34, 5, 61.00, '中等');
INSERT INTO `s_score` VALUES (56, 35, 5, 69.00, '中等');
INSERT INTO `s_score` VALUES (57, 36, 5, 82.00, '优秀');
INSERT INTO `s_score` VALUES (58, 11, 6, 57.00, '不及格');
INSERT INTO `s_score` VALUES (59, 12, 6, 97.00, '优秀');
INSERT INTO `s_score` VALUES (60, 14, 6, 87.00, '优秀');
INSERT INTO `s_score` VALUES (61, 18, 6, 75.00, '中等');
INSERT INTO `s_score` VALUES (62, 20, 6, 52.00, '不及格');
INSERT INTO `s_score` VALUES (63, 23, 6, 93.00, '优秀');
INSERT INTO `s_score` VALUES (64, 25, 6, 83.00, '优秀');
INSERT INTO `s_score` VALUES (65, 27, 6, 73.00, '中等');
INSERT INTO `s_score` VALUES (66, 29, 6, 57.00, '不及格');
INSERT INTO `s_score` VALUES (67, 31, 6, 91.00, '优秀');
INSERT INTO `s_score` VALUES (68, 33, 6, 84.00, '优秀');
INSERT INTO `s_score` VALUES (69, 35, 6, 91.00, '优秀');
INSERT INTO `s_score` VALUES (70, 2, 7, 96.00, '优秀');
INSERT INTO `s_score` VALUES (71, 4, 7, 87.00, '优秀');
INSERT INTO `s_score` VALUES (72, 15, 7, 89.00, '优秀');
INSERT INTO `s_score` VALUES (73, 18, 7, 63.00, '中等');
INSERT INTO `s_score` VALUES (74, 19, 7, 53.00, '不及格');
INSERT INTO `s_score` VALUES (75, 23, 7, 71.00, '中等');
INSERT INTO `s_score` VALUES (76, 24, 7, 50.00, '不及格');
INSERT INTO `s_score` VALUES (77, 27, 7, 49.00, '不及格');
INSERT INTO `s_score` VALUES (78, 28, 7, 82.00, '优秀 ');
INSERT INTO `s_score` VALUES (79, 31, 7, 75.00, '中等');
INSERT INTO `s_score` VALUES (80, 33, 7, 71.00, '中等');
INSERT INTO `s_score` VALUES (81, 9, 8, 94.00, '优秀');
INSERT INTO `s_score` VALUES (82, 10, 8, 91.00, '优秀');
INSERT INTO `s_score` VALUES (83, 15, 8, 47.00, '不及格');
INSERT INTO `s_score` VALUES (84, 17, 8, 71.00, '中等');
INSERT INTO `s_score` VALUES (85, 22, 8, 88.00, '优秀');
INSERT INTO `s_score` VALUES (86, 24, 8, 55.00, '不及格');
INSERT INTO `s_score` VALUES (87, 25, 8, 67.00, '中等');
INSERT INTO `s_score` VALUES (88, 26, 8, 79.00, '中等');
INSERT INTO `s_score` VALUES (89, 32, 8, 77.00, '中等');
INSERT INTO `s_score` VALUES (90, 34, 8, 94.00, '优秀');
INSERT INTO `s_score` VALUES (91, 36, 8, 53.00, '不及格');

-- ----------------------------
-- Table structure for s_selected_course
-- ----------------------------
DROP TABLE IF EXISTS `s_selected_course`;
CREATE TABLE `s_selected_course`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `selected_course_student_fk`(`student_id` ASC) USING BTREE,
  INDEX `selected_course_course_fk`(`course_id` ASC) USING BTREE,
  CONSTRAINT `selected_course_course_fk` FOREIGN KEY (`course_id`) REFERENCES `s_course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `selected_course_student_fk` FOREIGN KEY (`student_id`) REFERENCES `s_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_selected_course
-- ----------------------------
INSERT INTO `s_selected_course` VALUES (18, 2, 1);
INSERT INTO `s_selected_course` VALUES (19, 2, 4);
INSERT INTO `s_selected_course` VALUES (20, 2, 7);
INSERT INTO `s_selected_course` VALUES (21, 4, 1);
INSERT INTO `s_selected_course` VALUES (22, 4, 2);
INSERT INTO `s_selected_course` VALUES (24, 4, 5);
INSERT INTO `s_selected_course` VALUES (25, 4, 7);
INSERT INTO `s_selected_course` VALUES (26, 9, 1);
INSERT INTO `s_selected_course` VALUES (27, 9, 3);
INSERT INTO `s_selected_course` VALUES (28, 9, 4);
INSERT INTO `s_selected_course` VALUES (29, 9, 5);
INSERT INTO `s_selected_course` VALUES (30, 9, 8);
INSERT INTO `s_selected_course` VALUES (31, 10, 1);
INSERT INTO `s_selected_course` VALUES (32, 10, 5);
INSERT INTO `s_selected_course` VALUES (33, 10, 8);
INSERT INTO `s_selected_course` VALUES (34, 11, 1);
INSERT INTO `s_selected_course` VALUES (35, 11, 6);
INSERT INTO `s_selected_course` VALUES (36, 12, 1);
INSERT INTO `s_selected_course` VALUES (37, 12, 6);
INSERT INTO `s_selected_course` VALUES (38, 13, 1);
INSERT INTO `s_selected_course` VALUES (39, 13, 2);
INSERT INTO `s_selected_course` VALUES (40, 13, 5);
INSERT INTO `s_selected_course` VALUES (41, 14, 1);
INSERT INTO `s_selected_course` VALUES (42, 14, 3);
INSERT INTO `s_selected_course` VALUES (43, 14, 6);
INSERT INTO `s_selected_course` VALUES (44, 15, 1);
INSERT INTO `s_selected_course` VALUES (45, 15, 2);
INSERT INTO `s_selected_course` VALUES (46, 15, 7);
INSERT INTO `s_selected_course` VALUES (47, 15, 8);
INSERT INTO `s_selected_course` VALUES (48, 16, 1);
INSERT INTO `s_selected_course` VALUES (49, 16, 5);
INSERT INTO `s_selected_course` VALUES (50, 17, 1);
INSERT INTO `s_selected_course` VALUES (51, 17, 4);
INSERT INTO `s_selected_course` VALUES (52, 17, 5);
INSERT INTO `s_selected_course` VALUES (53, 17, 8);
INSERT INTO `s_selected_course` VALUES (54, 18, 1);
INSERT INTO `s_selected_course` VALUES (55, 18, 6);
INSERT INTO `s_selected_course` VALUES (56, 18, 7);
INSERT INTO `s_selected_course` VALUES (57, 19, 1);
INSERT INTO `s_selected_course` VALUES (58, 19, 3);
INSERT INTO `s_selected_course` VALUES (59, 19, 7);
INSERT INTO `s_selected_course` VALUES (60, 20, 1);
INSERT INTO `s_selected_course` VALUES (61, 20, 2);
INSERT INTO `s_selected_course` VALUES (62, 20, 4);
INSERT INTO `s_selected_course` VALUES (63, 20, 6);
INSERT INTO `s_selected_course` VALUES (64, 21, 1);
INSERT INTO `s_selected_course` VALUES (65, 21, 2);
INSERT INTO `s_selected_course` VALUES (66, 22, 3);
INSERT INTO `s_selected_course` VALUES (67, 22, 4);
INSERT INTO `s_selected_course` VALUES (68, 22, 8);
INSERT INTO `s_selected_course` VALUES (69, 23, 5);
INSERT INTO `s_selected_course` VALUES (70, 23, 6);
INSERT INTO `s_selected_course` VALUES (71, 23, 7);
INSERT INTO `s_selected_course` VALUES (72, 24, 3);
INSERT INTO `s_selected_course` VALUES (73, 24, 5);
INSERT INTO `s_selected_course` VALUES (74, 24, 7);
INSERT INTO `s_selected_course` VALUES (75, 24, 8);
INSERT INTO `s_selected_course` VALUES (76, 25, 2);
INSERT INTO `s_selected_course` VALUES (77, 25, 6);
INSERT INTO `s_selected_course` VALUES (78, 25, 8);
INSERT INTO `s_selected_course` VALUES (79, 26, 4);
INSERT INTO `s_selected_course` VALUES (80, 26, 5);
INSERT INTO `s_selected_course` VALUES (81, 26, 8);
INSERT INTO `s_selected_course` VALUES (82, 27, 4);
INSERT INTO `s_selected_course` VALUES (83, 27, 6);
INSERT INTO `s_selected_course` VALUES (84, 27, 7);
INSERT INTO `s_selected_course` VALUES (85, 28, 3);
INSERT INTO `s_selected_course` VALUES (86, 28, 4);
INSERT INTO `s_selected_course` VALUES (87, 28, 7);
INSERT INTO `s_selected_course` VALUES (88, 29, 2);
INSERT INTO `s_selected_course` VALUES (89, 29, 6);
INSERT INTO `s_selected_course` VALUES (90, 30, 2);
INSERT INTO `s_selected_course` VALUES (91, 30, 4);
INSERT INTO `s_selected_course` VALUES (92, 30, 5);
INSERT INTO `s_selected_course` VALUES (93, 31, 6);
INSERT INTO `s_selected_course` VALUES (94, 31, 7);
INSERT INTO `s_selected_course` VALUES (95, 32, 5);
INSERT INTO `s_selected_course` VALUES (96, 32, 8);
INSERT INTO `s_selected_course` VALUES (97, 33, 3);
INSERT INTO `s_selected_course` VALUES (98, 33, 6);
INSERT INTO `s_selected_course` VALUES (99, 33, 7);
INSERT INTO `s_selected_course` VALUES (100, 34, 4);
INSERT INTO `s_selected_course` VALUES (101, 34, 5);
INSERT INTO `s_selected_course` VALUES (102, 34, 8);
INSERT INTO `s_selected_course` VALUES (103, 35, 2);
INSERT INTO `s_selected_course` VALUES (104, 35, 5);
INSERT INTO `s_selected_course` VALUES (105, 35, 6);
INSERT INTO `s_selected_course` VALUES (106, 36, 2);
INSERT INTO `s_selected_course` VALUES (107, 36, 3);
INSERT INTO `s_selected_course` VALUES (108, 36, 5);
INSERT INTO `s_selected_course` VALUES (109, 36, 8);

-- ----------------------------
-- Table structure for s_student
-- ----------------------------
DROP TABLE IF EXISTS `s_student`;
CREATE TABLE `s_student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `sn`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id` ASC) USING BTREE,
  CONSTRAINT `student_clazz_id_foreign` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_student
-- ----------------------------
INSERT INTO `s_student` VALUES (2, '2019900001', '张三纷', '123456', 1, '女', '13545454548', '123456', NULL);
INSERT INTO `s_student` VALUES (4, '2019900002', '王麻子', '123456', 1, '男', '13356565656', '123456', NULL);
INSERT INTO `s_student` VALUES (9, '2019900003', '马冬梅', '123456', 1, '女', '13333332133', '123456', 'bb12326f-ef6c-4d3d-a2ae-f9eb30a15ad4.jpg');
INSERT INTO `s_student` VALUES (10, '2019900004', '李天顺', '123456', 1, '男', '15632449525', '123456', NULL);
INSERT INTO `s_student` VALUES (11, '2019900005', '刘一青', '123456', 1, '女', '14758649732', '123456', NULL);
INSERT INTO `s_student` VALUES (12, '2019900006', '赵玉辰', '123456', 1, '男', '16850234908', '123456', NULL);
INSERT INTO `s_student` VALUES (13, '2019900007', '钱不锦', '123456', 1, '女', '17784650293', '123456', NULL);
INSERT INTO `s_student` VALUES (14, '2019900008', '孙雨桐', '123456', 1, '女', '15846020390', '123456', NULL);
INSERT INTO `s_student` VALUES (15, '2019900009', '周帅比', '123456', 1, '男', '19760884326', '123456', NULL);
INSERT INTO `s_student` VALUES (16, '2019900010', '吴四桂', '123456', 1, '男', '15268203008', '123456', NULL);
INSERT INTO `s_student` VALUES (17, '2019900011', '郑山河', '123456', 4, '男', '13138496752', '123456', NULL);
INSERT INTO `s_student` VALUES (18, '2019900012', '冯宁', '123456', 4, '男', '12415098723', '123456', NULL);
INSERT INTO `s_student` VALUES (19, '2019900013', '陈博涛', '123456', 4, '男', '17756984026', '123456', NULL);
INSERT INTO `s_student` VALUES (20, '2019900014', '褚洁怡', '123456', 4, '女', '16358497028', '123456', NULL);
INSERT INTO `s_student` VALUES (21, '2019900015', '卫玲', '123456', 4, '女', '15449807006', '123456', NULL);
INSERT INTO `s_student` VALUES (22, '2019900016', '蒋江降', '123456', 4, '男', '16235784690', '123456', NULL);
INSERT INTO `s_student` VALUES (23, '2019900017', '沈万才', '123456', 4, '男', '18497325064', '123456', NULL);
INSERT INTO `s_student` VALUES (24, '2019900018', '韩勾名', '123456', 4, '男', '19958024631', '123456', NULL);
INSERT INTO `s_student` VALUES (25, '2019900019', '杨阳洋', '123456', 4, '男', '17948036251', '123456', NULL);
INSERT INTO `s_student` VALUES (26, '2019900020', '朱逐凯', '123456', 4, '男', '13589640097', '123456', NULL);
INSERT INTO `s_student` VALUES (27, '2019900021', '秦晓', '123456', 5, '女', '11846492073', '123456', NULL);
INSERT INTO `s_student` VALUES (28, '2019900022', '尤琴生', '123456', 5, '女', '19742865037', '123456', NULL);
INSERT INTO `s_student` VALUES (29, '2019900023', '许清', '123456', 5, '女', '12635498705', '123456', NULL);
INSERT INTO `s_student` VALUES (30, '2019900024', '何烨华', '123456', 5, '女', '16354928037', '123456', NULL);
INSERT INTO `s_student` VALUES (31, '2019900025', '吕帆琪', '123456', 5, '女', '14923605007', '123456', NULL);
INSERT INTO `s_student` VALUES (32, '2019900026', '施杰豪', '123456', 5, '男', '15840219338', '123456', NULL);
INSERT INTO `s_student` VALUES (33, '2019900027', '孔梦宇', '123456', 5, '男', '15642879301', '123456', NULL);
INSERT INTO `s_student` VALUES (34, '2019900028', '曹除玉', '123456', 5, '女', '15290264337', '123456', NULL);
INSERT INTO `s_student` VALUES (35, '2019900029', '严莉凤', '123456', 5, '女', '18749320854', '123456', NULL);
INSERT INTO `s_student` VALUES (36, '2019900030', '华安然', '123456', 5, '女', '18330946728', '123456', NULL);

-- ----------------------------
-- Table structure for s_teacher
-- ----------------------------
DROP TABLE IF EXISTS `s_teacher`;
CREATE TABLE `s_teacher`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clazz_id` int NOT NULL,
  `sex` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '男',
  `mobile` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `sn`) USING BTREE,
  INDEX `student_clazz_id_foreign`(`clazz_id` ASC) USING BTREE,
  CONSTRAINT `s_teacher_ibfk_1` FOREIGN KEY (`clazz_id`) REFERENCES `s_clazz` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of s_teacher
-- ----------------------------
INSERT INTO `s_teacher` VALUES (9, 'T11528608730648', '张三', '123456', 1, '男', '13918655656', '123456', NULL);
INSERT INTO `s_teacher` VALUES (10, 'T11528609224588', '李四', '123456', 1, '女', '13656565656', '123456', NULL);
INSERT INTO `s_teacher` VALUES (11, 'T11528617262403', '李淑琪', '123456', 1, '男', '18989898989', '123456', NULL);
INSERT INTO `s_teacher` VALUES (18, 'T51528618654803', '夏青松', '123456', 4, '女', '15174857845', '123456', '5d447b8b-ec54-4a8e-919a-453aa7b6d33b.jpg');
INSERT INTO `s_teacher` VALUES (19, 'T51528620496571', '王永康', '123456', 4, '男', '16495835268', '123456', NULL);
INSERT INTO `s_teacher` VALUES (20, 'T51528698030647', '刘三刀', '123456', 4, '男', '17468259437', '123456', NULL);
INSERT INTO `s_teacher` VALUES (21, 'T71528600984730', '白秀莲', '123456', 5, '女', '15946871238', '123456', NULL);
INSERT INTO `s_teacher` VALUES (22, 'T71528664109807', '武静', '123456', 5, '女', '13749658179', '123456', NULL);

SET FOREIGN_KEY_CHECKS = 1;
