-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2016 at 03:04 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `Bill_ID` int(11) NOT NULL,
  `Billing_date` date DEFAULT NULL,
  `Paid` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`Bill_ID`, `Billing_date`, `Paid`) VALUES
(10001, '2016-01-03', 'yes'),
(10002, '2016-03-03', 'yes'),
(10003, '2016-03-22', 'yes'),
(10004, NULL, 'no'),
(10005, '2016-02-09', 'yes'),
(10006, '2016-02-12', 'yes');

-- --------------------------------------------------------

--
-- Stand-in structure for view `booked_rooms`
--
CREATE TABLE `booked_rooms` (
`Room_ID` int(11)
,`Capacity` int(11)
,`Type_ID` int(11)
,`F_Name` varchar(24)
,`L_Name` varchar(24)
,`Res_ID` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `Guest_ID` int(11) NOT NULL,
  `F_Name` varchar(24) DEFAULT NULL,
  `L_Name` varchar(24) DEFAULT NULL,
  `Email` varchar(24) DEFAULT NULL,
  `Contact_No` varchar(24) DEFAULT NULL,
  `Address` varchar(24) DEFAULT NULL,
  `DOB` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`Guest_ID`, `F_Name`, `L_Name`, `Email`, `Contact_No`, `Address`, `DOB`) VALUES
(101, 'Micheal', 'Smith', 'JS@hotmail.com', '555 1234', 'Galway', '1987-11-15'),
(102, 'Amy', 'Mulroy', 'AM@hotmail.com', '085 7768432', 'Dublin', '1991-06-15'),
(103, 'Kevin', 'Ryder', 'KR@hotmail.com', '086 5893573', 'Mayo', '1980-02-16'),
(104, 'Valerie', 'Johns', 'VJ@hotmail.com', NULL, 'Carlow', '1960-05-19'),
(105, 'Rachel', 'Adams', 'RA@hotmail.com', '086 5664441', 'Meath', '1970-07-01'),
(106, 'Peter', 'Smith', 'PS@hotmail.com', '874424974', 'Clare', '1957-12-01'),
(107, 'Liam', 'Murphy', 'PM@hotmail.com', '0857768246', 'Sligo', '1976-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `Res_ID` int(11) NOT NULL,
  `Guest_ID` int(11) NOT NULL,
  `Room_ID` int(11) NOT NULL,
  `Check_in` date DEFAULT NULL,
  `Check_out` date DEFAULT NULL,
  `Guest_num` int(11) DEFAULT NULL,
  `Bill_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`Res_ID`, `Guest_ID`, `Room_ID`, `Check_in`, `Check_out`, `Guest_num`, `Bill_ID`) VALUES
(1001, 101, 10, '2016-01-01', '2016-01-03', 2, 10001),
(1002, 102, 22, '2016-03-03', '2016-03-10', 3, 10002),
(1003, 103, 31, '2016-03-22', '2016-03-26', 4, 10003),
(1004, 104, 20, '2016-01-12', '2016-01-14', 2, 10004),
(1005, 105, 33, '2016-02-09', '2016-02-13', 3, 10005),
(1006, 106, 34, '2016-02-15', '2016-02-18', 3, 10006);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `Room_ID` int(11) NOT NULL,
  `Type_ID` int(11) NOT NULL,
  `Capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`Room_ID`, `Type_ID`, `Capacity`) VALUES
(10, 1, 2),
(11, 1, 2),
(12, 1, 2),
(13, 1, 2),
(14, 1, 2),
(15, 1, 2),
(20, 2, 3),
(21, 2, 3),
(22, 2, 3),
(23, 2, 3),
(24, 2, 3),
(25, 2, 3),
(30, 3, 4),
(31, 3, 4),
(32, 3, 4),
(33, 3, 4),
(34, 3, 4),
(35, 3, 4);

-- --------------------------------------------------------

--
-- Table structure for table `room_type`
--

CREATE TABLE `room_type` (
  `Type_ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `Description` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room_type`
--

INSERT INTO `room_type` (`Type_ID`, `Price`, `Description`) VALUES
(1, 100, 'Double'),
(2, 150, 'Triple'),
(3, 200, 'Four Bed');

-- --------------------------------------------------------

--
-- Structure for view `booked_rooms`
--
DROP TABLE IF EXISTS `booked_rooms`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `booked_rooms`  AS  select `room`.`Room_ID` AS `Room_ID`,`room`.`Capacity` AS `Capacity`,`room`.`Type_ID` AS `Type_ID`,`guest`.`F_Name` AS `F_Name`,`guest`.`L_Name` AS `L_Name`,`reservation`.`Res_ID` AS `Res_ID` from ((`room` join `guest`) join `reservation`) where ((`reservation`.`Guest_ID` = `guest`.`Guest_ID`) and (`reservation`.`Room_ID` = `room`.`Room_ID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`Bill_ID`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`Guest_ID`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`Res_ID`),
  ADD KEY `Guest_ID` (`Guest_ID`),
  ADD KEY `Room_ID` (`Room_ID`),
  ADD KEY `Bill_ID` (`Bill_ID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`Room_ID`),
  ADD KEY `Type_ID` (`Type_ID`);

--
-- Indexes for table `room_type`
--
ALTER TABLE `room_type`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`Guest_ID`) REFERENCES `guest` (`Guest_ID`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`Room_ID`) REFERENCES `room` (`Room_ID`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`Bill_ID`) REFERENCES `billing` (`Bill_ID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`Type_ID`) REFERENCES `room_type` (`Type_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
