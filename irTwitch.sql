/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 100519
 Source Host           : 127.0.0.1:3306
 Source Schema         : irTwitch

 Target Server Type    : MySQL
 Target Server Version : 100519
 File Encoding         : 65001

 Date: 07/10/2023 18:32:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for filter_check
-- ----------------------------
DROP TABLE IF EXISTS `filter_check`;
CREATE TABLE `filter_check`  (
  `id` bigint NOT NULL,
  `isLatestDomainOk` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isLatestDomainAccessible` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_update` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of filter_check
-- ----------------------------
INSERT INTO `filter_check` VALUES (1, 'No!', '!?', '2023-10-07 17:27:10');

-- ----------------------------
-- Table structure for stream_ts_cache
-- ----------------------------
DROP TABLE IF EXISTS `stream_ts_cache`;
CREATE TABLE `stream_ts_cache`  (
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `downloaded` int NOT NULL DEFAULT 0,
  `create_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`file_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stream_ts_cache
-- ----------------------------

-- ----------------------------
-- Table structure for stream_viewers
-- ----------------------------
DROP TABLE IF EXISTS `stream_viewers`;
CREATE TABLE `stream_viewers`  (
  `user_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `streamer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attempt` tinyint NOT NULL DEFAULT 0,
  `check_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`user_ip`, `streamer`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stream_viewers
-- ----------------------------

-- ----------------------------
-- Table structure for streamers
-- ----------------------------
DROP TABLE IF EXISTS `streamers`;
CREATE TABLE `streamers`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `discord_userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `is_relay` int NOT NULL DEFAULT 1,
  `twitch_userid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `isLive` int NULL DEFAULT 0,
  `isBan` tinyint NOT NULL DEFAULT 0,
  `stream_start` timestamp NULL DEFAULT NULL,
  `twitch_display_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `twitch_description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `twitch_profile_image_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `twitch_offline_image_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `twitch_account_create` datetime NULL DEFAULT NULL,
  `twitch_title` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `twitch_category_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `twitch_account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `twitch_data_update` datetime NULL DEFAULT NULL,
  `twitch_check_date` timestamp NULL DEFAULT NULL,
  `twitch_thumbnail_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `quality_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `master_lastcheck` timestamp NULL DEFAULT NULL,
  `master_playlist` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `master_playlist_original` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `playlist_cache` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `playlist_time` timestamp NULL DEFAULT NULL,
  `playlist_checksum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `subscribed` tinyint NOT NULL DEFAULT 0,
  `subscribe_botid` bigint NULL DEFAULT NULL,
  `twitch_viewers` bigint NOT NULL DEFAULT 0,
  `stream_viewers` bigint NOT NULL DEFAULT 0,
  `stream_links` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `add_date` timestamp NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 876 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of streamers
-- ----------------------------

-- ----------------------------
-- Table structure for twitch_games
-- ----------------------------
DROP TABLE IF EXISTS `twitch_games`;
CREATE TABLE `twitch_games`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `game_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `box_art_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2309 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for twitch_settings
-- ----------------------------
DROP TABLE IF EXISTS `twitch_settings`;
CREATE TABLE `twitch_settings`  (
  `id` bigint NOT NULL,
  `tw_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tw_expire` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of twitch_settings
-- ----------------------------
INSERT INTO `twitch_settings` VALUES (0, NULL, '2023-10-23 16:03:40');
INSERT INTO `twitch_settings` VALUES (1, NULL, '2023-10-16 16:48:25');
INSERT INTO `twitch_settings` VALUES (2, NULL, '2023-10-16 01:54:50');
INSERT INTO `twitch_settings` VALUES (3, NULL, '2023-10-28 01:30:12');
INSERT INTO `twitch_settings` VALUES (4, NULL, '2023-10-18 00:00:21');
INSERT INTO `twitch_settings` VALUES (5, NULL, '2023-10-24 05:29:14');
INSERT INTO `twitch_settings` VALUES (6, NULL, '2023-10-16 01:30:39');

-- ----------------------------
-- Table structure for twitch_tokens
-- ----------------------------
DROP TABLE IF EXISTS `twitch_tokens`;
CREATE TABLE `twitch_tokens`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `sec-ch-ua` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sec-ch-ua-platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sec-ch-ua-mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Client-Version` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `User-Agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Client-Session-Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `X-Device-Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Client-Id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of twitch_tokens
-- ----------------------------
INSERT INTO `twitch_tokens` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `twitch_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `twitch_userid` bigint NULL DEFAULT NULL,
  `twitch_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `twitch_r` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `twitch_expire` timestamp NULL DEFAULT NULL,
  `join_date` timestamp NOT NULL DEFAULT current_timestamp,
  `user_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token_date` timestamp NULL DEFAULT NULL,
  `app_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fcmToken` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `fcmToken_date` timestamp NULL DEFAULT NULL,
  `apptoken_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4410 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for users_follows
-- ----------------------------
DROP TABLE IF EXISTS `users_follows`;
CREATE TABLE `users_follows`  (
  `userid` bigint NOT NULL,
  `streamerid` bigint NOT NULL,
  PRIMARY KEY (`userid`, `streamerid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_follows
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
