/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : localhost:3306
 Source Schema         : mushan

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 09/09/2022 10:57:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_menu', '', NULL, NULL, 'SysMenu', 'crud', NULL, 'system', 'menu', NULL, 'mushan', '0', '/', NULL, '', '2022-08-16 14:36:19', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_role', '', NULL, NULL, 'SysRole', 'crud', NULL, 'system', 'role', NULL, 'mushan', '0', '/', NULL, '', '2022-08-16 14:44:36', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_user', '', NULL, NULL, 'SysUser', 'crud', NULL, 'system', 'user', NULL, 'mushan', '0', '/', NULL, '', '2022-08-16 14:48:30', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_role_menu', '', NULL, NULL, 'SysRoleMenu', 'crud', NULL, 'system', 'menu', NULL, 'mushan', '0', '/', NULL, '', '2022-08-16 14:58:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_user_role', '', NULL, NULL, 'SysUserRole', 'crud', NULL, 'system', 'role', NULL, 'mushan', '0', '/', NULL, '', '2022-08-16 15:01:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '菜单ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 1, '', '2022-08-16 14:36:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'menu_name', '菜单名称', 'varchar(50)', 'String', 'menuName', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 2, '', '2022-08-16 14:36:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'parent_id', '父菜单ID', 'bigint', 'Long', 'parentId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 3, '', '2022-08-16 14:36:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'order_num', '显示顺序', 'int', 'Integer', 'orderNum', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 4, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 5, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 6, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'query', '路由参数', 'varchar(255)', 'String', 'query', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 7, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'is_frame', '是否为外链（0是 1否）', 'int', 'Integer', 'isFrame', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 8, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '1', 'is_cache', '是否缓存（0缓存 1不缓存）', 'int', 'Integer', 'isCache', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 9, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '1', 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 10, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '1', 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 11, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '1', 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 12, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '1', 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 13, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '1', 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 14, '', '2022-08-16 14:36:20', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '1', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 15, '', '2022-08-16 14:36:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '1', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 16, '', '2022-08-16 14:36:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '1', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 17, '', '2022-08-16 14:36:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '1', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 18, '', '2022-08-16 14:36:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '1', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 19, '', '2022-08-16 14:36:21', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'id', '角色ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 1, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'role_name', '角色名称', 'varchar(30)', 'String', 'roleName', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 2, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'role_key', '角色权限字符串', 'varchar(100)', 'String', 'roleKey', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 3, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '2', 'role_sort', '显示顺序', 'int', 'Integer', 'roleSort', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 4, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '2', 'data_scope', '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）', 'char(1)', 'String', 'dataScope', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 5, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '2', 'menu_check_strictly', '菜单树选择项是否关联显示', 'tinyint(1)', 'Boolean', 'menuCheckStrictly', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 6, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '2', 'dept_check_strictly', '部门树选择项是否关联显示', 'tinyint(1)', 'Boolean', 'deptCheckStrictly', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 7, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '2', 'status', '角色状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 8, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 9, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 10, '', '2022-08-16 14:44:36', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 11, '', '2022-08-16 14:44:37', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 12, '', '2022-08-16 14:44:37', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 13, '', '2022-08-16 14:44:37', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 14, '', '2022-08-16 14:44:37', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '3', 'id', '用户ID', 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 1, '', '2022-08-16 14:48:30', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '3', 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 2, '', '2022-08-16 14:48:30', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '3', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 3, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '3', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', NULL, '', 4, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '3', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 5, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '3', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 6, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '3', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 7, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '3', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 8, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '3', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 9, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '3', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 10, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '3', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 11, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '3', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 12, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '3', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 13, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '3', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 14, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 15, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 16, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 17, '', '2022-08-16 14:48:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 18, '', '2022-08-16 14:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 19, '', '2022-08-16 14:48:32', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '4', 'role_id', '角色ID', 'bigint', 'Long', 'roleId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 1, '', '2022-08-16 14:58:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '4', 'menu_id', '菜单ID', 'bigint', 'Long', 'menuId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 2, '', '2022-08-16 14:58:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '4', 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 3, '', '2022-08-16 14:58:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '5', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 1, '', '2022-08-16 15:01:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '5', 'role_id', '角色ID', 'bigint', 'Long', 'roleId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 2, '', '2022-08-16 15:01:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '5', 'id', NULL, 'bigint', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', NULL, '', 3, '', '2022-08-16 15:01:44', '', NULL);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '', NULL, '', 1, 0, 'M', '0', '0', '', 'Setting', 'admin', '2022-08-10 20:49:43', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '用户管理', 1, 0, 'user', 'views/sys/user', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'User', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (3, '获取路由', 4, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:getRouters', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (4, '菜单管理', 1, 0, 'menu', 'views/sys/menu', NULL, 1, 0, 'C', '0', '0', 'system:menu:list', 'Position', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (5, '角色管理', 1, 0, 'role', 'views/sys/role', NULL, 1, 0, 'C', '0', '0', 'system:role:list', 'ChatDotSquare', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (6, '代码生成', 0, 1, '', NULL, '', 1, 0, 'M', '0', '0', '', 'EditPen', 'admin', '2022-08-10 20:49:43', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (7, '添加', 2, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:add', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (8, '修改', 2, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:edit', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (9, '删除', 2, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:remove', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (10, '添加', 4, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '修改', 4, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', NULL, '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '删除', 4, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', NULL, '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '添加', 5, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:add', NULL, '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '查询', 5, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:query', NULL, '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '修改', 5, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:edit', NULL, '', NULL, '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '删除', 5, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:remove', NULL, '', NULL, '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-08-10 20:49:43', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-08-10 20:49:43', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (133, 1, 115);
INSERT INTO `sys_role_menu` VALUES (133, 2, 116);
INSERT INTO `sys_role_menu` VALUES (133, 7, 117);
INSERT INTO `sys_role_menu` VALUES (133, 8, 118);
INSERT INTO `sys_role_menu` VALUES (133, 9, 119);
INSERT INTO `sys_role_menu` VALUES (133, 4, 120);
INSERT INTO `sys_role_menu` VALUES (133, 3, 121);
INSERT INTO `sys_role_menu` VALUES (133, 10, 122);
INSERT INTO `sys_role_menu` VALUES (133, 2004, 123);
INSERT INTO `sys_role_menu` VALUES (133, 2005, 124);
INSERT INTO `sys_role_menu` VALUES (1, 1, 125);
INSERT INTO `sys_role_menu` VALUES (1, 2, 126);
INSERT INTO `sys_role_menu` VALUES (1, 7, 127);
INSERT INTO `sys_role_menu` VALUES (1, 8, 128);
INSERT INTO `sys_role_menu` VALUES (1, 9, 129);
INSERT INTO `sys_role_menu` VALUES (1, 4, 130);
INSERT INTO `sys_role_menu` VALUES (1, 3, 131);
INSERT INTO `sys_role_menu` VALUES (1, 10, 132);
INSERT INTO `sys_role_menu` VALUES (1, 2004, 133);
INSERT INTO `sys_role_menu` VALUES (1, 2005, 134);
INSERT INTO `sys_role_menu` VALUES (1, 5, 135);
INSERT INTO `sys_role_menu` VALUES (1, 2006, 136);
INSERT INTO `sys_role_menu` VALUES (1, 2007, 137);
INSERT INTO `sys_role_menu` VALUES (1, 2008, 138);
INSERT INTO `sys_role_menu` VALUES (1, 2009, 139);
INSERT INTO `sys_role_menu` VALUES (1, 6, 140);
INSERT INTO `sys_role_menu` VALUES (2, 1, 212);
INSERT INTO `sys_role_menu` VALUES (2, 2, 213);
INSERT INTO `sys_role_menu` VALUES (2, 7, 214);
INSERT INTO `sys_role_menu` VALUES (2, 8, 215);
INSERT INTO `sys_role_menu` VALUES (2, 9, 216);
INSERT INTO `sys_role_menu` VALUES (2, 4, 217);
INSERT INTO `sys_role_menu` VALUES (2, 3, 218);
INSERT INTO `sys_role_menu` VALUES (2, 10, 219);
INSERT INTO `sys_role_menu` VALUES (2, 2004, 220);
INSERT INTO `sys_role_menu` VALUES (2, 2005, 221);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '22233', '00', '123@qq.com', '122222', '1', '', '$2a$10$wYElKbRfmL.iVFfekufeWOE0feihr0jzw2hfiTl/MP0pr6TfP3TnW', '0', '0', '127.0.0.1', '2022-08-10 20:49:43', 'admin', '2022-08-10 20:49:43', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (126, NULL, 'test', '22222111', '00', '22333', '1222', '0', '', '$2a$10$wYElKbRfmL.iVFfekufeWOE0feihr0jzw2hfiTl/MP0pr6TfP3TnW', '0', '0', '', NULL, '', NULL, '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1);
INSERT INTO `sys_user_role` VALUES (125, 1, 3);
INSERT INTO `sys_user_role` VALUES (126, 2, 4);

SET FOREIGN_KEY_CHECKS = 1;
