-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 11, 2024 at 03:03 PM
-- Server version: 5.7.44
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `centinelamima_sistema`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `action` enum('created','updated','deleted') COLLATE utf8_unicode_ci NOT NULL,
  `log_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `log_type_title` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `log_type_id` int(11) NOT NULL DEFAULT '0',
  `changes` mediumtext COLLATE utf8_unicode_ci,
  `log_for` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `log_for_id` int(11) NOT NULL DEFAULT '0',
  `log_for2` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_for_id2` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `agreements_matrix_config`
--

CREATE TABLE `agreements_matrix_config` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agreements_matrix_config_rel_campos`
--

CREATE TABLE `agreements_matrix_config_rel_campos` (
  `id` int(11) NOT NULL,
  `id_agreement_matrix_config` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `air_files`
--

CREATE TABLE `air_files` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_air_sector` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `date` datetime NOT NULL,
  `uploaded_by` int(11) NOT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_models`
--

CREATE TABLE `air_models` (
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `air_models`
--

INSERT INTO `air_models` (`id`, `name`, `deleted`) VALUES
(1, 'machine_learning', 0),
(2, 'neuronal', 0),
(3, 'numerical', 0);

-- --------------------------------------------------------

--
-- Table structure for table `air_records`
--

CREATE TABLE `air_records` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_air_sector` int(11) NOT NULL,
  `id_air_station` int(11) DEFAULT NULL,
  `id_air_model` int(11) NOT NULL,
  `id_air_record_type` int(11) NOT NULL,
  `number` varchar(500) NOT NULL,
  `name` varchar(500) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `code` varchar(500) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_records_types`
--

CREATE TABLE `air_records_types` (
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `air_records_types`
--

INSERT INTO `air_records_types` (`id`, `name`, `deleted`) VALUES
(1, 'monitoring', 0),
(2, 'forecast', 0),
(3, 'synoptic_data', 0);

-- --------------------------------------------------------

--
-- Table structure for table `air_records_values_p`
--

CREATE TABLE `air_records_values_p` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_record` int(11) NOT NULL,
  `id_variable` int(11) NOT NULL,
  `id_upload` int(11) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `date` date NOT NULL,
  `time_00` longtext,
  `time_01` longtext,
  `time_02` longtext,
  `time_03` longtext,
  `time_04` longtext,
  `time_05` longtext,
  `time_06` longtext,
  `time_07` longtext,
  `time_08` longtext,
  `time_09` longtext,
  `time_10` longtext,
  `time_11` longtext,
  `time_12` longtext,
  `time_13` longtext,
  `time_14` longtext,
  `time_15` longtext,
  `time_16` longtext,
  `time_17` longtext,
  `time_18` longtext,
  `time_19` longtext,
  `time_20` longtext,
  `time_21` longtext,
  `time_22` longtext,
  `time_23` longtext,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_records_values_p_max`
--

CREATE TABLE `air_records_values_p_max` (
  `id` int(11) NOT NULL,
  `id_values_p` int(11) NOT NULL,
  `id_upload` int(11) DEFAULT NULL,
  `time_00` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_01` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_02` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_03` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_04` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_05` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_06` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_07` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_08` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_09` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_10` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_11` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_12` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_13` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_14` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_15` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_16` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_17` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_18` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_19` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_20` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_21` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_22` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_23` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `air_records_values_p_min`
--

