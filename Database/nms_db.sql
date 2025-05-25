-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 25, 2025 at 11:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `author`, `author_id`, `content`, `created_at`, `post_id`) VALUES
(11, 'Nafidul Nafin', 6, 'fgff', '2025-05-26 00:30:01.000000', 3);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `content`, `created_at`, `is_read`, `receiver_id`, `sender_id`) VALUES
(1, 'hii', '2025-05-25 21:05:50.000000', b'0', 3, 4),
(2, 'hey', '2025-05-25 21:06:48.000000', b'0', 4, 3),
(3, 'how are you?', '2025-05-25 21:10:28.000000', b'0', 3, 4),
(4, 'fine you?', '2025-05-25 21:21:41.000000', b'0', 4, 3),
(5, 'goof', '2025-05-25 21:21:59.000000', b'0', 3, 4),
(6, 'ok', '2025-05-25 21:22:16.000000', b'0', 4, 3),
(7, 'okk', '2025-05-25 21:24:55.000000', b'0', 4, 3),
(8, 'yoo', '2025-05-25 21:25:32.000000', b'0', 4, 3),
(9, 'hey', '2025-05-25 23:40:56.000000', b'0', 4, 6),
(10, 'hiii', '2025-05-25 23:49:36.000000', b'0', 6, 5),
(11, 'hlwww', '2025-05-25 23:49:49.000000', b'0', 5, 6),
(12, 'fff', '2025-05-26 00:24:50.000000', b'0', 6, 5),
(13, 'bondhu', '2025-05-26 00:26:32.000000', b'0', 5, 6),
(14, 'hiii', '2025-05-26 00:26:46.000000', b'0', 6, 5),
(15, 'hey', '2025-05-26 02:11:42.000000', b'0', 4, 6),
(16, 'hhh', '2025-05-26 02:11:58.000000', b'0', 6, 5);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `is_read` bit(1) NOT NULL,
  `message` varchar(255) NOT NULL,
  `related_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `created_at`, `is_read`, `message`, `related_id`, `type`, `user_id`, `latitude`, `longitude`) VALUES
(4, '2025-05-25 22:05:49.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin  needs help! Location: Current location', 6, 'emergency', 3, NULL, NULL),
(5, '2025-05-25 22:05:49.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin  needs help! Location: Current location', 6, 'emergency', 4, NULL, NULL),
(6, '2025-05-25 22:05:49.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin  needs help! Location: Current location', 6, 'emergency', 5, NULL, NULL),
(7, '2025-05-25 22:08:28.000000', b'1', '💬 Nafidul Nafin  commented on your post', 2, 'comment', 4, NULL, NULL),
(8, '2025-05-25 23:32:50.000000', b'0', '🚨 EMERGENCY ALERT: Kawasar Habib needs help! Location: Coordinates: 24.376115, 88.575181', 4, 'emergency', 3, 24.3761152, 88.5751808),
(9, '2025-05-25 23:32:50.000000', b'1', '🚨 EMERGENCY ALERT: Kawasar Habib needs help! Location: Coordinates: 24.376115, 88.575181', 4, 'emergency', 5, 24.3761152, 88.5751808),
(10, '2025-05-25 23:32:50.000000', b'1', '🚨 EMERGENCY ALERT: Kawasar Habib needs help! Location: Coordinates: 24.376115, 88.575181', 4, 'emergency', 6, 24.3761152, 88.5751808),
(11, '2025-05-25 23:39:38.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 3, 24.3761152, 88.5751808),
(12, '2025-05-25 23:39:38.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 4, 24.3761152, 88.5751808),
(13, '2025-05-25 23:39:38.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 5, 24.3761152, 88.5751808),
(14, '2025-05-25 23:44:56.000000', b'0', '🚨 EMERGENCY ALERT: Kawasar Habib needs help! Location: Coordinates: 24.376115, 88.575181', 4, 'emergency', 3, 24.3761152, 88.5751808),
(15, '2025-05-25 23:44:56.000000', b'1', '🚨 EMERGENCY ALERT: Kawasar Habib needs help! Location: Coordinates: 24.376115, 88.575181', 4, 'emergency', 5, 24.3761152, 88.5751808),
(16, '2025-05-25 23:44:56.000000', b'1', '🚨 EMERGENCY ALERT: Kawasar Habib needs help! Location: Coordinates: 24.376115, 88.575181', 4, 'emergency', 6, 24.3761152, 88.5751808),
(17, '2025-05-25 23:50:38.000000', b'0', '📝 Atik Uddoula shared a new post', 3, 'new_post', 3, NULL, NULL),
(18, '2025-05-25 23:50:38.000000', b'0', '📝 Atik Uddoula shared a new post', 3, 'new_post', 4, NULL, NULL),
(19, '2025-05-25 23:50:38.000000', b'1', '📝 Atik Uddoula shared a new post', 3, 'new_post', 6, NULL, NULL),
(20, '2025-05-25 23:51:47.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 3, 24.3761152, 88.5751808),
(21, '2025-05-25 23:51:47.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 4, 24.3761152, 88.5751808),
(22, '2025-05-25 23:51:47.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 5, 24.3761152, 88.5751808),
(23, '2025-05-26 00:26:17.000000', b'1', '❤️ Nafidul Nafin liked your post', 3, 'like', 5, NULL, NULL),
(24, '2025-05-26 00:26:20.000000', b'1', '💬 Nafidul Nafin commented on your post', 3, 'comment', 5, NULL, NULL),
(25, '2025-05-26 00:27:05.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 3, 24.3761152, 88.5751808),
(26, '2025-05-26 00:27:05.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 4, 24.3761152, 88.5751808),
(27, '2025-05-26 00:27:05.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 5, 24.3761152, 88.5751808),
(28, '2025-05-26 00:30:01.000000', b'1', '💬 Nafidul Nafin commented on your post', 3, 'comment', 5, NULL, NULL),
(29, '2025-05-26 02:14:05.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 3, 24.3761152, 88.5751808),
(30, '2025-05-26 02:14:05.000000', b'0', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 4, 24.3761152, 88.5751808),
(31, '2025-05-26 02:14:05.000000', b'1', '🚨 EMERGENCY ALERT: Nafidul Nafin needs help! Location: Coordinates: 24.376115, 88.575181', 6, 'emergency', 5, 24.3761152, 88.5751808),
(32, '2025-05-26 02:25:40.000000', b'0', '📝 Nafidul Nafin shared a new post', 4, 'new_post', 3, NULL, NULL),
(33, '2025-05-26 02:25:40.000000', b'0', '📝 Nafidul Nafin shared a new post', 4, 'new_post', 4, NULL, NULL),
(34, '2025-05-26 02:25:40.000000', b'1', '📝 Nafidul Nafin shared a new post', 4, 'new_post', 5, NULL, NULL),
(35, '2025-05-26 02:26:43.000000', b'1', '❤️ Atik Uddoula liked your post', 4, 'like', 6, NULL, NULL),
(36, '2025-05-26 02:28:25.000000', b'0', '❤️ Atik Uddoula liked your post', 2, 'like', 4, NULL, NULL),
(37, '2025-05-26 02:28:27.000000', b'0', '❤️ Atik Uddoula liked your post', 1, 'like', 3, NULL, NULL),
(38, '2025-05-26 02:29:37.000000', b'0', '📝 Nafidul Nafin shared a new post', 5, 'new_post', 3, NULL, NULL),
(39, '2025-05-26 02:29:37.000000', b'0', '📝 Nafidul Nafin shared a new post', 5, 'new_post', 4, NULL, NULL),
(40, '2025-05-26 02:29:37.000000', b'1', '📝 Nafidul Nafin shared a new post', 5, 'new_post', 5, NULL, NULL),
(41, '2025-05-26 02:30:42.000000', b'1', '❤️ Atik Uddoula liked your post', 5, 'like', 6, NULL, NULL),
(42, '2025-05-26 03:03:17.000000', b'0', '🚨 EMERGENCY ALERT: Atik Uddoula needs help! Location: Coordinates: 24.376115, 88.575181', 5, 'emergency', 3, 24.3761152, 88.5751808),
(43, '2025-05-26 03:03:17.000000', b'0', '🚨 EMERGENCY ALERT: Atik Uddoula needs help! Location: Coordinates: 24.376115, 88.575181', 5, 'emergency', 4, 24.3761152, 88.5751808),
(44, '2025-05-26 03:03:17.000000', b'1', '🚨 EMERGENCY ALERT: Atik Uddoula needs help! Location: Coordinates: 24.376115, 88.575181', 5, 'emergency', 6, 24.3761152, 88.5751808);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comments_count` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `likes_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author`, `author_id`, `comments_count`, `content`, `created_at`, `image_url`, `likes_count`) VALUES
(5, 'Nafidul Nafin', 6, 0, 'Hello world!!!', '2025-05-26 02:29:37.000000', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `post_likes`
--

CREATE TABLE `post_likes` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post_likes`
--

INSERT INTO `post_likes` (`id`, `created_at`, `post_id`, `user_id`) VALUES
(1, '2025-05-25 21:07:09.000000', 1, 3),
(2, '2025-05-25 21:08:01.000000', 1, 4),
(3, '2025-05-25 21:53:36.000000', 2, 6),
(4, '2025-05-25 21:57:07.000000', 1, 6),
(5, '2025-05-25 21:57:27.000000', 2, 4),
(6, '2025-05-25 23:50:54.000000', 3, 5),
(7, '2025-05-26 00:26:17.000000', 3, 6),
(8, '2025-05-26 02:25:43.000000', 4, 6),
(9, '2025-05-26 02:26:43.000000', 4, 5),
(10, '2025-05-26 02:28:25.000000', 2, 5),
(11, '2025-05-26 02:28:27.000000', 1, 5),
(12, '2025-05-26 02:30:33.000000', 5, 6),
(13, '2025-05-26 02:30:42.000000', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `email`, `password`, `updated_at`, `username`, `full_name`, `profile_picture`) VALUES
(3, NULL, 'tasminahmedoni99@gmail.com', '$2a$10$YOhtUq6wBuxJy3Zm.C9gfuD/iTy4HtnbajdgzMQP5lS8HevwlC0nC', '2025-05-25 20:26:17.322309', 'tasminoni12', 'Tasmin Ahmed', NULL),
(4, NULL, 'kawsarhabib@gmail.com', '$2a$10$h37OcNmLXwNYdrh2cmiLT.iICkj.C/DZ5PaHERHYVEHamKFMzazHW', '2025-05-25 21:02:54.445426', 'kawsar', 'Kawasar Habib', '/uploads/profiles/cb25ce50-410d-460d-8283-719bd7d133bc.png'),
(5, NULL, 'atik@gmail.com', '$2a$10$kpnFam9dUiDkPnJZCS1tp.0P5UYn1w21JJUwSDNWJe9jea4wIEm52', '2025-05-25 21:28:11.990555', 'Atik', 'Atik Uddoula', '/uploads/profiles/6ce0f241-2576-4c66-bfa5-671f1b8f8545.png'),
(6, NULL, 'nafinbhuiya2021@gmail.com', '$2a$10$7AIa6x5S6ccmjta2mjCoPOiLoHN2ac96XYIsct7Yvua.zJapo7Xau', '2025-05-25 21:28:50.622743', 'Nafin ', 'Nafidul Nafin', '/uploads/profiles/f491635a-4257-4274-9c97-e26543850418.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_likes`
--
ALTER TABLE `post_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK5l2rj28vw5oj6f7ox746grokg` (`post_id`,`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  ADD UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `post_likes`
--
ALTER TABLE `post_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
