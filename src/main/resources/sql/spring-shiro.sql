# Host: localhost:3396  (Version 5.5.36)
# Date: 2018-01-10 11:23:45
# Generator: MySQL-Front 6.0  (Build 2.20)


#
# Structure for table "t_permission"
#

DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_permission"
#

INSERT INTO `t_permission` VALUES (1,'系统权限菜单',0,'glyphicon glyphicon-blackboard','/main',NULL),(2,'控制面板',1,'glyphicon glyphicon-dashboard','',NULL),(3,'权限管理',1,'glyphicon glyphicon glyphicon-tasks',NULL,NULL),(4,'用户维护',3,'glyphicon glyphicon-user','/manager/user/index','user:insert,user:edit,user:delete'),(5,'角色维护',3,'glyphicon glyphicon-king','/manager/role/index',NULL),(6,'许可维护',3,'glyphicon glyphicon-lock','/manager/permission/index',NULL),(7,'业务审核',1,'glyphicon glyphicon-ok',NULL,NULL),(8,'实名认证审核',7,'glyphicon glyphicon-check','/manager/auth/index',NULL),(9,'广告审核',7,'glyphicon glyphicon-check','/manager/auth_advert/index',NULL),(10,'项目审核',7,'glyphicon glyphicon-check','/manager/auth_project/index',NULL),(11,'业务管理',1,'glyphicon glyphicon-th-large',NULL,NULL),(12,'资质维护',11,'glyphicon glyphicon-picture','/manager/cert/index',NULL),(13,'分类管理',11,'glyphicon glyphicon-equalizer','/type/index.htm',NULL),(14,'流程管理',11,'glyphicon glyphicon-random','/process/index.htm',NULL),(15,'广告管理',11,'glyphicon glyphicon-hdd','/advert/index.htm',NULL),(16,'消息模板',11,'glyphicon glyphicon-comment','/message/index.htm',NULL),(17,'项目分类',11,'glyphicon glyphicon-list','/projectType/index.htm',NULL),(18,'项目标签',11,'glyphicon glyphicon-tags','/tag/index.htm',NULL),(19,'参数管理',1,'glyphicon glyphicon-list-alt','/param/index.htm',NULL),(23,'数据字典',1,'glyphicon glyphicon-th','/dictionary/index.htm',NULL);

#
# Structure for table "t_role"
#

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_role"
#

INSERT INTO `t_role` VALUES (1,'PM - 项目经理','pm'),(2,'SE - 软件工程师','se'),(3,'PG - 程序员','pg'),(4,'TL - 组长','tl'),(5,'GL - 组长','gl'),(7,'QC - 品质控制','qc'),(8,'SA - 软件架构师','sa'),(9,'CMO / CMS - 配置管理员','cmo,cms'),(10,'SYSTEM-系统管理员','system,admin');

#
# Structure for table "t_role_permission"
#

DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) DEFAULT NULL,
  `permissionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_role_permission"
#

INSERT INTO `t_role_permission` VALUES (15,1,1),(16,1,2),(17,1,3),(18,1,4),(19,1,5),(20,1,6),(21,1,7),(22,1,8),(23,1,9),(24,1,10),(25,1,11),(26,1,12),(27,1,13),(28,1,14),(29,1,15),(30,1,16),(31,1,17),(32,1,18),(33,1,19),(34,1,23),(35,10,1),(36,10,3),(37,10,4),(38,10,5),(39,10,6);

#
# Structure for table "t_user"
#

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `loginacct` varchar(255) DEFAULT NULL,
  `userpswd` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createtime` char(19) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_user"
#

INSERT INTO `t_user` VALUES (1,'zhangsan','zhangsan','4297f44b13955235245b2497399d7a93','2',NULL),(2,'lisi','lisi','4297f44b13955235245b2497399d7a93','3',NULL),(3,'admin','admin','21232f297a57a5a743894a0e4a801fc3','admin@test.com',NULL);

#
# Structure for table "t_user_role"
#

DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "t_user_role"
#

INSERT INTO `t_user_role` VALUES (7,3,3),(8,3,10);
