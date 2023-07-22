-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for findex_test
CREATE DATABASE IF NOT EXISTS `findex_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `findex_test`;

-- Dumping structure for table findex_test.action_events
CREATE TABLE IF NOT EXISTS `action_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionable_id` bigint(20) unsigned NOT NULL,
  `target_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned DEFAULT NULL,
  `fields` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'running',
  `exception` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `original` mediumtext COLLATE utf8mb4_unicode_ci,
  `changes` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `action_events_actionable_type_actionable_id_index` (`actionable_type`,`actionable_id`),
  KEY `action_events_target_type_target_id_index` (`target_type`,`target_id`),
  KEY `action_events_batch_id_model_type_model_id_index` (`batch_id`,`model_type`,`model_id`),
  KEY `action_events_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.action_events: ~0 rows (approximately)

-- Dumping structure for table findex_test.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table findex_test.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.migrations: ~9 rows (approximately)
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2018_01_01_000000_create_action_events_table', 2),
	(6, '2019_05_10_000000_add_fields_to_action_events_table', 2),
	(7, '2021_08_25_193039_create_nova_notifications_table', 2),
	(8, '2022_04_26_000000_add_fields_to_nova_notifications_table', 2),
	(9, '2022_12_19_000000_create_field_attachments_table', 2);

-- Dumping structure for table findex_test.nova_field_attachments
CREATE TABLE IF NOT EXISTS `nova_field_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attachable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachable_id` bigint(20) unsigned NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nova_field_attachments_attachable_type_attachable_id_index` (`attachable_type`,`attachable_id`),
  KEY `nova_field_attachments_url_index` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.nova_field_attachments: ~0 rows (approximately)

