-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 10:51 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cse_lab`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `comp` ()  select sum(COMPUTER) as tot_comp from computational_items$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_labs` ()  select lab_name,COMPUTER from computational_items$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lab` (IN `num` INT(10))  SELECT lab_name 
from computational_items 
where COMPUTER>num$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `basic_details`
--

CREATE TABLE `basic_details` (
  `lab_name` varchar(10) NOT NULL,
  `lab_incharge` varchar(50) NOT NULL,
  `area_of_specialization` varchar(250) NOT NULL,
  `no_of_lab` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `basic_details`
--

INSERT INTO `basic_details` (`lab_name`, `lab_incharge`, `area_of_specialization`, `no_of_lab`) VALUES
('201-202', 'Er. Sudhakar Kumar', 'Human Computer Interaction, Machine Learning, Software Engineering, Data Structures & Programming', 2),
('205-206', 'Dr. Varun Gupta', 'Deep Learning, Machine Learning, Big Data Analytics, Smart Grid, Software Engineering, Object-Orientation, ERP Systems, AMR Systems', 2),
('207', 'Dr. Sunita Prashar', 'Design & Analysis of Algorithm, Data Structures', 1),
('208', 'Dr. R.B. Patel', 'Mobile and Distributed Computing and Sensor Networks', 1),
('215', 'Dr. Sunil K. Singh', 'Reconfigurable Computing,High Performance Computing, Embedded System, Linux', 1),
('401', 'Dr. Ankit Gupta', 'Artificial Intelligence, Web Intelligence, Web Analytics, Multi Criteria Decision Making, Information Retrieval', 1),
('407', 'Dr. Amit Chhabra', 'Theory Of Computation, Compiler Design, Discrete Structure, Design , Analysis and Algorithm, Wireless Networks', 1),
('409A', 'Er. Animesh Singh', 'Image Processing, Software Engg., Computer System Architecture, C/C++', 1),
('409B', 'Dr. Gulshan Goyal', 'Digital Image Processing, Theory of Computation, Compiler Design, Design and Analysis of Algorithms, Research Methodology, Discrete Structures, Statistical Models for Computer Science, Software Engineering , C, C++, MATLAB', 1),
('409C', 'Dr. Sarabjeet Singh', 'High Performance Computing, Computer Graphics, C, C++, CUDA-C', 1),
('419', 'Dr. Dheerendra Singh', 'Cloud Computing, Web Engineering, Database systems, Operating Systems, Data Structures & Programming, UNIX \\ LINUX Shell Programming, C, C++', 1);

-- --------------------------------------------------------

--
-- Table structure for table `computational_items`
--

CREATE TABLE `computational_items` (
  `lab_name` varchar(10) NOT NULL,
  `COMPUTER` int(10) NOT NULL,
  `UPS` int(10) NOT NULL,
  `network_ports` int(10) NOT NULL,
  `PRINTER` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `computational_items`
--

INSERT INTO `computational_items` (`lab_name`, `COMPUTER`, `UPS`, `network_ports`, `PRINTER`) VALUES
('201-202', 20, 1, 28, 0),
('205-206', 22, 2, 24, 1),
('207', 21, 1, 26, 1),
('208', 20, 0, 20, 0),
('215', 17, 1, 23, 1),
('401', 20, 2, 22, 1),
('407', 24, 1, 24, 1),
('409A', 18, 0, 30, 0),
('409B', 19, 0, 0, 1),
('409C', 24, 0, 25, 1),
('419', 24, 1, 24, 1);

-- --------------------------------------------------------

--
-- Table structure for table `electrical_items`
--

CREATE TABLE `electrical_items` (
  `lab_name` varchar(10) NOT NULL,
  `fan` int(10) NOT NULL,
  `tube_light` int(10) NOT NULL,
  `AC` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `electrical_items`
--

INSERT INTO `electrical_items` (`lab_name`, `fan`, `tube_light`, `AC`) VALUES
('201-202', 9, 4, 5),
('205-206', 10, 10, 4),
('207', 12, 10, 3),
('208', 7, 7, 5),
('215', 12, 16, 5),
('401 ', 7, 7, 6),
('407', 8, 7, 5),
('409A', 11, 16, 6),
('409B', 2, 2, 2),
('409C', 14, 12, 4),
('419', 8, 7, 5);

-- --------------------------------------------------------

--
-- Table structure for table `furniture_count`
--

CREATE TABLE `furniture_count` (
  `lab_name` varchar(10) NOT NULL,
  `computer_table` int(10) NOT NULL,
  `chair` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `furniture_count`
--

INSERT INTO `furniture_count` (`lab_name`, `computer_table`, `chair`) VALUES
('201-202', 22, 27),
('205-206', 25, 32),
('207', 28, 33),
('208', 20, 24),
('215', 17, 21),
('401', 20, 30),
('407', 26, 25),
('409A', 18, 60),
('409B', 20, 23),
('409C', 25, 32),
('419', 26, 25);

--
-- Triggers `furniture_count`
--
DELIMITER $$
CREATE TRIGGER `insertlog` AFTER INSERT ON `furniture_count` FOR EACH ROW insert into log values(new.lab_name,'inserted',now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatelog` AFTER UPDATE ON `furniture_count` FOR EACH ROW insert into log values(new.lab_name,'updated',now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `lab_staff`
--

CREATE TABLE `lab_staff` (
  `ID` varchar(8) NOT NULL,
  `NAME` varchar(25) NOT NULL,
  `DESIGNATION` varchar(25) NOT NULL,
  `S.No.` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_staff`
--

INSERT INTO `lab_staff` (`ID`, `NAME`, `DESIGNATION`, `S.No.`) VALUES
('CSE01', 'Dr. Sunil K. Singh', 'Lab Incharge', 1),
('CSE02', 'Dr. R.B. Patel', 'Lab Incharge', 2),
('CSE03', 'Dr. Varun Gupta', 'Lab Incharge', 3),
('CSE04', 'Dr. Dheerendra Singh', 'Lab Incharge', 4),
('CSE05', 'Dr. Sarabjeet Singh', 'Lab Incharge', 5),
('CSE06', 'Dr. Gulshan Goyal', 'Lab Incharge', 6),
('CSE07', 'Dr. Sunita Prashar', 'Lab Incharge', 7),
('CSE08', 'Dr. Ankit Gupta', 'Lab Incharge', 8),
('CSE09', 'Er. Sudhakar Kumar', 'Lab Incharge', 9),
('CSE10', 'Dr. Amit Chhabra', 'Lab Incharge', 10),
('CSE11', 'Er. Animesh Singh', 'Lab Incharge', 11),
('CSOS01', 'Ms. Garima', 'Computer Asstt', 12),
('CSOS02', 'Ms. Shaveta Goyal', 'Programmer', 13),
('CSTS08', 'Ms Mokesh Kumari', 'Lab Asstt', 19),
('CSTS11', 'Mr Yuvraj Singh', 'Lab Asstt', 20),
('ECTS05', 'Sh. Harmeet Singh', 'Common Lab Technician', 21),
('NULL', 'Ram Naresh', 'Supporting Staff', 22),
('NULL', 'Dilip Kumar', 'Supporting Staff', 23);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `lab` varchar(10) NOT NULL,
  `action` varchar(10) NOT NULL,
  `date_time` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`lab`, `action`, `date_time`) VALUES
('A1', 'inserted', '2020-12-07 23:01:29'),
('100', 'inserted', '2021-03-12 13:53:08');

-- --------------------------------------------------------

--
-- Table structure for table `presenting_items`
--

CREATE TABLE `presenting_items` (
  `lab_name` varchar(10) NOT NULL,
  `white_board` int(10) NOT NULL,
  `notice_board` int(10) NOT NULL,
  `digital_projector` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `presenting_items`
--

INSERT INTO `presenting_items` (`lab_name`, `white_board`, `notice_board`, `digital_projector`) VALUES
('201-202', 0, 1, 0),
('205-206', 1, 0, 1),
('207', 0, 0, 0),
('208', 1, 1, 0),
('215', 1, 1, 1),
('401', 0, 0, 0),
('407', 1, 1, 1),
('409A', 1, 0, 1),
('409B', 0, 0, 0),
('409C', 1, 0, 0),
('419', 1, 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `basic_details`
--
ALTER TABLE `basic_details`
  ADD PRIMARY KEY (`lab_name`);

--
-- Indexes for table `computational_items`
--
ALTER TABLE `computational_items`
  ADD PRIMARY KEY (`lab_name`);

--
-- Indexes for table `electrical_items`
--
ALTER TABLE `electrical_items`
  ADD PRIMARY KEY (`lab_name`);

--
-- Indexes for table `furniture_count`
--
ALTER TABLE `furniture_count`
  ADD PRIMARY KEY (`lab_name`);

--
-- Indexes for table `lab_staff`
--
ALTER TABLE `lab_staff`
  ADD PRIMARY KEY (`S.No.`);

--
-- Indexes for table `presenting_items`
--
ALTER TABLE `presenting_items`
  ADD PRIMARY KEY (`lab_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
