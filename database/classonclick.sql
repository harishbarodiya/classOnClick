-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 12, 2020 at 07:30 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classonclick`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(255) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(50) NOT NULL,
  `section` varchar(1) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `section`) VALUES
(1, 'MCA-4th sem', 'A'),
(2, 'MCA-4th sem', 'B'),
(3, 'MCA-4th sem', 'C'),
(12, 'MCA-3rd sem', 'A'),
(13, 'MCA-3rd sem', 'B'),
(14, 'MCA-2nd sem', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `class_link`
--

DROP TABLE IF EXISTS `class_link`;
CREATE TABLE IF NOT EXISTS `class_link` (
  `date` date NOT NULL,
  `period` varchar(50) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  `class_id` int(255) NOT NULL,
  `link` varchar(1000) NOT NULL,
  PRIMARY KEY (`date`,`period`,`course_code`,`class_id`),
  KEY `course_code` (`course_code`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_link`
--

INSERT INTO `class_link` (`date`, `period`, `course_code`, `class_id`, `link`) VALUES
('2020-09-12', '01:00 PM to 02:00 PM', 'C101', 1, 'hhhhhhhhhhhh'),
('2020-09-12', '08:30 AM to 09:30 AM', 'C101', 1, 'link for lecture1 .com'),
('2020-09-12', '09:30 AM to 10:30 AM', 'C105', 14, '105 link'),
('2020-09-13', '01:00 PM to 02:00 PM', 'C102', 1, 'https://www.google.com/search?q=google&oq=goog&aqs=chrome.0.69i59j69i65l3j69i60j69i57j69i60.1886j0j7&sourceid=chrome&ie=UTF-8'),
('2020-09-13', '08:30 AM to 09:30 AM', 'C101', 1, 'http://localhost:8084/ClassOnClick/scheduleclass.jsp?date=2020-09-13&course=C101'),
('2020-09-13', '09:30 AM to 10:30 AM', 'C104', 1, 'https://www.google.com/search?q=google&oq=goog&aqs=chrome.0.69i59j69i65l3j69i60j69i57j69i60.1886j0j7&sourceid=chrome&ie=UTF-8'),
('2020-09-13', '10:30 AM to 11:30 AM', 'C108', 1, 'https://www.google.com/search?q=google&oq=goog&aqs=chrome.0.69i59j69i65l3j69i60j69i57j69i60.1886j0j7&sourceid=chrome&ie=UTF-8'),
('2020-09-13', '11:30 AM to 12:30 PM', 'C109', 1, 'https://www.google.com/search?q=google&oq=goog&aqs=chrome.0.69i59j69i65l3j69i60j69i57j69i60.1886j0j7&sourceid=chrome&ie=UTF-8');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_code` varchar(20) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  PRIMARY KEY (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course_code`, `course_name`) VALUES
('C101', 'Java'),
('C102', 'Artificial Intelligence'),
('C103', 'C++'),
('C104', 'Data algorithm and analysis'),
('C105', 'Theory of computation'),
('C106', 'Software Engineering'),
('C107', 'Computer Network'),
('C108', 'ADBMS'),
('C109', 'Cyber Security'),
('C110', 'Software Testing');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `enrollment` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `father` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `class_id` int(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`enrollment`),
  KEY `enrollment` (`enrollment`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`enrollment`, `name`, `father`, `dob`, `class_id`, `password`) VALUES
