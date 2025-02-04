-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 26, 2024 at 08:32 AM
-- Server version: 8.0.21
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vocal_vantage`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities_upload`
--

DROP TABLE IF EXISTS `activities_upload`;
CREATE TABLE IF NOT EXISTS `activities_upload` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `agegroup` enum('0-5','6-12','13-18','18+') NOT NULL,
  `therapycategory` enum('speech','language','cognitive','swallowing') NOT NULL,
  `activitytitle` varchar(255) NOT NULL,
  `activitydscription` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `activities_upload`
--

INSERT INTO `activities_upload` (`id`, `filename`, `agegroup`, `therapycategory`, `activitytitle`, `activitydscription`) VALUES
(5, 'activity_vid3 (1) (1).mp4', '6-12', 'language', 'Mouth Therapy', 'Mouth Therapy'),
(4, 'activity_vid2 (1) (1).mp4', '6-12', 'speech', 'Lips Therapy', 'Lips Therapy '),
(6, 'activity_vid4 (1) (1) (1).mp4', '6-12', 'language', 'Lips Therapy', 'Lips Therapy '),
(7, 'activity_vid5 (1) (1) (1).mp4', '0-5', 'speech', 'Lips Therapy', 'Lips Therapy '),
(8, 'activity_vid1 (1) (1) (1) (1).mp4', '0-5', 'speech', 'Lips Therapy', 'Lips Therapy '),
(11, 'activity_vid1 (1) (1) (1) (1).mp4', '6-12', 'language', 'Lips Therapy', 'Lips Therapy ');

-- --------------------------------------------------------

--
-- Table structure for table `appoinments`
--

