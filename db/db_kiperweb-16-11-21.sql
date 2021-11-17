/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.21-MariaDB : Database - kip3r_web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kip3r_web` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kip3r_web`;

/*Table structure for table `backend_access_log` */

DROP TABLE IF EXISTS `backend_access_log`;

CREATE TABLE `backend_access_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_access_log` */

insert  into `backend_access_log`(`id`,`user_id`,`ip_address`,`created_at`,`updated_at`) values (1,1,'127.0.0.1','2021-11-09 14:50:30','2021-11-09 14:50:30'),(2,1,'127.0.0.1','2021-11-16 18:16:41','2021-11-16 18:16:41');

/*Table structure for table `backend_user_groups` */

DROP TABLE IF EXISTS `backend_user_groups`;

CREATE TABLE `backend_user_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_new_user_default` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_unique` (`name`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_groups` */

insert  into `backend_user_groups`(`id`,`name`,`created_at`,`updated_at`,`code`,`description`,`is_new_user_default`) values (1,'Owners','2021-11-09 14:49:01','2021-11-09 14:49:01','owners','Default group for website owners.',0);

/*Table structure for table `backend_user_preferences` */

DROP TABLE IF EXISTS `backend_user_preferences`;

CREATE TABLE `backend_user_preferences` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_item_index` (`user_id`,`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_preferences` */

insert  into `backend_user_preferences`(`id`,`user_id`,`namespace`,`group`,`item`,`value`) values (1,1,'backend','reportwidgets','dashboard','{\"welcome\":{\"class\":\"Backend\\\\ReportWidgets\\\\Welcome\",\"sortOrder\":50,\"configuration\":{\"ocWidgetWidth\":7}},\"systemStatus\":{\"class\":\"System\\\\ReportWidgets\\\\Status\",\"sortOrder\":60,\"configuration\":{\"title\":\"System status\",\"ocWidgetWidth\":\"7\",\"ocWidgetNewRow\":null}},\"activeTheme\":{\"class\":\"Cms\\\\ReportWidgets\\\\ActiveTheme\",\"sortOrder\":70,\"configuration\":{\"ocWidgetWidth\":5}},\"report_container_dashboard_4\":{\"class\":\"Indikator\\\\Backend\\\\ReportWidgets\\\\Cache\",\"configuration\":{\"title\":\"indikator.backend::lang.widgets.cache.label\",\"ocWidgetWidth\":\"7\"},\"sortOrder\":71}}');

/*Table structure for table `backend_user_roles` */

DROP TABLE IF EXISTS `backend_user_roles`;

CREATE TABLE `backend_user_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_system` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `role_unique` (`name`),
  KEY `role_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_roles` */

insert  into `backend_user_roles`(`id`,`name`,`code`,`description`,`permissions`,`is_system`,`created_at`,`updated_at`) values (1,'Publisher','publisher','Site editor with access to publishing tools.','',1,'2021-11-09 14:49:01','2021-11-09 14:49:01'),(2,'Developer','developer','Site administrator with access to developer tools.','',1,'2021-11-09 14:49:01','2021-11-09 14:49:01');

/*Table structure for table `backend_user_throttle` */

DROP TABLE IF EXISTS `backend_user_throttle`;

CREATE TABLE `backend_user_throttle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_at` timestamp NULL DEFAULT NULL,
  `is_suspended` tinyint(1) NOT NULL DEFAULT 0,
  `suspended_at` timestamp NULL DEFAULT NULL,
  `is_banned` tinyint(1) NOT NULL DEFAULT 0,
  `banned_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `backend_user_throttle_user_id_index` (`user_id`),
  KEY `backend_user_throttle_ip_address_index` (`ip_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_user_throttle` */

insert  into `backend_user_throttle`(`id`,`user_id`,`ip_address`,`attempts`,`last_attempt_at`,`is_suspended`,`suspended_at`,`is_banned`,`banned_at`) values (1,1,'127.0.0.1',0,NULL,0,NULL,0,NULL);

/*Table structure for table `backend_users` */

DROP TABLE IF EXISTS `backend_users`;

CREATE TABLE `backend_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `persist_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reset_password_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) unsigned DEFAULT NULL,
  `activated_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `act_code_index` (`activation_code`),
  KEY `reset_code_index` (`reset_password_code`),
  KEY `admin_role_index` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_users` */

insert  into `backend_users`(`id`,`first_name`,`last_name`,`login`,`email`,`password`,`activation_code`,`persist_code`,`reset_password_code`,`permissions`,`is_activated`,`role_id`,`activated_at`,`last_login`,`created_at`,`updated_at`,`deleted_at`,`is_superuser`) values (1,'Kiper','Web','admin_dev','jorge@kiper.com','$2y$10$G80P/nA/rhwy3cMyPK2ACeZfhOJHcYj0/biX9tNmV2iZEDc4NyqHa',NULL,'$2y$10$P649aeLNYeQjsouR46BZouivWAokfuMFMBa21rraf3ew9dEfUHK8q',NULL,'',1,2,NULL,'2021-11-16 18:16:40','2021-11-09 14:49:01','2021-11-16 18:16:40',NULL,1);

/*Table structure for table `backend_users_groups` */

DROP TABLE IF EXISTS `backend_users_groups`;

CREATE TABLE `backend_users_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `user_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `backend_users_groups` */

insert  into `backend_users_groups`(`user_id`,`user_group_id`) values (1,1);

/*Table structure for table `cache` */

DROP TABLE IF EXISTS `cache`;

CREATE TABLE `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cache` */

/*Table structure for table `cms_theme_data` */

DROP TABLE IF EXISTS `cms_theme_data`;

