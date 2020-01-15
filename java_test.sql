-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 15, 2020 at 07:46 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `class_record`
--

CREATE TABLE `class_record` (
  `id` int(11) NOT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_record`
--

INSERT INTO `class_record` (`id`, `class`) VALUES
(1, 'one'),
(2, 'two'),
(3, 'three'),
(4, 'four'),
(5, 'five'),
(6, 'six'),
(7, 'seven'),
(9, 'eight');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image`) VALUES
(1, 'color.jpg'),
(2, 'cover2.jpg'),
(66, 'class.jpg'),
(67, 'kids.jpg'),
(68, 'pencils.jpg'),
(69, 'school.jpg'),
(70, 'still.jpg'),
(71, 'logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `login_info`
--

CREATE TABLE `login_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_info`
--

INSERT INTO `login_info` (`id`, `name`, `password`) VALUES
(1, 'admin', 'admin'),
(3, 'adeel', 'adeel'),
(4, 'umair', 'umair'),
(9, 'jawad', 'jawad'),
(17, 'Adeel Ahmad', 'adeel'),
(21, 'James', 'james'),
(24, 'steven Smith', 'smith'),
(26, 'Atif', 'atif'),
(27, 'Aqsa Aslam', 'aqsa'),
(28, 'ace', '123'),
(29, 'Sajjad', '123'),
(34, 'usman', 'usman'),
(35, 'Ali', 'ali'),
(36, 'Waqas  Ali', 'waqas'),
(37, 'aslam', 'a'),
(38, 'Hafiz Usman', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `notification_record`
--

CREATE TABLE `notification_record` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` varchar(500) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification_record`
--

INSERT INTO `notification_record` (`id`, `title`, `detail`, `name`, `date`) VALUES
(4, 'Web Engineering Quiz ', 'There will be test and project evaluation in upcoming Lab so be prepare for that.', 'admin', '2020-01-06 13:58:32.793119'),
(5, 'DBA Quiz', 'There will be quiz and project evaluation in upcoming Lab so be prepare for that.', 'admin', '2020-01-10 10:39:38.376307'),
(6, 'OS Quiz', 'Next week we will hold OS Quiz Be prepared for that students and work hard to pass that.', 'admin', '2020-01-10 11:20:53.772774'),
(7, 'Psychology Lecture Makeup', 'There will be surprise mock quiz and project evaluation in upcoming Lecture so be prepare for that.', 'admin', '2020-01-13 12:56:44.182266'),
(10, 'Chemistry Test', 'Tomorrow is Chemsitry test be prepared for this students.', 'admin', '2020-01-13 18:12:05.108403'),
(11, 'Physics Test', 'Next weekend we will have a grand test of physics subject last 5 chapter.', 'admin', '2020-01-14 12:49:29.347379');

-- --------------------------------------------------------

--
-- Table structure for table `student_record`
--

CREATE TABLE `student_record` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `roll` varchar(255) NOT NULL,
  `class` varchar(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_record`
--

INSERT INTO `student_record` (`id`, `name`, `roll`, `class`, `phone`, `address`) VALUES
(1, 'Adeel Ahmad', 'BITF17M541', 'eight', '03001234567', 'University of Punjab, Lahore'),
(2, 'Muhammad Umair', 'BITF17M525', 'seven', '03001234567', 'University of Punjab, Lahore'),
(3, 'Shayan Asghar', 'BITF17M534', 'six', '03001234568', 'Street ABC,Lahore'),
(4, 'Junaid Ahmad', 'BITF17M519', 'five', '03001234569', 'Punjab University Information Technology'),
(6, 'Jawad Adil', 'bcsf16m516', 'one', '03001234560', 'Punjab University Information Technology'),
(10, 'Steven Smith', 'BITF17M542', 'four', '03001230072', 'Sydney Cricket Ground Australia'),
(11, 'Salman Tahir', 'BITF17M558', 'three', '03001239030', 'Okara Main City Chowk ABC'),
(14, 'Zeeshan Ali', 'BITF17M529', 'two', '03001234567', 'Peshawar');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_record`
--

CREATE TABLE `teacher_record` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher_record`
--

INSERT INTO `teacher_record` (`id`, `name`, `age`, `phone`, `address`) VALUES
(1, 'Azeem Tahir', '20years', '03001234567', 'Clifton,Karachi'),
(2, 'Tahir Hussain', '27 years', '03001234937', 'Karachi,Sindh'),
(3, 'Hasan Shakeel', '29 years', '03091224067', 'Canada Colony,Nankana'),
(4, 'Khalid Bangash', '24 years', '03339234560', 'F-7,Islamabad'),
(8, 'Jofra Archer', '24 Years', '03001234569', 'E71st London');

-- --------------------------------------------------------

--
-- Table structure for table `timetable_record`
--

CREATE TABLE `timetable_record` (
  `id` int(11) NOT NULL,
  `period_1` varchar(255) NOT NULL,
  `period_2` varchar(255) NOT NULL,
  `period_3` varchar(255) NOT NULL,
  `period_4` varchar(255) NOT NULL,
  `period_5` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timetable_record`
--

INSERT INTO `timetable_record` (`id`, `period_1`, `period_2`, `period_3`, `period_4`, `period_5`, `class`) VALUES
(1, 'physics', 'chemistry', 'math', 'english', 'biology', 'one'),
(3, 'biology', 'chemistry', 'Islamiyat', 'drawing', 'Sociology', 'two'),
(9, 'Urdu', 'Sociology', 'Psychology', 'Web-Engineering', 'Anatomy', 'three'),
(10, 'biology', 'chemistry', 'Islamiyat', 'Geography', 'Ethics', 'four');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class_record`
--
ALTER TABLE `class_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_info`
--
ALTER TABLE `login_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_record`
--
ALTER TABLE `notification_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_record`
--
ALTER TABLE `student_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_record`
--
ALTER TABLE `teacher_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timetable_record`
--
ALTER TABLE `timetable_record`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_record`
--
ALTER TABLE `class_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `login_info`
--
ALTER TABLE `login_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `notification_record`
--
ALTER TABLE `notification_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student_record`
--
ALTER TABLE `student_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `teacher_record`
--
ALTER TABLE `teacher_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `timetable_record`
--
ALTER TABLE `timetable_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
