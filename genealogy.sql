-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2017 at 06:13 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mlm`
--

-- --------------------------------------------------------

--
-- Table structure for table `genealogy`
--

CREATE TABLE `genealogy` (
  `gen_aid` bigint(20) NOT NULL,
  `gen_user_num_id` bigint(20) NOT NULL,
  `gen_parent_user_num_id` bigint(20) NOT NULL,
  `gen_alphauserid` varchar(100) NOT NULL,
  `gen_alphaparentid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `genealogy`
--

INSERT INTO `genealogy` (`gen_aid`, `gen_user_num_id`, `gen_parent_user_num_id`, `gen_alphauserid`, `gen_alphaparentid`) VALUES
(1, 1, 0, 'user1', 'user0'),
(2, 2, 1, 'user2', 'user1'),
(3, 3, 1, 'user3', 'user1'),
(4, 4, 2, 'user4', 'user2'),
(5, 5, 2, 'user5', 'user2'),
(6, 6, 3, 'user6', 'user3'),
(7, 7, 5, 'user7', 'user5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `genealogy`
--
ALTER TABLE `genealogy`
  ADD PRIMARY KEY (`gen_aid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `genealogy`
--
ALTER TABLE `genealogy`
  MODIFY `gen_aid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
