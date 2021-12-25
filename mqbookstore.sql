/*
 Navicat Premium Data Transfer

 Source Server         : smallWMQ
 Source Server Type    : MySQL
 Source Server Version : 80024
 Source Host           : localhost:3306
 Source Schema         : mqbookstore

 Target Server Type    : MySQL
 Target Server Version : 80024
 File Encoding         : 65001

 Date: 25/12/2021 12:09:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_userinfo');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_userinfo');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_userinfo');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_userinfo');
INSERT INTO `auth_permission` VALUES (25, 'Can add banner', 7, 'add_banner');
INSERT INTO `auth_permission` VALUES (26, 'Can change banner', 7, 'change_banner');
INSERT INTO `auth_permission` VALUES (27, 'Can delete banner', 7, 'delete_banner');
INSERT INTO `auth_permission` VALUES (28, 'Can view banner', 7, 'view_banner');
INSERT INTO `auth_permission` VALUES (29, 'Can add book', 8, 'add_book');
INSERT INTO `auth_permission` VALUES (30, 'Can change book', 8, 'change_book');
INSERT INTO `auth_permission` VALUES (31, 'Can delete book', 8, 'delete_book');
INSERT INTO `auth_permission` VALUES (32, 'Can view book', 8, 'view_book');
INSERT INTO `auth_permission` VALUES (33, 'Can add category', 9, 'add_category');
INSERT INTO `auth_permission` VALUES (34, 'Can change category', 9, 'change_category');
INSERT INTO `auth_permission` VALUES (35, 'Can delete category', 9, 'delete_category');
INSERT INTO `auth_permission` VALUES (36, 'Can view category', 9, 'view_category');
INSERT INTO `auth_permission` VALUES (37, 'Can add order', 10, 'add_order');
INSERT INTO `auth_permission` VALUES (38, 'Can change order', 10, 'change_order');
INSERT INTO `auth_permission` VALUES (39, 'Can delete order', 10, 'delete_order');
INSERT INTO `auth_permission` VALUES (40, 'Can view order', 10, 'view_order');
INSERT INTO `auth_permission` VALUES (41, 'Can add Options', 11, 'add_options');
INSERT INTO `auth_permission` VALUES (42, 'Can change Options', 11, 'change_options');
INSERT INTO `auth_permission` VALUES (43, 'Can delete Options', 11, 'delete_options');
INSERT INTO `auth_permission` VALUES (44, 'Can view Options', 11, 'view_options');
INSERT INTO `auth_permission` VALUES (45, 'Can add Menu', 12, 'add_menu');
INSERT INTO `auth_permission` VALUES (46, 'Can change Menu', 12, 'change_menu');
INSERT INTO `auth_permission` VALUES (47, 'Can delete Menu', 12, 'delete_menu');
INSERT INTO `auth_permission` VALUES (48, 'Can view Menu', 12, 'view_menu');
INSERT INTO `auth_permission` VALUES (49, 'Can add site', 13, 'add_site');
INSERT INTO `auth_permission` VALUES (50, 'Can change site', 13, 'change_site');
INSERT INTO `auth_permission` VALUES (51, 'Can delete site', 13, 'delete_site');
INSERT INTO `auth_permission` VALUES (52, 'Can view site', 13, 'view_site');

-- ----------------------------
-- Table structure for book_book
-- ----------------------------
DROP TABLE IF EXISTS `book_book`;
CREATE TABLE `book_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(5, 2) NOT NULL,
  `number` int NOT NULL,
  `publisher` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_book_category_id_616006cd_fk_book_category_id`(`category_id`) USING BTREE,
  CONSTRAINT `book_book_category_id_616006cd_fk_book_category_id` FOREIGN KEY (`category_id`) REFERENCES `book_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_book
-- ----------------------------
INSERT INTO `book_book` VALUES (2, '三体全集', 168.00, 15, '重庆出版社', 'book/28167130.jpg', '刘慈欣', 2);
INSERT INTO `book_book` VALUES (3, '活着', 15.00, 29, '作家出版社', 'book/28305198.jpg', '余华', 3);
INSERT INTO `book_book` VALUES (4, '白鹿原', 39.00, 29, '人民文学出版社', 'book/28455199.jpg', '陈忠实', 3);
INSERT INTO `book_book` VALUES (5, '天龙八部', 123.00, 30, '广州出版社', 'book/28554176.jpg', '金庸', 4);
INSERT INTO `book_book` VALUES (6, '围城', 39.00, 30, '人民文学出版社', 'book/28830366.jpg', '钱钟书', 3);
INSERT INTO `book_book` VALUES (7, '笑傲江湖', 86.00, 30, '广州出版社', 'book/28966700.jpg', '金庸', 4);
INSERT INTO `book_book` VALUES (8, '流浪地球', 38.00, 30, '中国华侨出版社', 'book/29042135.jpg', '刘慈欣', 2);
INSERT INTO `book_book` VALUES (9, '史记', 244.60, 148, '中华书局', 'book/29217723.jpg', '司马迁', 5);
INSERT INTO `book_book` VALUES (10, '人类简史', 54.40, 27, '中信出版集团', 'book/29390556.jpg', '尤瓦尔赫拉利', 5);

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `class_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_category
-- ----------------------------
INSERT INTO `book_category` VALUES (2, '科幻小说');
INSERT INTO `book_category` VALUES (3, '经典小说');
INSERT INTO `book_category` VALUES (4, '武侠小说');
INSERT INTO `book_category` VALUES (5, '历史书');
INSERT INTO `book_category` VALUES (6, '宝宝巴士');

-- ----------------------------
-- Table structure for book_order
-- ----------------------------
DROP TABLE IF EXISTS `book_order`;
CREATE TABLE `book_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) NOT NULL,
  `book_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `num` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `book_order_user_id_909fab04_fk_user_userinfo_id`(`user_id`) USING BTREE,
  INDEX `book_order_book_id_4178112d`(`book_id`) USING BTREE,
  CONSTRAINT `book_order_book_id_4178112d_fk_book_book_id` FOREIGN KEY (`book_id`) REFERENCES `book_book` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_order_user_id_909fab04_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_order
-- ----------------------------
INSERT INTO `book_order` VALUES (24, '2021-12-24 16:02:58.740836', 9, 1, 'c55e5c410e1a4d96bfd538b472579028史记');
INSERT INTO `book_order` VALUES (25, '2021-12-24 16:03:15.253232', 2, 1, 'de9d9cd07cce4e9f8905317292c9ede2三体全集');
INSERT INTO `book_order` VALUES (26, '2021-12-24 16:03:23.200129', 10, 1, '433c3793971b4439b6cdf58fd7dd513c人类简史');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_userinfo_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2021-12-14 20:39:40.794674', '1', '三王书店', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (2, '2021-12-14 20:39:46.952202', '2', '场景图', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (3, '2021-12-14 20:39:54.088552', '3', '场景图2', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (4, '2021-12-14 20:40:25.478372', '1', '名著', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (5, '2021-12-14 20:40:27.371878', '1', '西游记', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (6, '2021-12-16 17:11:26.599043', '2', '科幻小说', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (7, '2021-12-16 17:11:34.236713', '2', '三体全集', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2021-12-16 17:14:06.225777', '3', '经典小说', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (9, '2021-12-16 17:14:08.834714', '3', '活着', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2021-12-16 17:15:49.898049', '4', '白鹿原', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (11, '2021-12-16 17:19:17.271592', '4', '武侠小说', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (12, '2021-12-16 17:19:19.313941', '5', '天龙八部', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2021-12-16 17:20:06.081937', '1', '西游记', 3, '', 8, 1);
INSERT INTO `django_admin_log` VALUES (14, '2021-12-16 17:22:10.063577', '6', '围城', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (15, '2021-12-16 17:22:57.396755', '7', '笑傲江湖', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (16, '2021-12-16 17:23:16.703289', '5', '天龙八部', 2, '[]', 8, 1);
INSERT INTO `django_admin_log` VALUES (17, '2021-12-16 17:23:51.092601', '7', '笑傲江湖', 2, '[{\"changed\": {\"fields\": [\"\\u4e66\\u7684\\u56fe\\u7247\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (18, '2021-12-16 17:26:00.317382', '8', '流浪地球', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (19, '2021-12-16 17:29:33.648918', '5', '历史书', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (20, '2021-12-16 17:29:35.162489', '9', '史记', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (21, '2021-12-16 17:31:56.834809', '10', '人类简史', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (22, '2021-12-16 17:32:54.494710', '1', '名著', 3, '', 9, 1);
INSERT INTO `django_admin_log` VALUES (23, '2021-12-16 17:49:47.715039', '1', '先锋书店', 2, '[{\"changed\": {\"fields\": [\"\\u66ff\\u4ee3\\u4fe1\\u606f\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (24, '2021-12-18 15:58:20.175229', '6', '宝宝巴士', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (25, '2021-12-19 11:27:17.425725', '3', '场景图2', 2, '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (26, '2021-12-19 11:32:42.580539', '1', '先锋书店', 2, '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (27, '2021-12-19 11:32:51.547639', '2', '场景图', 2, '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (28, '2021-12-19 11:33:54.830388', '3', '场景图2', 2, '[{\"changed\": {\"fields\": [\"\\u56fe\\u7247\"]}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (29, '2021-12-24 13:43:41.907095', '10', '人类简史', 2, '[{\"changed\": {\"fields\": [\"\\u6570\\u91cf\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (30, '2021-12-24 13:43:58.200215', '20', '246a5b98127b4c859dfb2b7a16957177白鹿原', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (31, '2021-12-24 13:43:58.206868', '19', '7237a180ef5f49749088e70bbb1d04e5三体全集', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (32, '2021-12-24 13:43:58.211078', '18', '11905a9e04124e1ab07e9b296478cafa活着', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (33, '2021-12-24 13:43:58.217064', '17', 'f5cf41f097fa4836a6b384f93dba6393三体全集', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (34, '2021-12-24 13:43:58.221084', '16', 'aa8c92e2ccfe412498dc41f48ef93b3e三体全集', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (35, '2021-12-24 13:43:58.223973', '15', 'b74ce29ac1a9488aa1e0668572cde7ba三体全集', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (36, '2021-12-24 13:43:58.226967', '14', '3812bc355a8942e49cdbc9c2b408b038活着', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (37, '2021-12-24 13:43:58.229958', '13', '2a1a9e40d34b47a9b1eef5bc61d0808e3', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (38, '2021-12-24 13:43:58.231955', '12', '3f10ea7bbd2f48d79a3694cefc0d435c7', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (39, '2021-12-24 13:43:58.235944', '11', '1aa3888445004a00ac2fb4bd8ba57e4c3', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (40, '2021-12-24 13:43:58.238934', '10', '4539ebac8e01418c8d6535bb2ed9a8a63', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (41, '2021-12-24 13:43:58.241926', '9', '6e83413b063a4ab5b2fd1e2b779e1faf2', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (42, '2021-12-24 13:43:58.244916', '8', 'e24cc828d2f24900aa750656faf10a8a6', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (43, '2021-12-24 13:43:58.246913', '3', 'f5034e26e3f948a2897abb1cc91f93a0三体全集', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (44, '2021-12-24 13:43:58.249904', '2', 'cbd8a3fb6b6c41a1b2298ec10238703b白鹿原', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (45, '2021-12-24 13:43:58.253891', '1', 'a9f4548ed765494a9f3b08bcac116107活着', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (46, '2021-12-24 13:44:05.698340', '23', '74388fef2b26431380c6eb0663b7acdf史记', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (47, '2021-12-24 13:44:05.704322', '22', '6dafaea6d47849b594017a9e45e1728e人类简史', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (48, '2021-12-24 13:44:05.708310', '21', '43a1956ad7fd4adcb9b3abeadb6051fb人类简史', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (49, '2021-12-24 13:46:46.214958', '9', '史记', 2, '[{\"changed\": {\"fields\": [\"\\u6570\\u91cf\"]}}]', 8, 1);

-- ----------------------------
-- Table structure for django_admin_settings_menu
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_settings_menu`;
CREATE TABLE `django_admin_settings_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `depth` int UNSIGNED NOT NULL,
  `numchild` int UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `link_type` int NOT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `valid` tinyint(1) NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `priority_level` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `path`(`path`) USING BTREE,
  INDEX `django_admin_setting_content_type_id_b94f39c2_fk_django_co`(`content_type_id`) USING BTREE,
  CONSTRAINT `django_admin_setting_content_type_id_b94f39c2_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_settings_menu
-- ----------------------------

-- ----------------------------
-- Table structure for django_admin_settings_options
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_settings_options`;
CREATE TABLE `django_admin_settings_options`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `option_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `valid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `option_name`(`option_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_settings_options
-- ----------------------------
INSERT INTO `django_admin_settings_options` VALUES (1, 'show_avatar', 'off', '2021-12-18 14:20:07.253490', '2021-12-18 14:20:24.124257', 1);
INSERT INTO `django_admin_settings_options` VALUES (2, 'site_title', '书本站点管理员', '2021-12-18 14:20:07.261501', '2021-12-18 14:20:24.129244', 1);
INSERT INTO `django_admin_settings_options` VALUES (3, 'site_header', '书本 管理', '2021-12-18 14:20:07.268481', '2021-12-18 14:20:07.270460', 1);
INSERT INTO `django_admin_settings_options` VALUES (4, 'site_logo', '/media/QQ图片20211218141927.jpg', '2021-12-18 14:20:07.278422', '2021-12-18 14:20:07.281417', 1);
INSERT INTO `django_admin_settings_options` VALUES (5, 'welcome_sign', '欢迎回来,管理员大人.', '2021-12-18 14:20:07.286404', '2021-12-18 14:20:07.288408', 1);
INSERT INTO `django_admin_settings_options` VALUES (6, 'avatar_field', 'request.user.head_avatar', '2021-12-18 14:20:24.136263', '2021-12-18 14:20:24.139217', 1);
INSERT INTO `django_admin_settings_options` VALUES (7, 'USE_CUSTOM_MENU', '1', '2021-12-18 16:06:26.209362', '2021-12-18 16:06:29.293250', 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (8, 'book', 'book');
INSERT INTO `django_content_type` VALUES (9, 'book', 'category');
INSERT INTO `django_content_type` VALUES (10, 'book', 'order');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (12, 'django_admin_settings', 'menu');
INSERT INTO `django_content_type` VALUES (11, 'django_admin_settings', 'options');
INSERT INTO `django_content_type` VALUES (7, 'home', 'banner');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (13, 'sites', 'site');
INSERT INTO `django_content_type` VALUES (6, 'user', 'userinfo');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-12-14 20:36:46.982128');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-12-14 20:36:47.086386');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2021-12-14 20:36:47.431382');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-12-14 20:36:47.499197');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-12-14 20:36:47.510169');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-12-14 20:36:47.518146');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-12-14 20:36:47.526125');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-12-14 20:36:47.531079');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-12-14 20:36:47.540055');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-12-14 20:36:47.548069');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-12-14 20:36:47.558040');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-12-14 20:36:47.577982');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-12-14 20:36:47.588924');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2021-12-14 20:36:47.596764');
INSERT INTO `django_migrations` VALUES (15, 'user', '0001_initial', '2021-12-14 20:36:47.960788');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2021-12-14 20:36:48.195928');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2021-12-14 20:36:48.206949');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-14 20:36:48.216982');
INSERT INTO `django_migrations` VALUES (19, 'book', '0001_initial', '2021-12-14 20:36:48.374756');
INSERT INTO `django_migrations` VALUES (20, 'book', '0002_initial', '2021-12-14 20:36:48.526086');
INSERT INTO `django_migrations` VALUES (21, 'home', '0001_initial', '2021-12-14 20:36:48.556213');
INSERT INTO `django_migrations` VALUES (22, 'sessions', '0001_initial', '2021-12-14 20:36:48.602715');
INSERT INTO `django_migrations` VALUES (23, 'book', '0003_order_num', '2021-12-17 13:01:00.082196');
INSERT INTO `django_migrations` VALUES (24, 'book', '0004_alter_order_book', '2021-12-18 13:48:30.359171');
INSERT INTO `django_migrations` VALUES (25, 'book', '0005_alter_order_book', '2021-12-18 13:49:06.562135');
INSERT INTO `django_migrations` VALUES (26, 'django_admin_settings', '0001_initial', '2021-12-18 14:16:14.221240');
INSERT INTO `django_migrations` VALUES (27, 'django_admin_settings', '0002_options_valid', '2021-12-18 14:16:14.300031');
INSERT INTO `django_migrations` VALUES (28, 'django_admin_settings', '0003_menu', '2021-12-18 14:16:14.503486');
INSERT INTO `django_migrations` VALUES (29, 'django_admin_settings', '0004_auto_20190708_1832', '2021-12-18 14:16:14.788722');
INSERT INTO `django_migrations` VALUES (30, 'django_admin_settings', '0005_menu_priority_level', '2021-12-18 14:16:14.866517');
INSERT INTO `django_migrations` VALUES (31, 'sites', '0001_initial', '2021-12-18 14:18:10.780788');
INSERT INTO `django_migrations` VALUES (32, 'sites', '0002_alter_domain_unique', '2021-12-18 14:18:10.813699');
INSERT INTO `django_migrations` VALUES (33, 'django_admin_settings', '0006_auto_20211218_1553', '2021-12-18 15:53:19.455682');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0lridonpmgo83zzboit500saqppuzxwr', '.eJy1lUtvozAQx79K5HNeBoOhx-5lL6s99bRUkR9DYAv2yg6HVZXvvjZEq9QJipu2F4zm8Z-Z38jwinZsODS7wYLZtRI9IIyW5zbOxAso75C_mdrrtdDqYFq-9iHrk9euf2gJ3eMp9o1Aw2zjsgucFZCJnJeYFzSnlCeE5KROclkzSOuEl5DgvMR5DYxkuE5LIiTmtMQUYzJ21YMarNP69VohxXqo0MOiQo9av1Ro6d5a19tkq5lZ1GwlWiM6mJy979B692W6jcgfTDf5Nkz2rdpwlzc9Jj-T8mk2xDlPYdwAk8IMPZ_p5UYrx-Xi3e0fn70bWum9eLtNQpFv7AB7bf7ezUGcBG6w-B_2dTxiRwmZpKHQTyPB3A1E--wbNKaYr0MRNUHIgYQGHMp-1z185L4xpe4D27jCGz6mz5M9D4pEGzHQxa2LGiJEmYeGLNR9cl_MD7CtqoFmSeGOPEnpHYj9F3t8tKrW85DfhkVijpgtxPGueUK4RWigV-QLzsh4COyOjBTCF0uLsSYl6WVN62vapoVOrlh3uL0QEGRGxRO0K6H315fh_6GbvdHDn_lNnMVEruFzhr62qahBg6Xgbbil8viMjv8AGqGtyQ:1myUpj:9yfqezcbA_cAKLOCcOyYWzarY7rVR5FAkTFRr_OFyqE', '2022-01-01 16:12:47.134824');
INSERT INTO `django_session` VALUES ('8upi6u50p1kdi4t3nephmvdwp5uoxmar', '.eJy1lU1vozAQhv9KxDkJsTH-6LGnveyxp6WK_EWgBXtlwmFV5b-vDZE28ZKUlvZiRzMvM_POI8Jbsuf9sdr3nXb7WiUPCUjWlzHB5as2IaFeuDnYrbTm6GqxDZLtOdttf1qlm8ez9qpAxbvKP01BTnUusWBAUIIJERAhjEqIVcl1VkLBNASYAVxqjnJQZgxJBQRhgACAhqlabfrO1_r1ViSGt7pIHlZF8mjta5Gs_a_azzbGSu5WJd_I2slGj8k2TNiF9PXjRdHncIf9RSQR_qIU0xn1eteMuZSrtjap8GOkkh_1wbo_6ajhSj3dlXnBWSqc5kq6vhUTM86weFqvFts6PYe0rlXIgt0OThX1fPyFNMYLdzUc9_c0HN-7o4_aiXeUTRSlgsNQO8vzhTuyTmn3zpJGzbdu6cOG4i2hOADiLj9sq5e9xYyxwJBRMgxZ4gAWI67-Yf4kisrPlgpuzD0Wl6KZMGZ4noDxNT5jIDgO5HHrJ_9vvowQySENs8KMfIJC-JoMR21Ke5vDtWwmiRneJkjM9xMvl8YBMv3WoeGSIKBFVIZmGR16EpT937MLPbuq1o3a8Ob4PhAt0Y0qYYPdRtrDNIzwfU8Pzva_b5O40MzE8DWmp0jNMhpBAbuYEjs9J6e_Bp_ZXQ:1n0yHL:K4y6v91zYZJTsndDmX_4vT3lox03uc4RrnPNITAS5po', '2022-01-08 12:03:31.026259');
INSERT INTO `django_session` VALUES ('b724r3ue5vfj9fme2tc4irxwrsb12d47', '.eJy1lUtvozAQx79K5HNeBoOhx-5lL6s99bRUkR9DYAv2yg6HVZXvvjZEq9QJipu2F4zm8Z-Z38jwinZsODS7wYLZtRI9IIyW5zbOxAso75C_mdrrtdDqYFq-9iHrk9euf2gJ3eMp9o1Aw2zjsgucFZCJnJeYFzSnlCeE5KROclkzSOuEl5DgvMR5DYxkuE5LIiTmtMQUYzJ21YMarNP69VohxXqo0MOiQo9av1Ro6d5a19tkq5lZ1GwlWiM6mJy979B692W6jcgfTDf5Nkz2rdpwlzc9Jj-T8mk2xDlPYdwAk8IMPZ_p5UYrx-Xi3e0fn70bWum9eLtNQpFv7AB7bf7ezUGcBG6w-B_2dTxiRwmZpKHQTyPB3A1E--wbNKaYr0MRNUHIgYQGHMp-1z185L4xpe4D27jCGz6mz5M9D4pEGzHQxa2LGiJEmYeGLNR9cl_MD7CtqoFmSeGOPEnpHYj9F3t8tKrW85DfhkVijpgtxPGueUK4RWigV-QLzsh4COyOjBTCF0uLsSYl6WVN62vapoVOrlh3uL0QEGRGxRO0K6H315fh_6GbvdHDn_lNnMVEruFzhr62qahBg6Xgbbil8viMjv8AGqGtyQ:1myUtt:gWWwF6eJFQ-VkBvPj0Z7IBmEJzgOP5UJb8tkE1TW1nY', '2022-01-01 16:17:05.371604');
INSERT INTO `django_session` VALUES ('pskw0wwti3o8htai6db1jh1jdm7f7afz', '.eJy1lUtvozAQx79K5HNeBoOhx-5lL6s99bRUkR9DYAv2yg6HVZXvvjZEq9QJipu2F4zm8Z-Z38jwinZsODS7wYLZtRI9IIyW5zbOxAso75C_mdrrtdDqYFq-9iHrk9euf2gJ3eMp9o1Aw2zjsgucFZCJnJeYFzSnlCeE5KROclkzSOuEl5DgvMR5DYxkuE5LIiTmtMQUYzJ21YMarNP69VohxXqo0MOiQo9av1Ro6d5a19tkq5lZ1GwlWiM6mJy979B692W6jcgfTDf5Nkz2rdpwlzc9Jj-T8mk2xDlPYdwAk8IMPZ_p5UYrx-Xi3e0fn70bWum9eLtNQpFv7AB7bf7ezUGcBG6w-B_2dTxiRwmZpKHQTyPB3A1E--wbNKaYr0MRNUHIgYQGHMp-1z185L4xpe4D27jCGz6mz5M9D4pEGzHQxa2LGiJEmYeGLNR9cl_MD7CtqoFmSeGOPEnpHYj9F3t8tKrW85DfhkVijpgtxPGueUK4RWigV-QLzsh4COyOjBTCF0uLsSYl6WVN62vapoVOrlh3uL0QEGRGxRO0K6H315fh_6GbvdHDn_lNnMVEruFzhr62qahBg6Xgbbil8viMjv8AGqGtyQ:1myUuF:TmdXxgdL61DY37z9mPfoX4FNdXFUGXwPGrzjjLvMKmU', '2022-01-01 16:17:27.964771');
INSERT INTO `django_session` VALUES ('ryqc0upegz6e0w6btt45lvb4cfy8wfwh', '.eJxVjDsOwjAQBe_iGlmx116zlPQ5g7X-4QBypDipEHeHSCmgfTPzXsLztla_9bz4KYmLUOL0uwWOj9x2kO7cbrOMc1uXKchdkQftcpxTfl4P9--gcq_fGgkwABgN-lwiATmkMkSrSnF5iFCAmQKpYiwyGiQHGINWFomSdVm8P7_sNwo:1mxmkP:9LzwoSaRMjPGTIbXaJjr36nfvXjg1BHn3vavnclt-OQ', '2021-12-30 17:08:21.053803');
INSERT INTO `django_session` VALUES ('s8epqyfjh3ecbd467ridcp9ve2r6ozli', '.eJxVjDsOwjAQBe_iGllax19Kes5g7dprHEC2FCcV4u4QKQW0b2beS0Tc1hq3wUucszgLEKffjTA9uO0g37Hduky9rctMclfkQYe89szPy-H-HVQc9Vt7MJ5NshSAvLPOkdLa6qJsLshTURRYgQ1gC6M2UKagUwZyARyABvH-AM7uNyQ:1myUa0:Dzuh8gwgwQEMP2BGtORB9G5wregYT_342oWd8o_b0YY', '2022-01-01 15:56:32.354192');
INSERT INTO `django_session` VALUES ('z9ycedt6y40rjjn6k1vb2cs1bsrhff57', '.eJy1lUtvozAQx79K5HNeBoOhx-5lL6s99bRUkR9DYAv2yg6HVZXvvjZEq9QJipu2F4zm8Z-Z38jwinZsODS7wYLZtRI9IIyW5zbOxAso75C_mdrrtdDqYFq-9iHrk9euf2gJ3eMp9o1Aw2zjsgucFZCJnJeYFzSnlCeE5KROclkzSOuEl5DgvMR5DYxkuE5LIiTmtMQUYzJ21YMarNP69VohxXqo0MOiQo9av1Ro6d5a19tkq5lZ1GwlWiM6mJy979B692W6jcgfTDf5Nkz2rdpwlzc9Jj-T8mk2xDlPYdwAk8IMPZ_p5UYrx-Xi3e0fn70bWum9eLtNQpFv7AB7bf7ezUGcBG6w-B_2dTxiRwmZpKHQTyPB3A1E--wbNKaYr0MRNUHIgYQGHMp-1z185L4xpe4D27jCGz6mz5M9D4pEGzHQxa2LGiJEmYeGLNR9cl_MD7CtqoFmSeGOPEnpHYj9F3t8tKrW85DfhkVijpgtxPGueUK4RWigV-QLzsh4COyOjBTCF0uLsSYl6WVN62vapoVOrlh3uL0QEGRGxRO0K6H315fh_6GbvdHDn_lNnMVEruFzhr62qahBg6Xgbbil8viMjv8AGqGtyQ:1n0faV:cvle1mWxNzdwcNVo8x_HsVXQhmCL9vrjzMTboaj2ZO0', '2022-01-07 16:06:03.156153');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_site_domain_a2e37b91_uniq`(`domain`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES (1, 'example.com', 'example.com');

-- ----------------------------
-- Table structure for home_banner
-- ----------------------------
DROP TABLE IF EXISTS `home_banner`;
CREATE TABLE `home_banner`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `alt` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of home_banner
-- ----------------------------
INSERT INTO `home_banner` VALUES (1, 'banner/JDAV9M0_PPSEM2Y6_zM45l35.png', '先锋书店');
INSERT INTO `home_banner` VALUES (2, 'banner/XPBVW1NDZCH64E34J.png', '场景图');
INSERT INTO `home_banner` VALUES (3, 'banner/6H1C2R711GSMBUXT0K4.png', '场景图2');

-- ----------------------------
-- Table structure for user_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo`;
CREATE TABLE `user_userinfo`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo
-- ----------------------------
INSERT INTO `user_userinfo` VALUES (1, 'pbkdf2_sha256$260000$KZOYASLpWXVt1nA2CBC1lC$jtKeR1yKtYbdesFRiDsh4YfiatWNU09nHXYJSpY77R4=', '2021-12-24 13:32:46.005185', 1, 'root', '', '', '2271443486@qq.com', 1, 1, '2021-12-14 20:37:59.518726', '');
INSERT INTO `user_userinfo` VALUES (2, 'pbkdf2_sha256$260000$1GjVKDTJ7JHsUownNzbFnM$iwRR4gjTHVAX2sdwZ2N5e+ONskZZ1dPlVkVAjjNolT8=', '2021-12-18 14:02:55.834610', 0, '16639821093', '', '', '', 0, 1, '2021-12-18 13:10:14.374427', '16639821093');

-- ----------------------------
-- Table structure for user_userinfo_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_groups`;
CREATE TABLE `user_userinfo_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_groups_userinfo_id_group_id_427ab23f_uniq`(`userinfo_id`, `group_id`) USING BTREE,
  INDEX `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_userinfo_groups_group_id_660e8d76_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_groups_userinfo_id_80ed863e_fk_user_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo_groups
-- ----------------------------

-- ----------------------------
-- Table structure for user_userinfo_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_userinfo_user_permissions`;
CREATE TABLE `user_userinfo_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `userinfo_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_userinfo_user_permi_userinfo_id_permission_i_8245f325_uniq`(`userinfo_id`, `permission_id`) USING BTREE,
  INDEX `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `user_userinfo_user_p_permission_id_a994ee6a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_userinfo_user_p_userinfo_id_76f2e887_fk_user_user` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_userinfo_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