-- Dumping structure for table findex_test.nova_notifications
CREATE TABLE IF NOT EXISTS `nova_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nova_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.nova_notifications: ~0 rows (approximately)

-- Dumping structure for table findex_test.nova_pending_field_attachments
CREATE TABLE IF NOT EXISTS `nova_pending_field_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `draft_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nova_pending_field_attachments_draft_id_index` (`draft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.nova_pending_field_attachments: ~0 rows (approximately)

-- Dumping structure for table findex_test.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.password_resets: ~0 rows (approximately)

-- Dumping structure for table findex_test.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.personal_access_tokens: ~0 rows (approximately)

-- Dumping structure for table findex_test.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table findex_test.users: ~21 rows (approximately)
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin@admin.com', '2023-07-22 10:06:28', '$2y$10$mVuTda2ZbjaBvvDL5I8liOST12r/KmZsmymH8coJ1PMM71Xc3vAQC', 'q6pZ2E3OCj1FhlcotJRHNoovHtdRO4hviyw7pSVf0AapsKnvS3d3DpdRcZX4', '2023-07-22 07:08:20', '2023-07-22 07:08:20'),
	(22, 'Shanie Witting', 'howell.prosacco@example.com', '2023-07-22 10:06:28', '$2y$10$zkiGLOxEsAZmw3Aoc5DJpOuBEvgcnSbXoB1xOynWoqbIfu2BjILGu', 'rtZiAgyVQp', '2023-07-07 10:06:28', '2023-07-22 10:06:29'),
	(23, 'Mrs. Lessie Kuphal MD', 'murl.schamberger@example.net', '2023-07-22 10:06:28', '$2y$10$mVXkg/q5.NcZ4oGTJv/RDujTbQnky85r/QALN5PF23M3C4jSNMJmO', 'qfKsc8afsd', '2023-07-06 10:06:28', '2023-07-22 10:06:29'),
	(24, 'Kamryn Herzog', 'eino04@example.net', '2023-07-22 10:06:28', '$2y$10$k0JULV7h514N90PAjgGtYuFXoBQOUb6NaCDpf1XeroW/tH5adOTw.', 'hQTqcZOzBY', '2023-07-06 10:06:28', '2023-07-22 10:06:29'),
	(25, 'Marian Ritchie', 'vdare@example.org', '2023-07-22 10:06:28', '$2y$10$UmadBsN85eRL.8NWCKsTkOyDDouU/8BeT8Siblv4zRYTYwiky3Ctm', '3KGllRZ3Lu', '2023-06-30 10:06:28', '2023-07-22 10:06:29'),
	(26, 'Geovanny Torp', 'romaguera.eli@example.net', '2023-07-22 10:06:28', '$2y$10$DPjyG6Wd0oMdMRabyhbEZuFxpgaeud0hS9sSDfMLwuh3HXSbCRMhC', '9jAgMe6FPt', '2023-07-01 10:06:28', '2023-07-22 10:06:29'),
	(27, 'Fletcher Crist', 'xoreilly@example.net', '2023-07-22 10:06:28', '$2y$10$/yEcQ0HJt60640bByKkZM.T3CgFyI4l/6zq98oKiatkfbm6HJnJWW', 'p0kPqPwItu', '2023-07-09 10:06:28', '2023-07-22 10:06:29'),
	(28, 'Geoffrey Torphy', 'qjohnston@example.org', '2023-07-22 10:06:28', '$2y$10$KM2kPLNohxvcRaBPpIX02.YGEPTOKFFno2wX4RtsXxNExjnEUhniS', 'vYBXHjPkkf', '2023-07-14 10:06:28', '2023-07-22 10:06:29'),
	(29, 'Alford Tremblay', 'ludwig.volkman@example.com', '2023-07-22 10:06:28', '$2y$10$JD/a4Ji7LUPfo2wwau7.fuTRu3eDRNMLIQMvWraE9y08byCRkEZ1C', 'zyyP7fcSV8', '2023-07-21 10:06:28', '2023-07-22 10:06:29'),
	(30, 'Dr. Donnie Upton PhD', 'qjacobs@example.net', '2023-07-22 10:06:28', '$2y$10$QLCGwQpynB8beUBIV8pvpuCZ.K8d8Zo5W5HZepeGmP5I6Le30j88O', 'htv1tJ3tMU', '2023-07-07 10:06:28', '2023-07-22 10:06:29'),
	(31, 'Maritza McCullough DVM', 'meredith97@example.com', '2023-07-22 10:06:28', '$2y$10$hX9HHM8ziK9fHZ1gWSJhFuzZ8zYsuctPXMYLv8f4MGGrZehFbWTA.', 'qvQ6NQ6mzV', '2023-07-03 10:06:28', '2023-07-22 10:06:29'),
	(32, 'Dr. Noble Crooks II', 'xward@example.org', '2023-07-22 10:06:28', '$2y$10$.2L571wWmp4ClTkqWkHXwOiAzx6V5kZzwG60vHaT75GzqIMc13Yiy', 'oGKQeFH36A', '2023-07-11 10:06:28', '2023-07-22 10:06:29'),
	(33, 'Prof. Mariam Sporer IV', 'hoeger.javier@example.net', '2023-07-22 10:06:28', '$2y$10$rBBd2GIOu51MmuUXmzpc6eNQ7O3uh/5ixqwJ2E4VCyI67ydhPpdOm', 'SV4KGcVRLI', '2023-07-05 10:06:28', '2023-07-22 10:06:29'),
	(34, 'Ms. Connie Kshlerin', 'kautzer.yazmin@example.com', '2023-07-22 10:06:28', '$2y$10$ZG8148Qv6SvOMEIfcmnUzekX8CHIKStDAxoPuIgMh6ztfKQKMnHcq', 'GHeNAPJETy', '2023-07-12 10:06:28', '2023-07-22 10:06:29'),
	(35, 'Sheridan Runolfsdottir', 'kziemann@example.com', '2023-07-22 10:06:28', '$2y$10$f/A8.bejYDTtWQ/TpauzG.fLtXegbN69iZmfYZa3E6RDywpZba4Ym', 'UhXFRPx8JA', '2023-07-11 10:06:29', '2023-07-22 10:06:29'),
	(36, 'Kristoffer Koelpin', 'blueilwitz@example.com', '2023-07-22 10:06:29', '$2y$10$IlUH6mjSn48md827a69iwOTHPoM/aIz5pQf2V3ODmCd4o0ht7ORRa', 'Di6uBJFwvX', '2023-07-14 10:06:29', '2023-07-22 10:06:29'),
	(37, 'Kirstin Bins', 'cale51@example.org', '2023-07-22 10:06:29', '$2y$10$K2o2Vc0yDngeki5IskHezenKp3L.Zzqrn1Kt8JU/Wv9GR42hQx0EO', 'edHkFFySkq', '2023-07-16 10:06:29', '2023-07-22 10:06:29'),
	(38, 'Gretchen Conroy', 'weber.hayley@example.org', '2023-07-22 10:06:29', '$2y$10$MtJe4JxKsCCa7Ymj3BnKq.cPpB4PmX5S8RyKh.X5l7DVJh7QveEOG', 'erFZuDYgjc', '2023-07-05 10:06:29', '2023-07-22 10:06:29'),
	(39, 'Dallin Fahey', 'jeffry47@example.net', '2023-07-22 10:06:29', '$2y$10$T7nz6flwpPgf7C4SFsXt6ObF.F/HiIZtMmf6P/mTHXS/oIWEWBRCq', 'EXnjKXE7Nr', '2023-07-20 10:06:29', '2023-07-22 10:06:29'),
	(40, 'Dr. Vesta Moore Sr.', 'maya.konopelski@example.com', '2023-07-22 10:06:29', '$2y$10$WzVBoufKHS4NvurySVzqe.2PRmDFULJhRTXMqP0JKT6YdnKIj77k2', 'JmfdCyW4mk', '2023-07-17 10:06:29', '2023-07-22 10:06:29'),
	(41, 'Mrs. Augusta Wintheiser Sr.', 'tomas.zboncak@example.org', '2023-07-22 10:06:29', '$2y$10$LU2.QNkiPJRAxEJbZYmtDeSUshxV6cJvbfwz4c7PfO/YU7NvsMfxq', '7PvziRghs8', '2023-07-11 10:06:29', '2023-07-22 10:06:29');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