CREATE TABLE `air_records_values_p_min` (
  `id` int(11) NOT NULL,
  `id_values_p` int(11) NOT NULL,
  `id_upload` int(11) DEFAULT NULL,
  `time_00` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_01` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_02` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_03` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_04` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_05` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_06` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_07` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_08` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_09` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_10` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_11` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_12` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_13` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_14` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_15` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_16` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_17` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_18` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_19` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_20` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_21` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_22` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_23` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `air_records_values_p_porc_conf`
--

CREATE TABLE `air_records_values_p_porc_conf` (
  `id` int(11) NOT NULL,
  `id_values_p` int(11) NOT NULL,
  `id_upload` int(11) DEFAULT NULL,
  `time_00` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_01` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_02` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_03` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_04` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_05` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_06` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_07` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_08` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_09` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_10` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_11` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_12` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_13` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_14` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_15` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_16` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_17` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_18` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_19` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_20` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_21` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_22` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `time_23` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `air_records_values_uploads`
--

CREATE TABLE `air_records_values_uploads` (
  `id` int(11) NOT NULL,
  `id_record` int(11) NOT NULL,
  `model_creation_date` datetime NOT NULL,
  `upload_format` varchar(500) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_sectors`
--

CREATE TABLE `air_sectors` (
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `air_models` longtext CHARACTER SET utf8 NOT NULL,
  `latitude` varchar(500) CHARACTER SET utf8 NOT NULL,
  `longitude` varchar(500) CHARACTER SET utf8 NOT NULL,
  `description` longtext CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_stations`
--

CREATE TABLE `air_stations` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_air_sector` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT '1',
  `is_monitoring` tinyint(4) NOT NULL,
  `is_forecast` tinyint(4) NOT NULL,
  `is_receptor` int(1) NOT NULL DEFAULT '0',
  `description` varchar(500) CHARACTER SET utf8 NOT NULL,
  `latitude` varchar(500) CHARACTER SET utf8 NOT NULL,
  `longitude` varchar(500) CHARACTER SET utf8 NOT NULL,
  `load_code` varchar(500) CHARACTER SET utf8 NOT NULL,
  `load_code_api` varchar(500) CHARACTER SET utf8 NOT NULL,
  `code_api_sgs` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_stations_rel_variables`
--

CREATE TABLE `air_stations_rel_variables` (
  `id` int(11) NOT NULL,
  `id_air_station` int(11) NOT NULL,
  `id_air_variable` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_stations_values_1h`
--

CREATE TABLE `air_stations_values_1h` (
  `id` int(11) NOT NULL,
  `id_station` int(11) NOT NULL,
  `timestamp` bigint(11) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `hour` tinytext CHARACTER SET utf8 NOT NULL,
  `minute` tinytext CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_stations_values_1m`
--

CREATE TABLE `air_stations_values_1m` (
  `id` int(11) NOT NULL,
  `id_station` int(11) NOT NULL,
  `timestamp` bigint(11) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `hour` tinytext CHARACTER SET utf8 NOT NULL,
  `minute` tinytext CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_stations_values_5m`
--

CREATE TABLE `air_stations_values_5m` (
  `id` int(11) NOT NULL,
  `id_station` int(11) NOT NULL,
  `timestamp` bigint(11) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `hour` tinytext CHARACTER SET utf8 NOT NULL,
  `minute` tinytext CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_stations_values_15m`
--

CREATE TABLE `air_stations_values_15m` (
  `id` int(11) NOT NULL,
  `id_station` int(11) NOT NULL,
  `timestamp` bigint(11) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `hour` tinytext CHARACTER SET utf8 NOT NULL,
  `minute` tinytext CHARACTER SET utf8 NOT NULL,
  `data` text CHARACTER SET utf8 NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_synoptic_data`
--

CREATE TABLE `air_synoptic_data` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `date` date NOT NULL,
  `pmca_24_hrs_t1` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_24_hrs_t2` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_24_hrs_t3` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_48_hrs_t1` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_48_hrs_t2` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_48_hrs_t3` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_72_hrs_t1` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_72_hrs_t2` longtext CHARACTER SET utf8 NOT NULL,
  `pmca_72_hrs_t3` longtext CHARACTER SET utf8 NOT NULL,
  `evidence_file` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `observations` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `air_variables`
--

CREATE TABLE `air_variables` (
  `id` int(11) NOT NULL,
  `id_air_variable_type` int(11) NOT NULL,
  `id_unit_type` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `sigla` varchar(500) CHARACTER SET utf8 NOT NULL,
  `sigla_api` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `icono` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `alias` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `air_variables`
--

INSERT INTO `air_variables` (`id`, `id_air_variable_type`, `id_unit_type`, `name`, `sigla`, `sigla_api`, `icono`, `alias`, `deleted`) VALUES
(1, 1, 10, 'Velocidad del viento', 'WS', 'windspeedKph', 'air_wind_speed.png', 'Vel viento', 0),
(2, 1, 11, 'Dirección del viento', 'WD', 'winddir', 'air_wind_direction.png', 'Dir viento', 0),
(3, 1, 12, 'Temperatura', 'Temp', 'tempCelsius', 'air_temperature.png', 'Temp', 0),
(4, 1, 12, 'Punto de rocío', 'PtR', 'dewPoint', 'air_dew_point.png', 'Pto rocío', 0),
(5, 1, 16, 'Humedad relativa', 'HR', 'humidity', 'air_relative_humidity.png', 'Hum rel', 0),
(6, 1, 13, 'Radiación solar', 'RS', NULL, 'air_solar_radiation.png', 'Rad solar', 0),
(7, 1, 14, 'Presión barométrica', 'PR', NULL, 'air_barometric_pressure.png', 'Pres barom', 0),
(8, 2, 15, 'Dióxido de azufre', 'SO2', NULL, 'air_sulfur_dioxide.png', 'Diox azufre', 0),
(9, 2, 15, 'Material particulado respirable', 'PM10', 'PM10', 'air_pm10.png', 'Mat part resp', 0),
(10, 2, 15, 'Material particulado respirable fino', 'PM2.5', 'PM2.5', 'air_pm25.png', 'Mat part resp fino', 0),
(11, 2, 15, 'Óxidos de nitrógeno', 'NOx', NULL, 'air_nitric_oxide.png', 'Óxidos nitro', 0),
(12, 2, 15, 'Amoniaco', 'NH3', NULL, 'air_ammonia.png', 'Amoniaco', 0),
(13, 2, 15, 'Monóxido de carbono', 'CO', NULL, 'air_carbon_monoxide.png', 'Monóx carbono', 0),
(14, 2, 15, 'Hidrocarburos totales', 'HCT', NULL, 'air_hydrocarbon.png', 'Hidroc totales', 0),
(15, 2, 15, 'Ozono', 'O3', NULL, 'air_ozone.png', 'Ozono', 0),
(16, 1, 5, 'Capa de inversión térmica', 'CIT', NULL, 'air_temperature_inversion.png', 'Capa inv térm', 0),
(17, 1, 2, 'Precipitación', 'Pp', 'hourlyrainin', 'air_relative_humidity.png', 'Precipitación', 0),
(18, 2, 15, 'Material particulado respirable grueso', 'PM100', 'PM100', 'air_pm10.png', 'Mat part resp grueso', 0),
(19, 2, 15, 'Material particulado respirable muy fino', 'PM1', 'PM1', 'air_pm25.png', 'Mat part resp muy fino', 0);

-- --------------------------------------------------------

--
-- Table structure for table `air_variables_types`
--

CREATE TABLE `air_variables_types` (
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `air_variables_types`
--

INSERT INTO `air_variables_types` (`id`, `name`, `deleted`) VALUES
(1, 'meteorological', 0),
(2, 'air_quality', 0);

-- --------------------------------------------------------

--
-- Table structure for table `asignaciones`
--

CREATE TABLE `asignaciones` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_criterio` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `asignaciones_combinaciones`
--

CREATE TABLE `asignaciones_combinaciones` (
  `id` int(11) NOT NULL,
  `id_asignacion` int(11) NOT NULL,
  `criterio_sp` longtext,
  `tipo_asignacion_sp` varchar(20) NOT NULL,
  `sp_destino` int(11) DEFAULT NULL,
  `porcentajes_sp` text,
  `criterio_pu` longtext,
  `tipo_asignacion_pu` varchar(20) NOT NULL,
  `pu_destino` int(11) DEFAULT NULL,
  `porcentajes_pu` text,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_admin_modules`
--

CREATE TABLE `ayn_admin_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ayn_admin_modules`
--

INSERT INTO `ayn_admin_modules` (`id`, `name`, `deleted`) VALUES
(1, 'Panel Principal', 0),
(2, 'Ayuda y Soporte', 0),
(3, 'Perfiles', 0),
(4, 'Proyectos', 0),
(5, 'Registros', 0),
(6, 'Modelo', 0),
(7, 'Indicadores', 0),
(8, 'Compromisos', 0),
(9, 'Permisos', 0),
(10, 'Residuos', 0),
(11, 'Comunidades', 0),
(12, 'Recordbook', 0),
(13, 'ACV', 0),
(14, 'KPI', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ayn_admin_submodules`
--

CREATE TABLE `ayn_admin_submodules` (
  `id` int(11) NOT NULL,
  `id_admin_module` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ayn_admin_submodules`
--

INSERT INTO `ayn_admin_submodules` (`id`, `id_admin_module`, `name`, `deleted`) VALUES
(1, 2, 'FAQ', 0),
(2, 2, 'Glosario', 0),
(3, 2, '¿Qué es Mimasoft?', 0),
(4, 3, 'Generales', 0),
(5, 3, 'Proyectos', 0),
(6, 4, 'Configuración Plataforma', 0),
(7, 4, 'Clientes', 0),
(8, 4, 'Usuarios', 0),
(9, 4, 'Proyectos', 0),
(10, 4, 'Subproyectos', 0),
(11, 5, 'Campos', 0),
(12, 5, 'Formularios', 0),
(13, 5, 'Alias de Categorías', 0),
(14, 6, 'Formato de Huellas', 0),
(15, 6, 'Bases de Datos', 0),
(16, 6, 'Metodologías', 0),
(17, 6, 'Factores de Caracterización', 0),
(18, 6, 'Huellas', 0),
(19, 6, 'Materiales', 0),
(20, 6, 'Categorías', 0),
(21, 6, 'Subcategorías', 0),
(22, 6, 'Relacionamiento', 0),
(23, 6, 'Umbrales', 0),
(24, 7, 'Unidades Funcionales', 0),
(25, 7, 'Procesos Unitarios', 0),
(26, 8, 'Estados de Cumplimiento', 0),
(27, 8, 'Configuración de Matriz RCA', 0),
(28, 8, 'Configuración de Matriz de Reportables', 0),
(29, 8, 'Carga de Compromisos', 0),
(30, 9, 'Configuración de Matriz', 0),
(31, 9, 'Estados de Tramitación', 0),
(32, 9, 'Carga de Permisos', 0),
(33, 10, 'Indicadores', 0),
(34, 11, 'Configuración Stakeholders', 0),
(35, 11, 'Configuración Acuerdos', 0),
(36, 11, 'Configuración Feedback', 0),
(37, 11, 'Configuración Estados de Acuerdos', 0),
(38, 12, 'Configuración de Recordbook', 0),
(39, 13, 'Reporte de ACV', 0),
(40, 14, 'Valores', 0),
(41, 14, 'Reporte KPI', 0),
(42, 14, 'Gráficos KPI', 0),
(43, 4, 'Sectores', 0),
(44, 5, 'Estaciones de Monitoreo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ayn_alert_historical`
--

CREATE TABLE `ayn_alert_historical` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_client_module` int(11) NOT NULL,
  `id_client_submodule` int(11) NOT NULL,
  `alert_config` longtext,
  `id_alert_projects` int(11) DEFAULT NULL,
  `is_email_sended` int(11) NOT NULL DEFAULT '0',
  `web_only` int(11) NOT NULL,
  `id_element` int(11) DEFAULT NULL,
  `alert_date` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_alert_historical_air`
--

CREATE TABLE `ayn_alert_historical_air` (
  `id` int(11) NOT NULL,
  `id_alert_projects` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `alert_date` date NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_alert_historical_users`
--

CREATE TABLE `ayn_alert_historical_users` (
  `id` int(11) NOT NULL,
  `id_alert_historical` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `viewed` int(11) DEFAULT NULL,
  `viewed_date` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_alert_projects`
--

CREATE TABLE `ayn_alert_projects` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_client_module` int(11) NOT NULL,
  `id_client_submodule` int(11) NOT NULL,
  `alert_config` longtext NOT NULL,
  `risk_email_alert` int(11) NOT NULL,
  `risk_web_alert` int(11) NOT NULL,
  `threshold_email_alert` int(11) NOT NULL,
  `threshold_web_alert` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_alert_projects_groups`
--

CREATE TABLE `ayn_alert_projects_groups` (
  `id` int(11) NOT NULL,
  `id_alert_project` int(11) NOT NULL,
  `id_client_group` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_alert_projects_users`
--

CREATE TABLE `ayn_alert_projects_users` (
  `id` int(11) NOT NULL,
  `id_alert_project` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_clients_groups`
--

CREATE TABLE `ayn_clients_groups` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `group_name` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_general`
--

CREATE TABLE `ayn_notif_general` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_client_context_module` int(11) NOT NULL,
  `id_client_context_submodule` int(11) DEFAULT NULL,
  `event` varchar(500) NOT NULL,
  `email_notification` int(11) NOT NULL,
  `web_notification` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_general_groups`
--

CREATE TABLE `ayn_notif_general_groups` (
  `id` int(11) NOT NULL,
  `id_notif_general` int(11) NOT NULL,
  `id_client_group` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_general_users`
--

CREATE TABLE `ayn_notif_general_users` (
  `id` int(11) NOT NULL,
  `id_notif_general` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_historical`
--

CREATE TABLE `ayn_notif_historical` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) DEFAULT NULL,
  `id_user` int(11) NOT NULL,
  `is_admin` int(11) NOT NULL,
  `module_level` enum('general','project','admin') NOT NULL,
  `id_client_module` int(11) DEFAULT NULL,
  `id_client_submodule` int(11) DEFAULT NULL,
  `id_client_context_module` int(11) DEFAULT NULL,
  `id_client_context_submodule` int(11) DEFAULT NULL,
  `id_admin_module` int(11) DEFAULT NULL,
  `id_admin_submodule` int(11) DEFAULT NULL,
  `id_element` int(11) DEFAULT NULL,
  `id_notif_general` int(11) DEFAULT NULL,
  `id_notif_projects_clients` int(11) DEFAULT NULL,
  `id_notif_projects_admin` int(11) DEFAULT NULL,
  `is_email_sended` int(11) NOT NULL DEFAULT '0',
  `web_only` int(11) NOT NULL,
  `massive` int(11) NOT NULL,
  `event` varchar(500) NOT NULL,
  `notified_date` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_historical_users`
--

CREATE TABLE `ayn_notif_historical_users` (
  `id` int(11) NOT NULL,
  `id_notif_historical` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `viewed` int(11) DEFAULT NULL,
  `viewed_date` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_projects_admin`
--

CREATE TABLE `ayn_notif_projects_admin` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_admin_module` int(11) NOT NULL,
  `id_admin_submodule` int(11) NOT NULL,
  `event` varchar(500) NOT NULL,
  `email_notification` int(11) NOT NULL,
  `web_notification` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_projects_admin_groups`
--

CREATE TABLE `ayn_notif_projects_admin_groups` (
  `id` int(11) NOT NULL,
  `id_notif_projects_admin` int(11) NOT NULL,
  `id_client_group` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_projects_admin_users`
--

CREATE TABLE `ayn_notif_projects_admin_users` (
  `id` int(11) NOT NULL,
  `id_notif_projects_admin` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_projects_clients`
--

CREATE TABLE `ayn_notif_projects_clients` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_client_module` int(11) NOT NULL,
  `id_client_submodule` int(11) NOT NULL,
  `event` varchar(500) NOT NULL,
  `email_notification` int(11) NOT NULL,
  `web_notification` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_projects_clients_groups`
--

CREATE TABLE `ayn_notif_projects_clients_groups` (
  `id` int(11) NOT NULL,
  `id_notif_projects_clients` int(11) NOT NULL,
  `id_client_group` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ayn_notif_projects_clients_users`
--

CREATE TABLE `ayn_notif_projects_clients_users` (
  `id` int(11) NOT NULL,
  `id_notif_projects_clients` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calculos`
--

CREATE TABLE `calculos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_criterio` int(11) NOT NULL,
  `criterio_fc` varchar(500) DEFAULT NULL,
  `id_campo_unidad` json NOT NULL,
  `id_bd` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_subcategoria` int(11) NOT NULL,
  `etiqueta` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campos`
--

CREATE TABLE `campos` (
  `id` int(11) NOT NULL,
  `id_tipo_campo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `html_name` varchar(500) NOT NULL,
  `default_value` varchar(500) DEFAULT NULL,
  `opciones` longtext,
  `obligatorio` int(11) NOT NULL,
  `habilitado` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campos_fijos`
--

CREATE TABLE `campos_fijos` (
  `id` int(11) NOT NULL,
  `id_tipo_campo` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `html_name` varchar(500) NOT NULL,
  `default_value` varchar(500) DEFAULT NULL,
  `opciones` longtext,
  `obligatorio` int(11) NOT NULL,
  `deshabilitado` int(11) NOT NULL,
  `codigo_formulario_fijo` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `campos_fijos`
--

INSERT INTO `campos_fijos` (`id`, `id_tipo_campo`, `nombre`, `html_name`, `default_value`, `opciones`, `obligatorio`, `deshabilitado`, `codigo_formulario_fijo`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 5, 'Periodo', '{\"start_name\":\"1_or_unidades_funcionales_start\",\"end_name\":\"1_or_unidades_funcionales_end\"}', NULL, NULL, 1, 0, 'or_unidades_funcionales', 0, NULL, '0000-00-00 00:00:00', NULL, 0),
(2, 6, 'Unidad Funcional', '2_or_unidades_funcionales', NULL, NULL, 1, 0, 'or_unidades_funcionales', 0, NULL, '0000-00-00 00:00:00', NULL, 0),
(3, 3, 'Valor', '3_or_unidades_funcionales', NULL, NULL, 1, 0, 'or_unidades_funcionales', 0, NULL, '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `campo_fijo_rel_formulario_rel_proyecto`
--

CREATE TABLE `campo_fijo_rel_formulario_rel_proyecto` (
  `id` int(11) NOT NULL,
  `id_campo_fijo` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `campo_rel_formulario`
--

CREATE TABLE `campo_rel_formulario` (
  `id` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categorias_alias`
--

CREATE TABLE `categorias_alias` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `alias` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `company_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `sigla` varchar(500) CHARACTER SET utf8 NOT NULL,
  `rut` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `giro` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `pais` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ciudad` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comuna` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccion` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fono` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contacto` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `color_sitio` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `habilitado` int(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_modules`
--

CREATE TABLE `clients_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `id_mimasoft_system` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients_modules`
--

INSERT INTO `clients_modules` (`id`, `name`, `id_mimasoft_system`, `deleted`) VALUES
(1, 'Huellas Ambientales', 1, 0),
(2, 'Registros Ambientales', 1, 0),
(3, 'Mantenedoras', 1, 0),
(4, 'Otros Registros', 1, 0),
(5, 'Reportes', 1, 0),
(6, 'Compromisos', 1, 0),
(7, 'Permisos', 1, 0),
(8, 'Residuos', 1, 0),
(9, 'Comunidades', 1, 0),
(10, 'Ayuda y Soporte', 1, 0),
(11, 'Administración Cliente', 1, 0),
(12, 'Registros Calidad del Aire', 2, 0),
(13, 'Monitoreo y Alertas', 2, 0),
(14, 'Pronóstico', 2, 0),
(15, 'Administración Cliente Mimaire', 2, 0),
(16, 'Resumen de Pronósticos', 2, 0),
(17, 'Monitoreo', 2, 0),
(18, 'Desempeño de Pronóstico', 2, 0),
(19, 'Comparación de Pronósticos', 2, 0),
(20, 'Condiciones Meteorológicas', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `clients_modules_rel_profiles`
--

CREATE TABLE `clients_modules_rel_profiles` (
  `id` int(11) NOT NULL,
  `id_profile` int(11) NOT NULL,
  `id_client_module` int(11) NOT NULL,
  `id_client_submodule` int(11) NOT NULL,
  `ver` int(11) NOT NULL,
  `agregar` int(11) NOT NULL,
  `editar` int(11) NOT NULL,
  `eliminar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients_submodules`
--

CREATE TABLE `clients_submodules` (
  `id` int(11) NOT NULL,
  `id_client_module` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `tiene_ver` int(11) NOT NULL,
  `tiene_agregar` int(11) NOT NULL,
  `tiene_editar` int(11) NOT NULL,
  `tiene_eliminar` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients_submodules`
--

INSERT INTO `clients_submodules` (`id`, `id_client_module`, `name`, `tiene_ver`, `tiene_agregar`, `tiene_editar`, `tiene_eliminar`, `deleted`) VALUES
(1, 1, 'Unidades Funcionales', 1, 0, 0, 0, 0),
(2, 1, 'Procesos Unitarios', 1, 0, 0, 0, 0),
(3, 6, 'Cumplimiento de Compromisos', 1, 0, 0, 0, 0),
(4, 6, 'Evaluación de Compromisos RCA', 1, 1, 1, 0, 0),
(5, 7, 'Tramitación de Permisos', 1, 0, 0, 0, 0),
(6, 7, 'Evaluación de Permisos', 1, 0, 1, 0, 0),
(7, 8, 'Resumen', 1, 0, 0, 0, 0),
(8, 8, 'Detalle', 1, 0, 0, 0, 0),
(9, 8, 'Indicadores', 1, 1, 1, 1, 0),
(10, 9, 'Resumen', 1, 0, 0, 0, 0),
(11, 9, 'Stakeholders', 1, 1, 1, 1, 0),
(12, 9, 'Acuerdos', 1, 1, 1, 1, 0),
(13, 9, 'Seguimiento de Acuerdos', 1, 0, 1, 0, 0),
(14, 9, 'Feedback', 1, 1, 1, 1, 0),
(15, 9, 'Seguimiento de Feedback', 1, 0, 1, 0, 0),
(16, 10, 'FAQ', 1, 0, 0, 0, 0),
(17, 10, 'Glosario', 1, 0, 0, 0, 0),
(18, 10, '¿Qué es Mimasoft?', 1, 0, 0, 0, 0),
(19, 10, 'Contacto', 1, 0, 0, 0, 0),
(20, 11, 'Configuración Panel Principal', 1, 0, 1, 0, 0),
(21, 11, 'Carga Masiva', 1, 0, 1, 0, 0),
(22, 6, 'Evaluación de Compromisos Reportables', 1, 0, 1, 0, 0),
(23, 12, 'Registros de Monitoreo', 1, 0, 0, 0, 0),
(24, 12, 'Registros de Pronóstico', 1, 0, 1, 0, 0),
(25, 13, 'Dashboard', 1, 0, 0, 0, 0),
(26, 14, 'Dashboard', 1, 0, 0, 0, 0),
(27, 15, 'Carga Masiva MIMAire', 1, 0, 1, 0, 0),
(28, 14, 'Sectores', 1, 0, 0, 0, 0),
(29, 15, 'Descarga Masiva Mimaire', 1, 0, 0, 0, 0),
(30, 15, 'Carga de Datos Sinópticos', 1, 1, 1, 1, 0),
(31, 17, 'Gráficos', 1, 0, 0, 0, 0),
(32, 17, 'Registros', 1, 0, 0, 0, 0),
(33, 20, 'Ver Imágenes', 1, 0, 0, 0, 0),
(34, 20, 'Cargar Imágenes', 1, 0, 1, 0, 0),
(35, 17, 'Eficiencia', 1, 0, 0, 0, 0),
(36, 15, 'Forzar envío de alertas de Pronósticos', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_compromises_settings`
--

CREATE TABLE `client_compromises_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `tabla` int(11) NOT NULL,
  `grafico` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_consumptions_settings`
--

CREATE TABLE `client_consumptions_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `tabla` int(11) NOT NULL,
  `grafico` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_context_modules`
--

CREATE TABLE `client_context_modules` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `orden` int(11) NOT NULL,
  `contexto` varchar(500) DEFAULT NULL,
  `nivel_cliente` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_context_modules`
--

INSERT INTO `client_context_modules` (`id`, `name`, `orden`, `contexto`, `nivel_cliente`, `deleted`) VALUES
(1, 'Ayuda y Soporte', 4, 'help_and_support', 1, 0),
(2, 'KPI', 2, 'kpi', 1, 0),
(3, 'Proyectos', 1, NULL, 1, 0),
(4, 'Economía Circular', 3, 'circular_economy', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_context_modules_rel_profiles`
--

CREATE TABLE `client_context_modules_rel_profiles` (
  `id` int(11) NOT NULL,
  `id_client_context_profile` int(11) NOT NULL,
  `id_client_context_module` int(11) NOT NULL,
  `id_client_context_submodule` int(11) NOT NULL,
  `ver` int(11) NOT NULL,
  `agregar` int(11) NOT NULL,
  `editar` int(11) NOT NULL,
  `eliminar` int(11) NOT NULL,
  `auditar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_context_profiles`
--

CREATE TABLE `client_context_profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_context_submodules`
--

CREATE TABLE `client_context_submodules` (
  `id` int(11) NOT NULL,
  `id_client_context_module` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client_context_submodules`
--

INSERT INTO `client_context_submodules` (`id`, `id_client_context_module`, `name`, `deleted`) VALUES
(1, 1, 'FAQ', 0),
(2, 1, 'Glosario', 0),
(3, 1, '¿Qué es Mimasoft?', 0),
(4, 1, 'Contacto', 0),
(5, 2, 'Reporte KPI', 0),
(6, 2, 'Gráficos por proyecto', 0),
(7, 2, 'Gráficos entre proyectos', 0),
(8, 4, 'Indicadores por Proyecto', 0),
(9, 4, 'Indicadores entre Proyectos', 0);

-- --------------------------------------------------------

--
-- Table structure for table `client_environmental_footprints_settings`
--

CREATE TABLE `client_environmental_footprints_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `informacion` varchar(500) NOT NULL,
  `habilitado` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_indicators`
--

CREATE TABLE `client_indicators` (
  `id` int(11) NOT NULL,
  `valor` longtext NOT NULL,
  `f_desde` date NOT NULL,
  `f_hasta` date NOT NULL,
  `id_indicador` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_module_availability_settings`
--

CREATE TABLE `client_module_availability_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_modulo` int(11) NOT NULL,
  `disponible` int(1) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_permitting_settings`
--

CREATE TABLE `client_permitting_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `tabla` int(11) NOT NULL,
  `grafico` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `client_waste_settings`
--

CREATE TABLE `client_waste_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `tabla` int(11) NOT NULL,
  `grafico` int(11) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `compromisos_rca`
--

CREATE TABLE `compromisos_rca` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `compromisos_rca_rel_campos`
--

CREATE TABLE `compromisos_rca_rel_campos` (
  `id` int(11) NOT NULL,
  `id_compromiso` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `compromisos_reportables`
--

CREATE TABLE `compromisos_reportables` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guarda la definicion de las matrices de compromisos';

-- --------------------------------------------------------

--
-- Table structure for table `compromisos_reportables_rel_campos`
--

CREATE TABLE `compromisos_reportables_rel_campos` (
  `id` int(11) NOT NULL,
  `id_compromiso` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Asocia una matriz de compromiso con uno o más campos dinámicos';

-- --------------------------------------------------------

--
-- Table structure for table `contacto`
--

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `correo` varchar(500) DEFAULT NULL,
  `asunto` varchar(500) NOT NULL,
  `contenido` varchar(500) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `criterios`
--

CREATE TABLE `criterios` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `id_campo_sp` int(11) DEFAULT NULL,
  `id_campo_pu` int(11) DEFAULT NULL,
  `id_campo_fc` int(11) DEFAULT NULL,
  `tipo_by_criterio` varchar(500) DEFAULT NULL,
  `etiqueta` varchar(100) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `criticidades`
--

CREATE TABLE `criticidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `criticidades`
--

INSERT INTO `criticidades` (`id`, `nombre`, `deleted`) VALUES
(1, 'Leve', 0),
(2, 'Leve - Grave', 0),
(3, 'Grave', 0),
(4, 'Grave - Gravísima', 0),
(5, 'Gravísima', 0);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `placeholder` text COLLATE utf8_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `field_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `sort` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_table` tinyint(1) NOT NULL DEFAULT '0',
  `show_in_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `visible_to_admins_only` tinyint(1) NOT NULL DEFAULT '0',
  `hide_from_clients` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL,
  `related_to_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `related_to_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ec_client_transformation_factors_config`
--

CREATE TABLE `ec_client_transformation_factors_config` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `id_tipo_unidad` int(11) DEFAULT NULL,
  `valor_factor_transformacion` double DEFAULT NULL,
  `ren` double DEFAULT NULL,
  `eficiencia` double DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ec_tipo_no_aplica`
--

CREATE TABLE `ec_tipo_no_aplica` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ec_tipo_no_aplica`
--

INSERT INTO `ec_tipo_no_aplica` (`id`, `nombre`, `deleted`) VALUES
(1, 'transport', 0),
(2, 'final_product', 0),
(3, 'machinery', 0),
(4, 'other', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_tipo_origen`
--

CREATE TABLE `ec_tipo_origen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ec_tipo_origen`
--

INSERT INTO `ec_tipo_origen` (`id`, `nombre`, `deleted`) VALUES
(1, 'matter', 0),
(2, 'energy', 0);

-- --------------------------------------------------------

--
-- Table structure for table `ec_tipo_origen_materia`
--

CREATE TABLE `ec_tipo_origen_materia` (
  `id` int(11) NOT NULL,
  `id_tipo_origen` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ec_tipo_origen_materia`
--

INSERT INTO `ec_tipo_origen_materia` (`id`, `id_tipo_origen`, `nombre`, `deleted`) VALUES
(1, 1, 'virgin', 0),
(2, 1, 'reused', 0),
(3, 1, 'recycled', 0);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `default_message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `custom_message` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `template_name`, `email_subject`, `default_message`, `custom_message`, `deleted`) VALUES
(1, 'login_info', 'Login details', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">  <h1>Login Details</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Hello {USER_FIRST_NAME}, &nbsp;{USER_LAST_NAME},<br><br>An account has been created for you.</p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"> Please use the following info to login your dashboard:</p>            <hr>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">Dashboard URL:&nbsp;<a href=\"{DASHBOARD_URL}\" target=\"_blank\">{DASHBOARD_URL}</a></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\"></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Email: {USER_LOGIN_EMAIL}</span><br></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Password:&nbsp;{USER_LOGIN_PASSWORD}</span></p>            <p style=\"color: rgb(85, 85, 85);\"><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', NULL, 0),
(2, 'reset_password', 'Recuperar contraseña', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">\n<div style=\"max-width:640px; margin:0 auto; font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;\">\n <div style=\"color: #fff; text-align: center; background-color:#00b393; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\">\n  <center><table><tr>\n  <td width=\"80%\"><p style=\"font-size:22px; color:white;\">Restablecer Contraseña</p></td>\n  <td><img width=\"70px\" src=\"{SITE_URL}/files/system/mimasoft-circular-logo.png\" alt=\"logo Mimasoft\"></td>\n  </tr></table></center>\n </div>\n	 <div style=\"padding: 20px; background-color: rgb(255, 255, 255); color:#555;\"> \n	  <p style=\"font-size: 14px;\"> Hola {ACCOUNT_HOLDER_NAME},<br><br>\n	   Has solicitado cambiar tu Contraseña.&nbsp;</p>\n						<p style=\"font-size: 14px;\"> Para iniciar el proceso de restablecimiento de contraseña, haz clic en el siguiente enlace:</p>\n						<p style=\"font-size: 14px;\"><a href=\"{RESET_PASSWORD_URL}\" target=\"_blank\">Restablecer Contraseña</a></p>\n						<p style=\"font-size: 14px;\">¡Que tengas un excelente día!</p>\n		  <p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"></span></p>\n	 <p style=\"\">\n	 <span style=\"font-size: 14px; line-height: 20px;\"><i>Nota: Si recibiste este correo por error, es probable que otro usuario haya ingresado su dirección de correo electrónico por error al intentar restablecer una contraseña.\n	 Si no solicitaste el cambio de contraseña, no es necesario que realice ninguna otra acción y puede ignorar este correo electrónico de manera segura.\n	 <br>Importante	- Este mail es generado de manera automática, por favor no responda a este mensaje.\n	 </i></span><br></p>\n	 <p style=\"font-size: 14px;\"><br></p>\n	 <div style=\"background-color:#505050; padding:0px 0px 0px 25px;\">\n	 <p style=\"font-size: 14px;\">{SIGNATURE}</p>\n	 </div>\n  </div>\n </div>\n</div>\n', '', 0),
(3, 'team_member_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"><div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1>   </div>  <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to join with a team.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(4, 'send_invoice', 'New invoice', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>INVOICE #{INVOICE_ID}</h1></div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">  <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello {CONTACT_FIRST_NAME},</span><br></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Thank you for your business cooperation.</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Your invoice for the project {PROJECT_TITLE} has been generated and is attached here.</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVOICE_URL}\" target=\"_blank\">Show Invoice</a></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"font-size: 14px; line-height: 20px;\">Invoice balance due is {BALANCE_DUE}</span><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Please pay this invoice within {DUE_DATE}.&nbsp;</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>  </div> </div></div>', '', 0),
(5, 'signature', 'Signature', 'Powered By: <a href=\"http://www.mimasoft.cl/\" target=\"_blank\">Mimasoft </a>', '<table><tr>\n<td><p style=\"color:white\">Hecho con <span style=\"font-size:25px;\">♥</span> por &nbsp;</p></td>\n<td><a href=\"{SITE_URL}\" target=\"_blank\"><img src=\"{SITE_URL}/files/system/mimasoft-site-logo_firma_mail.png\" width=\"80px\"  alt=\"logo Mimasoft\"></a></td>\n</tr></table>', 0),
(6, 'client_contact_invitation', 'You are invited', '<div style=\"background-color: #eeeeef; padding: 50px 0; \">    <div style=\"max-width:640px; margin:0 auto; \">  <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Account Invitation</h1> </div> <div style=\"padding: 20px; background-color: rgb(255, 255, 255);\">            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">Hello,</span><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\"><br></span></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><span style=\"font-weight: bold;\">{INVITATION_SENT_BY}</span> has sent you an invitation to a client portal.</span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{INVITATION_URL}\" target=\"_blank\">Accept this Invitation</a></span></p>            <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\">If you don\'t want to accept this invitation, simply ignore this email.</span><br><br></p>            <p style=\"color: rgb(85, 85, 85); font-size: 14px;\">{SIGNATURE}</p>        </div>    </div></div>', '', 0),
(7, 'ticket_created', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Opened</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span><br></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p> <p style=\"\"><br></p><p style=\"\">Regards,</p><p style=\"\"><span style=\"line-height: 18.5714px;\">{USER_NAME}</span><br></p>   </div>  </div> </div>', '', 0),
(8, 'ticket_commented', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID} Replies</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px; font-weight: bold;\">Title: {TICKET_TITLE}</span><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{TICKET_CONTENT}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p></div></div></div>', '', 0),
(9, 'ticket_closed', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been closed by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p> <p style=\"\"><br></p> <p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>   </div>  </div> </div>', '', 0),
(10, 'ticket_reopened', 'Ticket  #{TICKET_ID} - {TICKET_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>Ticket #{TICKET_ID}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">The Ticket #{TICKET_ID} has been reopened by&nbsp;</span><span style=\"line-height: 18.5714px;\">{USER_NAME}</span></p><p style=\"\"><br></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{TICKET_URL}\" target=\"_blank\">Show Ticket</a></span></p>  </div> </div></div>', '', 0),
(11, 'general_notification', '{EVENT_TITLE}', '<div style=\"background-color: #eeeeef; padding: 50px 0; \"> <div style=\"max-width:640px; margin:0 auto; \"> <div style=\"color: #fff; text-align: center; background-color:#33333e; padding: 30px; border-top-left-radius: 3px; border-top-right-radius: 3px; margin: 0;\"><h1>{APP_TITLE}</h1></div><div style=\"padding: 20px; background-color: rgb(255, 255, 255);\"><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_TITLE}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\">{EVENT_DETAILS}</span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"><br></span></p><p style=\"\"><span style=\"line-height: 18.5714px;\"></span></p><p style=\"\"><span style=\"color: rgb(85, 85, 85); font-size: 14px; line-height: 20px;\"><a style=\"background-color: #00b393; padding: 10px 15px; color: #ffffff;\" href=\"{NOTIFICATION_URL}\" target=\"_blank\">View Details</a></span></p>  </div> </div></div>', '', 0),
(12, 'invoice_payment_confirmation', 'Payment received', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #EEEEEE;border-top: 0;border-bottom: 0;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"padding-top: 30px;padding-right: 10px;padding-bottom: 30px;padding-left: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <tbody><tr>\r\n <td align=\"center\" valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;background-color: #FFFFFF;\">\r\n                                        <tbody><tr>\r\n                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color: #33333e; max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 40px;padding-right: 18px;padding-bottom: 40px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <h2 style=\"display: block;margin: 0;padding: 0;font-family: Arial;font-size: 30px;font-style: normal;font-weight: bold;line-height: 100%;letter-spacing: -1px;text-align: center;color: #ffffff !important;\">Payment Confirmation</h2>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                        </tbody>\r\n                                                                    </table>\r\n                                                                </td>\r\n                                                            </tr>\r\n                                                        </tbody>\r\n                                                    </table>\r\n                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                        <tbody>\r\n                                                            <tr>\r\n                                                                <td valign=\"top\" style=\"mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n\r\n                                                                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"max-width: 100%;min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\" width=\"100%\">\r\n                                                                        <tbody><tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 20px;padding-right: 18px;padding-bottom: 0;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    Hello,<br>\r\n                                                                                    We have received your payment of {PAYMENT_AMOUNT} for {INVOICE_ID} <br>\r\n                                                                                    Thank you for your business cooperation.\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 10px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\">\r\n                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"min-width: 100%;border-collapse: collapse;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                        <tbody>\r\n                                                                                            <tr>\r\n                                                                                                <td style=\"padding-top: 15px;padding-right: 0x;padding-bottom: 15px;padding-left: 0px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate !important;border-radius: 2px;background-color: #00b393;mso-table-lspace: 0pt;mso-table-rspace: 0pt;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                        <tbody>\r\n                                                                                                            <tr>\r\n                                                                                                                <td align=\"center\" valign=\"middle\" style=\"font-family: Arial;font-size: 16px;padding: 10px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;\">\r\n                                                                                                                    <a href=\"{INVOICE_URL}\" target=\"_blank\" style=\"font-weight: bold;letter-spacing: normal;line-height: 100%;text-align: center;text-decoration: none;color: #FFFFFF;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;display: block;\">View Invoice</a>\r\n                                                                                                                </td>\r\n                                                                                                            </tr>\r\n                                                                                                        </tbody>\r\n                                                                                                    </table>\r\n                                                                                                </td>\r\n                                                                                            </tr>\r\n                                                                                        </tbody>\r\n                                                                                    </table>\r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 10px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n                                                                                    \r\n                                                                                </td>\r\n                                                                            </tr>\r\n                                                                            <tr>\r\n                                                                                <td valign=\"top\" style=\"padding-top: 0px;padding-right: 18px;padding-bottom: 20px;padding-left: 18px;mso-line-height-rule: exactly;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;word-break: break-word;color: #606060;font-family: Arial;font-size: 15px;line-height: 150%;text-align: left;\"> \r\n  {SIGNATURE}\r\n  </td>\r\n </tr>\r\n </tbody>\r\n  </table>\r\n  </td>\r\n  </tr>\r\n  </tbody>\r\n </table>\r\n  </td>\r\n </tr>\r\n  </tbody>\r\n  </table>\r\n  </td>\r\n </tr>\r\n </tbody>\r\n </table>\r\n </td>\r\n </tr>\r\n </tbody>\r\n  </table>', NULL, 0),
(13, 'message_received', '{SUBJECT}', '<meta content=\"text/html; charset=utf-8\" http-equiv=\"Content-Type\"> <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\"> <style type=\"text/css\"> #message-container p {margin: 10px 0;} #message-container h1, #message-container h2, #message-container h3, #message-container h4, #message-container h5, #message-container h6 { padding:10px; margin:0; } #message-container table td {border-collapse: collapse;} #message-container table { border-collapse:collapse; mso-table-lspace:0pt; mso-table-rspace:0pt; } #message-container a span{padding:10px 15px !important;} </style> <table id=\"message-container\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background:#eee; margin:0; padding:0; width:100% !important; line-height: 100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0; font-family:Helvetica,Arial,sans-serif; color: #555;\"> <tbody> <tr> <td valign=\"top\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"50\" width=\"600\">&nbsp;</td> </tr> <tr> <td style=\"background-color:#33333e; padding:25px 15px 30px 15px; font-weight:bold; \" width=\"600\"><h2 style=\"color:#fff; text-align:center;\">{USER_NAME} sent you a message</h2></td> </tr> <tr> <td bgcolor=\"whitesmoke\" style=\"background:#fff; font-family:Helvetica,Arial,sans-serif\" valign=\"top\" width=\"600\"> <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"> <tbody> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> <tr> <td width=\"560\"><p><span style=\"background-color: transparent;\">{MESSAGE_CONTENT}</span></p> <p style=\"display:inline-block; padding: 10px 15px; background-color: #00b393;\"><a href=\"{MESSAGE_URL}\" style=\"text-decoration: none; color:#fff;\" target=\"_blank\">Reply Message</a></p> </td> </tr> <tr> <td height=\"10\" width=\"560\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> <tr> <td height=\"60\" width=\"600\">&nbsp;</td> </tr> </tbody> </table> </td> </tr> </tbody> </table>', '', 0),
(14, 'ayn_notification_general', 'Notificación General', '<!doctype html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n\r\n<head>\r\n    <title></title>\r\n    <!--[if !mso]><!-- -->\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <!--<![endif]-->\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n    <style type=\"text/css\">\r\n        #outlook a {\r\n            padding: 0;\r\n        }\r\n        \r\n        body {\r\n            margin: 0;\r\n            padding: 0;\r\n            -webkit-text-size-adjust: 100%;\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n        \r\n        table,\r\n        td {\r\n            border-collapse: collapse;\r\n            mso-table-lspace: 0pt;\r\n            mso-table-rspace: 0pt;\r\n        }\r\n        \r\n        img {\r\n            border: 0;\r\n            height: auto;\r\n            line-height: 100%;\r\n            outline: none;\r\n            text-decoration: none;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n        \r\n        p {\r\n            display: block;\r\n            margin: 13px 0;\r\n        }\r\n    </style>\r\n    <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n    <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .mj-outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n    <!--[if !mso]><!-->\r\n    <link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n    <style type=\"text/css\">\r\n        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,500,700);\r\n    </style>\r\n    <!--<![endif]-->\r\n    <style type=\"text/css\">\r\n        @media only screen and (min-width:480px) {\r\n            .mj-column-per-33 {\r\n                width: 33% !important;\r\n                max-width: 33%;\r\n            }\r\n            .mj-column-per-66 {\r\n                width: 66% !important;\r\n                max-width: 66%;\r\n            }\r\n            .mj-column-per-100 {\r\n                width: 100% !important;\r\n                max-width: 100%;\r\n            }\r\n            .mj-column-per-33-333333333333336 {\r\n                width: 33.333333333333336% !important;\r\n                max-width: 33.333333333333336%;\r\n            }\r\n        }\r\n    </style>\r\n    <style type=\"text/css\">\r\n        @media only screen and (max-width:480px) {\r\n            table.mj-full-width-mobile {\r\n                width: 100% !important;\r\n            }\r\n            td.mj-full-width-mobile {\r\n                width: auto !important;\r\n            }\r\n        }\r\n    </style>\r\n	\r\n	<!--[if gte mso 9]>\r\n		<style type=\"text/css\">\r\n		img.header { width: 70px; }\r\n		</style>\r\n	<![endif]-->\r\n	\r\n</head>\r\n\r\n<body style=\"background-color:#eeeeef;\">\r\n    <div style=\"background-color:#eeeeef;\">\r\n        <!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#00b393;background-color:#00b393;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00b393;background-color:#00b393;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px 0;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:198px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-33 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;padding:10px 0;word-break:break-word;\">\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n                                                                <tbody>\r\n                                                                    <tr>\r\n                                                                        <td style=\"text-align:center;\"><img class=\"header\" width=\"70\" src=\"{SITE_URL}/files/system/mimasoft-circular-logo.png\" alt=\"logo Mimasoft\"></td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td><td class=\"\" style=\"vertical-align:top;width:396px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-66 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:middle;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"left\" style=\"font-size:0px;padding:18px 0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:left;color:#ffffff;padding-top:10px\">Notificación</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#ffffff;background-color:#ffffff;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#ffffff;background-color:#ffffff;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:0px;padding-top:20px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 25px;word-break:break-word;\">\r\n															<p>\r\n																Hola <strong>{USER_TO_NOTIFY_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>\r\n																Te informamos que el usuario <strong>{USER_ACTION_NAME} {EVENT}</strong> en <strong>{SUBMODULE_NAME}</strong> del módulo <strong>{MODULE_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>Fecha: <strong>{NOTIFIED_DATE}</strong></p>\r\n															<p>No olvides revisar periódicamente Mimasoft, para estar al tanto de los avances en tus proyectos.</p>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<br>\r\n																¡Que tengas un excelente día!\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n													 <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<span style=\"font-style:italic; color: #9e9e9e;\"> Nota: Por favor no respondas este correo. Si tienes dudas, ingresa a </span>\r\n																<br>\r\n																<a href=\"{CONTACT_URL}\">{CONTACT_URL}</a>\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#505050;background-color:#505050;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#505050;background-color:#505050;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:580px;\" ><![endif]-->\r\n                            <div align=\"center\" class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:center;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td align=\"center\" style=\"vertical-align:top;padding:0px;\">\r\n                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:center;color:#FFFFFF;\">\r\n                                                                <center>{SIGNATURE}</center>\r\n															</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><![endif]-->\r\n    </div>\r\n</body>\r\n\r\n</html>', '', 0),
(15, 'ayn_notification_projects_clients', 'Notificación', '<!doctype html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n\r\n<head>\r\n    <title></title>\r\n    <!--[if !mso]><!-- -->\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <!--<![endif]-->\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n    <style type=\"text/css\">\r\n        #outlook a {\r\n            padding: 0;\r\n        }\r\n        \r\n        body {\r\n            margin: 0;\r\n            padding: 0;\r\n            -webkit-text-size-adjust: 100%;\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n        \r\n        table,\r\n        td {\r\n            border-collapse: collapse;\r\n            mso-table-lspace: 0pt;\r\n            mso-table-rspace: 0pt;\r\n        }\r\n        \r\n        img {\r\n            border: 0;\r\n            height: auto;\r\n            line-height: 100%;\r\n            outline: none;\r\n            text-decoration: none;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n        \r\n        p {\r\n            display: block;\r\n            margin: 13px 0;\r\n        }\r\n    </style>\r\n    <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n    <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .mj-outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n    <!--[if !mso]><!-->\r\n    <link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n    <style type=\"text/css\">\r\n        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,500,700);\r\n    </style>\r\n    <!--<![endif]-->\r\n    <style type=\"text/css\">\r\n        @media only screen and (min-width:480px) {\r\n            .mj-column-per-33 {\r\n                width: 33% !important;\r\n                max-width: 33%;\r\n            }\r\n            .mj-column-per-66 {\r\n                width: 66% !important;\r\n                max-width: 66%;\r\n            }\r\n            .mj-column-per-100 {\r\n                width: 100% !important;\r\n                max-width: 100%;\r\n            }\r\n            .mj-column-per-33-333333333333336 {\r\n                width: 33.333333333333336% !important;\r\n                max-width: 33.333333333333336%;\r\n            }\r\n        }\r\n    </style>\r\n    <style type=\"text/css\">\r\n        @media only screen and (max-width:480px) {\r\n            table.mj-full-width-mobile {\r\n                width: 100% !important;\r\n            }\r\n            td.mj-full-width-mobile {\r\n                width: auto !important;\r\n            }\r\n        }\r\n    </style>\r\n	\r\n	<!--[if gte mso 9]>\r\n		<style type=\"text/css\">\r\n		img.header { width: 70px; }\r\n		</style>\r\n	<![endif]-->\r\n	\r\n</head>\r\n\r\n<body style=\"background-color:#eeeeef;\">\r\n    <div style=\"background-color:#eeeeef;\">\r\n        <!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#00b393;background-color:#00b393;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00b393;background-color:#00b393;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px 0;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:198px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-33 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;padding:10px 0;word-break:break-word;\">\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n                                                                <tbody>\r\n                                                                    <tr>\r\n                                                                        <td style=\"text-align:center;\"><img class=\"header\" width=\"70\" src=\"{SITE_URL}/files/system/mimasoft-circular-logo.png\" alt=\"logo Mimasoft\"></td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td><td class=\"\" style=\"vertical-align:top;width:396px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-66 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:middle;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"left\" style=\"font-size:0px;padding:18px 0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:left;color:#ffffff;padding-top:10px\">Notificación</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#ffffff;background-color:#ffffff;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#ffffff;background-color:#ffffff;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:0px;padding-top:20px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 25px;word-break:break-word;\">\r\n															<p>\r\n																Hola <strong>{USER_TO_NOTIFY_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>\r\n																Te informamos que el usuario <strong>{USER_ACTION_NAME} {EVENT}</strong> en <strong>{ELEMENT}</strong> del módulo <strong>{MODULE_NAME}</strong> en el proyecto <strong>{PROJECT_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>Fecha: <strong>{NOTIFIED_DATE}</strong></p>\r\n															<p>No olvides revisar periódicamente Mimasoft, para estar al tanto de los avances en tus proyectos.</p>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<br>\r\n																¡Que tengas un excelente día!\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n													 <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<span style=\"font-style:italic; color: #9e9e9e;\"> Nota: Por favor no respondas este correo. Si tienes dudas, ingresa a </span>\r\n																<br>\r\n																<a href=\"{CONTACT_URL}\">{CONTACT_URL}</a>\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#505050;background-color:#505050;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#505050;background-color:#505050;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:580px;\" ><![endif]-->\r\n                            <div align=\"center\" class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:center;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td align=\"center\" style=\"vertical-align:top;padding:0px;\">\r\n                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:center;color:#FFFFFF;\">\r\n                                                                <center>{SIGNATURE}</center>\r\n															</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><![endif]-->\r\n    </div>\r\n</body>\r\n\r\n</html>', NULL, 0),
(16, 'ayn_notification_projects_admin', 'Notificación', '<!doctype html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n\r\n<head>\r\n    <title></title>\r\n    <!--[if !mso]><!-- -->\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <!--<![endif]-->\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n    <style type=\"text/css\">\r\n        #outlook a {\r\n            padding: 0;\r\n        }\r\n        \r\n        body {\r\n            margin: 0;\r\n            padding: 0;\r\n            -webkit-text-size-adjust: 100%;\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n        \r\n        table,\r\n        td {\r\n            border-collapse: collapse;\r\n            mso-table-lspace: 0pt;\r\n            mso-table-rspace: 0pt;\r\n        }\r\n        \r\n        img {\r\n            border: 0;\r\n            height: auto;\r\n            line-height: 100%;\r\n            outline: none;\r\n            text-decoration: none;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n        \r\n        p {\r\n            display: block;\r\n            margin: 13px 0;\r\n        }\r\n    </style>\r\n    <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n    <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .mj-outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n    <!--[if !mso]><!-->\r\n    <link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n    <style type=\"text/css\">\r\n        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,500,700);\r\n    </style>\r\n    <!--<![endif]-->\r\n    <style type=\"text/css\">\r\n        @media only screen and (min-width:480px) {\r\n            .mj-column-per-33 {\r\n                width: 33% !important;\r\n                max-width: 33%;\r\n            }\r\n            .mj-column-per-66 {\r\n                width: 66% !important;\r\n                max-width: 66%;\r\n            }\r\n            .mj-column-per-100 {\r\n                width: 100% !important;\r\n                max-width: 100%;\r\n            }\r\n            .mj-column-per-33-333333333333336 {\r\n                width: 33.333333333333336% !important;\r\n                max-width: 33.333333333333336%;\r\n            }\r\n        }\r\n    </style>\r\n    <style type=\"text/css\">\r\n        @media only screen and (max-width:480px) {\r\n            table.mj-full-width-mobile {\r\n                width: 100% !important;\r\n            }\r\n            td.mj-full-width-mobile {\r\n                width: auto !important;\r\n            }\r\n        }\r\n    </style>\r\n	\r\n	<!--[if gte mso 9]>\r\n		<style type=\"text/css\">\r\n		img.header { width: 70px; }\r\n		</style>\r\n	<![endif]-->\r\n	\r\n</head>\r\n\r\n<body style=\"background-color:#eeeeef;\">\r\n    <div style=\"background-color:#eeeeef;\">\r\n        <!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#00b393;background-color:#00b393;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00b393;background-color:#00b393;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px 0;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:198px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-33 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;padding:10px 0;word-break:break-word;\">\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n                                                                <tbody>\r\n                                                                    <tr>\r\n                                                                        <td style=\"text-align:center;\"><img class=\"header\" width=\"70\" src=\"{SITE_URL}/files/system/mimasoft-circular-logo.png\" alt=\"logo Mimasoft\"></td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td><td class=\"\" style=\"vertical-align:top;width:396px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-66 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:middle;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"left\" style=\"font-size:0px;padding:18px 0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:left;color:#ffffff;padding-top:10px\">Notificación</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#ffffff;background-color:#ffffff;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#ffffff;background-color:#ffffff;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:0px;padding-top:20px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 25px;word-break:break-word;\">\r\n															<p>\r\n																Hola <strong>{USER_TO_NOTIFY_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>\r\n																Te informamos que el usuario <strong>{USER_ACTION_NAME} {EVENT}</strong> del proyecto <strong>{PROJECT_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>Fecha: <strong>{NOTIFIED_DATE}</strong></p>\r\n															<p>No olvides revisar periódicamente Mimasoft, para estar al tanto de los avances en tus proyectos.</p>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<br>\r\n																¡Que tengas un excelente día!\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n													 <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<span style=\"font-style:italic; color: #9e9e9e;\"> Nota: Por favor no respondas este correo. Si tienes dudas, ingresa a </span>\r\n																<br>\r\n																<a href=\"{CONTACT_URL}\">{CONTACT_URL}</a>\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#505050;background-color:#505050;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#505050;background-color:#505050;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:580px;\" ><![endif]-->\r\n                            <div align=\"center\" class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:center;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td align=\"center\" style=\"vertical-align:top;padding:0px;\">\r\n                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:center;color:#FFFFFF;\">\r\n                                                                <center>{SIGNATURE}</center>\r\n															</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><![endif]-->\r\n    </div>\r\n</body>\r\n\r\n</html>', NULL, 0),
(17, 'ayn_alerts_admin', 'Alerta', '<!doctype html>\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n\r\n<head>\r\n    <title></title>\r\n    <!--[if !mso]><!-- -->\r\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n    <!--<![endif]-->\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n    <style type=\"text/css\">\r\n        #outlook a {\r\n            padding: 0;\r\n        }\r\n        \r\n        body {\r\n            margin: 0;\r\n            padding: 0;\r\n            -webkit-text-size-adjust: 100%;\r\n            -ms-text-size-adjust: 100%;\r\n        }\r\n        \r\n        table,\r\n        td {\r\n            border-collapse: collapse;\r\n            mso-table-lspace: 0pt;\r\n            mso-table-rspace: 0pt;\r\n        }\r\n        \r\n        img {\r\n            border: 0;\r\n            height: auto;\r\n            line-height: 100%;\r\n            outline: none;\r\n            text-decoration: none;\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n        \r\n        p {\r\n            display: block;\r\n            margin: 13px 0;\r\n        }\r\n    </style>\r\n    <!--[if mso]>\r\n        <xml>\r\n        <o:OfficeDocumentSettings>\r\n          <o:AllowPNG/>\r\n          <o:PixelsPerInch>96</o:PixelsPerInch>\r\n        </o:OfficeDocumentSettings>\r\n        </xml>\r\n        <![endif]-->\r\n    <!--[if lte mso 11]>\r\n        <style type=\"text/css\">\r\n          .mj-outlook-group-fix { width:100% !important; }\r\n        </style>\r\n        <![endif]-->\r\n    <!--[if !mso]><!-->\r\n    <link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\r\n    <style type=\"text/css\">\r\n        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,500,700);\r\n    </style>\r\n    <!--<![endif]-->\r\n    <style type=\"text/css\">\r\n        @media only screen and (min-width:480px) {\r\n            .mj-column-per-33 {\r\n                width: 33% !important;\r\n                max-width: 33%;\r\n            }\r\n            .mj-column-per-66 {\r\n                width: 66% !important;\r\n                max-width: 66%;\r\n            }\r\n            .mj-column-per-100 {\r\n                width: 100% !important;\r\n                max-width: 100%;\r\n            }\r\n            .mj-column-per-33-333333333333336 {\r\n                width: 33.333333333333336% !important;\r\n                max-width: 33.333333333333336%;\r\n            }\r\n        }\r\n    </style>\r\n    <style type=\"text/css\">\r\n        @media only screen and (max-width:480px) {\r\n            table.mj-full-width-mobile {\r\n                width: 100% !important;\r\n            }\r\n            td.mj-full-width-mobile {\r\n                width: auto !important;\r\n            }\r\n        }\r\n    </style>\r\n	\r\n	<!--[if gte mso 9]>\r\n		<style type=\"text/css\">\r\n		img.header { width: 70px; }\r\n		</style>\r\n	<![endif]-->\r\n	\r\n</head>\r\n\r\n<body style=\"background-color:#eeeeef;\">\r\n    <div style=\"background-color:#eeeeef;\">\r\n        <!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#00b393;background-color:#00b393;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00b393;background-color:#00b393;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px 0;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:198px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-33 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;padding:10px 0;word-break:break-word;\">\r\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\r\n                                                                <tbody>\r\n                                                                    <tr>\r\n                                                                        <td style=\"text-align:center;\"><img class=\"header\" width=\"70\" src=\"{SITE_URL}/files/system/mimasoft-circular-logo.png\" alt=\"logo Mimasoft\"></td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                            </table>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td><td class=\"\" style=\"vertical-align:top;width:396px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-66 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:middle;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"left\" style=\"font-size:0px;padding:18px 0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:left;color:#ffffff;padding-top:10px\">Alerta</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#ffffff;background-color:#ffffff;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#ffffff;background-color:#ffffff;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:0px;padding-top:20px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n                            <div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td style=\"vertical-align:top;padding:0px;\">\r\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 25px;word-break:break-word;\">\r\n															<p>\r\n																Hola <strong>{USER_TO_NOTIFY_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>\r\n																<strong>{MESSAGE_TYPE}</strong><br>\r\n																Te informamos que <strong>{EVENT}</strong> en el proyecto <strong>{PROJECT_NAME}</strong>\r\n															</p>\r\n															<br>\r\n															<p>Fecha: <strong>{ALERT_DATE}</strong></p>\r\n															<br>\r\n															<p>\r\n																Usuarios alertados: \r\n																<br><br>\r\n																<strong>{ALERTED_USERS}</strong>\r\n															</p>\r\n															<br>\r\n															<p>\r\n																Te recomendamos ingresar al módulo <strong>{MODULE_NAME}</strong> en Mimasoft y consultar los últimos elementos ingresados.\r\n															</p>\r\n															<p>No olvides revisar periódicamente Mimasoft, para estar al tanto de los avances en tus proyectos.</p>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<br>\r\n																¡Que tengas un excelente día!\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n													 <tr>\r\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\r\n															<p>\r\n																<span style=\"font-style:italic; color: #9e9e9e;\"> Nota: Por favor no respondas este correo. Si tienes dudas, ingresa a </span>\r\n																<br>\r\n																<a href=\"{CONTACT_URL}\">{CONTACT_URL}</a>\r\n															</p>\r\n														</td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n\r\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n        <div style=\"background:#505050;background-color:#505050;margin:0px auto;max-width:600px;\">\r\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#505050;background-color:#505050;width:100%;\">\r\n                <tbody>\r\n                    <tr>\r\n                        <td style=\"direction:ltr;font-size:0px;padding:10px;text-align:center;\">\r\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:580px;\" ><![endif]-->\r\n                            <div align=\"center\" class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:center;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                    <tbody>\r\n                                        <tr>\r\n                                            <td align=\"center\" style=\"vertical-align:top;padding:0px;\">\r\n                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n                                                    <tr>\r\n                                                        <td align=\"center\" style=\"font-size:0px;word-break:break-word;\">\r\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:center;color:#FFFFFF;\">\r\n                                                                <center>{SIGNATURE}</center>\r\n															</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                </table>\r\n                                            </td>\r\n                                        </tr>\r\n                                    </tbody>\r\n                                </table>\r\n                            </div>\r\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\r\n                        </td>\r\n                    </tr>\r\n                </tbody>\r\n            </table>\r\n        </div>\r\n        <!--[if mso | IE]></td></tr></table><![endif]-->\r\n    </div>\r\n</body>\r\n\r\n</html>', '', 0),
(18, 'ayn_alerts_projects_air', 'MIMAire - Alertas de calidad del Aire reportadas a la fecha', '<!doctype html>\n<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n\n<head>\n    <title></title>\n    <!--[if !mso]><!-- -->\n    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n    <!--<![endif]-->\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\n    <style type=\"text/css\">\n        #outlook a {\n            padding: 0;\n        }\n        \n        body {\n            margin: 0;\n            padding: 0;\n            -webkit-text-size-adjust: 100%;\n            -ms-text-size-adjust: 100%;\n        }\n        \n        table,\n        td {\n            border-collapse: collapse;\n            mso-table-lspace: 0pt;\n            mso-table-rspace: 0pt;\n        }\n        \n        img {\n            border: 0;\n            height: auto;\n            line-height: 100%;\n            outline: none;\n            text-decoration: none;\n            -ms-interpolation-mode: bicubic;\n        }\n        \n        p {\n            display: block;\n            margin: 13px 0;\n        }\n    </style>\n    <!--[if mso]>\n        <xml>\n        <o:OfficeDocumentSettings>\n          <o:AllowPNG/>\n          <o:PixelsPerInch>96</o:PixelsPerInch>\n        </o:OfficeDocumentSettings>\n        </xml>\n        <![endif]-->\n    <!--[if lte mso 11]>\n        <style type=\"text/css\">\n          .mj-outlook-group-fix { width:100% !important; }\n        </style>\n        <![endif]-->\n    <!--[if !mso]><!-->\n    <link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\n    <style type=\"text/css\">\n        @import url(https://fonts.googleapis.com/css?family=Lato:300,400,500,700);\n    </style>\n    <!--<![endif]-->\n    <style type=\"text/css\">\n        @media only screen and (min-width:480px) {\n            .mj-column-per-33 {\n                width: 33% !important;\n                max-width: 33%;\n            }\n            .mj-column-per-66 {\n                width: 66% !important;\n                max-width: 66%;\n            }\n            .mj-column-per-100 {\n                width: 100% !important;\n                max-width: 100%;\n            }\n            .mj-column-per-33-333333333333336 {\n                width: 33.333333333333336% !important;\n                max-width: 33.333333333333336%;\n            }\n        }\n    </style>\n    <style type=\"text/css\">\n        @media only screen and (max-width:480px) {\n            table.mj-full-width-mobile {\n                width: 100% !important;\n            }\n            td.mj-full-width-mobile {\n                width: auto !important;\n            }\n        }\n    </style>\n	\n	<!--[if gte mso 9]>\n		<style type=\"text/css\">\n		img.header { width: 70px; }\n		</style>\n	<![endif]-->\n	\n</head>\n\n<body style=\"background-color:#eeeeef;\">\n    <div style=\"background-color:#eeeeef;\">\n        <!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\n        <div style=\"background:#00b393;background-color:#00b393;margin:0px auto;max-width:600px;\">\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00b393;background-color:#00b393;width:100%;\">\n                <tbody>\n                    <tr>\n                        <td style=\"direction:ltr;font-size:0px;padding:10px 0;text-align:center;\">\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:198px;\" ><![endif]-->\n                            <div class=\"mj-column-per-33 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"vertical-align:top;padding:0px;\">\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                                    <tr>\n                                                        <td align=\"center\" style=\"font-size:0px;padding:10px 0;word-break:break-word;\">\n                                                            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\n                                                                <tbody>\n                                                                    <tr>\n                                                                        <td style=\"text-align:center;\"><img class=\"header\" width=\"70\" src=\"{SITE_URL}/files/system/mimasoft-circular-logo.png\" alt=\"logo Mimasoft\"></td>\n                                                                    </tr>\n                                                                </tbody>\n                                                            </table>\n                                                        </td>\n                                                    </tr>\n                                                </table>\n                                            </td>\n                                        </tr>\n                                    </tbody>\n                                </table>\n                            </div>\n                            <!--[if mso | IE]></td><td class=\"\" style=\"vertical-align:top;width:396px;\" ><![endif]-->\n                            <div class=\"mj-column-per-66 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"vertical-align:middle;padding:0px;\">\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                                    <tr>\n                                                        <td align=\"left\" style=\"font-size:0px;padding:18px 0px;word-break:break-word;\">\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:left;color:#ffffff;padding-top:10px\">Alerta</div>\n                                                        </td>\n                                                    </tr>\n                                                </table>\n                                            </td>\n                                        </tr>\n                                    </tbody>\n                                </table>\n                            </div>\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\n                        </td>\n                    </tr>\n                </tbody>\n            </table>\n        </div>\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\n        <div style=\"background:#ffffff;background-color:#ffffff;margin:0px auto;max-width:600px;\">\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#ffffff;background-color:#ffffff;width:100%;\">\n                <tbody>\n                    <tr>\n                        <td style=\"direction:ltr;font-size:0px;padding:0px;padding-top:20px;text-align:center;\">\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:600px;\" ><![endif]-->\n                            <div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"vertical-align:top;padding:0px;\">\n                                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                                    <tr>\n                                                        <td style=\"font-size:14px;padding:10px 25px;word-break:break-word;\">\n															<p>\n																Hola <strong>{USER_TO_NOTIFY_NAME}</strong>\n															</p>\n															<p>\n																Te informamos de las alertas levantadas por MIMAire, en el proyecto <strong>{PROJECT_NAME}</strong> a la fecha <strong>{ALERT_DATE}</strong> para las próximas 24 horas. De acuerdo al Modelo <strong>{MODEL_NAME}</strong> son:\n															</p>\n															<br>\n															{HTML_FORECAST_TABLE}\n															<br>\n															<p>\n																Te recomendamos ingresar al módulo <strong>{MODULE_NAME}</strong> en MIMAire y consultar la información asociada a las alertas.\n															</p>\n															<p>\n																No olvides revisar periódicamente MIMAire, para estar al tanto de los indicadores de calidad del aire en tus proyectos.\n															</p>\n                                                        </td>\n                                                    </tr>\n                                                    <tr>\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\n															<p>\n																¡Que tengas un excelente día!\n															</p>\n														</td>\n                                                    </tr>\n													 <tr>\n                                                        <td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\n															<p>\n																<span style=\"font-style:italic; color: #9e9e9e;\"> Nota: Por favor no respondas este correo. Si tienes dudas, ingresa a </span>\n																<br>\n																<a href=\"{CONTACT_URL}\">{CONTACT_URL}</a>\n															</p>\n														</td>\n                                                    </tr>\n                                                </table>\n                                            </td>\n                                        </tr>\n                                    </tbody>\n                                </table>\n                            </div>\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\n                        </td>\n                    </tr>\n                </tbody>\n            </table>\n        </div>\n\n        <!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\n        <div style=\"background:#505050;background-color:#505050;margin:0px auto;max-width:600px;\">\n            <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#505050;background-color:#505050;width:100%;\">\n                <tbody>\n                    <tr>\n                        <td style=\"direction:ltr;font-size:0px;padding:10px;text-align:center;\">\n                            <!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:580px;\" ><![endif]-->\n                            <div align=\"center\" class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:center;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                    <tbody>\n                                        <tr>\n                                            <td align=\"center\" style=\"vertical-align:top;padding:0px;\">\n                                                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n                                                    <tr>\n                                                        <td align=\"center\" style=\"font-size:0px;word-break:break-word;\">\n                                                            <div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:center;color:#FFFFFF;\">\n                                                                <center>{SIGNATURE}</center>\n															</div>\n                                                        </td>\n                                                    </tr>\n                                                </table>\n                                            </td>\n                                        </tr>\n                                    </tbody>\n                                </table>\n                            </div>\n                            <!--[if mso | IE]></td></tr></table><![endif]-->\n                        </td>\n                    </tr>\n                </tbody>\n            </table>\n        </div>\n        <!--[if mso | IE]></td></tr></table><![endif]-->\n    </div>\n</body>\n\n</html>', '<!doctype html>\n	<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\n\n	<head>\n		<title></title>\n		<!--[if !mso]><!-- -->\n		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n		<!--<![endif]-->\n		<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n		<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\n		<style type=\"text/css\">\n			#outlook a {\n				padding: 0;\n			}\n			\n			body {\n				margin: 0;\n				padding: 0;\n				-webkit-text-size-adjust: 100%;\n				-ms-text-size-adjust: 100%;\n			}\n			\n			table,\n			td {\n				border-collapse: collapse;\n				mso-table-lspace: 0pt;\n				mso-table-rspace: 0pt;\n			}\n			\n			img {\n				border: 0;\n				height: auto;\n				line-height: 100%;\n				outline: none;\n				text-decoration: none;\n				-ms-interpolation-mode: bicubic;\n			}\n			\n			p {\n				display: block;\n				margin: 13px 0;\n			}\n		</style>\n		<!--[if mso]>\n			<xml>\n			<o:OfficeDocumentSettings>\n			  <o:AllowPNG/>\n			  <o:PixelsPerInch>96</o:PixelsPerInch>\n			</o:OfficeDocumentSettings>\n			</xml>\n			<![endif]-->\n		<!--[if lte mso 11]>\n			<style type=\"text/css\">\n			  .mj-outlook-group-fix { width:100% !important; }\n			</style>\n			<![endif]-->\n		<!--[if !mso]><!-->\n		<link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,500,700\" rel=\"stylesheet\" type=\"text/css\">\n		<style type=\"text/css\">\n			@import url(https://fonts.googleapis.com/css?family=Lato:300,400,500,700);\n		</style>\n		<!--<![endif]-->\n		<style type=\"text/css\">\n			@media only screen and (min-width:480px) {\n				.mj-column-per-33 {\n					width: 33% !important;\n					max-width: 33%;\n				}\n				.mj-column-per-66 {\n					width: 66% !important;\n					max-width: 66%;\n				}\n				.mj-column-per-100 {\n					width: 100% !important;\n					max-width: 100%;\n				}\n				.mj-column-per-33-333333333333336 {\n					width: 33.333333333333336% !important;\n					max-width: 33.333333333333336%;\n				}\n			}\n		</style>\n		<style type=\"text/css\">\n			@media only screen and (max-width:480px) {\n				table.mj-full-width-mobile {\n					width: 100% !important;\n				}\n				td.mj-full-width-mobile {\n					width: auto !important;\n				}\n			}\n		</style>\n		\n		<!--[if gte mso 9]>\n			<style type=\"text/css\">\n			img.header { width: 70px; }\n			</style>\n		<![endif]-->\n		\n	</head>\n\n	<body style=\"background-color:#eeeeef;\">\n		<div style=\"background-color:#eeeeef;\">\n			<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\n			<div style=\"background:#008FC5;background-color:#008FC5;margin:0px auto;max-width:600px;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#008FC5;background-color:#008FC5;width:100%;\">\n					<tbody>\n						<tr>\n							<td style=\"direction:ltr;font-size:0px;padding:10px 0;text-align:center;\">\n								<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:198px;\" ><![endif]-->\n								<div class=\"mj-column-per-33 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n										<tbody>\n											<tr>\n												<td style=\"vertical-align:top;padding:0px;\">\n													<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n														<tr>\n															<td align=\"center\" style=\"font-size:0px;padding:10px 0;word-break:break-word;\">\n																<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:collapse;border-spacing:0px;\">\n																	<tbody>\n																		<tr>\n																			<td style=\"text-align:center;\"><img class=\"header\" width=\"150\" src=\"{SITE_URL}/files/system/logo_particulas_email.png\" alt=\"logo Partículas\"></td>\n																		</tr>\n																	</tbody>\n																</table>\n															</td>\n														</tr>\n													</table>\n												</td>\n											</tr>\n										</tbody>\n									</table>\n								</div>\n								<!--[if mso | IE]></td><td class=\"\" style=\"vertical-align:top;width:396px;\" ><![endif]-->\n								<div class=\"mj-column-per-66 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n										<tbody>\n											<tr>\n												<td style=\"vertical-align:middle;padding:0px;\">\n													<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n														<tr>\n															<td align=\"left\" style=\"font-size:0px;padding:18px 0px;word-break:break-word;\">\n																<div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:left;color:#ffffff;padding-top:10px\">Alerta</div>\n															</td>\n														</tr>\n													</table>\n												</td>\n											</tr>\n										</tbody>\n									</table>\n								</div>\n								<!--[if mso | IE]></td></tr></table><![endif]-->\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</div>\n			<!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\n			<div style=\"background:#ffffff;background-color:#ffffff;margin:0px auto;max-width:600px;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#ffffff;background-color:#ffffff;width:100%;\">\n					<tbody>\n						<tr>\n							<td style=\"direction:ltr;font-size:0px;padding:0px;padding-top:20px;text-align:center;\">\n								<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:600px;\" ><![endif]-->\n								<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n										<tbody>\n											<tr>\n												<td style=\"vertical-align:top;padding:0px;\">\n													<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n														<tr>\n															<td style=\"font-size:14px;padding:10px 25px;word-break:break-word;\">\n																<p>\n																	Hola <strong>{USER_TO_NOTIFY_NAME}</strong>\n																</p>\n																<p>\n																	Te informamos de las alertas levantadas por <strong>PARTICULAS</strong> en el <strong>{PROJECT_NAME}</strong> para el día <strong>{ALERT_DATE}</strong>:\n																</p>\n																<br>\n																{HTML_FORECAST_TABLE}\n																<br>\n																<p>\n																	En términos meteorológicos se pronostica lo siguiente: {BULLETIN_TEXT}\n																</p>\n																<p style=\"text-align:center;\">\n																	{CHART_IMAGES}\n																</p>\n																<p>\n																	Te recomendamos ingresar al módulo <strong>{MODULE_NAME}</strong> de la plataforma <strong>MIMAire®</strong> de <strong>PARTICULAS</strong> y consultar la información asociada a las alertas para cada una de las estaciones; Hotel Mina, COM, Chacay, Quillayes y Cuncumén. También puedes observar la pluma de dispersión de MP10.\n																</p>\n																<p>\n																	No olvides revisar periódicamente <strong>MIMAire®</strong> de <strong>PARTICULAS</strong> para estar al tanto de los indicadores de calidad del aire en tus actividades y proyectos.\n																</p>\n															</td>\n														</tr>\n														<tr>\n															<td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\n																<p>\n																	¡Que tengas un excelente día!\n																</p>\n															</td>\n														</tr>\n														 <tr>\n															<td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\n																<p>\n																	<span style=\"font-style:italic; color: #9e9e9e;\"> Nota: Por favor no respondas este correo. Si tienes dudas, ingresa a </span>\n																	<br>\n																	<a href=\"{CONTACT_URL}\">{CONTACT_URL}</a>\n																</p>\n															</td>\n														</tr>\n														<tr>\n															<td style=\"font-size:14px;padding:10px 30px;word-break:break-word;\">\n																<p>\n																	Este correo fue enviado a\n																	{HTML_CC_USERS}\n																</p>\n															</td>\n														</tr>\n													</table>\n												</td>\n											</tr>\n										</tbody>\n									</table>\n								</div>\n								<!--[if mso | IE]></td></tr></table><![endif]-->\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</div>\n\n			<!--[if mso | IE]></td></tr></table><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\n			<div style=\"background:#9AD0D7;background-color:#9AD0D7;margin:0px auto;max-width:600px;\">\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#9AD0D7;background-color:#9AD0D7;width:100%;\">\n					<tbody>\n						<tr>\n							<td style=\"direction:ltr;font-size:0px;padding:10px;text-align:center;\">\n								<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td class=\"\" style=\"vertical-align:top;width:580px;\" ><![endif]-->\n								<div align=\"center\" class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:center;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\n									<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n										<tbody>\n											<tr>\n												<td align=\"center\" style=\"vertical-align:top;padding:0px;\">\n													<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\n														<tr>\n															<td align=\"center\" style=\"font-size:0px;word-break:break-word;\">\n																<div style=\"font-family:Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif;font-size:20px;line-height:1;text-align:center;color:#FFFFFF;\">\n																	<center>{SIGNATURE}</center>\n																</div>\n															</td>\n														</tr>\n													</table>\n												</td>\n											</tr>\n										</tbody>\n									</table>\n								</div>\n								<!--[if mso | IE]></td></tr></table><![endif]-->\n							</td>\n						</tr>\n					</tbody>\n				</table>\n			</div>\n			<!--[if mso | IE]></td></tr></table><![endif]-->\n		</div>\n	</body>\n\n</html>', 0),
(19, 'signature_air', 'Firma MIMAire', '<table><tr>\r\n<td><p style=\"color:white\">Hecho con <span style=\"font-size:25px;\">♥</span> por &nbsp;</p></td>\r\n<td><a href=\"{SITE_URL}\" target=\"_blank\"><img src=\"{SITE_URL}/files/system/mimasoft-site-logo_firma_mail.png\" width=\"80px\"  alt=\"logo Mimasoft\"></a></td>\r\n</tr></table>', '<table><tr>\n<td><p style=\"color:white\">Desarrollado por &nbsp;</p></td>\n<td><a href=\"{SITE_URL}\" target=\"_blank\"><img src=\"{SITE_URL}/files/system/mimaire.png\" width=\"80\"  alt=\"logo Mimaire\"></a></td>\n</tr></table>', 0);

-- --------------------------------------------------------

--
-- Table structure for table `estados_cumplimiento_compromisos`
--

CREATE TABLE `estados_cumplimiento_compromisos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `nombre_estado` varchar(500) NOT NULL,
  `tipo_evaluacion` enum('rca','reportable') NOT NULL,
  `categoria` varchar(500) NOT NULL,
  `color` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estados_evaluacion_comunidades`
--

CREATE TABLE `estados_evaluacion_comunidades` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `nombre_estado` varchar(500) NOT NULL,
  `categoria` varchar(500) NOT NULL,
  `color` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `estados_tramitacion_permisos`
--

CREATE TABLE `estados_tramitacion_permisos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `nombre_estado` varchar(500) NOT NULL,
  `categoria` varchar(500) NOT NULL,
  `color` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_acuerdos`
--

CREATE TABLE `evaluaciones_acuerdos` (
  `id` int(11) NOT NULL,
  `id_valor_acuerdo` int(11) NOT NULL,
  `id_stakeholder` int(11) NOT NULL,
  `estado_tramitacion` int(11) NOT NULL,
  `estado_actividades` int(11) NOT NULL,
  `estado_financiero` int(11) NOT NULL,
  `observaciones` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_cumplimiento_compromisos_rca`
--

CREATE TABLE `evaluaciones_cumplimiento_compromisos_rca` (
  `id` int(11) NOT NULL,
  `id_valor_compromiso` int(11) NOT NULL,
  `id_evaluado` int(11) NOT NULL,
  `id_estados_cumplimiento_compromiso` int(11) DEFAULT NULL,
  `id_criticidad` int(11) DEFAULT NULL,
  `responsable_reporte` varchar(500) DEFAULT NULL,
  `plazo_cierre` date DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `responsable` int(11) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_cumplimiento_compromisos_reportables`
--

CREATE TABLE `evaluaciones_cumplimiento_compromisos_reportables` (
  `id` int(11) NOT NULL,
  `id_valor_compromiso` int(11) NOT NULL,
  `id_planificacion` int(11) NOT NULL,
  `id_estados_cumplimiento_compromiso` int(11) DEFAULT NULL,
  `ejecucion` varchar(500) DEFAULT NULL,
  `id_criticidad` int(11) DEFAULT NULL,
  `responsable_reporte` varchar(500) DEFAULT NULL,
  `plazo_cierre` date DEFAULT NULL,
  `observaciones` varchar(500) DEFAULT NULL,
  `responsable` int(11) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Las evaluaciones de compromisos hechas por cliente, cruce entre compromiso y evaluados en donde se define un estado';

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_feedback`
--

CREATE TABLE `evaluaciones_feedback` (
  `id` int(11) NOT NULL,
  `id_valor_feedback` int(11) NOT NULL,
  `respuesta` varchar(500) NOT NULL,
  `estado_respuesta` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluaciones_tramitacion_permisos`
--

CREATE TABLE `evaluaciones_tramitacion_permisos` (
  `id` int(11) NOT NULL,
  `id_valor_permiso` int(11) NOT NULL,
  `id_evaluado` int(11) NOT NULL,
  `id_estados_tramitacion_permisos` int(11) DEFAULT NULL,
  `criticidad` enum('Si','No') DEFAULT NULL,
  `responsable_reporte` varchar(500) DEFAULT NULL,
  `plazo_cierre` date DEFAULT NULL,
  `observaciones` varchar(500) NOT NULL,
  `responsable` int(11) NOT NULL,
  `fecha_evaluacion` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluados_permisos`
--

CREATE TABLE `evaluados_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `nombre_evaluado` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evaluados_rca_compromisos`
--

CREATE TABLE `evaluados_rca_compromisos` (
  `id` int(11) NOT NULL,
  `id_compromiso` int(11) NOT NULL,
  `nombre_evaluado` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `location` mediumtext COLLATE utf8_unicode_ci,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `labels` text COLLATE utf8_unicode_ci NOT NULL,
  `share_with` mediumtext COLLATE utf8_unicode_ci,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `color` varchar(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `evidencias_acuerdos`
--

CREATE TABLE `evidencias_acuerdos` (
  `id` int(11) NOT NULL,
  `id_evaluacion_acuerdo` int(11) NOT NULL,
  `archivo` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evidencias_cumplimiento_compromisos`
--

CREATE TABLE `evidencias_cumplimiento_compromisos` (
  `id` int(11) NOT NULL,
  `id_evaluacion_cumplimiento_compromiso` int(11) NOT NULL,
  `tipo_evaluacion` enum('rca','reportable') NOT NULL,
  `archivo` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evidencias_evaluaciones_feedback`
--

CREATE TABLE `evidencias_evaluaciones_feedback` (
  `id` int(11) NOT NULL,
  `id_evaluacion_feedback` int(11) NOT NULL,
  `archivo` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `evidencias_tramitacion_permisos`
--

CREATE TABLE `evidencias_tramitacion_permisos` (
  `id` int(11) NOT NULL,
  `id_evaluacion_tramitacion_permisos` int(11) NOT NULL,
  `archivo` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `expense_date` date NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `amount` double NOT NULL,
  `files` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `contenido` longtext,
  `codigo` varchar(500) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `titulo`, `contenido`, `codigo`, `created`, `created_by`, `modified`, `modified_by`, `deleted`) VALUES
(1, '¿Se pueden cargar masivamente datos en los registros?', 'Si, a través de la herramienta “Carga masiva”, siempre que tu perfil posea esta funcionalidad disponible.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(2, '¿Cómo se pueden cargar las imágenes en los registros?', 'Si el cliente solicita que sus registros tengan la opción de cargar imágenes o archivos, puede arrastrar el archivo al espacio asignado o seleccionar el archivo desde su equipo.\r\n<br><br>\r\nSi desea cargar una imagen en un registro que no posee la opción habilitada, comunícate con el equipo de MIMASOFT en Contacto.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(3, '¿Qué formato de archivos acepta la plataforma?', '.jpg\r\n.png\r\n.vpm\r\n.xls\r\n.xlsx\r\n.doc\r\n.docx\r\n.ppt\r\n.pptx\r\n.zip\r\n.rar\r\n.txt\r\n.pdf\r\n', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(4, '¿Se pueden cargar archivos adjuntos de forma masiva?', 'No, la carga de archivos sólo se encuentra habilitada a nivel de formulario en los respectivos registros.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(5, '¿Se puede descargar o exportar la información de los registros?', 'La plataforma permite exportar la información registrada en formato Excel.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(6, '¿Cómo puedo editar registros cargados con anterioridad?', 'La plataforma es flexible para poder editar cualquier dato ingresado, sin tener que volver a cargar nuevamente la información.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(7, '¿Cuántos archivos adjuntos se pueden cargar a un registro?', 'Sólo se puede cargar un archivo por cada campo de tipo “Archivo” que exista en el registro.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(8, '¿Se pueden agregar categorías a los desplegables de los registros?', 'Sólo se pueden agregar categorías a los despegables que consultan información desde Listas Mantenedoras.<br><br>\r\nSi deseas incluir una nueva opción dentro de un menú despegable, comunícate con el equipo de MIMASOFT en Contacto.\r\n', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(9, '¿Cómo puedo editar Listas Mantenedoras?', 'Ingresando al módulo de Listas Mantenedoras y posteriormente a la lista de tu interés, puedes añadir, editar o eliminar elementos. Si uno de estos elementos está siendo utilizado para el cálculo de impactos ambientales, no podrás modificarlo o eliminarlo.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(10, 'Si detecto un error en la información del proyecto, ¿Puedo editarla?', 'No, pero puedes solicitar las correcciones al equipo MIMASOFT a través de Contacto.', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(11, '¿Se pueden configurar las notificaciones para que se envíen al correo?', 'Lorem ipsum', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 1),
(12, '¿Todos los usuarios del proyecto pueden editar datos?', 'Cada usuario posee su respectivo perfil, el que define los niveles de acceso dentro de la plataforma. Estos perfiles son definidos por el cliente.<br><br>\r\nSi deseas modificar un perfil de usuario, comunícate con el equipo de MIMASOFT en Contacto.\r\n', 'II', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(13, '¿Qué ocurre si se olvida cargar información con respecto a un mes y se emite el reporte mensual?', 'La plataforma consolida información para la obtención de reporte consultando toda la información disponible en la plataforma. Si se carga información anterior, puede volver a generarse el reporte sin inconvenientes.', 'REP', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(14, '¿Un usuario puede ser utilizado para más de un proyecto?', 'Sí, los usuarios pueden ser asignados a más de un proyecto que pertenezca al mismo cliente.', 'AG', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(15, '¿Puedo yo como usuario incorporar a más personas al proyecto? (Más cuentas)', 'No. Cualquier modificación o solicitud de nuevos usuarios debe comunicarse al equipo de MIMASOFT en Contacto.', 'AG', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(16, '¿Se puede cambiar el usuario (quien carga los datos) por otro a mitad de proyecto?', 'Sí. Los cambios en los usuarios no alteran la información que ya fue ingresada en la plataforma. Dicha modificación debe comunicarse al equipo de MIMASOFT en Contacto.', 'AG', '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', 1, 0),
(17, '¿Cómo se cargan los datos de monitoreo y pronóstico de estaciones meteorológicas?', 'Los datos pueden ser recogidos a través de conexiones con otros sistemas de levantamiento de datos o a través de la carga masiva de datos realizada por el consultor. Estas acciones no son realizadas por el cliente', 'II', '0000-00-00 00:00:00', 1, NULL, 1, 0),
(18, '¿Se pueden cambiar usuarios a mitad del proyecto?', 'Sí. Los cambios en los usuarios no alteran la información que ya fue ingresada en la plataforma. Dicha modificación debe comunicarse al equipo de MIMAire en Contacto', 'AG', '0000-00-00 00:00:00', 1, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fases`
--

CREATE TABLE `fases` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `nombre_lang` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fases`
--

INSERT INTO `fases` (`id`, `nombre`, `nombre_lang`, `deleted`) VALUES
(1, 'Desarrollo', 'development', 0),
(2, 'Construcción', 'construction', 0),
(3, 'Operación y Mantenimiento', 'operation_and_maintenance', 0),
(4, 'Fin de Vida', 'end_of_life', 0),
(5, 'Ciclo Completo', 'complete_cycle', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fase_rel_pu`
--

CREATE TABLE `fase_rel_pu` (
  `id` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_proceso_unitario` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fase_rel_pu`
--

INSERT INTO `fase_rel_pu` (`id`, `id_fase`, `id_proceso_unitario`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 1, 1, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:10:26', 0),
(2, 2, 1, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:10:26', 0),
(3, 3, 1, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:10:26', 0),
(4, 4, 1, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:10:26', 0),
(5, 5, 1, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:10:26', 0),
(6, 2, 2, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:11:43', 0),
(7, 5, 2, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:11:43', 0),
(8, 1, 3, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:12:31', 0),
(9, 2, 3, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:12:31', 0),
(10, 3, 3, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:12:31', 0),
(11, 5, 3, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:12:31', 0),
(12, 1, 4, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:03', 0),
(13, 2, 4, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:03', 0),
(14, 3, 4, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:03', 0),
(15, 5, 4, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:03', 0),
(16, 1, 5, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:29', 0),
(17, 2, 5, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:29', 0),
(18, 3, 5, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:29', 0),
(19, 4, 5, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:29', 0),
(20, 5, 5, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:29', 0),
(21, 4, 6, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:46', 0),
(22, 5, 6, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:13:46', 0),
(23, 4, 7, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:14:04', 0),
(24, 5, 7, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:14:04', 0),
(25, 2, 8, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:14:53', 0),
(26, 3, 8, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:14:53', 0),
(27, 5, 8, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:14:53', 0),
(28, 2, 9, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:15:09', 0),
(29, 4, 9, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:15:09', 0),
(30, 5, 9, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:15:09', 0),
(33, 2, 11, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:16:17', 0),
(34, 3, 11, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:16:17', 0),
(35, 5, 11, 1, 1, '2019-04-24 00:00:00', '2019-04-19 18:16:17', 0),
(37, 1, 12, 1, 1, '2019-04-24 00:00:00', '2019-04-23 22:03:23', 0),
(38, 2, 10, 1, 1, '2020-02-12 19:53:51', '2020-02-12 19:53:51', 0),
(39, 5, 10, 1, 1, '2020-02-12 19:53:51', '2020-02-12 19:53:51', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback_matrix_config`
--

CREATE TABLE `feedback_matrix_config` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feedback_matrix_config_rel_campos`
--

CREATE TABLE `feedback_matrix_config_rel_campos` (
  `id` int(11) NOT NULL,
  `id_feedback_matrix_config` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fontawesome`
--

CREATE TABLE `fontawesome` (
  `id` int(11) NOT NULL,
  `clase` varchar(500) NOT NULL,
  `unicode` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fontawesome`
--

INSERT INTO `fontawesome` (`id`, `clase`, `unicode`, `deleted`) VALUES
(1, 'fa-500px', 'f26e', 0),
(2, 'fa-address-book', 'f2b9', 0),
(3, 'fa-address-book-o', 'f2ba', 0),
(4, 'fa-address-card', 'f2bb', 0),
(5, 'fa-address-card-o', 'f2bc', 0),
(6, 'fa-adjust', 'f042', 0),
(7, 'fa-adn', 'f170', 0),
(8, 'fa-align-center', 'f037', 0),
(9, 'fa-align-justify', 'f039', 0),
(10, 'fa-align-left', 'f036', 0),
(11, 'fa-align-right', 'f038', 0),
(12, 'fa-amazon', 'f270', 0),
(13, 'fa-ambulance', 'f0f9', 0),
(14, 'fa-american-sign-language-interpreting', 'f2a3', 0),
(15, 'fa-anchor', 'f13d', 0),
(16, 'fa-android', 'f17b', 0),
(17, 'fa-angellist', 'f209', 0),
(18, 'fa-angle-double-down', 'f103', 0),
(19, 'fa-angle-double-left', 'f100', 0),
(20, 'fa-angle-double-right', 'f101', 0),
(21, 'fa-angle-double-up', 'f102', 0),
(22, 'fa-angle-down', 'f107', 0),
(23, 'fa-angle-left', 'f104', 0),
(24, 'fa-angle-right', 'f105', 0),
(25, 'fa-angle-up', 'f106', 0),
(26, 'fa-apple', 'f179', 0),
(27, 'fa-archive', 'f187', 0),
(28, 'fa-area-chart', 'f1fe', 0),
(29, 'fa-arrow-circle-down', 'f0ab', 0),
(30, 'fa-arrow-circle-left', 'f0a8', 0),
(31, 'fa-arrow-circle-o-down', 'f01a', 0),
(32, 'fa-arrow-circle-o-left', 'f190', 0),
(33, 'fa-arrow-circle-o-right', 'f18e', 0),
(34, 'fa-arrow-circle-o-up', 'f01b', 0),
(35, 'fa-arrow-circle-right', 'f0a9', 0),
(36, 'fa-arrow-circle-up', 'f0aa', 0),
(37, 'fa-arrow-down', 'f063', 0),
(38, 'fa-arrow-left', 'f060', 0),
(39, 'fa-arrow-right', 'f061', 0),
(40, 'fa-arrow-up', 'f062', 0),
(41, 'fa-arrows', 'f047', 0),
(42, 'fa-arrows-alt', 'f0b2', 0),
(43, 'fa-arrows-h', 'f07e', 0),
(44, 'fa-arrows-v', 'f07d', 0),
(45, 'fa-asl-interpreting', 'f2a3', 0),
(46, 'fa-assistive-listening-systems', 'f2a2', 0),
(47, 'fa-asterisk', 'f069', 0),
(48, 'fa-at', 'f1fa', 0),
(49, 'fa-audio-description', 'f29e', 0),
(50, 'fa-automobile', 'f1b9', 0),
(51, 'fa-backward', 'f04a', 0),
(52, 'fa-balance-scale', 'f24e', 0),
(53, 'fa-ban', 'f05e', 0),
(54, 'fa-bandcamp', 'f2d5', 0),
(55, 'fa-bank', 'f19c', 0),
(56, 'fa-bar-chart', 'f080', 0),
(57, 'fa-bar-chart-o', 'f080', 0),
(58, 'fa-barcode', 'f02a', 0),
(59, 'fa-bars', 'f0c9', 0),
(60, 'fa-bath', 'f2cd', 0),
(61, 'fa-bathtub', 'f2cd', 0),
(62, 'fa-battery', 'f240', 0),
(63, 'fa-battery-0', 'f244', 0),
(64, 'fa-battery-1', 'f243', 0),
(65, 'fa-battery-2', 'f242', 0),
(66, 'fa-battery-3', 'f241', 0),
(67, 'fa-battery-4', 'f240', 0),
(68, 'fa-battery-empty', 'f244', 0),
(69, 'fa-battery-full', 'f240', 0),
(70, 'fa-battery-half', 'f242', 0),
(71, 'fa-battery-quarter', 'f243', 0),
(72, 'fa-battery-three-quarters', 'f241', 0),
(73, 'fa-bed', 'f236', 0),
(74, 'fa-beer', 'f0fc', 0),
(75, 'fa-behance', 'f1b4', 0),
(76, 'fa-behance-square', 'f1b5', 0),
(77, 'fa-bell', 'f0f3', 0),
(78, 'fa-bell-o', 'f0a2', 0),
(79, 'fa-bell-slash', 'f1f6', 0),
(80, 'fa-bell-slash-o', 'f1f7', 0),
(81, 'fa-bicycle', 'f206', 0),
(82, 'fa-binoculars', 'f1e5', 0),
(83, 'fa-birthday-cake', 'f1fd', 0),
(84, 'fa-bitbucket', 'f171', 0),
(85, 'fa-bitbucket-square', 'f172', 0),
(86, 'fa-bitcoin', 'f15a', 0),
(87, 'fa-black-tie', 'f27e', 0),
(88, 'fa-blind', 'f29d', 0),
(89, 'fa-bluetooth', 'f293', 0),
(90, 'fa-bluetooth-b', 'f294', 0),
(91, 'fa-bold', 'f032', 0),
(92, 'fa-bolt', 'f0e7', 0),
(93, 'fa-bomb', 'f1e2', 0),
(94, 'fa-book', 'f02d', 0),
(95, 'fa-bookmark', 'f02e', 0),
(96, 'fa-bookmark-o', 'f097', 0),
(97, 'fa-braille', 'f2a1', 0),
(98, 'fa-briefcase', 'f0b1', 0),
(99, 'fa-btc', 'f15a', 0),
(100, 'fa-bug', 'f188', 0),
(101, 'fa-building', 'f1ad', 0),
(102, 'fa-building-o', 'f0f7', 0),
(103, 'fa-bullhorn', 'f0a1', 0),
(104, 'fa-bullseye', 'f140', 0),
(105, 'fa-bus', 'f207', 0),
(106, 'fa-buysellads', 'f20d', 0),
(107, 'fa-cab', 'f1ba', 0),
(108, 'fa-calculator', 'f1ec', 0),
(109, 'fa-calendar', 'f073', 0),
(110, 'fa-calendar-check-o', 'f274', 0),
(111, 'fa-calendar-minus-o', 'f272', 0),
(112, 'fa-calendar-o', 'f133', 0),
(113, 'fa-calendar-plus-o', 'f271', 0),
(114, 'fa-calendar-times-o', 'f273', 0),
(115, 'fa-camera', 'f030', 0),
(116, 'fa-camera-retro', 'f083', 0),
(117, 'fa-car', 'f1b9', 0),
(118, 'fa-caret-down', 'f0d7', 0),
(119, 'fa-caret-left', 'f0d9', 0),
(120, 'fa-caret-right', 'f0da', 0),
(121, 'fa-caret-square-o-down', 'f150', 0),
(122, 'fa-caret-square-o-left', 'f191', 0),
(123, 'fa-caret-square-o-right', 'f152', 0),
(124, 'fa-caret-square-o-up', 'f151', 0),
(125, 'fa-caret-up', 'f0d8', 0),
(126, 'fa-cart-arrow-down', 'f218', 0),
(127, 'fa-cart-plus', 'f217', 0),
(128, 'fa-cc', 'f20a', 0),
(129, 'fa-cc-amex', 'f1f3', 0),
(130, 'fa-cc-diners-club', 'f24c', 0),
(131, 'fa-cc-discover', 'f1f2', 0),
(132, 'fa-cc-jcb', 'f24b', 0),
(133, 'fa-cc-mastercard', 'f1f1', 0),
(134, 'fa-cc-paypal', 'f1f4', 0),
(135, 'fa-cc-stripe', 'f1f5', 0),
(136, 'fa-cc-visa', 'f1f0', 0),
(137, 'fa-certificate', 'f0a3', 0),
(138, 'fa-chain', 'f0c1', 0),
(139, 'fa-chain-broken', 'f127', 0),
(140, 'fa-check', 'f00c', 0),
(141, 'fa-check-circle', 'f058', 0),
(142, 'fa-check-circle-o', 'f05d', 0),
(143, 'fa-check-square', 'f14a', 0),
(144, 'fa-check-square-o', 'f046', 0),
(145, 'fa-chevron-circle-down', 'f13a', 0),
(146, 'fa-chevron-circle-left', 'f137', 0),
(147, 'fa-chevron-circle-right', 'f138', 0),
(148, 'fa-chevron-circle-up', 'f139', 0),
(149, 'fa-chevron-down', 'f078', 0),
(150, 'fa-chevron-left', 'f053', 0),
(151, 'fa-chevron-right', 'f054', 0),
(152, 'fa-chevron-up', 'f077', 0),
(153, 'fa-child', 'f1ae', 0),
(154, 'fa-chrome', 'f268', 0),
(155, 'fa-circle', 'f111', 0),
(156, 'fa-circle-o', 'f10c', 0),
(157, 'fa-circle-o-notch', 'f1ce', 0),
(158, 'fa-circle-thin', 'f1db', 0),
(159, 'fa-clipboard', 'f0ea', 0),
(160, 'fa-clock-o', 'f017', 0),
(161, 'fa-clone', 'f24d', 0),
(162, 'fa-close', 'f00d', 0),
(163, 'fa-cloud', 'f0c2', 0),
(164, 'fa-cloud-download', 'f0ed', 0),
(165, 'fa-cloud-upload', 'f0ee', 0),
(166, 'fa-cny', 'f157', 0),
(167, 'fa-code', 'f121', 0),
(168, 'fa-code-fork', 'f126', 0),
(169, 'fa-codepen', 'f1cb', 0),
(170, 'fa-codiepie', 'f284', 0),
(171, 'fa-coffee', 'f0f4', 0),
(172, 'fa-cog', 'f013', 0),
(173, 'fa-cogs', 'f085', 0),
(174, 'fa-columns', 'f0db', 0),
(175, 'fa-comment', 'f075', 0),
(176, 'fa-comment-o', 'f0e5', 0),
(177, 'fa-commenting', 'f27a', 0),
(178, 'fa-commenting-o', 'f27b', 0),
(179, 'fa-comments', 'f086', 0),
(180, 'fa-comments-o', 'f0e6', 0),
(181, 'fa-compass', 'f14e', 0),
(182, 'fa-compress', 'f066', 0),
(183, 'fa-connectdevelop', 'f20e', 0),
(184, 'fa-contao', 'f26d', 0),
(185, 'fa-copy', 'f0c5', 0),
(186, 'fa-copyright', 'f1f9', 0),
(187, 'fa-creative-commons', 'f25e', 0),
(188, 'fa-credit-card', 'f09d', 0),
(189, 'fa-credit-card-alt', 'f283', 0),
(190, 'fa-crop', 'f125', 0),
(191, 'fa-crosshairs', 'f05b', 0),
(192, 'fa-css3', 'f13c', 0),
(193, 'fa-cube', 'f1b2', 0),
(194, 'fa-cubes', 'f1b3', 0),
(195, 'fa-cut', 'f0c4', 0),
(196, 'fa-cutlery', 'f0f5', 0),
(197, 'fa-dashboard', 'f0e4', 0),
(198, 'fa-dashcube', 'f210', 0),
(199, 'fa-database', 'f1c0', 0),
(200, 'fa-deaf', 'f2a4', 0),
(201, 'fa-deafness', 'f2a4', 0),
(202, 'fa-dedent', 'f03b', 0),
(203, 'fa-delicious', 'f1a5', 0),
(204, 'fa-desktop', 'f108', 0),
(205, 'fa-deviantart', 'f1bd', 0),
(206, 'fa-diamond', 'f219', 0),
(207, 'fa-digg', 'f1a6', 0),
(208, 'fa-dollar', 'f155', 0),
(209, 'fa-dot-circle-o', 'f192', 0),
(210, 'fa-download', 'f019', 0),
(211, 'fa-dribbble', 'f17d', 0),
(212, 'fa-drivers-license', 'f2c2', 0),
(213, 'fa-drivers-license-o', 'f2c3', 0),
(214, 'fa-dropbox', 'f16b', 0),
(215, 'fa-drupal', 'f1a9', 0),
(216, 'fa-edge', 'f282', 0),
(217, 'fa-edit', 'f044', 0),
(218, 'fa-eercast', 'f2da', 0),
(219, 'fa-eject', 'f052', 0),
(220, 'fa-ellipsis-h', 'f141', 0),
(221, 'fa-ellipsis-v', 'f142', 0),
(222, 'fa-empire', 'f1d1', 0),
(223, 'fa-envelope', 'f0e0', 0),
(224, 'fa-envelope-o', 'f003', 0),
(225, 'fa-envelope-open', 'f2b6', 0),
(226, 'fa-envelope-open-o', 'f2b7', 0),
(227, 'fa-envelope-square', 'f199', 0),
(228, 'fa-envira', 'f299', 0),
(229, 'fa-eraser', 'f12d', 0),
(230, 'fa-etsy', 'f2d7', 0),
(231, 'fa-eur', 'f153', 0),
(232, 'fa-euro', 'f153', 0),
(233, 'fa-exchange', 'f0ec', 0),
(234, 'fa-exclamation', 'f12a', 0),
(235, 'fa-exclamation-circle', 'f06a', 0),
(236, 'fa-exclamation-triangle', 'f071', 0),
(237, 'fa-expand', 'f065', 0),
(238, 'fa-expeditedssl', 'f23e', 0),
(239, 'fa-external-link', 'f08e', 0),
(240, 'fa-external-link-square', 'f14c', 0),
(241, 'fa-eye', 'f06e', 0),
(242, 'fa-eye-slash', 'f070', 0),
(243, 'fa-eyedropper', 'f1fb', 0),
(244, 'fa-fa', 'f2b4', 0),
(245, 'fa-facebook', 'f09a', 0),
(246, 'fa-facebook-f', 'f09a', 0),
(247, 'fa-facebook-official', 'f230', 0),
(248, 'fa-facebook-square', 'f082', 0),
(249, 'fa-fast-backward', 'f049', 0),
(250, 'fa-fast-forward', 'f050', 0),
(251, 'fa-fax', 'f1ac', 0),
(252, 'fa-feed', 'f09e', 0),
(253, 'fa-female', 'f182', 0),
(254, 'fa-fighter-jet', 'f0fb', 0),
(255, 'fa-file', 'f15b', 0),
(256, 'fa-file-archive-o', 'f1c6', 0),
(257, 'fa-file-audio-o', 'f1c7', 0),
(258, 'fa-file-code-o', 'f1c9', 0),
(259, 'fa-file-excel-o', 'f1c3', 0),
(260, 'fa-file-image-o', 'f1c5', 0),
(261, 'fa-file-movie-o', 'f1c8', 0),
(262, 'fa-file-o', 'f016', 0),
(263, 'fa-file-pdf-o', 'f1c1', 0),
(264, 'fa-file-photo-o', 'f1c5', 0),
(265, 'fa-file-picture-o', 'f1c5', 0),
(266, 'fa-file-powerpoint-o', 'f1c4', 0),
(267, 'fa-file-sound-o', 'f1c7', 0),
(268, 'fa-file-text', 'f15c', 0),
(269, 'fa-file-text-o', 'f0f6', 0),
(270, 'fa-file-video-o', 'f1c8', 0),
(271, 'fa-file-word-o', 'f1c2', 0),
(272, 'fa-file-zip-o', 'f1c6', 0),
(273, 'fa-files-o', 'f0c5', 0),
(274, 'fa-film', 'f008', 0),
(275, 'fa-filter', 'f0b0', 0),
(276, 'fa-fire', 'f06d', 0),
(277, 'fa-fire-extinguisher', 'f134', 0),
(278, 'fa-firefox', 'f269', 0),
(279, 'fa-first-order', 'f2b0', 0),
(280, 'fa-flag', 'f024', 0),
(281, 'fa-flag-checkered', 'f11e', 0),
(282, 'fa-flag-o', 'f11d', 0),
(283, 'fa-flash', 'f0e7', 0),
(284, 'fa-flask', 'f0c3', 0),
(285, 'fa-flickr', 'f16e', 0),
(286, 'fa-floppy-o', 'f0c7', 0),
(287, 'fa-folder', 'f07b', 0),
(288, 'fa-folder-o', 'f114', 0),
(289, 'fa-folder-open', 'f07c', 0),
(290, 'fa-folder-open-o', 'f115', 0),
(291, 'fa-font', 'f031', 0),
(292, 'fa-font-awesome', 'f2b4', 0),
(293, 'fa-fonticons', 'f280', 0),
(294, 'fa-fort-awesome', 'f286', 0),
(295, 'fa-forumbee', 'f211', 0),
(296, 'fa-forward', 'f04e', 0),
(297, 'fa-foursquare', 'f180', 0),
(298, 'fa-free-code-camp', 'f2c5', 0),
(299, 'fa-frown-o', 'f119', 0),
(300, 'fa-futbol-o', 'f1e3', 0),
(301, 'fa-gamepad', 'f11b', 0),
(302, 'fa-gavel', 'f0e3', 0),
(303, 'fa-gbp', 'f154', 0),
(304, 'fa-ge', 'f1d1', 0),
(305, 'fa-gear', 'f013', 0),
(306, 'fa-gears', 'f085', 0),
(307, 'fa-genderless', 'f22d', 0),
(308, 'fa-get-pocket', 'f265', 0),
(309, 'fa-gg', 'f260', 0),
(310, 'fa-gg-circle', 'f261', 0),
(311, 'fa-gift', 'f06b', 0),
(312, 'fa-git', 'f1d3', 0),
(313, 'fa-git-square', 'f1d2', 0),
(314, 'fa-github', 'f09b', 0),
(315, 'fa-github-alt', 'f113', 0),
(316, 'fa-github-square', 'f092', 0),
(317, 'fa-gitlab', 'f296', 0),
(318, 'fa-gittip', 'f184', 0),
(319, 'fa-glass', 'f000', 0),
(320, 'fa-glide', 'f2a5', 0),
(321, 'fa-glide-g', 'f2a6', 0),
(322, 'fa-globe', 'f0ac', 0),
(323, 'fa-google', 'f1a0', 0),
(324, 'fa-google-plus', 'f0d5', 0),
(325, 'fa-google-plus-circle', 'f2b3', 0),
(326, 'fa-google-plus-official', 'f2b3', 0),
(327, 'fa-google-plus-square', 'f0d4', 0),
(328, 'fa-google-wallet', 'f1ee', 0),
(329, 'fa-graduation-cap', 'f19d', 0),
(330, 'fa-gratipay', 'f184', 0),
(331, 'fa-grav', 'f2d6', 0),
(332, 'fa-group', 'f0c0', 0),
(333, 'fa-h-square', 'f0fd', 0),
(334, 'fa-hacker-news', 'f1d4', 0),
(335, 'fa-hand-grab-o', 'f255', 0),
(336, 'fa-hand-lizard-o', 'f258', 0),
(337, 'fa-hand-o-down', 'f0a7', 0),
(338, 'fa-hand-o-left', 'f0a5', 0),
(339, 'fa-hand-o-right', 'f0a4', 0),
(340, 'fa-hand-o-up', 'f0a6', 0),
(341, 'fa-hand-paper-o', 'f256', 0),
(342, 'fa-hand-peace-o', 'f25b', 0),
(343, 'fa-hand-pointer-o', 'f25a', 0),
(344, 'fa-hand-rock-o', 'f255', 0),
(345, 'fa-hand-scissors-o', 'f257', 0),
(346, 'fa-hand-spock-o', 'f259', 0),
(347, 'fa-hand-stop-o', 'f256', 0),
(348, 'fa-handshake-o', 'f2b5', 0),
(349, 'fa-hard-of-hearing', 'f2a4', 0),
(350, 'fa-hashtag', 'f292', 0),
(351, 'fa-hdd-o', 'f0a0', 0),
(352, 'fa-header', 'f1dc', 0),
(353, 'fa-headphones', 'f025', 0),
(354, 'fa-heart', 'f004', 0),
(355, 'fa-heart-o', 'f08a', 0),
(356, 'fa-heartbeat', 'f21e', 0),
(357, 'fa-history', 'f1da', 0),
(358, 'fa-home', 'f015', 0),
(359, 'fa-hospital-o', 'f0f8', 0),
(360, 'fa-hotel', 'f236', 0),
(361, 'fa-hourglass', 'f254', 0),
(362, 'fa-hourglass-1', 'f251', 0),
(363, 'fa-hourglass-2', 'f252', 0),
(364, 'fa-hourglass-3', 'f253', 0),
(365, 'fa-hourglass-end', 'f253', 0),
(366, 'fa-hourglass-half', 'f252', 0),
(367, 'fa-hourglass-o', 'f250', 0),
(368, 'fa-hourglass-start', 'f251', 0),
(369, 'fa-houzz', 'f27c', 0),
(370, 'fa-html5', 'f13b', 0),
(371, 'fa-i-cursor', 'f246', 0),
(372, 'fa-id-badge', 'f2c1', 0),
(373, 'fa-id-card', 'f2c2', 0),
(374, 'fa-id-card-o', 'f2c3', 0),
(375, 'fa-ils', 'f20b', 0),
(376, 'fa-image', 'f03e', 0),
(377, 'fa-imdb', 'f2d8', 0),
(378, 'fa-inbox', 'f01c', 0),
(379, 'fa-indent', 'f03c', 0),
(380, 'fa-industry', 'f275', 0),
(381, 'fa-info', 'f129', 0),
(382, 'fa-info-circle', 'f05a', 0),
(383, 'fa-inr', 'f156', 0),
(384, 'fa-instagram', 'f16d', 0),
(385, 'fa-institution', 'f19c', 0),
(386, 'fa-internet-explorer', 'f26b', 0),
(387, 'fa-intersex', 'f224', 0),
(388, 'fa-ioxhost', 'f208', 0),
(389, 'fa-italic', 'f033', 0),
(390, 'fa-joomla', 'f1aa', 0),
(391, 'fa-jpy', 'f157', 0),
(392, 'fa-jsfiddle', 'f1cc', 0),
(393, 'fa-key', 'f084', 0),
(394, 'fa-keyboard-o', 'f11c', 0),
(395, 'fa-krw', 'f159', 0),
(396, 'fa-language', 'f1ab', 0),
(397, 'fa-laptop', 'f109', 0),
(398, 'fa-lastfm', 'f202', 0),
(399, 'fa-lastfm-square', 'f203', 0),
(400, 'fa-leaf', 'f06c', 0),
(401, 'fa-leanpub', 'f212', 0),
(402, 'fa-legal', 'f0e3', 0),
(403, 'fa-lemon-o', 'f094', 0),
(404, 'fa-level-down', 'f149', 0),
(405, 'fa-level-up', 'f148', 0),
(406, 'fa-life-bouy', 'f1cd', 0),
(407, 'fa-life-buoy', 'f1cd', 0),
(408, 'fa-life-ring', 'f1cd', 0),
(409, 'fa-life-saver', 'f1cd', 0),
(410, 'fa-lightbulb-o', 'f0eb', 0),
(411, 'fa-line-chart', 'f201', 0),
(412, 'fa-link', 'f0c1', 0),
(413, 'fa-linkedin', 'f0e1', 0),
(414, 'fa-linkedin-square', 'f08c', 0),
(415, 'fa-linode', 'f2b8', 0),
(416, 'fa-linux', 'f17c', 0),
(417, 'fa-list', 'f03a', 0),
(418, 'fa-list-alt', 'f022', 0),
(419, 'fa-list-ol', 'f0cb', 0),
(420, 'fa-list-ul', 'f0ca', 0),
(421, 'fa-location-arrow', 'f124', 0),
(422, 'fa-lock', 'f023', 0),
(423, 'fa-long-arrow-down', 'f175', 0),
(424, 'fa-long-arrow-left', 'f177', 0),
(425, 'fa-long-arrow-right', 'f178', 0),
(426, 'fa-long-arrow-up', 'f176', 0),
(427, 'fa-low-vision', 'f2a8', 0),
(428, 'fa-magic', 'f0d0', 0),
(429, 'fa-magnet', 'f076', 0),
(430, 'fa-mail-forward', 'f064', 0),
(431, 'fa-mail-reply', 'f112', 0),
(432, 'fa-mail-reply-all', 'f122', 0),
(433, 'fa-male', 'f183', 0),
(434, 'fa-map', 'f279', 0),
(435, 'fa-map-marker', 'f041', 0),
(436, 'fa-map-o', 'f278', 0),
(437, 'fa-map-pin', 'f276', 0),
(438, 'fa-map-signs', 'f277', 0),
(439, 'fa-mars', 'f222', 0),
(440, 'fa-mars-double', 'f227', 0),
(441, 'fa-mars-stroke', 'f229', 0),
(442, 'fa-mars-stroke-h', 'f22b', 0),
(443, 'fa-mars-stroke-v', 'f22a', 0),
(444, 'fa-maxcdn', 'f136', 0),
(445, 'fa-meanpath', 'f20c', 0),
(446, 'fa-medium', 'f23a', 0),
(447, 'fa-medkit', 'f0fa', 0),
(448, 'fa-meetup', 'f2e0', 0),
(449, 'fa-meh-o', 'f11a', 0),
(450, 'fa-mercury', 'f223', 0),
(451, 'fa-microchip', 'f2db', 0),
(452, 'fa-microphone', 'f130', 0),
(453, 'fa-microphone-slash', 'f131', 0),
(454, 'fa-minus', 'f068', 0),
(455, 'fa-minus-circle', 'f056', 0),
(456, 'fa-minus-square', 'f146', 0),
(457, 'fa-minus-square-o', 'f147', 0),
(458, 'fa-mixcloud', 'f289', 0),
(459, 'fa-mobile', 'f10b', 0),
(460, 'fa-mobile-phone', 'f10b', 0),
(461, 'fa-modx', 'f285', 0),
(462, 'fa-money', 'f0d6', 0),
(463, 'fa-moon-o', 'f186', 0),
(464, 'fa-mortar-board', 'f19d', 0),
(465, 'fa-motorcycle', 'f21c', 0),
(466, 'fa-mouse-pointer', 'f245', 0),
(467, 'fa-music', 'f001', 0),
(468, 'fa-navicon', 'f0c9', 0),
(469, 'fa-neuter', 'f22c', 0),
(470, 'fa-newspaper-o', 'f1ea', 0),
(471, 'fa-object-group', 'f247', 0),
(472, 'fa-object-ungroup', 'f248', 0),
(473, 'fa-odnoklassniki', 'f263', 0),
(474, 'fa-odnoklassniki-square', 'f264', 0),
(475, 'fa-opencart', 'f23d', 0),
(476, 'fa-openid', 'f19b', 0),
(477, 'fa-opera', 'f26a', 0),
(478, 'fa-optin-monster', 'f23c', 0),
(479, 'fa-outdent', 'f03b', 0),
(480, 'fa-pagelines', 'f18c', 0),
(481, 'fa-paint-brush', 'f1fc', 0),
(482, 'fa-paper-plane', 'f1d8', 0),
(483, 'fa-paper-plane-o', 'f1d9', 0),
(484, 'fa-paperclip', 'f0c6', 0),
(485, 'fa-paragraph', 'f1dd', 0),
(486, 'fa-paste', 'f0ea', 0),
(487, 'fa-pause', 'f04c', 0),
(488, 'fa-pause-circle', 'f28b', 0),
(489, 'fa-pause-circle-o', 'f28c', 0),
(490, 'fa-paw', 'f1b0', 0),
(491, 'fa-paypal', 'f1ed', 0),
(492, 'fa-pencil', 'f040', 0),
(493, 'fa-pencil-square', 'f14b', 0),
(494, 'fa-pencil-square-o', 'f044', 0),
(495, 'fa-percent', 'f295', 0),
(496, 'fa-phone', 'f095', 0),
(497, 'fa-phone-square', 'f098', 0),
(498, 'fa-photo', 'f03e', 0),
(499, 'fa-picture-o', 'f03e', 0),
(500, 'fa-pie-chart', 'f200', 0),
(501, 'fa-pied-piper', 'f2ae', 0),
(502, 'fa-pied-piper-alt', 'f1a8', 0),
(503, 'fa-pied-piper-pp', 'f1a7', 0),
(504, 'fa-pinterest', 'f0d2', 0),
(505, 'fa-pinterest-p', 'f231', 0),
(506, 'fa-pinterest-square', 'f0d3', 0),
(507, 'fa-plane', 'f072', 0),
(508, 'fa-play', 'f04b', 0),
(509, 'fa-play-circle', 'f144', 0),
(510, 'fa-play-circle-o', 'f01d', 0),
(511, 'fa-plug', 'f1e6', 0),
(512, 'fa-plus', 'f067', 0),
(513, 'fa-plus-circle', 'f055', 0),
(514, 'fa-plus-square', 'f0fe', 0),
(515, 'fa-plus-square-o', 'f196', 0),
(516, 'fa-podcast', 'f2ce', 0),
(517, 'fa-power-off', 'f011', 0),
(518, 'fa-print', 'f02f', 0),
(519, 'fa-product-hunt', 'f288', 0),
(520, 'fa-puzzle-piece', 'f12e', 0),
(521, 'fa-qq', 'f1d6', 0),
(522, 'fa-qrcode', 'f029', 0),
(523, 'fa-question', 'f128', 0),
(524, 'fa-question-circle', 'f059', 0),
(525, 'fa-question-circle-o', 'f29c', 0),
(526, 'fa-quora', 'f2c4', 0),
(527, 'fa-quote-left', 'f10d', 0),
(528, 'fa-quote-right', 'f10e', 0),
(529, 'fa-ra', 'f1d0', 0),
(530, 'fa-random', 'f074', 0),
(531, 'fa-ravelry', 'f2d9', 0),
(532, 'fa-rebel', 'f1d0', 0),
(533, 'fa-recycle', 'f1b8', 0),
(534, 'fa-reddit', 'f1a1', 0),
(535, 'fa-reddit-alien', 'f281', 0),
(536, 'fa-reddit-square', 'f1a2', 0),
(537, 'fa-refresh', 'f021', 0),
(538, 'fa-registered', 'f25d', 0),
(539, 'fa-remove', 'f00d', 0),
(540, 'fa-renren', 'f18b', 0),
(541, 'fa-reorder', 'f0c9', 0),
(542, 'fa-repeat', 'f01e', 0),
(543, 'fa-reply', 'f112', 0),
(544, 'fa-reply-all', 'f122', 0),
(545, 'fa-resistance', 'f1d0', 0),
(546, 'fa-retweet', 'f079', 0),
(547, 'fa-rmb', 'f157', 0),
(548, 'fa-road', 'f018', 0),
(549, 'fa-rocket', 'f135', 0),
(550, 'fa-rotate-left', 'f0e2', 0),
(551, 'fa-rotate-right', 'f01e', 0),
(552, 'fa-rouble', 'f158', 0),
(553, 'fa-rss', 'f09e', 0),
(554, 'fa-rss-square', 'f143', 0),
(555, 'fa-rub', 'f158', 0),
(556, 'fa-ruble', 'f158', 0),
(557, 'fa-rupee', 'f156', 0),
(558, 'fa-s15', 'f2cd', 0),
(559, 'fa-safari', 'f267', 0),
(560, 'fa-save', 'f0c7', 0),
(561, 'fa-scissors', 'f0c4', 0),
(562, 'fa-scribd', 'f28a', 0),
(563, 'fa-search', 'f002', 0),
(564, 'fa-search-minus', 'f010', 0),
(565, 'fa-search-plus', 'f00e', 0),
(566, 'fa-sellsy', 'f213', 0),
(567, 'fa-send', 'f1d8', 0),
(568, 'fa-send-o', 'f1d9', 0),
(569, 'fa-server', 'f233', 0),
(570, 'fa-share', 'f064', 0),
(571, 'fa-share-alt', 'f1e0', 0),
(572, 'fa-share-alt-square', 'f1e1', 0),
(573, 'fa-share-square', 'f14d', 0),
(574, 'fa-share-square-o', 'f045', 0),
(575, 'fa-shekel', 'f20b', 0),
(576, 'fa-sheqel', 'f20b', 0),
(577, 'fa-shield', 'f132', 0),
(578, 'fa-ship', 'f21a', 0),
(579, 'fa-shirtsinbulk', 'f214', 0),
(580, 'fa-shopping-bag', 'f290', 0),
(581, 'fa-shopping-basket', 'f291', 0),
(582, 'fa-shopping-cart', 'f07a', 0),
(583, 'fa-shower', 'f2cc', 0),
(584, 'fa-sign-in', 'f090', 0),
(585, 'fa-sign-language', 'f2a7', 0),
(586, 'fa-sign-out', 'f08b', 0),
(587, 'fa-signal', 'f012', 0),
(588, 'fa-signing', 'f2a7', 0),
(589, 'fa-simplybuilt', 'f215', 0),
(590, 'fa-sitemap', 'f0e8', 0),
(591, 'fa-skyatlas', 'f216', 0),
(592, 'fa-skype', 'f17e', 0),
(593, 'fa-slack', 'f198', 0),
(594, 'fa-sliders', 'f1de', 0),
(595, 'fa-slideshare', 'f1e7', 0),
(596, 'fa-smile-o', 'f118', 0),
(597, 'fa-snapchat', 'f2ab', 0),
(598, 'fa-snapchat-ghost', 'f2ac', 0),
(599, 'fa-snapchat-square', 'f2ad', 0),
(600, 'fa-snowflake-o', 'f2dc', 0),
(601, 'fa-soccer-ball-o', 'f1e3', 0),
(602, 'fa-sort', 'f0dc', 0),
(603, 'fa-sort-alpha-asc', 'f15d', 0),
(604, 'fa-sort-alpha-desc', 'f15e', 0),
(605, 'fa-sort-amount-asc', 'f160', 0),
(606, 'fa-sort-amount-desc', 'f161', 0),
(607, 'fa-sort-asc', 'f0de', 0),
(608, 'fa-sort-desc', 'f0dd', 0),
(609, 'fa-sort-down', 'f0dd', 0),
(610, 'fa-sort-numeric-asc', 'f162', 0),
(611, 'fa-sort-numeric-desc', 'f163', 0),
(612, 'fa-sort-up', 'f0de', 0),
(613, 'fa-soundcloud', 'f1be', 0),
(614, 'fa-space-shuttle', 'f197', 0),
(615, 'fa-spinner', 'f110', 0),
(616, 'fa-spoon', 'f1b1', 0),
(617, 'fa-spotify', 'f1bc', 0),
(618, 'fa-square', 'f0c8', 0),
(619, 'fa-square-o', 'f096', 0),
(620, 'fa-stack-exchange', 'f18d', 0),
(621, 'fa-stack-overflow', 'f16c', 0),
(622, 'fa-star', 'f005', 0),
(623, 'fa-star-half', 'f089', 0),
(624, 'fa-star-half-empty', 'f123', 0),
(625, 'fa-star-half-full', 'f123', 0),
(626, 'fa-star-half-o', 'f123', 0),
(627, 'fa-star-o', 'f006', 0),
(628, 'fa-steam', 'f1b6', 0),
(629, 'fa-steam-square', 'f1b7', 0),
(630, 'fa-step-backward', 'f048', 0),
(631, 'fa-step-forward', 'f051', 0),
(632, 'fa-stethoscope', 'f0f1', 0),
(633, 'fa-sticky-note', 'f249', 0),
(634, 'fa-sticky-note-o', 'f24a', 0),
(635, 'fa-stop', 'f04d', 0),
(636, 'fa-stop-circle', 'f28d', 0),
(637, 'fa-stop-circle-o', 'f28e', 0),
(638, 'fa-street-view', 'f21d', 0),
(639, 'fa-strikethrough', 'f0cc', 0),
(640, 'fa-stumbleupon', 'f1a4', 0),
(641, 'fa-stumbleupon-circle', 'f1a3', 0),
(642, 'fa-subscript', 'f12c', 0),
(643, 'fa-subway', 'f239', 0),
(644, 'fa-suitcase', 'f0f2', 0),
(645, 'fa-sun-o', 'f185', 0),
(646, 'fa-superpowers', 'f2dd', 0),
(647, 'fa-superscript', 'f12b', 0),
(648, 'fa-support', 'f1cd', 0),
(649, 'fa-table', 'f0ce', 0),
(650, 'fa-tablet', 'f10a', 0),
(651, 'fa-tachometer', 'f0e4', 0),
(652, 'fa-tag', 'f02b', 0),
(653, 'fa-tags', 'f02c', 0),
(654, 'fa-tasks', 'f0ae', 0),
(655, 'fa-taxi', 'f1ba', 0),
(656, 'fa-telegram', 'f2c6', 0),
(657, 'fa-television', 'f26c', 0),
(658, 'fa-tencent-weibo', 'f1d5', 0),
(659, 'fa-terminal', 'f120', 0),
(660, 'fa-text-height', 'f034', 0),
(661, 'fa-text-width', 'f035', 0),
(662, 'fa-th', 'f00a', 0),
(663, 'fa-th-large', 'f009', 0),
(664, 'fa-th-list', 'f00b', 0),
(665, 'fa-themeisle', 'f2b2', 0),
(666, 'fa-thermometer', 'f2c7', 0),
(667, 'fa-thermometer-0', 'f2cb', 0),
(668, 'fa-thermometer-1', 'f2ca', 0),
(669, 'fa-thermometer-2', 'f2c9', 0),
(670, 'fa-thermometer-3', 'f2c8', 0),
(671, 'fa-thermometer-4', 'f2c7', 0),
(672, 'fa-thermometer-empty', 'f2cb', 0),
(673, 'fa-thermometer-full', 'f2c7', 0),
(674, 'fa-thermometer-half', 'f2c9', 0),
(675, 'fa-thermometer-quarter', 'f2ca', 0),
(676, 'fa-thermometer-three-quarters', 'f2c8', 0),
(677, 'fa-thumb-tack', 'f08d', 0),
(678, 'fa-thumbs-down', 'f165', 0),
(679, 'fa-thumbs-o-down', 'f088', 0),
(680, 'fa-thumbs-o-up', 'f087', 0),
(681, 'fa-thumbs-up', 'f164', 0),
(682, 'fa-ticket', 'f145', 0),
(683, 'fa-times', 'f00d', 0),
(684, 'fa-times-circle', 'f057', 0),
(685, 'fa-times-circle-o', 'f05c', 0),
(686, 'fa-times-rectangle', 'f2d3', 0),
(687, 'fa-times-rectangle-o', 'f2d4', 0),
(688, 'fa-tint', 'f043', 0),
(689, 'fa-toggle-down', 'f150', 0),
(690, 'fa-toggle-left', 'f191', 0),
(691, 'fa-toggle-off', 'f204', 0),
(692, 'fa-toggle-on', 'f205', 0),
(693, 'fa-toggle-right', 'f152', 0),
(694, 'fa-toggle-up', 'f151', 0),
(695, 'fa-trademark', 'f25c', 0),
(696, 'fa-train', 'f238', 0),
(697, 'fa-transgender', 'f224', 0),
(698, 'fa-transgender-alt', 'f225', 0),
(699, 'fa-trash', 'f1f8', 0),
(700, 'fa-trash-o', 'f014', 0),
(701, 'fa-tree', 'f1bb', 0),
(702, 'fa-trello', 'f181', 0),
(703, 'fa-tripadvisor', 'f262', 0),
(704, 'fa-trophy', 'f091', 0),
(705, 'fa-truck', 'f0d1', 0),
(706, 'fa-try', 'f195', 0),
(707, 'fa-tty', 'f1e4', 0),
(708, 'fa-tumblr', 'f173', 0),
(709, 'fa-tumblr-square', 'f174', 0),
(710, 'fa-turkish-lira', 'f195', 0),
(711, 'fa-tv', 'f26c', 0),
(712, 'fa-twitch', 'f1e8', 0),
(713, 'fa-twitter', 'f099', 0),
(714, 'fa-twitter-square', 'f081', 0),
(715, 'fa-umbrella', 'f0e9', 0),
(716, 'fa-underline', 'f0cd', 0),
(717, 'fa-undo', 'f0e2', 0),
(718, 'fa-universal-access', 'f29a', 0),
(719, 'fa-university', 'f19c', 0),
(720, 'fa-unlink', 'f127', 0),
(721, 'fa-unlock', 'f09c', 0),
(722, 'fa-unlock-alt', 'f13e', 0),
(723, 'fa-unsorted', 'f0dc', 0),
(724, 'fa-upload', 'f093', 0),
(725, 'fa-usb', 'f287', 0),
(726, 'fa-usd', 'f155', 0),
(727, 'fa-user', 'f007', 0),
(728, 'fa-user-circle', 'f2bd', 0),
(729, 'fa-user-circle-o', 'f2be', 0),
(730, 'fa-user-md', 'f0f0', 0),
(731, 'fa-user-o', 'f2c0', 0),
(732, 'fa-user-plus', 'f234', 0),
(733, 'fa-user-secret', 'f21b', 0),
(734, 'fa-user-times', 'f235', 0),
(735, 'fa-users', 'f0c0', 0),
(736, 'fa-vcard', 'f2bb', 0),
(737, 'fa-vcard-o', 'f2bc', 0),
(738, 'fa-venus', 'f221', 0),
(739, 'fa-venus-double', 'f226', 0),
(740, 'fa-venus-mars', 'f228', 0),
(741, 'fa-viacoin', 'f237', 0),
(742, 'fa-viadeo', 'f2a9', 0),
(743, 'fa-viadeo-square', 'f2aa', 0),
(744, 'fa-video-camera', 'f03d', 0),
(745, 'fa-vimeo', 'f27d', 0),
(746, 'fa-vimeo-square', 'f194', 0),
(747, 'fa-vine', 'f1ca', 0),
(748, 'fa-vk', 'f189', 0),
(749, 'fa-volume-control-phone', 'f2a0', 0),
(750, 'fa-volume-down', 'f027', 0),
(751, 'fa-volume-off', 'f026', 0),
(752, 'fa-volume-up', 'f028', 0),
(753, 'fa-warning', 'f071', 0),
(754, 'fa-wechat', 'f1d7', 0),
(755, 'fa-weibo', 'f18a', 0),
(756, 'fa-weixin', 'f1d7', 0),
(757, 'fa-whatsapp', 'f232', 0),
(758, 'fa-wheelchair', 'f193', 0),
(759, 'fa-wheelchair-alt', 'f29b', 0),
(760, 'fa-wifi', 'f1eb', 0),
(761, 'fa-wikipedia-w', 'f266', 0),
(762, 'fa-window-close', 'f2d3', 0),
(763, 'fa-window-close-o', 'f2d4', 0),
(764, 'fa-window-maximize', 'f2d0', 0),
(765, 'fa-window-minimize', 'f2d1', 0),
(766, 'fa-window-restore', 'f2d2', 0),
(767, 'fa-windows', 'f17a', 0),
(768, 'fa-won', 'f159', 0),
(769, 'fa-wordpress', 'f19a', 0),
(770, 'fa-wpbeginner', 'f297', 0),
(771, 'fa-wpexplorer', 'f2de', 0),
(772, 'fa-wpforms', 'f298', 0),
(773, 'fa-wrench', 'f0ad', 0),
(774, 'fa-xing', 'f168', 0),
(775, 'fa-xing-square', 'f169', 0),
(776, 'fa-y-combinator', 'f23b', 0),
(777, 'fa-y-combinator-square', 'f1d4', 0),
(778, 'fa-yahoo', 'f19e', 0),
(779, 'fa-yc', 'f23b', 0),
(780, 'fa-yc-square', 'f1d4', 0),
(781, 'fa-yelp', 'f1e9', 0),
(782, 'fa-yen', 'f157', 0),
(783, 'fa-yoast', 'f2b1', 0),
(784, 'fa-youtube', 'f167', 0),
(785, 'fa-youtube-play', 'f16a', 0),
(786, 'fa-youtube-square', 'f166', 0);

-- --------------------------------------------------------

--
-- Table structure for table `formularios`
--

CREATE TABLE `formularios` (
  `id` int(11) NOT NULL,
  `id_tipo_formulario` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `numero` varchar(500) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `codigo` varchar(500) NOT NULL,
  `flujo` varchar(500) DEFAULT NULL,
  `unidad` varchar(500) DEFAULT NULL,
  `tipo_tratamiento` varchar(500) DEFAULT NULL,
  `tipo_origen` longtext,
  `tipo_por_defecto` longtext,
  `icono` varchar(500) NOT NULL,
  `fijo` int(11) NOT NULL,
  `codigo_formulario_fijo` varchar(500) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `formularios`
--

INSERT INTO `formularios` (`id`, `id_tipo_formulario`, `id_cliente`, `numero`, `nombre`, `descripcion`, `codigo`, `flujo`, `unidad`, `tipo_tratamiento`, `tipo_origen`, `tipo_por_defecto`, `icono`, `fijo`, `codigo_formulario_fijo`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 3, 1, '01', 'Unidades Funcionales', '', '01MCUnidadesFuncionales', NULL, NULL, NULL, NULL, NULL, 'cogwheel.png', 1, 'or_unidades_funcionales', 1, NULL, '2020-07-29 15:41:42', NULL, 0),
(2, 3, 1, '1', 'Boletines meteorología', 'Boletín informativo simplificado de la meteorología sinóptica y local de las próximas 72 horas en MLP.', '1MCBoletinesmeteorología', NULL, NULL, NULL, NULL, NULL, 'acid-rain.png', 0, NULL, 1, 1, '2023-08-16 21:49:43', '2023-09-04 21:32:51', 0),
(3, 3, 1, '01', 'Unidades Funcionales', '', '01MCUnidadesFuncionales', NULL, NULL, NULL, NULL, NULL, 'cogwheel.png', 1, 'or_unidades_funcionales', 1, NULL, '2024-06-18 18:27:37', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `formulario_rel_materiales`
--

CREATE TABLE `formulario_rel_materiales` (
  `id` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formulario_rel_materiales_rel_categorias`
--

CREATE TABLE `formulario_rel_materiales_rel_categorias` (
  `id` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `formulario_rel_proyecto`
--

CREATE TABLE `formulario_rel_proyecto` (
  `id` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_files`
--

CREATE TABLE `general_files` (
  `id` int(11) NOT NULL,
  `file_name` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `file_size` double NOT NULL,
  `created_at` datetime NOT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `uploaded_by` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `thousands_separator` varchar(500) NOT NULL,
  `decimals_separator` int(11) NOT NULL,
  `decimal_numbers` varchar(500) NOT NULL,
  `date_format` varchar(500) NOT NULL,
  `timezone` varchar(500) NOT NULL,
  `time_format` varchar(500) NOT NULL,
  `language` varchar(500) NOT NULL,
  `general_color` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings_clients`
--

CREATE TABLE `general_settings_clients` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `thousands_separator` varchar(500) NOT NULL,
  `decimals_separator` int(11) NOT NULL,
  `decimal_numbers` varchar(500) NOT NULL,
  `date_format` varchar(500) NOT NULL,
  `timezone` varchar(500) NOT NULL,
  `time_format` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `home_modules_info`
--

CREATE TABLE `home_modules_info` (
  `id` int(11) NOT NULL,
  `icono` varchar(500) DEFAULT NULL,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `orden` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_modules_info`
--

INSERT INTO `home_modules_info` (`id`, `icono`, `nombre`, `descripcion`, `orden`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 'cogwheel.png', 'Servicios', 'Módulo que facilita la gestión ambiental de servicios. Permite manejo de la información ambiental de los distintos servicios de Antofagasta Minerals.', 1, 1, NULL, '2019-01-01 00:00:00', NULL, 0),
(2, 'contract-1.png', 'Acuerdos', 'Módulo que permite registrar, realizar seguimiento y administrar las acciones de Enel con las comunidades en torno a sus servicios a lo largo del país y su servicio de distribución.', 2, 1, NULL, '2019-01-01 00:00:00', NULL, 0),
(3, 'clipboard.png', 'Recordbook', 'Módulo que permite el registro de las interacciones de las comunidades en los sitios de los servicios. ', 3, 1, NULL, '2019-01-01 00:00:00', NULL, 0),
(4, 'renewable-energy.png', 'Indicadores de Sostenibilidad (KPI)', 'Módulo que permite visualizar y comparar el desempeño ambiental de los diferentes servicios habilitados en MIMASOFT, a través de distintos indicadores de sostenibilidad. ', 4, 1, NULL, '2019-01-01 00:00:00', NULL, 0),
(5, 'student.png', 'Ayuda y Soporte', 'Módulo que permite consultar información general de la herramienta digital MIMASOFT, además de solicitar soporte para su correcto funcionamiento.', 6, 1, NULL, '2019-01-01 00:00:00', NULL, 0),
(6, 'leaves-2.png', 'Economía Circular', 'Módulo que presenta el desempeño de los servicios habilitados en MIMASOFT, evaluados con enfoque circular a partir de la metodología CirculAbility de Enel.', 5, 1, NULL, '0000-00-00 00:00:00', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `indicators`
--

CREATE TABLE `indicators` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `indicator_name` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `id_fontawesome` int(11) NOT NULL,
  `categories` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `industrias`
--

CREATE TABLE `industrias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `industrias`
--

INSERT INTO `industrias` (`id`, `nombre`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 'Construcción', 1, NULL, '2017-10-06 00:00:00', '0000-00-00 00:00:00', 0),
(2, 'Minería', 1, NULL, '2017-10-06 00:00:00', '0000-00-00 00:00:00', 0),
(3, 'Forestal', 1, NULL, '2017-10-06 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `industrias_rel_tecnologias`
--

CREATE TABLE `industrias_rel_tecnologias` (
  `id` int(11) NOT NULL,
  `id_industria` int(11) NOT NULL,
  `id_tecnologia` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_estructura_graficos`
--

CREATE TABLE `kpi_estructura_graficos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `submodulo_grafico` varchar(500) NOT NULL,
  `item` varchar(500) NOT NULL,
  `subitem` varchar(500) NOT NULL,
  `tipo_grafico` varchar(500) NOT NULL,
  `series` longtext,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kpi_estructura_graficos`
--

INSERT INTO `kpi_estructura_graficos` (`id`, `id_cliente`, `id_fase`, `id_proyecto`, `submodulo_grafico`, `item`, `subitem`, `tipo_grafico`, `series`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 1, 3, 1, 'charts_by_project', 'materials_and_waste', 'total_waste_produced', 'chart_pie_basic', '{\"non_hazardous_industrial_waste\":\"\",\"hazardous_industrial_waste\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(2, 1, 3, 1, 'charts_by_project', 'materials_and_waste', 'waste_recycling_totals', 'chart_pie_basic', '{\"waste_without_recycling\":\"\",\"rises_recycled\":\"\",\"respel_recycled\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(3, 1, 3, 1, 'charts_by_project', 'materials_and_waste', 'waste_recycling_monthly', 'chart_bars_stacked_100', '{\"waste_without_recycling\":\"\",\"rises_recycled\":\"\",\"respel_recycled\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(4, 1, 3, 1, 'charts_by_project', 'emissions', 'total_emissions_by_source', 'chart_bars', '{\"direct_emissions\":\"\",\"indirect_emissions_energy\":\"\",\"other_indirect_emissions\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(5, 1, 3, 1, 'charts_by_project', 'energy', 'energy_consumption_source_type', 'chart_pie_basic', '{\"renewable\":\"\",\"not_renewable\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(6, 1, 3, 1, 'charts_by_project', 'energy', 'energy_consumption', 'chart_bars_stacked_100', '{\"renewable\":\"\",\"not_renewable\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(7, 1, 3, 1, 'charts_by_project', 'water', 'water_consumption_by_origin', 'chart_bars', '{\"drinking_water\":\"\",\"natural_source\":\"\",\"reused_water\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(8, 1, 3, 1, 'charts_by_project', 'water', 'water_consumption_by_origin', 'chart_bars_stacked_percentage', '{\"drinking_water\":\"\",\"natural_source\":\"\",\"reused_water\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(9, 1, 3, 1, 'charts_by_project', 'water', 'water_reused_by_type', 'chart_bars_percentage', '{\"treated_water\":\"\",\"rainwater_collector\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(10, 1, 3, 1, 'charts_by_project', 'water', 'water_reused_by_type', 'chart_columns_percentage', '{\"treated_water\":\"\",\"rainwater_collector\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(11, 1, 3, 1, 'charts_by_project', 'social', 'proportion_expenses_dedicated_local_suppliers', 'chart_pie_basic', '{\"expenditure_local_suppliers\":\"\",\"other_expenses\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(12, 1, 3, 1, 'charts_by_project', 'social', 'expenditure_local_suppliers', 'chart_bars_stacked_percentage', '{\"expenditure_local_suppliers\":\"\",\"other_expenses\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(13, 1, 3, 1, 'charts_by_project', 'social', 'solutions_actions_facilities', 'chart_bars', '{\"solutions_donated_to_community\":\"\",\"sustainable_actions_on_site\":\"\",\"facilities_for_workers\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(14, 1, 3, 1, 'charts_by_project', 'social', 'donated_solutions_beneficiaries', 'chart_bars_and_line', '{\"solutions_donated_to_community\":\"\",\"beneficiaries\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(15, 1, 3, 1, 'charts_between_projects', 'materials_and_waste', 'total_waste_produced', 'chart_bars', '{\"total_waste_produced\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(16, 1, 3, 1, 'charts_between_projects', 'materials_and_waste', 'waste_recycling', 'chart_bars_stacked_100', '{\"waste_without_recycling\":\"\",\"rises_recycled\":\"\",\"respel_recycled\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(17, 1, 3, 1, 'charts_between_projects', 'emissions', 'total_emissions_produced', 'chart_bars', '{\"total_produced_emissions\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(18, 1, 3, 1, 'charts_between_projects', 'emissions', 'emissions_by_source', 'chart_bars_stacked_100', '{\"direct_emissions\":\"\",\"other_indirect_emissions\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(19, 1, 3, 1, 'charts_between_projects', 'energy', 'total_energy_consumption', 'chart_pie_basic', '{\"total_energy_consumption\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(20, 1, 3, 1, 'charts_between_projects', 'energy', 'energy_consumption', 'chart_bars_stacked_100', '{\"not_renewable\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(21, 1, 3, 1, 'charts_between_projects', 'water', 'total_water_consumption', 'chart_bars', '{\"total_water_consumption\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(22, 1, 3, 1, 'charts_between_projects', 'water', 'water_consumption_by_origin', 'chart_bars_stacked_percentage', '{\"natural_source\":\"\",\"reused_water\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0),
(23, 1, 3, 1, 'charts_between_projects', 'water', 'water_reused_by_type', 'chart_columns_percentage', '{\"treated_water\":\"\",\"rainwater_collector\":\"\"}', 1, NULL, '2024-06-18 18:27:37', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kpi_estructura_reporte`
--

CREATE TABLE `kpi_estructura_reporte` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `is_valor_asignado` int(11) NOT NULL,
  `datos` longtext,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_plantillas_reporte`
--

CREATE TABLE `kpi_plantillas_reporte` (
  `id` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_tecnologia` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `fecha_desde` date NOT NULL,
  `fecha_hasta` date NOT NULL,
  `datos` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_valores`
--

CREATE TABLE `kpi_valores` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `tipo_valor` varchar(500) NOT NULL,
  `nombre_valor` varchar(500) NOT NULL,
  `id_tipo_formulario` int(11) DEFAULT NULL,
  `id_formulario` int(11) DEFAULT NULL,
  `id_campo_unidad` int(11) DEFAULT NULL,
  `operador` varchar(500) DEFAULT NULL,
  `valor_operador` double DEFAULT NULL,
  `valor_inicial` int(11) DEFAULT NULL,
  `valor_calculo` int(11) DEFAULT NULL,
  `operacion_compuesta` longtext,
  `id_tipo_unidad` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `kpi_valores_condicion`
--

CREATE TABLE `kpi_valores_condicion` (
  `id` int(11) NOT NULL,
  `id_kpi_valores` int(11) NOT NULL,
  `id_campo` int(11) DEFAULT NULL,
  `id_campo_fijo` int(11) DEFAULT NULL,
  `is_category` int(11) NOT NULL,
  `is_tipo_tratamiento` int(11) NOT NULL,
  `valor` longtext,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_home_modules_info` int(11) DEFAULT NULL,
  `id_module` int(11) DEFAULT NULL,
  `id_proyecto` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `datetime` datetime NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `item_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `materiales_proyecto`
--

CREATE TABLE `materiales_proyecto` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_material` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mimasoft`
--

CREATE TABLE `mimasoft` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `contenido` longtext,
  `codigo` varchar(500) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mimasoft`
--

INSERT INTO `mimasoft` (`id`, `titulo`, `contenido`, `codigo`, `created`, `created_by`, `modified`, `modified_by`, `deleted`) VALUES
(1, '¿Qué es MIMASOFT?', 'MIMASOFT es un Software que automatiza el tratamiento de la información ambiental, entregando múltiples indicadores en tiempo real, incluyendo la cuantificación de impactos ambientales o monitoreo y pronóstico de la calidad del aire.<br>\r\n<div class=\"panel-body\">\r\n                    	\r\n                        <video width=\"100%\" controls=\"\" poster=\"\">\r\n                          <source src=\"/files/system/mimasoft.mp4\" type=\"video/mp4\">   \r\n                        </video>\r\n                        \r\n        \r\n                    </div>', 'ACV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(2, '¿Qué es un ACV?', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-6\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/que_es_un_acv.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>\r\n                        <div class=\"col-md-6\" style=\"text-align: justify;\">\r\n                        	El Análisis de Ciclo de Vida (ACV) es una herramienta que permite identificar y cuantificar los impactos ambientales asociados a un producto o servicio, evaluando todas las etapas de su ciclo de vida \"de la cuna a la tumba\". Es decir, el análisis incluye los efectos un producto o servicio desde la extracción de las materias primas necesarias para su fabricación, hasta la disposición final tras el fin de su vida útil.\r\n                        </div>        \r\n                    </div>', 'ACV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'Objetivos y Alcance', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_objetivos_alcance.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	Modelamos su sistema productivo, identificando los procesos y actividades que lo componen.\r\n                        </div>         \r\n                    </div>', 'ACVPP', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'Análisis de Inventario', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_analisis_inventario.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	Cuantificamos todos los consumos de insumos y energía, así como la generación de residuos y emisiones de cada proceso. Utilizamos la información ambiental de tu organización, a través de los registros habilitados en la plataforma.\r\n                        </div>         \r\n                    </div>', 'ACVPP', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'Evaluación de Impactos', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_evaluacion_impactos.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	Ponderamos los impactos de cada consumo y residuo, para cuantificar el impacto de cada proceso del sistema. Al sumar los impactos de cada proceso se obtiene el impacto total de su producto o servicio.\r\n                        </div>         \r\n                    </div>', 'ACVPP', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'Interpretación de Resultados', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_interpretacion_resultados.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	El análisis permite identificar los procesos que generan los mayores impactos ambientales, para orientar las medidas de gestión a decisiones más eficientes de reducción de impacto y con esto mejorar el desempeño ambiental de su organización.\r\n                        </div>         \r\n                    </div>', 'ACVPP', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'Flexible', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_flexible.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	Modelamiento permite elegir las huellas ambientales del interés de su Organización.\r\n                        </div>         \r\n                    </div>', 'ACVV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'Información práctica', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_info_practica.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	Facilita la interpretación de resultados y la identificación de puntos críticos para orientar las medidas de gestión.\r\n                        </div>         \r\n                    </div>', 'ACVV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'Mejora continua', '<div class=\"panel-body\">\r\n                        <div class=\"col-md-4\" style=\"text-align: center;\">\r\n                        	<img src=\"/assets/images/acv_mejora_continua.png\" data-themekey=\"#\" class=\"mCS_img_loaded\">\r\n                        </div>  \r\n                   		<div class=\"col-md-8\" style=\"text-align: justify;\">\r\n                        	Resultados comparables permiten evaluar el desempeño ambiental a través del tiempo.\r\n                        </div>         \r\n                    </div>', 'ACVV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(10, '¿Qué es MIMAire?', 'Es un conjunto de módulos diseñados para el monitoreo y pronóstico de variables meteorológicas y de calidad del aire, que buscan prevenir episodios críticos de contaminación atmosférica. Permite que estos datos sean almacenados y procesados en tiempo real, obteniendo análisis y mejorando la toma de decisiones respecto de estas variables, para mejorar el desempeño ambiental de las empresas.', 'ACV', '0000-00-00 00:00:00', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mimasoft_systems`
--

CREATE TABLE `mimasoft_systems` (
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mimasoft_systems`
--

INSERT INTO `mimasoft_systems` (`id`, `name`, `deleted`) VALUES
(1, 'Mimasoft', 0),
(2, 'MIMAire', 0);

-- --------------------------------------------------------

--
-- Table structure for table `module_availability_settings`
--

CREATE TABLE `module_availability_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_modulo_cliente` int(11) NOT NULL,
  `available` int(1) NOT NULL,
  `thresholds` int(11) NOT NULL DEFAULT '0',
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `module_footprint_units`
--

CREATE TABLE `module_footprint_units` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_tipo_unidad` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `new_id_air_records_values_p`
--

CREATE TABLE `new_id_air_records_values_p` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_id_air_records_values_p_max`
--

CREATE TABLE `new_id_air_records_values_p_max` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_id_air_records_values_p_min`
--

CREATE TABLE `new_id_air_records_values_p_min` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_id_air_records_values_p_porc_conf`
--

CREATE TABLE `new_id_air_records_values_p_porc_conf` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `new_id_air_records_values_uploads`
--

CREATE TABLE `new_id_air_records_values_uploads` (
  `id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paises`
--

INSERT INTO `paises` (`id`, `nombre`, `deleted`) VALUES
(1, 'Afganistán', 0),
(2, 'Albania', 0),
(3, 'Alemania', 0),
(4, 'Andorra', 0),
(5, 'Angola', 0),
(6, 'Antigua y Barbuda', 0),
(7, 'Arabia Saudita', 0),
(8, 'Argelia', 0),
(9, 'Argentina', 0),
(10, 'Armenia', 0),
(11, 'Australia', 0),
(12, 'Austria', 0),
(13, 'Azerbaiyán', 0),
(14, 'Bahamas', 0),
(15, 'Bahrein', 0),
(16, 'Bangladesh', 0),
(17, 'Barbados', 0),
(18, 'Belarús', 0),
(19, 'Bélgica', 0),
(20, 'Belice', 0),
(21, 'Benin', 0),
(22, 'Bhután', 0),
(23, 'Bolivia', 0),
(24, 'Bosnia y Herzegovina', 0),
(25, 'Botswana', 0),
(26, 'Brasil', 0),
(27, 'Brunei Darussalam', 0),
(28, 'Bulgaria', 0),
(29, 'Burkina Faso', 0),
(30, 'Burundi', 0),
(31, 'Cabo Verde', 0),
(32, 'Camboya', 0),
(33, 'Camerún', 0),
(34, 'Canadá', 0),
(35, 'Chad', 0),
(36, 'Chile', 0),
(37, 'China', 0),
(38, 'Chipre', 0),
(39, 'Colombia', 0),
(40, 'Comoras', 0),
(41, 'Congo', 0),
(42, 'Costa Rica', 0),
(43, 'Côte d Ivoire', 0),
(44, 'Croacia', 0),
(45, 'Cuba', 0),
(46, 'Dinamarca', 0),
(47, 'Djibouti', 0),
(48, 'Dominica', 0),
(49, 'Dominicana', 0),
(50, 'Ecuador', 0),
(51, 'Egipto', 0),
(52, 'El Salvador', 0),
(53, 'Emiratos Árabes Unidos', 0),
(54, 'Eritrea', 0),
(55, 'Eslovaquia', 0),
(56, 'Eslovenia', 0),
(57, 'España', 0),
(58, 'Estados Unidos de América', 0),
(59, 'Estonia', 0),
(60, 'Etiopía', 0),
(61, 'ex República Yugoslava de Macedonia', 0),
(62, 'Federación de Rusia', 0),
(63, 'Fiji', 0),
(64, 'Filipinas', 0),
(65, 'Finlandia', 0),
(66, 'Francia', 0),
(67, 'Gabón (el)', 0),
(68, 'Gambia', 0),
(69, 'Georgia', 0),
(70, 'Ghana', 0),
(71, 'Granada', 0),
(72, 'Grecia', 0),
(73, 'Guatemala', 0),
(74, 'Guinea', 0),
(75, 'Guinea Ecuatorial', 0),
(76, 'Guinea-Bissau', 0),
(77, 'Guyana', 0),
(78, 'Haití', 0),
(79, 'Honduras', 0),
(80, 'Hungría', 0),
(81, 'India (la)', 0),
(82, 'Indonesia', 0),
(83, 'Irán', 0),
(84, 'Iraq', 0),
(85, 'Irlanda', 0),
(86, 'Islandia', 0),
(87, 'Islas Marshall', 0),
(88, 'Islas Salomón', 0),
(89, 'Israel', 0),
(90, 'Italia', 0),
(91, 'Jamahiriya Árabe Libia', 0),
(92, 'Jamaica', 0),
(93, 'Japón (el)', 0),
(94, 'Jordania', 0),
(95, 'Kazajstán', 0),
(96, 'Kenya', 0),
(97, 'Kirguistán', 0),
(98, 'Kiribati', 0),
(99, 'Kuwait', 0),
(100, 'Lesotho', 0),
(101, 'Letonia', 0),
(102, 'Líbano', 0),
(103, 'Liberia', 0),
(104, 'Liechtenstein', 0),
(105, 'Lituania', 0),
(106, 'Luxemburgo', 0),
(107, 'Madagascar', 0),
(108, 'Malasia', 0),
(109, 'Malawi', 0),
(110, 'Maldivas', 0),
(111, 'Malí', 0),
(112, 'Malta', 0),
(113, 'Marruecos', 0),
(114, 'Mauricio', 0),
(115, 'Mauritania', 0),
(116, 'México', 0),
(117, 'Micronesia', 0),
(118, 'Mónaco', 0),
(119, 'Mongolia', 0),
(120, 'Montenegro', 0),
(121, 'Mozambique', 0),
(122, 'Myanmar', 0),
(123, 'Namibia', 0),
(124, 'Nauru', 0),
(125, 'Nepal', 0),
(126, 'Nicaragua', 0),
(127, 'Níger', 0),
(128, 'Nigeria', 0),
(129, 'Noruega', 0),
(130, 'Nueva Zelandia', 0),
(131, 'Omán', 0),
(132, 'Países Bajos', 0),
(133, 'Pakistán', 0),
(134, 'Palau', 0),
(135, 'Palestina', 0),
(136, 'Panamá', 0),
(137, 'Papua Nueva Guinea', 0),
(138, 'Paraguay', 0),
(139, 'Perú', 0),
(140, 'Polonia', 0),
(141, 'Portugal', 0),
(142, 'Qatar', 0),
(143, 'Reino Unido de Gran Bretaña e Irlanda del Norte', 0),
(144, 'República Árabe Siria', 0),
(145, 'República Centroafricana', 0),
(146, 'República Checa', 0),
(147, 'República de Corea', 0),
(148, 'República de Moldova', 0),
(149, 'República Democrática del Congo', 0),
(150, 'República Democrática Popular Lao', 0),
(151, 'República Popular Democrática de Corea', 0),
(152, 'República Unida de Tanzanía', 0),
(153, 'Rumania', 0),
(154, 'Rwanda', 0),
(155, 'Saint Kitts y Nevis', 0),
(156, 'Samoa', 0),
(157, 'San Marino', 0),
(158, 'San Vicente y las Granadinas', 0),
(159, 'Santa Lucía', 0),
(160, 'Santo Tomé y Príncipe', 0),
(161, 'Senegal', 0),
(162, 'Serbia', 0),
(163, 'Seychelles', 0),
(164, 'Sierra Leona', 0),
(165, 'Singapur', 0),
(166, 'Somalia', 0),
(167, 'Sri Lanka', 0),
(168, 'Sudáfrica', 0),
(169, 'Sudán', 0),
(170, 'Sudán del Sur', 0),
(171, 'Suecia', 0),
(172, 'Suiza', 0),
(173, 'Suriname', 0),
(174, 'Swazilandia', 0),
(175, 'Tailandia', 0),
(176, 'Tayikistán', 0),
(177, 'Timor-Leste', 0),
(178, 'Togo', 0),
(179, 'Tonga', 0),
(180, 'Trinidad y Tabago', 0),
(181, 'Túnez', 0),
(182, 'Turkmenistán', 0),
(183, 'Turquía', 0),
(184, 'Tuvalu', 0),
(185, 'Ucrania', 0),
(186, 'Uganda', 0),
(187, 'Uruguay', 0),
(188, 'Uzbekistán', 0),
(189, 'Vanuatu', 0),
(190, 'Vaticano', 0),
(191, 'Venezuela', 0),
(192, 'Viet Nam', 0),
(193, 'Yemen', 0),
(194, 'Zambia', 0),
(195, 'Zimbabwe', 0);

-- --------------------------------------------------------

--
-- Table structure for table `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permisos_rel_campos`
--

CREATE TABLE `permisos_rel_campos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `planificaciones_reportables_compromisos`
--

CREATE TABLE `planificaciones_reportables_compromisos` (
  `id` int(11) NOT NULL,
  `id_compromiso` int(11) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `planificacion` date NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Almacena las Planificaciones que se definen al cargar la matriz de compromisos';

-- --------------------------------------------------------

--
-- Table structure for table `procesos_unitarios`
--

CREATE TABLE `procesos_unitarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `icono` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `color` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `procesos_unitarios`
--

INSERT INTO `procesos_unitarios` (`id`, `nombre`, `icono`, `color`, `descripcion`, `created_by`, `created`, `modified_by`, `modified`, `deleted`) VALUES
(1, 'Transporte', 'PU__Transporte.png', '#777777', 'Conjunto de actividades asociadas al transporte de materias primas, equipos, insumos, residuos y personal, a lo largo de toda la fase analizada.', 1, '2018-02-01 00:00:00', 1, '2018-06-19 16:53:49', 0),
(2, 'Trabajos de Obra', 'PU__Trabajos de Obra.png', '#ccbe2f', 'Conjunto de actividades constructivas dentro del sitio de faena, que comienzan una vez realizada la planificación y recibidos los insumos, y terminan con el proyecto construido.', 1, '2018-02-01 00:00:00', 1, '2018-02-14 13:47:46', 0),
(3, 'Mantenimiento de Faena', 'PU__mantenimiento de faena.png', '#40e815', 'Conjunto de actividades asociadas al mantenimiento de las maquinarias y equipos, tales como revisiones de rutina (revisión de niveles de aceite e inspección visual del equipo), lubricación y engrase (engrase de partes, cambio de aceite y filtros), ajustes y servicios (revisiones sistemáticas del equipo para verificar anomalías).', 1, '2018-02-01 00:00:00', 1, '2018-02-02 19:46:56', 0),
(4, 'Uso de Instalaciones de Faena', 'PU__uso de instalaciones.png', '#10c8e0', 'Conjunto de operaciones relacionadas con las necesidades del personal en el sitio del proyecto. Este proceso considera el uso de comedores, oficinas, servicios higiénicos u otras instalaciones habitables y el consumo de alimentos y agua potable.', 1, '2018-02-01 00:00:00', 1, '2018-02-02 19:47:25', 0),
(5, 'Gestión de Residuos', 'PU__gesion de residuos.png', '#5cb85c', 'Conjunto de actividades asociadas al manejo de los residuos generados durante la construcción del proyecto. El proceso inicia con la recepción de los residuos generados por los procesos anteriormente descritos, su segregación, y alternativa de manejo, de acuerdo a si son reutilizados en la faena (previo tratamiento de ser necesario) o destinados a un tercero fuera de la faena, el cual podrá realizar reutilización, reciclaje o disposición de manera permanente en un lugar autorizado.', 1, '2018-02-01 00:00:00', 1, '2018-05-31 19:43:50', 0),
(6, 'Desmontaje', 'PU__desmontaje.png', '', '', 1, '2018-02-01 00:00:00', NULL, NULL, 0),
(7, 'Restauración de terreno', 'PU__restauracion de terreno.png', '', '', 1, '2018-02-01 00:00:00', NULL, NULL, 0),
(8, 'Recepción de Equipos', 'PU__recepcion.png', '#2f825f', 'Conjunto de actividades asociadas al abastecimiento de la central de los equipos y materias primas necesarias (paneles, motores, cableado, entre otros). Este proceso incluye sólo aquellos elementos en los que no se puede realizar una gestión ambiental en los procesos posteriores, por lo tanto recoge las huellas e impactos ambientales propios de los requerimientos inherentes del proyecto.', 1, '2018-02-01 00:00:00', 1, '2018-02-14 19:58:06', 0),
(9, 'Movimiento de Tierra', 'PU__movimiento_tierra.png', '', 'Todas aquellas actividades relacionadas con el acondicionamiento del terreno para la posterior\ninstalación de infraestructuras (caminos, subestación, paneles o torres de transmisión según sea el\ncaso). Incluye las operaciones de excavación de zanjas, rellenos estructurales y compactación.', 1, '2018-02-01 00:00:00', 1, '2018-02-14 19:53:19', 0),
(10, 'Cimentación y Fundación', 'PU__cimentacion.png', '', 'Conjunto de actividades que permiten construir los elementos estructurales de las edificaciones\n(como torres, paneles, caminos o subestación) del proyecto, es decir las bases para el montaje, por\nlo tanto incluye el encofrado, hormigonado, fraguado y relleno estructural de las excavaciones\nrealizadas en el proceso anterior.', 1, '2018-02-01 00:00:00', 1, '2020-02-12 19:53:51', 0),
(11, 'Montaje', 'PU__Trabajos de Obra.png', '', 'Todas las actividades que permiten la instalación de la infraestructura requerida por el proyecto, ya sean obras temporales o permanentes. Inicia con el ensamblaje de los equipos y estructuras sobre sus respectivas fundaciones, la instalación del sistema eléctrico asociado a cada equipo y finaliza con las pruebas de la infraestructura instalada.', 1, '2018-02-01 00:00:00', 1, '2018-02-02 19:49:29', 0);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `id_industria` int(11) NOT NULL,
  `id_tecnologia` int(11) NOT NULL COMMENT 'Este campo hace referencia a la tabla subrubros',
  `id_tech` int(11) DEFAULT NULL COMMENT 'Este campo hace referencia a la tabla tecnologias',
  `id_formato_huella` int(11) NOT NULL,
  `id_metodologia` int(11) NOT NULL,
  `client_label` varchar(500) CHARACTER SET utf8 NOT NULL,
  `client_label_rut` varchar(500) CHARACTER SET utf8 NOT NULL,
  `legal_representative` varchar(500) CHARACTER SET utf8 NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `sigla` varchar(500) CHARACTER SET utf8 NOT NULL,
  `description` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icono` varchar(500) CHARACTER SET utf8 NOT NULL,
  `foto` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf8_unicode_ci NOT NULL,
  `archivos_contenido` longtext CHARACTER SET utf8 NOT NULL,
  `city` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_pais` int(11) NOT NULL,
  `environmental_authorization` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tipo_infraestructura` varchar(500) CHARACTER SET utf8 NOT NULL,
  `num_equipos_generacion` int(11) DEFAULT NULL,
  `potencia_unitaria_equipos` float DEFAULT NULL,
  `tipo_subestacion_electrica` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `capacidad_transformacion` float DEFAULT NULL,
  `num_torres_alta_tension` int(11) DEFAULT NULL,
  `longitud_linea` float DEFAULT NULL,
  `start_date` date NOT NULL,
  `deadline` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `matriz_compromisos_rca` int(11) NOT NULL,
  `matriz_compromisos_reportables` int(11) NOT NULL,
  `matriz_permisos` int(11) NOT NULL,
  `matriz_stakeholders` int(11) NOT NULL,
  `matriz_acuerdos` int(11) NOT NULL,
  `matriz_feedback` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` int(11) DEFAULT '0',
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` enum('open','closed','canceled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `labels` text COLLATE utf8_unicode_ci,
  `price` double NOT NULL DEFAULT '0',
  `starred_by` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `is_leader` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proyecto_rel_actividades`
--

CREATE TABLE `proyecto_rel_actividades` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_actividad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proyecto_rel_fases`
--

CREATE TABLE `proyecto_rel_fases` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_fase` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` date NOT NULL,
  `modified` date DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proyecto_rel_huellas`
--

CREATE TABLE `proyecto_rel_huellas` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_huella` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proyecto_rel_pu`
--

CREATE TABLE `proyecto_rel_pu` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_proceso_unitario` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports_configuration_settings`
--

CREATE TABLE `reports_configuration_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `project_data` int(1) NOT NULL,
  `rca_compromises` int(11) NOT NULL,
  `reportable_compromises` int(11) NOT NULL,
  `ambiental_events` int(11) NOT NULL,
  `consumptions` int(1) NOT NULL,
  `waste` int(1) NOT NULL,
  `ambiental_education` int(11) NOT NULL,
  `project_modifications` int(11) NOT NULL,
  `compromises` int(11) NOT NULL,
  `permittings` int(11) NOT NULL,
  `relevant_topics` int(11) NOT NULL,
  `materials` longtext NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports_units_settings`
--

CREATE TABLE `reports_units_settings` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_tipo_unidad` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reports_units_settings_clients`
--

CREATE TABLE `reports_units_settings_clients` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_tipo_unidad` int(11) NOT NULL,
  `id_unidad` int(11) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `permissions` mediumtext COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rubros`
--

CREATE TABLE `rubros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rubros`
--

INSERT INTO `rubros` (`id`, `nombre`, `deleted`) VALUES
(1, 'Agricultura, Ganadería, Caza y Silvicultura', 0),
(2, 'Pesca', 0),
(3, 'Explotación de minas y canteras', 0),
(4, 'Industrias manufactureras no metálicas', 0),
(5, 'Industrias manufactureras metálicas', 0),
(6, 'Suministro de Electricidad, Gas y Agua', 0),
(7, 'Construcción', 0),
(8, 'Hoteles y Restaurantes', 0),
(9, 'Transportes, Almacenamiento y Comunicaciones', 0),
(10, 'Intermediación financiera', 0),
(11, 'Servicios Sociales y de Salud', 0),
(12, 'Enseñanza', 0),
(13, 'Adm. Publica y defensa, planes de seg. social. Afiliación Obligatoria', 0),
(14, 'Activ. inmobiliarias, empresariales y de alquiler', 0),
(15, 'Eliminación de desperdicios y aguas residuales, saneamiento', 0);

-- --------------------------------------------------------

--
-- Table structure for table `rubros_rel_subrubro`
--

CREATE TABLE `rubros_rel_subrubro` (
  `id` int(11) NOT NULL,
  `id_rubro` int(11) NOT NULL,
  `id_subrubro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rubros_rel_subrubro`
--

INSERT INTO `rubros_rel_subrubro` (`id`, `id_rubro`, `id_subrubro`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 2, 24),
(25, 3, 25),
(26, 3, 26),
(27, 3, 27),
(28, 3, 28),
(29, 3, 29),
(30, 3, 30),
(31, 3, 31),
(32, 3, 32),
(33, 4, 33),
(34, 4, 34),
(35, 4, 35),
(36, 4, 36),
(37, 4, 37),
(38, 4, 38),
(39, 4, 39),
(40, 4, 40),
(41, 4, 41),
(42, 4, 42),
(43, 4, 43),
(44, 4, 44),
(45, 4, 45),
(46, 5, 46),
(47, 5, 47),
(48, 5, 48),
(49, 5, 49),
(50, 5, 50),
(51, 5, 51),
(52, 5, 52),
(53, 5, 53),
(54, 5, 54),
(55, 5, 55),
(56, 5, 56),
(57, 5, 57),
(58, 6, 58),
(59, 6, 59),
(60, 7, 60),
(61, 8, 61),
(62, 8, 62),
(63, 9, 63),
(64, 9, 64),
(65, 9, 65),
(66, 9, 66),
(67, 9, 67),
(68, 9, 68),
(69, 9, 69),
(70, 10, 70),
(71, 10, 71),
(72, 10, 72),
(73, 11, 73),
(74, 11, 74),
(75, 12, 75),
(76, 13, 76),
(77, 14, 77),
(78, 14, 78),
(79, 14, 79),
(80, 15, 80);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `setting_value` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_value`, `deleted`) VALUES
('accepted_file_formats', 'jpg,jpeg,png,doc,docx,ppt,pptx,txt,pdf,rar,zip,xls,xlsx,xlsm,csv', 0),
('allowed_ip_addresses', '', 0),
('app_title', 'MIMASOFT - Plataforma de medición medioambiental', 0),
('company_email', 'admin@mimasoft.cl', 0),
('currency_position', 'left', 0),
('currency_symbol', '$', 0),
('date_format', 'Y-m-d', 0),
('decimal_separator', '.', 0),
('default_currency', 'USD', 0),
('email_protocol', '', 0),
('email_sent_from_address', 'info.mlp@mimasoft.cl', 0),
('email_sent_from_name', 'PARTICULAS', 0),
('email_smtp_host', 'smtp.dreamhost.com', 0),
('email_smtp_pass', 'Mimasoft.1127', 0),
('email_smtp_port', '465', 0),
('email_smtp_security_type', 'ssl', 0),
('email_smtp_user', 'info.mlp@mimasoft.cl', 0),
('first_day_of_week', '1', 0),
('invoice_logo', 'default-invoice-logo.png', 0),
('item_purchase_code', '811b4af5-3b84-4e74-9435-6e8b6ba47655', 0),
('language', 'spanish', 0),
('last_cron_job_time', '1711540803', 0),
('max_file_size', '50', 0),
('module_announcement', '1', 0),
('module_attendance', '1', 0),
('module_estimate', '1', 0),
('module_estimate_request', '1', 0),
('module_event', '1', 0),
('module_expense', '1', 0),
('module_help', '1', 0),
('module_invoice', '1', 0),
('module_knowledge_base', '1', 0),
('module_leave', '1', 0),
('module_message', '1', 0),
('module_note', '1', 0),
('module_project_timesheet', '1', 0),
('module_ticket', '1', 0),
('module_timeline', '1', 0),
('module_todo', '1', 0),
('rows_per_page', '10', 0),
('scrollbar', 'jquery', 0),
('show_background_image_in_signin_page', 'no', 0),
('show_logo_in_signin_page', 'no', 0),
('site_logo', '_file59d68322a2036-site-logo.png', 0),
('time_format', 'small', 0),
('timezone', 'America/Santiago', 0);

-- --------------------------------------------------------

--
-- Table structure for table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `facebook` text COLLATE utf8_unicode_ci,
  `twitter` text COLLATE utf8_unicode_ci,
  `linkedin` text COLLATE utf8_unicode_ci,
  `googleplus` text COLLATE utf8_unicode_ci,
  `digg` text COLLATE utf8_unicode_ci,
  `youtube` text COLLATE utf8_unicode_ci,
  `pinterest` text COLLATE utf8_unicode_ci,
  `instagram` text COLLATE utf8_unicode_ci,
  `github` text COLLATE utf8_unicode_ci,
  `tumblr` text COLLATE utf8_unicode_ci,
  `vine` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stakeholders_matrix_config`
--

CREATE TABLE `stakeholders_matrix_config` (
  `id` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `stakeholders_matrix_config_rel_campos`
--

CREATE TABLE `stakeholders_matrix_config_rel_campos` (
  `id` int(11) NOT NULL,
  `id_stakeholder_matrix_config` int(11) NOT NULL,
  `id_campo` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subproyectos`
--

CREATE TABLE `subproyectos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `descripcion` longtext NOT NULL,
  `tipo_infraestructura` varchar(500) DEFAULT NULL,
  `num_equipos_generacion` double DEFAULT NULL,
  `potencia_unitaria_equipos` double DEFAULT NULL,
  `tipo_subestacion` varchar(500) DEFAULT NULL,
  `num_torres_alta_tension` double DEFAULT NULL,
  `longitud_linea` decimal(10,0) DEFAULT NULL,
  `capacidad_transformacion` double DEFAULT NULL,
  `superficie` double DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subrubros`
--

CREATE TABLE `subrubros` (
  `id` int(11) NOT NULL,
  `nombre` varchar(1000) NOT NULL,
  `descripcion` varchar(5000) DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subrubros`
--

INSERT INTO `subrubros` (`id`, `nombre`, `descripcion`, `deleted`) VALUES
(1, 'Cultivo de cereales', '', 0),
(2, 'Cultivo de forraje', '', 0),
(3, 'Cultivo de legumbres', '', 0),
(4, 'Cultivo de tubérculos', '', 0),
(5, 'Cultivo de oleaginosas', '', 0),
(6, 'Producción de semillas', '', 0),
(7, 'Cultivo de fibras industriales', '', 0),
(8, 'Cultivo de hortalizas', '', 0),
(9, 'Cultivos floricultura', '', 0),
(10, 'Cultivo y recolección de hongos', '', 0),
(11, 'Cultivo de uvas', '', 0),
(12, 'Cultivo de frutales', '', 0),
(13, 'Otros cultivos', '', 0),
(14, 'Cría de equinos', '', 0),
(15, 'Cría de porcinos', '', 0),
(16, 'Cría de aves', '', 0),
(17, 'Cría de animales domésticos', '', 0),
(18, 'Apicultura', '', 0),
(19, 'Cría de otros animales', '', 0),
(20, 'Caza', '', 0),
(21, 'Silvicultura', '', 0),
(22, 'Explotación mixta', '', 0),
(23, 'Otra actividad de agricultura, ganadería, caza y silvicultura', '', 0),
(24, 'Peces y otros productos del mar', '', 0),
(25, 'Aglomeración de carbón de piedra, lignito y turba', '', 0),
(26, 'Petróleo crudo y gas natural', '', 0),
(27, 'Minerales metalíferos', '', 0),
(28, 'Áridos', '', 0),
(29, 'Nitratos y yodo', '', 0),
(30, 'Sal', '', 0),
(31, 'Litio y cloruros', '', 0),
(32, 'Otros', '', 0),
(33, 'Alimentos', '', 0),
(34, 'Bebidas', '', 0),
(35, 'Productos de tabaco', '', 0),
(36, 'Productos textiles', '', 0),
(37, 'Productos de piel', '', 0),
(38, 'Calzado', '', 0),
(39, 'Productos de madera', '', 0),
(40, 'Productos de papel', '', 0),
(41, 'Edición e impresión', '', 0),
(42, 'Productos químicos', '', 0),
(43, 'Plásticos', '', 0),
(44, 'Vidrio', '', 0),
(45, 'Otros productos', '', 0),
(46, 'Hierro y Acero', '', 0),
(47, 'Metales preciosos y no ferrosos', '', 0),
(48, 'Otros productos metálicos', '', 0),
(49, 'Fabricación de maquinarias y equipos', '', 0),
(50, 'Reparación de maquinarias y equipos', '', 0),
(51, 'Fabricación de aparatos e instrumentos médicos', '', 0),
(52, 'Fabricación y reparación de instrumentos de óptica y equipo fotográfico', '', 0),
(53, 'Fabricación de equipos de transporte', '', 0),
(54, 'Fabricación de muebles', '', 0),
(55, 'Fundición de metales', '', 0),
(56, 'Otras industrias manufactureras', '', 0),
(57, 'Reciclaje de desperdicios y desechos', '', 0),
(58, 'Captación, depuración y distribución de agua', '', 0),
(59, 'Generación, captación y distribución de energía eléctrica', '', 0),
(60, 'Construcción de edificios y obras menores', '', 0),
(61, 'Hoteles, campamentos y otros tipos de hospedaje temporal', '', 0),
(62, 'Restaurantes, bares y cantinas', '', 0),
(63, 'Transporte por ferrocarriles', '', 0),
(64, 'Otros tipos de transporte por vía terrestre', '', 0),
(65, 'Transporte por Tuberías', '', 0),
(66, 'Transporte Marítimo y de Cabotaje', '', 0),
(67, 'Transporte por vías de navegación interiores', '', 0),
(68, 'Transporte por vía aérea', '', 0),
(69, 'Act. Transporte complementarias y auxiliares, agencias de viaje', '', 0),
(70, 'Financiación Planes de seg. y de pensiones, excepto afiliación obligatoria', '', 0),
(71, 'Otros tipos de intermediación financiera', '', 0),
(72, 'Intermediación Monetaria', '', 0),
(73, 'Actividades veterinarias', '', 0),
(74, 'Actividades relacionadas con la salud humana', '', 0),
(75, 'Enseñanza preescolar, primaria, secundaria y superior, profesores', '', 0),
(76, 'Gobierno Central y Administración Pública', '', 0),
(77, 'Publicidad', '', 0),
(78, 'Actividades de investigaciones y desarrollo experimental', '', 0),
(79, 'Actividades de arquitectura e ingeniería y otras actividades técnicas', '', 0),
(80, 'Actividades de organización empresariales, profesionales, sindicales, de esparcimiento y otras actividades de servicios.', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `project_id` int(11) NOT NULL,
  `milestone_id` int(11) NOT NULL DEFAULT '0',
  `assigned_to` int(11) NOT NULL,
  `deadline` date DEFAULT NULL,
  `labels` text COLLATE utf8_unicode_ci,
  `points` tinyint(4) NOT NULL DEFAULT '1',
  `status` enum('to_do','in_progress','done') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'to_do',
  `start_date` date NOT NULL,
  `collaborators` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `members` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_member_job_info`
--

CREATE TABLE `team_member_job_info` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_of_hire` date NOT NULL DEFAULT '0000-00-00',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `salary` double NOT NULL DEFAULT '0',
  `salary_term` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tecnologias`
--

CREATE TABLE `tecnologias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tecnologias`
--

INSERT INTO `tecnologias` (`id`, `nombre`, `deleted`) VALUES
(1, 'Eólica', 0),
(2, 'Solar Fotovoltaica', 0),
(3, 'Termosolar', 0),
(4, 'Mini Híbrido Pasada', 0),
(5, 'Mini Híbrido Embalse', 0),
(6, 'Geotérmica', 0);

-- --------------------------------------------------------

--
-- Table structure for table `thresholds`
--

CREATE TABLE `thresholds` (
  `id` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `id_project` int(11) NOT NULL,
  `id_module` int(11) NOT NULL,
  `id_form` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `id_material` int(11) NOT NULL,
  `id_category` int(11) NOT NULL,
  `id_unit_type` int(11) NOT NULL,
  `id_unit` int(11) NOT NULL,
  `risk_value` int(11) NOT NULL,
  `threshold_value` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipos_organizaciones`
--

CREATE TABLE `tipos_organizaciones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipos_organizaciones`
--

INSERT INTO `tipos_organizaciones` (`id`, `nombre`, `deleted`) VALUES
(1, 'groups_of_workers', 0),
(2, 'education_centers', 0),
(3, 'emergency_institutions', 0),
(4, 'municipalities', 0),
(5, 'community_organizations', 0),
(6, 'recreation_organizations', 0),
(7, 'social_organizations', 0),
(8, 'trade_unions', 0),
(9, 'others', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_campo`
--

CREATE TABLE `tipo_campo` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_campo`
--

INSERT INTO `tipo_campo` (`id`, `nombre`, `descripcion`, `deleted`) VALUES
(1, 'Input text', 'Un input text', 0),
(2, 'Texto Largo', 'Un textarea', 0),
(3, 'Número', '', 0),
(4, 'Fecha', '', 0),
(5, 'Periodo', '', 0),
(6, 'Selección', '', 0),
(7, 'Selección Múltiple', '', 1),
(8, 'Rut', '', 0),
(9, 'Radio Buttons', '', 0),
(10, 'Archivo', '', 0),
(11, 'Texto Fijo', 'Texto a mostrar', 0),
(12, 'Divisor', 'Una linea de segmentacion', 0),
(13, 'Correo', '', 0),
(14, 'Hora', 'Campo para ingresar la hora', 0),
(15, 'Unidad', 'Campo para ingresar los tipos de unidad', 0),
(16, 'Selección desde Mantenedora', 'Select en donde la fuente de sus datos es una tabla mantenedora', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_formulario`
--

CREATE TABLE `tipo_formulario` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_formulario`
--

INSERT INTO `tipo_formulario` (`id`, `nombre`, `created_by`, `modified_by`, `created`, `modified`, `deleted`) VALUES
(1, 'Registro ambiental', 1, 1, '2017-10-16 00:00:00', '2017-10-25 00:00:00', 0),
(2, 'Mantenedora', 1, 1, '2017-10-16 00:00:00', '2017-10-18 00:00:00', 0),
(3, 'Otros registros', 1, 1, '2017-10-16 00:00:00', '2017-10-18 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tipo_tratamiento`
--

CREATE TABLE `tipo_tratamiento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_tratamiento`
--

INSERT INTO `tipo_tratamiento` (`id`, `nombre`, `deleted`) VALUES
(1, 'Disposición', 0),
(2, 'Reutilización', 0),
(3, 'Reciclaje', 0);

-- --------------------------------------------------------

--
-- Table structure for table `unidades_funcionales`
--

CREATE TABLE `unidades_funcionales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_proyecto` int(11) NOT NULL,
  `id_subproyecto` int(11) NOT NULL,
  `unidad` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `rut` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `user_type` enum('staff','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'client',
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT '0',
  `id_profile` int(11) DEFAULT NULL,
  `id_client_context_profile` int(11) DEFAULT NULL,
  `id_client_group` int(11) DEFAULT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `cargo` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `language` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'spanish',
  `disable_login` tinyint(1) NOT NULL DEFAULT '0',
  `phone` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `message_checked_at` datetime DEFAULT NULL,
  `notification_checked_at` datetime DEFAULT NULL,
  `alert_checked_at` datetime DEFAULT NULL,
  `is_primary_contact` int(11) DEFAULT NULL,
  `job_title` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alternative_phone` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `ssn` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sticky_note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable_web_notification` int(11) DEFAULT NULL,
  `enable_email_notification` int(11) DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `change_map_type` tinyint(1) NOT NULL,
  `can_delete_files` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `rut`, `user_type`, `is_admin`, `role_id`, `id_profile`, `id_client_context_profile`, `id_client_group`, `email`, `cargo`, `password`, `image`, `status`, `client_id`, `language`, `disable_login`, `phone`, `gender`, `created_at`, `created_by`, `modified_by`, `created`, `modified`, `deleted`, `message_checked_at`, `notification_checked_at`, `alert_checked_at`, `is_primary_contact`, `job_title`, `note`, `address`, `alternative_address`, `alternative_phone`, `dob`, `ssn`, `sticky_note`, `skype`, `enable_web_notification`, `enable_email_notification`, `last_access`, `change_map_type`, `can_delete_files`) VALUES
(1, 'Admin', 'Mimasoft', '11.111.111-1', 'staff', 1, 0, NULL, NULL, NULL, 'admin@mimasoft.cl', 'Cargo Test', '5c34d44b9b4b7b994ccf3e4d12b61f23', NULL, 'active', NULL, 'spanish', 0, '38757572', 'male', '2017-07-21 13:45:18', 1, NULL, '2017-11-01 00:00:00', '2022-02-07 14:45:13', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, 0, '', '', '', '', 0, '0000-00-00', '', '', '', 1, 1, '2024-10-11 15:01:05', 0, 0),
(2, 'Luis', 'Díaz Robles', '', 'client', 0, 0, 1, 1, NULL, 'luisdiazrobles@particulas.cl', 'Director de proyecto', '2f628babbce25bb79ff403642148da8f', NULL, 'active', 1, 'spanish', 0, '+56', 'male', '2020-07-29 15:20:34', 1, NULL, '2020-07-29 15:20:34', '2024-06-27 18:23:46', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-06-27 19:55:50', 1, 0),
(3, 'Carla', 'Bravo', '', 'client', 0, 0, 5, 1, 1, 'carla.bravo@mimasoft.cl', '', 'c9203bab1c383d847b62a05086927544', NULL, 'active', 1, 'spanish', 0, '+56', 'female', '2023-12-19 13:02:37', 1, NULL, '2023-12-19 13:02:37', '2024-02-21 16:35:33', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-09-08 23:08:05', 1, 1),
(4, 'Angel', 'Rubilar', '', 'client', 0, 0, 1, 1, NULL, 'angelrubilar07@gmail.com', 'TI', '419c29938c8bdf72a7bd6035b2865c0f', NULL, 'active', 1, 'spanish', 0, '+56', 'male', '2024-02-23 21:25:24', 1, NULL, '2024-02-23 21:25:24', '2024-06-18 19:34:27', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-10-03 11:31:06', 0, 0),
(5, 'Luis', 'Loyola', '', 'client', 0, 0, 5, 1, 3, 'luis.loyola.b@hotmail.com', 'TI', 'f2084631dae093e83ed43a7a2a88f509', NULL, 'active', 1, 'spanish', 0, '+56', 'male', '2024-02-23 21:26:30', 1, NULL, '2024-02-23 21:26:30', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-15 15:34:24', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_api_session`
--

CREATE TABLE `users_api_session` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` longtext NOT NULL,
  `login_date` datetime NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_acuerdos`
--

CREATE TABLE `valores_acuerdos` (
  `id` int(11) NOT NULL,
  `id_agreement_matrix_config` int(11) NOT NULL,
  `codigo` varchar(500) NOT NULL,
  `nombre_acuerdo` varchar(500) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `periodo` varchar(500) NOT NULL,
  `gestor` int(11) NOT NULL,
  `datos_campos` longtext NOT NULL,
  `stakeholders` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_compromisos_rca`
--

CREATE TABLE `valores_compromisos_rca` (
  `id` int(11) NOT NULL,
  `id_compromiso` int(11) NOT NULL,
  `numero_compromiso` int(11) NOT NULL,
  `nombre_compromiso` varchar(500) NOT NULL,
  `fases` longtext NOT NULL,
  `reportabilidad` int(1) NOT NULL,
  `datos_campos` longtext NOT NULL,
  `accion_cumplimiento_control` varchar(500) NOT NULL,
  `frecuencia_ejecucion` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_compromisos_reportables`
--

CREATE TABLE `valores_compromisos_reportables` (
  `id` int(11) NOT NULL,
  `id_compromiso` int(11) NOT NULL,
  `numero_compromiso` int(11) NOT NULL,
  `nombre_compromiso` varchar(500) NOT NULL,
  `considerando` varchar(2000) CHARACTER SET utf32 DEFAULT NULL,
  `condicion_o_compromiso` varchar(2000) DEFAULT NULL,
  `descripcion` varchar(2000) NOT NULL,
  `datos_campos` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Guarda los compromisos ingresados desde carga individual o masivamente';

-- --------------------------------------------------------

--
-- Table structure for table `valores_feedback`
--

CREATE TABLE `valores_feedback` (
  `id` int(11) NOT NULL,
  `id_feedback_matrix_config` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `id_tipo_organizacion` int(11) NOT NULL,
  `proposito_visita` varchar(500) NOT NULL,
  `responsable` int(11) NOT NULL,
  `datos_campos` longtext,
  `requires_monitoring` tinyint(4) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_formularios`
--

CREATE TABLE `valores_formularios` (
  `id` int(11) NOT NULL,
  `id_formulario_rel_proyecto` int(11) NOT NULL,
  `datos` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_formularios_fijos`
--

CREATE TABLE `valores_formularios_fijos` (
  `id` int(11) NOT NULL,
  `id_formulario` int(11) NOT NULL,
  `datos` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_permisos`
--

CREATE TABLE `valores_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `numero_permiso` int(11) NOT NULL,
  `nombre_permiso` varchar(500) NOT NULL,
  `fases` longtext NOT NULL,
  `entidad` varchar(500) NOT NULL,
  `datos_campos` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `valores_stakeholders`
--

CREATE TABLE `valores_stakeholders` (
  `id` int(11) NOT NULL,
  `id_stakeholder_matrix_config` int(11) NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `rut` varchar(50) NOT NULL,
  `id_tipo_organizacion` int(11) NOT NULL,
  `localidad` varchar(500) DEFAULT NULL,
  `nombres_contacto` varchar(500) NOT NULL,
  `apellidos_contacto` varchar(500) NOT NULL,
  `telefono_contacto` varchar(50) DEFAULT NULL,
  `correo_contacto` varchar(255) DEFAULT NULL,
  `direccion_contacto` varchar(500) DEFAULT NULL,
  `datos_campos` longtext NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wiki`
--

CREATE TABLE `wiki` (
  `id` int(11) NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `contenido` longtext,
  `codigo` varchar(500) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wiki`
--

INSERT INTO `wiki` (`id`, `titulo`, `contenido`, `codigo`, `created`, `created_by`, `modified`, `modified_by`, `deleted`) VALUES
(1, 'Registros Ambientales', 'Corresponden a formularios que permiten ingresar en el Sistema de Gestión Ambiental del cliente (o cualquier otro procedimiento de documentación) relativa a consumo de insumos, generación de residuos y emisiones atmosféricas que son consideradas en el cálculo de impactos ambientales y la generación de reportes.', 'CG', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'Listas Mantenedoras', 'Las listas mantenedoras corresponden a formularios que centralizan el manejo de algunos datos presentes en el sistema, permitiendo agregar o modificar rápidamente los valores disponibles en otras listas, sin la necesidad de intervenir cada uno de los registros que consultan la información editada.', 'CG', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'Otros Registros', 'Son formularios que permiten ingresar en la plataforma otra información incluida en el Sistema de Gestión Ambiental del cliente (o cualquier otro procedimiento de documentación) que no se utiliza en el proceso de cálculo de impactos ambientales.', 'EACV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'Análisis de Ciclo de Vida', 'El Análisis de Ciclo de Vida (ACV) es una herramienta que permite identificar y cuantificar los impactos ambientales de un sistema productivo para todas las etapas del ciclo de vida del producto, o dicho de otra manera, “de la cuna a la tumba”. Este análisis permite evaluar los efectos que genera un producto desde la adquisición de materias primas, el proceso de fabricación, distribución y transporte hasta la disposición final del producto posterior a su uso por el consumidor.', 'EACV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'Impacto Total', 'Cada consumo, residuo y emisión genera distintos impactos ambientales, los que pueden cuantificarse y expresarse con distintos niveles de análisis. El impacto total corresponde a la sumatoria de cada uno de estos impactos para cada Huella Ambiental del proyecto.', 'EACV', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'Huella Ambiental', 'Los impactos ambientales pueden expresarse en distintos indicadores, que buscan representar consecuencias ambientales de estos impactos, como el agotamiento de recursos, el cambio de uso de suelo o la contaminación sobre cuerpos de agua, el suelo o la atmósfera. Estos indicadores se denominan Huellas Ambientales.', 'EC', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'Unidad Funcional', 'La unidad funcional describe la principal función del sistema productivo que se quiere analizar, permitiendo cuantificar los impactos ambientales de dicho sistema. Esta unidad proporciona una referencia del proyecto analizado y permite comparar los resultados con otros productos o servicios de la misma naturaleza.', 'EC', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'Proceso Unitario', 'Debido a la naturaleza global de la metodología de ACV, esta puede resultar muy extensa, razón por la cual se establecen límites que permiten acotar el sistema a estudiar. Dentro de este sistema, se determinan los procesos unitarios, correspondientes a las unidades mínimas de análisis para los cuales se cuantifican los insumos, residuos y emisiones que posteriormente se traducen en impactos ambientales.', 'EC', '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'Registros de Estaciones de Monitoreo', 'Corresponden a formularios que permiten ingresar información relativa a consumo de insumos, generación de residuos y emisiones atmosféricas que son consideradas para el uso de MIMAire. Para esto agrupamos datos de monitoreo (levantados por estaciones meteorológicas) y de pronóstico (obtenidos a partir de un modelo predictivo).', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(10, 'Variables Atmosféricas', 'Las estaciones meteorológicas pueden medir distintas variables locales del tiempo como la temperatura, la presión atmosférica, la humedad, la nubosidad, el viento y las precipitaciones.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(11, 'Variables de Calidad del Aire', 'Las estaciones de monitoreo pueden medir la concentración de distintas sustancias en la atmósfera (SO2, MP, NO, entre otras) y que dependiendo de su concentración pueden generar impactos negativos en el ambiente y en la salud de las personas.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(12, 'Contaminación Atmosférica', 'Presencia de contaminantes en la atmósfera, tales como polvo, gases o humo en cantidades y durante períodos de tiempo tales que resultan dañinos para los seres humanos, la vida silvestre y la propiedad. Estos contaminantes pueden ser de origen natural o producidos por el hombre directa o indirectamente.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(13, 'Contaminante', 'Todo elemento, compuesto, sustancia, derivado químico o biológico, energía, radiación, vibración, ruido, o una combinación de ellos, cuya presencia en el ambiente, en ciertos niveles, concentraciones o períodos de tiempo, pueda constituir un riesgo a la salud de las personas, a la calidad de vida de la población, a la preservación de la naturaleza o a la conservación del patrimonio ambiental.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(14, 'Contaminante primario y secundario', 'Contaminante primario es aquel producido directamente por la actividad humana o la naturaleza, mientras que el secundario se produce a partir de algún(os) contaminante(s) primario(s) y otras sustancias.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(15, 'Normas Ambientales', 'Normas que la sociedad chilena acuerda para proteger la salud de las personas y el medio ambiente. Existen normas generales, normas de calidad primaria y secundaria, y normas de emisión.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(16, 'Normas de Calidad', 'Aquellas que establecen límites para elementos, compuestos, sustancias, derivados químicos o biológicos, energías, radiaciones, vibraciones, ruidos, o combinación de ellos en el ambiente, atmósfera, por ejemplo', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(17, 'Normas Ambientales', 'Normas que la sociedad chilena acuerda para proteger la salud de las personas y el medio ambiente. Existen normas generales, normas de calidad primaria y secundaria, y normas de emisión.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(18, 'Norma de Emisión', 'La que establece la cantidad máxima permitida para un contaminante, en forma de concentración o de emisión másica, medida en el efluente de la fuente emisora.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(19, 'Zona Latente', 'Aquella área geográfica en que la medición de la concentración de contaminantes en el aire, agua o suelo se sitúa entre el 80% y el 100% del valor de la respectiva norma de calidad ambiental.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(20, 'Zona Saturada', 'Aquella área geográfica en que una o más normas de calidad ambiental se encuentran sobrepasadas.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(21, 'Plan de Prevención', 'Es un instrumento de gestión ambiental que, en una zona latente, busca evitar que las normas ambientales primarias o secundarias sean sobrepasadas.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0),
(22, 'Plan de Descontaminación', 'Según la legislación chilena es un instrumento de gestión ambiental destinado a reducir la presencia de contaminantes a los niveles fijados por las normas primarias o secundarias en una zona saturada.', '', '0000-00-00 00:00:00', 0, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `agreements_matrix_config`
--
ALTER TABLE `agreements_matrix_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `agreements_matrix_config_rel_campos`
--
ALTER TABLE `agreements_matrix_config_rel_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `id_agreement_matrix_config` (`id_agreement_matrix_config`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `air_files`
--
ALTER TABLE `air_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `air_models`
--
ALTER TABLE `air_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `air_records`
--
ALTER TABLE `air_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_air_sector` (`id_air_sector`),
  ADD KEY `air_records_ibfk_4` (`id_air_station`),
  ADD KEY `id_air_model` (`id_air_model`),
  ADD KEY `air_records_ibfk_6` (`id_air_record_type`);

--
-- Indexes for table `air_records_types`
--
ALTER TABLE `air_records_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `air_records_values_p`
--
ALTER TABLE `air_records_values_p`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_record` (`id_record`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `air_records_values_p_max`
--
ALTER TABLE `air_records_values_p_max`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_values_p` (`id_values_p`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `air_records_values_p_min`
--
ALTER TABLE `air_records_values_p_min`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_values_p` (`id_values_p`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `air_records_values_p_porc_conf`
--
ALTER TABLE `air_records_values_p_porc_conf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_values_p` (`id_values_p`),
  ADD KEY `id_upload` (`id_upload`);

--
-- Indexes for table `air_records_values_uploads`
--
ALTER TABLE `air_records_values_uploads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `air_records_values_uploads_ibfk_1` (`id_record`);

--
-- Indexes for table `air_sectors`
--
ALTER TABLE `air_sectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `air_stations`
--
ALTER TABLE `air_stations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `aire_monitoring_stations_ibfk_1` (`id_client`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_aire_sector` (`id_air_sector`);

--
-- Indexes for table `air_stations_rel_variables`
--
ALTER TABLE `air_stations_rel_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_aire_monitoring_station` (`id_air_station`),
  ADD KEY `id_aire_variable` (`id_air_variable`);

--
-- Indexes for table `air_stations_values_1h`
--
ALTER TABLE `air_stations_values_1h`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_station` (`id_station`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `id_station_2` (`id_station`);

--
-- Indexes for table `air_stations_values_1m`
--
ALTER TABLE `air_stations_values_1m`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_station` (`id_station`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `modified_by` (`modified_by`),
  ADD KEY `idx_station_timestamp_deleted` (`id_station`,`timestamp`,`deleted`);

--
-- Indexes for table `air_stations_values_5m`
--
ALTER TABLE `air_stations_values_5m`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_station` (`id_station`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `modified_by` (`modified_by`);

--
-- Indexes for table `air_stations_values_15m`
--
ALTER TABLE `air_stations_values_15m`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_station` (`id_station`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `modified_by` (`modified_by`);

--
-- Indexes for table `air_synoptic_data`
--
ALTER TABLE `air_synoptic_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_project` (`id_project`);

--
-- Indexes for table `air_variables`
--
ALTER TABLE `air_variables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_aire_variable_type` (`id_air_variable_type`),
  ADD KEY `id_unit_type` (`id_unit_type`);

--
-- Indexes for table `air_variables_types`
--
ALTER TABLE `air_variables_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_criterio` (`id_criterio`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `asignaciones_combinaciones`
--
ALTER TABLE `asignaciones_combinaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sp_destino` (`sp_destino`),
  ADD KEY `pu_destino` (`pu_destino`),
  ADD KEY `id_asignacion` (`id_asignacion`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `ayn_admin_modules`
--
ALTER TABLE `ayn_admin_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ayn_admin_submodules`
--
ALTER TABLE `ayn_admin_submodules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_admin_module` (`id_admin_module`);

--
-- Indexes for table `ayn_alert_historical`
--
ALTER TABLE `ayn_alert_historical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_client_module` (`id_client_module`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_alert_historical_air`
--
ALTER TABLE `ayn_alert_historical_air`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ayn_alert_historical_users`
--
ALTER TABLE `ayn_alert_historical_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alert_historical` (`id_alert_historical`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_alert_projects`
--
ALTER TABLE `ayn_alert_projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_client_module` (`id_client_module`),
  ADD KEY `id_project` (`id_project`);

--
-- Indexes for table `ayn_alert_projects_groups`
--
ALTER TABLE `ayn_alert_projects_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alert_project` (`id_alert_project`),
  ADD KEY `id_client_group` (`id_client_group`);

--
-- Indexes for table `ayn_alert_projects_users`
--
ALTER TABLE `ayn_alert_projects_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alert_project` (`id_alert_project`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_clients_groups`
--
ALTER TABLE `ayn_clients_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Indexes for table `ayn_notif_general`
--
ALTER TABLE `ayn_notif_general`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_client_context_module` (`id_client_context_module`);

--
-- Indexes for table `ayn_notif_general_groups`
--
ALTER TABLE `ayn_notif_general_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_general` (`id_notif_general`),
  ADD KEY `id_client_group` (`id_client_group`);

--
-- Indexes for table `ayn_notif_general_users`
--
ALTER TABLE `ayn_notif_general_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_general` (`id_notif_general`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_notif_historical`
--
ALTER TABLE `ayn_notif_historical`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_notif_historical_users`
--
ALTER TABLE `ayn_notif_historical_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_historical` (`id_notif_historical`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_notif_projects_admin`
--
ALTER TABLE `ayn_notif_projects_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_client`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_admin_module` (`id_admin_module`),
  ADD KEY `id_admin_submodule` (`id_admin_submodule`);

--
-- Indexes for table `ayn_notif_projects_admin_groups`
--
ALTER TABLE `ayn_notif_projects_admin_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_projects_admin` (`id_notif_projects_admin`),
  ADD KEY `id_client_group` (`id_client_group`);

--
-- Indexes for table `ayn_notif_projects_admin_users`
--
ALTER TABLE `ayn_notif_projects_admin_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_projects_admin` (`id_notif_projects_admin`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `ayn_notif_projects_clients`
--
ALTER TABLE `ayn_notif_projects_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `ayn_notif_projects_clients_ibfk_3` (`id_client_module`);

--
-- Indexes for table `ayn_notif_projects_clients_groups`
--
ALTER TABLE `ayn_notif_projects_clients_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_projects_clients` (`id_notif_projects_clients`),
  ADD KEY `id_client_group` (`id_client_group`);

--
-- Indexes for table `ayn_notif_projects_clients_users`
--
ALTER TABLE `ayn_notif_projects_clients_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_notif_projects_clients` (`id_notif_projects_clients`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `calculos`
--
ALTER TABLE `calculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_criterio` (`id_criterio`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_subcategoria` (`id_subcategoria`),
  ADD KEY `id_bd` (`id_bd`),
  ADD KEY `calculos_ibfk_8` (`created_by`);

--
-- Indexes for table `campos`
--
ALTER TABLE `campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campos_ibfk_1` (`id_tipo_campo`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `campos_fijos`
--
ALTER TABLE `campos_fijos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_campo` (`id_tipo_campo`);

--
-- Indexes for table `campo_fijo_rel_formulario_rel_proyecto`
--
ALTER TABLE `campo_fijo_rel_formulario_rel_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_campo_fijo` (`id_campo_fijo`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `campo_rel_formulario`
--
ALTER TABLE `campo_rel_formulario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `categorias_alias`
--
ALTER TABLE `categorias_alias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `clients_modules`
--
ALTER TABLE `clients_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_mimasoft_system` (`id_mimasoft_system`);

--
-- Indexes for table `clients_modules_rel_profiles`
--
ALTER TABLE `clients_modules_rel_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `id_client_module` (`id_client_module`),
  ADD KEY `id_client_submodule` (`id_client_submodule`);

--
-- Indexes for table `clients_submodules`
--
ALTER TABLE `clients_submodules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client_module` (`id_client_module`);

--
-- Indexes for table `client_compromises_settings`
--
ALTER TABLE `client_compromises_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `client_consumptions_settings`
--
ALTER TABLE `client_consumptions_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `client_context_modules`
--
ALTER TABLE `client_context_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_context_modules_rel_profiles`
--
ALTER TABLE `client_context_modules_rel_profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client_context_profile` (`id_client_context_profile`),
  ADD KEY `id_client_context_module` (`id_client_context_module`);

--
-- Indexes for table `client_context_profiles`
--
ALTER TABLE `client_context_profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_context_submodules`
--
ALTER TABLE `client_context_submodules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client_context_module` (`id_client_context_module`);

--
-- Indexes for table `client_environmental_footprints_settings`
--
ALTER TABLE `client_environmental_footprints_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `client_indicators`
--
ALTER TABLE `client_indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_indicador` (`id_indicador`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `client_module_availability_settings`
--
ALTER TABLE `client_module_availability_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_modulo` (`id_modulo`);

--
-- Indexes for table `client_permitting_settings`
--
ALTER TABLE `client_permitting_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `client_waste_settings`
--
ALTER TABLE `client_waste_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `compromisos_rca`
--
ALTER TABLE `compromisos_rca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `compromisos_rca_rel_campos`
--
ALTER TABLE `compromisos_rca_rel_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `id_compromiso` (`id_compromiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `compromisos_reportables`
--
ALTER TABLE `compromisos_reportables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `compromisos_reportables_rel_campos`
--
ALTER TABLE `compromisos_reportables_rel_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `id_compromiso` (`id_compromiso`),
  ADD KEY `compromisos_reportables_rel_campos_ibfk_3` (`created_by`);

--
-- Indexes for table `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `criterios`
--
ALTER TABLE `criterios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_material` (`id_material`),
  ADD KEY `id_campo_sp` (`id_campo_sp`),
  ADD KEY `id_campo_pu` (`id_campo_pu`),
  ADD KEY `id_campo_fc` (`id_campo_fc`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `criticidades`
--
ALTER TABLE `criticidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_client_transformation_factors_config`
--
ALTER TABLE `ec_client_transformation_factors_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_tipo_unidad` (`id_tipo_unidad`);

--
-- Indexes for table `ec_tipo_no_aplica`
--
ALTER TABLE `ec_tipo_no_aplica`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_tipo_origen`
--
ALTER TABLE `ec_tipo_origen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ec_tipo_origen_materia`
--
ALTER TABLE `ec_tipo_origen_materia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_origen` (`id_tipo_origen`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `estados_cumplimiento_compromisos`
--
ALTER TABLE `estados_cumplimiento_compromisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `estados_evaluacion_comunidades`
--
ALTER TABLE `estados_evaluacion_comunidades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `estados_tramitacion_permisos`
--
ALTER TABLE `estados_tramitacion_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluaciones_acuerdos`
--
ALTER TABLE `evaluaciones_acuerdos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluaciones_acuerdos_ibfk_1` (`id_valor_acuerdo`),
  ADD KEY `id_stakeholder` (`id_stakeholder`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluaciones_cumplimiento_compromisos_rca`
--
ALTER TABLE `evaluaciones_cumplimiento_compromisos_rca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `evaluaciones_cumplimiento_compromisos_rca_ibfk_1` (`id_valor_compromiso`),
  ADD KEY `evaluaciones_cumplimiento_compromisos_rca_ibfk_2` (`id_evaluado`),
  ADD KEY `evaluaciones_cumplimiento_compromisos_rca_ibfk_3` (`id_estados_cumplimiento_compromiso`),
  ADD KEY `id_criticidad` (`id_criticidad`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluaciones_cumplimiento_compromisos_reportables`
--
ALTER TABLE `evaluaciones_cumplimiento_compromisos_reportables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_criticidad` (`id_criticidad`),
  ADD KEY `id_estados_cumplimiento_compromiso` (`id_estados_cumplimiento_compromiso`),
  ADD KEY `id_planificacion` (`id_planificacion`),
  ADD KEY `id_valor_compromiso` (`id_valor_compromiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluaciones_feedback`
--
ALTER TABLE `evaluaciones_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_valor_feedback` (`id_valor_feedback`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluaciones_tramitacion_permisos`
--
ALTER TABLE `evaluaciones_tramitacion_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estados_tramitacion_permisos` (`id_estados_tramitacion_permisos`),
  ADD KEY `id_evaluado` (`id_evaluado`),
  ADD KEY `id_valor_permiso` (`id_valor_permiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluados_permisos`
--
ALTER TABLE `evaluados_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evaluados_rca_compromisos`
--
ALTER TABLE `evaluados_rca_compromisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compromiso` (`id_compromiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evidencias_acuerdos`
--
ALTER TABLE `evidencias_acuerdos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_evaluacion_acuerdo` (`id_evaluacion_acuerdo`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evidencias_cumplimiento_compromisos`
--
ALTER TABLE `evidencias_cumplimiento_compromisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evidencias_evaluaciones_feedback`
--
ALTER TABLE `evidencias_evaluaciones_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_evaluacion_feedback` (`id_evaluacion_feedback`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `evidencias_tramitacion_permisos`
--
ALTER TABLE `evidencias_tramitacion_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_evaluacion_tramitacion_permisos` (`id_evaluacion_tramitacion_permisos`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `fases`
--
ALTER TABLE `fases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fase_rel_pu`
--
ALTER TABLE `fase_rel_pu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_proceso_unitario` (`id_proceso_unitario`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `feedback_matrix_config`
--
ALTER TABLE `feedback_matrix_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `feedback_matrix_config_rel_campos`
--
ALTER TABLE `feedback_matrix_config_rel_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_feedback_matrix_config` (`id_feedback_matrix_config`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `fontawesome`
--
ALTER TABLE `fontawesome`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `formularios`
--
ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_formulario` (`id_tipo_formulario`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `formulario_rel_materiales`
--
ALTER TABLE `formulario_rel_materiales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_material` (`id_material`);

--
-- Indexes for table `formulario_rel_materiales_rel_categorias`
--
ALTER TABLE `formulario_rel_materiales_rel_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_material` (`id_material`),
  ADD KEY `formulario_rel_materiales_rel_categorias_ibfk_3` (`id_categoria`);

--
-- Indexes for table `formulario_rel_proyecto`
--
ALTER TABLE `formulario_rel_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `general_files`
--
ALTER TABLE `general_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `general_settings_ibfk_1` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `general_settings_clients`
--
ALTER TABLE `general_settings_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indexes for table `home_modules_info`
--
ALTER TABLE `home_modules_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `indicators`
--
ALTER TABLE `indicators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_fontawesome` (`id_fontawesome`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `industrias`
--
ALTER TABLE `industrias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `industrias_rel_tecnologias`
--
ALTER TABLE `industrias_rel_tecnologias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_industria` (`id_industria`),
  ADD KEY `id_tecnologia` (`id_tecnologia`);

--
-- Indexes for table `kpi_estructura_graficos`
--
ALTER TABLE `kpi_estructura_graficos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `kpi_estructura_reporte`
--
ALTER TABLE `kpi_estructura_reporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `kpi_plantillas_reporte`
--
ALTER TABLE `kpi_plantillas_reporte`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pais` (`id_pais`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_tecnologia` (`id_tecnologia`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `kpi_valores`
--
ALTER TABLE `kpi_valores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `id_formulario` (`id_formulario`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_tipo_formulario` (`id_tipo_formulario`);

--
-- Indexes for table `kpi_valores_condicion`
--
ALTER TABLE `kpi_valores_condicion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `id_kpi_valores` (`id_kpi_valores`),
  ADD KEY `id_campo_fijo` (`id_campo_fijo`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materiales_proyecto`
--
ALTER TABLE `materiales_proyecto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_m_rel_c_rel_f` (`id_proyecto`),
  ADD KEY `id_material` (`id_material`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `mimasoft`
--
ALTER TABLE `mimasoft`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mimasoft_systems`
--
ALTER TABLE `mimasoft_systems`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_availability_settings`
--
ALTER TABLE `module_availability_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_modulo_cliente` (`id_modulo_cliente`);

--
-- Indexes for table `module_footprint_units`
--
ALTER TABLE `module_footprint_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_modulo_cliente` (`id_unidad`),
  ADD KEY `id_tipo_unidad` (`id_tipo_unidad`);

--
-- Indexes for table `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `permisos_rel_campos`
--
ALTER TABLE `permisos_rel_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `planificaciones_reportables_compromisos`
--
ALTER TABLE `planificaciones_reportables_compromisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compromiso` (`id_compromiso`),
  ADD KEY `planificaciones_reportables_compromisos_ibfk_2` (`created_by`);

--
-- Indexes for table `procesos_unitarios`
--
ALTER TABLE `procesos_unitarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_industria` (`id_industria`),
  ADD KEY `projects_ibfk_2` (`id_metodologia`),
  ADD KEY `id_tecnologia` (`id_tecnologia`),
  ADD KEY `id_formato_huella` (`id_formato_huella`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `projects_ibfk_6` (`id_tech`),
  ADD KEY `id_pais` (`id_pais`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `proyecto_rel_actividades`
--
ALTER TABLE `proyecto_rel_actividades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proyecto_rel_fases`
--
ALTER TABLE `proyecto_rel_fases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_fase` (`id_fase`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `proyecto_rel_huellas`
--
ALTER TABLE `proyecto_rel_huellas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_proceso_unitario` (`id_huella`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `proyecto_rel_pu`
--
ALTER TABLE `proyecto_rel_pu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_proceso_unitario` (`id_proceso_unitario`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `reports_configuration_settings`
--
ALTER TABLE `reports_configuration_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`);

--
-- Indexes for table `reports_units_settings`
--
ALTER TABLE `reports_units_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_tipo_unidad` (`id_tipo_unidad`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indexes for table `reports_units_settings_clients`
--
ALTER TABLE `reports_units_settings_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_tipo_unidad` (`id_tipo_unidad`),
  ADD KEY `id_unidad` (`id_unidad`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rubros`
--
ALTER TABLE `rubros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rubros_rel_subrubro`
--
ALTER TABLE `rubros_rel_subrubro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rubro` (`id_rubro`),
  ADD KEY `id_subrubro` (`id_subrubro`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD UNIQUE KEY `setting_name` (`setting_name`);

--
-- Indexes for table `stakeholders_matrix_config`
--
ALTER TABLE `stakeholders_matrix_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `stakeholders_matrix_config_rel_campos`
--
ALTER TABLE `stakeholders_matrix_config_rel_campos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_stakeholder_matrix_config` (`id_stakeholder_matrix_config`),
  ADD KEY `id_campo` (`id_campo`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `subproyectos`
--
ALTER TABLE `subproyectos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `subrubros`
--
ALTER TABLE `subrubros`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_member_job_info`
--
ALTER TABLE `team_member_job_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tecnologias`
--
ALTER TABLE `tecnologias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `thresholds`
--
ALTER TABLE `thresholds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_form` (`id_form`),
  ADD KEY `id_material` (`id_material`),
  ADD KEY `id_module` (`id_module`),
  ADD KEY `id_project` (`id_project`),
  ADD KEY `id_unit` (`id_unit`),
  ADD KEY `id_unit_type` (`id_unit_type`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `tipos_organizaciones`
--
ALTER TABLE `tipos_organizaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_campo`
--
ALTER TABLE `tipo_campo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_formulario`
--
ALTER TABLE `tipo_formulario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_tratamiento`
--
ALTER TABLE `tipo_tratamiento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unidades_funcionales`
--
ALTER TABLE `unidades_funcionales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_proyecto` (`id_proyecto`),
  ADD KEY `id_subproyecto` (`id_subproyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_type` (`user_type`),
  ADD KEY `email` (`email`(255)),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `id_profile` (`id_profile`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `users_api_session`
--
ALTER TABLE `users_api_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `valores_acuerdos`
--
ALTER TABLE `valores_acuerdos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agreement_matrix_config` (`id_agreement_matrix_config`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `valores_compromisos_rca`
--
ALTER TABLE `valores_compromisos_rca`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_compromiso` (`id_compromiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `valores_compromisos_reportables`
--
ALTER TABLE `valores_compromisos_reportables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `valores_compromisos_reportables_ibfk_1` (`created_by`),
  ADD KEY `id_compromiso` (`id_compromiso`);

--
-- Indexes for table `valores_feedback`
--
ALTER TABLE `valores_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_feedback_matrix_config` (`id_feedback_matrix_config`),
  ADD KEY `id_tipo_organizacion` (`id_tipo_organizacion`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `valores_formularios`
--
ALTER TABLE `valores_formularios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formulario_rel_proyecto` (`id_formulario_rel_proyecto`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `valores_formularios_fijos`
--
ALTER TABLE `valores_formularios_fijos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_formulario` (`id_formulario`);

--
-- Indexes for table `valores_permisos`
--
ALTER TABLE `valores_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `valores_stakeholders`
--
ALTER TABLE `valores_stakeholders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_stakeholder_matrix_config` (`id_stakeholder_matrix_config`),
  ADD KEY `id_tipo_organizacion` (`id_tipo_organizacion`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `wiki`
--
ALTER TABLE `wiki`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agreements_matrix_config`
--
ALTER TABLE `agreements_matrix_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `agreements_matrix_config_rel_campos`
--
ALTER TABLE `agreements_matrix_config_rel_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_files`
--
ALTER TABLE `air_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_models`
--
ALTER TABLE `air_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `air_records`
--
ALTER TABLE `air_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_records_types`
--
ALTER TABLE `air_records_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `air_records_values_p`
--
ALTER TABLE `air_records_values_p`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_records_values_p_max`
--
ALTER TABLE `air_records_values_p_max`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_records_values_p_min`
--
ALTER TABLE `air_records_values_p_min`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_records_values_p_porc_conf`
--
ALTER TABLE `air_records_values_p_porc_conf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_records_values_uploads`
--
ALTER TABLE `air_records_values_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_sectors`
--
ALTER TABLE `air_sectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_stations`
--
ALTER TABLE `air_stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_stations_rel_variables`
--
ALTER TABLE `air_stations_rel_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_stations_values_1h`
--
ALTER TABLE `air_stations_values_1h`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_stations_values_1m`
--
ALTER TABLE `air_stations_values_1m`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_stations_values_5m`
--
ALTER TABLE `air_stations_values_5m`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_stations_values_15m`
--
ALTER TABLE `air_stations_values_15m`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_synoptic_data`
--
ALTER TABLE `air_synoptic_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `air_variables`
--
ALTER TABLE `air_variables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `air_variables_types`
--
ALTER TABLE `air_variables_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `asignaciones_combinaciones`
--
ALTER TABLE `asignaciones_combinaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_admin_modules`
--
ALTER TABLE `ayn_admin_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `ayn_admin_submodules`
--
ALTER TABLE `ayn_admin_submodules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `ayn_alert_historical`
--
ALTER TABLE `ayn_alert_historical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_alert_historical_air`
--
ALTER TABLE `ayn_alert_historical_air`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_alert_historical_users`
--
ALTER TABLE `ayn_alert_historical_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_alert_projects`
--
ALTER TABLE `ayn_alert_projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_alert_projects_groups`
--
ALTER TABLE `ayn_alert_projects_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_alert_projects_users`
--
ALTER TABLE `ayn_alert_projects_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_clients_groups`
--
ALTER TABLE `ayn_clients_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_general`
--
ALTER TABLE `ayn_notif_general`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_general_groups`
--
ALTER TABLE `ayn_notif_general_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_general_users`
--
ALTER TABLE `ayn_notif_general_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_historical`
--
ALTER TABLE `ayn_notif_historical`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_historical_users`
--
ALTER TABLE `ayn_notif_historical_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_projects_admin`
--
ALTER TABLE `ayn_notif_projects_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_projects_admin_groups`
--
ALTER TABLE `ayn_notif_projects_admin_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_projects_admin_users`
--
ALTER TABLE `ayn_notif_projects_admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_projects_clients`
--
ALTER TABLE `ayn_notif_projects_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_projects_clients_groups`
--
ALTER TABLE `ayn_notif_projects_clients_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ayn_notif_projects_clients_users`
--
ALTER TABLE `ayn_notif_projects_clients_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `calculos`
--
ALTER TABLE `calculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campos`
--
ALTER TABLE `campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campo_fijo_rel_formulario_rel_proyecto`
--
ALTER TABLE `campo_fijo_rel_formulario_rel_proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campo_rel_formulario`
--
ALTER TABLE `campo_rel_formulario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorias_alias`
--
ALTER TABLE `categorias_alias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_modules`
--
ALTER TABLE `clients_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `clients_modules_rel_profiles`
--
ALTER TABLE `clients_modules_rel_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_submodules`
--
ALTER TABLE `clients_submodules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `client_compromises_settings`
--
ALTER TABLE `client_compromises_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_consumptions_settings`
--
ALTER TABLE `client_consumptions_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_context_modules`
--
ALTER TABLE `client_context_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `client_context_modules_rel_profiles`
--
ALTER TABLE `client_context_modules_rel_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_context_profiles`
--
ALTER TABLE `client_context_profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_context_submodules`
--
ALTER TABLE `client_context_submodules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `client_environmental_footprints_settings`
--
ALTER TABLE `client_environmental_footprints_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_indicators`
--
ALTER TABLE `client_indicators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_module_availability_settings`
--
ALTER TABLE `client_module_availability_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_permitting_settings`
--
ALTER TABLE `client_permitting_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_waste_settings`
--
ALTER TABLE `client_waste_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compromisos_rca`
--
ALTER TABLE `compromisos_rca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compromisos_rca_rel_campos`
--
ALTER TABLE `compromisos_rca_rel_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compromisos_reportables`
--
ALTER TABLE `compromisos_reportables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compromisos_reportables_rel_campos`
--
ALTER TABLE `compromisos_reportables_rel_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacto`
--
ALTER TABLE `contacto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `criterios`
--
ALTER TABLE `criterios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `criticidades`
--
ALTER TABLE `criticidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_client_transformation_factors_config`
--
ALTER TABLE `ec_client_transformation_factors_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ec_tipo_no_aplica`
--
ALTER TABLE `ec_tipo_no_aplica`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ec_tipo_origen`
--
ALTER TABLE `ec_tipo_origen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ec_tipo_origen_materia`
--
ALTER TABLE `ec_tipo_origen_materia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `estados_cumplimiento_compromisos`
--
ALTER TABLE `estados_cumplimiento_compromisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estados_evaluacion_comunidades`
--
ALTER TABLE `estados_evaluacion_comunidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estados_tramitacion_permisos`
--
ALTER TABLE `estados_tramitacion_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluaciones_acuerdos`
--
ALTER TABLE `evaluaciones_acuerdos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluaciones_cumplimiento_compromisos_rca`
--
ALTER TABLE `evaluaciones_cumplimiento_compromisos_rca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluaciones_cumplimiento_compromisos_reportables`
--
ALTER TABLE `evaluaciones_cumplimiento_compromisos_reportables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluaciones_feedback`
--
ALTER TABLE `evaluaciones_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluaciones_tramitacion_permisos`
--
ALTER TABLE `evaluaciones_tramitacion_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluados_permisos`
--
ALTER TABLE `evaluados_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evaluados_rca_compromisos`
--
ALTER TABLE `evaluados_rca_compromisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evidencias_acuerdos`
--
ALTER TABLE `evidencias_acuerdos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evidencias_cumplimiento_compromisos`
--
ALTER TABLE `evidencias_cumplimiento_compromisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evidencias_evaluaciones_feedback`
--
ALTER TABLE `evidencias_evaluaciones_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `evidencias_tramitacion_permisos`
--
ALTER TABLE `evidencias_tramitacion_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `fases`
--
ALTER TABLE `fases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fase_rel_pu`
--
ALTER TABLE `fase_rel_pu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `feedback_matrix_config`
--
ALTER TABLE `feedback_matrix_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `feedback_matrix_config_rel_campos`
--
ALTER TABLE `feedback_matrix_config_rel_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fontawesome`
--
ALTER TABLE `fontawesome`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=787;

--
-- AUTO_INCREMENT for table `formularios`
--
ALTER TABLE `formularios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `formulario_rel_materiales`
--
ALTER TABLE `formulario_rel_materiales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formulario_rel_materiales_rel_categorias`
--
ALTER TABLE `formulario_rel_materiales_rel_categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formulario_rel_proyecto`
--
ALTER TABLE `formulario_rel_proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_files`
--
ALTER TABLE `general_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings_clients`
--
ALTER TABLE `general_settings_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `home_modules_info`
--
ALTER TABLE `home_modules_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `indicators`
--
ALTER TABLE `indicators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `industrias`
--
ALTER TABLE `industrias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `industrias_rel_tecnologias`
--
ALTER TABLE `industrias_rel_tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_estructura_graficos`
--
ALTER TABLE `kpi_estructura_graficos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `kpi_estructura_reporte`
--
ALTER TABLE `kpi_estructura_reporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_plantillas_reporte`
--
ALTER TABLE `kpi_plantillas_reporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_valores`
--
ALTER TABLE `kpi_valores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kpi_valores_condicion`
--
ALTER TABLE `kpi_valores_condicion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `materiales_proyecto`
--
ALTER TABLE `materiales_proyecto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mimasoft`
--
ALTER TABLE `mimasoft`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `mimasoft_systems`
--
ALTER TABLE `mimasoft_systems`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `module_availability_settings`
--
ALTER TABLE `module_availability_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `module_footprint_units`
--
ALTER TABLE `module_footprint_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=196;

--
-- AUTO_INCREMENT for table `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permisos_rel_campos`
--
ALTER TABLE `permisos_rel_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `planificaciones_reportables_compromisos`
--
ALTER TABLE `planificaciones_reportables_compromisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `procesos_unitarios`
--
ALTER TABLE `procesos_unitarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proyecto_rel_actividades`
--
ALTER TABLE `proyecto_rel_actividades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proyecto_rel_fases`
--
ALTER TABLE `proyecto_rel_fases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proyecto_rel_huellas`
--
ALTER TABLE `proyecto_rel_huellas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proyecto_rel_pu`
--
ALTER TABLE `proyecto_rel_pu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports_configuration_settings`
--
ALTER TABLE `reports_configuration_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports_units_settings`
--
ALTER TABLE `reports_units_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports_units_settings_clients`
--
ALTER TABLE `reports_units_settings_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rubros`
--
ALTER TABLE `rubros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rubros_rel_subrubro`
--
ALTER TABLE `rubros_rel_subrubro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `stakeholders_matrix_config`
--
ALTER TABLE `stakeholders_matrix_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stakeholders_matrix_config_rel_campos`
--
ALTER TABLE `stakeholders_matrix_config_rel_campos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subproyectos`
--
ALTER TABLE `subproyectos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subrubros`
--
ALTER TABLE `subrubros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_member_job_info`
--
ALTER TABLE `team_member_job_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tecnologias`
--
ALTER TABLE `tecnologias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `thresholds`
--
ALTER TABLE `thresholds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipos_organizaciones`
--
ALTER TABLE `tipos_organizaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tipo_campo`
--
ALTER TABLE `tipo_campo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tipo_formulario`
--
ALTER TABLE `tipo_formulario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_tratamiento`
--
ALTER TABLE `tipo_tratamiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `unidades_funcionales`
--
ALTER TABLE `unidades_funcionales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_api_session`
--
ALTER TABLE `users_api_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_acuerdos`
--
ALTER TABLE `valores_acuerdos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_compromisos_rca`
--
ALTER TABLE `valores_compromisos_rca`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_compromisos_reportables`
--
ALTER TABLE `valores_compromisos_reportables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_feedback`
--
ALTER TABLE `valores_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_formularios`
--
ALTER TABLE `valores_formularios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_formularios_fijos`
--
ALTER TABLE `valores_formularios_fijos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_permisos`
--
ALTER TABLE `valores_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `valores_stakeholders`
--
ALTER TABLE `valores_stakeholders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wiki`
--
ALTER TABLE `wiki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agreements_matrix_config`
--
ALTER TABLE `agreements_matrix_config`
  ADD CONSTRAINT `agreements_matrix_config_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agreements_matrix_config_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `agreements_matrix_config_rel_campos`
--
ALTER TABLE `agreements_matrix_config_rel_campos`
  ADD CONSTRAINT `agreements_matrix_config_rel_campos_ibfk_1` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agreements_matrix_config_rel_campos_ibfk_2` FOREIGN KEY (`id_agreement_matrix_config`) REFERENCES `agreements_matrix_config` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `agreements_matrix_config_rel_campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_records`
--
ALTER TABLE `air_records`
  ADD CONSTRAINT `air_records_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_records_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_records_ibfk_3` FOREIGN KEY (`id_air_sector`) REFERENCES `air_sectors` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_records_ibfk_4` FOREIGN KEY (`id_air_station`) REFERENCES `air_stations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_records_ibfk_5` FOREIGN KEY (`id_air_model`) REFERENCES `air_models` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_records_ibfk_6` FOREIGN KEY (`id_air_record_type`) REFERENCES `air_records_types` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_records_values_p`
--
ALTER TABLE `air_records_values_p`
  ADD CONSTRAINT `air_records_values_p_ibfk_1` FOREIGN KEY (`id_record`) REFERENCES `air_records` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_records_values_uploads`
--
ALTER TABLE `air_records_values_uploads`
  ADD CONSTRAINT `air_records_values_uploads_ibfk_1` FOREIGN KEY (`id_record`) REFERENCES `air_records` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_sectors`
--
ALTER TABLE `air_sectors`
  ADD CONSTRAINT `air_sectors_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_sectors_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_sectors_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_stations`
--
ALTER TABLE `air_stations`
  ADD CONSTRAINT `air_stations_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_ibfk_6` FOREIGN KEY (`id_air_sector`) REFERENCES `air_sectors` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_stations_rel_variables`
--
ALTER TABLE `air_stations_rel_variables`
  ADD CONSTRAINT `air_stations_rel_variables_ibfk_1` FOREIGN KEY (`id_air_station`) REFERENCES `air_stations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_rel_variables_ibfk_2` FOREIGN KEY (`id_air_variable`) REFERENCES `air_variables` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_stations_values_1h`
--
ALTER TABLE `air_stations_values_1h`
  ADD CONSTRAINT `air_stations_values_1h_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `air_stations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_1h_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_1h_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `air_stations_values_1m`
--
ALTER TABLE `air_stations_values_1m`
  ADD CONSTRAINT `air_stations_values_1m_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `air_stations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_1m_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_1m_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `air_stations_values_5m`
--
ALTER TABLE `air_stations_values_5m`
  ADD CONSTRAINT `air_stations_values_5m_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `air_stations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_5m_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_5m_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `air_stations_values_15m`
--
ALTER TABLE `air_stations_values_15m`
  ADD CONSTRAINT `air_stations_values_15m_ibfk_1` FOREIGN KEY (`id_station`) REFERENCES `air_stations` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_15m_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_stations_values_15m_ibfk_3` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `air_synoptic_data`
--
ALTER TABLE `air_synoptic_data`
  ADD CONSTRAINT `air_synoptic_data_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_synoptic_data_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `air_variables`
--
ALTER TABLE `air_variables`
  ADD CONSTRAINT `air_variables_ibfk_1` FOREIGN KEY (`id_air_variable_type`) REFERENCES `air_variables_types` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `air_variables_ibfk_2` FOREIGN KEY (`id_unit_type`) REFERENCES `centinelamima_fc`.`tipo_unidad` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_criterio`) REFERENCES `criterios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `asignaciones_combinaciones`
--
ALTER TABLE `asignaciones_combinaciones`
  ADD CONSTRAINT `asignaciones_combinaciones_ibfk_1` FOREIGN KEY (`id_asignacion`) REFERENCES `asignaciones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `asignaciones_combinaciones_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_admin_submodules`
--
ALTER TABLE `ayn_admin_submodules`
  ADD CONSTRAINT `ayn_admin_submodules_ibfk_1` FOREIGN KEY (`id_admin_module`) REFERENCES `ayn_admin_modules` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_alert_historical`
--
ALTER TABLE `ayn_alert_historical`
  ADD CONSTRAINT `ayn_alert_historical_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_historical_ibfk_2` FOREIGN KEY (`id_client_module`) REFERENCES `clients_modules` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_historical_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_historical_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_alert_historical_users`
--
ALTER TABLE `ayn_alert_historical_users`
  ADD CONSTRAINT `ayn_alert_historical_users_ibfk_1` FOREIGN KEY (`id_alert_historical`) REFERENCES `ayn_alert_historical` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_historical_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_alert_projects`
--
ALTER TABLE `ayn_alert_projects`
  ADD CONSTRAINT `ayn_alert_projects_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_projects_ibfk_2` FOREIGN KEY (`id_client_module`) REFERENCES `clients_modules` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_projects_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_alert_projects_groups`
--
ALTER TABLE `ayn_alert_projects_groups`
  ADD CONSTRAINT `ayn_alert_projects_groups_ibfk_1` FOREIGN KEY (`id_alert_project`) REFERENCES `ayn_alert_projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_projects_groups_ibfk_2` FOREIGN KEY (`id_client_group`) REFERENCES `ayn_clients_groups` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_alert_projects_users`
--
ALTER TABLE `ayn_alert_projects_users`
  ADD CONSTRAINT `ayn_alert_projects_users_ibfk_1` FOREIGN KEY (`id_alert_project`) REFERENCES `ayn_alert_projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_alert_projects_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_clients_groups`
--
ALTER TABLE `ayn_clients_groups`
  ADD CONSTRAINT `ayn_clients_groups_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_general`
--
ALTER TABLE `ayn_notif_general`
  ADD CONSTRAINT `ayn_notif_general_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_general_ibfk_2` FOREIGN KEY (`id_client_context_module`) REFERENCES `client_context_modules` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_general_groups`
--
ALTER TABLE `ayn_notif_general_groups`
  ADD CONSTRAINT `ayn_notif_general_groups_ibfk_1` FOREIGN KEY (`id_notif_general`) REFERENCES `ayn_notif_general` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_general_groups_ibfk_2` FOREIGN KEY (`id_client_group`) REFERENCES `ayn_clients_groups` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_general_users`
--
ALTER TABLE `ayn_notif_general_users`
  ADD CONSTRAINT `ayn_notif_general_users_ibfk_1` FOREIGN KEY (`id_notif_general`) REFERENCES `ayn_notif_general` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_general_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_historical`
--
ALTER TABLE `ayn_notif_historical`
  ADD CONSTRAINT `ayn_notif_historical_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_historical_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_historical_users`
--
ALTER TABLE `ayn_notif_historical_users`
  ADD CONSTRAINT `ayn_notif_historical_users_ibfk_1` FOREIGN KEY (`id_notif_historical`) REFERENCES `ayn_notif_historical` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_historical_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_projects_admin`
--
ALTER TABLE `ayn_notif_projects_admin`
  ADD CONSTRAINT `ayn_notif_projects_admin_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_admin_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_admin_ibfk_3` FOREIGN KEY (`id_admin_module`) REFERENCES `ayn_admin_modules` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_admin_ibfk_4` FOREIGN KEY (`id_admin_submodule`) REFERENCES `ayn_admin_submodules` (`id`);

--
-- Constraints for table `ayn_notif_projects_admin_groups`
--
ALTER TABLE `ayn_notif_projects_admin_groups`
  ADD CONSTRAINT `ayn_notif_projects_admin_groups_ibfk_1` FOREIGN KEY (`id_notif_projects_admin`) REFERENCES `ayn_notif_projects_admin` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_admin_groups_ibfk_2` FOREIGN KEY (`id_client_group`) REFERENCES `ayn_clients_groups` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_projects_admin_users`
--
ALTER TABLE `ayn_notif_projects_admin_users`
  ADD CONSTRAINT `ayn_notif_projects_admin_users_ibfk_1` FOREIGN KEY (`id_notif_projects_admin`) REFERENCES `ayn_notif_projects_admin` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_admin_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_projects_clients`
--
ALTER TABLE `ayn_notif_projects_clients`
  ADD CONSTRAINT `ayn_notif_projects_clients_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_clients_ibfk_2` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_clients_ibfk_3` FOREIGN KEY (`id_client_module`) REFERENCES `clients_modules` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_projects_clients_groups`
--
ALTER TABLE `ayn_notif_projects_clients_groups`
  ADD CONSTRAINT `ayn_notif_projects_clients_groups_ibfk_1` FOREIGN KEY (`id_notif_projects_clients`) REFERENCES `ayn_notif_projects_clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_clients_groups_ibfk_2` FOREIGN KEY (`id_client_group`) REFERENCES `ayn_clients_groups` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ayn_notif_projects_clients_users`
--
ALTER TABLE `ayn_notif_projects_clients_users`
  ADD CONSTRAINT `ayn_notif_projects_clients_users_ibfk_1` FOREIGN KEY (`id_notif_projects_clients`) REFERENCES `ayn_notif_projects_clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ayn_notif_projects_clients_users_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `calculos`
--
ALTER TABLE `calculos`
  ADD CONSTRAINT `calculos_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calculos_ibfk_3` FOREIGN KEY (`id_subcategoria`) REFERENCES `centinelamima_fc`.`subcategorias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calculos_ibfk_4` FOREIGN KEY (`id_bd`) REFERENCES `centinelamima_fc`.`bases_de_datos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calculos_ibfk_5` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calculos_ibfk_6` FOREIGN KEY (`id_criterio`) REFERENCES `criterios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calculos_ibfk_7` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `calculos_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `campos`
--
ALTER TABLE `campos`
  ADD CONSTRAINT `campos_ibfk_1` FOREIGN KEY (`id_tipo_campo`) REFERENCES `tipo_campo` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `campos_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `campos_ibfk_4` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `campos_fijos`
--
ALTER TABLE `campos_fijos`
  ADD CONSTRAINT `campos_fijos_ibfk_1` FOREIGN KEY (`id_tipo_campo`) REFERENCES `tipo_campo` (`id`);

--
-- Constraints for table `campo_fijo_rel_formulario_rel_proyecto`
--
ALTER TABLE `campo_fijo_rel_formulario_rel_proyecto`
  ADD CONSTRAINT `campo_fijo_rel_formulario_rel_proyecto_ibfk_1` FOREIGN KEY (`id_campo_fijo`) REFERENCES `campos_fijos` (`id`),
  ADD CONSTRAINT `campo_fijo_rel_formulario_rel_proyecto_ibfk_2` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`),
  ADD CONSTRAINT `campo_fijo_rel_formulario_rel_proyecto_ibfk_3` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`);

--
-- Constraints for table `campo_rel_formulario`
--
ALTER TABLE `campo_rel_formulario`
  ADD CONSTRAINT `campo_rel_formulario_ibfk_1` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `campo_rel_formulario_ibfk_2` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `campo_rel_formulario_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `categorias_alias`
--
ALTER TABLE `categorias_alias`
  ADD CONSTRAINT `categorias_alias_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `categorias_alias_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `categorias_alias_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `clients_modules`
--
ALTER TABLE `clients_modules`
  ADD CONSTRAINT `clients_modules_ibfk_1` FOREIGN KEY (`id_mimasoft_system`) REFERENCES `mimasoft_systems` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `clients_modules_rel_profiles`
--
ALTER TABLE `clients_modules_rel_profiles`
  ADD CONSTRAINT `clients_modules_rel_profiles_ibfk_1` FOREIGN KEY (`id_profile`) REFERENCES `profiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `clients_modules_rel_profiles_ibfk_2` FOREIGN KEY (`id_client_module`) REFERENCES `clients_modules` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `clients_submodules`
--
ALTER TABLE `clients_submodules`
  ADD CONSTRAINT `clients_submodules_ibfk_1` FOREIGN KEY (`id_client_module`) REFERENCES `clients_modules` (`id`);

--
-- Constraints for table `client_compromises_settings`
--
ALTER TABLE `client_compromises_settings`
  ADD CONSTRAINT `client_compromises_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_compromises_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`);

--
-- Constraints for table `client_consumptions_settings`
--
ALTER TABLE `client_consumptions_settings`
  ADD CONSTRAINT `client_consumptions_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_consumptions_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_consumptions_settings_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_context_modules_rel_profiles`
--
ALTER TABLE `client_context_modules_rel_profiles`
  ADD CONSTRAINT `client_context_modules_rel_profiles_ibfk_1` FOREIGN KEY (`id_client_context_profile`) REFERENCES `client_context_profiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_context_modules_rel_profiles_ibfk_2` FOREIGN KEY (`id_client_context_module`) REFERENCES `client_context_modules` (`id`);

--
-- Constraints for table `client_context_submodules`
--
ALTER TABLE `client_context_submodules`
  ADD CONSTRAINT `client_context_submodules_ibfk_1` FOREIGN KEY (`id_client_context_module`) REFERENCES `client_context_modules` (`id`);

--
-- Constraints for table `client_environmental_footprints_settings`
--
ALTER TABLE `client_environmental_footprints_settings`
  ADD CONSTRAINT `client_environmental_footprints_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_environmental_footprints_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_indicators`
--
ALTER TABLE `client_indicators`
  ADD CONSTRAINT `client_indicators_ibfk_1` FOREIGN KEY (`id_indicador`) REFERENCES `indicators` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_indicators_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `client_module_availability_settings`
--
ALTER TABLE `client_module_availability_settings`
  ADD CONSTRAINT `client_module_availability_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_module_availability_settings_ibfk_2` FOREIGN KEY (`id_modulo`) REFERENCES `client_context_modules` (`id`);

--
-- Constraints for table `client_permitting_settings`
--
ALTER TABLE `client_permitting_settings`
  ADD CONSTRAINT `client_permitting_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_permitting_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`);

--
-- Constraints for table `client_waste_settings`
--
ALTER TABLE `client_waste_settings`
  ADD CONSTRAINT `client_waste_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_waste_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `client_waste_settings_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `compromisos_rca`
--
ALTER TABLE `compromisos_rca`
  ADD CONSTRAINT `compromisos_rca_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compromisos_rca_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `compromisos_rca_rel_campos`
--
ALTER TABLE `compromisos_rca_rel_campos`
  ADD CONSTRAINT `compromisos_rca_rel_campos_ibfk_1` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compromisos_rca_rel_campos_ibfk_2` FOREIGN KEY (`id_compromiso`) REFERENCES `compromisos_rca` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compromisos_rca_rel_campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `compromisos_reportables`
--
ALTER TABLE `compromisos_reportables`
  ADD CONSTRAINT `compromisos_reportables_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compromisos_reportables_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `compromisos_reportables_rel_campos`
--
ALTER TABLE `compromisos_reportables_rel_campos`
  ADD CONSTRAINT `compromisos_reportables_rel_campos_ibfk_1` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compromisos_reportables_rel_campos_ibfk_2` FOREIGN KEY (`id_compromiso`) REFERENCES `compromisos_reportables` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compromisos_reportables_rel_campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `contacto`
--
ALTER TABLE `contacto`
  ADD CONSTRAINT `contacto_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `criterios`
--
ALTER TABLE `criterios`
  ADD CONSTRAINT `criterios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_3` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_4` FOREIGN KEY (`id_material`) REFERENCES `centinelamima_fc`.`materiales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_5` FOREIGN KEY (`id_campo_sp`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_6` FOREIGN KEY (`id_campo_pu`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_7` FOREIGN KEY (`id_campo_fc`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `criterios_ibfk_8` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ec_client_transformation_factors_config`
--
ALTER TABLE `ec_client_transformation_factors_config`
  ADD CONSTRAINT `ec_client_transformation_factors_config_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ec_client_transformation_factors_config_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ec_client_transformation_factors_config_ibfk_3` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `centinelamima_fc`.`tipo_unidad` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `ec_tipo_origen_materia`
--
ALTER TABLE `ec_tipo_origen_materia`
  ADD CONSTRAINT `ec_tipo_origen_materia_ibfk_1` FOREIGN KEY (`id_tipo_origen`) REFERENCES `ec_tipo_origen` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `estados_cumplimiento_compromisos`
--
ALTER TABLE `estados_cumplimiento_compromisos`
  ADD CONSTRAINT `estados_cumplimiento_compromisos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estados_cumplimiento_compromisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `estados_evaluacion_comunidades`
--
ALTER TABLE `estados_evaluacion_comunidades`
  ADD CONSTRAINT `estados_evaluacion_comunidades_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estados_evaluacion_comunidades_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `estados_tramitacion_permisos`
--
ALTER TABLE `estados_tramitacion_permisos`
  ADD CONSTRAINT `estados_tramitacion_permisos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estados_tramitacion_permisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluaciones_acuerdos`
--
ALTER TABLE `evaluaciones_acuerdos`
  ADD CONSTRAINT `evaluaciones_acuerdos_ibfk_1` FOREIGN KEY (`id_valor_acuerdo`) REFERENCES `valores_acuerdos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_acuerdos_ibfk_2` FOREIGN KEY (`id_stakeholder`) REFERENCES `valores_stakeholders` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_acuerdos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluaciones_cumplimiento_compromisos_rca`
--
ALTER TABLE `evaluaciones_cumplimiento_compromisos_rca`
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_rca_ibfk_1` FOREIGN KEY (`id_valor_compromiso`) REFERENCES `valores_compromisos_rca` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_rca_ibfk_2` FOREIGN KEY (`id_evaluado`) REFERENCES `evaluados_rca_compromisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_rca_ibfk_3` FOREIGN KEY (`id_estados_cumplimiento_compromiso`) REFERENCES `estados_cumplimiento_compromisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_rca_ibfk_4` FOREIGN KEY (`id_criticidad`) REFERENCES `criticidades` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_rca_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluaciones_cumplimiento_compromisos_reportables`
--
ALTER TABLE `evaluaciones_cumplimiento_compromisos_reportables`
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_reportables_ibfk_1` FOREIGN KEY (`id_criticidad`) REFERENCES `criticidades` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_reportables_ibfk_2` FOREIGN KEY (`id_estados_cumplimiento_compromiso`) REFERENCES `estados_cumplimiento_compromisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_reportables_ibfk_3` FOREIGN KEY (`id_planificacion`) REFERENCES `planificaciones_reportables_compromisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_reportables_ibfk_4` FOREIGN KEY (`id_valor_compromiso`) REFERENCES `valores_compromisos_reportables` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_cumplimiento_compromisos_reportables_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluaciones_feedback`
--
ALTER TABLE `evaluaciones_feedback`
  ADD CONSTRAINT `evaluaciones_feedback_ibfk_1` FOREIGN KEY (`id_valor_feedback`) REFERENCES `valores_feedback` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_feedback_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluaciones_tramitacion_permisos`
--
ALTER TABLE `evaluaciones_tramitacion_permisos`
  ADD CONSTRAINT `evaluaciones_tramitacion_permisos_ibfk_1` FOREIGN KEY (`id_estados_tramitacion_permisos`) REFERENCES `estados_tramitacion_permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_tramitacion_permisos_ibfk_2` FOREIGN KEY (`id_evaluado`) REFERENCES `evaluados_permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_tramitacion_permisos_ibfk_3` FOREIGN KEY (`id_valor_permiso`) REFERENCES `valores_permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluaciones_tramitacion_permisos_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluados_permisos`
--
ALTER TABLE `evaluados_permisos`
  ADD CONSTRAINT `evaluados_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluados_permisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evaluados_rca_compromisos`
--
ALTER TABLE `evaluados_rca_compromisos`
  ADD CONSTRAINT `evaluados_rca_compromisos_ibfk_1` FOREIGN KEY (`id_compromiso`) REFERENCES `compromisos_rca` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evaluados_rca_compromisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evidencias_acuerdos`
--
ALTER TABLE `evidencias_acuerdos`
  ADD CONSTRAINT `evidencias_acuerdos_ibfk_1` FOREIGN KEY (`id_evaluacion_acuerdo`) REFERENCES `evaluaciones_acuerdos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evidencias_acuerdos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evidencias_cumplimiento_compromisos`
--
ALTER TABLE `evidencias_cumplimiento_compromisos`
  ADD CONSTRAINT `evidencias_cumplimiento_compromisos_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evidencias_evaluaciones_feedback`
--
ALTER TABLE `evidencias_evaluaciones_feedback`
  ADD CONSTRAINT `evidencias_evaluaciones_feedback_ibfk_1` FOREIGN KEY (`id_evaluacion_feedback`) REFERENCES `evaluaciones_feedback` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evidencias_evaluaciones_feedback_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `evidencias_tramitacion_permisos`
--
ALTER TABLE `evidencias_tramitacion_permisos`
  ADD CONSTRAINT `evidencias_tramitacion_permisos_ibfk_1` FOREIGN KEY (`id_evaluacion_tramitacion_permisos`) REFERENCES `evaluaciones_tramitacion_permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `evidencias_tramitacion_permisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `faq`
--
ALTER TABLE `faq`
  ADD CONSTRAINT `faq_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `fase_rel_pu`
--
ALTER TABLE `fase_rel_pu`
  ADD CONSTRAINT `fase_rel_pu_ibfk_1` FOREIGN KEY (`id_fase`) REFERENCES `fases` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fase_rel_pu_ibfk_2` FOREIGN KEY (`id_proceso_unitario`) REFERENCES `procesos_unitarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fase_rel_pu_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `feedback_matrix_config`
--
ALTER TABLE `feedback_matrix_config`
  ADD CONSTRAINT `feedback_matrix_config_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_matrix_config_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `feedback_matrix_config_rel_campos`
--
ALTER TABLE `feedback_matrix_config_rel_campos`
  ADD CONSTRAINT `feedback_matrix_config_rel_campos_ibfk_1` FOREIGN KEY (`id_feedback_matrix_config`) REFERENCES `feedback_matrix_config` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_matrix_config_rel_campos_ibfk_2` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `feedback_matrix_config_rel_campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `formularios`
--
ALTER TABLE `formularios`
  ADD CONSTRAINT `formularios_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formularios_ibfk_2` FOREIGN KEY (`id_tipo_formulario`) REFERENCES `tipo_formulario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formularios_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `formulario_rel_materiales`
--
ALTER TABLE `formulario_rel_materiales`
  ADD CONSTRAINT `formulario_rel_materiales_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formulario_rel_materiales_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `centinelamima_fc`.`materiales` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `formulario_rel_materiales_rel_categorias`
--
ALTER TABLE `formulario_rel_materiales_rel_categorias`
  ADD CONSTRAINT `formulario_rel_materiales_rel_categorias_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formulario_rel_materiales_rel_categorias_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `centinelamima_fc`.`materiales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formulario_rel_materiales_rel_categorias_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `formulario_rel_proyecto`
--
ALTER TABLE `formulario_rel_proyecto`
  ADD CONSTRAINT `formulario_rel_proyecto_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formulario_rel_proyecto_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `formulario_rel_proyecto_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD CONSTRAINT `general_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `general_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `general_settings_clients`
--
ALTER TABLE `general_settings_clients`
  ADD CONSTRAINT `general_settings_clients_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `indicators`
--
ALTER TABLE `indicators`
  ADD CONSTRAINT `indicators_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `indicators_ibfk_2` FOREIGN KEY (`id_fontawesome`) REFERENCES `fontawesome` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `indicators_ibfk_3` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `indicators_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `industrias`
--
ALTER TABLE `industrias`
  ADD CONSTRAINT `industrias_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `industrias_rel_tecnologias`
--
ALTER TABLE `industrias_rel_tecnologias`
  ADD CONSTRAINT `industrias_rel_tecnologias_ibfk_1` FOREIGN KEY (`id_industria`) REFERENCES `industrias` (`id`),
  ADD CONSTRAINT `industrias_rel_tecnologias_ibfk_2` FOREIGN KEY (`id_tecnologia`) REFERENCES `tecnologias` (`id`);

--
-- Constraints for table `materiales_proyecto`
--
ALTER TABLE `materiales_proyecto`
  ADD CONSTRAINT `materiales_proyecto_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `materiales_proyecto_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `centinelamima_fc`.`materiales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `materiales_proyecto_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `module_availability_settings`
--
ALTER TABLE `module_availability_settings`
  ADD CONSTRAINT `module_availability_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `module_availability_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `module_availability_settings_ibfk_3` FOREIGN KEY (`id_modulo_cliente`) REFERENCES `clients_modules` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `module_footprint_units`
--
ALTER TABLE `module_footprint_units`
  ADD CONSTRAINT `module_footprint_units_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `module_footprint_units_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `module_footprint_units_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `centinelamima_fc`.`unidad` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `module_footprint_units_ibfk_4` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `centinelamima_fc`.`tipo_unidad` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `permisos_rel_campos`
--
ALTER TABLE `permisos_rel_campos`
  ADD CONSTRAINT `permisos_rel_campos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_rel_campos_ibfk_2` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`),
  ADD CONSTRAINT `permisos_rel_campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `planificaciones_reportables_compromisos`
--
ALTER TABLE `planificaciones_reportables_compromisos`
  ADD CONSTRAINT `planificaciones_reportables_compromisos_ibfk_1` FOREIGN KEY (`id_compromiso`) REFERENCES `valores_compromisos_reportables` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `planificaciones_reportables_compromisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `procesos_unitarios`
--
ALTER TABLE `procesos_unitarios`
  ADD CONSTRAINT `procesos_unitarios_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`id_industria`) REFERENCES `rubros` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_2` FOREIGN KEY (`id_metodologia`) REFERENCES `centinelamima_fc`.`metodologia` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_3` FOREIGN KEY (`id_tecnologia`) REFERENCES `subrubros` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_4` FOREIGN KEY (`id_formato_huella`) REFERENCES `centinelamima_fc`.`formatos_huella` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_6` FOREIGN KEY (`id_tech`) REFERENCES `tecnologias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `projects_ibfk_7` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `project_members`
--
ALTER TABLE `project_members`
  ADD CONSTRAINT `project_members_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `project_members_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `proyecto_rel_fases`
--
ALTER TABLE `proyecto_rel_fases`
  ADD CONSTRAINT `proyecto_rel_fases_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_rel_fases_ibfk_2` FOREIGN KEY (`id_fase`) REFERENCES `fases` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_rel_fases_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `proyecto_rel_huellas`
--
ALTER TABLE `proyecto_rel_huellas`
  ADD CONSTRAINT `proyecto_rel_huellas_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_rel_huellas_ibfk_2` FOREIGN KEY (`id_huella`) REFERENCES `centinelamima_fc`.`huellas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_rel_huellas_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `proyecto_rel_pu`
--
ALTER TABLE `proyecto_rel_pu`
  ADD CONSTRAINT `proyecto_rel_pu_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_rel_pu_ibfk_2` FOREIGN KEY (`id_proceso_unitario`) REFERENCES `procesos_unitarios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `proyecto_rel_pu_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reports_configuration_settings`
--
ALTER TABLE `reports_configuration_settings`
  ADD CONSTRAINT `reports_configuration_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_configuration_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reports_units_settings`
--
ALTER TABLE `reports_units_settings`
  ADD CONSTRAINT `reports_units_settings_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_units_settings_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_units_settings_ibfk_3` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `centinelamima_fc`.`tipo_unidad` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_units_settings_ibfk_4` FOREIGN KEY (`id_unidad`) REFERENCES `centinelamima_fc`.`unidad` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reports_units_settings_clients`
--
ALTER TABLE `reports_units_settings_clients`
  ADD CONSTRAINT `reports_units_settings_clients_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_units_settings_clients_ibfk_2` FOREIGN KEY (`id_tipo_unidad`) REFERENCES `centinelamima_fc`.`tipo_unidad` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_units_settings_clients_ibfk_3` FOREIGN KEY (`id_unidad`) REFERENCES `centinelamima_fc`.`unidad` (`id`);

--
-- Constraints for table `rubros_rel_subrubro`
--
ALTER TABLE `rubros_rel_subrubro`
  ADD CONSTRAINT `rubros_rel_subrubro_ibfk_1` FOREIGN KEY (`id_rubro`) REFERENCES `rubros` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rubros_rel_subrubro_ibfk_2` FOREIGN KEY (`id_subrubro`) REFERENCES `subrubros` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stakeholders_matrix_config`
--
ALTER TABLE `stakeholders_matrix_config`
  ADD CONSTRAINT `stakeholders_matrix_config_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stakeholders_matrix_config_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `stakeholders_matrix_config_rel_campos`
--
ALTER TABLE `stakeholders_matrix_config_rel_campos`
  ADD CONSTRAINT `stakeholders_matrix_config_rel_campos_ibfk_1` FOREIGN KEY (`id_stakeholder_matrix_config`) REFERENCES `stakeholders_matrix_config` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stakeholders_matrix_config_rel_campos_ibfk_2` FOREIGN KEY (`id_campo`) REFERENCES `campos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `stakeholders_matrix_config_rel_campos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `subproyectos`
--
ALTER TABLE `subproyectos`
  ADD CONSTRAINT `subproyectos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `subproyectos_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `subproyectos_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `thresholds`
--
ALTER TABLE `thresholds`
  ADD CONSTRAINT `thresholds_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `centinelamima_fc`.`categorias` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_3` FOREIGN KEY (`id_form`) REFERENCES `formularios` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_4` FOREIGN KEY (`id_material`) REFERENCES `centinelamima_fc`.`materiales` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_5` FOREIGN KEY (`id_module`) REFERENCES `clients_modules` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_6` FOREIGN KEY (`id_project`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_7` FOREIGN KEY (`id_unit`) REFERENCES `centinelamima_fc`.`unidad` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_8` FOREIGN KEY (`id_unit_type`) REFERENCES `centinelamima_fc`.`tipo_unidad` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `thresholds_ibfk_9` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `unidades_funcionales`
--
ALTER TABLE `unidades_funcionales`
  ADD CONSTRAINT `unidades_funcionales_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `unidades_funcionales_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `projects` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `unidades_funcionales_ibfk_3` FOREIGN KEY (`id_subproyecto`) REFERENCES `subproyectos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `unidades_funcionales_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_profile`) REFERENCES `profiles` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `users_api_session`
--
ALTER TABLE `users_api_session`
  ADD CONSTRAINT `users_api_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_acuerdos`
--
ALTER TABLE `valores_acuerdos`
  ADD CONSTRAINT `valores_acuerdos_ibfk_1` FOREIGN KEY (`id_agreement_matrix_config`) REFERENCES `agreements_matrix_config` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_acuerdos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_compromisos_rca`
--
ALTER TABLE `valores_compromisos_rca`
  ADD CONSTRAINT `valores_compromisos_rca_ibfk_1` FOREIGN KEY (`id_compromiso`) REFERENCES `compromisos_rca` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_compromisos_rca_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_compromisos_reportables`
--
ALTER TABLE `valores_compromisos_reportables`
  ADD CONSTRAINT `valores_compromisos_reportables_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_compromisos_reportables_ibfk_2` FOREIGN KEY (`id_compromiso`) REFERENCES `compromisos_reportables` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_feedback`
--
ALTER TABLE `valores_feedback`
  ADD CONSTRAINT `valores_feedback_ibfk_1` FOREIGN KEY (`id_feedback_matrix_config`) REFERENCES `feedback_matrix_config` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_feedback_ibfk_2` FOREIGN KEY (`id_tipo_organizacion`) REFERENCES `tipos_organizaciones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_feedback_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_formularios`
--
ALTER TABLE `valores_formularios`
  ADD CONSTRAINT `valores_formularios_ibfk_1` FOREIGN KEY (`id_formulario_rel_proyecto`) REFERENCES `formulario_rel_proyecto` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_formularios_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_formularios_fijos`
--
ALTER TABLE `valores_formularios_fijos`
  ADD CONSTRAINT `valores_formularios_fijos_ibfk_1` FOREIGN KEY (`id_formulario`) REFERENCES `formularios` (`id`);

--
-- Constraints for table `valores_permisos`
--
ALTER TABLE `valores_permisos`
  ADD CONSTRAINT `valores_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_permisos_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `valores_stakeholders`
--
ALTER TABLE `valores_stakeholders`
  ADD CONSTRAINT `valores_stakeholders_ibfk_1` FOREIGN KEY (`id_stakeholder_matrix_config`) REFERENCES `stakeholders_matrix_config` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_stakeholders_ibfk_2` FOREIGN KEY (`id_tipo_organizacion`) REFERENCES `tipos_organizaciones` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `valores_stakeholders_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
