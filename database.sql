-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2016 at 10:24 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demoadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int(10) UNSIGNED NOT NULL,
  `movie_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imdb_rating` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `movie_name`, `imdb_rating`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Independence Day', '9', '2016-09-30 07:46:43', '2016-09-30 07:46:43', NULL),
(2, 'Pulp Fiction', '9.5', '2016-09-30 07:46:54', '2016-09-30 07:46:54', NULL),
(3, 'Mission Impossible', '8', '2016-09-30 07:47:09', '2016-09-30 07:47:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL,
  `menu_type` int(11) NOT NULL DEFAULT '1',
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `position`, `menu_type`, `icon`, `name`, `title`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, NULL, 'User', 'User', NULL, NULL, NULL),
(2, NULL, 0, NULL, 'Role', 'Role', NULL, NULL, NULL),
(10, 0, 1, 'fa-database', 'Films', 'Films', NULL, '2016-09-30 07:46:25', '2016-09-30 07:46:25');

-- --------------------------------------------------------

--
-- Table structure for table `menu_role`
--

CREATE TABLE `menu_role` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu_role`
--

INSERT INTO `menu_role` (`menu_id`, `role_id`) VALUES
(10, 1),
(10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2015_10_10_000000_create_menus_table', 1),
('2015_10_10_000000_create_roles_table', 1),
('2015_10_10_000000_update_users_table', 1),
('2015_12_11_000000_create_users_logs_table', 1),
('2016_03_14_000000_update_menus_table', 1),
('2016_09_30_101843_create_watchedfilms_table', 2),
('2016_09_30_102300_create_moives_table', 3),
('2016_09_30_132612_create_movies_table', 4),
('2016_09_30_134625_create_films_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2016-09-30 00:22:51', '2016-09-30 00:22:51'),
(2, 'Person', '2016-09-30 00:22:51', '2016-09-30 00:22:51'),
(7, 'Administrator', '2016-09-30 03:42:55', '2016-09-30 03:42:55'),
(8, 'User', '2016-09-30 03:42:55', '2016-09-30 03:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verification_code` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `first_name`, `last_name`, `email`, `password`, `remember_token`, `verified`, `verification_code`, `created_at`, `updated_at`) VALUES
(20, 1, 'Shamim Ahmed', '', 'shamim7777@gmail.com', '$2y$10$OTrayAKH5cQc6GuOwNuCMeqM1czqSII9QVPZSihFzlkL2i.vlcPqW', 'Cma4S5sjkkMxVrDMC2C8u5SrucGlVvH5WP2T1Kz3WjpjIQHxWerYOpRoSW3U', 0, NULL, '2016-09-30 02:47:21', '2016-09-30 09:35:32'),
(21, 2, 'Shamim Ahmed 2', '', 'sytrekinc@gmail.com', '$2y$10$gkxoXpmxicJGpGVEn/G4SODTnqEsTYjP9s3zCgsx.O.TB9CPW0gzC', NULL, 0, NULL, '2016-09-30 02:48:05', '2016-10-01 01:12:13'),
(47, 1, 'asdasd', 'asd', 'shasmssimassa.sytrek@gmail.com', '$2y$10$ZiVHCW8PHTjsjRnFJoMCxOgyM6oSd9Gwscm4Q2dnXx.eQLJyNAJ7i', NULL, 0, NULL, '2016-09-30 11:19:48', '2016-09-30 11:19:48'),
(48, 1, 'asdasd', 'sadas', 'shasssmimassa.sytrek@gmail.com', '$2y$10$b0U50bCHWAIQ5QKmwXVUlePmo7Y7WiDSFRBecf1htTodojvXBtvBS', NULL, 0, NULL, '2016-09-30 11:38:37', '2016-09-30 11:38:37'),
(57, 2, 's', 's', 's@sss.com', '$2y$10$pP/N2OXb0vo8Lxx8GZLO3.hESoTlq73TCIeXeluWMMiP6Op/vCGTi', NULL, 0, NULL, '2016-09-30 11:48:30', '2016-09-30 11:48:30'),
(61, 1, 'sad', 'ass', 'shasmssssssimassa.sytrek@gmail.com', '$2y$10$cnARTb54eFbTc1t75EYWlO95pwOldvBOoE579C3oKQkXRmOH2yZ6q', NULL, 0, NULL, '2016-09-30 11:55:29', '2016-09-30 11:55:29'),
(64, 2, 'saas', 'saas', 'dsadasmimassa.sytrek@gmail.com', '$2y$10$jK6B9OfRbNypiT4GMCDkQOON9QB2N0Rw2cN7/Wy.gXgMrY5.VEWUy', NULL, 0, NULL, '2016-09-30 11:57:53', '2016-09-30 11:57:53'),
(65, 2, 'Shamim', 'Ahmed', 'ssss@gmail.com', '$2y$10$xvciFl7vcUJw8UdyBgsEzu9G0pSg3GhYe.g1fOjwGAYhmx1cAwAyC', NULL, 0, NULL, '2016-09-30 12:06:46', '2016-09-30 12:06:46'),
(66, 1, 'xzc', 'xzc', 'xxxx@wss.com', '$2y$10$6N5q.gnpt/7hrH/t0KzkRek8k1lB/y6OZSLI9RCEEhvhsVhb7Go72', NULL, 0, NULL, '2016-09-30 12:09:25', '2016-09-30 12:09:25'),
(67, 1, 'wewe', 'weew', 'eddd@ff.com', '$2y$10$Wk5LriesxUv.eyOBerffheuT/3MZatW1yFUEr7GxXuKQYXpdFB8aq', NULL, 0, NULL, '2016-09-30 12:09:58', '2016-09-30 12:09:58'),
(68, 2, 'wwwww', 'sss', 'shasmimasassa.sytrek@gmail.com', '$2y$10$OU.GsYdePWzAUllKhIwUmuuexWxYuh9pnF4lB/U/48HeD1WUVSXn6', NULL, 0, NULL, '2016-09-30 12:11:19', '2016-09-30 13:08:28'),
(69, 2, 'Test', '333', 'shamdim7777@gmail.com', '$2y$10$UJ6cZnv5VhjbFJaqnOvJ2eimzJKbDmpsJsqtnbGCCAIRN9mcOLhhO', NULL, 0, NULL, '2016-09-30 13:09:42', '2016-10-01 01:14:50'),
(71, 1, 'shamim', 'ahmed', 'saa@fa.com', '$2y$10$hV0MFgK4BR/pQ3KzcEmcuuhBL69H2eydUZxrrtz7.Dphrcyf8lDHC', NULL, 0, NULL, '2016-10-01 01:37:07', '2016-10-01 01:37:07'),
(72, 1, 'Shamim', 'ahmed', 'swwdhamim7777@gmail.com', '$2y$10$.v1EQuuoNfQ9h8uFyJRqjuTpGsMfsauNAAmjl49KcNsGWN9OuhBFm', NULL, 0, NULL, '2016-10-01 01:43:35', '2016-10-01 01:43:35'),
(73, 1, 'shamim', 'saa', 'shamim7ss777@gmail.com', '$2y$10$oRWO3.28kOrrq1DkkqerSOJLg70UcG82BG7.3HPXneA/CevwuJBya', NULL, 0, NULL, '2016-10-01 01:46:50', '2016-10-01 01:46:50'),
(74, 1, 'Shamim', 'Ahmed', 's3hamim7777@gmail.com', '$2y$10$/s68EWka9TQyxkqdWYDqtOKrfay4jRbVXRQNOnBRE4w9zqq3Bmdx.', NULL, 0, NULL, '2016-10-01 01:49:30', '2016-10-01 01:49:30'),
(75, 1, 'sasas', 'asas', 'shamissam7777@gmail.com', '$2y$10$IJQw4Wa2L3a7MGtSbbaWwOUFmMtMbcW0942y314TYJhSDU2wl1kwO', NULL, 0, NULL, '2016-10-01 01:50:09', '2016-10-01 01:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `users_logs`
--

CREATE TABLE `users_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users_logs`
--

INSERT INTO `users_logs` (`id`, `user_id`, `action`, `action_model`, `action_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'updated', 'users', 2, '2016-09-30 00:31:11', '2016-09-30 00:31:11'),
(2, 2, 'created', 'users', 3, '2016-09-30 00:50:03', '2016-09-30 00:50:03'),
(3, 2, 'updated', 'users', 3, '2016-09-30 01:12:23', '2016-09-30 01:12:23'),
(4, 2, 'created', 'users', 4, '2016-09-30 01:46:06', '2016-09-30 01:46:06'),
(5, 2, 'created', 'users', 5, '2016-09-30 01:55:24', '2016-09-30 01:55:24'),
(6, 2, 'created', 'users', 6, '2016-09-30 01:57:08', '2016-09-30 01:57:08'),
(7, 2, 'created', 'users', 7, '2016-09-30 02:01:29', '2016-09-30 02:01:29'),
(8, 2, 'created', 'users', 8, '2016-09-30 02:04:38', '2016-09-30 02:04:38'),
(9, 2, 'created', 'users', 9, '2016-09-30 02:05:44', '2016-09-30 02:05:44'),
(10, 2, 'created', 'users', 10, '2016-09-30 02:05:57', '2016-09-30 02:05:57'),
(11, 2, 'updated', 'users', 3, '2016-09-30 02:07:00', '2016-09-30 02:07:00'),
(12, 2, 'created', 'users', 13, '2016-09-30 02:13:21', '2016-09-30 02:13:21'),
(13, 2, 'created', 'users', 14, '2016-09-30 02:14:13', '2016-09-30 02:14:13'),
(14, 2, 'created', 'users', 15, '2016-09-30 02:23:27', '2016-09-30 02:23:27'),
(15, 2, 'created', 'users', 16, '2016-09-30 02:24:25', '2016-09-30 02:24:25'),
(16, 2, 'created', 'users', 17, '2016-09-30 02:40:31', '2016-09-30 02:40:31'),
(17, 2, 'created', 'users', 19, '2016-09-30 02:44:53', '2016-09-30 02:44:53'),
(18, 2, 'deleted', 'users', 2, '2016-09-30 02:45:37', '2016-09-30 02:45:37'),
(19, 20, 'created', 'users', 21, '2016-09-30 02:48:05', '2016-09-30 02:48:05'),
(20, 20, 'created', 'users', 23, '2016-09-30 02:48:57', '2016-09-30 02:48:57'),
(21, 20, 'created', 'users', 25, '2016-09-30 02:50:09', '2016-09-30 02:50:09'),
(22, 20, 'created', 'users', 26, '2016-09-30 02:54:55', '2016-09-30 02:54:55'),
(23, 20, 'created', 'users', 27, '2016-09-30 02:56:32', '2016-09-30 02:56:32'),
(24, 20, 'updated', 'users', 26, '2016-09-30 03:10:38', '2016-09-30 03:10:38'),
(25, 20, 'updated', 'users', 23, '2016-09-30 03:14:27', '2016-09-30 03:14:27'),
(26, 20, 'updated', 'users', 27, '2016-09-30 03:15:19', '2016-09-30 03:15:19'),
(27, 20, 'created', 'users', 28, '2016-09-30 03:17:16', '2016-09-30 03:17:16'),
(28, 20, 'updated', 'users', 28, '2016-09-30 03:19:02', '2016-09-30 03:19:02'),
(29, 20, 'updated', 'users', 28, '2016-09-30 03:31:05', '2016-09-30 03:31:05'),
(30, 20, 'updated', 'users', 28, '2016-09-30 03:31:26', '2016-09-30 03:31:26'),
(31, 20, 'updated', 'users', 28, '2016-09-30 03:33:46', '2016-09-30 03:33:46'),
(32, 20, 'updated', 'users', 28, '2016-09-30 03:40:22', '2016-09-30 03:40:22'),
(33, 20, 'updated', 'users', 28, '2016-09-30 03:40:28', '2016-09-30 03:40:28'),
(34, 20, 'updated', 'users', 28, '2016-09-30 03:50:56', '2016-09-30 03:50:56'),
(35, 20, 'created', 'users', 29, '2016-09-30 03:51:33', '2016-09-30 03:51:33'),
(36, 20, 'updated', 'users', 28, '2016-09-30 04:01:04', '2016-09-30 04:01:04'),
(37, 20, 'updated', 'users', 29, '2016-09-30 04:01:12', '2016-09-30 04:01:12'),
(38, 20, 'created', 'moives', 1, '2016-09-30 04:23:39', '2016-09-30 04:23:39'),
(39, 20, 'created', 'moives', 2, '2016-09-30 04:27:40', '2016-09-30 04:27:40'),
(40, 20, 'created', 'moives', 3, '2016-09-30 04:27:55', '2016-09-30 04:27:55'),
(41, 20, 'created', 'moives', 4, '2016-09-30 04:28:24', '2016-09-30 04:28:24'),
(42, 20, 'created', 'moives', 5, '2016-09-30 04:28:37', '2016-09-30 04:28:37'),
(43, 20, 'updated', 'users', 20, '2016-09-30 06:45:20', '2016-09-30 06:45:20'),
(44, 20, 'created', 'users', 30, '2016-09-30 07:23:46', '2016-09-30 07:23:46'),
(45, 20, 'created', 'movies', 1, '2016-09-30 07:28:50', '2016-09-30 07:28:50'),
(46, 20, 'created', 'movies', 2, '2016-09-30 07:29:09', '2016-09-30 07:29:09'),
(47, 20, 'created', 'movies', 3, '2016-09-30 07:29:19', '2016-09-30 07:29:19'),
(48, 20, 'created', 'movies', 4, '2016-09-30 07:29:31', '2016-09-30 07:29:31'),
(49, 20, 'deleted', 'users', 29, '2016-09-30 07:36:53', '2016-09-30 07:36:53'),
(50, 20, 'created', 'films', 1, '2016-09-30 07:46:43', '2016-09-30 07:46:43'),
(51, 20, 'created', 'films', 2, '2016-09-30 07:46:54', '2016-09-30 07:46:54'),
(52, 20, 'created', 'films', 3, '2016-09-30 07:47:09', '2016-09-30 07:47:09'),
(53, 20, 'created', 'users', 31, '2016-09-30 09:18:07', '2016-09-30 09:18:07'),
(54, 20, 'updated', 'users', 20, '2016-09-30 09:35:32', '2016-09-30 09:35:32'),
(55, 20, 'created', 'users', 33, '2016-09-30 09:39:07', '2016-09-30 09:39:07'),
(56, 20, 'created', 'users', 36, '2016-09-30 09:40:15', '2016-09-30 09:40:15'),
(57, 20, 'created', 'users', 38, '2016-09-30 09:41:06', '2016-09-30 09:41:06'),
(58, 20, 'created', 'users', 39, '2016-09-30 09:41:50', '2016-09-30 09:41:50'),
(59, 20, 'created', 'users', 40, '2016-09-30 10:41:58', '2016-09-30 10:41:58'),
(60, 20, 'created', 'users', 43, '2016-09-30 11:03:41', '2016-09-30 11:03:41'),
(61, 20, 'created', 'users', 47, '2016-09-30 11:19:48', '2016-09-30 11:19:48'),
(62, 20, 'created', 'users', 48, '2016-09-30 11:38:37', '2016-09-30 11:38:37'),
(63, 20, 'created', 'users', 50, '2016-09-30 11:42:31', '2016-09-30 11:42:31'),
(64, 20, 'created', 'users', 53, '2016-09-30 11:44:11', '2016-09-30 11:44:11'),
(65, 20, 'created', 'users', 54, '2016-09-30 11:44:56', '2016-09-30 11:44:56'),
(66, 20, 'created', 'users', 55, '2016-09-30 11:46:10', '2016-09-30 11:46:10'),
(67, 20, 'created', 'users', 56, '2016-09-30 11:47:48', '2016-09-30 11:47:48'),
(68, 20, 'created', 'users', 57, '2016-09-30 11:48:30', '2016-09-30 11:48:30'),
(69, 20, 'created', 'users', 58, '2016-09-30 11:49:36', '2016-09-30 11:49:36'),
(70, 20, 'created', 'users', 59, '2016-09-30 11:53:36', '2016-09-30 11:53:36'),
(71, 20, 'created', 'users', 60, '2016-09-30 11:54:29', '2016-09-30 11:54:29'),
(72, 20, 'created', 'users', 61, '2016-09-30 11:55:29', '2016-09-30 11:55:29'),
(73, 20, 'created', 'users', 63, '2016-09-30 11:56:46', '2016-09-30 11:56:46'),
(74, 20, 'created', 'users', 64, '2016-09-30 11:57:54', '2016-09-30 11:57:54'),
(75, 20, 'created', 'user_films', 0, '2016-09-30 11:57:54', '2016-09-30 11:57:54'),
(76, 20, 'created', 'user_films', 0, '2016-09-30 11:57:54', '2016-09-30 11:57:54'),
(77, 20, 'created', 'user_films', 0, '2016-09-30 11:57:54', '2016-09-30 11:57:54'),
(78, 20, 'created', 'users', 65, '2016-09-30 12:06:46', '2016-09-30 12:06:46'),
(79, 20, 'created', 'user_films', 0, '2016-09-30 12:06:46', '2016-09-30 12:06:46'),
(80, 20, 'created', 'users', 66, '2016-09-30 12:09:25', '2016-09-30 12:09:25'),
(81, 20, 'created', 'users', 67, '2016-09-30 12:09:58', '2016-09-30 12:09:58'),
(82, 20, 'created', 'user_films', 0, '2016-09-30 12:09:58', '2016-09-30 12:09:58'),
(83, 20, 'created', 'user_films', 0, '2016-09-30 12:09:58', '2016-09-30 12:09:58'),
(84, 20, 'created', 'user_films', 0, '2016-09-30 12:09:59', '2016-09-30 12:09:59'),
(85, 20, 'created', 'users', 68, '2016-09-30 12:11:19', '2016-09-30 12:11:19'),
(86, 20, 'created', 'user_films', 0, '2016-09-30 12:11:19', '2016-09-30 12:11:19'),
(87, 20, 'created', 'user_films', 0, '2016-09-30 12:11:19', '2016-09-30 12:11:19'),
(88, 20, 'created', 'user_films', 0, '2016-09-30 12:11:19', '2016-09-30 12:11:19'),
(89, 20, 'updated', 'users', 68, '2016-09-30 13:06:37', '2016-09-30 13:06:37'),
(90, 20, 'updated', 'users', 68, '2016-09-30 13:08:28', '2016-09-30 13:08:28'),
(91, 20, 'created', 'users', 69, '2016-09-30 13:09:43', '2016-09-30 13:09:43'),
(92, 20, 'created', 'user_films', 0, '2016-09-30 13:09:43', '2016-09-30 13:09:43'),
(93, 20, 'created', 'user_films', 0, '2016-09-30 13:09:43', '2016-09-30 13:09:43'),
(94, 20, 'updated', 'users', 69, '2016-09-30 13:12:00', '2016-09-30 13:12:00'),
(95, 20, 'updated', 'users', 69, '2016-09-30 13:21:26', '2016-09-30 13:21:26'),
(96, 20, 'updated', 'users', 69, '2016-09-30 13:21:51', '2016-09-30 13:21:51'),
(97, 20, 'created', 'user_films', 0, '2016-09-30 13:21:51', '2016-09-30 13:21:51'),
(98, 20, 'created', 'user_films', 0, '2016-09-30 13:21:51', '2016-09-30 13:21:51'),
(99, 20, 'created', 'user_films', 0, '2016-09-30 13:21:51', '2016-09-30 13:21:51'),
(100, 20, 'updated', 'users', 69, '2016-09-30 13:25:21', '2016-09-30 13:25:21'),
(101, 20, 'created', 'user_films', 0, '2016-09-30 13:25:21', '2016-09-30 13:25:21'),
(102, 20, 'created', 'user_films', 0, '2016-09-30 13:25:21', '2016-09-30 13:25:21'),
(103, 20, 'updated', 'users', 69, '2016-09-30 13:32:33', '2016-09-30 13:32:33'),
(104, 20, 'created', 'user_films', 0, '2016-09-30 13:32:33', '2016-09-30 13:32:33'),
(105, 20, 'updated', 'users', 69, '2016-09-30 13:32:55', '2016-09-30 13:32:55'),
(106, 20, 'created', 'user_films', 0, '2016-09-30 13:32:55', '2016-09-30 13:32:55'),
(107, 20, 'created', 'user_films', 0, '2016-09-30 13:32:55', '2016-09-30 13:32:55'),
(108, 20, 'updated', 'users', 69, '2016-10-01 00:17:32', '2016-10-01 00:17:32'),
(109, 20, 'updated', 'users', 69, '2016-10-01 00:18:21', '2016-10-01 00:18:21'),
(110, 20, 'updated', 'users', 69, '2016-10-01 00:18:48', '2016-10-01 00:18:48'),
(111, 20, 'updated', 'users', 69, '2016-10-01 00:19:41', '2016-10-01 00:19:41'),
(112, 20, 'updated', 'users', 69, '2016-10-01 00:19:56', '2016-10-01 00:19:56'),
(113, 20, 'updated', 'users', 69, '2016-10-01 00:21:14', '2016-10-01 00:21:14'),
(114, 20, 'updated', 'users', 69, '2016-10-01 00:22:06', '2016-10-01 00:22:06'),
(115, 20, 'updated', 'users', 69, '2016-10-01 00:22:18', '2016-10-01 00:22:18'),
(116, 20, 'updated', 'users', 69, '2016-10-01 00:22:38', '2016-10-01 00:22:38'),
(117, 20, 'updated', 'users', 69, '2016-10-01 00:22:46', '2016-10-01 00:22:46'),
(118, 20, 'updated', 'users', 69, '2016-10-01 00:23:03', '2016-10-01 00:23:03'),
(119, 20, 'updated', 'users', 69, '2016-10-01 00:24:06', '2016-10-01 00:24:06'),
(120, 20, 'updated', 'users', 69, '2016-10-01 00:24:27', '2016-10-01 00:24:27'),
(121, 20, 'updated', 'users', 69, '2016-10-01 00:25:05', '2016-10-01 00:25:05'),
(122, 20, 'updated', 'users', 69, '2016-10-01 00:26:22', '2016-10-01 00:26:22'),
(123, 20, 'updated', 'users', 69, '2016-10-01 00:26:36', '2016-10-01 00:26:36'),
(124, 20, 'updated', 'users', 69, '2016-10-01 00:26:59', '2016-10-01 00:26:59'),
(125, 20, 'updated', 'users', 69, '2016-10-01 00:27:15', '2016-10-01 00:27:15'),
(126, 20, 'updated', 'users', 69, '2016-10-01 00:27:49', '2016-10-01 00:27:49'),
(127, 20, 'updated', 'users', 69, '2016-10-01 00:29:04', '2016-10-01 00:29:04'),
(128, 20, 'updated', 'users', 69, '2016-10-01 00:30:44', '2016-10-01 00:30:44'),
(129, 20, 'updated', 'users', 69, '2016-10-01 00:33:28', '2016-10-01 00:33:28'),
(130, 20, 'updated', 'users', 69, '2016-10-01 00:42:49', '2016-10-01 00:42:49'),
(131, 20, 'updated', 'users', 69, '2016-10-01 00:43:41', '2016-10-01 00:43:41'),
(132, 20, 'updated', 'users', 69, '2016-10-01 00:43:55', '2016-10-01 00:43:55'),
(133, 20, 'created', 'user_films', 0, '2016-10-01 00:43:55', '2016-10-01 00:43:55'),
(134, 20, 'created', 'user_films', 0, '2016-10-01 00:43:55', '2016-10-01 00:43:55'),
(135, 20, 'updated', 'users', 69, '2016-10-01 00:45:17', '2016-10-01 00:45:17'),
(136, 20, 'created', 'user_films', 1, '2016-10-01 00:45:17', '2016-10-01 00:45:17'),
(137, 20, 'updated', 'users', 69, '2016-10-01 00:45:32', '2016-10-01 00:45:32'),
(138, 20, 'created', 'user_films', 2, '2016-10-01 00:45:32', '2016-10-01 00:45:32'),
(139, 20, 'updated', 'users', 69, '2016-10-01 00:58:42', '2016-10-01 00:58:42'),
(140, 20, 'created', 'user_films', 3, '2016-10-01 00:58:42', '2016-10-01 00:58:42'),
(141, 20, 'created', 'user_films', 4, '2016-10-01 00:58:42', '2016-10-01 00:58:42'),
(142, 20, 'updated', 'users', 69, '2016-10-01 00:59:49', '2016-10-01 00:59:49'),
(143, 20, 'created', 'user_films', 5, '2016-10-01 00:59:49', '2016-10-01 00:59:49'),
(144, 20, 'created', 'user_films', 6, '2016-10-01 00:59:49', '2016-10-01 00:59:49'),
(145, 20, 'updated', 'users', 69, '2016-10-01 01:00:03', '2016-10-01 01:00:03'),
(146, 20, 'created', 'user_films', 7, '2016-10-01 01:00:03', '2016-10-01 01:00:03'),
(147, 20, 'created', 'user_films', 8, '2016-10-01 01:00:03', '2016-10-01 01:00:03'),
(148, 20, 'updated', 'users', 69, '2016-10-01 01:00:30', '2016-10-01 01:00:30'),
(149, 20, 'created', 'user_films', 9, '2016-10-01 01:00:30', '2016-10-01 01:00:30'),
(150, 20, 'created', 'user_films', 10, '2016-10-01 01:00:30', '2016-10-01 01:00:30'),
(151, 20, 'updated', 'users', 69, '2016-10-01 01:03:33', '2016-10-01 01:03:33'),
(152, 20, 'created', 'user_films', 11, '2016-10-01 01:03:33', '2016-10-01 01:03:33'),
(153, 20, 'created', 'user_films', 12, '2016-10-01 01:03:33', '2016-10-01 01:03:33'),
(154, 20, 'updated', 'users', 69, '2016-10-01 01:03:53', '2016-10-01 01:03:53'),
(155, 20, 'created', 'user_films', 13, '2016-10-01 01:03:53', '2016-10-01 01:03:53'),
(156, 20, 'created', 'user_films', 14, '2016-10-01 01:03:53', '2016-10-01 01:03:53'),
(157, 20, 'updated', 'users', 69, '2016-10-01 01:11:20', '2016-10-01 01:11:20'),
(158, 20, 'created', 'user_films', 15, '2016-10-01 01:11:20', '2016-10-01 01:11:20'),
(159, 20, 'created', 'user_films', 16, '2016-10-01 01:11:20', '2016-10-01 01:11:20'),
(160, 20, 'updated', 'users', 69, '2016-10-01 01:11:28', '2016-10-01 01:11:28'),
(161, 20, 'created', 'user_films', 17, '2016-10-01 01:11:28', '2016-10-01 01:11:28'),
(162, 20, 'created', 'user_films', 18, '2016-10-01 01:11:28', '2016-10-01 01:11:28'),
(163, 20, 'updated', 'users', 69, '2016-10-01 01:11:37', '2016-10-01 01:11:37'),
(164, 20, 'created', 'user_films', 19, '2016-10-01 01:11:37', '2016-10-01 01:11:37'),
(165, 20, 'updated', 'users', 69, '2016-10-01 01:11:44', '2016-10-01 01:11:44'),
(166, 20, 'created', 'user_films', 20, '2016-10-01 01:11:44', '2016-10-01 01:11:44'),
(167, 20, 'updated', 'users', 69, '2016-10-01 01:11:52', '2016-10-01 01:11:52'),
(168, 20, 'created', 'user_films', 21, '2016-10-01 01:11:52', '2016-10-01 01:11:52'),
(169, 20, 'updated', 'users', 21, '2016-10-01 01:12:13', '2016-10-01 01:12:13'),
(170, 20, 'created', 'user_films', 22, '2016-10-01 01:12:14', '2016-10-01 01:12:14'),
(171, 20, 'created', 'user_films', 23, '2016-10-01 01:12:14', '2016-10-01 01:12:14'),
(172, 20, 'updated', 'users', 69, '2016-10-01 01:14:50', '2016-10-01 01:14:50'),
(173, 20, 'deleted', 'users', 50, '2016-10-01 01:36:43', '2016-10-01 01:36:43'),
(174, 20, 'created', 'users', 71, '2016-10-01 01:37:07', '2016-10-01 01:37:07'),
(175, 20, 'created', 'users', 72, '2016-10-01 01:43:35', '2016-10-01 01:43:35'),
(176, 20, 'created', 'user_films', 24, '2016-10-01 01:43:35', '2016-10-01 01:43:35'),
(177, 20, 'created', 'user_films', 25, '2016-10-01 01:43:35', '2016-10-01 01:43:35'),
(178, 20, 'created', 'users', 73, '2016-10-01 01:46:51', '2016-10-01 01:46:51'),
(179, 20, 'created', 'users', 74, '2016-10-01 01:49:30', '2016-10-01 01:49:30'),
(180, 20, 'created', 'users', 75, '2016-10-01 01:50:09', '2016-10-01 01:50:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_films`
--

CREATE TABLE `user_films` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_films`
--

INSERT INTO `user_films` (`id`, `user_id`, `movie_id`, `created_at`, `updated_at`) VALUES
(21, 69, 1, '2016-10-01 01:11:52', '2016-10-01 01:11:52'),
(22, 21, 1, '2016-10-01 01:12:13', '2016-10-01 01:12:13'),
(23, 21, 2, '2016-10-01 01:12:14', '2016-10-01 01:12:14'),
(24, 72, 1, '2016-10-01 01:43:35', '2016-10-01 01:43:35'),
(25, 72, 2, '2016-10-01 01:43:35', '2016-10-01 01:43:35');

-- --------------------------------------------------------

--
-- Table structure for table `user_films_back`
--

CREATE TABLE `user_films_back` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `movie_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_films_back`
--

INSERT INTO `user_films_back` (`user_id`, `movie_id`, `created_at`, `updated_at`) VALUES
(69, 1, '2016-09-30 13:25:21', '2016-09-30 13:25:21'),
(69, 3, '2016-09-30 13:25:21', '2016-09-30 13:25:21'),
(69, 3, '2016-09-30 13:32:33', '2016-09-30 13:32:33'),
(69, 2, '2016-09-30 13:32:55', '2016-09-30 13:32:55'),
(69, 3, '2016-09-30 13:32:55', '2016-09-30 13:32:55'),
(69, 2, '2016-10-01 00:43:55', '2016-10-01 00:43:55'),
(69, 3, '2016-10-01 00:43:55', '2016-10-01 00:43:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_role`
--
ALTER TABLE `menu_role`
  ADD UNIQUE KEY `menu_role_menu_id_role_id_unique` (`menu_id`,`role_id`),
  ADD KEY `menu_role_menu_id_index` (`menu_id`),
  ADD KEY `menu_role_role_id_index` (`role_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_films`
--
ALTER TABLE `user_films`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `user_films_back`
--
ALTER TABLE `user_films_back`
  ADD KEY `user_film_user_id_foreign` (`user_id`),
  ADD KEY `user_film_movie_id_foreign` (`movie_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `user_films`
--
ALTER TABLE `user_films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_role`
--
ALTER TABLE `menu_role`
  ADD CONSTRAINT `menu_role_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_films`
--
ALTER TABLE `user_films`
  ADD CONSTRAINT `user_films_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `films` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_films_back`
--
ALTER TABLE `user_films_back`
  ADD CONSTRAINT `user_film_movie_id_foreign` FOREIGN KEY (`movie_id`) REFERENCES `films` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
