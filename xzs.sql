/*
 Navicat Premium Data Transfer

 Source Server         : a
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : xzs

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 02/12/2020 16:45:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `subject_id` int NULL DEFAULT NULL COMMENT '学科',
  `paper_type` int NULL DEFAULT NULL COMMENT '试卷类型( 1固定试卷  2临时试卷 3班级试卷 4.时段试卷 5.推送试卷)',
  `grade_level` int NULL DEFAULT NULL COMMENT '级别',
  `score` int NULL DEFAULT NULL COMMENT '试卷总分(千分制)',
  `question_count` int NULL DEFAULT NULL COMMENT '题目数量',
  `suggest_time` int NULL DEFAULT NULL COMMENT '建议时长(分钟)',
  `limit_start_time` datetime(0) NULL DEFAULT NULL COMMENT '时段试卷 开始时间',
  `limit_end_time` datetime(0) NULL DEFAULT NULL COMMENT '时段试卷 结束时间',
  `frame_text_content_id` int NULL DEFAULT NULL COMMENT '试卷框架 内容为JSON',
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `task_exam_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO `t_exam_paper` VALUES (1, '数学小测', 1, 6, 10, 1000, 1, 12, NULL, NULL, 2, 2, '2020-11-30 22:01:27', b'0', 1);
INSERT INTO `t_exam_paper` VALUES (2, '数学阶段测试', 1, 4, 10, 1100, 2, 120, '2020-12-01 00:00:00', '2020-12-31 00:00:00', 9, 2, '2020-12-01 22:58:18', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (3, '英语小测', 3, 4, 10, 100, 1, 30, '2020-12-02 00:00:00', '2020-12-03 00:00:00', 11, 2, '2020-12-01 23:03:04', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (4, '语文周考', 2, 1, 10, 1000, 1, 30, NULL, NULL, 12, 2, '2020-12-01 23:09:05', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (5, '阅读理解测试', 2, 6, 10, 1000, 3, 30, NULL, NULL, 23, 2, '2020-12-01 23:52:33', b'0', 2);
INSERT INTO `t_exam_paper` VALUES (6, '物理小测', 4, 4, 10, 340, 1, 13, '2020-12-02 00:00:00', '2021-01-05 00:00:00', 25, 2, '2020-12-02 00:01:43', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (7, '化学固定测试', 5, 1, 10, 100, 1, 30, NULL, NULL, 26, 2, '2020-12-02 00:14:43', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (8, '生物固定测试', 6, 1, 10, 100, 1, 33, NULL, NULL, 27, 2, '2020-12-02 00:15:18', b'0', NULL);

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int NULL DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `paper_type` int NULL DEFAULT NULL COMMENT '试卷类型( 1固定试卷  2临时试卷 3班级试卷 4.时段试卷 )',
  `subject_id` int NULL DEFAULT NULL COMMENT '学科',
  `system_score` int NULL DEFAULT NULL COMMENT '系统判定得分',
  `user_score` int NULL DEFAULT NULL COMMENT '最终得分(千分制)',
  `paper_score` int NULL DEFAULT NULL COMMENT '试卷总分',
  `question_correct` int NULL DEFAULT NULL COMMENT '做对题目数量',
  `question_count` int NULL DEFAULT NULL COMMENT '题目总数量',
  `do_time` int NULL DEFAULT NULL COMMENT '做题时间(秒)',
  `status` int NULL DEFAULT NULL COMMENT '试卷状态(1待判分 2完成)',
  `create_user` int NULL DEFAULT NULL COMMENT '学生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `task_exam_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
INSERT INTO `t_exam_paper_answer` VALUES (1, 1, '1', 6, 1, 0, 0, 1000, 0, 1, 12, 2, 3, '2020-11-30 22:16:52', 1);
INSERT INTO `t_exam_paper_answer` VALUES (2, 4, '周考', 1, 2, 0, 1600, 1600, 2, 2, 17, 2, 3, '2020-12-01 23:19:24', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (3, 4, '周考', 1, 2, 0, 0, 1600, 0, 2, 7, 1, 3, '2020-12-01 23:21:20', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (4, 4, '周考', 1, 2, 0, 0, 1600, 0, 2, 6, 1, 3, '2020-12-01 23:21:33', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (5, 4, '语文周考', 1, 2, 0, 980, 1000, 0, 1, 8, 2, 4, '2020-12-02 00:24:07', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (6, 5, '阅读理解测试', 6, 2, 0, 0, 1000, 0, 3, 194, 1, 4, '2020-12-02 00:28:37', 2);
INSERT INTO `t_exam_paper_answer` VALUES (7, 5, '阅读理解测试', 6, 2, 0, 0, 1000, 0, 3, 3, 1, 3, '2020-12-02 00:40:47', 2);
INSERT INTO `t_exam_paper_answer` VALUES (8, 5, '阅读理解测试', 6, 2, 0, 970, 1000, 0, 3, 21, 2, 5, '2020-12-02 00:41:38', 2);
INSERT INTO `t_exam_paper_answer` VALUES (9, 1, '数学小测', 6, 1, 0, 630, 1000, 0, 1, 1, 2, 5, '2020-12-02 00:43:01', 1);
INSERT INTO `t_exam_paper_answer` VALUES (10, 8, '生物固定测试', 1, 6, 0, 90, 100, 0, 1, 1, 2, 5, '2020-12-02 00:43:08', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (11, 7, '化学固定测试', 1, 5, 0, 80, 100, 0, 1, 1, 2, 5, '2020-12-02 00:43:15', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (12, 4, '语文周考', 1, 2, 0, 500, 1000, 0, 1, 1, 2, 5, '2020-12-02 00:43:22', NULL);

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NULL DEFAULT NULL COMMENT '题目Id',
  `exam_paper_id` int NULL DEFAULT NULL COMMENT '答案Id',
  `exam_paper_answer_id` int NULL DEFAULT NULL,
  `question_type` int NULL DEFAULT NULL COMMENT '题型',
  `subject_id` int NULL DEFAULT NULL COMMENT '学科',
  `customer_score` int NULL DEFAULT NULL COMMENT '得分',
  `question_score` int NULL DEFAULT NULL COMMENT '题目原始分数',
  `question_text_content_id` int NULL DEFAULT NULL COMMENT '问题内容',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '做题答案',
  `text_content_id` int NULL DEFAULT NULL COMMENT '做题内容',
  `do_right` bit(1) NULL DEFAULT NULL COMMENT '是否正确',
  `create_user` int NULL DEFAULT NULL COMMENT '做题人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `item_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (1, 1, 1, 1, 5, 1, 0, 1000, 1, NULL, 4, b'0', 3, '2020-11-30 22:16:52', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (2, 6, 4, 2, 5, 2, 1000, 1000, 13, NULL, 14, b'1', 3, '2020-12-01 23:19:24', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (3, 2, 4, 2, 5, 2, 600, 600, 6, NULL, 15, b'1', 3, '2020-12-01 23:19:24', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (4, 6, 4, 3, 5, 2, 0, 1000, 13, NULL, 16, NULL, 3, '2020-12-01 23:21:20', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (5, 2, 4, 3, 5, 2, 0, 600, 6, NULL, 17, NULL, 3, '2020-12-01 23:21:20', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (6, 6, 4, 4, 5, 2, 0, 1000, 13, NULL, 18, NULL, 3, '2020-12-01 23:21:33', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (7, 2, 4, 4, 5, 2, 0, 600, 6, NULL, 19, NULL, 3, '2020-12-01 23:21:33', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (8, 6, 4, 5, 5, 2, 980, 1000, 13, NULL, 28, b'0', 4, '2020-12-02 00:24:07', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (9, 7, 5, 6, 5, 2, 0, 340, 20, NULL, 29, NULL, 4, '2020-12-02 00:28:37', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (10, 8, 5, 6, 5, 2, 0, 330, 21, NULL, 30, NULL, 4, '2020-12-02 00:28:37', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (11, 9, 5, 6, 5, 2, 0, 330, 22, NULL, 31, NULL, 4, '2020-12-02 00:28:37', 3);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (12, 7, 5, 7, 5, 2, 0, 340, 20, NULL, 33, NULL, 3, '2020-12-02 00:40:47', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (13, 8, 5, 7, 5, 2, 0, 330, 21, NULL, 34, NULL, 3, '2020-12-02 00:40:47', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (14, 9, 5, 7, 5, 2, 0, 330, 22, NULL, 35, NULL, 3, '2020-12-02 00:40:47', 3);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (15, 7, 5, 8, 5, 2, 330, 340, 20, NULL, 37, b'0', 5, '2020-12-02 00:41:38', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (16, 8, 5, 8, 5, 2, 320, 330, 21, NULL, 38, b'0', 5, '2020-12-02 00:41:38', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (17, 9, 5, 8, 5, 2, 320, 330, 22, NULL, 39, b'0', 5, '2020-12-02 00:41:38', 3);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (18, 1, 1, 9, 5, 1, 630, 1000, 1, NULL, 41, b'0', 5, '2020-12-02 00:43:01', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (19, 5, 8, 10, 5, 6, 90, 100, 10, NULL, 43, b'0', 5, '2020-12-02 00:43:08', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (20, 5, 7, 11, 5, 5, 80, 100, 10, NULL, 44, b'0', 5, '2020-12-02 00:43:15', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (21, 6, 4, 12, 5, 2, 500, 1000, 13, NULL, 45, b'0', 5, '2020-12-02 00:43:22', 1);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `send_user_id` int NULL DEFAULT NULL COMMENT '发送者用户ID',
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者用户名',
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者真实姓名',
  `receive_user_count` int NULL DEFAULT NULL COMMENT '接收人数',
  `read_count` int NULL DEFAULT NULL COMMENT '已读人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int NULL DEFAULT NULL COMMENT '消息内容ID',
  `receive_user_id` int NULL DEFAULT NULL COMMENT '接收人ID',
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人用户名',
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人真实姓名',
  `readed` bit(1) NULL DEFAULT NULL COMMENT '是否已读',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_type` int NULL DEFAULT NULL COMMENT '1.单选题  2.多选题  3.判断题 4.填空题 5.简答题',
  `subject_id` int NULL DEFAULT NULL COMMENT '学科',
  `score` int NULL DEFAULT NULL COMMENT '题目总分(千分制)',
  `grade_level` int NULL DEFAULT NULL COMMENT '级别',
  `difficult` int NULL DEFAULT NULL COMMENT '题目难度',
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正确答案',
  `info_text_content_id` int NULL DEFAULT NULL COMMENT '题目  填空、 题干、解析、答案等信息',
  `create_user` int NULL DEFAULT NULL COMMENT '创建人',
  `status` int NULL DEFAULT NULL COMMENT '1.正常',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES (1, 5, 1, 1000, 10, 5, '2', 1, 2, 1, '2020-11-30 21:20:28', b'0');
INSERT INTO `t_question` VALUES (2, 5, 2, 600, 10, 5, '<p class=\"poem-detail-main-text\" style=\"font-size: 15px; color: rgb(51, 51, 51); line-height: 25px; font-family: Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">噫吁嚱</span>，危乎高哉！蜀道之难，难于上青天！蚕丛及鱼凫，开国<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">何茫然</span>！<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">尔来</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">四万八千岁</span>，不与<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">秦塞</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">通人烟</span>。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">西当</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">太白</span>有鸟道，可以<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">横绝</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">峨眉巅</span>。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">地崩山摧壮士死</span>，然后天梯<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">石栈</span>相钩连。上有<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">六龙回日</span>之<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">高标</span>，下有<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">冲波</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">逆折</span>之回川。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">黄鹤</span>之飞<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">尚</span>不得过，<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">猿猱</span>欲度愁攀援。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">青泥</span>何<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">盘盘</span>，<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">百步九折</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">萦</span>岩峦。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">扪参历井</span>仰<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">胁息</span>，以手抚<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">膺</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">坐</span>长叹。</p><p class=\"poem-detail-main-text\" style=\"font-size: 15px; color: rgb(51, 51, 51); line-height: 25px; font-family: Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">问<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">君</span>西游何时还？<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">畏途</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">巉岩</span>不可攀。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">但见</span>悲鸟<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">号古木</span>，雄飞雌<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">从</span>绕林间。又闻<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">子规</span>啼夜月，愁空山。蜀道之难，难于上青天，使人听此<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">凋朱颜</span>！连峰<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">去</span>天不<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">盈</span>尺，枯松倒挂倚绝壁。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">飞湍</span>瀑流争<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">喧豗</span>，<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">砯崖</span>转石万<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">壑</span>雷。其险也如此，<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">嗟</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">尔</span>远道之人<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">胡为</span>乎来哉！</p><p class=\"poem-detail-main-text\" style=\"font-size: 15px; color: rgb(51, 51, 51); line-height: 25px; font-family: Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">剑阁</span>峥嵘而崔嵬，一夫<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">当</span>关，万夫<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">莫开</span>。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">所守</span><span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">或匪亲</span>，化为狼与豺。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">朝</span>避猛虎，夕避长蛇；磨牙<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">吮</span>血，杀人如麻。<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">锦城</span>虽云乐，不如早还家。蜀道之难，难于上青天，侧身西望长<span class=\"body-zhushi-span\" style=\"border-bottom: 1px solid #2673DB; cursor: pointer;\">咨嗟</span>！</p>', 6, 2, 1, '2020-12-01 21:36:08', b'0');
INSERT INTO `t_question` VALUES (3, 4, 2, 100, 10, 1, '', 7, 2, 1, '2020-12-01 21:39:42', b'0');
INSERT INTO `t_question` VALUES (4, 5, 3, 100, 10, 5, 'I won it', 8, 2, 1, '2020-12-01 22:43:07', b'0');
INSERT INTO `t_question` VALUES (5, 5, 1, 100, 10, 5, '<p>3个<br/></p>', 10, 2, 1, '2020-12-01 23:00:47', b'0');
INSERT INTO `t_question` VALUES (6, 5, 2, 1000, 10, 5, '阿瑟东萨达萨达萨达撒', 13, 2, 1, '2020-12-01 23:18:20', b'0');
INSERT INTO `t_question` VALUES (7, 5, 2, 340, 10, 5, '<p>&nbsp;开头列举人们总是在不自知的情况下习惯性摸脸的现象，引出说明对象：人为什么要摸自己的脸；与标题照应；为下文具体说明爱摸自己的脸的原因做铺垫；设置悬念，激发读者阅读兴趣。</p>', 20, 2, 1, '2020-12-01 23:47:58', b'0');
INSERT INTO `t_question` VALUES (8, 5, 2, 330, 10, 5, '运用举例子的说明方法，具体直观地说明了用手掌触摸面部不同的位置有不同的作用，进一步说明了摸\n脸在人类早期是我们说话的一种方式，从而说明了人为什么爱摸自己的脸。', 21, 2, 1, '2020-12-01 23:49:25', b'0');
INSERT INTO `t_question` VALUES (9, 5, 2, 330, 10, 5, '不能。部分是整体中的局部，表示范围，说明并不是所有的高级哺乳动物也拥有一定的自我意识，而只\n是一部分，如果删去则表示全部，太过绝对，与事实不符。体现说明文语言的准确性、严密性。', 22, 2, 1, '2020-12-01 23:50:12', b'0');

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语文 数学 英语 等',
  `level` int NULL DEFAULT NULL COMMENT '年级 (1-12) 小学 初中 高中  大学',
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一年级、二年级等',
  `item_order` int NULL DEFAULT NULL COMMENT '排序',
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES (1, '数学', 10, '高一', 1, b'0');
INSERT INTO `t_subject` VALUES (2, '语文', 10, '高一', NULL, b'0');
INSERT INTO `t_subject` VALUES (3, '英语', 10, '高一', NULL, b'0');
INSERT INTO `t_subject` VALUES (4, '物理', 10, '高一', NULL, b'0');
INSERT INTO `t_subject` VALUES (5, '化学', 10, '高一', NULL, b'0');
INSERT INTO `t_subject` VALUES (6, '生物', 10, '高一', NULL, b'0');

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade_level` int NULL DEFAULT NULL COMMENT '级别',
  `frame_text_content_id` int NULL DEFAULT NULL COMMENT '任务框架 内容为JSON',
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------
INSERT INTO `t_task_exam` VALUES (1, '数学小测', 10, 3, 2, '2020-11-30 22:15:10', b'0', 'admin');
INSERT INTO `t_task_exam` VALUES (2, '阅读理解测试', 10, 24, 2, '2020-12-01 23:54:20', b'0', 'admin');

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_exam_id` int NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `text_content_id` int NULL DEFAULT NULL COMMENT '任务完成情况(Json)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------
INSERT INTO `t_task_exam_customer_answer` VALUES (1, 1, 3, '2020-11-30 22:16:52', 5);
INSERT INTO `t_task_exam_customer_answer` VALUES (2, 2, 4, '2020-12-02 00:28:37', 32);
INSERT INTO `t_task_exam_customer_answer` VALUES (3, 2, 3, '2020-12-02 00:40:47', 36);
INSERT INTO `t_task_exam_customer_answer` VALUES (4, 2, 5, '2020-12-02 00:41:38', 40);
INSERT INTO `t_task_exam_customer_answer` VALUES (5, 1, 5, '2020-12-02 00:43:01', 42);

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO `t_text_content` VALUES (1, '{\"titleContent\":\"1+1=\",\"analyze\":\"不会就退学吧\",\"questionItemObjects\":[],\"correct\":\"2\"}', '2020-11-30 21:20:28');
INSERT INTO `t_text_content` VALUES (2, '[{\"name\":\"计算\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]}]', '2020-11-30 22:01:27');
INSERT INTO `t_text_content` VALUES (3, '[{\"examPaperId\":1,\"examPaperName\":\"数学小测\",\"itemOrder\":null}]', '2020-11-30 22:15:10');
INSERT INTO `t_text_content` VALUES (4, '123', '2020-11-30 22:16:52');
INSERT INTO `t_text_content` VALUES (5, '[{\"examPaperId\":1,\"examPaperAnswerId\":1,\"status\":2}]', '2020-11-30 22:16:52');
INSERT INTO `t_text_content` VALUES (6, '{\"titleContent\":\"默写蜀道难\",\"analyze\":\"<p>认真默写就对了</p>\",\"questionItemObjects\":[],\"correct\":\"<p class=\\\"poem-detail-main-text\\\" style=\\\"font-size: 15px; color: rgb(51, 51, 51); line-height: 25px; font-family: Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\\\"><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">噫吁嚱</span>，危乎高哉！蜀道之难，难于上青天！蚕丛及鱼凫，开国<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">何茫然</span>！<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">尔来</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">四万八千岁</span>，不与<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">秦塞</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">通人烟</span>。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">西当</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">太白</span>有鸟道，可以<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">横绝</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">峨眉巅</span>。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">地崩山摧壮士死</span>，然后天梯<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">石栈</span>相钩连。上有<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">六龙回日</span>之<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">高标</span>，下有<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">冲波</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">逆折</span>之回川。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">黄鹤</span>之飞<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">尚</span>不得过，<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">猿猱</span>欲度愁攀援。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">青泥</span>何<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">盘盘</span>，<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">百步九折</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">萦</span>岩峦。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">扪参历井</span>仰<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">胁息</span>，以手抚<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">膺</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">坐</span>长叹。</p><p class=\\\"poem-detail-main-text\\\" style=\\\"font-size: 15px; color: rgb(51, 51, 51); line-height: 25px; font-family: Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\\\">问<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">君</span>西游何时还？<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">畏途</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">巉岩</span>不可攀。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">但见</span>悲鸟<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">号古木</span>，雄飞雌<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">从</span>绕林间。又闻<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">子规</span>啼夜月，愁空山。蜀道之难，难于上青天，使人听此<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">凋朱颜</span>！连峰<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">去</span>天不<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">盈</span>尺，枯松倒挂倚绝壁。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">飞湍</span>瀑流争<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">喧豗</span>，<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">砯崖</span>转石万<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">壑</span>雷。其险也如此，<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">嗟</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">尔</span>远道之人<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">胡为</span>乎来哉！</p><p class=\\\"poem-detail-main-text\\\" style=\\\"font-size: 15px; color: rgb(51, 51, 51); line-height: 25px; font-family: Arial, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\\\"><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">剑阁</span>峥嵘而崔嵬，一夫<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">当</span>关，万夫<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">莫开</span>。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">所守</span><span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">或匪亲</span>，化为狼与豺。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">朝</span>避猛虎，夕避长蛇；磨牙<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">吮</span>血，杀人如麻。<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">锦城</span>虽云乐，不如早还家。蜀道之难，难于上青天，侧身西望长<span class=\\\"body-zhushi-span\\\" style=\\\"border-bottom: 1px solid #2673DB; cursor: pointer;\\\">咨嗟</span>！</p>\"}', '2020-12-01 21:36:08');
INSERT INTO `t_text_content` VALUES (7, '{\"titleContent\":\"<span class=\\\"gapfilling-span e645521e-88ba-4119-9521-f10ae3bfb33e\\\">1</span>有<span class=\\\"gapfilling-span 1ec8c08b-a802-41a3-b8f3-a1da0b630d6a\\\">2</span>。\",\"analyze\":\"嘻嘻嘻嘻\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"我\",\"score\":50},{\"prefix\":\"2\",\"content\":\"有一包棒棒糖\",\"score\":50}],\"correct\":\"\"}', '2020-12-01 21:39:42');
INSERT INTO `t_text_content` VALUES (8, '{\"titleContent\":\"写一篇作文\",\"analyze\":\"<p>嘻嘻嘻嘻嘻嘻嘻</p>\",\"questionItemObjects\":[],\"correct\":\"I won it\"}', '2020-12-01 22:43:07');
INSERT INTO `t_text_content` VALUES (9, '[{\"name\":\"计算\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]},{\"name\":\"应用题\",\"questionItems\":[{\"id\":5,\"itemOrder\":2}]}]', '2020-12-01 22:58:18');
INSERT INTO `t_text_content` VALUES (10, '{\"titleContent\":\"你有2个苹果，再给你一个，你有几个苹果？\",\"analyze\":\"应该不用解析吧\",\"questionItemObjects\":[],\"correct\":\"<p>3个<br/></p>\"}', '2020-12-01 23:00:47');
INSERT INTO `t_text_content` VALUES (11, '[{\"name\":\"作文\",\"questionItems\":[{\"id\":4,\"itemOrder\":1}]}]', '2020-12-01 23:03:04');
INSERT INTO `t_text_content` VALUES (12, '[{\"name\":\"阅读理解\",\"questionItems\":[{\"id\":6,\"itemOrder\":1}]}]', '2020-12-01 23:09:05');
INSERT INTO `t_text_content` VALUES (13, '{\"titleContent\":\"本文表达了作者怎样的思想感情？\",\"analyze\":\"阿斯顿撒旦as\",\"questionItemObjects\":[],\"correct\":\"阿瑟东萨达萨达萨达撒\"}', '2020-12-01 23:18:20');
INSERT INTO `t_text_content` VALUES (14, NULL, '2020-12-01 23:19:24');
INSERT INTO `t_text_content` VALUES (15, NULL, '2020-12-01 23:19:24');
INSERT INTO `t_text_content` VALUES (16, '物色大润发v贴', '2020-12-01 23:21:20');
INSERT INTO `t_text_content` VALUES (17, NULL, '2020-12-01 23:21:20');
INSERT INTO `t_text_content` VALUES (18, 'cvrfpot', '2020-12-01 23:21:33');
INSERT INTO `t_text_content` VALUES (19, NULL, '2020-12-01 23:21:33');
INSERT INTO `t_text_content` VALUES (20, '{\"titleContent\":\"<p class=\\\"ueditor-p\\\">1． 文章开头从人们习惯于摸自己的脸这种生活现象谈起，有何用意？</p>\",\"analyze\":\"<p>&nbsp;开头列举人们总是在不自知的情况下习惯性摸脸的现象，引出说明对象：人为什么要摸自己的脸；与标题照应；为下文具体说明爱摸自己的脸的原因做铺垫；设置悬念，激发读者阅读兴趣。</p>\",\"questionItemObjects\":[],\"correct\":\"<p>&nbsp;开头列举人们总是在不自知的情况下习惯性摸脸的现象，引出说明对象：人为什么要摸自己的脸；与标题照应；为下文具体说明爱摸自己的脸的原因做铺垫；设置悬念，激发读者阅读兴趣。</p>\"}', '2020-12-01 23:47:58');
INSERT INTO `t_text_content` VALUES (21, '{\"titleContent\":\"<p>2． 第③段画线句子有何作用？请简要分析。<br/></p>\",\"analyze\":\"运用举例子的说明方法，具体直观地说明了用手掌触摸面部不同的位置有不同的作用，进一步说明了摸\\n脸在人类早期是我们说话的一种方式，从而说明了人为什么爱摸自己的脸。\",\"questionItemObjects\":[],\"correct\":\"运用举例子的说明方法，具体直观地说明了用手掌触摸面部不同的位置有不同的作用，进一步说明了摸\\n脸在人类早期是我们说话的一种方式，从而说明了人为什么爱摸自己的脸。\"}', '2020-12-01 23:49:25');
INSERT INTO `t_text_content` VALUES (22, '{\"titleContent\":\"3． 第⑦段加点字部分能否删去，为什么？\",\"analyze\":\"不能。部分是整体中的局部，表示范围，说明并不是所有的高级哺乳动物也拥有一定的自我意识，而只\\n是一部分，如果删去则表示全部，太过绝对，与事实不符。体现说明文语言的准确性、严密性。\",\"questionItemObjects\":[],\"correct\":\"不能。部分是整体中的局部，表示范围，说明并不是所有的高级哺乳动物也拥有一定的自我意识，而只\\n是一部分，如果删去则表示全部，太过绝对，与事实不符。体现说明文语言的准确性、严密性。\"}', '2020-12-01 23:50:12');
INSERT INTO `t_text_content` VALUES (23, '[{\"name\":\"        人为什么爱摸自己的脸 　　吴燕京 　　                                                                                                                                                                                                        ①有人统计过，人在不自知的情况下每小时会触摸脸部二三十次，平均两三分钟就会模一次，而且这个习惯 动作很难避免。那么，人为什么要摸自己的脸呢？ 　　②早期的人类语言与我们现在使用的语言有很大的不同，语言学家认为，在人类语言起源初期，人用于交流 的方式和动物的交流方式比较类似，两者都包舍了大量的肢体动作，这是因为早期的人类语言只包含很简单的几个音 节，无法满足复杂的交流需求，因此需要借助肢体动作来丰富语言交流的形态和内容。 　　③在人类语言形成的早期，触摸面部、额头、下巴和脖子是早期人类语言中的重要组成部分。有人类学家甚 至研究了这些动作的具体意义，比如，用手掌触摸额头代表臣服于族群的首领，用手握住脖子则是向同伴发出有危险 的警告，触摸面部和下巴可能用于家庭成员之间的情感交流。看来，摸脸在人类早期是我们说话的一种方式。 　　④随着语言的发展，特别是语音变化的丰富，人类已经可以通过说话表达十分复杂的思想和感情，几乎满足 了所有的交流愿望。肢体动作逐步失去了其在交流中的主导作用，退化成语言的辅助机制。 　　⑤相对于语言学家的解释，心理学家则认为人类触摸面部的现实意义是调节情绪，减少心理压力。 　　⑥英国杜伦大学芮斯兰德教授利用超声波扫描技术研究了怀孕24-36周的准妈妈，研究发现，触摸面部和调 节情绪有关，心理压力较大的孕妇其体内胎儿会更多地呈现触摸自己面部的姿势。美国迈阿密大学的神经学家指出， 由于脸部生有大量的神经末梢，触摸面部皮肤会刺激神经活动，从而导致人体激素水平的变化，进而降低压力和焦虑 带来的负面情绪。由此可见，人们之所以会在不经意间摸自己的脸，实际上是在调节情绪，使自己保持一个健康的心 理状态。 　　⑦人与动物的一个显著差异就是人类拥有强烈的自我意识。每个人都知道自己是一个独立的个体，既独立于 周边的环境，也独立于他人。研究发现，部分高级哺乳动物也拥有一定的自我意识，大象，猩猩、狮子等动物在照镜 子时可以区分镜子中的自己和镜子中的其他同类个体。有学者认为，人类触摸自己面部的表现正是源于这种自我意识 的反应。 　　⑧人类有一套心理机制保护自我意识。对于大多数人来说，触摸自己的身体是最简单、直接的提升自我意识 的方法。有研究发现，人在群体中比独处的时候会更多地触摸自己的脸、胳膊和头部，这固然是因为人们更在意社交 场合下自己的仪容，但群体也是影响和降低自我意识的一个关键因素，因此，在群体中人会下意识地触碰自己的身 体。这种行为可以产生心理暗示作用，提升自我意识，不容易在茫茫人海中迷失自我。 　　⑨当我们下一次出门注意到自己或他人触摸面部的这个动作时，体会或许会更多吧。 　　（选自《百科知识》2020．05A，有删改）\",\"questionItems\":[{\"id\":7,\"itemOrder\":1},{\"id\":8,\"itemOrder\":2},{\"id\":9,\"itemOrder\":3}]}]', '2020-12-01 23:52:33');
INSERT INTO `t_text_content` VALUES (24, '[{\"examPaperId\":5,\"examPaperName\":\"阅读理解测试\",\"itemOrder\":null}]', '2020-12-01 23:54:20');
INSERT INTO `t_text_content` VALUES (25, '[{\"name\":\"12\",\"questionItems\":[{\"id\":7,\"itemOrder\":1}]}]', '2020-12-02 00:01:43');
INSERT INTO `t_text_content` VALUES (26, '[{\"name\":\"想不到吧\",\"questionItems\":[{\"id\":5,\"itemOrder\":1}]}]', '2020-12-02 00:14:43');
INSERT INTO `t_text_content` VALUES (27, '[{\"name\":\"想不到吧\",\"questionItems\":[{\"id\":5,\"itemOrder\":1}]}]', '2020-12-02 00:15:18');
INSERT INTO `t_text_content` VALUES (28, '123', '2020-12-02 00:24:07');
INSERT INTO `t_text_content` VALUES (29, '开头列举人们总是在不自知的情况下习惯性摸脸的现象，引出说明对象：人为什么要摸自己的脸；与标题照应；为下文具体说明爱摸自己的脸的原因做铺垫；设置悬念，激发读者阅读兴趣。', '2020-12-02 00:28:37');
INSERT INTO `t_text_content` VALUES (30, '运用举例子的说明方法，具体直观地说明了用手掌触摸面部不同的位置有不同的作用，进一步说明了摸 脸在人类早期是我们说话的一种方式，从而说明了人为什么爱摸自己的脸。', '2020-12-02 00:28:37');
INSERT INTO `t_text_content` VALUES (31, '不能。部分是整体中的局部，表示范围，说明并不是所有的高级哺乳动物也拥有一定的自我意识，而只 是一部分，如果删去则表示全部，太过绝对，与事实不符。体现说明文语言的准确性、严密性。', '2020-12-02 00:28:37');
INSERT INTO `t_text_content` VALUES (32, '[{\"examPaperId\":5,\"examPaperAnswerId\":6,\"status\":1}]', '2020-12-02 00:28:37');
INSERT INTO `t_text_content` VALUES (33, '123', '2020-12-02 00:40:47');
INSERT INTO `t_text_content` VALUES (34, '123', '2020-12-02 00:40:47');
INSERT INTO `t_text_content` VALUES (35, '123', '2020-12-02 00:40:47');
INSERT INTO `t_text_content` VALUES (36, '[{\"examPaperId\":5,\"examPaperAnswerId\":7,\"status\":1}]', '2020-12-02 00:40:47');
INSERT INTO `t_text_content` VALUES (37, '开头列举人们总是在不自知的情况下习惯性摸脸的现象，引出说明对象：人为什么要摸自己的脸；与标题照应；为下文具体说明爱摸自己的脸的原因做铺垫；设置悬念，激发读者阅读兴趣。', '2020-12-02 00:41:38');
INSERT INTO `t_text_content` VALUES (38, '运用举例子的说明方法，具体直观地说明了用手掌触摸面部不同的位置有不同的作用，进一步说明了摸 脸在人类早期是我们说话的一种方式，从而说明了人为什么爱摸自己的脸。', '2020-12-02 00:41:38');
INSERT INTO `t_text_content` VALUES (39, '不能。部分是整体中的局部，表示范围，说明并不是所有的高级哺乳动物也拥有一定的自我意识，而只 是一部分，如果删去则表示全部，太过绝对，与事实不符。体现说明文语言的准确性、严密性。', '2020-12-02 00:41:38');
INSERT INTO `t_text_content` VALUES (40, '[{\"examPaperId\":5,\"examPaperAnswerId\":8,\"status\":2}]', '2020-12-02 00:41:38');
INSERT INTO `t_text_content` VALUES (41, 'asd', '2020-12-02 00:43:01');
INSERT INTO `t_text_content` VALUES (42, '[{\"examPaperId\":1,\"examPaperAnswerId\":9,\"status\":2}]', '2020-12-02 00:43:01');
INSERT INTO `t_text_content` VALUES (43, 'asd', '2020-12-02 00:43:08');
INSERT INTO `t_text_content` VALUES (44, 'asd', '2020-12-02 00:43:15');
INSERT INTO `t_text_content` VALUES (45, 'sad', '2020-12-02 00:43:22');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `age` int NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL COMMENT '1.男 2女',
  `birth_day` datetime(0) NULL DEFAULT NULL,
  `user_level` int NULL DEFAULT NULL COMMENT '学生年级(1-12)',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL COMMENT '1.学生 2.老师 3.管理员',
  `status` int NULL DEFAULT NULL COMMENT '1.启用 2禁用',
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `last_active_time` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '是否删除',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'd2d29da2-dcb3-4013-b874-727626236f47', 'student', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '学生', 18, 1, '2019-09-01 16:00:00', 12, '158800882', 1, 1, 'http://image.alvisu.com/Fn4CyLHWvT-kxIrK1ZaqTDidvXzj', '2019-09-07 18:55:02', '2020-02-04 08:26:54', NULL, b'0', NULL);
INSERT INTO `t_user` VALUES (2, '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', 30, 1, '2019-09-07 18:56:07', NULL, NULL, 3, 1, NULL, '2019-09-07 18:56:21', NULL, NULL, b'0', NULL);
INSERT INTO `t_user` VALUES (3, 'cd20ba0a-f759-4dab-94eb-8233eaf6d706', 'Rearcher', 'Cj/qKQe2/RjLiFjU+ggK3oqVkKp5ucA1vu1Rz32lCGFfOtgAovkQKAhoJ9Qi2MWLXdzA9lanQChG5RNKicFZa5ylvRtC05LmuolkQm+aaYOkCSobAm/gTXHgl0ISjACgHLZBZt6yEr7Ti9lVeAcDI9I2RGPKr9rUzOwWXgLaJKI=', NULL, NULL, NULL, NULL, 10, NULL, 1, 1, NULL, '2020-11-30 22:16:11', NULL, '2020-11-30 22:16:11', b'0', NULL);
INSERT INTO `t_user` VALUES (4, 'df285312-cb63-4498-86cf-05c052c42ce1', '123', 'fbMZPzD+ohm+qnukYlfFCaRg9Z3F8uYtaRwEZUOxntwwcli90y1zvzHfh+lIjlzqC5tjuo4sg+FQXaih24B8FwVKyk+nd00iKzzU77yfYN0Sz/MZaFmfCnVD6yD/E5ajN5BValvimDihooZk8nW+19vnoFiEKfulFqJRNu1XWhU=', NULL, NULL, NULL, NULL, 10, NULL, 1, 1, NULL, '2020-12-02 00:12:20', NULL, '2020-12-02 00:12:20', b'0', NULL);
INSERT INTO `t_user` VALUES (5, '0312d5d9-087e-45f1-9ae3-270fe7b310d6', '22', 'CkGl2pd+fOFZDUW7Bk+egLXIHPeWb7z3CFIprvnTMPkFiVNjtTRQcaf0ar2/Akz/ViYcdCumwkCUrktbWLw+3MG8OVLOj4MQh75fTCcfh2X2JQWj7p1NwbyJo375XzSY7GO+LzsyE+sF1UJlW+mXH4UjOATny1xA+qOBDNXHKMo=', NULL, NULL, NULL, NULL, 10, NULL, 1, 1, NULL, '2020-12-02 00:41:07', NULL, '2020-12-02 00:41:07', b'0', NULL);

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
INSERT INTO `t_user_event_log` VALUES (1, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-28 20:44:49');
INSERT INTO `t_user_event_log` VALUES (2, 1, 'student', '学生', 'student 登出了学之思考试系统', '2020-11-28 20:58:56');
INSERT INTO `t_user_event_log` VALUES (3, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-28 20:59:04');
INSERT INTO `t_user_event_log` VALUES (4, 2, 'admin', '管理员', 'admin 登录了学之思考试系统', '2020-11-28 21:02:11');
INSERT INTO `t_user_event_log` VALUES (5, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-28 21:13:20');
INSERT INTO `t_user_event_log` VALUES (6, 2, 'admin', '管理员', 'admin 登录了学之思考试系统', '2020-11-28 21:27:39');
INSERT INTO `t_user_event_log` VALUES (7, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 10:32:26');
INSERT INTO `t_user_event_log` VALUES (8, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 14:18:49');
INSERT INTO `t_user_event_log` VALUES (9, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 14:30:40');
INSERT INTO `t_user_event_log` VALUES (10, 2, 'admin', '管理员', 'admin 登录了学之思考试系统', '2020-11-30 14:30:50');
INSERT INTO `t_user_event_log` VALUES (11, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 14:32:43');
INSERT INTO `t_user_event_log` VALUES (12, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 14:34:34');
INSERT INTO `t_user_event_log` VALUES (13, 2, 'admin', '管理员', 'admin 登录了学之思考试系统', '2020-11-30 20:30:18');
INSERT INTO `t_user_event_log` VALUES (14, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 20:49:12');
INSERT INTO `t_user_event_log` VALUES (15, 1, 'student', '学生', 'student 登录了学之思考试系统', '2020-11-30 20:54:18');
INSERT INTO `t_user_event_log` VALUES (16, 2, 'admin', '管理员', 'admin 登录了学之思考试系统', '2020-11-30 21:07:38');
INSERT INTO `t_user_event_log` VALUES (17, 2, 'admin', '管理员', 'admin 登出了系统', '2020-11-30 21:38:02');
INSERT INTO `t_user_event_log` VALUES (18, 2, 'admin', '管理员', 'admin 登录了系统', '2020-11-30 21:38:05');
INSERT INTO `t_user_event_log` VALUES (19, 2, 'admin', '管理员', 'admin 登出了系统', '2020-11-30 21:39:51');
INSERT INTO `t_user_event_log` VALUES (20, 1, 'student', '学生', 'student 登录了系统', '2020-11-30 21:42:47');
INSERT INTO `t_user_event_log` VALUES (21, 2, 'admin', '管理员', 'admin 登录了系统', '2020-11-30 21:54:48');
INSERT INTO `t_user_event_log` VALUES (22, 1, 'student', '学生', 'student 登录了系统', '2020-11-30 21:59:53');
INSERT INTO `t_user_event_log` VALUES (23, 2, 'admin', '管理员', 'admin 登录了系统', '2020-11-30 22:00:43');
INSERT INTO `t_user_event_log` VALUES (24, 1, 'student', '学生', 'student 登录了系统', '2020-11-30 22:01:43');
INSERT INTO `t_user_event_log` VALUES (25, 2, 'admin', '管理员', 'admin 登录了系统', '2020-11-30 22:01:51');
INSERT INTO `t_user_event_log` VALUES (26, 2, 'admin', '管理员', 'admin 登出了系统', '2020-11-30 22:11:47');
INSERT INTO `t_user_event_log` VALUES (27, 2, 'admin', '管理员', 'admin 登录了系统', '2020-11-30 22:11:52');
INSERT INTO `t_user_event_log` VALUES (28, 1, 'student', '学生', 'student 登录了系统', '2020-11-30 22:15:20');
INSERT INTO `t_user_event_log` VALUES (29, 2, 'admin', '管理员', 'admin 登录了系统', '2020-11-30 22:15:36');
INSERT INTO `t_user_event_log` VALUES (30, 2, 'admin', '管理员', 'admin 登出了系统', '2020-11-30 22:16:00');
INSERT INTO `t_user_event_log` VALUES (31, 3, 'Rearcher', NULL, '欢迎 Rearcher 注册来到学之思考试系统', '2020-11-30 22:16:11');
INSERT INTO `t_user_event_log` VALUES (32, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-11-30 22:16:22');
INSERT INTO `t_user_event_log` VALUES (33, 3, 'Rearcher', NULL, 'Rearcher 提交试卷：1 得分：0 耗时：12 秒', '2020-11-30 22:16:52');
INSERT INTO `t_user_event_log` VALUES (34, 3, 'Rearcher', NULL, 'Rearcher 批改试卷：1 得分：0', '2020-11-30 22:17:26');
INSERT INTO `t_user_event_log` VALUES (35, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 15:04:07');
INSERT INTO `t_user_event_log` VALUES (36, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 20:30:01');
INSERT INTO `t_user_event_log` VALUES (37, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 20:41:11');
INSERT INTO `t_user_event_log` VALUES (38, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 21:21:08');
INSERT INTO `t_user_event_log` VALUES (39, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 21:21:53');
INSERT INTO `t_user_event_log` VALUES (40, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 21:28:19');
INSERT INTO `t_user_event_log` VALUES (41, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 21:29:05');
INSERT INTO `t_user_event_log` VALUES (42, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 22:37:38');
INSERT INTO `t_user_event_log` VALUES (43, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 22:38:00');
INSERT INTO `t_user_event_log` VALUES (44, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 22:38:40');
INSERT INTO `t_user_event_log` VALUES (45, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 23:09:18');
INSERT INTO `t_user_event_log` VALUES (46, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 23:09:56');
INSERT INTO `t_user_event_log` VALUES (47, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 23:14:48');
INSERT INTO `t_user_event_log` VALUES (48, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 23:15:17');
INSERT INTO `t_user_event_log` VALUES (49, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 23:16:07');
INSERT INTO `t_user_event_log` VALUES (50, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 23:17:14');
INSERT INTO `t_user_event_log` VALUES (51, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 23:19:01');
INSERT INTO `t_user_event_log` VALUES (52, 3, 'Rearcher', NULL, 'Rearcher 提交试卷：周考 得分：0 耗时：17 秒', '2020-12-01 23:19:24');
INSERT INTO `t_user_event_log` VALUES (53, 3, 'Rearcher', NULL, 'Rearcher 批改试卷：周考 得分：160', '2020-12-01 23:21:04');
INSERT INTO `t_user_event_log` VALUES (54, 3, 'Rearcher', NULL, 'Rearcher 提交试卷：周考 得分：0 耗时：7 秒', '2020-12-01 23:21:20');
INSERT INTO `t_user_event_log` VALUES (55, 3, 'Rearcher', NULL, 'Rearcher 提交试卷：周考 得分：0 耗时：6 秒', '2020-12-01 23:21:33');
INSERT INTO `t_user_event_log` VALUES (56, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 23:37:48');
INSERT INTO `t_user_event_log` VALUES (57, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 23:52:39');
INSERT INTO `t_user_event_log` VALUES (58, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 23:52:53');
INSERT INTO `t_user_event_log` VALUES (59, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-01 23:54:25');
INSERT INTO `t_user_event_log` VALUES (60, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-01 23:54:44');
INSERT INTO `t_user_event_log` VALUES (61, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:01:57');
INSERT INTO `t_user_event_log` VALUES (62, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:02:10');
INSERT INTO `t_user_event_log` VALUES (63, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:04:59');
INSERT INTO `t_user_event_log` VALUES (64, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:05:27');
INSERT INTO `t_user_event_log` VALUES (65, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:08:42');
INSERT INTO `t_user_event_log` VALUES (66, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:09:25');
INSERT INTO `t_user_event_log` VALUES (67, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:10:52');
INSERT INTO `t_user_event_log` VALUES (68, 3, 'Rearcher', NULL, 'Rearcher 登出了系统', '2020-12-02 00:12:13');
INSERT INTO `t_user_event_log` VALUES (69, 4, '123', NULL, '欢迎 123 注册来到学之思考试系统', '2020-12-02 00:12:20');
INSERT INTO `t_user_event_log` VALUES (70, 4, '123', NULL, '123 登录了系统', '2020-12-02 00:12:26');
INSERT INTO `t_user_event_log` VALUES (71, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:12:48');
INSERT INTO `t_user_event_log` VALUES (72, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:13:16');
INSERT INTO `t_user_event_log` VALUES (73, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:13:38');
INSERT INTO `t_user_event_log` VALUES (74, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:15:30');
INSERT INTO `t_user_event_log` VALUES (75, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:20:07');
INSERT INTO `t_user_event_log` VALUES (76, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:21:50');
INSERT INTO `t_user_event_log` VALUES (77, 3, 'Rearcher', NULL, 'Rearcher 登出了系统', '2020-12-02 00:23:47');
INSERT INTO `t_user_event_log` VALUES (78, 4, '123', NULL, '123 登录了系统', '2020-12-02 00:23:54');
INSERT INTO `t_user_event_log` VALUES (79, 4, '123', NULL, '123 提交试卷：语文周考 得分：0 耗时：8 秒', '2020-12-02 00:24:07');
INSERT INTO `t_user_event_log` VALUES (80, 4, '123', NULL, '123 批改试卷：语文周考 得分：98', '2020-12-02 00:24:40');
INSERT INTO `t_user_event_log` VALUES (81, 4, '123', NULL, '123 提交试卷：阅读理解测试 得分：0 耗时：3分 14秒', '2020-12-02 00:28:37');
INSERT INTO `t_user_event_log` VALUES (82, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:32:17');
INSERT INTO `t_user_event_log` VALUES (83, 4, '123', NULL, '123 登录了系统', '2020-12-02 00:40:33');
INSERT INTO `t_user_event_log` VALUES (84, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:40:41');
INSERT INTO `t_user_event_log` VALUES (85, 3, 'Rearcher', NULL, 'Rearcher 提交试卷：阅读理解测试 得分：0 耗时：3 秒', '2020-12-02 00:40:47');
INSERT INTO `t_user_event_log` VALUES (86, 3, 'Rearcher', NULL, 'Rearcher 登出了系统', '2020-12-02 00:40:56');
INSERT INTO `t_user_event_log` VALUES (87, 5, '22', NULL, '欢迎 22 注册来到学之思考试系统', '2020-12-02 00:41:07');
INSERT INTO `t_user_event_log` VALUES (88, 5, '22', NULL, '22 登录了系统', '2020-12-02 00:41:12');
INSERT INTO `t_user_event_log` VALUES (89, 5, '22', NULL, '22 提交试卷：阅读理解测试 得分：0 耗时：21 秒', '2020-12-02 00:41:38');
INSERT INTO `t_user_event_log` VALUES (90, 5, '22', NULL, '22 登出了系统', '2020-12-02 00:42:19');
INSERT INTO `t_user_event_log` VALUES (91, 3, 'Rearcher', NULL, 'Rearcher 登录了系统', '2020-12-02 00:42:23');
INSERT INTO `t_user_event_log` VALUES (92, 3, 'Rearcher', NULL, 'Rearcher 登出了系统', '2020-12-02 00:42:51');
INSERT INTO `t_user_event_log` VALUES (93, 5, '22', NULL, '22 登录了系统', '2020-12-02 00:42:53');
INSERT INTO `t_user_event_log` VALUES (94, 5, '22', NULL, '22 提交试卷：数学小测 得分：0 耗时：1 秒', '2020-12-02 00:43:01');
INSERT INTO `t_user_event_log` VALUES (95, 5, '22', NULL, '22 提交试卷：生物固定测试 得分：0 耗时：1 秒', '2020-12-02 00:43:08');
INSERT INTO `t_user_event_log` VALUES (96, 5, '22', NULL, '22 提交试卷：化学固定测试 得分：0 耗时：1 秒', '2020-12-02 00:43:15');
INSERT INTO `t_user_event_log` VALUES (97, 5, '22', NULL, '22 提交试卷：语文周考 得分：0 耗时：1 秒', '2020-12-02 00:43:22');
INSERT INTO `t_user_event_log` VALUES (98, 5, '22', NULL, '22 批改试卷：数学小测 得分：63', '2020-12-02 00:43:36');
INSERT INTO `t_user_event_log` VALUES (99, 5, '22', NULL, '22 批改试卷：生物固定测试 得分：9', '2020-12-02 00:43:40');
INSERT INTO `t_user_event_log` VALUES (100, 5, '22', NULL, '22 批改试卷：化学固定测试 得分：8', '2020-12-02 00:43:45');
INSERT INTO `t_user_event_log` VALUES (101, 5, '22', NULL, '22 批改试卷：语文周考 得分：50', '2020-12-02 00:43:51');
INSERT INTO `t_user_event_log` VALUES (102, 5, '22', NULL, '22 批改试卷：阅读理解测试 得分：97', '2020-12-02 00:44:06');
INSERT INTO `t_user_event_log` VALUES (103, 2, 'admin', '管理员', 'admin 登录了系统', '2020-12-02 00:48:33');

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL COMMENT '用户Id',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
