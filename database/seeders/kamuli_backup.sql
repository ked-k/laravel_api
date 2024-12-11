-- MySQL dump 10.13  Distrib 8.0.40, for Linux (x86_64)
--
-- Host: localhost    Database: alis_v4
-- ------------------------------------------------------
-- Server version	8.0.40-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adhoc_configs`
--

DROP TABLE IF EXISTS `adhoc_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adhoc_configs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `option` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adhoc_configs`
--

LOCK TABLES `adhoc_configs` WRITE;
/*!40000 ALTER TABLE `adhoc_configs` DISABLE KEYS */;
INSERT INTO `adhoc_configs` VALUES (1,'Report',1,'2024-12-11 18:06:40','2024-12-11 18:06:40'),(2,'ULIN',1,'2024-12-11 18:06:40','2024-12-11 18:06:40'),(3,'Clinician_UI',2,'2024-12-11 18:06:40','2024-12-11 18:06:40');
/*!40000 ALTER TABLE `adhoc_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytic_specimen_rejection_reasons`
--

DROP TABLE IF EXISTS `analytic_specimen_rejection_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytic_specimen_rejection_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `specimen_id` int unsigned NOT NULL,
  `rejection_id` int unsigned NOT NULL,
  `reason_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `analytic_specimen_rejection_reasons_specimen_id_foreign` (`specimen_id`),
  KEY `analytic_specimen_rejection_reasons_rejection_id_foreign` (`rejection_id`),
  KEY `analytic_specimen_rejection_reasons_reason_id_foreign` (`reason_id`),
  CONSTRAINT `analytic_specimen_rejection_reasons_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `rejection_reasons` (`id`),
  CONSTRAINT `analytic_specimen_rejection_reasons_rejection_id_foreign` FOREIGN KEY (`rejection_id`) REFERENCES `analytic_specimen_rejections` (`id`),
  CONSTRAINT `analytic_specimen_rejection_reasons_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `analytic_specimen_rejections` (`specimen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_specimen_rejection_reasons`
--

LOCK TABLES `analytic_specimen_rejection_reasons` WRITE;
/*!40000 ALTER TABLE `analytic_specimen_rejection_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytic_specimen_rejection_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytic_specimen_rejections`
--

DROP TABLE IF EXISTS `analytic_specimen_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytic_specimen_rejections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int unsigned NOT NULL,
  `specimen_id` int unsigned NOT NULL,
  `rejected_by` int unsigned NOT NULL,
  `rejection_reason_id` int unsigned DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `analytic_specimen_rejections_rejected_by_index` (`rejected_by`),
  KEY `analytic_specimen_rejections_test_id_foreign` (`test_id`),
  KEY `analytic_specimen_rejections_specimen_id_foreign` (`specimen_id`),
  KEY `analytic_specimen_rejections_rejection_reason_id_foreign` (`rejection_reason_id`),
  CONSTRAINT `analytic_specimen_rejections_rejection_reason_id_foreign` FOREIGN KEY (`rejection_reason_id`) REFERENCES `rejection_reasons` (`id`),
  CONSTRAINT `analytic_specimen_rejections_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`),
  CONSTRAINT `analytic_specimen_rejections_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytic_specimen_rejections`
--

LOCK TABLES `analytic_specimen_rejections` WRITE;
/*!40000 ALTER TABLE `analytic_specimen_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `analytic_specimen_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assigned_roles`
--

DROP TABLE IF EXISTS `assigned_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigned_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `assigned_roles_user_id_foreign` (`user_id`),
  KEY `assigned_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `assigned_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigned_roles`
--

LOCK TABLES `assigned_roles` WRITE;
/*!40000 ALTER TABLE `assigned_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `assigned_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcode_settings`
--

DROP TABLE IF EXISTS `barcode_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcode_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `encoding_format` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `barcode_width` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `barcode_height` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `text_size` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcode_settings`
--

LOCK TABLES `barcode_settings` WRITE;
/*!40000 ALTER TABLE `barcode_settings` DISABLE KEYS */;
INSERT INTO `barcode_settings` VALUES (1,'code39','2','30','11',NULL,'2024-12-11 18:00:00','2024-12-11 18:00:00');
/*!40000 ALTER TABLE `barcode_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_bank`
--

DROP TABLE IF EXISTS `blood_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_bank` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_no` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `rhs` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `blood_component` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `donation_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `edited_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_bank`
--

LOCK TABLES `blood_bank` WRITE;
/*!40000 ALTER TABLE `blood_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blood_transfer`
--

DROP TABLE IF EXISTS `blood_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_transfer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `blood_bank_id` int NOT NULL,
  `transfer_reason` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `destination` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_transfer`
--

LOCK TABLES `blood_transfer` WRITE;
/*!40000 ALTER TABLE `blood_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `blood_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinicians`
--

DROP TABLE IF EXISTS `clinicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicians` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `emrid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `cadre` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicians`
--

LOCK TABLES `clinicians` WRITE;
/*!40000 ALTER TABLE `clinicians` DISABLE KEYS */;
INSERT INTO `clinicians` VALUES (1,NULL,'Self Request','Doctor','-','-',0,'2024-12-11 18:06:07','2024-12-11 18:06:07');
/*!40000 ALTER TABLE `clinicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commodities`
--

DROP TABLE IF EXISTS `commodities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commodities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `metric_id` int unsigned NOT NULL,
  `unit_price` decimal(8,2) NOT NULL,
  `item_code` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `storage_req` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `min_level` int NOT NULL,
  `max_level` int NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `commodities_metric_id_foreign` (`metric_id`),
  CONSTRAINT `commodities_metric_id_foreign` FOREIGN KEY (`metric_id`) REFERENCES `metrics` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commodities`
--

LOCK TABLES `commodities` WRITE;
/*!40000 ALTER TABLE `commodities` DISABLE KEYS */;
/*!40000 ALTER TABLE `commodities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_measure_ranges`
--

DROP TABLE IF EXISTS `control_measure_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_measure_ranges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `upper_range` decimal(6,2) DEFAULT NULL,
  `lower_range` decimal(6,2) DEFAULT NULL,
  `alphanumeric` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `control_measure_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `control_measure_ranges_control_measure_id_foreign` (`control_measure_id`),
  CONSTRAINT `control_measure_ranges_control_measure_id_foreign` FOREIGN KEY (`control_measure_id`) REFERENCES `control_measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_measure_ranges`
--

LOCK TABLES `control_measure_ranges` WRITE;
/*!40000 ALTER TABLE `control_measure_ranges` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_measure_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_measures`
--

DROP TABLE IF EXISTS `control_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_measures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `unit` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `control_id` int unsigned NOT NULL,
  `control_measure_type_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `control_measures_control_measure_type_id_foreign` (`control_measure_type_id`),
  KEY `control_measures_control_id_foreign` (`control_id`),
  CONSTRAINT `control_measures_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  CONSTRAINT `control_measures_control_measure_type_id_foreign` FOREIGN KEY (`control_measure_type_id`) REFERENCES `measure_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_measures`
--

LOCK TABLES `control_measures` WRITE;
/*!40000 ALTER TABLE `control_measures` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_results`
--

DROP TABLE IF EXISTS `control_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_results` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `results` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `control_measure_id` int unsigned NOT NULL,
  `control_test_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `control_results_control_test_id_foreign` (`control_test_id`),
  KEY `control_results_control_measure_id_foreign` (`control_measure_id`),
  CONSTRAINT `control_results_control_measure_id_foreign` FOREIGN KEY (`control_measure_id`) REFERENCES `control_measures` (`id`),
  CONSTRAINT `control_results_control_test_id_foreign` FOREIGN KEY (`control_test_id`) REFERENCES `control_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_results`
--

LOCK TABLES `control_results` WRITE;
/*!40000 ALTER TABLE `control_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_tests`
--

DROP TABLE IF EXISTS `control_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_tests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `entered_by` int unsigned NOT NULL,
  `control_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `control_tests_control_id_foreign` (`control_id`),
  KEY `control_tests_entered_by_foreign` (`entered_by`),
  CONSTRAINT `control_tests_control_id_foreign` FOREIGN KEY (`control_id`) REFERENCES `controls` (`id`),
  CONSTRAINT `control_tests_entered_by_foreign` FOREIGN KEY (`entered_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_tests`
--

LOCK TABLES `control_tests` WRITE;
/*!40000 ALTER TABLE `control_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `controls`
--

DROP TABLE IF EXISTS `controls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `controls` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lot_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `controls_name_unique` (`name`),
  KEY `controls_lot_id_foreign` (`lot_id`),
  CONSTRAINT `controls_lot_id_foreign` FOREIGN KEY (`lot_id`) REFERENCES `lots` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `controls`
--

LOCK TABLES `controls` WRITE;
/*!40000 ALTER TABLE `controls` DISABLE KEYS */;
/*!40000 ALTER TABLE `controls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culture_durations`
--

DROP TABLE IF EXISTS `culture_durations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culture_durations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `duration` varchar(30) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culture_durations`
--

LOCK TABLES `culture_durations` WRITE;
/*!40000 ALTER TABLE `culture_durations` DISABLE KEYS */;
/*!40000 ALTER TABLE `culture_durations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `culture_observations`
--

DROP TABLE IF EXISTS `culture_observations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `culture_observations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `test_id` int unsigned NOT NULL,
  `observation` varchar(300) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `culture_observations_user_id_foreign` (`user_id`),
  KEY `culture_observations_test_id_foreign` (`test_id`),
  CONSTRAINT `culture_observations_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`),
  CONSTRAINT `culture_observations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `culture_observations`
--

LOCK TABLES `culture_observations` WRITE;
/*!40000 ALTER TABLE `culture_observations` DISABLE KEYS */;
/*!40000 ALTER TABLE `culture_observations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_alphanumeric_counts`
--

DROP TABLE IF EXISTS `daily_alphanumeric_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_alphanumeric_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int unsigned NOT NULL,
  `measure_id` int unsigned NOT NULL,
  `measure_range_id` int unsigned NOT NULL,
  `result_interpretation_id` int unsigned DEFAULT NULL,
  `count` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_alphanumeric_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  KEY `daily_alphanumeric_counts_measure_id_foreign` (`measure_id`),
  KEY `daily_alphanumeric_counts_measure_range_id_foreign` (`measure_range_id`),
  KEY `daily_alphanumeric_counts_result_interpretation_id_foreign` (`result_interpretation_id`),
  CONSTRAINT `daily_alphanumeric_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`),
  CONSTRAINT `daily_alphanumeric_counts_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `daily_alphanumeric_counts_measure_range_id_foreign` FOREIGN KEY (`measure_range_id`) REFERENCES `measure_ranges` (`id`),
  CONSTRAINT `daily_alphanumeric_counts_result_interpretation_id_foreign` FOREIGN KEY (`result_interpretation_id`) REFERENCES `result_interpretations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_alphanumeric_counts`
--

LOCK TABLES `daily_alphanumeric_counts` WRITE;
/*!40000 ALTER TABLE `daily_alphanumeric_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_alphanumeric_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_gram_stain_result_counts`
--

DROP TABLE IF EXISTS `daily_gram_stain_result_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_gram_stain_result_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int unsigned NOT NULL,
  `gram_stain_range_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_gram_stain_result_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  CONSTRAINT `daily_gram_stain_result_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_gram_stain_result_counts`
--

LOCK TABLES `daily_gram_stain_result_counts` WRITE;
/*!40000 ALTER TABLE `daily_gram_stain_result_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_gram_stain_result_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_hiv_counts`
--

DROP TABLE IF EXISTS `daily_hiv_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_hiv_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int unsigned NOT NULL,
  `purpose` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `count` int unsigned NOT NULL,
  `measure_id` int unsigned DEFAULT NULL,
  `measure_range_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_hiv_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  CONSTRAINT `daily_hiv_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_hiv_counts`
--

LOCK TABLES `daily_hiv_counts` WRITE;
/*!40000 ALTER TABLE `daily_hiv_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_hiv_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_negative_cultures`
--

DROP TABLE IF EXISTS `daily_negative_cultures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_negative_cultures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `organism_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_negative_cultures`
--

LOCK TABLES `daily_negative_cultures` WRITE;
/*!40000 ALTER TABLE `daily_negative_cultures` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_negative_cultures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_negative_gram_stains`
--

DROP TABLE IF EXISTS `daily_negative_gram_stains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_negative_gram_stains` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `gram_stain_range_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_negative_gram_stains`
--

LOCK TABLES `daily_negative_gram_stains` WRITE;
/*!40000 ALTER TABLE `daily_negative_gram_stains` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_negative_gram_stains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_numeric_range_counts`
--

DROP TABLE IF EXISTS `daily_numeric_range_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_numeric_range_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int unsigned NOT NULL,
  `measure_id` int unsigned NOT NULL,
  `result` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `result_interpretation_id` int unsigned DEFAULT NULL,
  `count` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_numeric_range_counts_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  KEY `daily_numeric_range_counts_measure_id_foreign` (`measure_id`),
  KEY `daily_numeric_range_counts_result_interpretation_id_foreign` (`result_interpretation_id`),
  CONSTRAINT `daily_numeric_range_counts_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`),
  CONSTRAINT `daily_numeric_range_counts_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `daily_numeric_range_counts_result_interpretation_id_foreign` FOREIGN KEY (`result_interpretation_id`) REFERENCES `result_interpretations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_numeric_range_counts`
--

LOCK TABLES `daily_numeric_range_counts` WRITE;
/*!40000 ALTER TABLE `daily_numeric_range_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_numeric_range_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_organism_counts`
--

DROP TABLE IF EXISTS `daily_organism_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_organism_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int unsigned NOT NULL,
  `organism_id` int unsigned NOT NULL,
  `result_interpretation_id` int unsigned DEFAULT NULL,
  `count` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_organism_counts_organism_id_foreign` (`organism_id`),
  KEY `daily_organism_counts_result_interpretation_id_foreign` (`result_interpretation_id`),
  CONSTRAINT `daily_organism_counts_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`),
  CONSTRAINT `daily_organism_counts_result_interpretation_id_foreign` FOREIGN KEY (`result_interpretation_id`) REFERENCES `result_interpretations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_organism_counts`
--

LOCK TABLES `daily_organism_counts` WRITE;
/*!40000 ALTER TABLE `daily_organism_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_organism_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_rejection_reason_counts`
--

DROP TABLE IF EXISTS `daily_rejection_reason_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_rejection_reason_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_specimen_count_id` int unsigned NOT NULL,
  `reason_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_rejection_reason_counts_daily_specimen_count_id_foreign` (`daily_specimen_count_id`),
  KEY `daily_rejection_reason_counts_reason_id_foreign` (`reason_id`),
  CONSTRAINT `daily_rejection_reason_counts_daily_specimen_count_id_foreign` FOREIGN KEY (`daily_specimen_count_id`) REFERENCES `daily_specimen_counts` (`id`),
  CONSTRAINT `daily_rejection_reason_counts_reason_id_foreign` FOREIGN KEY (`reason_id`) REFERENCES `rejection_reasons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_rejection_reason_counts`
--

LOCK TABLES `daily_rejection_reason_counts` WRITE;
/*!40000 ALTER TABLE `daily_rejection_reason_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_rejection_reason_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_specimen_counts`
--

DROP TABLE IF EXISTS `daily_specimen_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_specimen_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `all` int unsigned NOT NULL,
  `accepted` int unsigned NOT NULL,
  `rejected` int unsigned NOT NULL,
  `referred_in` int unsigned DEFAULT NULL,
  `referred_out` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daily_specimen_counts_date_unique` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_specimen_counts`
--

LOCK TABLES `daily_specimen_counts` WRITE;
/*!40000 ALTER TABLE `daily_specimen_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_specimen_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_specimen_type_counts`
--

DROP TABLE IF EXISTS `daily_specimen_type_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_specimen_type_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_specimen_count_id` int unsigned NOT NULL,
  `specimen_type_id` int unsigned NOT NULL,
  `all` int unsigned NOT NULL,
  `accepted` int unsigned NOT NULL,
  `rejected` int unsigned NOT NULL,
  `referred_in` int unsigned NOT NULL,
  `referred_out` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_specimen_type_counts_daily_specimen_count_id_foreign` (`daily_specimen_count_id`),
  KEY `daily_specimen_type_counts_specimen_type_id_foreign` (`specimen_type_id`),
  CONSTRAINT `daily_specimen_type_counts_daily_specimen_count_id_foreign` FOREIGN KEY (`daily_specimen_count_id`) REFERENCES `daily_specimen_counts` (`id`),
  CONSTRAINT `daily_specimen_type_counts_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_specimen_type_counts`
--

LOCK TABLES `daily_specimen_type_counts` WRITE;
/*!40000 ALTER TABLE `daily_specimen_type_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_specimen_type_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_susceptibility_counts`
--

DROP TABLE IF EXISTS `daily_susceptibility_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_susceptibility_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_organism_count_id` int unsigned NOT NULL,
  `antibiotic_id` int unsigned NOT NULL,
  `interpretation_id` int unsigned NOT NULL,
  `count` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_susceptibility_counts_daily_organism_count_id_foreign` (`daily_organism_count_id`),
  KEY `daily_susceptibility_counts_antibiotic_id_foreign` (`antibiotic_id`),
  KEY `daily_susceptibility_counts_interpretation_id_foreign` (`interpretation_id`),
  CONSTRAINT `daily_susceptibility_counts_antibiotic_id_foreign` FOREIGN KEY (`antibiotic_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `daily_susceptibility_counts_daily_organism_count_id_foreign` FOREIGN KEY (`daily_organism_count_id`) REFERENCES `daily_organism_counts` (`id`),
  CONSTRAINT `daily_susceptibility_counts_interpretation_id_foreign` FOREIGN KEY (`interpretation_id`) REFERENCES `drug_susceptibility_measures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_susceptibility_counts`
--

LOCK TABLES `daily_susceptibility_counts` WRITE;
/*!40000 ALTER TABLE `daily_susceptibility_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_susceptibility_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_test_counts`
--

DROP TABLE IF EXISTS `daily_test_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_test_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `all` int unsigned NOT NULL,
  `referred_in` int unsigned NOT NULL,
  `referred_out` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `daily_test_counts_date_unique` (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_test_counts`
--

LOCK TABLES `daily_test_counts` WRITE;
/*!40000 ALTER TABLE `daily_test_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_test_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_test_type_counts`
--

DROP TABLE IF EXISTS `daily_test_type_counts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_test_type_counts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_count_id` int unsigned NOT NULL,
  `test_type_id` int unsigned NOT NULL,
  `age_upper_limit` int unsigned NOT NULL,
  `age_lower_limit` int unsigned NOT NULL,
  `gender` int unsigned NOT NULL,
  `all` int unsigned NOT NULL,
  `referred_in` int unsigned NOT NULL,
  `referred_out` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_test_type_counts_test_type_id_foreign` (`test_type_id`),
  KEY `daily_test_type_counts_daily_test_count_id_foreign` (`daily_test_count_id`),
  CONSTRAINT `daily_test_type_counts_daily_test_count_id_foreign` FOREIGN KEY (`daily_test_count_id`) REFERENCES `daily_test_counts` (`id`),
  CONSTRAINT `daily_test_type_counts_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_test_type_counts`
--

LOCK TABLES `daily_test_type_counts` WRITE;
/*!40000 ALTER TABLE `daily_test_type_counts` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_test_type_counts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_turn_around_time`
--

DROP TABLE IF EXISTS `daily_turn_around_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_turn_around_time` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `daily_test_type_count_id` int unsigned NOT NULL,
  `avg_reception_tostart` int unsigned NOT NULL,
  `avg_start_tocompletion` int unsigned NOT NULL,
  `avg_reception_tocompletion` int unsigned NOT NULL,
  `avg_start_tovarification` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `daily_turn_around_time_daily_test_type_count_id_foreign` (`daily_test_type_count_id`),
  CONSTRAINT `daily_turn_around_time_daily_test_type_count_id_foreign` FOREIGN KEY (`daily_test_type_count_id`) REFERENCES `daily_test_type_counts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_turn_around_time`
--

LOCK TABLES `daily_turn_around_time` WRITE;
/*!40000 ALTER TABLE `daily_turn_around_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_turn_around_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Out patient department','OPD','Out patient',NULL,NULL),(2,'Medical ward female','MED','In patient',NULL,NULL),(3,'Medical ward male','MED','In patient',NULL,NULL),(4,'Medical ward male OPD','MED','Out patient',NULL,NULL),(5,'Medical ward female OPD','MED','Out patient',NULL,NULL),(6,'Surgical ward female','SUR','In patient',NULL,NULL),(7,'Surgical ward male','SUR','In patient',NULL,NULL),(8,'Peadiatrics ward','PEAD','In patient',NULL,NULL),(9,'Acute Peadiatrics ward','PEAD','Emergency',NULL,NULL),(10,'Peadiatrics ward OPD','PEAD','Out patient',NULL,NULL),(11,'Neonatal unit Intensive care unit','NICU','Intensive care unit',NULL,NULL),(12,'Neonatalogy','NEO','In patient',NULL,NULL),(13,'Intensive care unit','ICU','Intensive care unit',NULL,NULL),(14,'Matenity','MAT','In patient',NULL,NULL),(15,'Gynaecology ward','GYN','Mixed',NULL,NULL),(16,'Theatre','THR','In patient',NULL,NULL),(17,'High dependency unit','HDU','Intensive care unit',NULL,NULL),(18,'TB ward','TB','Mixed',NULL,NULL),(19,'Maternal and  Child Health','MCH','Mixed',NULL,NULL),(20,'Art clinic','ART','Out patient',NULL,NULL),(21,'Eye clinic','EYE','Out patient',NULL,NULL),(22,'Dental clinic','DEN','Out patient',NULL,NULL),(23,'Private clinic','PRI','Mixed',NULL,NULL),(24,'Emergency department (Casuality)','EME','Emergency',NULL,NULL),(25,'Physiotherapy','PHY','Out patient',NULL,NULL),(26,'Orthopaedic department','ORT','Mixed',NULL,NULL),(27,'Diabetic clinic','DIA','Out patient',NULL,NULL),(28,'Postal abortion care unit department','PAC','Mixed',NULL,NULL),(29,'Isolation unit','ISO','In patient',NULL,NULL),(30,'Laboratory department','Lab','Laboratory',NULL,NULL),(31,'Radiology department','RAD','Mixed',NULL,NULL),(32,'Community health','COM','Community',NULL,NULL),(33,'Oncology','ONCO','Out patient',NULL,NULL),(34,'Infectious diseases','IDC','Mixed',NULL,NULL),(35,'Obsterics/gynecology','OBG','Mixed',NULL,NULL),(36,'Psychiatry','PSY','Mixed',NULL,NULL),(37,'Other Hospital','HOS','Mixed',NULL,NULL),(38,'Other Clinic','CLI','Mixed',NULL,NULL),(39,'Unknown','UNK','Mixed',NULL,NULL),(40,'Antenatal','ANC','Out patient',NULL,NULL),(41,'Nutrition department','NUT','Mixed',NULL,NULL),(42,'Teenage center','TC','Out patient',NULL,NULL),(43,'Cervical cancer prevention clinic','CCP','Out patient',NULL,NULL),(44,'Respiratory Clinic','RES','Out patient',NULL,NULL),(45,'Urology clinic','UR/CL','Out patient',NULL,NULL),(46,'Neurology clinic','NEU/CL','Out patient',NULL,NULL),(47,'ENT Clinic','ENT','Out patient',NULL,NULL),(48,'Family planning clinic','FAM','Out patient',NULL,NULL),(49,'Adolescent clinic','AD','Out patient',NULL,NULL),(50,'Cardiology','CARD','Mixed',NULL,NULL),(51,'STI unit','STI','Out patient',NULL,NULL),(52,'EID/PMTCT','PMTCT','Out patient',NULL,NULL),(53,'Chest Clinic','CHE','Out patient',NULL,NULL),(54,'Under five clinic','UND/CLI','Out patient',NULL,NULL),(55,'Gynecology theater','GYN/THR','In patient',NULL,NULL),(56,'Palliative care unit','PAL','Mixed',NULL,NULL),(57,'Child Health unit (EPI)','EPI','Out patient',NULL,NULL),(58,'Medical outpatient department','MOPD','Out patient',NULL,NULL),(59,'Dialysis/Renal ward','DIA','Mixed',NULL,NULL),(60,'Endocrinology ward','ENDO','Mixed',NULL,NULL),(61,'GIT ward','GIT','Mixed',NULL,NULL),(62,'Hematology ward','HEM','Mixed',NULL,NULL),(63,'Medical assessment centre','MAC','Out patient',NULL,NULL),(64,'Plastic ward','PLA','Mixed',NULL,NULL),(65,'Pulmonary ward','PUL','Mixed',NULL,NULL),(66,'Burns ward','BURN','In patient',NULL,NULL),(67,'Others (Please Specify)','other','Mixed',NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'Malaria','2024-12-11 18:06:53','2024-12-11 18:06:53'),(2,'Typhoid','2024-12-11 18:06:53','2024-12-11 18:06:53'),(3,'Shigella Dysentry','2024-12-11 18:06:53','2024-12-11 18:06:53');
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_susceptibility`
--

DROP TABLE IF EXISTS `drug_susceptibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_susceptibility` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `isolated_organism_id` int unsigned NOT NULL,
  `drug_susceptibility_measure_id` int unsigned NOT NULL,
  `zone_diameter` int unsigned DEFAULT NULL,
  `report` int NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `drug_susceptibility_user_id_foreign` (`user_id`),
  KEY `drug_susceptibility_drug_id_foreign` (`drug_id`),
  KEY `drug_susceptibility_isolated_organism_id_foreign` (`isolated_organism_id`),
  KEY `drug_susceptibility_drug_susceptibility_measure_id_foreign` (`drug_susceptibility_measure_id`),
  CONSTRAINT `drug_susceptibility_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `drug_susceptibility_drug_susceptibility_measure_id_foreign` FOREIGN KEY (`drug_susceptibility_measure_id`) REFERENCES `drug_susceptibility_measures` (`id`),
  CONSTRAINT `drug_susceptibility_isolated_organism_id_foreign` FOREIGN KEY (`isolated_organism_id`) REFERENCES `isolated_organisms` (`id`),
  CONSTRAINT `drug_susceptibility_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_susceptibility`
--

LOCK TABLES `drug_susceptibility` WRITE;
/*!40000 ALTER TABLE `drug_susceptibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `drug_susceptibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drug_susceptibility_measures`
--

DROP TABLE IF EXISTS `drug_susceptibility_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drug_susceptibility_measures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `symbol` varchar(2) COLLATE utf8mb3_unicode_ci NOT NULL,
  `interpretation` varchar(60) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drug_susceptibility_measures`
--

LOCK TABLES `drug_susceptibility_measures` WRITE;
/*!40000 ALTER TABLE `drug_susceptibility_measures` DISABLE KEYS */;
INSERT INTO `drug_susceptibility_measures` VALUES (1,'S','Sensitive','2024-12-11 18:06:54','2024-12-11 18:06:54'),(2,'I','Intermediate','2024-12-11 18:06:54','2024-12-11 18:06:54'),(3,'R','Resistant','2024-12-11 18:06:54','2024-12-11 18:06:54');
/*!40000 ALTER TABLE `drug_susceptibility_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `drugs_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (1,'Amikacin',NULL,NULL,'2017-05-31 14:29:37','2017-05-31 14:29:37'),(2,'Ampicillin',NULL,NULL,'2017-05-31 14:29:38','2017-05-31 14:29:38'),(3,'Augmentin',NULL,NULL,'2017-05-31 14:29:38','2017-05-31 14:29:38'),(4,'Cefotaxime',NULL,NULL,'2017-05-31 14:29:38','2017-05-31 14:29:38'),(5,'Ceftazidime',NULL,NULL,'2017-05-31 14:29:38','2017-05-31 14:29:38'),(6,'Ceftriaxone',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(7,'Ceftizoxime',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(8,'Cefuroxime',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(9,'Cefuroxime oral',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(10,'Chloramphenicol',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(11,'Ciprofloxacin',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(12,'Co-trimoxazole',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(13,'Gentamicin',NULL,NULL,'2017-05-31 14:29:39','2017-05-31 14:29:39'),(14,'Imipenem',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(15,'Meropenem',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(16,'Nalidixic acid',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(17,'Peperacillintazobactam',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(18,'Piperacillin',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(19,'Nitrofurantoin',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(20,'Trimethoprim',NULL,NULL,'2017-05-31 14:29:40','2017-05-31 14:29:40'),(21,'Amoxycillin',NULL,NULL,'2017-05-31 14:29:41','2017-05-31 14:29:41'),(22,'Cefepime',NULL,NULL,'2017-05-31 14:29:41','2017-05-31 14:29:41'),(23,'Colistin',NULL,NULL,'2017-05-31 14:29:42','2017-05-31 14:29:42'),(24,'Tetracycline',NULL,NULL,'2017-05-31 14:29:48','2017-05-31 14:29:48'),(25,'Erythromycin',NULL,NULL,'2017-05-31 14:29:53','2017-05-31 14:29:53'),(26,'Clindamycin',NULL,NULL,'2017-05-31 14:29:53','2017-05-31 14:29:53'),(27,'Vancomycin',NULL,NULL,'2017-05-31 14:29:53','2017-05-31 14:29:53'),(28,'Linezolid',NULL,NULL,'2017-05-31 14:29:53','2017-05-31 14:29:53'),(29,'Penicillin G',NULL,NULL,'2017-05-31 14:29:53','2017-05-31 14:29:53'),(30,'Cefoxitin',NULL,NULL,'2017-05-31 14:29:53','2017-05-31 14:29:53'),(31,'Rifampicin',NULL,NULL,'2017-05-31 14:29:54','2017-05-31 14:29:54'),(32,'Streptomycin',NULL,NULL,'2017-05-31 14:30:05','2017-05-31 14:30:05'),(33,'Minocycline',NULL,NULL,'2017-05-31 14:30:08','2017-05-31 14:30:08'),(34,'Cefexime',NULL,NULL,'2017-05-31 14:30:09','2017-05-31 14:30:09'),(35,'spectinomycin',NULL,NULL,'2017-05-31 14:30:09','2017-05-31 14:30:09'),(36,'Oxacillin',NULL,NULL,'2017-05-31 14:30:21','2017-05-31 14:30:21'),(37,'Levofloxacin',NULL,NULL,'2017-05-31 14:30:54','2017-05-31 14:30:54'),(38,'Cefuroxime Parentral',NULL,NULL,'2017-05-31 14:30:59','2017-05-31 14:30:59'),(39,'High level Gentamicin',NULL,NULL,'2017-05-31 14:31:06','2017-05-31 14:31:06');
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emr_test_request`
--

DROP TABLE IF EXISTS `emr_test_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emr_test_request` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `emrtestid` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `testtype` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT 'pending',
  `specimen_type` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `specimen_type_code` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `visitid` bigint unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `emr_test_request_visitid_foreign` (`visitid`),
  CONSTRAINT `emr_test_request_visitid_foreign` FOREIGN KEY (`visitid`) REFERENCES `unhls_visits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emr_test_request`
--

LOCK TABLES `emr_test_request` WRITE;
/*!40000 ALTER TABLE `emr_test_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `emr_test_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip_config`
--

DROP TABLE IF EXISTS `equip_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equip_config` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `equip_id` int unsigned NOT NULL,
  `prop_id` int unsigned NOT NULL,
  `prop_value` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `equip_config_equip_id_foreign` (`equip_id`),
  KEY `equip_config_prop_id_foreign` (`prop_id`),
  CONSTRAINT `equip_config_equip_id_foreign` FOREIGN KEY (`equip_id`) REFERENCES `interfaced_equipment` (`id`),
  CONSTRAINT `equip_config_prop_id_foreign` FOREIGN KEY (`prop_id`) REFERENCES `ii_quickcodes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip_config`
--

LOCK TABLES `equip_config` WRITE;
/*!40000 ALTER TABLE `equip_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `equip_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_dump`
--

DROP TABLE IF EXISTS `external_dump`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_dump` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lab_no` int NOT NULL,
  `parent_lab_no` int NOT NULL,
  `test_id` int DEFAULT NULL,
  `requesting_clinician` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `investigation` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `provisional_diagnosis` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request_date` timestamp NULL DEFAULT NULL,
  `order_stage` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `result` text COLLATE utf8mb3_unicode_ci,
  `result_returned` int DEFAULT NULL,
  `patient_visit_number` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `full_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `postal_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cost` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `receipt_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `receipt_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `waiver_no` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_dump_lab_no_unique` (`lab_no`),
  KEY `external_dump_parent_lab_no_index` (`parent_lab_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_dump`
--

LOCK TABLES `external_dump` WRITE;
/*!40000 ALTER TABLE `external_dump` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_dump` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `external_users`
--

DROP TABLE IF EXISTS `external_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `internal_user_id` int unsigned NOT NULL,
  `external_user_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_users_internal_user_id_unique` (`internal_user_id`),
  CONSTRAINT `external_users_internal_user_id_foreign` FOREIGN KEY (`internal_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `external_users`
--

LOCK TABLES `external_users` WRITE;
/*!40000 ALTER TABLE `external_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `external_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb3_unicode_ci NOT NULL,
  `facility_contact` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `facility_email` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active` int NOT NULL,
  `code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dhis2_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dhis2_uid` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2888 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (2,'Abako H/C III','772312515','',0,NULL,'Abako HC III','yDPmjwoOIxi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'Aber Hospital','782117574','',0,NULL,'Aber Hospital','cDGKAJzfkpf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'Abim Hospital','777281715','',0,NULL,'Abim Hospital','RxPKxSBe0DC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'Aboke H/C IV','779075630','',0,NULL,'Aboke HC IV','UIhutvdIhqU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'Abongomola H/C III','772868854','',0,NULL,'Abongomola HC III','xzRSc5XHzys','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'Acet H/C II','77646333','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,'Achol Pii H/C III','774253869','',0,NULL,'Achol Pii HC III','aKoVWgIufTx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,'Acholi Bur H/C III','0774832887','',0,NULL,'Acholi-Bur HC III','KgFiiUmrRxI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,'Adjumani Hospital','772918562','',0,NULL,'Adjumani   HOSPITAL','hvtKTUxWNrt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,'Adok H/C II','752418166','',0,NULL,'Adok HC II','tdWJ67qCYZK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,'Aduku H/C II (NGO)',' ','',0,NULL,'Aduku Mission HC II','YrbvkUaWpi1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,'Aduku H/C IV ','779330623','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,'Agali H/C III','777114666','',0,NULL,'Agali HC III','I9nJzN3m8qL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,'Agoro H/C III','711068465','',0,NULL,'Lamwo Agoro HC III GOVT','tvKjvN8d4rR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,'Agu H/C III','782424967','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,'Agule H/C III','773084891','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,'Agulurude H/C III','777583284','',0,NULL,'Agulurude HC III','aes9vvQi4Df','0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,'Agwata H/C III','774993910','',0,NULL,'Agwatta HC III','sYHZIUFx50X','0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,'Akalo H/C III','753761001','',0,NULL,'Akalo HC III','h9Jydxolx2q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,'Akokoro H/C III','773577763','',0,NULL,'Akokoro HC III','rjOHz4O83zh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,'Akuna Laber H/C III','774849340','',0,NULL,'Akuna Laber HC III','aWMoXZucGiV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,'Alebtong H/C IV','772628341','',0,NULL,'Alebtong HC IV','RdmsO9Kftg9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,'Alerek H/C III','775287200','',0,NULL,'Alerek HC III','RLWAwgTDjSJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,'Alero H/C III','717573999','',0,NULL,'Alero HC III','EPyMwPkmKPx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,'Alito H/C III','756802305','',0,NULL,'Alito HC III','avAlXE2E7Re','0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,'Alive Medical Services H/C III','414258580','',0,'4','Alive Medical Services HC III','PHhcBpjIWvL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,'Amach H/C IV','777647634','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,'Amai Community Hospital','773016662','',0,NULL,'Amai Community Hospital','Zk9bvpSxThA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,'Amolatar H/C IV ','773897355','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,'Amuca SDA H/C III','787324669','',0,NULL,'Amuca SDA HC III','pNHDdE8BJt8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,'Amuda H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(34,'Amudat Hospital','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,'Amugu H/C III','782681664','',0,NULL,'Amugu HC III','acBVtDN7cmd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(36,'Amuria General Hospital','773308460','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,'Amuru H/C III','774848923','',0,NULL,'Amuru HC III','aFgrVHVDqoZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(38,'Anaka Hospital','774805770','',0,NULL,'Anaka Hospital','PgRLMNQdejC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(40,'Anyara H/C III','776996063','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(41,'Anyeke H/C IV','','',0,NULL,'Anyeke HC IV','EYklRtOZrwz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,'Apac Hospital ','75246534','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(43,'Apalabarowo H/C III','785966224','',0,NULL,'Apalabarowo HC III','vt2z3wXqBGE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(44,'Apala H/C III','777053344','',0,NULL,'Apala HC III','AKNaO98uuZO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(45,'Apapai H/C IV (Serere)','744006516','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(46,'Apoi H/C III','','',0,NULL,'Apoi HC III','x6tiiRt28yz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,'Aputi H/C III','773394839','',0,NULL,'Aputi HC III','XQqrn8K8jyL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,'Ariwa H/C III','779744905','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(49,'Aromo H/C III','774059095','',0,NULL,'Aromo HC III','SvBwj5ZrWMx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(50,'Arua R R Hospital','752663302','',0,NULL,'Arua REGIONAL REF HOSPITAL','THGKB3lHEUx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(51,'Atabu H/C II','782418166','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(52,'Atanga H/C III','0777204171','',0,NULL,'Atanga HC III','SF33CGHTeUn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(53,'Atiak H/C IV ','775666037','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,'Atool H/C II','782254913','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(56,'Atutur Hospital','782027766','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(57,'Awach H/C IV ','782040787','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(58,'Awer H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(59,'Awere H/C III','774022194','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,'Awoo H/C II','774817575','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(61,'Ayer H/C II','754808980','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(62,'Aywee H/C III','','',0,NULL,'Aywee HC III','aE0Yzd3YZQ9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(63,'Azur Christian H/C IV','783658054','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(64,'Baitambogwe H/C III','774140176','',0,NULL,'Baitambogwe HC III','dBJMmXzJwYi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,'Bala H/C III','779203475','',0,NULL,'Bala HC III','rEncXrvkJ3Z','0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,'Barapwo H/C III','775172582','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(67,'Bardyang H/C II','752418166','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(68,'Barr H/C III','772618460','',0,NULL,'Barr HC III','CpZY2oCsE5i','0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,'Bata H/C III','772657256','',0,NULL,'Bata HC III','NunHrloqul7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(71,'Bibia H/C III','774592062','',0,NULL,'Bibia HC III','N00TPmBoIls','0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,'Biddabugya H/C III','785732682','',0,NULL,'Bidabugya HC III','YTCehe1KMvF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,'Bigodi H/C III','773295818','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,'Bihanga H/C III (Buhweju)','781507660','',0,NULL,'Bihanga HC III','Fi6rNyCYxsL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(75,'Binya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,'Binyiny H/C III','754172238','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,'Bisheshe H/C III','783627202','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,'Kasese Community Health & Education Foundation (KCHEF)','774114384','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,'Bitereko H/C III','782444026','',0,NULL,'Bitereko HC III','aumCjLAHfAL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(81,'Bobi H/C III','785414568','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,'Bombo Military Hospital ','772859404','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,'Boroboro H/C III','777141157','',0,NULL,'Boroboro HC III','aHYpuUgnA4P','0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,'Bubaare H/C III (Mbarara)','773006481','',0,NULL,'Bubaare HC III','uwXTH0M0m4p','0000-00-00 00:00:00','0000-00-00 00:00:00'),(85,'Bubulo H/C IV','752521805','',0,NULL,'Bubulo HC IV','oIYkOMu6tdP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(86,'Budadiri H/C IV','782083486','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,'Budaka H/C IV','782310948','',0,NULL,'Budaka HC IV','aXPAwDqt65Q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,'Budondo H/C IV','782932700','',0,NULL,'Budondo HC IV','BTNeWyNJanq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,'Bududa Hospital','782150480','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,'Budumba H/C III','753701164','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,'Bufumbo H/C IV','782664114','',0,NULL,'Bufumbo HC IV','zH1tLSpZuGt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(92,'Bufunda H/C III','772935060','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,'Bugalo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(94,'Bugamba H/C IV','782460178','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(95,'Bugambe H/C II (Hoima)','782323029','',0,NULL,'Bugambe HC III','CRKrLT3w8EQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,'Bugambe Tea H/C III (Hoima)','782946022','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,'Bugembe H/C  IV','772323503','',0,NULL,'Bugembe HC IV','MmVUt93uiqa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,'Bugiri Hospital','782309581','',0,NULL,'Bugiri Hospital','CNG62dd4mE1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,'Bugobero H/C IV','752521809','',0,NULL,'Bugobero HC IV','RTB3ZNoIDhd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,'Bugono H/C IV','712950841','',0,NULL,'Bugono HC IV','JkMbi1FzXrX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(102,'Bugoye H/C III','706907535','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(103,'Buhara H/C III (Govt)','787032220','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(104,'Buhehe H/C III','779346042','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(105,'Buhimba H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(106,'Buhunga H/C IV','701353844','',0,NULL,'Buhunga HC IV','LLCOrTAVtpK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(107,'Buikwe Hospital (St Charlse Lwanga)','784470442','',0,NULL,'Buikwe St. Charles Lwanga HOSPITAL','aClaerhXk59','0000-00-00 00:00:00','0000-00-00 00:00:00'),(108,'Bujubuli H/C III','782591502','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(109,'Bukangama H/C III','794527535','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(110,'Bukedea H/C IV','716041412','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(111,'Buremba H/C III (Kiruhura)','773007418','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(112,'Bukigai H/C III','775985968','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(113,'Bukinda H/C III','775573662','',0,NULL,'Bukinda HC III','afqb57VEJp3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(114,'Bukomero H/C IV','784713664','',0,NULL,'Bukomero HC IV','aVPeLDNBucL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(115,'Bukoto H/C III','784834893','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(116,'Bukulula H/C IV','775430480','',0,NULL,'Bukulula HC IV','DFuALUpGId9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(117,'Bukuuku H/C IV ','704753355','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(118,'Bukuya H/C III','712134102','',0,NULL,'Bukuya HC III','CiNybZErM6Q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(119,'Bukwo H/C IV','777603015','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(120,'Bulange H/C III','782553672','',0,NULL,'Bulange HC III','E0iTAuyvRrd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(121,'Buliisa H/C IV','774665077','',0,NULL,'Buliisa HC IV','TEGhWFDGruu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(122,'Buluba Hospital St Francis','777054600','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(123,'Bumanya H/C IV','788597147','',0,NULL,'Bumanya HC IV','dZSLpFo3Ow2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(124,'Bundibugyo Hospital  ','771630999','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'Bung H/C II','751721709','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'Bungokho Mutoto H/C III','704312235','',0,NULL,'Bungokho Mutoto HC III','qqNrWKGgl1e','0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,'Bunoga H/C III','753341673','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,'Bunyiiro H/C III','706028527','',0,NULL,'Bunyiiro Gvt HC III','BxF2c8dwf02','0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,'Buraru H/C III','773702096','',0,NULL,'Buraru HC III','TJESax78KE7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,'Busaba H/C III','753097842','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,'Busamaga H/C III',' ','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,'Busano H/C III','','',0,NULL,'Busano HC III','S3tP2Tw15nr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,'Busanza H/C IV ','773219980','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,'Busesa H/C IV','772697750','',0,NULL,'Busesa HC IV','FLMye24JUsV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,'Buseta H/C III','751480609','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,'Bushenyi H/C IV','701283662','',0,'65','Bushenyi HC IV','jmcxCPyDHHS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(138,'Bushenyi Medical Centre H/C III','772958343','',0,'65','Bushenyi Medical Center HC III','aJNgqIuVpYF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,'Bushikori H/C III','784959757','',0,NULL,'Bushikori HC III','b5gYOcDzgXn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,'Bushiyi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,'Busia H/C IV','777828568','',0,NULL,'Busia HC IV','Yr843NBuL9D','0000-00-00 00:00:00','0000-00-00 00:00:00'),(143,'Busiriba H/C II',' ','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(144,'Busolwe Hospital','753200001','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(145,'Busiu H/C IV','752840585','',0,NULL,'Busiu HC IV','zeEOtz7XwxV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(146,'Butabika  Hospital','772848761','',0,'4','Butabika NATIONAL REFERAL HOSPITAL','KssVUerFkyV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(147,'Butebo H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(148,'Butema H/C III','773764156','',0,'4','Butema HC III','VyKflstsoTt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(149,'Butenga H/C IV','752851694','',0,NULL,'Butenga HC IV','gBVBGJ2p9b3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(150,'Butiiti H/C III','779982354','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(151,'Butiru H/C III','772079346','',0,NULL,'Butiru HC III','Wsm1yq3s0Lw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(152,'Butunduzi H/C III','774455662','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(153,'Buvuma H/C IV','','',0,NULL,'Buvuma HC IV','ewMHVf7tjwq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(154,'Buwaiswa H/C III','782899189','',0,NULL,'Buwaiswa HC III','uja4Tx4IR8w','0000-00-00 00:00:00','0000-00-00 00:00:00'),(155,'Buwambo H/C IV','772885227','',0,NULL,'Buwambo HC IV','aq5a4s4nH5n','0000-00-00 00:00:00','0000-00-00 00:00:00'),(156,'Buwasa H/C IV','772699588','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(157,'Buwasunguyi H/C II','774788450','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(158,'Buwenge H/C IV','774532044','',0,NULL,'Buwenge HC IV','hYRpOD0ijAo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(159,'St Cecilia Buyamba H/C II-Rakai','754724490','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(160,'Buyinja H/C IV','772533225','',0,NULL,'Buyinja  HC IV','NnSbfZjOXJd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(161,'Buyoga H/C III','75151592764','',0,NULL,'Buyoga HC III','RlulmyGd2XY','0000-00-00 00:00:00','0000-00-00 00:00:00'),(162,'Bwera Hospital ','773981466','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(163,'Bwijanga H/C IV','782675394','',0,NULL,'Bwijanga HC IV','ap3Cu39yPkF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(164,'Bwindi Community Hospital','774035916','',0,NULL,'Bwindi Community Hospital','VES7ks4zElA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(165,'Bwizi H/C III','776294245','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(166,'Bwizibwera H/C IV ','701241770','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(167,'Bwongyera H/C III','787718152','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(168,'Chahafi H/C IV','','',0,NULL,'Chahafi HC IV','aK1GSPJrhjK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(170,'Chegere H/C II','772352137','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(171,'Ciforo H/C III','774223837','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(172,'Comboni Hospital','','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(173,'Coope H/C II','774848424','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(174,'Kotido COU   H/C III','775780829','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(175,'Cure Children Hospital of Uganda','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(176,'Cwero H/C III','778402703','',0,NULL,'Cwero HC III','apGje3lIGEP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(177,'Dabani Hosipital','779110252','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(178,'Dakabela H/C III','772329858','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(179,'Dokolo H/C IV','782266750','',0,NULL,'Dokolo HC IV','KBNJtdMGHlZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(180,'Endiinzi H/C III','787295718','',0,NULL,'Endiizi HC III','HUkwcrf8Ozd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(182,'Etam H/C III','773115270','',0,NULL,'Etam HC III','r4txax3dzBl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(183,'Family Health Resource Centre Kiruhura ','785108327','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(184,'Family Hope Centre Jinja','772819859','',0,NULL,'Family Hope Center Jinja','aNxk6ghyV8u','0000-00-00 00:00:00','0000-00-00 00:00:00'),(185,'Family Hope Centre Kampala','752528843','',0,'4','Family Hope Center Kampala','X0giNVjxX76','0000-00-00 00:00:00','0000-00-00 00:00:00'),(186,'FinlaysMwenge H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(187,'FortPortal R R Hospital','772339369','',0,'6','Fort Portal Regional Referral Hospital','Dt6WipQhr4Q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(188,'Galiraaya H/C III','752398986','',0,NULL,'Galiraya HC III','yZIc8DX7kUx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(189,'Gangama H/C II',' ','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(190,'Gogonyo H/C III','777258208','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(191,'Gombe Hospital ','775272856','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(192,'Gulu Independent Hospital','778640859','',0,NULL,'Gulu Independent Hospital','RsY5tCgiuHp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(193,'Gulu Military Hospital (4th Division)','778938159','',0,NULL,'Gulu  Military Hospital','x1UaYpPwx6c','0000-00-00 00:00:00','0000-00-00 00:00:00'),(194,'Gulu Prison H/C III','754414873','',0,NULL,'Gulu Prison HC III','i7JbInoEb2D','0000-00-00 00:00:00','0000-00-00 00:00:00'),(195,'Gulu R R Hospital','779201168','',0,NULL,'Gulu Regional Referal Hospital','QDc7Wijvfca','0000-00-00 00:00:00','0000-00-00 00:00:00'),(196,'Gweri H/C III','774206049','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(197,'Hamurwa H/C IV','775828838','',0,NULL,'Hamurwa HC IV','GzCsU3tbMbg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(198,'Herman Meiner H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(199,'Hoima R R Hospital','775923299','',0,'4','Hoima REGIONAL REF Hospital','V2ylFCAVj0U','0000-00-00 00:00:00','0000-00-00 00:00:00'),(200,'Holy Family Hospital-Nyapea','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(201,'Ibanda Hospital','783406816','',0,NULL,'Ibanda Hospital','ahn03jwJwRI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(202,'Ibuje H/C III','784485391','',0,NULL,'Ibuje HC III','M8mSJi1Qcah','0000-00-00 00:00:00','0000-00-00 00:00:00'),(203,'Iceme H/C III','772085176','',0,NULL,'Iceme Ngo HC III','OYENvTcFrXW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(204,'Iganga Hospital','772621850','',0,NULL,'Iganga Hospital','EKPCmrHaBSg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(205,'Ihandiro H/C III','779785304','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(206,'Iki  Iki H/C III','779035400','',0,NULL,'Iki-Iki HC III','cqonmIvPuVM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(207,'Inomo H/C III','782290652','',0,NULL,'Inomo HC III','mKvTS1QMd3x','0000-00-00 00:00:00','0000-00-00 00:00:00'),(208,'Iruhuura H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(209,'Ishaka Adventist Hospital','784979804','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(210,'Ishongororo H/C IV','776534734','',0,NULL,'Ishongororo HC IV','LwODrFWsUAR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(211,'Iss Clinic (Mbarara R R Hospital)','755553190','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(212,'Itojo Hospital','704338228','',0,'65','Itojo Hospital','a7lnM83DJGy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(213,'Ivukula H/C III','774250829','',0,NULL,'Ivukula HC III','PrOL9DbHU3G','0000-00-00 00:00:00','0000-00-00 00:00:00'),(214,'JCRC Fort Portal','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(215,'JCRC Gulu','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(216,'JCRC Kabale','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(217,'JCRC Kakira','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(218,'JCRC Mbale','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(220,'JCRC Mubende','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(221,'Jengari H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(222,'Jinja R R Hospital ','712811359','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(223,'Kaabong Hospital','783712118','',0,NULL,'Kaabong Hospital','pATBoZZRddT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(224,'Kabale R R Hospital','782407445','',0,'65','Kabale Regional Ref Hospital','K2BGHpaUluP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(225,'Kabarole Hospital C.O.U','782813064','',0,'6','Kabarole Hospital','gLhqifDs7hU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(226,'Kabende H/C II','704673787','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(227,'Kaberamaido General Hospital','782873234','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(228,'Kabira H/C III (Rakai)','779294758','',0,NULL,'Kabira HC III GOVT','KC28vpic105','0000-00-00 00:00:00','0000-00-00 00:00:00'),(230,'Kabuga H/C III ','784834077','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(231,'Kabuwoko H/C III','782957686','',0,NULL,'Kabuwoko Gvt HC III','GREWqcdtoVn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(232,'Kabuyanda H/C IV','782018727','',0,'65','Kabuyanda HC IV','K5Rwfv0pC4s','0000-00-00 00:00:00','0000-00-00 00:00:00'),(233,'Kabwohe Clinical Research Centre','779442114','',0,'65','Kabwohe Clinical Research Cenrer HC II','H3LpQ7tdT1P','0000-00-00 00:00:00','0000-00-00 00:00:00'),(234,'Kabwohe H/C IV','778049876','',0,'65','Kabwohe HC IV','yTiZaVCinTc','0000-00-00 00:00:00','0000-00-00 00:00:00'),(235,'Kabwoya H/C III','774642432','',0,'4','Kabwoya HC III','zdhmUkPsGjH','0000-00-00 00:00:00','0000-00-00 00:00:00'),(236,'Kachonga H/C III','772454606','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(237,'Kachumbala H/C III','700903312','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(238,'Kaderuna H/C III','783371407','',0,NULL,'Kaderuna HC III','BUS1uU9bfh8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(239,'Kagadi  Hospital','758184524','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(240,'Kagando Hospital','712325628','',0,'6','Kagando Hospital','KhvLQSeeHZM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(241,'Kagote H/C III','782972575','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(242,'Kajjansi H/C III','712193417','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(243,'Kakabara H/C III','782856089','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(244,'Kakindo H/C IV','779541559','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(245,'Kakinga H/C III','773239725','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(246,'Kakira Sugar Works Hospital ','774427238','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(247,'Kakuka H/C III','792111918','',0,NULL,'Kakuka HC III','kvNr0D5clU1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(248,'Kakumiro H/C IV ','78389792','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(249,'Kakuuto H/C IV','789404356','',0,NULL,'Kakuuto HC IV','Ls1dG8v84Wu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(250,'Kal Ali H/C II','773024270','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(251,'Kaladima H/C III','','',0,NULL,'Kaladima HC III','jWmjHpZqNtY','0000-00-00 00:00:00','0000-00-00 00:00:00'),(252,'Kalagala H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(253,'Kalangala H/C IV','774022611','',0,NULL,'Kalangala HC IV','oTXa14pgh8f','0000-00-00 00:00:00','0000-00-00 00:00:00'),(255,'Kalisizo Hospital ','703058040','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(256,'Kalongo Hospital ','775920363','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(257,'Kalungu H/C III','778666098','',0,NULL,'Kalungu HC III','wKczE4oVqOy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(258,'Kamacha H/C III','774383339','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(259,'Kambuga Hospital ','772576219','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(260,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(261,'Kamuda H/C III','774192370','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(262,'Kamuganguzi H/C III','779411945','',0,'65','Kamuganguzi HC III','c9Fq5DlB3y5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(263,'Kamuge H/C III','782642627','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(264,'Kamukira H/C IV ','771648484','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(265,'Kamwenge H/C III (Kamuli)','788011071','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(266,'Kamuli Mission Hospital','772034038','',0,NULL,'Kamuli Mission Hospital','Zix3B1axH9x','0000-00-00 00:00:00','0000-00-00 00:00:00'),(267,'Kamwenge H/C III (Kamwenge)','772957997','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(268,'Kamwezi   H/C IV ','779412269','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(269,'Kamwokya Christian Caring Community ','754560375','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(270,'Kanawat H/C III','782679529','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(271,'Kanara H/C II','789929390','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(272,'Kangai H/C III','774222224','',0,NULL,'Kangai HC III','aP04v4fQbSd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(273,'Kanginima Hospital','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(274,'Kangulumira H/C IV','775547825','',0,NULL,'Kangulumira HC IV','RSFwMQwN99b','0000-00-00 00:00:00','0000-00-00 00:00:00'),(275,'Kanoni H/C III (Kiruhura)','782837423','',0,NULL,'Kiruhura Kanoni HC III GOVT','Mr238FVwJOm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(276,'Kanungu H/C IV','774521156','',0,NULL,'Kanungu HC IV','EU9ZacQmfpW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(277,'Kanyanya H/C IV',' ','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(278,'Kanyum H/C III (Kumi)','785621692','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(279,'Kapchorwa Hospital','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(280,'Kapeeka H/C III','771616533','',0,NULL,'St. Jerome Cove Kapeeka HC III','jloriHnudvr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(281,'Kapir H/C III','774405237','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(282,'Kaproron H/C IV','775641345','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(283,'Karambi H/C III (Kasese)','787391262','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(284,'Karenga H/C IV','775899843','',0,NULL,'Karenga HC IV','RwUs7iX5S49','0000-00-00 00:00:00','0000-00-00 00:00:00'),(285,'Karugutu H/C IV','787230261','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(286,'Karungu H/C III (Buhweju)','752352381','',0,NULL,'Karungu HC III','Q2xPLKiCPXu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(287,'Kasala H/C III','774035014','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(288,'Kasana H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(289,'Kasanga PHC III','773416108','',0,'6','Kasanga Phc HC III','DUIjxnnEApZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(290,'Kasangati H/C IV','774957192','',0,'14','Kasangati HC IV','a4SedC8Ix2O','0000-00-00 00:00:00','0000-00-00 00:00:00'),(291,'Kasasa H/C III','700367349','',0,NULL,'Kasasa HC III','agw4uqikZnP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(292,'Kaserem H/C III','701947989','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(293,'Kasese Municipal Council H/C III (KMC)','777184708','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(294,'Kashumba H/C III','752830018','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(295,'Kassanda H/C IV','775964900','',0,'14','Kassanda HC IV','vSPwh0RCueD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(296,'Kasunganyanja H/C III','782744020','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(297,'Kasusu H/C III','773772235','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(298,'Kaswa H/C III','706495723','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(299,'Katabi Military Hospital','782872085','',0,NULL,'Katabi Military HC III','FMhE2V9s2bo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(300,'Katadoba H/C III','779777068','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(301,'Katakwi H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(302,'Kataraka H/C IV','782750179','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(303,'Katerera H/C III','784689180','',0,NULL,'Katerera HC III','nLcJPspov8c','0000-00-00 00:00:00','0000-00-00 00:00:00'),(304,'Kathile H/C III','753553172','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(305,'Katimba H/C III','779212201','',0,NULL,'Katimba HC III','sTlap0cwcNo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(306,'Katooke H/C III','777741725','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(307,'Katwe H/C III (Kasese)','700245247','',0,NULL,'Kasese Katwe HC III GOVT','n5XFXJQhdtb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(310,'Kawempe Home Care','783270837','',0,'4','Kawempe Home Care Initiative CLINIC','QgAL2KJE7g4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(311,'Kawolo Hospital','772628157','',0,NULL,'Kawolo Hospital','nKKX3gA72zS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(312,'Kayonza H/C III (Ntungamo)  ','775148855','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(313,'Kayunga Hospital','0774521666','',0,NULL,'Kayunga Hospital','sFIS2oxchec','0000-00-00 00:00:00','0000-00-00 00:00:00'),(314,'Kazo H/C IV','772977845','',0,NULL,'Kazo HC IV','stVRVnZtZVM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(315,'Kebisoni H/C IV','777460710','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(317,'Kibaale H/C IV','782096683','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(318,'Kibaire H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(319,'Kibiito H/C IV ','7077480859','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(320,'Kiboga Hospital','775599701','',0,NULL,'Kiboga Hospital','acJji9Ruj5T','0000-00-00 00:00:00','0000-00-00 00:00:00'),(321,'Kibuku H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(322,'Kibuli Muslim Hospital ','772318348','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(323,'Kicheche H/C III','752964196','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(324,'Kicwamba H/C III (Kabarole)','774204875','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(325,'Kidera H/C IV','784747717','',0,NULL,'Kidera HC IV','KzxdCSnvGwD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(326,'Kidongole H/C III','783445499','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(327,'Kigambo H/C II','702769171','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(328,'Kiganda H/C IV','781498913','',0,'14','Kiganda HC IV','dK6URDbvHgL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(329,'Kigandalo H/C IV','774725303','',0,NULL,'Kigandalo HC IV','TOwFMUTd1XN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(330,'Kigaraale H/C III','','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(331,'Kigarama H/C III','782240597','',0,NULL,'Kigarama HC III','oV7osEI51r6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(332,'Kigorobya H/C IV','700604096','',0,'4','Kigorobya HC IV','GUAwRRqngNN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(333,'Kihiihi H/C IV','779541916','',0,NULL,'Kihiihi HC IV','WiDK75EptX5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(334,'Kijura H/C III','787226897','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(335,'Kikagate H/C III','776462343','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(336,'Kiko H/C III','74330157','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(337,'Kikuube H/C IV','774318380','',0,'4','Kikuube HC IV','ZyIU7Z6NxVX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(338,'Kikyenkye H/C III','752401556','',0,NULL,'Kikyenkye  HC III','j6kmC0qBLuy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(339,'Kikyo H/C IV ','779484569','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(340,'Kilak H/C III','0786122574','',0,NULL,'Kilak HC III','e2i5c23d8cq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(341,'Kilembe Mines Hospital','783327494','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(342,'Kinoni H/C III (Lwengo)','783557603','',0,NULL,'Kinoni Welfare Medical Centre CLINIC','l5Zt1UulNMm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(343,'Kinoni H/C IV (Mbarara)','775815620','',0,'65','Kinoni HC IV','ApxHwTWTekP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(344,'Kinyabwamba H/C III','773596024','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(345,'Kinyamaseke H/C III','787362514','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(346,'Kirambi  H/C  III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(347,'Kirema H/C III','782667396','',0,NULL,'Kirema HC III','kyHAWNZ9EPd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(348,'Kiruddu H/C III','712008051','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(349,'Kiruhura H/C IV','752655890','',0,NULL,'Kiruhura HC IV','GnVqZO2asFJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(350,'Kiryandongo Hospital','784415121','',0,NULL,'Kiryandongo Hospital','kzFJJnKcISy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(351,'Kisaaru Tea H/C II','759961949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(352,'Kisiizi Hospital C.O.U (Rukungiri)','775362708','',0,'65','Kisiizi NGO HOSPITAL','J5lFjhtApU5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(353,'Kisojo H/C III (Kyenjojo)','774072755','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(354,'Kisomoro H/C III','772931104','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(355,'Kisoro Hospital','782879611','',0,NULL,'Kisoro Hospital','FHIEdqBZAll','0000-00-00 00:00:00','0000-00-00 00:00:00'),(356,'Kisubi Hospital','','',0,'14','Kisubi Hospital','qLLYEE7sCnd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(357,'Kiswa H/C IV','782439571','',0,'4','Kiswa HC III','cjC5Ij5U7le','0000-00-00 00:00:00','0000-00-00 00:00:00'),(358,'Kitagata  Hospital','782379703','',0,'65','Kitagata HOSPITAL','EMHl20viu7L','0000-00-00 00:00:00','0000-00-00 00:00:00'),(359,'Kitebi H/C III','788400410','',0,'4','Kitebi HC III','sLOvwpCrdh2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(360,'Kitgum General Hospital','784340824','',0,NULL,'Kitgum Hospital','z2LfysbyF9U','0000-00-00 00:00:00','0000-00-00 00:00:00'),(361,'Kitgum Matidi H/C III','782994849','',0,NULL,'Kitgum-Matidi HC III','aKgreJPVnve','0000-00-00 00:00:00','0000-00-00 00:00:00'),(362,'Kitimba H/C III','701362998','',0,NULL,'Kitimba HC III','O4sKsWoxekL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(363,'Kitondo H/C III','779098867','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(364,'Kitoole H/C II','779545981','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(365,'Kitovu Hospital ','753612190','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(366,'Kitswamba H/C III','785114118','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(367,'Kitwe H/C IV (Ntungamo)','782479505','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(368,'Kityerera H/C IV','774157719','',0,NULL,'Kityerera HC IV','W65MlPtBlmF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(369,'Kiwangala H/C IV','7014388783','',0,NULL,'Kiwangala HC IV','oviT3cugAEz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(370,'Kiwoko Hospital ','779652937','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(371,'Kiyombya H/C III','781177043','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(372,'Kiyumba H/C IV','753075923','',0,NULL,'Kiyumba HC IV','AjaGtzC8woM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(373,'Kiyunga H/C IV ( Luuka)','782389973','',0,NULL,'Kiyunga HC IV','a14sgIjcCoT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(374,'Koboko General Hospital','794884681','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(375,'Kobwin H/C III','774662408','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(376,'Koch Goma H/C III','779652419','',0,NULL,'Koch Goma HC III','NdIteLoT2FC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(377,'Koch Ongako H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(378,'Kojja H/C IV','782861434','',0,NULL,'Kojja HC IV','akaiT2gUBst','0000-00-00 00:00:00','0000-00-00 00:00:00'),(379,'Kolonyi H/C III','','',0,NULL,'Kolonyi HC III','O4hJJKkCm5r','0000-00-00 00:00:00','0000-00-00 00:00:00'),(380,'Kotido H/C IV','788244922','',0,NULL,'Kotido HC IV','ahrb1oS6ucq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(381,'Kubongi Military Hospital',' ','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(382,'Kulikulinga H/C III','782316155','',0,NULL,'Kulikulinga HC III','jiKuvEHVanR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(383,'Kuluva Hospital','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(384,'Kumi H/C IV','785872595','',0,NULL,'Kumi HC IV','T7PV25xOz2Z','0000-00-00 00:00:00','0000-00-00 00:00:00'),(385,'Kumi Hospital ','779466258','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(386,'Kwera H/C III','774919190','',0,NULL,'Kwera HC III','fxZxvguCeIw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(387,'Kyabenda H/C III','772958100','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(388,'Kyabugimbi H/C IV ','776554509','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(389,'Kyanamukaka H/C IV','784508486','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(390,'Kyangwali H/C IV','775522283','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(391,'Kyangyenyi H/C III','779413048','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(393,'Kyara H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(394,'Kyarumba PHC III','778781736','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(395,'Kyarusozi H/C IV ','701323841','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(396,'Kyazanga H/C IV','782343989','',0,NULL,'Kyazanga HC IV','VhOO7DL9Y39','0000-00-00 00:00:00','0000-00-00 00:00:00'),(397,'Kyebe H/C III','775734163','',0,NULL,'Kyebe HC III','xP2J8wszUrR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(398,'Kyegegwa H/C IV','774512264','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(399,'Kyehoro H/C III','783706631','',0,NULL,'Kyehoro HC II','pa2KemeFZTD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(400,'Kyembogo H/C III','774107290','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(402,'Kyere H/C III','0782117574','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(403,'Labworomor H/C III','711994021','',0,NULL,'Labworomor HC III','ltWFhjfI6qF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(404,'Lagoro','774151891','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(405,'Laguti H/C III','782274125','',0,NULL,'Laguti HC III','ynatvEoBz7A','0000-00-00 00:00:00','0000-00-00 00:00:00'),(406,'Lalogi  H/C IV ','777328083','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(407,'Lamanober H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(408,'Langol H/C II','711771296','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(409,'Lapainat H/C III','777646767','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(410,'Laroo H/C III','783157225','',0,NULL,'Laroo HC III','elqHQKpMveQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(411,'Latoro H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(412,'Layibi Techo H/C III','782554660','',0,NULL,'Layibi Techo HC III','n8DIemz1Xoh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(413,'Lira  Kato H/C III (  Agago )','789914352','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(414,'Lira Medical Centre ','783463131','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(415,'Lira Palwo H/C III','777483084','',0,NULL,'Lira-Palwo HC III','aNM5X9P50rl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(416,'Lira R R Hospital','701652073','',0,NULL,'Lira REGIONAL REF HOSPITAL','cK5namCwmbW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(417,'Lobo  rom H/C III','782635594','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(418,'Lobule H/C III','773992252','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(419,'Lokung H/C III','775643537','',0,NULL,'Lokung HC III','MV2QkTgUIz1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(420,'Lorengedwat H/C III','774092392','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(421,'Lugole H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(422,'Lugore H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(423,'Lukole H/C III','772923667','',0,NULL,'Lukole HC III','RHk4V3ZlFbx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(424,'Lumino H/C III','774110673','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(425,'Luweero General Hospital','788047051','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(426,'Luwunga H/C III(1st Div Hospital)','788692649','',0,NULL,'Luwunga Barracks HC IV','LKxm4CmrYYh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(427,'Lwala Hospital ','755198300','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(428,'Lwamaggwa H/C III','774678765','',0,NULL,'Lwamaggwa Gvt HC III','oBg69iZLKtq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(429,'Lwangoli H/C III','774176589','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(430,'Lwankoni H/C III','704399155','',0,NULL,'Lwankoni HC III','FuOuXP2WFU8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(431,'Lwebitakuli H/C III','702966204','',0,NULL,'Lwebitakuli Gvt HC III','T7UcwZlbp1F','0000-00-00 00:00:00','0000-00-00 00:00:00'),(432,'Lwemiyaga H/C III','702663871','',0,NULL,'Lwemiyaga HC III','ioBktjTQgyS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(433,'Lwengo H/C IV','772434073','',0,NULL,'Lwengo HC IV','oFI3thMRN4h','0000-00-00 00:00:00','0000-00-00 00:00:00'),(434,'Lyantonde Hospital ','782319989','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(435,'Mabaale H/C III (kagadi)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(437,'Mabona H/C III','782866505','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(438,'Maddu H/C IV','706805773','',0,NULL,'Maddu HC IV','r7ugOoXi8F1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(439,'Madi Opei H/C IV ','774262576','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(440,'St Elizabeth H/C IV-Magale','771452797','',0,NULL,'Magale HC IV','adoijg0nE4u','0000-00-00 00:00:00','0000-00-00 00:00:00'),(441,'Mahyoro H/C III','779403403','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(443,'2nd DIV Military Hospital(Makenke)','782077202','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(444,'Makonge H/C III','785297473','',0,NULL,'Makonge HC III','BIiLhy7eYLl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(445,'Makukuulu H/C III','706411798','',0,NULL,'Makuukulu HC III','GUlztXJ4MRg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(446,'Malaba H/C III (Tororo)','701421427','',0,NULL,'Malaba HC III','F1z2KNSzz86','0000-00-00 00:00:00','0000-00-00 00:00:00'),(447,'Malera H/C III','772038867','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(448,'Malongo H/C III','752980622','',0,NULL,'Malongo HC III','ao6V9sOp2DA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(450,'Masafu Hospital','774610555','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(451,'Masaka R R Hospital','777832111','',0,NULL,'Masaka REGIONAL REF HOSPITAL','vX6kcAwvaS0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(452,'Masindi Hospital','784531512','',0,NULL,'Masindi Hospital','esxeUWbV3si','0000-00-00 00:00:00','0000-00-00 00:00:00'),(453,'Matany Hospital','783477077','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(454,'Mateete H/C III ','702806337','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(455,'Matuma H/C III','753814741','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(456,'Mayuge H/C III (Mayuge)','755758657','',0,NULL,'Mayuge HC III','qkq6TBG0tnA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(457,'Maziba H/C IV','785005857','',0,'65','Maziba Gvt HC IV','KlGGom62gxM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(458,'Mbaare H/C III','782878717','',0,NULL,'Mbaare HC III','aJlqk5guS44','0000-00-00 00:00:00','0000-00-00 00:00:00'),(459,'Mbale H/C II (Kyenjojo)','776823122','',0,NULL,'Mbale HC II','Dakg2qxUXlR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(460,'Mbale R R Hospital','703356181','',0,NULL,'Mbale REGIONAL REF HOSPITAL','HpJYuf9iyz2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(466,'Midigo H/C IV','754217120','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(467,'Mildmay Hospital Uganda ','701776096','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(468,'St Joseph\'s Minakulu H/C II (Omoro)','777048072','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(469,'Mitooma H/C IV','773393977','',0,NULL,'Mitooma HC IV','VNnrhdnpSHA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(470,'Mityana Hospital','774220741','',0,'14','Mityana Hospital','TjEiAVNTIFy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(471,'Rubaya H/C III (Mbarara)','701241770','',0,NULL,'Rubaya HC III','nx0UdNxBNIS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(472,'Moroto R R Hospital','759734243','',0,NULL,'Moroto Regional Refferal HOSPITAL','cK0jOJzBIvd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(473,'Morulem H/C III','781528287','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(474,'Moyo Hospital','0782469752','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(475,'Mpara H/C III','782663996','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(476,'Mparangasi H/C III','782593337','',0,NULL,'Mparangasi HC III','vHdz34TAaT3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(477,'Mparo H/C IV','782769421','',0,NULL,'Mparo HC IV','eJzlHnYHBcW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(478,'Mpigi H/C IV ','782350920','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(479,'Mpumudde H/C IV (Jinja)','752815738','',0,NULL,'Mpumudde HC IV','pAsdJsJETch','0000-00-00 00:00:00','0000-00-00 00:00:00'),(480,'Mubende R R Hospital ','754676881','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(481,'Mubende Rehabilitation Centre ','775405287','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(482,'Mucwini H/C III','713315241','',0,NULL,'Mucwini HC III','qKGMj34R5qZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(483,'Muduuma H/C III','706031304','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(484,'Mugusu H/C III','783482234','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(485,'Muhokya H/C III','774552460','',0,NULL,'Muhokya HC III','KuCGJjeYQS4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(486,'Muhwiju H/C III','782569339','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(487,'Mukathi H/C III','772823662','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(488,'Muko H/C IV ','775662135','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(489,'Mukono General Hospital','779256124','',0,NULL,'Mukono General Hospital','Q6qNTXu3yRx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(490,'Mukuju H/C IV','0702/0772456893','',0,NULL,'Mukuju HC IV','Txul6e5mI5M','0000-00-00 00:00:00','0000-00-00 00:00:00'),(492,'Mukura H/C III','704062016','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(494,'Mulanda H/C IV','782433120','',0,NULL,'Mulanda HC IV','ae5vXlawbYh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(495,'Murchison Bay Hospital ','703529428','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(496,'Musyenene H/C III','781409464','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(497,'St Francis Hospital (Mutolere)','702837989','',0,NULL,'Mutolere (St. Francis) HOSPITAL','O9Bfy1Rf33x','0000-00-00 00:00:00','0000-00-00 00:00:00'),(498,'Muyembe  H/C IV','782857543','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(499,'Mwera H/C IV','704536996','',0,NULL,'Mwera HC IV','SjGnJhWF7P7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(500,'Naam Okora H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(501,'Nabiganda H/C III','775797046','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(502,'Nabigasa H/C III','753196368','',0,NULL,'Nabigasa HC III','nEUuDrY5MWp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(503,'Nabilatuk H/C IV','782486566','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(504,'Naggalama Hospital ','782465300','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(505,'Naguru Police H/C IV','774154776,774887838','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(506,'Nakapiripirit Field Hospital','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(507,'Nakapiripirit H/C III','773713733','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(508,'Nakaseke  Hospital ','782163363','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(509,'Nakasongola Military Hospital ','706865209','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(510,'Dr Charlse Farthing Memorial Clinic','0703262797/077352694','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(511,'Nakivale H/C III','774234863','',0,'65','Nakivale HC III','lvbkNrwAFmE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(512,'Namakwekwe H/C III','779002615','',0,NULL,'Namakwekwe HC III','XJnDlwQcKju','0000-00-00 00:00:00','0000-00-00 00:00:00'),(513,'Namalu H/C III','782925904','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(514,'Namanyonyi H/C III','779968470','',0,NULL,'Namanyonyi HC III','XPlqjxDtXXO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(515,'Namasale H/C III','773742299','',0,NULL,'Namasale HC III','QhhZ8aHXOWM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(516,'Namawanga H/C III','787273406','',0,NULL,'Namawanga HC III','H21894K9xDD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(517,'Namayumba H/C IV','775379510','',0,'14','Namayumba HC IV','m2ROGumujet','0000-00-00 00:00:00','0000-00-00 00:00:00'),(518,'Nambale H/C III','773131980','',0,NULL,'Nambale HC III','tJVNDcI33wJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(519,'Nambieso H/C III','777568308','',0,NULL,'Nambieso HC III','ZgwhRJCKYcN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(520,'Namokora H/C IV','781099201','',0,NULL,'Naam Okora HC IV','iqr4dCf6xsU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(521,'Namugongo H/C III (kaliro)','782895562','',0,NULL,'Namugongo HC III','aNs3syyPTb1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(522,'Namungalwe H/C III','774021328','',0,NULL,'Namungalwe HC III','a8Qm23qwGwy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(523,'Holy Cross Orthodox (Namungoona) Hospital ','774450424','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(524,'Namutumba H/C  III (Namutumba)','700728077','',0,NULL,'Namutumba HC III','aeZGyZJvaEG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(525,'Namwendwa H/C IV','781430612','',0,NULL,'Namwendwa HC IV','zyI8GDUVYdE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(526,'Nankandulo H/C IV','773772209','',0,NULL,'Nankandulo HC IV','uPAnapLaFYh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(527,'Nankoma H/C IV','782767193','',0,NULL,'Nankoma HC IV','ygGN15RPkJR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(529,'Nawaikoke H/C III','774679588','',0,NULL,'Nawaikoke HC III','W8gbvIzhIuL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(531,'Nebbi Hospital ','772672761','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(532,'Ngai H/C III','774378411','',0,NULL,'Ngai HC III','cyWgf6Xmo8Z','0000-00-00 00:00:00','0000-00-00 00:00:00'),(533,'Ngando H/C III','774916493','',0,NULL,'Ngando HC III','lH80zq7z1Hg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(534,'Ngarama H/C III','703188986','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(535,'Ngetta H/C III','771406225','',0,NULL,'Ngetta HC III','OjPZpAx86iC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(536,'Ngoma H/C III (Ntungamo)','771606513','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(537,'Ngora Freda car Hospital (NGO)','777751164','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(538,'Ngurwe H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(539,'Nkokonjeru Hospital (Buikwe)','702291173','',0,NULL,'Nkokonjeru  HOSPITAL','aFxXtxwMU7f','0000-00-00 00:00:00','0000-00-00 00:00:00'),(540,'Nkozi Hospital ','781486244','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(541,'Nkuruba H/C  III','777640973','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(542,'Nsambya Hospital ','0757119752','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(543,'Nshungyezi H/C III','773260477','',0,'65','Nshungyezi HC III','RFWwEWMyoSD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(544,'Nsiika H/C IV','783388777','',0,NULL,'Nsiika HC IV','oFMf9UXgoOr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(545,'Nsinze H/C IV ','774023943','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(547,'Ntara H/C IV','787654289','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(549,'Ntungamo H/C IV','772626966','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(550,'Ntuusi H/C IV','702328641','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(551,'Ntwetwe H/C IV ','772434967','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(553,'Nyabbani H/C III','78365254','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(554,'Nyabirongo H/C III','781552142','',0,NULL,'Nyabirongo HC III','fIF70rtNGDv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(555,'Nyabugando H/C III','755995988','',0,NULL,'Nyabugando HC III','JbyNRdK814R','0000-00-00 00:00:00','0000-00-00 00:00:00'),(556,'Nyahuka H/C IV','777579391','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(557,'Nyakarongo  H/C   II','779775070','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(558,'Nyakibale Hospital','782061394','',0,'65','St. Karolii Lwanga Nyakibale HOSPITAL','N57ydf9ABlg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(559,'Nyakitunda H/C III','753059587','',0,'65','Nyakitunda HC III','iIx3m63SxVt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(560,'Nyakwae H/C III','392612587','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(561,'Nyakyera H/C III','779338969','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(562,'Nyamabuga H/C III','783887158','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(563,'Nyamarebe H/C III','706289046','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(564,'Nyamitanga H/C III','751644743','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(565,'Nyamuyanja H/C IV','753622521','',0,NULL,'Nyamuyanja HC IV','axKfX1OmCTn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(566,'Nyankwanzi H/C III','771447484','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(567,'','750718633','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(568,'Nyarubungo H/C III','774030609','',0,NULL,'Nyarubungo HC III','dZKfMZLWA5D','0000-00-00 00:00:00','0000-00-00 00:00:00'),(569,'Nyenga Hospital','752832172','',0,NULL,'St. Francis Nyenga HOSPITAL','Mlh3jcaJw9n','0000-00-00 00:00:00','0000-00-00 00:00:00'),(570,'Nyero H/C III','782225048','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(571,'Nyimbwa H/C IV','702145435','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(572,'Ochero H/C III','782146065','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(573,'Odek H/C III','777053335','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(574,'Ogili H/C III',' ','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(575,'Ogur H/C IV','776720330','',0,NULL,'Ogur HC IV','aRxadClWcFM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(576,'Okole H/C III','774690495','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(577,'Okwongo H/C III','782556798','',0,NULL,'Okwongo HC III','aqHWU5eZqU1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(578,'Oli H/C IV','772382131','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(579,'Olilim H/C III','782578681','',0,NULL,'Olilim HC III','G0lOXzOa53Q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(581,'Omiya Anyima H/C III','757111305','',0,NULL,'Omiya Anyima HC III','MObVMkBVjki','0000-00-00 00:00:00','0000-00-00 00:00:00'),(582,'Omoro H/C III (Alebtong)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(583,'Omugo H/C IV','790156980','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(584,'Ongako H/C III','772939754','',0,NULL,'Ongako HC III','du8F23WZLMw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(585,'Ongica H/C III','774752244','',0,NULL,'Ongica HC III','aD1S6DBzHJV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(586,'Ongino H/C III','753760027','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(588,'Orapwoyo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(589,'Oriajin Hospital','718218901','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(590,'Oroko H/C II','774593194','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(591,'Orom H/C III','754315651','',0,NULL,'Orom HC III','auzlyXb92mq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(592,'Orum H/C IV','777053544','',0,NULL,'Orum HC IV','FtmVm4r1H3a','0000-00-00 00:00:00','0000-00-00 00:00:00'),(593,'Orwamuge H/C III','774469277','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(594,'Otong H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(595,'Otwal H/C III','774604019','',0,NULL,'Otwal HC III','taeUtmBHKTF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(596,'Owek Lakim H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(597,'Owiny H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(598,'Pabbo H/C III (Amuru Govt)','772033221','',0,NULL,'Pabbo (Govt) HC III','rYNfPnt4Wko','0000-00-00 00:00:00','0000-00-00 00:00:00'),(599,'Pabwo H/C III (Gulu)','777645760','',0,NULL,'Pabwo HC III','WleyUUQfJK6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(600,'Pader H/C III','0777003811','',0,NULL,'Pader HC III','EsyH7yKQHiP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(601,'Padibe H/C IV','781399224','',0,NULL,'Padibe HC IV','H026HbOAZFN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(602,'Padre Pio H/C III','777360407','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(603,'Lira PAG Mission Hospital H/C IV','777073408','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(604,'Paibona H/C II','772355467','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(605,'Paicho H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(606,'Paimol H/C III','756197662','',0,NULL,'Paimol HC III','RM8vegpr7j7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(607,'Pajimo Military H/C III','783774436','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(608,'Pajule H/C  IV ','0782973754','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(609,'Palabek  Gem H/C III','774640138','',0,NULL,'Palabek-Gem HC III','aNW8E8PWwck','0000-00-00 00:00:00','0000-00-00 00:00:00'),(610,'Palabek Ogili H/C III','775989446','',0,NULL,'Palabek Ogili HC III','lmi2JiLawTV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(611,'Palabek-Kal H/C III','774612100','',0,NULL,'Palabek-Kal HC III','VLi163AL9A0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(612,'Palenga H/C II','772184331','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(613,'Pallisa Town Council H/C III','782518096','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(614,'Pallisa General Hospital ','782642627','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(615,'Paloga H/C III','782449096','',0,NULL,'Paloga HC III','aod4x8edzQu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(616,'Paraa H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(617,'Patiko H/C III','712390584','',0,NULL,'Patiko HC III','T5RAXrLQCD6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(618,'Patongo H/C III','772923667','',0,NULL,'Patongo HC III','oUcwyNtRzrb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(619,'Pawel H/C II','715557557','',0,NULL,'Pawel HC II','mNeUlm3SpRz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(620,'PIDC (Baylor-Mulago)','782012948','',0,NULL,'Mulago National Hospital-PIDC COE Ward 1','WuohOAlguVz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(621,'Pingire H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(622,'Pogo H/C II','718756866','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(623,'Porogali H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(624,'Pugwinyi H/C II','777364439','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(625,'Punena H/C III','782573933','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(626,'Purongo H/C III','77578230','',0,NULL,'Purongo HC III','fZ4QbeGxt8t','0000-00-00 00:00:00','0000-00-00 00:00:00'),(628,'Rakai Health Sciences Program','782685412','',0,NULL,'Rakai Health Sciences Program CLINIC','aqqJXIn2j84','0000-00-00 00:00:00','0000-00-00 00:00:00'),(629,'Rakai Hospital','782532085','',0,NULL,'Rakai Hospital','axNgLDj6B5Q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(630,'Rapha Medical Centre','774947921','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(631,'Rhino Camp H/C IV','773072013','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(632,'Rubaare H/C IV','705221137','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(633,'Lubaga Hospital','','',0,'4','Lubaga Hospital','dgmy0Fjx1KZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(634,'Rubaya H/C IV (Kabale)','778826036','',0,NULL,'Rubaya   HC IV','oWTRZJbQxha','0000-00-00 00:00:00','0000-00-00 00:00:00'),(635,'Rubongi Military Hospital','772440195','',0,NULL,'Rubongi Military HOSPITAL','ZVwFNyBsJxz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(636,'Rubuguri H/C IV','778280024','',0,NULL,'Rubuguri HC IV','GTtwaqeomFa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(637,'Rugaaga H/C IV','705012059','',0,NULL,'Rugaaga HC IV','aHuJWP6FfFo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(638,'Rugarama Hospital','','',0,NULL,'Rugarama Hospital','Z6BzVrxa9xd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(639,'Rugazi H/C IV','788772011','',0,NULL,'Rugazi HC IV','VvGZi1LcYyP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(640,'Ruhaama H/C III','785369350','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(641,'Ruhiira H/C III','776384538','',0,NULL,'Ruhiira HC III','aqpJDW5rDvU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(642,'Ruhija H/C III','773450360','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(643,'Ruhinda H/C III','773947209','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(644,'Ruhoko H/C IV','782842624','',0,NULL,'Ruhoko HC IV','QLP6OdRGJsz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(645,'Rukiri H/C III','783013988','',0,NULL,'Rukiri HC III','waacA54DZjH','0000-00-00 00:00:00','0000-00-00 00:00:00'),(646,'Rukoni H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(648,'Rukungiri H/C IV','775979607','',0,NULL,'Rukungiri HC IV','amaqHI7PUL2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(649,'Rukunyu General Hospital','0786083041','',0,'6','Rukunyu General Hospital','HXap310Pwnz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(650,'Rushere Community Hospital','704876202','',0,NULL,'Rushere Community Hospital','rrjDjA0JfXN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(651,'Rushooka H/C II','702257762','',0,'65','St. Mother Francisca Lechner Rushooka HC','y1S7Kh163t9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(652,'Ruteete H/C III','772912839','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(653,'Rwaitengya H/C II','777741707','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(654,'Rwakabengo H/C III','703451064','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(655,'Rwamwanja H/C III','777244786','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(656,'Rwashamaire H/C IV','772654754','',0,'65','Rwashamaire HC IV','CSpqU3MIZuC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(657,'Rwebisengo H/C III','779780301','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(658,'Rweikiniro H/C III','781711510','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(659,'Rwekubo H/C IV','782526859','',0,'65','Rwekubo HC IV','XWqf7PB1OaR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(660,'Rwemikoma H/C III','775578669','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(661,'Rwenkobwa H/C III','754294972','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(662,'Rwenyawawa H/C III','777316225','',0,NULL,'Rwenyawawa HC III','Y7XKVrGNA6d','0000-00-00 00:00:00','0000-00-00 00:00:00'),(663,'Rwesande H/C IV ','7048396118','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(665,'Rwibaale H/C II','753503776','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(666,'Rwimi H/C III','772329079','',0,'6','Rwimi HC III','aHXEy4fCaPw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(667,'Saidinah Abubaker Hospital','701163363','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(668,'Seeta Nazigo H/C III','782796891','',0,NULL,'Seeta-Nazigo HC III','qmgb0UXgPfs','0000-00-00 00:00:00','0000-00-00 00:00:00'),(669,'Ssembabule H/C IV','782310690','',0,NULL,'Ssembabule HC IV','SYB67Y2wfuD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(670,'Serere H/C IV','702194595','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(671,'Shuku H/C IV','782404266','',0,NULL,'Shuuku HC IV','x5X8VtL2T0e','0000-00-00 00:00:00','0000-00-00 00:00:00'),(672,'Siipi H/C III','784895000','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(673,'Sironko H/C III','775009313','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(674,'Soroti R R Hospital','772686962','',0,NULL,'Soroti REGIONAL REF HOSPITAL','Nnms2rd2gpC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(675,'SOS CU H/C II GULU','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(676,'St Adolf H/C III (Butiiti)','783867300','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(677,'St Balikuddembe Market/Uganda Cares  AHF','0704220598/078928808','',0,'4','St. Balikudembe- Kitwe HC II','achnrImSgWR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(678,'St Clare Orungo H/C III','782715724','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(679,'St Joseph Hospital  Kitgum ','0782635422','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(681,'St Pauls H/C IV','775196986','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(682,'St Peter and Paul H/C III','789012339','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(683,'St Pius Kidepo Rupa H/C III','77290377','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(684,'St Stephens Disp & Maternity Center (Luzira)','701245886','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(685,'TASO Gulu ','783210962','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(686,'TASO Jinja','704530620','',0,NULL,'TASO Jinja CLINIC','zK4jOLmfhz9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(687,'TASO Masaka','772933800','',0,NULL,'TASO Masaka CLINIC','ZO1Hltpt3Ko','0000-00-00 00:00:00','0000-00-00 00:00:00'),(688,'TASO Masindi ','774713910','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(689,'TASO Mbale','704312235','',0,NULL,'TASO Mbale Clinic','a929G14p47c','0000-00-00 00:00:00','0000-00-00 00:00:00'),(690,'TASO Mbarara','782361466','',0,'65','TASO Mbarara CLINIC','k4AuRrsUWCi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(691,'TASO Mulago ','782602176','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(692,'TASO Rukungiri','772893531','',0,'65','TASO Rukungiri HC II','yNzhd0wG9MO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(693,'TASO Soroti','706918133','',0,NULL,'TASO Soroti CLINIC','p0fJEq6m1ew','0000-00-00 00:00:00','0000-00-00 00:00:00'),(694,'TASO Tororo','702965377','',0,NULL,'TASO Tororo  CLINIC','CQqWk34vLNB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(695,'Teboke H/C III','','',0,NULL,'Teboke (Gvt) HC III','hVamgpmtonX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(696,'Tokora H/C IV','774073626','',0,NULL,'Tokora HC IV','oLPpU9BQsKF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(697,'Toro  Kahuna H/C III','779500352','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(698,'Tororo District Hospital ','774560551','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(699,'Tubur H/C III','782732576','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(700,'Umor H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(701,'Unyama H/C II','772437255','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(702,'Villa Maria Hospital','783978800','',0,NULL,'Villa Maria Hospital','NTlPENoySCQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(703,'Virika Hospital','783766916','',0,'6','Virika Hospital','uiLzeURGsDn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(704,'Wabulungu H/C III','787586608','',0,NULL,'Wabulungu HC III','u5jXNGfi96o','0000-00-00 00:00:00','0000-00-00 00:00:00'),(705,'Wakiso H/C IV','774549827','',0,'14','Wakiso HC IV','UTcf3vkubN9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(706,'Walukuba H/C IV ','782815424','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(707,'Western Division H/C III','773712033','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(708,'Wino H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(709,'Wol H/C III','777223186','',0,NULL,'Wol HC III','qOIHRAbHyeu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(711,'Yerya H/C III','777742888','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(712,'Yumbe Hospital','752101452','',0,NULL,'Yumbe Hospital','MUxAV5pwDbk','0000-00-00 00:00:00','0000-00-00 00:00:00'),(713,'Kitaasa H/C III','772366861','',0,NULL,'St. Mechtilda Kitaasa HC III','agQsp6hFdZa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(714,'Luyitaayita H/C III (NGO)','772820376','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(715,'Bigasa H/C III','7828503605','',0,NULL,'Bigasa HC III','HW6fE9RYBjI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(716,'Kabigi H/C III','753703374','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(717,'Nampunge Church of God H/C III','774532736','',0,NULL,'Nampunge HC II','O3FdvltAUSh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(720,'Kyeizooba H/C III','779664167','',0,'65','Kyeizooba HC III','aL6mherCqRW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(721,'St Marys MNH Bukomansimbi','773068022','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(722,'Mpunge H/C III (Mukono)','782683345','',0,NULL,'Mpunge HC III','QROYnp0n7wL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(723,'Koome H/C III','772039195','',0,NULL,'Koome HC III','fkASUL2GNdM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(724,'Kitabaazi H/C II','77243334','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(725,'Akilok H/C II','753522022','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(726,'Naama H/C III','702182998','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(727,'St Luke KMD-Kiyinda  H/C III (Mityana)','779112037','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(728,'Rengen H/C III','0777442444','',0,NULL,'Rengen HC III','NWVYfI4QaPR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(729,'Nagojje H/C III','773414353','',0,NULL,'Nagojje HC III','VSGCAKuW01y','0000-00-00 00:00:00','0000-00-00 00:00:00'),(730,'Nabweru H/C III','782560764','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(731,'Epi Centre H/C II (Wakiso)','0772484488','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(732,'Nabutiti H/C III','','',0,NULL,'Nabutiti HC III','as4V8saM5sc','0000-00-00 00:00:00','0000-00-00 00:00:00'),(733,'Nakawuka H/C III','772407852','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(734,'Kasanje H/C III','','',0,NULL,'Kasanje HC III','srSDFLCcrSi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(735,'Nsangi H/C III','783195419','',0,'14','Nsangi HC III','aFlGqyWRQfr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(736,'Namulonge H/C III','772552703','',0,NULL,'Namulonge HC III','XvZPDBgzWFf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(738,'Kawanda H/C III','712934537','',0,NULL,'Kawanda HC III','avZWtMODscD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(739,'Koboko Mission H/C III','774246529','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(740,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(741,'Ludara H/C III','783757722','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(742,'St Gabriel Mirembe Maria H/C III','781013509','',0,NULL,'Mirembe Maria HC III','vh8cOiWZOv9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(743,'Buwama H/C III','702121442','',0,NULL,'Buwama HC III','Vi3ibjRtMzU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(744,'Kabushaho H/C III','773562236','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(745,'Jinja Central H/C III','785207777','',0,NULL,'Jinja Central HC III','JMmqH0e4HlX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(746,'Gweng-coo H/C II','782635594','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(747,'Mjap (Iss Clinic) Mulago','703628445','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(748,'Ssekanyonyi H/C IV','775289350','',0,NULL,'Ssekanyonyi HC IV','aFuRtjSdg4X','0000-00-00 00:00:00','0000-00-00 00:00:00'),(749,'Nabalanga H/C III','772557616','',0,NULL,'Nabalanga HC III','sqQsFNhXH9W','0000-00-00 00:00:00','0000-00-00 00:00:00'),(752,'International Hospital Kampala','785194134','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(753,'Kitenga H/C III (Mubende)','750800141','',0,NULL,'Kitenga  HC III','QBPWzy66HiY','0000-00-00 00:00:00','0000-00-00 00:00:00'),(754,'Goli H/C III (Nebbi)','774274219','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(755,'Namuganga H/C III','782863847','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(756,'St Luke Namaliga H/C III','772188398','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(757,'Kyabazaala H/C III','752580986','',0,NULL,'Kyabazaala HC III','a6p3dWy4ce7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(758,'Mpumudde H/C III (Lyantonde)','757380166','',0,NULL,'Mpumudde HC III','A8vURIvnH87','0000-00-00 00:00:00','0000-00-00 00:00:00'),(759,'Takajjunge H/C II','781314021','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(761,'Kijomoro H/C III','777443805','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(762,'Nakasongola H/C IV','772664388','',0,NULL,'Nakasongola HC IV','h2oF7upS6k9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(763,'Ngom-oromo H/C II','783774860','',0,NULL,'Mgomoromo/Ngomoroma HC II','ahIE2es9s39','0000-00-00 00:00:00','0000-00-00 00:00:00'),(764,'Nazigo H/C III','776269130','',0,NULL,'Nazigo HC III','Y7AAzZu1IrM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(765,'Lyantonde Muslim H/C III','774674746','',0,NULL,'Lyantonde Muslim HC III','RYMEkOh45MP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(766,'Katoogo H/C III','772572333','',0,NULL,'Katoogo HC III','axNVMZcgPLU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(767,'Pakwach H/C IV','772877585','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(768,'Iganga Islamic Medical Center','782705365','',0,NULL,'Iganga Islamic Medical Center','aElqyBOYxsd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(769,'Nyendo H/C II','754848432','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(770,'Mpenja H/C III','782700305','',0,NULL,'Mpenja HC III','CcCjT4HFRuy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(771,'Dwoli H/C III','773398844','',0,'4','Dwooli HC III','aPr9XQM36Dn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(772,'Komamboga H/C III','0701387607/ 07024966','',0,'4','Komamboga HC III','TT8I4Fy4d5r','0000-00-00 00:00:00','0000-00-00 00:00:00'),(773,'Kisugu H/C III','783215551','',0,'4','Kisugu HC III','aKmx8C5qUZ8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(774,'Masaka Municipal Council H/C II','777832111','',0,NULL,'Masaka Mun. Council HCII','fBndBN2WUYM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(775,'Butagaya H/C III','75293710','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(776,'Busedde H/C III','753312049/0758538899','',0,NULL,'Busedde HC III','t5UJ7lyEPo3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(777,'Kaliro H/C III (Lyantonde)','782030841','',0,NULL,'Kaliiro HC III','MsrKKJaEXiV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(778,'Kisiita H/C III','784290690','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(779,'Busembatia H/C III','772065683','',0,NULL,'Busembatia HC III','RWICuGNoE6b','0000-00-00 00:00:00','0000-00-00 00:00:00'),(780,'Panyimur H/C III','753772872','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(781,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(782,'Kisenyi H/C IV (Kampala)','774441466','',0,'4','Kisenyi HC III','hjZvWkoLzzp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(784,'Osukuru H/C III','785269965','',0,NULL,'Osukuru HC III','z5H8YZiBOtr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(785,'Achol Pii Millitary H/C IV','783949134','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(786,'Njeru T/C H/C III','773473526','',0,NULL,'Njeru T.C HC III','OiuyBahpmGI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(787,'Mpugwe H/C III','702929961','',0,NULL,'Mpugwe HC III','RvVYLDPIzPb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(788,'Entebbe Hospital MCH General','772493489','',0,'14','Entebbe HOSPITAL','yApOnywci25','0000-00-00 00:00:00','0000-00-00 00:00:00'),(789,'Maanyi H/C III','701959174','',0,NULL,'Maanyi HC III','tKfAzzZrSC7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(790,'Malangala H/C III','782895329','',0,NULL,'Malangala HC III','qrvgF3UwZzS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(792,'Ikumbya H/C III (Luuka)','782949756','',0,NULL,'Ikumbya HC III','Hw81fhqydaB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(793,'Kitokolo H/C II','775499582','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(794,'Paidha H/C III','782228980','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(795,'Zeu H/C III','772913196','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(796,'Lwamata H/C III','779136350','',0,NULL,'Lwamata HC III','mNMqG0YEffI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(797,'St Agatha Lwebitakuli','783930972','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(798,'Lulyambuzi H/C III','781556754','',0,NULL,'Lulyambuzi HC III','Tb7BdBuiIn8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(800,'Wakisi H/C III','753718182','',0,NULL,'Wakisi HC III','an1CZjQ65h7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(801,'Mifumi H/C III','775458376','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(802,'Budini H/C III','782322010','',0,NULL,'Budini HC III','EYPlRLvDGxp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(803,'Nkondo H/C III','754605455','',0,NULL,'Nkondo HC III','x3sV3Vm3jFW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(804,'Namasagali H/C III','753531227','',0,NULL,'Namasagali HC III','xXyZHTAldd9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(805,'Iganga Town Council H/C III','773233235','',0,NULL,'Iganga Town Council HC III','M6qnxgpeCA4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(806,'Kitayunjwa H/C III','751674285','',0,NULL,'Kitayunjwa HC III','UhQMDsDfW85','0000-00-00 00:00:00','0000-00-00 00:00:00'),(807,'Bukonte H/C III','781447699','',0,NULL,'Bukonte HC II','aPCo8FVyXXJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(808,'Banda H/C III (Namayingo)','773497924','',0,NULL,'Banda HC III','eAfaPMGjisn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(809,'Buluya H/C II','758834530','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(810,'Bulopa H/C III','773546040','',0,NULL,'Bulopa HC III','gNdlN0CmZX2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(811,'Nakalama H/C III','712812079','',0,NULL,'Nakalama HC III','ixwFzMD6GcM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(812,'Buluguyi H/C III','','',0,NULL,'Buluguyi HC III','YbtIUFv6PHM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(813,'Bumooli H/C III','773861703','',0,NULL,'Bumooli HC III','aspYcErPY7F','0000-00-00 00:00:00','0000-00-00 00:00:00'),(814,'Balawoli H/C III','754670380','',0,NULL,'Balawoli HC III','X0BZOCXmDkj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(816,'Muterere H/C III','774838862','',0,NULL,'Muterere HC III','RVFMEGRSxTl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(817,'Mayuge H/C III (Bugiri)','782279196','',0,NULL,'Bugiri Mayuge HC III GOVT','bV0ljliUSvK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(818,'Nabisoigi H/C III','777265464','',0,NULL,'Nabisoigi HC III','MMhakCx4Zy7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(819,'Mbulamuti H/C III','775816902','',0,NULL,'Mbulamuti HC III','aU7ebDxE9vM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(820,'Bulidha H/C III','781471217','',0,NULL,'Bulidha HC III','KPoshqPMs2y','0000-00-00 00:00:00','0000-00-00 00:00:00'),(821,'Bupadhengo H/C III','782301791','',0,NULL,'Bupadhengo HC III','ECSAxXG3JMh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(822,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(823,'Kitongo H/C III (Mityana)','773825884','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(824,'Nabingoola H/C III','782808427','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(825,'Kazinga H/C III (Kyegegwa)','774163674','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(826,'Kasule H/C III','774445743','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(827,'Kabiira H/C III (Bushenyi)','751422089','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(828,'Kapelebyong H/C IV','783140399','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(829,'Kasawo H/C III','772546203','',0,NULL,'Kasawo HC III','zbDMSGLsc1J','0000-00-00 00:00:00','0000-00-00 00:00:00'),(830,'Bardege H/C III','779116765','',0,NULL,'Bar-dege HC III','aKP6B0Z5nbZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(831,'Buyende H/C III','779224881','',0,NULL,'Buyende HC III','a6qaoH2Xzb1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(832,'Irundu H/C III','784481556','',0,NULL,'Irundu HC III','GRE9Qa05dRS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(833,'Nabukalu H/C III','773236228','',0,NULL,'Nabukalu HC III','txcjTxewsdC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(834,'Gadumire H/C III','779052792','',0,NULL,'Gadumire HC III','Jh6Ds2pV5vS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(835,'Magada H/C III','756004366','',0,NULL,'Magada HC III','bfvn50ACB0b','0000-00-00 00:00:00','0000-00-00 00:00:00'),(836,'Makuutu H/C III','782087299','',0,NULL,'Makuutu HC III','SL6MqJXGcbv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(837,'Wii Anaka H/C II','779997003','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(838,'KIU Teaching Hospital','705764883','',0,NULL,'KIU Teaching Hospital','sMYprHm7m3K','0000-00-00 00:00:00','0000-00-00 00:00:00'),(839,'Buwaata H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(840,'Kinuuka H/C III','782319989','',0,NULL,'Kinuuka  HC III','n5xUbellHaN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(841,'Nabirumba H/C III','776938773','',0,NULL,'Nabirumba HC III','BXdPG3XpRk8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(842,'Sigulu H/C III','','',0,NULL,'Sigulu  HC III','AB05Zdfd4KF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(843,'Eria H/C III','772329509','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(844,'Bugondo H/C III','777053637','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(845,'Kyampisi H/C III','752822247','',0,NULL,'Kyampisi HC III','gQ7xBJtwsF3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(846,'Asuret H/C III','782240420','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(847,'Kasambya H/C IV (Mubende)','776747526','',0,'14','Mubende Kasambya HC III GOVT','asPYa4kd1vo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(848,'Kimuli H/C III','754448895','',0,NULL,'Kimuli HC III','akLIpF5HNjE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(849,'Oleba H/C III','775698811','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(850,'Ayago H/C III (Lira)','774093016','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(851,'Bussi H/C III','782589306','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(852,'Namwiwa H/C III','779647294','',0,NULL,'Namwiwa HC III','tcaAIOTzAjy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(853,'Kyaterekera H/C III (Kagadi)','774080859','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(854,'St Janani H/C II','781404053','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(855,'St Ambrose Charity H/C III','774178100','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(856,'Kasagama H/C III','782392496','',0,NULL,'Kasagama HC III','jX2AtJy4xmQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(857,'Usuk H/C III','774160844','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(858,'Bulamagi H/C III','779601010','',0,NULL,'Bulamagi HC III','Hx3bgntGfm7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(859,'Bugaya H/C III (Buvuma)','776562714','',0,NULL,'Bugaya HC III ( Buvuma )','aVeE8JrylXn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(860,'Katabi H/C III','772668793','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(861,'Kango H/C III','783752350','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(862,'Butaga H/C III','789602504','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(863,'Madudu H/C III','704701360','',0,NULL,'Madudu HC III','Y5ighgzxrUT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(864,'Ndejje H/C IV (Wakiso)','752613587','',0,'14','Ndejje HC IV','aNt5WiVHx4G','0000-00-00 00:00:00','0000-00-00 00:00:00'),(865,'Kabamba H/C III','702006222','',0,NULL,'Kabamba/Kabamba Barracks HC III','feHZtyy5zKn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(866,'Lodonga H/C III','774815291','',0,NULL,'Lodonga HC III','P5GTK5hmugt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(867,'Ttikalu H/C III','782375250','',0,NULL,'Ttikalu HC III','l8JCkd3nqOV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(868,'Kochi H/C III','784373144','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(869,'Ayipe H/C III','773994110','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(870,'Nakasojjo H/C II','779214576','',0,NULL,'Nakasojjo HC II','Hv485zI15KB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(871,'Ssunga H/C III','779516892','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(872,'Kyehoro H/C II','774089364','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(873,'Kibanda H/C III (Rakai)','778271344','',0,NULL,'Kibanda HC III','GbWR7VCRA6Y','0000-00-00 00:00:00','0000-00-00 00:00:00'),(874,'Adumi H/C IV','772347268','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(875,'Kabanga H/C III','782971648','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(876,'Ngogwe H/C III','751230267','',0,NULL,'Ngogwe HC III','qdW8M8091gP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(877,'Bulesa H/C III','787528852','',0,NULL,'Bulesa HC III','xbM4diuk1dB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(878,'Buredo H/C III','751273991','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(879,'Kifamba H/C III (Rakai)','782272354','',0,NULL,'Kifamba HC III','oHu9DJNgKaV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(880,'Goma H/C III','782923738','',0,NULL,'Goma HC III','NB0Ww6f0PiX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(881,'Musozi H/C III','755097869','',0,NULL,'Musozi HC III','MlMuBEoqA9y','0000-00-00 00:00:00','0000-00-00 00:00:00'),(882,'Okidi H/C III','775634031','',0,NULL,'Okidi HC III','MxcpmhA0rrA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(883,'Nawandala H/C III','','',0,NULL,'Nawandala HC III','hA4k0l8StRh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(884,'Mutumba H/C III','776663877','',0,NULL,'Mutumba HC III','MAH7X3G7Bfi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(885,'Buwunga H/C III (Masaka)','706308207','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(886,'Bugulumbya H/C III','783907440','',0,NULL,'Bugulumbya HC III','Pm7k3OLfbXA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(887,'Lubira H/C III','783288553','',0,NULL,'Lubira HC III','NZmcEUkHQPs','0000-00-00 00:00:00','0000-00-00 00:00:00'),(888,'St Matia Mulumba H/C III (Namayingo)','785041846','',0,NULL,'Buswale St. Matia HC III','ayBh8ous7GK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(889,'Archdicondary H/C II','776355535','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(890,'Bbaale H/C IV','774868071','',0,NULL,'Bbaale HC IV','ptIo7ouXsPw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(892,'Newlife H/C III','782171097','',0,NULL,'New Life Health Centre HC II','v6eIpzse4SO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(894,'Budima H/C III','783665019','',0,NULL,'Budiima HC III','CfUwC7rnAVI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(895,'Lukolo H/C III','756358648','',0,NULL,'Lukolo HC III','NRHnL9b4KGT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(897,'Nsozi H/C III','773627721','',0,NULL,'Nsozi HC III','dGIRbXEYTuQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(898,'Kiyuni H/C III (Mubende)','705068525','',0,NULL,'Mubende Kiyuni HC III GOVT','BuBhkTtnfuE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(899,'Lwampanga H/C III','774630725','',0,NULL,'Lwampanga HC III','werOrHbzh72','0000-00-00 00:00:00','0000-00-00 00:00:00'),(900,'Kyanamugera H/C II','753261909','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(901,'Kabule H/C III','0775337911/077445881','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(902,'Paragon Hospital','772688100','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(903,'Kanoni H/C III (Gomba)','774112997','',0,NULL,'Gomba Kanoni HC III GOVT','XsLMulDu2aw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(904,'Uganda Reproductive Health Bureau','782671620','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(905,'Iwemba H/C III','','',0,NULL,'Iwemba HC III','rlXW6WfCgAp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(906,'Kifampa H/C III (Gomba)','755623835','',0,NULL,'Kifampa HC III','gMSnZfci97x','0000-00-00 00:00:00','0000-00-00 00:00:00'),(907,'Buwagajjo H/C III','773442061','',0,NULL,'Buwagajjo HC III','imFgSY3OUvZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(908,'Nakayonza H/C III','775144458','',0,NULL,'Nakayonza HC III','R2Cl01FXyrt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(909,'Busabaga H/C III','751946283','',0,NULL,'Busabaga HC III','analluLubfV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(910,'Atiriri H/C IV','774206049','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(911,'Yumbe H/C III','756410530','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(912,'Bumwoni H/C III','784953327','',0,NULL,'Bumwoni HC III','CIVkMjSRVBX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(913,'Kateta H/C III','0779736173','',0,NULL,'Kateta Gvt HC III','TawGPygknTa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(914,'Atiira H/C III','0782892780','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(915,'Reproductive Health Uganda (Apac)','774014164','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(916,'Kyamulibwa H/C III','789641470','',0,NULL,'Kyamulibwa Gvt HC III','mgr6AHrRokx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(918,'Eastern Division H/C III','774574117','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(919,'Ngora Maternity Unit H/C III','774610030','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(921,'Kigulu H/C II','712211325','',0,NULL,'Kigulu HC II','nATS7pzO63j','0000-00-00 00:00:00','0000-00-00 00:00:00'),(922,'Kigungu H/C III','774013068','',0,NULL,'Kigungu HC III','MeFxWKBORKq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(923,'Lorengechora H/C III','773902104','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(924,'Mungula H/C IV','773244301','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(925,'Iriiri H/C III','772506949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(926,'Atoot H/C II','782983154','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(927,'Najjembe H/C III','7835801413','',0,NULL,'Najjembe HC III','PwgfpQbQXTQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(928,'Lugasa H/C III','774485472','',0,NULL,'Lugasa HC III','AvO7fMz294Z','0000-00-00 00:00:00','0000-00-00 00:00:00'),(929,'Kacheri H/C III','0773714808','',0,NULL,'Kacheri  HC III','IW60hf7XNQ4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(930,'Princess Diana H/C IV','784479487','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(931,'Odupi H/C III','774084117','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(932,'Buwabwala H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(933,'Bubutu H/C III','752521809','',0,NULL,'Bubutu HC III','aCZRqIkW8s5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(934,'Jinja Islamic H/C','712561446','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(935,'Bulondo H/C III','775618386','',0,NULL,'Bulondo HC III','lAyJuyzL2Oj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(936,'Singila H/C II','782674946','',0,NULL,'Singila HC II','AgA6LVX4MQQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(937,'Banda H/C II (Wakiso)','782646535','',0,NULL,'Wakiso Banda HC II GOVT','aV1BxN0b2cm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(938,'Irongo H/C III','713821945','',0,NULL,'Irongo HC III','DHRgoZsi4Mx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(939,'Kandege H/C II','784759501','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(940,'Butansi H/C III','','',0,NULL,'Butansi HC III','nWJKeP8N21c','0000-00-00 00:00:00','0000-00-00 00:00:00'),(941,'Nkooko H/C III','773467769','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(942,'Logiri H/C III','777443762','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(943,'Nabitsikiti H/C III','777262244','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(944,'Wadra H/C III','791866200','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(945,'Nagongera H/C IV','774353014','',0,NULL,'Nagongera HC IV','aQPRjLfrzRx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(946,'Mayirye H/C III','779109003','',0,NULL,'Mayirye (Arch Bishop Kiwanuka) HC III','MGoloBUb8vi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(948,'Kalaki H/C III','778216995','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(949,'Bamugolodde H/C III','775155336','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(950,'Abarilela H/C III','775349900','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(951,'Kyamulibwa H/C IV','787195832','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(954,'Bumbo H/C III','776123889','',0,NULL,'Bumbo HC III','uiIUQsgVTAj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(955,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(956,'Wadelai H/C III','773363951','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(957,'Tara H/C III','777455851','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(958,'Busamuzi H/C III','776533001','',0,NULL,'Busamuzi HC III','afzGq7RpOTl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(959,'Bulo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(960,'Nakitoma H/C III','775751508','',0,NULL,'Nakitoma HC III','ixo6xmc8VE9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(961,'Nsawo H/C III','772186149','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(962,'Kakaire H/C III','773009580','',0,NULL,'Kakaire HC III','cDySnTOLPKt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(963,'Wakitaka H/C III','774681260','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(964,'Buwenge General Hospital','774174781','',0,NULL,'Buwenge General Hospital','XiavvWaLLRz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(965,'Hukeseho H/C III','778094200','',0,NULL,'Hukeseho HC III','a4qvKbfSybp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(966,'Bugiri Town Council H/C II','782119856','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(967,'Tongolo H/C II','777674963','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(968,'Buikwe H/C III','779313239','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(969,'Chawente H/C III','774164916','',0,NULL,'Chawente HC III','tvw7mudvx3r','0000-00-00 00:00:00','0000-00-00 00:00:00'),(970,'Kadungulu H/C III','0776602484','',0,NULL,'Kadungulu HC III','FuXspRGeawu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(971,'Kawaala H/C III','777425862','',0,'4','Kawaala Health Centre HC III','wepUthscBkh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(972,'Ggolo H/C III','779203475','',0,NULL,'Ggolo HC III','NHQdOv9RFcN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(973,'Dufile H/C III','785920582','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(974,'Makindu H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(975,'Bukoova H/C III','79486623','',0,NULL,'Bukoova HC III','d6cSq5xJr84','0000-00-00 00:00:00','0000-00-00 00:00:00'),(976,'Kakooge H/C III(Nakasongola)','78449090','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(977,'Kei H/C III','773297077','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(978,'Oluvu H/C III','782850030','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(979,'Omiito H/C II','783108793','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(980,'Kyalulangira H/C III','782354936','',0,NULL,'Kyalulangira HC III','hBhHjc3o6Fa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(981,'Kimengo H/C III','783450600','',0,NULL,'Kimengo HC III','u9ESrcugDMJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(982,'Hapuuyo H/C III','776062974','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(983,'Iyolwa H/C III','782086004','',0,NULL,'Iyolwa HC III','XJMwYIWSmOO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(984,'Kazwama H/C II','782585897','',0,NULL,'Kazwama HC II','hwNTd8tjyyR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(985,'Kyato H/C II','788055915','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(987,'Kabale H/C III (Hoima)','774968571','',0,'4','Kabaale HC III','SuNPmvsGklv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(988,'Wera H/C III  ST MICHAEL ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(989,'Bubangizi H/C III','773338112','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(990,'Nyakatsiro H/C III','775209767','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(991,'Metha Hospital','752645220','',0,NULL,'Lugazi Scoul HOSPITAL','achC82olIo9','0000-00-00 00:00:00','0000-00-00 00:00:00'),(992,'Bishop Ceaser Asili Hospital','788689839','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(993,'Lefori H/C III','782929122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(994,'Bukakata H/C III','703842081','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(995,'Ngora H/C IV','785668142','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(996,'Semuto H/C IV','787499257','',0,NULL,'Semuto HC IV','zPvmdjd3Hw6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(997,'Nswanjere H/C III (St Joseph)','783507197','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(998,'Magamaga H/C III (Jinja)','772471072','',0,NULL,'Magamaga HC III','abg74s2NDzQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(999,'Bombo H/C III','773123529','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1000,'Katikamu H/C III','775353590','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1001,'Kangole H/C III','774811955','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1002,'Ndejje University H/C III','772445682','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1003,'Panyigoro H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1004,'Azaipi H/C III','782904210','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1005,'Obongi H/C IV','773890644','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1006,'Our Lady  of Lourdes H/C III (Nakasongola)','782777430','',0,NULL,'Our Lady Nakasongola HC III','FWFO4gWgFSk','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1007,'Mpambwa H/C III','783069403','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1008,'Lotim H/C II','775287200','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1009,'Katiyi H/C III','774738058','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1010,'Zirobwe H/C III','782419115','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1011,'Apwori H/C III','779633267','',0,NULL,'Apwori HC III','CWtHofajIfs','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1012,'Laropi H/C III','782797276','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1013,'Pokwero H/C III','774564784','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1014,'Kamira H/C III','773864847','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1015,'Omatenga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1016,'Nadunget H/C III','782110280','',0,NULL,'Nadunget HC III','aBkmoTyWd0a','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1017,'Butuntumula H/C III','774101036','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1018,'Bugambe H/C III (Hoima)','775661876','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1019,'Katuugo H/C II','772531714','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1020,'Kakasi C.O.U H/C III','781522484','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1021,'Nabwendo H/C III','785840041','',0,NULL,'Nabwendo HC III','J64jaeaqOc6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1022,'Kalangaalo H/C II','772324196','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1023,'Nindye H/C III','772893821','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1024,'Bukeeri H/C III','702930554','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1025,'Bunjako H/C III','','',0,NULL,'Bunjako HC III','X1RkzMg2Hn1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1027,'Panyangasi H/C III','773815556','',0,NULL,'Panyangasi/Kidera HC III','qbOt8Nswoff','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1028,'Bululu H/C III','782146065','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1029,'Panyadoli H/C III','784305700','',0,NULL,'Panyadoli HC III','a3qKoIZXK3t','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1030,'Kikoma H/C III','772375997','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1031,'Mukongoro H/C III','782015270','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1032,'St Jude Thaddeous Karungu H/C','785406822','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1033,'Kucwiny H/C III','756243651','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1034,'Masindi Port H/C III','775172633','',0,NULL,'Masindi Port HC III','PwHIdfpqYWi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1036,'St Francis Health Care Services','75455173','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1037,'Potika H/C II','778466208','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1038,'St Padre Pio H/C III Busunju','783523378','',0,NULL,'St. Padre Pio Mirembe HC III','l3oOKBFWJkz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1039,'Kakiri H/C III','772674849','',0,NULL,'Kakiri HC III','EAr7pVCRxF3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1040,'Kiziba H/C III (Rakai)','778658435','',0,NULL,'Rakai Kiziba HC II GOVT','UjpKmijwPjr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1041,'Sseguku H/C II','772493521','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1042,'Kyabadaaza H/C III','782447049','',0,NULL,'Kyabadaza HC III','qYIh49gM216','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1044,'Kiragga H/C III','787419829','',0,NULL,'Kiragga HC III','aGJJ5oqd2zk','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1045,'Anyavu H/C II','758996063','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1046,'Katikamu-Kisule H/C III','782059796','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1047,'Mutunda H/C III','774267099','',0,NULL,'Mutunda HC III','T72P3ebY53q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1048,'Kigumba H/C III','772988671','',0,NULL,'Kigumba HC III','csFo3Bw4oTt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1049,'Agiermach H/C III','773169570','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1050,'Busaana H/C III','772337351','',0,NULL,'Busaana HC III','aLmtlWu249T','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1051,'Bamunanika H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1052,'Kavule H/C II','772334648','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1053,'Ovujo H/C III','774278178','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1054,'St Francis H/C III Ocodri','777441014','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1055,'Naanywa H/C III','772575208','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1056,'Vurra H/C III','782071515','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1057,'Bubukwanga H/C III','779481319','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1058,'Lukomera Maternity Centre','783195153','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1059,'Moroto Army H/C IV','789503034','',0,NULL,'Moroto Army  HC III','pE5320aADcw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1060,'Mukono Hospital C.O.U','774066387','',0,NULL,'Mukono CoU HC IV','MNzaqWsKyxO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1061,'Bukalagi H/C III','754138335','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1062,'Mende H/C III','775922302','',0,NULL,'Mende HC III','UkAhDd9JpYl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1063,'Kayango H/C III','772317674','',0,NULL,'Kayango HC III','BNsfT2yL0kW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1064,'Nyaravur H/C III','771035432','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1065,'Kyalugondo H/C III','702487880','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1066,'Wabusana H/C III','782852711','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1067,'Ssi H/C III','0774463756/075126722','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1068,'Panyangara H/C III','782842756','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1069,'Ajia H/C III','774684879','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1072,'Kitanda H/C III','774319402','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1073,'Lwanda H/C III','774250308','',0,NULL,'Lwanda HC III','Lo7mfA6jWTu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1074,'Bitooma H/C III','777407512','',0,NULL,'Bitooma HC III','IgKXuBYXQFl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1075,'Parombo H/C III','774566858','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1076,'Bulera H/C III','789496775','',0,'14','Bulera HC III','archepWw0ZZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1077,'Yivu Abea H/C II','756067072','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1078,'Toroma H/C IV','774151227','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1079,'Kimwanyi H/C III','774989372','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1080,'St Micheal HCF H/C III (Amuria)','777687013','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1081,'Warr H/C III','773971339','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1082,'Bukasa H/C IV (Kalangala)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1083,'Bweema H/C III','771487441','',0,NULL,'Bweema HC III','G6GmMEAZA9r','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1084,'Kinyara H/C III','701582072','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1085,'Kabeywa H/C III','782235986','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1086,'Awebwa Maternity Centre','785937453','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1087,'Kabungo H/C III','774455075','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1088,'Nyantonzi H/C III','782804742','',0,NULL,'Nyantonzi HC III','SzShxoEQf7a','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1089,'Wamala H/C II','777550255','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1090,'Bowa H/C III','774039639','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1092,'Diima H/C III','772033680','',0,NULL,'Diima HC III','xO0dHAa2wFK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1093,'Kamaka H/C III','787542565','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1094,'Ssekamuli H/C III','782506688','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1095,'Kolir H/C III','782315702','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1097,'Lacor Opit H/C III (Omoro)','0777817454','',0,NULL,'Opit HC III','IdUFKUbqQiQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1098,'St Kevin H/C III','789476311','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1099,'Moyo Mission H/C III','782781619','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1100,'Kalonga H/C III','774105613','',0,NULL,'Kalonga HC III','YaUCgS8WMMW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1101,'Myanzi H/C III (Mubende)','777597967','',0,NULL,'Myanzi HC III','ausfaeGjscI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1102,'Kira H/C III','702210451','',0,'14','Kira HC III','I2O4ZRrmyQN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1103,'Nabiswera H/C III','775967443','',0,NULL,'Nabiswera HC III','aRE0Ejk5hdp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1104,'Wabigalo H/C III','772510162','',0,NULL,'Wabigalo HC III','QxjjT8pu7tx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1105,'St Luke H/C III Katiyi','782240065','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1106,'Tiriri H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1107,'Ediofe H/C III','774497489','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1108,'Ogoko H/C II','774564653','',0,NULL,'Ogoko HC II','avy7joRGT2x','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1109,'Nyamarwa H/C III (Kibaale)','783984137','',0,'4','Nyamarwa HC III','Q6MT6wA0bBm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1110,'Isunga H/C III','703876718','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1111,'Mpeefu H/C III','782717237','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1112,'Buseruka H/C III','771603871','',0,'4','Buseruka HC III','ccVG52jNm8D','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1113,'Kaseeta H/C III','777101404','',0,NULL,'Kaseeta HC II','k38SanlZHyl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1114,'TASO Kanyanya','772353599','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1115,'Otuboi H/C III','78456683','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1116,'Alwa H/C III','718878117','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1117,'Kiyuni H/C III (Kyankwanzi)','775913798','',0,NULL,'Kyankwanzi Kiyuni HC III','GjiT4Fcwj6P','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1118,'Waibuga H/C III','753190506','',0,NULL,'Waibuga HC III','aA2zaYJW1YT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1119,'Loroo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1120,'Cheptapoyo H/C II','775975201','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1121,'Kyaayi H/C III','757288810','',0,NULL,'Kyai HC III','tPiPaWz3TIK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1122,'Kakoro H/C III','782153309','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1123,'Minakulu H/C III (Oyam)','752994325','',0,NULL,'Minakulu Gvt HC II','TG4nYtwDBTr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1124,'Lokopo H/C III','753553216','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1125,'Ober H/C III','','',0,NULL,'Ober HC III','hdrTrRDuwOU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1126,'Kibalinga H/C III','705905158','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1127,'Kyamusisi H/C III','776954450','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1128,'Asamuk H/C III','783191692','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1130,'St Marys H/C Kasaala','775596473','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1131,'Lukaya H/C III','783406816','',0,NULL,'Lukaya HC III','IDk3QfceRQG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1133,'Kyondo H/C III','773980505','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1134,'Kanamba H/C III','773415489','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1135,'Karusandara H/C III','779457973','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1136,'Mt Riwenzori H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1137,'Maliba H/C III','753139988','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1138,'Isule H/C III','783813863','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1139,'Hima Cement Clinic','702255365','',0,NULL,'Hima Star Clinic','FAjgEVpPiLO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1140,'Kapedo H/C III','785075122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1141,'Nyabubare H/C III','701195071','',0,NULL,'Nyabubare HC III','ci2uaeBv4Jg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1142,'Kyotera Medical Centre','709230738','',0,NULL,'Kyotera Med. Centre HC II','io8JhubppQo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1143,'Kayogera H/C II','782428661','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1144,'Tapac H/C III','775241847','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1145,'Wabwoko H/C III','','',0,NULL,'Wabwoko HC III','a7fC0KrYZzK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1146,'Merikit H/C III','782307894','',0,NULL,'Merikit HC III','rxu4zvH3DC1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1147,'Kikamulo H/C III','773710558','',0,NULL,'Kikamulo HC III','Q5qLPWNEj41','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1148,'Rwenzori Mountaineering Services','789568755','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1149,'Wakyato H/C III','775330824','',0,NULL,'Wakyato HC III','eQXTs1XHYpK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1150,'Ngoma H/C IV (Nakaseke)','777386117','',0,NULL,'Ngoma HC III','aFvqMkkSctS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1151,'Kinyogoga H/C III','777823384','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1152,'Kasozi H/C III (Luwero)','773952579','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1153,'Makulubita H/C III','704593907','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1154,'Nakatonya H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1155,'Nattyole H/C III','789584455','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1156,'Luteete H/C III (Luwero)','773462440','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1157,'Holy Cross H/C III (Kikyusa)','783134283','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1158,'Bukalasa H/C III','782951541','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1159,'Nawanyago H/C III','779468841','',0,NULL,'Nawanyago HC III','tbeQC8kTgVd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1160,'Kaliro H/C IV (Kaliro)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1161,'Wesunire H/C III','772074771','',0,NULL,'Wesunire Cath. HC II','KaQgUo68H9v','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1162,'Bubambwe H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1163,'Kireku H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1164,'Aripea H/C III','774132977','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1165,'Cilio H/C III','774362299','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1166,'Otombari H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1167,'Inde H/C III','774134184','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1168,'Oje (Mission) H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1169,'Kyamuhunga H/C III','704774905','',0,NULL,'Kyamuhunga HC III','aerTdJxlEQh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1170,'Alwi H/C III','774626457','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1171,'Kalungi H/C III (Nakasongola)','779510066','',0,NULL,'Kalungi HC III','wgSmdZGeb5I','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1172,'Nakapelimoru H/C III','0779067776','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1174,'Our Lady Of Maria Assumpta','778142382','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1175,'Bweyogerere H/C III','782687070','',0,NULL,'Bweyogerere HC III','cmB5Q4tejGP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1176,'Kirewa Community H/C III','779112270','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1177,'Kakanju H/C III','782749848','',0,NULL,'Kakanju HC III','VV5c8F4HVjw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1178,'Bugongi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1179,'Kawongo H/C III','784074745','',0,NULL,'Kawongo HC III','xFu5BXdkrZj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1180,'Lulagala H/C III','776373051','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1181,'Katakwi Hospital','7780129142','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1182,'Kabira H/C III (Mitooma)','751422089','',0,NULL,'Mitooma Kabira HC III GOVT','RKTrEW3Vw7X','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1183,'Mirambi H/C III','777510067','',0,NULL,'Mirambi HC III','RWEo3tF0K1h','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1184,'Ikoba H/C III','701913230','',0,NULL,'Ikoba HC III','I9E4CMmLVbn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1185,'Bushika H/C III','782152230','',0,NULL,'Bushika HC III','J3KJzX1JSXu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1186,'Nkoko H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1188,'Kyabasaija H/C III','787139636','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1190,'Bujuni H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1191,'Butawaata H/C III','788798757','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1192,'Soroti H/C III','782515470','',0,NULL,'Soroti HC III','cY2kQBkzz17','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1193,'Mazinga H/C III','752621249','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1194,'Community H/C Plan uganda Lugoba(Kawempe)','779823668','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1195,'Bulika H/C II','772026320','',0,NULL,'Bulika HC II','x4zVP4YLDy7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1196,'Oberabic H/C II','774559828','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1197,'St Matia Mulumba H/C III -Irundu(Buyende)','751661651','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1198,'Orussi H/C III','775794960','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1199,'Luna Medical Cetre (Katooke)','772480242','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1200,'Magala H/C III','772867322','',0,NULL,'Magala HC III','WqoBdlGeBgn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1202,'Biharwe H/C III','772870408','',0,NULL,'Biharwe (Nyabuhama) HC III','hAdnePvF54E','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1203,'Kakoba Division H/C III','782777708','',0,NULL,'Kakoba Domiciliary Clinic','WjUTld3U8r2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1205,'Rubindi H/C III','773474737','',0,'65','Rubindi HC III','kw2BNLtK1FZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1206,'Mwizi H/C III','703009996','',0,NULL,'Mwizi HC III','aekCLvuNCrj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1207,'Mulabana H/C II','773309388','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1208,'Kiti H/C III','700484101','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1209,'Openzinzi H/C III','772545083','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1210,'Kambaala H/C III','786019262','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1211,'Emesco H/C IV','779531458','',0,'4','EMESCO HC III','qXpKvhiylZz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1212,'Mirembe Maria Gorreti H/C III ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1213,'St Matia Mulumba H/C III (Mubende)','753908002','',0,NULL,'St. Matia Mulumba HC III','Ae8byorr2lF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1214,'Lunyo H/C III','774265872','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1215,'Masindi Army Barracks','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1216,'Field Artilary Army Barracks H/C IV','774777675','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1217,'Katulikire H/C III','705378343','',0,NULL,'Katulikire HC III','auWHq0LQsFf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1219,'Puranga H/C III','789736161','',0,NULL,'Puranga HC III','flJx2pns0FY','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1220,'Ntenjeru H/C III','782421768','',0,NULL,'Ntenjeru HC III','xKKIcgLVH9x','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1221,'Maaji A H/C II','775990577','',0,NULL,'Maaji A HC II','Lq5bORbEZDi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1222,'Epi Centre H/C III (Butambala)','757895866','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1223,'Engari Community H/C III','784835251','',0,NULL,'Engari Community HC III','toGKbXMtRf8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1224,'Buteba H/C III','782014159','',0,NULL,'Buteba HC III','aJgUSQQuIsM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1225,'Katovu H/C III','784077699','',0,NULL,'Katovu HC III','qp3zotdBH8Y','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1226,'Kapujan H/C III','774578147','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1227,'Okwang H/C III','','',0,NULL,'Okwang HC III','jmYDcub8QTz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1228,'Nyarugoote H/C II','782452313','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1229,'Kashambya H/C III','771681090','',0,NULL,'Kashambya HC III','jtrHsubBsqd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1230,'Nyakagyeme H/C III','782668019','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1231,'Kibirizi H/C III','787061113','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1232,'Kagongi H/C III','774615891','',0,'65','Kagongi HC III','XQCqKzjyAZg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1233,'Ndeija H/C III','773562161','',0,NULL,'Ndeija HC III','w710lzfn4pu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1235,'Uganda Muslim Supreme Council H/C III','782030633','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1236,'Kaharo H/C III','702852095','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1237,'Kabale H/C III (Kalungu)','704570573','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1238,'Namaggwa Clinic','782136403','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1239,'Mudakori H/C III','0772/0702440973','',0,NULL,'Mudakor HC III','ezl9nwYbSdn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1240,'Metu H/C III','782204645','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1241,'Kyenjojo Hospital','782972895','',0,'6',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1242,'Kaihura Villa Maria H/C II','785103555','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1243,'St Martin H/C III -Mabira (Kyenjojo)','771414700','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1244,'Kisozi H/C III','703270227','',0,NULL,'Kisozi HC III GOVT','KNuyUySHocg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1245,'Mitandi H/C III (NGO)','777637040','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1246,'Bufunjo H/C III','703918802','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1247,'Ntonwa H/C II','772976181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1248,'Bukanga H/C III','773549059','',0,NULL,'Bukanga HC III','edqx4oFg95R','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1249,'Nyakishenyi H/C III','774231659','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1250,'Aakum H/C II','773010075','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1251,'Akoboi H/C II (katakwi)','775429485','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1252,'Kobulubulu H/C III ','753350409','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1254,'Ndama H/C III','782715894','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1255,'Kibibi Nursing Home H/C III','782080267','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1256,'Butende H/C III','775776565','',0,NULL,'Butende HC III','S79Lcu8O003','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1257,'Buwunga H/C III (Bugiri)','784904850','',0,NULL,'Bugiri Buwunga HC III GOVT','yJNtR9S3CZZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1258,'Kameke H/C III','756720664','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1259,'Muramba H/C III','781557742','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1260,'Kinanira H/C III','773337826','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1261,'Nyarusiza H/C III','773258770','',0,NULL,'Nyarusiza HC III','Pgi000QNqrV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1262,'Kasozi H/C III (Wakiso)','782740565','',0,NULL,'Wakiso Kasozi HC III GOVT','ZDdH3JVg9pD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1263,'Busowobi H/C III','783900263','',0,NULL,'Busowobi HC III','fqWdsy0CuFR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1264,'Rugyeyo H/C III','772950155','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1265,'North Kigezi Diocese M C H/C IV','776123652','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1266,'Bugangari H/C IV','782473508','',0,'65','Bugangari HC IV','aG2h9UI08nA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1268,'Mushanga H/C III','782793329','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1269,'Rwenjaza H/C II','777841148','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1270,'Stella Maris H/C II','781266562','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1273,'Buwooya H/C III','776147873','',0,NULL,'Buwooya HC II','AIl1p6YgqxA','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1274,'Bison H/C III','779958793','',0,NULL,'Bison HC III','aZep2aolzmX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1275,'Bufundi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1276,'Bwambara H/C III','782741062','',0,NULL,'Bwambara HC III','ACeIX77jOBg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1277,'Butanda H/C III','782272686','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1278,'Kiyeyi H/C III','703565790','',0,NULL,'Kiyeyi HC III','ZeXBMNmaaI1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1280,'Buwa H/C II','782190949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1281,'MJAP-MMC  H/C IV','755553193','',0,'65','Mbarara Municipal Council HC IV','pCasaBs63nR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1282,'Pakadha H/C III','773953411','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1283,'Offaka H/C III','772611344','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1284,'Buyanja H/C III (Mpigi)','772938435','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1285,'Kanyamwirima H/C III','777364670','',0,NULL,'Kanyamwirima Army  HC III','ZqwV5PWv4Pt','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1286,'Mitala Maria H/C III','784171268','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1287,'Buhanika H/C III','774304731','',0,NULL,'Buhanika HC III','pefIQOO4szC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1288,'Namatala H/C IV','779832509','',0,NULL,'Namatala HC IV','mAVOIO9mDPJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1289,'Isibuka H/C III','785843285','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1290,'Kabugu H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1291,'Kibengo H/C II','788528932','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1292,'Sanga H/C III','777086003','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1293,'Kashongi H/C III','704492278','',0,NULL,'Kashongi HC III','h2IH7DjeJ21','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1294,'Ankole Tea H/C II','705954346','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1295,'Juru H/C II','773832296','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1296,'Iremera H/C III','775578333','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1297,'Gasovu H/C III','783472944','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1298,'Hope Clinic Lukuli','785037971','',0,NULL,'Hope Clinic Lukuli HC II','Ap53MmxflW6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1299,'Nyantabooma H/C III','775106042','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1300,'Hope Again Medical Centre (Kyenjojo)','783030068','',0,NULL,'Hope Again Medical Centre HC III','aLF9fK0AtT7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1301,'Bujumbura H/C III','775580123','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1302,'Nyakayojo H/C III','750405263','',0,NULL,'Nyakayojo HC III','fvak0fciiOr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1303,'Nsambya Home Care','782946608','',0,NULL,'Nsambya Home Care Clinic','isXZREUsgiH','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1304,'Loputuk H/C III','774509752','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1305,'Wandi H/C III','779910186','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1306,'Kuchinjaji H/C III','717319981','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1307,'Kasambya H/C III (Kalungu)','753126432','',0,NULL,'Kalungu Kasambya HC III GOVT','MLgsYoX2xWW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1308,'Opia H/C III','777205160','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1309,'Burombe H/C III','392859470','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1310,'Busaru H/C IV','777124443','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1311,'Rushorooza H/C III','788705556','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1312,'Tegeres H/C III','704079686','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1313,'Mengo Hospital Counselling & HomeCare','779174935','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1314,'Butemba H/C III(Kyankwanzi)','782258255','',0,'14',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1315,'Lubya H/C II','775359981','',0,NULL,'Lubya HC II','aZjBV5O7kkf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1316,'Katwe H/C III (Kiboga)','784751968','',0,NULL,'Kiboga Katwe HC III GOVT','FHtJEqFHwS4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1317,'Bwikara H/C III','779037385','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1318,'St Jacinta H/C III','784784764','',0,NULL,'St. Jacinta Zigoti HC III','sRkrARaYj0F','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1319,'Ntandi H/C III','782658738','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1320,'Lolachat H/C III','779287502','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1321,'Kyanamira H/C III','777544747','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1322,'AIDS Information Centre (Soroti)','782568048','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1323,'Rwenshama H/C III','782663275','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1324,'Aketa H/C III','774353570','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1325,'Nkokonjeru  H/C III (Kayunga)','782649498','',0,NULL,'Nkokonjeru HC III','MnlhBeOd2dx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1326,'Nakifuma H/C III','782973510','',0,NULL,'Nakifuma HC III','bAh0tns9mFX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1327,'Kimenyedde H/C II','703914568','',0,NULL,'Kimmenyedde HC II','gK0T4N1aFZu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1328,'Ntoroko H/C III (Ntoroko)','773651028','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1329,'Burere H/C III','776303135','',0,NULL,'Burere HC III','bYYKbpHb8Y7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1330,'Kamuhunga H/C IV','706768213','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1331,'Orivu H/C II','784325737','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1332,'Bileafe H/C III','773169512','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1333,'CBHA-USAID RHU Project -Kabale','700390172','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1334,'Mukabara H/C III','779428429','',0,NULL,'Mukabara HC III','QCufWVvV6cj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1335,'Kamod H/C II','0789971882','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1338,'St Peters H/C II Awere','779754582','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1340,'Kanywambogo H/C III','774437949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1341,'Magoro H/C III','781560419','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1342,'Ngariam H/C III','787454838','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1344,'Nyakashashara H/C III (Kiruhura)','777578374','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1345,'Kisiizi  H/C III','772654749','',0,'65',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1348,'Sanyu Dom Service','782189824','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1349,'PNC (Baylor-Mulago)','775135977','',0,NULL,'Mulago National Hospital- Old Mulago Pos','mS4KHqXpvDB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1350,'Kasaali H/C III','0702962822/077546778','',0,NULL,'Kasaali HC III','ZLJUYEZegpQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1351,'Mutukula H/C III','702153292','',0,NULL,'Mutukula HC III','X7iYabwpJfR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1352,'Kichinjaji  H/C  III','775844853','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1353,'Kagano  H/C   III','787782378','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1354,'Kidetok Mission H/C III','7755237160','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1355,'Kaberamaido Catholic H/C III','779183236','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1356,'Apopong  H/C  III','777603058','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1357,'Acowa  H/C  III','773416892','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1358,'Acumet  H/C   III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1359,'Hunter  Foundation  Hospital','0751977464/070335122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1360,'Rugarama H/C III','775445801','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1361,'Anyiribu H/C III  ','784494108','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1362,'Kikatsi H/C III','782840099','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1365,'Lopeei H/C III','784502424','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1366,'Ntungu H/C II','753540667','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1367,'Rackoko H/C III','777003811','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1369,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1370,'Reproductive Health Uganda (Lira)','788900286','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1371,'Reproductive Health Uganda (Hoima)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1372,'Bondo H/C III','777627975','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1373,'Kabarwa   H/C  III','752849976','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1374,'Kikandwa H/C III (Mityana)','774831073','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1375,'Kikokwa  H/C   III','702340590','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1378,'Bowagajjo H/C III','0783289055/075281372','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1380,'Kisule H/C III','753691775','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1381,'Bwikinda   H/C III','703832444','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1382,'Karuhembe H/C II','772469607','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1383,'Buteza H/C III','777269814','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1384,'Lulamba H/C III','782318061','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1385,'Mugoye H/C III','782026552','',0,NULL,'Mugoye HC III','aeWNPmn3Zrf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1386,'Bubeke H/C III','706492023','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1387,'Tirinyi H/C III','782147786','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1388,'Zumbo H/C III','783794644','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1390,'Kanywamaizi H/C III','774437949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1391,'Kyankwanzi H/C III','782921669','',0,NULL,'Kyankwazi HC III','RNfCSfnBlxh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1392,'Burunga H/C III','785357186','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1393,'Karambi H/C III (Kabarole)','779088450','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1394,'Kacheera H/C III','783782379','',0,NULL,'Kacheera HC III','k3xgvufxeWb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1395,'Hima  Govt H/C III','774118384','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1396,'St Joseph Hospital (Maracha)','782495092','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1397,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1398,'Kashare H/C III','773147700','',0,NULL,'Kashare HC III','ahkQO7FQKKK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1399,'Kahunde H/c II','781682059','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1400,'Kiryanga H/C III','783271188','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1401,'Muhoro H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1402,'Pakanyi H/C III','773022229','',0,NULL,'Pakanyi HC III','LyUOH3aGCga','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1403,'Nyarubuye H/C III','775116345','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1404,'Kolonyi Hospital','783426583','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1405,'Busitema H/C III','782416956','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1407,'Buluganya H/C III','779601907','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1408,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1409,'Karwenyi H/C II','775119923','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1410,'Kalamba H/C II','776192760','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1411,'Chebonet H/C III','77933588','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1413,'Padwot Midyere H/C III','783794644','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1414,'CBHA -USAID Project (RHU)- Kanungu','782571348','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1415,'Alenga H/C III','752238402','',0,NULL,'Alenga HC III','eR77udlIWIM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1416,'Obalanga H/C III','755986656','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1419,'Bwendero H/C III','782840049','',0,NULL,'Bwendero HC III','yOzYKPK76Bq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1420,'Karita H/C III (Amudat)','781762787','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1421,'Butare H/C III(Buhweju)','789392890','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1422,'Chesower H/C III','777252116','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1424,'Kakomo H/C III','779010578','',0,NULL,'Kakomo HC III','kbiNehvstx4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1425,'Buyanja H/C III (Rukungiri)','','',0,NULL,'Buyanja HC III','abHQOTY0rmo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1426,'JOY Medical Centre','775348765','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1427,'Dranya H/C III','782667177','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1428,'Dricile H/C III','775086109','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1430,'Mariana Maternity Home','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1431,'Makondo H/C II','785833640','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1432,'Kameruka H/C III','783248396','',0,NULL,'Kameruka HC III','ptpCYlWn6s7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1433,'Katunguru H/C III (Kasese)','779929113','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1434,'Marah H/C III','782495092','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1435,'Rubondo H/C II','774845808','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1436,'Angal Hospital (St Luke)','774943778','',0,NULL,'Angal St. Luke HOSPITAL','K7Do3WBvmLa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1437,'Kicwamba H/C III','782763676','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1438,'Ikonia H/C III','779486179','',0,NULL,'Ikonia HC III','BaAs4hm4jc7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1439,'Mbehenyi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1440,'Kasenda H/C III','700714323','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1441,'Oraba H/C II','793996672','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1442,'Buwalasi H/C III','772453391','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1443,'Mawujjo H/C II','775477608','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1444,'Kinoni H/C III (Kiruhura)','784673609','',0,NULL,'Kiruhura Kinoni HC III GOVT','ypTdjdfOiN7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1445,'Bulangira H/C III','774206402','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1446,'Kanyaryeru H/C III','782185442','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1447,'Kikonda H/C III','773095756','',0,NULL,'Kikonda HC III','N05ZDulF2ME','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1448,'Kadama H/C III','757511949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1449,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1450,'Jangokoro H/C III','784498604','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1451,'Lambu H/C II','776342034','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1452,'Cheptuya H/C III','701659969','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1453,'TASO Entebbe','752812084','',0,NULL,'TASO Entebbe CLINIC','tf5lSUl7OmO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1454,'Omel H/C II','773957701','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1455,'Bugaya H/C III (Buyende)','753404721','',0,NULL,'Buyende Bugaya HC III GOVT','ADB4cMlJP2q','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1456,'Dino H/C II','772949356','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1457,'Kyarumba H/C III (Government)','783653013','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1458,'Naboa H/C III','782310948','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1460,'Kyakatara H/C III','775777869','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1461,'Kichwamba H/C III (Rubirizi)','772831110','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1462,'Health Initiative for Africa- Uganda','777040536','',0,NULL,'Health Initiative for Africa - Uganda','D2O6Qzf4hl8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1464,'Kyatiri H/C III','772370508','',0,NULL,'Kyatiri HC III','g8JZTLexaAr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1465,'Kabatunda H/C III','777308162','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1466,'Galimagi H/C III','788022411','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1467,'Kida Hospital','779776333','',0,NULL,'Kida Hospital','QEpV6yJSsCN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1468,'Nyakitibwa H/C III','','',0,NULL,'Nyakitiibwa HC III','aFXkqZXMomP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1469,'Pakia H/C III','787148565','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1470,'St Anthony Hospital','788486600','',0,NULL,'St. Anthony\'S Tororo HOSPITAL','iOwO7cTQKfH','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1471,'Loyo Ajonga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1472,'Nurture  Africa H/C III','777335365','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1473,'Kwapa H/C III','753663517','',0,NULL,'Kwapa HC III','idW1pR7k8m2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1474,'Kisojo H/C II (Kasese)','772920134','',0,NULL,'Mubuku/Kisojo HC II','HjhLsl0DHSQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1475,'Bukwo General Hospital','753900412','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1480,'St Andrew H/C II','755162506','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1481,'Kakatunda H/C III','783943467','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1482,'Kinyarugunjo H/C III','78780608','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1483,'Makonzi H/C III','774220141','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1484,'Biiso H/C III','788775339','',0,NULL,'Biiso HC III','EPMb6dGjqnz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1485,'FICRD','787079947','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1486,'Wekomiire H/C III (St Thereza)','788037431','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1487,'Palorinya H/C III','753910286','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1488,'St Francis C H/C III (HOSFA)- Mityana','779492379','',0,NULL,'St. Francis,  HC III','HVwuyUY7azZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1489,'Kukewa H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1490,'Bukewa H/C III','788308221','',0,NULL,'Bukewa HC III','wcTUcjmdOA3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1491,'Bukhabusi H/C III','773851384','',0,NULL,'Bukhabusi HC III','JiMsrQGUs6H','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1492,'Nakaloke H/C III','','',0,NULL,'Nakaloke HC III','J1vQouUOY5h','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1493,'Aroi H/C III','782500543','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1494,'Lanenober H/C III','781293554','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1495,'Wagagai H/C IV','776555092','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1496,'Nassolo Wamala H/C II','777550235','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1497,'Lugazi Muslim H/C II','788860511','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1498,'Mujunza H/C II','781029097','',0,NULL,'Mujunza HC II','cdusFUkNTOC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1499,'Aarapoo H/C II','778553101','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1500,'Ajeluk H/C III','782961216','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1501,'Agaria H/C II','784458781','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1502,'Kanyantorogo H/C III','782440485','',0,NULL,'Kanyantorogo Gvt HC III','NLIAgxXVsuv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1503,'Buhozi H/C III','787719517','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1504,'Reachout (  Kinawataka   Site)','776509554','',0,'4',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1505,'Bukiro H/C III','782596463','',0,NULL,'Bukiiro HC III','BF4V8LnfSsj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1506,'Ruharo Mission Hospital','','',0,NULL,'Ruharo Mission Hospital','gBG1N1o51QR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1507,'Kiziba H/C III (Wakiso)','712880371','',0,NULL,'Kiziba HC III','gCobOTnUj2H','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1508,'Mwenge H/C III','782312850','',0,'6','','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1509,'Busawa Manze H/C III','776189191','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1510,'Katira H/C III (Budaka)','782982003','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1511,'Bugitimwa H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1512,'Te-Atoo H/C II','782798268','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1513,'Ddungi H/C II','75026832','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1514,'AIDS  Information Centre (AMURIA)','702003008','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1515,'St Sabena H/C II','787288238','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1516,'Bulumbi H/C III','787774706','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1517,'Lacor Hospital','782381045','',0,NULL,'St. Mary\'s Hospital Lacor','aPsvoBYxsDS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1518,'Lalle H/C II','774303912','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1519,'Bumwambu H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1520,'Nyadri H/C III','775757293','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1521,'Reachout (Mbuya Site)','782283023','',0,'4','Reach Out - Mbuya Clinic HC II','lQvAAAQpBP2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1522,'Buyanja H/C (Gomba)','788068935','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1523,'Lujorongole H/C II','777646767','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1524,'Kamonkoli H/C III','','',0,NULL,'Kamonkoli HC III','aEAa6essoBR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1526,'Kasensero H/C II','779417473','',0,NULL,'Kasensero HC II','KyCqBaEFJk5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1527,'Sapiri H/C III','772915124','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1529,'Aukot H/C II','782344096','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1531,'Nyaruhandagazi H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1534,'Makonje H/C II St Franciska','789960508','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1535,'AIDS Information Centre (Mbarara)','0702/0772-566692','',0,NULL,'AIC Mbarara Main Branch CLINIC','sPWbPZtb3ut','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1536,'Kamukuzi Division H/C II','0756409117','',0,NULL,'Kamukuzi Division HC II','qbh38u2Laz4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1537,'Mbarara Community Hospital','774654482','',0,NULL,'Mbarara Community Hospital','NvEq5qtAV4e','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1538,'Muko H/C III (NGO)','784044472','',0,NULL,'Muko Ngo HC III','gOFecbOs5XI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1539,'Kaara H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1540,'Kyogo H/C III','783703691','',0,NULL,'Kyogo HC III','TsDWptFDnmn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1541,'Kitooma H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1542,'Buhara H/C III (NGO)','784558233','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1543,'Kitanga H/C III (Rukiga)','7002915661','',0,NULL,'Kitanga HC II GOVT','bCuS4DX8Emh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1544,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1545,'Nyarushanje H/C III','701182237','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1546,'Kirigime Hospital (UMSC)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1547,'Rubanda PHC H/C III','784124212','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1548,'Luteete H/C III (FortPortal)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1549,'Alokolum H/C II','774849203','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1550,'Patuda H/C II','773348588','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1551,'Lelaobaro H/C II','773469253','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1552,'Tekulu H/C II','774592555','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1553,'Koro Abili H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1554,'Koro Lapainat H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1555,'Lakwatomer H/C II','700131086','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1557,'Rwot Obilo H/C II','777011365','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1558,'GwengDiya H/C II','715458549','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1559,'Lapeta H/C II','779025443','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1560,'Pukony H/C II','782723643','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1561,'Kasonganyanja H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1562,'Arivu H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1563,'Driate H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1564,'Reachout (Banda Site)','754308311','',0,'4','Reach Out - Banda CLINIC','F8jqYgk21HM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1565,'Bufumira H/C III','773445008','',0,NULL,'Bufumira HC III','mWaRCpc5hPU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1566,'407 Brigade H/C III','789801648','',0,NULL,'407 Brigade HC III','WqIs7ciPmmO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1567,'Kijunjubwa H/C III','776335580','',0,NULL,'Kijunjubwa HC III','CwftR8k7pWb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1568,'Katojo H/C III (Prisons)','704300443','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1569,'Byakabanda H/C III','775072717','',0,NULL,'Byakabanda HC III','tnBn02e8bRU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1570,'Kashenshero H/C III','782204050','',0,NULL,'Kashenshero HC III','Lu7D9BapOxL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1571,'Teso Safe Motherhood Project','779038290','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1572,'Kyankaramata H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1575,'Kirumba H/C III (Rakai)','7773319300','',0,NULL,'Kirumba  HC III','alzpRLW14i8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1576,'Muwanga H/C III','0775307477/078260021','',0,NULL,'Muwanga HC III','kKuqQelGUnq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1577,'Holy Innocent Childrens Hospital(Mbarara)','775967880','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1578,'Bujalya H/C III','773771916','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1579,'Mugarama H/C III (Mbarara)','774105065','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1581,'Butiaba H/C II','782833281','',0,NULL,'Butiaba HC III','GnAcwCmEkxS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1582,'Olimai Community H/C III','778572003','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1583,'Biwihi H/C II','776189069','',0,NULL,'Biwihi HC II','y6p5eLimu2C','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1584,'Mugarama H/C III (Kibaale)','706263108','',0,NULL,'Mugarama HC III','JmHLIGnm4TQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1585,'Namuningi H/C II','782436123','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1586,'Kawonawo H/C II','782641959','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1587,'Kyakiddu H/C II','776841655','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1588,'Amucu H/C III','787324669','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1589,'Okollo H/C III','773217752','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1590,'Rugashali H/C III','775851688','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1591,'St Micheal H/C III (Kibaale)','774682219','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1592,'Kirima H/C III','782605075','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1593,'Kireka SDA H/C III','773433690','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1594,'Nsambya Police H/C IV','782061513','',0,NULL,'Nsambya Police Clinic HC III','nBjhoOrem20','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1596,'Olwal H/C III','782593689','',0,NULL,'Olwal HC III','vnIPfEUR8ce','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1597,'Beatrice Tierney H/C II','784626402','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1598,'Kibale H/C III(Palisa)','777769756','',0,NULL,'Kibale HC III','BsWuppxjpNO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1599,'Adilang H/C III','774398895','',0,NULL,'Adilang HC III','FvewOonC8lS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1600,'Kalapata H/C III','775899843','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1601,'Omagoro H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1602,'Bihanga H/C II (Kamwenge)','779085512','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1603,'FAD Military H/C IV (MMH)','772383227','',0,NULL,'Masindi Military/Army Barracks HC IV','a4dl1FKIVQJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1604,'St Monica H/C III (Katende)','776232003','',0,NULL,'St. Monica Katende HC III','aLQq5QTDV2s','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1605,'Nalinya Ndagire H/C III','775274267','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1606,'Mutundwe H/C II','782565176','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1607,'Kyabirukwa H/C III','776744174','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1608,'Jaana H/C II','778138096','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1609,'Gamatimbei H/C III','701267208','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1610,'Kabingo H/C II','774591800','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1611,'Pakele H/C III','785637443','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1612,'Kigoyera H/C II','785103555','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1613,'Kyenzaza H/C II','777842815','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1614,'Bunambale H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1615,'Alim H/C II','754193865','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1616,'Biguli  H/C III','783788998','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1617,'Bukimbiri H/C III','774319327','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1618,'Bubaare H/C III (Kabale)','772692569','',0,NULL,'Bubare HC III','Lz5IMmqsLcZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1619,'Ebenezer SDA Medical H/C III','773353463','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1620,'Busiro H/C III','753065298','',0,NULL,'Busiro HC III','s3KGtzqaMyJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1621,'Rutenga H/C III','774091142','',0,NULL,'Rutenga HC III','uTkySNCx3j2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1622,'St Marys H/C III-Kyeibuza','785206020','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1623,'Ayivuni H/C','772347583','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1624,'Rambia H/C III','778383399','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1625,'Mella H/C III','774405748','',0,NULL,'Mella HC III','hRQXf9wuHdW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1626,'Kanyabwanga H/C III','782347461','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1627,'Mutungo H/C II','701378090','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1628,'Molo H/C III','779774381','',0,NULL,'Molo HC III','H0j9ehK06DJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1629,'Kyabakuza H/C II','752628662','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1630,'Myeri H/C II (Kyenjojo)','702924551','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1631,'Aloi Mission H/C III','774889493','',0,NULL,'Aloi Mission HC III','q2vSqN5xoZL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1632,'Yoyo H/C III','773203594','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1633,'Paminya H/C III','775612173','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1634,'Kimulikidongo H/C II','777237768','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1635,'Ofua H/C III','774667160','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1636,'Mundadde H/C III','704803509','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1637,'Kasenyi H/C II','772954987','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1638,'Pajimo H/C III','','',0,NULL,'Pajimo HC III','f33lKK2tJNV','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1639,'Poyameri H/C III','751166853','',0,NULL,'Poyameri HC III','GmcwI86bnbe','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1640,'Bumumulo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1642,'Butaleja H/C III','772322768','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1643,'Mahango H/C III','783974758','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1644,'Lotome H/C III','772506949','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1645,'Kabubbu H/C III','782637984','',0,NULL,'Kabubbu HC II','CWamWxvYUWQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1646,'Siripi H/C III','774465518','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1647,'Petta H/C III','784959209','',0,NULL,'Petta HC III','ybSnsdFkWFK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1648,'Lwajje H/C III','782762164','',0,NULL,'Lwajje HC II','bBNSvGxVrSq','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1649,'Bisina H/C II','777332815','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1650,'Kyere Mission NGO H/C III ','0779642532','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1651,'Kyarulangira H/C III','782587246','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1652,'Robidire H/C III','783799456','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1653,'Namatale H/C II','785010733','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1654,'St Francis H/C   III Migyeera','777859113','',0,NULL,'ST. Francis HC III','ryU8AKAQAnR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1655,'Paya H/C III','781336819','',0,NULL,'Paya HC III','SotbYUljYZa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1656,'Ocea H/C II','773385476','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1657,'Kichwamba H/C II (Kamwenge)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1658,'Bukibokolo H/C III','','',0,NULL,'Bukibokolo HC III','H713vHjaFbd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1659,'St Marys Kigumba H/C III (NGO)','759412154','',0,NULL,'St. Mary\'s Kigumba  HC III','SSfQUjnbstd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1660,'Lemusuii H/C III','752381099','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1661,'Kambugu H/C III (Kiboga)','754013674','',0,NULL,'Kiboga Kambugu HC II GOVT','CMNFahpvV4I','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1662,'Mirembe H/C III (Gayaza)','782893593','',0,NULL,'Mirembe HC III','UYmlNJzKbed','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1663,'Lokitelebu H/C III','0788861813','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1664,'Bujugu H/C III','773262635','',0,NULL,'Bujugu HC III','Ond9n3CrBxY','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1665,'Bunambutye H/C III','784959757','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1666,'Ruhangire H/C II','784305477','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1667,'Bumangi H/C II','774058432','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1668,'Kisubba H/C III','774663311','',0,NULL,'Kisuba HC III','aySqIA0RRpH','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1669,'Busunga H/C II','774204978','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1670,'Opot H/C II','782589254','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1671,'Potters Villiage','778280024','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1672,'Bupoto H/c III','700422756','',0,NULL,'Bupoto Hc III','aJCkfyIurtg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1673,'Kalowang H/C III','773123380','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1674,'Kisoko H/C III (Tororo)','','',0,NULL,'Kisoko HC III','HNjaSmUnPzM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1675,'Agurut H/C II','782707899','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1677,'Focrev H/C III','759501297','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1678,'Kyebando H/C III','783099516','',0,NULL,'Kyebando HC III GOVT','vgRXnM3VETo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1679,'Katakwi COU H/C II','775292699','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1680,'Coorom H/C II(Koch)','70754849975','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1681,'Bukaya H/C II','779357602','',0,NULL,'Bukaya HC II','RVSKVTxRcnF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1682,'Nabyewanga H/C II','705886414','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1683,'Kyaali H/C III','772574390','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1684,'Eremi H/C III','782847611','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1685,'Atangi H/C III','777774206','',0,NULL,'Atangi HC III','I3q42sKAJua','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1686,'Kingdom Life Medical Martenity H/C II','774875341','',0,NULL,'Kingdom Life Health Centre CLINIC','yfEXqa4COUS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1687,'St Francis Acumet','784513357','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1688,'Ikumba H/C III (Kabale)','774615869','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1689,'AIDS Information Centre (Kabale)','772444687','',0,NULL,'AIC Kabale Main Branch Clinic','s0sTvb5DnDP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1690,'Mityana H/C III (UMSC)','782733697','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1691,'St Francis Assisi Kitabu (Kasese)','774171329','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1692,'Mpungu H/C II (kabale)','757696492','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1693,'Bujuuko H/C III','702024884','',0,NULL,'Bujuuko HC III','pUZjhP8bvwF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1694,'Sekiwunga H/C III','782082334','',0,NULL,'Sekiwunga HC III','CB9zwzOqEbX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1695,'Lusago H/C II','775430480','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1696,'Kikka Yokana H/C II','782930214','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1697,'Nabuli H/C III','782816354','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1698,'Butoolo H/C III','705440185','',0,NULL,'Butoolo HC III','Co0DLFVgmGz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1700,'Lamezia H/C III','701167475','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1701,'Ocodri H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1702,'Yinga H/C III','772880181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1703,'Matanda H/C III','774462544','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1704,'Kampiringisa H/C III','772877014','',0,NULL,'Kampiringisa HC III','mm6DbH6wKeQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1705,'Muzizi H/C II','782411884','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1706,'Mantoroba H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1708,'Kashasha H/C II','773944620','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1709,'Apodorwa H/C II','773110848','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1710,'Eliofe H/C III','773227114','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1711,'Butandiga H/C III','776060892','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1712,'Malukhu H/C III','774206095','',0,NULL,'Malukhu HC III','V2x1UIpO46L','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1713,'China Uganda Friendship Hospital- Naguru','0706079185','',0,'4','Naguru  Hospital  - China Uganda Friends','h40pKp93Mtc','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1714,'Nyakatare H/C III','782272867','',0,NULL,'Nyakatare HC III','Nm3mxuGGRG1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1715,'Bunaseke H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1716,'Alangi H/C III','783463883','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1717,'Mpungu H/C III (Kanungu)','702660347','',0,NULL,'Mpungu HC III','s5LS26QGqzl','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1718,'Labongogali H/C III','783210962','',0,NULL,'Labongogali HC II','Tvayfd3cIU2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1719,'Kagumu H/C III','755547746','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1720,'Ggoli H/C III (Mpigi)','0702103042','',0,NULL,'Ggoli HC III NGO','SzVYBCcGiM7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1722,'Nyamirama H/C III','774267549','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1723,'Senta Medicare','703124393','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1724,'Mukongo H/C III','784044473','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1725,'St Bernards Mannya H/C III','751849102','',0,NULL,'St. Bernards Mannya HC II','a7obyfFdJ8u','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1726,'Rwengiri  H/C III','777402097','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1727,'Ageteraine Nursing Home','758712279','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1728,'Bugoigo H/C II','752386114','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1729,'Ibulanku H/C III','784464139','',0,NULL,'Ibulanku Community Health Centre HC III','kiuNceUg1Zo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1732,'Ebenezer Clinical Laboratory','7752324676','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1733,'Wattuba H/C III','782417949','',0,NULL,'Watubba HC III','Tr9SwdDaZNB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1734,'Katete H/C III','775141825','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1735,'Enganju H/C II','784835251','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1736,'Rurambiira H/C II','773832248','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1737,'Kyetume H/C III (Mukono)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1738,'Kyetume H/C III (Lwengo)','772885521','',0,NULL,'Kyetume HC III','w53Iyr73JjT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1739,'Kijurera H/C II','777858417','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1740,'Kikolimbo H/C III','772434967','',0,NULL,'Kikolimbo HC II','KcfKx2brSuv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1741,'Kureku H/C II','772994554','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1742,'Kyanya H/C III','784554057','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1743,'Health Initiatives Association','775285123','',0,NULL,'Health Initiative Association Uganda','U4PSDjSLsi2','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1744,'Masaka Prision H/C III','782034476','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1745,'SIAAP Bugoma Clinic','784869599','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1746,'Kitura H/C III','753117169','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1747,'Buyambi H/C II- (st Noa) Mityana','785428891','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1748,'Taqwa H/C III','772019587','',0,NULL,'Taqwa HC III','Ipvxi1nV5X4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1749,'Masaka Police Clinic','752337301','',0,NULL,'Masaka Police HC II','SWWHTLQjZXW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1750,'Noahs Ark Family Clinic','773783853','',0,NULL,'Noah`s Ark HC III','dXEcBso8rQv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1751,'Ggwatiro Hospital','700876045','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1752,'Uganda Martyrs Hospital (Namugongo)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1753,'Kachumbala Mission Dispensary','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1754,'St Francis Mbiriizi H/C III','773837749','',0,NULL,'St. Francis Mbirizi HC III','n3uHerzsnE1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1755,'Katunguru H/C III(Rubirizi)','772959793','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1756,'Pacilo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1757,'Mbirizi Moslem H/C III','772914091','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1758,'Kyeirumba H/C III','779664167','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1759,'Bweyogerere H/C III Muslim (Hassan Tourabi H/C III)','782800415','',0,NULL,'Bweyogerere Hassan Turabi. HC III','hzPoo5zzWjj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1760,'St Apollo H/C III-Namasuba','779299952','',0,NULL,'Namasuba Medical Care CLINIC-NR','bcdfCnTKqaR','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1761,'Kasodo H/C III','774020719','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1762,'Barakala H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1763,'Nkata H/C II','774793344','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1764,'Lacor H/C III (Pabbo)','774210582','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1765,'Lufuka Valley Health Centre III','783503664','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1766,'Meeting Point Kampala','774666799','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1767,'Nalugala H/C II','782728437','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1768,'Mitukula H/C III','','',0,NULL,'Mitukula HC III','SElLcUjqrGg','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1769,'Kyamaganda HCIII','705341280','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1770,'Kagunga H/C II','702545987','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1771,'Olujobo H/C III','774611242','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1772,'Namutamba H/C III  COU  (Mityana)','774077961','',0,NULL,'Namutamba HC III','sf2baAzfwgW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1773,'Nyamwegabira H/C III','777470702','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1774,'Kayonza H/C III (Kanungu)','775148855','',0,NULL,'Kayonza Tea Factory HC III','x65jpp0WQnc','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1775,'Kasambiika H/C II','775444602','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1776,'Morungatuny H/C III','778767472','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1777,'Lacor H/C III (Amuru)','774210582','',0,NULL,'Lacor (Amuru) HC III','cjnFsHrJ4M4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1779,'Lake Mburo H/C III','772057442','',0,NULL,'Kanyaryeru (Lake Mburo) HC III','GVN2Bcibhmd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1780,'Kishenyi H/C II (Rubirizi)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1781,'Foyer H/C III','780675172','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1782,'Nkoni Health Center III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1783,'Anaka H/C II (Madi Opei)','787067014','',0,NULL,'Anaka H/C II (Madi Opei)','bLzMzz5fzGQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1784,'Zzinga H/C II','703351413','',0,NULL,'ZINGA HC II','nYpQROJrK2y','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1785,'Lwakaloolo H/C II','774880730','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1786,'Kibuuka H/C II','774880730','',0,NULL,'Kibuuka HC II','a5K7IVmM7zJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1787,'Butiti H/C II (Rakai)','774880730','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1788,'Zia Angelina ','776265920','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1789,'Dzaipi H/C III','782461487','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1790,'Bigungiro H/C II','772831913','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1791,'Rusheshe H/C III','772703519','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1792,'Kihefo H/C III','777228884','',0,'65','Kihefo Clinic','B8okqr86WzK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1793,'Kabbo H/C II','784797776','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1794,'Gateriteri H/C III','773035758','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1795,'Aliba H/C III','775800996','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1796,'Mutara H/C III','772665593','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1797,'Kituntu H/C III','782057880','',0,NULL,'Kituntu HC III','anOxR20hDCC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1798,'Siira H/C III','','',0,NULL,'Siira HC III','eQUTo4Kz4Cv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1799,'Ssanje Domiciliary Clinic','782407878','',0,NULL,'Sanje Domeciary HC II','amwSlyHvRiP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1800,'Kapkoloswo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1801,'Bugogo H/C III','774445143','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1803,'Buhandagazi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1804,'St Stephens Hospital (Mpererwe)','','',0,NULL,'St. Stephens Mpererwe HC III','qGVARGVRtsr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1805,'Kyabi H/C III','783978800','',0,NULL,'Kyabi HC III','u0ZXCHvbs0W','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1806,'Haama H/C II','752468355','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1807,'Rwoburunga H/C III','706219414','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1808,'Kakoma H/C III','7013262560','',0,NULL,'Kakoma HC III','RI4Fb24F84i','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1809,'Buginyanya H/C III (Bulambuli)','778803541','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1810,'Doctors Hospital Sseguku','705555117','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1811,'Apo H/C II','756579825','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1812,'St Martha Maternity Home- Bukedea','784112232','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1813,'Nalweyo H/C III','784737753','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1814,'Hope Medical Centre (AMG)(Sheema)','704143612','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1815,'Mukwano Medical Services Ltd','774131371','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1816,'Bihanga Army H/C II','777656664','',0,NULL,'Bihanga Updf Barracks HC II','k58XY2uVEjN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1817,'Makiro H/C III','775018551','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1818,'Igayaza H/C II','772366801','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1819,'Maziriga H/C II','783288025','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1820,'Kibanda H/C II (Kabale)','774481008','',0,NULL,'Kibanda HC II','OFHXaWocktQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1821,'Nyakinama H/C III','777787410','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1822,'Burama H/C II','774435011','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1823,'Busingye Maternity Home','714404180','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1824,'Mulagi H/C III','783015770','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1825,'Bukungu H/C II','779820224','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1826,'Bukalasi H/C III','785338944','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1827,'Rutaka H/C III','0774215237','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1828,'Kihunda H/C III','773947343','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1829,'Well Springs Childrens Medical  Center Kamutuuza','779212047','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1830,'Kitholhu H/C III','782835901','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1831,'St Lucia Kagamba H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1832,'Kitojo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1833,'Kasubi H/C III','772499744','',0,NULL,'Kasubi HC III','sHwAlmYg5Hs','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1834,'Bugaana H/C II','','',0,NULL,'Bugana HC II','WNrSmg2aMGz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1835,'Aliwa H/C III','753899895','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1836,'Kandago H/C II','775492120','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1837,'Buyombo H/C II','758724496','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1838,'Butare H/C III (Ntungamo )','782343589','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1839,'Kiguma H/C II','704416299','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1840,'FortPortal Prisons H/C III','716162250','',0,NULL,'Fort Portal Women Prisons HC II','aZyNT3U2LGI','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1841,'St Anthony H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1842,'St Francis H/C III (Soroti)','779950833','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1843,'Nyabihuniko H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1844,'Kigazi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1845,'Bulujewa H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1846,'Bumulisha H/C III','772908937','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1847,'Rwanjura H/C II','773261609','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1848,'Bikurungu H/C III','774954846','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1849,'Kirumba H/C III (Isingiro)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1850,'Biikira H/C III','704247985','',0,NULL,'Bikira/Bikiira Maria  HC III','HXw8RJKyuDz','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1852,'Rubona H/C II','772912839','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1853,'Mucwa H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1854,'Kiyebe H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1855,'Bulwala H/C III','783229204','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1856,'Joy Medical Center (Mbale  )','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1857,'Riki H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1858,'Gborokolongo H/C III','794928830','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1859,'Ruti H/C','785000862','',0,NULL,'Ruti HC II','tlQsh4yJwwb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1861,'Adjumani Mission H/C III','791919994','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1863,'Mbale Main Prisons H/C III','782006378','',0,NULL,'Mbale Main Prison\'s HC III','AtuVg4C11UO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1864,'Kakure H/C II','779470907','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1865,'Itula H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1866,'Aliakamer H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1867,'Lwembajjo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1868,'Kachanga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1869,'Jaana H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1870,'Kahondo H/C II','','',0,NULL,'Kabarole Kahondo HC II GOVT','sZ9PPpo8ejT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1871,'Nyarurambi H/C II','782368976','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1872,'Kabwangasi H/C III','777527725','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1873,'ST Andrew H/C III (Nyarushanje)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1874,'Lwanjusi H/C III','778137347','',0,NULL,'Lwanjusi HC III','roJb8A7yXNm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1875,'Bukimbi H/C II','751164212','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1876,'Isinde H/C II','782904532','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1877,'Bugali H/C II','755451976','',0,NULL,'Bugali  HC II','RfYTyh0UmGQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1878,'Kakore H/C II','702552506','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1879,'Dohwe H/C II','782229255','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1880,'Karinga H/CI II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1881,'Tajar H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1882,'Nangara H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1884,'Namugongo Fund For Special Children','775019662','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1885,'AMG Bugongi- Hope Medical Center','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1886,'ST Martins H/C III ( AMAKIO)','776252599','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1887,'Kisoko H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1888,'St Elizabeth H/C III KIJJUKIZO','705857074','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1889,'Kirika H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1890,'St Francis Of Assis Naddangira H/C III','781009076','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1891,'Nabulola CMC H/C III','779346042','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1893,'Kyanamuyojo H/C III','772354507','',0,NULL,'Kyanamuyonjo HC III','udyIvAUWRfi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1894,'Kahokya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1895,'Community Health Plan (Kibuku)','0777849590','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1896,'Theresa Ledochow H/C II','782375510','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1897,'Gamogo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1898,'Otwee H/C III','774397446','',0,NULL,'Otwee HC III','rnSuCabTqe3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1899,'Kagulu H/C II','750885814','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1900,'Nyakasharara H/C II (Kabale)','775664930','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1901,'Gadafi H/C III','782154269','',0,NULL,'Gaddafi HC III','BMmhOqlF4EB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1902,'Ryeishe H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1903,'Burungira H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1904,'SWAZI H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1905,'Rugazi Mission','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1906,'Rutoto SDA H/C II','703316413','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1907,'Tumu Hospital','759271751','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1908,'Kibuza ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1909,'Mbaba Community','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1910,'Kinaba H/C III','757225160','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1911,'Nyakinoni H/C','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1912,'Nyakashozi H/C','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1913,'Kayonza Tea Factory','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1914,'Butogota HC','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1915,'Kanyantorogo HC','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1916,'Nyakisenyi PNFP ','782856340','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1917,'Nteko H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1918,'Kagezi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1919,'Nyakabande H/C II','','',0,NULL,'Nyakabande HC II','cfVjkhcqQqr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1920,'Bufuma H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1921,'Kemubeizi H/c','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1922,'Ruborogota H/C III','7742880529','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1923,'Bumasobo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1924,'Nyondo H/C III','0775522753','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1925,'Okocho H/C II','754782711','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1926,'Jupanziri H/C III','782692583','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1927,'Kalagala H/C II (Nakaseke)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1928,'Naminya H/C II','787037823','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1929,'Nile Breweries H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1930,'Buziika H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1931,'Bugungu YP H/C III','0784074842','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1932,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1933,'Kazibz H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1936,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1937,'Kasimba Muslim H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1938,'Kizigo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1939,'Senyi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1940,'Namulesa H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1941,'Living Water H/C','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1942,'Bubiro H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1943,'St Joseph\'s Buyege H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1944,'Lweza H/C III (NGO)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1945,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1946,'Nyanama Domicially','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1947,'Nabbingo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1948,'Katende H/C ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1949,'Busesebba H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1950,'Busambala H/C III ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1951,'Emmanuel Medical Centre','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1953,'Rapha H/C','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1954,'Kilokola H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1955,'Kibanga H/C III (St Elisabeth of thuringen ) ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1956,'Kabasanda H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1957,'Mpigi Police','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1958,'Kibigga','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1959,'Bugobango H/C','','',0,NULL,'Bugobango HC II','a93zYnWO0cT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1960,'Kiddawalime ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1961,'Rapha NGO','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1963,'Ngelibalya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1964,'Ngomanene H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1965,'Kanzire H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1966,'Jinja Police H/C III (Maternity)','701156403','',0,NULL,'Jinja Police HC III','QPEq1rVFQA7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(1967,'Kiyindi Landing Site','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1968,'Royal Zan Vanten','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1969,'KIgogola H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1970,'Seeta-Kasawo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1972,'Opopong H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1973,'Oretha H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1974,'Pupukanya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1975,'Obolokome H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1976,'Katabok H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1977,'Kiru H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1978,'Adea H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1979,'Gangming H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1980,'Awach H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1981,'Anita H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1983,'Atunga H/C II ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1984,'Wilela H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1985,'Koya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1987,'Masajja H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1988,'Kitooro H/C II (Private)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1989,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1990,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1991,'Kibugga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1993,'Nanyonia Angikalio H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1994,'Moruita H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1995,'Alakas H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1996,'Natirae H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1997,'Nakaale H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1998,'Nabulenger H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(1999,'Namalu Prison H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2000,'St Mathias Amaler H/C III','778926667','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2001,'Apapai H/C II (kaberamaido)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2002,'Nakibizzi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2003,'Kisimba H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2004,'Dungi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2006,'Lookorok H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2008,'Napumpum H/C II','0789564649','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2009,'Nakwakwa','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2010,'Losilang H/C II','0773878594','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2011,'Lobalangit H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2012,'Morulem H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2014,'Pire H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2015,'Lokori H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2016,'Kopoth H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2017,'Lochom H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2018,'Kakamar H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2019,'Kocholo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2020,'St Jude (Kidepo) H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2021,'Kamion H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2022,'Lokwakalamoe H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2023,'Loyoro H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2024,'Lokanayona H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2025,'Kidepo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2026,'Lomeris H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2027,'Lokerui H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2028,'Lokolia H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2030,'Kalimon H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2031,'Lomodoch H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2032,'Kaimese H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2033,'Narengepak H//C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2034,'Gwere H/C II','','',0,NULL,'Gwere HC II','aFLv0Mbd84E','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2035,'Iboa H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2036,'Indilinga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2037,'Besia H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2038,'Lama H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2039,'Gbalala H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2040,'Lomunga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2041,'Goopi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2042,'Logoba H/C III','78550430','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2043,'FR.Bilbao H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2044,'Showers H/C ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2045,'Akworo H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2046,'Pakwach Mission H/C ','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2047,'Kigo Prisons H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2048,'Nsonzibbirye H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2049,'Ikamiro H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2050,'Kikandwa H/C II (Mubende)','774192370','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2051,'Kanjobe H/C II','773096721','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2052,'Buddabugya H/C III','785732683','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2053,'Kaweweta H/C III','775108554','',0,NULL,'Kaweweta HC II','AUl2LinS4Zb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2054,'Kasambya H/C II (Gomba)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2055,'Mamba H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2056,'Namabeya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2057,'Mawuki H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2058,'Kitwe H/C II (Gomba)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2059,'Luweero Industries','','',0,NULL,'Luweero Industries Ltd Clinic HC II','amOfrCsmDMr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2060,'Franciscan H/C KAKOOGE','','',0,NULL,'Francisca Clinic - NR','K56hypi6AUE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2061,'Kyangatto H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2062,'Nakaseeta H/C II (Nakaseke)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2063,'Kakoola H/C III','772611417','',0,NULL,'Kakoola HC II (Nakasongola)','aNWVZ9aCbQb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2064,'Lusangya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2065,'Namuusale H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2066,'Kabatema H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2067,'Lyakajura H/C III (Nakaseke)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2068,'Lwengenyi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2069,'Kyazanga Muslim H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2070,'Kabayanda H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2071,'Orient Medical Centre','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2072,'ST JOSEPH  H/ C III(Madudu)','784921517','',0,NULL,'St. Joseph Madudu HC III','alZgEM25r1K','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2073,'JCRC (Wakiso)','774576204','',0,NULL,'Joint Clinical Research Center (JCRC)  C','CVoWcUh5ZPP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2074,'Bubalya H/C III','755480363','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2075,'Ngenge H/C III','701755943','',0,NULL,'Ngenge HC III','PfIEJ2cH2SX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2076,'Nazigo Mission H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2077,'Bukamba H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2078,'Nakatovu H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2079,'Namusaala H/C II','','',0,NULL,'Namusaala HC II','EKbyglK4z19','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2080,'Namuyenje H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2081,'Kiyoola H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2082,'Diika H/C II','','',0,NULL,'Diika HC II','Ya7rTeUc2Dy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2083,'Kangalaba H/C III','751622941','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2084,'Kabizzi H/C II','752813722','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2085,'Budongo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2086,'Ntooma H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2087,'Masindi Kitara Medical Center','Kitara H/C III','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2088,'Kitanyata H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2089,'Kugezi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2090,'Kigenga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2091,'Karungu H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2092,'Kigwera H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2093,'Avogera H/C II','777318720','',0,NULL,'Avogera HC III','x5YYIG54agu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2094,'Uganda Matyrs H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2095,'Kihungya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2096,'Sofad H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2097,'Kyakabadiima H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2098,'Galibileka H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2099,'Burora H/C II','775196657','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2100,'Mugalike H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2101,'Mugalike H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2102,'Kyabasala H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2104,'St Marys H/C III(Kibaale)','','',0,NULL,'St Marys HC III Kakindo','zCodguezLzO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2105,'Bathania H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2106,'Kabubwa H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2107,'Mpasaana H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2108,'St Luke Bujuni H/C III (Kibaale)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2109,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2110,'St Aulistin H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2111,'Seeta H/C II','','',0,NULL,'Seeta HC II','llNeiWHW1oW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2112,'Agape H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2113,'Nyamiranga H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2114,'Bamusuta H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2115,'Vumba H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2116,'Bbira H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2117,'Karongo H/C III','703599289','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2118,'Kasambya H/C III (Kakumiro)','778103303','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2119,'Kasaana H/C III','758115686','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2120,'Bucundura H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2121,'Kwanyinyi','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2122,'Awaliwal H/C II','774751438','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2123,'Siita Save Life H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2124,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2125,'Buhaghura H/C III','772824124','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2126,'Bumadanda H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2127,'Kyantungo H/C IV','782492377','',0,'14','Kyantungo HC IV','DsaeEp9J3X4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2128,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2129,'Cardinal Nsubuga H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2130,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2131,'Manya H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2132,'Kibaale  H/C II( Rakai)','772324018','',0,NULL,'Kibaale HC II GOVT','AjwnALSnLrK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2133,'Nazareth H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2134,'St Gyaviira Domicilliary Cilinic','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2135,'St Martin  Clinic (Bukunda)','703832444','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2136,'Pawor H/C III','781409007','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2137,'Wanale H/C III','775407290','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2138,'Sagitu H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2139,'St Francis Of Asiisi Marternity Home (lukaya)','772571917','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2140,'Bulucheke H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2141,'Ongutoi Health Center','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2142,'Nyamityobora H/C III','','',0,NULL,'Nyamityobora HC II','J7hNSRvyUFC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2143,'Bunapongo H/C III','775028600','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2144,'Kawoko muslim H/C III','751075596','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2145,'Teguzibirwa Dom Clinic','701483245','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2146,'Pajulu H/C III (Arua)','774084117','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2147,'Buke Nursing Home','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2148,'Kasasira H/C III','782147786','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2149,'Kitooro H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2150,'Koch Lii H/C II','793767878','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2151,'Touch Namuwongo (IHK)','Immaculate Mbabazi','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2152,'Marine Military H/C II','700404143','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2154,'Muzito Cilinic','781554717','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2155,'Atari H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2156,'Chepsukunya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2157,'Sundet H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2158,'Kiriki H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2159,'Kapteror H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2160,'Chemwon H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2161,'Tukumo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2162,'Mengya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2163,'Terenboy H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2164,'Konta H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2165,'Nsanvu H/C II','782775162','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2166,'Ukusijoni H/C III','779200342','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2167,'Kabelyo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2168,'Kwarus H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2169,'Kaserem Christian H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2170,'','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2171,'Bukhalu H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2172,'Bumugusha H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2173,'Kwoti H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2174,'Kapkwomurya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2175,'Tumboboi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2176,'Kaplelko H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2177,'Reproductive Health Medical Center II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2178,'Gamatui H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2179,'Lumino Catholic','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2180,'Namungodi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2181,'Buwembe H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2182,'Buwumba H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2183,'Busia Police','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2184,'Nabuule H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2185,'Mpongi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2186,'Limoto H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2188,'Kabweri H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2189,'Oloko H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2190,'Kacarura H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2191,'Pallisa Mission Kaucho H/CIII','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2192,'Kaboloi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2193,'Kapuwai Pacodat H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2194,'Obutete H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2195,'Oladot H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2196,'Kapwai H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2197,'Mary Land H/C III','777450165','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2198,'Kagwara H/C II','750723809','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2199,'Kabamba Military Hospital','773774770','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2200,'Pakegido H/C III','779360008','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2201,'Kampala West Medical Clinic','775051525','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2202,'St Magdalene H/C II','779326094','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2203,'Todora H/C II','782040746','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2204,'Community H/C (Kaliro)','754341786','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2205,'Makhonje H/C III','','',0,NULL,'Makhonje HC III','fe5T2gr64Y5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2206,'Kawempe National Referral Hospital','0782650537 or 078265','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2207,'Ogako H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2208,'Kortek H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2209,'Aparanga H/C II','712654165','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2210,'Soroti Medical Associate Nursing Home','777193932','',0,NULL,'Soroti Medical Associates HC II','HOnIGbyX0cw','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2212,'Kaliro Medical Center','750566434','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2213,'Lugala H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2215,'Qudrah Medical Center','','',0,NULL,'Qudrah Medical Clinic','VQEzkkbWHar','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2216,'Kikwayi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2217,'Bukomansimbi Medical Centre','753331341','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2218,'Hakishenyi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2219,'Angaya H/C III','774351121','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2220,'SAREC Medicare Center','700665522','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2221,'Dr Ambrosolic Clinic (Kaliro)','0785083870','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2222,'Kitala H/C II','775361737','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2223,'Alemere H/C II','783479888','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2224,'Kapeta H/C II','7743392119','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2225,'Aliwang H/C III','775064649','',0,NULL,'Aliwang HC III','L4ABgSqNsXd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2226,'Kamulegu H/C III','702112742','',0,NULL,'Kamulegu HC III','VQlQ4IXDdFm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2227,'Kyamwinula H/C III','772440973','',0,NULL,'Kyamwinula HC II','aFasKwyj7DC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2228,'Lugazi  H/C II','753474238','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2229,'Haama H/C II','752468355','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2230,'Lolwe H/C III','','',0,NULL,'Lolwe HC II','ZFd998k7ZbK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2231,'Bwindi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2232,'Kafunjo H/C II','','',0,NULL,'Kafunjo HC II','P3xQ9rXeVdo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2233,'Kitunga H/C II','777841057','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2234,'Kalibu H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2235,'Kashagazi H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2236,'Burondo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2237,'Rwengara H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2238,'Butama H/C III','','',0,NULL,'Butama HC III','EV2MoBNsOm6','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2239,'Bulyambwa H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2240,'Buhanda H/C II','0775246087','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2241,'Busoru H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2242,'Kasulenga H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2243,'Bundingoma HC II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2244,'Musandama H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2245,'Bupompoli H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2246,'Bundimulangya H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2247,'Kayenje H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2248,'Bujwanga H/C II','771428391','',0,NULL,'Bujwanga HC II','rQ56RjtAmYQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2249,'Abalang H/C II (Kaberamaido)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2250,'Wera H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2251,'Ongongoja H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2252,'Akurao H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2253,'Okoritok H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2254,'Opeta H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2255,'Olilim H/C II (Katakwi)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2256,'Palam H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2257,'Kaliro T C H/CII','775246303','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2258,'Rurongo H/C II','777306703','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2259,'Posta Uganda','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2260,'Bukunga H/C III','782907272','',0,NULL,'Bukunga HC II','xbHb2porYoF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2261,'Bulunagi H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2262,'Rwemigina H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2263,'Bira HC III','779700550','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2264,'Kyengera H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2265,'Bugema University H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2266,'Lujjabwa H/C II','751947144','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2267,'Buyambo H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2268,'Buchumba H/C II','776409201','',0,NULL,'Buchumba HC II','g3Jd6rCEYTc','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2269,'Apyeta H/C II','775129930','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2270,'Lyama H/C III','701558464','',0,NULL,'Lyama HC III','z2Ye13P7ajL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2271,'Anyacoto H/C II','777786876','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2272,'Syanyonja H/C II','755607128','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2273,'St Jude ULEPPI H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2274,'Amwoma H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2275,'Biko H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2276,'Mt Elgon Hospital (Mbale)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2277,'Bwondha HC II','755757657','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2278,'Sirimula H/C III','782200434','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2279,'Buyaga H/C III (Masaka)','759024150','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2280,'Dibolyec H/C II','772388741','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2281,'Kasekulo H/C II','785026432','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2283,'Kachung H/C II','782723162','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2284,'Wanyange (St Benedict)','752832172','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2285,'Kyampangara H/C II','787508850','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2286,'Lukaya Health Care Centre (Uganda Cares)','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2287,'Awiri H/C II','777112388','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2288,'Muwumba H/C III','783710004','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2289,'Wakawaka H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2291,'Katum H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2292,'Te-Got H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2293,'Mbale Police H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2294,'Bumugusha H/C III (Bulambuli)','','',0,NULL,'Bumugusha HC III','CwPZMYQPea5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2295,'Bwama H/C III','775930279','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2296,'Kyobugombe H/C II','782377141','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2297,'St Francis H/C II','779202094','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2298,'Oburin H/C II','775027440','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2299,'Alango H/C II','782556798','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2300,'Atangwata H/C III','757165056','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2301,'All Saints H/C II','777371190','',0,NULL,'All Saints HC II','M2Es7QYNu3D','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2302,'Pawel Angany  H/C II','774848926','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2303,'Lagot H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2304,'Good Health for Women Project Clinic (MRC/UVRI)','0772646017','',0,NULL,'Medical Research Center Clinic','yKnFg0zI7sP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2305,'Zaam Medical Center','771845789','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2306,'Oitino HCII','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2307,'Masiyompo H/C III','772394032','',0,NULL,'Masiyompo HC III','m1B0rCFe5za','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2308,'Bukedea Mission Dispensary','7025051972','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2309,'Wentz Medical Center','772655045','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2310,'Namiti H/C II','779348652','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2312,'Multicare Medical Centre','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2313,'St Austin H/C II(Mbale)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2314,'Masolya H/C II','756742331','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2315,'Lokales H/C II','','',0,NULL,'Lokales HC II','emjerwHdu0g','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2316,'Allustin H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2317,'Ruhomuro H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2318,'Kanu H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2319,'405 Brigade HC III','0784083246','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2320,'Kakira H/C III (Jinja)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2321,'Kidubuli HCIII','773984355','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2322,'Barjobi HCIII','772025255','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2323,'Masindi Military Hospital','783945484','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2324,'IDI Mulago','772352116','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2325,'Fastline Medical Centre','753213130','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2326,'Kitovu Mobile','774396177','',0,NULL,'Kitovu Mobile Clinic','LKn50qRDDAB','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2327,'Rwangara H/C II','774117518','',0,NULL,'Rwangara HC II','tS7W7E9zJq3','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2328,'Rwenyangye H/C II','774487962','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2329,'Mulombi Health Centre II','753027938','',0,NULL,'Mulombi  HC II','kHostqbVYCJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2330,'Faith Mulira Health Care Center','775556356','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2331,'Barocok H/C II','712239917','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2332,'Hope Medical Centre','779374806','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2333,'Royal Health Care','774545265','',0,NULL,'Royal Health Care','Ek95dowFfiN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2334,'Padibe West H/C III','706052468','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2335,'Agirigiroi H/C II','783242081','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2336,'Kakooge H/C II (Kidera)','756928794','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2337,'Eseri Domiciliary Clinic','784935470','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2338,'Equator Health Services','774905909','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2339,'Muhoti Military H/C III','784434850','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2340,'Munobwa Clinic','7002299429','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2341,'Kayanja H/C II','782952313','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2342,'Kamubeizi H/C II','771418206','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2343,'Butiru Chrisco Hospital','787727809','',0,NULL,'Butiru Chrisco HC III','JHUDOhEfQ9t','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2344,'Alanyi H/C III','784775900','',0,NULL,'Alanyi HC III','pk373UmcJEF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2345,'Ruhumuro H/C III','','',0,NULL,'Ruhumuro HC III','bDQh7NSmTZd','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2346,'Aganga H/C II','777038324','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2347,'Midas Touch Medical Services','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2348,'Nyabuswa H/C III','706942454','',0,NULL,'Nyabuswa HC II','OwDder9Wkwn','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2349,'Arua Police H/C III','776031982','',0,NULL,'Arua Police HC III','Oib4aFmRmve','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2350,'Akoboi H/C II (Serere)','772194595','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2351,'Medik Hospital Kawempe','773630335','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2352,'Kaabong Mission H/C III','787633765','',0,NULL,'Kaabong Mission HC III','jvPJLFJ3Rt1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2353,'Anep Moroto H/C II','782434589','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2354,'Amusus H/C II','783900525','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2355,'Ogwete H/C II','773116855','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2356,'Naweyo H/C III','759410502','',0,NULL,'Naweyo HC III','UEVOLIT1crh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2357,'Double Cure Medical Centre','772016917','',0,NULL,'Double Cure Med Center CLINIC','aOHWQc76Dvu','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2358,'Pangira H/C II','784805819','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2359,'Kibuzigye H/C II','788353787','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2360,'Nakwasi H/C III','757142666','',0,NULL,'Nakwasi HC III','YEgOR0cGGnF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2361,'District Medical Officer\'s Clinic H/C II','782151782','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2362,'Abalang H/C II (Dokolo)','782734502','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2363,'Kristina H/C II','775077735','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2364,'Apeitolim H/C II','783477077','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2366,'Busabi H/C III','779345296','',0,NULL,'Busabi HC III','YFyMK0BnLsG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2367,'Akide H/C II','783237827','',0,NULL,'Akide HC II','Kf1o8kvbbaS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2368,'Nansana H/C II','782834773','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2369,'Uganda Cares (Soroti)','782555940','',0,NULL,'Uganda Cares Soroti','UhJgr2Abb0p','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2370,'Diocese Of Kitgum H/C II','775013893','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2371,'Soft Power Health Clinic','776973082','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2372,'St Benedict Health Center','0701906137','',0,NULL,'St. Benedict\'s HC III','OZm6EKHBeMU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2373,'Kaboloi H/C III','','',0,NULL,'Kaboloi HC III','mPn3Kj2J8r0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2374,'Jinja Remand H/C II','787431000','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2375,'Jinja Main Prison H/C III','772432358','',0,NULL,'Jinja Main Prison HC III','aITcTSaL6bT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2376,'Awaca H/C IV','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2377,'St Jacob Health Center(Lwamaggwa)','776487439','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2378,'Naiku Health Centre III','779444875','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2379,'St Monica Birongo H/C III (Kalungu)','700302855','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2380,'Rabachi H/C II','783145980','',0,NULL,'Rabach HC II','H3h7DWBLt08','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2381,'Kishagazi H/C II','782293716','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2382,'SCSC+AC0-Kimaka H/C II','781475259','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2383,'Jjanda H/C III','782194608','',0,NULL,'Jjanda HC III','mfPV8jsUnyy','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2385,'Nkungu H/C III','772090041','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2387,'Kerekerene H/C III','776099234','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2388,'Awelo H/C II','774827612','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2390,'Abia H/C II','7509972267','',0,NULL,'Alebtong Abia HC II GOVT','SNwc1CQIXTN','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2391,'Lapul H/C III','756149876','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2392,'OMBIDRI ONDREA H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2393,'Kitunga H/C II (Kabale)','779211721','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2394,'Alnoor H/C II','779818555','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2395,'Rapha Medical Centre(Wakiso)','0772853398','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2396,'Aids Information Centre (Arua)','0776248007','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2397,'Outreach (URA)','0753808181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2398,'Abako Elim H/C II','0778898887','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2399,'Jaguzi H/C II','0752980122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2400,'Alapata H/C II (Dokolo)','0783415873','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2401,'Donna Carnevale Medical Centre','0703650657','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2402,'Outreach Makerere','0753808181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2403,'Mukwaya General Hospital','0772902696','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2404,'Outreach Tororo','0753808181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2406,'CPHL','','',0,NULL,'Central Public Health Laboratories','SMIjfVQOl1g','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2407,'Outreach Lugogo Grounds','0774347122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2408,'Outreach Uganda Meseum','0774347122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2409,'Kalege H/C II','0771889800','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2410,'Dramba H/C II','0784340895','',0,NULL,'Dramba HC III','C7aRTKKbxEP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2411,'Busunju H/C III','0784756534','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2412,'St Balikuddembe H/C III','0786228002','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2413,'Akura II','0772635911','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2414,'Aids Information Center(Mbale)','','',0,NULL,'AIC Mbale Main Branch CLINIC','v9p3jFvYYtP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2415,'Kagarama H/C II','0773553369','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2416,'Kampala Medical Chambers','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2417,'Outreach Wakiso','0774347122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2418,'Buziirasagama H/C II','0756497019','',0,NULL,'Buzirasagama HC II','ZAhGP8KMuzQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2419,'Outreach Parliament','0774347122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2420,'Kyadondo Medical Centre','0701062885','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2421,'Kirumba H/C II','0787608422','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2422,'Charis H/C III','0777113777,772738880','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2423,'Kibengo H/C III (Luweero)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2424,'Holy Innocents H/C III (Bukedea)','0786947000','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2425,'Military Police H/C III (Makindye)','0777394045','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2426,'St Charles Kabuwoko H/C III','0759955030','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2427,'Case Hospital','0772033552','',0,NULL,'Case Medical Centre','aT1aouq7op5','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2428,'Buyaga H/C III','0752614638','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2429,'Kalungi H/C III (Kalungu)','0785012625','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2430,'Ogom H/C III','0775077735','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2431,'Henrob Medical Centre','0776239291','',0,NULL,'Henrob Family Clinic','u3SLVGPpWI8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2433,'Nsale H/C II','0755751157','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2434,'Outreach Ndeeba','0774347122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2435,'Kasobi H/C III','0777822688','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2436,'Oluko Solidale H/C III','','',0,NULL,'Oluko Solidale HC III','b8XUrI7irw7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2437,'St Assumpta H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2438,'Benedict Medical Centre','0788336378','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2439,'Kigasa H/C II','0776111333','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2440,'Family Care Hospital','0786514531','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2442,'Angagura H/C III','0777368930','',0,NULL,'Angagura HC III','ygTUi4HvPHJ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2443,'Migamba H/C II','0789877177','',0,NULL,'Migamba HC II','ejl0uMalFn1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2444,'Patika H/C II','0782532787','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2445,'Chandaria Medical Clinic','0773146462','',0,NULL,'Chandaria Medical Clinic','LuEKO4AaQZZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2446,'Nagwere H/C III','0776008574','',0,NULL,'Nagwere HC III','rLRgiOLdAhU','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2447,'Nkabbani H/C III','0789222206','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2448,'309 Brigade Kavera H/C III','0775187626','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2449,'St Philips H/C II','0775333316','',0,NULL,'St. Philips HC II','LPJ8Gxge7ig','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2450,'Emergency Operations Centre','0753808181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2451,'Aids Information Centre (Kampala)','0776248007','',0,NULL,'AIC Kampala Main Branch HC IV','rxoAz9lkuSi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2452,'Karwensanga H/C II','0775296080','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2453,'Rwenzori Medical Centre','0773277846','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2455,'St Luke H/C II (Gulu)','0785547921','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2456,'Bulwadda H/C II','0755874093','',0,NULL,'Bulwadda HC II','QLJmdTgkB3N','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2457,'Kabambiro H/C III','','',0,NULL,'Kabambiro HC II','HbRR9Kem65L','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2458,'Morulinga H/C II','','',0,NULL,'Morulinga HC II','ZwJpmihjbfr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2459,'Abwoch H/C II','0779755726','',0,NULL,'Abwoch HC II','JryqknC2SNp','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2460,'Buwangwa H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2461,'Span Medicare Kisaasi','0785200809','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2462,'Kansambwe H/C II','0774310376','',0,NULL,'Kasambwe HC II','aB8VPjofx5K','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2463,'Masira H/C III','0703487426','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2464,'Rulongo H/C II','0700349175','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2465,'Outreach Mulago','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2466,'Otumbari H/C III','0780710075','',0,NULL,'Otumbari St. Lawrence HC III','lh4zqCHzHIM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2467,'Dream Centre Uganda','0783742459','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2468,'Apire H/C III','0773577763','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2469,'Rwabarata H/C II','0787978075','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2471,'Pakinach H/C IV','0772900764','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2472,'Shared Blessings H/C III','0751544198','',0,NULL,'Shared Blessings HC III','Rr6qa2nv12k','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2473,'St Kizito H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2474,'Mayanja Memorial Hospital','0773944259','',0,NULL,'Mayanja Memorial HOSPITAL','ag4c3yS7T5g','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2475,'Kanziira H/C II','0772452238','',0,NULL,'Kanzira HC II','SCOrhnwQX8k','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2476,'Rift Valley Medical Centre','0772685456','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2477,'Budwale H/C III','0779733968','',0,NULL,'Budwale HC III','tZX3IqSxAr1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2478,'Lulyango H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2479,'Bugoto H/C II','0780561378','',0,NULL,'Bugoto HC II','FICwy0lTFNW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2480,'Hassan Tourabi','0759528258','justinokiring@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2481,'Obim H/C','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2482,'Kyayi H/C III','0751862494','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2483,'Rukoki H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2484,'Kamuli District Govt Hospital','','',0,NULL,'Kamuli Hospital','LVFyV61bpdi','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2485,'Outreach Bundibugyo','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2486,'Kiige H/C II','','',0,NULL,'Kiige HC II','Xh5eLA8vMYG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2487,'Tegot H/CII','0782841055','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2488,'Kabonero H/C III','0783851005','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2489,'Mulago National Hospital-MUJHU CLINIC','0702331403','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2491,'St Mauritz H/C II','0782848660','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2492,'ST Marys H/C II Katoosa','0772364806','',0,NULL,'St. Mary\'s Katoosa HC II','pEi4KzFW4nv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2493,'Outreach Excell','0774347122','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2494,'Mbaya H/C III','','',0,NULL,'Mbaya HC III','fSqSx3rnDmx','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2495,'Outreach Burambagira PS','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2496,'St Francis H/C III (Njeru-Buikwe)','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2497,'Kosiroi H/C II','0783984922','',0,NULL,'Kosiroi HC II','THC1QUnraXF','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2498,'Orungo H/C III','0775540409','',0,NULL,'Orungo HC III','WmoemTft5Bj','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2499,'Kyakuterekera H/C III (Kakumiro)','0703648030','',0,NULL,'Kyakuterekera HC III','pWrHCTnuvFm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2500,'Lira Military Barracks H/C III','0772587248','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2501,'Nakiloro H/C II','0774563939','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2502,'Bukasa H/C II (Mpigi)','0773787356','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2503,'Butambala outreach','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2504,'Ayira Health Services','0773121133','',0,NULL,'Ayira Health Services','FkTtVWHYtc1','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2505,'Mola Medical Centre','0774000003','',0,NULL,'Mola Medical Centre HC II','Vc52QmdPT1X','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2506,'Kiyagara H/C II','0789225277/075437515','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2508,'Olivu H/C III','078289037/0784646542','',0,NULL,'Olivu HC II','f2Whd5ubYn8','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2509,'Odoubu H/C III','0782890357/078465427','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2510,'Imvepi H/C III','0782890357/078465427','',0,NULL,'Imvepi HC II','DDbLsI5S91i','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2511,'Ntabuswa h/c iii','0781085460','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2512,'Bethany Women & Fertility Hospital','0704964963','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2513,'Kisojjo H/C II (Bukomansimbi)','0774727679','',0,NULL,'Kisojjo HC II GOVT','ogD8wXFjIUD','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2514,'Ocan Agenne H/C III','0779472121','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2515,'Ocokican H/C II','0774303912/070432263','',0,NULL,'Ocokican HC II','PmFgAvnih83','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2516,'Old Kampala Hospital','0702780158','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2517,'Outreach Africana','0753808181','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2518,'Outreach Luuka','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2519,' OutReach Kitwe Town School','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2520,' Outreach Mother Care Primary School','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2521,'Maranatha H/C II','0774512264','',0,NULL,'Maranatha HC III','VWrdPPDI0XP','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2522,'Gulu Police H/C III','0784822899','',0,NULL,'Gulu Police HC II','afGTmR6EesS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2523,'St Monica H/C II (Gulu)','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2524,'Kasenyi ART Site','0757853398','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2525,'Buyanja H/C II (Bushenyi)','0705764855','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2526,'Ministry of Defence Clinic(Mbuya)','0774127036','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2527,'Bunagami H/C III','0777269814','',0,NULL,'Bunagami HC III','a3qhORZNhaG','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2528,'Namengo H/C III','0774514129','',0,NULL,'Namengo HC III','dJd3ohZ6VTQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2529,'Ddamba H/C III','0776158783','',0,NULL,'Damba HC II','UPSV6y2j0B0','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2530,'Kwayiy H/C III','0773772624','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2531,'St Catherine Hospital','0775113105','',0,NULL,'St. Catherine HOSPITAL','mbiBOQltGeh','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2532,'Bregma Medical Centre','0771623076','',0,NULL,'Bregma HC II','k1Ady0jT3QS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2533,'Ojom H/C II','0782169971','',0,NULL,'Ojom HC II','DEMEh3VEW72','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2534,'Rushasha H/C III','0782798813','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2535,'Nyumanzi H/C II','0778829990','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2536,'Buyiga H/C III','0771662935/075875405','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2537,'Latoro H/C II (Nwoya)','0754362696','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2538,'Kitante Medical Centre','0701388333','',0,NULL,'Kitante Medical Center HC II','wqsIFyvLng4','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2539,'Nabutongwa H/C II','0783243677','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2540,'Elema H/C II','0777911094','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2541,'Galilee Hospital','0772056613','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2542,'Kisagazi H/C II','0789286939','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2543,'St Richard Medicare Centre','0782474238','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2544,'Ahmadiyya H/C III','0756566250','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2545,'Aids Information Center(Jinja)','07540765330','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2546,'Nalufenya Children\'s Hospital','0772996164','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2547,'Crane Health Services','0773248172','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2548,'Charisma Medical Health Services','0753017110','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2550,'Butemba H/C III(Kiruhura)','0778930856','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2551,'Santa Maria Medicare','0774420721','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2552,'Opeta H/C III (Kole)','0782479672','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2553,'Kairos H/C IV','0781595556','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2554,'Butoloogo H/C II (C/o Madudu H/C III)','0702583443','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2555,'Mbarara Police H/C III','0789276600','mbarara@example.com',0,NULL,'Mbarara Police HC III','xLi1cv6UPxT','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2556,'Kalagala H/C II(Buikwe)','+256700000000','kalagala@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2557,'Kabyuma H/C II','0783081566','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2558,'St Joseph\'s Hospital Wakiso','0779835001','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2559,'Bumalenge H/C II','0777802115','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2560,' Arabaka H/C II','0777575015','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2561,'Kako H/CIII','0700169307','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2562,'Cherish H/C III','0777800682','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2563,'Buliisa  General Hospital','0788396527','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2564,'Nakapelimen H/C II','0782841738','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2565,'Anyangatir H/C III','0773726131','',0,NULL,'Anyangatir HC II','PLdHddb1W06','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2566,'Busabala Road Nursing Home','0753420900','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2567,'Ayilo H/C III','0779772846','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2568,'Muhanga COU H/CII','0783730735','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2569,'Kashaka H/C II','0784837010/070268749','',0,NULL,'Kashaka H/C II','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2570,'Mukondo H/C II','0775509397','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2571,'Kabalega Medical Centre','0752875113','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2572,'Buhugu H/C III','0704523899','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2573,'Ofua MSF H/C III','0779168464','',0,NULL,'Ofua HC III','BSrrPPLiBZo','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2574,'Outreach Kamuli Hospital','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2575,'Zombo H/C III','0782107565','',0,NULL,'Zombo HC III','tuYjF238GTf','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2576,'Mabale(Kyenjojo) H/C II','0701120707','',0,NULL,'Mabale Tea Factory HC II','ajogQebjO0O','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2577,'Rutooma H/C II','0772449411','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2578,'Sebigoro H/C III','0789885210','hoima@example.com',0,NULL,'Sebigoro HC III','Xa2GHu3YN8X','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2579,'Lyakajula H/C II (Lyantode)','0705141248','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2580,'Tonya H/C II','0785459344','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2581,'Panyadoli Hills H/C II','0781976997','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2582,'Nama Wellness Centre','0774425734','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2583,'Kigangazi H/C II','0757559667','',0,NULL,'Kingangazzi HC II','dRVlZtrIfcM','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2584,'Ogonyo H/C III','0777369270','',0,NULL,'Ogonyo HC III','afJ9NgYTYDa','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2585,'Latanya H/C III','0773535429','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2586,'Rukungiri Police H/C III','0753011925','',0,NULL,'Rukungiri Police HC II','krX5G0oMDPX','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2587,'Adagmon H/C II','0777112377','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2588,'All Saints Buchanagandi H/C III','0788196411/070491699','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2589,'Ewanga H/C III','0774738058','',0,NULL,'Ewanga HC III','ppjhr0L8daE','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2590,'Bugolobi Medical Centre','0781489413','',0,NULL,'Bugolobi Medical Centre HC II','bnKRmW2sm3g','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2591,'Nkokongeru H/C II (Buikwe)','0782872284','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2592,'Omodoi H/C II','0777383783','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2594,'Kangulumira Intergrated','','',0,NULL,'Kangulumira I.H.P HC II','jAkXsSQHYAZ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2595,'Magamaga Army H/C III (Mayuge)','0784232461','',0,NULL,'Magamaga Barracks HC II','a1C0sK4I6RS','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2596,'Uganda Martyrs\' Hospital (Mbalala)','0704423729','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2597,'Bukatube H/C II','0751622325/077462232','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2598,'Kabasa Memorial Hospital','0757101200','',0,NULL,'Kabasa Memorial HOSPITAL','Xm71SWWTqfb','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2599,'Igombe H/C III','0785340315','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2600,'Bazadde Clinic','0702085405','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2601,'Good Hope Medical Centre','0789084362','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2602,'Pakor H/C II','0785411220','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2603,'Gombe H/C II','0755849180','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2604,'Mbaliga H/C II','0757773751','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2606,'Mpongo H/C II','0703600739','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2607,'Abunga H/C II','0775896612','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2608,'Kateete H/C II','0704514999','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2609,'Inuula H/C II','0704466970','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2610,'Atipe H/C II','0788105588','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2611,'Busaale H/C II','0782939279','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2612,'Katwe Martyrs Clinic','0757762928','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2613,'Kagorogoro H/C II','0784072156','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2614,'Kayonza H/C II (Rakai)','0785638370','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2615,'Muzinda Katereke H/C II','0752099522','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2616,'Butove H/C II','0778318813','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2617,'Namaitsu H/C II','0789387851','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2618,'Kasolwe H/C II','0752681185','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2619,'Kibuye H/C II','0778460895','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2620,'Ngandho H/C II','0753710333','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2621,'Bugeywa H/C II','0704639559/078294156','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2622,'Namungo H/C II','07888019454','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2623,'Kashekye H/C II','0784743823','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2624,'Naluvule Medical Centre','0788711716','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2625,'Kansambya H/C II','0782393285','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2626,'Mitete H/C II','0752440141','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2627,'Kagamba H/C II','0759112010','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2628,'Kagoggo H/C II','0751407485','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2629,'St Aloysious Ngobya Dom.Clinic','0778927890','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2630,'Nakitembe H/C II','0750821865','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2631,'Kyengando H/C II','0774388697','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2632,'Kanyatsi H/C II','0778001666','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2633,'Kisansala H/C II','07021621782','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2634,'Kenkebu H/C II','0782961843','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2636,'Masya H/C II','0782711975','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2637,'Ayago H/C II (Apac)','0787566070','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2638,'Atura H/C II','0773190439','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2639,'Kanyumu H/C II (Pallisa)','0781518298','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2640,'Parabongo H/C II','0779941128','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2641,'Okinga H/C II','0785454720','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2642,'Busuyi H/C II','0775386421','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2643,'Kamusala H/C II','0787780700','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2644,'Atyenda H/C II','0771812564','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2645,'Bugiri H/C II (Kanungu)','0775948501','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2646,'Alere H/C II','0779707236','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2647,'Kanseera H/C II','0702100117','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2648,'Bweyongedde H/C II','0784604723','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2649,'Dr Panagiotis H/C III','0782614599','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2650,'Tuku H/C II','0775802961','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2651,'Alop H/C II','0788417719','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2652,'Mutushet H/C II','0783378121/077142343','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2653,'Wandago H/C II','0756108732','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2654,'Lamiyo H/C II','0771213757','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2655,'Bugambo H/C II','0773253205/075271639','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2656,'Kihembo SDA H/C II','0772046228','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2657,'Nakaseeta H/C II (Mityana)','0704406147','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2658,'Rwene H/C II','0759656121','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2659,'Kibinga H/C II','0781992203','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2660,'Kiwalazi H/C II','0781992203','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2661,'Pamya H/C III','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2662,'Guruguru H/C II','0789321251','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2663,'Osia H/C II','0785007861','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2664,'Rurama H/C II','078545972','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2665,'Masaka Armoured Brigade H/C III (A/BDE)','0772339118','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2666,'Pope John\'s Hospital','0779758912','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2667,'Ambelechu H/C II','0779478927','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2668,'Uganda Sickle cell Rescue Foundation','0788831915','emusiimenta@uscrfuganda.org',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2669,'Najirae H/C II','0775950177','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2671,'Kikamba H/C II','0774218712','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2672,'Rupa H/C II','0777410345','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2673,'Apuce H/C II','0777363380','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2674,'Ngeribalya H/C II','0778728017','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2675,'Kiwumu outreach','0752822247','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2676,'Aoet H/C III','0773572748','',0,NULL,'AOET HC II','YUaxNtqNWFW','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2677,'Pagirinya H/C III','0785292584','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2678,'Lwebabule H/CIII','0702966204','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2679,'Ngomba H/C II','0779804016','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2680,'Ariba H/C II','0775348843','',0,NULL,'Ariba HC II','LLYB1JRn1UL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2681,'Ayiri H/C III','077186993','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2682,'St Francis H/C II (Akia)','0775767148','',0,NULL,'St Francis H/C II (Akia)','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2683,'Adwir H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2684,'Mugiti H/C III','0782514516','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2685,'Kabigi Muslim H/C II','0703331772','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2686,'Bugona H/C II','0789787401','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2687,'Hamukungu H/C II','0775196818','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2688,'Omarari H/C II','0777779399','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2689,'Angetta H/C II','0773334805','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2690,'Kasozo H/C II','0774647879','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2691,'Murisa Nursing Home','0705373402','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2692,'Mukisa Nursing Home','0705373402','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2693,'Nakasero Hospital','0774596061','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2694,'Uriama H/C II','0788209047','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2695,'Lukwir H/C II','0787405402','',0,NULL,'Lukwir HC II','Uu40YoS0Mvr','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2696,'Makoole','0775621498','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2697,'IRC H/C II ZONE V','0782158410','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2698,'Awei H/C II','0780964143','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2699,'Buyamba H/C III (Rakai)','0775568796','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2700,'Le Memorial Medical Sevices','0705354896','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2701,'Rwetango H/C II','0784091611','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2702,'Yangani H/C III','0786597878','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2703,'Oteno H/C II','0774579695','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2704,'Hoima Police H/C III','0774853633','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2705,'Christ The King Health Centre And Maternity','0772869519','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2706,'Kapkoros H/C II','0782273959/075527395','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2707,'Triam Medical Centre','0789552411','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2708,'SDA H/C III (Mbale)','0786800905','example@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2709,'St Thereza H/C II Kabogwe','0786641527','example@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2710,'Vine Medicare Clinic','0704546693','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2711,'Mother Angioletta H/C II','0782980731','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2712,'Ikan Medical Centre','0778722372','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2713,'Prime Care Medical Center','0777996783','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2714,'St Ann H/C III','0788850008','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2715,'Epi Centre H/C II (Mpigi)','757895866','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2716,'Bidibidi H/C III','0782224462','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2717,'St Elizabeth Ntuusi H/C III (NGO)','0773643176','',0,NULL,'St Elizabeth Ntuusi H/C III (NGO)','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2718,'Kasawo Mission H/C II','0781836393','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2719,'Masindi Police H/C II','0776423929','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2720,'Alleluyah Maternity Joint Clinic','0789666826','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2721,'Adventist Medical Centre','0779696707','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2722,'Kiziiko H/C II','0753661160','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2724,'Nyamirami H/C IV (Kasese)','0774552460','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2725,'Munathamat Health Centre','0753346746','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2726,'STD/MARPI Clinic-Mulago','0757519064','',0,NULL,'Mulago National Hospital- MARPI STI Proj','U6DZjzffCuQ','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2727,'Agule Community H/C III (NGO)','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2728,'St Luke H/C III Kkonge','0757798762','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2729,'St Charles Medical Centre','0777388897/070138257','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2730,'Comboni Samaritans of Gulu H/C II','0773685513','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2731,'Kyabakara H/C II','0701915647/077461494','',0,NULL,'Kyabakara H/C II','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2732,'Paluda H/C III','0784471405','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2733,'Mbuye H/C III','0754914861','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2734,'Mulago NRH - EID POC','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2735,'Jomorogo H/C III','0786779028','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2736,'Sas Clinic Kampala','0782981048','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2737,'Flama Uganda (GULU)','0773998111','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2738,'Rwagimba H/C III','0779171675','',0,NULL,'Rwagimba HC III','EBCRwGo5bqm','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2739,'Twajiji H/C III','0785806967','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2740,'Kazinga H/C II (Rubirizi)','0787694796','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2741,'Bukurungu H/C II','0785062332','',0,NULL,'Bukurungu HC II','PgnmZSSRbeL','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2742,'Mushumba H/C II','0784837010','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2743,'The Surgery','0778639320','',0,NULL,'The Surgery CLINIC','r7gaWycU27e','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2744,'Abedober H/C III','0777806491','',0,NULL,'Abedober HC III','YhPJwSvxDcC','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2745,'Kaluuba H/C II','0771858645','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2746,'Kabaale H/C II (Ssembabule)','0778787309','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2747,'Nyakahiita H/C II','0782764697','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2748,'Ntete H/C II','0757077394','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2749,'Bolo H/C II','0779998857','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2750,'Wansalangi H/C II','0776644043','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2751,'Kabembe Health Centre','0774425734','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2752,'Masaka Health Care Centre (Uganda Cares-Masaka)','0701370078','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2753,'Arapai H/C II','0773406652','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2754,'St Claret H/C II (Nyabwina)','0754737457','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2755,'Above All Medical Centre','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2756,'Igamara H/C III','0779205502','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2757,'Aduku Mission H/C III','0781868386','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2758,'MJAP-MUH','','',0,NULL,'Makerere University HC III','Y3K5vv9cdJ7','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2759,'CDC-Kiruddu','','',0,NULL,'Mulago Medical Services - Kiruddu?? Lab.','NoxDnStfVIK','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2760,'Belle H/C IV','0788121535','',0,NULL,'Belle H/C IV','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2761,'Diagnostic World Laboratories Ltd','0780294841','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2763,'Ndangaro H/C II','0754024006','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2764,'Kabaka Foundation Hospital','','',0,NULL,'Kabaka Foundation Hospital','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2765,'Pader Maternity Home','0771958915','',0,NULL,'Pader Maternity Home','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2766,'Act Medical Centre','0758731839','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2767,'People\'s Medical Center','0772092598','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2768,'Almeca Hospital','0706813003','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2769,'Abala H/C II','+256777350726','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2770,'Dajje H/C II','0773809194/075566873','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2771,'Kasana H/C II (Mukono)','0754471220','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2772,'MUWRP Clinic','0772324441','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2773,'Stefano Campagnolo Memorial H/C','0787468181/071121872','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2774,'Idiwa H/C III','0779912083','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2775,'Kali  H/C II','0779986666','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2776,'Okubani H/C III','0775552337','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2777,'Kajoji H/C III','0774703557/075664682','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2778,'Binyanga H/C IV','0775484851','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2779,'Kasonga H/C II','0774370273','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2780,'Loinya H/C II','0774611367','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2781,'Luzira H/C III','0788088266','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2782,'Bamu Hospital','0702602332','',0,NULL,'Bamu Hospital','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2783,'Mbale Peoples Hospital','0775522753','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2784,'Elim Medical Centre','0703576264','eid@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2785,'Kampala Hospital','0776983590','kampala@example.com',0,NULL,'Kampala Hospital','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2786,'Benedict Medical Center','+256983519','benedict@example.com',0,NULL,'Benedict Medical Centre  HC IV','QUd8daomu0P','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2787,'Tororo Police H/C III','0788998518','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2788,'Kapaapi H/C III','0772350959','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2789,'Mulango EID Clinic','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2790,'Awich H/C II','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2791,'Komgbe H/C III','0789437477','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2792,'Sanyu Clinic','0704393444','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2793,'kampala Hospital','0785921895','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2794,'Jaro Hospital','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2795,'Alito H/C II','0785921895','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2796,'Victoria Medical Centre','0785921895','vic@example.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2797,'Luru H/C III','0773547620','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2798,'Oyima H/C III','0789822560','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2799,'FIMRC H/C III','0781984427','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2800,'Malere H/C II','0777592071','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2801,'Iyete H/C III','0779820595','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2802,'Busoga H/C II','+256777591430','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2803,'Watoto Suubi H/C III','0774567320','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2805,'Maratatu B H/C III','0774000003','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2806,'Mc Farland Memorial Medical Centre','0777819159','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2807,'Buwenge NGO','0773371580','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2808,'Nansanga H/C III','+256774152792','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2809,'Arinyapi H/C III','0776478208','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2810,'St Joseph Health Care Clinic','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2811,' Kampala International Medical Centre','0775377030','kampala@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2812,'Swinga H/C III','0774940440','',0,NULL,'Swinga H/C III','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2813,'Restoration Gateway H/C II','0785073631','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2814,'Iran Hospital','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2815,'Uganda Cancer Institute','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2816,'Agakhan University Hospital','0706469420','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2817,'Kabahango H/C III','0779851158','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2818,'ST ULRIKA H/C III','0774201525','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2819,'Victory Medical Centre (Gulu)','07799445967','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2820,'Nyakadot H/C II','0786332917','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2821,'Bumasikye H/C III','0784223982','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2822,'Bwalula H/C II','','',0,NULL,'Bwalula HC II','WyB0okmGKma','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2823,'Child and Family Medical Centre','0787100549','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2824,'Tororo Prison H/C II','0704441219','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2825,'Bukasakya H/C III','0782818100','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2826,'Lukale H/C III','0788640034','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2827,'Abii Clinic','0775399684','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2828,'Fort Police H/C III','0778953060','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2829,'Karin H/C II','','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2830,'Alimi H/C II','0783663382','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2831,'Bangatuti H/C III','0773673772','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2832,'Alimugonza H/C II','0789043452','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2833,'Mburamizi H/C III','','',0,NULL,'Mburamizi Army Barracks HC III','oe5SuoS1cNO','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2834,'Bukiende H/C III','0773277523','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2835,'Kakigando H/C II','0774820462','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2836,'Kisaasi COU H/C III','0704505689','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2837,'Mirembe Esther','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2838,'Taoky Medical Clinic','0785258299','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2839,'Bolomoni H/C III','0773440140','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2840,'Kisengwe H/C III','0772881988','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2841,'Bushenyi Uganda Prisons H/C III','0700698773','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2842,'Kauga Prison H/C III','0703242492','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2843,'Kavule H/C II','0788314876','',0,NULL,'Kavule HC II','bWOR5fD8vdv','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2844,'Kaweeri Prisons H/C II','0702445506','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2845,'MBN-Kampala ','0702046426','mbnkampala@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2846,'Borcch Medical Centre','0784859967','borcch@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2847,'Florence Nightingale Hospital','0779730850','Florencenightingale@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2848,'Alpha Medical Centre (Banda)','0773853550','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2849,'Zone III Health Post','0781854751','zone3@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2850,'Kyempango H/C III','0774658899','Kyempango@gmail.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2851,'Kisala H/C II','0703297952','ntwetwe@gmail.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2852,'Busheka H/C II','0751342766','busheka@gmail.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2853,'Arahmah Medical Center','0751809578','arahmah@gmail.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2854,'Fort Portal Reg Blood Bank ','0782547627','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2855,'AIDS Information Centre (LIRA) ','0775667973','aiclira@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2856,'Aperkira H/C III','0775635083','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2857,'Nakasero Blood Bank','075330341','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2858,'Muinaina  Prison H/C II','0707737058','Muinaina@gmial.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2859,'Yefaap Medical Services','0757900332','yefaapmedicalservices@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2860,'Hama H/C II','0782178278','namayingo@gmail.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2861,'St Joseph\'s Rubindi H/C III','0754247585','stjoseph@gmail.com',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2862,'Kateta COU H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2863,'Kateta Moru H/C II','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2864,'Bulaga H/C III','0782690466','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2865,'Namusita H/C III','0782975052','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2866,'Dr Ambrosolic Memorial Hospital','0781054865','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2867,'Jumbo Medical Clinic','0755438250','',0,NULL,'Jumbo Medical Clinic HCII','JP9lxuDjeey','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2868,'Joy Hospice Medical Center','0781538301','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2869,'Kiralamba H/C III','0772510162','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2870,'Rumuri H/C II','0702467445','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2871,'Mulago National Hospital-(CDC) Mulago','0703492808','mulagonhcdc@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2872,'Kakiri Military Hospital','0786335370','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2873,'Jewa H/C III','0777900979','',0,NULL,'','','0000-00-00 00:00:00','0000-00-00 00:00:00'),(2874,'Lyolwa H/C III','0788041375','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2875,'Mbarara H/C IV (Municipal)','775815620','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2876,'Buhuka H/C III','0785047195','Dominibuhuka@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2877,'St Kizito Bwaise H/C III','0700179002','remera@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2878,'St Klaus H/C III','0701217149','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2879,'MEDI SAFE Hospital','0775804205','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2880,'Koro H/C III','0776275947','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2881,'Mulago National Referral - Kiruddu Hepatitis Clinic','','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2882,'Bunamwaya H/C II','0700384522','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2883,'Katosi H/C IV','0788389613','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2884,'St Kizito H/C III (Kijabijo)','0783180894','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2885,'Oseera H/C II','0782607079','Oseera@gmail.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2886,'Munyonyi H/C III','0773568247','',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2887,'Kagumba H/C III','0772699024','kagumba@example.com',0,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_break_points`
--

DROP TABLE IF EXISTS `gram_break_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gram_break_points` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `drug_id` int unsigned NOT NULL,
  `gram_stain_range_id` int unsigned NOT NULL,
  `resistant_max` decimal(4,1) DEFAULT NULL,
  `intermediate_min` decimal(4,1) DEFAULT NULL,
  `intermediate_max` decimal(4,1) DEFAULT NULL,
  `sensitive_min` decimal(4,1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gram_break_points_drug_id_foreign` (`drug_id`),
  KEY `gram_break_points_gram_stain_range_id_foreign` (`gram_stain_range_id`),
  CONSTRAINT `gram_break_points_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `gram_break_points_gram_stain_range_id_foreign` FOREIGN KEY (`gram_stain_range_id`) REFERENCES `gram_stain_ranges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_break_points`
--

LOCK TABLES `gram_break_points` WRITE;
/*!40000 ALTER TABLE `gram_break_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_break_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_drug_susceptibility`
--

DROP TABLE IF EXISTS `gram_drug_susceptibility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gram_drug_susceptibility` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `gram_stain_result_id` int unsigned NOT NULL,
  `drug_susceptibility_measure_id` int unsigned NOT NULL,
  `zone_diameter` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gram_drug_susceptibility_user_id_foreign` (`user_id`),
  KEY `gram_drug_susceptibility_drug_id_foreign` (`drug_id`),
  KEY `gram_drug_susceptibility_gram_stain_result_id_foreign` (`gram_stain_result_id`),
  KEY `gram_drug_susceptibility_drug_susceptibility_measure_id_foreign` (`drug_susceptibility_measure_id`),
  CONSTRAINT `gram_drug_susceptibility_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `gram_drug_susceptibility_drug_susceptibility_measure_id_foreign` FOREIGN KEY (`drug_susceptibility_measure_id`) REFERENCES `drug_susceptibility_measures` (`id`),
  CONSTRAINT `gram_drug_susceptibility_gram_stain_result_id_foreign` FOREIGN KEY (`gram_stain_result_id`) REFERENCES `gram_stain_results` (`id`),
  CONSTRAINT `gram_drug_susceptibility_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_drug_susceptibility`
--

LOCK TABLES `gram_drug_susceptibility` WRITE;
/*!40000 ALTER TABLE `gram_drug_susceptibility` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_drug_susceptibility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_stain_ranges`
--

DROP TABLE IF EXISTS `gram_stain_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gram_stain_ranges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_stain_ranges`
--

LOCK TABLES `gram_stain_ranges` WRITE;
/*!40000 ALTER TABLE `gram_stain_ranges` DISABLE KEYS */;
INSERT INTO `gram_stain_ranges` VALUES (1,'No organism seen','2024-12-11 18:06:55','2024-12-11 18:06:55'),(2,'Gram positive cocci in singles','2024-12-11 18:06:55','2024-12-11 18:06:55'),(3,'Gram positive cocci in chains','2024-12-11 18:06:55','2024-12-11 18:06:55'),(4,'Gram positive cocci in clusters','2024-12-11 18:06:55','2024-12-11 18:06:55'),(5,'Gram positive diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(6,'Gram positive micrococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(7,'Gram positive rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(8,'Gram positive rods with terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(9,'Gram positive rods with sub-terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(10,'Gram positive rods with endospores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(11,'Gram negative diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(12,'Gram negative intracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(13,'Gram negative extracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(14,'Gram negative rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(15,'Gram positive yeast cells','2024-12-11 18:06:55','2024-12-11 18:06:55'),(16,'Gram negative pleomorphic rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(17,'+ Gram positive cocci in singles','2024-12-11 18:06:55','2024-12-11 18:06:55'),(18,'+ Gram positive cocci in chains','2024-12-11 18:06:55','2024-12-11 18:06:55'),(19,'+ Gram positive cocci in clusters','2024-12-11 18:06:55','2024-12-11 18:06:55'),(20,'+ Gram positive diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(21,'+ Gram positive micrococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(22,'+ Gram positive rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(23,'+ Gram positive rods with terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(24,'+ Gram positive rods with sub-terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(25,'+ Gram positive rods with endospores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(26,'+ Gram negative diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(27,'+ Gram negative intracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(28,'+ Gram negative extracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(29,'+ Gram negative rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(30,'+ Gram positive yeast cells','2024-12-11 18:06:55','2024-12-11 18:06:55'),(31,'+ Gram negative pleomorphic rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(32,'++ Gram positive cocci in singles','2024-12-11 18:06:55','2024-12-11 18:06:55'),(33,'++ Gram positive cocci in chains','2024-12-11 18:06:55','2024-12-11 18:06:55'),(34,'++ Gram positive cocci in clusters','2024-12-11 18:06:55','2024-12-11 18:06:55'),(35,'++ Gram positive diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(36,'++ Gram positive micrococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(37,'++ Gram positive rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(38,'++ Gram positive rods with terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(39,'++ Gram positive rods with sub-terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(40,'++ Gram positive rods with endospores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(41,'++ Gram negative diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(42,'++ Gram negative intracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(43,'++ Gram negative extracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(44,'++ Gram negative rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(45,'++ Gram positive yeast cells','2024-12-11 18:06:55','2024-12-11 18:06:55'),(46,'++ Gram negative pleomorphic rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(47,'+++ Gram positive cocci in singles','2024-12-11 18:06:55','2024-12-11 18:06:55'),(48,'+++ Gram positive cocci in chains','2024-12-11 18:06:55','2024-12-11 18:06:55'),(49,'+++ Gram positive cocci in clusters','2024-12-11 18:06:55','2024-12-11 18:06:55'),(50,'+++ Gram positive diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(51,'+++ Gram positive micrococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(52,'+++ Gram positive rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(53,'+++ Gram positive rods with terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(54,'+++ Gram positive rods with sub-terminal spores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(55,'+++ Gram positive rods with endospores','2024-12-11 18:06:55','2024-12-11 18:06:55'),(56,'+++ Gram negative diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(57,'+++ Gram negative intracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(58,'+++ Gram negative extracellular diplococci','2024-12-11 18:06:55','2024-12-11 18:06:55'),(59,'+++ Gram negative rods','2024-12-11 18:06:55','2024-12-11 18:06:55'),(60,'+++ Gram positive yeast cells','2024-12-11 18:06:55','2024-12-11 18:06:55'),(61,'+++ Gram negative pleomorphic rods','2024-12-11 18:06:55','2024-12-11 18:06:55');
/*!40000 ALTER TABLE `gram_stain_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gram_stain_results`
--

DROP TABLE IF EXISTS `gram_stain_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gram_stain_results` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `test_id` int unsigned NOT NULL,
  `gram_stain_range_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `gram_stain_results_user_id_foreign` (`user_id`),
  KEY `gram_stain_results_test_id_foreign` (`test_id`),
  KEY `gram_stain_results_gram_stain_range_id_foreign` (`gram_stain_range_id`),
  CONSTRAINT `gram_stain_results_gram_stain_range_id_foreign` FOREIGN KEY (`gram_stain_range_id`) REFERENCES `gram_stain_ranges` (`id`),
  CONSTRAINT `gram_stain_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`),
  CONSTRAINT `gram_stain_results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gram_stain_results`
--

LOCK TABLES `gram_stain_results` WRITE;
/*!40000 ALTER TABLE `gram_stain_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `gram_stain_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hielogs`
--

DROP TABLE IF EXISTS `hielogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hielogs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `source_system_id` bigint DEFAULT NULL,
  `client` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `source_system_name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `server` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `httpmethod` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `requestbody` longtext COLLATE utf8mb3_unicode_ci,
  `requesttime` datetime DEFAULT NULL,
  `requestparameter` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb3_unicode_ci NOT NULL,
  `statuscode` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `responsebody` longtext COLLATE utf8mb3_unicode_ci,
  `responsetime` datetime DEFAULT NULL,
  `visitid` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `testid` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hielogs`
--

LOCK TABLES `hielogs` WRITE;
/*!40000 ALTER TABLE `hielogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hielogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hpv_patient`
--

DROP TABLE IF EXISTS `hpv_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hpv_patient` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `visit_id` int DEFAULT NULL,
  `test_id` int DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `hiv_status` int DEFAULT '1',
  `art_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinic_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nok_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nok_relationship` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nok_mobile` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `screened_status` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `previous_diagnostic_method` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `other_method` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `previous_screening_result` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `specimen_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `previous_screening_date` date DEFAULT NULL,
  `sample_collection_date` date DEFAULT NULL,
  `date_received_by_hw` date DEFAULT NULL,
  `date_received_by_lab` date DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `genotype_16` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `genotype_18` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `genotype_hr` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `uploaded` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hpv_patient`
--

LOCK TABLES `hpv_patient` WRITE;
/*!40000 ALTER TABLE `hpv_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `hpv_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubs`
--

DROP TABLE IF EXISTS `hubs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hubs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubs`
--

LOCK TABLES `hubs` WRITE;
/*!40000 ALTER TABLE `hubs` DISABLE KEYS */;
/*!40000 ALTER TABLE `hubs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ii_quickcodes`
--

DROP TABLE IF EXISTS `ii_quickcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ii_quickcodes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `feed_source` tinyint NOT NULL,
  `config_prop` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ii_quickcodes`
--

LOCK TABLES `ii_quickcodes` WRITE;
/*!40000 ALTER TABLE `ii_quickcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ii_quickcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument_testcodes`
--

DROP TABLE IF EXISTS `instrument_testcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrument_testcodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `instrument_id` int DEFAULT NULL,
  `instrument_testcode` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instrument_testcode_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instrument_measure_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_testcodes`
--

LOCK TABLES `instrument_testcodes` WRITE;
/*!40000 ALTER TABLE `instrument_testcodes` DISABLE KEYS */;
INSERT INTO `instrument_testcodes` VALUES (1,11,'ACP','ACID PHOSPHATASE',NULL,NULL,NULL),(2,11,'UTP','URINARY TOTAL PROTEIN',NULL,NULL,NULL),(3,11,'UREA','UREA liquiUV',NULL,NULL,NULL),(4,11,'UA','URIC ACID',NULL,NULL,NULL),(5,11,'TRF','TRANSFERRIN',NULL,NULL,NULL),(6,11,'TP','TOTAL PROTEIN',NULL,NULL,NULL),(7,11,'TG','TRIGLYCERIDES',NULL,NULL,NULL),(8,11,'TBIL','auto-BILIRUBIN-T',NULL,NULL,NULL),(9,11,'RF-2','RHEUMATOID FACTORS',NULL,NULL,NULL),(10,11,'PHOS','PHOSPHORUS',NULL,NULL,NULL),(11,11,'PAMY','PANCREAS-AMYLASE',NULL,NULL,NULL),(12,11,'Na-e','SODIUM',NULL,NULL,NULL),(13,11,'Mg','MAGNESIUM',NULL,NULL,NULL),(14,11,'MALB','MICROALBUMIN',NULL,NULL,NULL),(15,11,'LIP','LIPASE',NULL,NULL,NULL),(16,11,'LDL-C','LDL CHOLESTEROL',NULL,NULL,NULL),(17,11,'LDH-P','LDH SCE mod',NULL,NULL,NULL),(18,11,'K-e','POTASSIUM',NULL,NULL,NULL),(19,11,'IgM','IMMUNOGLOBULINS',NULL,NULL,NULL),(20,11,'IgG','IMMUNOGLOBULINS',NULL,NULL,NULL),(21,11,'HDL-C','HDL CHOLESTEROL',NULL,NULL,NULL),(22,11,'HCY','HOMOCYSTEINE',NULL,NULL,NULL),(23,11,'HbA1c','HbA1c',NULL,NULL,NULL),(24,11,'GPT','GPT (ALAT) IFCC',NULL,NULL,NULL),(25,11,'GOT','GOT (ASAT) IFCC',NULL,NULL,NULL),(26,11,'GLUC','GLUCOSE',NULL,NULL,NULL),(27,11,'GLUC2','GLUCOSE liquiUV',NULL,NULL,NULL),(28,11,'GGT','gamma-GT liquicolor_GGT',NULL,NULL,NULL),(29,11,'Fe','IRON TPTZ liquicolor_Fe',NULL,NULL,NULL),(30,11,'Fe-2','IRON liquicolor_Fe2',NULL,NULL,NULL),(31,11,'DBIL','auto-BILIRUBIN-D',NULL,NULL,NULL),(32,11,'CYSTC','CYSTATIN-C liquidirect',NULL,NULL,NULL),(33,11,'CRP','CRP',NULL,NULL,NULL),(34,11,'CREA','auto-CREATININE liquicolor',NULL,NULL,NULL),(35,11,'CREA-2','CREATININE enzym',NULL,NULL,NULL),(36,11,'Cl','CHLORIDE',NULL,NULL,NULL),(37,11,'CKMB','CK-MB liquiUV',NULL,NULL,NULL),(38,11,'CK','CK NAC activated liquiUV',NULL,NULL,NULL),(39,11,'CHOL','CHOLESTEROL liquicolor',NULL,NULL,NULL),(40,11,'CHE','CHOLINESTERASE',NULL,NULL,NULL),(41,11,'Ca','CALCIUM liquicolor',NULL,NULL,NULL),(42,11,'C4','COMPLEMENT C4',NULL,NULL,NULL),(43,11,'C3','COMPLEMENT C3',NULL,NULL,NULL),(44,11,'ASO','anti-STREPTOLYSIN-O',NULL,NULL,NULL),(45,11,'APOB','APOLIPOPROTEIN B',NULL,NULL,NULL),(46,11,'APOA1','APOLIPOPROTEIN A1',NULL,NULL,NULL),(47,11,'AMY','alpha-AMYLASE liquicolor',NULL,NULL,NULL),(48,11,'ALP','ALKALINE PHOSPHATASE liquicolor_APL',NULL,NULL,NULL),(49,11,'ALP-2','ALKALINE PHOSPHATASE opt liquicolor_ALP-2',NULL,NULL,NULL),(50,11,'ALB','ALBUMIN',NULL,NULL,NULL);
/*!40000 ALTER TABLE `instrument_testcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrument_testtypes`
--

DROP TABLE IF EXISTS `instrument_testtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrument_testtypes` (
  `instrument_id` int unsigned NOT NULL,
  `test_type_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `instrument_testtypes_instrument_id_test_type_id_unique` (`instrument_id`,`test_type_id`),
  KEY `instrument_testtypes_test_type_id_foreign` (`test_type_id`),
  CONSTRAINT `instrument_testtypes_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`),
  CONSTRAINT `instrument_testtypes_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrument_testtypes`
--

LOCK TABLES `instrument_testtypes` WRITE;
/*!40000 ALTER TABLE `instrument_testtypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `instrument_testtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruments`
--

DROP TABLE IF EXISTS `instruments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instruments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hostname` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `driver_name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruments`
--

LOCK TABLES `instruments` WRITE;
/*!40000 ALTER TABLE `instruments` DISABLE KEYS */;
INSERT INTO `instruments` VALUES (1,'Celltac F Mek 8222','192.168.1.12',NULL,'Automatic analyzer with 22 parameters and WBC 5 part diff Hematology Analyzer','KBLISPluginsCelltacFMachine','2024-03-11 10:15:18','2024-03-11 10:15:18'),(2,'Celltac MEK-6510K','192.1.1.1',NULL,'NIHON KOHDEN',NULL,'2024-03-11 10:11:17','2024-03-11 10:11:17'),(3,'Cobas c111',NULL,NULL,'ROCHE CHEMISTRY ANALYZER',NULL,'2020-12-12 14:23:04','2020-12-12 14:23:04'),(4,'MICROSCOPE',NULL,NULL,'OLYPUS ILED BRIGHT FIELD ',NULL,'2020-12-12 14:24:12','2020-12-12 14:24:12'),(5,'GeneXpert',NULL,NULL,'CEPHEID MTB/RIF GENEXPERRT',NULL,'2020-12-12 14:25:25','2020-12-12 14:25:25'),(6,'BECKMAN COULTER DxH 520','192.168.0.2',NULL,'BECKMAN COULTER  HEMATOLOGY ANALYZER',NULL,'2024-03-09 06:25:02','2024-03-09 06:25:02'),(7,'m-PIMA',NULL,NULL,NULL,NULL,'2022-08-09 09:10:24','2022-08-09 09:10:24'),(8,'Cobas c311','localhost','44050/api/getcobas_c311','C311 Chemistry Analyzer',NULL,'2024-03-12 14:45:32','2024-03-11 10:12:29'),(9,'Cobas e411','127.0.0.1','44050/api/getcobas_e411','E411 Chemistry Analyzer',NULL,'2024-03-13 08:53:34','2024-03-13 08:53:34'),(10,'Cobas i400','localhost','44050/api/getcobas_i400','Rosche Chemistry Analyzer',NULL,'2024-03-12 14:01:13','2024-03-11 10:13:31'),(11,'HumaStar 200','127.0.0.1','44050/api/gethumastar_200','Human Diagnostics Chemistry Analyzer',NULL,'2024-03-13 09:50:38','2024-03-13 09:50:38'),(12,'Imucor','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(13,'mPima','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(14,'pima CD4','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(15,'Humastar 200','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(17,'BD Facspresto','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(18,'Humacount 60Ts','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(19,'Humalyte plus','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(20,'Humacount 30Ts','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(21,'Architect c4000','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(22,'Beckman Coulter','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(23,'Bactec','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(24,'Mindray BC 760 R','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(25,'CBC Analyser','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(26,'Mindray BC 62000','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(27,'ECO LUMENA BLOOD GROUPING MACHINE','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(28,'Sysmex','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(29,'RUBY/ABBOT CBC ANALYSER','127.0.0.1','','',NULL,'2024-03-23 17:40:28','2024-03-13 09:50:38'),(30,'Nihon Khoden','127.0.0.1','','',NULL,'2024-03-23 17:48:43','2024-03-13 09:50:38'),(31,'Afinion	Elysis uno','127.0.0.1','','',NULL,'2024-03-23 17:48:43','2024-03-13 09:50:38'),(32,'Dymind DH76 ','127.0.0.1','','',NULL,'2024-03-23 17:48:43','2024-03-13 09:50:38'),(33,'Truenat','127.0.0.1','','',NULL,'2024-03-23 17:49:31','2024-03-13 09:50:38'),(34,'Bac Tec 200','127.0.0.1','','',NULL,'2024-03-23 17:49:31','2024-03-13 09:50:38'),(35,'Beckman coulter','127.0.0.1','','',NULL,'2024-03-23 17:49:31','2024-03-13 09:50:38'),(36,'Calorimeter','127.0.0.1','','',NULL,'2024-03-23 17:49:31','2024-03-13 09:50:38');
/*!40000 ALTER TABLE `instruments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `integrated_systems`
--

DROP TABLE IF EXISTS `integrated_systems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integrated_systems` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dhis2_uid` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_url` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lims_req` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_req` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_details` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_result` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `integrated_systems_facility_id_foreign` (`facility_id`),
  CONSTRAINT `integrated_systems_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `integrated_systems`
--

LOCK TABLES `integrated_systems` WRITE;
/*!40000 ALTER TABLE `integrated_systems` DISABLE KEYS */;
/*!40000 ALTER TABLE `integrated_systems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interfaced_equipment`
--

DROP TABLE IF EXISTS `interfaced_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `interfaced_equipment` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `equipment_name` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `comm_type` tinyint NOT NULL,
  `equipment_version` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lab_section` int unsigned NOT NULL,
  `feed_source` tinyint NOT NULL,
  `config_file` varchar(2000) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `interfaced_equipment_lab_section_foreign` (`lab_section`),
  CONSTRAINT `interfaced_equipment_lab_section_foreign` FOREIGN KEY (`lab_section`) REFERENCES `test_categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interfaced_equipment`
--

LOCK TABLES `interfaced_equipment` WRITE;
/*!40000 ALTER TABLE `interfaced_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `interfaced_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_items`
--

DROP TABLE IF EXISTS `inv_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `unit` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `min_level` decimal(8,2) DEFAULT NULL,
  `max_level` decimal(8,2) DEFAULT NULL,
  `storage_req` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remarks` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inv_items_name_unique` (`name`),
  KEY `inv_items_user_id_foreign` (`user_id`),
  CONSTRAINT `inv_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_items`
--

LOCK TABLES `inv_items` WRITE;
/*!40000 ALTER TABLE `inv_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_supply`
--

DROP TABLE IF EXISTS `inv_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_supply` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int unsigned DEFAULT NULL,
  `item_id` int unsigned NOT NULL,
  `lot` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `batch_no` varchar(12) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  `manufacturer` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `supplier_id` int unsigned DEFAULT NULL,
  `quantity_ordered` int NOT NULL DEFAULT '0',
  `quantity_supplied` int NOT NULL DEFAULT '0',
  `cost_per_unit` decimal(5,2) DEFAULT NULL,
  `date_of_order` date DEFAULT NULL,
  `date_of_supply` date DEFAULT NULL,
  `date_of_reception` date NOT NULL,
  `remarks` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `inv_supply_user_id_foreign` (`user_id`),
  KEY `inv_supply_item_id_foreign` (`item_id`),
  KEY `inv_supply_supplier_id_foreign` (`supplier_id`),
  CONSTRAINT `inv_supply_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `inv_items` (`id`),
  CONSTRAINT `inv_supply_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`),
  CONSTRAINT `inv_supply_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_supply`
--

LOCK TABLES `inv_supply` WRITE;
/*!40000 ALTER TABLE `inv_supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inv_usage`
--

DROP TABLE IF EXISTS `inv_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inv_usage` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int unsigned DEFAULT NULL,
  `stock_id` int unsigned NOT NULL,
  `voucher_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `request_id` int unsigned DEFAULT NULL,
  `quantity_used` int NOT NULL DEFAULT '0',
  `losses_adjustments` int DEFAULT NULL,
  `date_of_usage` date NOT NULL,
  `issued_by` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `received_by` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remarks` varchar(250) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `inv_usage_user_id_foreign` (`user_id`),
  KEY `inv_usage_stock_id_foreign` (`stock_id`),
  KEY `inv_usage_request_id_foreign` (`request_id`),
  CONSTRAINT `inv_usage_request_id_foreign` FOREIGN KEY (`request_id`) REFERENCES `requests` (`id`),
  CONSTRAINT `inv_usage_stock_id_foreign` FOREIGN KEY (`stock_id`) REFERENCES `inv_supply` (`id`),
  CONSTRAINT `inv_usage_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inv_usage`
--

LOCK TABLES `inv_usage` WRITE;
/*!40000 ALTER TABLE `inv_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `inv_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `isolated_organisms`
--

DROP TABLE IF EXISTS `isolated_organisms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `isolated_organisms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `test_id` int unsigned NOT NULL,
  `organism_id` int unsigned NOT NULL,
  `quantification` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uploaded` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `isolated_organisms_user_id_foreign` (`user_id`),
  KEY `isolated_organisms_test_id_foreign` (`test_id`),
  KEY `isolated_organisms_organism_id_foreign` (`organism_id`),
  CONSTRAINT `isolated_organisms_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`),
  CONSTRAINT `isolated_organisms_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`),
  CONSTRAINT `isolated_organisms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `isolated_organisms`
--

LOCK TABLES `isolated_organisms` WRITE;
/*!40000 ALTER TABLE `isolated_organisms` DISABLE KEYS */;
/*!40000 ALTER TABLE `isolated_organisms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `look_up_values`
--

DROP TABLE IF EXISTS `look_up_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `look_up_values` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `look_up_id` int NOT NULL,
  `value` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value_description` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `order` int NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `look_up_values`
--

LOCK TABLES `look_up_values` WRITE;
/*!40000 ALTER TABLE `look_up_values` DISABLE KEYS */;
INSERT INTO `look_up_values` VALUES (1,1,'1','POC-EID',1,1,'2024-12-11 18:06:07','2024-12-11 18:06:07',NULL),(2,1,'2','POC-VL',1,1,'2024-12-11 18:06:07','2024-12-11 18:06:07',NULL),(3,1,'3','MULTIPLEXING',1,1,'2024-12-11 18:06:07','2024-12-11 18:06:07',NULL),(4,1,'4','Advanced HIV Disease',1,1,'2024-12-11 18:06:08','2024-12-11 18:06:08',NULL),(5,5,'1','1C=AZT-3TC-NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(6,5,'2','1D=AZT-3TC-EFV',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(7,5,'3','1E=TDF-3TC-NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(8,5,'4','1F=TDF-3TC-EFV',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(9,5,'5','.',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(10,5,'6','1H=ABC+3TC+NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(11,5,'7','1I=ABC-3TC-EFV',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(12,5,'8','1J=ABC-3TC-NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(13,5,'11','2B=TDF-3TC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(14,5,'12','2C=AZT+3TC+ATV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(15,5,'13','2E=AZT-3TC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(16,5,'14','2F=TDF+3TC+ATV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(17,5,'15','2G=ABC-3TC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(18,5,'16','2H=ABC+3TC+ATV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(19,5,'17','2I=ABC-3TC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(20,5,'18','2J=AZT+3TC+DTG',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(21,5,'19','4A=d4T-3TC-NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(22,5,'20','4B=d4T-3TC-EFV',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(23,5,'21','4C=AZT-3TC-NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(24,5,'22','4D=AZT-3TC-EFV',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(25,5,'23','4E=ABC-3TC-NVP',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(26,5,'24','4F=ABC-3TC-EFV',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(27,5,'25','5D=TDF-3TC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(28,5,'26','5E=TDF-FTC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(29,5,'27','5G=AZT-ABC-LPV/R',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(30,7,'1','First Line',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(31,7,'2','Second Line',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(32,7,'4','Left Blank',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(33,7,'5','Other Regimen',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL),(34,7,'3','Third Line',1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27',NULL);
/*!40000 ALTER TABLE `look_up_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `look_ups`
--

DROP TABLE IF EXISTS `look_ups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `look_ups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `look_ups`
--

LOCK TABLES `look_ups` WRITE;
/*!40000 ALTER TABLE `look_ups` DISABLE KEYS */;
INSERT INTO `look_ups` VALUES (1,'Program','',1,NULL,'2024-12-11 18:06:07','2024-12-11 18:06:07'),(2,'Treatment Line','Treatment Line',1,NULL,'2019-09-15 18:00:00','2019-09-15 18:00:00');
/*!40000 ALTER TABLE `look_ups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lots`
--

DROP TABLE IF EXISTS `lots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lots` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expiry` date NOT NULL,
  `instrument_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lots_number_unique` (`number`),
  KEY `lots_instrument_id_foreign` (`instrument_id`),
  CONSTRAINT `lots_instrument_id_foreign` FOREIGN KEY (`instrument_id`) REFERENCES `instruments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lots`
--

LOCK TABLES `lots` WRITE;
/*!40000 ALTER TABLE `lots` DISABLE KEYS */;
/*!40000 ALTER TABLE `lots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_name_mappings`
--

DROP TABLE IF EXISTS `measure_name_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_name_mappings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_name_mapping_id` int unsigned NOT NULL,
  `measure_id` int unsigned DEFAULT NULL,
  `standard_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `snomed_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `measure_name_mappings_system_name_unique` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_name_mappings`
--

LOCK TABLES `measure_name_mappings` WRITE;
/*!40000 ALTER TABLE `measure_name_mappings` DISABLE KEYS */;
INSERT INTO `measure_name_mappings` VALUES (1,14,NULL,'White blood cell count ',NULL,'WBC','2023-09-26 18:46:18','2023-09-26 18:46:18'),(2,14,NULL,'Red blood cell count ',NULL,'RBC','2023-09-26 18:46:18','2023-09-26 18:46:18'),(3,14,NULL,'Hemoglobin (substance)',NULL,'HGB','2023-09-26 18:46:18','2023-09-26 18:46:18'),(4,14,NULL,'Finding of hematocrit (finding) ',NULL,'HCT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(5,14,NULL,'MCV - Mean cell volume',NULL,'MCV','2023-09-26 18:46:18','2023-09-26 18:46:18'),(6,14,NULL,'MCH - Mean cell hemoglobin',NULL,'MCH','2023-09-26 18:46:18','2023-09-26 18:46:18'),(7,14,NULL,'MCHC - Mean cell hemoglobin concentration',NULL,'MCHC','2023-09-26 18:46:18','2023-09-26 18:46:18'),(8,14,NULL,'Plt - Platelet count',NULL,'PLT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(9,14,NULL,'Erythrocyte distribution width [Entitic volume] by Automated count',NULL,'RDW-SD','2023-09-26 18:46:18','2023-09-26 18:46:18'),(10,14,NULL,'Erythrocyte distribution width [Ratio] by Automated count',NULL,'RDW-CV','2023-09-26 18:46:18','2023-09-26 18:46:18'),(11,14,NULL,'Platelet distribution width measurement ',NULL,'PDW','2023-09-26 18:46:18','2023-09-26 18:46:18'),(12,14,NULL,'Platelet mean volume determination ',NULL,'MPV','2023-09-26 18:46:18','2023-09-26 18:46:18'),(13,14,NULL,'Platelets Large/Platelets in Blood by Automated count',NULL,'P-LCR','2023-09-26 18:46:18','2023-09-26 18:46:18'),(14,14,NULL,'Plateletcrit measurement',NULL,'PCT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(15,14,NULL,'Neutrophil percent differential count ',NULL,'NEUT%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(16,14,NULL,'Lymphocyte percent differential count ',NULL,'LYMPH%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(17,14,NULL,'Monocyte percent differential count ',NULL,'MONO%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(18,14,NULL,'Eosinophil percent differential count ',NULL,'EO%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(19,14,NULL,'Basophil percent differential count',NULL,'BASO%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(20,14,NULL,'Neutrophil count ',NULL,'NEUT#','2023-09-26 18:46:18','2023-09-26 18:46:18'),(21,14,NULL,'Lymphocyte count ',NULL,'LYMPH#','2023-09-26 18:46:18','2023-09-26 18:46:18'),(22,14,NULL,'Monocyte count',NULL,'MONO#','2023-09-26 18:46:18','2023-09-26 18:46:18'),(23,14,NULL,'Eosinophil count',NULL,'EO#','2023-09-26 18:46:18','2023-09-26 18:46:18'),(24,14,NULL,'Basophil count ',NULL,'BASO#','2023-09-26 18:46:18','2023-09-26 18:46:18'),(25,14,NULL,'IRF',NULL,'IRF','2023-09-26 18:46:18','2023-09-26 18:46:18'),(26,14,NULL,'LFR',NULL,'LFR','2023-09-26 18:46:18','2023-09-26 18:46:18'),(27,14,NULL,'MFR',NULL,'MFR','2023-09-26 18:46:18','2023-09-26 18:46:18'),(28,14,NULL,'HFR',NULL,'HFR','2023-09-26 18:46:18','2023-09-26 18:46:18'),(29,14,NULL,'RET-He',NULL,'RET-He','2023-09-26 18:46:18','2023-09-26 18:46:18'),(30,24,NULL,'Malaria antigen test (procedure) ',NULL,'MRDT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(31,16,NULL,'ABO blood grouping',NULL,'Blood Grouping','2023-09-26 18:46:18','2023-09-26 18:46:18'),(32,109,NULL,'Finding of alpha-fetoprotein level',NULL,'AFP','2023-09-26 18:46:18','2023-09-26 18:46:18'),(33,9,NULL,'Brucella agglutinin test (procedure) ',NULL,'BAT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(34,1,NULL,'Microscopy for malarial parasites (procedure) ',NULL,'BS for mps','2023-09-26 18:46:18','2023-09-26 18:46:18'),(35,1,NULL,'Plasmodium falciparum slide test (procedure)',NULL,'Plasmodium falciparum slide test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(36,1,NULL,'Plasmodium vivax slide test (procedure)',NULL,'Plasmodium vivax slide test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(37,20,NULL,'Absolute CD4 count procedure (procedure) ',NULL,'CD4 count','2023-09-26 18:46:18','2023-09-26 18:46:18'),(38,20,NULL,'CD4%',NULL,'CD4%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(39,20,NULL,'CD8 Abs',NULL,'CD8 Abs','2023-09-26 18:46:18','2023-09-26 18:46:18'),(40,20,NULL,'CD8%',NULL,'CD8%','2023-09-26 18:46:18','2023-09-26 18:46:18'),(41,20,NULL,'CD45+ Abs',NULL,'CD45+ Abs','2023-09-26 18:46:18','2023-09-26 18:46:18'),(42,20,NULL,'Hb Estimate',NULL,'Hb Estimate','2023-09-26 18:46:18','2023-09-26 18:46:18'),(43,81,NULL,'COVID 19 Antigen Rapid Test',NULL,'COVID 19 Antigen Rapid Test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(44,82,NULL,'COVID-19 PCR Test',NULL,'COVID-19 PCR Test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(45,17,NULL,'Major crossmatch (procedure) ',NULL,'Cross matching','2023-09-26 18:46:18','2023-09-26 18:46:18'),(46,92,NULL,'Smear Follow Up',NULL,'Smear Follow Up','2023-09-26 18:46:18','2023-09-26 18:46:18'),(47,99,NULL,'ARBO VIRUS',NULL,'ARBO VIRUS','2023-09-26 18:46:18','2023-09-26 18:46:18'),(48,41,NULL,'C-reactive protein measurement (procedure)',NULL,'C-RP','2023-09-26 18:46:18','2023-09-26 18:46:18'),(49,38,NULL,'Prothrombin time',NULL,'Prothrombin Time','2023-09-26 18:46:18','2023-09-26 18:46:18'),(50,78,NULL,'Activated Prothrombin Time',NULL,'Activated Prothrombin Time','2023-09-26 18:46:18','2023-09-26 18:46:18'),(51,78,NULL,'IN-Ratio',NULL,'IN-Ratio','2023-09-26 18:46:18','2023-09-26 18:46:18'),(52,46,NULL,'D-dimer assay (procedure)',NULL,'D-Dimer','2023-09-26 18:46:18','2023-09-26 18:46:18'),(53,80,NULL,'Anti-HBe',NULL,'Anti-HBe','2023-09-26 18:46:18','2023-09-26 18:46:18'),(54,27,NULL,'Na+',NULL,'Na+','2023-09-26 18:46:18','2023-09-26 18:46:18'),(55,27,NULL,'K+',NULL,'K+','2023-09-26 18:46:18','2023-09-26 18:46:18'),(56,27,NULL,'Cl-',NULL,'Cl-','2023-09-26 18:46:18','2023-09-26 18:46:18'),(57,94,NULL,'Ca2+',NULL,'Ca2+','2023-09-26 18:46:18','2023-09-26 18:46:18'),(58,94,NULL,'Mg2+',NULL,'Mg2+','2023-09-26 18:46:18','2023-09-26 18:46:18'),(59,94,NULL,'P',NULL,'P','2023-09-26 18:46:18','2023-09-26 18:46:18'),(60,29,NULL,'Fasting blood glucose measurement (procedure) ',NULL,'FBS/FBG','2023-09-26 18:46:18','2023-09-26 18:46:18'),(61,100,NULL,'Ferritin measurement (procedure) ',NULL,'Ferritin','2023-09-26 18:46:18','2023-09-26 18:46:18'),(62,93,NULL,'Glucose measurement (procedure)','36048009','Glucose measurement','2024-05-27 16:00:09','2024-05-27 16:00:09'),(63,12,NULL,'Gram stain method (procedure) ',NULL,'Gram stain','2023-09-26 18:46:18','2023-09-26 18:46:18'),(64,38,NULL,'HB',NULL,'HB','2023-09-26 18:46:18','2023-09-26 18:46:18'),(65,38,NULL,'HBeAg',NULL,'HBeAg','2023-09-26 18:46:18','2023-09-26 18:46:18'),(66,22,NULL,'Hepatitis B surface antigen measurement (procedure) ',NULL,'HBSAg','2023-09-26 18:46:18','2023-09-26 18:46:18'),(67,7,NULL,'Urine pregnancy test (procedure)',NULL,'HCG','2023-09-26 18:46:18','2023-09-26 18:46:18'),(68,91,NULL,'Hepatitis B Viral Load',NULL,'Hep.B-VL','2023-09-26 18:46:18','2023-09-26 18:46:18'),(69,57,NULL,'Macro:',NULL,'Macro: for creatinine kinase','2024-05-27 16:07:53','2024-05-27 16:07:53'),(70,0,NULL,'None',NULL,'none','2024-05-27 16:24:57','2024-05-27 16:24:57'),(71,104,NULL,'HIV PCR Qualitative',NULL,'HIV PCR Qualitative','2023-09-26 18:46:18','2023-09-26 18:46:18'),(72,32,NULL,'HIV viral load',NULL,'HIV VIRAL LOAD','2023-09-26 18:46:18','2023-09-26 18:46:18'),(73,35,NULL,'HPV testing',NULL,'HPV testing','2023-09-26 18:46:18','2023-09-26 18:46:18'),(74,35,NULL,'Genotype HPV 16',NULL,'Genotype HPV 16','2023-09-26 18:46:18','2023-09-26 18:46:18'),(75,35,NULL,'Genotype HPV 18_45',NULL,'Genotype HPV 18_45','2023-09-26 18:46:18','2023-09-26 18:46:18'),(76,35,NULL,'Other hrHPV',NULL,'Other hrHPV','2023-09-26 18:46:18','2023-09-26 18:46:18'),(77,30,NULL,'India ink stain method (procedure)',NULL,'INDIA INK','2023-09-26 18:46:18','2023-09-26 18:46:18'),(78,97,NULL,'Lactate (substance) ',NULL,'Lactate','2023-09-26 18:46:18','2023-09-26 18:46:18'),(79,18,NULL,'AST',NULL,'AST','2023-09-26 18:46:18','2023-09-26 18:46:18'),(80,18,NULL,'ALT',NULL,'ALT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(81,18,NULL,'ALB',NULL,'ALB','2023-09-26 18:46:18','2023-09-26 18:46:18'),(82,18,NULL,'T. Proteins',NULL,'T. Proteins','2023-09-26 18:46:18','2023-09-26 18:46:18'),(83,18,NULL,'Bil.D',NULL,'Bil.D','2023-09-26 18:46:18','2023-09-26 18:46:18'),(84,18,NULL,'Bil.T',NULL,'Bil.T','2023-09-26 18:46:18','2023-09-26 18:46:18'),(85,18,NULL,'GGT',NULL,'GGT','2023-09-26 18:46:18','2023-09-26 18:46:18'),(86,18,NULL,'ALP2',NULL,'ALP2','2023-09-26 18:46:18','2023-09-26 18:46:18'),(87,18,NULL,'Cholesterol',NULL,'Cholesterol','2023-09-26 18:46:18','2023-09-26 18:46:18'),(88,18,NULL,'HDL-C',NULL,'HDL-C','2023-09-26 18:46:18','2023-09-26 18:46:18'),(89,18,NULL,'LDL-C',NULL,'LDL-C','2023-09-26 18:46:18','2023-09-26 18:46:18'),(90,18,NULL,'Triglycerides',NULL,'Triglycerides','2023-09-26 18:46:18','2023-09-26 18:46:18'),(91,44,NULL,'Testosteron',NULL,'Testosteron','2023-09-26 18:46:18','2023-09-26 18:46:18'),(92,44,NULL,'ICSH',NULL,'ICSH','2023-09-26 18:46:18','2023-09-26 18:46:18'),(93,77,NULL,'Serum Amylase',NULL,'Serum Amylase','2023-09-26 18:46:18','2023-09-26 18:46:18'),(94,77,NULL,'Lipase',NULL,'Lipase','2023-09-26 18:46:18','2023-09-26 18:46:18'),(95,49,NULL,'Total PSA',NULL,'Total PSA','2023-09-26 18:46:18','2023-09-26 18:46:18'),(96,49,NULL,'Free PSA',NULL,'Free PSA','2023-09-26 18:46:18','2023-09-26 18:46:18'),(97,15,NULL,'Random Blood Sugar',NULL,'RBS','2023-09-26 18:46:18','2023-09-26 18:46:18'),(98,70,NULL,'Creatinine',NULL,'Creatinine','2023-09-26 18:46:18','2023-09-26 18:46:18'),(99,70,NULL,'Urea',NULL,'Urea','2023-09-26 18:46:18','2023-09-26 18:46:18'),(100,70,NULL,'Na',NULL,'Na','2023-09-26 18:46:18','2023-09-26 18:46:18'),(101,70,NULL,'K',NULL,'K','2023-09-26 18:46:18','2023-09-26 18:46:18'),(102,70,NULL,'Cl',NULL,'Cl','2023-09-26 18:46:18','2023-09-26 18:46:18'),(103,33,NULL,'Rheumatoid factor',NULL,'RF','2023-09-26 18:46:18','2023-09-26 18:46:18'),(104,60,NULL,'Rapid plasma reagin test',NULL,'RPR','2023-09-26 18:46:18','2023-09-26 18:46:18'),(106,31,NULL,'volume',NULL,'volume','2023-09-26 18:46:18','2023-09-26 18:46:18'),(107,31,NULL,'Liquefaction',NULL,'Liquefaction','2023-09-26 18:46:18','2023-09-26 18:46:18'),(108,31,NULL,'Semen PH',NULL,'PH - semen','2024-05-27 16:57:00','2024-05-27 16:57:00'),(109,31,NULL,'Sperm Density',NULL,'Sperm Density','2023-09-26 18:46:18','2023-09-26 18:46:18'),(110,31,NULL,'Morphology',NULL,'Morphology','2023-09-26 18:46:18','2023-09-26 18:46:18'),(111,31,NULL,'Sperm Motility',NULL,'Sperm Motility','2023-09-26 18:46:18','2023-09-26 18:46:18'),(112,25,NULL,'MACRO:',NULL,'MACRO:','2023-09-26 18:46:18','2023-09-26 18:46:18'),(113,25,NULL,'MICRO:',NULL,'MICRO:','2023-09-26 18:46:18','2023-09-26 18:46:18'),(114,73,NULL,'Urine TB LAM',NULL,'TB-LAM','2023-09-26 18:46:18','2023-09-26 18:46:18'),(115,40,NULL,'fT4',NULL,'fT4','2023-09-26 18:46:18','2023-09-26 18:46:18'),(116,40,NULL,'TSH',NULL,'TSH','2023-09-26 18:46:18','2023-09-26 18:46:18'),(117,40,NULL,'fT3',NULL,'fT3','2023-09-26 18:46:18','2023-09-26 18:46:18'),(118,40,NULL,'T3',NULL,'T3','2023-09-26 18:46:18','2023-09-26 18:46:18'),(119,40,NULL,'T4',NULL,'T4','2023-09-26 18:46:18','2023-09-26 18:46:18'),(120,26,NULL,'Treponema pallidum hemaglutination test (procedure)',NULL,'TPHA','2023-09-26 18:46:18','2023-09-26 18:46:18'),(121,43,NULL,'Troponin T measurement',NULL,'Troponin-T','2023-09-26 18:46:18','2023-09-26 18:46:18'),(122,98,NULL,'Uric acid measurement, urine',NULL,'Uric Acid','2023-09-26 18:46:18','2023-09-26 18:46:18'),(123,28,NULL,'MTB',NULL,'MTB','2023-09-26 18:46:18','2023-09-26 18:46:18'),(124,28,NULL,'RIF Resistance',NULL,'RIF Resistance','2023-09-26 18:46:18','2023-09-26 18:46:18'),(125,13,NULL,'Ziehl-Neelsen stain method (procedure)',NULL,'ZN stain','2023-09-26 18:46:18','2023-09-26 18:46:18'),(126,3,NULL,'Macroscopy',NULL,'Appearance','2023-09-26 18:46:18','2023-09-26 18:46:18'),(127,3,NULL,'Urinalysis, glucose, qualitative ',NULL,'Glucose','2023-09-26 18:46:18','2023-09-26 18:46:18'),(128,3,NULL,'Urine protein level',NULL,'Protein','2023-09-26 18:46:18','2023-09-26 18:46:18'),(129,3,NULL,'Blood in urine (finding) ',NULL,'Blood','2023-09-26 18:46:18','2023-09-26 18:46:18'),(130,3,NULL,'Urine pH test',NULL,'PH','2023-09-26 18:46:18','2023-09-26 18:46:18'),(131,3,NULL,'Specific gravity of urine (finding)',NULL,'SPECIFIC GRAVITY','2023-09-26 18:46:18','2023-09-26 18:46:18'),(132,3,NULL,'Urine ketone test',NULL,'KETONES','2023-09-26 18:46:18','2023-09-26 18:46:18'),(133,3,NULL,'Bilirubin measurement, urine',NULL,'Bilirubin','2023-09-26 18:46:18','2023-09-26 18:46:18'),(134,3,NULL,'Finding of urobilinogen in urine',NULL,'Urobilinogen','2023-09-26 18:46:18','2023-09-26 18:46:18'),(135,3,NULL,'Leukocytes in urine',NULL,'Leucocytes','2023-09-26 18:46:18','2023-09-26 18:46:18'),(136,3,NULL,'Urine nitrite ',NULL,'Nitrites','2023-09-26 18:46:18','2023-09-26 18:46:18'),(137,3,NULL,'Urine microscopy',NULL,'Microscopy','2023-09-26 18:46:18','2023-09-26 18:46:18'),(138,3,NULL,'Calcium, urine, qualitative (procedure)',NULL,'Calcium','2023-09-26 18:46:18','2023-09-26 18:46:18'),(139,3,NULL,'Crystal identification, urine (procedure)',NULL,'Crystal identification','2023-09-26 18:46:18','2023-09-26 18:46:18'),(140,3,NULL,'Fat stain, urine (procedure)',NULL,'Fat stain','2023-09-26 18:46:18','2023-09-26 18:46:18'),(141,3,NULL,'Febrile agglutinins measurement, Brucella, Francisella, Murine typhus, Q fever, Rocky Mountain Spotted Fever, scrub typhus (procedure)',NULL,'Febrile agglutinins measurement, Brucella, Francisella, Murine typhus, Q fever, Rocky Mountain Spotted Fever, scrub typhus','2023-09-26 18:46:18','2023-09-26 18:46:18'),(142,3,NULL,'Ferric chloride test, urine (procedure)',NULL,'Ferric chloride test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(143,3,NULL,'Hemosiderin measurement, urine (procedure)',NULL,'Hemosiderin measurement','2023-09-26 18:46:18','2023-09-26 18:46:18'),(144,3,NULL,'Identification of microorganisms in urine culture (procedure)',NULL,'Identification of microorganisms','2023-09-26 18:46:18','2023-09-26 18:46:18'),(145,3,NULL,'Indican measurement, urine (procedure)',NULL,'Indican measurement','2023-09-26 18:46:18','2023-09-26 18:46:18'),(146,3,NULL,'Measurement of protein and glucose in urine specimen using reagent test strip (procedure)',NULL,'Protein and glucose','2023-09-26 18:46:18','2023-09-26 18:46:18'),(147,3,NULL,'Measurement of total hemoglobin concentration in urine specimen (procedure)',NULL,'Total hemoglobin concentration','2023-09-26 18:46:18','2023-09-26 18:46:18'),(148,3,NULL,'Measurement of urine norepinephrine/creatinine ratio (procedure)',NULL,'norepinephrine/creatinine ratio','2023-09-26 18:46:18','2023-09-26 18:46:18'),(149,3,NULL,'Organism microscopy',NULL,'Macroscopy','2023-09-26 18:46:18','2023-09-26 18:46:18'),(150,3,NULL,'Rapid urine screening test, bioluminescence (procedure)',NULL,'Bioluminescence','2023-09-26 18:46:18','2023-09-26 18:46:18'),(151,3,NULL,'Rapid urine screening test, enzyme tube test (procedure)',NULL,'Rapid urine screening test, enzyme tube test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(152,3,NULL,'Urinalysis with reflex to microscopy (procedure)',NULL,'Urinalysis with reflex to microscopy','2023-09-26 18:46:18','2023-09-26 18:46:18'),(153,3,NULL,'Urinalysis with reflex to microscopy and culture (procedure)',NULL,'Reflex to microscopy and culture','2023-09-26 18:46:18','2023-09-26 18:46:18'),(154,3,NULL,'Urinalysis, acetone or ketone bodies measurement (procedure)',NULL,'Acetone or ketone bodies','2023-09-26 18:46:18','2023-09-26 18:46:18'),(155,3,NULL,'Urinalysis, automated (procedure)',NULL,'Urinalysis, automated','2023-09-26 18:46:18','2023-09-26 18:46:18'),(156,3,NULL,'Urinalysis, automated, without microscopy (procedure)',NULL,'Urinalysis, automated, without microscopy (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(157,3,NULL,'Urinalysis, bacteriuria screen (procedure)',NULL,'Bacteriuria screen','2023-09-26 18:46:18','2023-09-26 18:46:18'),(158,3,NULL,'Urinalysis, blood, qualitative (procedure)',NULL,'blood, qualitative','2023-09-26 18:46:18','2023-09-26 18:46:18'),(159,3,NULL,'Color of urine',NULL,'Color of urine','2023-09-26 18:46:18','2023-09-26 18:46:18'),(160,4,NULL,'Direct Coombs test (procedure) ',NULL,'Direct Coombs test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(161,103,NULL,'Indirect Coombs test (procedure)',NULL,'Indirect Coombs test (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(162,5,NULL,'Sickle cell disease screening test (procedure)',NULL,'Sickle cell disease screening test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(163,11,NULL,'Culture and susceptibility (procedure) ',NULL,'Culture and sensitivities','2023-09-26 18:46:18','2023-09-26 18:46:18'),(164,69,NULL,'Modified ZN',NULL,'Modified ZN','2023-09-26 18:46:18','2023-09-26 18:46:18'),(165,75,NULL,'Blood Film Comment',NULL,'Film Comment','2023-09-26 18:46:18','2023-09-26 18:46:18'),(166,42,NULL,'ESR',NULL,'ESR - Erythrocyte sedimentation rate','2023-09-26 18:46:18','2023-09-26 18:46:18'),(167,47,NULL,'Hepatitis C antigen measurement (procedure)',NULL,'Hepatitis C antigen measurement','2023-09-26 18:46:18','2023-09-26 18:46:18'),(168,58,NULL,'Bleeding time (procedure) ',NULL,'Bleeding time','2023-09-26 18:46:18','2023-09-26 18:46:18'),(169,88,NULL,'Measles screening (procedure)',NULL,'Measles screening (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(170,87,NULL,'Viral hemorrhagic fever (disorder) ',NULL,'VHF - Viral hemorrhagic fever','2023-09-26 18:46:18','2023-09-26 18:46:18'),(171,89,NULL,'Polio screening (procedure)',NULL,'Polio screening (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(172,90,NULL,'HB Electrophoresis',NULL,'Hemoglobin electrophoresis (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(173,92,NULL,'AFB Smear',NULL,'Microscopy (acid fast bacilli) (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(174,101,NULL,'Cryptococcus antigen',NULL,'Cryptococcus antigen','2023-09-26 18:46:18','2023-09-26 18:46:18'),(175,107,NULL,'BLOOD CULTURE',NULL,'BLOOD CULTURE','2023-09-26 18:46:18','2023-09-26 18:46:18'),(176,154,NULL,'Histoplasmosis test NOS (procedure)',NULL,'Histoplasmosis test NOS (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(177,8,NULL,'Serum pregnancy test (B-human chorionic gonadotropin) (procedure)',NULL,'Serum pregnancy test (B-human chorionic gonadotropin) (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(178,10,NULL,'Immunoglobulin G antibody to Helicobacter pylori (substance)',NULL,'Immunoglobulin G antibody to Helicobacter pylori (substance)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(179,51,NULL,'Yellow fever screening (procedure)',NULL,'Yellow fever screening (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(180,53,NULL,'Lactic acid measurement',NULL,'Lactic acid measurement','2023-09-26 18:46:18','2023-09-26 18:46:18'),(181,57,NULL,'Creatine kinase measurement (procedure)',NULL,'Creatine kinase measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(182,113,NULL,'Partial thromboplastin time activated (procedure)',NULL,'Partial thromboplastin time activated (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(183,114,NULL,'Albumin measurement (procedure)',NULL,'Albumin measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(184,115,NULL,'Alkaline phosphatase measurement (procedure)',NULL,'Alkaline phosphatase measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(185,116,NULL,'ALT/SGPT serum level (procedure)',NULL,'ALT/SGPT serum level (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(186,117,NULL,'Antistreptolysin-O test (procedure)',NULL,'Antistreptolysin-O test (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(187,118,NULL,'Aspartate aminotransferase measurement (procedure)',NULL,'Aspartate aminotransferase measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(188,120,NULL,'Bilirubin, direct measurement (procedure)',NULL,'Bilirubin, direct measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(189,121,NULL,'Bilirubin, total measurement (procedure)',NULL,'Bilirubin, total measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(190,122,NULL,'Bone marrow structure (body structure)',NULL,'Bone marrow structure (body structure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(191,123,NULL,'Calcium measurement (procedure)',NULL,'Calcium measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(192,124,NULL,'Cardiac enzymes/isoenzymes measurement (procedure)',NULL,'Cardiac enzymes/isoenzymes measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(193,125,NULL,'Absolute CD3 count procedure (procedure)',NULL,'Absolute CD3 count procedure (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(194,126,NULL,'Carcinoembryonic antigen measurement (procedure)',NULL,'Carcinoembryonic antigen measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(195,127,NULL,'Chlamydia antigen test (procedure)',NULL,'Chlamydia antigen test (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(196,128,NULL,'Cholesterol measurement (procedure)',NULL,'Cholesterol measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(197,129,NULL,'Cholinesterase level (procedure)',NULL,'Cholinesterase level (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(198,130,NULL,'CMV IgM level (procedure)',NULL,'CMV IgM level (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(199,131,NULL,'9am cortisol measurement (procedure)',NULL,'9am cortisol measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(200,132,NULL,'Midnight cortisol measurement (procedure)',NULL,'Midnight cortisol measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(201,133,NULL,'Creatinine measurement (procedure)',NULL,'Creatinine measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(202,134,NULL,'Measurement of renal clearance of creatinine (procedure)',NULL,'Measurement of renal clearance of creatinine (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(203,135,NULL,'Estradiol measurement (procedure)',NULL,'Estradiol measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(204,136,NULL,'Fine needle aspiration biopsy for cytology NOC (procedure)',NULL,'Fine needle aspiration biopsy for cytology NOC (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(205,137,NULL,'Follicle stimulating hormone measurement (procedure)',NULL,'Follicle stimulating hormone measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(206,138,NULL,'Prostate Specific Ag Free [Units/volume] in Serum or Plasma',NULL,'Prostate Specific Ag Free [Units/volume] in Serum or Plasma','2023-09-26 18:46:18','2023-09-26 18:46:18'),(207,139,NULL,'Gamma-glutamyltransferase (substance)',NULL,'Gamma-glutamyltransferase (substance)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(208,112,NULL,'Hepatitis B core antibody measurement (procedure)',NULL,'Hepatitis B core antibody measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(209,140,NULL,'High vaginal swab (& taken) (procedure)',NULL,'High vaginal swab (& taken) (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(210,141,NULL,'Inorganic phosphorus measurement (procedure)',NULL,'Inorganic phosphorus measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(211,142,NULL,'KOH MICROSCOPY',NULL,'KOH MICROSCOPY','2023-09-26 18:46:18','2023-09-26 18:46:18'),(212,143,NULL,'L.E. cells (& level) (procedure)',NULL,'L.E. cells (& level) (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(213,144,NULL,'Lactate dehydrogenase measurement (procedure)',NULL,'Lactate dehydrogenase measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(214,145,NULL,'Luteinizing hormone measurement (procedure)',NULL,'Luteinizing hormone measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(215,146,NULL,'Magnesium measurement (procedure)',NULL,'Magnesium measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(216,147,NULL,'Progesterone measurement (procedure)',NULL,'Progesterone measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(217,85,NULL,'Cytologic test (procedure)',NULL,'Cytologic test (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(218,148,NULL,'Prolactin measurement (procedure)',NULL,'Prolactin measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(219,149,NULL,'Protein electrophoresis (procedure)',NULL,'Protein electrophoresis (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(220,0,NULL,'Identification of organism on gram stain of sputum (procedure)',NULL,'Identification of organism on gram stain of sputum (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(221,150,NULL,'Trypanosomal antibody level (procedure)',NULL,'Trypanosomal antibody level (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(222,151,NULL,'Electrolytes measurement, urine (procedure)',NULL,'Electrolytes measurement, urine (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(223,152,NULL,'Measurement of protein in urine (procedure)',NULL,'Measurement of protein in urine (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(224,153,NULL,'Vanillylmandelic acid (VMA) measurement (procedure)',NULL,'Vanillylmandelic acid (VMA) measurement (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(225,110,NULL,'Widal test (procedure)',NULL,'Widal test (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(226,0,NULL,'Drug resistance to antiviral agent (disorder',NULL,'Drug resistance to antiviral agent (disorder','2023-09-26 18:46:18','2023-09-26 18:46:18'),(227,31,NULL,'Semen analysis (procedure)',NULL,'Semen analysis','2023-09-26 18:46:18','2023-09-26 18:46:18'),(228,0,NULL,'Toxoplasmosis test (procedure)',NULL,'TOXOPLASMA IgG/IgM','2023-09-26 18:46:18','2023-09-26 18:46:18'),(229,35,NULL,'Human papillomavirus deoxyribonucleic acid detection (procedure) ',NULL,'HPV DNA detection','2023-09-26 18:46:18','2023-09-26 18:46:18'),(230,36,NULL,'Amylase measurement (procedure) ',NULL,'Amylase level','2023-09-26 18:46:18','2023-09-26 18:46:18'),(231,0,NULL,'Thyroid panel (procedure) ',NULL,'TFT - Thyroid function test','2023-09-26 18:46:18','2023-09-26 18:46:18'),(232,23,NULL,'CSF Analysis',NULL,'Cerebrospinal fluid index (procedure)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(233,155,NULL,'Typhoid fever',NULL,'Typhoid fever','2023-09-26 18:46:18','2023-09-26 18:46:18'),(234,156,NULL,'Cholera',NULL,'Cholera','2023-09-26 18:46:18','2023-09-26 18:46:18'),(235,157,NULL,'Dysenteric diarrhea',NULL,'Dysenteric diarrhea','2023-09-26 18:46:18','2023-09-26 18:46:18'),(236,158,NULL,'Genus Rotavirus',NULL,'Genus Rotavirus','2023-09-26 18:46:18','2023-09-26 18:46:18'),(237,159,NULL,'Meningitis',NULL,'Meningitis','2023-09-26 18:46:18','2023-09-26 18:46:18'),(238,160,NULL,'Tetanus',NULL,'Tetanus','2023-09-26 18:46:18','2023-09-26 18:46:18'),(239,161,NULL,'Plague (disorder)',NULL,'Plague (disorder)','2023-09-26 18:46:18','2023-09-26 18:46:18'),(240,162,NULL,'Antigen of Hepatitis B virus core protein (substance) ',NULL,'Hepatitis B core Ag','2023-09-26 18:46:18','2023-09-26 18:46:18'),(241,163,NULL,'Viral hepatitis, type A (disorder)',NULL,'Viral hepatitis, type A (disorder)','2023-09-26 18:46:18','2023-09-26 18:46:18');
/*!40000 ALTER TABLE `measure_name_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_name_terminology`
--

DROP TABLE IF EXISTS `measure_name_terminology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_name_terminology` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `system_text` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_url` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `measure_name_mapping_id` int unsigned NOT NULL,
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `measure_name_terminology_measure_name_mapping_id_foreign` (`measure_name_mapping_id`),
  CONSTRAINT `measure_name_terminology_measure_name_mapping_id_foreign` FOREIGN KEY (`measure_name_mapping_id`) REFERENCES `measure_name_mappings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_name_terminology`
--

LOCK TABLES `measure_name_terminology` WRITE;
/*!40000 ALTER TABLE `measure_name_terminology` DISABLE KEYS */;
INSERT INTO `measure_name_terminology` VALUES (1,'White blood cell count ','SNOMED','http://snomed.info/sct','767002','WBC',1,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(2,'Red blood cell count ','SNOMED','http://snomed.info/sct','14089001','RBC',2,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(3,'Hemoglobin (substance)','SNOMED','http://snomed.info/sct','38082009','HGB',3,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(4,'Finding of hematocrit (finding) ','SNOMED','http://snomed.info/sct','365616005','HCT',4,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(5,'MCV - Mean cell volume','SNOMED','http://snomed.info/sct','104133003','MCV',5,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(6,'MCH - Mean cell hemoglobin','SNOMED','http://snomed.info/sct','54706004','MCH',6,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(7,'MCHC - Mean cell hemoglobin concentration','SNOMED','http://snomed.info/sct','37254006','MCHC',7,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(8,'Plt - Platelet count','SNOMED','http://snomed.info/sct','61928009','PLT',8,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(9,'Erythrocyte distribution width [Entitic volume] by Automated count','LOINC','https://loinc.org/','21000-5','RDW-SD',9,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(10,'Erythrocyte distribution width [Ratio] by Automated count','LOINC','https://loinc.org/','788-0','RDW-CV',10,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(11,'Platelet distribution width measurement ','SNOMED','http://snomed.info/sct','250313005','PDW',11,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(12,'Platelet mean volume determination ','SNOMED','http://snomed.info/sct','75672003','MPV',12,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(13,'Platelets Large/Platelets in Blood by Automated count','LOINC','https://loinc.org/','48386-7','P-LCR',13,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(14,'Plateletcrit measurement','SNOMED','http://snomed.info/sct','250314004','PCT',14,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(15,'Neutrophil percent differential count ','SNOMED','http://snomed.info/sct','271035003','NEUT%',15,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(16,'Lymphocyte percent differential count ','SNOMED','http://snomed.info/sct','271036002','LYMPH%',16,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(17,'Monocyte percent differential count ','SNOMED','http://snomed.info/sct','271037006','MONO%',17,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(18,'Eosinophil percent differential count ','SNOMED','http://snomed.info/sct','310540006','EO%',18,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(19,'Basophil percent differential count','SNOMED','http://snomed.info/sct','271038001','BASO%',19,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(20,'Neutrophil count ','SNOMED','http://snomed.info/sct','30630007','NEUT#',20,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(21,'Lymphocyte count ','SNOMED','http://snomed.info/sct','74765001','LYMPH#',21,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(22,'Monocyte count','SNOMED','http://snomed.info/sct','67776007','MONO#',22,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(23,'Eosinophil count','SNOMED','http://snomed.info/sct','71960002','EO#',23,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(24,'Basophil count ','SNOMED','http://snomed.info/sct','42351005','BASO#',24,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(25,'IRF','LOINC','https://loinc.org/','413042008','IRF',25,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(26,'LFR','LOINC','https://loinc.org/','82591-9','LFR',26,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(27,'MFR','LOINC','https://loinc.org/','82592-7','MFR',27,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(28,'HFR','LOINC','https://loinc.org/','51643-5','HFR',28,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(29,'RET-He','LOINC','https://loinc.org/','42810-2','RET-He',29,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(30,'Malaria antigen test (procedure) ','SNOMED','http://snomed.info/sct','407727009','MRDT',30,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(31,'ABO blood grouping','SNOMED','http://snomed.info/sct','44608003','Blood Grouping',31,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(32,'Finding of alpha-fetoprotein level','SNOMED','http://snomed.info/sct','80152001','AFP',32,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(33,'Brucella agglutinin test (procedure) ','SNOMED','http://snomed.info/sct','165827007','BAT',33,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(34,'Microscopy for malarial parasites (procedure) ','SNOMED','http://snomed.info/sct','372071003','BS for mps',34,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(35,'Plasmodium falciparum slide test (procedure)','SNOMED','http://snomed.info/sct','391393009','Plasmodium falciparum slide test',35,NULL,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(36,'Plasmodium vivax slide test (procedure)','SNOMED','http://snomed.info/sct','391532003','Plasmodium vivax slide test',36,NULL,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(37,'Absolute CD4 count procedure (procedure) ','SNOMED','http://snomed.info/sct','313660005','CD4 count',37,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(38,'CD4%','SNOMED','http://snomed.info/sct','313938009','CD4%',38,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(39,'CD8 Abs','SNOMED','http://snomed.info/sct','313448001','CD8 Abs',39,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(40,'CD8%','SNOMED','http://snomed.info/sct','313454000','CD8%',40,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(41,'CD45+ Abs','SNOMED','https://loinc.org/','27071-0','CD45+ Abs',41,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(42,'Hb Estimate','SNOMED','http://snomed.info/sct','271026005','Hb Estimate',42,NULL,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(43,'COVID 19 Antigen Rapid Test','SNOMED','http://snomed.info/sct','1240470000000000','COVID 19 Antigen Rapid Test',43,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(44,'COVID-19 PCR Test','SNOMED','http://snomed.info/sct','1269559008','COVID-19 PCR Test',44,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(45,'Major crossmatch (procedure) ','SNOMED','http://snomed.info/sct','41902000','Cross matching',45,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(46,'Smear Follow Up','SNOMED','http://snomed.info/sct','119252009','Smear Follow Up',46,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(47,'ARBO VIRUS','SNOMED','http://snomed.info/sct','122218006','ARBO VIRUS',47,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(48,'C-reactive protein measurement (procedure)','SNOMED','http://snomed.info/sct','55235003','C-RP',48,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(49,'Prothrombin time','SNOMED','http://snomed.info/sct','396451008','Prothrombin Time',49,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(50,'Activated Prothrombin Time','SNOMED','http://snomed.info/sct','42525009','Activated Prothrombin Time',50,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(51,'IN-Ratio','SNOMED','http://snomed.info/sct','165581004','IN-Ratio',51,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(52,'D-dimer assay (procedure)','SNOMED','http://snomed.info/sct','70648006','D-Dimer',52,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(53,'Anti-HBe','SNOMED','http://snomed.info/sct','17627009','Anti-HBe',53,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(54,'Na+','SNOMED','http://snomed.info/sct','25197003','Na+',54,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(55,'K+','SNOMED','http://snomed.info/sct','59573005','K+',55,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(56,'Cl-','SNOMED','http://snomed.info/sct','46511006','Cl-',56,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(57,'Ca2+','SNOMED','http://snomed.info/sct','71878006','Ca2+',57,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(58,'Mg2+','SNOMED','http://snomed.info/sct','38151008','Mg2+',58,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(59,'P','SNOMED','http://snomed.info/sct','104866001','P',59,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(60,'Fasting blood glucose measurement (procedure) ','SNOMED','http://snomed.info/sct','271062006','FBS/FBG',60,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(61,'Ferritin measurement (procedure) ','SNOMED','http://snomed.info/sct','489004','Ferritin',61,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(62,'Glucose measurement (procedure)','SNOMED','http://snomed.info/sct','36048009','GLUCOSE',62,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(63,'Gram stain method (procedure) ','SNOMED','http://snomed.info/sct','62777006','Gram stain',63,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(64,'HB','SNOMED','http://snomed.info/sct','38082009','HB',64,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(65,'HBeAg','SNOMED','http://snomed.info/sct','46325006','HBeAg',65,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(66,'Hepatitis B surface antigen measurement (procedure) ','SNOMED','http://snomed.info/sct','47758006','HBSAg',66,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(67,'Urine pregnancy test (procedure)','SNOMED','http://snomed.info/sct','167252002','HCG',67,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(68,'Hepatitis B Viral Load','SNOMED','http://snomed.info/sct','242341000000000','Hep.B-VL',68,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(69,'Macro:','SNOMED','http://snomed.info/sct','102772008','Macro:',69,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(70,'Microscopy','SNOMED','http://snomed.info/sct','117259009','Microscopy',70,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(71,'HIV PCR Qualitative','SNOMED','http://snomed.info/sct','117748001','HIV PCR Qualitative',71,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(72,'HIV viral load','SNOMED','http://snomed.info/sct','315124004','HIV VIRAL LOAD',72,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(73,'HPV testing','SNOMED','http://snomed.info/sct','9482002','HPV testing',73,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(74,'Genotype HPV 16','SNOMED','http://snomed.info/sct','77399-4','Genotype HPV 16',74,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(75,'Genotype HPV 18_45','SNOMED','http://snomed.info/sct','77400-0','Genotype HPV 18_45',75,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(76,'Other hrHPV','SNOMED','http://snomed.info/sct','71431-1','Other hrHPV',76,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(77,'India ink stain method (procedure)','SNOMED','http://snomed.info/sct','18177006','INDIA INK',77,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(78,'Lactate (substance) ','SNOMED','http://snomed.info/sct','83036002','Lactate',78,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(79,'AST','SNOMED','http://snomed.info/sct','26091008','AST',79,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(80,'ALT','SNOMED','http://snomed.info/sct','34608000','ALT',80,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(81,'ALB','SNOMED','http://snomed.info/sct','26758005','ALB',81,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(82,'T. Proteins','SNOMED','http://snomed.info/sct','40569009','T. Proteins',82,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(83,'Bil.D','SNOMED','http://snomed.info/sct','39748002','Bil.D',83,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(84,'Bil.T','SNOMED','http://snomed.info/sct','359986008','Bil.T',84,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(85,'GGT','SNOMED','http://snomed.info/sct','69480007','GGT',85,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(86,'ALP2','SNOMED','http://snomed.info/sct','88810008','ALP2',86,NULL,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(87,'Cholesterol','SNOMED','http://snomed.info/sct','166827001','Cholesterol',87,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(88,'HDL-C','SNOMED','http://snomed.info/sct','28036006','HDL-C',88,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(89,'LDL-C','SNOMED','http://snomed.info/sct','113079009','LDL-C',89,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(90,'Triglycerides','SNOMED','http://snomed.info/sct','14740000','Triglycerides',90,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(91,'Testosteron','SNOMED','http://snomed.info/sct','43688007','Testosteron',91,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(92,'ICSH','SNOMED','http://snomed.info/sct','69527006','ICSH',92,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(93,'Serum Amylase','SNOMED','http://snomed.info/sct','89659001','Serum Amylase',93,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(94,'Lipase','SNOMED','http://snomed.info/sct','104988000','Lipase',94,NULL,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(95,'Total PSA','SNOMED','http://snomed.info/sct','395146000','Total PSA',95,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(96,'Free PSA','SNOMED','http://snomed.info/sct','395145001','Free PSA',96,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(97,'Random Blood Sugar','SNOMED','http://snomed.info/sct','271061004','RBS',97,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(98,'Creatinine','SNOMED','https://loinc.org/','2163-4','Creatinine',98,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(99,'Urea','SNOMED','https://loinc.org/','3098-1','Urea',99,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(100,'Na','SNOMED','https://loinc.org/','2957-9','Na',100,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(101,'K','SNOMED','https://loinc.org/','2830-8','K',101,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(102,'Cl','SNOMED','http://snomed.info/sct','121750003','Cl',102,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(103,'Rheumatoid factor','SNOMED','http://snomed.info/sct','54921001','RF',103,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(104,'Rapid plasma reagin test','SNOMED','http://snomed.info/sct','19869000','RPR',104,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(105,'Appearance','SNOMED','http://snomed.info/sct','703248002','Appearance',105,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(106,'volume','SNOMED','http://snomed.info/sct','118565006','volume',106,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(107,'Liquefaction','SNOMED','https://loinc.org/','10580-9','Liquefaction',107,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(108,'PH','SNOMED','https://loinc.org/','2752-4','PH',108,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(109,'Sperm Density','SNOMED','http://snomed.info/sct','167782009','Sperm Density',109,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(110,'Morphology','SNOMED','http://snomed.info/sct','117726007','Morphology',110,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(111,'Sperm Motility','SNOMED','http://snomed.info/sct','5025004','Sperm Motility',111,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(112,'MACRO:','SNOMED','http://snomed.info/sct','115334002','MACRO:',112,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(113,'MICRO:','SNOMED','http://snomed.info/sct','252395007','MICRO:',113,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(114,'Urine TB LAM','SNOMED','https://loinc.org/95127-7/','95127-7','TB-LAM',114,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(115,'fT4','SNOMED','http://snomed.info/sct','39700003','fT4',115,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(116,'TSH','SNOMED','http://snomed.info/sct','61167004','TSH',116,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(117,'fT3','SNOMED','http://snomed.info/sct','104994008','fT3',117,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(118,'T3','SNOMED','http://snomed.info/sct','250668004','T3',118,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(119,'T4','SNOMED','http://snomed.info/sct','313408009','T4',119,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(120,'Treponema pallidum hemaglutination test (procedure)','SNOMED','http://snomed.info/sct','269829001','TPHA',120,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(121,'Troponin T measurement','SNOMED','http://snomed.info/sct','121871002','Troponin-T',121,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(122,'Uric acid measurement, urine','SNOMED','http://snomed.info/sct','24205003','Uric Acid',122,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(123,'MTB','SNOMED','http://snomed.info/sct','36354002','MTB',123,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(124,'RIF Resistance','SNOMED','http://snomed.info/sct','415345001','RIF Resistance',124,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(125,'Ziehl-Neelsen stain method (procedure)','SNOMED','http://snomed.info/sct','406979008','ZN stain',125,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(126,'Macroscopy','SNOMED','http://snomed.info/sct','168126000','Appearance',126,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(127,'Urinalysis, glucose, qualitative ','SNOMED','http://snomed.info/sct','69376001','Glucose',127,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(128,'Urine protein level','SNOMED','http://snomed.info/sct','57378007','Protein',128,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(129,'Blood in urine (finding) ','SNOMED','http://snomed.info/sct','34436003','Blood',129,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(130,'Urine pH test','SNOMED','http://snomed.info/sct','167305006','PH',130,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(131,'Specific gravity of urine (finding)','SNOMED','http://snomed.info/sct','310406009','SPECIFIC GRAVITY',131,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(132,'Urine ketone test','SNOMED','http://snomed.info/sct','271347000','KETONES',132,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(133,'Bilirubin measurement, urine','SNOMED','http://snomed.info/sct','79706000','Bilirubin',133,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(134,'Finding of urobilinogen in urine','SNOMED','http://snomed.info/sct','24942001','Urobilinogen',134,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(135,'Leukocytes in urine','SNOMED','http://snomed.info/sct','275741008','Leucocytes',135,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(136,'Urine nitrite ','SNOMED','http://snomed.info/sct','167585009','Nitrites',136,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(137,'Urine microscopy','SNOMED','http://snomed.info/sct','127800008','Microscopy',137,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(138,'Calcium, urine, qualitative (procedure)','SNOMED','http://snomed.info/sct','39762009','Calcium',138,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(139,'Crystal identification, urine (procedure)','SNOMED','http://snomed.info/sct','23779000','Crystal identification',139,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(140,'Fat stain, urine (procedure)','SNOMED','http://snomed.info/sct','10223001','Fat stain',140,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(141,'Febrile agglutinins measurement, Brucella, Francisella, Murine typhus, Q fever, Rocky Mountain Spotted Fever, scrub typhus (procedure)','SNOMED','http://snomed.info/sct','104273003','Febrile agglutinins measurement, Brucella, Francisella, Murine typhus, Q fever, Rocky Mountain Spotted Fever, scrub typhus',141,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(142,'Ferric chloride test, urine (procedure)','SNOMED','http://snomed.info/sct','56880000','Ferric chloride test',142,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(143,'Hemosiderin measurement, urine (procedure)','SNOMED','http://snomed.info/sct','65667006','Hemosiderin measurement',143,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(144,'Identification of microorganisms in urine culture (procedure)','SNOMED','http://snomed.info/sct','309470003','Identification of microorganisms',144,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(145,'Indican measurement, urine (procedure)','SNOMED','http://snomed.info/sct','75212000','Indican measurement',145,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(146,'Measurement of protein and glucose in urine specimen using reagent test strip (procedure)','SNOMED','http://snomed.info/sct','441948005','Protein and glucose',146,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(147,'Measurement of total hemoglobin concentration in urine specimen (procedure)','SNOMED','http://snomed.info/sct','104143000','Total hemoglobin concentration',147,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(148,'Measurement of urine norepinephrine/creatinine ratio (procedure)','SNOMED','http://snomed.info/sct','407646003','norepinephrine/creatinine ratio',148,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(149,'Organism microscopy','SNOMED','http://snomed.info/sct','442138005','Macroscopy',149,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(150,'Rapid urine screening test, bioluminescence (procedure)','SNOMED','http://snomed.info/sct','57239005','Bioluminescence',150,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(151,'Rapid urine screening test, enzyme tube test (procedure)','SNOMED','http://snomed.info/sct','55511007','Rapid urine screening test, enzyme tube test',151,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(152,'Urinalysis with reflex to microscopy (procedure)','SNOMED','http://snomed.info/sct','442468009','Urinalysis with reflex to microscopy',152,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(153,'Urinalysis with reflex to microscopy and culture (procedure)','SNOMED','http://snomed.info/sct','441550005','Reflex to microscopy and culture',153,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(154,'Urinalysis, acetone or ketone bodies measurement (procedure)','SNOMED','http://snomed.info/sct','47615003','Acetone or ketone bodies',154,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(155,'Urinalysis, automated (procedure)','SNOMED','http://snomed.info/sct','2278000','Urinalysis, automated',155,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(156,'Urinalysis, automated, without microscopy (procedure)','SNOMED','http://snomed.info/sct','105362001','Urinalysis, automated, without microscopy (procedure)',156,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(157,'Urinalysis, bacteriuria screen (procedure)','SNOMED','http://snomed.info/sct','73392001','Bacteriuria screen',157,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(158,'Urinalysis, blood, qualitative (procedure)','SNOMED','http://snomed.info/sct','11184008','blood, qualitative',158,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(159,'Color of urine','SNOMED','http://snomed.info/sct','430327009','Color of urine',159,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(160,'Direct Coombs test (procedure) ','SNOMED','http://snomed.info/sct','77020008','Direct Coombs test',160,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(161,'Indirect Coombs test (procedure)','SNOMED','http://snomed.info/sct','16742006','Indirect Coombs test (procedure)',161,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(162,'Sickle cell disease screening test (procedure)','SNOMED','http://snomed.info/sct','314090007','Sickle cell disease screening test',162,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(163,'Culture and susceptibility (procedure) ','SNOMED','http://snomed.info/sct','252390002','Culture and sensitivities',163,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(164,'Modified ZN','SNOMED','https://loinc.org/','23243-9','Modified ZN',164,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(165,'Blood Film Comment','SNOMED','http://snomed.info/sct','14768001','Film Comment',165,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(166,'ESR','SNOMED','http://snomed.info/sct','416838001','ESR - Erythrocyte sedimentation rate',166,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(167,'Hepatitis C antigen measurement (procedure)','SNOMED','http://snomed.info/sct','58589004','Hepatitis C antigen measurement',167,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(168,'Bleeding time (procedure) ','SNOMED','http://snomed.info/sct','72406003','Bleeding time',168,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(169,'Measles screening (procedure)','SNOMED','http://snomed.info/sct','171117006','Measles screening (procedure)',169,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(170,'Viral hemorrhagic fever (disorder) ','SNOMED','http://snomed.info/sct','240523007','VHF - Viral hemorrhagic fever',170,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(171,'Polio screening (procedure)','SNOMED','http://snomed.info/sct','171115003','Polio screening (procedure)',171,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(172,'HB Electrophoresis','SNOMED','http://snomed.info/sct','104145007','Hemoglobin electrophoresis (procedure)',172,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(173,'AFB Smear','SNOMED','http://snomed.info/sct','391483001','Microscopy (acid fast bacilli) (procedure)',173,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(174,'Cryptococcus antigen','SNOMED','http://snomed.info/sct','103094002','Cryptococcus antigen',174,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(175,'BLOOD CULTURE','SNOMED','http://snomed.info/sct','30088009','BLOOD CULTURE',175,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(176,'Histoplasmosis test NOS (procedure)','SNOMED','http://snomed.info/sct','164994004','Histoplasmosis test NOS (procedure)',176,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(177,'Serum pregnancy test (B-human chorionic gonadotropin) (procedure)','SNOMED','http://snomed.info/sct','166434005','Serum pregnancy test (B-human chorionic gonadotropin) (procedure)',177,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(178,'Immunoglobulin G antibody to Helicobacter pylori (substance)','SNOMED','http://snomed.info/sct','710447002','Immunoglobulin G antibody to Helicobacter pylori (substance)',178,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(179,'Yellow fever screening (procedure)','SNOMED','http://snomed.info/sct','171118001','Yellow fever screening (procedure)',179,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(180,'Lactic acid measurement','SNOMED','http://snomed.info/sct','3926003','Lactic acid measurement',180,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(181,'Creatine kinase measurement (procedure)','SNOMED','http://snomed.info/sct','397798009','Creatine kinase measurement (procedure)',181,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(182,'Partial thromboplastin time activated (procedure)','SNOMED','http://snomed.info/sct','42525009','Partial thromboplastin time activated (procedure)',182,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(183,'Albumin measurement (procedure)','SNOMED','http://snomed.info/sct','26758005','Albumin measurement (procedure)',183,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(184,'Alkaline phosphatase measurement (procedure)','SNOMED','http://snomed.info/sct','88810008','Alkaline phosphatase measurement (procedure)',184,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(185,'ALT/SGPT serum level (procedure)','SNOMED','http://snomed.info/sct','143963001','ALT/SGPT serum level (procedure)',185,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(186,'Antistreptolysin-O test (procedure)','SNOMED','http://snomed.info/sct','41451006','Antistreptolysin-O test (procedure)',186,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(187,'Aspartate aminotransferase measurement (procedure)','SNOMED','http://snomed.info/sct','45896001','Aspartate aminotransferase measurement (procedure)',187,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(188,'Bilirubin, direct measurement (procedure)','SNOMED','http://snomed.info/sct','39748002','Bilirubin, direct measurement (procedure)',188,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(189,'Bilirubin, total measurement (procedure)','SNOMED','http://snomed.info/sct','359986008','Bilirubin, total measurement (procedure)',189,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(190,'Bone marrow structure (body structure)','SNOMED','http://snomed.info/sct','14016003','Bone marrow structure (body structure)',190,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(191,'Calcium measurement (procedure)','SNOMED','http://snomed.info/sct','71878006','Calcium measurement (procedure)',191,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(192,'Cardiac enzymes/isoenzymes measurement (procedure)','SNOMED','http://snomed.info/sct','74500006','Cardiac enzymes/isoenzymes measurement (procedure)',192,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(193,'Absolute CD3 count procedure (procedure)','SNOMED','http://snomed.info/sct','313447006','Absolute CD3 count procedure (procedure)',193,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(194,'Carcinoembryonic antigen measurement (procedure)','SNOMED','http://snomed.info/sct','60267001','Carcinoembryonic antigen measurement (procedure)',194,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(195,'Chlamydia antigen test (procedure)','SNOMED','http://snomed.info/sct','310861008','Chlamydia antigen test (procedure)',195,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(196,'Cholesterol measurement (procedure)','SNOMED','http://snomed.info/sct','77068002','Cholesterol measurement (procedure)',196,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(197,'Cholinesterase level (procedure)','SNOMED','http://snomed.info/sct','392896009','Cholinesterase level (procedure)',197,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(198,'CMV IgM level (procedure)','SNOMED','http://snomed.info/sct','143337001','CMV IgM level (procedure)',198,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(199,'9am cortisol measurement (procedure)','SNOMED','http://snomed.info/sct','250654006','9am cortisol measurement (procedure)',199,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(200,'Midnight cortisol measurement (procedure)','SNOMED','http://snomed.info/sct','250655007','Midnight cortisol measurement (procedure)',200,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(201,'Creatinine measurement (procedure)','SNOMED','http://snomed.info/sct','70901006','Creatinine measurement (procedure)',201,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(202,'Measurement of renal clearance of creatinine (procedure)','SNOMED','http://snomed.info/sct','167181009','Measurement of renal clearance of creatinine (procedure)',202,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(203,'Estradiol measurement (procedure)','SNOMED','http://snomed.info/sct','37538009','Estradiol measurement (procedure)',203,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(204,'Fine needle aspiration biopsy for cytology NOC (procedure)','SNOMED','http://snomed.info/sct','180461009','Fine needle aspiration biopsy for cytology NOC (procedure)',204,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(205,'Follicle stimulating hormone measurement (procedure)','SNOMED','http://snomed.info/sct','31003009','Follicle stimulating hormone measurement (procedure)',205,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(206,'Prostate Specific Ag Free [Units/volume] in Serum or Plasma','SNOMED','https://loinc.org/19201-3/','19201-3','Prostate Specific Ag Free [Units/volume] in Serum or Plasma',206,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(207,'Gamma-glutamyltransferase (substance)','SNOMED','http://snomed.info/sct','60153001','Gamma-glutamyltransferase (substance)',207,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(208,'Hepatitis B core antibody measurement (procedure)','SNOMED','http://snomed.info/sct','59582004','Hepatitis B core antibody measurement (procedure)',208,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(209,'High vaginal swab (& taken) (procedure)','SNOMED','http://snomed.info/sct','270049000','High vaginal swab (& taken) (procedure)',209,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(210,'Inorganic phosphorus measurement (procedure)','SNOMED','http://snomed.info/sct','121797002','Inorganic phosphorus measurement (procedure)',210,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(211,'KOH MICROSCOPY','SNOMED','http://snomed.info/sct','372431000000000','KOH MICROSCOPY',211,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(212,'L.E. cells (& level) (procedure)','SNOMED','http://snomed.info/sct','165926002','L.E. cells (& level) (procedure)',212,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(213,'Lactate dehydrogenase measurement (procedure)','SNOMED','http://snomed.info/sct','11274001','Lactate dehydrogenase measurement (procedure)',213,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(214,'Luteinizing hormone measurement (procedure)','SNOMED','http://snomed.info/sct','69527006','Luteinizing hormone measurement (procedure)',214,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(215,'Magnesium measurement (procedure)','SNOMED','http://snomed.info/sct','38151008','Magnesium measurement (procedure)',215,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(216,'Progesterone measurement (procedure)','SNOMED','http://snomed.info/sct','46264006','Progesterone measurement (procedure)',216,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(217,'Cytologic test (procedure)','SNOMED','http://snomed.info/sct','116147009','Cytologic test (procedure)',217,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(218,'Prolactin measurement (procedure)','SNOMED','http://snomed.info/sct','113083009','Prolactin measurement (procedure)',218,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(219,'Protein electrophoresis (procedure)','SNOMED','http://snomed.info/sct','82962001','Protein electrophoresis (procedure)',219,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(220,'Identification of organism on gram stain of sputum (procedure)','SNOMED','http://snomed.info/sct','168002000','Identification of organism on gram stain of sputum (procedure)',220,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(221,'Trypanosomal antibody level (procedure)','SNOMED','http://snomed.info/sct','315203001','Trypanosomal antibody level (procedure)',221,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(222,'Electrolytes measurement, urine (procedure)','SNOMED','http://snomed.info/sct','14830009','Electrolytes measurement, urine (procedure)',222,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(223,'Measurement of protein in urine (procedure)','SNOMED','http://snomed.info/sct','57378007','Measurement of protein in urine (procedure)',223,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(224,'Vanillylmandelic acid (VMA) measurement (procedure)','SNOMED','http://snomed.info/sct','83729008','Vanillylmandelic acid (VMA) measurement (procedure)',224,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(225,'Widal test (procedure)','SNOMED','http://snomed.info/sct','165828002','Widal test (procedure)',225,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(226,'Drug resistance to antiviral agent (disorder','SNOMED','http://snomed.info/sct','713726003','Drug resistance to antiviral agent (disorder',226,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(227,'Semen analysis (procedure)','SNOMED','http://snomed.info/sct','11900001','Semen analysis',227,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(228,'Toxoplasmosis test (procedure)','SNOMED','http://snomed.info/sct','165834009','TOXOPLASMA IgG/IgM',228,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(229,'Human papillomavirus deoxyribonucleic acid detection (procedure) ','SNOMED','http://snomed.info/sct','35904009','HPV DNA detection',229,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(230,'Amylase measurement (procedure) ','SNOMED','http://snomed.info/sct','64435009','Amylase level',230,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(231,'Thyroid panel (procedure) ','SNOMED','http://snomed.info/sct','35650009','TFT - Thyroid function test',231,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(232,'CSF Analysis','SNOMED','http://snomed.info/sct','413016008','Cerebrospinal fluid index (procedure)',232,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(233,'Typhoid fever','SNOMED','http://snomed.info/sct','4834000','Typhoid fever',233,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(234,'Cholera','SNOMED','http://snomed.info/sct','63650001','Cholera',234,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(235,'Dysenteric diarrhea','SNOMED','http://snomed.info/sct','46799006','Dysenteric diarrhea',235,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(236,'Genus Rotavirus','SNOMED','http://snomed.info/sct','417542000','Genus Rotavirus',236,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(237,'Meningitis','SNOMED','http://snomed.info/sct','7180009','Meningitis',237,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(238,'Tetanus','SNOMED','http://snomed.info/sct','76902006','Tetanus',238,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(239,'Plague (disorder)','SNOMED','http://snomed.info/sct','58750007','Plague (disorder)',239,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(240,'Antigen of Hepatitis B virus core protein (substance) ','SNOMED','http://snomed.info/sct','39082004','Hepatitis B core Ag',240,0,'2023-09-26 18:46:18','2023-09-26 18:46:18'),(241,'Viral hepatitis, type A (disorder)','SNOMED','http://snomed.info/sct','40468003','Viral hepatitis, type A (disorder)',241,0,'2023-09-26 18:46:18','2023-09-26 18:46:18');
/*!40000 ALTER TABLE `measure_name_terminology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_ranges`
--

DROP TABLE IF EXISTS `measure_ranges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_ranges` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `measure_id` int unsigned NOT NULL,
  `age_min` decimal(8,2) DEFAULT NULL,
  `age_max` decimal(8,2) DEFAULT NULL,
  `gender` tinyint unsigned DEFAULT NULL,
  `flag_min` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `flag_max` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `range_lower` decimal(7,3) DEFAULT NULL,
  `range_upper` decimal(7,3) DEFAULT NULL,
  `flag_lower` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `flag_upper` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `alphanumeric` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `interpretation` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `result_interpretation_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `measure_ranges_alphanumeric_index` (`alphanumeric`),
  KEY `measure_ranges_measure_id_foreign` (`measure_id`),
  CONSTRAINT `measure_ranges_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_ranges`
--

LOCK TABLES `measure_ranges` WRITE;
/*!40000 ALTER TABLE `measure_ranges` DISABLE KEYS */;
INSERT INTO `measure_ranges` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reactive','',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Reactive','',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(3,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reactive','',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(4,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Reactive','',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(5,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reactive','',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(6,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non-Reactive','',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(7,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'No mps seen','Negative',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(8,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'+','Positive',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(9,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'++','Positive',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(10,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'+++','Positive',NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(11,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O-',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(12,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'O+',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(13,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A-',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(14,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'A+',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(15,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B-',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(16,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'B+',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(17,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AB-',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(18,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'AB+',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(19,23,0.00,100.00,2,NULL,NULL,4.000,11.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(20,24,0.00,100.00,2,NULL,NULL,1.500,4.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(21,25,0.00,100.00,2,NULL,NULL,0.100,9.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(22,26,0.00,100.00,2,NULL,NULL,2.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(23,27,0.00,100.00,2,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(24,28,0.00,100.00,2,NULL,NULL,0.000,2.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(25,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(26,29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(27,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(28,30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(29,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(30,31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(31,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(32,32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(33,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(34,33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(35,34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(36,34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(37,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(38,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(39,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(40,36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(41,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(42,37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(43,38,0.00,0.02,2,NULL,NULL,3.000,15.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(44,38,0.02,0.08,2,NULL,NULL,3.000,15.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(45,38,0.08,1.00,2,NULL,NULL,3.000,15.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(46,38,1.00,12.00,2,NULL,NULL,3.000,15.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(47,38,12.00,60.00,0,NULL,NULL,3.000,15.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(48,38,12.00,60.00,1,NULL,NULL,4.000,11.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(49,38,60.00,999.00,2,NULL,NULL,3.000,15.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(50,39,0.00,0.02,2,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(51,39,0.02,0.08,2,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(52,39,0.08,1.00,2,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(53,39,1.00,12.00,2,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(54,39,12.00,60.00,0,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(55,39,12.00,60.00,1,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(56,39,60.00,999.00,2,NULL,NULL,2.500,5.500,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(57,40,0.00,0.02,2,NULL,NULL,12.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(58,40,0.02,0.08,2,NULL,NULL,8.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(59,40,0.08,1.00,2,NULL,NULL,8.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(60,40,1.00,12.00,2,NULL,NULL,8.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(61,40,12.00,60.00,0,NULL,NULL,13.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(62,40,12.00,60.00,1,NULL,NULL,12.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(63,40,60.00,999.00,2,NULL,NULL,8.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(64,41,0.00,0.02,2,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(65,41,0.02,0.08,2,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(66,41,0.08,1.00,2,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(67,41,1.00,12.00,2,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(68,41,12.00,60.00,0,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(69,41,12.00,60.00,1,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(70,41,60.00,999.00,2,NULL,NULL,26.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(71,42,0.00,0.02,2,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(72,42,0.02,0.08,2,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(73,42,0.08,1.00,2,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(74,42,1.00,12.00,2,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(75,42,12.00,60.00,0,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(76,42,12.00,60.00,1,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(77,42,60.00,999.00,2,NULL,NULL,86.000,110.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(78,43,0.00,0.02,2,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(79,43,0.02,0.08,2,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(80,43,0.08,1.00,2,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(81,43,1.00,12.00,2,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(82,43,12.00,60.00,0,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(83,43,12.00,60.00,1,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(84,43,60.00,999.00,2,NULL,NULL,26.000,38.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(85,44,0.00,0.02,2,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(86,44,0.02,0.08,2,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(87,44,0.08,1.00,2,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(88,44,1.00,12.00,2,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(89,44,12.00,60.00,0,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(90,44,12.00,60.00,1,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(91,44,60.00,999.00,2,NULL,NULL,31.000,37.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(92,45,0.00,0.02,2,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(93,45,0.02,0.08,2,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(94,45,0.08,1.00,2,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(95,45,1.00,12.00,2,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(96,45,12.00,60.00,0,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(97,45,12.00,60.00,1,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(98,45,60.00,999.00,2,NULL,NULL,50.000,400.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(99,46,0.00,0.02,2,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(100,46,0.02,0.08,2,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(101,46,0.08,1.00,2,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(102,46,1.00,12.00,2,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(103,46,12.00,60.00,0,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(104,46,12.00,60.00,1,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(105,46,60.00,999.00,2,NULL,NULL,37.000,54.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(106,47,0.00,0.02,2,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(107,47,0.02,0.08,2,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(108,47,0.08,1.00,2,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(109,47,1.00,12.00,2,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(110,47,12.00,60.00,0,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(111,47,12.00,60.00,1,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(112,47,60.00,999.00,2,NULL,NULL,11.000,16.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(113,48,0.00,0.02,2,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(114,48,0.02,0.08,2,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(115,48,0.08,1.00,2,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(116,48,1.00,12.00,2,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(117,48,12.00,60.00,0,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(118,48,12.00,60.00,1,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(119,48,60.00,999.00,2,NULL,NULL,9.000,17.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(120,49,0.00,0.02,2,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(121,49,0.02,0.08,2,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(122,49,0.08,1.00,2,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(123,49,1.00,12.00,2,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(124,49,12.00,60.00,0,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(125,49,12.00,60.00,1,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(126,49,60.00,999.00,2,NULL,NULL,9.000,13.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(127,50,0.00,0.02,2,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(128,50,0.02,0.08,2,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(129,50,0.08,1.00,2,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(130,50,1.00,12.00,2,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(131,50,12.00,60.00,0,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(132,50,12.00,60.00,1,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(133,50,60.00,999.00,2,NULL,NULL,13.000,43.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(134,51,0.00,0.02,2,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(135,51,0.02,0.08,2,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(136,51,0.08,1.00,2,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(137,51,1.00,12.00,2,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(138,51,12.00,60.00,0,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(139,51,12.00,60.00,1,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(140,51,60.00,999.00,2,NULL,NULL,0.170,0.350,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(141,52,0.00,0.02,2,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(142,52,0.02,0.08,2,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(143,52,0.08,1.00,2,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(144,52,1.00,12.00,2,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(145,52,12.00,60.00,0,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(146,52,12.00,60.00,1,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(147,52,60.00,999.00,2,NULL,NULL,1.500,7.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(148,53,0.00,0.02,2,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(149,53,0.02,0.08,2,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(150,53,0.08,1.00,2,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(151,53,1.00,12.00,2,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(152,53,12.00,60.00,0,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(153,53,12.00,60.00,1,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(154,53,60.00,999.00,2,NULL,NULL,1.000,3.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(155,54,0.00,0.02,2,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(156,54,0.02,0.08,2,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(157,54,0.08,1.00,2,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(158,54,1.00,12.00,2,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(159,54,12.00,60.00,0,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(160,54,12.00,60.00,1,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(161,54,60.00,999.00,2,NULL,NULL,0.000,0.700,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(162,55,0.00,0.02,2,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(163,55,0.02,0.08,2,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(164,55,0.08,1.00,2,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(165,55,1.00,12.00,2,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(166,55,12.00,60.00,0,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(167,55,12.00,60.00,1,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(168,55,60.00,999.00,2,NULL,NULL,0.000,0.400,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(169,56,0.00,0.02,2,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(170,56,0.02,0.08,2,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(171,56,0.08,1.00,2,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(172,56,1.00,12.00,2,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(173,56,12.00,60.00,0,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(174,56,12.00,60.00,1,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(175,56,60.00,999.00,2,NULL,NULL,0.000,0.100,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(176,57,0.00,0.02,2,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(177,57,0.02,0.08,2,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(178,57,0.08,1.00,2,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(179,57,1.00,12.00,2,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(180,57,12.00,60.00,0,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(181,57,12.00,60.00,1,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(182,57,60.00,999.00,2,NULL,NULL,37.000,72.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(183,58,0.00,0.02,2,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(184,58,0.02,0.08,2,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(185,58,0.08,1.00,2,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(186,58,1.00,12.00,2,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(187,58,12.00,60.00,0,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(188,58,12.00,60.00,1,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(189,58,60.00,999.00,2,NULL,NULL,20.000,50.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(190,59,0.00,0.02,2,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(191,59,0.02,0.08,2,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(192,59,0.08,1.00,2,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(193,59,1.00,12.00,2,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(194,59,12.00,60.00,0,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(195,59,12.00,60.00,1,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(196,59,60.00,999.00,2,NULL,NULL,0.000,14.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(197,60,0.00,0.02,2,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(198,60,0.02,0.08,2,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(199,60,0.08,1.00,2,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(200,60,1.00,12.00,2,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(201,60,12.00,60.00,0,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(202,60,12.00,60.00,1,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(203,60,60.00,999.00,2,NULL,NULL,0.000,6.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(204,61,0.00,0.02,2,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(205,61,0.02,0.08,2,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(206,61,0.08,1.00,2,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(207,61,1.00,12.00,2,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(208,61,12.00,60.00,0,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(209,61,12.00,60.00,1,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(210,61,60.00,999.00,2,NULL,NULL,0.000,1.000,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(211,62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Reactive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(212,62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Non Reactive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(213,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(214,84,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(215,91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Low',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(216,91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'High',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(217,91,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Normal',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(218,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'High',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(219,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Low',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(220,92,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Normal',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(221,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'High',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(222,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Low',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(223,93,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Normal',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(224,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(225,94,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(226,95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(227,95,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(228,96,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Positive',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58'),(229,96,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Negative',NULL,NULL,NULL,'2024-12-11 18:06:58','2024-12-11 18:06:58');
/*!40000 ALTER TABLE `measure_ranges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measure_types`
--

DROP TABLE IF EXISTS `measure_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measure_types` (
  `id` int unsigned NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `measure_types_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measure_types`
--

LOCK TABLES `measure_types` WRITE;
/*!40000 ALTER TABLE `measure_types` DISABLE KEYS */;
INSERT INTO `measure_types` VALUES (1,'Numeric Range',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05'),(2,'Alphanumeric Values',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05'),(3,'Autocomplete',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05'),(4,'Free Text',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05');
/*!40000 ALTER TABLE `measure_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measures`
--

DROP TABLE IF EXISTS `measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `eafya_measure_id` int DEFAULT NULL,
  `eafya_measure_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `measure_parentId` int DEFAULT NULL,
  `measure_type_id` int unsigned NOT NULL,
  `measure_name_mapping_id` int unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `unit` varchar(30) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `measures_measure_type_id_foreign` (`measure_type_id`),
  CONSTRAINT `measures_measure_type_id_foreign` FOREIGN KEY (`measure_type_id`) REFERENCES `measure_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measures`
--

LOCK TABLES `measures` WRITE;
/*!40000 ALTER TABLE `measures` DISABLE KEYS */;
INSERT INTO `measures` VALUES (1,NULL,NULL,NULL,2,NULL,'Screening','',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05',NULL),(2,NULL,NULL,NULL,2,NULL,'Confirmatory Test (Statpak)','',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05',NULL),(3,NULL,NULL,NULL,2,NULL,'Unigold','',NULL,'2024-12-11 18:00:05','2024-12-11 18:00:05',NULL),(4,NULL,NULL,NULL,2,NULL,'BS for mps','',NULL,'2024-12-11 18:00:06','2024-12-11 18:00:06',NULL),(5,NULL,NULL,NULL,4,NULL,'GXM','',NULL,'2024-12-11 18:00:07','2024-12-11 18:00:07',NULL),(6,NULL,NULL,NULL,2,NULL,'Blood Grouping','',NULL,'2024-12-11 18:00:07','2024-12-11 18:00:07',NULL),(7,NULL,NULL,NULL,1,NULL,'HB','g/dL',NULL,'2024-12-11 18:00:08','2024-12-11 18:00:08',NULL),(8,NULL,NULL,NULL,4,NULL,'Pus cells','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(9,NULL,NULL,NULL,4,NULL,'S. haematobium','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(10,NULL,NULL,NULL,4,NULL,'T. vaginalis','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(11,NULL,NULL,NULL,4,NULL,'Yeast cells','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(12,NULL,NULL,NULL,4,NULL,'Red blood cells','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(13,NULL,NULL,NULL,4,NULL,'Bacteria','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(14,NULL,NULL,NULL,4,NULL,'Spermatozoa','',NULL,'2024-12-11 18:00:09','2024-12-11 18:00:09',NULL),(15,NULL,NULL,NULL,4,NULL,'Epithelial cells','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(16,NULL,NULL,NULL,4,NULL,'Glucose','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(17,NULL,NULL,NULL,4,NULL,'Ketones','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(18,NULL,NULL,NULL,4,NULL,'Proteins','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(19,NULL,NULL,NULL,4,NULL,'Blood','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(20,NULL,NULL,NULL,4,NULL,'Bilirubin','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(21,NULL,NULL,NULL,4,NULL,'Urobilinogen Phenlpyruvic acid','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(22,NULL,NULL,NULL,4,NULL,'pH','',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(23,NULL,NULL,NULL,1,NULL,'WBC','x10³/µL',NULL,'2024-12-11 18:00:10','2024-12-11 18:00:10',NULL),(24,NULL,NULL,NULL,1,NULL,'Lym','L',NULL,'2024-12-11 18:00:11','2024-12-11 18:00:11',NULL),(25,NULL,NULL,NULL,1,NULL,'Mon','*',NULL,'2024-12-11 18:00:11','2024-12-11 18:00:11',NULL),(26,NULL,NULL,NULL,1,NULL,'Neu','*',NULL,'2024-12-11 18:00:11','2024-12-11 18:00:11',NULL),(27,NULL,NULL,NULL,1,NULL,'Eos','',NULL,'2024-12-11 18:00:11','2024-12-11 18:00:11',NULL),(28,NULL,NULL,NULL,1,NULL,'Baso','',NULL,'2024-12-11 18:00:11','2024-12-11 18:00:11',NULL),(29,NULL,NULL,NULL,2,NULL,'Salmonella Antigen Test','',NULL,'2024-12-11 18:00:20','2024-12-11 18:00:20',NULL),(30,NULL,NULL,NULL,2,NULL,'Direct COOMBS Test','',NULL,'2024-12-11 18:00:20','2024-12-11 18:00:20',NULL),(31,NULL,NULL,NULL,2,NULL,'Du Test','',NULL,'2024-12-11 18:00:20','2024-12-11 18:00:20',NULL),(32,NULL,NULL,NULL,2,NULL,'Sickling Test','',NULL,'2024-12-11 18:00:21','2024-12-11 18:00:21',NULL),(33,NULL,NULL,NULL,2,NULL,'Borrelia','',NULL,'2024-12-11 18:00:21','2024-12-11 18:00:21',NULL),(34,NULL,NULL,NULL,2,NULL,'VDRL','',NULL,'2024-12-11 18:00:21','2024-12-11 18:00:21',NULL),(35,NULL,NULL,NULL,2,NULL,'Pregnancy Test','',NULL,'2024-12-11 18:00:21','2024-12-11 18:00:21',NULL),(36,NULL,NULL,NULL,2,NULL,'Brucella','',NULL,'2024-12-11 18:00:21','2024-12-11 18:00:21',NULL),(37,NULL,NULL,NULL,2,NULL,'H. Pylori','',NULL,'2024-12-11 18:00:22','2024-12-11 18:00:22',NULL),(38,NULL,NULL,NULL,1,NULL,'WBC','x10³/µL',NULL,'2024-12-11 18:00:25','2024-12-11 18:00:25',NULL),(39,NULL,NULL,NULL,1,NULL,'RBC','x10⁶/µL',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(40,NULL,NULL,NULL,1,NULL,'HGB','g/dL',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(41,NULL,NULL,NULL,1,NULL,'HCT','%',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(42,NULL,NULL,NULL,1,NULL,'MCV','fL',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(43,NULL,NULL,NULL,1,NULL,'MCH','pg',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(44,NULL,NULL,NULL,1,NULL,'MCHC','g/dL',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(45,NULL,NULL,NULL,1,NULL,'PLT','x10³/µL',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(46,NULL,NULL,NULL,1,NULL,'RDW-SD','fL',NULL,'2024-12-11 18:00:26','2024-12-11 18:00:26',NULL),(47,NULL,NULL,NULL,1,NULL,'RDW-CV','%',NULL,'2024-12-11 18:00:27','2024-12-11 18:00:27',NULL),(48,NULL,NULL,NULL,1,NULL,'PDW','fL',NULL,'2024-12-11 18:00:27','2024-12-11 18:00:27',NULL),(49,NULL,NULL,NULL,1,NULL,'MPV','fL',NULL,'2024-12-11 18:00:27','2024-12-11 18:00:27',NULL),(50,NULL,NULL,NULL,1,NULL,'P-LCR','%',NULL,'2024-12-11 18:00:27','2024-12-11 18:00:27',NULL),(51,NULL,NULL,NULL,1,NULL,'PCT','%',NULL,'2024-12-11 18:00:27','2024-12-11 18:00:27',NULL),(52,NULL,NULL,NULL,1,NULL,'NEUT#','x10³/µL',NULL,'2024-12-11 18:00:27','2024-12-11 18:00:27',NULL),(53,NULL,NULL,NULL,1,NULL,'LYMPH#','x10³/µL',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(54,NULL,NULL,NULL,1,NULL,'MONO#','x10³/µL',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(55,NULL,NULL,NULL,1,NULL,'EO#','x10³/µL',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(56,NULL,NULL,NULL,1,NULL,'BASO#','x10³/µL',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(57,NULL,NULL,NULL,1,NULL,'NEUT%','%',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(58,NULL,NULL,NULL,1,NULL,'LYMPH%','%',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(59,NULL,NULL,NULL,1,NULL,'MONO%','%',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(60,NULL,NULL,NULL,1,NULL,'EO%','%',NULL,'2024-12-11 18:00:28','2024-12-11 18:00:28',NULL),(61,NULL,NULL,NULL,1,NULL,'BASO%','%',NULL,'2024-12-11 18:00:29','2024-12-11 18:00:29',NULL),(62,NULL,NULL,NULL,2,NULL,'Crag','',NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56',NULL),(63,NULL,NULL,NULL,4,NULL,'Differential','',NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57',NULL),(64,NULL,NULL,NULL,4,NULL,'Total Cell Count','',NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57',NULL),(65,NULL,NULL,NULL,4,NULL,'Lymphocytes','',NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57',NULL),(66,NULL,NULL,NULL,4,NULL,'Quantitative Culture','',NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57',NULL),(67,NULL,NULL,NULL,4,NULL,'RBC Count','',NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57',NULL),(68,NULL,NULL,NULL,4,NULL,'TPHA','',NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57',NULL),(69,NULL,NULL,NULL,4,NULL,'HCG','',NULL,'2024-12-11 18:01:00','2024-12-11 18:01:00',NULL),(70,NULL,NULL,NULL,4,NULL,'Bilirubin','',NULL,'2024-12-11 18:01:00','2024-12-11 18:01:00',NULL),(71,NULL,NULL,NULL,4,NULL,'Blood','',NULL,'2024-12-11 18:01:00','2024-12-11 18:01:00',NULL),(72,NULL,NULL,NULL,4,NULL,'Glucose','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(73,NULL,NULL,NULL,4,NULL,'Ketones','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(74,NULL,NULL,NULL,4,NULL,'Leukocytes','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(75,NULL,NULL,NULL,4,NULL,'Microscopy','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(76,NULL,NULL,NULL,4,NULL,'Nitrite','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(77,NULL,NULL,NULL,4,NULL,'pH','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(78,NULL,NULL,NULL,4,NULL,'Protein','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(79,NULL,NULL,NULL,4,NULL,'Specific Gravity','',NULL,'2024-12-11 18:01:01','2024-12-11 18:01:01',NULL),(80,NULL,NULL,NULL,4,NULL,'Urobilinogen','',NULL,'2024-12-11 18:01:02','2024-12-11 18:01:02',NULL),(81,NULL,NULL,NULL,4,NULL,'Appearance','',NULL,'2024-12-11 18:01:04','2024-12-11 18:01:04',NULL),(82,NULL,NULL,NULL,4,NULL,'Culture and Sensitivity',NULL,NULL,'2024-12-11 18:01:04','2024-12-11 18:01:04',NULL),(83,NULL,NULL,NULL,4,NULL,'Gram Staining','',NULL,'2024-12-11 18:01:04','2024-12-11 18:01:04',NULL),(84,NULL,NULL,NULL,2,NULL,'India Ink Staining',NULL,NULL,'2024-12-11 18:01:04','2024-12-11 18:01:04',NULL),(85,NULL,NULL,NULL,4,NULL,'Protein',NULL,NULL,'2024-12-11 18:01:05','2024-12-11 18:01:05',NULL),(86,NULL,NULL,NULL,4,NULL,'Wet preparation (saline preparation)',NULL,NULL,'2024-12-11 18:01:05','2024-12-11 18:01:05',NULL),(87,NULL,NULL,NULL,4,NULL,'White Blood Cell Count',NULL,NULL,'2024-12-11 18:01:05','2024-12-11 18:01:05',NULL),(88,NULL,NULL,NULL,4,NULL,'ZN Staining',NULL,NULL,'2024-12-11 18:01:05','2024-12-11 18:01:05',NULL),(89,NULL,NULL,NULL,4,NULL,'Modified ZN','',NULL,'2024-12-11 18:01:05','2024-12-11 18:01:05',NULL),(90,NULL,NULL,NULL,4,NULL,'Wet Saline Iodine Prep','',NULL,'2024-12-11 18:01:05','2024-12-11 18:01:05',NULL),(91,NULL,NULL,NULL,2,NULL,'SERUM AMYLASE','',NULL,'2024-12-11 18:01:06','2024-12-11 18:01:06',NULL),(92,NULL,NULL,NULL,2,NULL,'calcium','',NULL,'2024-12-11 18:01:06','2024-12-11 18:01:06',NULL),(93,NULL,NULL,NULL,2,NULL,'SGOT','',NULL,'2024-12-11 18:01:06','2024-12-11 18:01:06',NULL),(94,NULL,NULL,NULL,2,NULL,'Indirect COOMBS test','',NULL,'2024-12-11 18:01:06','2024-12-11 18:01:06',NULL),(95,NULL,NULL,NULL,2,NULL,'Direct COOMBS test','',NULL,'2024-12-11 18:01:06','2024-12-11 18:01:06',NULL),(96,NULL,NULL,NULL,2,NULL,'Du test','',NULL,'2024-12-11 18:01:06','2024-12-11 18:01:06',NULL),(97,NULL,NULL,NULL,4,NULL,'RPR','',NULL,'2024-12-11 18:01:17','2024-12-11 18:01:17',NULL),(98,NULL,NULL,NULL,4,NULL,'Serum Crag','',NULL,'2024-12-11 18:01:18','2024-12-11 18:01:18',NULL);
/*!40000 ALTER TABLE `measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metrics`
--

DROP TABLE IF EXISTS `metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metrics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metrics`
--

LOCK TABLES `metrics` WRITE;
/*!40000 ALTER TABLE `metrics` DISABLE KEYS */;
/*!40000 ALTER TABLE `metrics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `micro_patients_details`
--

DROP TABLE IF EXISTS `micro_patients_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `micro_patients_details` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `sub_county_residence` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sub_county_workplace` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name_next_kin` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact_next_kin` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `residence_next_kin` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admission_date` datetime DEFAULT NULL,
  `transfered` tinyint DEFAULT NULL,
  `facility_transfered` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinical_notes` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `days_on_antibiotic` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `requested_by` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinician_contact` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `micro_patients_details_patient_id_foreign` (`patient_id`),
  CONSTRAINT `micro_patients_details_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `unhls_patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `micro_patients_details`
--

LOCK TABLES `micro_patients_details` WRITE;
/*!40000 ALTER TABLE `micro_patients_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `micro_patients_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_04_04_111959_fkc',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(2,'2014_07_24_082711_CreatekBLIStables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(3,'2014_09_02_114206_entrust_setup_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(4,'2014_10_09_162222_externaldumptable',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(5,'2014_11_09_133917_create_permission_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(6,'2015_02_04_004704_add_index_to_parentlabno',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(7,'2015_02_11_112608_remove_unique_constraint_on_patient_number',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(8,'2015_02_17_104134_qc_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(9,'2015_02_23_112018_create_microbiology_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(10,'2015_02_27_084341_createInventoryTables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(11,'2015_03_16_155558_create_surveillance',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(12,'2015_06_24_145526_update_test_types_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(13,'2015_06_24_154426_FreeTestsColumn',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(14,'2016_03_30_145749_lab_config_settings',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(15,'2016_04_12_093617_update_inventory_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(16,'2016_07_26_095319_create_unhls_financial_years_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(17,'2016_07_26_095409_create_unhls_drugs_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(18,'2016_08_17_181955_create_rejection_reasons',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(19,'2016_08_31_135348_create_unhls_stockcard',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(20,'2016_08_31_135420_create_unhls_stockrequisition',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(21,'2016_09_28_091952_create_unhls_warehouse',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(22,'2016_09_28_095327_create_unhls_staff',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(23,'2016_10_03_220056_create_bbincidences_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(24,'2016_10_03_220511_create_bbactions_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(25,'2016_10_03_220622_create_bbcauses_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(26,'2016_10_03_220702_create_bbnatures_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(27,'2016_10_03_220852_create_bbincidences_action_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(28,'2016_10_03_220959_create_bbincidences_cause_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(29,'2016_10_03_221055_create_bbincidences_nature_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(30,'2016_10_13_170615_create_unhls_equipment_suppliers_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(31,'2016_10_19_115152_create_referral_reasons',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(32,'2017_01_16_103507_create_equipment_inventory_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(33,'2017_01_16_103533_create_equipment_maintenance_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(34,'2017_01_16_103546_create_equipment_breakdown_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(35,'2017_04_27_134821_create_wards_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(36,'2017_04_27_144035_update_visits_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(37,'2017_04_27_160407_create_therapy_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(38,'2017_05_25_131728_updateUNHLSBreakdown',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(39,'2017_06_19_094902_update_equipment_inventory_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(40,'2017_06_19_111831_update_equipment_breakdown_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(41,'2017_06_19_115028_update_unhls_stockcard_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(42,'2017_06_20_043838_alter_stockcard_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(43,'2017_06_30_183112_update_microbiology_functionalities',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(44,'2017_07_05_170430_create_reports_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(45,'2017_07_27_160147_create_visit_status_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(46,'2017_07_27_160228_add_status_column_to_visit_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(47,'2017_07_28_113854_add_clinical_notes_column_to_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(48,'2017_07_28_120834_add_phone_contact_column_to_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(49,'2017_07_31_020011_create_uuids_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(50,'2017_08_02_192917_alter_specimen_id_nullable_unhls_tests',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(51,'2017_08_22_080201_create_test_name_mappings_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(52,'2017_10_10_094958_update_hiv_report_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(53,'2017_10_15_122554_adhoc_configs_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(54,'2017_11_07_160414_create_instrument_column_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(55,'2017_11_15_121513_update_visit_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(56,'2018_01_12_152202_add_column_range_interpretion',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(57,'2018_03_06_194838_create_poc_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(58,'2018_03_15_090759_alter_test_results_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(59,'2018_03_16_180358_create_poc_results',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(60,'2018_03_23_061054_alter_poc_results',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(61,'2018_05_14_172215_create_hubs',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(62,'2018_08_29_190957_add_unhls_equipment_breakdown_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(63,'2018_12_11_125050_add_unique_key_constraint_to_poc_tables',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(64,'2019_01_13_121925_add_targetTAT_units_to_test_types',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(65,'2019_02_24_121910_ward_type',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(66,'2019_02_24_122140_add_ward_type_column_ward_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(67,'2019_02_24_122237_add_visit_lab_number_column_unhls_visits_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(68,'2019_02_25_120647_create_clinicians_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(69,'2019_05_03_100733_add_therapy',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(70,'2019_06_01_104858_add_nationality_to_unhls_patients_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(71,'2019_06_01_131758_add_columns_to_facilities_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(72,'2019_06_07_071010_add_columns_to_unhls_visits_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(73,'2019_08_28_114927_create_micro_patients_details_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(74,'2019_08_30_073037_create_unhls_testpurposes_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(75,'2019_09_02_150236_create_patient_antibiotics_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(76,'2019_09_05_154424_add_column_to_unhls_patients_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(77,'2019_09_15_045236_add_columns_to_unhls_tests_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(78,'2019_09_15_051141_add_columns_to_measure_ranges_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(79,'2019_09_16_095336_update_equipment',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(80,'2019_09_16_095730_create_lookp_type_value',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(81,'2019_09_16_095809_create_lookup_type',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(82,'2019_09_16_100528_add_columns_to_referrals_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(83,'2019_09_16_103117_create_unhls_recalled_test_results_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(84,'2019_11_28_134500_add_emergency_column',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(85,'2019_11_28_134550_add_emergency_id_column_to_unhls_visits',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(86,'2020_01_31_180617_add_supplier_id_to_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(87,'2020_09_12_120922_update_poc_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(88,'2020_10_05_153547_additional_updates',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(89,'2021_01_08_121939_add_admission_date_patients_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(90,'2021_03_15_093826_upgrade_to_spatie_roles_and_permissions',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(91,'2021_03_25_163532_tb_patient_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(92,'2021_05_02_201356_add_upload_columns',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(93,'2021_06_09_202523_blood_transfusion_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(94,'2021_07_22_012639_poc_referral_updates',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(95,'2021_08_02_060736_hpv_details',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(96,'2022_02_26_121011_create_viral_load_details',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(97,'2022_05_04_115632_viral_load_poc',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(98,'2022_05_09_072605_create_unhls_analyte_result_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(99,'2022_05_12_090439_create_hielogs_table',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(100,'2022_05_23_065617_alter_poc_results_add_mpima',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(101,'2022_07_15_063301_add_poc_device_into_vl',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(102,'2022_07_15_063510_add_upload_permission',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(103,'2022_10_10_185921_test_mapping_updated',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(104,'2022_10_23_221832_new_additions',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(105,'2022_12_16_173744_add_user_signature',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(106,'2023_03_05_194659_facility_details',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(107,'2023_03_21_091352_additional_facility_maracha',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(108,'2023_05_02_160229_referral_updates',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(109,'2023_05_02_160417_patient_details',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(110,'2023_05_03_141436_default_clinician',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(111,'2023_05_18_193012_home_permission',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(112,'2023_05_23_135820_color_code_and_dispatch',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(113,'2023_06_15_145350_update_equipment_breakdown',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(114,'2023_06_16_150258_update_inventory',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(115,'2023_06_28_013939_backdate_datetime',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(116,'2023_07_03_155355_ahd_additions202307',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(117,'2023_07_24_131404_update_facility_details',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(118,'2023_08_07_143223_integration_additions',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(119,'2023_08_22_044000_measure_name_terminology',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(120,'2023_08_22_044038_specimen_type_terminology',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(121,'2023_08_22_044054_test_category_terminology',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(122,'2023_08_22_044110_test_name_terminology',1,'2024-12-11 18:06:59','2024-12-11 18:06:59'),(123,'2023_08_22_044452_add_timestamp_to_all_tables',1,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(124,'2023_08_22_103456_timestamp_update',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(125,'2023_08_22_103505_timestamp_update2',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(126,'2023_09_23_084118_add_emr_connection',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(127,'2023_10_02_173500_alter_measure_name_mappings',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(128,'2023_10_03_164204_emr_alis_rejection',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(129,'2023_10_04_051547_rejection_codes',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(130,'2023_10_20_163938_integration_updates',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(131,'2023_10_22_121559_alter_hie_logs',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(132,'2023_11_22_094322_updates1123',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(133,'2024_02_02_030552_integrated_systems',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(134,'2024_02_09_090251_create_departments_table',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(135,'2024_02_26_151942_update_instrument_in_testlist',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(136,'2024_03_05_185503_add_terminology_to_measure',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(137,'2024_03_22_164724_create_instrument_test_codes_table',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(138,'2024_03_23_125728_update_instruments',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(139,'2024_03_24_143414_column_name_change_in_testlist',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(140,'2024_03_25_154414_microbiology_changes',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(141,'2024_03_29_145005_update_referral_table',1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(142,'2024_03_29_151428_update_timestamps',1,'2024-12-11 18:13:16','2024-12-11 18:13:16'),(143,'2024_03_30_155122_update_mappings',1,'2024-12-11 18:13:20','2024-12-11 18:13:20'),(144,'2024_03_30_155158_update_test_mappings',1,'2024-12-11 18:13:27','2024-12-11 18:13:27'),(145,'2024_03_30_173331_added_column_in_visits',1,'2024-12-11 18:13:29','2024-12-11 18:13:29'),(146,'2024_04_01_163033_test_category_terms',1,'2024-12-11 18:13:31','2024-12-11 18:13:31'),(147,'2024_04_02_125318_additional_migrations_2402',1,'2024-12-11 18:13:34','2024-12-11 18:13:34'),(148,'2024_05_26_170109_modify_test_table',1,'2024-12-11 18:13:34','2024-12-11 18:13:34'),(149,'2024_05_27_160334_alter_specimens_table',1,'2024-12-11 18:13:38','2024-12-11 18:13:38'),(150,'2024_05_28_095400_updated_measures',1,'2024-12-11 18:13:40','2024-12-11 18:13:40'),(151,'2024_05_29_111037_alter_specimens_table_column',1,'2024-12-11 18:13:40','2024-12-11 18:13:40'),(152,'2024_06_20_141502_microbiology_departments',1,'2024-12-11 18:13:42','2024-12-11 18:13:42'),(153,'2024_06_29_130453_add_test_purpose_to_specimens_table',1,'2024-12-11 18:13:46','2024-12-11 18:13:46'),(154,'2024_07_29_153454_new_prison_facility_updated',1,'2024-12-11 18:13:46','2024-12-11 18:13:46'),(155,'2024_07_30_061543_add_all_prison_facilities',1,'2024-12-11 18:13:46','2024-12-11 18:13:46'),(156,'2024_07_30_132647_add_more_facilities',1,'2024-12-11 18:13:47','2024-12-11 18:13:47'),(157,'2024_07_30_143128_add_palabek_facility',1,'2024-12-11 18:13:47','2024-12-11 18:13:47'),(158,'2024_08_13_104416_updated_facility_list',1,'2024-12-11 18:13:50','2024-12-11 18:13:50'),(159,'2024_08_14_162456_micro_visit',1,'2024-12-11 18:13:51','2024-12-11 18:13:51'),(160,'2024_08_21_212035_alter_wards_table',1,'2024-12-11 18:13:52','2024-12-11 18:13:52'),(161,'2024_08_27_183750_add_eafya_columns_to_test_types',1,'2024-12-11 18:13:53','2024-12-11 18:13:53'),(162,'2024_08_31_212610_alter_unhls_test_add_eafya_check',1,'2024-12-11 18:13:54','2024-12-11 18:13:54'),(163,'2024_09_02_134708_alter_table_measures_add_eafya_measure_id',1,'2024-12-11 18:13:55','2024-12-11 18:13:55'),(164,'2024_09_02_135128_alter_table_users_add_eafya_uuid',1,'2024-12-11 18:13:56','2024-12-11 18:13:56'),(165,'2024_09_30_161222_alter_test_type_table_add_eafya_test_type_name',1,'2024-12-11 18:13:59','2024-12-11 18:13:59'),(166,'2024_09_30_162303_alter_measures_table_add_eafya_measure_name',1,'2024-12-11 18:14:00','2024-12-11 18:14:00'),(167,'2024_11_05_102546_add_uploaded_column_to_isolated_organism',1,'2024-12-11 18:14:00','2024-12-11 18:14:00'),(168,'2024_11_14_005133_insert_failed_to_synch_into_test_statuses',1,'2024-12-11 18:14:01','2024-12-11 18:14:01');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `spatie_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (18,'User',1,'2024-12-11 18:07:00','2024-12-11 18:07:00');
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `spatie_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Models\\User',1,'2024-12-11 18:15:27','2024-12-11 18:15:27');
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisms`
--

DROP TABLE IF EXISTS `organisms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organisms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gram_code` int DEFAULT NULL,
  `organism_code` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `organisms_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisms`
--

LOCK TABLES `organisms` WRITE;
/*!40000 ALTER TABLE `organisms` DISABLE KEYS */;
INSERT INTO `organisms` VALUES (1,'Pseudomonas aeruginosa',NULL,NULL,NULL,NULL,'2017-05-31 11:29:37','2017-05-31 11:29:37'),(2,'Escherichia coli',NULL,NULL,NULL,NULL,'2017-05-31 11:29:38','2017-05-31 11:29:38'),(3,'Enterobacteriacae',NULL,NULL,NULL,NULL,'2017-05-31 11:29:40','2017-05-31 11:29:40'),(5,'Pseudomonas flourescens',NULL,NULL,NULL,NULL,'2017-05-31 11:29:43','2017-05-31 11:29:43'),(6,'Pseudomonas spp',NULL,NULL,NULL,NULL,'2017-05-31 11:29:44','2017-05-31 11:29:44'),(12,'Acinetobacter spp',NULL,NULL,NULL,NULL,'2017-05-31 11:29:47','2017-05-31 11:29:47'),(13,'Acinetobacter baumannii',NULL,NULL,NULL,NULL,'2017-05-31 11:29:48','2017-05-31 11:29:48'),(16,'Salmonella spp',NULL,NULL,NULL,NULL,'2017-05-31 11:29:50','2017-05-31 11:29:50'),(17,'Salmonella typhi',NULL,NULL,NULL,NULL,'2017-05-31 11:29:51','2017-05-31 11:29:51'),(18,'Salmonella paratyphi B',NULL,NULL,NULL,NULL,'2017-05-31 11:29:51','2017-05-31 11:29:51'),(19,'Salmonella choleraesuis',NULL,NULL,NULL,NULL,'2017-05-31 11:29:52','2017-05-31 11:29:52'),(20,'Vibrio cholerae',NULL,NULL,NULL,NULL,'2017-05-31 11:29:52','2017-05-31 11:29:52'),(21,'Viridans streptococcus',NULL,NULL,NULL,NULL,'2017-05-31 11:29:52','2017-05-31 11:29:52'),(22,'Staphylococcus aureas',NULL,NULL,NULL,'2017-06-25 13:34:14','2017-05-31 11:29:53','2017-06-25 13:34:14'),(23,'Staphylococcus aureus',NULL,NULL,NULL,NULL,'2017-05-31 11:29:54','2017-05-31 11:29:54'),(24,'Staphylococcus epidermidis',NULL,NULL,NULL,NULL,'2017-05-31 11:29:55','2017-05-31 11:29:55'),(25,'Staphylococcus spp',NULL,NULL,NULL,NULL,'2017-05-31 11:29:56','2017-05-31 11:29:56'),(26,'Staphylococus aureus',NULL,NULL,NULL,'2017-06-25 13:35:55','2017-05-31 11:29:57','2017-06-25 13:35:55'),(29,'Staphylococcus horminis',NULL,NULL,NULL,NULL,'2017-05-31 11:30:00','2017-05-31 11:30:00'),(30,'Staphylococcus pasteuri.',NULL,NULL,NULL,NULL,'2017-05-31 11:30:01','2017-05-31 11:30:01'),(31,'Staphylococcus saprophyticus',NULL,NULL,NULL,NULL,'2017-05-31 11:30:02','2017-05-31 11:30:02'),(32,'Enterobacter spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:03','2017-05-31 11:30:03'),(33,'Enterobacter cloacae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:04','2017-05-31 11:30:04'),(34,'Enterococcus spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:05','2017-05-31 11:30:05'),(35,'Enterococcus feacalis',NULL,NULL,NULL,NULL,'2017-05-31 11:30:06','2017-05-31 11:30:06'),(36,'Streptococcus spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:07','2017-05-31 11:30:07'),(37,'Burkholderia cepacia',NULL,NULL,NULL,NULL,'2017-05-31 11:30:07','2017-05-31 11:30:07'),(38,'Burkholderia mallei',NULL,NULL,NULL,NULL,'2017-05-31 11:30:08','2017-05-31 11:30:08'),(39,'Burkholderia pseudomallei',NULL,NULL,NULL,NULL,'2017-05-31 11:30:08','2017-05-31 11:30:08'),(40,'Neisseria spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:09','2017-05-31 11:30:09'),(41,'Neisseria gonorrhae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:09','2017-05-31 11:30:09'),(42,'Neisseria gonorrhoeae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:09','2017-05-31 11:30:09'),(43,'Neisseria meningitidis',NULL,NULL,NULL,NULL,'2017-05-31 11:30:10','2017-05-31 11:30:10'),(44,'Haemophilus spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:10','2017-05-31 11:30:10'),(45,'Haemophilus influenzae spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:11','2017-05-31 11:30:11'),(46,'Haemophilus influenzae type B',NULL,NULL,NULL,NULL,'2017-05-31 11:30:12','2017-05-31 11:30:12'),(47,'Haemophilus influenzae isolated',NULL,NULL,NULL,'2017-06-25 14:15:27','2017-05-31 11:30:12','2017-06-25 14:15:27'),(48,'Haemophilus influenzae nontypaeble',NULL,NULL,NULL,NULL,'2017-05-31 11:30:13','2017-05-31 11:30:13'),(52,'Haemophilus influenza',NULL,NULL,NULL,NULL,'2017-05-31 11:30:16','2017-05-31 11:30:16'),(53,'Haemophilus ducreyi',NULL,NULL,NULL,NULL,'2017-05-31 11:30:16','2017-05-31 11:30:16'),(54,'Haemophilus aphrophilus',NULL,NULL,NULL,NULL,'2017-05-31 11:30:17','2017-05-31 11:30:17'),(55,'Haemophilus aegyptius',NULL,NULL,NULL,NULL,'2017-05-31 11:30:17','2017-05-31 11:30:17'),(56,'Haemophilus parainfluenzae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:18','2017-05-31 11:30:18'),(61,'Streptococcus pneumoniae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:21','2017-05-31 11:30:21'),(67,'Enterobacter aerogenes',NULL,NULL,NULL,NULL,'2017-05-31 11:30:27','2017-05-31 11:30:27'),(68,'Edwardsiella tarda',NULL,NULL,NULL,NULL,'2017-05-31 11:30:28','2017-05-31 11:30:28'),(69,'Ehrlichia chaffeensis',NULL,NULL,NULL,NULL,'2017-05-31 11:30:29','2017-05-31 11:30:29'),(70,'Ehrlicia chaffeensis',NULL,NULL,NULL,'2017-06-25 13:28:41','2017-05-31 11:30:30','2017-06-25 13:28:41'),(71,'Eikenella corrodens',NULL,NULL,NULL,NULL,'2017-05-31 11:30:31','2017-05-31 11:30:31'),(72,'Klebsiella pneumoniae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:32','2017-05-31 11:30:32'),(74,'Klebsiella oxytoca',NULL,NULL,NULL,NULL,'2017-05-31 11:30:35','2017-05-31 11:30:35'),(75,'Kelbsiella spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:36','2017-05-31 11:30:36'),(76,'Kingella kingae',NULL,NULL,NULL,NULL,'2017-05-31 11:30:38','2017-05-31 11:30:38'),(77,'Proteus mirabilis',NULL,NULL,NULL,NULL,'2017-05-31 11:30:39','2017-05-31 11:30:39'),(79,'Citrobacter freundi',NULL,NULL,NULL,'2017-06-25 13:27:19','2017-05-31 11:30:41','2017-06-25 13:27:19'),(80,'Citrobacter freundii',NULL,NULL,NULL,NULL,'2017-05-31 11:30:43','2017-05-31 11:30:43'),(81,'Citrobacter spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:44','2017-05-31 11:30:44'),(83,'Providencia spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:46','2017-05-31 11:30:46'),(84,'Proteus valgaris',NULL,NULL,NULL,NULL,'2017-05-31 11:30:48','2017-05-31 11:30:48'),(87,'Providentia rettgeri',NULL,NULL,NULL,NULL,'2017-05-31 11:30:51','2017-05-31 11:30:51'),(88,'Providentia stuartii',NULL,NULL,NULL,NULL,'2017-05-31 11:30:52','2017-05-31 11:30:52'),(89,'Salmonella nontyphi group B',NULL,NULL,NULL,NULL,'2017-05-31 11:30:53','2017-05-31 11:30:53'),(90,'Stenotrophomonas maltophilia',NULL,NULL,NULL,NULL,'2017-05-31 11:30:53','2017-05-31 11:30:53'),(91,'Morganella morganii',NULL,NULL,NULL,NULL,'2017-05-31 11:30:54','2017-05-31 11:30:54'),(95,'Morganella spp',NULL,NULL,NULL,NULL,'2017-05-31 11:30:58','2017-05-31 11:30:58'),(96,'Salmonella paratyphi A',NULL,NULL,NULL,NULL,'2017-05-31 11:30:59','2017-05-31 11:30:59'),(97,'Enterrococcus faecium',NULL,NULL,NULL,NULL,'2017-05-31 11:31:00','2017-05-31 11:31:00'),(98,'Shigella boydii',NULL,NULL,NULL,NULL,'2017-05-31 11:31:01','2017-05-31 11:31:01'),(99,'Shigella dysenteriae',NULL,NULL,NULL,NULL,'2017-05-31 11:31:01','2017-05-31 11:31:01'),(100,'Shigella flexneri',NULL,NULL,NULL,NULL,'2017-05-31 11:31:01','2017-05-31 11:31:01'),(101,'Shigella sonnei',NULL,NULL,NULL,NULL,'2017-05-31 11:31:02','2017-05-31 11:31:02'),(102,'Streptococcus pyogenes',NULL,NULL,NULL,NULL,'2017-05-31 11:31:02','2017-05-31 11:31:02'),(103,'Streptococcus pyogenes (Group A Strep)',NULL,NULL,NULL,NULL,'2017-05-31 11:31:03','2017-05-31 11:31:03'),(107,'Streptococcus salivarius',NULL,NULL,NULL,NULL,'2017-05-31 11:31:05','2017-05-31 11:31:05'),(108,'Streptococcus sanguis',NULL,NULL,NULL,NULL,'2017-05-31 11:31:05','2017-05-31 11:31:05'),(109,'Salmonella group B',NULL,NULL,NULL,NULL,'2017-05-31 11:31:06','2017-05-31 11:31:06'),(110,'Moraxella spp',NULL,NULL,NULL,NULL,'2017-05-31 11:31:07','2017-05-31 11:31:07'),(111,'Coagulase-negative Staphylococcus',NULL,NULL,NULL,NULL,'2017-05-31 11:31:07','2017-05-31 11:31:07');
/*!40000 ALTER TABLE `organisms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_antibiotics`
--

DROP TABLE IF EXISTS `patient_antibiotics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_antibiotics` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `patient_antibiotics_patient_id_foreign` (`patient_id`),
  KEY `patient_antibiotics_drug_id_foreign` (`drug_id`),
  CONSTRAINT `patient_antibiotics_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `patient_antibiotics_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `unhls_patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_antibiotics`
--

LOCK TABLES `patient_antibiotics` WRITE;
/*!40000 ALTER TABLE `patient_antibiotics` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_antibiotics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_details`
--

DROP TABLE IF EXISTS `patient_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int NOT NULL,
  `site_id` int NOT NULL,
  `dhis2_uid` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `other_id` int DEFAULT NULL,
  `referral_reason` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `art_no` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `plhiv` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `who_stage` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `non_suppressed` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ltf` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cd4_result` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `serum_crag` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tb_lam` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gnxpert` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `findings` varchar(400) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lab_tech` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lab_tech_contact` int DEFAULT NULL,
  `program_id` int DEFAULT NULL,
  `form_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `requestor` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `requestor_no` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tb_phase` int DEFAULT NULL,
  `arv_adherence` int DEFAULT NULL,
  `care_approach` int DEFAULT NULL,
  `indication_for_vltesting` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_regimen` int DEFAULT NULL,
  `treatment_line` int DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `poc_device` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sample_collection_date` date DEFAULT NULL,
  `test_date` date DEFAULT NULL,
  `synchronized_by` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sync_facility` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uploaded` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_details`
--

LOCK TABLES `patient_details` WRITE;
/*!40000 ALTER TABLE `patient_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_transfused`
--

DROP TABLE IF EXISTS `patient_transfused`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_transfused` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `blood_bank_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `visit_id` int DEFAULT NULL,
  `reason` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `other_reasons` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transfusion_history` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `pregnancies` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `still_birth` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `jaundiced_babies` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `units_requested` int DEFAULT NULL,
  `units_given` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_transfused`
--

LOCK TABLES `patient_transfused` WRITE;
/*!40000 ALTER TABLE `patient_transfused` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_transfused` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_foreign` (`permission_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`),
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poc_results`
--

DROP TABLE IF EXISTS `poc_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poc_results` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `results` enum('Negative','Positive','Error') COLLATE utf8mb3_unicode_ci NOT NULL,
  `test_date` date NOT NULL,
  `tested_by` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dispatched_by` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dispatched_date` date NOT NULL,
  `test_time` time DEFAULT NULL,
  `equipment_used` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uploaded` int NOT NULL DEFAULT '0',
  `error_code` varchar(64) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `equipment_serial_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `catridge_serial_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `machine_sample_detection` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_status` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hiv1_positive_control` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hiv2_positive_control` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `negative_control` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_analysis` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `device_software_version` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_summary` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `poc_results_patient_id_foreign` (`patient_id`),
  CONSTRAINT `poc_results_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `poc_tables` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poc_results`
--

LOCK TABLES `poc_results` WRITE;
/*!40000 ALTER TABLE `poc_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `poc_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poc_tables`
--

DROP TABLE IF EXISTS `poc_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poc_tables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int NOT NULL,
  `referral_reason` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `testing_facility` int NOT NULL,
  `district_id` int NOT NULL,
  `gender` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `age` double(8,2) NOT NULL,
  `exp_no` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `provisional_diagnosis` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `caretaker_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `entry_point` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mother_name` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mother_hts` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mother_art` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `infant_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `breastfeeding_status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mother_hiv_status` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `collection_date` date DEFAULT NULL,
  `pcr_level` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pmtct_antenatal` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pmtct_delivery` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pmtct_postnatal` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `admission_date` date DEFAULT NULL,
  `sample_id` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `infant_pmtctarv` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mother_pmtctarv` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `other_entry_point` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ulin` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `given_contrimazole` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `delivered_at` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nin` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `feeding_status` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sample_id` (`sample_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poc_tables`
--

LOCK TABLES `poc_tables` WRITE;
/*!40000 ALTER TABLE `poc_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `poc_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poc_vl_data`
--

DROP TABLE IF EXISTS `poc_vl_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poc_vl_data` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int NOT NULL,
  `testing_facility` int NOT NULL,
  `referral_reason` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `art_no` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `other_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dhis2_uid` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sample_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `form_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `initiation_date` date DEFAULT NULL,
  `treatment_duration` int DEFAULT NULL,
  `who_stage` int DEFAULT NULL,
  `anc` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_pregnant` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_breastfeeding` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `patient_has_tb` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tb_phase` int DEFAULT NULL,
  `arv_adherence` int DEFAULT NULL,
  `care_approach` int DEFAULT NULL,
  `indication_for_vltesting` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_regimen` int DEFAULT NULL,
  `treatment_line` int DEFAULT NULL,
  `result` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `poc_device` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sample_collection_date` date NOT NULL,
  `test_date` date NOT NULL,
  `synchronized_by` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poc_vl_data`
--

LOCK TABLES `poc_vl_data` WRITE;
/*!40000 ALTER TABLE `poc_vl_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `poc_vl_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_analytic_specimen_rejections`
--

DROP TABLE IF EXISTS `pre_analytic_specimen_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_analytic_specimen_rejections` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `specimen_id` int unsigned NOT NULL,
  `rejected_by` int unsigned NOT NULL,
  `rejection_reason_id` int unsigned DEFAULT NULL,
  `reject_explained_to` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time_rejected` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pre_analytic_specimen_rejections_rejected_by_index` (`rejected_by`),
  KEY `pre_analytic_specimen_rejections_specimen_id_foreign` (`specimen_id`),
  KEY `pre_analytic_specimen_rejections_rejection_reason_id_foreign` (`rejection_reason_id`),
  CONSTRAINT `pre_analytic_specimen_rejections_rejection_reason_id_foreign` FOREIGN KEY (`rejection_reason_id`) REFERENCES `rejection_reasons` (`id`),
  CONSTRAINT `pre_analytic_specimen_rejections_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_analytic_specimen_rejections`
--

LOCK TABLES `pre_analytic_specimen_rejections` WRITE;
/*!40000 ALTER TABLE `pre_analytic_specimen_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `pre_analytic_specimen_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referral_reasons`
--

DROP TABLE IF EXISTS `referral_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referral_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referral_reasons`
--

LOCK TABLES `referral_reasons` WRITE;
/*!40000 ALTER TABLE `referral_reasons` DISABLE KEYS */;
INSERT INTO `referral_reasons` VALUES (1,'Equipment break down','2024-12-11 18:15:27','2024-12-11 18:15:27'),(2,'Reagent stock out','2024-12-11 18:15:27','2024-12-11 18:15:27'),(3,'Supplies stock out','2024-12-11 18:15:27','2024-12-11 18:15:27'),(4,'Power outage','2024-12-11 18:15:27','2024-12-11 18:15:27'),(5,'No testing expertise','2024-12-11 18:15:27','2024-12-11 18:15:27'),(6,'Lack of required equipment','2024-12-11 18:15:27','2024-12-11 18:15:27'),(7,'Confirmatory testing','2024-12-11 18:15:27','2024-12-11 18:15:27'),(8,'For QA re-testing','2024-12-11 18:15:27','2024-12-11 18:15:27'),(9,'others','2024-12-11 18:15:27','2024-12-11 18:15:27');
/*!40000 ALTER TABLE `referral_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referrals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sample_obtainer` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cadre_obtainer` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sample_date` date NOT NULL,
  `sample_time` timestamp NULL DEFAULT NULL,
  `time_dispatch` timestamp NULL DEFAULT NULL,
  `storage_condition` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transport_type` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int unsigned DEFAULT NULL,
  `referral_reason` int unsigned DEFAULT NULL,
  `priority_specimen` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `facility_id` int unsigned DEFAULT NULL,
  `person` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contacts` text COLLATE utf8mb3_unicode_ci,
  `user_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `referrals_user_id_foreign` (`user_id`),
  KEY `referrals_facility_id_foreign` (`facility_id`),
  CONSTRAINT `referrals_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`),
  CONSTRAINT `referrals_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejection_reasons`
--

DROP TABLE IF EXISTS `rejection_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rejection_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejection_reasons`
--

LOCK TABLES `rejection_reasons` WRITE;
/*!40000 ALTER TABLE `rejection_reasons` DISABLE KEYS */;
INSERT INTO `rejection_reasons` VALUES (1,'Inadequate sample volume','200001','2024-12-11 18:07:03','2024-12-11 18:07:03'),(2,'Haemolysed sample','200002','2024-12-11 18:07:03','2024-12-11 18:07:03'),(3,'Specimen without lab request form','200003','2024-12-11 18:07:03','2024-12-11 18:07:03'),(4,'No test ordered on  lab request form of sample','200004','2024-12-11 18:07:03','2024-12-11 18:07:03'),(5,'No sample label or identifier','200005','2024-12-11 18:07:03','2024-12-11 18:07:03'),(6,'Wrong sample label','200006','2024-12-11 18:07:03','2024-12-11 18:07:03'),(7,'Unclear sample label','200007','2024-12-11 18:07:03','2024-12-11 18:07:03'),(8,'Sample in wrong container','200008','2024-12-11 18:07:03','2024-12-11 18:07:03'),(9,'Damaged/broken/leaking sample container','200009','2024-12-11 18:07:03','2024-12-11 18:07:03'),(10,'Too old sample','200010','2024-12-11 18:07:03','2024-12-11 18:07:03'),(11,'Date of sample collection not specified','200011','2024-12-11 18:07:03','2024-12-11 18:07:03'),(12,'Time of sample collection not specified','200012','2024-12-11 18:07:03','2024-12-11 18:07:03'),(13,'Improper transport media','200015','2024-12-11 18:07:03','2024-12-11 18:07:03'),(14,'Sample type unacceptable for required test','200013','2024-12-11 18:07:03','2024-12-11 18:07:03'),(15,'Other','200014','2024-12-11 18:07:03','2024-12-11 18:07:03');
/*!40000 ALTER TABLE `rejection_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_diseases`
--

DROP TABLE IF EXISTS `report_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_diseases` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int unsigned NOT NULL,
  `disease_id` int unsigned NOT NULL,
  `result_interpretation_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_diseases_test_type_id_disease_id_unique` (`test_type_id`,`disease_id`),
  KEY `report_diseases_disease_id_foreign` (`disease_id`),
  CONSTRAINT `report_diseases_disease_id_foreign` FOREIGN KEY (`disease_id`) REFERENCES `diseases` (`id`),
  CONSTRAINT `report_diseases_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_diseases`
--

LOCK TABLES `report_diseases` WRITE;
/*!40000 ALTER TABLE `report_diseases` DISABLE KEYS */;
INSERT INTO `report_diseases` VALUES (1,2,1,NULL,'2024-12-11 18:07:03','2024-12-11 18:07:03'),(2,7,2,NULL,'2024-12-11 18:07:03','2024-12-11 18:07:03'),(3,18,3,NULL,'2024-12-11 18:07:03','2024-12-11 18:07:03');
/*!40000 ALTER TABLE `report_diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int unsigned NOT NULL,
  `quantity_remaining` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_category_id` int unsigned DEFAULT NULL,
  `quantity_ordered` int DEFAULT NULL,
  `tests_done` int NOT NULL DEFAULT '0',
  `user_id` int unsigned NOT NULL,
  `remarks` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `requests_test_category_id_foreign` (`test_category_id`),
  KEY `requests_item_id_foreign` (`item_id`),
  KEY `requests_user_id_foreign` (`user_id`),
  CONSTRAINT `requests_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `inv_items` (`id`),
  CONSTRAINT `requests_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`),
  CONSTRAINT `requests_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result_interpretations`
--

DROP TABLE IF EXISTS `result_interpretations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result_interpretations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result_interpretations`
--

LOCK TABLES `result_interpretations` WRITE;
/*!40000 ALTER TABLE `result_interpretations` DISABLE KEYS */;
INSERT INTO `result_interpretations` VALUES (1,'High','2024-12-11 18:07:04','2024-12-11 18:07:04'),(2,'Normal','2024-12-11 18:07:04','2024-12-11 18:07:04'),(3,'Low','2024-12-11 18:07:04','2024-12-11 18:07:04'),(4,'HGB<8','2024-12-11 18:07:04','2024-12-11 18:07:04'),(5,'HGB≥8','2024-12-11 18:07:04','2024-12-11 18:07:04'),(6,'Positive','2024-12-11 18:07:04','2024-12-11 18:07:04'),(7,'Negative','2024-12-11 18:07:04','2024-12-11 18:07:04');
/*!40000 ALTER TABLE `result_interpretations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `spatie_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `spatie_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(2,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(3,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(4,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(5,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(6,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(7,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(8,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(9,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(10,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(11,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(12,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(13,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(14,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(15,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(16,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(17,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(18,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(19,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(20,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(21,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(22,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(23,1,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(28,1,'2024-12-11 18:07:05','2024-12-11 18:07:05'),(29,1,'2024-12-11 18:07:05','2024-12-11 18:07:05'),(30,1,'2024-12-11 18:07:05','2024-12-11 18:07:05');
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spatie_permissions`
--

DROP TABLE IF EXISTS `spatie_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spatie_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spatie_permissions`
--

LOCK TABLES `spatie_permissions` WRITE;
/*!40000 ALTER TABLE `spatie_permissions` DISABLE KEYS */;
INSERT INTO `spatie_permissions` VALUES (1,'manage_incidents','Can Manage Biorisk & Biosecurity Incidents','web','2024-12-11 17:59:55','2024-12-11 17:59:55'),(2,'register_incident','Can Register BB Incidences','web','2024-12-11 17:59:55','2024-12-11 17:59:55'),(3,'summary_log','Can view BB summary log','web','2024-12-11 17:59:55','2024-12-11 17:59:55'),(4,'facility_report','Can create faility BB report','web','2024-12-11 17:59:55','2024-12-11 17:59:55'),(5,'view_names','Can view patient names','web','2024-12-11 17:59:56','2024-12-11 17:59:56'),(6,'manage_patients','Can add patients','web','2024-12-11 17:59:56','2024-12-11 17:59:56'),(7,'receive_external_test','Can receive test requests','web','2024-12-11 17:59:56','2024-12-11 17:59:56'),(8,'request_test','Can request new test','web','2024-12-11 17:59:56','2024-12-11 17:59:56'),(9,'accept_test_specimen','Can accept test specimen','web','2024-12-11 17:59:56','2024-12-11 17:59:56'),(10,'reject_test_specimen','Can reject test specimen','web','2024-12-11 17:59:56','2024-12-11 17:59:56'),(11,'change_test_specimen','Can change test specimen','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(12,'start_test','Can start tests','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(13,'enter_test_results','Can enter tests results','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(14,'edit_test_results','Can edit test results','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(15,'verify_test_results','Can verify test results','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(16,'send_results_to_external_system','Can send test results to external systems','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(17,'refer_specimens','Can refer specimens','web','2024-12-11 17:59:57','2024-12-11 17:59:57'),(18,'manage_users','Can manage users','web','2024-12-11 17:59:58','2024-12-11 17:59:58'),(19,'manage_test_catalog','Can manage test catalog','web','2024-12-11 17:59:58','2024-12-11 17:59:58'),(20,'manage_lab_configurations','Can manage lab configurations','web','2024-12-11 17:59:58','2024-12-11 17:59:58'),(21,'view_reports','Can view reports','web','2024-12-11 17:59:58','2024-12-11 17:59:58'),(22,'manage_inventory','Can manage inventory','web','2024-12-11 17:59:58','2024-12-11 17:59:58'),(23,'request_topup','Can request top-up','web','2024-12-11 17:59:58','2024-12-11 17:59:58'),(24,'manage_qc','Can manage Quality Control','web','2024-12-11 17:59:59','2024-12-11 17:59:59'),(25,'approve_test_results','Can approve test results as the last phase','web','2024-12-11 17:59:59','2024-12-11 17:59:59'),(26,'cancel_test','Can cancel a test','web','2024-12-11 17:59:59','2024-12-11 17:59:59'),(27,'recall_report','Can recall a report of a Patient','web','2024-12-11 18:00:00','2024-12-11 18:00:00'),(28,'manage_appointments','Can manage appointments with Clinician','web','2024-12-11 18:02:40','2024-12-11 18:02:40'),(29,'make_labrequests','Can make lab requests(Only for Clinicians)','web','2024-12-11 18:02:40','2024-12-11 18:02:40'),(30,'manage_visits','Can manage visit content','web','2024-12-11 18:02:41','2024-12-11 18:02:41'),(31,'manage_upload','Manage upload of data','web','2024-12-11 18:09:45','2024-12-11 18:09:45'),(32,'manage_ahd_vl','Manage AHD data','web','2024-12-11 18:09:45','2024-12-11 18:09:45'),(33,'manage_poc_eid','Manage POC EID data','web','2024-12-11 18:09:45','2024-12-11 18:09:45'),(34,'manage_blood_transfusion','Manage Blood Transfusion','web','2024-12-11 18:09:45','2024-12-11 18:09:45'),(35,'manage_poc_vl','Manage POC VL data','web','2024-12-11 18:09:45','2024-12-11 18:09:45'),(36,'manage_color_code','Manage Result color','web','2024-12-11 18:09:45','2024-12-11 18:09:45'),(37,'backdate_test_dates','Reverse','web','2024-12-11 18:09:45','2024-12-11 18:09:45');
/*!40000 ALTER TABLE `spatie_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spatie_roles`
--

DROP TABLE IF EXISTS `spatie_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spatie_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spatie_roles`
--

LOCK TABLES `spatie_roles` WRITE;
/*!40000 ALTER TABLE `spatie_roles` DISABLE KEYS */;
INSERT INTO `spatie_roles` VALUES (1,'Superadmin','web','2024-12-11 18:00:00','2024-12-11 18:00:00'),(2,'Technologist','web','2024-12-11 18:00:00','2024-12-11 18:00:00'),(3,'Receptionist','web','2024-12-11 18:00:00','2024-12-11 18:00:00');
/*!40000 ALTER TABLE `spatie_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_statuses`
--

DROP TABLE IF EXISTS `specimen_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimen_statuses` (
  `id` int unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_statuses`
--

LOCK TABLES `specimen_statuses` WRITE;
/*!40000 ALTER TABLE `specimen_statuses` DISABLE KEYS */;
INSERT INTO `specimen_statuses` VALUES (1,'specimen-not-collected','2024-12-11 18:07:05','2024-12-11 18:07:05'),(2,'specimen-accepted','2024-12-11 18:07:05','2024-12-11 18:07:05'),(3,'specimen-rejected','2024-12-11 18:07:05','2024-12-11 18:07:05'),(6,'specimen-collected','2024-03-11 10:15:18','2024-03-11 10:15:18');
/*!40000 ALTER TABLE `specimen_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_type_terminology`
--

DROP TABLE IF EXISTS `specimen_type_terminology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimen_type_terminology` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `system_text` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_url` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `specimen_type_id` int unsigned NOT NULL,
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `specimen_type_terminology_specimen_type_id_foreign` (`specimen_type_id`),
  CONSTRAINT `specimen_type_terminology_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_type_terminology`
--

LOCK TABLES `specimen_type_terminology` WRITE;
/*!40000 ALTER TABLE `specimen_type_terminology` DISABLE KEYS */;
INSERT INTO `specimen_type_terminology` VALUES (1,'Ascitic fluid (substance)','SNOMED','http://snomed.info/sct','409615008','Ascitic fluid',1,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(2,'Specimen obtained by aspiration (specimen)','SNOMED','http://snomed.info/sct','119295008','Aspirate',46,0,'2023-09-26 18:48:31','2024-03-05 08:04:47'),(3,'Cerebrospinal fluid smear specimen (specimen)','SNOMED','http://snomed.info/sct','16216331000119107','Cerebrospinal fluid smear sample',14,0,'2023-09-26 18:48:31','2024-03-05 07:55:58'),(4,'High vaginal swab','SNOMED','http://snomed.info/sct','258521001','HVS - High vaginal swab',17,0,'2023-09-26 18:48:31','2024-03-05 08:06:43'),(5,'Nasal swab taken (situation)','SNOMED','http://snomed.info/sct','269944001','Nasal swab taken',6,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(6,'lasma specimen (specimen)','SNOMED','http://snomed.info/sct','119361006','Plasma specimen',29,0,'2023-09-26 18:48:31','2024-03-05 08:23:54'),(7,'Pleural fluid specimen (specimen)','SNOMED','http://snomed.info/sct','418564007','Pleural fluid specimen',4,0,'2023-09-26 18:48:31','2024-03-05 08:24:07'),(8,'Pus swab (specimen)','SNOMED','http://snomed.info/sct','258502009','Pus swab',16,0,'2023-09-26 18:48:31','2024-03-05 08:27:11'),(9,'Rectal swab (specimen)','SNOMED','http://snomed.info/sct','258528007','Rectal swab',11,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(10,'Seminal fluid specimen (specimen)','SNOMED','http://snomed.info/sct','119347001','Seminal fluid sample',6,0,'2023-09-26 18:48:31','2024-03-05 08:26:27'),(11,'Serum specimen (specimen)','SNOMED','http://snomed.info/sct','119364003','Serum specimen',28,0,'2023-09-26 18:48:31','2024-03-05 08:26:39'),(12,'Skin sample','SNOMED','http://snomed.info/sct','119325001','Skin specimen',7,0,'2023-09-26 18:48:31','2024-03-05 08:26:48'),(13,'Vomitus specimen (specimen)','SNOMED','http://snomed.info/sct','122572000','Vomitus specimen',8,0,'2023-09-26 18:48:31','2024-03-05 08:30:04'),(14,'Stool specimen (specimen)','SNOMED','http://snomed.info/sct','119339001','Stool specimen',13,0,'2023-09-26 18:48:31','2024-03-05 08:28:09'),(15,'Synovial fluid (substance)','SNOMED','http://snomed.info/sct','6085005','Synovial fluid',17,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(16,'Throat swab (specimen)','SNOMED','http://snomed.info/sct','258529004','Throat swab',18,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(17,'Urethral swab (specimen)','SNOMED','http://snomed.info/sct','258530009','Urethral swab',19,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(18,'Urine specimen (specimen)','SNOMED','http://snomed.info/sct','122575003','Urine specimen',36,0,'2023-09-26 18:48:31','2024-03-05 08:29:17'),(19,'Vaginal swab (specimen)','SNOMED','http://snomed.info/sct','258520000','Vaginal swab',21,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(20,'Water specimen (specimen)','SNOMED','http://snomed.info/sct','119318008','Water specimen',12,0,'2023-09-26 18:48:31','2024-03-05 08:25:49'),(21,'Whole blood specimen (specimen)','SNOMED','http://snomed.info/sct','258580003','Whole blood specimen',41,0,'2023-09-26 18:48:31','2024-03-05 08:28:37'),(22,'Sputum specimen (specimen)','SNOMED','http://snomed.info/sct','119334006','Sputum specimen',34,0,'2023-09-26 18:48:31','2024-03-05 08:29:36'),(23,'Swab of eye','SNOMED','http://snomed.info/sct','445160003','Eye swab',18,0,'2023-09-26 18:48:31','2024-03-05 08:03:39'),(24,'Wound swab (specimen)','SNOMED','http://snomed.info/sct','258531008','Wound swab',15,0,'2023-09-26 18:48:31','2024-03-05 08:25:38'),(25,'Biopsy specimen (specimen)','SNOMED','http://snomed.info/sct','258415003','Biopsy specimen',48,0,'2023-09-26 18:48:31','2024-03-05 08:04:57'),(26,'Dried blood spot specimen (specimen) ','SNOMED','http://snomed.info/sct','440500007','Dried blood spot specimen',2,0,'2023-09-26 18:48:31','2024-03-05 07:56:12'),(27,'Specimen from corneal ulcer (specimen)','SNOMED','http://snomed.info/sct','16212851000119106','Specimen from corneal ulcer',31,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(28,'Ear swab specimen (specimen) ','SNOMED','http://snomed.info/sct','309166000','Ear swab specimen',19,0,'2023-09-26 18:48:31','2024-03-05 07:56:32'),(29,'Pericardial fluid specimen (specimen)','SNOMED','http://snomed.info/sct','122571007','Pericardial fluid specimen',34,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(30,'Papanicolaou smear specimen (specimen)','SNOMED','http://snomed.info/sct','16224251000119106','Papanicolaou smear specimen',35,0,'2023-09-26 18:48:31','2023-09-26 18:48:31'),(31,'Nasopharyngeal swab (specimen)','SNOMED','http://snomed.info/sct','258500001','Nasopharyngeal swab',3,0,'2023-09-26 18:48:31','2024-03-05 08:23:32');
/*!40000 ALTER TABLE `specimen_type_terminology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimen_types`
--

DROP TABLE IF EXISTS `specimen_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimen_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimen_types`
--

LOCK TABLES `specimen_types` WRITE;
/*!40000 ALTER TABLE `specimen_types` DISABLE KEYS */;
INSERT INTO `specimen_types` VALUES (1,NULL,'Ascitic Tap',NULL,NULL,'2024-12-11 18:00:00','2024-12-11 18:00:00'),(2,NULL,'Dried Blood Spot',NULL,NULL,'2024-12-11 18:00:00','2024-12-11 18:00:00'),(3,NULL,'Nasal Swab',NULL,NULL,'2024-12-11 18:00:00','2024-12-11 18:00:00'),(4,NULL,'Pleural Tap',NULL,NULL,'2024-12-11 18:00:00','2024-12-11 18:00:00'),(5,NULL,'Rectal Swab',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(6,NULL,'Semen',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(7,NULL,'Skin',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(8,NULL,'Vomitus',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(9,NULL,'Synovial Fluid',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(10,NULL,'Urethral Smear',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(11,NULL,'Vaginal Smear',NULL,NULL,'2024-12-11 18:00:01','2024-12-11 18:00:01'),(12,NULL,'Water',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(13,NULL,'Stool',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(14,NULL,'CSF',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(15,NULL,'Wound swab',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(16,NULL,'Pus swab',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(17,NULL,'HVS',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(18,NULL,'Eye swab',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(19,NULL,'Ear swab',NULL,NULL,'2024-12-11 18:00:02','2024-12-11 18:00:02'),(20,NULL,'Throat swab',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(21,NULL,'Pus Aspirate',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(22,NULL,'Blood',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(23,NULL,'BAL',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(24,NULL,'Sputum',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(25,NULL,'Uretheral swab',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(26,NULL,'Urine',NULL,NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(27,NULL,'Serum',NULL,NULL,'2024-12-11 18:06:08','2024-12-11 18:06:08');
/*!40000 ALTER TABLE `specimen_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specimens`
--

DROP TABLE IF EXISTS `specimens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specimens` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `specimen_type_id` int unsigned DEFAULT NULL,
  `specimen_status_id` int unsigned NOT NULL DEFAULT '2',
  `accepted_by` int unsigned DEFAULT '0',
  `sample_obtainer` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `referral_id` int unsigned DEFAULT NULL,
  `test_purpose_id` int DEFAULT NULL,
  `collected_by` int unsigned DEFAULT NULL,
  `time_collected` timestamp NULL DEFAULT NULL,
  `time_accepted` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `specimens_accepted_by_index` (`accepted_by`),
  KEY `specimens_specimen_type_id_foreign` (`specimen_type_id`),
  KEY `specimens_specimen_status_id_foreign` (`specimen_status_id`),
  KEY `specimens_referral_id_foreign` (`referral_id`),
  CONSTRAINT `specimens_referral_id_foreign` FOREIGN KEY (`referral_id`) REFERENCES `referrals` (`id`),
  CONSTRAINT `specimens_specimen_status_id_foreign` FOREIGN KEY (`specimen_status_id`) REFERENCES `specimen_statuses` (`id`),
  CONSTRAINT `specimens_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specimens`
--

LOCK TABLES `specimens` WRITE;
/*!40000 ALTER TABLE `specimens` DISABLE KEYS */;
/*!40000 ALTER TABLE `specimens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `suppliers_user_id_foreign` (`user_id`),
  CONSTRAINT `suppliers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_patient`
--

DROP TABLE IF EXISTS `tb_patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_patient` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `visit_id` int NOT NULL,
  `patient_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `hiv_status` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tb_diagnosis` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `follow_up` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_patient`
--

LOCK TABLES `tb_patient` WRITE;
/*!40000 ALTER TABLE `tb_patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_categories`
--

DROP TABLE IF EXISTS `test_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_categories_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_categories`
--

LOCK TABLES `test_categories` WRITE;
/*!40000 ALTER TABLE `test_categories` DISABLE KEYS */;
INSERT INTO `test_categories` VALUES (1,'PARASITOLOGY','',NULL,'2024-12-11 18:00:03','2024-12-11 18:00:03'),(2,'MICROBIOLOGY','',NULL,'2024-12-11 18:00:04','2024-12-11 18:00:04'),(3,'HEMATOLOGY','',NULL,'2024-12-11 18:00:04','2024-12-11 18:00:04'),(4,'SEROLOGY','',NULL,'2024-12-11 18:00:04','2024-12-11 18:00:04'),(5,'BLOOD TRANSFUSION','',NULL,'2024-12-11 18:00:04','2024-12-11 18:00:04'),(6,'CLINICAL CHEMISTRY','',NULL,'2024-12-11 18:00:04','2024-12-11 18:00:04');
/*!40000 ALTER TABLE `test_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_category_terminology`
--

DROP TABLE IF EXISTS `test_category_terminology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_category_terminology` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `system_text` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_url` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_category_id` int unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `test_category_terminology_test_category_id_foreign` (`test_category_id`),
  CONSTRAINT `test_category_terminology_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_category_terminology`
--

LOCK TABLES `test_category_terminology` WRITE;
/*!40000 ALTER TABLE `test_category_terminology` DISABLE KEYS */;
INSERT INTO `test_category_terminology` VALUES (1,'Sample parasitology general (procedure)','SNOMED','http://snomed.info/sct','168220000','Sample parasitology general',1,1,'2022-11-04 06:49:10','2023-09-26 18:48:38'),(2,'Microbiology procedure (procedure)','SNOMED','http://snomed.info/sct','19851009','Microbiology test',2,1,'2022-11-04 06:51:59','2023-09-26 18:48:38'),(3,'Hematology test (procedure)','SNOMED','http://snomed.info/sct','252275004','Hematology test',3,1,'2022-11-04 06:53:54','2023-09-26 18:48:38'),(4,'Serologic test (procedure)','SNOMED','http://snomed.info/sct','68793005','Serologic test',4,1,'2022-11-04 07:06:29','2023-09-26 18:48:38'),(5,'Transfusion of blood product (procedure)','SNOMED','http://snomed.info/sct','116859006','Blood transfusion',5,1,'2022-11-04 07:12:19','2023-09-26 18:48:38');
/*!40000 ALTER TABLE `test_category_terminology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_name_mappings`
--

DROP TABLE IF EXISTS `test_name_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_name_mappings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int unsigned DEFAULT NULL,
  `test_category_id` int DEFAULT NULL,
  `standard_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `system_name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `test_name_mappings_system_name_unique` (`system_name`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_name_mappings`
--

LOCK TABLES `test_name_mappings` WRITE;
/*!40000 ALTER TABLE `test_name_mappings` DISABLE KEYS */;
INSERT INTO `test_name_mappings` VALUES (1,22,NULL,'Microscopy for malarial parasites (procedure)','Microscopy for malarial parasites','2023-09-26 18:45:30','2023-09-26 18:45:30'),(2,4,NULL,'Hemoglobin level estimation (procedure)','Hb estimation','2023-09-26 18:45:30','2023-09-26 18:45:30'),(3,67,NULL,'Urinalysis (procedure)','Urinalysis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(4,59,NULL,'Direct Coombs test (procedure)','Direct Coombs test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(5,118,NULL,'Sickle cell disease screening test (procedure)','Sickle cell disease screening test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(6,71,NULL,'Venereal Disease Research Laboratory test (procedure)','VDRL test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(7,102,NULL,'Urine pregnancy test (procedure)','HCG','2023-09-26 18:45:30','2023-09-26 18:45:30'),(8,24,NULL,'Serum pregnancy test (B-human chorionic gonadotropin) (procedure)','Serum pregnancy test (B-HCG)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(9,NULL,NULL,'Brucella agglutinin test (procedure)','Brucella agglutinin test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(10,25,NULL,'Immunoglobulin G antibody to Helicobacter pylori (substance)','Helicobacter pylori IgG','2023-09-26 18:45:30','2023-09-26 18:45:30'),(11,1,NULL,'Culture and susceptibility (procedure)','Culture and sensitivities','2023-09-26 18:45:30','2023-09-26 18:45:30'),(12,34,NULL,'Gram stain method (procedure)','Gram stain','2023-09-26 18:45:30','2023-09-26 18:45:30'),(13,2,NULL,'Ziehl-Neelsen stain method (procedure)','Ziehl-Neelsen stain','2023-09-26 18:45:30','2023-09-26 18:45:30'),(14,36,NULL,'Complete blood count (procedure)','CBC','2023-09-26 18:45:30','2023-09-26 18:45:30'),(15,NULL,NULL,'Serum random glucose measurement (procedure)','Random Blood Sugar ','2023-09-26 18:45:30','2023-09-26 18:45:30'),(16,30,NULL,'Blood group typing (procedure)','Blood grouping','2023-09-26 18:45:30','2023-09-26 18:45:30'),(17,75,NULL,'Major crossmatch (procedure)','Blood cross-matching','2023-09-26 18:45:30','2023-09-26 18:45:30'),(18,NULL,NULL,'Hepatic function panel (procedure)','LFT - Liver function test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(19,14,NULL,'Serologic test for syphilis (procedure)','Syphilis serology','2023-09-26 18:45:30','2023-09-26 18:45:30'),(20,13,NULL,'Absolute CD4 count procedure (procedure)','Absolute CD4 count','2023-09-26 18:45:30','2023-09-26 18:45:30'),(21,40,NULL,'Human immunodeficiency virus antibody test (procedure)','HIV (Human immunodeficiency virus) antibody test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(22,57,NULL,'Hepatitis B surface antigen measurement (procedure)','HBsAg measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(23,28,NULL,'CSF Analysis','CSF Analysis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(24,99,NULL,'Malaria antigen test (procedure)','Malaria antigen test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(25,61,NULL,'Fecal analysis (procedure)','Stool analysis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(26,NULL,NULL,'Treponema pallidum hemaglutination test (procedure)','TPHA - Treponema pallidum haemaglutination test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(27,NULL,NULL,'Electrolytes measurement (procedure)','Electrolytes measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(28,NULL,NULL,'MTB/RIF test','MTB/RIF test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(29,58,NULL,'Fasting blood glucose measurement (procedure)','Fasting blood glucose','2023-09-26 18:45:30','2023-09-26 18:45:30'),(30,16,NULL,'India ink stain method (procedure)','India ink stain','2023-09-26 18:45:30','2023-09-26 18:45:30'),(31,18,NULL,'Semen analysis (procedure)','Semen analysis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(32,48,NULL,'Human immunodeficiency virus viral load (procedure)','HIV viral load','2023-09-26 18:45:30','2023-09-26 18:45:30'),(33,21,NULL,'Rheumatoid factor measurement (procedure)','Rheumatoid factor measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(34,26,NULL,'Fasting lipid profile (procedure)','FLP - Fasting lipid profile','2023-09-26 18:45:30','2023-09-26 18:45:30'),(35,64,NULL,'Human papillomavirus deoxyribonucleic acid detection (procedure)','HPV DNA detection','2023-09-26 18:45:30','2023-09-26 18:45:30'),(36,133,NULL,'Amylase measurement (procedure) ','Amylase level','2023-09-26 18:45:30','2023-09-26 18:45:30'),(37,112,NULL,'Testosterone measurement (procedure)','Testosterone level','2023-09-26 18:45:30','2023-09-26 18:45:30'),(38,49,NULL,'Prothrombin time (procedure)','Prothrombin time','2023-09-26 18:45:30','2023-09-26 18:45:30'),(39,139,NULL,'Hemoglobin A1c measurement (procedure)','Haemoglobin A1c measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(40,114,NULL,'Thyroid panel (procedure)','TFT - Thyroid function test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(41,73,NULL,'C-reactive protein measurement (procedure)','CRP - C-reactive protein level','2023-09-26 18:45:30','2023-09-26 18:45:30'),(42,29,NULL,'Erythrocyte sedimentation rate measurement (procedure)','ESR - Erythrocyte sedimentation rate','2023-09-26 18:45:30','2023-09-26 18:45:30'),(43,27,NULL,'Troponin T measurement (procedure)','Troponin T measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(44,42,NULL,'Male sex hormones - serum measurement (procedure)','Male sex hormones - serum level','2023-09-26 18:45:30','2023-09-26 18:45:30'),(45,NULL,NULL,'Alpha-1-Fetoprotein measurement (procedure)','AFP measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(46,NULL,NULL,'D-dimer assay (procedure)','D-dimer assay','2023-09-26 18:45:30','2023-09-26 18:45:30'),(47,54,NULL,'Hepatitis C antigen measurement (procedure)','Hepatitis C antigen measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(48,124,NULL,'Reticulocyte count (procedure)','Reticulocyte count','2023-09-26 18:45:30','2023-09-26 18:45:30'),(49,NULL,NULL,'Prostate specific antigen measurement (procedure)','PSA measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(50,NULL,NULL,'Total protein measurement (procedure)','TP - Total protein','2023-09-26 18:45:30','2023-09-26 18:45:30'),(51,NULL,NULL,'Yellow fever screening (procedure)','Yellow fever screening','2023-09-26 18:45:30','2023-09-26 18:45:30'),(52,NULL,NULL,'Human papillomavirus screening (procedure)','Human papillomavirus screening','2023-09-26 18:45:30','2023-09-26 18:45:30'),(53,NULL,NULL,'Lactic acid measurement (procedure)','Lactic acid measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(54,NULL,NULL,'Thyroxine measurement (procedure)','T4 measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(55,NULL,NULL,'Triiodothyronine measurement (procedure)','T3 - Triiodothyronine level','2023-09-26 18:45:30','2023-09-26 18:45:30'),(56,NULL,NULL,'Thyroid stimulating hormone measurement (procedure)','TSH level','2023-09-26 18:45:30','2023-09-26 18:45:30'),(57,NULL,NULL,'Creatine kinase measurement (procedure)','Creatine kinase measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(58,123,NULL,'Bleeding time (procedure)','Bleeding time','2023-09-26 18:45:30','2023-09-26 18:45:30'),(59,NULL,NULL,'International normalized ratio (observable entity)','INR - Internationalised ratio','2023-09-26 18:45:30','2023-09-26 18:45:30'),(60,NULL,NULL,'Rapid plasma reagin test (procedure)','RPR test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(61,53,NULL,'Genus Borrelia (organism)','Borrelia','2023-09-26 18:45:30','2023-09-26 18:45:30'),(62,NULL,NULL,'Measurement of ketones in urine using dipstick (procedure)','Urine ketone test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(63,101,NULL,'Lymphocyte component of blood (substance)','Lymphocytes','2023-09-26 18:45:30','2023-09-26 18:45:30'),(64,82,NULL,'Quantitative urine culture (procedure)','Quantitative urine culture','2023-09-26 18:45:30','2023-09-26 18:45:30'),(65,19,NULL,'Specific gravity measurement (procedure)','SG - Specific gravity','2023-09-26 18:45:30','2023-09-26 18:45:30'),(66,23,NULL,'Wet preparation technique (qualifier value)','Wet preparation technique','2023-09-26 18:45:30','2023-09-26 18:45:30'),(67,26,NULL,'Filaria identification (procedure) ','Filaria identification','2023-09-26 18:45:30','2023-09-26 18:45:30'),(68,30,NULL,'White blood cell count (procedure)','WBC count','2023-09-26 18:45:30','2023-09-26 18:45:30'),(69,31,NULL,'Modified ZN','Modified ZN','2023-09-26 18:45:30','2023-09-26 18:45:30'),(70,37,NULL,'RFTs','RFTs','2023-09-26 18:45:30','2023-09-26 18:45:30'),(71,38,NULL,'HIV-1 GENOTYPING','HIV-1 GENOTYPING','2023-09-26 18:45:30','2023-09-26 18:45:30'),(72,45,NULL,'HIV-DR RESISTANCE','HIV-DR RESISTANCE','2023-09-26 18:45:30','2023-09-26 18:45:30'),(73,50,NULL,'TB LAM','TB LAM','2023-09-26 18:45:30','2023-09-26 18:45:30'),(74,51,NULL,'HIV-1 ELISA Assay','HIV-1 ELISA Assay','2023-09-26 18:45:30','2023-09-26 18:45:30'),(75,54,NULL,'Film Comment','Film Comment','2023-09-26 18:45:30','2023-09-26 18:45:30'),(76,62,NULL,'TOXOPLASMA IgG/IgM','TOXOPLASMA IgG/IgM','2023-09-26 18:45:30','2023-09-26 18:45:30'),(77,63,NULL,'Pancreatic Profile','Pancreatic Profile','2023-09-26 18:45:30','2023-09-26 18:45:30'),(78,65,NULL,'Cloting Time ','Cloting Time ','2023-09-26 18:45:30','2023-09-26 18:45:30'),(79,72,NULL,'Faecal Occult Blood (FOB)','Faecal Occult Blood (FOB)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(80,74,NULL,'HBeAg','HBeAg','2023-09-26 18:45:30','2023-09-26 18:45:30'),(81,78,NULL,'COVID 19 RDT ','COVID 19 RDT ','2023-09-26 18:45:30','2023-09-26 18:45:30'),(82,83,NULL,'COVID-19 PCR Test','COVID-19 PCR Test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(83,90,NULL,'Lipase','Lipase','2023-09-26 18:45:30','2023-09-26 18:45:30'),(84,91,NULL,'Histology','Histology','2023-09-26 18:45:30','2023-09-26 18:45:30'),(85,92,NULL,'Cytologic test (procedure)','Cytologic test (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(86,93,NULL,'MTB Culture and Sensitivity','MTB Culture and Sensitivity','2023-09-26 18:45:30','2023-09-26 18:45:30'),(87,94,NULL,'Viral hemorrhagic fever (disorder) ','VHF - Viral hemorrhagic fever','2023-09-26 18:45:30','2023-09-26 18:45:30'),(88,97,NULL,'Measles (disorder)','Measles','2023-09-26 18:45:30','2023-09-26 18:45:30'),(89,98,NULL,'Polio screening (procedure)','Polio screening (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(90,100,NULL,'HB Electrophoresis','HB Electrophoresis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(91,66,NULL,'Hepatitis B Viral Load','Hepatitis B Viral Load','2023-09-26 18:45:30','2023-09-26 18:45:30'),(92,20,NULL,'AFB Smear','AFB Smear','2023-09-26 18:45:30','2023-09-26 18:45:30'),(93,68,NULL,'Glucose measurement (procedure)','Glucose measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(94,69,NULL,'Extended Electrolytes','Extended Electrolytes','2023-09-26 18:45:30','2023-09-26 18:45:30'),(95,5,NULL,'Elecsys Anti-HBe','Elecsys Anti-HBe','2023-09-26 18:45:30','2023-09-26 18:45:30'),(96,8,NULL,'Elecsys HBeAg','Elecsys HBeAg','2023-09-26 18:45:30','2023-09-26 18:45:30'),(97,109,NULL,'Lactate (substance) ','Lactate','2023-09-26 18:45:30','2023-09-26 18:45:30'),(98,52,NULL,'Uric acid measurement, urine','Uric acid measurement, urine (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(99,110,NULL,'ARBO VIRUS','ARBO VIRUS','2023-09-26 18:45:30','2023-09-26 18:45:30'),(100,55,NULL,'Ferritin measurement (procedure) ','Ferritin measurement','2023-09-26 18:45:30','2023-09-26 18:45:30'),(101,35,NULL,'Cryptococcus antigen','CRAG - Cryptococcus antigen ','2023-09-26 18:45:30','2023-09-26 18:45:30'),(102,41,NULL,'Rectic Count','Rectic Count','2023-09-26 18:45:30','2023-09-26 18:45:30'),(103,111,NULL,'Indirect Coombs test (procedure)','Indirect Coombs test','2023-09-26 18:45:30','2023-09-26 18:45:30'),(104,60,NULL,'Human immunodeficiency virus antigen test','HIV QUALITATIVE','2023-09-26 18:45:30','2023-09-26 18:45:30'),(105,113,NULL,'HIV-1 DNA PCR','HIV-1 DNA PCR','2023-09-26 18:45:30','2023-09-26 18:45:30'),(106,76,NULL,'CSF Glucose','CSF Glucose','2023-09-26 18:45:30','2023-09-26 18:45:30'),(107,81,NULL,'CSF Cell Count','CSF Cell Count','2023-09-26 18:45:30','2023-09-26 18:45:30'),(108,115,NULL,'CSF Protein','CSF Protein','2023-09-26 18:45:30','2023-09-26 18:45:30'),(109,116,NULL,'AFB Culture','AFB Culture','2023-09-26 18:45:30','2023-09-26 18:45:30'),(110,117,NULL,'Widal test (procedure)','Widal test (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(111,106,NULL,'SPUTUM GRAM','SPUTUM GRAM','2023-09-26 18:45:30','2023-09-26 18:45:30'),(112,33,NULL,'Hepatitis B core antibody measurement','Hepatitis B core antibody measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(113,119,NULL,'Partial thromboplastin time activated (procedure)','Partial thromboplastin time activated (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(114,120,NULL,'Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Album','Albumin measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(115,121,NULL,'Alkaline phosphatase measurement (procedure)','Alkaline phosphatase measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(116,122,NULL,'ALT/SGPT serum level (procedure)','ALT/SGPT serum level (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(117,125,NULL,'Antistreptolysin-O test (procedure)','Antistreptolysin-O test (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(118,126,NULL,'Aspartate aminotransferase measurement (procedure)','Aspartate aminotransferase measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(119,127,NULL,'Human chorionic gonadotropin measurement (procedure)','Human chorionic gonadotropin measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(120,128,NULL,'Bilirubin, direct measurement (procedure)','Bilirubin, direct measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(121,129,NULL,'Bilirubin, total measurement (procedure)','Bilirubin, total measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(122,130,NULL,'Bone marrow structure (body structure)','Bone marrow structure (body structure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(123,131,NULL,'Calcium measurement (procedure)','Calcium measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(124,132,NULL,'Cardiac enzymes/isoenzymes measurement (procedure)','Cardiac enzymes/isoenzymes measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(125,134,NULL,'Absolute CD3 count procedure (procedure)','Absolute CD3 count procedure (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(126,135,NULL,'Carcinoembryonic antigen measurement (procedure)','Carcinoembryonic antigen measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(127,136,NULL,'Chlamydia antigen test (procedure)','Chlamydia antigen test (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(128,137,NULL,'Cholesterol measurement (procedure)','Cholesterol measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(129,138,NULL,'Cholinesterase level (procedure)','Cholinesterase level (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(130,140,NULL,'CMV IgM level (procedure)','CMV IgM level (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(131,141,NULL,'9am cortisol measurement (procedure)','9am cortisol measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(132,142,NULL,'Midnight cortisol measurement (procedure)','Midnight cortisol measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(133,143,NULL,'Creatinine measurement (procedure)','Creatinine measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(134,144,NULL,'Measurement of renal clearance of creatinine (procedure)','Measurement of renal clearance of creatinine (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(135,145,NULL,'Estradiol measurement (procedure)','Estradiol measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(136,146,NULL,'Fine needle aspiration biopsy for cytology NOC (procedure)','Fine needle aspiration biopsy for cytology NOC (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(137,147,NULL,'Follicle stimulating hormone measurement (procedure)','Follicle stimulating hormone measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(138,148,NULL,'Prostate Specific Ag Free [Units/volume] in Serum or Plasma','Prostate Specific Ag Free [Units/volume] in Serum or Plasma','2023-09-26 18:45:30','2023-09-26 18:45:30'),(139,149,NULL,'Gamma-glutamyltransferase (substance)','Gamma-glutamyltransferase (substance)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(140,150,NULL,'High vaginal swab (& taken) (procedure)','High vaginal swab (& taken) (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(141,151,NULL,'Inorganic phosphorus measurement (procedure)','Inorganic phosphorus measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(142,152,NULL,'KOH MICROSCOPY','KOH MICROSCOPY','2023-09-26 18:45:30','2023-09-26 18:45:30'),(143,153,NULL,'L.E. cells (& level) (procedure)','L.E. cells (& level) (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(144,154,NULL,'Lactate dehydrogenase measurement (procedure)','Lactate dehydrogenase measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(145,155,NULL,'Luteinizing hormone measurement (procedure)','Luteinizing hormone measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(146,105,NULL,'Magnesium measurement (procedure)','Magnesium measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(147,156,NULL,'Progesterone measurement (procedure)','Progesterone measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(148,157,NULL,'Prolactin measurement (procedure)','Prolactin measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(149,158,NULL,'Protein electrophoresis (procedure)','Protein electrophoresis (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(150,159,NULL,'Trypanosomal antibody level (procedure)','TRYPANOSOMA PARASITES','2023-09-26 18:45:30','2023-09-26 18:45:30'),(151,160,NULL,'Electrolytes measurement, urine (procedure)','Electrolytes measurement, urine (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(152,161,NULL,'Measurement of protein in urine (procedure)','Measurement of protein in urine (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(153,162,NULL,'Vanillylmandelic acid (VMA) measurement (procedure)','Vanillylmandelic acid (VMA) measurement (procedure)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(154,163,NULL,'Histoplasmosis','Histoplasmosis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(155,NULL,NULL,'Typhoid fever','Typhoid fever','2023-09-26 18:45:30','2023-09-26 18:45:30'),(156,NULL,NULL,'Cholera','Cholera','2023-09-26 18:45:30','2023-09-26 18:45:30'),(157,NULL,NULL,'Dysenteric diarrhea','Dysenteric diarrhea','2023-09-26 18:45:30','2023-09-26 18:45:30'),(158,NULL,NULL,'Genus Rotavirus','Genus Rotavirus','2023-09-26 18:45:30','2023-09-26 18:45:30'),(159,NULL,NULL,'Meningitis','Meningitis','2023-09-26 18:45:30','2023-09-26 18:45:30'),(160,NULL,NULL,'Tetanus','Tetanus','2023-09-26 18:45:30','2023-09-26 18:45:30'),(161,NULL,NULL,'Plague (disorder)','Plague (disorder)','2023-09-26 18:45:30','2023-09-26 18:45:30'),(162,NULL,NULL,'Antigen of Hepatitis B virus core protein (substance) ','Hepatitis B core Ag','2023-09-26 18:45:30','2023-09-26 18:45:30'),(163,NULL,NULL,'Viral hepatitis, type A (disorder)','Viral hepatitis, type A (disorder)','2023-09-26 18:45:31','2023-09-26 18:45:31');
/*!40000 ALTER TABLE `test_name_mappings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_name_terminology`
--

DROP TABLE IF EXISTS `test_name_terminology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_name_terminology` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `system_text` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_type` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_url` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `system_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `display` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_name_mapping_id` int unsigned NOT NULL,
  `is_default` tinyint DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `test_name_terminology_test_name_mapping_id_foreign` (`test_name_mapping_id`),
  CONSTRAINT `test_name_terminology_test_name_mapping_id_foreign` FOREIGN KEY (`test_name_mapping_id`) REFERENCES `test_name_mappings` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_name_terminology`
--

LOCK TABLES `test_name_terminology` WRITE;
/*!40000 ALTER TABLE `test_name_terminology` DISABLE KEYS */;
INSERT INTO `test_name_terminology` VALUES (1,'Microscopy for malarial parasites (procedure)','SNOMED','http://snomed.info/sct','372071003','Microscopy for malarial parasites',1,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(2,'Hemoglobin level estimation (procedure)','SNOMED','http://snomed.info/sct','271026005','Hb estimation',2,0,'2023-09-26 18:48:39','2023-09-29 13:31:55'),(3,'Urinalysis (procedure)','SNOMED','http://snomed.info/sct','27171005','Urinalysis',3,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(4,'Direct Coombs test (procedure)','SNOMED','http://snomed.info/sct','77020008','Direct Coombs test',4,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(5,'Sickle cell disease screening test (procedure)','SNOMED','http://snomed.info/sct','314090007','Sickle cell disease screening test',5,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(6,'Venereal Disease Research Laboratory test (procedure)','SNOMED','http://snomed.info/sct','7786006','VDRL test',6,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(7,'Urine pregnancy test (procedure)','SNOMED','http://snomed.info/sct','167252002','HCG',7,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(8,'Serum pregnancy test (B-human chorionic gonadotropin) (procedure)','SNOMED','http://snomed.info/sct','166434005','Serum pregnancy test (B-HCG)',8,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(9,'Brucella agglutinin test (procedure)','SNOMED','http://snomed.info/sct','165827007','Brucella agglutinin test',9,0,'2023-09-26 18:48:39','2023-11-24 09:32:40'),(10,'Immunoglobulin G antibody to Helicobacter pylori (substance)','SNOMED','http://snomed.info/sct','710447002','Helicobacter pylori IgG',10,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(11,'Culture and susceptibility (procedure)','SNOMED','http://snomed.info/sct','252390002','Culture and sensitivities',11,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(12,'Gram stain method (procedure)','SNOMED','http://snomed.info/sct','62777006','Gram stain',12,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(13,'Ziehl-Neelsen stain method (procedure)','SNOMED','http://snomed.info/sct','406979008','Ziehl-Neelsen stain',13,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(14,'Complete blood count (procedure)','SNOMED','http://snomed.info/sct','26604007','CBC',14,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(15,'Serum random glucose measurement (procedure)','SNOMED','http://snomed.info/sct','271061004','Random Blood Sugar ',15,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(16,'Blood group typing (procedure)','SNOMED','http://snomed.info/sct','44608003','Blood grouping',16,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(17,'Major crossmatch (procedure)','SNOMED','http://snomed.info/sct','41902000','Blood cross-matching',17,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(18,'Hepatic function panel (procedure)','SNOMED','http://snomed.info/sct','26958001','LFT - Liver function test',18,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(19,'Serologic test for syphilis (procedure)','SNOMED','http://snomed.info/sct','40675008','Syphilis serology',19,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(20,'Absolute CD4 count procedure (procedure)','SNOMED','http://snomed.info/sct','313660005','Absolute CD4 count',20,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(21,'Human immunodeficiency virus antibody test (procedure)','SNOMED','http://snomed.info/sct','165813002','HIV (Human immunodeficiency virus) antibody test',21,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(22,'Hepatitis B surface antigen measurement (procedure)','SNOMED','http://snomed.info/sct','47758006','HBsAg measurement',22,0,'2023-09-26 18:48:39','2023-11-29 14:21:59'),(23,'CSF Analysis','SNOMED','http://snomed.info/sct','413016008','CSF Analysis',23,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(24,'Malaria antigen test (procedure)','SNOMED','http://snomed.info/sct','407727009','Malaria antigen test',24,1,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(25,'Fecal analysis (procedure)','SNOMED','http://snomed.info/sct','83033005','Stool analysis',25,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(26,'Treponema pallidum hemaglutination test (procedure)','SNOMED','http://snomed.info/sct','269829001','TPHA - Treponema pallidum haemaglutination test',26,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(27,'Electrolytes measurement (procedure)','SNOMED','http://snomed.info/sct','79301008','Electrolytes measurement',27,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(28,'MTB/RIF test','SNOMED','https://loinc.org/33634-7/','33634-7','MTB/RIF test',28,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(29,'Fasting blood glucose measurement (procedure)','SNOMED','http://snomed.info/sct','271062006','Fasting blood glucose',29,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(30,'India ink stain method (procedure)','SNOMED','http://snomed.info/sct','18177006','India ink stain',30,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(31,'Semen analysis (procedure)','SNOMED','http://snomed.info/sct','11900001','Semen analysis',31,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(32,'Human immunodeficiency virus viral load (procedure)','SNOMED','http://snomed.info/sct','315124004','HIV viral load',32,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(33,'Rheumatoid factor measurement (procedure)','SNOMED','http://snomed.info/sct','54921001','Rheumatoid factor measurement',33,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(34,'Fasting lipid profile (procedure)','SNOMED','http://snomed.info/sct','252150008','FLP - Fasting lipid profile',34,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(35,'Human papillomavirus deoxyribonucleic acid detection (procedure)','SNOMED','http://snomed.info/sct','35904009','HPV DNA detection',35,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(36,'Amylase measurement (procedure) ','SNOMED','http://snomed.info/sct','64435009','Amylase level',36,0,'2023-09-26 18:48:39','2023-09-29 13:29:04'),(37,'Testosterone measurement (procedure)','SNOMED','http://snomed.info/sct','104957004','Testosterone level',37,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(38,'Prothrombin time (procedure)','SNOMED','http://snomed.info/sct','396451008','Prothrombin time',38,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(39,'Hemoglobin A1c measurement (procedure)','SNOMED','http://snomed.info/sct','43396009','Haemoglobin A1c measurement',39,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(40,'Thyroid panel (procedure)','SNOMED','http://snomed.info/sct','35650009','TFT - Thyroid function test',40,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(41,'C-reactive protein measurement (procedure)','SNOMED','http://snomed.info/sct','55235003','CRP - C-reactive protein level',41,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(42,'Erythrocyte sedimentation rate measurement (procedure)','SNOMED','http://snomed.info/sct','416838001','ESR - Erythrocyte sedimentation rate',42,0,'2023-09-26 18:48:39','2023-09-29 13:32:06'),(43,'Troponin T measurement (procedure)','SNOMED','http://snomed.info/sct','121871002','Troponin T measurement',43,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(44,'Male sex hormones - serum measurement (procedure)','SNOMED','http://snomed.info/sct','271222000','Male sex hormones - serum level',44,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(45,'Alpha-1-Fetoprotein measurement (procedure)','SNOMED','http://snomed.info/sct','80152001','AFP measurement',45,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(46,'D-dimer assay (procedure)','SNOMED','http://snomed.info/sct','70648006','D-dimer assay',46,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(47,'Hepatitis C antigen measurement (procedure)','SNOMED','http://snomed.info/sct','58589004','Hepatitis C antigen measurement',47,0,'2023-09-26 18:48:39','2023-09-29 13:34:11'),(48,'Reticulocyte count (procedure)','SNOMED','http://snomed.info/sct','45995003','Reticulocyte count',48,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(49,'Prostate specific antigen measurement (procedure)','SNOMED','http://snomed.info/sct','63476009','PSA measurement',49,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(50,'Total protein measurement (procedure)','SNOMED','http://snomed.info/sct','304383000','TP - Total protein',50,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(51,'Yellow fever screening (procedure)','SNOMED','http://snomed.info/sct','171118001','Yellow fever screening',51,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(52,'Human papillomavirus screening (procedure)','SNOMED','http://snomed.info/sct','700152009','Human papillomavirus screening',52,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(53,'Lactic acid measurement (procedure)','SNOMED','http://snomed.info/sct','3926003','Lactic acid measurement',53,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(54,'Thyroxine measurement (procedure)','SNOMED','http://snomed.info/sct','72765002','T4 measurement',54,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(55,'Triiodothyronine measurement (procedure)','SNOMED','http://snomed.info/sct','250668004','T3 - Triiodothyronine level',55,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(56,'Thyroid stimulating hormone measurement (procedure)','SNOMED','http://snomed.info/sct','61167004','TSH level',56,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(57,'Creatine kinase measurement (procedure)','SNOMED','http://snomed.info/sct','397798009','Creatine kinase measurement',57,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(58,'Bleeding time (procedure)','SNOMED','http://snomed.info/sct','72406003','Bleeding time',58,0,'2023-09-26 18:48:39','2023-09-29 13:28:43'),(59,'International normalized ratio (observable entity)','SNOMED','http://snomed.info/sct','165581004','INR - Internationalised ratio',59,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(60,'Rapid plasma reagin test (procedure)','SNOMED','http://snomed.info/sct','19869000','RPR test',60,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(61,'Genus Borrelia (organism)','SNOMED','http://snomed.info/sct','112277009','Borrelia',61,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(62,'Measurement of ketones in urine using dipstick (procedure)','SNOMED','http://snomed.info/sct','271347000','Urine ketone test',62,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(63,'Lymphocyte component of blood (substance)','SNOMED','http://snomed.info/sct','709252005','Lymphocytes',63,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(64,'Quantitative urine culture (procedure)','SNOMED','http://snomed.info/sct','117011000','Quantitative urine culture',64,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(65,'Specific gravity measurement (procedure)','SNOMED','http://snomed.info/sct','69285004','SG - Specific gravity',65,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(66,'Wet preparation technique (qualifier value)','SNOMED','http://snomed.info/sct','703457005','Wet preparation technique',66,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(67,'Filaria identification (procedure) ','SNOMED','http://snomed.info/sct','121904005','Filaria identification',67,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(68,'White blood cell count (procedure)','SNOMED','http://snomed.info/sct','767002','WBC count',68,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(69,'Modified ZN','SNOMED','https://loinc.org/','23243-9','Modified ZN',69,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(70,'RFTs','SNOMED','http://snomed.info/sct','144417005','RFTs',70,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(71,'HIV-1 GENOTYPING','SNOMED','http://snomed.info/sct','446987006','HIV-1 GENOTYPING',71,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(72,'HIV-DR RESISTANCE','SNOMED','http://snomed.info/sct','713726003','HIV-DR RESISTANCE',72,0,'2023-09-26 18:48:39','2023-11-29 20:58:50'),(73,'TB LAM','SNOMED','https://loinc.org/95127-7/','95127-7','TB LAM',73,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(74,'HIV-1 ELISA Assay','SNOMED','http://snomed.info/sct','74915004','HIV-1 ELISA Assay',74,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(75,'Film Comment','SNOMED','http://snomed.info/sct','14768001','Film Comment',75,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(76,'TOXOPLASMA IgG/IgM','SNOMED','http://snomed.info/sct','165834009','TOXOPLASMA IgG/IgM',76,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(77,'Pancreatic Profile','SNOMED','http://snomed.info/sct','252243002','Pancreatic Profile',77,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(78,'Cloting Time ','SNOMED','http://snomed.info/sct','165566005','Cloting Time ',78,0,'2023-09-26 18:48:39','2023-09-29 13:29:30'),(79,'Faecal Occult Blood (FOB)','SNOMED','http://snomed.info/sct','104435004','Faecal Occult Blood (FOB)',79,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(80,'HBeAg','SNOMED','http://snomed.info/sct','313476009','HBeAg',80,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(81,'COVID 19 RDT ','SNOMED','http://snomed.info/sct','1240471000000102','COVID 19 RDT ',81,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(82,'COVID-19 PCR Test','SNOMED','http://snomed.info/sct','1269559008','COVID-19 PCR Test',82,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(83,'Lipase','SNOMED','http://snomed.info/sct','72993008','Lipase',83,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(84,'Histology','SNOMED','http://snomed.info/sct','395171002','Histology',84,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(85,'Cytologic test (procedure)','SNOMED','http://snomed.info/sct','116147009','Cytologic test (procedure)',85,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(86,'MTB Culture and Sensitivity','SNOMED','http://snomed.info/sct','438487006','MTB Culture and Sensitivity',86,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(87,'Viral hemorrhagic fever (disorder) ','SNOMED','http://snomed.info/sct','240523007','VHF - Viral hemorrhagic fever',87,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(88,'Measles (disorder)','SNOMED','http://snomed.info/sct','171117006','Measles',88,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(89,'Polio screening (procedure)','SNOMED','http://snomed.info/sct','171115003','Polio screening (procedure)',89,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(90,'HB Electrophoresis','SNOMED','http://snomed.info/sct','104145007','HB Electrophoresis',90,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(91,'Hepatitis B Viral Load','SNOMED','http://snomed.info/sct','242341010000109','Hepatitis B Viral Load',91,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(92,'AFB Smear','SNOMED','http://snomed.info/sct','391483001','AFB Smear',92,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(93,'Glucose measurement (procedure)','SNOMED','http://snomed.info/sct','36048009','Glucose measurement',93,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(94,'Extended Electrolytes','SNOMED','http://snomed.info/sct','44277000','Extended Electrolytes',94,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(95,'Elecsys Anti-HBe','SNOMED','http://snomed.info/sct','17627009','Elecsys Anti-HBe',95,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(96,'Elecsys HBeAg','SNOMED','http://snomed.info/sct','46325006','Elecsys HBeAg',96,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(97,'Lactate (substance) ','SNOMED','http://snomed.info/sct','83036002','Lactate',97,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(98,'Uric acid measurement, urine','SNOMED','http://snomed.info/sct','24205003','Uric acid measurement, urine (procedure)',98,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(99,'ARBO VIRUS','SNOMED','http://snomed.info/sct','122218006','ARBO VIRUS',99,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(100,'Ferritin measurement (procedure) ','SNOMED','http://snomed.info/sct','489004','Ferritin measurement',100,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(101,'Cryptococcus antigen','SNOMED','http://snomed.info/sct','103094002','CRAG - Cryptococcus antigen ',101,0,'2023-09-26 18:48:39','2023-10-03 18:12:28'),(102,'Rectic Count','CPHL','https://www.cphluganda.org/ct','dmqe2kqq','Rectic Count',102,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(103,'Indirect Coombs test (procedure)','SNOMED','http://snomed.info/sct','16742006','Indirect Coombs test',103,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(104,'Human immunodeficiency virus antigen test','SNOMED','http://snomed.info/sct','31676001','HIV QUALITATIVE',104,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(105,'HIV-1 DNA PCR','SNOMED','http://snomed.info/sct','117748001','HIV-1 DNA PCR',105,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(106,'CSF Glucose','SNOMED','http://snomed.info/sct','69125006','CSF Glucose',106,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(107,'CSF Cell Count','SNOMED','http://snomed.info/sct','68866004','CSF Cell Count',107,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(108,'CSF Protein','SNOMED','http://snomed.info/sct','84130004','CSF Protein',108,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(109,'AFB Culture','SNOMED','http://snomed.info/sct','391361001','AFB Culture',109,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(110,'Widal test (procedure)','SNOMED','http://snomed.info/sct','165828002','Widal test (procedure)',110,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(111,'SPUTUM GRAM','SNOMED','http://snomed.info/sct','168002000','SPUTUM GRAM',111,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(112,'Hepatitis B core antibody measurement','SNOMED','http://snomed.info/sct','59582004','Hepatitis B core antibody measurement (procedure)',112,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(113,'Partial thromboplastin time activated (procedure)','SNOMED','http://snomed.info/sct','400970000','Partial thromboplastin time activated (procedure)',113,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(114,'Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Albumin measurement (procedure)Album','SNOMED','http://snomed.info/sct','26758005','Albumin measurement (procedure)',114,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(115,'Alkaline phosphatase measurement (procedure)','SNOMED','http://snomed.info/sct','88810008','Alkaline phosphatase measurement (procedure)',115,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(116,'ALT/SGPT serum level (procedure)','SNOMED','http://snomed.info/sct','143963001','ALT/SGPT serum level (procedure)',116,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(117,'Antistreptolysin-O test (procedure)','SNOMED','http://snomed.info/sct','41451006','Antistreptolysin-O test (procedure)',117,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(118,'Aspartate aminotransferase measurement (procedure)','SNOMED','http://snomed.info/sct','45896001','Aspartate aminotransferase measurement (procedure)',118,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(119,'Human chorionic gonadotropin measurement (procedure)','SNOMED','http://snomed.info/sct','67900009','Human chorionic gonadotropin measurement (procedure)',119,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(120,'Bilirubin, direct measurement (procedure)','SNOMED','http://snomed.info/sct','39748002','Bilirubin, direct measurement (procedure)',120,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(121,'Bilirubin, total measurement (procedure)','SNOMED','http://snomed.info/sct','359986008','Bilirubin, total measurement (procedure)',121,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(122,'Bone marrow structure (body structure)','SNOMED','http://snomed.info/sct','14016003','Bone marrow structure (body structure)',122,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(123,'Calcium measurement (procedure)','SNOMED','http://snomed.info/sct','71878006','Calcium measurement (procedure)',123,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(124,'Cardiac enzymes/isoenzymes measurement (procedure)','SNOMED','http://snomed.info/sct','74500006','Cardiac enzymes/isoenzymes measurement (procedure)',124,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(125,'Absolute CD3 count procedure (procedure)','SNOMED','http://snomed.info/sct','313447006','Absolute CD3 count procedure (procedure)',125,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(126,'Carcinoembryonic antigen measurement (procedure)','SNOMED','http://snomed.info/sct','60267001','Carcinoembryonic antigen measurement (procedure)',126,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(127,'Chlamydia antigen test (procedure)','SNOMED','http://snomed.info/sct','310861008','Chlamydia antigen test (procedure)',127,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(128,'Cholesterol measurement (procedure)','SNOMED','http://snomed.info/sct','77068002','Cholesterol measurement (procedure)',128,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(129,'Cholinesterase level (procedure)','SNOMED','http://snomed.info/sct','392896009','Cholinesterase level (procedure)',129,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(130,'CMV IgM level (procedure)','SNOMED','http://snomed.info/sct','143337001','CMV IgM level (procedure)',130,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(131,'9am cortisol measurement (procedure)','SNOMED','http://snomed.info/sct','250654006','9am cortisol measurement (procedure)',131,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(132,'Midnight cortisol measurement (procedure)','SNOMED','http://snomed.info/sct','250655007','Midnight cortisol measurement (procedure)',132,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(133,'Creatinine measurement (procedure)','SNOMED','http://snomed.info/sct','70901006','Creatinine measurement (procedure)',133,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(134,'Measurement of renal clearance of creatinine (procedure)','SNOMED','http://snomed.info/sct','167181009','Measurement of renal clearance of creatinine (procedure)',134,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(135,'Estradiol measurement (procedure)','SNOMED','http://snomed.info/sct','37538009','Estradiol measurement (procedure)',135,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(136,'Fine needle aspiration biopsy for cytology NOC (procedure)','SNOMED','http://snomed.info/sct','180461009','Fine needle aspiration biopsy for cytology NOC (procedure)',136,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(137,'Follicle stimulating hormone measurement (procedure)','SNOMED','http://snomed.info/sct','31003009','Follicle stimulating hormone measurement (procedure)',137,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(138,'Prostate Specific Ag Free [Units/volume] in Serum or Plasma','SNOMED','http://snomed.info/sct','19201-3','Prostate Specific Ag Free [Units/volume] in Serum or Plasma',138,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(139,'Gamma-glutamyltransferase (substance)','SNOMED','http://snomed.info/sct','60153001','Gamma-glutamyltransferase (substance)',139,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(140,'High vaginal swab (& taken) (procedure)','SNOMED','http://snomed.info/sct','270049000','High vaginal swab (& taken) (procedure)',140,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(141,'Inorganic phosphorus measurement (procedure)','SNOMED','http://snomed.info/sct','121797002','Inorganic phosphorus measurement (procedure)',141,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(142,'KOH MICROSCOPY','SNOMED','http://snomed.info/sct','372431000119101','KOH MICROSCOPY',142,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(143,'L.E. cells (& level) (procedure)','SNOMED','http://snomed.info/sct','165926002','L.E. cells (& level) (procedure)',143,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(144,'Lactate dehydrogenase measurement (procedure)','SNOMED','http://snomed.info/sct','11274001','Lactate dehydrogenase measurement (procedure)',144,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(145,'Luteinizing hormone measurement (procedure)','SNOMED','http://snomed.info/sct','69527006','Luteinizing hormone measurement (procedure)',145,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(146,'Magnesium measurement (procedure)','SNOMED','http://snomed.info/sct','38151008','Magnesium measurement (procedure)',146,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(147,'Progesterone measurement (procedure)','SNOMED','http://snomed.info/sct','46264006','Progesterone measurement (procedure)',147,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(148,'Prolactin measurement (procedure)','SNOMED','http://snomed.info/sct','113083009','Prolactin measurement (procedure)',148,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(149,'Protein electrophoresis (procedure)','SNOMED','http://snomed.info/sct','82962001','Protein electrophoresis (procedure)',149,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(150,'Trypanosomal antibody level (procedure)','SNOMED','http://snomed.info/sct','315203001','TRYPANOSOMA PARASITES',150,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(151,'Electrolytes measurement, urine (procedure)','SNOMED','http://snomed.info/sct','14830009','Electrolytes measurement, urine (procedure)',151,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(152,'Measurement of protein in urine (procedure)','SNOMED','http://snomed.info/sct','57378007','Measurement of protein in urine (procedure)',152,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(153,'Vanillylmandelic acid (VMA) measurement (procedure)','SNOMED','http://snomed.info/sct','83729008','Vanillylmandelic acid (VMA) measurement (procedure)',153,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(154,'Histoplasmosis','SNOMED','http://snomed.info/sct','164994004','Histoplasmosis',154,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(155,'Typhoid fever',NULL,NULL,'4834000','Typhoid fever',155,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(156,'Cholera',NULL,NULL,'63650001','Cholera',156,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(157,'Dysenteric diarrhea',NULL,NULL,'46799006','Dysenteric diarrhea',157,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(158,'Genus Rotavirus',NULL,NULL,'417542000','Genus Rotavirus',158,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(159,'Meningitis',NULL,NULL,'7180009','Meningitis',159,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(160,'Tetanus',NULL,NULL,'76902006','Tetanus',160,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(161,'Plague (disorder)',NULL,NULL,'58750007','Plague (disorder)',161,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(162,'Antigen of Hepatitis B virus core protein (substance) ',NULL,NULL,'39082004','Hepatitis B core Ag',162,0,'2023-09-26 18:48:39','2023-09-26 18:48:39'),(163,'Viral hepatitis, type A (disorder)',NULL,NULL,'40468003','Viral hepatitis, type A (disorder)',163,0,'2023-09-26 18:48:39','2023-09-26 18:48:39');
/*!40000 ALTER TABLE `test_name_terminology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_phases`
--

DROP TABLE IF EXISTS `test_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_phases` (
  `id` int unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_phases`
--

LOCK TABLES `test_phases` WRITE;
/*!40000 ALTER TABLE `test_phases` DISABLE KEYS */;
INSERT INTO `test_phases` VALUES (1,'Pre-Analytical','2024-12-11 18:07:07','2024-12-11 18:07:07'),(2,'Analytical','2024-12-11 18:07:07','2024-12-11 18:07:07'),(3,'Post-Analytical','2024-12-11 18:07:07','2024-12-11 18:07:07');
/*!40000 ALTER TABLE `test_phases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_statuses`
--

DROP TABLE IF EXISTS `test_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_statuses` (
  `id` int unsigned NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `test_phase_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `test_statuses_test_phase_id_foreign` (`test_phase_id`),
  CONSTRAINT `test_statuses_test_phase_id_foreign` FOREIGN KEY (`test_phase_id`) REFERENCES `test_phases` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_statuses`
--

LOCK TABLES `test_statuses` WRITE;
/*!40000 ALTER TABLE `test_statuses` DISABLE KEYS */;
INSERT INTO `test_statuses` VALUES (1,'not-received',1,'2024-12-11 18:07:08','2024-12-11 18:07:08'),(2,'pending',1,'2024-12-11 18:07:08','2024-12-11 18:07:08'),(3,'started',2,'2024-12-11 18:07:08','2024-12-11 18:07:08'),(4,'completed',3,'2024-12-11 18:07:08','2024-12-11 18:07:08'),(5,'verified',3,'2024-12-11 18:07:08','2024-12-11 18:07:08'),(6,'specimen-rejected-at-analysis',3,'2024-12-11 18:07:08','2024-12-11 18:07:08'),(7,'approved',3,'2024-12-11 18:15:27','2024-12-11 18:15:27'),(13,'Failed to synch',3,'2024-12-11 18:14:00','2024-12-11 18:14:00');
/*!40000 ALTER TABLE `test_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_types`
--

DROP TABLE IF EXISTS `test_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `test_category_id` int unsigned NOT NULL,
  `test_name_mapping_id` int unsigned DEFAULT NULL,
  `eafya_test_type_id` int DEFAULT NULL,
  `eafya_test_type_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `targetTAT` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `targetTAT_unit` varchar(10) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `orderable_test` int DEFAULT NULL,
  `prevalence_threshold` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `accredited` tinyint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `test_types_test_category_id_foreign` (`test_category_id`),
  CONSTRAINT `test_types_test_category_id_foreign` FOREIGN KEY (`test_category_id`) REFERENCES `test_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_types`
--

LOCK TABLES `test_types` WRITE;
/*!40000 ALTER TABLE `test_types` DISABLE KEYS */;
INSERT INTO `test_types` VALUES (1,'HIV',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:00:12','2024-12-11 18:00:12'),(2,'BS for mps',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:00:12','2024-12-11 18:00:12'),(3,'GXM',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:12','2024-12-11 18:00:12'),(4,'HB',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:00:12','2024-12-11 18:00:12'),(5,'Urinalysis',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:12','2024-12-11 18:00:12'),(6,'WBC',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:12','2024-12-11 18:00:12'),(7,'Salmonella Antigen Test',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(8,'Direct COOMBS Test',NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(9,'DU Test',NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(10,'Sickling Test',NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(11,'Borrelia',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(12,'VDRL',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(13,'Pregnancy Test',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(14,'Brucella',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:18','2024-12-11 18:00:18'),(15,'H. Pylori',NULL,NULL,4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:19','2024-12-11 18:00:19'),(16,'CBC',NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:00:29','2024-12-11 18:00:29'),(17,'Appearance',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:54','2024-12-11 18:00:54'),(18,'Culture and Sensitivity',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:54','2024-12-11 18:00:54'),(19,'Gram Staining',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:54','2024-12-11 18:00:54'),(20,'India Ink Staining',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:54','2024-12-11 18:00:54'),(21,'Protein',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:55','2024-12-11 18:00:55'),(22,'Wet preparation (saline preparation)',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:55','2024-12-11 18:00:55'),(23,'Wet Saline Iodine Prep',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:55','2024-12-11 18:00:55'),(24,'White Blood Cell Count',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:55','2024-12-11 18:00:55'),(25,'ZN Staining',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:55','2024-12-11 18:00:55'),(26,'Modified ZN',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:55','2024-12-11 18:00:55'),(27,'Crag',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(28,'Differential',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(29,'Total Cell Count',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(30,'Lymphocytes',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(31,'Quantitative Culture',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(32,'RBC Count',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(33,'TPHA',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:56','2024-12-11 18:00:56'),(34,'HCG',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:57','2024-12-11 18:00:57'),(35,'Bilirubin',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(36,'Blood',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(37,'Glucose',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(38,'Ketones',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(39,'Leukocytes',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(40,'Microscopy',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(41,'Nitrite',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(42,'pH',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:58','2024-12-11 18:00:58'),(43,'Specific Gravity',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:59','2024-12-11 18:00:59'),(44,'Urobilinogen',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:00:59','2024-12-11 18:00:59'),(45,'RPR',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:01:17','2024-12-11 18:01:17'),(46,'Serum Crag',NULL,NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-12-11 18:01:17','2024-12-11 18:01:17'),(47,'Aspergilus',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:06:08','2024-12-11 18:06:08'),(48,'Histoplasmosis',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:06:08','2024-12-11 18:06:08'),(49,'Serum Crag',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:06:08','2024-12-11 18:06:08'),(50,'Urine TB Lam',NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,'2024-12-11 18:06:08','2024-12-11 18:06:08');
/*!40000 ALTER TABLE `test_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtype_measures`
--

DROP TABLE IF EXISTS `testtype_measures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testtype_measures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int unsigned NOT NULL,
  `measure_id` int unsigned NOT NULL,
  `ordering` tinyint DEFAULT NULL,
  `nesting` tinyint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testtype_measures_test_type_id_measure_id_unique` (`test_type_id`,`measure_id`),
  KEY `testtype_measures_measure_id_foreign` (`measure_id`),
  CONSTRAINT `testtype_measures_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `testtype_measures_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtype_measures`
--

LOCK TABLES `testtype_measures` WRITE;
/*!40000 ALTER TABLE `testtype_measures` DISABLE KEYS */;
INSERT INTO `testtype_measures` VALUES (1,1,1,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(2,1,2,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(3,1,3,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(4,2,4,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(5,3,5,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(6,3,6,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(7,4,7,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(8,5,8,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(9,5,9,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(10,5,10,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(11,5,11,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(12,5,12,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(13,5,13,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(14,5,14,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(15,5,15,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(16,5,16,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(17,5,17,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(18,5,18,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(19,5,19,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(20,5,20,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(21,5,21,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(22,5,22,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(23,6,23,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(24,6,24,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(25,6,25,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(26,6,26,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(27,6,27,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(28,6,28,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(29,7,29,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(30,8,30,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(31,9,31,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(32,10,32,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(33,11,33,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(34,12,34,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(35,13,35,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(36,14,36,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(37,15,37,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(38,16,38,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(39,16,39,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(40,16,40,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(41,16,41,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(42,16,42,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(43,16,43,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(44,16,44,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(45,16,45,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(46,16,46,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(47,16,47,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(48,16,48,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(49,16,49,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(50,16,50,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(51,16,51,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(52,16,52,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(53,16,53,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(54,16,54,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(55,16,55,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(56,16,56,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(57,16,57,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(58,16,58,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(59,16,59,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(60,16,60,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(61,16,61,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(62,34,69,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(63,35,70,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(64,36,71,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(65,37,72,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(66,38,73,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(67,39,74,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(68,40,75,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(69,41,76,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(70,42,77,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(71,21,78,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(72,43,79,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(73,44,80,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(74,27,62,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(75,28,63,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(76,29,64,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(77,30,65,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(78,31,66,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(79,32,67,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(80,33,68,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(81,18,82,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(82,19,83,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(83,17,81,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(84,20,84,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(85,21,85,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(86,22,86,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(87,24,87,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(88,25,88,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(89,26,89,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(90,45,97,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(91,46,98,NULL,NULL,'2024-12-11 18:07:09','2024-12-11 18:07:09');
/*!40000 ALTER TABLE `testtype_measures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testtype_specimentypes`
--

DROP TABLE IF EXISTS `testtype_specimentypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testtype_specimentypes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `test_type_id` int unsigned NOT NULL,
  `specimen_type_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `testtype_specimentypes_test_type_id_specimen_type_id_unique` (`test_type_id`,`specimen_type_id`),
  KEY `testtype_specimentypes_specimen_type_id_foreign` (`specimen_type_id`),
  CONSTRAINT `testtype_specimentypes_specimen_type_id_foreign` FOREIGN KEY (`specimen_type_id`) REFERENCES `specimen_types` (`id`),
  CONSTRAINT `testtype_specimentypes_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testtype_specimentypes`
--

LOCK TABLES `testtype_specimentypes` WRITE;
/*!40000 ALTER TABLE `testtype_specimentypes` DISABLE KEYS */;
INSERT INTO `testtype_specimentypes` VALUES (1,1,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(2,2,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(3,3,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(4,4,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(5,4,3,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(6,4,4,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(7,4,8,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(8,6,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(9,7,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(10,8,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(11,9,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(12,10,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(13,11,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(14,12,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(15,13,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(16,14,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(17,15,13,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(18,16,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(19,34,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(20,35,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(21,36,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(22,37,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(23,38,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(24,39,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(25,40,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(26,41,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(27,42,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(28,21,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(29,43,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(30,44,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(31,18,13,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(32,17,13,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(33,26,13,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(34,18,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(35,17,26,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(36,17,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(37,21,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(38,20,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(39,24,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(40,19,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(41,25,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(42,18,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(43,27,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(44,28,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(45,29,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(46,30,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(47,33,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(48,31,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(49,32,14,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(50,19,16,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(51,17,16,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(52,25,16,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(53,18,16,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(54,19,15,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(55,17,15,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(56,25,15,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(57,18,15,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(58,22,25,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(59,17,25,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(60,19,25,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(61,18,25,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(62,22,17,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(63,17,17,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(64,19,17,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(65,18,17,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(66,19,18,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(67,18,18,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(68,17,18,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(69,17,19,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(70,19,19,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(71,18,19,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(72,17,20,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(73,19,20,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(74,18,20,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(75,21,21,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(76,19,21,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(77,17,21,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(78,25,21,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(79,18,21,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(80,17,23,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(81,19,23,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(82,25,23,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(83,18,23,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(84,25,24,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(85,17,24,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(86,19,24,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(87,18,24,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(88,45,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(89,46,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(90,33,22,'2024-12-11 18:07:09','2024-12-11 18:07:09'),(91,18,22,'2024-12-11 18:07:09','2024-12-11 18:07:09');
/*!40000 ALTER TABLE `testtype_specimentypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `therapy`
--

DROP TABLE IF EXISTS `therapy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `therapy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` int unsigned NOT NULL,
  `patient_id` int unsigned NOT NULL,
  `previous_therapy` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_therapy` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinical_notes` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinician` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinician_id` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `therapy`
--

LOCK TABLES `therapy` WRITE;
/*!40000 ALTER TABLE `therapy` DISABLE KEYS */;
/*!40000 ALTER TABLE `therapy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `tokens_email_index` (`email`),
  KEY `tokens_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_analyte_result`
--

DROP TABLE IF EXISTS `unhls_analyte_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_analyte_result` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `analyte_name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `analyte_result` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `ct` double(8,2) NOT NULL,
  `endpt` double(8,2) NOT NULL,
  `test_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_analyte_result_test_id_foreign` (`test_id`),
  CONSTRAINT `unhls_analyte_result_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_analyte_result`
--

LOCK TABLES `unhls_analyte_result` WRITE;
/*!40000 ALTER TABLE `unhls_analyte_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_analyte_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbactions`
--

DROP TABLE IF EXISTS `unhls_bbactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `actionname` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbactions`
--

LOCK TABLES `unhls_bbactions` WRITE;
/*!40000 ALTER TABLE `unhls_bbactions` DISABLE KEYS */;
INSERT INTO `unhls_bbactions` VALUES (1,'Reported to administration for further action','2024-12-11 17:59:42','2024-12-11 17:59:42',NULL),(2,'Referred to mental department','2024-12-11 17:59:42','2024-12-11 17:59:42',NULL),(3,'Gave first aid (e.g. arrested bleeding)','2024-12-11 17:59:42','2024-12-11 17:59:42',NULL),(4,'Referred to clinician for further management','2024-12-11 17:59:42','2024-12-11 17:59:42',NULL),(5,'Conducted risk assessment','2024-12-11 17:59:42','2024-12-11 17:59:42',NULL),(6,'Intervened to interrupt/arrest progress of incident (e.g. Used neutralizing agent, stopping a fight)','2024-12-11 17:59:42','2024-12-11 17:59:42',NULL),(7,'Disposed off broken container to designated waste bin/sharps','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(8,'Patient sample taken & referred to testing lab Isolated suspected patient','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(9,'Reported to or engaged national level BRM for intervention','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(10,'Victim counseled','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(11,'Contacted Police','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(12,'Used spill kit','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(13,'Administered PEP','2024-12-11 17:59:43','2024-12-11 17:59:43',NULL),(14,'Referred to disciplinary committee','2024-12-11 17:59:44','2024-12-11 17:59:44',NULL),(15,'Contained the spillage','2024-12-11 17:59:44','2024-12-11 17:59:44',NULL),(16,'Disinfected the place','2024-12-11 17:59:44','2024-12-11 17:59:44',NULL),(17,'Switched off the Electricity Mains','2024-12-11 17:59:44','2024-12-11 17:59:44',NULL),(18,'Washed punctured area','2024-12-11 17:59:44','2024-12-11 17:59:44',NULL),(19,'Others','2024-12-11 17:59:44','2024-12-11 17:59:44',NULL);
/*!40000 ALTER TABLE `unhls_bbactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbcauses`
--

DROP TABLE IF EXISTS `unhls_bbcauses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbcauses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `causename` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbcauses`
--

LOCK TABLES `unhls_bbcauses` WRITE;
/*!40000 ALTER TABLE `unhls_bbcauses` DISABLE KEYS */;
INSERT INTO `unhls_bbcauses` VALUES (1,'Defective Equipment','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(2,'Hazardous Chemicals','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(3,'Unsafe Procedure','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(4,'Psychological causes (e.g. emotional condition, depression, mental confusion)','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(5,'Unsafe storage of laboratory chemicals','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(6,'Lack of Skill or Knowledge','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(7,'Lack of Personal Protective Equipment','2024-12-11 17:59:45','2024-12-11 17:59:45',NULL),(8,'Unsafe Working Environment','2024-12-11 17:59:46','2024-12-11 17:59:46',NULL),(9,'Lack of Adequate Physical Security','2024-12-11 17:59:46','2024-12-11 17:59:46',NULL),(10,'Unsafe location of laboratory equipment','2024-12-11 17:59:46','2024-12-11 17:59:46',NULL),(11,'Other','2024-12-11 17:59:46','2024-12-11 17:59:46',NULL);
/*!40000 ALTER TABLE `unhls_bbcauses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences`
--

DROP TABLE IF EXISTS `unhls_bbincidences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbincidences` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int unsigned NOT NULL,
  `serial_no` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `occurrence_date` date DEFAULT NULL,
  `occurrence_time` time DEFAULT NULL,
  `personnel_id` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_surname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_othername` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_gender` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_dob` date DEFAULT NULL,
  `personnel_age` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_category` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_telephone` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `personnel_email` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nok_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nok_telephone` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nok_email` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lab_section` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `occurrence` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ulin` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `equip_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `equip_code` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `task` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `officer_fname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `officer_lname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `officer_cadre` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `officer_telephone` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `extent` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `firstaid` text COLLATE utf8mb3_unicode_ci,
  `intervention` text COLLATE utf8mb3_unicode_ci,
  `intervention_date` date DEFAULT NULL,
  `intervention_time` time DEFAULT NULL,
  `intervention_followup` text COLLATE utf8mb3_unicode_ci,
  `mo_fname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mo_lname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mo_designation` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mo_telephone` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `cause` text COLLATE utf8mb3_unicode_ci,
  `corrective_action` text COLLATE utf8mb3_unicode_ci,
  `referral_status` text COLLATE utf8mb3_unicode_ci,
  `status` text COLLATE utf8mb3_unicode_ci,
  `analysis_date` date DEFAULT NULL,
  `analysis_time` time DEFAULT NULL,
  `bo_fname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bo_lname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bo_designation` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bo_telephone` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `findings` text COLLATE utf8mb3_unicode_ci,
  `improvement_plan` text COLLATE utf8mb3_unicode_ci,
  `response_date` date DEFAULT NULL,
  `response_time` time DEFAULT NULL,
  `brm_fname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `brm_lname` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `brm_designation` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `brm_telephone` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `createdby` int unsigned DEFAULT NULL,
  `updatedby` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_facility_id_foreign` (`facility_id`),
  KEY `unhls_bbincidences_createdby_foreign` (`createdby`),
  CONSTRAINT `unhls_bbincidences_createdby_foreign` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`),
  CONSTRAINT `unhls_bbincidences_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences`
--

LOCK TABLES `unhls_bbincidences` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences_action`
--

DROP TABLE IF EXISTS `unhls_bbincidences_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbincidences_action` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bbincidence_id` int unsigned NOT NULL,
  `action_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_action_bbincidence_id_foreign` (`bbincidence_id`),
  KEY `unhls_bbincidences_action_action_id_foreign` (`action_id`),
  CONSTRAINT `unhls_bbincidences_action_action_id_foreign` FOREIGN KEY (`action_id`) REFERENCES `unhls_bbactions` (`id`),
  CONSTRAINT `unhls_bbincidences_action_bbincidence_id_foreign` FOREIGN KEY (`bbincidence_id`) REFERENCES `unhls_bbincidences` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences_action`
--

LOCK TABLES `unhls_bbincidences_action` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences_cause`
--

DROP TABLE IF EXISTS `unhls_bbincidences_cause`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbincidences_cause` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bbincidence_id` int unsigned NOT NULL,
  `cause_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_cause_bbincidence_id_foreign` (`bbincidence_id`),
  KEY `unhls_bbincidences_cause_cause_id_foreign` (`cause_id`),
  CONSTRAINT `unhls_bbincidences_cause_bbincidence_id_foreign` FOREIGN KEY (`bbincidence_id`) REFERENCES `unhls_bbincidences` (`id`),
  CONSTRAINT `unhls_bbincidences_cause_cause_id_foreign` FOREIGN KEY (`cause_id`) REFERENCES `unhls_bbcauses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences_cause`
--

LOCK TABLES `unhls_bbincidences_cause` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences_cause` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences_cause` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbincidences_nature`
--

DROP TABLE IF EXISTS `unhls_bbincidences_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbincidences_nature` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `bbincidence_id` int unsigned NOT NULL,
  `nature_id` int unsigned NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_bbincidences_nature_bbincidence_id_foreign` (`bbincidence_id`),
  KEY `unhls_bbincidences_nature_nature_id_foreign` (`nature_id`),
  CONSTRAINT `unhls_bbincidences_nature_bbincidence_id_foreign` FOREIGN KEY (`bbincidence_id`) REFERENCES `unhls_bbincidences` (`id`),
  CONSTRAINT `unhls_bbincidences_nature_nature_id_foreign` FOREIGN KEY (`nature_id`) REFERENCES `unhls_bbnatures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbincidences_nature`
--

LOCK TABLES `unhls_bbincidences_nature` WRITE;
/*!40000 ALTER TABLE `unhls_bbincidences_nature` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_bbincidences_nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_bbnatures`
--

DROP TABLE IF EXISTS `unhls_bbnatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_bbnatures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `priority` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_bbnatures`
--

LOCK TABLES `unhls_bbnatures` WRITE;
/*!40000 ALTER TABLE `unhls_bbnatures` DISABLE KEYS */;
INSERT INTO `unhls_bbnatures` VALUES (1,'Assault/Fight among staff','Physical','Minor',NULL,'2024-12-11 17:59:46','2024-12-11 17:59:46'),(2,'Fainting','Physical','Minor',NULL,'2024-12-11 17:59:46','2024-12-11 17:59:46'),(3,'Roof leakages','Physical','Minor',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(4,'Machine cuts/bruises','Mechanical','Minor',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(5,'Electric shock/burn','Mechanical','Major',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(6,'Death within lab','Ergonometric and Medical','Major',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(7,'Slip or fall','Physical','Minor',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(8,'Unnecessary destruction of lab material','Physical','Minor',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(9,'Theft of laboratory consumables','Physical','Minor',NULL,'2024-12-11 17:59:47','2024-12-11 17:59:47'),(10,'Breakage of sample container','Physical','Minor',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(11,'Prick/cut by unused sharps','Physical','Minor',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(12,'Injury caused by laboratory objects','Physical','Minor',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(13,'Chemical burn','Chemical','Minor',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(14,'Theft of chemical','Chemical','Minor',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(15,'Chemical spillage','Chemical','Major',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(16,'Theft of equipment','Physical','Major',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(17,'Attack on the Lab','Physical','Major',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(18,'Collapsing building','Physical','Major',NULL,'2024-12-11 17:59:48','2024-12-11 17:59:48'),(19,'Bike rider accident','Physical','Major',NULL,'2024-12-11 17:59:49','2024-12-11 17:59:49'),(20,'Fire','Physical','Major',NULL,'2024-12-11 17:59:49','2024-12-11 17:59:49'),(21,'Needle prick or cuts by used sharps','Biological','Minor',NULL,'2024-12-11 17:59:49','2024-12-11 17:59:49'),(22,'Sample spillage','Biological','Minor',NULL,'2024-12-11 17:59:49','2024-12-11 17:59:49'),(23,'Theft of samples','Biological','Major',NULL,'2024-12-11 17:59:49','2024-12-11 17:59:49'),(24,'Contact with VHF suspect','Biological','Major',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(25,'Contact with radiological materials','Radiological','Major',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(26,'Theft of radiological materials','Radiological','Major',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(27,'Poor disposal of radiological materials','Radiological','Major',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(28,'Poor vision from inadequate light','Ergonometric and Medical','Minor',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(29,'Back pain from posture effects','Ergonometric and Medical','Minor',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(30,'Other occupational hazard','Ergonometric and Medical','Minor',NULL,'2024-12-11 17:59:50','2024-12-11 17:59:50'),(31,'Other','Other','Other',NULL,'2024-12-11 17:59:51','2024-12-11 17:59:51');
/*!40000 ALTER TABLE `unhls_bbnatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_districts`
--

DROP TABLE IF EXISTS `unhls_districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_districts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_districts`
--

LOCK TABLES `unhls_districts` WRITE;
/*!40000 ALTER TABLE `unhls_districts` DISABLE KEYS */;
INSERT INTO `unhls_districts` VALUES (1,'Kampala','2024-12-11 17:59:24','2024-12-11 17:59:24'),(2,'Buikwe','2024-12-11 17:59:24','2024-12-11 17:59:24'),(3,'Bukomansimbi','2024-12-11 17:59:24','2024-12-11 17:59:24'),(4,'Butambala','2024-12-11 17:59:24','2024-12-11 17:59:24'),(5,'Buvuma','2024-12-11 17:59:25','2024-12-11 17:59:25'),(6,'Gomba','2024-12-11 17:59:25','2024-12-11 17:59:25'),(7,'Kalangala','2024-12-11 17:59:25','2024-12-11 17:59:25'),(8,'Kalungu','2024-12-11 17:59:25','2024-12-11 17:59:25'),(9,'Kayunga','2024-12-11 17:59:25','2024-12-11 17:59:25'),(10,'Kiboga','2024-12-11 17:59:25','2024-12-11 17:59:25'),(11,'Kyankwanzi','2024-12-11 17:59:25','2024-12-11 17:59:25'),(12,'Luweero','2024-12-11 17:59:26','2024-12-11 17:59:26'),(13,'Lwengo','2024-12-11 17:59:26','2024-12-11 17:59:26'),(14,'Lyantonde','2024-12-11 17:59:26','2024-12-11 17:59:26'),(15,'Masaka','2024-12-11 17:59:26','2024-12-11 17:59:26'),(16,'Mityana','2024-12-11 17:59:26','2024-12-11 17:59:26'),(17,'Mpigi','2024-12-11 17:59:26','2024-12-11 17:59:26'),(18,'Mubende','2024-12-11 17:59:26','2024-12-11 17:59:26'),(19,'Mukono','2024-12-11 17:59:27','2024-12-11 17:59:27'),(20,'Nakaseke','2024-12-11 17:59:27','2024-12-11 17:59:27'),(21,'Nakasongola','2024-12-11 17:59:27','2024-12-11 17:59:27'),(22,'Rakai','2024-12-11 17:59:27','2024-12-11 17:59:27'),(23,'Ssembabule','2024-12-11 17:59:27','2024-12-11 17:59:27'),(24,'Wakiso','2024-12-11 17:59:27','2024-12-11 17:59:27'),(25,'Amuria','2024-12-11 17:59:27','2024-12-11 17:59:27'),(26,'Budaka','2024-12-11 17:59:27','2024-12-11 17:59:27'),(27,'Bududa','2024-12-11 17:59:28','2024-12-11 17:59:28'),(28,'Bugiri','2024-12-11 17:59:28','2024-12-11 17:59:28'),(29,'Bukedea','2024-12-11 17:59:28','2024-12-11 17:59:28'),(30,'Bukwa','2024-12-11 17:59:28','2024-12-11 17:59:28'),(31,'Bulambuli','2024-12-11 17:59:28','2024-12-11 17:59:28'),(32,'Busia','2024-12-11 17:59:28','2024-12-11 17:59:28'),(33,'Butaleja','2024-12-11 17:59:28','2024-12-11 17:59:28'),(34,'Buyende','2024-12-11 17:59:28','2024-12-11 17:59:28'),(35,'Iganga','2024-12-11 17:59:29','2024-12-11 17:59:29'),(36,'Jinja','2024-12-11 17:59:29','2024-12-11 17:59:29'),(37,'Kaberamaido','2024-12-11 17:59:29','2024-12-11 17:59:29'),(38,'Kaliro','2024-12-11 17:59:29','2024-12-11 17:59:29'),(39,'Kamuli','2024-12-11 17:59:29','2024-12-11 17:59:29'),(40,'Kapchorwa','2024-12-11 17:59:29','2024-12-11 17:59:29'),(41,'Katakwi','2024-12-11 17:59:29','2024-12-11 17:59:29'),(42,'Kibuku','2024-12-11 17:59:30','2024-12-11 17:59:30'),(43,'Kumi','2024-12-11 17:59:30','2024-12-11 17:59:30'),(44,'Kween','2024-12-11 17:59:30','2024-12-11 17:59:30'),(45,'Luuka','2024-12-11 17:59:30','2024-12-11 17:59:30'),(46,'Manafwa','2024-12-11 17:59:30','2024-12-11 17:59:30'),(47,'Mayuge','2024-12-11 17:59:30','2024-12-11 17:59:30'),(48,'Mbale','2024-12-11 17:59:31','2024-12-11 17:59:31'),(49,'Namayingo','2024-12-11 17:59:31','2024-12-11 17:59:31'),(50,'Namutumba','2024-12-11 17:59:31','2024-12-11 17:59:31'),(51,'Ngora','2024-12-11 17:59:31','2024-12-11 17:59:31'),(52,'Pallisa','2024-12-11 17:59:31','2024-12-11 17:59:31'),(53,'Serere','2024-12-11 17:59:31','2024-12-11 17:59:31'),(54,'Sironko','2024-12-11 17:59:32','2024-12-11 17:59:32'),(55,'Soroti','2024-12-11 17:59:32','2024-12-11 17:59:32'),(56,'Tororo','2024-12-11 17:59:32','2024-12-11 17:59:32'),(57,'Abim','2024-12-11 17:59:32','2024-12-11 17:59:32'),(58,'Adjumani','2024-12-11 17:59:32','2024-12-11 17:59:32'),(59,'Agago','2024-12-11 17:59:32','2024-12-11 17:59:32'),(60,'Alebtong','2024-12-11 17:59:32','2024-12-11 17:59:32'),(61,'Amolatar','2024-12-11 17:59:32','2024-12-11 17:59:32'),(62,'Amudat','2024-12-11 17:59:33','2024-12-11 17:59:33'),(63,'Amuru','2024-12-11 17:59:33','2024-12-11 17:59:33'),(64,'Apac','2024-12-11 17:59:33','2024-12-11 17:59:33'),(65,'Arua','2024-12-11 17:59:33','2024-12-11 17:59:33'),(66,'Dokolo','2024-12-11 17:59:33','2024-12-11 17:59:33'),(67,'Gulu','2024-12-11 17:59:33','2024-12-11 17:59:33'),(68,'Kaabong','2024-12-11 17:59:33','2024-12-11 17:59:33'),(69,'Kitgum','2024-12-11 17:59:33','2024-12-11 17:59:33'),(70,'Koboko','2024-12-11 17:59:33','2024-12-11 17:59:33'),(71,'Kole','2024-12-11 17:59:34','2024-12-11 17:59:34'),(72,'Kotido','2024-12-11 17:59:34','2024-12-11 17:59:34'),(73,'Lamwo','2024-12-11 17:59:34','2024-12-11 17:59:34'),(74,'Lira','2024-12-11 17:59:34','2024-12-11 17:59:34'),(75,'Maracha','2024-12-11 17:59:34','2024-12-11 17:59:34'),(76,'Moroto','2024-12-11 17:59:34','2024-12-11 17:59:34'),(77,'Moyo','2024-12-11 17:59:34','2024-12-11 17:59:34'),(78,'Nakapiripirit','2024-12-11 17:59:35','2024-12-11 17:59:35'),(79,'Napak','2024-12-11 17:59:35','2024-12-11 17:59:35'),(80,'Nebbi','2024-12-11 17:59:35','2024-12-11 17:59:35'),(81,'Nwoya','2024-12-11 17:59:35','2024-12-11 17:59:35'),(82,'Otuke','2024-12-11 17:59:35','2024-12-11 17:59:35'),(83,'Oyam','2024-12-11 17:59:35','2024-12-11 17:59:35'),(84,'Pader','2024-12-11 17:59:35','2024-12-11 17:59:35'),(85,'Yumbe','2024-12-11 17:59:35','2024-12-11 17:59:35'),(86,'Zombo','2024-12-11 17:59:36','2024-12-11 17:59:36'),(87,'Buhweju','2024-12-11 17:59:36','2024-12-11 17:59:36'),(88,'Buliisa','2024-12-11 17:59:36','2024-12-11 17:59:36'),(89,'Bundibugyo','2024-12-11 17:59:36','2024-12-11 17:59:36'),(90,'Bushenyi','2024-12-11 17:59:36','2024-12-11 17:59:36'),(91,'Hoima','2024-12-11 17:59:36','2024-12-11 17:59:36'),(92,'Ibanda','2024-12-11 17:59:36','2024-12-11 17:59:36'),(93,'Isingiro','2024-12-11 17:59:36','2024-12-11 17:59:36'),(94,'Kabale','2024-12-11 17:59:37','2024-12-11 17:59:37'),(95,'Kabarole','2024-12-11 17:59:37','2024-12-11 17:59:37'),(96,'Kamwenge','2024-12-11 17:59:37','2024-12-11 17:59:37'),(97,'Kanungu','2024-12-11 17:59:37','2024-12-11 17:59:37'),(98,'Kasese','2024-12-11 17:59:37','2024-12-11 17:59:37'),(99,'Kibaale','2024-12-11 17:59:37','2024-12-11 17:59:37'),(100,'Kiruhura','2024-12-11 17:59:37','2024-12-11 17:59:37'),(101,'Kiryandongo','2024-12-11 17:59:37','2024-12-11 17:59:37'),(102,'Kisoro','2024-12-11 17:59:38','2024-12-11 17:59:38'),(103,'Kyegegwa','2024-12-11 17:59:38','2024-12-11 17:59:38'),(104,'Kyenjojo','2024-12-11 17:59:38','2024-12-11 17:59:38'),(105,'Masindi','2024-12-11 17:59:38','2024-12-11 17:59:38'),(106,'Mbarara','2024-12-11 17:59:38','2024-12-11 17:59:38'),(107,'Mitooma','2024-12-11 17:59:38','2024-12-11 17:59:38'),(108,'Ntoroko','2024-12-11 17:59:38','2024-12-11 17:59:38'),(109,'Ntungamo','2024-12-11 17:59:39','2024-12-11 17:59:39'),(110,'Rubirizi','2024-12-11 17:59:39','2024-12-11 17:59:39'),(111,'Rukungiri','2024-12-11 17:59:39','2024-12-11 17:59:39'),(112,'Sheema','2024-12-11 17:59:39','2024-12-11 17:59:39'),(113,'Omoro','2024-12-11 17:59:39','2024-12-11 17:59:39'),(114,'Kagadi','2024-12-11 17:59:40','2024-12-11 17:59:40'),(115,'Kakumiro','2024-12-11 17:59:40','2024-12-11 17:59:40'),(116,'Rubanda','2024-12-11 17:59:40','2024-12-11 17:59:40'),(117,'Bukwo','2024-12-11 17:59:40','2024-12-11 17:59:40');
/*!40000 ALTER TABLE `unhls_districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_drugs`
--

DROP TABLE IF EXISTS `unhls_drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_drugs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `formulation` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `strength` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `pack_size` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `unit_of_issue` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `amc` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `max_stock_level` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `min_stock_level` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_drugs`
--

LOCK TABLES `unhls_drugs` WRITE;
/*!40000 ALTER TABLE `unhls_drugs` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_breakdown`
--

DROP TABLE IF EXISTS `unhls_equipment_breakdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_equipment_breakdown` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `facility_id` int unsigned NOT NULL,
  `year_id` int unsigned NOT NULL,
  `equipment_id` int unsigned NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `action_taken` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `hsd_request` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `in_charge_id` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `report_date` datetime DEFAULT NULL,
  `restored_by` int DEFAULT NULL,
  `restore_date` datetime DEFAULT NULL,
  `comment` longtext COLLATE utf8mb3_unicode_ci,
  `breakdown_type` int DEFAULT NULL,
  `reported_by` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `breakdown_date` datetime DEFAULT NULL,
  `facility_code` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `facility_level` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `equipment_code` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `equipment_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `problem` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `equipment_failure` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reporting_officer` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reporting_officer_contact` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reporting_officer_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `intervention_required` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT '0',
  `dispatched_to` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dispatch_date` date DEFAULT NULL,
  `intervention_authority` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `conclusion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `verified_by` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verification_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_equipment_breakdown_district_id_foreign` (`district_id`),
  KEY `unhls_equipment_breakdown_facility_id_foreign` (`facility_id`),
  KEY `unhls_equipment_breakdown_year_id_foreign` (`year_id`),
  KEY `unhls_equipment_breakdown_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `unhls_equipment_breakdown_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_equipment_breakdown_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `unhls_equipment_inventory` (`id`),
  CONSTRAINT `unhls_equipment_breakdown_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_equipment_breakdown_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_breakdown`
--

LOCK TABLES `unhls_equipment_breakdown` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_breakdown` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_breakdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_inventory`
--

DROP TABLE IF EXISTS `unhls_equipment_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_equipment_inventory` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `facility_id` int unsigned NOT NULL,
  `year_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name_id` int DEFAULT NULL,
  `unique_number` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `serial_number` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `location` int NOT NULL,
  `procurement_type` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `purchase_date` datetime NOT NULL,
  `delivery_date` datetime NOT NULL,
  `verification_date` datetime NOT NULL,
  `installation_date` datetime NOT NULL,
  `spare_parts` tinyint(1) NOT NULL,
  `warranty` int NOT NULL,
  `life_span` int NOT NULL,
  `service_frequency` tinyint(1) NOT NULL,
  `service_contract` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_equipment_inventory_district_id_foreign` (`district_id`),
  KEY `unhls_equipment_inventory_facility_id_foreign` (`facility_id`),
  KEY `unhls_equipment_inventory_year_id_foreign` (`year_id`),
  CONSTRAINT `unhls_equipment_inventory_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_equipment_inventory_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_equipment_inventory_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_inventory`
--

LOCK TABLES `unhls_equipment_inventory` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_maintenance`
--

DROP TABLE IF EXISTS `unhls_equipment_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_equipment_maintenance` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `facility_id` int unsigned NOT NULL,
  `year_id` int unsigned NOT NULL,
  `equipment_id` int unsigned NOT NULL,
  `last_service_date` datetime NOT NULL,
  `next_service_date` datetime NOT NULL,
  `serviced_by_name` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `serviced_by_contact` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `supplier_id` int NOT NULL,
  `comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_equipment_maintenance_district_id_foreign` (`district_id`),
  KEY `unhls_equipment_maintenance_facility_id_foreign` (`facility_id`),
  KEY `unhls_equipment_maintenance_year_id_foreign` (`year_id`),
  KEY `unhls_equipment_maintenance_equipment_id_foreign` (`equipment_id`),
  CONSTRAINT `unhls_equipment_maintenance_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_equipment_maintenance_equipment_id_foreign` FOREIGN KEY (`equipment_id`) REFERENCES `unhls_equipment_inventory` (`id`),
  CONSTRAINT `unhls_equipment_maintenance_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_equipment_maintenance_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_maintenance`
--

LOCK TABLES `unhls_equipment_maintenance` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_equipment_suppliers`
--

DROP TABLE IF EXISTS `unhls_equipment_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_equipment_suppliers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_equipment_suppliers`
--

LOCK TABLES `unhls_equipment_suppliers` WRITE;
/*!40000 ALTER TABLE `unhls_equipment_suppliers` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_equipment_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_facilities`
--

DROP TABLE IF EXISTS `unhls_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_facilities` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dhis2_name` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `district_id` int unsigned NOT NULL,
  `district_name` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `level_id` int unsigned NOT NULL,
  `ownership_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address` text COLLATE utf8mb3_unicode_ci,
  `email` text COLLATE utf8mb3_unicode_ci,
  `contact` text COLLATE utf8mb3_unicode_ci,
  `last_activity_timestamp` timestamp NOT NULL,
  `org_logo` text COLLATE utf8mb3_unicode_ci,
  `org_stamp` text COLLATE utf8mb3_unicode_ci,
  `certificate_info` text COLLATE utf8mb3_unicode_ci,
  `facility_report` text COLLATE utf8mb3_unicode_ci,
  `facility_request_form` text COLLATE utf8mb3_unicode_ci,
  `customized_login_page` text COLLATE utf8mb3_unicode_ci,
  `ulin_code` int DEFAULT NULL,
  `separator` varchar(3) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `version` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `country` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `longitude` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `latitude` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `emr_connect` varchar(300) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `emr_reject` varchar(300) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `last_updated_at` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_facilities_level_id_foreign` (`level_id`),
  KEY `unhls_facilities_district_id_foreign` (`district_id`),
  KEY `unhls_facilities_ownership_id_foreign` (`ownership_id`),
  CONSTRAINT `unhls_facilities_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_facilities_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `unhls_facility_level` (`id`),
  CONSTRAINT `unhls_facilities_ownership_id_foreign` FOREIGN KEY (`ownership_id`) REFERENCES `unhls_facility_ownership` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2407 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_facilities`
--

LOCK TABLES `unhls_facilities` WRITE;
/*!40000 ALTER TABLE `unhls_facilities` DISABLE KEYS */;
INSERT INTO `unhls_facilities` VALUES (2406,'NHLDS','CPHL',NULL,1,NULL,1,1,'2024-12-11 17:59:41','2024-12-11 17:59:41',NULL,NULL,NULL,'2024-12-11 18:21:09','/i/coat_of_arms.png',NULL,NULL,'reports.patient.standard','reports.patient.request_form',NULL,2,'-',NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `unhls_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_facility_level`
--

DROP TABLE IF EXISTS `unhls_facility_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_facility_level` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `level` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_facility_level`
--

LOCK TABLES `unhls_facility_level` WRITE;
/*!40000 ALTER TABLE `unhls_facility_level` DISABLE KEYS */;
INSERT INTO `unhls_facility_level` VALUES (1,'Public NRH','2024-12-11 17:59:40','2024-12-11 17:59:40'),(2,'Public RRH','2024-12-11 17:59:41','2024-12-11 17:59:41'),(3,'Public GH','2024-12-11 17:59:41','2024-12-11 17:59:41'),(4,'Public HCIV','2024-12-11 17:59:41','2024-12-11 17:59:41'),(5,'Public HCIII','2024-12-11 17:59:41','2024-12-11 17:59:41'),(6,'Hospital','2024-12-11 17:59:41','2024-12-11 17:59:41');
/*!40000 ALTER TABLE `unhls_facility_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_facility_ownership`
--

DROP TABLE IF EXISTS `unhls_facility_ownership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_facility_ownership` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_facility_ownership`
--

LOCK TABLES `unhls_facility_ownership` WRITE;
/*!40000 ALTER TABLE `unhls_facility_ownership` DISABLE KEYS */;
INSERT INTO `unhls_facility_ownership` VALUES (1,'Public','2024-12-11 17:59:40','2024-12-11 17:59:40'),(2,'PFP','2024-12-11 17:59:40','2024-12-11 17:59:40'),(3,'PNFP','2024-12-11 17:59:40','2024-12-11 17:59:40'),(4,'Other','2024-12-11 17:59:40','2024-12-11 17:59:40');
/*!40000 ALTER TABLE `unhls_facility_ownership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_financial_years`
--

DROP TABLE IF EXISTS `unhls_financial_years`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_financial_years` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `year` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_financial_years`
--

LOCK TABLES `unhls_financial_years` WRITE;
/*!40000 ALTER TABLE `unhls_financial_years` DISABLE KEYS */;
INSERT INTO `unhls_financial_years` VALUES (1,'2022/2023','2024-12-11 18:15:26','2024-12-11 18:15:26'),(2,'2020/2021','2019-12-31 21:00:01','2019-12-31 21:00:01');
/*!40000 ALTER TABLE `unhls_financial_years` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_patients`
--

DROP TABLE IF EXISTS `unhls_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_patients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_number` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ulin` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nin` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `gender` tinyint NOT NULL DEFAULT '0',
  `admission_date` datetime DEFAULT NULL,
  `nationality` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `village_residence` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `district_residence` int unsigned DEFAULT NULL,
  `village_workplace` varchar(150) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `district_workplace` int unsigned DEFAULT NULL,
  `phone_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `occupation` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `external_patient_number` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int unsigned NOT NULL DEFAULT '0',
  `name2` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `revised2` int DEFAULT NULL,
  `name3` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `revised3` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_micro` int unsigned NOT NULL DEFAULT '0',
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_patients_external_patient_number_index` (`external_patient_number`),
  KEY `unhls_patients_created_by_index` (`created_by`),
  KEY `unhls_patients_district_residence_foreign` (`district_residence`),
  KEY `unhls_patients_district_workplace_foreign` (`district_workplace`),
  CONSTRAINT `unhls_patients_district_residence_foreign` FOREIGN KEY (`district_residence`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_patients_district_workplace_foreign` FOREIGN KEY (`district_workplace`) REFERENCES `unhls_districts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_patients`
--

LOCK TABLES `unhls_patients` WRITE;
/*!40000 ALTER TABLE `unhls_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_recalled_test_results`
--

DROP TABLE IF EXISTS `unhls_recalled_test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_recalled_test_results` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int unsigned NOT NULL,
  `drug_id` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_recalled_test_results_patient_id_foreign` (`patient_id`),
  KEY `unhls_recalled_test_results_drug_id_foreign` (`drug_id`),
  CONSTRAINT `unhls_recalled_test_results_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `unhls_recalled_test_results_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `unhls_patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_recalled_test_results`
--

LOCK TABLES `unhls_recalled_test_results` WRITE;
/*!40000 ALTER TABLE `unhls_recalled_test_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_recalled_test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_rejection_reasons`
--

DROP TABLE IF EXISTS `unhls_rejection_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_rejection_reasons` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_rejection_reasons`
--

LOCK TABLES `unhls_rejection_reasons` WRITE;
/*!40000 ALTER TABLE `unhls_rejection_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_rejection_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_staff`
--

DROP TABLE IF EXISTS `unhls_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_staff` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int unsigned NOT NULL,
  `firstName` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastName` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_staff_facility_id_foreign` (`facility_id`),
  CONSTRAINT `unhls_staff_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_staff`
--

LOCK TABLES `unhls_staff` WRITE;
/*!40000 ALTER TABLE `unhls_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_stockcard`
--

DROP TABLE IF EXISTS `unhls_stockcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_stockcard` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `facility_id` int unsigned NOT NULL,
  `year_id` int unsigned NOT NULL,
  `commodity_id` int unsigned NOT NULL,
  `to_from` int NOT NULL,
  `to_from_type` int NOT NULL,
  `voucher_number` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `action` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch_number` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `issue_date` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `initials` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `balance` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transaction_date` datetime DEFAULT NULL,
  `quantity_in` int DEFAULT NULL,
  `quantity_out` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_stockcard_district_id_foreign` (`district_id`),
  KEY `unhls_stockcard_facility_id_foreign` (`facility_id`),
  KEY `unhls_stockcard_year_id_foreign` (`year_id`),
  KEY `unhls_stockcard_commodity_id_foreign` (`commodity_id`),
  CONSTRAINT `unhls_stockcard_commodity_id_foreign` FOREIGN KEY (`commodity_id`) REFERENCES `commodities` (`id`),
  CONSTRAINT `unhls_stockcard_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_stockcard_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_stockcard_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_stockcard`
--

LOCK TABLES `unhls_stockcard` WRITE;
/*!40000 ALTER TABLE `unhls_stockcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_stockcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_stockrequisition`
--

DROP TABLE IF EXISTS `unhls_stockrequisition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_stockrequisition` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `district_id` int unsigned NOT NULL,
  `facility_id` int unsigned NOT NULL,
  `year_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  `issued_to` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `voucher_number` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity_required` int NOT NULL,
  `quantity_issued` int NOT NULL,
  `issue_date` datetime NOT NULL,
  `remarks` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_stockrequisition_district_id_foreign` (`district_id`),
  KEY `unhls_stockrequisition_facility_id_foreign` (`facility_id`),
  KEY `unhls_stockrequisition_year_id_foreign` (`year_id`),
  KEY `unhls_stockrequisition_item_id_foreign` (`item_id`),
  CONSTRAINT `unhls_stockrequisition_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `unhls_districts` (`id`),
  CONSTRAINT `unhls_stockrequisition_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`),
  CONSTRAINT `unhls_stockrequisition_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `commodities` (`id`),
  CONSTRAINT `unhls_stockrequisition_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `unhls_financial_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_stockrequisition`
--

LOCK TABLES `unhls_stockrequisition` WRITE;
/*!40000 ALTER TABLE `unhls_stockrequisition` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_stockrequisition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_test_results`
--

DROP TABLE IF EXISTS `unhls_test_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_test_results` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `test_id` int unsigned NOT NULL,
  `measure_id` int unsigned NOT NULL,
  `result` varchar(1000) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time_entered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sample_id` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `revised_result` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `revised_by2` int DEFAULT NULL,
  `revised_by` int DEFAULT NULL,
  `time_revised` date DEFAULT NULL,
  `uploaded` int NOT NULL DEFAULT '0',
  `color_code` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unhls_test_results_test_id_measure_id_unique` (`test_id`,`measure_id`),
  KEY `unhls_test_results_measure_id_foreign` (`measure_id`),
  CONSTRAINT `unhls_test_results_measure_id_foreign` FOREIGN KEY (`measure_id`) REFERENCES `measures` (`id`),
  CONSTRAINT `unhls_test_results_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `unhls_tests` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_test_results`
--

LOCK TABLES `unhls_test_results` WRITE;
/*!40000 ALTER TABLE `unhls_test_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_test_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_testpurposes`
--

DROP TABLE IF EXISTS `unhls_testpurposes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_testpurposes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_testpurposes`
--

LOCK TABLES `unhls_testpurposes` WRITE;
/*!40000 ALTER TABLE `unhls_testpurposes` DISABLE KEYS */;
INSERT INTO `unhls_testpurposes` VALUES (1,'Routine Testing','Normal Samples','2024-12-11 18:13:44','2024-12-11 18:13:44'),(2,'Surveillance','research','2024-12-11 18:13:44','2024-12-11 18:13:44'),(3,'Outbreak','facility outbreak','2024-12-11 18:13:44','2024-12-11 18:13:44'),(4,'Innitial Outbreak Screenning','Outbreak','2024-12-11 18:13:44','2024-12-11 18:13:44');
/*!40000 ALTER TABLE `unhls_testpurposes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_tests`
--

DROP TABLE IF EXISTS `unhls_tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_tests` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `emrtestid` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `from_eafya` int NOT NULL DEFAULT '0',
  `emr_service_request_id` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `visit_id` bigint unsigned NOT NULL,
  `urgency_id` int DEFAULT NULL,
  `test_type_id` int unsigned NOT NULL,
  `specimen_id` int unsigned DEFAULT NULL,
  `interpretation` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `test_status_id` int unsigned NOT NULL DEFAULT '0',
  `created_by` int unsigned NOT NULL,
  `tested_by` int unsigned NOT NULL DEFAULT '0',
  `verified_by` int unsigned NOT NULL DEFAULT '0',
  `requested_by` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `clinician_id` int unsigned DEFAULT NULL,
  `purpose` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `time_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_started` timestamp NULL DEFAULT NULL,
  `time_completed` timestamp NULL DEFAULT NULL,
  `time_verified` timestamp NULL DEFAULT NULL,
  `time_printed` timestamp NULL DEFAULT NULL,
  `time_sent` timestamp NULL DEFAULT NULL,
  `external_id` int DEFAULT NULL,
  `instrument` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instrument_id` int DEFAULT NULL,
  `approved_by` int unsigned DEFAULT NULL,
  `time_approved` timestamp NULL DEFAULT NULL,
  `revised_by` int DEFAULT NULL,
  `time_revised` date DEFAULT NULL,
  `restrack_barcode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `method_used` varchar(60) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `unhls_tests_created_by_index` (`created_by`),
  KEY `unhls_tests_tested_by_index` (`tested_by`),
  KEY `unhls_tests_verified_by_index` (`verified_by`),
  KEY `unhls_tests_visit_id_foreign` (`visit_id`),
  KEY `unhls_tests_test_type_id_foreign` (`test_type_id`),
  KEY `unhls_tests_specimen_id_foreign` (`specimen_id`),
  KEY `unhls_tests_test_status_id_foreign` (`test_status_id`),
  CONSTRAINT `unhls_tests_specimen_id_foreign` FOREIGN KEY (`specimen_id`) REFERENCES `specimens` (`id`),
  CONSTRAINT `unhls_tests_test_status_id_foreign` FOREIGN KEY (`test_status_id`) REFERENCES `test_statuses` (`id`),
  CONSTRAINT `unhls_tests_test_type_id_foreign` FOREIGN KEY (`test_type_id`) REFERENCES `test_types` (`id`),
  CONSTRAINT `unhls_tests_visit_id_foreign` FOREIGN KEY (`visit_id`) REFERENCES `unhls_visits` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_tests`
--

LOCK TABLES `unhls_tests` WRITE;
/*!40000 ALTER TABLE `unhls_tests` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_visits`
--

DROP TABLE IF EXISTS `unhls_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_visits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `opd_ipd_no` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `patient_id` int unsigned NOT NULL,
  `visit_type` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Out-patient',
  `visit_number` int unsigned DEFAULT NULL,
  `lab_number` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `visit_lab_number` varchar(25) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `facility_id` int unsigned DEFAULT NULL,
  `facility_lab_number` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `is_printed` int NOT NULL DEFAULT '0',
  `printed_by` int DEFAULT NULL,
  `time_printed` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ward_id` int DEFAULT NULL,
  `is_microb` int NOT NULL DEFAULT '0',
  `bed_no` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `d_residence` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `d_workplace` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_email` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_address` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `v_residence` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `v_workplace` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_tel` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `current_occupation` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `visit_status_id` int DEFAULT NULL,
  `hospitalized` int unsigned DEFAULT NULL,
  `urgency` int DEFAULT NULL,
  `on_antibiotics` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unhls_visits_visit_number_index` (`visit_number`),
  KEY `unhls_visits_patient_id_foreign` (`patient_id`),
  KEY `unhls_visits_facility_id_foreign` (`facility_id`),
  CONSTRAINT `unhls_visits_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `facilities` (`id`),
  CONSTRAINT `unhls_visits_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `unhls_patients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_visits`
--

LOCK TABLES `unhls_visits` WRITE;
/*!40000 ALTER TABLE `unhls_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unhls_warehouse`
--

DROP TABLE IF EXISTS `unhls_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unhls_warehouse` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unhls_warehouse`
--

LOCK TABLES `unhls_warehouse` WRITE;
/*!40000 ALTER TABLE `unhls_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `unhls_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `eafya_uuid` int DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `gender` tinyint NOT NULL DEFAULT '0',
  `designation` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `signature` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `facility_id` int unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `phone_contact` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_facility_id_foreign` (`facility_id`),
  CONSTRAINT `users_facility_id_foreign` FOREIGN KEY (`facility_id`) REFERENCES `unhls_facilities` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'administrator','$2y$10$rqMdWf9mJXGdH0cxxdHZ3ONOOn/Tps/p3r5x7d6PLv3Rg6Vu0Fj6m','','A-LIS Admin',0,'Systems Administrator',NULL,NULL,NULL,2406,NULL,'2024-12-11 17:59:42','2024-12-11 17:59:42',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uuids`
--

DROP TABLE IF EXISTS `uuids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uuids` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `counter` int unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uuids`
--

LOCK TABLES `uuids` WRITE;
/*!40000 ALTER TABLE `uuids` DISABLE KEYS */;
/*!40000 ALTER TABLE `uuids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viral_load_details`
--

DROP TABLE IF EXISTS `viral_load_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viral_load_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `facility_id` int DEFAULT NULL,
  `patient_id` int NOT NULL,
  `referral_reason` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `form_number` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `initiation_date` date DEFAULT NULL,
  `duration_on_current_regimen` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `who_stage` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `anc` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mother_pregnant` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `mother_breastfeeding` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `active_tb` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tb_phase` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `arv_adherence` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `care_approach` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `indication` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `regiment` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `treatment_line` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uploaded` int NOT NULL DEFAULT '0',
  `test_date` date NOT NULL,
  `poc_device` varchar(191) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viral_load_details`
--

LOCK TABLES `viral_load_details` WRITE;
/*!40000 ALTER TABLE `viral_load_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `viral_load_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit_statuses`
--

DROP TABLE IF EXISTS `visit_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_statuses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit_statuses`
--

LOCK TABLES `visit_statuses` WRITE;
/*!40000 ALTER TABLE `visit_statuses` DISABLE KEYS */;
INSERT INTO `visit_statuses` VALUES (1,'appointment-made','2024-12-11 18:07:13','2024-12-11 18:07:13'),(2,'test-request-made','2024-12-11 18:07:13','2024-12-11 18:07:13'),(3,'specimen_received','2024-12-11 18:07:13','2024-12-11 18:07:13'),(4,'tests-completed','2024-12-11 18:07:13','2024-12-11 18:07:13');
/*!40000 ALTER TABLE `visit_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ward_type`
--

DROP TABLE IF EXISTS `ward_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ward_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ward_type`
--

LOCK TABLES `ward_type` WRITE;
/*!40000 ALTER TABLE `ward_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ward_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wards`
--

DROP TABLE IF EXISTS `wards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ward_type_id` int DEFAULT NULL,
  `emr_ward_id` int DEFAULT NULL,
  `added_by_emr` int NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wards`
--

LOCK TABLES `wards` WRITE;
/*!40000 ALTER TABLE `wards` DISABLE KEYS */;
/*!40000 ALTER TABLE `wards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone_diameters`
--

DROP TABLE IF EXISTS `zone_diameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone_diameters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `drug_id` int unsigned NOT NULL,
  `organism_id` int unsigned NOT NULL,
  `resistant_max` decimal(4,1) DEFAULT NULL,
  `intermediate_min` decimal(4,1) DEFAULT NULL,
  `intermediate_max` decimal(4,1) DEFAULT NULL,
  `sensitive_min` decimal(4,1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `zone_diameters_drug_id_foreign` (`drug_id`),
  KEY `zone_diameters_organism_id_foreign` (`organism_id`),
  CONSTRAINT `zone_diameters_drug_id_foreign` FOREIGN KEY (`drug_id`) REFERENCES `drugs` (`id`),
  CONSTRAINT `zone_diameters_organism_id_foreign` FOREIGN KEY (`organism_id`) REFERENCES `organisms` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1314 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone_diameters`
--

LOCK TABLES `zone_diameters` WRITE;
/*!40000 ALTER TABLE `zone_diameters` DISABLE KEYS */;
INSERT INTO `zone_diameters` VALUES (1,1,1,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(2,2,2,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(3,3,2,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(4,4,2,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(5,5,2,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(6,6,2,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(7,7,2,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(8,8,2,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(9,9,2,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(10,10,2,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(11,11,2,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(12,12,2,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(13,13,2,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(14,14,2,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(15,15,2,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(16,16,2,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(17,17,2,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(18,18,2,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(19,19,2,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(20,20,2,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(21,2,3,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(22,8,3,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(23,9,3,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(24,21,3,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(25,13,3,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(26,12,3,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(27,10,3,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(28,11,3,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(29,6,3,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(30,7,3,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(31,5,3,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(32,22,3,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(33,18,3,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(34,17,3,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(35,14,3,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(36,16,3,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(37,19,3,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(38,18,1,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(39,17,1,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(40,5,1,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(41,22,1,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(42,13,1,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(43,11,1,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(44,14,1,13.0,14.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(45,15,1,13.0,14.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(46,23,1,10.0,NULL,NULL,12.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(57,1,5,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(58,22,5,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(59,5,5,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(60,11,5,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(61,23,5,10.0,NULL,NULL,11.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(62,13,5,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(63,14,5,13.0,14.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(64,15,5,13.0,14.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(65,17,5,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(66,18,5,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(67,1,6,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(68,22,6,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(69,5,6,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(70,11,6,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(71,23,6,10.0,NULL,NULL,11.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(72,13,6,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(73,14,6,13.0,14.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(74,15,6,13.0,14.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(75,17,6,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(76,18,6,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(127,17,12,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(128,20,12,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(129,15,12,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(130,1,12,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(131,22,12,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(132,5,12,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(133,6,12,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(134,11,12,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(135,13,12,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(136,24,12,11.0,12.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(137,14,12,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(138,18,12,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(139,17,13,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(140,18,13,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(141,1,13,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(142,14,13,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(143,13,13,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(144,11,13,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(145,5,13,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(146,6,13,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(147,22,13,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(148,24,13,11.0,12.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(149,15,13,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(150,20,13,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(175,11,16,20.0,21.0,30.0,31.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(176,2,16,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(177,16,16,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(178,12,16,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(179,10,16,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(180,6,16,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(181,2,17,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(182,11,17,20.0,21.0,30.0,31.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(183,16,17,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(184,12,17,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(185,10,17,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(186,6,17,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(187,2,18,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(188,6,18,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(189,11,18,20.0,21.0,30.0,31.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(190,16,18,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(191,10,18,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(192,12,18,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(193,6,19,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(194,2,19,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(195,11,19,20.0,21.0,30.0,31.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(196,10,19,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(197,16,19,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(198,12,19,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(199,10,20,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(200,24,20,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(201,20,20,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(202,2,20,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(203,6,21,24.0,25.0,26.0,27.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(204,25,21,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(205,26,21,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(206,10,21,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(207,27,21,NULL,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(208,28,21,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(209,24,21,18.0,19.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(223,1,23,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(224,11,23,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(225,10,23,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(226,25,23,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(227,26,23,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(228,13,23,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(229,19,23,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(230,28,23,16.0,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(231,31,23,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(232,24,23,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(233,20,23,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(234,27,23,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(235,30,23,21.0,NULL,NULL,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(236,29,23,28.0,NULL,NULL,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(238,1,24,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(239,27,24,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(240,20,24,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(241,31,24,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(242,24,24,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(243,29,24,28.0,NULL,NULL,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(244,19,24,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(245,28,24,16.0,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(246,13,24,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(247,25,24,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(248,26,24,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(249,11,24,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(250,10,24,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(251,30,24,21.0,NULL,NULL,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(252,28,25,16.0,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(253,31,25,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(254,19,25,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(255,1,25,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(256,13,25,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(257,11,25,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(258,10,25,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(259,20,25,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(260,24,25,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(261,27,25,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(262,26,25,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(263,25,25,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(264,30,25,21.0,NULL,NULL,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(265,29,25,28.0,NULL,NULL,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(308,27,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(309,20,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(310,24,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(311,31,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(312,29,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(313,19,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(314,28,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(315,13,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(316,25,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(317,26,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(318,11,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(319,10,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(320,30,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(321,1,29,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(322,1,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(323,30,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(324,27,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(325,20,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(326,24,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(327,31,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(328,29,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(329,19,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(330,28,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(331,13,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(332,25,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(333,26,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(334,11,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(335,10,30,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(336,1,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(337,30,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(338,27,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(339,20,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(340,24,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(341,31,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(342,29,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(343,19,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(344,28,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(345,13,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(346,25,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(347,26,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(348,10,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(349,11,31,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(350,18,32,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(351,17,32,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(352,19,32,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(353,16,32,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(354,14,32,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(355,13,32,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(356,12,32,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(357,11,32,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(358,10,32,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(359,8,32,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(360,6,32,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(361,5,32,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(362,2,32,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(363,21,32,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(364,18,33,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(365,17,33,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(366,19,33,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(367,16,33,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(368,14,33,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(369,13,33,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(370,11,33,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(371,10,33,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(372,12,33,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(373,8,33,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(374,6,33,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(375,5,33,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(376,22,33,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(377,2,33,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(378,28,34,20.0,21.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(379,31,34,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(380,19,34,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(381,32,34,6.0,7.0,9.0,10.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(382,11,34,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(383,10,34,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(384,27,34,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(385,24,34,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(386,25,34,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(387,29,34,14.0,NULL,NULL,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(388,2,34,16.0,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(389,27,35,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(390,24,35,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(391,32,35,6.0,7.0,9.0,10.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(392,31,35,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(393,29,35,14.0,NULL,NULL,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(394,19,35,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(395,28,35,20.0,21.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(396,13,35,6.0,7.0,9.0,10.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(397,25,35,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(398,11,35,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(399,10,35,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(400,2,35,16.0,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(401,24,36,18.0,19.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(402,27,36,NULL,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(403,10,36,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(404,26,36,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(405,25,36,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(406,6,36,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(407,15,37,15.0,16.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(408,20,37,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(409,33,37,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(410,5,37,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(411,5,38,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(412,15,38,15.0,16.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(413,33,38,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(414,20,38,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(415,5,39,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(416,15,39,15.0,16.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(417,33,39,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(418,20,39,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(419,6,40,NULL,NULL,NULL,35.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(420,34,40,NULL,NULL,NULL,31.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(421,11,40,27.0,28.0,40.0,41.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(422,29,40,26.0,27.0,46.0,47.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(423,24,40,30.0,31.0,37.0,38.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(424,35,40,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(425,24,41,30.0,31.0,37.0,38.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(426,35,41,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(427,29,41,26.0,27.0,46.0,47.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(428,11,41,27.0,28.0,40.0,41.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(429,6,41,NULL,NULL,NULL,35.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(430,24,42,30.0,31.0,37.0,38.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(431,35,42,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(432,29,42,26.0,27.0,46.0,47.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(433,11,42,27.0,28.0,40.0,41.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(434,6,42,NULL,NULL,NULL,35.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(435,6,43,NULL,NULL,NULL,35.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(436,11,43,27.0,28.0,40.0,41.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(437,29,43,26.0,27.0,46.0,47.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(438,35,43,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(439,24,43,30.0,31.0,37.0,38.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(440,24,44,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(441,20,44,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(442,15,44,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(443,31,44,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(444,8,44,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(445,11,44,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(446,10,44,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(447,3,44,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(448,2,44,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(449,6,44,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(450,20,45,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(451,24,45,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(452,31,45,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(453,15,45,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(454,11,45,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(455,10,45,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(456,8,45,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(457,6,45,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(458,3,45,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(459,2,45,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(460,6,46,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(461,8,46,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(462,20,46,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(463,24,46,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(464,31,46,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(465,15,46,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(466,11,46,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(467,10,46,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(468,3,46,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(469,2,46,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(480,20,48,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(481,24,48,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(482,31,48,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(483,15,48,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(484,11,48,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(485,10,48,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(486,8,48,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(487,6,48,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(488,3,48,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(489,2,48,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(519,3,52,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(520,2,52,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(521,20,52,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(522,24,52,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(523,31,52,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(524,15,52,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(525,8,52,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(526,6,52,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(527,11,52,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(528,10,52,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(529,20,53,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(530,24,53,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(531,31,53,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(532,15,53,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(533,11,53,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(534,10,53,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(535,8,53,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(536,6,53,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(537,3,53,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(538,2,53,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(539,31,54,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(540,24,54,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(541,20,54,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(542,15,54,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(543,11,54,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(544,10,54,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(545,8,54,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(546,6,54,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(547,3,54,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(548,2,54,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(549,20,55,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(550,24,55,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(551,31,55,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(552,15,55,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(553,11,55,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(554,10,55,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(555,8,55,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(556,6,55,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(557,3,55,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(558,2,55,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(559,20,56,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(560,24,56,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(561,31,56,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(562,15,56,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(563,11,56,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(564,10,56,25.0,26.0,28.0,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(565,8,56,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(566,6,56,NULL,NULL,NULL,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(567,3,56,19.0,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(568,2,56,18.0,19.0,21.0,22.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(601,20,61,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(602,24,61,24.0,25.0,27.0,28.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(603,31,61,16.0,17.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(604,28,61,NULL,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(605,10,61,20.0,NULL,NULL,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(606,26,61,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(607,25,61,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(608,36,61,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(699,18,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(700,17,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(701,19,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(702,16,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(703,15,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(704,14,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(705,13,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(706,12,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(707,11,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(708,10,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(709,9,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(710,8,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(711,6,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(712,5,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(713,4,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(714,22,67,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(715,2,67,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(716,9,33,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(717,18,68,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(718,17,68,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(719,19,68,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(720,16,68,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(721,15,68,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(722,13,68,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(723,14,68,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(724,12,68,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(725,11,68,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(726,10,68,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(727,9,68,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(728,8,68,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(729,6,68,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(730,5,68,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(731,4,68,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(732,22,68,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(733,2,68,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(734,21,68,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(735,16,69,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(736,17,69,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(737,18,69,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(738,19,69,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(739,21,69,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(740,2,69,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(741,22,69,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(742,4,69,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(743,5,69,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(744,6,69,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(745,9,69,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(746,8,69,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(747,10,69,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(748,11,69,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(749,12,69,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(750,13,69,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(751,15,69,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(752,14,69,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(771,18,71,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(772,17,71,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(773,19,71,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(774,16,71,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(775,15,71,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(776,14,71,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(777,13,71,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(778,12,71,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(779,9,71,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(780,8,71,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(781,6,71,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(782,5,71,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(783,4,71,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(784,22,71,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(785,21,71,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(786,2,71,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(787,11,71,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(788,10,71,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(789,18,72,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(790,17,72,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(791,19,72,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(792,16,72,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(793,15,72,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(794,14,72,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(795,13,72,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(796,12,72,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(797,11,72,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(798,10,72,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(799,9,72,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(800,8,72,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(801,6,72,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(802,5,72,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(803,4,72,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(804,22,72,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(805,2,72,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(806,21,72,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(825,18,74,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(826,17,74,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(827,19,74,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(828,16,74,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(829,15,74,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(830,14,74,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(831,13,74,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(832,12,74,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(833,11,74,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(834,10,74,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(835,9,74,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(836,8,74,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(837,6,74,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(838,5,74,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(839,4,74,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(840,22,74,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(841,2,74,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(842,21,74,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(843,18,75,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(844,17,75,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(845,19,75,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(846,16,75,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(847,15,75,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(848,14,75,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(849,13,75,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(850,12,75,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(851,10,75,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(852,11,75,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(853,9,75,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(854,8,75,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(855,6,75,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(856,5,75,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(857,4,75,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(858,22,75,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(859,2,75,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(860,21,75,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(861,18,76,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(862,17,76,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(863,19,76,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(864,16,76,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(865,15,76,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(866,14,76,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(867,13,76,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(868,12,76,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(869,10,76,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(870,11,76,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(871,9,76,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(872,8,76,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(873,6,76,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(874,5,76,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(875,4,76,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(876,22,76,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(877,2,76,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(878,21,76,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(879,18,77,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(880,17,77,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(881,19,77,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(882,16,77,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(883,15,77,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(884,14,77,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(885,13,77,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(886,12,77,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(887,11,77,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(888,10,77,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(889,9,77,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(890,8,77,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(891,6,77,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(892,5,77,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(893,4,77,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(894,22,77,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(895,2,77,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(896,21,77,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(933,18,80,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(934,17,80,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(935,19,80,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(936,16,80,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(937,15,80,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(938,14,80,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(939,13,80,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(940,12,80,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(941,10,80,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(942,11,80,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(943,9,80,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(944,8,80,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(945,6,80,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(946,5,80,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(947,4,80,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(948,22,80,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(949,2,80,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(950,21,80,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(951,18,81,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(952,17,81,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(953,19,81,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(954,16,81,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(955,15,81,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(956,14,81,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(957,13,81,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(958,12,81,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(959,10,81,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(960,11,81,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(961,9,81,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(962,8,81,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(963,6,81,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(964,5,81,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(965,4,81,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(966,22,81,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(967,21,81,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(968,2,81,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(987,18,83,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(988,17,83,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(989,19,83,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(990,16,83,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(991,15,83,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(992,14,83,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(993,13,83,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(994,12,83,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(995,11,83,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(996,10,83,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(997,9,83,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(998,8,83,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(999,6,83,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1000,5,83,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1001,4,83,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1002,22,83,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1003,2,83,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1004,21,83,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1005,16,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1006,15,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1007,14,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1008,13,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1009,12,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1010,11,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1011,10,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1012,9,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1013,8,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1014,6,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1015,5,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1016,4,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1017,22,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1018,2,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1019,21,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1020,18,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1021,17,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1022,19,84,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1023,15,3,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1060,18,87,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1061,17,87,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1062,19,87,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1063,16,87,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1064,15,87,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1065,14,87,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1066,13,87,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1067,12,87,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1068,11,87,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1069,10,87,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1070,9,87,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1071,8,87,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1072,6,87,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1073,5,87,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1074,4,87,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1075,22,87,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1076,2,87,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1077,21,87,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1078,18,88,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1079,17,88,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1080,19,88,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1081,16,88,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1082,15,88,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1083,14,88,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1084,13,88,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1085,12,88,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1086,11,88,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1087,10,88,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1088,8,88,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1089,9,88,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1090,6,88,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1091,5,88,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1092,22,88,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1093,4,88,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1094,2,88,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1095,21,88,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1096,2,89,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1097,6,89,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1098,10,89,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1099,11,89,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1100,12,89,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1101,16,89,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1102,20,90,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1103,33,90,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1104,37,90,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1105,9,91,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1106,18,91,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1107,17,91,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1108,19,91,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1109,16,91,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1110,15,91,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1111,14,91,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1112,13,91,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1113,12,91,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1114,10,91,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1115,11,91,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1116,8,91,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1117,6,91,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1118,5,91,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1119,4,91,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1120,22,91,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1121,2,91,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1122,21,91,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1177,18,95,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1178,17,95,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1179,19,95,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1180,16,95,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1181,15,95,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1182,14,95,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1183,13,95,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1184,12,95,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1185,11,95,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1186,10,95,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1187,9,95,14.0,15.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1188,8,95,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1189,6,95,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1190,5,95,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1191,4,95,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1192,22,95,NULL,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1193,2,95,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1194,21,95,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1195,38,91,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1196,2,96,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1197,6,96,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1198,10,96,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1199,11,96,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1200,12,96,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1201,16,96,NULL,NULL,NULL,NULL,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1202,27,97,14.0,15.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1203,24,97,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1204,32,97,6.0,7.0,9.0,10.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1205,31,97,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1206,29,97,14.0,NULL,NULL,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1207,19,97,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1208,28,97,20.0,21.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1209,13,97,6.0,7.0,9.0,10.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1210,25,97,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1211,11,97,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1212,10,97,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1213,2,97,16.0,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1214,2,98,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1215,11,98,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1216,12,98,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1217,16,98,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1218,2,99,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1219,11,99,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1220,12,99,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1221,16,99,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1222,2,100,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1223,11,100,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1224,12,100,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1225,16,100,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1226,2,101,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1227,11,101,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1228,12,101,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1229,16,101,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1230,29,36,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1231,29,102,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1232,6,102,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1233,25,102,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1234,26,102,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1235,10,102,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1236,27,102,NULL,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1237,24,102,18.0,19.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1238,27,103,NULL,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1239,24,103,18.0,19.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1240,29,103,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1241,25,103,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1242,26,103,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1243,10,103,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1244,6,103,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1266,27,107,NULL,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1267,24,107,18.0,19.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1268,29,107,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1269,25,107,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1270,26,107,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1271,10,107,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1272,6,107,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1273,27,108,NULL,NULL,NULL,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1274,24,108,18.0,19.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1275,29,108,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1276,25,108,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1277,26,108,15.0,16.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1278,10,108,17.0,18.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1279,6,108,NULL,NULL,NULL,24.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1280,22,32,18.0,19.0,24.0,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1281,1,32,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1282,2,109,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1283,10,109,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1284,11,109,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1285,12,109,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1286,6,109,13.0,14.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1287,16,109,13.0,14.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1288,39,34,6.0,7.0,9.0,10.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1289,3,33,13.0,14.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1290,15,33,19.0,20.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1291,4,33,22.0,23.0,25.0,26.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1292,25,110,13.0,14.0,22.0,23.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1293,26,110,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1294,24,110,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1295,12,110,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1296,10,110,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1297,11,110,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1298,13,110,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1299,19,110,13.0,14.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1300,31,110,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1301,28,110,16.0,17.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1302,24,111,14.0,15.0,18.0,19.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1303,27,111,NULL,NULL,NULL,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1304,31,111,16.0,17.0,19.0,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1305,19,111,14.0,15.0,16.0,17.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1306,28,111,NULL,NULL,NULL,20.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1307,11,111,15.0,16.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1308,10,111,12.0,13.0,17.0,18.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1309,36,111,19.0,NULL,NULL,25.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1310,29,111,28.0,NULL,NULL,29.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1311,26,111,14.0,15.0,20.0,21.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1312,12,111,10.0,11.0,15.0,16.0,'2024-12-11 18:07:16','2024-12-11 18:07:16'),(1313,13,111,12.0,13.0,14.0,15.0,'2024-12-11 18:07:16','2024-12-11 18:07:16');
/*!40000 ALTER TABLE `zone_diameters` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-11 21:23:33