DROP TABLE IF EXISTS `appoinments`;
CREATE TABLE IF NOT EXISTS `appoinments` (
  `App_id` int NOT NULL AUTO_INCREMENT,
  `Patient_name` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `Therapist` enum('doctor 1','doctor 2','doctor 3','') NOT NULL,
  `Date` date NOT NULL,
  `Time` enum('9.00 - 10.00 A.M','11.00 A.M - 12.00 P.M','1.00 - 2.00 P.M','3.00 - 4.00 P.M','5.00 - 6.00 P.M','7.00 - 8.00 P.M','9.00 - 10.00 P.M') NOT NULL,
  `get_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`App_id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `appoinments`
--

INSERT INTO `appoinments` (`App_id`, `Patient_name`, `Age`, `Therapist`, `Date`, `Time`, `get_at`) VALUES
(57, 'nisini', 23, 'doctor 1', '2024-11-22', '9.00 - 10.00 A.M', '2024-11-26 00:55:47'),
(56, 'nisini', 23, 'doctor 1', '2024-11-28', '9.00 - 10.00 A.M', '2024-11-26 00:39:04'),
(48, 'ty', 45, 'doctor 1', '2024-11-26', '5.00 - 6.00 P.M', '2024-11-24 08:08:54'),
(55, 'nisini', 23, 'doctor 1', '2024-11-21', '9.00 - 10.00 A.M', '2024-11-26 00:31:19'),
(54, 'nisini', 23, 'doctor 1', '2024-11-27', '9.00 - 10.00 A.M', '2024-11-25 15:58:53'),
(53, 'nisini', 23, 'doctor 1', '2024-11-20', '9.00 - 10.00 A.M', '2024-11-25 15:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
CREATE TABLE IF NOT EXISTS `feedback` (
  `Feedback_id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `rating` int NOT NULL,
  PRIMARY KEY (`Feedback_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`Feedback_id`, `Name`, `Description`, `rating`) VALUES
(5, 'thinal silva', 'this is superb platform in to learn and gain therapy knowledge', 4),
(4, 'nisini', 'wertghjk,', 2),
(6, 'nisini', 'very well', 5),
(7, 'nisini', 'iiiii', 5),
(8, 'amasaaaa', 'llllllllllllllllllll', 5),
(9, 'we', 'iii', 4),
(10, 'we', 'u', 4),
(11, 'qafsG', 'tyukl;', 3),
(12, 'thinal silva', 'retfyuoipk[', 4),
(13, 'thinal silva', '111', 3),
(14, 'thinal silva', 'werty', 4),
(15, 'thinal silva', 'erhtyu', 4),
(16, 'thinal silva', 'dfghjuiop[', 4),
(17, 'qafsG', 'fghjipo][\\', 3),
(18, 'thinal silva', 'fcghipo[', 5);

-- --------------------------------------------------------

--
-- Table structure for table `guardian_message`
--

DROP TABLE IF EXISTS `guardian_message`;
CREATE TABLE IF NOT EXISTS `guardian_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `therapist_name` varchar(100) NOT NULL,
  `paitent_name` varchar(100) NOT NULL,
  `guardian_name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guardian_message`
--

INSERT INTO `guardian_message` (`id`, `therapist_name`, `paitent_name`, `guardian_name`, `subject`, `message`) VALUES
(5, 'wedfghbn', 'dfghm,.', 'mindaka', '55555gvgvjhk', 'rtyk'),
(4, 'wedfghbn', 'dfghm,.', 'mindaka', '55555gvgvjhk', 'zaza'),
(3, 'wedfghbn', 'nisini', 'mindaka', '55555gvgvjhk', 'ssss');

-- --------------------------------------------------------

--
-- Table structure for table `guardian_personal_info`
--

DROP TABLE IF EXISTS `guardian_personal_info`;
CREATE TABLE IF NOT EXISTS `guardian_personal_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gname` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `age` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `guardian_personal_info`
--

INSERT INTO `guardian_personal_info` (`id`, `filename`, `name`, `gname`, `email`, `phone_number`, `age`) VALUES
(4, 'review2.jpg', 'thinal silva', 'uk', 'tttsss@gmail.com', '0666666', '45');

-- --------------------------------------------------------

--
-- Table structure for table `live_session_attendance`
--

DROP TABLE IF EXISTS `live_session_attendance`;
CREATE TABLE IF NOT EXISTS `live_session_attendance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(255) NOT NULL,
  `therapist_name` varchar(50) NOT NULL,
  `join_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `live_session_attendance`
--

INSERT INTO `live_session_attendance` (`id`, `patient_name`, `therapist_name`, `join_time`) VALUES
(1, 'nisini', '', '2024-11-22 16:23:18'),
(3, 'diwayanjali', '', '2024-11-22 16:44:39'),
(4, 'l', '', '2024-11-22 16:55:23'),
(5, 'cha', '', '2024-11-23 04:53:09'),
(6, 'nisini', '', '2024-11-24 11:19:35'),
(7, 'diwayanjali', '', '2024-11-24 11:22:21'),
(8, 'eee', '', '2024-11-24 11:24:32'),
(9, 'eee', '', '2024-11-24 11:25:15'),
(10, 'thinal silva', '', '2024-11-25 15:38:18'),
(11, 'thinal silva', '', '2024-11-25 23:55:55'),
(12, 'thinal silva', '', '2024-11-25 23:56:56'),
(13, 'thinal silva', '', '2024-11-25 23:58:18'),
(14, 'thinal silva', '', '2024-11-26 01:21:43'),
(15, 'thinal silva', '', '2024-11-26 01:23:53');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(25) NOT NULL,
  `password` varchar(15) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `create_at`) VALUES
('amasha@gmail.com', '12345', '2024-11-01 09:14:45'),
('amasha@gmail.com', '12345', '2024-11-01 09:15:13'),
('silva@gmail.com', 'laki', '2024-11-04 05:02:14'),
('senumi@gmail.com', 'aaa', '2024-11-04 05:03:08'),
('amasha@gmail.com', '12345', '2024-11-04 05:22:19'),
('amasha@gmail.com', '12345', '2024-11-04 05:23:13'),
('amasha@gmail.com', '12345', '2024-11-04 05:25:08'),
('amasha@gmail.com', '12345', '2024-11-04 06:04:50'),
('silva@gmail.com', '12345', '2024-11-04 06:07:33'),
('amasha@gmail.com', '12345', '2024-11-04 06:09:05'),
('amasha@gmail.com', '12345', '2024-11-04 06:20:11'),
('silva@gmail.com', '12345', '2024-11-04 06:24:51'),
('silva@gmail.com', '12345', '2024-11-04 06:25:12'),
('amasha@gmail.com', '12345', '2024-11-04 06:33:37'),
('silva@gmail.com', '12345', '2024-11-04 06:35:32'),
('amasha@gmail.com', '12345', '2024-11-04 06:36:14'),
('amasha@gmail.com', '12345', '2024-11-04 06:49:08'),
('silva@gmail.com', '12345', '2024-11-04 06:51:03'),
('nisini@gmail.com', '123', '2024-11-18 04:05:41'),
('fafaufayga', '123456789', '2024-11-18 05:31:25'),
('fafaufayga', '123456789', '2024-11-18 05:32:44'),
('tttsss@gmail.com', '12', '2024-11-18 05:37:46'),
('fafaufayga', '123456789', '2024-11-18 05:38:32'),
('c@gmail.com', '123', '2024-11-20 07:22:36'),
('c@gmail.com', '123', '2024-11-20 07:22:48'),
('c@gmail.com', '123', '2024-11-20 07:23:01'),
('c@gmail.com', '123', '2024-11-20 07:24:49'),
('c@gmail.com', '123', '2024-11-20 07:25:07'),
('c@gmail.com', '123', '2024-11-20 07:27:33'),
('eeee@g.com', '123', '2024-11-20 07:28:34'),
('	 tttsss@gmail.com', '12', '2024-11-20 07:32:14'),
('ttt@gmail.com', '12345', '2024-11-20 07:33:29'),
('ttt@gmail.com', '12345', '2024-11-20 07:36:12'),
('aa@gmail.com', '12', '2024-11-20 07:38:37'),
('sasa@gmail.com', '12345', '2024-11-20 07:40:32'),
('sasa@gmail.com', '12345', '2024-11-20 07:47:43'),
('sasa@gmail.com', '12345', '2024-11-20 07:51:58'),
('tttt@mail.com', '12', '2024-11-20 07:53:23'),
('mina@gmail.com', '12', '2024-11-20 07:54:32'),
('sada@gmail.com', '12', '2024-11-20 07:55:49'),
('senu@gmail.com', '12', '2024-11-20 07:56:37'),
('nisi@gmail.com', '12', '2024-11-20 07:57:15'),
('tttsss@gmail.com', '12', '2024-11-20 07:58:13'),
('tttsss@gmail.com', '12', '2024-11-20 08:00:25'),
('c@gmail.com', '123', '2024-11-20 08:43:28'),
('aa@gmail.com', '12', '2024-11-20 08:45:51'),
('nisi@gmail.com', '12', '2024-11-20 08:46:38'),
('tttsss@gmail.com', '12', '2024-11-20 08:47:35'),
('sasa@gmail.com', '12345', '2024-11-20 08:48:32'),
('sasa@gmail.com', '12345', '2024-11-20 08:48:32'),
('c@gmail.com', '123', '2024-11-20 08:50:07'),
('sasa@gmail.com', '12345', '2024-11-20 08:51:14'),
('cha@gmail.com', '12', '2024-11-23 04:51:36'),
('c@gmail.com', '12', '2024-11-23 04:51:54'),
('n@gmail.com', '12', '2024-11-23 04:56:30'),
('s@gmail.com', '12', '2024-11-23 04:57:44'),
('t@gmail.com', '12', '2024-11-23 04:59:41'),
('a@gmail.com', '12', '2024-11-23 05:03:22'),
('nis@gmail.com', '123', '2024-11-23 10:32:38'),
('nisi@gmail.com', '123', '2024-11-23 10:33:10'),
('n@gmail.com', '12', '2024-11-23 16:10:20'),
('sasa@gmail.com', '12345', '2024-11-23 16:10:53'),
('sada@gmail.com', '12', '2024-11-23 16:20:48'),
('eeee@gmail.com', '12', '2024-11-25 15:07:55'),
('eeee@g.com', '12', '2024-11-25 15:08:50'),
('n@gmail.com', '12', '2024-11-25 15:24:56'),
('n@gmail.com', '12', '2024-11-25 15:25:08'),
('n@gmail.com', '12', '2024-11-25 15:26:03'),
('tttsss@gmail.com', '12', '2024-11-25 15:37:23'),
('s@gmail.com', '12', '2024-11-25 15:47:19'),
('tttsss@gmail.com', 'drtyu', '2024-11-25 15:55:38'),
('tttsss@gmail.com', 'qqq', '2024-11-25 15:56:57'),
('ss@gmail.com', '12', '2024-11-25 15:58:30'),
('tttsss@gmail.com', '12', '2024-11-26 00:28:41'),
('s@gmail.com', '12', '2024-11-26 00:35:32'),
('n@gmail.com', '12', '2024-11-26 00:43:42');

-- --------------------------------------------------------

--
-- Table structure for table `paitentmessage`
--

DROP TABLE IF EXISTS `paitentmessage`;
CREATE TABLE IF NOT EXISTS `paitentmessage` (
  `Msg_id` int NOT NULL AUTO_INCREMENT,
  `therapist_name` varchar(50) NOT NULL,
  `patient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Msg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paitentmessage`
--

INSERT INTO `paitentmessage` (`Msg_id`, `therapist_name`, `patient_name`, `subject`, `message`, `sent_at`) VALUES
(3, 'wedfghbn', 'nisini', '55555gvgvjhk', 'k', '2024-11-24 08:10:28'),
(2, 'wwqwqwqw', 'wqwqw', 'wqwqw', 'wqwqwqwqw', '2024-11-19 04:18:40'),
(4, '11', '11', '11', '11', '2024-11-25 15:39:53'),
(5, '11', '11', '11', '111', '2024-11-25 15:40:02'),
(6, 'wedfghbn', 'nisini', '55555gvgvjhk', 'dfyui0', '2024-11-26 00:41:33'),
(7, 'wedfghbn', 'nisini', '55555gvgvjhk', 'fghiop', '2024-11-26 00:54:00');

-- --------------------------------------------------------

--
-- Table structure for table `paitents_personal_info`
--

DROP TABLE IF EXISTS `paitents_personal_info`;
CREATE TABLE IF NOT EXISTS `paitents_personal_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` enum('patient_child','patient_adult','patient_specialneeds','') NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `paitents_personal_info`
--

INSERT INTO `paitents_personal_info` (`id`, `filename`, `name`, `role`, `email`, `phone_number`, `age`) VALUES
(6, 'review2.jpg', 'thinal silva', 'patient_child', 'ss@gmail.com', '0666666', 45),
(4, 'apraxiaadult.jpg', 'we', 'patient_specialneeds', 'eeee@g.com', '0767136964', 23),
(5, 'review2.jpg', 'thinal silva se', 'patient_child', 'tttsss@gmail.com', '0666666', 1),
(7, 'aphasiaadult.jpg', 'thinal silva', 'patient_child', 'ss@gmail.com', '0666666', 45),
(8, 'D1.jpeg', 'thinal silva', 'patient_child', 'ss@gmail.com', '0666666', 45);

-- --------------------------------------------------------

--
-- Table structure for table `patient_entry`
--

DROP TABLE IF EXISTS `patient_entry`;
CREATE TABLE IF NOT EXISTS `patient_entry` (
  `paitent_entry_id` int NOT NULL AUTO_INCREMENT,
  `Patient_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Therapist` varchar(100) NOT NULL,
  `Age` varchar(20) NOT NULL,
  `Disabilities` enum('none','hearing_impairment','speech_impairment','physical_disability','other') NOT NULL,
  `Special_note` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`paitent_entry_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `patient_entry`
--

INSERT INTO `patient_entry` (`paitent_entry_id`, `Patient_name`, `Therapist`, `Age`, `Disabilities`, `Special_note`) VALUES
(24, 'nisini', 'doctor 1', '17', 'physical_disability', 'aaaaaaaaaaaaaa'),
(23, 'nisini', 'doctor 1', '17', 'speech_impairment', 'wwww'),
(22, 'nisini', 'doctor 1', '23', 'speech_impairment', 'wwww'),
(21, 'nisini', '', '23', 'speech_impairment', 'wwwwwwwwwww'),
(20, 'nisini', '', '23', 'speech_impairment', 'wwwwwwwwwww'),
(19, 'nisini', '', '23', 'speech_impairment', 'wwwwwwwwwww'),
(18, 'nisini', 'doctor 1', '2', 'speech_impairment', 'ee'),
(15, '13', 'doctor 2', '13', 'speech_impairment', 'owdnipock[pl]d;q'),
(25, 'qq', 'doctor 3', '6', 'other', 'qqqqqqqqqqq'),
(26, 'nisi', 'doctor 1', '2', 'physical_disability', 'eeee'),
(27, 'nisini', 'doctor 1', '23', 'speech_impairment', 'iuytrdsa'),
(28, 'nisini', 'doctor 1', '23', 'hearing_impairment', 'ttttttttttttt'),
(29, 'nisini', 'doctor 1', '23', 'speech_impairment', 'aaa'),
(30, 'nisini', 'doctor 1', '12', 'speech_impairment', 'rtyui'),
(31, 'nisini', 'doctor 1', '12', 'hearing_impairment', 'tryuio'),
(32, 'nisini', 'doctor 1', '12', 'hearing_impairment', 'gfhkjl;'),
(33, 'nisini', 'doctor 1', '12', 'speech_impairment', 'rtyjkl'),
(34, 'nisini', 'doctor 1', '23', 'speech_impairment', 'ghkp[');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` varchar(12) NOT NULL,
  `amount` varchar(12) NOT NULL,
  `status` varchar(20) NOT NULL,
  `therapist_id` varchar(12) NOT NULL,
  `guardian_id` varchar(12) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `payement_rela_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`payment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `patient_id`, `amount`, `status`, `therapist_id`, `guardian_id`, `date`, `time`, `payement_rela_time`) VALUES
(1, '12', '12', '12', '12', '12', '2024-11-24', '10:18:00', '2024-11-24 04:48:17'),
(2, '13', '13', '13', '14', '15', '2024-11-26', '10:19:00', '2024-11-24 04:49:57'),
(3, '11', '11', '11', '11', '11', '1111-11-11', '11:11:00', '2024-11-24 04:54:42'),
(4, '11', '11', '11', '11', '11', '1111-11-11', '11:11:00', '2024-11-24 04:55:22'),
(5, 'amasa', '1200', '11', '111', '111', '0011-11-11', '01:11:00', '2024-11-24 04:59:06'),
(6, 'amasa', '1200', '11', '111', '111', '2024-12-03', '10:39:00', '2024-11-24 05:03:57'),
(7, 'amasa', '1200', '11', '111', '111', '2024-11-30', '10:34:00', '2024-11-24 05:04:38'),
(8, 'amasa', '1200', '11', '111', '111', '2024-11-25', '12:12:00', '2024-11-24 08:27:01'),
(9, '11', '11', '111', '11', '11', '2024-11-18', '21:09:00', '2024-11-25 15:39:14'),
(10, 'amasa', '444', '12', 'hjkl;\'', 'tyuiop[', '2024-11-26', '06:10:00', '2024-11-26 00:40:43');

-- --------------------------------------------------------

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
CREATE TABLE IF NOT EXISTS `personal_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) NOT NULL,
  `speaciality` varchar(200) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone_number` int NOT NULL,
  `age` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_info`
--

INSERT INTO `personal_info` (`id`, `filename`, `name`, `speaciality`, `email`, `phone_number`, `age`) VALUES
(21, 'review2.jpg', 'thinal silva', 'ww', 'tttsss@gmail.com', 666666, 45),
(14, 'D1.jpeg', 'thinal silva', 'wwe champion twice thid', 'tttsss@gmail.com', 666666, 32),
(18, 'Vocal Vantage Logo.png', 'thinal silva', 'wwe champion', 'tttsss@gmail.com', 666666, 23);

-- --------------------------------------------------------

--
-- Table structure for table `platform_reports`
--

DROP TABLE IF EXISTS `platform_reports`;
CREATE TABLE IF NOT EXISTS `platform_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `role` enum('patient_child','patient_adult','patient_specialneeds','therapist') NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `special_note` varchar(155) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `platform_reports`
--

INSERT INTO `platform_reports` (`report_id`, `role`, `name`, `subject`, `description`, `special_note`) VALUES
(3, 'patient_adult', 'aaa', 'aaa', 'aaaaaaaaaaaaaaaa', 'zzzzzzzz'),
(1, 'patient_child', 'qafsG', 'l', 'k', 'k');

-- --------------------------------------------------------

--
-- Table structure for table `platform_reports_child`
--

DROP TABLE IF EXISTS `platform_reports_child`;
CREATE TABLE IF NOT EXISTS `platform_reports_child` (
  `report_id` int NOT NULL,
  `role` enum('patient_child','','','','') NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `special_note` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `platform_reports_child`
--

INSERT INTO `platform_reports_child` (`report_id`, `role`, `name`, `subject`, `description`, `special_note`) VALUES
(1, 'patient_child', 'qafsG', 'l', 'k', 'l');

-- --------------------------------------------------------

--
-- Table structure for table `platform_reports_special`
--

DROP TABLE IF EXISTS `platform_reports_special`;
CREATE TABLE IF NOT EXISTS `platform_reports_special` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `role` enum('patient_specealneeds','','','','') NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `special_note` varchar(100) NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `platform_reports_special`
--

INSERT INTO `platform_reports_special` (`report_id`, `role`, `name`, `subject`, `description`, `special_note`) VALUES
(1, 'patient_specealneeds', 'qafsG', 'l', 't', 't');

-- --------------------------------------------------------

--
-- Table structure for table `platform_reports_therapist`
--

DROP TABLE IF EXISTS `platform_reports_therapist`;
CREATE TABLE IF NOT EXISTS `platform_reports_therapist` (
  `report_id` int NOT NULL,
  `role` enum('therapist','','','','') NOT NULL,
  `name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `special_note` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `platform_reports_therapist`
--

INSERT INTO `platform_reports_therapist` (`report_id`, `role`, `name`, `subject`, `description`, `special_note`) VALUES
(1, 'therapist', 'qafsG', 'l', 'j', 'jk'),
(12, 'therapist', 'nisini', 'dddd', 'hhhhhhhhhhh', 'mmmmmmmm'),
(1, 'therapist', 'thinal silva', '55555gvgvjhk', 'qq', 'qqq');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '\r\n',
  `name` varchar(50) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(12) NOT NULL,
  `Conpassword` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` enum('patient_adult','patient_child','patient_specialneeds','therapist','admin','guardian') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `name`, `email`, `password`, `Conpassword`, `role`) VALUES
(63, 'thinal silva', 'tttsss@gmail.com', '12', 'ghjkl', 'guardian'),
(62, 'thinal silva', 'ss@gmail.com', '12', '12', 'guardian'),
(59, 'thinal silva', 's@gmail.com', '12', '12', 'patient_child'),
(58, 'thinal silva', 'tttsss@gmail.com', '12', 'qqq', 'guardian'),
(64, 'thinal silva', 'tttsss@gmail.com', '12', '12', 'guardian'),
(56, 'n', 'n@gmail.com', '12', '12', 'therapist');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_message`
--

DROP TABLE IF EXISTS `therapist_message`;
CREATE TABLE IF NOT EXISTS `therapist_message` (
  `Msg_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(50) NOT NULL,
  `therapist_name` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(255) NOT NULL,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Msg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `therapist_message`
--

INSERT INTO `therapist_message` (`Msg_id`, `patient_name`, `therapist_name`, `subject`, `message`, `sent_at`) VALUES
(8, 'nisini', 'wedfghbn', '55555gvgvjhk', 'jjj', '2024-11-23 16:18:55'),
(7, 'sandali', 'thinal', 'www', 'dddddddddd', '2024-11-23 09:55:47'),
(6, 'dfghm', 'dfghjk', 'erfhjk', 'ertyuiop[', '2024-11-19 03:45:58'),
(9, 'nisini', 'wedfghbn', '55555gvgvjhk', 'iii', '2024-11-25 15:10:11'),
(10, 'nisini', 'wedfghbn', '55555gvgvjhk', 'ttt', '2024-11-25 15:10:45'),
(11, 'nisini', 'wedfghbn', '55555gvgvjhk', 'tyyy', '2024-11-25 15:11:20'),
(12, 'nisini', 'wedfghbn', '55555gvgvjhk', 'mm', '2024-11-25 15:27:37'),
(13, 'nisini', 'wedfghbn', '55555gvgvjhk', 'tryguhiojpk', '2024-11-25 15:28:39'),
(14, 'dfghm,.', 'wedfghbn', '55555gvgvjhk', 'dfgthuio', '2024-11-26 00:43:54'),
(15, 'dfghm,.', 'wedfghbn', '55555gvgvjhk', 'dfghuipo', '2024-11-26 00:46:43');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_report`
--

DROP TABLE IF EXISTS `therapist_report`;
CREATE TABLE IF NOT EXISTS `therapist_report` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(100) NOT NULL,
  `therapist_name` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  `special_note` varchar(100) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`)
) ENGINE=MyISAM AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `therapist_report`
--

INSERT INTO `therapist_report` (`report_id`, `patient_name`, `therapist_name`, `subject`, `description`, `special_note`, `create_at`) VALUES
(1, 'nisini', 'wedfghbn', '55555gvgvjhk', 'ttt', 'ttt', '2024-11-25 15:10:34'),
(55, 'sandali', 'glii', 'ff', 'yyy', 'yyyiop', '2024-11-23 16:19:46'),
(12, 'sandali', 'thinal', 'launguage', 'eeeee', 'eeeee', '2024-11-23 09:54:03'),
(32, 'sandali', 'glii', 'ff', 'gggggggggg', 'vvvvvvvvvvvvvvv', '2024-11-23 09:53:21'),
(9, 'erfgh', 'wedfghbn', 'werfgh2', 'wergthj', 'werftghjm', '2024-11-19 02:40:24'),
(8, 'nisini', 'wedfghbn', '55555gvgvjhk', 'jjj', 'jjj', '2024-11-25 15:28:08'),
(70, 'nisini', '1', '1', '1', '1', '2024-11-26 00:47:23');

-- --------------------------------------------------------

--
-- Table structure for table `therapist_upload_video`
--

DROP TABLE IF EXISTS `therapist_upload_video`;
CREATE TABLE IF NOT EXISTS `therapist_upload_video` (
  `id` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) NOT NULL,
  `agegroup` enum('0-5','6-12','13-18','18+') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `therapycategory` enum('speech','language','cognitive','swallowing') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `videotitle` varchar(255) NOT NULL,
  `videodescription` varchar(255) NOT NULL,
  `upload_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `therapist_upload_video`
--

INSERT INTO `therapist_upload_video` (`id`, `filename`, `agegroup`, `therapycategory`, `videotitle`, `videodescription`, `upload_at`) VALUES
(21, 'activity_vid1 (1) (1) (1) (1).mp4', '6-12', 'language', 'edfghj', 'wertghyui', '2024-11-26 00:36:50'),
(22, 'activity_vid1 (1) (1) (1).mp4', '13-18', 'language', 'edfghj', 'wertghyui', '2024-11-26 00:37:06'),
(23, 'activity_vid4 (1) (1) (1).mp4', '6-12', 'language', 'edfghj', 'wertghyui', '2024-11-26 00:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `video_uploads`
--

DROP TABLE IF EXISTS `video_uploads`;
CREATE TABLE IF NOT EXISTS `video_uploads` (
  `Vid_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Vid_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
