-- MySQL dump 10.13  Distrib 8.1.0, for macos13.3 (arm64)
--
-- Host: 127.0.0.1    Database: skolon
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @old_character_set_client = @@character_set_client */;
/*!40101 SET @old_character_set_results = @@character_set_results */;
/*!40101 SET @old_collation_connection = @@collation_connection */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @old_time_zone = @@time_zone */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @old_unique_checks = @@unique_checks, UNIQUE_CHECKS = 0 */;
/*!40014 SET @old_foreign_key_checks = @@foreign_key_checks, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @old_sql_mode = @@sql_mode, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @old_sql_notes = @@sql_notes, SQL_NOTES = 0 */;


CREATE DATABASE IF NOT EXISTS `skolon`;
USE `skolon`;

--
-- Table structure for table `access_log`
--

DROP TABLE IF EXISTS `access_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_log`
(
    `id`        BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `entity`    VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `entity_id` BIGINT                                                          NOT NULL,
    `read_by`   BIGINT                                                          NOT NULL,
    `time`      DATETIME                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 330595
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activation_code`
--

DROP TABLE IF EXISTS `activation_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activation_code`
(
    `id`            BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME                                                        NOT NULL,
    `update_time`   DATETIME                                                         DEFAULT NULL,
    `type`          TINYINT                                                         NOT NULL COMMENT '1 = User Account',
    `code`          VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `school_id`     BIGINT                                                           DEFAULT NULL,
    `app_ids`       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT 'Comma separated string of app_ids to add to the users collection',
    `user_type`     TINYINT                                                          DEFAULT NULL,
    `expiration`    DATE                                                            NOT NULL,
    `developer_id`  BIGINT                                                           DEFAULT NULL,
    `deleted`       DATETIME                                                         DEFAULT NULL,
    `user_id`       BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4784
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `active_group`
--

DROP TABLE IF EXISTS `active_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `active_group`
(
    `app_id`   BIGINT NOT NULL,
    `user_id`  BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    PRIMARY KEY (`app_id`, `user_id`),
    KEY `user_id` (`user_id`),
    KEY `group_id` (`group_id`),
    CONSTRAINT `active_group_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `active_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `active_group_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log`
(
    `id`            BIGINT   NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME NOT NULL,
    `activity_type` TINYINT  NOT NULL COMMENT '1 = Open app',
    `user_id`       BIGINT                                                           DEFAULT NULL,
    `app_id`        BIGINT                                                           DEFAULT NULL,
    `note`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `metadata_id`   BIGINT                                                           DEFAULT NULL,
    `school_id`     BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `activity_log_app_id_user_id_idx` (`app_id`, `user_id`),
    KEY `school_id` (`school_id`),
    KEY `user_id_creation_time_idx` (`user_id`, `creation_time`),
    CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 3561
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `age_group`
--

DROP TABLE IF EXISTS `age_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_group`
(
    `age_group_id` BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `country_id`   VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT 'se',
    `code`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    PRIMARY KEY (`age_group_id`),
    UNIQUE KEY `index2` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 78
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `api_notification`
--

DROP TABLE IF EXISTS `api_notification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_notification`
(
    `application_id`       BIGINT  NOT NULL,
    `user_changed`         TINYINT NOT NULL DEFAULT '0',
    `group_changed`        TINYINT NOT NULL DEFAULT '0',
    `school_changed`       TINYINT NOT NULL DEFAULT '0',
    `license_changed`      TINYINT NOT NULL DEFAULT '0',
    `organization_changed` TINYINT NOT NULL DEFAULT '0',
    `order_changed`        TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`application_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app`
(
    `app_id`                       BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `public_id`                    VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `ext_id`                       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `url`                          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `url_target`                   VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'external, iframe\n',
    `developer_id`                 BIGINT                                                                  DEFAULT NULL,
    `icon_file_id`                 BIGINT                                                                  DEFAULT NULL,
    `demo_file_id`                 BIGINT                                                                  DEFAULT NULL,
    `name`                         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `short_description`            VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `description`                  MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `sale_info`                    MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `sales_url`                    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `single_price`                 DECIMAL(10, 2)                                                          DEFAULT NULL,
    `c_time`                       TIMESTAMP                                                      NULL     DEFAULT CURRENT_TIMESTAMP,
    `deleted`                      DATETIME                                                                DEFAULT NULL,
    `main_category_id`             BIGINT                                                                  DEFAULT NULL,
    `main_subject_id`              BIGINT                                                                  DEFAULT NULL,
    `main_age_group_id`            BIGINT                                                                  DEFAULT NULL,
    `is_student_app`               TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `is_teacher_app`               TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `is_admin_app`                 TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `for_mac_os`                   TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `for_windows`                  TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `for_web`                      TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `for_ios`                      TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `for_android`                  TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `min_age`                      TINYINT UNSIGNED                                               NOT NULL DEFAULT '0',
    `max_age`                      TINYINT UNSIGNED                                               NOT NULL DEFAULT '100',
    `agency_fee`                   DOUBLE                                                         NOT NULL DEFAULT '0.1' COMMENT 'deprecated',
    `licence_mangement_fee`        DOUBLE                                                         NOT NULL DEFAULT '0.1' COMMENT 'deprecated',
    `licence_agreement`            MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `is_buyable`                   TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `distribution_fee`             DECIMAL(5, 2)                                                  NOT NULL DEFAULT '10.00',
    `sale_fee`                     DECIMAL(5, 2)                                                  NOT NULL DEFAULT '20.00' COMMENT 'license fee for sales in Skolon',
    `migration_fee`                DECIMAL(5, 2)                                                  NOT NULL DEFAULT '5.00' COMMENT 'license fee for existing customer',
    `application_id`               BIGINT                                                                  DEFAULT NULL,
    `url_name`                     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `force_info`                   TINYINT(1)                                                              DEFAULT '0',
    `is_published`                 TINYINT(1)                                                              DEFAULT '1',
    `article_number`               VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `primary_lang_id`              VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'sv',
    `has_metadata`                 TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `total_users`                  INT                                                            NOT NULL DEFAULT '0',
    `active_users`                 INT                                                            NOT NULL DEFAULT '0',
    `app_template_id`              BIGINT                                                                  DEFAULT NULL,
    `publication_date`             DATETIME                                                                DEFAULT NULL,
    `ou_id`                        BIGINT                                                                  DEFAULT NULL,
    `requires_active_group`        TINYINT                                                        NOT NULL DEFAULT '0',
    `supports_app_groups`          TINYINT                                                        NOT NULL DEFAULT '0',
    `minimum_authentication_level` TINYINT                                                        NOT NULL DEFAULT '1',
    `is_listed`                    TINYINT                                                        NOT NULL DEFAULT '1',
    `will_unlist`                  TINYINT                                                        NOT NULL DEFAULT '0',
    `contact_company`              VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `contact_person`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `contact_email`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `contact_phone`                VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `is_external_app`              TINYINT                                                        NOT NULL DEFAULT '0',
    `requires_external_activation` TINYINT                                                        NOT NULL DEFAULT '0',
    `disable_request_demo_form`    TINYINT                                                        NOT NULL DEFAULT '0',
    `supports_sso`                 TINYINT                                                        NOT NULL DEFAULT '1',
    `supports_offline`             TINYINT                                                        NOT NULL DEFAULT '0',
    `statistics_enabled`           TINYINT                                                        NOT NULL DEFAULT '1',
    `avg_rating`                   DECIMAL(2, 1)                                                           DEFAULT NULL,
    `background_file_id`           BIGINT                                                                  DEFAULT NULL,
    `is_backwards_compatible`      TINYINT                                                        NOT NULL DEFAULT '0',
    `status`                       TINYINT(1)                                                     NOT NULL DEFAULT '1',
    `type`                         VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `redirect_via_skolon`          TINYINT(1)                                                     NOT NULL DEFAULT '0',
    `sharing_data`                 TINYINT(1)                                                     NOT NULL DEFAULT '1',
    `accessibility`                BIGINT                                                                  DEFAULT NULL,
    `general_terms_url`            VARCHAR(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `created_by`                   BIGINT                                                                  DEFAULT NULL COMMENT 'Only applicable to local apps',
    `created_by_teacher`           TINYINT(1)                                                              DEFAULT '0' COMMENT 'Only applicable to local apps',
    PRIMARY KEY (`app_id`),
    UNIQUE KEY `url_name_UNIQUE` (`url_name`),
    KEY `fk_app_developer1_idx` (`developer_id`),
    KEY `fk_app_file2_idx` (`icon_file_id`),
    KEY `fk_app_file1_idx` (`demo_file_id`),
    KEY `name_idx` (`name`),
    KEY `published_idx` (`is_published`),
    KEY `public_id_idx` (`public_id`),
    KEY `ext_id_idx` (`ext_id`),
    KEY `ou_id` (`ou_id`),
    KEY `background_file_id` (`background_file_id`),
    KEY `accessibility` (`accessibility`),
    KEY `created_by` (`created_by`),
    CONSTRAINT `app_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `app_ibfk_2` FOREIGN KEY (`background_file_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `app_ibfk_3` FOREIGN KEY (`accessibility`) REFERENCES `app_accessibility` (`id`),
    CONSTRAINT `app_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
    CONSTRAINT `fk_app_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `fk_app_file1` FOREIGN KEY (`demo_file_id`) REFERENCES `file` (`file_id`) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT `fk_app_file2` FOREIGN KEY (`icon_file_id`) REFERENCES `file` (`file_id`) ON DELETE SET NULL ON UPDATE RESTRICT,
    CONSTRAINT `fk_app_file3` FOREIGN KEY (`background_file_id`) REFERENCES `file` (`file_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1162
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_accessibility`
--

DROP TABLE IF EXISTS `app_accessibility`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_accessibility`
(
    `id`              BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `translation_key` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `level`           INT                                                              NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_age_group`
--

DROP TABLE IF EXISTS `app_age_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_age_group`
(
    `id`    BIGINT NOT NULL AUTO_INCREMENT,
    `name`  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `index` INT                                                             DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_author`
--

DROP TABLE IF EXISTS `app_author`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_author`
(
    `app_id`     BIGINT NOT NULL,
    `first_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `last_name`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `full_name`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `id`         BIGINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_category`
--

DROP TABLE IF EXISTS `app_category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_category`
(
    `category_id` BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `parent_id`   BIGINT                                                                  DEFAULT NULL,
    `index`       INT                                                                     DEFAULT NULL,
    `filterable`  TINYINT                                                                 DEFAULT NULL,
    `country_id`  VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'se',
    `public_id`   VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    PRIMARY KEY (`category_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_country`
--

DROP TABLE IF EXISTS `app_country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_country`
(
    `app_id`       BIGINT                                                         NOT NULL,
    `country_id`   VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `is_released`  TINYINT                                                        NOT NULL DEFAULT '1',
    `release_date` DATE                                                                    DEFAULT NULL,
    `release_info` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    PRIMARY KEY (`app_id`, `country_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_download`
--

DROP TABLE IF EXISTS `app_download`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_download`
(
    `app_download_id` BIGINT   NOT NULL AUTO_INCREMENT,
    `downloaded`      DATETIME NOT NULL,
    `app_id`          BIGINT   NOT NULL,
    `user_id`         BIGINT   NOT NULL,
    PRIMARY KEY (`app_download_id`),
    KEY `downloaded_idx` (`downloaded`),
    KEY `fk_app_download_app1_idx` (`app_id`),
    KEY `fk_app_download_user1_idx` (`user_id`),
    CONSTRAINT `fk_app_download_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_event_log`
--

DROP TABLE IF EXISTS `app_event_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_event_log`
(
    `app_id`     BIGINT                                                 NOT NULL,
    `id`         BIGINT                                                 NOT NULL AUTO_INCREMENT,
    `type`       ENUM ('create','update') COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`    BIGINT                                                          DEFAULT NULL,
    `event_date` DATETIME                                               NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `fk_app_id_idx` (`app_id`),
    KEY `fk_user_id_idx` (`user_id`),
    CONSTRAINT `fk_app_event_log_app_id` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_app_event_log_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_event_log_change`
--

DROP TABLE IF EXISTS `app_event_log_change`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_event_log_change`
(
    `app_event_log_id` BIGINT                                     NOT NULL,
    `id`               BIGINT                                     NOT NULL AUTO_INCREMENT,
    `field`            VARCHAR(100) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `previous_value`   VARCHAR(255) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `new_value`        VARCHAR(255) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_app_event_log_id_idx` (`app_event_log_id`),
    CONSTRAINT `fk_app_event_log_change_app_event_log_id` FOREIGN KEY (`app_event_log_id`) REFERENCES `app_event_log` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_extra`
--

DROP TABLE IF EXISTS `app_extra`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_extra`
(
    `extra_id`      BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `parent_id`     BIGINT                                                                    DEFAULT NULL,
    `file_id`       BIGINT                                                                    DEFAULT NULL,
    `url`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `name`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `type`          BIGINT                                                                    DEFAULT NULL COMMENT 'category / file / link',
    `is_dependency` TINYINT                                                                   DEFAULT NULL,
    `for_mac_os`    TINYINT(1)                                                       NOT NULL DEFAULT '1',
    `for_windows`   TINYINT(1)                                                       NOT NULL DEFAULT '1',
    `for_web`       TINYINT(1)                                                       NOT NULL DEFAULT '1',
    `for_ios`       TINYINT(1)                                                       NOT NULL DEFAULT '1',
    `for_android`   TINYINT(1)                                                       NOT NULL DEFAULT '1',
    `comment`       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    PRIMARY KEY (`extra_id`),
    KEY `fk_app_extra_file1_idx` (`file_id`),
    KEY `fk_app_extra_app_extra_type1_idx` (`type`),
    CONSTRAINT `fk_app_extra_app_extra_type1` FOREIGN KEY (`type`) REFERENCES `app_extra_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_extra_file1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 197
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_extra_type`
--

DROP TABLE IF EXISTS `app_extra_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_extra_type`
(
    `id`   BIGINT NOT NULL,
    `name` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_format`
--

DROP TABLE IF EXISTS `app_format`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_format`
(
    `id`              BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `translation_key` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `code`            VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_group`
--

DROP TABLE IF EXISTS `app_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_group`
(
    `id`            BIGINT   NOT NULL AUTO_INCREMENT,
    `app_id`        BIGINT   NOT NULL,
    `user_id`       BIGINT            DEFAULT NULL,
    `school_id`     BIGINT            DEFAULT NULL,
    `group_id`      BIGINT   NOT NULL,
    `creation_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `app_id` (`app_id`, `user_id`, `group_id`),
    UNIQUE KEY `app_id_2` (`app_id`, `school_id`, `group_id`),
    KEY `user_id` (`user_id`),
    KEY `school_id` (`school_id`),
    KEY `group_id` (`group_id`),
    CONSTRAINT `app_group_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `app_group_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `app_group_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `app_group_ibfk_4` FOREIGN KEY (`group_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 569
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_has_age_group`
--

DROP TABLE IF EXISTS `app_has_age_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_has_age_group`
(
    `app_id`                BIGINT  NOT NULL,
    `age_group_id`          BIGINT  NOT NULL,
    `locked_in_partner_api` TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`app_id`, `age_group_id`),
    KEY `fk_app_has_age_group_age_group1_idx` (`age_group_id`),
    CONSTRAINT `fk_app_has_age_group_age_group1` FOREIGN KEY (`age_group_id`) REFERENCES `age_group` (`age_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_has_age_group_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_has_app_age_group`
--

DROP TABLE IF EXISTS `app_has_app_age_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_has_app_age_group`
(
    `app_app_id`       BIGINT NOT NULL,
    `app_age_group_id` BIGINT NOT NULL,
    PRIMARY KEY (`app_app_id`, `app_age_group_id`),
    KEY `fk_app_has_app_age_group_app_age_group1_idx` (`app_age_group_id`),
    KEY `fk_app_has_app_age_group_app1_idx` (`app_app_id`),
    CONSTRAINT `fk_app_has_app_age_group_app1` FOREIGN KEY (`app_app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_has_app_age_group_app_age_group1` FOREIGN KEY (`app_age_group_id`) REFERENCES `app_age_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_has_app_category`
--

DROP TABLE IF EXISTS `app_has_app_category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_has_app_category`
(
    `app_id`      BIGINT NOT NULL,
    `category_id` BIGINT NOT NULL,
    PRIMARY KEY (`category_id`, `app_id`),
    KEY `fk_app_has_app_category_app_idx` (`app_id`),
    CONSTRAINT `fk_app_has_app_category_app` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_has_app_category_app_category1` FOREIGN KEY (`category_id`) REFERENCES `app_category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_has_app_extra`
--

DROP TABLE IF EXISTS `app_has_app_extra`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_has_app_extra`
(
    `app_id`   BIGINT NOT NULL,
    `extra_id` BIGINT NOT NULL,
    `index`    INT    NOT NULL DEFAULT '100',
    PRIMARY KEY (`app_id`, `extra_id`),
    KEY `fk_app_has_app_extra_app_extra1_idx` (`extra_id`),
    KEY `fk_app_has_app_extra_app1_idx` (`app_id`),
    CONSTRAINT `fk_app_has_app_extra_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_has_app_extra_app_extra1` FOREIGN KEY (`extra_id`) REFERENCES `app_extra` (`extra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_has_app_format`
--

DROP TABLE IF EXISTS `app_has_app_format`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_has_app_format`
(
    `app_id`        BIGINT NOT NULL,
    `app_format_id` BIGINT NOT NULL,
    PRIMARY KEY (`app_id`, `app_format_id`),
    KEY `app_format_id_fk_idx` (`app_format_id`),
    CONSTRAINT `app_has_app_format_app_format_id_fk` FOREIGN KEY (`app_format_id`) REFERENCES `app_format` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `app_has_app_format_app_id_fk` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_in_ou_collection`
--

DROP TABLE IF EXISTS `app_in_ou_collection`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_in_ou_collection`
(
    `id`     BIGINT NOT NULL AUTO_INCREMENT,
    `app_id` BIGINT NOT NULL,
    `ou_id`  BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `app_id` (`app_id`, `ou_id`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `app_in_ou_collection_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `app_in_ou_collection_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 83
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_lang`
--

DROP TABLE IF EXISTS `app_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_lang`
(
    `app_id`            BIGINT                                                         NOT NULL,
    `language_id`       VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `name`              VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `short_description` VARCHAR(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`       MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `sale_info`         MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `deleted`           DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`app_id`, `language_id`),
    FULLTEXT KEY `app_lang_name_description_short_description_idx` (`name`, `description`, `short_description`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_license`
--

DROP TABLE IF EXISTS `app_license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_license`
(
    `license_id`     BIGINT  NOT NULL AUTO_INCREMENT,
    `app_version_id` BIGINT  NOT NULL,
    `contract_id`    BIGINT                                                           DEFAULT NULL,
    `license_type`   TINYINT NOT NULL                                                 DEFAULT '1' COMMENT '1 = free access, 2 = targeted, 3  = simultaneous users/school',
    `license_code`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `status`         TINYINT                                                          DEFAULT NULL COMMENT '1 = public',
    `max_users`      INT                                                              DEFAULT NULL,
    PRIMARY KEY (`license_id`),
    KEY `fk_platform_file_contract1_idx` (`contract_id`),
    CONSTRAINT `fk_platform_file_contract1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3808
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package`
--

DROP TABLE IF EXISTS `app_package`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package`
(
    `id`                                       BIGINT   NOT NULL AUTO_INCREMENT,
    `creation_time`                            DATETIME NOT NULL                                                DEFAULT CURRENT_TIMESTAMP,
    `public_id`                                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `ext_id`                                   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `is_published`                             TINYINT  NOT NULL                                                DEFAULT '0',
    `icon_id`                                  BIGINT                                                           DEFAULT NULL,
    `developer_id`                             BIGINT   NOT NULL,
    `deleted`                                  DATETIME                                                         DEFAULT NULL,
    `supplier_article_number`                  VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `vat_rate_id`                              BIGINT                                                           DEFAULT NULL,
    `price`                                    DECIMAL(10, 2)                                                   DEFAULT NULL,
    `currency_id`                              VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `price_upon_request`                       TINYINT  NOT NULL                                                DEFAULT '0',
    `individual_product_quantities`            TINYINT  NOT NULL                                                DEFAULT '0',
    `banner_id`                                BIGINT                                                           DEFAULT NULL,
    `auto_renewal`                             TINYINT                                                          DEFAULT NULL,
    `duration`                                 INT                                                              DEFAULT NULL,
    `duration_type`                            TINYINT                                                          DEFAULT NULL,
    `license_target`                           TINYINT                                                          DEFAULT NULL,
    `country_id`                               VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `is_for_external_apps`                     TINYINT                                                          DEFAULT NULL,
    `apps_require_external_license_activation` TINYINT                                                          DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `public_id` (`public_id`),
    UNIQUE KEY `developer_id_2` (`developer_id`, `ext_id`),
    KEY `developer_id` (`developer_id`),
    KEY `icon_id` (`icon_id`),
    KEY `vat_rate_id` (`vat_rate_id`),
    KEY `currency_id` (`currency_id`),
    KEY `banner_id` (`banner_id`),
    KEY `country_id` (`country_id`),
    CONSTRAINT `app_package_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `app_package_ibfk_2` FOREIGN KEY (`icon_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `app_package_ibfk_3` FOREIGN KEY (`vat_rate_id`) REFERENCES `vat_rate` (`id`),
    CONSTRAINT `app_package_ibfk_4` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`code`),
    CONSTRAINT `app_package_ibfk_5` FOREIGN KEY (`banner_id`) REFERENCES `file` (`file_id`),
    CONSTRAINT `app_package_ibfk_6` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package_product`
--

DROP TABLE IF EXISTS `app_package_product`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package_product`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT,
    `app_package_id` BIGINT NOT NULL,
    `product_id`     BIGINT NOT NULL,
    `price`          DECIMAL(10, 2) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `app_package_id` (`app_package_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `app_package_product_ibfk_1` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`),
    CONSTRAINT `app_package_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_package_translation`
--

DROP TABLE IF EXISTS `app_package_translation`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_package_translation`
(
    `id`             BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `app_package_id` BIGINT                                                           NOT NULL,
    `name`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `description`    TEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `language_id`    VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `is_primary`     TINYINT                                                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `app_package_id` (`app_package_id`, `language_id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `app_package_translation_ibfk_1` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`) ON DELETE CASCADE,
    CONSTRAINT `app_package_translation_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 762
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_platform`
--

DROP TABLE IF EXISTS `app_platform`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_platform`
(
    `platform_id` INT NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`platform_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_popularity`
--

DROP TABLE IF EXISTS `app_popularity`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_popularity`
(
    `app_id`     BIGINT                                                         NOT NULL,
    `users`      INT                                                            NOT NULL,
    `country_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `popularity` DECIMAL(7, 1) DEFAULT NULL,
    PRIMARY KEY (`app_id`, `country_id`),
    CONSTRAINT `app_popularity_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_screen_shot`
--

DROP TABLE IF EXISTS `app_screen_shot`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_screen_shot`
(
    `app_id`  BIGINT NOT NULL,
    `file_id` BIGINT NOT NULL,
    `index`   INT DEFAULT NULL,
    PRIMARY KEY (`app_id`, `file_id`),
    KEY `fk_app_screen_shot_file1_idx` (`file_id`),
    CONSTRAINT `fk_app_screen_shot_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_screen_shot_file1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_subject`
--

DROP TABLE IF EXISTS `app_subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_subject`
(
    `app_id`                BIGINT  NOT NULL,
    `subject_id`            BIGINT  NOT NULL,
    `locked_in_partner_api` TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`app_id`, `subject_id`),
    KEY `fk_app_subject_subject1_idx` (`subject_id`),
    CONSTRAINT `fk_app_subject_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_support_languages`
--

DROP TABLE IF EXISTS `app_support_languages`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_support_languages`
(
    `app_id`      BIGINT                                                         NOT NULL,
    `language_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`app_id`, `language_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_target_user_type`
--

DROP TABLE IF EXISTS `app_target_user_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_target_user_type`
(
    `app_id`       BIGINT NOT NULL,
    `user_type_id` BIGINT NOT NULL,
    PRIMARY KEY (`app_id`, `user_type_id`),
    KEY `fk_app_target_user_user_type1_idx` (`user_type_id`),
    CONSTRAINT `fk_app_target_user_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_target_user_user_type1` FOREIGN KEY (`user_type_id`) REFERENCES `user_type` (`user_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci COMMENT ='Target groups for app. Some apps will only be available for certain user types, eg. teachers, students or school administrators';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_template`
--

DROP TABLE IF EXISTS `app_template`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_template`
(
    `id`                BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`              VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `short_description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `icon_file_id`      BIGINT                                                           DEFAULT NULL,
    `country`           VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `url`               VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_app_template_file1` (`icon_file_id`),
    KEY `country` (`country`),
    CONSTRAINT `app_template_ibfk_1` FOREIGN KEY (`country`) REFERENCES `country` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `fk_app_template_file1` FOREIGN KEY (`icon_file_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_usage`
--

DROP TABLE IF EXISTS `app_usage`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_usage`
(
    `app_usage_id` BIGINT NOT NULL AUTO_INCREMENT,
    `used`         DATETIME DEFAULT NULL,
    `app_id`       BIGINT NOT NULL,
    `user_id`      BIGINT   DEFAULT NULL,
    PRIMARY KEY (`app_usage_id`),
    KEY `used_idx` (`used`),
    KEY `fk_app_usage_app1_idx` (`app_id`),
    KEY `fk_app_usage_user1_idx` (`user_id`),
    CONSTRAINT `fk_app_usage_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_version`
--

DROP TABLE IF EXISTS `app_version`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version`
(
    `app_version_id`        BIGINT     NOT NULL AUTO_INCREMENT,
    `ext_id`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `app_id`                BIGINT                                                            DEFAULT NULL,
    `name`                  VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `version`               VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `version_number`        INT                                                               DEFAULT NULL,
    `file_id`               BIGINT                                                            DEFAULT NULL,
    `url`                   VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `url_target`            VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `platform_id`           INT                                                               DEFAULT NULL,
    `is_student_app`        TINYINT(1)                                                        DEFAULT NULL,
    `is_teacher_app`        TINYINT(1)                                                        DEFAULT NULL,
    `is_admin_app`          TINYINT(1)                                                        DEFAULT NULL,
    `is_free`               TINYINT(1)                                                        DEFAULT '0',
    `added`                 DATETIME                                                          DEFAULT NULL,
    `school_price`          DECIMAL(10, 2)                                                    DEFAULT NULL,
    `group_price`           DECIMAL(10, 2)                                                    DEFAULT NULL,
    `user_price`            DECIMAL(10, 2)                                                    DEFAULT NULL,
    `is_demo`               TINYINT(1) NOT NULL                                               DEFAULT '0',
    `demo_duration`         INT                                                               DEFAULT NULL,
    `description`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `license_order_module`  VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `is_renewable`          TINYINT(1) NOT NULL                                               DEFAULT '1',
    `external_unassign_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `internal_route`        VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `deleted`               DATETIME                                                          DEFAULT NULL,
    PRIMARY KEY (`app_version_id`),
    KEY `fk_app_version_app1_idx` (`app_id`),
    KEY `fk_app_version_file1_idx` (`file_id`),
    KEY `fk_app_version_app_platform1_idx` (`platform_id`),
    KEY `is_free1_idx` (`is_free`),
    KEY `app_is_free_idx` (`app_version_id`, `app_id`, `is_free`),
    KEY `is_admin_app_idx` (`is_admin_app`),
    KEY `is_teacher_app_idx` (`is_teacher_app`),
    KEY `is_student_app_idx` (`is_student_app`),
    CONSTRAINT `fk_app_version_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_version_app_platform1` FOREIGN KEY (`platform_id`) REFERENCES `app_platform` (`platform_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_app_version_file1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4813
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_version_compatibility`
--

DROP TABLE IF EXISTS `app_version_compatibility`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version_compatibility`
(
    `app_version_id`          BIGINT NOT NULL,
    `compatibility_target_id` BIGINT NOT NULL,
    `version_info`            VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`app_version_id`, `compatibility_target_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_version_lang`
--

DROP TABLE IF EXISTS `app_version_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version_lang`
(
    `app_version_id` BIGINT                                                         NOT NULL,
    `language_id`    VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `name`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `deleted`        DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`app_version_id`, `language_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `app_version_price`
--

DROP TABLE IF EXISTS `app_version_price`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_version_price`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT COMMENT '1 = user, 2 = class, 3 = school',
    `price`          DECIMAL(10, 2) DEFAULT NULL,
    `duration`       INT            DEFAULT NULL,
    `duration_type`  TINYINT        DEFAULT NULL COMMENT '1 = day, 2 = month, 3 = year',
    `license_target` TINYINT        DEFAULT NULL,
    `app_version_id` BIGINT         DEFAULT NULL,
    `creation_time`  DATETIME       DEFAULT NULL,
    `auto_renewal`   TINYINT(1)     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_app_version_price_app_version1_idx` (`app_version_id`),
    CONSTRAINT `fk_app_version_price_app_version1` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_access`
--

DROP TABLE IF EXISTS `application_access`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_access`
(
    `application_id`       BIGINT           NOT NULL AUTO_INCREMENT,
    `client_id`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `client_secret`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `name`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `logo_url`             VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `callback_url`         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `developer_id`         BIGINT                                                           DEFAULT NULL,
    `requests_avatar_sync` TINYINT(1)       NOT NULL                                        DEFAULT '0',
    `logout_uri`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `user_sync_type`       TINYINT                                                          DEFAULT NULL,
    `group_sync_type`      TINYINT                                                          DEFAULT NULL,
    `user_attributes`      MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `group_attributes`     MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `can_delete`           TINYINT UNSIGNED NOT NULL                                        DEFAULT '1',
    PRIMARY KEY (`application_id`),
    KEY `fk_application_access_developer1_idx` (`developer_id`),
    CONSTRAINT `fk_application_access_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1000144
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_permission`
--

DROP TABLE IF EXISTS `application_permission`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_permission`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT,
    `application_id` BIGINT NOT NULL,
    `school_id`      BIGINT   DEFAULT NULL,
    `permission_id`  INT    NOT NULL,
    `since_time`     DATETIME DEFAULT NULL,
    `feature_id`     BIGINT   DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index2` (`application_id`, `school_id`, `permission_id`),
    KEY `fk_application_permission_ou1_idx` (`school_id`),
    CONSTRAINT `fk_application_permission_application_access1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_application_permission_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 214
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_redirect_uris`
--

DROP TABLE IF EXISTS `application_redirect_uris`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_redirect_uris`
(
    `id`             BIGINT                                     NOT NULL AUTO_INCREMENT,
    `application_id` BIGINT                                     NOT NULL,
    `redirect_uri`   VARCHAR(256) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`),
    KEY `application_id` (`application_id`),
    CONSTRAINT `application_redirect_uris_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `application_session`
--

DROP TABLE IF EXISTS `application_session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application_session`
(
    `id`              BIGINT NOT NULL AUTO_INCREMENT,
    `access_token`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `refresh_token`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `user_id`         BIGINT                                                           DEFAULT NULL,
    `application_id`  BIGINT                                                           DEFAULT NULL,
    `creation_time`   DATETIME                                                         DEFAULT NULL,
    `expiration_time` DATETIME                                                         DEFAULT NULL,
    `session_id`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_application_session_application_access1_idx` (`application_id`),
    KEY `idx_access_token` (`access_token`),
    KEY `refresh_token_idx` (`refresh_token`),
    CONSTRAINT `fk_application_session_application_access1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 125694
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article`
(
    `id`                         BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `title`                      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `intro`                      MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `content`                    MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `banner_id`                  BIGINT                                                                    DEFAULT NULL,
    `country_id`                 VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `publication_time`           TIMESTAMP                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `featured`                   TINYINT(1)                                                       NOT NULL DEFAULT '0',
    `small_banner_id`            BIGINT                                                                    DEFAULT NULL,
    `publication_event_id`       BIGINT                                                                    DEFAULT NULL,
    `type`                       TINYINT                                                          NOT NULL,
    `status`                     TINYINT                                                          NOT NULL DEFAULT '3',
    `rejection_reason`           MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `created_by_developer_id`    BIGINT                                                                    DEFAULT NULL,
    `requested_publication_date` DATE                                                                      DEFAULT NULL,
    `creation_time`              DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by_user_id`         BIGINT                                                                    DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `title_image_id` (`banner_id`),
    KEY `country_id` (`country_id`),
    KEY `country_id_2` (`country_id`, `publication_time`),
    KEY `small_banner_id` (`small_banner_id`),
    KEY `publication_event_id` (`publication_event_id`),
    KEY `created_by_developer_id` (`created_by_developer_id`),
    KEY `created_by_user_id` (`created_by_user_id`),
    CONSTRAINT `article_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `article_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `article_ibfk_3` FOREIGN KEY (`small_banner_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `article_ibfk_4` FOREIGN KEY (`publication_event_id`) REFERENCES `event` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `article_ibfk_5` FOREIGN KEY (`created_by_developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `article_ibfk_6` FOREIGN KEY (`created_by_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_age_group`
--

DROP TABLE IF EXISTS `article_age_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_age_group`
(
    `age_group_id` BIGINT NOT NULL,
    `article_id`   BIGINT NOT NULL,
    PRIMARY KEY (`article_id`, `age_group_id`),
    KEY `age_group_id` (`age_group_id`),
    CONSTRAINT `article_age_group_ibfk_1` FOREIGN KEY (`age_group_id`) REFERENCES `age_group` (`age_group_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `article_age_group_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_app`
--

DROP TABLE IF EXISTS `article_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_app`
(
    `app_id`     BIGINT NOT NULL,
    `article_id` BIGINT NOT NULL,
    PRIMARY KEY (`article_id`, `app_id`),
    KEY `app_id` (`app_id`),
    CONSTRAINT `article_app_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `article_app_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_image`
--

DROP TABLE IF EXISTS `article_image`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_image`
(
    `file_id`    BIGINT NOT NULL,
    `article_id` BIGINT NOT NULL,
    PRIMARY KEY (`article_id`, `file_id`),
    KEY `file_id` (`file_id`),
    CONSTRAINT `article_image_ibfk_1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `article_image_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `article_subject`
--

DROP TABLE IF EXISTS `article_subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `article_subject`
(
    `subject_id` BIGINT NOT NULL,
    `article_id` BIGINT NOT NULL,
    PRIMARY KEY (`article_id`, `subject_id`),
    KEY `subject_id` (`subject_id`),
    CONSTRAINT `article_subject_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `article_subject_ibfk_2` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment`
--

DROP TABLE IF EXISTS `assignment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment`
(
    `assignment_id`      BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `title`              VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `instructions`       MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `age_group_id`       BIGINT                                                           NOT NULL,
    `subject_id`         BIGINT                                                           NOT NULL,
    `creation_time`      DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by_user_id` BIGINT                                                           NOT NULL,
    `belongs_to_ou_id`   BIGINT                                                           NOT NULL,
    `deletion_time`      DATETIME                                                                  DEFAULT NULL,
    `country_id`         VARCHAR(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    PRIMARY KEY (`assignment_id`),
    KEY `age_group_id` (`age_group_id`),
    KEY `subject_id` (`subject_id`),
    KEY `created_by_user_id` (`created_by_user_id`),
    KEY `belongs_to_ou_id` (`belongs_to_ou_id`),
    CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`age_group_id`) REFERENCES `age_group` (`age_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `assignment_ibfk_3` FOREIGN KEY (`created_by_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `assignment_ibfk_4` FOREIGN KEY (`belongs_to_ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_app`
--

DROP TABLE IF EXISTS `assignment_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_app`
(
    `assignment_id` BIGINT NOT NULL,
    `app_id`        BIGINT NOT NULL,
    PRIMARY KEY (`assignment_id`, `app_id`),
    KEY `app_id` (`app_id`),
    CONSTRAINT `assignment_app_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`assignment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `assignment_app_ibfk_2` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_attachment`
--

DROP TABLE IF EXISTS `assignment_attachment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_attachment`
(
    `attachment_id` BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`          VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `type`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `thumbnail_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT 'null for transient thumbnails',
    `content`       MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL COMMENT 'json data',
    `assignment_id` BIGINT                                                           NOT NULL,
    PRIMARY KEY (`attachment_id`),
    KEY `assignment_id` (`assignment_id`),
    CONSTRAINT `assignment_attachment_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`assignment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assignment_metadata`
--

DROP TABLE IF EXISTS `assignment_metadata`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assignment_metadata`
(
    `assignment_id` BIGINT NOT NULL,
    `metadata_id`   BIGINT NOT NULL,
    PRIMARY KEY (`assignment_id`, `metadata_id`),
    KEY `metadata_id` (`metadata_id`),
    CONSTRAINT `assignment_metadata_ibfk_1` FOREIGN KEY (`assignment_id`) REFERENCES `assignment` (`assignment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `assignment_metadata_ibfk_2` FOREIGN KEY (`metadata_id`) REFERENCES `metadata` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `attribute_config`
--

DROP TABLE IF EXISTS `attribute_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_config`
(
    `id`                         BIGINT                                                           NOT NULL,
    `providerName`               VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_extId`                 VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_firstName`             VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_lastName`              VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_email`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_address`               VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_zipcode`               VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_city`                  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_userType`              VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_roletype`              VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `user_schoolid`              VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_groupExtId`           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_parentID`             VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_groupType`            VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_name`                 VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_orgTypeText`          VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_classType`            VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_classesAndGroupTypes` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `membership_extGroupId`      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `membership_extUserId`       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `membership_memberRoleType`  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `group_schoolTypeText`       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authorization_code`
--

DROP TABLE IF EXISTS `authorization_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorization_code`
(
    `id`                 BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `application_id`     BIGINT                                                            DEFAULT NULL,
    `authorization_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`            BIGINT                                                            DEFAULT NULL,
    `scopes`             VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `expiration`         DATETIME                                                          DEFAULT NULL,
    `session_id`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `redirect_uri`       VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index2` (`authorization_code`),
    KEY `index3` (`expiration`),
    KEY `fk_authorization_code_application_access1_idx` (`application_id`),
    CONSTRAINT `fk_authorization_code_application_access1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15248
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `available_country`
--

DROP TABLE IF EXISTS `available_country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `available_country`
(
    `id`                INT                                                             NOT NULL,
    `name`              VARCHAR(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    `country_code`      CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci     NOT NULL DEFAULT '',
    `three_letter_code` CHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci     NOT NULL DEFAULT '',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bkup_license_exclusion`
--

DROP TABLE IF EXISTS `bkup_license_exclusion`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bkup_license_exclusion`
(
    `license_id` BIGINT NOT NULL,
    `extra_id`   BIGINT NOT NULL,
    PRIMARY KEY (`license_id`, `extra_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bokbasen_config`
--

DROP TABLE IF EXISTS `bokbasen_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bokbasen_config`
(
    `id`                        BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `application_access_id`     BIGINT                                                           NOT NULL,
    `external_id`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `only_have_single_licenses` TINYINT                                                          NOT NULL DEFAULT '0',
    `only_have_external_apps`   TINYINT                                                          NOT NULL DEFAULT '0',
    `default_country_id`        VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `in_stock_required`         TINYINT                                                          NOT NULL DEFAULT '0',
    `supports_free_apps`        TINYINT                                                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `application_access_id` (`application_access_id`),
    CONSTRAINT `bokbasen_config_ibfk_1` FOREIGN KEY (`application_access_id`) REFERENCES `application_access` (`application_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget`
--

DROP TABLE IF EXISTS `budget`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget`
(
    `id`                          BIGINT         NOT NULL AUTO_INCREMENT,
    `title`                       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `cost_centre`                 VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `limit`                       DECIMAL(15, 2)                                                   DEFAULT NULL,
    `spent`                       DECIMAL(15, 2) NOT NULL                                          DEFAULT '0.00',
    `creation_time`               DATETIME       NOT NULL,
    `deleted`                     DATETIME                                                         DEFAULT NULL,
    `valid_from`                  DATE                                                             DEFAULT NULL,
    `valid_to`                    DATE                                                             DEFAULT NULL,
    `for_all_subjects`            TINYINT        NOT NULL                                          DEFAULT '1',
    `ou_id`                       BIGINT         NOT NULL,
    `all_school_admin_has_access` TINYINT        NOT NULL                                          DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 87
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget_subject`
--

DROP TABLE IF EXISTS `budget_subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_subject`
(
    `budget_id`  BIGINT NOT NULL,
    `subject_id` BIGINT NOT NULL,
    PRIMARY KEY (`budget_id`, `subject_id`),
    KEY `fk_subject_idx` (`subject_id`),
    CONSTRAINT `fk_budget_subject_budget` FOREIGN KEY (`budget_id`) REFERENCES `budget` (`id`),
    CONSTRAINT `fk_budget_subject_subject` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `budget_user`
--

DROP TABLE IF EXISTS `budget_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_user`
(
    `budget_id` BIGINT NOT NULL,
    `user_id`   BIGINT NOT NULL,
    PRIMARY KEY (`budget_id`, `user_id`),
    KEY `fk_user_idx` (`user_id`),
    CONSTRAINT `fk_budget_user_budget` FOREIGN KEY (`budget_id`) REFERENCES `budget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_budget_user_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `change_log`
--

DROP TABLE IF EXISTS `change_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `change_log`
(
    `id`             BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `entity`         VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `entity_id`      VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `time`           DATETIME                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `user_id`        BIGINT                                                                   DEFAULT NULL,
    `application_id` BIGINT                                                                   DEFAULT NULL,
    `created`        TINYINT                                                         NOT NULL DEFAULT '0',
    `deleted`        TINYINT                                                         NOT NULL DEFAULT '0',
    `changes`        MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`id`),
    KEY `entity_type_entity_application_time_idx` (`entity`, `entity_id`, `application_id`, `time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 86505
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_template`
--

DROP TABLE IF EXISTS `collection_template`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_template`
(
    `id`    INT UNSIGNED                              NOT NULL AUTO_INCREMENT,
    `name`  VARCHAR(50) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `ou_id` BIGINT                                    NOT NULL,
    PRIMARY KEY (`id`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `collection_template_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_template_app`
--

DROP TABLE IF EXISTS `collection_template_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_template_app`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `app_id`    BIGINT       NOT NULL,
    `folder_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `app_id` (`app_id`, `folder_id`),
    KEY `folder_id` (`folder_id`),
    CONSTRAINT `collection_template_app_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `collection_template_app_ibfk_2` FOREIGN KEY (`folder_id`) REFERENCES `collection_template_folder` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_template_assignment`
--

DROP TABLE IF EXISTS `collection_template_assignment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_template_assignment`
(
    `id`                     BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `collection_template_id` INT UNSIGNED    NOT NULL,
    `school_id`              BIGINT          NOT NULL,
    `user_id`                BIGINT DEFAULT NULL,
    `ou_id`                  BIGINT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `collection_template_id` (`collection_template_id`, `school_id`, `user_id`),
    UNIQUE KEY `collection_template_id_2` (`collection_template_id`, `school_id`, `ou_id`),
    KEY `school_id` (`school_id`),
    KEY `user_id` (`user_id`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `collection_template_assignment_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `collection_template_assignment_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
    CONSTRAINT `collection_template_assignment_ibfk_4` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `collection_template_assignment_ibfk_5` FOREIGN KEY (`collection_template_id`) REFERENCES `collection_template` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_template_folder`
--

DROP TABLE IF EXISTS `collection_template_folder`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_template_folder`
(
    `id`          INT UNSIGNED                              NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(50) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `template_id` INT UNSIGNED                              NOT NULL,
    PRIMARY KEY (`id`),
    KEY `template_id` (`template_id`),
    CONSTRAINT `collection_template_folder_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `collection_template` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_template_school_access`
--

DROP TABLE IF EXISTS `collection_template_school_access`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_template_school_access`
(
    `collection_template_id` INT UNSIGNED NOT NULL,
    `school_id`              BIGINT       NOT NULL,
    PRIMARY KEY (`collection_template_id`, `school_id`),
    KEY `school_id` (`school_id`),
    CONSTRAINT `collection_template_school_access_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `collection_template_school_access_ibfk_3` FOREIGN KEY (`collection_template_id`) REFERENCES `collection_template` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `collection_widget`
--

DROP TABLE IF EXISTS `collection_widget`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_widget`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT,
    `user_id`        BIGINT NOT NULL,
    `school_id`      BIGINT NOT NULL,
    `index`          INT    NOT NULL,
    `widget_size_id` BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_id_widget_size_id_school_id_idx` (`user_id`, `widget_size_id`, `school_id`),
    KEY `school_id` (`school_id`),
    KEY `widget_size_id` (`widget_size_id`),
    CONSTRAINT `collection_widget_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
    CONSTRAINT `collection_widget_ibfk_3` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `collection_widget_ibfk_4` FOREIGN KEY (`widget_size_id`) REFERENCES `widget_size` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7689
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compatibility_target`
--

DROP TABLE IF EXISTS `compatibility_target`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compatibility_target`
(
    `id`   BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `type` TINYINT                                                         NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config_google_sync`
--

DROP TABLE IF EXISTS `config_google_sync`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_google_sync`
(
    `id`                         BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `config_name`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `create_new_user`            TINYINT                                                          NOT NULL DEFAULT '0',
    `domain`                     VARCHAR(126) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `extended_user_params`       TINYINT                                                          NOT NULL DEFAULT '0',
    `group_email_template`       VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `group_name_template`        VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `match_on_skolon_email`      TINYINT                                                          NOT NULL DEFAULT '0',
    `prefix_main_domain`         VARCHAR(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `prefix_sub_domain`          VARCHAR(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `strings_concat`             VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `strings_replace`            VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `skip_classroom`             TINYINT                                                          NOT NULL DEFAULT '0',
    `skip_groups`                TINYINT                                                          NOT NULL DEFAULT '0',
    `skip_users`                 TINYINT                                                          NOT NULL DEFAULT '0',
    `suspend_users`              TINYINT                                                          NOT NULL DEFAULT '0',
    `suffix_sync_group`          VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `update_org_unit_path`       TINYINT                                                          NOT NULL DEFAULT '0',
    `use_skolon_email_new_users` TINYINT                                                          NOT NULL DEFAULT '0',
    `creation_time`              DATETIME                                                                  DEFAULT CURRENT_TIMESTAMP,
    `update_time`                DATETIME                                                                  DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `deleted`                    DATETIME                                                                  DEFAULT NULL,
    `ou_id`                      BIGINT                                                           NOT NULL,
    `simulate`                   TINYINT                                                          NOT NULL DEFAULT '0',
    `is_logging`                 TINYINT                                                          NOT NULL DEFAULT '0',
    `skip_schemas`               TINYINT                                                          NOT NULL DEFAULT '0',
    `skip_orgunits`              TINYINT                                                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `config_name_unique` (`config_name`),
    UNIQUE KEY `domain_unique` (`domain`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `config_google_sync_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config_google_sync_ou`
--

DROP TABLE IF EXISTS `config_google_sync_ou`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_google_sync_ou`
(
    `id`                    BIGINT NOT NULL AUTO_INCREMENT,
    `ou_id`                 BIGINT NOT NULL,
    `config_google_sync_id` BIGINT NOT NULL,
    `abbrevation`           VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `cgs_id_ou_id_unique` (`config_google_sync_id`, `ou_id`),
    UNIQUE KEY `abbrevation_unique` (`abbrevation`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `config_google_sync_ou_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `config_google_sync_ou_ibfk_2` FOREIGN KEY (`config_google_sync_id`) REFERENCES `config_google_sync` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_person`
--

DROP TABLE IF EXISTS `contact_person`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_person`
(
    `id`                     BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `public_id`              VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `contact_person_type_id` BIGINT                                                           DEFAULT NULL,
    `user_id`                BIGINT                                                           DEFAULT NULL,
    `ou_id`                  BIGINT                                                           DEFAULT NULL,
    `developer_id`           BIGINT                                                           DEFAULT NULL,
    `integration_id`         BIGINT                                                           DEFAULT NULL,
    `first_name`             VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `last_name`              VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `email`                  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `phone1`                 VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `creation_time`          DATETIME                                                        NOT NULL,
    `title`                  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `deleted`                DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `public_id_UNIQUE` (`public_id`),
    KEY `fk_user_id_idx` (`user_id`),
    KEY `fk_ou_id_idx` (`ou_id`),
    CONSTRAINT `fk_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 81
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact_person_type`
--

DROP TABLE IF EXISTS `contact_person_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_person_type`
(
    `id`            BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `title`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `type`          TINYINT                                                         NOT NULL COMMENT '1 = OU type 1\n2 = OU type 2\n3 = OU type 3\n4 = OU type 4\n5 = Integration\n6 = Developer',
    `sub_type`      TINYINT  DEFAULT NULL,
    `creation_time` DATETIME DEFAULT NULL,
    `deleted`       DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract`
(
    `contract_id`     BIGINT NOT NULL AUTO_INCREMENT,
    `name`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `contact`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `contact_phone`   VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `contact_email`   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `developer_id`    BIGINT                                                           DEFAULT NULL,
    `expiration_time` DATETIME                                                         DEFAULT NULL,
    `description`     MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`contract_id`),
    KEY `fk_contract_developer1_idx` (`developer_id`),
    CONSTRAINT `fk_contract_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 573
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_app`
--

DROP TABLE IF EXISTS `contract_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_app`
(
    `contract_id` BIGINT NOT NULL,
    `app_id`      BIGINT NOT NULL,
    PRIMARY KEY (`contract_id`, `app_id`),
    KEY `fk_contract_app_app1_idx` (`app_id`),
    CONSTRAINT `fk_contract_app_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_contract_app_contract1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_school`
--

DROP TABLE IF EXISTS `contract_school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_school`
(
    `school_id`     BIGINT NOT NULL,
    `contract_id`   BIGINT NOT NULL,
    `creation_time` DATETIME DEFAULT NULL,
    PRIMARY KEY (`school_id`, `contract_id`),
    KEY `fk_contract_school_contract1_idx` (`contract_id`),
    CONSTRAINT `fk_contract_school_contract1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_contract_school_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contract_user`
--

DROP TABLE IF EXISTS `contract_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_user`
(
    `contract_id` BIGINT NOT NULL COMMENT '		',
    `user_id`     BIGINT NOT NULL,
    PRIMARY KEY (`contract_id`, `user_id`),
    KEY `fk_contract_user_user1_idx` (`user_id`),
    CONSTRAINT `fk_contract_user_contract1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_contract_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation`
(
    `conversation_id` BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `c_time`          DATETIME DEFAULT NULL,
    `creator`         BIGINT   DEFAULT NULL,
    PRIMARY KEY (`conversation_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conversation_member`
--

DROP TABLE IF EXISTS `conversation_member`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversation_member`
(
    `member_id`       BIGINT NOT NULL AUTO_INCREMENT,
    `conversation_Id` BIGINT DEFAULT NULL,
    `user_id`         BIGINT DEFAULT NULL,
    PRIMARY KEY (`member_id`),
    KEY `fk_conversation_member_conversation1_idx` (`conversation_Id`),
    KEY `fk_conversation_member_user1_idx` (`user_id`),
    CONSTRAINT `fk_conversation_member_conversation1` FOREIGN KEY (`conversation_Id`) REFERENCES `conversation` (`conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_conversation_member_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 62
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country`
(
    `name`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `code`                VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT '',
    `three_letter_code`   VARCHAR(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `currency_id`         VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `default_language_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `public`              TINYINT                                                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`code`),
    UNIQUE KEY `name_UNIQUE` (`name`),
    UNIQUE KEY `three_letter_code_UNIQUE` (`three_letter_code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country_developer`
--

DROP TABLE IF EXISTS `country_developer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_developer`
(
    `country_code` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `developer_id` BIGINT                                                         NOT NULL,
    PRIMARY KEY (`country_code`, `developer_id`),
    KEY `developer_id` (`developer_id`),
    CONSTRAINT `country_developer_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`),
    CONSTRAINT `country_developer_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency`
(
    `code`   VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `public` TINYINT                                                        NOT NULL DEFAULT '0',
    PRIMARY KEY (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_revenue_snapshot`
--

DROP TABLE IF EXISTS `customer_revenue_snapshot`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_revenue_snapshot`
(
    `id`                     BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `date`                   DATE                                                           NOT NULL,
    `country_id`             VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `currency_id`            VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `new_licensed_users`     INT                                                            NOT NULL,
    `removed_licensed_users` INT                                                            NOT NULL,
    `total_licensed_users`   INT                                                            NOT NULL,
    `new_yearly_revenue`     DECIMAL(14, 4)                                                 NOT NULL,
    `total_yearly_revenue`   DECIMAL(14, 4)                                                 NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_subscription_period`
--

DROP TABLE IF EXISTS `customer_subscription_period`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_subscription_period`
(
    `id`              BIGINT         NOT NULL AUTO_INCREMENT,
    `subscription_id` BIGINT         NOT NULL,
    `start_date`      DATE           NOT NULL,
    `end_date`        DATE           NOT NULL,
    `users`           INT            NOT NULL,
    `price`           DECIMAL(13, 4) NOT NULL,
    `is_projection`   TINYINT        NOT NULL,
    PRIMARY KEY (`id`),
    KEY `subscription_fk` (`subscription_id`),
    CONSTRAINT `customer_subscription_period_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 102
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_region`
--

DROP TABLE IF EXISTS `data_region`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_region`
(
    `id`           BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `country_id`   VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `address`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `postal_code`  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `city`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `icon_file_id` BIGINT                                                           DEFAULT NULL,
    `deleted`      DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `icon_file_id` (`icon_file_id`),
    CONSTRAINT `data_region_ibfk_1` FOREIGN KEY (`icon_file_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_region_app`
--

DROP TABLE IF EXISTS `data_region_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_region_app`
(
    `data_region_id` BIGINT NOT NULL,
    `app_id`         BIGINT NOT NULL,
    PRIMARY KEY (`data_region_id`, `app_id`),
    KEY `app_id` (`app_id`),
    CONSTRAINT `data_region_app_ibfk_1` FOREIGN KEY (`data_region_id`) REFERENCES `data_region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `data_region_app_ibfk_2` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `data_region_organization`
--

DROP TABLE IF EXISTS `data_region_organization`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_region_organization`
(
    `data_region_id`  BIGINT NOT NULL,
    `organization_id` BIGINT NOT NULL,
    PRIMARY KEY (`data_region_id`, `organization_id`),
    KEY `organization_id` (`organization_id`),
    CONSTRAINT `data_region_organization_ibfk_1` FOREIGN KEY (`data_region_id`) REFERENCES `data_region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `data_region_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `default_module`
--

DROP TABLE IF EXISTS `default_module`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `default_module`
(
    `school_id`    BIGINT NOT NULL,
    `module_id`    BIGINT NOT NULL,
    `user_type_id` BIGINT NOT NULL,
    PRIMARY KEY (`school_id`, `module_id`, `user_type_id`),
    KEY `fk_default_module_module1_idx` (`module_id`),
    CONSTRAINT `fk_default_module_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_default_module_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer`
(
    `developer_id`                              BIGINT                                                            NOT NULL AUTO_INCREMENT,
    `name`                                      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `address`                                   VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `zipcode`                                   VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `city`                                      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `phone`                                     VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `email`                                     VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `web`                                       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `sale_fee`                                  DECIMAL(5, 2)                                                     NOT NULL DEFAULT '20.00',
    `distribution_fee`                          DECIMAL(5, 2)                                                     NOT NULL DEFAULT '10.00',
    `migration_fee`                             DECIMAL(5, 2)                                                     NOT NULL DEFAULT '5.00',
    `internal_info`                             VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `fixed_fee`                                 BIGINT                                                                     DEFAULT NULL,
    `month_charged`                             BIGINT                                                                     DEFAULT NULL,
    `country_id`                                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `invoice_address`                           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `invoice_city`                              VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `invoice_zipcode`                           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `invoice_country_id`                        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `creation_time`                             DATETIME                                                                   DEFAULT NULL,
    `sales_enabled`                             TINYINT(1)                                                                 DEFAULT '1',
    `icon_id`                                   BIGINT                                                                     DEFAULT NULL,
    `title`                                     VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `primary_country_id`                        VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    NOT NULL DEFAULT 'se',
    `primary_language_id`                       VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    NOT NULL DEFAULT 'sv',
    `description`                               MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `last_updated_apps`                         DATETIME                                                                   DEFAULT NULL,
    `remove_user_data_url`                      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `total_users`                               INT                                                               NOT NULL DEFAULT '0',
    `active_users`                              INT                                                               NOT NULL DEFAULT '0',
    `remove_group_data_url`                     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `remove_group_data_username`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `remove_group_data_password`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `folder_url`                                VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `users_billed`                              INT                                                               NOT NULL DEFAULT '0',
    `billing_model`                             TINYINT                                                           NOT NULL DEFAULT '1',
    `remove_user_data_username`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `remove_user_data_password`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `is_external_partner`                       TINYINT                                                           NOT NULL DEFAULT '0',
    `api_change_notification_url`               VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `required_scopes`                           VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `invoice_email`                             VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `e_invoice_number`                          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `organization_number`                       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `visma_number`                              VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `background_file_id`                        BIGINT                                                                     DEFAULT NULL,
    `vat_registration_id`                       VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `partner_statistics_enabled`                TINYINT(1)                                                                 DEFAULT '0',
    `first_purchase_requires_manual_processing` TINYINT                                                           NOT NULL DEFAULT '0',
    `subscription_cancellation_notice_period`   INT                                                               NOT NULL DEFAULT '90',
    `estimated_scopes`                          VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    `data_hosting_status`                       TINYINT                                                           NOT NULL DEFAULT '0',
    `visma_company_id`                          BIGINT                                                                     DEFAULT NULL,
    `general_terms_url`                         VARCHAR(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    PRIMARY KEY (`developer_id`),
    KEY `name_idx` (`name`),
    KEY `background_file_id` (`background_file_id`),
    KEY `primary_country_id_fk` (`primary_country_id`),
    KEY `primary_language_id_fk` (`primary_language_id`),
    KEY `visma_company_id` (`visma_company_id`),
    CONSTRAINT `developer_ibfk_1` FOREIGN KEY (`background_file_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `developer_ibfk_2` FOREIGN KEY (`primary_country_id`) REFERENCES `country` (`code`),
    CONSTRAINT `developer_ibfk_3` FOREIGN KEY (`primary_language_id`) REFERENCES `language` (`code`),
    CONSTRAINT `developer_ibfk_4` FOREIGN KEY (`visma_company_id`) REFERENCES `visma_company` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 137
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_app_usage_graph`
--

DROP TABLE IF EXISTS `developer_app_usage_graph`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_app_usage_graph`
(
    `developer_id`    BIGINT NOT NULL,
    `date`            DATE   NOT NULL,
    `usage`           DOUBLE NOT NULL,
    `visits_per_user` DOUBLE NOT NULL,
    `unique_visits`   INT    NOT NULL,
    PRIMARY KEY (`developer_id`, `date`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_billable_user`
--

DROP TABLE IF EXISTS `developer_billable_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_billable_user`
(
    `user_id`          BIGINT NOT NULL,
    `developer_id`     BIGINT NOT NULL,
    `creation_time`    DATETIME DEFAULT CURRENT_TIMESTAMP,
    `license_group_id` BIGINT   DEFAULT NULL,
    `school_id`        BIGINT   DEFAULT NULL,
    PRIMARY KEY (`developer_id`, `user_id`),
    CONSTRAINT `developer_billable_user_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_contact`
--

DROP TABLE IF EXISTS `developer_contact`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_contact`
(
    `user_id`      BIGINT NOT NULL,
    `contact_type` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT '1 = marketing, 2 = technical, 3 = economy, 4 = info',
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_payment`
--

DROP TABLE IF EXISTS `developer_payment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_payment`
(
    `id`            BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME                                                       NOT NULL,
    `invoice_date`  DATE                                                           NOT NULL,
    `type`          TINYINT                                                        NOT NULL COMMENT '1 = invoice, 2 = payment',
    `period_start`  DATE                                                           NOT NULL,
    `period_end`    DATE                                                           NOT NULL,
    `amount`        DECIMAL(10, 2)                                                          DEFAULT NULL,
    `developer_id`  BIGINT                                                                  DEFAULT NULL,
    `file_id`       BIGINT                                                                  DEFAULT NULL,
    `vat`           DECIMAL(10, 2)                                                          DEFAULT NULL,
    `currency_id`   VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'SEK',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_processed_school`
--

DROP TABLE IF EXISTS `developer_processed_school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_processed_school`
(
    `developer_id`   BIGINT NOT NULL,
    `school_id`      BIGINT NOT NULL,
    `processed_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`developer_id`, `school_id`),
    KEY `school_id` (`school_id`),
    CONSTRAINT `developer_processed_school_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `developer_processed_school_ibfk_2` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_support_url`
--

DROP TABLE IF EXISTS `developer_support_url`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer_support_url`
(
    `id`           BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `developer_id` BIGINT                                                           NOT NULL,
    `country_id`   VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `url`          VARCHAR(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `developer_id` (`developer_id`, `country_id`),
    KEY `country_id` (`country_id`),
    CONSTRAINT `developer_support_url_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE,
    CONSTRAINT `developer_support_url_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_token`
--

DROP TABLE IF EXISTS `device_token`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_token`
(
    `user_id`    BIGINT                                                       NOT NULL,
    `token`      CHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_agent` VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`user_id`, `token`),
    CONSTRAINT `device_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_agreement`
--

DROP TABLE IF EXISTS `discount_agreement`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_agreement`
(
    `id`                           BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`                         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `creation_time`                DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`                  DATETIME                                                                  DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `applicable_to_order_quotes`   TINYINT                                                          NOT NULL,
    `combine_with_other_discounts` TINYINT                                                                   DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_agreement_developer`
--

DROP TABLE IF EXISTS `discount_agreement_developer`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_agreement_developer`
(
    `discount_agreement_period_id` BIGINT NOT NULL,
    `developer_id`                 BIGINT NOT NULL,
    `discount`                     DECIMAL(13, 4) DEFAULT NULL,
    `surcharge`                    DECIMAL(13, 4) DEFAULT NULL,
    PRIMARY KEY (`discount_agreement_period_id`, `developer_id`),
    KEY `developer_id` (`developer_id`),
    CONSTRAINT `discount_agreement_developer_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `discount_agreement_developer_ibfk_3` FOREIGN KEY (`discount_agreement_period_id`) REFERENCES `discount_agreement_period` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_agreement_organization`
--

DROP TABLE IF EXISTS `discount_agreement_organization`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_agreement_organization`
(
    `discount_agreement_id` BIGINT NOT NULL,
    `organization_id`       BIGINT NOT NULL,
    PRIMARY KEY (`discount_agreement_id`, `organization_id`),
    KEY `organization_id` (`organization_id`),
    CONSTRAINT `discount_agreement_organization_ibfk_1` FOREIGN KEY (`discount_agreement_id`) REFERENCES `discount_agreement` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `discount_agreement_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_agreement_period`
--

DROP TABLE IF EXISTS `discount_agreement_period`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_agreement_period`
(
    `id`                       BIGINT NOT NULL AUTO_INCREMENT,
    `discount_agreement_id`    BIGINT NOT NULL,
    `to_date`                  DATE           DEFAULT NULL,
    `from_date`                DATE           DEFAULT NULL,
    `global_discount`          DECIMAL(13, 4) DEFAULT NULL,
    `global_surcharge`         DECIMAL(13, 4) DEFAULT NULL,
    `single_license_discount`  DECIMAL(13, 4) DEFAULT NULL,
    `single_license_surcharge` DECIMAL(13, 4) DEFAULT NULL,
    `class_license_discount`   DECIMAL(13, 4) DEFAULT NULL,
    `class_license_surcharge`  DECIMAL(13, 4) DEFAULT NULL,
    `school_license_discount`  DECIMAL(13, 4) DEFAULT NULL,
    `school_license_surcharge` DECIMAL(13, 4) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `discount_agreement_id` (`discount_agreement_id`),
    CONSTRAINT `discount_agreement_period_ibfk_1` FOREIGN KEY (`discount_agreement_id`) REFERENCES `discount_agreement` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_code`
--

DROP TABLE IF EXISTS `discount_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_code`
(
    `id`            BIGINT         NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME       NOT NULL                                          DEFAULT CURRENT_TIMESTAMP,
    `deleted`       DATETIME                                                         DEFAULT NULL,
    `developer_id`  BIGINT         NOT NULL,
    `code`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `deleted_code`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `end_date`      DATE                                                             DEFAULT NULL,
    `discount`      DECIMAL(13, 4) NOT NULL,
    `is_single_use` TINYINT        NOT NULL                                          DEFAULT '0',
    `is_used`       TINYINT        NOT NULL                                          DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`),
    KEY `developer_id` (`developer_id`),
    CONSTRAINT `discount_code_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_ladder`
--

DROP TABLE IF EXISTS `discount_ladder`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_ladder`
(
    `id`                  BIGINT                                    NOT NULL AUTO_INCREMENT,
    `developer_id`        BIGINT                                    NOT NULL,
    `for_all_orgs`        TINYINT  DEFAULT '0',
    `applies_to_all_apps` TINYINT  DEFAULT '0',
    `start_date`          DATE                                      NOT NULL,
    `expiration_date`     DATE     DEFAULT NULL,
    `creation_time`       DATETIME DEFAULT CURRENT_TIMESTAMP,
    `deleted`             DATETIME DEFAULT NULL,
    `step_type`           VARCHAR(20) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `country_id`          VARCHAR(2) COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    PRIMARY KEY (`id`),
    KEY `developer_id` (`developer_id`),
    CONSTRAINT `discount_ladder_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_ladder_app`
--

DROP TABLE IF EXISTS `discount_ladder_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_ladder_app`
(
    `app_id`             BIGINT NOT NULL,
    `discount_ladder_id` BIGINT NOT NULL,
    PRIMARY KEY (`app_id`, `discount_ladder_id`),
    KEY `discount_ladder_id` (`discount_ladder_id`),
    CONSTRAINT `discount_ladder_app_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `discount_ladder_app_ibfk_2` FOREIGN KEY (`discount_ladder_id`) REFERENCES `discount_ladder` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_ladder_assignee`
--

DROP TABLE IF EXISTS `discount_ladder_assignee`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_ladder_assignee`
(
    `id`                 BIGINT NOT NULL AUTO_INCREMENT,
    `discount_ladder_id` BIGINT NOT NULL,
    `ou_id`              BIGINT                                                           DEFAULT NULL,
    `customer_name`      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `code`               VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `activated`          DATETIME                                                         DEFAULT NULL,
    `creation_time`      DATETIME                                                         DEFAULT CURRENT_TIMESTAMP,
    `update_time`        DATETIME                                                         DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `discount_ladder_id` (`discount_ladder_id`, `ou_id`),
    UNIQUE KEY `code` (`code`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `discount_ladder_assignee_ibfk_1` FOREIGN KEY (`discount_ladder_id`) REFERENCES `discount_ladder` (`id`),
    CONSTRAINT `discount_ladder_assignee_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount_ladder_step`
--

DROP TABLE IF EXISTS `discount_ladder_step`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_ladder_step`
(
    `id`                 BIGINT NOT NULL AUTO_INCREMENT,
    `discount_ladder_id` BIGINT NOT NULL,
    `license_quantity`   INT    NOT NULL,
    `discount_percent`   INT    NOT NULL,
    `creation_time`      DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `discount_ladder_id` (`discount_ladder_id`),
    CONSTRAINT `discount_ladder_step_ibfk_1` FOREIGN KEY (`discount_ladder_id`) REFERENCES `discount_ladder` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `doc_user`
--

DROP TABLE IF EXISTS `doc_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doc_user`
(
    `id`       BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `user`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `password` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domain`
(
    `id`             BIGINT UNSIGNED NOT NULL,
    `name`           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT 'table name',
    `value`          INT                                                             DEFAULT NULL COMMENT 'table value',
    `human_readable` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dups`
--

DROP TABLE IF EXISTS `dups`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dups`
(
    `id`         BIGINT NOT NULL AUTO_INCREMENT,
    `license_id` BIGINT DEFAULT NULL,
    `school_id`  BIGINT DEFAULT NULL,
    `version_id` BIGINT DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 39726
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `early_provisioning_notification`
--

DROP TABLE IF EXISTS `early_provisioning_notification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `early_provisioning_notification`
(
    `ou_id`                  BIGINT   NOT NULL,
    `last_notification_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`ou_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event`
(
    `id`            BIGINT   NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME NOT NULL                                                DEFAULT CURRENT_TIMESTAMP,
    `deleted`       DATETIME                                                         DEFAULT NULL,
    `title`         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `text`          MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci COMMENT 'Content in JSON format',
    `type`          VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL COMMENT '1 = NEW_BLOGPOST\n2 = LICENSE_ADDED\n3 = LICENSE_REMOVED\n3 = APP_ADDED_TO_COLLECTION\n5 = SYSTEM_MESSAGE\n6 = SHARE',
    `app_id`        BIGINT                                                           DEFAULT NULL,
    `user_id`       BIGINT                                                           DEFAULT NULL,
    `url`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `mail_sent`     TINYINT                                                          DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `type_mail_sent_idx` (`type`, `mail_sent`),
    KEY `creation_time_type_idx` (`creation_time`, `type`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 34269
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_comment`
--

DROP TABLE IF EXISTS `event_comment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_comment`
(
    `comment_id` BIGINT    NOT NULL AUTO_INCREMENT,
    `event_id`   BIGINT    NOT NULL,
    `user_id`    BIGINT    NOT NULL,
    `comment`    MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `c_time`     TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`comment_id`),
    KEY `fk_event_comment_event1_idx` (`event_id`),
    KEY `fk_event_comment_user1_idx` (`user_id`),
    CONSTRAINT `fk_event_comment_event1` FOREIGN KEY (`event_id`) REFERENCES `event_old` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_event_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 91
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_like`
--

DROP TABLE IF EXISTS `event_like`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_like`
(
    `like_id`  BIGINT    NOT NULL AUTO_INCREMENT,
    `event_id` BIGINT    NOT NULL,
    `user_id`  BIGINT    NOT NULL,
    `c_time`   TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`like_id`),
    KEY `fk_event_like_event1_idx` (`event_id`),
    KEY `fk_event_like_user1_idx` (`user_id`),
    CONSTRAINT `fk_event_like_event1` FOREIGN KEY (`event_id`) REFERENCES `event_old` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 168
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_old`
--

DROP TABLE IF EXISTS `event_old`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_old`
(
    `event_id`         BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `app_id`           BIGINT                                                                  DEFAULT NULL,
    `user_id`          BIGINT                                                                  DEFAULT NULL,
    `school_id`        BIGINT                                                                  DEFAULT NULL,
    `content`          MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL COMMENT 'json data',
    `template_id`      INT                                                                     DEFAULT NULL,
    `bg_image_file_id` BIGINT                                                                  DEFAULT NULL,
    `c_time`           DATETIME                                                                DEFAULT NULL,
    `public_id`        VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `type`             TINYINT                                                        NOT NULL DEFAULT '1' COMMENT '1 = message\n2 = license added\n3 = license removed\n4 = app added to my collection',
    `comments_active`  TINYINT                                                                 DEFAULT '0',
    `likes_active`     TINYINT                                                                 DEFAULT '0',
    `new_url`          VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `new_text`         MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`event_id`),
    KEY `fk_news_feed_app1_idx` (`app_id`),
    KEY `fk_news_feed_user1_idx` (`user_id`),
    KEY `fk_event_file1_idx` (`bg_image_file_id`),
    KEY `fk_event_template1_idx` (`template_id`),
    KEY `fk_event_ou1_idx` (`school_id`),
    CONSTRAINT `fk_event_file1` FOREIGN KEY (`bg_image_file_id`) REFERENCES `file` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_event_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_event_template1` FOREIGN KEY (`template_id`) REFERENCES `template` (`template_id`),
    CONSTRAINT `fk_news_feed_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10284
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_recipient`
--

DROP TABLE IF EXISTS `event_recipient`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_recipient`
(
    `id`       BIGINT  NOT NULL AUTO_INCREMENT,
    `event_id` BIGINT  NOT NULL,
    `user_id`  BIGINT  NOT NULL,
    `read`     TINYINT NOT NULL DEFAULT '0',
    `informed` TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `fk_event_target_event1_idx` (`event_id`),
    CONSTRAINT `fk_event_recipient_event1` FOREIGN KEY (`event_id`) REFERENCES `event_old` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 82676
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `event_target`
--

DROP TABLE IF EXISTS `event_target`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_target`
(
    `event_target_id` BIGINT NOT NULL AUTO_INCREMENT,
    `event_id`        BIGINT NOT NULL,
    `target_id`       BIGINT DEFAULT NULL,
    `type`            INT    DEFAULT NULL COMMENT 'user, group, school, app',
    PRIMARY KEY (`event_target_id`),
    KEY `fk_event_target_event1_idx` (`event_id`),
    CONSTRAINT `fk_event_target_event1` FOREIGN KEY (`event_id`) REFERENCES `event_old` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 21394
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_app_subscription`
--

DROP TABLE IF EXISTS `external_app_subscription`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_app_subscription`
(
    `id`                BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `creation_time`     DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `name`              VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `app_id`            BIGINT                                                           NOT NULL,
    `subscription_id`   BIGINT                                                           NOT NULL,
    `quantity`          INT                                                              NOT NULL,
    `app_version_id`    BIGINT                                                                    DEFAULT NULL,
    `license_target`    TINYINT                                                          NOT NULL,
    `total_max_limit`   INT                                                                       DEFAULT NULL,
    `teacher_max_limit` INT                                                                       DEFAULT NULL,
    `student_max_limit` INT                                                                       DEFAULT NULL,
    `product_id`        BIGINT                                                                    DEFAULT NULL,
    `article_number`    VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `app_id` (`app_id`),
    KEY `subscription_id` (`subscription_id`),
    KEY `app_version_id` (`app_version_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `external_app_subscription_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `external_app_subscription_ibfk_2` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `external_app_subscription_ibfk_3` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `external_app_subscription_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 44
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_identity_provider_id`
--

DROP TABLE IF EXISTS `external_identity_provider_id`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `external_identity_provider_id`
(
    `id`                   BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `user_id`              BIGINT                                                           NOT NULL,
    `identity_provider_id` VARCHAR(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `identity_type`        VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `creation_time`        DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_id` (`user_id`, `identity_provider_id`, `identity_type`),
    CONSTRAINT `external_identity_provider_id_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file`
(
    `file_id`                BIGINT     NOT NULL AUTO_INCREMENT,
    `file_name`              VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `content_type`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `gs_object_name`         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `size`                   INT UNSIGNED                                                      DEFAULT NULL,
    `url`                    VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `signed_url`             VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `signed_url_expiry_time` DATETIME                                                          DEFAULT NULL,
    `school_id`              BIGINT                                                            DEFAULT NULL,
    `group_id`               BIGINT                                                            DEFAULT NULL,
    `user_id`                BIGINT                                                            DEFAULT NULL,
    `event_id`               BIGINT                                                            DEFAULT NULL,
    `type`                   TINYINT                                                           DEFAULT NULL COMMENT '10 = school original\n20 = group original\n21 = group small\n22 = group large\n30 = user original\n31 = user small\n32 = user large\n40 = event original',
    `temporary`              TINYINT(1)                                                        DEFAULT '0',
    `resizable`              TINYINT(1) NOT NULL                                               DEFAULT '0',
    `default_size`           INT                                                               DEFAULT NULL,
    `original_object_name`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    PRIMARY KEY (`file_id`),
    KEY `fk_file_event1_idx` (`event_id`),
    KEY `fk_file_user_group1_idx` (`group_id`),
    KEY `fk_file_user1_idx` (`user_id`),
    KEY `fk_file_ou1_idx` (`school_id`),
    KEY `file_gs_object_name_idx` (`gs_object_name`) USING BTREE,
    KEY `gs_object_name_idx` (`gs_object_name`),
    CONSTRAINT `fk_file_event1` FOREIGN KEY (`event_id`) REFERENCES `event_old` (`event_id`) ON UPDATE CASCADE,
    CONSTRAINT `fk_file_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_file_user_group1` FOREIGN KEY (`group_id`) REFERENCES `ou` (`id`) ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 387335
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history`
(
    `installed_rank` INT                                                               NOT NULL,
    `version`        VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `description`    VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `type`           VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `script`         VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `checksum`       INT                                                                        DEFAULT NULL,
    `installed_by`   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `installed_on`   TIMESTAMP                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `execution_time` INT                                                               NOT NULL,
    `success`        TINYINT(1)                                                        NOT NULL,
    PRIMARY KEY (`installed_rank`),
    KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gyldendal_imported_license`
--

DROP TABLE IF EXISTS `gyldendal_imported_license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyldendal_imported_license`
(
    `id`                      INT                                                              NOT NULL AUTO_INCREMENT,
    `license_id`              VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `max_nr_of_licenses`      INT                                                              NOT NULL,
    `owner_ou_id`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `app_id`                  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `creation_time`           DATETIME                                                         NOT NULL,
    `expiration_time`         DATETIME                                                         NOT NULL,
    `start_time`              DATE                                                             NOT NULL,
    `developer_id`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `source`                  INT                                                              NOT NULL,
    `handling_state`          VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `check_sync`              TINYINT UNSIGNED                                                 NOT NULL DEFAULT '0',
    `requires_complete_reset` TINYINT UNSIGNED                                                 NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gyldendal_imported_license_groups`
--

DROP TABLE IF EXISTS `gyldendal_imported_license_groups`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyldendal_imported_license_groups`
(
    `id`                              INT UNSIGNED                                                     NOT NULL AUTO_INCREMENT,
    `gyldendal_imported_license_id`   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `license_group_id`                BIGINT UNSIGNED                                                  NOT NULL,
    `import_date`                     DATETIME                                                         NOT NULL,
    `latest_assigned_user_id`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `has_unhandled_assignment_change` TINYINT                                                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gyldendal_license_import`
--

DROP TABLE IF EXISTS `gyldendal_license_import`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyldendal_license_import`
(
    `id`                              INT                                                             NOT NULL AUTO_INCREMENT,
    `source`                          VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `import_date`                     DATETIME                                                        NOT NULL,
    `number_of_imported_licenses`     INT UNSIGNED                                                    NOT NULL,
    `number_of_licensegroups_created` INT UNSIGNED                                                    NOT NULL,
    `sync_completed`                  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 175
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gyldendal_schools`
--

DROP TABLE IF EXISTS `gyldendal_schools`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gyldendal_schools`
(
    `Id`           INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ou_id`        BIGINT       NOT NULL,
    `is_onboarded` TINYINT      NOT NULL,
    PRIMARY KEY (`Id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hidden_school_app`
--

DROP TABLE IF EXISTS `hidden_school_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hidden_school_app`
(
    `id`        BIGINT NOT NULL AUTO_INCREMENT,
    `school_id` BIGINT NOT NULL,
    `app_id`    BIGINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_school_app_whitelist_app1_idx` (`app_id`),
    KEY `fk_hidden_school_app_ou1_idx` (`school_id`),
    CONSTRAINT `fk_hidden_school_app_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_school_app_whitelist_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 91
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `id_counter`
--

DROP TABLE IF EXISTS `id_counter`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `id_counter`
(
    `tag`     VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `counter` BIGINT                                                          NOT NULL DEFAULT '1',
    PRIMARY KEY (`tag`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idp`
--

DROP TABLE IF EXISTS `idp`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idp`
(
    `id`                  BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `name`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `entity_id`           VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `skolon_id_attribute` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `idp_id_attribute`    VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `url_segment`         VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `creation_time`       DATETIME                                                                 DEFAULT NULL,
    `update_time`         DATETIME                                                                 DEFAULT NULL,
    `idp_regex`           VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `skolon_regex`        VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `provider`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `authsource`          VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'skolon',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idp_log`
--

DROP TABLE IF EXISTS `idp_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idp_log`
(
    `id`            BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `session_id`    VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `creation_time` TIMESTAMP                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `idp_id`        BIGINT                                                          NOT NULL,
    `type`          VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `is_error`      TINYINT                                                         NOT NULL DEFAULT '0',
    `description`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `idp_id_creation_time_type_idx` (`idp_id`, `creation_time`, `type`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `idp_test_user`
--

DROP TABLE IF EXISTS `idp_test_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `idp_test_user`
(
    `id`       BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `role`     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `idp_id`   BIGINT                                                           NOT NULL,
    PRIMARY KEY (`id`),
    KEY `idp_id` (`idp_id`),
    CONSTRAINT `idp_test_user_ibfk_1` FOREIGN KEY (`idp_id`) REFERENCES `idp` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imported_user`
--

DROP TABLE IF EXISTS `imported_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imported_user`
(
    `id`              BIGINT NOT NULL AUTO_INCREMENT,
    `first_name`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `last_name`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `phone1`          VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `email`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `user_name`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_name`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `password`        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `hashed_password` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `import_time`     DATETIME                                                         DEFAULT NULL,
    `import_id`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_id`       BIGINT                                                           DEFAULT NULL,
    `user_type`       INT                                                              DEFAULT NULL,
    `import_done`     TINYINT                                                          DEFAULT '0',
    `new_user_id`     BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `import_time_idx` (`import_time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1117
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integration`
--

DROP TABLE IF EXISTS `integration`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration`
(
    `id`                           BIGINT  NOT NULL AUTO_INCREMENT,
    `name`                         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `creation_time`                DATETIME                                                         DEFAULT NULL,
    `deleted`                      DATETIME                                                         DEFAULT NULL,
    `short_description`            VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`                  MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `icon_file_id`                 BIGINT                                                           DEFAULT NULL,
    `developer_id`                 BIGINT                                                           DEFAULT NULL,
    `sale_fee`                     DECIMAL(5, 2)                                                    DEFAULT NULL,
    `distribution_fee`             DECIMAL(5, 2)                                                    DEFAULT NULL,
    `migration_fee`                DECIMAL(5, 2)                                                    DEFAULT NULL,
    `primary_lang_id`              VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT 'sv',
    `is_free`                      TINYINT NOT NULL                                                 DEFAULT '0',
    `url`                          VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `is_student_app`               TINYINT                                                          DEFAULT '1',
    `is_teacher_app`               TINYINT                                                          DEFAULT '1',
    `is_admin_app`                 TINYINT                                                          DEFAULT '1',
    `optional`                     TINYINT                                                          DEFAULT '1',
    `force_info`                   TINYINT(1)                                                       DEFAULT '0',
    `total_users`                  INT     NOT NULL                                                 DEFAULT '0',
    `active_users`                 INT     NOT NULL                                                 DEFAULT '0',
    `ext_id`                       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `minimum_authentication_level` TINYINT NOT NULL                                                 DEFAULT '1',
    PRIMARY KEY (`id`),
    UNIQUE KEY `ext_id` (`ext_id`),
    KEY `fk_integration_file1_idx` (`icon_file_id`),
    KEY `fk_integration_developer1_idx` (`developer_id`),
    CONSTRAINT `fk_integration_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_integration_file1` FOREIGN KEY (`icon_file_id`) REFERENCES `file` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 33
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integration_country`
--

DROP TABLE IF EXISTS `integration_country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_country`
(
    `integration_id` BIGINT                                                         NOT NULL,
    `country_id`     VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`integration_id`, `country_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integration_lang`
--

DROP TABLE IF EXISTS `integration_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_lang`
(
    `integration_id`    BIGINT                                                         NOT NULL,
    `language_id`       VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `name`              VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `short_description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`       MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `deleted`           DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`integration_id`, `language_id`),
    KEY `language_id_idx` (`language_id`),
    CONSTRAINT `integration_id` FOREIGN KEY (`integration_id`) REFERENCES `integration` (`id`),
    CONSTRAINT `language_id` FOREIGN KEY (`language_id`) REFERENCES `language` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `integration_screen_shot`
--

DROP TABLE IF EXISTS `integration_screen_shot`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `integration_screen_shot`
(
    `integration_id` BIGINT NOT NULL,
    `file_id`        BIGINT NOT NULL,
    PRIMARY KEY (`integration_id`, `file_id`),
    KEY `fk_integration_screen_shot_file1_idx` (`file_id`),
    CONSTRAINT `fk_integration_screen_shot_file1` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_integration_screen_shot_integration1` FOREIGN KEY (`integration_id`) REFERENCES `integration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `json_order_in_process`
--

DROP TABLE IF EXISTS `json_order_in_process`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `json_order_in_process`
(
    `id`            BIGINT NOT NULL AUTO_INCREMENT,
    `order_as_json` LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 386
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lang_tmp`
--

DROP TABLE IF EXISTS `lang_tmp`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lang_tmp`
(
    `code` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language`
(
    `code` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `last_run`
--

DROP TABLE IF EXISTS `last_run`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_run`
(
    `tag` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `at`  DATETIME                                                         NOT NULL,
    PRIMARY KEY (`tag`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `library_banner`
--

DROP TABLE IF EXISTS `library_banner`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `library_banner`
(
    `id`             BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `image_id`       BIGINT                                                           NOT NULL,
    `small_image_id` BIGINT                                                           NOT NULL,
    `link`           VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `country_id`     VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `creation_time`  DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `active`         TINYINT(1)                                                       NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `image_id` (`image_id`),
    KEY `small_image_id` (`small_image_id`),
    KEY `country_id` (`country_id`),
    CONSTRAINT `library_banner_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `library_banner_ibfk_2` FOREIGN KEY (`small_image_id`) REFERENCES `file` (`file_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `library_banner_ibfk_3` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license`
(
    `id`                       BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `public_id`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `owner_ou_id`              BIGINT                                                                   DEFAULT NULL,
    `app_id`                   BIGINT                                                                   DEFAULT NULL,
    `app_version_id`           BIGINT                                                                   DEFAULT NULL,
    `developer_id`             BIGINT                                                          NOT NULL,
    `order_id`                 VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL COMMENT 'optional - group licenses',
    `expiration`               DATE                                                                     DEFAULT NULL,
    `license_code`             VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `license_target`           TINYINT                                                         NOT NULL DEFAULT '3' COMMENT '1 = user, 2 = class, 3 = school',
    `license_type`             TINYINT                                                         NOT NULL DEFAULT '1' COMMENT 'if school target: 1 = free access, 2  = simultaneous users/school',
    `status`                   TINYINT                                                         NOT NULL DEFAULT '2' COMMENT '1 = pending\n2 = valid\n3 = expired',
    `max_users`                INT                                                                      DEFAULT NULL,
    `auto_update_version`      TINYINT                                                                  DEFAULT NULL,
    `assigned_user`            BIGINT                                                                   DEFAULT NULL,
    `assigned_group`           BIGINT                                                                   DEFAULT NULL,
    `granted_by_user`          BIGINT                                                                   DEFAULT NULL,
    `grant_time`               DATETIME                                                                 DEFAULT NULL,
    `note`                     MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `creation_time`            DATETIME                                                                 DEFAULT NULL,
    `is_demo`                  TINYINT(1)                                                      NOT NULL DEFAULT '0',
    `deleted`                  DATETIME                                                                 DEFAULT NULL,
    `auto_renewal`             TINYINT(1)                                                      NOT NULL DEFAULT '0',
    `renewal_duration`         INT                                                                      DEFAULT NULL,
    `renewal_duration_type`    TINYINT                                                                  DEFAULT NULL,
    `renewal_price`            DECIMAL(10, 2)                                                           DEFAULT NULL,
    `renewal_fee`              DECIMAL(5, 2)                                                            DEFAULT NULL COMMENT 'percent fee the partner pay Skolon',
    `subscription_id`          BIGINT                                                                   DEFAULT NULL,
    `integration_id`           BIGINT                                                                   DEFAULT NULL,
    `license_integration_id`   BIGINT                                                                   DEFAULT NULL,
    `license_group_id`         BIGINT                                                                   DEFAULT NULL,
    `type`                     TINYINT                                                                  DEFAULT NULL,
    `is_billable_distribution` TINYINT                                                         NOT NULL DEFAULT '0',
    `old_license_code`         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_app_license_app_version2` (`app_version_id`),
    KEY `fk_license_subscription1_idx` (`subscription_id`),
    KEY `fk_license_integration1_idx` (`integration_id`),
    KEY `fk_license_ou1_idx` (`owner_ou_id`),
    KEY `fk_license_license_group1_idx` (`license_group_id`),
    KEY `fk_license_license_app1_idx` (`app_id`),
    KEY `fk_license_user1_idx` (`assigned_user`),
    KEY `deleted_idx` (`deleted`),
    KEY `type_idx` (`type`),
    KEY `status_idx` (`status`),
    KEY `license_app_version_assigned_user_idx` (`app_version_id`, `assigned_user`),
    KEY `developer_assigned_user_idx` (`developer_id`, `assigned_user`),
    KEY `developer_idx` (`developer_id`),
    KEY `app_id_assigned_user_idx` (`app_id`, `assigned_user`),
    KEY `assigned_user_owner_ou_app_version_integration` (`assigned_user`, `owner_ou_id`, `app_version_id`, `integration_id`),
    KEY `owner_ou_id` (`owner_ou_id`, `status`),
    KEY `remove_2022-09-17` (`license_group_id`, `assigned_user`) USING BTREE,
    KEY `license_group_id_assigned_user_idx` (`license_group_id`, `assigned_user`),
    CONSTRAINT `fk_app_license_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `fk_app_license_app_version2` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_license_integration1` FOREIGN KEY (`integration_id`) REFERENCES `integration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_license_license_group1` FOREIGN KEY (`license_group_id`) REFERENCES `license_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_license_ou1` FOREIGN KEY (`owner_ou_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_license_subscription1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_license_user` FOREIGN KEY (`assigned_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 961213
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_assignment`
--

DROP TABLE IF EXISTS `license_assignment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_assignment`
(
    `id`                BIGINT  NOT NULL AUTO_INCREMENT,
    `school_id`         BIGINT  NOT NULL,
    `app_version_id`    BIGINT           DEFAULT NULL,
    `assigned_ou_id`    BIGINT           DEFAULT NULL,
    `assigned_user_id`  BIGINT           DEFAULT NULL,
    `add_to_collection` TINYINT NOT NULL DEFAULT '1',
    `excluded`          TINYINT NOT NULL DEFAULT '0',
    `app_package_id`    BIGINT           DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `school_id` (`school_id`, `app_version_id`, `assigned_ou_id`),
    UNIQUE KEY `school_id_2` (`school_id`, `app_version_id`, `assigned_user_id`),
    UNIQUE KEY `school_id_3` (`school_id`, `app_package_id`, `assigned_ou_id`),
    UNIQUE KEY `school_id_4` (`school_id`, `app_package_id`, `assigned_user_id`),
    KEY `app_version_id` (`app_version_id`),
    KEY `app_package_id` (`app_package_id`),
    CONSTRAINT `license_assignment_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `license_assignment_ibfk_2` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_assignment_ibfk_3` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 80
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_code`
--

DROP TABLE IF EXISTS `license_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_code`
(
    `license_code_id` BIGINT  NOT NULL AUTO_INCREMENT,
    `license_id`      BIGINT                                                           DEFAULT NULL,
    `code`            VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `license_type`    TINYINT NOT NULL                                                 DEFAULT '3' COMMENT '1 = user, 2 = class, 3 = school',
    `expiration`      DATE                                                             DEFAULT NULL,
    `app_version_id`  BIGINT  NOT NULL,
    PRIMARY KEY (`license_code_id`),
    KEY `fk_license_code_app_license1_idx` (`license_id`),
    CONSTRAINT `fk_license_code_app_license1` FOREIGN KEY (`license_id`) REFERENCES `app_license` (`license_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 120
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_extra_exclusion`
--

DROP TABLE IF EXISTS `license_extra_exclusion`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_extra_exclusion`
(
    `license_id` BIGINT NOT NULL,
    `extra_id`   BIGINT NOT NULL,
    PRIMARY KEY (`license_id`, `extra_id`),
    KEY `fk_excluded_app_extra_app_extra1_idx` (`extra_id`),
    KEY `fk_contract_extra_exclusion_app_license1_idx` (`license_id`),
    CONSTRAINT `fk_contract_extra_exclusion_app_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_excluded_app_extra_app_extra1` FOREIGN KEY (`extra_id`) REFERENCES `app_extra` (`extra_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_group`
--

DROP TABLE IF EXISTS `license_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_group`
(
    `id`                       BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `assigned_ou_id`           BIGINT                                                                   DEFAULT NULL,
    `max_licenses`             INT                                                             NOT NULL DEFAULT '-1',
    `target`                   TINYINT                                                                  DEFAULT '4',
    `owner_ou_id`              BIGINT                                                          NOT NULL,
    `creation_time`            DATETIME                                                        NOT NULL,
    `deleted`                  DATETIME                                                                 DEFAULT NULL,
    `tmp_license_id`           BIGINT                                                                   DEFAULT NULL,
    `public_id`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `app_id`                   BIGINT                                                                   DEFAULT NULL,
    `app_version_id`           BIGINT                                                                   DEFAULT NULL,
    `developer_id`             BIGINT                                                                   DEFAULT NULL,
    `order_reference`          VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `expiration`               DATE                                                                     DEFAULT NULL,
    `teacher_license_code`     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `student_license_code`     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `old_license_code_teacher` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `old_license_code_student` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `status`                   TINYINT                                                                  DEFAULT NULL,
    `total_max_limit`          INT                                                                      DEFAULT NULL,
    `teacher_max_limit`        INT                                                                      DEFAULT NULL,
    `student_max_limit`        INT                                                                      DEFAULT NULL,
    `total_current_assigned`   INT                                                                      DEFAULT NULL,
    `teacher_current_assigned` INT                                                                      DEFAULT NULL,
    `student_current_assigned` INT                                                                      DEFAULT NULL,
    `type`                     TINYINT                                                                  DEFAULT NULL,
    `granted_by_user`          BIGINT                                                                   DEFAULT NULL,
    `grant_time`               DATETIME                                                                 DEFAULT NULL,
    `is_demo`                  TINYINT                                                         NOT NULL DEFAULT '0',
    `bundle_id`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `assigned_user_id`         BIGINT                                                                   DEFAULT NULL,
    `integration_id`           BIGINT                                                                   DEFAULT NULL,
    `subscription_id`          BIGINT                                                                   DEFAULT NULL,
    `description`              VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `app_package_id`           BIGINT                                                                   DEFAULT NULL,
    `parent_license_group_id`  BIGINT                                                                   DEFAULT NULL,
    `original_order_item_id`   BIGINT                                                                   DEFAULT NULL,
    `is_billable_distribution` TINYINT                                                         NOT NULL DEFAULT '0',
    `license_pool_id`          BIGINT                                                                   DEFAULT NULL,
    `updated`                  DATETIME                                                                 DEFAULT NULL,
    `is_editable_in_skolon`    TINYINT                                                         NOT NULL DEFAULT '1',
    `assignment_changed`       DATETIME                                                                 DEFAULT NULL,
    `product_id`               BIGINT                                                                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_license_group_app_version1_idx` (`app_version_id`),
    KEY `fk_license_group_ou1_idx` (`owner_ou_id`),
    KEY `fk_license_group_user1_idx` (`assigned_user_id`),
    KEY `deleted_idx` (`deleted`),
    KEY `status_idx` (`status`),
    KEY `fk_license_group_app1_idx` (`app_id`),
    KEY `app_package_id` (`app_package_id`),
    KEY `original_order_item_id` (`original_order_item_id`),
    KEY `parent_license_group_id_2` (`parent_license_group_id`),
    KEY `developer_id` (`developer_id`) USING BTREE,
    KEY `license_group_subscription_id_idx` (`subscription_id`) USING BTREE,
    KEY `license_pool_fk` (`license_pool_id`),
    KEY `deleted_app_id_owner_ou_id_is_demo_idx` (`deleted`, `app_id`, `owner_ou_id`, `is_demo`),
    KEY `owner_ou_id_deleted_status_idx` (`owner_ou_id`, `deleted`, `status`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `fk_license_group_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `fk_license_group_app_version1` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_license_group_ou1` FOREIGN KEY (`owner_ou_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `fk_license_group_user1` FOREIGN KEY (`assigned_user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL,
    CONSTRAINT `license_group_ibfk_1` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_group_ibfk_2` FOREIGN KEY (`parent_license_group_id`) REFERENCES `license_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_group_ibfk_3` FOREIGN KEY (`original_order_item_id`) REFERENCES `order_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_group_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 49859
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_group_extra_exclusion`
--

DROP TABLE IF EXISTS `license_group_extra_exclusion`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_group_extra_exclusion`
(
    `license_group_id` BIGINT NOT NULL,
    `extra_id`         BIGINT NOT NULL,
    PRIMARY KEY (`license_group_id`, `extra_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_order_license`
--

DROP TABLE IF EXISTS `license_order_license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_order_license`
(
    `order_id`   BIGINT NOT NULL,
    `license_id` BIGINT NOT NULL,
    PRIMARY KEY (`order_id`, `license_id`),
    KEY `fk_license_order_license_license1_idx` (`license_id`),
    CONSTRAINT `fk_license_order_license_license1` FOREIGN KEY (`license_id`) REFERENCES `license` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_order_token`
--

DROP TABLE IF EXISTS `license_order_token`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_order_token`
(
    `id`                  BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `creation_time`       DATETIME                                                        NOT NULL,
    `license_order_token` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `valid_until`         DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_pool`
--

DROP TABLE IF EXISTS `license_pool`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_pool`
(
    `id`                        BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`                      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `auto_add_licenses`         TINYINT(1)                                                       NOT NULL DEFAULT '0',
    `owner_ou_id`               BIGINT                                                           NOT NULL,
    `app_version_id`            BIGINT                                                           NOT NULL,
    `last_distributed`          DATETIME                                                                  DEFAULT NULL,
    `last_updated`              DATETIME                                                                  DEFAULT NULL,
    `last_distribution_started` DATETIME                                                                  DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `owner_ou_id` (`owner_ou_id`),
    KEY `app_version_id` (`app_version_id`),
    CONSTRAINT `license_pool_ibfk_1` FOREIGN KEY (`owner_ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_pool_ibfk_2` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `license_pool_assignee`
--

DROP TABLE IF EXISTS `license_pool_assignee`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license_pool_assignee`
(
    `id`              BIGINT NOT NULL AUTO_INCREMENT,
    `license_pool_id` BIGINT NOT NULL,
    `ou_id`           BIGINT     DEFAULT NULL,
    `user_id`         BIGINT     DEFAULT NULL,
    `in_collection`   TINYINT(1) DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `ou_id` (`ou_id`),
    KEY `user_id` (`user_id`),
    KEY `license_pool_id_fk` (`license_pool_id`),
    CONSTRAINT `license_pool_assignee_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_pool_assignee_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `license_pool_id_fk` FOREIGN KEY (`license_pool_id`) REFERENCES `license_pool` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 144
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `local_app_assignment`
--

DROP TABLE IF EXISTS `local_app_assignment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_app_assignment`
(
    `id`           BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `local_app_id` BIGINT          NOT NULL,
    `user_id`      BIGINT DEFAULT NULL,
    `ou_id`        BIGINT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_id` (`user_id`, `local_app_id`),
    UNIQUE KEY `ou_id` (`ou_id`, `local_app_id`),
    KEY `local_app_id` (`local_app_id`),
    CONSTRAINT `local_app_assignment_ibfk_1` FOREIGN KEY (`local_app_id`) REFERENCES `visible_school_app` (`id`),
    CONSTRAINT `local_app_assignment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
    CONSTRAINT `local_app_assignment_ibfk_3` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 74
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `local_app_license`
--

DROP TABLE IF EXISTS `local_app_license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_app_license`
(
    `user_id`       BIGINT    NOT NULL,
    `local_app_id`  BIGINT    NOT NULL,
    `creation_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`, `local_app_id`),
    KEY `local_app_id` (`local_app_id`),
    CONSTRAINT `local_app_license_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
    CONSTRAINT `local_app_license_ibfk_2` FOREIGN KEY (`local_app_id`) REFERENCES `visible_school_app` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `local_app_scope`
--

DROP TABLE IF EXISTS `local_app_scope`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_app_scope`
(
    `app_id` BIGINT                                                           NOT NULL,
    `types`  VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    PRIMARY KEY (`app_id`),
    CONSTRAINT `local_app_scope_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_chain`
--

DROP TABLE IF EXISTS `mail_chain`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_chain`
(
    `id`                     BIGINT NOT NULL AUTO_INCREMENT,
    `next_id`                BIGINT                                                           DEFAULT NULL,
    `seconds_before_send`    INT                                                              DEFAULT NULL,
    `template_id`            VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `public_id`              VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `seconds_until_reminder` INT                                                              DEFAULT NULL,
    `reminder_template_id`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `seconds_after_login`    INT                                                              DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_template`
--

DROP TABLE IF EXISTS `mail_template`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_template`
(
    `id`            BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `mail_type_id`  BIGINT                                                           NOT NULL,
    `language_code` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `issue_id`      VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `mail_type_id` (`mail_type_id`, `language_code`),
    UNIQUE KEY `issue_id` (`issue_id`),
    KEY `language_code` (`language_code`),
    CONSTRAINT `mail_template_ibfk_1` FOREIGN KEY (`mail_type_id`) REFERENCES `mail_type` (`id`),
    CONSTRAINT `mail_template_ibfk_2` FOREIGN KEY (`language_code`) REFERENCES `language` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 70
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mail_type`
--

DROP TABLE IF EXISTS `mail_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mail_type`
(
    `id`                         BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`                       VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `default_mail_language_code` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `name` (`name`),
    KEY `default_mail_language_code` (`default_mail_language_code`),
    CONSTRAINT `mail_type_ibfk_1` FOREIGN KEY (`default_mail_language_code`) REFERENCES `language` (`code`) ON DELETE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message`
(
    `message_id`      BIGINT NOT NULL AUTO_INCREMENT,
    `conversation_id` BIGINT   DEFAULT NULL,
    `sender`          BIGINT   DEFAULT NULL,
    `message`         MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `sent`            DATETIME DEFAULT NULL,
    PRIMARY KEY (`message_id`),
    KEY `fk_message_conversation1_idx` (`conversation_id`),
    CONSTRAINT `fk_message_conversation1` FOREIGN KEY (`conversation_id`) REFERENCES `conversation` (`conversation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 28
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadata`
--

DROP TABLE IF EXISTS `metadata`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata`
(
    `id`            BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `public_id`     VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `parent_id`     BIGINT                                                           DEFAULT NULL,
    `app_id`        BIGINT                                                           DEFAULT NULL,
    `name`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `public_url`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `url`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `index`         INT                                                              DEFAULT '9999',
    `creation_time` DATETIME                                                        NOT NULL,
    `deleted`       DATETIME                                                         DEFAULT NULL,
    `path`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `ext_id`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `app_id_idx` (`app_id`),
    KEY `parent_id` (`parent_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 8308
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `metadata_lang`
--

DROP TABLE IF EXISTS `metadata_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metadata_lang`
(
    `metadata_id` BIGINT                                                         NOT NULL,
    `language_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `deleted`     DATETIME                                                         DEFAULT NULL,
    `name`        VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`metadata_id`, `language_id`),
    FULLTEXT KEY `metadata_lang_name_idx` (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mfa_session`
--

DROP TABLE IF EXISTS `mfa_session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mfa_session`
(
    `token`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`       BIGINT                                                           NOT NULL,
    `creation_time` DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`token`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `mfa_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module`
(
    `module_id` BIGINT                                                           NOT NULL,
    `name`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `route`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`module_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipality`
--

DROP TABLE IF EXISTS `municipality`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipality`
(
    `name`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `country_id` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT 'se',
    PRIMARY KEY (`name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `news_item`
--

DROP TABLE IF EXISTS `news_item`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_item`
(
    `id`            BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME                                                       NOT NULL,
    `deleted`       DATETIME                                                                DEFAULT NULL,
    `title`         VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `text`          VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci       DEFAULT NULL,
    `url`           VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `url_text`      VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `time_interval` INT                                                                     DEFAULT '5',
    `active`        TINYINT                                                        NOT NULL DEFAULT '1',
    `country_id`    VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'se',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification`
(
    `id`               BIGINT  NOT NULL AUTO_INCREMENT,
    `event_id`         BIGINT  NOT NULL,
    `user_id`          BIGINT  NOT NULL,
    `informed`         TINYINT NOT NULL DEFAULT '0',
    `mail_sent`        TINYINT          DEFAULT '0',
    `weekly_mail_sent` TINYINT          DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `user_id` (`user_id`, `event_id`),
    KEY `event_weekly_mail_sent_user_id_idx` (`event_id`, `weekly_mail_sent`, `user_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 262753
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `official_school_code`
--

DROP TABLE IF EXISTS `official_school_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `official_school_code`
(
    `id`                  BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `code`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `name`                VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `organization_number` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_id`           BIGINT                                                          DEFAULT NULL,
    `uuid`                CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL,
    `country_id`          VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `code` (`code`),
    UNIQUE KEY `official_school_code_uuid_idx` (`uuid`) USING BTREE,
    KEY `school_id` (`school_id`),
    KEY `school_id_uuid_idx` (`school_id`, `uuid`),
    CONSTRAINT `official_school_code_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 7740
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER DATABASE `skolon` CHARACTER SET latin1 COLLATE latin1_swedish_ci;
/*!50003 SET @saved_cs_client = @@character_set_client */;
/*!50003 SET @saved_cs_results = @@character_set_results */;
/*!50003 SET @saved_col_connection = @@collation_connection */;
/*!50003 SET character_set_client = utf8mb3 */;
/*!50003 SET character_set_results = utf8mb3 */;
/*!50003 SET collation_connection = utf8mb3_general_ci */;
/*!50003 SET @saved_sql_mode = @@sql_mode */;
/*!50003 SET sql_mode =
        'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */;
DELIMITER ;;
/*!50003 CREATE */ /*!50017 DEFINER =`root`@`localhost`*/ /*!50003 TRIGGER `official_school_code_before_insert`
    BEFORE INSERT
    ON `official_school_code`
    FOR EACH ROW
BEGIN
    SET new.uuid = UUID();
END */;;
DELIMITER ;
/*!50003 SET sql_mode = @saved_sql_mode */;
/*!50003 SET character_set_client = @saved_cs_client */;
/*!50003 SET character_set_results = @saved_cs_results */;
/*!50003 SET collation_connection = @saved_col_connection */;
ALTER DATABASE `skolon` CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci;

--
-- Table structure for table `onetime_session_passcode`
--

DROP TABLE IF EXISTS `onetime_session_passcode`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `onetime_session_passcode`
(
    `session_id` VARCHAR(100) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `created`    DATETIME                                   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `used`       TINYINT UNSIGNED                           NOT NULL,
    `code`       VARCHAR(40) COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    PRIMARY KEY (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opt_in_ou`
--

DROP TABLE IF EXISTS `opt_in_ou`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opt_in_ou`
(
    `id`             BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`           VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `parent_ou_id`   BIGINT                                                           DEFAULT NULL,
    `parent_ou_name` VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `country_id`     VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `opt_in_user_id` BIGINT                                                           DEFAULT NULL,
    `creation_time`  DATETIME                                                         DEFAULT CURRENT_TIMESTAMP,
    `handled_time`   DATETIME                                                         DEFAULT NULL,
    `deleted`        DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `parent_ou_id` (`parent_ou_id`),
    KEY `country_id` (`country_id`),
    KEY `opt_in_user_id` (`opt_in_user_id`),
    CONSTRAINT `opt_in_ou_ibfk_1` FOREIGN KEY (`parent_ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `opt_in_ou_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `opt_in_ou_ibfk_3` FOREIGN KEY (`opt_in_user_id`) REFERENCES `opt_in_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `opt_in_user`
--

DROP TABLE IF EXISTS `opt_in_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opt_in_user`
(
    `id`              BIGINT NOT NULL AUTO_INCREMENT,
    `name`            VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_id`       BIGINT                                                           DEFAULT NULL,
    `school_name`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `city`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `zipcode`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `email`           VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `message`         MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `group`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `creation_time`   DATETIME                                                         DEFAULT NULL,
    `role`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `deleted`         DATETIME                                                         DEFAULT NULL,
    `handled_time`    DATETIME                                                         DEFAULT NULL,
    `is_school_admin` TINYINT                                                          DEFAULT '0',
    `opt_in_ou_id`    BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `opt_in_ou_id` (`opt_in_ou_id`),
    CONSTRAINT `opt_in_user_ibfk_1` FOREIGN KEY (`opt_in_ou_id`) REFERENCES `opt_in_ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 977
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order`
(
    `id`                        BIGINT   NOT NULL AUTO_INCREMENT,
    `bought_by_user`            BIGINT                                                             DEFAULT NULL,
    `bought_by_ou`              BIGINT                                                             DEFAULT NULL,
    `creation_time`             DATETIME                                                           DEFAULT NULL,
    `customer_reference_number` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL,
    `order_type`                TINYINT                                                            DEFAULT NULL COMMENT '1=Sales, 2=Distribution, 3=Migration',
    `total_price`               DECIMAL(10, 2)                                                     DEFAULT NULL,
    `deleted`                   DATETIME                                                           DEFAULT NULL,
    `public_id`                 VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL,
    `comment`                   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `billing_completed`         TINYINT                                                            DEFAULT NULL,
    `customer_address`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `customer_country_id`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `customer_zipcode`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `customer_city`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `seller_address`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `seller_country_id`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `seller_zipcode`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `seller_city`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `total_vat`                 DECIMAL(10, 2)                                                     DEFAULT NULL,
    `cancelled`                 TINYINT                                                            DEFAULT '0' COMMENT 'Indicator that the order is cancelled (makulerad)',
    `origin`                    VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL COMMENT 'One of SCHOOLADMIN/PARTNERPORTAL/SYSTEMADMIN/<integration_id>',
    `customer_contact`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `seller_contact`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `cost_centre_old`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `currency_id`               VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci     DEFAULT 'SEK',
    `status`                    TINYINT  NOT NULL                                                  DEFAULT '2',
    `order_date`                DATETIME NOT NULL,
    `skolon_reference`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `billing_details`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `discount`                  DECIMAL(13, 4)                                                     DEFAULT '0.0000',
    `discount_type`             SMALLINT                                                           DEFAULT '1',
    `reseller_id`               BIGINT                                                             DEFAULT NULL,
    `licenses_created`          TINYINT  NOT NULL                                                  DEFAULT '1',
    `user_customer_number_id`   BIGINT                                                             DEFAULT NULL,
    `is_billable_distribution`  TINYINT  NOT NULL                                                  DEFAULT '0',
    `skip_external_activation`  TINYINT  NOT NULL                                                  DEFAULT '0',
    `order_quote_id`            BIGINT                                                             DEFAULT NULL,
    `visma_number`              BIGINT                                                             DEFAULT NULL,
    `developer_customer_id`     BIGINT                                                             DEFAULT NULL,
    `visma_error`               MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `visma_date`                DATE                                                               DEFAULT NULL,
    `bought_by_developer`       BIGINT                                                             DEFAULT NULL,
    `invoice_text`              VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `visma_document_date`       DATE                                                               DEFAULT NULL,
    `reference`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `customer_message`          VARCHAR(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `seller_message`            VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `delivery_email`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `shopcart_id`               BIGINT                                                             DEFAULT NULL,
    `buyer_name`                VARCHAR(91) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL,
    `seller_reference_number`   VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `public_id_UNIQUE` (`public_id`),
    KEY `fk_order_school1_idx` (`bought_by_ou`),
    KEY `fk_order_user1_idx` (`bought_by_user`),
    KEY `reseller_id` (`reseller_id`),
    KEY `user_customer_number_id` (`user_customer_number_id`),
    KEY `order_quote_id` (`order_quote_id`),
    KEY `developer_customer_id` (`developer_customer_id`),
    KEY `bought_by_developer` (`bought_by_developer`),
    KEY `shopcart_id` (`shopcart_id`),
    CONSTRAINT `fk_order_school1` FOREIGN KEY (`bought_by_ou`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_order_user1` FOREIGN KEY (`bought_by_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `order_ibfk_1` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_customer_number_id`) REFERENCES `user_customer_number` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_ibfk_3` FOREIGN KEY (`order_quote_id`) REFERENCES `order_quote` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_ibfk_4` FOREIGN KEY (`developer_customer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_ibfk_5` FOREIGN KEY (`bought_by_developer`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_ibfk_7` FOREIGN KEY (`shopcart_id`) REFERENCES `shopcart` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4590
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_buyer_unit_code`
--

DROP TABLE IF EXISTS `order_buyer_unit_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_buyer_unit_code`
(
    `order_id`  BIGINT                                                          NOT NULL,
    `unit_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`order_id`, `unit_code`),
    CONSTRAINT `order_buyer_unit_code_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_discount_code`
--

DROP TABLE IF EXISTS `order_discount_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_discount_code`
(
    `order_id`         BIGINT NOT NULL,
    `discount_code_id` BIGINT NOT NULL,
    PRIMARY KEY (`order_id`, `discount_code_id`),
    KEY `discount_code_id` (`discount_code_id`),
    CONSTRAINT `order_discount_code_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `order_discount_code_ibfk_2` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_code` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item`
(
    `id`                                BIGINT         NOT NULL AUTO_INCREMENT,
    `order_id`                          BIGINT         NOT NULL,
    `quantity`                          INT            NOT NULL,
    `unit_price`                        DECIMAL(10, 2)                                                   DEFAULT NULL,
    `total_price`                       DECIMAL(10, 2)                                                   DEFAULT NULL,
    `description`                       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `subscription_id`                   BIGINT                                                           DEFAULT NULL,
    `name`                              VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `product_id`                        BIGINT                                                           DEFAULT NULL,
    `creation_time`                     DATETIME                                                         DEFAULT NULL,
    `deleted`                           DATETIME                                                         DEFAULT NULL,
    `fee`                               DECIMAL(5, 2)                                                    DEFAULT NULL,
    `vat_rate`                          DECIMAL(5, 2)  NOT NULL                                          DEFAULT '25.00',
    `total_vat`                         DECIMAL(10, 2)                                                   DEFAULT NULL,
    `developer_id`                      BIGINT                                                           DEFAULT NULL,
    `product_type`                      TINYINT                                                          DEFAULT NULL COMMENT '1=app license, 2= integration license',
    `app_version_id`                    BIGINT                                                           DEFAULT NULL,
    `integration_id`                    BIGINT                                                           DEFAULT NULL,
    `budget_id`                         BIGINT                                                           DEFAULT NULL,
    `assignments`                       LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `teacher_license_code`              VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `student_license_code`              VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `total_max_limit`                   INT                                                              DEFAULT NULL,
    `teacher_max_limit`                 INT                                                              DEFAULT NULL,
    `student_max_limit`                 INT                                                              DEFAULT NULL,
    `license_target`                    TINYINT                                                          DEFAULT NULL,
    `license_owner_id`                  BIGINT                                                           DEFAULT NULL,
    `app_package_id`                    BIGINT                                                           DEFAULT NULL,
    `discount`                          DECIMAL(13, 4)                                                   DEFAULT NULL,
    `partner_discount`                  DECIMAL(13, 4)                                                   DEFAULT NULL,
    `ext_id`                            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `discount_in_currency`              DECIMAL(13, 4)                                                   DEFAULT NULL,
    `duration`                          INT                                                              DEFAULT NULL,
    `duration_type`                     TINYINT                                                          DEFAULT NULL COMMENT '1 = day, 2 = month, 3 = year',
    `discount_agreement_id`             BIGINT                                                           DEFAULT NULL,
    `auto_renewal`                      TINYINT                                                          DEFAULT NULL,
    `requires_external_activation`      TINYINT        NOT NULL                                          DEFAULT '0',
    `combined_discount`                 DECIMAL(13, 4)                                                   DEFAULT NULL,
    `discount_ladder_id`                BIGINT                                                           DEFAULT NULL,
    `delivered_externally`              TINYINT        NOT NULL                                          DEFAULT '0',
    `article_number`                    VARCHAR(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `app_ext_id`                        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `app_article_number`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `surcharge`                         DECIMAL(13, 4) NOT NULL                                          DEFAULT '0.0000',
    `supplier_article_number`           VARCHAR(50) COLLATE utf8mb4_sv_0900_ai_ci                        DEFAULT NULL,
    `requires_manual_school_processing` TINYINT        NOT NULL                                          DEFAULT '0',
    `net_price`                         DECIMAL(10, 2) GENERATED ALWAYS AS ((CASE
                                                                                 WHEN (`combined_discount` IS NULL)
                                                                                     THEN (`total_price` * (1 + (`surcharge` / 100)))
                                                                                 ELSE ((`total_price` * (1 - (`combined_discount` / 100))) *
                                                                                       (1 + (`surcharge` / 100))) END)) VIRTUAL,
    `renewed_app_id`                    BIGINT                                                           DEFAULT NULL,
    `renewed_app_package_id`            BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_license_order_item_license_order1_idx` (`order_id`),
    KEY `fk_order_item_product1_idx` (`product_id`),
    KEY `fk_order_item_budget1_idx` (`budget_id`),
    KEY `license_owner_id` (`license_owner_id`),
    KEY `app_package_id` (`app_package_id`),
    KEY `discount_agreement_id` (`discount_agreement_id`),
    KEY `subscription_id` (`subscription_id`),
    KEY `discount_ladder_id` (`discount_ladder_id`),
    KEY `renewed_app_id` (`renewed_app_id`),
    KEY `renewed_app_package_id` (`renewed_app_package_id`),
    CONSTRAINT `discount_ladder_id` FOREIGN KEY (`discount_ladder_id`) REFERENCES `discount_ladder` (`id`),
    CONSTRAINT `fk_license_order_item_license_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_order_item_budget1` FOREIGN KEY (`budget_id`) REFERENCES `budget` (`id`),
    CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `order_item_ibfk_1` FOREIGN KEY (`license_owner_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_item_ibfk_2` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_item_ibfk_3` FOREIGN KEY (`discount_agreement_id`) REFERENCES `discount_agreement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_item_ibfk_4` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`),
    CONSTRAINT `order_item_ibfk_5` FOREIGN KEY (`renewed_app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `order_item_ibfk_6` FOREIGN KEY (`renewed_app_package_id`) REFERENCES `app_package` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13503
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_item_assigned_ou`
--

DROP TABLE IF EXISTS `order_item_assigned_ou`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_assigned_ou`
(
    `order_item_id` BIGINT NOT NULL,
    `ou_id`         BIGINT NOT NULL,
    PRIMARY KEY (`order_item_id`, `ou_id`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `order_item_assigned_ou_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_item_assigned_ou_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_item_assigned_user`
--

DROP TABLE IF EXISTS `order_item_assigned_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_assigned_user`
(
    `order_item_id` BIGINT NOT NULL,
    `user_id`       BIGINT NOT NULL,
    PRIMARY KEY (`order_item_id`, `user_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `order_item_assigned_user_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_item_assigned_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_item_content`
--

DROP TABLE IF EXISTS `order_item_content`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_content`
(
    `id`                           BIGINT  NOT NULL AUTO_INCREMENT,
    `order_item_id`                BIGINT  NOT NULL,
    `product_id`                   BIGINT                                     DEFAULT NULL,
    `app_version_id`               BIGINT                                     DEFAULT NULL,
    `license_target`               TINYINT                                    DEFAULT NULL,
    `auto_renewal`                 TINYINT NOT NULL,
    `duration`                     INT                                        DEFAULT NULL,
    `duration_type`                TINYINT                                    DEFAULT NULL,
    `student_license_code`         VARCHAR(255) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `teacher_license_code`         VARCHAR(255) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `student_max_limit`            INT                                        DEFAULT NULL,
    `teacher_max_limit`            INT                                        DEFAULT NULL,
    `total_max_limit`              INT                                        DEFAULT NULL,
    `article_number`               VARCHAR(25) COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `supplier_app_article_number`  VARCHAR(50) COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `product_ext_id`               VARCHAR(100) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `app_ext_id`                   VARCHAR(100) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `requires_external_activation` TINYINT NOT NULL,
    `delivered_externally`         TINYINT NOT NULL,
    `name`                         VARCHAR(500) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `quantity`                     INT                                        DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `order_item_id` (`order_item_id`),
    KEY `product_id` (`product_id`),
    CONSTRAINT `order_item_content_ibfk_1` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`),
    CONSTRAINT `order_item_content_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4096
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_item_detail`
--

DROP TABLE IF EXISTS `order_item_detail`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_detail`
(
    `id`             BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `order_item_id`  BIGINT                                                           NOT NULL,
    `developer_id`   BIGINT                                                           NOT NULL,
    `quantity`       INT                                                              NOT NULL,
    `name`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `product_type`   TINYINT                                                          DEFAULT NULL COMMENT '1=app license, 2= integration license',
    `description`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `app_version_id` BIGINT                                                           DEFAULT NULL,
    `integration_id` BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_order_item_detail_license_order_item1_idx` (`order_item_id`),
    KEY `fk_order_item_detail_developer1_idx` (`developer_id`),
    CONSTRAINT `fk_order_item_detail_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_order_item_detail_license_order_item1` FOREIGN KEY (`order_item_id`) REFERENCES `order_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1798
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_license_distribution`
--

DROP TABLE IF EXISTS `order_license_distribution`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_license_distribution`
(
    `id`                  BIGINT NOT NULL AUTO_INCREMENT,
    `order_item_id`       BIGINT DEFAULT NULL,
    `order_quote_item_id` BIGINT DEFAULT NULL,
    `owner_ou_id`         BIGINT NOT NULL,
    `assigned_user_ids`   LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `assigned_ou_ids`     LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `total_licenses`      INT    NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_quote`
--

DROP TABLE IF EXISTS `order_quote`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_quote`
(
    `id`                             BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `creation_time`                  DATETIME                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by_user_id`             BIGINT                                                         NOT NULL,
    `created_by_ou_id`               BIGINT                                                         NOT NULL,
    `developer_id`                   BIGINT                                                         NOT NULL,
    `customer_address`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_country_id`            VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `customer_zipcode`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_city`                  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_contact`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_email`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_phone`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_reference_number`      VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `user_customer_number_id`        BIGINT                                                                  DEFAULT NULL,
    `developer_comment`              MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `status`                         TINYINT                                                        NOT NULL,
    `currency_id`                    VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `reference`                      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_message`               VARCHAR(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      DEFAULT NULL,
    `delivery_email`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `delivery_date`                  DATE                                                                    DEFAULT NULL,
    `invalidation_time`              DATETIME                                                                DEFAULT NULL,
    `invalidated_by_user_id`         BIGINT                                                                  DEFAULT NULL,
    `invalidation_comment_developer` TEXT COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`id`),
    KEY `created_by_user_id` (`created_by_user_id`),
    KEY `created_by_ou_id` (`created_by_ou_id`),
    KEY `user_customer_number_id` (`user_customer_number_id`),
    KEY `customer_country_id` (`customer_country_id`),
    KEY `currency_id` (`currency_id`),
    CONSTRAINT `order_quote_ibfk_1` FOREIGN KEY (`created_by_user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_ibfk_2` FOREIGN KEY (`created_by_ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_ibfk_3` FOREIGN KEY (`user_customer_number_id`) REFERENCES `user_customer_number` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_ibfk_4` FOREIGN KEY (`customer_country_id`) REFERENCES `country` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_ibfk_5` FOREIGN KEY (`currency_id`) REFERENCES `currency` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_quote_item`
--

DROP TABLE IF EXISTS `order_quote_item`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_quote_item`
(
    `id`                   BIGINT   NOT NULL AUTO_INCREMENT,
    `creation_time`        DATETIME NOT NULL                                                DEFAULT CURRENT_TIMESTAMP,
    `ext_id`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `order_quote_id`       BIGINT   NOT NULL,
    `quantity`             INT      NOT NULL,
    `product_id`           BIGINT   NOT NULL,
    `name`                 VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `unit_price`           DECIMAL(10, 2)                                                   DEFAULT NULL,
    `vat_rate`             DECIMAL(13, 4)                                                   DEFAULT NULL,
    `developer_id`         BIGINT   NOT NULL,
    `product_type`         TINYINT                                                          DEFAULT NULL,
    `app_version_id`       BIGINT   NOT NULL,
    `duration`             INT                                                              DEFAULT NULL,
    `duration_type`        TINYINT                                                          DEFAULT NULL,
    `teacher_license_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `student_license_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `total_max_limit`      INT                                                              DEFAULT NULL,
    `teacher_max_limit`    INT                                                              DEFAULT NULL,
    `student_max_limit`    INT                                                              DEFAULT NULL,
    `license_target`       TINYINT                                                          DEFAULT NULL,
    `total_price`          DECIMAL(10, 2)                                                   DEFAULT NULL,
    `num_users`            INT                                                              DEFAULT NULL,
    `vat_rate_id`          BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `order_quote_id` (`order_quote_id`),
    KEY `developer_id` (`developer_id`),
    KEY `fk_order_quote_item_product1` (`product_id`),
    KEY `vat_rate_id` (`vat_rate_id`),
    CONSTRAINT `fk_order_quote_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_item_ibfk_1` FOREIGN KEY (`order_quote_id`) REFERENCES `order_quote` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_item_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_item_ibfk_3` FOREIGN KEY (`vat_rate_id`) REFERENCES `vat_rate` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_quote_item_assigned_ou`
--

DROP TABLE IF EXISTS `order_quote_item_assigned_ou`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_quote_item_assigned_ou`
(
    `order_quote_item_id` BIGINT NOT NULL,
    `ou_id`               BIGINT NOT NULL,
    PRIMARY KEY (`order_quote_item_id`, `ou_id`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `order_quote_item_assigned_ou_ibfk_1` FOREIGN KEY (`order_quote_item_id`) REFERENCES `order_quote_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_item_assigned_ou_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_quote_item_assigned_user`
--

DROP TABLE IF EXISTS `order_quote_item_assigned_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_quote_item_assigned_user`
(
    `order_quote_item_id` BIGINT NOT NULL,
    `user_id`             BIGINT NOT NULL,
    PRIMARY KEY (`order_quote_item_id`, `user_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `order_quote_item_assigned_user_ibfk_1` FOREIGN KEY (`order_quote_item_id`) REFERENCES `order_quote_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `order_quote_item_assigned_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization`
(
    `id`   BIGINT                                                           NOT NULL,
    `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `type` TINYINT DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `organization_school`
--

DROP TABLE IF EXISTS `organization_school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization_school`
(
    `organization_id` BIGINT NOT NULL,
    `school_id`       BIGINT NOT NULL,
    PRIMARY KEY (`organization_id`, `school_id`),
    KEY `fk_organization_schools_school1_idx` (`school_id`),
    CONSTRAINT `fk_organization_schools_organization1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_organization_schools_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ou`
--

DROP TABLE IF EXISTS `ou`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ou`
(
    `id`                                BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `public_id`                         VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `ext_id`                            VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `ext_source`                        VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `import_batch`                      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `parent_id`                         BIGINT                                                                  DEFAULT NULL,
    `name`                              VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `grade`                             VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `type`                              TINYINT                                                        NOT NULL COMMENT '1 = management unit\n2 = school\n3 = work group\n4 = user group',
    `sub_type`                          TINYINT                                                        NOT NULL DEFAULT '0',
    `creation_time`                     DATETIME                                                                DEFAULT NULL,
    `update_time`                       DATETIME                                                                DEFAULT NULL,
    `deleted`                           DATETIME                                                                DEFAULT NULL,
    `ext_id2`                           VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL COMMENT 'DEPRECATED\nOnly used by school',
    `address`                           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `zipcode`                           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `municipality_name`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `city`                              VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `phone1`                            VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `phone2`                            VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `web`                               VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci       DEFAULT NULL,
    `approved_agreement_old`            DATETIME                                                                DEFAULT NULL COMMENT 'Before GDPR agreements',
    `approved_by_old`                   BIGINT                                                                  DEFAULT NULL COMMENT 'Before GDPR agreements',
    `school_code`                       VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `icon_id`                           BIGINT                                                                  DEFAULT NULL,
    `visible`                           TINYINT                                                        NOT NULL DEFAULT '1',
    `teacher_idp_id`                    BIGINT                                                                  DEFAULT NULL,
    `info_header`                       VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `info_text`                         VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci       DEFAULT NULL,
    `info_image_id`                     BIGINT                                                                  DEFAULT NULL,
    `info_url`                          VARCHAR(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `internal_info`                     VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci       DEFAULT NULL,
    `country_id`                        VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'se',
    `responsible_user_id`               BIGINT                                                                  DEFAULT NULL,
    `is_demo`                           TINYINT(1)                                                              DEFAULT '0',
    `total_users`                       INT                                                            NOT NULL DEFAULT '0',
    `active_users`                      INT                                                            NOT NULL DEFAULT '0',
    `organization_number`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `skolon_id_attribute`               VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `idp_id_attribute`                  VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `settings_enabled`                  TINYINT(1)                                                              DEFAULT NULL,
    `reset_password_enabled`            TINYINT(1)                                                              DEFAULT NULL,
    `approved_agreement`                DATETIME                                                                DEFAULT NULL,
    `approved_by`                       BIGINT                                                                  DEFAULT NULL,
    `school_unit_id`                    BIGINT                                                                  DEFAULT NULL,
    `collection_greeting`               TINYINT(1)                                                              DEFAULT NULL,
    `billing_details`                   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `skolon_cards_enabled`              TINYINT                                                        NOT NULL DEFAULT '0',
    `classroom_enabled`                 TINYINT                                                        NOT NULL DEFAULT '0',
    `status`                            TINYINT                                                        NOT NULL DEFAULT '0',
    `customer_success_manager_id`       BIGINT                                                                  DEFAULT NULL,
    `student_idp_id`                    BIGINT                                                                  DEFAULT NULL,
    `allow_notification_mails`          TINYINT                                                                 DEFAULT NULL,
    `all_user_settings_enabled`         TINYINT                                                                 DEFAULT NULL,
    `user_collection_locked`            TINYINT                                                                 DEFAULT NULL,
    `is_procured`                       TINYINT                                                        NOT NULL DEFAULT '0',
    `can_buy_external_apps`             TINYINT                                                        NOT NULL DEFAULT '0',
    `purchase_enabled`                  TINYINT                                                        NOT NULL DEFAULT '1',
    `teams_enabled`                     TINYINT                                                        NOT NULL DEFAULT '0',
    `disabled`                          TINYINT                                                        NOT NULL DEFAULT '0',
    `uuid`                              CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `unit_uuid`                         CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `language_id`                       VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `billing_address`                   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_postal_code`               VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `billing_city`                      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_country_id`                VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `billing_email`                     VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `e_invoice_number`                  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `visma_number`                      VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `education_enabled`                 TINYINT                                                                 DEFAULT NULL,
    `sales_invoice_text`                VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `vat_registration_id`               VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `default_library_filter_accessible` TINYINT                                                        NOT NULL DEFAULT '0',
    `public_data_agreement_status`      TINYINT(1)                                                              DEFAULT NULL,
    `pseudo_name`                       VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `restrict_developers`               TINYINT                                                                 DEFAULT NULL,
    `whitelabel_config_id`              BIGINT                                                                  DEFAULT NULL,
    `external_store`                    TINYINT                                                                 DEFAULT NULL,
    `punch_out_enabled`                 TINYINT UNSIGNED                                                        DEFAULT NULL,
    `contract_reference`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `punch_out_gln`                     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `hide_library_banner`               TINYINT                                                                 DEFAULT NULL,
    `widget_library_locked`             TINYINT                                                                 DEFAULT NULL,
    `widgets_enabled`                   TINYINT                                                                 DEFAULT NULL,
    `punch_out_configuration`           ENUM ('ehf','peppol') COLLATE utf8mb4_sv_0900_ai_ci                     DEFAULT NULL,
    `teachers_can_create_local_apps`    TINYINT                                                                 DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index5` (`ext_source`, `ext_id`),
    UNIQUE KEY `info_url_UNIQUE` (`info_url`),
    UNIQUE KEY `public_id` (`public_id`),
    UNIQUE KEY `ou_uuid_idx` (`uuid`) USING BTREE,
    UNIQUE KEY `ou_unit_uuid_idx` (`unit_uuid`) USING BTREE,
    UNIQUE KEY `whitelabel_config_id` (`whitelabel_config_id`),
    KEY `name_idx` (`name`),
    KEY `fk_ou_municipality1_idx` (`municipality_name`),
    KEY `fk_ou_info_image_idx` (`info_image_id`),
    KEY `parent_id_idx` (`parent_id`),
    KEY `fk_responsible_user_idx` (`responsible_user_id`),
    KEY `ou_type_idx` (`type`),
    KEY `public_id_idx` (`public_id`),
    KEY `customer_success_manager_id` (`customer_success_manager_id`),
    KEY `deleted_type_uuid_idx` (`deleted`, `type`, `uuid`),
    KEY `type_deleted_public_id_idx` (`type`, `deleted`, `public_id`),
    CONSTRAINT `fk_ou_info_image` FOREIGN KEY (`info_image_id`) REFERENCES `file` (`file_id`),
    CONSTRAINT `fk_ou_municipality1` FOREIGN KEY (`municipality_name`) REFERENCES `municipality` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_responsible_user` FOREIGN KEY (`responsible_user_id`) REFERENCES `user` (`user_id`),
    CONSTRAINT `ou_ibfk_1` FOREIGN KEY (`customer_success_manager_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `ou_ibfk_2` FOREIGN KEY (`whitelabel_config_id`) REFERENCES `whitelabel_config` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 922071
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER DATABASE `skolon` CHARACTER SET latin1 COLLATE latin1_swedish_ci;
/*!50003 SET @saved_cs_client = @@character_set_client */;
/*!50003 SET @saved_cs_results = @@character_set_results */;
/*!50003 SET @saved_col_connection = @@collation_connection */;
/*!50003 SET character_set_client = utf8mb3 */;
/*!50003 SET character_set_results = utf8mb3 */;
/*!50003 SET collation_connection = utf8mb3_general_ci */;
/*!50003 SET @saved_sql_mode = @@sql_mode */;
/*!50003 SET sql_mode =
        'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */;
DELIMITER ;;
/*!50003 CREATE */ /*!50017 DEFINER =`root`@`localhost`*/ /*!50003 TRIGGER `ou_before_insert`
    BEFORE INSERT
    ON `ou`
    FOR EACH ROW
BEGIN
    SET new.uuid = UUID();
    SET new.unit_uuid = UUID();
END */;;
DELIMITER ;
/*!50003 SET sql_mode = @saved_sql_mode */;
/*!50003 SET character_set_client = @saved_cs_client */;
/*!50003 SET character_set_results = @saved_cs_results */;
/*!50003 SET collation_connection = @saved_col_connection */;
ALTER DATABASE `skolon` CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci;

--
-- Table structure for table `ou_app_popularity`
--

DROP TABLE IF EXISTS `ou_app_popularity`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ou_app_popularity`
(
    `app_id`     BIGINT NOT NULL,
    `ou_id`      BIGINT NOT NULL,
    `users`      INT    NOT NULL,
    `popularity` DECIMAL(7, 1) DEFAULT NULL,
    PRIMARY KEY (`app_id`, `ou_id`),
    KEY `ou_id` (`ou_id`),
    CONSTRAINT `ou_app_popularity_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ou_developer_setting`
--

DROP TABLE IF EXISTS `ou_developer_setting`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ou_developer_setting`
(
    `ou_id`                     BIGINT     NOT NULL,
    `developer_id`              BIGINT     NOT NULL,
    `creation_time`             DATETIME            DEFAULT CURRENT_TIMESTAMP,
    `update_time`               DATETIME            DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
    `pseudonymisation_enabled`  TINYINT(1) NOT NULL DEFAULT '0',
    `allowed_developer`         TINYINT    NOT NULL DEFAULT '0',
    `disable_first_name_pseudo` TINYINT    NOT NULL DEFAULT '0',
    PRIMARY KEY (`ou_id`, `developer_id`),
    KEY `developer_id` (`developer_id`),
    CONSTRAINT `ou_developer_setting_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `ou_developer_setting_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ou_status`
--

DROP TABLE IF EXISTS `ou_status`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ou_status`
(
    `id`   BIGINT                                                           NOT NULL,
    `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `package`
--

DROP TABLE IF EXISTS `package`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package`
(
    `id`            BIGINT NOT NULL AUTO_INCREMENT COMMENT '1 = user, 2 = class, 3 = school',
    `name`          VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `price`         DECIMAL(10, 2)                                                  DEFAULT NULL,
    `duration`      INT                                                             DEFAULT NULL,
    `duration_type` TINYINT                                                         DEFAULT NULL COMMENT '1 = day, 2 = month, 3 = year',
    `creation_time` DATETIME                                                        DEFAULT NULL,
    `auto_renewal`  TINYINT(1)                                                      DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `package_content`
--

DROP TABLE IF EXISTS `package_content`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_content`
(
    `product_package_id` BIGINT NOT NULL,
    `product_id`         BIGINT NOT NULL,
    `quantity`           INT    NOT NULL,
    PRIMARY KEY (`product_package_id`, `product_id`),
    KEY `fk_package_content_product1_idx` (`product_id`),
    CONSTRAINT `fk_package_content_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_package_content_product_package1` FOREIGN KEY (`product_package_id`) REFERENCES `product_package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `package_licenses`
--

DROP TABLE IF EXISTS `package_licenses`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `package_licenses`
(
    `id`             BIGINT NOT NULL,
    `package_id`     BIGINT  DEFAULT NULL,
    `license_target` TINYINT DEFAULT NULL COMMENT 'skola, klass, singel',
    `app_version_id` BIGINT  DEFAULT NULL,
    `quantity`       INT     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_package_licenses_package1_idx` (`package_id`),
    CONSTRAINT `fk_package_licenses_package1` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_api_entity_change`
--

DROP TABLE IF EXISTS `partner_api_entity_change`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_api_entity_change`
(
    `id`             BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `entity_type`    VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `entity_id`      BIGINT                                                          NOT NULL,
    `application_id` BIGINT                                                          NOT NULL,
    `update_time`    DATETIME                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`        DATETIME                                                                 DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `entity_type` (`entity_type`, `entity_id`, `application_id`),
    KEY `application_id_entity_type_update_time_idx` (`application_id`, `entity_type`, `update_time`),
    KEY `application_id_entity_type_deleted_idx` (`application_id`, `entity_type`, `deleted`, `entity_id`) USING BTREE,
    KEY `application_id_entity_type_update_time_deleted_entity_type_idx` (`application_id`, `entity_type`,
                                                                          `update_time`, `deleted`,
                                                                          `entity_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 840106
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partner_api_log`
--

DROP TABLE IF EXISTS `partner_api_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_api_log`
(
    `id`             BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `application_id` BIGINT                                                          NOT NULL,
    `creation_time`  DATETIME                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `endpoint`       VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `filtered`       TINYINT                                                         NOT NULL,
    `cursor`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `application_id` (`application_id`, `endpoint`, `creation_time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 614
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pass_match`
--

DROP TABLE IF EXISTS `pass_match`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pass_match`
(
    `user_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `pass`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`user_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `password_reset`
--

DROP TABLE IF EXISTS `password_reset`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset`
(
    `code`         VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`      BIGINT                                                           NOT NULL,
    `request_time` DATETIME                                                         NOT NULL,
    PRIMARY KEY (`code`),
    KEY `fk_password_reset_user1_idx` (`user_id`),
    CONSTRAINT `fk_password_reset_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pending_access`
--

DROP TABLE IF EXISTS `pending_access`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pending_access`
(
    `pending_access_id`    BIGINT NOT NULL AUTO_INCREMENT,
    `authcode`             VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `application_id`       BIGINT                                                           DEFAULT NULL,
    `user_id`              BIGINT                                                           DEFAULT NULL,
    `scope_user_name`      BIT(1)                                                           DEFAULT NULL,
    `scope_profile`        BIT(1)                                                           DEFAULT NULL,
    `scope_app_collection` BIT(1)                                                           DEFAULT NULL,
    `scope_add_app`        BIT(1)                                                           DEFAULT NULL,
    `scope_email`          BIT(1)                                                           DEFAULT NULL,
    `scope_groups`         BIT(1)                                                           DEFAULT NULL,
    PRIMARY KEY (`pending_access_id`),
    KEY `fk_pending_access_application_access1_idx` (`application_id`),
    CONSTRAINT `fk_pending_access_application_access1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 654
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `personal_data_processing_agreement`
--

DROP TABLE IF EXISTS `personal_data_processing_agreement`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data_processing_agreement`
(
    `id`            BIGINT   NOT NULL AUTO_INCREMENT,
    `ou_id`         BIGINT   NOT NULL,
    `developer_id`  BIGINT   NOT NULL,
    `creation_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `signed_by`     BIGINT            DEFAULT NULL,
    `deleted`       DATETIME          DEFAULT NULL,
    `file_id`       BIGINT            DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `ou_id` (`ou_id`),
    KEY `developer_id` (`developer_id`),
    KEY `signed_by` (`signed_by`),
    KEY `file_id` (`file_id`),
    CONSTRAINT `personal_data_processing_agreement_ibfk_1` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `personal_data_processing_agreement_ibfk_2` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `personal_data_processing_agreement_ibfk_3` FOREIGN KEY (`signed_by`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `personal_data_processing_agreement_ibfk_4` FOREIGN KEY (`file_id`) REFERENCES `file` (`file_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 26
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugin_session`
--

DROP TABLE IF EXISTS `plugin_session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugin_session`
(
    `id`              BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `access_token`    VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`         BIGINT                                                           NOT NULL,
    `creation_time`   DATETIME                                                         NOT NULL,
    `expiration_time` DATETIME                                                         NOT NULL,
    `language_id`     VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT 'sv',
    PRIMARY KEY (`id`),
    UNIQUE KEY `access_token_UNIQUE` (`access_token`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1116
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product`
(
    `id`                         BIGINT        NOT NULL AUTO_INCREMENT,
    `creation_time`              DATETIME                                                         DEFAULT NULL,
    `deleted`                    DATETIME                                                         DEFAULT NULL,
    `price`                      DECIMAL(10, 2)                                                   DEFAULT NULL,
    `auto_renewal`               TINYINT       NOT NULL                                           DEFAULT '0',
    `duration`                   INT                                                              DEFAULT NULL,
    `duration_type`              TINYINT                                                          DEFAULT NULL COMMENT '1=day,2=month,3=year',
    `app_version_id`             BIGINT                                                           DEFAULT NULL,
    `license_restriction`        TINYINT                                                          DEFAULT NULL COMMENT 'not used',
    `type`                       TINYINT                                                          DEFAULT NULL COMMENT '1 = app license\n2 = integration license',
    `integration_id`             BIGINT                                                           DEFAULT NULL,
    `product_category_id`        BIGINT                                                           DEFAULT NULL,
    `name`                       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description`                VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `license_target`             TINYINT                                                          DEFAULT NULL,
    `developer_id`               BIGINT                                                           DEFAULT NULL,
    `public_id`                  VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `total_max_licenses_limit`   INT                                                              DEFAULT NULL,
    `teacher_max_licenses_limit` INT                                                              DEFAULT NULL,
    `student_max_licenses_limit` INT                                                              DEFAULT NULL,
    `teacher_license_code`       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `student_license_code`       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `index`                      INT                                                              DEFAULT '999999',
    `vat_rate`                   DECIMAL(5, 2) NOT NULL                                           DEFAULT '25.00' COMMENT 'Tax rate in %',
    `ext_id`                     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `activate_on_start`          TINYINT(1)                                                       DEFAULT '1',
    `reseller_id`                BIGINT                                                           DEFAULT NULL,
    `price_upon_request`         TINYINT       NOT NULL                                           DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `public_id_UNIQUE` (`public_id`),
    KEY `fk_product_app_version1_idx` (`app_version_id`),
    KEY `fk_product_integration1_idx` (`integration_id`),
    KEY `fk_product_product_category1_idx` (`product_category_id`),
    KEY `fk_product_developer1_idx` (`developer_id`),
    KEY `reseller_id` (`reseller_id`),
    CONSTRAINT `fk_product_app_version1` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_product_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_product_integration1` FOREIGN KEY (`integration_id`) REFERENCES `integration` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_product_product_category1` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `product_ibfk_1` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1205
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category`
(
    `id`   BIGINT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_extra_exclusion`
--

DROP TABLE IF EXISTS `product_extra_exclusion`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_extra_exclusion`
(
    `product_id` BIGINT NOT NULL,
    `extra_id`   BIGINT NOT NULL,
    PRIMARY KEY (`product_id`, `extra_id`),
    KEY `fk_excluded_app_extra_app_extra1_idx` (`extra_id`),
    KEY `fk_product_extra_exclusion_app_license1_idx` (`product_id`),
    CONSTRAINT `fk_product_extra_exclusion_app_extra1` FOREIGN KEY (`extra_id`) REFERENCES `app_extra` (`extra_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_product_extra_exclusion_app_license1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_lang`
--

DROP TABLE IF EXISTS `product_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_lang`
(
    `product_id`  BIGINT                                                         NOT NULL,
    `language_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `name`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `description` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `deleted`     DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`product_id`, `language_id`),
    CONSTRAINT `fk_product_lang_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_package`
--

DROP TABLE IF EXISTS `product_package`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_package`
(
    `id`               BIGINT         NOT NULL AUTO_INCREMENT,
    `name`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `price`            DECIMAL(10, 2) NOT NULL                                          DEFAULT '0.00',
    `description`      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `creation_time`    DATETIME                                                         DEFAULT NULL,
    `deleted`          DATETIME                                                         DEFAULT NULL,
    `sale_fee`         DECIMAL(5, 2)                                                    DEFAULT NULL,
    `distribution_fee` DECIMAL(5, 2)                                                    DEFAULT NULL,
    `migration_fee`    DECIMAL(5, 2)                                                    DEFAULT NULL,
    `duration`         INT                                                              DEFAULT NULL,
    `duration_type`    TINYINT                                                          DEFAULT NULL COMMENT '1 = day\n2 = month\n3 = year',
    `auto_renewal`     TINYINT                                                          DEFAULT NULL,
    `vat_rate`         DECIMAL(5, 2)  NOT NULL                                          DEFAULT '25.00',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product_price`
--

DROP TABLE IF EXISTS `product_price`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price`
(
    `product_id`  BIGINT                                                         NOT NULL,
    `country_id`  VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `currency_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `price`       DECIMAL(10, 2) DEFAULT NULL,
    `vat_rate_id` BIGINT         DEFAULT NULL,
    PRIMARY KEY (`product_id`, `country_id`),
    KEY `vat_rate_id` (`vat_rate_id`),
    CONSTRAINT `fk_product_price_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `product_price_ibfk_1` FOREIGN KEY (`vat_rate_id`) REFERENCES `vat_rate` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_stats_app_usage`
--

DROP TABLE IF EXISTS `purchase_stats_app_usage`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_stats_app_usage`
(
    `id`         MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ou_id`      BIGINT             NOT NULL,
    `app_id`     BIGINT             NOT NULL,
    `start_date` DATE               NOT NULL,
    `end_date`   DATE               NOT NULL,
    `visits`     MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ou_id` (`ou_id`, `app_id`, `start_date`, `end_date`),
    KEY `app_id` (`app_id`),
    CONSTRAINT `purchase_stats_app_usage_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `purchase_stats_app_usage_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_stats_app_user`
--

DROP TABLE IF EXISTS `purchase_stats_app_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_stats_app_user`
(
    `user_id`                     BIGINT             NOT NULL,
    `visited`                     TINYINT UNSIGNED   NOT NULL,
    `purchase_stats_app_usage_id` MEDIUMINT UNSIGNED NOT NULL,
    PRIMARY KEY (`purchase_stats_app_usage_id`, `user_id`),
    CONSTRAINT `purchase_stats_app_user_ibfk_2` FOREIGN KEY (`purchase_stats_app_usage_id`) REFERENCES `purchase_stats_app_usage` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `purchase_stats_spent`
--

DROP TABLE IF EXISTS `purchase_stats_spent`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_stats_spent`
(
    `id`             MEDIUMINT UNSIGNED                       NOT NULL AUTO_INCREMENT,
    `ou_id`          BIGINT                                   NOT NULL,
    `app_id`         BIGINT DEFAULT NULL,
    `app_package_id` BIGINT DEFAULT NULL,
    `start_date`     DATE                                     NOT NULL,
    `end_date`       DATE                                     NOT NULL,
    `spent`          DECIMAL(13, 4)                           NOT NULL,
    `currency_id`    VARCHAR(5) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ou_id` (`ou_id`, `app_id`, `start_date`, `end_date`, `currency_id`),
    UNIQUE KEY `ou_id_2` (`ou_id`, `app_package_id`, `start_date`, `end_date`, `currency_id`),
    KEY `app_id` (`app_id`),
    CONSTRAINT `purchase_stats_spent_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`),
    CONSTRAINT `purchase_stats_spent_ibfk_2` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qr_card`
--

DROP TABLE IF EXISTS `qr_card`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_card`
(
    `id`                  BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `public_id`           VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `code`                VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `owner_ou_id`         BIGINT                                                          NOT NULL,
    `user_id`             BIGINT                                                                   DEFAULT NULL,
    `active`              TINYINT                                                         NOT NULL DEFAULT '0',
    `revoked`             TINYINT                                                         NOT NULL DEFAULT '0',
    `order_id`            BIGINT                                                                   DEFAULT NULL,
    `authentication_type` TINYINT                                                         NOT NULL DEFAULT '2',
    PRIMARY KEY (`id`),
    UNIQUE KEY `public_id` (`public_id`),
    UNIQUE KEY `code` (`code`),
    KEY `owner_ou_id` (`owner_ou_id`),
    KEY `user_id` (`user_id`),
    KEY `order_id` (`order_id`),
    CONSTRAINT `qr_card_ibfk_1` FOREIGN KEY (`owner_ou_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `qr_card_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `qr_card_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 12
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `qr_order_activated`
--

DROP TABLE IF EXISTS `qr_order_activated`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qr_order_activated`
(
    `order_id`  BIGINT  NOT NULL,
    `activated` TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`order_id`),
    CONSTRAINT `qr_order_activated_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `read_receipt`
--

DROP TABLE IF EXISTS `read_receipt`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `read_receipt`
(
    `receipt_id` BIGINT NOT NULL AUTO_INCREMENT,
    `message_id` BIGINT   DEFAULT NULL,
    `member_id`  BIGINT   DEFAULT NULL,
    `read`       DATETIME DEFAULT NULL,
    PRIMARY KEY (`receipt_id`),
    KEY `fk_read_receipt_message1_idx` (`message_id`),
    KEY `fk_read_receipt_conversation_member1_idx` (`member_id`),
    CONSTRAINT `fk_read_receipt_conversation_member1` FOREIGN KEY (`member_id`) REFERENCES `conversation_member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_read_receipt_message1` FOREIGN KEY (`message_id`) REFERENCES `message` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token`
(
    `refresh_token`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `application_id` BIGINT                                                           NOT NULL,
    PRIMARY KEY (`refresh_token`),
    KEY `fk_refresh_token_application_access1_idx` (`application_id`),
    CONSTRAINT `fk_refresh_token_application_access1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requested_partner_info`
--

DROP TABLE IF EXISTS `requested_partner_info`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requested_partner_info`
(
    `id`                BIGINT NOT NULL AUTO_INCREMENT,
    `developer_id`      BIGINT                                                           DEFAULT NULL,
    `ou_id`             BIGINT                                                           DEFAULT NULL,
    `to`                VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `cc`                VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `creation_time`     DATETIME                                                         DEFAULT NULL,
    `status`            TINYINT                                                          DEFAULT '1' COMMENT '1 = unanswered\n2= answered',
    `answer`            VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `public_id`         VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `type`              TINYINT                                                          DEFAULT NULL COMMENT '1 = Requested license info from partner',
    `availability_date` DATE                                                             DEFAULT NULL,
    `message`           MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `requester_name`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `requester_phone`   VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `requester_email`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 55
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `requested_partner_info_school`
--

DROP TABLE IF EXISTS `requested_partner_info_school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requested_partner_info_school`
(
    `school_id`                 BIGINT NOT NULL,
    `requested_partner_info_id` BIGINT NOT NULL,
    PRIMARY KEY (`school_id`, `requested_partner_info_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reseller`
--

DROP TABLE IF EXISTS `reseller`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseller`
(
    `id`                  BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `city`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `address`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `phone`               VARCHAR(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `postal_code`         VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `description`         VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `billing_address`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `billing_country_id`  VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci    DEFAULT NULL,
    `billing_postal_code` VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `billing_city`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `billing_email`       VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `e_invoice_number`    VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `organization_number` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `visma_number`        VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `vat_registration_id` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `billing_country_id` (`billing_country_id`),
    CONSTRAINT `reseller_ibfk_1` FOREIGN KEY (`billing_country_id`) REFERENCES `country` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review`
(
    `id`            BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `app_id`        BIGINT                                                          NOT NULL,
    `user_id`       BIGINT                                                          NOT NULL,
    `rating`        TINYINT                                                         NOT NULL,
    `title`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `content`       VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `country_id`    VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `school_id`     VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `creation_time` DATETIME                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `app_id` (`app_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `review_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduled_mail_chain`
--

DROP TABLE IF EXISTS `scheduled_mail_chain`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheduled_mail_chain`
(
    `id`            BIGINT   NOT NULL AUTO_INCREMENT,
    `creation_time` DATETIME NOT NULL                                                DEFAULT CURRENT_TIMESTAMP,
    `update_time`   DATETIME                                                         DEFAULT NULL,
    `deleted`       DATETIME                                                         DEFAULT NULL,
    `ou_id`         BIGINT                                                           DEFAULT NULL,
    `mail_chain_id` BIGINT                                                           DEFAULT NULL,
    `mail_template` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `type`          TINYINT  NOT NULL COMMENT '1=School admin startupmail\n2=Teacher startupmail\n3=Student startupmail',
    `send_time`     DATETIME                                                         DEFAULT NULL,
    `handled_time`  DATETIME                                                         DEFAULT NULL,
    `paused`        TINYINT                                                          DEFAULT '0',
    PRIMARY KEY (`id`),
    KEY `fk_mail_chain_id_idx` (`mail_chain_id`),
    KEY `fk_ou_id_idx` (`ou_id`),
    CONSTRAINT `fk_mail_chain_id` FOREIGN KEY (`mail_chain_id`) REFERENCES `mail_chain` (`id`),
    CONSTRAINT `fk_scheduled_mail_chain_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school`
(
    `school_id`          BIGINT NOT NULL AUTO_INCREMENT,
    `public_id`          VARCHAR(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `ext_id1`            VARCHAR(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `ext_id2`            VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `ext_id`             VARCHAR(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `ext_source`         VARCHAR(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `pm_crm_id`          BIGINT                                                        DEFAULT NULL,
    `kf_crm_id`          BIGINT                                                        DEFAULT NULL,
    `name`               VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `address`            VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `city`               VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `zipcode`            VARCHAR(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `municipality`       VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `phone1`             VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `phone2`             VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `web`                VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `contact_user_id`    BIGINT                                                        DEFAULT NULL,
    `deleted`            DATETIME                                                      DEFAULT NULL,
    `approved_agreement` DATETIME                                                      DEFAULT NULL,
    `approved_by`        BIGINT                                                        DEFAULT NULL,
    `school_code`        VARCHAR(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `creation_time`      DATETIME                                                      DEFAULT NULL,
    PRIMARY KEY (`school_id`),
    UNIQUE KEY `ext_id2_UNIQUE` (`ext_id2`),
    KEY `fk_school_user1_idx` (`contact_user_id`),
    KEY `name_idx` (`name`),
    KEY `fk_school_user2_idx` (`approved_by`),
    CONSTRAINT `fk_school_user1` FOREIGN KEY (`contact_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_school_user2` FOREIGN KEY (`approved_by`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 921896
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_app_license`
--

DROP TABLE IF EXISTS `school_app_license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_app_license`
(
    `school_id`       BIGINT NOT NULL,
    `app_id`          BIGINT NOT NULL,
    `name`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `expiration_time` DATE                                                             DEFAULT NULL,
    `num_licenses`    INT                                                              DEFAULT NULL,
    `app_file_id`     BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`school_id`, `app_id`),
    KEY `fk_school_has_app_app1_idx` (`app_id`),
    KEY `fk_school_has_app_school1_idx` (`school_id`),
    CONSTRAINT `fk_school_has_app_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_school_has_app_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_assignment_status`
--

DROP TABLE IF EXISTS `school_assignment_status`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_assignment_status`
(
    `id`                    BIGINT    NOT NULL AUTO_INCREMENT,
    `school_id`             BIGINT    NOT NULL,
    `app_version_id`        BIGINT             DEFAULT NULL,
    `assigned_users`        INT       NOT NULL DEFAULT '0',
    `users_without_license` INT       NOT NULL DEFAULT '0',
    `update_time`           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `app_package_id`        BIGINT             DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `school_id` (`school_id`, `app_version_id`),
    UNIQUE KEY `school_assignment_status_school_id_app_package_id_idx` (`school_id`, `app_package_id`) USING BTREE,
    KEY `app_version_id` (`app_version_id`),
    KEY `app_package_id` (`app_package_id`),
    CONSTRAINT `school_assignment_status_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `school_assignment_status_ibfk_2` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `school_assignment_status_ibfk_3` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_free_app`
--

DROP TABLE IF EXISTS `school_free_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_free_app`
(
    `school_id` BIGINT NOT NULL,
    `app_id`    BIGINT NOT NULL,
    PRIMARY KEY (`school_id`, `app_id`),
    KEY `app_id` (`app_id`),
    CONSTRAINT `school_free_app_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `school_free_app_ibfk_2` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_is_type`
--

DROP TABLE IF EXISTS `school_is_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_is_type`
(
    `school_id`      BIGINT NOT NULL,
    `school_type_id` BIGINT NOT NULL,
    PRIMARY KEY (`school_id`, `school_type_id`),
    KEY `fk_school_has_school_type_school_type1_idx` (`school_type_id`),
    CONSTRAINT `fk_school_has_school_type_school_type1` FOREIGN KEY (`school_type_id`) REFERENCES `school_type` (`school_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_school_is_type_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_module`
--

DROP TABLE IF EXISTS `school_module`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_module`
(
    `school_id`  BIGINT     NOT NULL,
    `module_id`  BIGINT     NOT NULL,
    `is_default` TINYINT(1) NOT NULL DEFAULT '1',
    PRIMARY KEY (`school_id`, `module_id`),
    KEY `fk_school_module_module1_idx` (`module_id`),
    CONSTRAINT `fk_school_module_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_school_module_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_type`
--

DROP TABLE IF EXISTS `school_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_type`
(
    `school_type_id` BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `code`           VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`school_type_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_unit`
--

DROP TABLE IF EXISTS `school_unit`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_unit`
(
    `unit_code`               VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `school_id`               BIGINT                                                          NOT NULL,
    `type`                    TINYINT                                                          DEFAULT '1',
    `name`                    VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `id`                      BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `ext_source`              VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `official_school_code_id` BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ext_source_unit_code_idx` (`unit_code`, `ext_source`),
    UNIQUE KEY `official_school_code_id` (`official_school_code_id`),
    KEY `fk_school_unit_ou1_idx` (`school_id`),
    CONSTRAINT `fk_school_unit_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `school_unit_ibfk_1` FOREIGN KEY (`official_school_code_id`) REFERENCES `official_school_code` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 284
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_unit_bkup`
--

DROP TABLE IF EXISTS `school_unit_bkup`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_unit_bkup`
(
    `unit_code` VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL,
    `school_id` BIGINT                                                       NOT NULL,
    PRIMARY KEY (`unit_code`),
    UNIQUE KEY `index2` (`unit_code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `school_update`
--

DROP TABLE IF EXISTS `school_update`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_update`
(
    `school_update_id` BIGINT NOT NULL AUTO_INCREMENT,
    `school_id`        BIGINT                                                           DEFAULT NULL,
    `photo_org_id`     VARCHAR(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `photo_org_number` BIGINT                                                           DEFAULT NULL,
    `photo_crm_id`     BIGINT                                                           DEFAULT NULL,
    `from_pm`          TINYINT(1)                                                       DEFAULT NULL,
    `from_kf`          TINYINT(1)                                                       DEFAULT NULL,
    `name`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `year`             YEAR                                                             DEFAULT NULL,
    `term`             CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      DEFAULT NULL,
    `sync_time`        DATETIME                                                         DEFAULT NULL,
    `merge_completed`  DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`school_update_id`),
    KEY `fk_school_update_ou1_idx` (`school_id`),
    CONSTRAINT `fk_school_update_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 627
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schoolyear`
--

DROP TABLE IF EXISTS `schoolyear`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schoolyear`
(
    `id`         INT UNSIGNED                              NOT NULL AUTO_INCREMENT,
    `country_id` VARCHAR(10) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `start_date` DATE DEFAULT NULL COMMENT 'The year part of this date is not used',
    PRIMARY KEY (`id`),
    UNIQUE KEY `country_id` (`country_id`),
    CONSTRAINT `schoolyear_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester`
(
    `id`         INT UNSIGNED                              NOT NULL AUTO_INCREMENT,
    `country_id` VARCHAR(10) COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `start_date` DATE DEFAULT NULL COMMENT 'The year part of this date is not used',
    `end_date`   DATE DEFAULT NULL COMMENT 'The year part of this date is not used',
    PRIMARY KEY (`id`),
    UNIQUE KEY `country_id` (`country_id`, `start_date`, `end_date`),
    CONSTRAINT `semester_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `send_mail`
--

DROP TABLE IF EXISTS `send_mail`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `send_mail`
(
    `id`                      BIGINT NOT NULL AUTO_INCREMENT,
    `creation_time`           DATETIME                                                         DEFAULT NULL,
    `send_time`               DATETIME                                                         DEFAULT NULL,
    `scheduled_for_send`      DATETIME                                                         DEFAULT NULL,
    `sent_time`               DATETIME                                                         DEFAULT NULL,
    `user_id`                 BIGINT                                                           DEFAULT NULL,
    `template_id`             VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT 'Mailchimp template id',
    `merge_tags`              MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci COMMENT 'JSON-formatted merge tags',
    `public_id`               VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `to`                      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `cc`                      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `bcc`                     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `from`                    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `mail_chain_id`           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `ext_id`                  VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT 'Can be used to reference to other data such as requested_partner_info.',
    `scheduled_mail_chain_id` BIGINT                                                           DEFAULT NULL,
    `merge_language`          VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT 'mailchimp',
    `is_reminder`             TINYINT                                                          DEFAULT NULL,
    `next_send_mail_id`       BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `send_time_sent_time_scheduled_for_send_idx` (`send_time`, `sent_time`, `scheduled_for_send`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 47801
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `session`
(
    `session_id`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL COMMENT 'access token',
    `user_id`              BIGINT                                                                    DEFAULT NULL,
    `school_id`            BIGINT                                                                    DEFAULT NULL,
    `last_active`          DATETIME                                                                  DEFAULT CURRENT_TIMESTAMP COMMENT '	',
    `first_name`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `last_name`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `module_list`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `socket_id`            VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `creation_time`        DATETIME                                                                  DEFAULT CURRENT_TIMESTAMP,
    `deleted`              DATETIME                                                                  DEFAULT NULL,
    `language_id`          VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT 'sv',
    `country_id`           VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT 'se',
    `can_edit_settings`    TINYINT(1)                                                       NOT NULL DEFAULT '1',
    `authentication_level` TINYINT                                                          NOT NULL DEFAULT '1',
    `login_finalized`      TINYINT                                                          NOT NULL DEFAULT '0',
    PRIMARY KEY (`session_id`),
    KEY `fk_session_user1_idx` (`user_id`),
    KEY `last_active` (`last_active`, `user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopcart`
--

DROP TABLE IF EXISTS `shopcart`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart`
(
    `id`                      BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `peppol_id`               CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci       DEFAULT NULL,
    `creation_time`           DATETIME                                                           DEFAULT NULL,
    `order_date`              DATETIME                                                           DEFAULT NULL,
    `bought_by_user`          BIGINT                                                             DEFAULT NULL,
    `bought_by_ou`            BIGINT                                                             DEFAULT NULL,
    `user_customer_number_id` BIGINT                                                             DEFAULT NULL,
    `customer_contact`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `customer_message`        VARCHAR(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `delivery_email`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `currency_id`             VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `status`                  TINYINT                                                            DEFAULT NULL,
    `order_quote_id`          BIGINT                                                             DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `peppol_id_UNIQUE` (`peppol_id`),
    KEY `bought_by_user` (`bought_by_user`),
    KEY `user_customer_number_id` (`user_customer_number_id`),
    KEY `order_quote_id` (`order_quote_id`),
    CONSTRAINT `shopcart_ibfk_1` FOREIGN KEY (`bought_by_user`) REFERENCES `user` (`user_id`),
    CONSTRAINT `shopcart_ibfk_2` FOREIGN KEY (`user_customer_number_id`) REFERENCES `user_customer_number` (`id`),
    CONSTRAINT `shopcart_ibfk_3` FOREIGN KEY (`order_quote_id`) REFERENCES `order_quote` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 41
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopcart_discount_code`
--

DROP TABLE IF EXISTS `shopcart_discount_code`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart_discount_code`
(
    `shopcart_id`      BIGINT NOT NULL,
    `discount_code_id` BIGINT NOT NULL,
    PRIMARY KEY (`shopcart_id`, `discount_code_id`),
    KEY `discount_code_id` (`discount_code_id`),
    CONSTRAINT `shopcart_discount_code_ibfk_1` FOREIGN KEY (`shopcart_id`) REFERENCES `shopcart` (`id`),
    CONSTRAINT `shopcart_discount_code_ibfk_2` FOREIGN KEY (`discount_code_id`) REFERENCES `discount_code` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shopcart_item`
--

DROP TABLE IF EXISTS `shopcart_item`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopcart_item`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT,
    `shopcart_id`    BIGINT NOT NULL,
    `quantity`       INT    NOT NULL,
    `product_id`     BIGINT DEFAULT NULL,
    `app_package_id` BIGINT DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `shopcart_id` (`shopcart_id`),
    KEY `product_id` (`product_id`),
    KEY `app_package_id` (`app_package_id`),
    CONSTRAINT `shopcart_item_ibfk_1` FOREIGN KEY (`shopcart_id`) REFERENCES `shopcart` (`id`),
    CONSTRAINT `shopcart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
    CONSTRAINT `shopcart_item_ibfk_3` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 50
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `single_license`
--

DROP TABLE IF EXISTS `single_license`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `single_license`
(
    `single_id`  BIGINT NOT NULL AUTO_INCREMENT,
    `app_id`     BIGINT DEFAULT NULL,
    `school_id`  BIGINT DEFAULT NULL,
    `expiration` DATE   DEFAULT NULL,
    `user_id`    BIGINT DEFAULT NULL,
    PRIMARY KEY (`single_id`),
    KEY `fk_single_licenses_school1_idx` (`school_id`),
    KEY `fk_single_license_app1_idx` (`app_id`),
    CONSTRAINT `fk_single_license_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_single_licenses_school1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `site_tip`
--

DROP TABLE IF EXISTS `site_tip`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_tip`
(
    `id`        INT                                                             NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_type` BIGINT                                                          NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_album`
--

DROP TABLE IF EXISTS `skolfoto_album`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_album`
(
    `album_id`  BIGINT NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_id` BIGINT                                                          DEFAULT NULL,
    PRIMARY KEY (`album_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_group`
--

DROP TABLE IF EXISTS `skolfoto_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_group`
(
    `group_id`         BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `school_id`        BIGINT                                                           NOT NULL,
    `group_type`       TINYINT                                                          NOT NULL,
    `theme_group_name` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `term`             CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci     DEFAULT NULL,
    `year`             YEAR                                                            DEFAULT NULL,
    `class_id`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`group_id`),
    KEY `fk_skolfoto_group_school1_idx` (`school_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 42874
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_group_access`
--

DROP TABLE IF EXISTS `skolfoto_group_access`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_group_access`
(
    `user_id`  BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    PRIMARY KEY (`user_id`, `group_id`),
    KEY `fk_skolfoto_group_access_skolfoto_group1_idx` (`group_id`),
    CONSTRAINT `fk_skolfoto_group_access_skolfoto_group1` FOREIGN KEY (`group_id`) REFERENCES `skolfoto_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_skolfoto_group_access_skolfoto_user1` FOREIGN KEY (`user_id`) REFERENCES `skolfoto_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_group_order`
--

DROP TABLE IF EXISTS `skolfoto_group_order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_group_order`
(
    `skolfoto_group_order_id` BIGINT NOT NULL,
    `group_id`                BIGINT DEFAULT NULL,
    `index`                   INT    DEFAULT NULL,
    `owner_id`                BIGINT DEFAULT NULL,
    PRIMARY KEY (`skolfoto_group_order_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_image_album`
--

DROP TABLE IF EXISTS `skolfoto_image_album`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_image_album`
(
    `image_album_id` BIGINT NOT NULL AUTO_INCREMENT,
    `album_id`       BIGINT DEFAULT NULL,
    `file_id`        BIGINT DEFAULT NULL,
    PRIMARY KEY (`image_album_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 73
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_image_group_tag`
--

DROP TABLE IF EXISTS `skolfoto_image_group_tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_image_group_tag`
(
    `tag_id`   BIGINT NOT NULL AUTO_INCREMENT,
    `image_id` BIGINT DEFAULT NULL,
    `group_id` BIGINT DEFAULT NULL,
    PRIMARY KEY (`tag_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36666
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_image_user_tag`
--

DROP TABLE IF EXISTS `skolfoto_image_user_tag`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_image_user_tag`
(
    `tag_id`   BIGINT NOT NULL AUTO_INCREMENT,
    `image_id` BIGINT DEFAULT NULL,
    `user_id`  BIGINT DEFAULT NULL,
    PRIMARY KEY (`tag_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 36
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_membership`
--

DROP TABLE IF EXISTS `skolfoto_membership`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_membership`
(
    `user_id`  BIGINT NOT NULL,
    `group_id` BIGINT NOT NULL,
    PRIMARY KEY (`user_id`, `group_id`),
    KEY `fk_skolfoto_membership_skolfoto_group1_idx` (`group_id`),
    CONSTRAINT `fk_skolfoto_membership_skolfoto_group1` FOREIGN KEY (`group_id`) REFERENCES `skolfoto_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_skolfoto_membership_skolfoto_user1` FOREIGN KEY (`user_id`) REFERENCES `skolfoto_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_org_connection`
--

DROP TABLE IF EXISTS `skolfoto_org_connection`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_org_connection`
(
    `school_id`       BIGINT                                                           NOT NULL,
    `kasper_id`       VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `source`          CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      NOT NULL,
    `admin_user_id`   BIGINT                                                           NOT NULL,
    `admin_user_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `admin_password`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`school_id`, `admin_user_name`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_photo`
--

DROP TABLE IF EXISTS `skolfoto_photo`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_photo`
(
    `photo_id`       BIGINT NOT NULL AUTO_INCREMENT,
    `school_id`      BIGINT NOT NULL,
    `user_id`        BIGINT                                                            DEFAULT NULL,
    `group_id`       BIGINT                                                            DEFAULT NULL,
    `type`           TINYINT                                                           DEFAULT NULL,
    `file_name`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `content_type`   VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `gs_object_name` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `size`           INT                                                               DEFAULT NULL,
    `url`            VARCHAR(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`photo_id`),
    KEY `fk_skolfoto_photo_school1_idx` (`school_id`),
    KEY `fk_skolfoto_photo_skolfoto_user1_idx` (`user_id`),
    KEY `fk_skolfoto_photo_skolfoto_group1_idx` (`group_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 494109
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_photo_import`
--

DROP TABLE IF EXISTS `skolfoto_photo_import`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_photo_import`
(
    `id`          BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `school_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `status`      TINYINT                                                          NOT NULL DEFAULT '0',
    `start`       DATETIME                                                                  DEFAULT NULL,
    `end`         DATETIME                                                                  DEFAULT NULL,
    `school_id`   BIGINT                                                                    DEFAULT NULL,
    `num_persons` INT                                                                       DEFAULT NULL,
    `num_groups`  INT                                                                       DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `index2` (`status`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 24040
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_school`
--

DROP TABLE IF EXISTS `skolfoto_school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_school`
(
    `school_id` BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `skolon_id` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL COMMENT 'skolon public id',
    `kasper_id` BIGINT                                                          DEFAULT NULL,
    `company`   CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci     DEFAULT NULL,
    PRIMARY KEY (`school_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3627
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_sent_photo_group`
--

DROP TABLE IF EXISTS `skolfoto_sent_photo_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_sent_photo_group`
(
    `id`              BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `photo_group`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `contract_number` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `type_number`     INT                                                              NOT NULL,
    `time_sent`       DATETIME                                                         NOT NULL,
    `org_number`      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index2` (`photo_group`, `contract_number`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3132
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_student_order`
--

DROP TABLE IF EXISTS `skolfoto_student_order`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_student_order`
(
    `skolfoto_student_order_id` BIGINT NOT NULL AUTO_INCREMENT,
    `user_id`                   BIGINT DEFAULT NULL,
    `index`                     INT    DEFAULT NULL,
    `owner_id`                  BIGINT DEFAULT NULL,
    `group_id`                  BIGINT DEFAULT NULL,
    PRIMARY KEY (`skolfoto_student_order_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1458
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_user`
--

DROP TABLE IF EXISTS `skolfoto_user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_user`
(
    `user_id`    BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `last_name`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `is_admin`   TINYINT                                                          NOT NULL DEFAULT '0',
    `user_type`  TINYINT                                                          NOT NULL,
    `skolon_id`  VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `school_id`  BIGINT                                                           NOT NULL,
    `term`       CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      NOT NULL,
    `year`       YEAR                                                             NOT NULL,
    `cust_id`    VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    KEY `fk_skolfoto_user_school1_idx` (`school_id`),
    CONSTRAINT `fk_skolfoto_user_skolfoto_school1` FOREIGN KEY (`school_id`) REFERENCES `skolfoto_school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 790081
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `skolfoto_user_note`
--

DROP TABLE IF EXISTS `skolfoto_user_note`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skolfoto_user_note`
(
    `user_id` BIGINT NOT NULL,
    `note`    LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `user_id_UNIQUE` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ss12000_push_sync`
--

DROP TABLE IF EXISTS `ss12000_push_sync`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ss12000_push_sync`
(
    `application_id` BIGINT                                                           NOT NULL,
    `base_url`       VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `access_token`   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`application_id`),
    CONSTRAINT `ss12000_push_sync_ibfk_1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `student_update`
--

DROP TABLE IF EXISTS `student_update`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_update`
(
    `student_update_id` BIGINT     NOT NULL AUTO_INCREMENT,
    `user_id`           BIGINT                                                           DEFAULT NULL,
    `school_update_id`  BIGINT                                                           DEFAULT NULL,
    `group_update_id`   BIGINT                                                           DEFAULT NULL,
    `photo_cust_id`     VARCHAR(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `school_id`         BIGINT                                                           DEFAULT NULL,
    `import_id`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `u_time`            DATETIME                                                         DEFAULT NULL,
    `first_name`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `last_name`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `class`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `address`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `zipcode`           VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `city`              VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `ext_id1`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `ext_id2`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `phone1`            VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `phone2`            VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `gs_image_name`     VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `is_clean_image`    TINYINT(1) NOT NULL                                              DEFAULT '0',
    `year`              YEAR                                                             DEFAULT NULL,
    `term`              CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      DEFAULT NULL,
    `sync_time`         DATETIME                                                         DEFAULT NULL,
    `merge_completed`   DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`student_update_id`),
    KEY `fk_student_update_user1_idx` (`user_id`),
    KEY `fk_student_update_user_group_update1_idx` (`group_update_id`),
    KEY `fk_student_update_school_update1_idx` (`school_update_id`),
    CONSTRAINT `fk_student_update_school_update1` FOREIGN KEY (`school_update_id`) REFERENCES `school_update` (`school_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_student_update_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_student_update_user_group_update1` FOREIGN KEY (`group_update_id`) REFERENCES `user_group_update` (`group_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 38013
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcontractor`
--

DROP TABLE IF EXISTS `subcontractor`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcontractor`
(
    `id`           BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `developer_id` BIGINT                                                           NOT NULL,
    PRIMARY KEY (`id`),
    KEY `developer_id` (`developer_id`),
    CONSTRAINT `subcontractor_ibfk_1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject`
(
    `subject_id`          BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `name`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `code`                VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `category`            VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `country_id`          VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'se',
    `language`            VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT 'sv',
    `language_2`          VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `language_3`          VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `subject_category_id` BIGINT                                                                  DEFAULT NULL,
    PRIMARY KEY (`subject_id`),
    KEY `subject_category_id` (`subject_category_id`),
    CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 951
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject_category`
--

DROP TABLE IF EXISTS `subject_category`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_category`
(
    `id`       BIGINT                                                           NOT NULL,
    `imageUrl` VARCHAR(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subject_category_lang`
--

DROP TABLE IF EXISTS `subject_category_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_category_lang`
(
    `subject_category_id` BIGINT                                                           NOT NULL,
    `language_id`         VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `name`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    PRIMARY KEY (`subject_category_id`, `language_id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `subject_category_lang_ibfk_1` FOREIGN KEY (`subject_category_id`) REFERENCES `subject_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `subject_category_lang_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription`
(
    `id`                         BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `creation_time`              DATETIME                                                       NOT NULL,
    `deleted`                    DATETIME                                                                DEFAULT NULL,
    `original_order_item_id`     BIGINT                                                                  DEFAULT NULL,
    `contact_user_id`            BIGINT                                                                  DEFAULT NULL,
    `auto_renewal`               TINYINT                                                                 DEFAULT NULL,
    `renewal_price`              DECIMAL(10, 2)                                                          DEFAULT NULL,
    `renewal_fee`                DECIMAL(5, 2)                                                           DEFAULT NULL,
    `renewal_duration`           INT                                                                     DEFAULT NULL,
    `renewal_duration_type`      TINYINT                                                                 DEFAULT NULL COMMENT '1=day,2=month,3=year',
    `start_time`                 DATE                                                                    DEFAULT NULL,
    `end_time`                   DATE                                                                    DEFAULT NULL,
    `school_id`                  BIGINT                                                                  DEFAULT NULL,
    `currency_id`                VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT 'SEK',
    `product_id`                 BIGINT                                                                  DEFAULT NULL,
    `subscriber`                 BIGINT                                                                  DEFAULT NULL,
    `notes`                      VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `skolon_reference`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_reference_number`  VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_contact`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_city`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_postal_code`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_address`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `reseller_commission`        DECIMAL(13, 4)                                                          DEFAULT NULL,
    `reseller_id`                BIGINT                                                                  DEFAULT NULL,
    `discount_type`              SMALLINT                                                                DEFAULT NULL,
    `initial_discount`           DECIMAL(13, 4)                                                          DEFAULT NULL,
    `startup_cost`               DECIMAL(13, 4)                                                          DEFAULT NULL,
    `price`                      DECIMAL(13, 4)                                                          DEFAULT NULL,
    `price_model`                SMALLINT                                                                DEFAULT NULL,
    `user_limit`                 INT                                                                     DEFAULT NULL,
    `billing_details`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `type`                       TINYINT                                                        NOT NULL DEFAULT '1',
    `integration_id`             BIGINT                                                                  DEFAULT NULL,
    `seller_contact`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `customer_contact`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `cost_centre`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `order_type`                 TINYINT                                                                 DEFAULT NULL,
    `reference`                  VARCHAR(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `developer_id`               BIGINT                                                                  DEFAULT NULL,
    `origin`                     VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `billing_contact_email`      VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `billing_contact_phone`      VARCHAR(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `e_invoice_number`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `invoice_email`              VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `times_to_renew`             TINYINT UNSIGNED                                                        DEFAULT NULL,
    `new_sale`                   TINYINT                                                                 DEFAULT NULL,
    `cancellation_notice_period` INT                                                            NOT NULL DEFAULT '0',
    `cancelled`                  DATETIME                                                                DEFAULT NULL,
    `discount`                   DECIMAL(13, 4)                                                          DEFAULT NULL,
    `delivery_email`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci        DEFAULT NULL,
    `partner_discount`           DECIMAL(13, 4)                                                          DEFAULT NULL,
    `combined_discount`          DECIMAL(13, 4)                                                          DEFAULT NULL,
    `vat_rate_id`                BIGINT                                                                  DEFAULT NULL,
    `surcharge`                  DECIMAL(13, 4)                                                 NOT NULL DEFAULT '0.0000',
    `app_package_id`             BIGINT                                                                  DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_subscription_school1_idx` (`school_id`),
    KEY `fk_subscription_user1_idx` (`contact_user_id`),
    KEY `product_id` (`product_id`),
    KEY `subscriber` (`subscriber`),
    KEY `reseller_id` (`reseller_id`),
    KEY `integration_id` (`integration_id`),
    KEY `developer_id` (`developer_id`),
    KEY `vat_rate_id` (`vat_rate_id`),
    KEY `app_package_id` (`app_package_id`),
    CONSTRAINT `fk_subscription_school1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_subscription_user1` FOREIGN KEY (`contact_user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_ibfk_2` FOREIGN KEY (`subscriber`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_ibfk_3` FOREIGN KEY (`reseller_id`) REFERENCES `reseller` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_ibfk_4` FOREIGN KEY (`integration_id`) REFERENCES `integration` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_ibfk_5` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_ibfk_6` FOREIGN KEY (`vat_rate_id`) REFERENCES `vat_rate` (`id`),
    CONSTRAINT `subscription_ibfk_7` FOREIGN KEY (`app_package_id`) REFERENCES `app_package` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1153
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_event_change`
--

DROP TABLE IF EXISTS `subscription_event_change`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_event_change`
(
    `id`             BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `event_log_id`   BIGINT                                                           NOT NULL,
    `field`          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `previous_value` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `new_value`      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `event_log_id` (`event_log_id`),
    CONSTRAINT `subscription_event_change_ibfk_1` FOREIGN KEY (`event_log_id`) REFERENCES `subscription_event_log` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 333
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_event_log`
--

DROP TABLE IF EXISTS `subscription_event_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_event_log`
(
    `id`              BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `subscription_id` BIGINT                                                           NOT NULL,
    `type`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`         BIGINT                                                                    DEFAULT NULL,
    `event_date`      DATETIME                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `subscription_id` (`subscription_id`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `subscription_event_log_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_event_log_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 378
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscription_item`
--

DROP TABLE IF EXISTS `subscription_item`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription_item`
(
    `id`                   BIGINT  NOT NULL AUTO_INCREMENT,
    `subscription_id`      BIGINT  NOT NULL,
    `app_version_id`       BIGINT  NOT NULL,
    `license_owner_id`     BIGINT  NOT NULL,
    `quantity`             INT     NOT NULL,
    `teacher_license_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `student_license_code` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `total_max_limit`      INT                                                              DEFAULT NULL,
    `teacher_max_limit`    INT                                                              DEFAULT NULL,
    `student_max_limit`    INT                                                              DEFAULT NULL,
    `license_target`       TINYINT NOT NULL,
    PRIMARY KEY (`id`),
    KEY `subscription_id` (`subscription_id`),
    KEY `app_version_id` (`app_version_id`),
    KEY `license_owner_id` (`license_owner_id`),
    CONSTRAINT `subscription_item_ibfk_1` FOREIGN KEY (`subscription_id`) REFERENCES `subscription` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_item_ibfk_3` FOREIGN KEY (`license_owner_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `subscription_item_ibfk_4` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 52
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_config`
--

DROP TABLE IF EXISTS `sync_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_config`
(
    `id`                     BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `creation_time`          DATETIME                                                        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `type`                   TINYINT                                                         NOT NULL COMMENT '1=IMS\n2=VISMA\n\n',
    `ready`                  TINYINT                                                         NOT NULL DEFAULT '0' COMMENT 'Indicates if the sync is ready to run. If migration is needed it should be = 0.',
    `ou_id`                  BIGINT                                                          NOT NULL COMMENT 'Organization',
    `application_access_id`  BIGINT                                                          NOT NULL,
    `org_identifier`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `client_id`              VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'Id/username for requesting data from partner',
    `client_secret`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'Password for requesting data from partner',
    `input_username`         VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'Attribute from input data that is used as username',
    `input_email`            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'Attribute from input data that is used as email',
    `input_idp_identifier`   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'Attribute from input data that is used as idp-id',
    `input_user_types`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'User types from input data that is sent to Skolon. Specified as a comma separated list.',
    `input_group_types`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL COMMENT 'Group types from input data that is sent to Skolon Specified as a comma separated list.',
    `att_config_id`          VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `groups_from_activities` VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '0',
    `idp_identifier_find`    VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `idp_identifier_replace` VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `ftp_user`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `ftp_pass`               VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `data_fetcher`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `private_tieto_key`      MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `public_tieto_key`       MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `data_urls`              MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `remote_ftp_private_key` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `input_encoding`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_sync_config_ou_id_idx` (`ou_id`),
    KEY `fk_sync_config_application_access_id_idx` (`application_access_id`),
    CONSTRAINT `fk_sync_config_application_access_id` FOREIGN KEY (`application_access_id`) REFERENCES `application_access` (`application_id`),
    CONSTRAINT `fk_sync_config_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 65
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_config_ous`
--

DROP TABLE IF EXISTS `sync_config_ous`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_config_ous`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT,
    `ou_id`          BIGINT NOT NULL,
    `sync_config_id` BIGINT NOT NULL,
    `access_token`   VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_sync_config_ous_ou_id_idx` (`ou_id`),
    KEY `fk_sync_config_ous_sync_config_id_idx` (`sync_config_id`),
    CONSTRAINT `fk_sync_config_ous_ou_id` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `fk_sync_config_ous_sync_config_id` FOREIGN KEY (`sync_config_id`) REFERENCES `sync_config` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 57
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_event_log`
--

DROP TABLE IF EXISTS `sync_event_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_event_log`
(
    `id`             BIGINT                                                          NOT NULL AUTO_INCREMENT,
    `application_id` BIGINT                                                          NOT NULL,
    `school_id`      BIGINT                                                          NOT NULL,
    `school_unit_id` BIGINT                                                                   DEFAULT NULL,
    `creation_time`  TIMESTAMP                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `entity_type`    VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `event_type`     VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `num_existing`   INT                                                             NOT NULL,
    `num_created`    INT                                                             NOT NULL DEFAULT '0',
    `num_deleted`    INT                                                             NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 329
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_log`
--

DROP TABLE IF EXISTS `sync_log`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_log`
(
    `id`                    BIGINT NOT NULL AUTO_INCREMENT,
    `creation_time`         DATETIME                                                        DEFAULT NULL,
    `start_time`            DATETIME                                                        DEFAULT NULL,
    `end_time`              DATETIME                                                        DEFAULT NULL,
    `application_access_id` BIGINT                                                          DEFAULT NULL,
    `ou_id`                 BIGINT                                                          DEFAULT NULL,
    `result`                LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `input_body`            LONGTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `input_params`          MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `input_headers`         MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `type`                  VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `num_created`           INT                                                             DEFAULT NULL,
    `num_updated`           INT                                                             DEFAULT NULL,
    `num_deleted`           INT                                                             DEFAULT NULL,
    `num_successful`        INT                                                             DEFAULT NULL,
    `num_failed`            INT                                                             DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_ou_idx` (`ou_id`),
    KEY `fk_application_idx` (`application_access_id`),
    CONSTRAINT `fk_application` FOREIGN KEY (`application_access_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_ou` FOREIGN KEY (`ou_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13468
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tech_notification`
--

DROP TABLE IF EXISTS `tech_notification`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tech_notification`
(
    `id`            BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `ou_id`         BIGINT                                                                  DEFAULT NULL,
    `idp_id`        BIGINT                                                                  DEFAULT NULL,
    `creation_time` DATETIME                                                       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`   DATETIME                                                                DEFAULT NULL,
    `handled_time`  DATETIME                                                                DEFAULT NULL,
    `handled_by`    BIGINT                                                                  DEFAULT NULL,
    `type`          SMALLINT                                                       NOT NULL,
    `sub_type`      VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci         DEFAULT NULL,
    `message`       MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `status`        TINYINT                                                        NOT NULL,
    PRIMARY KEY (`id`),
    KEY `handled_by` (`handled_by`),
    CONSTRAINT `tech_notification_ibfk_1` FOREIGN KEY (`handled_by`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 167
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_merged1`
--

DROP TABLE IF EXISTS `temp_scb_merged1`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_merged1`
(
    `Skolenhet` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`   VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`    VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_school`
--

DROP TABLE IF EXISTS `temp_scb_school`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_school`
(
    `Kod`                            VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`                         VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhetskod`                  VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhetsnamn`                 VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Typavhuvudman`                  VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Grunskola`                      VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Forskoleklass`                  VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Fritidshem`                     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Grundsarskola`                  VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Gymnasieskola`                  VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Gymnasiesarskola`               VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommunalvuxenutbildning`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Svenskaforinvandrare`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Sarskolaforvuxna`               VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Specialskola`                   VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Centralinsamlingsenhetelever`   VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Centralinsamlingsenhetpersonal` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `temp_flag`                      TINYINT(1)                                                    DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_school_codes`
--

DROP TABLE IF EXISTS `temp_scb_school_codes`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_school_codes`
(
    `Skolkod`   VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Namn`      VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `temp_flag` TINYINT(1)                                                    DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod10`
--

DROP TABLE IF EXISTS `temp_scb_skolkod10`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod10`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod2`
--

DROP TABLE IF EXISTS `temp_scb_skolkod2`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod2`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Komnamn`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod3`
--

DROP TABLE IF EXISTS `temp_scb_skolkod3`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod3`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod4`
--

DROP TABLE IF EXISTS `temp_scb_skolkod4`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod4`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod5`
--

DROP TABLE IF EXISTS `temp_scb_skolkod5`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod5`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod6`
--

DROP TABLE IF EXISTS `temp_scb_skolkod6`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod6`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod7`
--

DROP TABLE IF EXISTS `temp_scb_skolkod7`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod7`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod8`
--

DROP TABLE IF EXISTS `temp_scb_skolkod8`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod8`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_scb_skolkod9`
--

DROP TABLE IF EXISTS `temp_scb_skolkod9`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_scb_skolkod9`
(
    `Skolenhetskod` VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolkod`       VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Skolenhet`     VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kod`           VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `Kommun`        VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `a`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `b`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `c`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `d`             VARCHAR(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_table3`
--

DROP TABLE IF EXISTS `temp_table3`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_table3`
(
    `user_id`      BIGINT                                                        DEFAULT NULL,
    `user_name`    VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `ext_id2`      VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `first_name`   VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `last_name`    VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `phone1`       VARCHAR(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `tmp_password` VARCHAR(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `school_id`    BIGINT                                                        DEFAULT NULL,
    `email`        VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `user_type`    BIGINT                                                        DEFAULT NULL,
    `inserted`     TINYINT(1)                                                    DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_table5`
--

DROP TABLE IF EXISTS `temp_table5`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_table5`
(
    `user_id`      BIGINT                                                        DEFAULT NULL,
    `user_name`    VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `ext_id2`      VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `first_name`   VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `last_name`    VARCHAR(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `phone1`       VARCHAR(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `tmp_password` VARCHAR(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci  DEFAULT NULL,
    `school_id`    BIGINT                                                        DEFAULT NULL,
    `email`        VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL,
    `user_type`    BIGINT                                                        DEFAULT NULL,
    `inserted`     TINYINT(1)                                                    DEFAULT NULL,
    `import_batch` VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template`
(
    `template_id` INT                                                   NOT NULL AUTO_INCREMENT,
    `html`        TEXT CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL,
    PRIMARY KEY (`template_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tmp_subject`
--

DROP TABLE IF EXISTS `tmp_subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_subject`
(
    `code`    VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL,
    `subject` VARCHAR(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_swedish_ci NOT NULL,
    PRIMARY KEY (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb3
  COLLATE = utf8mb3_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unpublished_ou_apps`
--

DROP TABLE IF EXISTS `unpublished_ou_apps`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unpublished_ou_apps`
(
    `app_id` BIGINT NOT NULL,
    `ou_id`  BIGINT NOT NULL,
    PRIMARY KEY (`app_id`, `ou_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci COMMENT ='This table lists, for all ous, which unpublished apps should still be available based on licenses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unsafe_session`
--

DROP TABLE IF EXISTS `unsafe_session`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unsafe_session`
(
    `session_id`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `user_id`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `first_name`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `last_name`      VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `school_name`    VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `class_name`     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `avatarUrl`      VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `module_list`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `app_url`        VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `created`        DATETIME                                                         NOT NULL,
    `last_active`    DATETIME                                                         NOT NULL,
    `app_version_id` BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`session_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user`
(
    `user_id`                          BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `user_type`                        BIGINT                                                                    DEFAULT NULL COMMENT 'pupil, teacher, principal, skolon_admin, developer',
    `user_name`                        VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `avatar_id`                        BIGINT                                                                    DEFAULT NULL,
    `first_name`                       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `last_name`                        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `email`                            VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `developer_id`                     BIGINT                                                                    DEFAULT NULL,
    `school_id`                        BIGINT                                                                    DEFAULT NULL,
    `main_class_id`                    BIGINT                                                                    DEFAULT NULL,
    `tmp_password`                     VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `password`                         VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `address`                          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL COMMENT '\n',
    `zipcode`                          VARCHAR(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `city`                             VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `phone1`                           VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `phone2`                           VARCHAR(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `birth_date`                       DATE                                                                      DEFAULT NULL,
    `ssn`                              VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `ssn_country_code`                 VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `deleted`                          DATETIME                                                                  DEFAULT NULL,
    `school_admin`                     TINYINT(1)                                                                DEFAULT '0',
    `public_id`                        VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `creation_time`                    DATETIME                                                                  DEFAULT NULL,
    `update_time`                      DATETIME                                                                  DEFAULT NULL,
    `approved_agreement_old`           DATETIME                                                                  DEFAULT NULL COMMENT 'Before GDPR agreements',
    `organization_id`                  BIGINT                                                                    DEFAULT NULL,
    `ext_id`                           VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `ext_source`                       VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `import_batch`                     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `grade`                            VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL COMMENT 'F = förskola, 1-10 = grundskola, 11-14 gymnasium, V = vuxenutb',
    `is_school_event_publisher`        TINYINT(1)                                                                DEFAULT '0',
    `nl_open_app_id`                   BIGINT                                                                    DEFAULT NULL COMMENT 'new login open app',
    `theme_color`                      VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT '39B0BB',
    `idp_id`                           BIGINT                                                                    DEFAULT NULL COMMENT '-1 = User authenticates with Skolon\nnull = User authenticates with OU´s IdP\nOther = User authenticates with corresponding IdP',
    `is_organization_admin`            TINYINT                                                                   DEFAULT NULL,
    `ou_organization_id`               BIGINT                                                                    DEFAULT NULL,
    `recieve_notification_mail`        TINYINT                                                                   DEFAULT '1',
    `notify_user_posts`                TINYINT                                                                   DEFAULT '1',
    `notify_app_posts`                 TINYINT                                                                   DEFAULT '1',
    `is_super_user`                    TINYINT(1)                                                                DEFAULT '0',
    `idp_identifier`                   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL COMMENT 'optional identifier used to match user when authenticating with custom IDP',
    `previous_app_id`                  BIGINT                                                                    DEFAULT NULL,
    `current_app_id`                   BIGINT                                                                    DEFAULT NULL,
    `last_active`                      DATETIME                                                                  DEFAULT NULL,
    `default_language_id`              VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL DEFAULT 'sv',
    `open_app_in_tab`                  TINYINT(1)                                                                DEFAULT '0',
    `is_super_admin`                   TINYINT(1)                                                                DEFAULT '0',
    `is_budget_admin`                  TINYINT(1)                                                       NOT NULL DEFAULT '0',
    `active`                           TINYINT(1)                                                       NOT NULL DEFAULT '0',
    `settings_enabled`                 TINYINT(1)                                                                DEFAULT NULL,
    `reset_password_enabled`           TINYINT(1)                                                                DEFAULT NULL,
    `seen_intro`                       TINYINT(1)                                                                DEFAULT '0',
    `approved_agreement`               DATETIME                                                                  DEFAULT NULL,
    `full_name`                        VARCHAR(91) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `previous_app_time`                DATETIME                                                                  DEFAULT NULL,
    `admin_scopes`                     VARCHAR(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `allow_license_notification_mails` TINYINT                                                                   DEFAULT '1',
    `allow_profile_notification_mails` TINYINT                                                                   DEFAULT '1',
    `allow_sync_notification_mails`    TINYINT                                                                   DEFAULT '1',
    `allow_weekly_notification_mails`  TINYINT                                                                   DEFAULT '1',
    `developer_scopes`                 VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `uuid`                             CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci              DEFAULT NULL,
    `admin_country_access`             VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    `data_region_id`                   BIGINT                                                                    DEFAULT NULL,
    `data_purged`                      TINYINT                                                          NOT NULL DEFAULT '0',
    `pseudo_user_name`                 VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    `pseudo_first_name`                VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `pseudo_last_name`                 VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `pseudo_full_name`                 VARCHAR(91) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci           DEFAULT NULL,
    `pseudo_birth_date`                DATE                                                                      DEFAULT NULL,
    `pseudo_email`                     VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci          DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `user_name_idx` (`user_name`),
    UNIQUE KEY `public_id_UNIQUE` (`public_id`),
    UNIQUE KEY `index10` (`ext_id`, `ext_source`),
    UNIQUE KEY `user_uuid_idx` (`uuid`) USING BTREE,
    KEY `fk_user_developer1_idx` (`developer_id`),
    KEY `fk_user_user_type1_idx` (`user_type`),
    KEY `full_name_idx` (`first_name`, `last_name`),
    KEY `fk_user_ou1_idx` (`school_id`),
    KEY `full_name_user_idt_idx` (`user_id`, `first_name`, `last_name`),
    KEY `active_idx` (`active`),
    KEY `full_name` (`full_name`),
    KEY `data_region_id` (`data_region_id`),
    KEY `ssn_country_code` (`ssn_country_code`),
    KEY `deleted_uuid_idx` (`deleted`, `uuid`) USING BTREE,
    CONSTRAINT `fk_user_developer1` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`developer_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_user_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_user_type1` FOREIGN KEY (`user_type`) REFERENCES `user_type` (`user_type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `user_ibfk_1` FOREIGN KEY (`data_region_id`) REFERENCES `data_region` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT `user_ibfk_2` FOREIGN KEY (`ssn_country_code`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 225220
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER DATABASE `skolon` CHARACTER SET latin1 COLLATE latin1_swedish_ci;
/*!50003 SET @saved_cs_client = @@character_set_client */;
/*!50003 SET @saved_cs_results = @@character_set_results */;
/*!50003 SET @saved_col_connection = @@collation_connection */;
/*!50003 SET character_set_client = utf8mb3 */;
/*!50003 SET character_set_results = utf8mb3 */;
/*!50003 SET collation_connection = utf8mb3_general_ci */;
/*!50003 SET @saved_sql_mode = @@sql_mode */;
/*!50003 SET sql_mode =
        'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */;
DELIMITER ;;
/*!50003 CREATE */ /*!50017 DEFINER =`root`@`localhost`*/ /*!50003 TRIGGER `user_before_insert`
    BEFORE INSERT
    ON `user`
    FOR EACH ROW
BEGIN
    SET new.uuid = UUID();
    SET new.full_name = CONCAT_WS(' ', new.first_name, new.last_name);
END */;;
DELIMITER ;
/*!50003 SET sql_mode = @saved_sql_mode */;
/*!50003 SET character_set_client = @saved_cs_client */;
/*!50003 SET character_set_results = @saved_cs_results */;
/*!50003 SET collation_connection = @saved_col_connection */;
ALTER DATABASE `skolon` CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci;

--
-- Table structure for table `user_app_folder`
--

DROP TABLE IF EXISTS `user_app_folder`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_folder`
(
    `id`                            BIGINT   NOT NULL AUTO_INCREMENT,
    `user_id`                       BIGINT   NOT NULL,
    `index`                         INT      NOT NULL                                                DEFAULT '0',
    `name`                          VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `creation_time`                 DATETIME NOT NULL,
    `school_id`                     BIGINT   NOT NULL,
    `original_id`                   BIGINT                                                           DEFAULT NULL,
    `collection_template_folder_id` INT UNSIGNED                                                     DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `school_id` (`school_id`),
    KEY `user_app_folder_collection_template_folder_id_index` (`collection_template_folder_id`),
    KEY `user_id_idx` (`user_id`) USING BTREE,
    CONSTRAINT `user_app_folder_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 1144
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_interest`
--

DROP TABLE IF EXISTS `user_app_interest`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_interest`
(
    `id`             BIGINT NOT NULL AUTO_INCREMENT,
    `user_id`        BIGINT NOT NULL,
    `app_id`         BIGINT NOT NULL,
    `app_version_id` BIGINT   DEFAULT NULL,
    `request_time`   DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_user_app_interest_user1_idx` (`user_id`),
    KEY `fk_user_app_interest_app1_idx` (`app_id`),
    KEY `fk_user_app_interest_app_version1_idx` (`app_version_id`),
    CONSTRAINT `fk_user_app_interest_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_app_interest_app_version1` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_app_interest_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 314
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_scope`
--

DROP TABLE IF EXISTS `user_app_scope`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_scope`
(
    `user_scope_id` BIGINT NOT NULL,
    `app_id`        BIGINT NOT NULL,
    PRIMARY KEY (`user_scope_id`, `app_id`),
    KEY `fk_application_app_scope_app1_idx` (`app_id`),
    CONSTRAINT `fk_application_app_scope_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_application_app_scope_application_scope1` FOREIGN KEY (`user_scope_id`) REFERENCES `user_scope` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_setting`
--

DROP TABLE IF EXISTS `user_app_setting`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_setting`
(
    `user_id`          BIGINT NOT NULL,
    `app_id`           BIGINT NOT NULL,
    `last_usage`       DATETIME DEFAULT NULL,
    `can_post_to_feed` TINYINT  DEFAULT NULL,
    `added`            DATETIME DEFAULT NULL,
    PRIMARY KEY (`user_id`, `app_id`),
    KEY `fk_user_has_app_user1_idx` (`user_id`),
    KEY `fk_user_app_setting_app1_idx` (`app_id`),
    CONSTRAINT `fk_user_app_setting_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_app_setting_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_task`
--

DROP TABLE IF EXISTS `user_app_task`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_task`
(
    `user_id`       BIGINT                                                            DEFAULT NULL,
    `app_id`        BIGINT                                                            DEFAULT NULL,
    `task`          VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `creation_time` DATETIME                                                          DEFAULT NULL,
    `id`            BIGINT NOT NULL AUTO_INCREMENT,
    `header`        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   DEFAULT NULL,
    `seen`          TINYINT                                                           DEFAULT '0',
    `update_time`   DATETIME                                                          DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_time`
--

DROP TABLE IF EXISTS `user_app_time`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_time`
(
    `user_id`         BIGINT NOT NULL,
    `app_id`          BIGINT NOT NULL,
    `registered_date` DATE   NOT NULL,
    `registered_time` INT DEFAULT NULL,
    PRIMARY KEY (`user_id`, `app_id`, `registered_date`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_time_activity`
--

DROP TABLE IF EXISTS `user_app_time_activity`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_time_activity`
(
    `id`              BIGINT   NOT NULL AUTO_INCREMENT,
    `user_id`         BIGINT   NOT NULL,
    `app_id`          BIGINT   NOT NULL,
    `registered_time` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    KEY `user_app_registered_time_idx` (`user_id`, `app_id`, `registered_time`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 377346
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_app_version`
--

DROP TABLE IF EXISTS `user_app_version`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_app_version`
(
    `user_id`            BIGINT     NOT NULL,
    `app_version_id`     BIGINT              DEFAULT NULL,
    `app_id`             BIGINT              DEFAULT NULL,
    `added`              DATETIME            DEFAULT NULL,
    `last_usage`         DATETIME            DEFAULT NULL,
    `index`              INT                 DEFAULT NULL,
    `removable`          TINYINT(1) NOT NULL DEFAULT '1',
    `added_by`           BIGINT              DEFAULT NULL,
    `seen`               TINYINT(1)          DEFAULT NULL,
    `user_app_folder_id` BIGINT              DEFAULT NULL,
    `integration_id`     BIGINT              DEFAULT NULL,
    `id`                 BIGINT     NOT NULL AUTO_INCREMENT,
    `deleted`            DATETIME            DEFAULT NULL,
    `school_id`          BIGINT     NOT NULL,
    `expired`            DATETIME            DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_user_app_version_app_version1_idx` (`app_version_id`),
    KEY `fk_user_app_version_app1_idx` (`app_id`),
    KEY `fk_user_app_version_user_app1_idx` (`user_id`, `app_id`),
    KEY `fk_user_app_version_user1_idx` (`user_id`),
    KEY `fk_user_app_version_user_app_folder1_idx` (`user_app_folder_id`),
    KEY `integration_idx` (`user_id`, `integration_id`) USING BTREE,
    KEY `app_version_idx` (`user_id`, `app_version_id`) USING BTREE,
    KEY `school_id` (`school_id`) USING BTREE,
    KEY `user_app_version_school_id_app_id_added_deleted_idx` (`school_id`, `app_id`, `added`, `deleted`) USING BTREE,
    KEY `user_app_version_app_id_added_deleted_school_id_user_id_idx` (`app_id`, `added`, `deleted`, `school_id`, `user_id`) USING BTREE,
    KEY `user_app_version_added_deleted_user_id_idx` (`added`, `deleted`, `user_id`) USING BTREE,
    CONSTRAINT `app_id_fk` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT `fk_user_app_version_app_version1` FOREIGN KEY (`app_version_id`) REFERENCES `app_version` (`app_version_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_app_version_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_app_version_user_app_folder1` FOREIGN KEY (`user_app_folder_id`) REFERENCES `user_app_folder` (`id`) ON DELETE SET NULL,
    CONSTRAINT `user_app_version_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 256581
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_customer_number`
--

DROP TABLE IF EXISTS `user_customer_number`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_customer_number`
(
    `id`              BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `user_id`         BIGINT                                                           NOT NULL,
    `customer_number` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `deleted`         DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `customer_number` (`customer_number`),
    KEY `user_id` (`user_id`),
    CONSTRAINT `user_customer_number_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_first_login`
--

DROP TABLE IF EXISTS `user_first_login`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_first_login`
(
    `user_id`    BIGINT    NOT NULL,
    `login_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`),
    CONSTRAINT `user_first_login_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_membership`
(
    `group_id`           BIGINT NOT NULL,
    `user_id`            BIGINT NOT NULL,
    `joined`             DATETIME                                                         DEFAULT NULL,
    `left`               DATETIME                                                         DEFAULT NULL,
    `main_teacher`       TINYINT                                                          DEFAULT NULL,
    `ext_source`         VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `import_batch`       VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `is_event_publisher` TINYINT                                                          DEFAULT '0',
    `uuid`               CHAR(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci     DEFAULT NULL,
    `school_type_id`     BIGINT                                                           DEFAULT NULL,
    `school_year`        TINYINT                                                          DEFAULT NULL,
    PRIMARY KEY (`group_id`, `user_id`),
    UNIQUE KEY `uuid` (`uuid`),
    KEY `fk_user_group_user1_idx` (`user_id`),
    KEY `school_type_id` (`school_type_id`),
    CONSTRAINT `fk_user_group_membership_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_group_membership_user_group1` FOREIGN KEY (`group_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `user_group_membership_ibfk_1` FOREIGN KEY (`school_type_id`) REFERENCES `school_type` (`school_type_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
ALTER DATABASE `skolon` CHARACTER SET latin1 COLLATE latin1_swedish_ci;
/*!50003 SET @saved_cs_client = @@character_set_client */;
/*!50003 SET @saved_cs_results = @@character_set_results */;
/*!50003 SET @saved_col_connection = @@collation_connection */;
/*!50003 SET character_set_client = utf8mb3 */;
/*!50003 SET character_set_results = utf8mb3 */;
/*!50003 SET collation_connection = utf8mb3_general_ci */;
/*!50003 SET @saved_sql_mode = @@sql_mode */;
/*!50003 SET sql_mode =
        'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */;
DELIMITER ;;
/*!50003 CREATE */ /*!50017 DEFINER =`root`@`localhost`*/ /*!50003 TRIGGER `user_group_membership_before_insert`
    BEFORE INSERT
    ON `user_group_membership`
    FOR EACH ROW
BEGIN
    SET new.uuid = UUID();
END */;;
DELIMITER ;
/*!50003 SET sql_mode = @saved_sql_mode */;
/*!50003 SET character_set_client = @saved_cs_client */;
/*!50003 SET character_set_results = @saved_cs_results */;
/*!50003 SET collation_connection = @saved_col_connection */;
ALTER DATABASE `skolon` CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci;
/*!50003 SET @saved_cs_client = @@character_set_client */;
/*!50003 SET @saved_cs_results = @@character_set_results */;
/*!50003 SET @saved_col_connection = @@collation_connection */;
/*!50003 SET character_set_client = utf8mb4 */;
/*!50003 SET character_set_results = utf8mb4 */;
/*!50003 SET collation_connection = utf8mb4_0900_ai_ci */;
/*!50003 SET @saved_sql_mode = @@sql_mode */;
/*!50003 SET sql_mode =
        'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */;
DELIMITER ;;
/*!50003 CREATE */ /*!50017 DEFINER =`root`@`%`*/ /*!50003 TRIGGER `user_group_membership_insert`
    AFTER INSERT
    ON `user_group_membership`
    FOR EACH ROW
BEGIN
    UPDATE ou SET update_time = NOW() WHERE ou.id = new.group_id LIMIT 1;
END */;;
DELIMITER ;
/*!50003 SET sql_mode = @saved_sql_mode */;
/*!50003 SET character_set_client = @saved_cs_client */;
/*!50003 SET character_set_results = @saved_cs_results */;
/*!50003 SET collation_connection = @saved_col_connection */;

--
-- Table structure for table `user_group_update`
--

DROP TABLE IF EXISTS `user_group_update`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_group_update`
(
    `group_update_id`  BIGINT     NOT NULL AUTO_INCREMENT,
    `group_id`         BIGINT                                                           DEFAULT NULL,
    `school_update_id` BIGINT                                                           DEFAULT NULL,
    `photo_group_id`   VARCHAR(38) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  DEFAULT NULL,
    `name`             VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `gs_image_name`    VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `is_clean_image`   TINYINT(1) NOT NULL                                              DEFAULT '0',
    `year`             YEAR                                                             DEFAULT NULL,
    `term`             CHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      DEFAULT NULL,
    `sync_time`        DATETIME                                                         DEFAULT NULL,
    `merge_completed`  DATETIME                                                         DEFAULT NULL,
    PRIMARY KEY (`group_update_id`),
    KEY `fk_user_group_update_user_group1_idx` (`group_id`),
    KEY `fk_user_group_update_school_update1_idx` (`school_update_id`),
    CONSTRAINT `fk_user_group_update_school_update1` FOREIGN KEY (`school_update_id`) REFERENCES `school_update` (`school_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_group_update_user_group1` FOREIGN KEY (`group_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2495
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_has_age_group`
--

DROP TABLE IF EXISTS `user_has_age_group`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_age_group`
(
    `user_id`      BIGINT NOT NULL,
    `age_group_id` BIGINT NOT NULL,
    PRIMARY KEY (`user_id`, `age_group_id`),
    KEY `fk_user_has_age_group_age_group1_idx` (`age_group_id`),
    CONSTRAINT `fk_user_has_age_group_age_group1` FOREIGN KEY (`age_group_id`) REFERENCES `age_group` (`age_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_has_age_group_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_has_subject`
--

DROP TABLE IF EXISTS `user_has_subject`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_subject`
(
    `user_id`    BIGINT NOT NULL,
    `subject_id` BIGINT NOT NULL,
    PRIMARY KEY (`user_id`, `subject_id`),
    KEY `fk_user_has_subject_subject1_idx` (`subject_id`),
    CONSTRAINT `fk_user_has_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_has_subject_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_history`
--

DROP TABLE IF EXISTS `user_history`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_history`
(
    `user_history_id` BIGINT NOT NULL AUTO_INCREMENT,
    `timestamp`       DATETIME                                                        DEFAULT NULL,
    `user_id`         BIGINT NOT NULL,
    `user_type`       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `user_name`       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `first_name`      VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `last_name`       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `email`           VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `developer_id`    VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_id`       VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `password`        VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `salt`            VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`user_history_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_last_active`
--

DROP TABLE IF EXISTS `user_last_active`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_last_active`
(
    `user_id`     BIGINT NOT NULL,
    `last_active` DATETIME DEFAULT NULL,
    PRIMARY KEY (`user_id`),
    CONSTRAINT `user_last_active_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_module`
--

DROP TABLE IF EXISTS `user_module`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_module`
(
    `user_id`   BIGINT NOT NULL,
    `module_id` BIGINT NOT NULL,
    PRIMARY KEY (`module_id`, `user_id`),
    KEY `fk_user_module_user1_idx` (`user_id`),
    CONSTRAINT `fk_user_module_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_module_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_school_access`
--

DROP TABLE IF EXISTS `user_school_access`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_school_access`
(
    `user_id`   BIGINT NOT NULL,
    `school_id` BIGINT NOT NULL,
    PRIMARY KEY (`user_id`, `school_id`),
    KEY `fk_user_school_access_ou1_idx` (`school_id`),
    CONSTRAINT `fk_user_school_access_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_user_school_access_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_scope`
--

DROP TABLE IF EXISTS `user_scope`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_scope`
(
    `id`                   BIGINT                                                            NOT NULL AUTO_INCREMENT,
    `application_id`       BIGINT                                                            NOT NULL,
    `user_id`              BIGINT                                                            NOT NULL,
    `scopes`               VARCHAR(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL DEFAULT '',
    `scope_user_name`      BIT(1)                                                            NOT NULL DEFAULT b'0',
    `scope_profile`        BIT(1)                                                            NOT NULL DEFAULT b'0',
    `scope_app_collection` BIT(1)                                                            NOT NULL DEFAULT b'0',
    `scope_add_app`        BIT(1)                                                            NOT NULL DEFAULT b'0',
    `scope_email`          BIT(1)                                                            NOT NULL DEFAULT b'0',
    `scope_groups`         BIT(1)                                                            NOT NULL DEFAULT b'0',
    `update_time`          DATETIME                                                                   DEFAULT NULL,
    `creation_time`        DATETIME                                                                   DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_app` (`application_id`, `user_id`),
    KEY `fk_external_user_access_application_access1_idx` (`application_id`),
    KEY `fk_external_user_access_user1` (`user_id`),
    CONSTRAINT `fk_external_user_access_application_access1` FOREIGN KEY (`application_id`) REFERENCES `application_access` (`application_id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_external_user_access_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  AUTO_INCREMENT = 22230
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_site_tip`
--

DROP TABLE IF EXISTS `user_site_tip`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_site_tip`
(
    `user_id`     BIGINT  NOT NULL,
    `site_tip_id` INT     NOT NULL,
    `seen`        TINYINT NOT NULL DEFAULT '0',
    PRIMARY KEY (`user_id`, `site_tip_id`),
    KEY `fk_seen_site_tip_site_tip1_idx` (`site_tip_id`),
    CONSTRAINT `fk_seen_site_tip_site_tip1` FOREIGN KEY (`site_tip_id`) REFERENCES `site_tip` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `fk_site_tips_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type`
(
    `user_type_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '1 = student\n2 = teacher\n3 = school admin?\n4 = skolon admin\n5 = developer',
    `name`         VARCHAR(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`user_type_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vat_rate`
--

DROP TABLE IF EXISTS `vat_rate`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vat_rate`
(
    `id`           BIGINT                                                         NOT NULL AUTO_INCREMENT,
    `country_code` VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `rate_percent` DECIMAL(13, 4)                                                 NOT NULL,
    `is_default`   TINYINT                                                        NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`),
    UNIQUE KEY `country_code` (`country_code`, `rate_percent`),
    CONSTRAINT `vat_rate_ibfk_1` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 45
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visible_school_app`
--

DROP TABLE IF EXISTS `visible_school_app`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visible_school_app`
(
    `school_id`           BIGINT     NOT NULL,
    `app_id`              BIGINT     NOT NULL,
    `active`              TINYINT(1) NOT NULL DEFAULT '1',
    `id`                  BIGINT     NOT NULL AUTO_INCREMENT,
    `disabled_by_user_id` BIGINT              DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `school_id` (`school_id`, `app_id`),
    KEY `fk_visible_school_app_ou1_idx` (`school_id`),
    KEY `fk_visible_school_app_app1_idx` (`app_id`),
    KEY `disabled_by_user_id` (`disabled_by_user_id`),
    CONSTRAINT `fk_visible_school_app_app1` FOREIGN KEY (`app_id`) REFERENCES `app` (`app_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_visible_school_app_ou1` FOREIGN KEY (`school_id`) REFERENCES `ou` (`id`),
    CONSTRAINT `visible_school_app_ibfk_1` FOREIGN KEY (`disabled_by_user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 687
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visma_company`
--

DROP TABLE IF EXISTS `visma_company`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visma_company`
(
    `id`             BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`           VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `ipp_company_id` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `ipp_company_id` (`ipp_company_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `visma_company_default_country`
--

DROP TABLE IF EXISTS `visma_company_default_country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visma_company_default_country`
(
    `visma_company_id` BIGINT                                                         NOT NULL,
    `country_code`     VARCHAR(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    UNIQUE KEY `visma_company_id` (`visma_company_id`, `country_code`),
    KEY `country_code` (`country_code`),
    CONSTRAINT `visma_company_default_country_ibfk_1` FOREIGN KEY (`visma_company_id`) REFERENCES `visma_company` (`id`),
    CONSTRAINT `visma_company_default_country_ibfk_2` FOREIGN KEY (`country_code`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whitelabel_config`
--

DROP TABLE IF EXISTS `whitelabel_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whitelabel_config`
(
    `id`                   BIGINT                                                      NOT NULL AUTO_INCREMENT,
    `logo_id`              BIGINT                                                      NOT NULL,
    `support_url`          VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `feedback_url`         VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `user_agreement_url`   VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `school_contracts_url` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `logout_url`           VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    `brand_color`          CHAR(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `favicon_id`           BIGINT                                                           DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `logo_id` (`logo_id`),
    KEY `favicon_id` (`favicon_id`),
    CONSTRAINT `whitelabel_config_ibfk_1` FOREIGN KEY (`logo_id`) REFERENCES `file` (`file_id`),
    CONSTRAINT `whitelabel_config_ibfk_2` FOREIGN KEY (`favicon_id`) REFERENCES `file` (`file_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `whitelabel_login`
--

DROP TABLE IF EXISTS `whitelabel_login`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `whitelabel_login`
(
    `id`                  BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `brand_color`         CHAR(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci      NOT NULL,
    `logo_id`             BIGINT                                                           NOT NULL,
    `background_image_id` BIGINT                                                           NOT NULL,
    `slug`                VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `favicon_id`          BIGINT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `slug` (`slug`),
    KEY `logo_id` (`logo_id`),
    KEY `background_image_id` (`background_image_id`),
    KEY `favicon_id` (`favicon_id`),
    CONSTRAINT `whitelabel_login_ibfk_1` FOREIGN KEY (`logo_id`) REFERENCES `file` (`file_id`),
    CONSTRAINT `whitelabel_login_ibfk_2` FOREIGN KEY (`background_image_id`) REFERENCES `file` (`file_id`),
    CONSTRAINT `whitelabel_login_ibfk_3` FOREIGN KEY (`favicon_id`) REFERENCES `file` (`file_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget`
(
    `id`                         BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `url`                        VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `application_access_id`      BIGINT                                                           NOT NULL,
    `deleted`                    DATETIME                                                       DEFAULT NULL,
    `icon_file_id`               BIGINT                                                         DEFAULT NULL,
    `default_widget_language_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `application_access_id` (`application_access_id`),
    KEY `icon_file_id` (`icon_file_id`),
    KEY `default_widget_language_id` (`default_widget_language_id`),
    CONSTRAINT `widget_ibfk_1` FOREIGN KEY (`application_access_id`) REFERENCES `application_access` (`application_id`),
    CONSTRAINT `widget_ibfk_2` FOREIGN KEY (`icon_file_id`) REFERENCES `file` (`file_id`),
    CONSTRAINT `widget_ibfk_3` FOREIGN KEY (`default_widget_language_id`) REFERENCES `language` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_assignment`
--

DROP TABLE IF EXISTS `widget_assignment`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_assignment`
(
    `widget_size_id` BIGINT NOT NULL,
    `ou_id`          BIGINT NOT NULL,
    `creation_time`  DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`widget_size_id`, `ou_id`),
    CONSTRAINT `widget_assignment_ibfk_1` FOREIGN KEY (`widget_size_id`) REFERENCES `widget_size` (`id`) ON DELETE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_config`
--

DROP TABLE IF EXISTS `widget_config`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_config`
(
    `id`        BIGINT NOT NULL AUTO_INCREMENT,
    `user_id`   BIGINT NOT NULL,
    `widget_id` BIGINT NOT NULL,
    `settings`  MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    PRIMARY KEY (`id`),
    UNIQUE KEY `user_id` (`user_id`, `widget_id`),
    KEY `widget_id` (`widget_id`),
    CONSTRAINT `widget_config_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
    CONSTRAINT `widget_config_ibfk_2` FOREIGN KEY (`widget_id`) REFERENCES `widget` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_country`
--

DROP TABLE IF EXISTS `widget_country`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_country`
(
    `widget_id`  BIGINT                                   DEFAULT NULL,
    `country_id` VARCHAR(2) COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    UNIQUE KEY `widget_id` (`widget_id`, `country_id`),
    KEY `country_id` (`country_id`),
    CONSTRAINT `widget_country_ibfk_1` FOREIGN KEY (`widget_id`) REFERENCES `widget` (`id`),
    CONSTRAINT `widget_country_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`code`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_lang`
--

DROP TABLE IF EXISTS `widget_lang`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_lang`
(
    `id`          BIGINT                                                           NOT NULL AUTO_INCREMENT,
    `name`        VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `description` MEDIUMTEXT CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci,
    `widget_id`   BIGINT                                                         DEFAULT NULL,
    `language_id` VARCHAR(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `widget_id` (`widget_id`, `language_id`),
    KEY `language_id` (`language_id`),
    CONSTRAINT `widget_lang_ibfk_1` FOREIGN KEY (`widget_id`) REFERENCES `widget` (`id`),
    CONSTRAINT `widget_lang_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`code`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widget_size`
--

DROP TABLE IF EXISTS `widget_size`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget_size`
(
    `id`              BIGINT  NOT NULL AUTO_INCREMENT,
    `widget_id`       BIGINT  NOT NULL,
    `width`           TINYINT NOT NULL,
    `height`          TINYINT NOT NULL,
    `preview_file_id` BIGINT DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `widget_id` (`widget_id`, `width`, `height`),
    KEY `preview_file_id` (`preview_file_id`),
    CONSTRAINT `widget_size_ibfk_1` FOREIGN KEY (`widget_id`) REFERENCES `widget` (`id`),
    CONSTRAINT `widget_size_ibfk_2` FOREIGN KEY (`preview_file_id`) REFERENCES `file` (`file_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 31
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE = @old_time_zone */;

/*!40101 SET SQL_MODE = @old_sql_mode */;
/*!40014 SET FOREIGN_KEY_CHECKS = @old_foreign_key_checks */;
/*!40014 SET UNIQUE_CHECKS = @old_unique_checks */;
/*!40101 SET CHARACTER_SET_CLIENT = @old_character_set_client */;
/*!40101 SET CHARACTER_SET_RESULTS = @old_character_set_results */;
/*!40101 SET COLLATION_CONNECTION = @old_collation_connection */;
/*!40111 SET SQL_NOTES = @old_sql_notes */;

-- Dump completed on 2023-09-27  9:17:48


/*!40101 SET @old_character_set_client = @@character_set_client */;
/*!40101 SET @old_character_set_results = @@character_set_results */;
/*!40101 SET @old_collation_connection = @@collation_connection */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @old_time_zone = @@time_zone */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @old_unique_checks = @@unique_checks, UNIQUE_CHECKS = 0 */;
/*!40014 SET @old_foreign_key_checks = @@foreign_key_checks, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @old_sql_mode = @@sql_mode, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @old_sql_notes = @@sql_notes, SQL_NOTES = 0 */;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history`
(
    `installed_rank` INT                                                               NOT NULL,
    `version`        VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci            DEFAULT NULL,
    `description`    VARCHAR(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `type`           VARCHAR(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci   NOT NULL,
    `script`         VARCHAR(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci NOT NULL,
    `checksum`       INT                                                                        DEFAULT NULL,
    `installed_by`   VARCHAR(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_sv_0900_ai_ci  NOT NULL,
    `installed_on`   TIMESTAMP                                                         NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `execution_time` INT                                                               NOT NULL,
    `success`        TINYINT(1)                                                        NOT NULL,
    PRIMARY KEY (`installed_rank`),
    KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_sv_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history`
    DISABLE KEYS */;
INSERT INTO `flyway_schema_history`
VALUES (1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2019-07-08 08:28:02', 0,
        1),
       (2, '5.3.0.1', 'App authors', 'SQL', 'V5.3.0.1__App_authors.sql', 777146205, 'root', '2019-07-08 08:28:15', 21,
        1),
       (3, '5.3.0.2', 'Add user customer number', 'SQL', 'V5.3.0.2__Add_user_customer_number.sql', -518416422, 'root',
        '2019-07-08 08:51:15', 15, 1),
       (4, '5.3.0.3', 'Add customer number to order', 'SQL', 'V5.3.0.3__Add_customer_number_to_order.sql', 590578,
        'root', '2019-07-11 12:50:21', 85, 1),
       (5, '5.3.0.4', 'New swedish categories', 'SQL', 'V5.3.0.4__New_swedish_categories.sql', -1432395402, 'root',
        '2019-08-06 07:36:15', 7, 1),
       (6, '5.3.0.5', 'Migrate main categories', 'SQL', 'V5.3.0.5__Migrate_main_categories.sql', -696606211, 'root',
        '2019-08-06 12:39:13', 12, 1),
       (7, '5.3.0.6', 'Extend app country', 'SQL', 'V5.3.0.6__Extend_app_country.sql', -1113246825, 'root',
        '2019-08-06 14:46:48', 137, 1),
       (8, '5.3.0.7', 'Add app version compatibility', 'SQL', 'V5.3.0.7__Add_app_version_compatibility.sql', -561433288,
        'root', '2019-08-08 11:31:29', 37, 1),
       (9, '5.3.0.8', 'Add license group parent', 'SQL', 'V5.3.0.8__Add_license_group_parent.sql', 1989499094, 'root',
        '2019-08-19 13:59:06', 1046, 1),
       (10, '5.3.0.9', 'Revert swedish category names', 'SQL', 'V5.3.0.9__Revert_swedish_category_names.sql',
        -919662899, 'root', '2019-08-27 08:40:55', 10, 1),
       (11, '5.3.0.10', 'Add discount agreements', 'SQL', 'V5.3.0.10__Add_discount_agreements.sql', -437235989, 'root',
        '2019-08-27 09:19:05', 33, 1),
       (12, '5.3.0.11', 'Add discount to order item', 'SQL', 'V5.3.0.11__Add_discount_to_order_item.sql', 1808785884,
        'root', '2019-08-28 07:39:30', 158, 1),
       (13, '5.3.0.12', 'Add collection lock and user settings lock', 'SQL',
        'V5.3.0.12__Add_collection_lock_and_user_settings_lock.sql', -1436833133, 'root', '2019-08-28 08:28:58', 1675,
        1),
       (14, '5.3.0.13', 'Make app package ext id unique', 'SQL', 'V5.3.0.13__Make_app_package_ext_id_unique.sql',
        -890244022, 'root', '2019-08-30 07:49:13', 59, 1),
       (15, '5.3.0.14', 'Remove category extra swedish category', 'SQL',
        'V5.3.0.14__Remove_category_extra_swedish_category.sql', -1901837821, 'root', '2019-09-02 12:53:27', 3, 1),
       (16, '5.4.0.1', 'Fix distribution subscription prices', 'SQL',
        'V5.4.0.1__Fix_distribution_subscription_prices.sql', 93562425, 'root', '2019-09-04 09:09:27', 5, 1),
       (17, '5.4.0.2', 'Add original order item to license group', 'SQL',
        'V5.4.0.2__Add_original_order_item_to_license_group.sql', 299968380, 'root', '2019-09-04 09:09:29', 1558, 1),
       (18, '5.4.0.3', 'Add order fields to subscription', 'SQL', 'V5.4.0.3__Add_order_fields_to_subscription.sql',
        923812366, 'root', '2019-09-16 07:07:44', 134, 1),
       (19, '5.4.0.4', 'Rename buyer ref to customer ref', 'SQL', 'V5.4.0.4__Rename_buyer_ref_to_customer_ref.sql',
        -1796836984, 'root', '2019-09-16 07:07:44', 15, 1),
       (20, '5.4.0.5', 'Add subscription order type', 'SQL', 'V5.4.0.5__Add_subscription_order_type.sql', -359737207,
        'root', '2019-09-16 07:12:30', 131, 1),
       (21, '5.4.0.6', 'Migrate order data to subscription', 'SQL', 'V5.4.0.6__Migrate_order_data_to_subscription.sql',
        1003073755, 'root', '2019-09-16 08:03:11', 44, 1),
       (22, '5.4.0.7', 'Update subscription item foreign key', 'SQL',
        'V5.4.0.7__Update_subscription_item_foreign_key.sql', -1911532150, 'root', '2019-09-16 10:58:43', 30, 1),
       (23, '5.4.0.8', 'Add public id to subscription', 'SQL', 'V5.4.0.8__Add_public_id_to_subscription.sql',
        -173923303, 'root', '2019-09-17 12:50:42', 141, 1),
       (24, '5.5.0.1', 'Add article type', 'SQL', 'V5.5.0.1__Add_article_type.sql', -1145705825, 'root',
        '2019-09-23 06:59:52', 137, 1),
       (25, '5.5.0.2', 'Add user developer scopes', 'SQL', 'V5.5.0.2__Add_user_developer_scopes.sql', 526202575, 'root',
        '2019-10-02 13:58:40', 3796, 1),
       (26, '5.5.0.3', 'Give existing developers scopes', 'SQL', 'V5.5.0.3__Give_existing_developers_scopes.sql',
        -1178618526, 'root', '2019-10-02 14:08:14', 4, 1),
       (27, '5.5.0.4', 'Add discount codes', 'SQL', 'V5.5.0.4__Add_discount_codes.sql', 637459608, 'root',
        '2019-10-11 08:43:35', 15, 1),
       (28, '5.5.0.5', 'Add discount codes to orders', 'SQL', 'V5.5.0.5__Add_discount_codes_to_orders.sql', -307052631,
        'root', '2019-10-11 12:05:56', 20, 1),
       (29, '5.5.0.6', 'Add partner discount to order item', 'SQL', 'V5.5.0.6__Add_partner_discount_to_order_item.sql',
        -465042036, 'root', '2019-10-11 12:05:56', 176, 1),
       (30, '5.5.0.7', 'Add external partner for developers', 'SQL',
        'V5.5.0.7__Add_external_partner_for_developers.sql', 1726842876, 'root', '2019-10-16 07:33:59', 172, 1),
       (31, '5.5.0.8', 'Add external app', 'SQL', 'V5.5.0.8__Add_external_app.sql', -1493660780, 'root',
        '2019-10-16 10:00:43', 181, 1),
       (32, '5.5.0.9', 'Add external app subscription', 'SQL', 'V5.5.0.9__Add_external_app_subscription.sql', 126501084,
        'root', '2019-10-18 09:43:04', 34, 1),
       (33, '5.5.0.10', 'Add developer id to subscription', 'SQL', 'V5.5.0.10__Add_developer_id_to_subscription.sql',
        -1033815184, 'root', '2019-10-21 09:29:03', 17766, 1),
       (34, '5.5.0.11', 'Add app requires external activation', 'SQL',
        'V5.5.0.11__Add_app_requires_external_activation.sql', 1299797423, 'root', '2019-10-22 07:52:57', 247, 1),
       (35, '5.5.0.12', 'Add billable licenses', 'SQL', 'V5.5.0.12__Add_billable_licenses.sql', -970867951, 'root',
        '2019-10-28 13:26:17', 6072, 1),
       (36, '5.5.0.13', 'Add product price vat', 'SQL', 'V5.5.0.13__Add_product_price_vat.sql', 139725115, 'root',
        '2019-10-29 07:50:49', 143, 1),
       (37, '5.5.0.14', 'Move vat rate from product', 'SQL', 'V5.5.0.14__Move_vat_rate_from_product.sql', -1080151700,
        'root', '2019-10-29 07:53:03', 13, 1),
       (38, '5.5.0.15', 'Add new feature flags to organization', 'SQL',
        'V5.5.0.15__Add_new_feature_flags_to_organization.sql', -1351268426, 'root', '2019-10-29 12:16:06', 1423, 1),
       (39, '5.5.0.16', 'Add price upon request to product', 'SQL', 'V5.5.0.16__Add_price_upon_request_to_product.sql',
        -463298188, 'root', '2019-10-31 13:40:58', 120, 1),
       (40, '5.5.0.17', 'Add subscription vat rate', 'SQL', 'V5.5.0.17__Add_subscription_vat_rate.sql', 576276212,
        'root', '2019-11-01 13:00:21', 159, 1),
       (41, '5.5.0.18', 'Make product price nullable', 'SQL', 'V5.5.0.18__Make_product_price_nullable.sql', 923093561,
        'root', '2019-11-04 10:10:39', 121, 1),
       (42, '5.5.0.19', 'Add order assigned user and ou', 'SQL', 'V5.5.0.19__Add_order_assigned_user_and_ou.sql',
        1324130795, 'root', '2019-11-05 07:25:26', 45, 1),
       (43, '5.5.0.20', 'Move product public id to ext id', 'SQL', 'V5.5.0.20__Move_product_public_id_to_ext_id.sql',
        1001231105, 'root', '2019-11-07 09:46:33', 36, 1),
       (44, '5.5.0.22', 'Fix search apps produre to respect is listed', 'SQL',
        'V5.5.0.22__Fix_search_apps_produre_to_respect_is_listed.sql', 1343252814, 'root', '2019-11-07 12:37:02', 6, 1),
       (45, '5.5.0.23', 'Add order skip external activation', 'SQL',
        'V5.5.0.23__Add_order_skip_external_activation.sql', -661466627, 'root', '2019-11-11 08:10:20', 179, 1),
       (47, '5.5.0.24', 'Add parent id index to metadata', 'SQL', 'V5.5.0.24__Add_parent_id_index_to_metadata.sql',
        -307419009, 'root', '2019-11-13 08:58:41', 25, 1),
       (48, '5.6.0.1', 'Add developer created articles', 'SQL', 'V5.6.0.1__Add_developer_created_articles.sql',
        1813821740, 'root', '2019-11-14 11:45:42', 27, 1),
       (49, '5.6.0.2', 'Add created by user to article', 'SQL', 'V5.6.0.2__Add_created_by_user_to_article.sql',
        235605513, 'root', '2019-11-15 10:52:17', 94, 1),
       (50, '5.6.0.3', 'Add purchase enabled to ou', 'SQL', 'V5.5.1.1__Add_purchase_enabled_to_ou.sql', 482164315,
        'root', '2019-11-21 07:54:17', 1612, 1),
       (51, '5.6.0.4', 'Add new partner api table', 'SQL', 'V5.6.0.4__Add_new_partner_api_table.sql', -116656368,
        'root', '2019-11-29 07:10:59', 16, 1),
       (52, '5.6.0.5', 'Fill partner api entity change', 'SQL', 'V5.6.0.5__Fill_partner_api_entity_change.sql',
        -1650586337, 'root', '2019-11-29 12:44:05', 534, 1),
       (53, '5.6.0.6', 'Add developer web hooks', 'SQL', 'V5.6.0.6__Add_developer_web_hooks.sql', -1139606954, 'root',
        '2019-11-29 12:44:05', 180, 1),
       (54, '5.6.0.7', 'Add automatic scope approval', 'SQL', 'V5.6.0.7__Add_automatic_scope_approval.sql', -205273959,
        'root', '2019-12-02 12:51:41', 132, 1),
       (55, '5.6.0.8', 'Set article banners as resizable', 'SQL', 'V5.6.0.8__Set_article_banners_as_resizable.sql',
        -896388930, 'root', '2019-12-04 13:10:47', 63, 1),
       (56, '5.6.0.9', 'Add order item ext id', 'SQL', 'V5.6.0.9__Add_order_item_ext_id.sql', 935970622, 'root',
        '2019-12-04 13:10:47', 175, 1),
       (57, '5.6.0.10', 'Add early provisioning feature flag', 'SQL',
        'V5.6.0.10__Add_early_provisioning_feature_flag.sql', 47145456, 'root', '2019-12-05 13:34:55', 1703, 1),
       (58, '5.6.0.11', 'Fix api notification table name', 'SQL', 'V5.6.0.11__Fix_api_notification_table_name.sql',
        1280587093, 'root', '2019-12-05 14:38:47', 75, 1),
       (59, '5.6.0.12', 'Add access token index to application session', 'SQL',
        'V5.6.0.12__Add_access_token_index_to_application_session.sql', -226839743, 'root', '2019-12-06 11:07:40', 507,
        1),
       (60, '6.1577103959', 'Create order quote', 'SQL', 'V6.1577103959__Create_order_quote.sql', 1207394090, 'root',
        '2020-01-08 13:24:44', 15, 1),
       (61, '6.1577105713', 'Create order quote item', 'SQL', 'V6.1577105713__Create_order_quote_item.sql', 899816250,
        'root', '2020-01-08 13:24:44', 10, 1),
       (62, '6.1578646164', 'add next mail to send mail', 'SQL', 'V6.1578646164__add_next_mail_to_send_mail.sql',
        -1452732203, 'root', '2020-01-10 09:50:21', 187, 1),
       (63, '6.1579093567', 'Add order quote to order', 'SQL', 'V6.1579093567__Add_order_quote_to_order.sql',
        -955056170, 'root', '2020-01-15 13:09:25', 67, 1),
       (64, '6.1579513574', 'Search apps add query on translated app name', 'SQL',
        'V6.1579513574__Search_apps_add_query_on_translated_app_name.sql', -744655550, 'root', '2020-01-20 13:41:14', 4,
        1),
       (65, '6.1579524816', 'Add order quote item assigned tables', 'SQL',
        'V6.1579524816__Add_order_quote_item_assigned_tables.sql', -691930417, 'root', '2020-01-20 13:56:05', 23, 1),
       (66, '6.1580110818', 'add subscription origin', 'SQL', 'V6.1580110818__add_subscription_origin.sql', -1948630013,
        'root', '2020-01-27 08:09:10', 209, 1),
       (67, '6.1580111545', 'move order origins to subscription', 'SQL',
        'V6.1580111545__move_order_origins_to_subscription.sql', -1606771406, 'root', '2020-01-27 08:09:10', 41, 1),
       (68, '6.1581693747', 'order license distribution', 'SQL', 'V6.1581693747__order_license_distribution.sql',
        642155106, 'root', '2020-02-14 15:33:34', 29, 1),
       (69, '6.1582108556', 'Add my collection touch site tip', 'SQL',
        'V6.1582108556__Add_my_collection_touch_site_tip.sql', 2029721799, 'root', '2020-02-19 12:03:43', 5, 1),
       (70, '6.1582194648', 'Add teams enabled to OU', 'SQL', 'V6.1582194648__Add_teams_enabled_to_OU.sql', 1053828373,
        'root', '2020-02-20 10:32:09', 1742, 1),
       (71, '6.1582544604', 'Create license assigment', 'SQL', 'V6.1582544604__Create_license_assigment.sql',
        -153399241, 'root', '2020-03-02 12:36:23', 22, 1),
       (72, '6.1583151640', 'Add license assignment excluded', 'SQL',
        'V6.1583151640__Add_license_assignment_excluded.sql', 1950398174, 'root', '2020-03-02 12:36:23', 18, 1),
       (73, '6.1583741228', 'Add school assignment status', 'SQL', 'V6.1583741228__Add_school_assignment_status.sql',
        -933181566, 'root', '2020-03-09 08:27:31', 16, 1),
       (74, '6.1583756304', 'Add url to app template', 'SQL', 'V6.1583756304__Add_url_to_app_template.sql', -1110102336,
        'root', '2020-03-09 12:20:13', 145, 1),
       (75, '6.1583919207', 'Add app package to license assignment', 'SQL',
        'V6.1583919207__Add_app_package_to_license_assignment.sql', 1231722570, 'root', '2020-03-11 09:38:52', 23, 1),
       (76, '6.1583919577', 'Add unique constraints to license assignment', 'SQL',
        'V6.1583919577__Add_unique_constraints_to_license_assignment.sql', 1986261511, 'root', '2020-03-11 09:41:09',
        26, 1),
       (77, '6.1583919921', 'Add app package to school assignment status', 'SQL',
        'V6.1583919921__Add_app_package_to_school_assignment_status.sql', 1209370698, 'root', '2020-03-11 09:48:33', 24,
        1),
       (78, '6.1583920212', 'Add unique constraint to school assignment status', 'SQL',
        'V6.1583920212__Add_unique_constraint_to_school_assignment_status.sql', 1684657437, 'root',
        '2020-03-11 09:50:46', 22, 1),
       (79, '6.1584109926', 'Add supports free license mails', 'SQL',
        'V6.1584109926__Add_supports_free_license_mails.sql', 895020759, 'root', '2020-03-16 08:12:23', 125, 1),
       (80, '6.1584541622', 'Add opt in ou', 'SQL', 'V6.1584541622__Add_opt_in_ou.sql', 1028829462, 'root',
        '2020-03-18 14:57:04', 54, 1),
       (81, '6.1585219285', 'disable request license for apps', 'SQL',
        'V6.1585219285__disable_request_license_for_apps.sql', 1604242536, 'root', '2020-03-27 07:40:27', 237, 1),
       (82, '6.1585294489', 'Add app version route', 'SQL', 'V6.1585294489__Add_app_version_route.sql', -1397280064,
        'root', '2020-03-27 07:40:27', 196, 1),
       (83, '6.1585576854', 'Collection banner site tip', 'SQL', 'V6.1585576854__Collection_banner_site_tip.sql',
        41585029, 'root', '2020-03-30 14:06:10', 3, 1),
       (84, '6.1586159462', 'Add sync event log', 'SQL', 'V6.1586159462__Add_sync_event_log.sql', -938164441, 'root',
        '2020-04-15 13:35:53', 28, 1),
       (85, '6.1586328026', 'create idp log', 'SQL', 'V6.1586328026__create_idp_log.sql', -2049365128, 'root',
        '2020-04-15 13:37:32', 85, 1),
       (86, '6.1586933327', 'Create tech notification', 'SQL', 'V6.1586933327__Create_tech_notification.sql', 535057225,
        'root', '2020-04-15 13:37:32', 25, 1),
       (87, '6.1587133220', 'Add developer support url', 'SQL', 'V6.1587133220__Add_developer_support_url.sql',
        1946238531, 'root', '2020-04-17 14:27:06', 64, 1),
       (88, '6.1587388459', 'Add description to idp log', 'SQL', 'V6.1587388459__Add_description_to_idp_log.sql',
        1454602408, 'root', '2020-04-20 13:35:59', 162, 1),
       (89, '6.1588164585', 'Add activity log index', 'SQL', 'V6.1588164585__Add_activity_log_index.sql', -1005191154,
        'root', '2020-04-29 12:50:38', 20, 1),
       (90, '6.1588233290', 'Add app supports sso', 'SQL', 'V6.1588233290__Add_app_supports_sso.sql', 36632710, 'root',
        '2020-04-30 07:57:25', 180, 1),
       (91, '6.1589283456', 'Default supports sso to false for local apps', 'SQL',
        'V6.1589283456__Default_supports_sso_to_false_for_local_apps.sql', -398409516, 'root', '2020-06-09 14:09:58', 4,
        1),
       (92, '6.1591711367', 'Add partner api log', 'SQL', 'V6.1591711367__Add_partner_api_log.sql', 742448424, 'root',
        '2020-06-09 14:09:58', 19, 1),
       (93, '6.1592815791', 'Add official school code', 'SQL', 'V6.1592815791__Add_official_school_code.sql', 475156866,
        'root', '2020-06-23 09:04:25', 21, 1),
       (94, '6.1592902881', 'Add official unit code to school unit', 'SQL',
        'V6.1592902881__Add_official_unit_code_to_school_unit.sql', -1797859637, 'root', '2020-06-23 09:27:26', 25, 1),
       (95, '6.1592995908', 'Add disabled by user to visible school app', 'SQL',
        'V6.1592995908__Add_disabled_by_user_to_visible_school_app.sql', -893328519, 'root', '2020-06-24 10:54:27', 75,
        1),
       (96, '6.1593177257', 'Add early provisioning notification', 'SQL',
        'V6.1593177257__Add_early_provisioning_notification.sql', 2019359612, 'root', '2020-06-29 07:09:57', 19, 1),
       (97, '6.1593415918', 'Enable early provisioning for organizations', 'SQL',
        'V6.1593415918__Enable_early_provisioning_for_organizations.sql', 752720806, 'root', '2020-06-29 07:32:39', 4,
        1),
       (98, '6.1593501141', 'Add ou disabled remove ou active', 'SQL',
        'V6.1593501141__Add_ou_disabled_remove_ou_active.sql', -783169038, 'root', '2020-06-30 07:13:26', 1544, 1),
       (99, '6.1593767564', 'Remove ou approved scope approval type', 'SQL',
        'V6.1593767564__Remove_ou_approved_scope_approval_type.sql', 907757927, 'root', '2020-07-03 09:13:33', 271, 1),
       (100, '6.1594282501', 'Add app supports offline', 'SQL', 'V6.1594282501__Add_app_supports_offline.sql',
        1867250037, 'root', '2020-07-09 08:23:12', 468, 1),
       (101, '6.1597150300', 'Add access log', 'SQL', 'V6.1597150300__Add_access_log.sql', -152187246, 'root',
        '2020-08-11 12:54:55', 18, 1),
       (102, '6.1596627203', 'Remove supports free licence mails', 'SQL',
        'V6.1596627203__Remove_supports_free_licence_mails.sql', 206031683, 'root', '2020-08-18 09:06:01', 195, 1),
       (103, '6.1597741451', 'Add nynorsk', 'SQL', 'V6.1597741451__Add_nynorsk.sql', 2139137093, 'root',
        '2020-08-18 09:06:01', 4, 1),
       (104, '6.1597742795', 'Update norwegian languages', 'SQL', 'V6.1597742795__Update_norwegian_languages.sql',
        1074804702, 'root', '2020-08-18 09:33:17', 7, 1),
       (105, '6.1597748830', 'Add change log', 'SQL', 'V6.1597748830__Add_change_log.sql', 1761095023, 'root',
        '2020-08-18 11:13:22', 12, 1),
       (106, '6.1597752789', 'Remove event settings from ou', 'SQL', 'V6.1597752789__Remove_event_settings_from_ou.sql',
        2125962812, 'root', '2020-08-18 12:14:14', 1619, 1),
       (107, '6.1597826850', 'Remove active check from search schools', 'SQL',
        'V6.1597826850__Remove_active_check_from_search_schools.sql', -918938050, 'root', '2020-08-19 08:49:24', 17, 1),
       (108, '6.1598347312', 'Add session login finalized', 'SQL', 'V6.1598347312__Add_session_login_finalized.sql',
        -1426260671, 'root', '2020-08-25 10:53:55', 440, 1),
       (109, '6.1598853819', 'Create customer revenue snapshot', 'SQL',
        'V6.1598853819__Create_customer_revenue_snapshot.sql', -197688812, 'root', '2020-08-31 06:59:53', 16, 1),
       (110, '6.1598873777', 'Update billable license groups', 'SQL',
        'V6.1598873777__Update_billable_license_groups.sql', 2135317703, 'root', '2020-08-31 11:42:44', 310, 1),
       (111, '6.1598878185', 'Reset license is billable distribution', 'SQL',
        'V6.1598878185__Reset_license_is_billable_distribution.sql', 996026836, 'root', '2020-08-31 12:54:19', 2390, 1),
       (112, '6.1599469421', 'Update change log entity id type', 'SQL',
        'V6.1599469421__Update_change_log_entity_id_type.sql', -1008780549, 'root', '2020-09-07 09:06:38', 57, 1),
       (113, '6.1600324291', 'Update subscription columns', 'SQL', 'V6.1600324291__Update_subscription_columns.sql',
        1941725435, 'root', '2020-09-18 08:48:44', 343, 1),
       (114, '6.1600418714', 'Add school id to activity log', 'SQL', 'V6.1600418714__Add_school_id_to_activity_log.sql',
        1360073455, 'root', '2020-09-18 08:48:44', 175, 1),
       (115, '6.1600504740', 'Add soft delete for user app version', 'SQL',
        'V6.1600504740__Add_soft_delete_for_user_app_version.sql', -1479654495, 'root', '2020-09-19 08:39:53', 225, 1),
       (116, '6.1600593220', 'Add school id to user app version', 'SQL',
        'V6.1600593220__Add_school_id_to_user_app_version.sql', 53740022, 'root', '2020-09-20 09:17:17', 900, 1),
       (117, '6.1600593446', 'Add school id to existing user app versions', 'SQL',
        'V6.1600593446__Add_school_id_to_existing_user_app_versions.sql', -1526850410, 'root', '2020-09-20 09:24:43',
        2139, 1),
       (118, '6.1600594183', 'Add school id to user app folder', 'SQL',
        'V6.1600594183__Add_school_id_to_user_app_folder.sql', -1307103329, 'root', '2020-09-20 09:31:06', 40, 1),
       (119, '6.1600594277', 'Add school id to existing user app folder', 'SQL',
        'V6.1600594277__Add_school_id_to_existing_user_app_folder.sql', -1082650457, 'root', '2020-09-20 09:37:16', 10,
        1),
       (120, '6.1600594826', 'Clean up user app version and user app folder', 'SQL',
        'V6.1600594826__Clean_up_user_app_version_and_user_app_folder.sql', 1008673422, 'root', '2020-09-21 06:33:26',
        496, 1),
       (121, '6.1600669906', 'Make user app version and user app folder school id not nullable', 'SQL',
        'V6.1600669906__Make_user_app_version_and_user_app_folder_school_id_not_nullable.sql', 1036697972, 'root',
        '2020-09-21 06:33:28', 1320, 1),
       (122, '6.1600690632', 'Add app statistics enabled', 'SQL', 'V6.1600690632__Add_app_statistics_enabled.sql',
        -2089583077, 'root', '2020-09-21 12:29:58', 520, 1),
       (123, '6.1600770705', 'Add personal data processing agreement', 'SQL',
        'V6.1600770705__Add_personal_data_processing_agreement.sql', -2107689599, 'root', '2020-09-22 11:19:36', 18, 1),
       (124, '6.1600846747', 'Add expired to user app version', 'SQL',
        'V6.1600846747__Add_expired_to_user_app_version.sql', 123548615, 'root', '2020-09-23 07:44:35', 811, 1),
       (125, '6.1600957065', 'Remove invalid user app versions', 'SQL',
        'V6.1600957065__Remove_invalid_user_app_versions.sql', -1445511898, 'root', '2020-09-25 06:48:32', 458, 1),
       (126, '6.1588170210', 'Create myedu tables', 'SQL', 'V6.1588170210__Create_myedu_tables.sql', -185881392, 'root',
        '2020-09-30 08:56:45', 64, 1),
       (127, '6.1601365497', 'Add totalPrice to order qoute item', 'SQL',
        'V6.1601365497__Add_totalPrice_to_order_qoute_item.sql', -1773649977, 'root', '2020-09-30 13:10:12', 105, 1),
       (128, '6.1601386404', 'Add deletion time to assignment', 'SQL',
        'V6.1601386404__Add_deletion_time_to_assignment.sql', 207279184, 'root', '2020-10-08 06:28:19', 45, 1),
       (129, '6.1602138352', 'Add uuids', 'SQL', 'V6.1602138352__Add_uuids.sql', -1327274920, 'root',
        '2020-10-08 06:28:52', 5997, 1),
       (130, '6.1602576867', 'add landuage id to ou', 'SQL', 'V6.1602576867__add_landuage_id_to_ou.sql', -2019868595,
        'root', '2020-10-15 07:34:29', 2034, 1),
       (131, '6.1602746593', 'Create uuid triggers', 'SQL', 'V6.1602746593__Create_uuid_triggers.sql', -874436263,
        'root', '2020-10-15 07:34:29', 112, 1),
       (132, '6.1602747385', 'Backfill uuids', 'SQL', 'V6.1602747385__Backfill_uuids.sql', -488438835, 'root',
        '2020-10-15 07:37:46', 978, 1),
       (133, '6.1602747963', 'Add code to school type', 'SQL', 'V6.1602747963__Add_code_to_school_type.sql', -323102499,
        'root', '2020-10-15 09:26:50', 35, 1),
       (134, '6.1602748016', 'Add SS12000 school types', 'SQL', 'V6.1602748016__Add_SS12000_school_types.sql',
        -216808895, 'root', '2020-10-15 09:26:50', 2, 1),
       (135, '6.1602748277', 'Map old school types', 'SQL', 'V6.1602748277__Map_old_school_types.sql', 53929287, 'root',
        '2020-10-15 10:15:43', 139, 1),
       (136, '6.1603190061', 'Make uuids unique', 'SQL', 'V6.1603190061__Make_uuids_unique.sql', -1045406536, 'root',
        '2020-10-20 10:35:18', 1191, 1),
       (137, '6.1602156702', 'add admin country access to user', 'SQL',
        'V6.1602156702__add_admin_country_access_to_user.sql', -1539434418, 'root', '2020-10-20 13:33:05', 3985, 1),
       (138, '6.1602253189', 'modify admin scopes varchar500', 'SQL',
        'V6.1602253189__modify_admin_scopes_varchar500.sql', 134948670, 'root', '2020-10-20 13:33:09', 3545, 1),
       (139, '6.1602673849', 'migrate school admins to super admins', 'SQL',
        'V6.1602673849__migrate_school_admins_to_super_admins.sql', -1239949425, 'root', '2020-10-20 13:33:09', 3, 1),
       (140, '6.1603202655', 'migrate admins to admin scopes', 'SQL',
        'V6.1603202655__migrate_admins_to_admin_scopes.sql', 573806819, 'root', '2020-10-21 10:49:48', 8, 1),
       (141, '6.1603277128', 'Create uuid triggers', 'SQL', 'V6.1603277128__Create_uuid_triggers.sql', -1767715349,
        'root', '2020-10-21 10:49:48', 61, 1),
       (142, '6.1603698882', 'Add complete billing information to reseller', 'SQL',
        'V6.1603698882__Add_complete_billing_information_to_reseller.sql', 953247157, 'root', '2020-10-26 08:32:58', 82,
        1),
       (143, '6.1603701778', 'Add complete billing information to developer', 'SQL',
        'V6.1603701778__Add_complete_billing_information_to_developer.sql', 1012972458, 'root', '2020-10-27 13:52:28',
        235, 1),
       (144, '6.1603807433', 'Add complete billing information to ou', 'SQL',
        'V6.1603807433__Add_complete_billing_information_to_ou.sql', 910467488, 'root', '2020-10-27 14:06:32', 2553, 1),
       (145, '6.1604303691', 'Add subject category', 'SQL', 'V6.1604303691__Add_subject_category.sql', -792443965,
        'root', '2020-11-02 10:21:48', 23, 1),
       (146, '6.1604305251', 'Insert subject categories', 'SQL', 'V6.1604305251__Insert_subject_categories.sql',
        -1219371867, 'root', '2020-11-02 12:47:29', 7, 1),
       (147, '6.1604313401', 'Add missing subject columns', 'SQL', 'V6.1604313401__Add_missing_subject_columns.sql',
        -1065239695, 'root', '2020-11-03 07:39:17', 374, 1),
       (148, '6.1604313403', 'Add missing subjects', 'SQL', 'V6.1604313403__Add_missing_subjects.sql', 123961820,
        'root', '2020-11-03 07:39:17', 4, 1),
       (149, '6.1604313882', 'Add subject category id to subject', 'SQL',
        'V6.1604313882__Add_subject_category_id_to_subject.sql', -868929533, 'root', '2020-11-03 07:41:04', 21, 1),
       (150, '6.1604314029', 'Map existing subjects to subject categories', 'SQL',
        'V6.1604314029__Map_existing_subjects_to_subject_categories.sql', -1095111033, 'root', '2020-11-03 07:46:05',
        16, 1),
       (151, '6.1603812593', 'Prefill ou billing details', 'SQL', 'V6.1603812593__Prefill_ou_billing_details.sql',
        -1966468107, 'root', '2020-11-09 12:16:58', 380, 1),
       (152, '6.1604483114', 'Add visma numbers to ou reseller developer and order', 'SQL',
        'V6.1604483114__Add_visma_numbers_to_ou_reseller_developer_and_order.sql', -1033437161, 'root',
        '2020-11-09 12:17:01', 2933, 1),
       (153, '6.1604924043', 'Extend developer billable user', 'SQL',
        'V6.1604924043__Extend_developer_billable_user.sql', 603703879, 'root', '2020-11-09 12:17:01', 387, 1),
       (155, '6.1604048095', 'calculate total price for incomplete orders', 'SQL',
        'V6.1604048095__calculate_total_price_for_incomplete_orders.sql', 1366320081, 'root', '2020-11-17 07:59:58', 8,
        1),
       (156, '6.1604331559', 'Add review', 'SQL', 'V6.1604331559__Add_review.sql', -1146692733, 'root',
        '2020-11-17 07:59:58', 17, 1),
       (157, '6.1604331624', 'Add avg rating to app', 'SQL', 'V6.1604331624__Add_avg_rating_to_app.sql', 324110965,
        'root', '2020-11-17 07:59:59', 276, 1),
       (158, '6.1604413389', 'Add country id and popularity to app popularity', 'SQL',
        'V6.1604413389__Add_country_id_and_popularity_to_app_popularity.sql', 477539381, 'root', '2020-11-17 07:59:59',
        79, 1),
       (159, '6.1605013962', 'Add popularity to ou app popularity', 'SQL',
        'V6.1605013962__Add_popularity_to_ou_app_popularity.sql', 1562222381, 'root', '2020-11-17 07:59:59', 127, 1),
       (160, '6.1605080713', 'Add background file id to app and developer', 'SQL',
        'V6.1605080713__Add_background_file_id_to_app_and_developer.sql', 1782987080, 'root', '2020-11-17 07:59:59',
        150, 1),
       (161, '6.1605269071', 'add education enabled to ou', 'SQL', 'V6.1605269071__add_education_enabled_to_ou.sql',
        688741336, 'root', '2020-11-17 08:00:02', 2516, 1),
       (162, '6.1605601171', 'Add visma error and visma date to order', 'SQL',
        'V6.1605601171__Add_visma_error_and_visma_date_to_order.sql', -817764525, 'root', '2020-11-17 08:21:58', 116,
        1),
       (163, '6.1605520450', 'Add developer customer to order', 'SQL',
        'V6.1605520450__Add_developer_customer_to_order.sql', 1848069532, 'root', '2020-11-19 12:58:47', 215, 1),
       (164, '6.1605813040', 'Add customer subscription order type', 'SQL',
        'V6.1605813040__Add_customer_subscription_order_type.sql', -995143470, 'root', '2020-11-19 19:31:22', 26, 1),
       (165, '6.1606490624', 'Add invoice text to ou and order', 'SQL',
        'V6.1606490624__Add_invoice_text_to_ou_and_order.sql', 1449757835, 'root', '2020-11-29 08:40:12', 8624, 1),
       (166, '6.1606730401', 'Add vat registration id', 'SQL', 'V6.1606730401__Add_vat_registration_id.sql', -620404516,
        'root', '2020-11-30 10:02:06', 3573, 1),
       (167, '6.1606748893', 'Add norwegian subject category translations', 'SQL',
        'V6.1606748893__Add_norwegian_subject_category_translations.sql', 1517344379, 'root', '2020-11-30 15:10:52', 5,
        1),
       (168, '6.1607083202', 'Add data region tables', 'SQL', 'V6.1607083202__Add_data_region_tables.sql', 1562136029,
        'root', '2020-12-09 08:40:01', 160, 1),
       (169, '6.1607350535', 'Add data region id to user', 'SQL', 'V6.1607350535__Add_data_region_id_to_user.sql',
        1343812587, 'root', '2020-12-09 08:40:14', 12533, 1),
       (170, '6.1607351452', 'Insert region user into user types', 'SQL',
        'V6.1607351452__Insert_region_user_into_user_types.sql', 134692950, 'root', '2020-12-09 08:40:14', 5, 1),
       (171, '6.1607503006', 'Create developer app usage graph', 'SQL',
        'V6.1607503006__Create_developer_app_usage_graph.sql', -793863195, 'root', '2020-12-09 08:40:14', 80, 1),
       (172, '6.1607597628', 'Update old partner yearly fee orders', 'SQL',
        'V6.1607597628__Update_old_partner_yearly_fee_orders.sql', -1626028983, 'root', '2020-12-18 10:06:23', 24, 1),
       (173, '6.1608285667', 'Add times to renew to subscription', 'SQL',
        'V6.1608285667__Add_times_to_renew_to_subscription.sql', 997089803, 'root', '2020-12-18 10:07:06', 289, 1),
       (174, '6.1608557316', 'Add discount in currency to order item', 'SQL',
        'V6.1608557316__Add_discount_in_currency_to_order_item.sql', -63946994, 'root', '2020-12-21 13:29:29', 509, 1),
       (175, '6.1608641914', 'Add new sale to subscription', 'SQL', 'V6.1608641914__Add_new_sale_to_subscription.sql',
        1815937452, 'root', '2020-12-22 13:13:36', 199, 1),
       (176, '6.1610116725', 'Add deleted to regions', 'SQL', 'V6.1610116725__Add_deleted_to_regions.sql', -1932943835,
        'root', '2021-01-12 10:03:39', 203, 1),
       (177, '6.1610445573', 'Set valid month charged', 'SQL', 'V6.1610445573__Set_valid_month_charged.sql', 1218499749,
        'root', '2021-01-12 10:03:39', 11, 1),
       (178, '6.1610525420', 'Add indices on deleted and updated to partner api entity change', 'SQL',
        'V6.1610525420__Add_indices_on_deleted_and_updated_to_partner_api_entity_change.sql', -959225821, 'root',
        '2021-01-13 08:47:13', 40, 1),
       (179, '6.1610460162', 'Add partner statistics enabled to developer', 'SQL',
        'V6.1610460162__Add_partner_statistics_enabled_to_developer.sql', -1968569501, 'root', '2021-01-19 13:18:16',
        214, 1),
       (180, '6.1611135270', 'Update integration subscriptions without order type', 'SQL',
        'V6.1611135270__Update_integration_subscriptions_without_order_type.sql', 1977440412, 'root',
        '2021-01-20 12:19:47', 6, 1),
       (181, '6.1611144889', 'Fix subscriptions with no order type', 'SQL',
        'V6.1611144889__Fix_subscriptions_with_no_order_type.sql', 858055530, 'root', '2021-01-20 12:19:47', 30, 1),
       (182, '6.1611924062', 'Add order visma document date', 'SQL', 'V6.1611924062__Add_order_visma_document_date.sql',
        -411760426, 'root', '2021-01-29 12:48:48', 417, 1),
       (183, '6.1611924462', 'Set visma document date for old orders', 'SQL',
        'V6.1611924462__Set_visma_document_date_for_old_orders.sql', 1420196250, 'root', '2021-01-29 12:48:48', 8, 1),
       (184, '6.1610979236', 'Add country id to assignment', 'SQL', 'V6.1610979236__Add_country_id_to_assignment.sql',
        842214607, 'root', '2021-02-01 08:24:42', 59, 1),
       (185, '6.1610982948', 'Migrate country id on assignments', 'SQL',
        'V6.1610982948__Migrate_country_id_on_assignments.sql', 1102902726, 'root', '2021-02-01 08:24:42', 5, 1),
       (186, '6.1612167661', 'Add uuid to user group membership', 'SQL',
        'V6.1612167661__Add_uuid_to_user_group_membership.sql', -1710536925, 'root', '2021-02-01 08:24:46', 3487, 1),
       (187, '6.1612167920', 'Backfill user group membership uuids', 'SQL',
        'V6.1612167920__Backfill_user_group_membership_uuids.sql', 124704756, 'root', '2021-02-01 08:26:12', 23159, 1),
       (188, '6.1612172624', 'Add license expiration to order item', 'SQL',
        'V6.1612172624__Add_license_expiration_to_order_item.sql', 1712501438, 'root', '2021-02-15 12:30:23', 231, 1),
       (189, '6.1612448990', 'add is backwards compatible to app', 'SQL',
        'V6.1612448990__add_is_backwards_compatible_to_app.sql', -527571075, 'root', '2021-02-15 12:30:24', 287, 1),
       (190, '6.1612528315', 'Add practice material app category', 'SQL',
        'V6.1612528315__Add_practice_material_app_category.sql', -1971777810, 'root', '2021-02-15 12:30:24', 1, 1),
       (191, '6.1612863416', 'Set is backwards compatible on applicaple apps', 'SQL',
        'V6.1612863416__Set_is_backwards_compatible_on_applicaple_apps.sql', -907002987, 'root', '2021-02-15 12:30:28',
        4557, 1),
       (192, '6.1612878048', 'Add status to app', 'SQL', 'V6.1612878048__Add_status_to_app.sql', -698930339, 'root',
        '2021-02-19 16:14:16', 480, 1),
       (193, '6.1612878306', 'Set app status for existing apps', 'SQL',
        'V6.1612878306__Set_app_status_for_existing_apps.sql', 1570069960, 'root', '2021-03-01 08:09:54', 4832, 1),
       (194, '6.1614094728', 'Rename app extra name', 'SQL', 'V6.1614094728__Rename_app_extra_name.sql', -607949093,
        'root', '2021-03-01 08:09:54', 5, 1),
       (195, '6.1614502348', 'Migrate products to one per country', 'SQL',
        'V6.1614502348__Migrate_products_to_one_per_country.sql', -804288879, 'root', '2021-03-01 08:09:54', 101, 1),
       (196, '6.1614673081', 'Alter search apps routine to have isPublished isExternal filters', 'SQL',
        'V6.1614673081__Alter_search_apps_routine_to_have_isPublished_isExternal_filters.sql', 1483637228, 'root',
        '2021-03-03 09:47:53', 18, 1),
       (197, '6.1614602681', 'Drop license expiration from order item', 'SQL',
        'V6.1614602681__Drop_license_expiration_from_order_item.sql', -498931055, 'root', '2021-03-11 08:00:54', 132,
        1),
       (198, '6.1614602813', 'add duration and duratyion type to order item', 'SQL',
        'V6.1614602813__add_duration_and_duratyion_type_to_order_item.sql', -1708822244, 'root', '2021-03-11 08:00:54',
        176, 1),
       (199, '6.1614778281', 'Set duration and duration type on old order items', 'SQL',
        'V6.1614778281__Set_duration_and_duration_type_on_old_order_items.sql', 282015864, 'root',
        '2021-03-11 08:00:54', 158, 1),
       (200, '6.1616406401', 'Add discount agreement id to order item', 'SQL',
        'V6.1616406401__Add_discount_agreement_id_to_order_item.sql', -111622293, 'root', '2021-03-27 10:11:20', 5170,
        1),
       (201, '6.1616753208', 'Add order item.auto renewal', 'SQL', 'V6.1616753208__Add_order_item.auto_renewal.sql',
        -1237327298, 'root', '2021-03-27 10:11:26', 6283, 1),
       (202, '6.1616753249', 'Set order item auto renewal for sales and distribution orders', 'SQL',
        'V6.1616753249__Set_order_item_auto_renewal_for_sales_and_distribution_orders.sql', -637140533, 'root',
        '2021-03-27 10:13:57', 2228, 1),
       (203, '6.1616940622', 'Add discount agreement applicable to order quotes', 'SQL',
        'V6.1616940622__Add_discount_agreement_applicable_to_order_quotes.sql', 1533246380, 'root',
        '2021-03-28 14:11:29', 884, 1),
       (204, '6.1616057249', 'Add order reference to id counter', 'SQL',
        'V6.1616057249__Add_order_reference_to_id_counter.sql', -175338916, 'root', '2021-04-06 12:53:56', 20, 1),
       (205, '6.1616600080', 'Clean reference fields on order table', 'SQL',
        'V6.1616600080__Clean_reference_fields_on_order_table.sql', -928161233, 'root', '2021-04-06 12:53:56', 355, 1),
       (206, '6.1616666188', 'Clean reference fields on subscription table', 'SQL',
        'V6.1616666188__Clean_reference_fields_on_subscription_table.sql', 1868351546, 'root', '2021-04-06 12:53:56',
        22, 1),
       (207, '6.1616688017', 'Clean reference fields on order quote table', 'SQL',
        'V6.1616688017__Clean_reference_fields_on_order_quote_table.sql', -1913057346, 'root', '2021-04-06 12:53:56',
        91, 1),
       (208, '6.1617096913', 'Add first purchase requires manuel processing flag to developer', 'SQL',
        'V6.1617096913__Add_first_purchase_requires_manuel_processing_flag_to_developer.sql', -1111075301, 'root',
        '2021-04-06 12:53:56', 105, 1),
       (209, '6.1617173004', 'Add developer processed school', 'SQL',
        'V6.1617173004__Add_developer_processed_school.sql', 1842724862, 'root', '2021-04-06 12:53:57', 26, 1),
       (210, '6.1617175348', 'Assign schools as processed if they have licence group', 'SQL',
        'V6.1617175348__Assign_schools_as_processed_if_they_have_licence_group.sql', -1945452892, 'root',
        '2021-04-06 12:53:58', 1091, 1),
       (211, '6.1617711657', 'Add order item requires external activation', 'SQL',
        'V6.1617711657__Add_order_item_requires_external_activation.sql', -597131632, 'root', '2021-04-06 12:53:58',
        301, 1),
       (212, '6.1617974380', 'Drop ou allowed scopes developer', 'SQL',
        'V6.1617974380__Drop_ou_allowed_scopes_developer.sql', -1278043760, 'root', '2021-04-13 09:43:32', 18, 1),
       (213, '6.1618304471', 'Add user data purged', 'SQL', 'V6.1618304471__Add_user_data_purged.sql', -2121759522,
        'root', '2021-04-13 09:43:39', 6288, 1),
       (214, '6.1618317473', 'Drop developer.local apps developer', 'SQL',
        'V6.1618317473__Drop_developer.local_apps_developer.sql', -238514272, 'root', '2021-04-21 06:55:50', 272, 1),
       (215, '6.1618987916', 'Create table ss12000 push sync', 'SQL',
        'V6.1618987916__Create_table_ss12000_push_sync.sql', -602579289, 'root', '2021-04-21 06:55:50', 48, 1),
       (216, '6.1619014935', 'Add subscription cancelation notice period to developer', 'SQL',
        'V6.1619014935__Add_subscription_cancelation_notice_period_to_developer.sql', 432426723, 'root',
        '2021-04-28 14:39:27', 67, 1),
       (217, '6.1619016725', 'Rename app extra row', 'SQL', 'V6.1619016725__Rename_app_extra_row.sql', -1325898704,
        'root', '2021-04-28 14:39:27', 8, 1),
       (218, '6.1619074043', 'Add cancelation notice period to subscription', 'SQL',
        'V6.1619074043__Add_cancelation_notice_period_to_subscription.sql', -1542518668, 'root', '2021-04-28 14:39:27',
        94, 1),
       (219, '6.1619074254', 'Migrate notice period for existing subscriptions', 'SQL',
        'V6.1619074254__Migrate_notice_period_for_existing_subscriptions.sql', 1600228204, 'root',
        '2021-04-28 14:39:28', 9, 1),
       (220, '6.1619448085', 'Add default library filter accessible', 'SQL',
        'V6.1619448085__Add_default_library_filter_accessible.sql', -201689151, 'root', '2021-04-28 14:39:31', 3372, 1),
       (221, '6.1619620669', 'Add license group subscription id index', 'SQL',
        'V6.1619620669__Add_license_group_subscription_id_index.sql', 1799274000, 'root', '2021-04-28 14:39:31', 88, 1),
       (222, '6.1618908862', 'Add cancelled to subscription', 'SQL', 'V6.1618908862__Add_cancelled_to_subscription.sql',
        1099409199, 'root', '2021-05-03 11:11:07', 143, 1),
       (223, '6.1620040214', 'Add order messages', 'SQL', 'V6.1620040214__Add_order_messages.sql', -421918818, 'root',
        '2021-05-03 11:11:07', 215, 1),
       (224, '6.1620738108', 'Add ou status', 'SQL', 'V6.1620738108__Add_ou_status.sql', -1307319023, 'root',
        '2021-05-27 10:45:56', 63, 1),
       (225, '6.1620738570', 'Insert ou statuses', 'SQL', 'V6.1620738570__Insert_ou_statuses.sql', -880974532, 'root',
        '2021-05-27 10:45:56', 12, 1),
       (226, '6.1621515048', 'Drop create hidden school app procedure', 'SQL',
        'V6.1621515048__Drop_create_hidden_school_app_procedure.sql', 458539336, 'root', '2021-05-27 10:45:56', 13, 1),
       (227, '6.1621606528', 'Add STT and Partner ou statuses', 'SQL',
        'V6.1621606528__Add_STT_and_Partner_ou_statuses.sql', 1524598752, 'root', '2021-05-27 10:45:56', 13, 1),
       (228, '6.1621838200', 'Add type to app', 'SQL', 'V6.1621838200__Add_type_to_app.sql', 1613198754, 'root',
        '2021-05-27 10:45:57', 449, 1),
       (229, '6.1621838669', 'Remove app type column', 'SQL', 'V6.1621838669__Remove_app_type_column.sql', 262530316,
        'root', '2021-05-27 10:45:57', 355, 1),
       (230, '6.1621838859', 'Migrate app types', 'SQL', 'V6.1621838859__Migrate_app_types.sql', 1034744972, 'root',
        '2021-05-27 10:45:57', 75, 1),
       (231, '6.1621848943', 'Drop is school app column', 'SQL', 'V6.1621848943__Drop_is_school_app_column.sql',
        755030393, 'root', '2021-05-27 10:45:58', 418, 1),
       (232, '6.1622112242', 'Add school free app', 'SQL', 'V6.1622112242__Add_school_free_app.sql', 470764202, 'root',
        '2021-05-27 12:44:10', 27, 1),
       (233, '6.1622050286', 'increase developer support url size', 'SQL',
        'V6.1622050286__increase_developer_support_url_size.sql', 1335167579, 'root', '2021-05-31 11:33:49', 74, 1),
       (234, '6.1622460636', 'Add existing school free apps', 'SQL', 'V6.1622460636__Add_existing_school_free_apps.sql',
        -533956770, 'root', '2021-05-31 11:36:07', 602, 1),
       (235, '6.1622207054', 'Drop ou integration', 'SQL', 'V6.1622207054__Drop_ou_integration.sql', -1911545101,
        'root', '2021-06-08 07:27:50', 31, 1),
       (236, '6.1622453226', 'Create license pool table', 'SQL', 'V6.1622453226__Create_license_pool_table.sql',
        51468849, 'root', '2021-06-08 07:27:50', 37, 1),
       (237, '6.1623137188', 'Add license pool id to license group', 'SQL',
        'V6.1623137188__Add_license_pool_id_to_license_group.sql', -1474023739, 'root', '2021-06-08 07:27:52', 1754, 1),
       (238, '6.1623392769', 'Create app in ou collection table', 'SQL',
        'V6.1623392769__Create_app_in_ou_collection_table.sql', -1891197600, 'root', '2021-06-14 07:54:24', 33, 1),
       (239, '6.1623656989', 'Move visible school app.auto assign to app in ou collection', 'SQL',
        'V6.1623656989__Move_visible_school_app.auto_assign_to_app_in_ou_collection.sql', -1165720643, 'root',
        '2021-06-14 07:54:24', 23, 1),
       (240, '6.1623657278', 'DROP visible school app.auto assign column', 'SQL',
        'V6.1623657278__DROP_visible_school_app.auto_assign_column.sql', -440702221, 'root', '2021-06-14 07:55:18', 129,
        1),
       (241, '6.1622730229', 'Add license pool assignee', 'SQL', 'V6.1622730229__Add_license_pool_assignee.sql',
        1000352911, 'root', '2021-06-15 07:23:08', 44, 1),
       (242, '6.1623224689', 'add feide to idp', 'SQL', 'V6.1623224689__add_feide_to_idp.sql', -900666436, 'root',
        '2021-06-15 08:26:56', 21, 1),
       (243, '6.1623743233', 'Remove license pool assignee.license pool id foreign key', 'SQL',
        'V6.1623743233__Remove_license_pool_assignee.license_pool_id_foreign_key.sql', 939358856, 'root',
        '2021-06-15 08:33:46', 34, 1),
       (244, '6.1623746154', 'Add license pool assignee.license pool foreign key', 'SQL',
        'V6.1623746154__Add_license_pool_assignee.license_pool_foreign_key.sql', -605847466, 'root',
        '2021-06-15 08:37:31', 57, 1),
       (245, '6.1623746283', 'Remove license group.license pool id foreign key', 'SQL',
        'V6.1623746283__Remove_license_group.license_pool_id_foreign_key.sql', -645885278, 'root',
        '2021-06-15 08:39:05', 57, 1),
       (246, '6.1623828029', 'remove license limits', 'SQL', 'V6.1623828029__remove_license_limits.sql', 98857718,
        'root', '2021-06-21 06:35:22', 98, 1),
       (247, '6.1623859913', 'rename license pool auto add to collection', 'SQL',
        'V6.1623859913__rename_license_pool_auto_add_to_collection.sql', 157803898, 'root', '2021-06-21 06:35:22', 26,
        1),
       (248, '6.1623923876', 'remove-products-with-license-limits', 'SQL',
        'V6.1623923876__remove-products-with-license-limits.sql', 1179247983, 'root', '2021-06-21 06:35:22', 23, 1),
       (249, '6.1624276205', 'remove user app version app foreign key', 'SQL',
        'V6.1624276205__remove_user_app_version_app_foreign_key.sql', -1266157890, 'root', '2021-06-21 11:54:45', 76,
        1),
       (250, '6.1624276206', 'cascade app delete to user app version', 'SQL',
        'V6.1624276206__cascade_app_delete_to_user_app_version.sql', -133234055, 'root', '2021-06-21 11:54:49', 3396,
        1),
       (251, '6.1624433132', 'Add license pool last distributed and last updated', 'SQL',
        'V6.1624433132__Add_license_pool_last_distributed_and_last_updated.sql', 909504801, 'root',
        '2021-06-23 12:24:57', 50, 1),
       (252, '6.1624453882', 'Single-license setting column total max limit to null in both Product and LicenseGroup',
        'SQL',
        'V6.1624453882__Single-license_setting_column_total_max_limit_to_null_in_both_Product_and_LicenseGroup.sql',
        221392684, 'root', '2021-06-24 14:00:25', 83, 1),
       (253, '6.1624904770', 'add-integrations-to-my-collection', 'SQL',
        'V6.1624904770__add-integrations-to-my-collection.sql', -317253358, 'root', '2021-07-02 13:02:28', 172, 1),
       (254, '6.1620399358', 'Add signed url to file', 'SQL', 'V6.1620399358__Add_signed_url_to_file.sql', -207275217,
        'root', '2021-08-18 13:54:47', 1042, 1),
       (255, '6.1621371206', 'Drop temp file table', 'SQL', 'V6.1621371206__Drop_temp_file_table.sql', 1617480631,
        'root', '2021-08-18 13:54:47', 34, 1),
       (256, '6.1625470858', 'Delete user app versions with deleted users', 'SQL',
        'V6.1625470858__Delete_user_app_versions_with_deleted_users.sql', -676076409, 'root', '2021-08-18 13:54:48',
        350, 1),
       (257, '6.1628513523', 'cleanup product-ids that may exists in related db-tables', 'SQL',
        'V6.1628513523__cleanup_product-ids_that_may_exists_in_related_db-tables.sql', 2093614264, 'root',
        '2021-08-18 13:54:48', 261, 1),
       (258, '6.1630322672', 'Add file original object name', 'SQL', 'V6.1630322672__Add_file_original_object_name.sql',
        837914507, 'root', '2021-08-30 11:25:24', 608, 1),
       (259, '6.1629884516', 'add combined discount', 'SQL', 'V6.1629884516__add_combined_discount.sql', 1342706800,
        'root', '2021-08-31 11:29:57', 367, 1),
       (260, '6.1629887050', 'set combined discount', 'SQL', 'V6.1629887050__set_combined_discount.sql', 1215850706,
        'root', '2021-08-31 11:29:57', 31, 1),
       (261, '6.1629887077', 'combine discounts on agreement', 'SQL',
        'V6.1629887077__combine_discounts_on_agreement.sql', 954174041, 'root', '2021-08-31 11:29:57', 66, 1),
       (262, '6.1629894147', 'Drop table ou approved scope', 'SQL', 'V6.1629894147__Drop_table_ou_approved_scope.sql',
        1141422237, 'root', '2021-10-05 07:06:29', 250, 1),
       (263, '6.1629894368', 'Drop column ou early provisioning enabled', 'SQL',
        'V6.1629894368__Drop_column_ou_early_provisioning_enabled.sql', 1786051367, 'root', '2021-10-05 07:06:37', 7907,
        1),
       (264, '6.1631275056', 'partnerportal can not remove media file from a tool', 'SQL',
        'V6.1631275056__partnerportal_can_not_remove_media_file_from_a_tool.sql', -1915317507, 'root',
        '2021-10-05 07:06:38', 1258, 1),
       (265, '6.1631517602', 'add GBP DKK currencies', 'SQL', 'V6.1631517602__add_GBP_DKK_currencies.sql', -158949724,
        'root', '2021-10-05 07:06:38', 24, 1),
       (266, '6.1632139555', 'Add redirect via skolon to app', 'SQL',
        'V6.1632139555__Add_redirect_via_skolon_to_app.sql', -1831354984, 'root', '2021-10-05 07:06:38', 156, 1),
       (267, '6.1632295509', 'Delete app in ou collections with removed ous', 'SQL',
        'V6.1632295509__Delete_app_in_ou_collections_with_removed_ous.sql', 888484509, 'root', '2021-10-05 07:06:38',
        24, 1),
       (268, '6.1632388022', 'set app version on apps that are missing it', 'SQL',
        'V6.1632388022__set_app_version_on_apps_that_are_missing_it.sql', 2129380310, 'root', '2021-10-05 07:06:41',
        2831, 1),
       (269, '6.1632837904', 'Migrate send mail template names', 'SQL',
        'V6.1632837904__Migrate_send_mail_template_names.sql', 1300237318, 'root', '2021-10-05 07:06:42', 531, 1),
       (270, '6.1632839221', 'Migrate mail chain template names', 'SQL',
        'V6.1632839221__Migrate_mail_chain_template_names.sql', 943074076, 'root', '2021-10-05 07:06:42', 25, 1),
       (271, '6.1632924449', 'Delete app connection to germany', 'SQL',
        'V6.1632924449__Delete_app_connection_to_germany.sql', -1041168155, 'root', '2021-10-05 07:06:42', 144, 1),
       (272, '6.1632993573', 'Delete public column from language table', 'SQL',
        'V6.1632993573__Delete_public_column_from_language_table.sql', -864342678, 'root', '2021-10-05 07:06:42', 131,
        1),
       (273, '6.1633005503', 'Add en-gb language', 'SQL', 'V6.1633005503__Add_en-gb_language.sql', -579775581, 'root',
        '2021-10-05 07:06:42', 11, 1),
       (274, '6.1633333289', 'Add country developer table', 'SQL', 'V6.1633333289__Add_country_developer_table.sql',
        -871578982, 'root', '2021-10-05 07:06:43', 74, 1),
       (275, '6.1633432362', 'Fix german labels', 'SQL', 'V6.1633432362__Fix_german_labels.sql', 894939842, 'root',
        '2021-10-12 11:26:34', 27, 1),
       (276, '6.1633436656', 'Add config-google-sync and config-google-sync-ou tables', 'SQL',
        'V6.1633436656__Add_config-google-sync_and_config-google-sync-ou_tables.sql', -740991998, 'root',
        '2021-10-12 11:26:34', 169, 1),
       (277, '6.1633440724', 'Add available countries table', 'SQL', 'V6.1633440724__Add_available_countries_table.sql',
        405551003, 'root', '2021-10-12 11:26:34', 45, 1),
       (278, '6.1633519574', 'Populate available countries table', 'SQL',
        'V6.1633519574__Populate_available_countries_table.sql', 354026900, 'root', '2021-10-12 11:26:35', 15, 1),
       (279, '6.1633684957', 'update user default language id', 'SQL',
        'V6.1633684957__update_user_default_language_id.sql', 2009511959, 'root', '2021-10-12 11:26:35', 311, 1),
       (280, '6.1633680919', 'update of db-table config-google-sync', 'SQL',
        'V6.1633680919__update_of_db-table_config-google-sync.sql', -367462846, 'root', '2021-10-28 12:17:49', 547, 1),
       (281, '6.1634118212', 'set valid main class id on invalid users', 'SQL',
        'V6.1634118212__set_valid_main_class_id_on_invalid_users.sql', -494691140, 'root', '2021-10-28 12:17:53', 3650,
        1),
       (282, '6.1634119142', 'alter app lang language id', 'SQL', 'V6.1634119142__alter_app_lang_language_id.sql',
        2125399473, 'root', '2021-10-28 12:17:53', 64, 1),
       (283, '6.1634127650', 'add data sharing to app', 'SQL', 'V6.1634127650__add_data_sharing_to_app.sql', 2081772388,
        'root', '2021-10-28 12:17:54', 772, 1),
       (284, '6.1634197794', 'reset product lang and product price', 'SQL',
        'V6.1634197794__reset_product_lang_and_product_price.sql', 1408799698, 'root', '2021-10-28 12:17:54', 94, 1),
       (285, '6.1635255088', 'Alter language id column to hold longer values', 'SQL',
        'V6.1635255088__Alter_language_id_column_to_hold_longer_values.sql', 1611792886, 'root', '2021-10-28 12:17:54',
        113, 1),
       (286, '6.1634115582', 'Add simulation logic to skolon-google-sync and skolon-db', 'SQL',
        'V6.1634115582__Add_simulation_logic_to_skolon-google-sync_and_skolon-db.sql', 1405018254, 'root',
        '2021-11-01 09:27:25', 259, 1),
       (287, '6.1635239949', 'add \'is logging\' column to table \'config google sync\'', 'SQL',
        'V6.1635239949__add_\'is_logging\'_column_to_table_\'config_google_sync\'.sql', -1093286769, 'root',
        '2021-11-01 09:27:25', 69, 1),
       (288, '6.1635758541', 'Add developer default country and language', 'SQL',
        'V6.1635758541__Add_developer_default_country_and_language.sql', -1148211993, 'root', '2021-11-01 12:49:36',
        600, 1),
       (289, '6.1635839775', 'Add unique constraint to official school code', 'SQL',
        'V6.1635839775__Add_unique_constraint_to_official_school_code.sql', 294951422, 'root', '2021-11-04 13:44:51',
        308, 1),
       (290, '6.1635840233', 'Add deleted flag to app version', 'SQL',
        'V6.1635840233__Add_deleted_flag_to_app_version.sql', -2141823666, 'root', '2021-11-04 13:44:52', 988, 1),
       (291, '6.1635942818', 'update table config google sync with two new columns', 'SQL',
        'V6.1635942818__update_table_config_google_sync_with_two_new_columns.sql', -2096123959, 'root',
        '2021-11-11 10:09:57', 103, 1),
       (292, '6.1636625283', 'Consider app version deleted in procedures', 'SQL',
        'V6.1636625283__Consider_app_version_deleted_in_procedures.sql', 1509330626, 'root', '2021-11-11 10:26:27', 199,
        1),
       (293, '6.1636557057', 'Add school type and school year', 'SQL',
        'V6.1636557057__Add_school_type_and_school_year.sql', -1796082289, 'root', '2021-11-18 08:21:25', 15592, 1),
       (294, '6.1637223596', 'Extend partner api entity change index', 'SQL',
        'V6.1637223596__Extend_partner_api_entity_change_index.sql', 521152153, 'root', '2021-11-18 08:21:26', 1003, 1),
       (295, '6.1637655880', 'Set missing subscription original order item id', 'SQL',
        'V6.1637655880__Set_missing_subscription_original_order_item_id.sql', 1561888076, 'root', '2021-11-23 08:25:51',
        51, 1),
       (296, '6.1638179862', 'Add app category public id', 'SQL', 'V6.1638179862__Add_app_category_public_id.sql',
        -1878116116, 'root', '2021-11-29 10:04:33', 563, 1),
       (297, '6.1638179922', 'Set app category public id', 'SQL', 'V6.1638179922__Set_app_category_public_id.sql',
        -1641531250, 'root', '2021-11-29 10:04:33', 84, 1),
       (298, '6.1637851241', 'Add public data agreement status', 'SQL',
        'V6.1637851241__Add_public_data_agreement_status.sql', -1423495654, 'root', '2021-11-29 12:15:42', 3247, 1),
       (299, '6.1637851479', 'Set public data agreement status', 'SQL',
        'V6.1637851479__Set_public_data_agreement_status.sql', 983769329, 'root', '2021-11-29 12:15:42', 115, 1),
       (300, '6.1638188063', 'Set license group is demo null to 0', 'SQL',
        'V6.1638188063__Set_license_group_is_demo_null_to_0.sql', -1709093796, 'root', '2021-11-29 12:18:31', 455, 1),
       (301, '6.1638188290', 'Alter license group is demo to not null', 'SQL',
        'V6.1638188290__Alter_license_group_is_demo_to_not_null.sql', 56157258, 'root', '2021-11-29 12:18:35', 3979, 1),
       (302, '6.1638179702', 'add gb subjects', 'SQL', 'V6.1638179702__add_gb_subjects.sql', -310548987, 'root',
        '2021-12-02 10:09:15', 36, 1),
       (303, '6.1638187767', 'Add english subject categories', 'SQL',
        'V6.1638187767__Add_english_subject_categories.sql', -671995536, 'root', '2021-12-02 10:09:16', 263, 1),
       (304, '6.1638198087', 'add-uk-age-groups', 'SQL', 'V6.1638198087__add-uk-age-groups.sql', 567954671, 'root',
        '2021-12-02 10:09:16', 12, 1),
       (305, '6.1638439568', 'Add developer estimated scopes', 'SQL',
        'V6.1638439568__Add_developer_estimated_scopes.sql', 274893750, 'root', '2021-12-02 10:09:16', 112, 1),
       (306, '6.1638371676', 'Add data hosting status to developer', 'SQL',
        'V6.1638371676__Add_data_hosting_status_to_developer.sql', -624768615, 'root', '2022-01-05 09:34:54', 378, 1),
       (307, '6.1638882311', 'Add english age groups', 'SQL', 'V6.1638882311__Add_english_age_groups.sql', -655295253,
        'root', '2022-01-05 09:34:54', 18, 1),
       (308, '6.1638885948', 'add country to official school code', 'SQL',
        'V6.1638885948__add_country_to_official_school_code.sql', 1326511782, 'root', '2022-01-05 09:34:54', 73, 1),
       (309, '6.1638887457', 'remove temporary default country in official school code', 'SQL',
        'V6.1638887457__remove_temporary_default_country_in_official_school_code.sql', 889363496, 'root',
        '2022-01-05 09:34:54', 28, 1),
       (310, '6.1638951343', 'Add special education subject', 'SQL', 'V6.1638951343__Add_special_education_subject.sql',
        1884221799, 'root', '2022-01-05 09:34:54', 24, 1),
       (311, '6.1639582608', 'add new columns to ‘external app subscription table’', 'SQL',
        'V6.1639582608__add_new_columns_to_‘external_app_subscription_table’.sql', 225071606, 'root',
        '2022-01-05 09:34:54', 67, 1),
       (312, '6.1639583547', 'Add values to column ‘license target’ in table ‘external app subscription’', 'SQL',
        'V6.1639583547__Add_values_to_column_‘license_target’_in_table_‘external_app_subscription’.sql', 777670193,
        'root', '2022-01-05 09:34:54', 18, 1),
       (313, '6.1640004347', 'Remove-uk-age-groups', 'SQL', 'V6.1640004347__Remove-uk-age-groups.sql', 1362183426,
        'root', '2022-01-12 09:43:21', 25, 1),
       (314, '6.1641283921', 'Add bokbasen config table', 'SQL', 'V6.1641283921__Add_bokbasen_config_table.sql',
        426648998, 'root', '2022-01-12 09:43:21', 146, 1),
       (315, '6.1641542665', 'Add ou developer settings', 'SQL', 'V6.1641542665__Add_ou_developer_settings.sql',
        -1802137126, 'root', '2022-01-12 09:43:21', 263, 1),
       (316, '6.1642067646', 'rename ou developer settings', 'SQL', 'V6.1642067646__rename_ou_developer_settings.sql',
        1188446012, 'root', '2022-01-14 13:01:57', 134, 1),
       (317, '6.1641374863', 'update user table with pseudo columns', 'SQL',
        'V6.1641374863__update_user_table_with_pseudo_columns.sql', -268214508, 'root', '2022-01-24 08:13:48', 1739, 1),
       (318, '6.1641374979', 'update ou table with pseudo column', 'SQL',
        'V6.1641374979__update_ou_table_with_pseudo_column.sql', 977368333, 'root', '2022-01-24 08:13:49', 745, 1),
       (319, '6.1642448403', 'add index for license group', 'SQL', 'V6.1642448403__add_index_for_license_group.sql',
        -451553101, 'root', '2022-01-24 08:13:49', 853, 1),
       (320, '6.1643121907', 'Add allowed developer to ou developer setting', 'SQL',
        'V6.1643121907__Add_allowed_developer_to_ou_developer_setting.sql', 843984759, 'root', '2022-01-28 09:58:02',
        72, 1),
       (321, '6.1643193192', 'Add restrict developers flag to ou', 'SQL',
        'V6.1643193192__Add_restrict_developers_flag_to_ou.sql', -546654037, 'root', '2022-01-28 09:58:03', 1223, 1),
       (322, '6.1643193388', 'Set restrict developers on ous', 'SQL',
        'V6.1643193388__Set_restrict_developers_on_ous.sql', -1512918724, 'root', '2022-01-28 09:58:03', 83, 1),
       (323, '6.1643882732', 'Add external identity provider id table', 'SQL',
        'V6.1643882732__Add_external_identity_provider_id_table.sql', -2077647733, 'root', '2022-02-03 10:59:26', 57,
        1),
       (324, '6.1643830203', 'license group idx', 'SQL', 'V6.1643830203__license_group_idx.sql', 23484777, 'root',
        '2022-02-08 09:18:37', 461, 1),
       (325, '6.1644311821', 'Remove invalid order item subscription ids', 'SQL',
        'V6.1644311821__Remove_invalid_order_item_subscription_ids.sql', 1146480561, 'root', '2022-02-08 09:18:37', 33,
        1),
       (326, '6.1644311868', 'Add order item subscription id foreign key', 'SQL',
        'V6.1644311868__Add_order_item_subscription_id_foreign_key.sql', 644135050, 'root', '2022-02-08 09:18:38', 404,
        1),
       (327, '6.1645171469', 'Insert new age groups', 'SQL', 'V6.1645171469__Insert_new_age_groups.sql', -1597281392,
        'root', '2022-03-17 08:34:31', 22, 1),
       (328, '6.1645632434', 'Add only have sing licenses to bokbasen config', 'SQL',
        'V6.1645632434__Add_only_have_sing_licenses_to_bokbasen_config.sql', -2111254049, 'root', '2022-03-17 08:34:32',
        56, 1),
       (329, '6.1646122886', 'add index to change log table', 'SQL', 'V6.1646122886__add_index_to_change_log_table.sql',
        437605201, 'root', '2022-03-17 08:34:32', 93, 1),
       (330, '6.1646145809', 'Add file id to personal data processing agreement', 'SQL',
        'V6.1646145809__Add_file_id_to_personal_data_processing_agreement.sql', -1545250455, 'root',
        '2022-03-17 08:34:32', 176, 1),
       (331, '6.1646843072', 'Add discount ladders', 'SQL', 'V6.1646843072__Add_discount_ladders.sql', 1639761043,
        'root', '2022-03-17 08:34:32', 50, 1),
       (332, '6.1646915427', 'Add discount ladder step', 'SQL', 'V6.1646915427__Add_discount_ladder_step.sql',
        -742480404, 'root', '2022-03-17 08:34:32', 49, 1),
       (333, '6.1646921302', 'Create association table discount-ladder-app', 'SQL',
        'V6.1646921302__Create_association_table_discount-ladder-app.sql', 2045035314, 'root', '2022-03-17 08:34:32',
        56, 1),
       (334, '6.1647336747', 'add-integration fks', 'SQL', 'V6.1647336747__add-integration_fks.sql', 1387052226, 'root',
        '2022-03-17 08:34:32', 157, 1),
       (335, '6.1647348204', 'Add creation time external identity provider id', 'SQL',
        'V6.1647348204__Add_creation_time_external_identity_provider_id.sql', 781321108, 'root', '2022-03-17 08:34:32',
        39, 1),
       (336, '6.1647349587', 'Add update time to license group', 'SQL',
        'V6.1647349587__Add_update_time_to_license_group.sql', 1068246779, 'root', '2022-03-17 08:34:33', 300, 1),
       (338, '6.1647444778', 'Remove widgets', 'SQL', 'V6.1647444778__Remove_widgets.sql', -975201086, 'root',
        '2022-03-18 09:05:58', 59, 1),
       (339, '6.1647594000', 'Create widget table', 'SQL', 'V6.1647594000__Create_widget_table.sql', 567822614, 'root',
        '2022-03-18 12:48:42', 69, 1),
       (340, '6.1647607107', 'Create widget size table', 'SQL', 'V6.1647607107__Create_widget_size_table.sql',
        314329620, 'root', '2022-03-18 12:48:42', 48, 1),
       (341, '6.1647851851', 'Create collection widget table', 'SQL',
        'V6.1647851851__Create_collection_widget_table.sql', -960387337, 'root', '2022-03-21 08:41:00', 240, 1),
       (342, '6.1647852804', 'Create widget config table', 'SQL', 'V6.1647852804__Create_widget_config_table.sql',
        -409375679, 'root', '2022-03-21 08:55:41', 82, 1),
       (343, '6.1647247186', 'Create discount-ladder-code db-table', 'SQL',
        'V6.1647247186__Create_discount-ladder-code_db-table.sql', -2013470529, 'root', '2022-04-07 07:22:51', 125, 1),
       (344, '6.1647423188', 'Add assignment changed to license group', 'SQL',
        'V6.1647423188__Add_assignment_changed_to_license_group.sql', 292749780, 'root', '2022-04-07 07:22:51', 392, 1),
       (345, '6.1647435841', 'create discount-ladder-assignee db-table', 'SQL',
        'V6.1647435841__create_discount-ladder-assignee_db-table.sql', 1448530187, 'root', '2022-04-07 07:22:52', 191,
        1),
       (346, '6.1647506037', 'Remove widgets', 'SQL', 'V6.1647506037__Remove_widgets.sql', 204833124, 'root',
        '2022-04-07 07:22:52', 133, 1),
       (347, '6.1647960518', 'Add activation codes to id counter', 'SQL',
        'V6.1647960518__Add_activation_codes_to_id_counter.sql', -660598183, 'root', '2022-04-07 07:24:10', 76, 1),
       (348, '6.1648038081', 'remove org not null on official school code', 'SQL',
        'V6.1648038081__remove_org_not_null_on_official_school_code.sql', 1573845241, 'root', '2022-04-07 07:24:11',
        1014, 1),
       (349, '6.1648193321', 'add is editable flag to license group', 'SQL',
        'V6.1648193321__add_is_editable_flag_to_license_group.sql', 1497280050, 'root', '2022-04-07 07:24:17', 5679, 1),
       (350, '6.1649316041', 'Create whitelabel config table', 'SQL',
        'V6.1649316041__Create_whitelabel_config_table.sql', -1717361598, 'root', '2022-04-07 07:24:48', 109, 1),
       (351, '6.1649317598', 'Fix invalid ou municipality names', 'SQL',
        'V6.1649317598__Fix_invalid_ou_municipality_names.sql', 2018220308, 'root', '2022-04-07 08:19:46', 415, 1),
       (352, '6.1649319359', 'Add ou whitelabel config', 'SQL', 'V6.1649319359__Add_ou_whitelabel_config.sql',
        -1413062705, 'root', '2022-04-07 08:19:55', 8745, 1),
       (353, '6.1648795693', 'add deleted column to discount ladder', 'SQL',
        'V6.1648795693__add_deleted_column_to_discount_ladder.sql', -54838290, 'root', '2022-04-13 08:11:18', 274, 1),
       (354, '6.1649403397', 'refactor discount-ladder-code and discount-ladder-assignee db-tables', 'SQL',
        'V6.1649403397__refactor_discount-ladder-code_and_discount-ladder-assignee_db-tables.sql', -1765959925, 'root',
        '2022-04-13 08:11:19', 541, 1),
       (355, '6.1649938511', 'Create app format table', 'SQL', 'V6.1649938511__Create_app_format_table.sql', 1695890463,
        'root', '2022-04-26 07:36:32', 124, 1),
       (356, '6.1649941850', 'Add additional age groups', 'SQL', 'V6.1649941850__Add_additional_age_groups.sql',
        -1199343642, 'root', '2022-04-26 07:36:32', 16, 1),
       (357, '6.1649942244', 'Add app accessibility table', 'SQL', 'V6.1649942244__Add_app_accessibility_table.sql',
        -1618501384, 'root', '2022-04-26 07:36:32', 60, 1),
       (358, '6.1650880317', 'add-app-has-app-format-table', 'SQL', 'V6.1650880317__add-app-has-app-format-table.sql',
        1380063310, 'root', '2022-04-26 07:36:32', 85, 1),
       (359, '6.1650961630', 'Add app platform code', 'SQL', 'V6.1650961630__Add_app_platform_code.sql', -739801052,
        'root', '2022-04-26 08:34:58', 99, 1),
       (360, '6.1650879017', 'Add accessibility attribute to app', 'SQL',
        'V6.1650879017__Add_accessibility_attribute_to_app.sql', -802502791, 'root', '2022-04-27 08:31:01', 530, 1),
       (361, '6.1651048032', 'Make app format code unique', 'SQL', 'V6.1651048032__Make_app_format_code_unique.sql',
        1875929710, 'root', '2022-04-27 08:31:01', 56, 1),
       (362, '6.1651048181', 'Add required app formats', 'SQL', 'V6.1651048181__Add_required_app_formats.sql',
        361034878, 'root', '2022-04-27 08:31:01', 46, 1),
       (363, '6.1651148073', 'Add whitelabel config brand color', 'SQL',
        'V6.1651148073__Add_whitelabel_config_brand_color.sql', 183176497, 'root', '2022-04-28 13:01:52', 225, 1),
       (364, '6.1651150807', 'Remove whitelabel config brand color default', 'SQL',
        'V6.1651150807__Remove_whitelabel_config_brand_color_default.sql', -1923352243, 'root', '2022-04-28 13:01:52',
        38, 1),
       (365, '6.1651048452', 'Set formats for backwards compatible apps', 'SQL',
        'V6.1651048452__Set_formats_for_backwards_compatible_apps.sql', -2001020616, 'root', '2022-05-03 06:51:22', 67,
        1),
       (366, '6.1651049689', 'add-app-accessibility-levels', 'SQL', 'V6.1651049689__add-app-accessibility-levels.sql',
        -1354968610, 'root', '2022-05-03 06:51:22', 31, 1),
       (367, '6.1651560505', 'Add api lock to app has age group', 'SQL',
        'V6.1651560505__Add_api_lock_to_app_has_age_group.sql', 1533717322, 'root', '2022-05-03 06:51:22', 97, 1),
       (368, '6.1651560650', 'Add api lock to app subject', 'SQL', 'V6.1651560650__Add_api_lock_to_app_subject.sql',
        1946074141, 'root', '2022-05-03 06:51:23', 60, 1),
       (369, '6.1649401475', 'add discount ladder id to order items', 'SQL',
        'V6.1649401475__add_discount_ladder_id_to_order_items.sql', 207169724, 'root', '2022-05-09 08:33:17', 1616, 1),
       (370, '6.1649751898', 'Add discount to subscription', 'SQL', 'V6.1649751898__Add_discount_to_subscription.sql',
        -1481054935, 'root', '2022-05-09 08:33:18', 470, 1),
       (371, '6.1650447210', 'clean-up wrong group name set main-class-id to null', 'SQL',
        'V6.1650447210__clean-up_wrong_group_name_set_main-class-id_to_null.sql', -1992936322, 'root',
        '2022-05-09 08:33:19', 554, 1),
       (372, '6.1651739120', 'Insert parent ous into parnter api change', 'SQL',
        'V6.1651739120__Insert_parent_ous_into_parnter_api_change.sql', -648569310, 'root', '2022-05-09 08:33:19', 593,
        1),
       (373, '6.1651754771', 'Add organization changed to api notification', 'SQL',
        'V6.1651754771__Add_organization_changed_to_api_notification.sql', 586492327, 'root', '2022-05-09 08:33:19',
        125, 1),
       (374, '6.1652085079', 'Create whitelabel login table', 'SQL', 'V6.1652085079__Create_whitelabel_login_table.sql',
        -859299210, 'root', '2022-05-09 08:42:04', 96, 1),
       (375, '6.1651562321', 'Add imported license table', 'SQL', 'V6.1651562321__Add_imported_license_table.sql',
        -81251507, 'root', '2022-05-13 09:02:17', 152, 1),
       (376, '6.1651562658', 'Add imported license groups table', 'SQL',
        'V6.1651562658__Add_imported_license_groups_table.sql', -730582808, 'root', '2022-05-13 09:02:17', 105, 1),
       (377, '6.1651562736', 'Add latest license import table', 'SQL',
        'V6.1651562736__Add_latest_license_import_table.sql', 487806583, 'root', '2022-05-13 09:02:17', 74, 1),
       (378, '6.1651563829', 'Add gyldendal schools table', 'SQL', 'V6.1651563829__Add_gyldendal_schools_table.sql',
        -1310311461, 'root', '2022-05-13 09:02:17', 82, 1),
       (379, '6.1652355387', 'Add gyldendal imported license groups has unhandled assignment change', 'SQL',
        'V6.1652355387__Add_gyldendal_imported_license_groups_has_unhandled_assignment_change.sql', -875303772, 'root',
        '2022-05-13 09:02:18', 137, 1),
       (380, '6.1652965738', 'Add order quote customer message', 'SQL',
        'V6.1652965738__Add_order_quote_customer_message.sql', -555404230, 'root', '2022-05-31 13:32:38', 113, 1),
       (381, '6.1652970154', 'add default country to bokbasen config', 'SQL',
        'V6.1652970154__add_default_country_to_bokbasen_config.sql', -1691410190, 'root', '2022-05-31 13:32:38', 46, 1),
       (382, '6.1653385128', 'Add logout url to whitelabel config', 'SQL',
        'V6.1653385128__Add_logout_url_to_whitelabel_config.sql', -1033169912, 'root', '2022-05-31 13:32:39', 112, 1),
       (383, '6.1654091595', 'add two columns to user table ssn and ssn country code', 'SQL',
        'V6.1654091595__add_two_columns_to_user_table_ssn_and_ssn_country_code.sql', 1884037826, 'root',
        '2022-06-03 12:03:06', 14920, 1),
       (384, '6.1654247389', 'Drop unused stored procedures', 'SQL', 'V6.1654247389__Drop_unused_stored_procedures.sql',
        -1925080218, 'root', '2022-06-17 09:55:43', 904, 1),
       (385, '6.1654255441', 'Add school id uuid index to official school code', 'SQL',
        'V6.1654255441__Add_school_id_uuid_index_to_official_school_code.sql', -1014321698, 'root',
        '2022-06-17 09:55:44', 515, 1),
       (386, '6.1654255500', 'Add deleted type uuid index to ou', 'SQL',
        'V6.1654255500__Add_deleted_type_uuid_index_to_ou.sql', 562339257, 'root', '2022-06-17 09:55:47', 2996, 1),
       (387, '6.1654588999', 'Add application access can delete flag', 'SQL',
        'V6.1654588999__Add_application_access_can_delete_flag.sql', 1597427912, 'root', '2022-06-17 09:55:47', 135, 1),
       (388, '6.1654851864', 'Add external store to ou', 'SQL', 'V6.1654851864__Add_external_store_to_ou.sql',
        820442464, 'root', '2022-06-17 09:55:48', 522, 1),
       (389, '6.1654855735', 'Set existing schools external school attr', 'SQL',
        'V6.1654855735__Set_existing_schools_external_school_attr.sql', -1105929469, 'root', '2022-06-17 09:55:49', 810,
        1),
       (390, '6.1655459584', 'Change external store to organizations', 'SQL',
        'V6.1655459584__Change_external_store_to_organizations.sql', -1731699082, 'root', '2022-06-17 09:55:49', 621,
        1),
       (391, '6.1655730235', 'Add order item delivered externally', 'SQL',
        'V6.1655730235__Add_order_item_delivered_externally.sql', -388893348, 'root', '2022-06-20 13:05:25', 299, 1),
       (392, '6.1655730283', 'Set delivered externally for existing order items', 'SQL',
        'V6.1655730283__Set_delivered_externally_for_existing_order_items.sql', 1620776746, 'root',
        '2022-06-22 11:06:36', 1291, 1),
       (393, '6.1655735069', 'add 3 new columns to discount-agreement table', 'SQL',
        'V6.1655735069__add_3_new_columns_to_discount-agreement_table.sql', -917832400, 'root', '2022-06-22 11:06:36',
        212, 1),
       (394, '6.1655895826', 'Add external app subscription product id and article number', 'SQL',
        'V6.1655895826__Add_external_app_subscription_product_id_and_article_number.sql', 736860477, 'root',
        '2022-06-22 11:06:36', 173, 1),
       (395, '6.1655898422', 'Add order item article number', 'SQL', 'V6.1655898422__Add_order_item_article_number.sql',
        -1576074587, 'root', '2022-06-22 13:56:14', 213, 1),
       (396, '6.1655906184', 'Set order item article number', 'SQL', 'V6.1655906184__Set_order_item_article_number.sql',
        1204879881, 'root', '2022-06-22 13:56:59', 192, 1),
       (397, '6.1577103960', 'Create order quote', 'SQL', 'V6.1577103960__Create_order_quote.sql', 440156609, 'root',
        '2022-06-23 14:21:51', 53, 1),
       (398, '6.1654847128', 'add last distribution started to license pool', 'SQL',
        'V6.1654847128__add_last_distribution_started_to_license_pool.sql', 212204284, 'root', '2022-06-23 14:21:51',
        248, 1),
       (399, '6.1654848160', 'initiate last distribution started', 'SQL',
        'V6.1654848160__initiate_last_distribution_started.sql', -2028439626, 'root', '2022-06-23 14:21:51', 36, 1),
       (400, '6.1655454860', 'update short-description in app-lang table', 'SQL',
        'V6.1655454860__update_short-description_in_app-lang_table.sql', -674308115, 'root', '2022-06-23 14:21:51', 74,
        1),
       (401, '6.1655823152', 'change customer country id length', 'SQL',
        'V6.1655823152__change_customer_country_id_length.sql', 1642888411, 'root', '2022-06-23 14:21:52', 352, 1),
       (402, '6.1655890140', 'adding column punch-out to ou-table', 'SQL',
        'V6.1655890140__adding_column_punch-out_to_ou-table.sql', 820393158, 'root', '2022-06-23 14:21:53', 933, 1),
       (403, '6.1655890191', 'update ou-table content punch-out to 0 on organizations', 'SQL',
        'V6.1655890191__update_ou-table_content_punch-out_to_0_on_organizations.sql', 845057738, 'root',
        '2022-06-23 14:21:53', 203, 1),
       (404, '6.1655990912', 'Add num users to order quote item', 'SQL',
        'V6.1655990912__Add_num_users_to_order_quote_item.sql', 1965342828, 'root', '2022-06-27 11:39:29', 96, 1),
       (405, '6.1656322279', 'Add order delivery email', 'SQL', 'V6.1656322279__Add_order_delivery_email.sql',
        676828515, 'root', '2022-06-27 11:39:30', 125, 1),
       (406, '6.1656409264', 'create shopcart table', 'SQL', 'V6.1656409264__create_shopcart_table.sql', 346332550,
        'root', '2022-06-28 14:43:52', 285, 1),
       (407, '6.1656409303', 'create shopcart-item table', 'SQL', 'V6.1656409303__create_shopcart-item_table.sql',
        -1460458876, 'root', '2022-06-28 14:43:52', 221, 1),
       (408, '6.1656409345', 'create shopcart-discount-code table', 'SQL',
        'V6.1656409345__create_shopcart-discount-code_table.sql', 1341552939, 'root', '2022-06-28 14:43:52', 115, 1),
       (409, '6.1656424964', 'Add ou contract reference', 'SQL', 'V6.1656424964__Add_ou_contract_reference.sql',
        -100593586, 'root', '2022-06-28 14:43:53', 954, 1),
       (410, '6.1656315386', 'Set discounts on active subscriptions', 'SQL',
        'V6.1656315386__Set_discounts_on_active_subscriptions.sql', 299372444, 'root', '2022-07-06 14:35:46', 216, 1),
       (411, '6.1657118056', 'Add order shop cart id', 'SQL', 'V6.1657118056__Add_order_shop_cart_id.sql', 1363531197,
        'root', '2022-07-07 09:53:20', 536, 1),
       (412, '6.1657278852', 'Add ou punchout gln', 'SQL', 'V6.1657278852__Add_ou_punchout_gln.sql', 684433770, 'root',
        '2022-07-08 11:56:35', 1071, 1),
       (413, '6.1657622642', 'Add hide library banner to ou', 'SQL', 'V6.1657622642__Add_hide_library_banner_to_ou.sql',
        -390144090, 'root', '2022-08-03 10:44:07', 1529, 1),
       (414, '6.1657623019', 'Set external store on ou', 'SQL', 'V6.1657623019__Set_external_store_on_ou.sql',
        -1188264361, 'root', '2022-08-03 10:44:08', 93, 1),
       (415, '6.1659519353', 'Rename Swedish särskola', 'SQL', 'V6.1659519353__Rename_Swedish_särskola.sql', 712313422,
        'root', '2022-08-03 10:44:08', 84, 1),
       (416, '6.1659535794', 'Add whitelabel config favicon id', 'SQL',
        'V6.1659535794__Add_whitelabel_config_favicon_id.sql', -284050688, 'root', '2022-08-03 14:11:27', 474, 1),
       (417, '6.1660028553', 'Add whitelabel login favicon', 'SQL', 'V6.1660028553__Add_whitelabel_login_favicon.sql',
        2030544657, 'root', '2022-08-09 07:04:23', 272, 1),
       (418, '6.1660915499', 'Add partner api entity change index', 'SQL',
        'V6.1660915499__Add_partner_api_entity_change_index.sql', 2061583019, 'root', '2022-08-19 13:25:51', 1826, 1),
       (419, '6.1661158254', 'Add partner api notification order changed', 'SQL',
        'V6.1661158254__Add_partner_api_notification_order_changed.sql', 951557670, 'root', '2022-08-22 08:53:06', 38,
        1),
       (420, '6.1659964929', 'Add in stock required to bokbasen config', 'SQL',
        'V6.1659964929__Add_in_stock_required_to_bokbasen_config.sql', 1855573921, 'root', '2022-08-25 07:26:16', 99,
        1),
       (421, '6.1660210713', 'Drop some unused tables', 'SQL', 'V6.1660210713__Drop_some_unused_tables.sql', 1060922708,
        'root', '2022-08-25 07:26:16', 213, 1),
       (422, '6.1660303610', 'Extend customer message columns', 'SQL',
        'V6.1660303610__Extend_customer_message_columns.sql', -1395002104, 'root', '2022-08-25 07:26:17', 190, 1),
       (423, '6.1660549040', 'Add delivery email to order quote', 'SQL',
        'V6.1660549040__Add_delivery_email_to_order_quote.sql', 888475101, 'root', '2022-08-25 07:26:17', 98, 1),
       (424, '6.1660656146', 'Add delivery date to order', 'SQL', 'V6.1660656146__Add_delivery_date_to_order.sql',
        39016897, 'root', '2022-08-25 07:26:17', 100, 1),
       (425, '6.1660737076', 'Add mail type table', 'SQL', 'V6.1660737076__Add_mail_type_table.sql', 2131836151, 'root',
        '2022-08-25 07:26:17', 61, 1),
       (426, '6.1660737937', 'Create mail template table', 'SQL', 'V6.1660737937__Create_mail_template_table.sql',
        -1066370337, 'root', '2022-08-25 07:26:17', 59, 1),
       (427, '6.1660810991', 'populate mail type table', 'SQL', 'V6.1660810991__populate_mail_type_table.sql',
        -834312586, 'root', '2022-08-25 07:26:17', 21, 1),
       (428, '6.1660815460', 'Populate mail template table', 'SQL', 'V6.1660815460__Populate_mail_template_table.sql',
        1445780374, 'root', '2022-08-25 07:26:18', 167, 1),
       (429, '6.1661235257', 'add ipd log index', 'SQL', 'V6.1661235257__add_ipd_log_index.sql', -1551876951, 'root',
        '2022-08-25 07:26:18', 56, 1),
       (430, '6.1661410766', 'Add existing orders to partner api entity change', 'SQL',
        'V6.1661410766__Add_existing_orders_to_partner_api_entity_change.sql', 143688995, 'root', '2022-08-25 07:27:08',
        301, 1),
       (431, '6.1661432697', 'Add order item product ext id app exit id and app article number', 'SQL',
        'V6.1661432697__Add_order_item_product_ext_id_app_exit_id_and_app_article_number.sql', -1621163835, 'root',
        '2022-08-25 13:36:32', 153, 1),
       (432, '6.1661432850', 'Add order buyer unit code table', 'SQL',
        'V6.1661432850__Add_order_buyer_unit_code_table.sql', 481443475, 'root', '2022-08-26 07:37:27', 150, 1),
       (433, '6.1661170133', 'Add additional mail types', 'SQL', 'V6.1661170133__Add_additional_mail_types.sql',
        -1643407447, 'root', '2022-08-26 11:14:57', 48, 1),
       (434, '6.1661170134', 'Add international mail templates', 'SQL',
        'V6.1661170134__Add_international_mail_templates.sql', -1139533096, 'root', '2022-08-26 11:14:57', 168, 1),
       (435, '6.1661506384', 'Set external app subscription app version id and product id', 'SQL',
        'V6.1661506384__Set_external_app_subscription_app_version_id_and_product_id.sql', 1749783832, 'root',
        '2022-08-26 11:46:33', 50, 1),
       (436, '6.1661514559', 'Add missing order item.app version id', 'SQL',
        'V6.1661514559__Add_missing_order_item.app_version_id.sql', 1700443396, 'root', '2022-08-26 11:51:22', 103, 1),
       (437, '6.1661514762', 'Set product id on subscriptions and their renewal orders', 'SQL',
        'V6.1661514762__Set_product_id_on_subscriptions_and_their_renewal_orders.sql', -38011816, 'root',
        '2022-09-05 11:20:41', 659, 1),
       (438, '6.1661516914', 'Set order item app ext id and app article number', 'SQL',
        'V6.1661516914__Set_order_item_app_ext_id_and_app_article_number.sql', 823007756, 'root', '2022-09-05 11:20:42',
        697, 1),
       (439, '6.1661518135', 'Backfill order buyer unit code', 'SQL',
        'V6.1661518135__Backfill_order_buyer_unit_code.sql', 1182296433, 'root', '2022-09-05 11:20:42', 393, 1),
       (440, '6.1661946737', 'backfill partner api entity changed', 'SQL',
        'V6.1661946737__backfill_partner_api_entity_changed.sql', -1844520870, 'root', '2022-09-05 11:20:43', 344, 1),
       (441, '6.1662031604', 'backfill-order-item-ext-ids', 'SQL', 'V6.1662031604__backfill-order-item-ext-ids.sql',
        -1612130698, 'root', '2022-09-05 11:20:43', 224, 1),
       (442, '6.1662449997', 'Visma company', 'SQL', 'V6.1662449997__Visma_company.sql', 1820145985, 'root',
        '2022-09-06 07:43:05', 372, 1),
       (443, '6.1662540903', 'Set missing order vat rate', 'SQL', 'V6.1662540903__Set_missing_order_vat_rate.sql',
        1925013607, 'root', '2022-09-07 11:13:59', 230, 1),
       (444, '6.1662358248', 'Add vat table', 'SQL', 'V6.1662358248__Add_vat_table.sql', 1454596097, 'root',
        '2022-09-14 09:37:51', 46, 1),
       (445, '6.1662358904', 'Add existing vat rates', 'SQL', 'V6.1662358904__Add_existing_vat_rates.sql', -663321813,
        'root', '2022-09-14 09:37:51', 9, 1),
       (446, '6.1663073611', 'Update charset and collation', 'SQL', 'V6.1663073611__Update_charset_and_collation.sql',
        -1902067507, 'root', '2022-09-14 09:39:28', 97095, 1),
       (447, '6.1663073899', 'Update charset and collation for stored procedures', 'SQL',
        'V6.1663073899__Update_charset_and_collation_for_stored_procedures.sql', -1047111282, 'root',
        '2022-09-14 09:39:29', 389, 1),
       (448, '6.1662647714', 'Add delivery email to subscription', 'SQL',
        'V6.1662647714__Add_delivery_email_to_subscription.sql', -1330968719, 'root', '2022-09-14 09:40:08', 379, 1),
       (449, '6.1662973901', 'Migrate existing subscription delivery emails', 'SQL',
        'V6.1662973901__Migrate_existing_subscription_delivery_emails.sql', -2110804900, 'root', '2022-09-14 09:40:08',
        71, 1),
       (450, '6.1663232929', 'event mail index', 'SQL', 'V6.1663232929__event_mail_index.sql', -1121213750, 'root',
        '2022-09-15 09:11:15', 215, 1),
       (451, '6.1662721429', 'add-renewal-orders-to-parnter-api-entity-change', 'SQL',
        'V6.1662721429__add-renewal-orders-to-parnter-api-entity-change.sql', 127628415, 'root', '2022-09-16 14:12:09',
        315, 1),
       (452, '6.1663253259', 'License license group id assigned user index', 'SQL',
        'V6.1663253259__License_license_group_id_assigned_user_index.sql', 634831477, 'root', '2022-09-16 14:12:10',
        1527, 1),
       (453, '6.1663572429', 'Add subscription partner discount and combined discount', 'SQL',
        'V6.1663572429__Add_subscription_partner_discount_and_combined_discount.sql', 1996491, 'root',
        '2022-09-19 11:58:08', 198, 1),
       (454, '6.1663587798', 'Set subscription discount partner discount and combined discount', 'SQL',
        'V6.1663587798__Set_subscription_discount_partner_discount_and_combined_discount.sql', -1401991661, 'root',
        '2022-09-19 11:59:01', 36, 1),
       (455, '6.1663589797', 'Set store subscriptions discount type', 'SQL',
        'V6.1663589797__Set_store_subscriptions_discount_type.sql', 1717494745, 'root', '2022-09-19 12:49:40', 40, 1),
       (456, '6.1663156519', 'add user creation time idx to activity log', 'SQL',
        'V6.1663156519__add_user_creation_time_idx_to_activity_log.sql', -1451778138, 'root', '2022-09-21 09:26:12',
        275, 1),
       (457, '6.1663589348', 'refresh token idx in applicaiton session', 'SQL',
        'V6.1663589348__refresh_token_idx_in_applicaiton_session.sql', -473507842, 'root', '2022-09-21 09:26:12', 581,
        1),
       (458, '6.1663751710', 'Create developer support url table', 'SQL',
        'V6.1663751710__Create_developer_support_url_table.sql', 1024567258, 'root', '2022-09-21 09:40:00', 67, 1),
       (459, '6.1663752827', 'Move support urls to new table', 'SQL',
        'V6.1663752827__Move_support_urls_to_new_table.sql', -841250300, 'root', '2022-09-21 09:40:00', 19, 1),
       (460, '6.1663753248', 'Drop developer support url', 'SQL', 'V6.1663753248__Drop_developer_support_url.sql',
        449314957, 'root', '2022-09-21 09:41:33', 792, 1),
       (461, '6.1663852733', 'Rename developer support url support url', 'SQL',
        'V6.1663852733__Rename_developer_support_url_support_url.sql', 994736823, 'root', '2022-09-22 13:19:48', 101,
        1),
       (462, '6.1663594517', 'Create summary items for renewal orders', 'SQL',
        'V6.1663594517__Create_summary_items_for_renewal_orders.sql', 706553837, 'root', '2022-09-28 14:46:26', 493, 1),
       (463, '6.1663670730', 'add-type-deleted-public-id-index-to-ou', 'SQL',
        'V6.1663670730__add-type-deleted-public-id-index-to-ou.sql', -1073908361, 'root', '2022-09-28 14:46:28', 1596,
        1),
       (464, '6.1663752313', 'add vat rate foreign keys', 'SQL', 'V6.1663752313__add_vat_rate_foreign_keys.sql',
        -661931407, 'root', '2022-09-28 14:46:28', 394, 1),
       (465, '6.1663845976', 'Add missing vat rates', 'SQL', 'V6.1663845976__Add_missing_vat_rates.sql', -2049034861,
        'root', '2022-09-28 14:49:25', 49, 1),
       (466, '6.1663845977', 'Migrate rate percent to decimal', 'SQL',
        'V6.1663845977__Migrate_rate_percent_to_decimal.sql', -1331145990, 'root', '2022-09-28 14:49:26', 328, 1),
       (467, '6.1663845987', 'migrate existing vat rates', 'SQL', 'V6.1663845987__migrate_existing_vat_rates.sql',
        -2038260160, 'root', '2022-09-28 14:49:26', 232, 1),
       (468, '6.1663940142', 'Remove legacy vat rate columns', 'SQL',
        'V6.1663940142__Remove_legacy_vat_rate_columns.sql', 401586022, 'root', '2022-09-28 14:49:26', 279, 1),
       (469, '6.1664175354', 'drop-oauth redirect url-from-app-version', 'SQL',
        'V6.1664175354__drop-oauth_redirect_url-from-app-version.sql', -1001579078, 'root', '2022-09-28 14:49:27', 469,
        1),
       (471, '6.1663845975', 'Add missing default vat rate', 'SQL', 'V6.1663845975__Add_missing_default_vat_rate.sql',
        222296603, 'root', '2022-10-04 09:43:15', 8, 1),
       (472, '6.1663845980', 'Migrate rate to decimals', 'SQL', 'V6.1663845980__Migrate_rate_to_decimals.sql',
        -1010561602, 'root', '2022-10-04 10:54:09', 424, 1),
       (473, '6.1664783507', 'Migrate existing price upon request', 'SQL',
        'V6.1664783507__Migrate_existing_price_upon_request.sql', 2063200825, 'root', '2022-10-04 10:54:09', 48, 1),
       (474, '6.1664875834', 'Add ou widget library locked', 'SQL', 'V6.1664875834__Add_ou_widget_library_locked.sql',
        74997995, 'root', '2022-10-04 10:54:10', 1015, 1),
       (475, '6.1662358902', 'Add existing vat rates', 'SQL', 'V6.1662358902__Add_existing_vat_rates.sql', 461702007,
        'root', '2022-10-04 10:56:33', 53, 1),
       (476, '6.1662358903', 'Add existing vat rates', 'SQL', 'V6.1662358903__Add_existing_vat_rates.sql', -2041692569,
        'root', '2022-10-05 12:09:57', 50, 1),
       (477, '6.1664971838', 'Add widget assignment', 'SQL', 'V6.1664971838__Add_widget_assignment.sql', -584748128,
        'root', '2022-10-05 12:26:36', 101, 1),
       (478, '6.1664888744', 'Extend widget table', 'SQL', 'V6.1664888744__Extend_widget_table.sql', 1485041338, 'root',
        '2022-10-07 08:47:27', 351, 1),
       (479, '6.1664890347', 'Extend widget size', 'SQL', 'V6.1664890347__Extend_widget_size.sql', -828875402, 'root',
        '2022-10-07 08:47:27', 202, 1),
       (480, '6.1664891119', 'Add widget lang', 'SQL', 'V6.1664891119__Add_widget_lang.sql', -1561279294, 'root',
        '2022-10-07 08:47:27', 66, 1),
       (481, '6.1663073612', 'Update charset and collation', 'SQL', 'V6.1663073612__Update_charset_and_collation.sql',
        -1902067507, 'root', '2022-10-11 09:44:21', 6536, 1),
       (482, '6.1665125564', 'Add disable first name pseudo to ou developer settings', 'SQL',
        'V6.1665125564__Add_disable_first_name_pseudo_to_ou_developer_settings.sql', 1170899516, 'root',
        '2022-10-11 09:44:21', 38, 1),
       (483, '6.1665496363', 'Add collection widget widget size id', 'SQL',
        'V6.1665496363__Add_collection_widget_widget_size_id.sql', 2103721603, 'root', '2022-10-11 13:54:35', 106, 1),
       (484, '6.1665496477', 'Set collection widget widget size id', 'SQL',
        'V6.1665496477__Set_collection_widget_widget_size_id.sql', 1225105063, 'root', '2022-10-11 13:56:44', 15, 1),
       (485, '6.1665496617', 'Delete incorrect collection widgets', 'SQL',
        'V6.1665496617__Delete_incorrect_collection_widgets.sql', -2122909910, 'root', '2022-10-11 13:58:10', 9, 1),
       (486, '6.1665496696', 'Drop collection widget widget id', 'SQL',
        'V6.1665496696__Drop_collection_widget_widget_id.sql', 1623200065, 'root', '2022-10-11 14:05:46', 81, 1),
       (487, '6.1662472569', 'visma company', 'SQL', 'V6.1662472569__visma_company.sql', -1132396701, 'root',
        '2022-10-19 15:08:01', 67, 1),
       (488, '6.1662473496', 'add visma company column', 'SQL', 'V6.1662473496__add_visma_company_column.sql',
        1462381753, 'root', '2022-10-19 15:08:01', 420, 1),
       (489, '6.1662711281', 'Add visma company default table', 'SQL',
        'V6.1662711281__Add_visma_company_default_table.sql', 932482970, 'root', '2022-10-19 15:08:02', 55, 1),
       (490, '6.1665389411', 'set-discount-type-on-subscription', 'SQL',
        'V6.1665389411__set-discount-type-on-subscription.sql', 240867209, 'root', '2022-10-19 15:08:02', 20, 1),
       (491, '6.1666191856', 'Create customer subscription period', 'SQL',
        'V6.1666191856__Create_customer_subscription_period.sql', 4817776, 'root', '2022-10-19 15:21:53', 60, 1),
       (492, '6.1666267537', 'Create last run table', 'SQL', 'V6.1666267537__Create_last_run_table.sql', 1956196716,
        'root', '2022-10-20 12:06:34', 72, 1),
       (493, '6.1666769654', 'Drop Watcher Tables', 'SQL', 'V6.1666769654__Drop_Watcher_Tables.sql', 476292842, 'root',
        '2022-11-04 12:34:58', 88, 1),
       (494, '6.1666787556', 'add creation time type index to event', 'SQL',
        'V6.1666787556__add_creation_time_type_index_to_event.sql', -2022010038, 'root', '2022-11-04 12:34:58', 187, 1),
       (495, '6.1666787622', 'add event weekly mail sent user id idx to notification', 'SQL',
        'V6.1666787622__add_event_weekly_mail_sent_user_id_idx_to_notification.sql', 772107840, 'root',
        '2022-11-04 12:35:00', 1373, 1),
       (496, '6.1666850625', 'add-buyer-user-type', 'SQL', 'V6.1666850625__add-buyer-user-type.sql', -1344214505,
        'root', '2022-11-04 12:35:00', 18, 1),
       (497, '6.1666851572', 'drop-watcher-triggers', 'SQL', 'V6.1666851572__drop-watcher-triggers.sql', 1743819744,
        'root', '2022-11-04 12:35:00', 99, 1),
       (498, '6.1666855656', 'add-library-module-to-purchaser-role-for-all-schools', 'SQL',
        'V6.1666855656__add-library-module-to-purchaser-role-for-all-schools.sql', -1410343344, 'root',
        '2022-11-04 12:35:00', 219, 1),
       (499, '6.1667547268', 'set external store on schools', 'SQL', 'V6.1667547268__set_external_store_on_schools.sql',
        -1395677975, 'root', '2022-11-04 12:35:01', 719, 1),
       (500, '6.1667559224', 'Add order buyer name', 'SQL', 'V6.1667559224__Add_order_buyer_name.sql', 1974377896,
        'root', '2022-11-04 12:35:01', 70, 1),
       (501, '6.1667559299', 'Set order buyer name', 'SQL', 'V6.1667559299__Set_order_buyer_name.sql', -581363952,
        'root', '2022-11-04 12:35:01', 106, 1),
       (502, '6.1667996591', 'set discount type', 'SQL', 'V6.1667996591__set_discount_type.sql', 1035928062, 'root',
        '2022-11-10 09:27:48', 74, 1),
       (503, '6.1668072345', 'Set missing buyer name', 'SQL', 'V6.1668072345__Set_missing_buyer_name.sql', -1100292715,
        'root', '2022-11-10 09:27:48', 502, 1),
       (504, '6.1668069212', 'drop vat rate columns', 'SQL', 'V6.1668069212__drop_vat_rate_columns.sql', 815082886,
        'root', '2022-11-22 15:24:48', 111, 1),
       (505, '6.1668094496', 'Purge sensitive session data', 'SQL', 'V6.1668094496__Purge_sensitive_session_data.sql',
        -586875142, 'root', '2022-11-22 15:24:49', 298, 1),
       (506, '6.1668159829', 'Delete sessions for deleted users', 'SQL',
        'V6.1668159829__Delete_sessions_for_deleted_users.sql', 1742930790, 'root', '2022-11-22 15:24:49', 227, 1),
       (507, '6.1669130694', 'Drop widget name', 'SQL', 'V6.1669130694__Drop_widget_name.sql', -1454299806, 'root',
        '2022-11-22 15:25:22', 199, 1),
       (508, '6.1669282222', 'Drop snapshot school info', 'SQL', 'V6.1669282222__Drop_snapshot_school_info.sql',
        -1748864490, 'root', '2022-12-01 09:18:46', 42, 1),
       (509, '6.1669630126', 'Add widget enabled flag', 'SQL', 'V6.1669630126__Add_widget_enabled_flag.sql', 245380366,
        'root', '2022-12-01 09:18:47', 698, 1),
       (510, '6.1669886199', 'Add user app time activity index', 'SQL',
        'V6.1669886199__Add_user_app_time_activity_index.sql', -432062987, 'root', '2022-12-01 09:18:47', 284, 1),
       (511, '6.1670489230', 'Add index on file gs object name', 'SQL',
        'V6.1670489230__Add_index_on_file_gs_object_name.sql', -143917145, 'root', '2022-12-08 08:52:05', 2677, 1),
       (512, '6.1668671989', 'add-authsource-to-idp', 'SQL', 'V6.1668671989__add-authsource-to-idp.sql', -1004839752,
        'root', '2022-12-19 12:52:19', 235, 1),
       (513, '6.1670402335', 'Remove favourite app version', 'SQL', 'V6.1670402335__Remove_favourite_app_version.sql',
        1832800545, 'root', '2022-12-19 12:52:20', 443, 1),
       (514, '6.1670505749', 'Stop subscriptions for deleted ous', 'SQL',
        'V6.1670505749__Stop_subscriptions_for_deleted_ous.sql', -932277373, 'root', '2022-12-19 12:52:20', 80, 1),
       (515, '6.1670591296', 'Add discount agreement period table', 'SQL',
        'V6.1670591296__Add_discount_agreement_period_table.sql', -631991414, 'root', '2022-12-19 12:52:20', 104, 1),
       (516, '6.1671011378', 'add only external app setting', 'SQL', 'V6.1671011378__add_only_external_app_setting.sql',
        1298300585, 'root', '2022-12-19 14:11:52', 125, 1),
       (517, '6.1671455227', 'Add surcharge to developer agreements', 'SQL',
        'V6.1671455227__Add_surcharge_to_developer_agreements.sql', -55765894, 'root', '2022-12-19 14:17:01', 213, 1),
       (518, '6.1671459431', 'Make discount agreement period dates nullable', 'SQL',
        'V6.1671459431__Make_discount_agreement_period_dates_nullable.sql', 2005221972, 'root', '2022-12-19 14:25:18',
        154, 1),
       (519, '6.1671459432', 'Migrate discount agreements to periods', 'SQL',
        'V6.1671459432__Migrate_discount_agreements_to_periods.sql', -262696679, 'root', '2022-12-19 14:32:13', 19, 1),
       (520, '6.1671459627', 'Move developers to discount agreement periods', 'SQL',
        'V6.1671459627__Move_developers_to_discount_agreement_periods.sql', 2112652125, 'root', '2022-12-19 14:32:13',
        21, 1),
       (521, '6.1671460642', 'Change discount agreement developer primary key', 'SQL',
        'V6.1671460642__Change_discount_agreement_developer_primary_key.sql', 1203190317, 'root', '2022-12-19 14:44:29',
        128, 1),
       (522, '6.1671613064', 'Make discount agreement developer discount agreement id nullable', 'SQL',
        'V6.1671613064__Make_discount_agreement_developer_discount_agreement_id_nullable.sql', -1055373228, 'root',
        '2022-12-21 08:59:11', 116, 1),
       (523, '6.1673347664', 'Set null discount agreement developer surcharge to 0', 'SQL',
        'V6.1673347664__Set_null_discount_agreement_developer_surcharge_to_0.sql', 1210640212, 'root',
        '2023-01-10 13:33:53', 16, 1),
       (524, '6.1673348118', 'Make discount agreement developer surcharge not null', 'SQL',
        'V6.1673348118__Make_discount_agreement_developer_surcharge_not_null.sql', 1058556890, 'root',
        '2023-01-10 13:33:53', 62, 1),
       (525, '6.1670591297', 'Add discount agreement period table', 'SQL',
        'V6.1670591297__Add_discount_agreement_period_table.sql', 1650005298, 'root', '2023-01-12 09:18:06', 37, 1),
       (527, '6.1671525630', 'Add surcharge to order items', 'SQL', 'V6.1671525630__Add_surcharge_to_order_items.sql',
        -722614756, 'root', '2023-01-12 09:18:06', 81, 1),
       (528, '6.1673447806', 'Make period discounts and surcharges nullable', 'SQL',
        'V6.1673447806__Make_period_discounts_and_surcharges_nullable.sql', -1763079772, 'root', '2023-01-12 09:18:06',
        54, 1),
       (529, '6.1673449172', 'Make discount agreement developer discount and surcharge nullable', 'SQL',
        'V6.1673449172__Make_discount_agreement_developer_discount_and_surcharge_nullable.sql', 1365513087, 'root',
        '2023-01-12 09:18:06', 51, 1),
       (530, '6.1673450692', 'Set discount or surcharge to null', 'SQL',
        'V6.1673450692__Set_discount_or_surcharge_to_null.sql', -1269549952, 'root', '2023-01-12 09:18:06', 33, 1),
       (531, '6.1671459433', 'Migrate discount agreements to periods', 'SQL',
        'V6.1671459433__Migrate_discount_agreements_to_periods.sql', -1313841041, 'root', '2023-01-12 09:51:37', 103,
        1),
       (532, '6.1673523998', 'Add shopping cart peppol id to id counter', 'SQL',
        'V6.1673523998__Add_shopping_cart_peppol_id_to_id_counter.sql', 505178344, 'root', '2023-01-17 10:11:41', 104,
        1),
       (533, '6.1673948011', 'Add subscription surcharge', 'SQL', 'V6.1673948011__Add_subscription_surcharge.sql',
        1583389594, 'root', '2023-01-17 10:11:42', 705, 1),
       (534, '6.1670223038', 'Add general terms url to tool', 'SQL', 'V6.1670223038__Add_general_terms_url_to_tool.sql',
        1664142332, 'root', '2023-01-25 08:06:32', 434, 1),
       (535, '6.1670224722', 'Add general terms url to developer', 'SQL',
        'V6.1670224722__Add_general_terms_url_to_developer.sql', 2082435528, 'root', '2023-01-25 08:06:32', 115, 1),
       (536, '6.1674028497', 'add-seller reference-number-to-order', 'SQL',
        'V6.1674028497__add-seller_reference-number-to-order.sql', 1421651519, 'root', '2023-01-25 08:06:32', 85, 1),
       (537, '6.1674111775', 'add-scheduled-for-send-to-send-mail', 'SQL',
        'V6.1674111775__add-scheduled-for-send-to-send-mail.sql', -1372080552, 'root', '2023-01-25 08:06:35', 2516, 1),
       (538, '6.1674116213', 'add-send time-sent time-scheduled for send-index-to-send-mail', 'SQL',
        'V6.1674116213__add-send_time-sent_time-scheduled_for_send-index-to-send-mail.sql', -1705004208, 'root',
        '2023-01-25 08:06:35', 55, 1),
       (539, '6.1674633917', 'Drop package content', 'SQL', 'V6.1674633917__Drop_package_content.sql', 314155662,
        'root', '2023-01-25 08:06:35', 36, 1),
       (540, '6.1674633964', 'Drop order item product package id', 'SQL',
        'V6.1674633964__Drop order item product package id.sql', -1110024907, 'root', '2023-01-25 08:10:21', 416, 1),
       (541, '6.1674634030', 'Drop product package', 'SQL', 'V6.1674634030__Drop_product_package.sql', 315067815,
        'root', '2023-01-25 08:10:21', 26, 1),
       (542, '6.1674662571', 'Set discount type', 'SQL', 'V6.1674662571__Set_discount_type.sql', 1035928062, 'root',
        '2023-01-25 16:03:09', 35, 1),
       (543, '6.1674813151', 'Add school admin can access to budget', 'SQL',
        'V6.1674813151__Add_school_admin_can_access_to_budget.sql', 489013871, 'root', '2023-02-06 13:06:40', 236, 1),
       (546, '6.1675687884', 'Extend app package', 'SQL', 'V6.1675687884__Extend_app_package.sql', -2073150428, 'root',
        '2023-02-06 13:48:43', 435, 1),
       (547, '6.1675691332', 'Drop app package app version', 'SQL', 'V6.1675691332__Drop_app_package_app_version.sql',
        303157518, 'root', '2023-02-06 14:03:35', 49, 1),
       (548, '6.1675691361', 'Delete existing app packages', 'SQL', 'V6.1675691361__Delete_existing_app_packages.sql',
        -124562901, 'root', '2023-02-06 14:03:35', 12, 1),
       (549, '6.1675691388', 'Add app package product', 'SQL', 'V6.1675691388__Add_app_package_product.sql', 1796225071,
        'root', '2023-02-06 14:03:35', 55, 1),
       (550, '6.1675691641', 'Extend app package translation', 'SQL',
        'V6.1675691641__Extend_app_package_translation.sql', -1373030373, 'root', '2023-02-06 14:03:35', 82, 1),
       (551, '6.1675692024', 'Delete app package licenses', 'SQL', 'V6.1675692024__Delete_app_package_licenses.sql',
        -154230706, 'root', '2023-02-06 14:03:36', 153, 1),
       (552, '6.1675770613', 'Make app package public id nullable', 'SQL',
        'V6.1675770613__Make_app_package_public_id_nullable.sql', -423287859, 'root', '2023-02-07 13:25:00', 341, 1),
       (553, '6.1675776212', 'Add app package country id', 'SQL', 'V6.1675776212__Add_app_package_country_id.sql',
        -268786985, 'root', '2023-02-07 13:25:00', 244, 1),
       (554, '6.1675345415', 'Create table application redirect uris', 'SQL',
        'V6.1675345415__Create_table_application_redirect_uris.sql', 508237213, 'root', '2023-09-20 09:49:16', 29, 1),
       (555, '6.1675944162', 'Add order item content', 'SQL', 'V6.1675944162__Add_order_item_content.sql', 190555257,
        'root', '2023-09-20 09:49:16', 16, 1),
       (556, '6.1676637889', 'Add order item content name and quantity', 'SQL',
        'V6.1676637889__Add_order_item_content_name_and_quantity.sql', 1874926741, 'root', '2023-09-20 09:49:16', 9, 1),
       (557, '6.1676638040', 'Migrate orders to order item content', 'SQL',
        'V6.1676638040__Migrate_orders_to_order_item_content.sql', 2092522206, 'root', '2023-09-20 09:49:16', 115, 1),
       (558, '6.1676963126', 'Add shopcart item app package id', 'SQL',
        'V6.1676963126__Add_shopcart_item_app_package_id.sql', -1123306891, 'root', '2023-09-20 09:49:17', 23, 1),
       (559, '6.1677246656', 'Add license group product id', 'SQL', 'V6.1677246656__Add_license_group_product_id.sql',
        53982860, 'root', '2023-09-20 09:49:18', 1208, 1),
       (560, '6.1677504639', 'Add subscription app package id', 'SQL',
        'V6.1677504639__Add_subscription_app_package_id.sql', 1292348717, 'root', '2023-09-20 09:49:18', 87, 1),
       (561, '6.1677743852', 'add app type to app package', 'SQL', 'V6.1677743852__add_app_type_to_app_package.sql',
        -939059256, 'root', '2023-09-20 09:49:18', 21, 1),
       (562, '6.1678450675', 'remove-deleted-ladder-assignees', 'SQL',
        'V6.1678450675__remove-deleted-ladder-assignees.sql', 1641664340, 'root', '2023-09-20 09:49:18', 2, 1),
       (563, '6.1678450739', 'drop-delete-flag-in-ladder-assignee', 'SQL',
        'V6.1678450739__drop-delete-flag-in-ladder-assignee.sql', -1012307547, 'root', '2023-09-20 09:49:18', 7, 1),
       (564, '6.1678451971', 'add-step-type-to-ladder', 'SQL', 'V6.1678451971__add-step-type-to-ladder.sql', 2137170775,
        'root', '2023-09-20 09:49:18', 11, 1),
       (565, '6.1678453181', 'remove-default-value-for-step-type', 'SQL',
        'V6.1678453181__remove-default-value-for-step-type.sql', 2019285869, 'root', '2023-09-20 09:49:18', 7, 1),
       (566, '6.1678886722', 'add-supplier-article-number-to-order-item', 'SQL',
        'V6.1678886722__add-supplier-article-number-to-order-item.sql', 446929727, 'root', '2023-09-20 09:49:18', 24,
        1),
       (567, '6.1679563841', 'add-country-to-discount-ladder', 'SQL',
        'V6.1679563841__add-country-to-discount-ladder.sql', 897212035, 'root', '2023-09-20 09:49:18', 11, 1),
       (568, '6.1679564225', 'remove-default-value-for-country-id.sh', 'SQL',
        'V6.1679564225__remove-default-value-for-country-id.sh.sql', 925315851, 'root', '2023-09-20 09:49:18', 7, 1),
       (569, '6.1680250437', 'add widget country', 'SQL', 'V6.1680250437__add_widget_country.sql', 61268973, 'root',
        '2023-09-20 09:49:18', 11, 1),
       (570, '6.1681725074', 'add punchout configuration to ou', 'SQL',
        'V6.1681725074__add_punchout_configuration_to_ou.sql', 747406347, 'root', '2023-09-20 09:49:18', 104, 1),
       (571, '6.1681821638', 'remove-discounts-from-discount agreement', 'SQL',
        'V6.1681821638__remove-discounts-from-discount_agreement.sql', -729141197, 'root', '2023-09-20 09:49:18', 11,
        1),
       (572, '6.1681821765', 'remove-discount-agreement-from-discount agreement developer', 'SQL',
        'V6.1681821765__remove-discount-agreement-from-discount_agreement_developer.sql', 2081948579, 'root',
        '2023-09-20 09:49:18', 7, 1),
       (573, '6.1681822717', 'Create local app assignment table', 'SQL',
        'V6.1681822717__Create_local_app_assignment_table.sql', 1230666212, 'root', '2023-09-20 09:49:18', 17, 1),
       (574, '6.1681823063', 'add-teachers-can-create-local-apps-to-ou', 'SQL',
        'V6.1681823063__add-teachers-can-create-local-apps-to-ou.sql', -2072104825, 'root', '2023-09-20 09:49:18', 79,
        1),
       (575, '6.1681823808', 'initiate-teachers-can-create-local-apps-to-false', 'SQL',
        'V6.1681823808__initiate-teachers-can-create-local-apps-to-false.sql', 795540392, 'root', '2023-09-20 09:49:18',
        226, 1),
       (576, '6.1681902173', 'Create local app license table', 'SQL',
        'V6.1681902173__Create_local_app_license_table.sql', 1779025253, 'root', '2023-09-20 09:49:19', 19, 1),
       (577, '6.1682062293', 'Insert assignments for existing local apps', 'SQL',
        'V6.1682062293__Insert_assignments_for_existing_local_apps.sql', 336086730, 'root', '2023-09-20 09:49:19', 3,
        1),
       (578, '6.1682062464', 'Insert licenses for existing local apps', 'SQL',
        'V6.1682062464__Insert_licenses_for_existing_local_apps.sql', -194328041, 'root', '2023-09-20 09:49:19', 135,
        1),
       (579, '6.1682403397', 'add created by for local apps to app', 'SQL',
        'V6.1682403397__add_created_by_for_local_apps_to_app.sql', -939242686, 'root', '2023-09-20 09:49:19', 140, 1),
       (580, '6.1682492581', 'add created by teacher flag for local apps to app', 'SQL',
        'V6.1682492581__add_created_by_teacher_flag_for_local_apps_to_app.sql', -1793475230, 'root',
        '2023-09-20 09:49:19', 37, 1),
       (581, '6.1682587404', 'default product auto renewal to 0', 'SQL',
        'V6.1682587404__default_product_auto_renewal_to_0.sql', 692890553, 'root', '2023-09-20 09:49:19', 77, 1),
       (582, '6.1682664111', 'fix-invalid-app requires-external-activation', 'SQL',
        'V6.1682664111__fix-invalid-app_requires-external-activation.sql', -841126672, 'root', '2023-09-20 09:49:19', 7,
        1),
       (583, '6.1683010039', 'add-supports-free-apps-to-bokbasen config', 'SQL',
        'V6.1683010039__add-supports-free-apps-to-bokbasen_config.sql', 1160244830, 'root', '2023-09-20 09:49:19', 5,
        1),
       (584, '6.1683020329', 'Remove app in ou collection for local apps', 'SQL',
        'V6.1683020329__Remove_app_in_ou_collection_for_local_apps.sql', 541451951, 'root', '2023-09-20 09:49:19', 2,
        1),
       (585, '6.1683626572', 'add requires manual school processing to order item', 'SQL',
        'V6.1683626572__add_requires_manual_school_processing_to_order_item.sql', 1891537983, 'root',
        '2023-09-20 09:49:19', 17, 1),
       (586, '6.1683813834', 'Create collection template table', 'SQL',
        'V6.1683813834__Create_collection_template_table.sql', -1967268526, 'root', '2023-09-20 09:49:19', 9, 1),
       (587, '6.1684144732', 'Create collection template folder table', 'SQL',
        'V6.1684144732__Create_collection_template_folder_table.sql', -1507543287, 'root', '2023-09-20 09:49:19', 9, 1),
       (588, '6.1684752995', 'Create collection template app table', 'SQL',
        'V6.1684752995__Create_collection_template_app_table.sql', 360681847, 'root', '2023-09-20 09:49:19', 14, 1),
       (589, '6.1684847170', 'drop-search apps-procedure', 'SQL', 'V6.1684847170__drop-search_apps-procedure.sql',
        -1432163379, 'root', '2023-09-20 09:49:19', 4, 1),
       (590, '6.1684931737', 'Create collection template assignment table', 'SQL',
        'V6.1684931737__Create_collection_template_assignment_table.sql', 415750488, 'root', '2023-09-20 09:49:19', 26,
        1),
       (591, '6.1685093291', 'Add user app folder collection template folder id', 'SQL',
        'V6.1685093291__Add_user_app_folder_collection_template_folder_id.sql', -1941937358, 'root',
        '2023-09-20 09:49:19', 8, 1),
       (592, '6.1685098382', 'create-app event log', 'SQL', 'V6.1685098382__create-app_event_log.sql', 713447815,
        'root', '2023-09-20 09:49:19', 16, 1),
       (593, '6.1685099620', 'create-app event log change', 'SQL', 'V6.1685099620__create-app_event_log_change.sql',
        1718254154, 'root', '2023-09-20 09:49:19', 12, 1),
       (594, '6.1685368585', 'Create collection template school access table', 'SQL',
        'V6.1685368585__Create_collection_template_school_access_table.sql', -853229066, 'root', '2023-09-20 09:49:19',
        13, 1),
       (595, '6.1685439798', 'Add unique constraint to collection template app table', 'SQL',
        'V6.1685439798__Add_unique_constraint_to_collection_template_app_table.sql', 608244970, 'root',
        '2023-09-20 09:49:19', 10, 1),
       (596, '6.1685955623', 'Alter foreign key in collection template assignment table', 'SQL',
        'V6.1685955623__Alter_foreign_key_in_collection_template_assignment_table.sql', -847099442, 'root',
        '2023-09-20 09:49:19', 29, 1),
       (597, '6.1685958011', 'Alter foreign key in collection template school access table', 'SQL',
        'V6.1685958011__Alter_foreign_key_in_collection_template_school_access_table.sql', 777537723, 'root',
        '2023-09-20 09:49:19', 20, 1),
       (598, '6.1686216620', 'Add cascade delete to collection template app and folder relation', 'SQL',
        'V6.1686216620__Add_cascade_delete_to_collection_template_app_and_folder_relation.sql', -2142827281, 'root',
        '2023-09-20 09:49:19', 21, 1),
       (599, '6.1686811227', 'Index collection template folder id in user app folder table', 'SQL',
        'V6.1686811227__Index_collection_template_folder_id_in_user_app_folder_table.sql', 1705096914, 'root',
        '2023-09-20 09:49:19', 11, 1),
       (600, '6.1687950945', 'Add schoolyear table', 'SQL', 'V6.1687950945__Add_schoolyear_table.sql', 990546364,
        'root', '2023-09-20 09:49:19', 9, 1),
       (601, '6.1687950998', 'Add semester table', 'SQL', 'V6.1687950998__Add_semester_table.sql', 1450684748, 'root',
        '2023-09-20 09:49:19', 10, 1),
       (602, '6.1688129491', 'Backfill order item app version id from product', 'SQL',
        'V6.1688129491__Backfill_order_item_app_version_id_from_product.sql', -560171451, 'root', '2023-09-20 09:49:19',
        8, 1),
       (603, '6.1688134924', 'Add net price column to order item table', 'SQL',
        'V6.1688134924__Add_net_price_column_to_order_item_table.sql', 2100234880, 'root', '2023-09-20 09:49:19', 18,
        1),
       (604, '6.1688481265', 'Migrate total price for old order items', 'SQL',
        'V6.1688481265__Migrate_total_price_for_old_order_items.sql', -891555344, 'root', '2023-09-20 09:49:19', 7, 1),
       (605, '6.1688549903', 'Create table purchase stats app period', 'SQL',
        'V6.1688549903__Create_table_purchase_stats_app_period.sql', 590679797, 'root', '2023-09-20 09:49:19', 16, 1),
       (606, '6.1688549977', 'Create table purchase stats period user', 'SQL',
        'V6.1688549977__Create_table_purchase_stats_period_user.sql', 1455313449, 'root', '2023-09-20 09:49:19', 8, 1),
       (607, '6.1688626420', 'Add new columns related to order quote invalidation', 'SQL',
        'V6.1688626420__Add_new_columns_related_to_order_quote_invalidation.sql', -407786823, 'root',
        '2023-09-20 09:49:19', 14, 1),
       (608, '6.1692108446', 'Add app package id to purchase stats', 'SQL',
        'V6.1692108446__Add_app_package_id_to_purchase_stats.sql', 317311630, 'root', '2023-09-20 09:49:20', 31, 1),
       (609, '6.1692184911', 'Add index on user app folder user id', 'SQL',
        'V6.1692184911__Add_index_on_user_app_folder_user_id.sql', -183948420, 'root', '2023-09-20 09:49:20', 22, 1),
       (610, '6.1693925723', 'Add purchase stats app usage table', 'SQL',
        'V6.1693925723__Add_purchase_stats_app_usage_table.sql', -1767001264, 'root', '2023-09-20 09:49:20', 23, 1),
       (611, '6.1693927208', 'Remove visits from purchase stats app period', 'SQL',
        'V6.1693927208__Remove_visits_from_purchase_stats_app_period.sql', -1729237428, 'root', '2023-09-20 09:49:20',
        8, 1),
       (612, '6.1693928060', 'Move purchase stats period user to purchase stats app usage', 'SQL',
        'V6.1693928060__Move_purchase_stats_period_user_to_purchase_stats_app_usage.sql', -1579009329, 'root',
        '2023-09-20 09:49:20', 16, 1),
       (613, '6.1693928656', 'Rename purchase stats app period', 'SQL',
        'V6.1693928656__Rename_purchase_stats_app_period.sql', -886908297, 'root', '2023-09-20 09:49:20', 10, 1),
       (614, '6.1694008722', 'Create table onetime session passcode', 'SQL',
        'V6.1694008722__Create_table_onetime_session_passcode.sql', -2087837429, 'root', '2023-09-20 09:49:20', 8, 1),
       (615, '6.1694086264', 'Fix purchase stats app user primary key', 'SQL',
        'V6.1694086264__Fix_purchase_stats_app_user_primary_key.sql', -1873624375, 'root', '2023-09-20 09:49:20', 11,
        1),
       (616, '6.1694359238', 'Add order item renewed app and app package', 'SQL',
        'V6.1694359238__Add_order_item_renewed_app_and_app_package.sql', -727988295, 'root', '2023-09-20 09:49:20', 185,
        1),
       (617, '6.1694376418', 'Backfill renewal app and package ids', 'SQL',
        'V6.1694376418__Backfill_renewal_app_and_package_ids.sql', 1375505097, 'root', '2023-09-20 09:49:20', 77, 1),
       (618, '6.1694616668', 'Create user last active table', 'SQL', 'V6.1694616668__Create_user_last_active_table.sql',
        1015009326, 'root', '2023-09-20 09:49:20', 14, 1),
       (619, '6.1694694353', 'Fill user last active from user table', 'SQL',
        'V6.1694694353__Fill_user_last_active_from_user_table.sql', -939052662, 'root', '2023-09-20 09:49:20', 426, 1),
       (620, '6.1694697036', 'Create procedure for syncing last active', 'SQL',
        'V6.1694697036__Create_procedure_for_syncing_last_active.sql', -1303703102, 'root', '2023-09-20 09:49:20', 2,
        1);
/*!40000 ALTER TABLE `flyway_schema_history`
    ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @old_time_zone */;

/*!40101 SET SQL_MODE = @old_sql_mode */;
/*!40014 SET FOREIGN_KEY_CHECKS = @old_foreign_key_checks */;
/*!40014 SET UNIQUE_CHECKS = @old_unique_checks */;
/*!40101 SET CHARACTER_SET_CLIENT = @old_character_set_client */;
/*!40101 SET CHARACTER_SET_RESULTS = @old_character_set_results */;
/*!40101 SET COLLATION_CONNECTION = @old_collation_connection */;
/*!40111 SET SQL_NOTES = @old_sql_notes */;