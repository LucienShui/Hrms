-- 删除所有的表
DROP DATABASE IF EXISTS hrmsdb;
CREATE DATABASE hrmsdb;

-- 选择数据库
USE hrmsdb;

-- 登陆界面的用户表
CREATE TABLE IF NOT EXISTS `users` (
	`username` varchar(27) PRIMARY KEY COMMENT '用户名',
	`password` varchar(27) COMMENT '密码'
);

INSERT INTO `users` VALUES
('root', 'root'),
('admin', 'admin');

-- id辅助表
CREATE TABLE IF NOT EXISTS `idSet` (
	tableName varchar(107),
	maxId int,
	PRIMARY KEY (`tableName`, `maxId`)
);

INSERT INTO `idSet`
VALUES 
	('department', 1),
	('post', 1),
	('staff', 1),
	('career', 1),
	('foreign', 1),
	('family', 1),
	('resigned', 1),
	('transfer', 1);

-- 存储各表id的stack
CREATE TABLE IF NOT EXISTS idStack (
	`tableName` varchar(107),
	`id` int,
	PRIMARY KEY (`tableName`, `id`)
);

-- 建立岗位表
CREATE TABLE IF NOT EXISTS `post` (
	`p_id` int PRIMARY KEY COMMENT '岗位编号',
	`p_name` varchar(107) UNIQUE NOT NULL COMMENT '岗位名称'
);

-- 部门编号
CREATE TABLE IF NOT EXISTS `department` (
	`d_id` int COMMENT '部门号',
	`d_name` varchar(107) UNIQUE NOT NULL COMMENT '部门名称',
	`d_phone` varchar(17) COMMENT '部门电话',
	`d_num_people` int NOT NULL COMMENT '现有人数',
	`d_superior` varchar(50) COMMENT '上级部门',
	PRIMARY KEY (`d_id`)
);

-- 建立员工信息表
CREATE TABLE IF NOT EXISTS `staff` (
	`s_id` int PRIMARY KEY COMMENT '员工编号',
	`s_name` varchar(107) NOT NULL COMMENT '员工姓名',
	`d_id` int COMMENT '部门编号',
	`p_id` int COMMENT '岗位编号'
);

-- 建立职业生涯信息
CREATE TABLE IF NOT EXISTS `career` (
	`c_id` int PRIMARY KEY COMMENT '职业生涯编号',
	`s_id` int COMMENT '员工编号',
	`c_company` varchar(100) COMMENT '就职公司',
	`c_hiredate` date COMMENT '入职时间',
	`c_leavedate` date COMMENT '离职时间',
	UNIQUE (`s_id`, `c_hiredate`),
	UNIQUE (`s_id`, `c_leavedate`)
);

-- 建立员工外语能力水平表
CREATE TABLE IF NOT EXISTS `foreign` (
	`fo_id` int PRIMARY KEY COMMENT '外语能力条目编号',
	`s_id` int COMMENT '员工编号',
	`fo_type` varchar(50) COMMENT '外语种类',
	`fo_level` int COMMENT '外语水平',
	UNIQUE (`s_id`, `fo_type`)
);

-- 建立员工家庭成员及社会关系表
CREATE TABLE IF NOT EXISTS `family` (
	`fa_id` int PRIMARY KEY COMMENT '家庭成员编号',
	`s_id` int COMMENT '员工编号',
	`fa_member` varchar(50) COMMENT '家庭成员',
	`fa_relation` varchar(50) COMMENT '社会关系',
	UNIQUE (`s_id`, `fa_member`)
);

-- 建立离职员工表
CREATE TABLE IF NOT EXISTS `resigned` (
	`r_id` int COMMENT '离职记录编号',
	`s_id` int NOT NULL COMMENT '员工编号',
	`r_leavedate` date NOT NULL COMMENT '离职日期',
	UNIQUE (`s_id`, `r_leavedate`)
);

-- 建立员工调动表
CREATE TABLE IF NOT EXISTS `transfer` (
	`t_id` int PRIMARY KEY COMMENT '调动编号',
	`s_id` int COMMENT '员工编号',
	`d_id` int COMMENT '部门编号',
	`p_id` int COMMENT '岗位编号',
	`p_hiredate` date COMMENT '入职日期'
-- 	,UNIQUE (`s_id`, `p_hiredate`)
);