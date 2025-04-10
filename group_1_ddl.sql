-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2025 at 05:25 PM
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
-- Database: `group_1_ddl`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orders`
--

CREATE TABLE `tbl_orders` (
  `Order_ID` int(10) NOT NULL,
  `Employee_ID` int(10) NOT NULL,
  `Customer_ID` int(10) NOT NULL,
  `Customer` varchar(100) DEFAULT NULL,
  `Order_Date` date DEFAULT NULL,
  `Shipped_Date` date DEFAULT NULL,
  `Shipper_ID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `Product_ID` int(10) NOT NULL,
  `Order_ID` int(10) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Unit_Price` decimal(10,2) NOT NULL,
  `Discount` decimal(5,2) NOT NULL,
  `Status_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `ID` int(11) NOT NULL,
  `Product_Code` varchar(50) NOT NULL,
  `Product_Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Standard_Cost` decimal(10,2) NOT NULL,
  `List_Price` decimal(10,2) NOT NULL,
  `Reorder_Level` int(11) DEFAULT NULL,
  `Target_Level` int(11) DEFAULT NULL,
  `QuantityPer_Unit` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_orders`
--
ALTER TABLE `tbl_orders`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`Product_ID`) REFERENCES `tbl_product` (`ID`),
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`Order_ID`) REFERENCES `tbl_orders` (`Order_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
