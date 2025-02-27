-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 13, 2024 at 04:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `water_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_paid`
--

CREATE TABLE `bill_paid` (
  `id` int(6) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `code` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `month` varchar(50) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bill_paid`
--

INSERT INTO `bill_paid` (`id`, `name`, `email`, `code`, `amount`, `month`, `payment_date`) VALUES
(26, 'harsha', 'nimeshsan27@gmail.com', '236324', '1000', '2024-03', '2024-05-19 15:35:38'),
(27, 'nimesh', 'abc@gmail.com', '236326', '1100', '2024-04', '2024-05-20 07:15:00'),
(28, 'harsha', 'nimeshsan27@gmail.com', '236324', '1000', '2024-07', '2024-07-09 05:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` enum('male','female','other') NOT NULL,
  `birthday` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `name`, `code`, `email`, `gender`, `birthday`, `created_at`) VALUES
(1, 'harsha', '236324', 'nimeshsan27@gmail.com', 'male', '2024-01-17', '2024-05-14 19:11:46'),
(2, 'harsha', '236325', 'sandaruwanp440@gmail.com', 'male', '2023-10-11', '2024-05-14 19:13:38'),
(37, 'nimesh', '236326', 'abc@gmail.com', 'male', '2022-10-31', '2024-05-16 11:01:06'),
(38, 'susila', '1245', 'susila@gmail.com', 'male', '2024-04-29', '2024-05-17 02:22:44');

-- --------------------------------------------------------

--
-- Table structure for table `usercomplains`
--

CREATE TABLE `usercomplains` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `complaint` varchar(500) NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usercomplains`
--

INSERT INTO `usercomplains` (`id`, `name`, `code`, `email`, `complaint`, `submission_date`) VALUES
(2, 'harsha', '236324', 'nimeshsan27@gmail.com', '', '2024-05-18 01:49:50'),
(11, 'susila', '1245', 'susila@gmail.com', 'My water payment is pay but it not show', '2024-05-18 04:26:39'),
(12, 'nimesh', '236326', 'abc@gmail.com', 'water bill is no', '2024-05-18 14:37:05');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_paid`
--
ALTER TABLE `bill_paid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `usercomplains`
--
ALTER TABLE `usercomplains`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_paid`
--
ALTER TABLE `bill_paid`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `usercomplains`
--
ALTER TABLE `usercomplains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