CREATE TABLE `cms_theme_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_data_theme_index` (`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_theme_data` */

/*Table structure for table `cms_theme_logs` */

DROP TABLE IF EXISTS `cms_theme_logs`;

CREATE TABLE `cms_theme_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_template` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_logs_type_index` (`type`),
  KEY `cms_theme_logs_theme_index` (`theme`),
  KEY `cms_theme_logs_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_theme_logs` */

/*Table structure for table `cms_theme_templates` */

DROP TABLE IF EXISTS `cms_theme_templates`;

CREATE TABLE `cms_theme_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cms_theme_templates_source_index` (`source`),
  KEY `cms_theme_templates_path_index` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cms_theme_templates` */

/*Table structure for table `deferred_bindings` */

DROP TABLE IF EXISTS `deferred_bindings`;

CREATE TABLE `deferred_bindings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `master_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `master_field` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slave_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_bind` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `deferred_bindings_master_type_index` (`master_type`),
  KEY `deferred_bindings_master_field_index` (`master_field`),
  KEY `deferred_bindings_slave_type_index` (`slave_type`),
  KEY `deferred_bindings_slave_id_index` (`slave_id`),
  KEY `deferred_bindings_session_key_index` (`session_key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `deferred_bindings` */

/*Table structure for table `failed_jobs` */

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `failed_jobs` */

/*Table structure for table `indikator_backend_trash` */

DROP TABLE IF EXISTS `indikator_backend_trash`;

CREATE TABLE `indikator_backend_trash` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `indikator_backend_trash` */

/*Table structure for table `jobs` */

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `jobs` */

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (1,'2013_10_01_000001_Db_Deferred_Bindings',1),(2,'2013_10_01_000002_Db_System_Files',1),(3,'2013_10_01_000003_Db_System_Plugin_Versions',1),(4,'2013_10_01_000004_Db_System_Plugin_History',1),(5,'2013_10_01_000005_Db_System_Settings',1),(6,'2013_10_01_000006_Db_System_Parameters',1),(7,'2013_10_01_000007_Db_System_Add_Disabled_Flag',1),(8,'2013_10_01_000008_Db_System_Mail_Templates',1),(9,'2013_10_01_000009_Db_System_Mail_Layouts',1),(10,'2014_10_01_000010_Db_Jobs',1),(11,'2014_10_01_000011_Db_System_Event_Logs',1),(12,'2014_10_01_000012_Db_System_Request_Logs',1),(13,'2014_10_01_000013_Db_System_Sessions',1),(14,'2015_10_01_000014_Db_System_Mail_Layout_Rename',1),(15,'2015_10_01_000015_Db_System_Add_Frozen_Flag',1),(16,'2015_10_01_000016_Db_Cache',1),(17,'2015_10_01_000017_Db_System_Revisions',1),(18,'2015_10_01_000018_Db_FailedJobs',1),(19,'2016_10_01_000019_Db_System_Plugin_History_Detail_Text',1),(20,'2016_10_01_000020_Db_System_Timestamp_Fix',1),(21,'2017_08_04_121309_Db_Deferred_Bindings_Add_Index_Session',1),(22,'2017_10_01_000021_Db_System_Sessions_Update',1),(23,'2017_10_01_000022_Db_Jobs_FailedJobs_Update',1),(24,'2017_10_01_000023_Db_System_Mail_Partials',1),(25,'2017_10_23_000024_Db_System_Mail_Layouts_Add_Options_Field',1),(26,'2013_10_01_000001_Db_Backend_Users',2),(27,'2013_10_01_000002_Db_Backend_User_Groups',2),(28,'2013_10_01_000003_Db_Backend_Users_Groups',2),(29,'2013_10_01_000004_Db_Backend_User_Throttle',2),(30,'2014_01_04_000005_Db_Backend_User_Preferences',2),(31,'2014_10_01_000006_Db_Backend_Access_Log',2),(32,'2014_10_01_000007_Db_Backend_Add_Description_Field',2),(33,'2015_10_01_000008_Db_Backend_Add_Superuser_Flag',2),(34,'2016_10_01_000009_Db_Backend_Timestamp_Fix',2),(35,'2017_10_01_000010_Db_Backend_User_Roles',2),(36,'2018_12_16_000011_Db_Backend_Add_Deleted_At',2),(37,'2014_10_01_000001_Db_Cms_Theme_Data',3),(38,'2016_10_01_000002_Db_Cms_Timestamp_Fix',3),(39,'2017_10_01_000003_Db_Cms_Theme_Logs',3),(40,'2018_11_01_000001_Db_Cms_Theme_Templates',3);

/*Table structure for table `rainlab_blog_categories` */

DROP TABLE IF EXISTS `rainlab_blog_categories`;

CREATE TABLE `rainlab_blog_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `nest_left` int(11) DEFAULT NULL,
  `nest_right` int(11) DEFAULT NULL,
  `nest_depth` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_categories_slug_index` (`slug`),
  KEY `rainlab_blog_categories_parent_id_index` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rainlab_blog_categories` */

insert  into `rainlab_blog_categories`(`id`,`name`,`slug`,`code`,`description`,`parent_id`,`nest_left`,`nest_right`,`nest_depth`,`created_at`,`updated_at`) values (2,'Todos','todos',NULL,'',NULL,1,2,0,'2021-11-17 03:36:05','2021-11-17 03:36:05'),(3,'Populares','populares',NULL,'',NULL,3,4,0,'2021-11-17 05:00:01','2021-11-17 05:00:01');

/*Table structure for table `rainlab_blog_posts` */

DROP TABLE IF EXISTS `rainlab_blog_posts`;

CREATE TABLE `rainlab_blog_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rainlab_blog_posts_user_id_index` (`user_id`),
  KEY `rainlab_blog_posts_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rainlab_blog_posts` */

insert  into `rainlab_blog_posts`(`id`,`user_id`,`title`,`slug`,`excerpt`,`content`,`content_html`,`published_at`,`published`,`created_at`,`updated_at`,`metadata`) values (2,1,'MariaDB 10.6 and PostgreSQL 14','mariadb-106-and-postgresql-14','We\'re happy to announce the immediate availability of MariaDB.','We\'re happy to announce the immediate availability of MariaDB 10.6 and PostgreSQL 14 database versions on Laravel Forge.\r\n\r\nMariaDB 10.6 has replaced 10.3 as the default MariaDB version in Forge. Servers that were provisioned with MariaDB 10.3 will continue to run 10.3. New servers will now install 10.6.\r\n\r\nIf you don’t have a Forge account, now is a great time to sign up! Forge allows you to painlessly create and manage PHP servers which include MySQL, Redis, Memcached, database backups, and everything else you need to run robust, modern Laravel applications.','<p>We\'re happy to announce the immediate availability of MariaDB 10.6 and PostgreSQL 14 database versions on Laravel Forge.</p>\n<p>MariaDB 10.6 has replaced 10.3 as the default MariaDB version in Forge. Servers that were provisioned with MariaDB 10.3 will continue to run 10.3. New servers will now install 10.6.</p>\n<p>If you don’t have a Forge account, now is a great time to sign up! Forge allows you to painlessly create and manage PHP servers which include MySQL, Redis, Memcached, database backups, and everything else you need to run robust, modern Laravel applications.</p>','2021-11-17 03:37:00',1,'2021-11-17 03:35:22','2021-11-17 03:44:52',NULL),(3,1,'Vapor: PHP 8.1 Release Candidate Is Now Supported','vapor-php-81-release-candidate-now-supported','If your application is using Docker runtimes, we hope to release PHP 8.1','If your application is using Docker runtimes, we hope to release PHP 8.1 support for your environment within the next week or two.\r\n\r\nIn addition, some Vapor features, PHP features, and PHP extensions may not work as expected when running environments on PHP 8.1. And of course, soon as PHP 8.1 receives a stable release, your environment will automatically start using PHP 8.1\'s stable version after a subsequent deployment.\r\n\r\nWe hope you enjoy PHP 8.1 in your Vapor projects. At Laravel, we\'re committed to providing you with the most robust and developer-friendly PHP experience in the world. If you haven\'t checked out Vapor, now is a great time to start! You can create your account today at: vapor.laravel.com.','<p>If your application is using Docker runtimes, we hope to release PHP 8.1 support for your environment within the next week or two.</p>\n<p>In addition, some Vapor features, PHP features, and PHP extensions may not work as expected when running environments on PHP 8.1. And of course, soon as PHP 8.1 receives a stable release, your environment will automatically start using PHP 8.1\'s stable version after a subsequent deployment.</p>\n<p>We hope you enjoy PHP 8.1 in your Vapor projects. At Laravel, we\'re committed to providing you with the most robust and developer-friendly PHP experience in the world. If you haven\'t checked out Vapor, now is a great time to start! You can create your account today at: vapor.laravel.com.</p>','2021-11-17 05:04:15',1,'2021-11-17 05:04:38','2021-11-17 05:04:38',NULL);

/*Table structure for table `rainlab_blog_posts_categories` */

DROP TABLE IF EXISTS `rainlab_blog_posts_categories`;

CREATE TABLE `rainlab_blog_posts_categories` (
  `post_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `rainlab_blog_posts_categories` */

insert  into `rainlab_blog_posts_categories`(`post_id`,`category_id`) values (2,2),(3,2),(3,3);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

/*Table structure for table `system_event_logs` */

DROP TABLE IF EXISTS `system_event_logs`;

CREATE TABLE `system_event_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_event_logs_level_index` (`level`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_event_logs` */

insert  into `system_event_logs`(`id`,`level`,`message`,`details`,`created_at`,`updated_at`) values (1,'error','Twig\\Error\\SyntaxError: Unknown \"csrf_field\" function in \"C:\\xampp\\htdocs\\kiper-web/themes/kiper/pages/inicio.htm\" at line 14. in C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php:762\nStack trace:\n#0 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(460): Twig\\ExpressionParser->getFunctionNodeClass(\'csrf_field\', 14)\n#1 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(235): Twig\\ExpressionParser->getFunctionNode(\'csrf_field\', 14)\n#2 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\xampp\\\\htdocs...\', NULL)\n#10 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(424): Twig\\Environment->loadTemplate(\'C:\\\\xampp\\\\htdocs...\')\n#11 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\xampp\\htdocs\\kiper-web\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2021-11-10 03:48:39','2021-11-10 03:48:39'),(2,'error','Twig\\Error\\SyntaxError: Unknown \"csrf_field\" function in \"C:\\xampp\\htdocs\\kiper-web/themes/kiper/pages/inicio.htm\" at line 15. in C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php:762\nStack trace:\n#0 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(460): Twig\\ExpressionParser->getFunctionNodeClass(\'csrf_field\', 15)\n#1 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(235): Twig\\ExpressionParser->getFunctionNode(\'csrf_field\', 15)\n#2 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\xampp\\\\htdocs...\', NULL)\n#10 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(424): Twig\\Environment->loadTemplate(\'C:\\\\xampp\\\\htdocs...\')\n#11 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\xampp\\htdocs\\kiper-web\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2021-11-10 03:49:14','2021-11-10 03:49:14'),(3,'error','Twig\\Error\\SyntaxError: Unknown \"csrf_field\" function in \"C:\\xampp\\htdocs\\kiper-web/themes/kiper/pages/inicio.htm\" at line 15. in C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php:762\nStack trace:\n#0 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(460): Twig\\ExpressionParser->getFunctionNodeClass(\'csrf_field\', 15)\n#1 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(235): Twig\\ExpressionParser->getFunctionNode(\'csrf_field\', 15)\n#2 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(175): Twig\\ExpressionParser->parsePrimaryExpression()\n#3 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\ExpressionParser.php(70): Twig\\ExpressionParser->getPrimary()\n#4 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Parser.php(142): Twig\\ExpressionParser->parseExpression()\n#5 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Parser.php(98): Twig\\Parser->subparse(NULL, false)\n#6 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(563): Twig\\Parser->parse(Object(Twig\\TokenStream))\n#7 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(595): Twig\\Environment->parse(Object(Twig\\TokenStream))\n#8 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(408): Twig\\Environment->compileSource(Object(Twig\\Source))\n#9 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Environment.php(381): Twig\\Environment->loadClass(\'__TwigTemplate_...\', \'C:\\\\xampp\\\\htdocs...\', NULL)\n#10 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(424): Twig\\Environment->loadTemplate(\'C:\\\\xampp\\\\htdocs...\')\n#11 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\xampp\\htdocs\\kiper-web\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}',NULL,'2021-11-10 03:49:23','2021-11-10 03:49:23'),(4,'error','RuntimeException: The source file \"C:\\xampp\\htdocs\\kiper-web/themes/kiper/assetsfont/font.css\" does not exist. in C:\\xampp\\htdocs\\kiper-web\\vendor\\kriswallsmith\\assetic\\src\\Assetic\\Asset\\FileAsset.php:73\nStack trace:\n#0 C:\\xampp\\htdocs\\kiper-web\\vendor\\kriswallsmith\\assetic\\src\\Assetic\\Asset\\AssetCache.php(112): Assetic\\Asset\\FileAsset->getLastModified()\n#1 C:\\xampp\\htdocs\\kiper-web\\vendor\\kriswallsmith\\assetic\\src\\Assetic\\Factory\\AssetFactory.php(255): Assetic\\Asset\\AssetCache->getLastModified()\n#2 C:\\xampp\\htdocs\\kiper-web\\modules\\system\\classes\\CombineAssets.php(385): Assetic\\Factory\\AssetFactory->getLastModified(Object(Assetic\\Asset\\AssetCollection))\n#3 C:\\xampp\\htdocs\\kiper-web\\modules\\system\\classes\\CombineAssets.php(183): System\\Classes\\CombineAssets->prepareRequest(Array, \'C:\\\\xampp\\\\htdocs...\')\n#4 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(1380): System\\Classes\\CombineAssets::combine(Array, \'C:\\\\xampp\\\\htdocs...\')\n#5 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\twig\\Extension.php(172): Cms\\Classes\\Controller->themeUrl(Array)\n#6 C:\\xampp\\htdocs\\kiper-web\\storage\\cms\\twig\\ff\\ff28ef804510c75dd103c4aa150547c12c9143b5e7aab65ff8d3d45780aed8b4.php(60): Cms\\Twig\\Extension->themeFilter(Array)\n#7 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Template.php(405): __TwigTemplate_65ef22a8d37ba3c8ab71ecc95312f98a16bd2ee5f7433ce0d0da46146a269864->doDisplay(Array, Array)\n#8 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Template.php(378): Twig\\Template->displayWithErrorHandling(Array, Array)\n#9 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Template.php(390): Twig\\Template->display(Array)\n#10 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(435): Twig\\Template->render(Array)\n#11 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#12 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#13 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#14 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#15 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#16 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#17 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#18 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#19 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#20 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#22 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#23 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#25 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#26 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#28 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#29 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#30 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#31 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#32 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#34 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#36 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#37 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#39 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#40 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#43 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#44 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#45 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#46 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#47 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#48 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#49 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#50 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#51 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#52 C:\\xampp\\htdocs\\kiper-web\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#53 {main}\n\nNext Twig\\Error\\RuntimeError: An exception has been thrown during the rendering of a template (\"The source file \"C:\\xampp\\htdocs\\kiper-web/themes/kiper/assetsfont/font.css\" does not exist.\") in \"C:\\xampp\\htdocs\\kiper-web/themes/kiper/layouts/layout.htm\" at line 17. in C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Template.php:419\nStack trace:\n#0 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Template.php(378): Twig\\Template->displayWithErrorHandling(Array, Array)\n#1 C:\\xampp\\htdocs\\kiper-web\\vendor\\twig\\twig\\src\\Template.php(390): Twig\\Template->display(Array)\n#2 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(435): Twig\\Template->render(Array)\n#3 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\Controller.php(225): Cms\\Classes\\Controller->runPage(Object(Cms\\Classes\\Page))\n#4 C:\\xampp\\htdocs\\kiper-web\\modules\\cms\\classes\\CmsController.php(50): Cms\\Classes\\Controller->run(\'/\')\n#5 [internal function]: Cms\\Classes\\CmsController->run(\'/\')\n#6 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Controller.php(54): call_user_func_array(Array, Array)\n#7 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\ControllerDispatcher.php(45): Illuminate\\Routing\\Controller->callAction(\'run\', Array)\n#8 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(212): Illuminate\\Routing\\ControllerDispatcher->dispatch(Object(Illuminate\\Routing\\Route), Object(Cms\\Classes\\CmsController), \'run\')\n#9 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Route.php(169): Illuminate\\Routing\\Route->runController()\n#10 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(658): Illuminate\\Routing\\Route->run()\n#11 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Routing\\Router->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#12 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Middleware\\SubstituteBindings.php(41): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#13 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Routing\\Middleware\\SubstituteBindings->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#14 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#15 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\View\\Middleware\\ShareErrorsFromSession.php(49): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#16 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\View\\Middleware\\ShareErrorsFromSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#17 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#18 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Session\\Middleware\\StartSession.php(63): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#19 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Session\\Middleware\\StartSession->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#20 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#21 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse.php(37): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#22 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\AddQueuedCookiesToResponse->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#23 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#24 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Cookie\\Middleware\\EncryptCookies.php(68): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#25 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): Illuminate\\Cookie\\Middleware\\EncryptCookies->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#26 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#27 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#28 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(660): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#29 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(635): Illuminate\\Routing\\Router->runRouteWithinStack(Object(Illuminate\\Routing\\Route), Object(Illuminate\\Http\\Request))\n#30 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Router.php(601): Illuminate\\Routing\\Router->runRoute(Object(Illuminate\\Http\\Request), Object(Illuminate\\Routing\\Route))\n#31 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Router\\CoreRouter.php(20): Illuminate\\Routing\\Router->dispatchToRoute(Object(Illuminate\\Http\\Request))\n#32 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(176): October\\Rain\\Router\\CoreRouter->dispatch(Object(Illuminate\\Http\\Request))\n#33 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(30): Illuminate\\Foundation\\Http\\Kernel->Illuminate\\Foundation\\Http\\{closure}(Object(Illuminate\\Http\\Request))\n#34 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#35 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode.php(25): Illuminate\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#36 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Foundation\\Http\\Middleware\\CheckForMaintenanceMode->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#37 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#38 C:\\xampp\\htdocs\\kiper-web\\vendor\\october\\rain\\src\\Http\\Middleware\\TrustHosts.php(46): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#39 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(149): October\\Rain\\Http\\Middleware\\TrustHosts->handle(Object(Illuminate\\Http\\Request), Object(Closure))\n#40 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Routing\\Pipeline.php(53): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(Illuminate\\Http\\Request))\n#41 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(102): Illuminate\\Routing\\Pipeline->Illuminate\\Routing\\{closure}(Object(Illuminate\\Http\\Request))\n#42 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(151): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#43 C:\\xampp\\htdocs\\kiper-web\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Http\\Kernel.php(116): Illuminate\\Foundation\\Http\\Kernel->sendRequestThroughRouter(Object(Illuminate\\Http\\Request))\n#44 C:\\xampp\\htdocs\\kiper-web\\index.php(43): Illuminate\\Foundation\\Http\\Kernel->handle(Object(Illuminate\\Http\\Request))\n#45 {main}',NULL,'2021-11-10 03:49:29','2021-11-10 03:49:29');

/*Table structure for table `system_files` */

DROP TABLE IF EXISTS `system_files`;

CREATE TABLE `system_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `disk_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `content_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_files_field_index` (`field`),
  KEY `system_files_attachment_id_index` (`attachment_id`),
  KEY `system_files_attachment_type_index` (`attachment_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_files` */

insert  into `system_files`(`id`,`disk_name`,`file_name`,`file_size`,`content_type`,`title`,`description`,`field`,`attachment_id`,`attachment_type`,`is_public`,`sort_order`,`created_at`,`updated_at`) values (1,'618a907dba21f497234031.svg','kiper.svg',2945,'image/svg',NULL,NULL,'logo','1','Backend\\Models\\BrandSetting',1,1,'2021-11-09 15:15:09','2021-11-09 15:21:25'),(2,'618a93751e563627716711.png','kiper_logo.png',2080,'image/png',NULL,NULL,'avatar','1','Backend\\Models\\User',1,2,'2021-11-09 15:27:49','2021-11-09 15:27:54'),(3,'61947aa54d819199449936.png','image_grande_post.png',177416,'image/png',NULL,NULL,'featured_images','2','RainLab\\Blog\\Models\\Post',1,3,'2021-11-17 03:44:37','2021-11-17 03:44:52'),(4,'61948d60025ad046744201.png','image_grande_post.png',177416,'image/png',NULL,NULL,'featured_images','3','RainLab\\Blog\\Models\\Post',1,4,'2021-11-17 05:04:32','2021-11-17 05:04:38');

/*Table structure for table `system_mail_layouts` */

DROP TABLE IF EXISTS `system_mail_layouts`;

CREATE TABLE `system_mail_layouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_css` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_locked` tinyint(1) NOT NULL DEFAULT 0,
  `options` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_mail_layouts` */

insert  into `system_mail_layouts`(`id`,`name`,`code`,`content_html`,`content_text`,`content_css`,`is_locked`,`options`,`created_at`,`updated_at`) values (1,'Default layout','default','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-default\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n\n        <!-- Header -->\n        {% partial \'header\' body %}\n            {{ subject|raw }}\n        {% endpartial %}\n\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n\n        <!-- Footer -->\n        {% partial \'footer\' body %}\n            &copy; {{ \"now\"|date(\"Y\") }} {{ appName }}. All rights reserved.\n        {% endpartial %}\n\n    </table>\n\n</body>\n</html>','{{ content|raw }}','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2021-11-09 14:49:01','2021-11-09 14:49:01'),(2,'System layout','system','<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n</head>\n<body>\n    <style type=\"text/css\" media=\"screen\">\n        {{ brandCss|raw }}\n        {{ css|raw }}\n    </style>\n\n    <table class=\"wrapper layout-system\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n        <tr>\n            <td align=\"center\">\n                <table class=\"content\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                    <!-- Email Body -->\n                    <tr>\n                        <td class=\"body\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">\n                            <table class=\"inner-body\" align=\"center\" width=\"570\" cellpadding=\"0\" cellspacing=\"0\">\n                                <!-- Body content -->\n                                <tr>\n                                    <td class=\"content-cell\">\n                                        {{ content|raw }}\n\n                                        <!-- Subcopy -->\n                                        {% partial \'subcopy\' body %}\n                                            **This is an automatic message. Please do not reply to it.**\n                                        {% endpartial %}\n                                    </td>\n                                </tr>\n                            </table>\n                        </td>\n                    </tr>\n                </table>\n            </td>\n        </tr>\n    </table>\n\n</body>\n</html>','{{ content|raw }}\n\n\n---\nThis is an automatic message. Please do not reply to it.','@media only screen and (max-width: 600px) {\n    .inner-body {\n        width: 100% !important;\n    }\n\n    .footer {\n        width: 100% !important;\n    }\n}\n\n@media only screen and (max-width: 500px) {\n    .button {\n        width: 100% !important;\n    }\n}',1,NULL,'2021-11-09 14:49:01','2021-11-09 14:49:01');

/*Table structure for table `system_mail_partials` */

DROP TABLE IF EXISTS `system_mail_partials`;

CREATE TABLE `system_mail_partials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_mail_partials` */

/*Table structure for table `system_mail_templates` */

DROP TABLE IF EXISTS `system_mail_templates`;

CREATE TABLE `system_mail_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_id` int(11) DEFAULT NULL,
  `is_custom` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_mail_templates_layout_id_index` (`layout_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_mail_templates` */

/*Table structure for table `system_parameters` */

DROP TABLE IF EXISTS `system_parameters`;

CREATE TABLE `system_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_index` (`namespace`,`group`,`item`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_parameters` */

insert  into `system_parameters`(`id`,`namespace`,`group`,`item`,`value`) values (1,'system','update','count','0'),(2,'system','core','hash','\"652ebd026445ccaeb3ba083f00830dc0\"'),(3,'system','core','build','\"473\"'),(4,'system','update','retry','1637173003'),(5,'cms','theme','active','\"kiper\"');

/*Table structure for table `system_plugin_history` */

DROP TABLE IF EXISTS `system_plugin_history`;

CREATE TABLE `system_plugin_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_plugin_history_code_index` (`code`),
  KEY `system_plugin_history_type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_plugin_history` */

insert  into `system_plugin_history`(`id`,`code`,`type`,`version`,`detail`,`created_at`) values (1,'October.Demo','comment','1.0.1','First version of Demo','2021-11-09 14:49:01'),(2,'RainLab.Builder','comment','1.0.1','Initialize plugin.','2021-11-09 22:24:37'),(3,'RainLab.Builder','comment','1.0.2','Fixes the problem with selecting a plugin. Minor localization corrections. Configuration files in the list and form behaviors are now autocomplete.','2021-11-09 22:24:37'),(4,'RainLab.Builder','comment','1.0.3','Improved handling of the enum data type.','2021-11-09 22:24:37'),(5,'RainLab.Builder','comment','1.0.4','Added user permissions to work with the Builder.','2021-11-09 22:24:37'),(6,'RainLab.Builder','comment','1.0.5','Fixed permissions registration.','2021-11-09 22:24:37'),(7,'RainLab.Builder','comment','1.0.6','Fixed front-end record ordering in the Record List component.','2021-11-09 22:24:37'),(8,'RainLab.Builder','comment','1.0.7','Builder settings are now protected with user permissions. The database table column list is scrollable now. Minor code cleanup.','2021-11-09 22:24:37'),(9,'RainLab.Builder','comment','1.0.8','Added the Reorder Controller behavior.','2021-11-09 22:24:37'),(10,'RainLab.Builder','comment','1.0.9','Minor API and UI updates.','2021-11-09 22:24:37'),(11,'RainLab.Builder','comment','1.0.10','Minor styling update.','2021-11-09 22:24:37'),(12,'RainLab.Builder','comment','1.0.11','Fixed a bug where clicking placeholder in a repeater would open Inspector. Fixed a problem with saving forms with repeaters in tabs. Minor style fix.','2021-11-09 22:24:37'),(13,'RainLab.Builder','comment','1.0.12','Added support for the Trigger property to the Media Finder widget configuration. Names of form fields and list columns definition files can now contain underscores.','2021-11-09 22:24:37'),(14,'RainLab.Builder','comment','1.0.13','Minor styling fix on the database editor.','2021-11-09 22:24:37'),(15,'RainLab.Builder','comment','1.0.14','Added support for published_at timestamp field','2021-11-09 22:24:37'),(16,'RainLab.Builder','comment','1.0.15','Fixed a bug where saving a localization string in Inspector could cause a JavaScript error. Added support for Timestamps and Soft Deleting for new models.','2021-11-09 22:24:37'),(17,'RainLab.Builder','comment','1.0.16','Fixed a bug when saving a form with the Repeater widget in a tab could create invalid fields in the form\'s outside area. Added a check that prevents creating localization strings inside other existing strings.','2021-11-09 22:24:37'),(18,'RainLab.Builder','comment','1.0.17','Added support Trigger attribute support for RecordFinder and Repeater form widgets.','2021-11-09 22:24:37'),(19,'RainLab.Builder','comment','1.0.18','Fixes a bug where \'::class\' notations in a model class definition could prevent the model from appearing in the Builder model list. Added emptyOption property support to the dropdown form control.','2021-11-09 22:24:37'),(20,'RainLab.Builder','comment','1.0.19','Added a feature allowing to add all database columns to a list definition. Added max length validation for database table and column names.','2021-11-09 22:24:37'),(21,'RainLab.Builder','comment','1.0.20','Fixes a bug where form the builder could trigger the \"current.hasAttribute is not a function\" error.','2021-11-09 22:24:37'),(22,'RainLab.Builder','comment','1.0.21','Back-end navigation sort order updated.','2021-11-09 22:24:37'),(23,'RainLab.Builder','comment','1.0.22','Added scopeValue property to the RecordList component.','2021-11-09 22:24:37'),(24,'RainLab.Builder','comment','1.0.23','Added support for balloon-selector field type, added Brazilian Portuguese translation, fixed some bugs','2021-11-09 22:24:37'),(25,'RainLab.Builder','comment','1.0.24','Added support for tag list field type, added read only toggle for fields. Prevent plugins from using reserved PHP keywords for class names and namespaces','2021-11-09 22:24:37'),(26,'RainLab.Builder','comment','1.0.25','Allow editing of migration code in the \"Migration\" popup when saving changes in the database editor.','2021-11-09 22:24:37'),(27,'RainLab.Builder','comment','1.0.26','Allow special default values for columns and added new \"Add ID column\" button to database editor.','2021-11-09 22:24:37'),(28,'RainLab.Builder','comment','1.0.27','Added ability to use \'scope\' in a form relation field, added ability to change the sort order of versions and added additional properties for repeater widget in form builder. Added Polish translation.','2021-11-09 22:24:37'),(29,'RainLab.Builder','comment','1.0.28','Fixes support for PHP 8','2021-11-09 22:24:37'),(30,'RainLab.Builder','comment','1.0.29','Disable touch device detection','2021-11-09 22:24:37'),(31,'RainLab.Builder','comment','1.0.30','Minor styling improvements','2021-11-09 22:24:37'),(32,'RainLab.Builder','comment','1.0.31','Added support for more rich editor and file upload properties','2021-11-09 22:24:37'),(33,'RainLab.Builder','comment','1.0.32','Minor styling improvements','2021-11-09 22:24:37'),(34,'RainLab.Builder','comment','1.1.0','Adds feature for adding database fields to a form definition.','2021-11-09 22:24:37'),(35,'Romanov.ClearCacheWidget','comment','1.0.1','First version of ClearCacheWidget','2021-11-09 22:25:00'),(36,'Romanov.ClearCacheWidget','comment','1.0.2','Translate for brazilian portuguese','2021-11-09 22:25:00'),(37,'Romanov.ClearCacheWidget','comment','1.0.3','Some fix','2021-11-09 22:25:00'),(38,'Romanov.ClearCacheWidget','comment','1.0.4','Fix chart','2021-11-09 22:25:00'),(39,'Romanov.ClearCacheWidget','comment','1.0.5','Add chart size property','2021-11-09 22:25:00'),(40,'Romanov.ClearCacheWidget','comment','1.0.6','Add cs_CZ locale','2021-11-09 22:25:00'),(41,'Romanov.ClearCacheWidget','comment','1.1.0','Added functionality to delete thumbs images. (set up in widget settings)','2021-11-09 22:25:00'),(42,'Romanov.ClearCacheWidget','comment','1.1.1','Ability to specify the path to the folder preview. (set up in widget settings)','2021-11-09 22:25:00'),(43,'Romanov.ClearCacheWidget','comment','1.1.2','Some fix. For those who use PHP version below 5.5','2021-11-09 22:25:00'),(44,'Romanov.ClearCacheWidget','comment','1.1.3','Update cs_CZ locale','2021-11-09 22:25:00'),(45,'Romanov.ClearCacheWidget','comment','1.1.4','Fix ErrorException','2021-11-09 22:25:00'),(46,'Romanov.ClearCacheWidget','comment','1.1.5','Add french and italian locales','2021-11-09 22:25:00'),(47,'Romanov.ClearCacheWidget','comment','1.2.0','Add property \'Regex for thumb file names\'','2021-11-09 22:25:00'),(48,'Romanov.ClearCacheWidget','comment','1.2.1','Add the Hungarian translation','2021-11-09 22:25:00'),(49,'Romanov.ClearCacheWidget','comment','1.2.2','Fix for user defined widget title','2021-11-09 22:25:00'),(50,'Romanov.ClearCacheWidget','comment','1.2.3','Add Turkish language file','2021-11-09 22:25:00'),(51,'Romanov.ClearCacheWidget','comment','1.2.4','Add Dutch language','2021-11-09 22:25:00'),(52,'Romanov.ClearCacheWidget','comment','1.2.5','IT locale updated','2021-11-09 22:25:00'),(53,'Romanov.ClearCacheWidget','comment','1.2.6','Add sk locale','2021-11-09 22:25:00'),(54,'Romanov.ClearCacheWidget','comment','1.3.0','Changing default regex for clearing thumbnails according to the comment https://github.com/romanov-acc/octobercms_clearcachewidget/pull/16#issuecomment-404909441','2021-11-09 22:25:00'),(55,'Romanov.ClearCacheWidget','comment','1.3.1','Add Polish translation','2021-11-09 22:25:00'),(56,'Romanov.ClearCacheWidget','comment','1.3.2','Add Slovenian translation','2021-11-09 22:25:00'),(57,'RainLab.Pages','comment','1.0.1','Implemented the static pages management and the Static Page component.','2021-11-09 22:25:37'),(58,'RainLab.Pages','comment','1.0.2','Fixed the page preview URL.','2021-11-09 22:25:37'),(59,'RainLab.Pages','comment','1.0.3','Implemented menus.','2021-11-09 22:25:37'),(60,'RainLab.Pages','comment','1.0.4','Implemented the content block management and placeholder support.','2021-11-09 22:25:37'),(61,'RainLab.Pages','comment','1.0.5','Added support for the Sitemap plugin.','2021-11-09 22:25:37'),(62,'RainLab.Pages','comment','1.0.6','Minor updates to the internal API.','2021-11-09 22:25:37'),(63,'RainLab.Pages','comment','1.0.7','Added the Snippets feature.','2021-11-09 22:25:37'),(64,'RainLab.Pages','comment','1.0.8','Minor improvements to the code.','2021-11-09 22:25:37'),(65,'RainLab.Pages','comment','1.0.9','Fixes issue where Snippet tab is missing from the Partials form.','2021-11-09 22:25:37'),(66,'RainLab.Pages','comment','1.0.10','Add translations for various locales.','2021-11-09 22:25:37'),(67,'RainLab.Pages','comment','1.0.11','Fixes issue where placeholders tabs were missing from Page form.','2021-11-09 22:25:37'),(68,'RainLab.Pages','comment','1.0.12','Implement Media Manager support.','2021-11-09 22:25:37'),(69,'RainLab.Pages','script','1.1.0','snippets_rename_viewbag_properties.php','2021-11-09 22:25:37'),(70,'RainLab.Pages','comment','1.1.0','Adds meta title and description to pages. Adds |staticPage filter.','2021-11-09 22:25:37'),(71,'RainLab.Pages','comment','1.1.1','Add support for Syntax Fields.','2021-11-09 22:25:37'),(72,'RainLab.Pages','comment','1.1.2','Static Breadcrumbs component now respects the hide from navigation setting.','2021-11-09 22:25:37'),(73,'RainLab.Pages','comment','1.1.3','Minor back-end styling fix.','2021-11-09 22:25:37'),(74,'RainLab.Pages','comment','1.1.4','Minor fix to the StaticPage component API.','2021-11-09 22:25:37'),(75,'RainLab.Pages','comment','1.1.5','Fixes bug when using syntax fields.','2021-11-09 22:25:37'),(76,'RainLab.Pages','comment','1.1.6','Minor styling fix to the back-end UI.','2021-11-09 22:25:37'),(77,'RainLab.Pages','comment','1.1.7','Improved menu item form to include CSS class, open in a new window and hidden flag.','2021-11-09 22:25:37'),(78,'RainLab.Pages','comment','1.1.8','Improved the output of snippet partials when saved.','2021-11-09 22:25:37'),(79,'RainLab.Pages','comment','1.1.9','Minor update to snippet inspector internal API.','2021-11-09 22:25:38'),(80,'RainLab.Pages','comment','1.1.10','Fixes a bug where selecting a layout causes permanent unsaved changes.','2021-11-09 22:25:38'),(81,'RainLab.Pages','comment','1.1.11','Add support for repeater syntax field.','2021-11-09 22:25:38'),(82,'RainLab.Pages','comment','1.2.0','Added support for translations, UI updates.','2021-11-09 22:25:38'),(83,'RainLab.Pages','comment','1.2.1','Use nice titles when listing the content files.','2021-11-09 22:25:38'),(84,'RainLab.Pages','comment','1.2.2','Minor styling update.','2021-11-09 22:25:38'),(85,'RainLab.Pages','comment','1.2.3','Snippets can now be moved by dragging them.','2021-11-09 22:25:38'),(86,'RainLab.Pages','comment','1.2.4','Fixes a bug where the cursor is misplaced when editing text files.','2021-11-09 22:25:38'),(87,'RainLab.Pages','comment','1.2.5','Fixes a bug where the parent page is lost upon changing a page layout.','2021-11-09 22:25:38'),(88,'RainLab.Pages','comment','1.2.6','Shared view variables are now passed to static pages.','2021-11-09 22:25:38'),(89,'RainLab.Pages','comment','1.2.7','Fixes issue with duplicating properties when adding multiple snippets on the same page.','2021-11-09 22:25:38'),(90,'RainLab.Pages','comment','1.2.8','Fixes a bug where creating a content block without extension doesn\'t save the contents to file.','2021-11-09 22:25:38'),(91,'RainLab.Pages','comment','1.2.9','Add conditional support for translating page URLs.','2021-11-09 22:25:38'),(92,'RainLab.Pages','comment','1.2.10','Streamline generation of URLs to use the new Cms::url helper.','2021-11-09 22:25:38'),(93,'RainLab.Pages','comment','1.2.11','Implements repeater usage with translate plugin.','2021-11-09 22:25:38'),(94,'RainLab.Pages','comment','1.2.12','Fixes minor issue when using snippets and switching the application locale.','2021-11-09 22:25:38'),(95,'RainLab.Pages','comment','1.2.13','Fixes bug when AJAX is used on a page that does not yet exist.','2021-11-09 22:25:38'),(96,'RainLab.Pages','comment','1.2.14','Add theme logging support for changes made to menus.','2021-11-09 22:25:38'),(97,'RainLab.Pages','comment','1.2.15','Back-end navigation sort order updated.','2021-11-09 22:25:38'),(98,'RainLab.Pages','comment','1.2.16','Fixes a bug when saving a template that has been modified outside of the CMS (mtime mismatch).','2021-11-09 22:25:38'),(99,'RainLab.Pages','comment','1.2.17','Changes locations of custom fields to secondary tabs instead of the primary Settings area. New menu search ability on adding menu items','2021-11-09 22:25:38'),(100,'RainLab.Pages','comment','1.2.18','Fixes cache-invalidation issues when RainLab.Translate is not installed. Added Greek & Simplified Chinese translations. Removed deprecated calls. Allowed saving HTML in snippet properties. Added support for the MediaFinder in menu items.','2021-11-09 22:25:38'),(101,'RainLab.Pages','comment','1.2.19','Catch exception with corrupted menu file.','2021-11-09 22:25:38'),(102,'RainLab.Pages','comment','1.2.20','StaticMenu component now exposes menuName property; added pages.menu.referencesGenerated event.','2021-11-09 22:25:38'),(103,'RainLab.Pages','comment','1.2.21','Fixes a bug where last Static Menu item cannot be deleted. Improved Persian, Slovak and Turkish translations.','2021-11-09 22:25:38'),(104,'RainLab.Pages','comment','1.3.0','Added support for using Database-driven Themes when enabled in the CMS configuration.','2021-11-09 22:25:38'),(105,'RainLab.Pages','comment','1.3.1','Added ChildPages Component, prevent hidden pages from being returned via menu item resolver.','2021-11-09 22:25:38'),(106,'RainLab.Pages','comment','1.3.2','Fixes error when creating a subpage whose parent has no layout set.','2021-11-09 22:25:38'),(107,'RainLab.Pages','comment','1.3.3','Improves user experience for users with only partial access through permissions','2021-11-09 22:25:38'),(108,'RainLab.Pages','comment','1.3.4','Fix error where large menus were being truncated due to the PHP \"max_input_vars\" configuration value. Improved Slovenian translation.','2021-11-09 22:25:38'),(109,'RainLab.Pages','comment','1.3.5','Minor fix to bust the browser cache for JS assets. Prevent duplicate property fields in snippet inspector.','2021-11-09 22:25:38'),(110,'RainLab.Pages','comment','1.3.6','ChildPages component now displays localized page titles from Translate plugin.','2021-11-09 22:25:38'),(111,'RainLab.Pages','comment','1.3.7','Adds MenuPicker formwidget. Adds future support for v2.0 of October CMS.','2021-11-09 22:25:38'),(112,'RainLab.Pages','comment','1.4.0','Fixes bug when adding menu items in October CMS v2.0.','2021-11-09 22:25:38'),(113,'RainLab.Pages','comment','1.4.1','Fixes support for configuration values.','2021-11-09 22:25:38'),(114,'RainLab.Pages','comment','1.4.3','Fixes page deletion is newer platform builds.','2021-11-09 22:25:38'),(115,'RainLab.Pages','comment','1.4.4','Disable touch device detection','2021-11-09 22:25:38'),(116,'RainLab.Pages','comment','1.4.5','Minor styling improvements','2021-11-09 22:25:38'),(117,'RainLab.Pages','comment','1.4.6','Minor styling improvements','2021-11-09 22:25:38'),(118,'RainLab.Pages','comment','1.4.7','Minor layout fix in the Page editor','2021-11-09 22:25:38'),(119,'RainLab.Pages','comment','1.4.8','Fixes rich editor usage inside repeaters. Adds getProcessedMarkup event.','2021-11-09 22:25:38'),(120,'RainLab.Pages','comment','1.4.9','Fixes a lifecycle issue when switching the page layout.','2021-11-09 22:25:38'),(121,'RainLab.Pages','comment','1.4.10','Fixes maintenance mode when using static pages.','2021-11-09 22:25:38'),(122,'Indikator.Backend','comment','1.0.0','First version of Backend Plus.','2021-11-09 22:26:08'),(123,'Indikator.Backend','comment','1.0.1','Fixed the update count issue.','2021-11-09 22:26:08'),(124,'Indikator.Backend','comment','1.0.2','Added Last logins widget.','2021-11-09 22:26:08'),(125,'Indikator.Backend','comment','1.0.3','Added RSS viewer widget.','2021-11-09 22:26:08'),(126,'Indikator.Backend','comment','1.0.4','Minor improvements and bugfix.','2021-11-09 22:26:08'),(127,'Indikator.Backend','comment','1.0.5','Added Random images widget.','2021-11-09 22:26:08'),(128,'Indikator.Backend','comment','1.0.6','Added virtual keyboard option.','2021-11-09 22:26:08'),(129,'Indikator.Backend','comment','1.1.0','Added Lorem ipsum components (image and text).','2021-11-09 22:26:08'),(130,'Indikator.Backend','comment','1.1.0','Improving the Random images widget with slideshow.','2021-11-09 22:26:08'),(131,'Indikator.Backend','comment','1.1.0','Added Turkish translation (thanks to mahony0).','2021-11-09 22:26:08'),(132,'Indikator.Backend','comment','1.1.0','Fixed the URL path issue by virtual keyboard.','2021-11-09 22:26:08'),(133,'Indikator.Backend','comment','1.1.1','Hide the \"Find more themes\" link.','2021-11-09 22:26:08'),(134,'Indikator.Backend','comment','1.1.2','Added German translation.','2021-11-09 22:26:08'),(135,'Indikator.Backend','comment','1.1.3','The widgets work on localhost too.','2021-11-09 22:26:08'),(136,'Indikator.Backend','comment','1.1.4','Added Spanish translation.','2021-11-09 22:26:08'),(137,'Indikator.Backend','comment','1.2.0','All features are working on the whole backend.','2021-11-09 22:26:08'),(138,'Indikator.Backend','comment','1.2.1','Rounded profile image is optional in top menu.','2021-11-09 22:26:08'),(139,'Indikator.Backend','comment','1.2.2','Fixed the authenticated user bug.','2021-11-09 22:26:08'),(140,'Indikator.Backend','comment','1.2.3','Hide the Media menu optional in top menu.','2021-11-09 22:26:08'),(141,'Indikator.Backend','comment','1.2.4','Minor improvements and bugfix.','2021-11-09 22:26:08'),(142,'Indikator.Backend','comment','1.2.5','Renamed the name of backend widgets.','2021-11-09 22:26:08'),(143,'Indikator.Backend','comment','1.2.6','Improved the automatic search focus.','2021-11-09 22:26:08'),(144,'Indikator.Backend','comment','1.2.7','Minor improvements.','2021-11-09 22:26:08'),(145,'Indikator.Backend','comment','1.2.8','Fixed the hiding Media menu issue.','2021-11-09 22:26:08'),(146,'Indikator.Backend','comment','1.2.9','Improved the widget exception handling.','2021-11-09 22:26:08'),(147,'Indikator.Backend','comment','1.3.0','Added 2 new options for Settings.','2021-11-09 22:26:08'),(148,'Indikator.Backend','comment','1.3.1','Fixed the search field hide issue.','2021-11-09 22:26:08'),(149,'Indikator.Backend','comment','1.3.2','Delete only demo folder instead of october.','2021-11-09 22:26:08'),(150,'Indikator.Backend','comment','1.3.3','Added clear button option to form fields.','2021-11-09 22:26:08'),(151,'Indikator.Backend','comment','1.3.4','Improved the Media menu hiding.','2021-11-09 22:26:08'),(152,'Indikator.Backend','comment','1.3.5','Fixed the automatically focus option.','2021-11-09 22:26:08'),(153,'Indikator.Backend','comment','1.3.6','Added the Cache dashboard widget.','2021-11-09 22:26:08'),(154,'Indikator.Backend','comment','1.4.0','Added 2 new form widgets.','2021-11-09 22:26:08'),(155,'Indikator.Backend','comment','1.4.1','Added new colorpicker form widget.','2021-11-09 22:26:08'),(156,'Indikator.Backend','comment','1.4.2','Minor improvements.','2021-11-09 22:26:08'),(157,'Indikator.Backend','comment','1.4.3','Improved the Cache dashboard widget.','2021-11-09 22:26:08'),(158,'Indikator.Backend','comment','1.4.4','Updated for latest October.','2021-11-09 22:26:08'),(159,'Indikator.Backend','comment','1.4.5','Minor improvements and bugfix.','2021-11-09 22:26:08'),(160,'Indikator.Backend','comment','1.4.6','Improved the UI and fixed bug.','2021-11-09 22:26:08'),(161,'Indikator.Backend','comment','1.4.7','Hide the label in top menu.','2021-11-09 22:26:08'),(162,'Indikator.Backend','comment','1.4.8','Enable the gzip compression.','2021-11-09 22:26:08'),(163,'Indikator.Backend','script','1.5.0','create_trash_table.php','2021-11-09 22:26:08'),(164,'Indikator.Backend','comment','1.5.0','Delete the unused files and folders.','2021-11-09 22:26:08'),(165,'Indikator.Backend','comment','1.5.1','Minor improvements and bugfix.','2021-11-09 22:26:08'),(166,'Indikator.Backend','comment','1.5.2','Improved the Trash items page.','2021-11-09 22:26:08'),(167,'Indikator.Backend','comment','1.5.3','Expanded the Trash items page.','2021-11-09 22:26:08'),(168,'Indikator.Backend','comment','1.5.4','Minor improvements.','2021-11-09 22:26:08'),(169,'Indikator.Backend','comment','1.5.5','Added tooltip when hiding the labels.','2021-11-09 22:26:08'),(170,'Indikator.Backend','comment','1.5.6','Fixed the page overflow issue.','2021-11-09 22:26:08'),(171,'Indikator.Backend','comment','1.5.7','Added the context menu feature.','2021-11-09 22:26:08'),(172,'Indikator.Backend','comment','1.5.8','Improved the context menu.','2021-11-09 22:26:08'),(173,'Indikator.Backend','comment','1.6.0','Available the Elite version.','2021-11-09 22:26:08'),(174,'Indikator.Backend','comment','1.6.1','Added the Russian translation.','2021-11-09 22:26:08'),(175,'Indikator.Backend','comment','1.6.2','Added the Brazilian Portuguese lang.','2021-11-09 22:26:08'),(176,'Indikator.Backend','comment','1.6.3','Minor improvements.','2021-11-09 22:26:08'),(177,'Indikator.Backend','comment','1.6.4','Fixed the German translation.','2021-11-09 22:26:08'),(178,'Indikator.Backend','comment','1.6.5','Fixed the Cache widget issue.','2021-11-09 22:26:08'),(179,'Indikator.Backend','comment','1.6.6','!!! Updated for October 420+.','2021-11-09 22:26:08'),(180,'Indikator.Backend','comment','1.6.7','Added more trash items.','2021-11-09 22:26:08'),(181,'Indikator.Backend','comment','1.6.8','Minor improvements.','2021-11-09 22:26:08'),(182,'Indikator.Backend','comment','1.6.9','Added permission to Dashboard widgets.','2021-11-09 22:26:08'),(183,'Indikator.Backend','comment','1.6.10','Added Polish translation.','2021-11-09 22:26:08'),(184,'Indikator.Backend','comment','1.6.11','Updated the trash file list.','2021-11-09 22:26:08'),(185,'Indikator.Backend','comment','1.6.12','Added more trash items.','2021-11-09 22:26:08'),(186,'Indikator.Backend','comment','1.6.13','Added Slovenian translation.','2021-11-09 22:26:08'),(187,'RainLab.Blog','script','1.0.1','create_posts_table.php','2021-11-17 03:05:28'),(188,'RainLab.Blog','script','1.0.1','create_categories_table.php','2021-11-17 03:05:28'),(189,'RainLab.Blog','script','1.0.1','seed_all_tables.php','2021-11-17 03:05:28'),(190,'RainLab.Blog','comment','1.0.1','Initialize plugin.','2021-11-17 03:05:28'),(191,'RainLab.Blog','comment','1.0.2','Added the processed HTML content column to the posts table.','2021-11-17 03:05:28'),(192,'RainLab.Blog','comment','1.0.3','Category component has been merged with Posts component.','2021-11-17 03:05:28'),(193,'RainLab.Blog','comment','1.0.4','Improvements to the Posts list management UI.','2021-11-17 03:05:28'),(194,'RainLab.Blog','comment','1.0.5','Removes the Author column from blog post list.','2021-11-17 03:05:28'),(195,'RainLab.Blog','comment','1.0.6','Featured images now appear in the Post component.','2021-11-17 03:05:28'),(196,'RainLab.Blog','comment','1.0.7','Added support for the Static Pages menus.','2021-11-17 03:05:28'),(197,'RainLab.Blog','comment','1.0.8','Added total posts to category list.','2021-11-17 03:05:28'),(198,'RainLab.Blog','comment','1.0.9','Added support for the Sitemap plugin.','2021-11-17 03:05:28'),(199,'RainLab.Blog','comment','1.0.10','Added permission to prevent users from seeing posts they did not create.','2021-11-17 03:05:28'),(200,'RainLab.Blog','comment','1.0.11','Deprecate \"idParam\" component property in favour of \"slug\" property.','2021-11-17 03:05:28'),(201,'RainLab.Blog','comment','1.0.12','Fixes issue where images cannot be uploaded caused by latest Markdown library.','2021-11-17 03:05:28'),(202,'RainLab.Blog','comment','1.0.13','Fixes problem with providing pages to Sitemap and Pages plugins.','2021-11-17 03:05:28'),(203,'RainLab.Blog','comment','1.0.14','Add support for CSRF protection feature added to core.','2021-11-17 03:05:28'),(204,'RainLab.Blog','comment','1.1.0','Replaced the Post editor with the new core Markdown editor.','2021-11-17 03:05:28'),(205,'RainLab.Blog','comment','1.1.1','Posts can now be imported and exported.','2021-11-17 03:05:28'),(206,'RainLab.Blog','comment','1.1.2','Posts are no longer visible if the published date has not passed.','2021-11-17 03:05:28'),(207,'RainLab.Blog','comment','1.1.3','Added a New Post shortcut button to the blog menu.','2021-11-17 03:05:28'),(208,'RainLab.Blog','script','1.2.0','categories_add_nested_fields.php','2021-11-17 03:05:28'),(209,'RainLab.Blog','comment','1.2.0','Categories now support nesting.','2021-11-17 03:05:28'),(210,'RainLab.Blog','comment','1.2.1','Post slugs now must be unique.','2021-11-17 03:05:28'),(211,'RainLab.Blog','comment','1.2.2','Fixes issue on new installs.','2021-11-17 03:05:28'),(212,'RainLab.Blog','comment','1.2.3','Minor user interface update.','2021-11-17 03:05:28'),(213,'RainLab.Blog','script','1.2.4','update_timestamp_nullable.php','2021-11-17 03:05:28'),(214,'RainLab.Blog','comment','1.2.4','Database maintenance. Updated all timestamp columns to be nullable.','2021-11-17 03:05:28'),(215,'RainLab.Blog','comment','1.2.5','Added translation support for blog posts.','2021-11-17 03:05:28'),(216,'RainLab.Blog','comment','1.2.6','The published field can now supply a time with the date.','2021-11-17 03:05:28'),(217,'RainLab.Blog','comment','1.2.7','Introduced a new RSS feed component.','2021-11-17 03:05:28'),(218,'RainLab.Blog','comment','1.2.8','Fixes issue with translated `content_html` attribute on blog posts.','2021-11-17 03:05:29'),(219,'RainLab.Blog','comment','1.2.9','Added translation support for blog categories.','2021-11-17 03:05:29'),(220,'RainLab.Blog','comment','1.2.10','Added translation support for post slugs.','2021-11-17 03:05:29'),(221,'RainLab.Blog','comment','1.2.11','Fixes bug where excerpt is not translated.','2021-11-17 03:05:29'),(222,'RainLab.Blog','comment','1.2.12','Description field added to category form.','2021-11-17 03:05:29'),(223,'RainLab.Blog','comment','1.2.13','Improved support for Static Pages menus, added a blog post and all blog posts.','2021-11-17 03:05:29'),(224,'RainLab.Blog','comment','1.2.14','Added post exception property to the post list component, useful for showing related posts.','2021-11-17 03:05:29'),(225,'RainLab.Blog','comment','1.2.15','Back-end navigation sort order updated.','2021-11-17 03:05:29'),(226,'RainLab.Blog','comment','1.2.16','Added `nextPost` and `previousPost` to the blog post component.','2021-11-17 03:05:29'),(227,'RainLab.Blog','comment','1.2.17','Improved the next and previous logic to sort by the published date.','2021-11-17 03:05:29'),(228,'RainLab.Blog','comment','1.2.18','Minor change to internals.','2021-11-17 03:05:29'),(229,'RainLab.Blog','comment','1.2.19','Improved support for Build 420+','2021-11-17 03:05:29'),(230,'RainLab.Blog','script','1.3.0','posts_add_metadata.php','2021-11-17 03:05:29'),(231,'RainLab.Blog','comment','1.3.0','Added metadata column for plugins to store data in','2021-11-17 03:05:29'),(232,'RainLab.Blog','comment','1.3.1','Fixed metadata column not being jsonable','2021-11-17 03:05:29'),(233,'RainLab.Blog','comment','1.3.2','Allow custom slug name for components, add 404 handling for missing blog posts, allow exporting of blog images.','2021-11-17 03:05:29'),(234,'RainLab.Blog','comment','1.3.3','Fixed \'excluded categories\' filter from being run when value is empty.','2021-11-17 03:05:29'),(235,'RainLab.Blog','comment','1.3.4','Allow post author to be specified. Improved translations.','2021-11-17 03:05:29'),(236,'RainLab.Blog','comment','1.3.5','Fixed missing user info from breaking initial seeder in migrations. Fixed a PostgreSQL issue with blog exports.','2021-11-17 03:05:29'),(237,'RainLab.Blog','comment','1.3.6','Improved French translations.','2021-11-17 03:05:29'),(238,'RainLab.Blog','comment','1.4.0','Stability improvements. Rollback custom slug names for components','2021-11-17 03:05:29'),(239,'RainLab.Blog','comment','1.4.1','Fixes potential security issue with unsafe Markdown. Allow blog bylines to be translated.','2021-11-17 03:05:29'),(240,'RainLab.Blog','comment','1.4.2','Fix 404 redirects for missing blog posts. Assign current category to the listed posts when using the Posts component on a page with the category parameter available.','2021-11-17 03:05:29'),(241,'RainLab.Blog','comment','1.4.3','Fixes incompatibility with locale switching when plugin is used in conjunction with the Translate plugin. Fixes undefined category error.','2021-11-17 03:05:29'),(242,'RainLab.Blog','comment','1.4.4','Rollback translated bylines, please move or override the default component markup instead.','2021-11-17 03:05:29'),(243,'RainLab.Blog','comment','1.5.0','Implement support for October CMS v2.0','2021-11-17 03:05:29'),(244,'RainLab.Blog','comment','1.5.1','Fixes interaction with Translate plugin','2021-11-17 03:05:29'),(245,'RainLab.Blog','comment','1.5.2','Minor styling improvements','2021-11-17 03:05:29');

/*Table structure for table `system_plugin_versions` */

DROP TABLE IF EXISTS `system_plugin_versions`;

CREATE TABLE `system_plugin_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_frozen` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `system_plugin_versions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_plugin_versions` */

insert  into `system_plugin_versions`(`id`,`code`,`version`,`created_at`,`is_disabled`,`is_frozen`) values (1,'October.Demo','1.0.1','2021-11-09 14:49:01',0,0),(2,'RainLab.Builder','1.1.0','2021-11-09 22:24:37',0,0),(3,'Romanov.ClearCacheWidget','1.3.2','2021-11-09 22:25:00',0,0),(4,'RainLab.Pages','1.4.10','2021-11-09 22:25:38',0,0),(5,'Indikator.Backend','1.6.13','2021-11-09 22:26:08',0,0),(6,'RainLab.Blog','1.5.2','2021-11-17 03:05:29',0,0);

/*Table structure for table `system_request_logs` */

DROP TABLE IF EXISTS `system_request_logs`;

CREATE TABLE `system_request_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_code` int(11) DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_request_logs` */

/*Table structure for table `system_revisions` */

DROP TABLE IF EXISTS `system_revisions`;

CREATE TABLE `system_revisions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cast` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`),
  KEY `system_revisions_user_id_index` (`user_id`),
  KEY `system_revisions_field_index` (`field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_revisions` */

/*Table structure for table `system_settings` */

DROP TABLE IF EXISTS `system_settings`;

CREATE TABLE `system_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `system_settings_item_index` (`item`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `system_settings` */

insert  into `system_settings`(`id`,`item`,`value`) values (1,'backend_brand_settings','{\"app_name\":\"KiperCMS\",\"app_tagline\":\"Kiper basics\",\"primary_color\":\"#4f5458\",\"secondary_color\":\"#e74c3c\",\"accent_color\":\"#e74c3c\",\"menu_mode\":\"inline\",\"custom_css\":\"\"}');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
