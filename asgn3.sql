-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2016 at 09:18 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `asgn3`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prodId` int(11) NOT NULL,
  `prodName` varchar(50) NOT NULL,
  `prodPrice` float NOT NULL,
  `prodImg` varchar(200) NOT NULL,
  `prodDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prodId`, `prodName`, `prodPrice`, `prodImg`, `prodDesc`) VALUES
(1, 'Toshiba Laptop', 12.97, 'https://d3nevzfk7ii3be.cloudfront.net/igi/EMg4A4Zi4heoWnyy.large', 'This is a pretty shit laptop.'),
(2, 'Lenovo Laptop', 499.99, 'http://shop.lenovo.com/ISS_Static/WW/wci/products/us/tech-specs/laptop/thinkpad/x-series/x230/images/Notebook_X230.png', 'Pretty dope laptop.'),
(3, 'Leapfrog Laptop', 24.99, 'https://images-na.ssl-images-amazon.com/images/I/51lATpwjfNL._SY355_.jpg', 'The best of the two.');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `recordId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`recordId`, `prodId`, `rating`, `comment`) VALUES
(1, 1, 4, NULL),
(2, 1, 2, NULL),
(3, 1, 5, NULL),
(4, 1, 2, NULL),
(5, 2, 4, NULL),
(6, 2, 4, NULL),
(7, 2, 5, NULL),
(8, 2, 5, NULL),
(9, 2, 5, NULL),
(10, 3, 2, NULL),
(11, 3, 2, NULL),
(12, 3, 3, NULL),
(13, 3, 2, NULL),
(14, 3, 3, NULL),
(15, 1, 1, 'Shane''s crappy laptop');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `saleId` int(11) NOT NULL,
  `prodId` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`saleId`, `prodId`, `quantity`, `price`) VALUES
(1, 1, 3, 43.97),
(2, 2, 5, 2824.94),
(3, 3, 2, 56.48),
(4, 1, 1, 14.66),
(5, 2, 3, 1694.97),
(6, 3, 4, 112.95),
(7, 2, 1, 564.99),
(8, 1, 5, 73.28),
(9, 3, 17, 480.06);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prodId`),
  ADD KEY `prodId` (`prodId`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`recordId`),
  ADD KEY `prodId` (`prodId`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`saleId`),
  ADD KEY `prodId` (`prodId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `recordId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `saleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`prodId`) REFERENCES `products` (`prodId`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`prodId`) REFERENCES `products` (`prodId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