('101', 'Harish barodiya', 'Sunil barodiya', '1997-09-16', 1, 'harish'),
('102', 'Ashwini Singh Thakur', '', '2020-07-01', 1, 'ashwini'),
('103', 'Kratika Bhagat', '', '2020-07-01', 1, 'kratika'),
('104', 'name4', '', '2020-07-01', 2, 'password'),
('105', 'name5', '', '2020-07-01', 2, 'password'),
('106', 'name6', '', '2020-07-01', 3, 'password'),
('107', 'name7', '', '2020-07-01', 3, 'password'),
('108', 'name8', '', '2020-07-01', 12, 'password'),
('109', 'name9', '', '2020-07-01', 12, 'password'),
('110', 'name10', '', '2020-07-01', 13, 'password'),
('111', 'name4', '', '2020-07-01', 13, 'password'),
('112', 'name5', '', '2020-07-01', 14, 'password'),
('113', 'name6', '', '2020-07-01', 14, 'password'),
('114', 'name7', '', '2020-07-01', 14, 'password'),
('115', 'name8', '', '2020-07-01', 1, 'password'),
('116', 'name9', '', '2020-07-01', 1, 'password'),
('117', 'name10', '', '2020-07-01', 2, 'password'),
('118', 'name4', '', '2020-07-01', 2, 'password'),
('119', 'name5', '', '2020-07-01', 3, 'password'),
('120', 'name6', '', '2020-07-01', 3, 'password'),
('121', 'name7', '', '2020-07-01', 3, 'password'),
('122', 'name8', '', '2020-07-01', 12, 'password'),
('123', 'name9', '', '2020-07-01', 13, 'password'),
('124', 'name10', '', '2020-07-01', 14, 'password');

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
CREATE TABLE IF NOT EXISTS `study` (
  `enrollment` varchar(20) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  PRIMARY KEY (`enrollment`,`course_code`),
  KEY `enrollment` (`enrollment`,`course_code`),
  KEY `course_code` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `study`
--

INSERT INTO `study` (`enrollment`, `course_code`) VALUES
('101', 'C101'),
('101', 'C102'),
('101', 'C104'),
('101', 'C108'),
('101', 'C109'),
('102', 'C101'),
('103', 'C101'),
('111', 'C104'),
('111', 'C105');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `t_id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `mobile` int(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`t_id`),
  KEY `t_id` (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`t_id`, `name`, `department`, `mobile`, `email`, `password`) VALUES
('101', 'teacher1', 'dept1', 99999, 'teacher1@xyz.com', 'teacher'),
('102', 'teacher2', 'dept2', 99999, 'teacher2@xyz.com', 'teacher2'),
('103', 'teacher3', 'dept3', 99999, 'teacher3@xyz.com', 'teacher3'),
('104', 'teacher4', 'dept4', 99999, 'teacher4@xyz.com', 'teacher4'),
('105', 'teacher5', 'dept5', 99999, 'teacher5@xyz.com', 'teacher5'),
('106', 'teacher6', 'dept6', 99999, 'teacher6@xyz.com', 'teacher6'),
('107', 'teacher7', 'dept7', 99999, 'teacher7@xyz.com', 'teacher7'),
('108', 'teacher8', 'dept8', 99999, 'teacher8@xyz.com', 'teacher8'),
('109', 'teacher9', 'dept9', 99999, 'teacher9@xyz.com', 'teacher9');

-- --------------------------------------------------------

--
-- Table structure for table `teaches1`
--

DROP TABLE IF EXISTS `teaches1`;
CREATE TABLE IF NOT EXISTS `teaches1` (
  `t_id` varchar(50) NOT NULL,
  `class_id` int(255) NOT NULL,
  `course_code` varchar(20) NOT NULL,
  KEY `t_id` (`t_id`,`class_id`,`course_code`),
  KEY `class_id` (`class_id`),
  KEY `course_code` (`course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teaches1`
--

INSERT INTO `teaches1` (`t_id`, `class_id`, `course_code`) VALUES
('101', 1, 'C101'),
('101', 14, 'C105'),
('102', 1, 'C104'),
('103', 1, 'C108'),
('104', 1, 'C109'),
('105', 2, 'C101'),
('109', 1, 'C102');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_link`
--
ALTER TABLE `class_link`
  ADD CONSTRAINT `class_link_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_link_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `study_ibfk_1` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `study_ibfk_2` FOREIGN KEY (`enrollment`) REFERENCES `student` (`enrollment`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `teaches1`
--
ALTER TABLE `teaches1`
  ADD CONSTRAINT `teaches1_ibfk_1` FOREIGN KEY (`t_id`) REFERENCES `teacher` (`t_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches1_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teaches1_ibfk_3` FOREIGN KEY (`course_code`) REFERENCES `course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
