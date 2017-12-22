-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2017 at 11:01 AM
-- Server version: 10.1.23-MariaDB-9+deb9u1
-- PHP Version: 7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SmartSoft`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cess Class`
--

CREATE TABLE `Cess Class` (
  `Cess ID` int(11) NOT NULL,
  `Cess Percentage` decimal(10,2) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Cess Class`
--

INSERT INTO `Cess Class` (`Cess ID`, `Cess Percentage`, `Description`) VALUES
(0, '0.00', 'Unknown'),
(1, '0.00', 'Cess Free');

-- --------------------------------------------------------

--
-- Table structure for table `Company Bank Accounts`
--

CREATE TABLE `Company Bank Accounts` (
  `Account ID` int(10) NOT NULL,
  `Account Identifier` varchar(50) NOT NULL,
  `Entity Name` varchar(50) NOT NULL,
  `Holder Name` varchar(50) NOT NULL,
  `Bank Name` varchar(50) NOT NULL,
  `Account Number` varchar(20) NOT NULL,
  `IFSC Code` varchar(15) NOT NULL,
  `Notes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Company Employee`
--

CREATE TABLE `Company Employee` (
  `Employee ID` int(10) NOT NULL,
  `First Name` varchar(20) NOT NULL,
  `Last Name` varchar(20) NOT NULL,
  `Gender` enum('Male','Female','Other','') NOT NULL,
  `Date of Birth` date NOT NULL,
  `Aadhar Number` varchar(12) DEFAULT NULL,
  `PAN Number` varchar(11) DEFAULT NULL,
  `Email` varchar(30) NOT NULL,
  `Company Mail` varchar(30) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Pin Code` int(10) DEFAULT NULL,
  `Bank Account ID` int(11) DEFAULT NULL,
  `Position` varchar(20) NOT NULL,
  `Access Level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Credit Debit Note`
--

CREATE TABLE `Credit Debit Note` (
  `Note ID` int(11) NOT NULL,
  `Note Number` varchar(30) NOT NULL,
  `Note Date` date NOT NULL,
  `Note Type` enum('Unknown','Credit','Debit') NOT NULL DEFAULT 'Unknown',
  `Note Reason` enum('Unknown','01-Sales Return','02-Post Sale Discount','03-Deficiency in services','04-Correction in Invoice','05-Change in POS','06-Finalization of Provisional assessment','07-Others') NOT NULL DEFAULT 'Unknown',
  `Invoice Number` varchar(30) NOT NULL,
  `Invoice Date` date NOT NULL,
  `Vendor ID` int(11) NOT NULL,
  `Supplier State ID` int(11) NOT NULL,
  `Place of Supply State ID` int(11) NOT NULL,
  `Total Taxable Value` decimal(15,2) NOT NULL,
  `Total Discount` decimal(15,2) NOT NULL,
  `CGST` decimal(15,2) NOT NULL,
  `SGST` decimal(15,2) NOT NULL,
  `IGST` decimal(15,2) NOT NULL,
  `UGST` decimal(15,2) NOT NULL,
  `Cess Amount` decimal(15,2) NOT NULL,
  `Total Tax Amount` decimal(15,2) NOT NULL,
  `Round Off` decimal(15,2) NOT NULL,
  `Total Amount` decimal(15,2) NOT NULL,
  `Reverse Charge` enum('N','Y') NOT NULL DEFAULT 'N',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Credit Debit Note Products`
--

CREATE TABLE `Credit Debit Note Products` (
  `Note Item ID` int(11) NOT NULL,
  `Note ID` int(11) NOT NULL,
  `Item ID` int(11) NOT NULL,
  `HSN Code` varchar(10) NOT NULL,
  `Item Type` enum('Unknown','Goods','Services') NOT NULL DEFAULT 'Unknown',
  `Unit Price` decimal(15,2) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Unit ID` int(11) NOT NULL DEFAULT '59',
  `Discount` decimal(15,2) NOT NULL,
  `Taxable Value` decimal(15,2) NOT NULL,
  `GST ID` int(11) NOT NULL,
  `CGST` decimal(15,2) NOT NULL,
  `SGST` decimal(15,2) NOT NULL,
  `IGST` decimal(15,2) NOT NULL,
  `UGST` decimal(15,2) NOT NULL,
  `Cess ID` int(11) NOT NULL DEFAULT '0',
  `Cess Amount` decimal(15,2) NOT NULL,
  `Tax Amount` decimal(15,2) NOT NULL,
  `Total Product Amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CustomerBase`
--

CREATE TABLE `CustomerBase` (
  `Customer ID` int(11) NOT NULL,
  `Customer Name` varchar(30) NOT NULL,
  `Phone No.` varchar(20) DEFAULT NULL,
  `Email ID` varchar(40) DEFAULT NULL,
  `Address` varchar(300) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State ID` int(11) NOT NULL,
  `Country` varchar(20) NOT NULL,
  `Pin Code` varchar(8) NOT NULL,
  `Alternate Phone No` varchar(20) DEFAULT NULL,
  `Source` enum('unknown','smartsmith.in','amazon.in','snapdeal','flipkart','ebay') NOT NULL DEFAULT 'unknown',
  `Remarks` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Customer Sales Data`
--

CREATE TABLE `Customer Sales Data` (
  `Sales ID` int(11) NOT NULL,
  `Customer ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Ecommerce Vendor`
--

CREATE TABLE `Ecommerce Vendor` (
  `Ecommerce Vendor ID` int(11) NOT NULL,
  `Ecommerce Vendor GSTIN` varchar(20) NOT NULL,
  `Ecommerce Vendor Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Expense Register`
--

CREATE TABLE `Expense Register` (
  `Expense ID` int(11) NOT NULL,
  `Invoice Date` date NOT NULL,
  `Invoice Number` varchar(30) NOT NULL,
  `Purpose` varchar(100) NOT NULL,
  `Taxable Amount` decimal(15,2) NOT NULL,
  `Expense Class` enum('Unknown','Direct','Indirect','') NOT NULL,
  `Expense Type` enum('Unknown','Company Expense','Graphic Design','Sample Product Payment','Custom Duty Payment','Others') NOT NULL,
  `Payment Mode` enum('Unknown','Bank Account Transfer','Credit Card','Debit Card','PayPal','Cash Payment','Cheque','Demand Draft','Paytm Wallet Transfer') NOT NULL,
  `Vendor ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GST Class`
--

CREATE TABLE `GST Class` (
  `GST ID` int(11) NOT NULL,
  `GST Percentage` decimal(6,3) NOT NULL DEFAULT '0.000',
  `CGST` decimal(6,3) NOT NULL DEFAULT '0.000',
  `SGST` decimal(6,3) NOT NULL DEFAULT '0.000',
  `UGST` decimal(6,3) NOT NULL DEFAULT '0.000',
  `IGST` decimal(6,3) NOT NULL DEFAULT '0.000',
  `Description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GST Class`
--

INSERT INTO `GST Class` (`GST ID`, `GST Percentage`, `CGST`, `SGST`, `UGST`, `IGST`, `Description`) VALUES
(0, '0.000', '0.000', '0.000', '0.000', '0.000', 'UNKNOWN'),
(1, '0.000', '0.000', '0.000', '0.000', '0.000', 'GST Free'),
(2, '0.250', '0.125', '0.125', '0.125', '0.250', '0.25% GST Slab'),
(3, '3.000', '1.500', '1.500', '1.500', '3.000', '3% GST Slab'),
(4, '5.000', '2.500', '2.500', '2.500', '5.000', '5% GST Slab'),
(5, '12.000', '6.000', '6.000', '6.000', '12.000', '12% GST Slab'),
(6, '18.000', '9.000', '9.000', '9.000', '18.000', '18% GST Slab'),
(7, '28.000', '14.000', '14.000', '14.000', '28.000', '28% GST Slab');

-- --------------------------------------------------------

--
-- Table structure for table `GSTR1_B2B`
--

CREATE TABLE `GSTR1_B2B` (
  `Invoice Number` varchar(20) DEFAULT NULL,
  `Invoice Date` date DEFAULT NULL,
  `Invoice Type` enum('B2B','B2C') DEFAULT NULL,
  `Total Product Amount` decimal(15,2) DEFAULT NULL,
  `GST Percentage` decimal(6,3) DEFAULT NULL,
  `State Tax Code` varchar(50) DEFAULT NULL,
  `Taxable Value` decimal(15,2) DEFAULT NULL,
  `Cess Amount` decimal(15,2) DEFAULT NULL,
  `Sales Type` enum('E-Commerce','Other Than E-Commerce') DEFAULT NULL,
  `Ecommerce Vendor GSTIN` varchar(20) DEFAULT NULL,
  `Place of Supply State ID` int(11) DEFAULT NULL,
  `Supplier State ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `GSTR1_B2C`
--

CREATE TABLE `GSTR1_B2C` (
  `Invoice Number` varchar(20) DEFAULT NULL,
  `Invoice Date` date DEFAULT NULL,
  `Invoice Type` enum('B2B','B2C') DEFAULT NULL,
  `Total Product Amount` decimal(15,2) DEFAULT NULL,
  `GST Percentage` decimal(6,3) DEFAULT NULL,
  `State Tax Code` varchar(50) DEFAULT NULL,
  `Taxable Value` decimal(15,2) DEFAULT NULL,
  `Cess Amount` decimal(15,2) DEFAULT NULL,
  `Sales Type` enum('E-Commerce','Other Than E-Commerce') DEFAULT NULL,
  `Ecommerce Vendor GSTIN` varchar(20) DEFAULT NULL,
  `Place of Supply State ID` int(11) DEFAULT NULL,
  `Supplier State ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `HSN Directory`
--

CREATE TABLE `HSN Directory` (
  `HSN Code` varchar(10) NOT NULL,
  `GST ID` int(11) NOT NULL DEFAULT '0',
  `Cess ID` int(11) NOT NULL DEFAULT '1',
  `Item Type` enum('Unknown','Goods','Services') NOT NULL DEFAULT 'Unknown',
  `Description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `HSN Directory`
--

INSERT INTO `HSN Directory` (`HSN Code`, `GST ID`, `Cess ID`, `Item Type`, `Description`) VALUES
('00000000', 0, 0, 'Unknown', 'UNKNOWN'),
('22011010', 0, 1, 'Goods', 'Mineral Water'),
('4819', 5, 1, 'Goods', 'Cartons, boxes and cases of corrugated paper or paper board'),
('8443', 6, 1, 'Goods', 'HP 1020 Plus Single-Function Laser Printer '),
('8471', 6, 1, 'Goods', 'GENERAL ACC COMPUTER GOODS-MOUSE PAD '),
('84716040', 6, 1, 'Goods', 'Key Board Circle Combo Rover'),
('8473', 6, 1, 'Goods', 'Cabinet Circle MIX MODEL'),
('84733030', 6, 1, 'Goods', 'Ram Silicon Power 4gb & 8gb Ddr4'),
('84733091', 6, 1, 'Goods', 'Usb Adaptor'),
('85171190', 6, 1, 'Goods', 'Motorola Black Cordless And Corded Phone '),
('85176930', 6, 1, 'Goods', 'Router Tp-link Tl-wr840n'),
('85238020', 6, 1, 'Unknown', 'Tally.ERP 9 Silver'),
('85258090', 6, 1, 'Goods', 'Other Cameras (CCTV Camera)'),
('85285200', 6, 1, 'Goods', 'Led Monitor Dell'),
('8544', 6, 1, 'Goods', 'USB Cable'),
('996425', 4, 1, 'Services', 'Air Travel And Related Charges'),
('996729', 6, 1, 'Services', 'storage and warehousing services'),
('996812', 6, 1, 'Services', 'Courier services'),
('998313 ', 6, 1, 'Services', 'Amazon Sponsored Ads '),
('998365', 6, 1, 'Services', 'Sale of Internet advertising space'),
('998552', 6, 1, 'Services', 'Hotel Room Booking '),
('998599', 6, 1, 'Services', 'Other support services n.e.c.');

-- --------------------------------------------------------

--
-- Table structure for table `Item Master`
--

CREATE TABLE `Item Master` (
  `Item ID` int(11) NOT NULL,
  `SKU Code` varchar(15) NOT NULL,
  `Item Name` varchar(50) NOT NULL,
  `Item Type` enum('Unknown','Goods','Services') NOT NULL,
  `HSN Code` varchar(10) NOT NULL DEFAULT '00000000',
  `Unit ID` int(11) NOT NULL DEFAULT '0',
  `Details` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Item Master`
--

INSERT INTO `Item Master` (`Item ID`, `SKU Code`, `Item Name`, `Item Type`, `HSN Code`, `Unit ID`, `Details`) VALUES
(1, '8944638557227', 'Type C to USB A 3.1 Cable 1M Nylon Braided', 'Goods', '8544', 59, '1M Nylon Braided'),
(2, '8944638557234', 'Type C to USB A 3.1 Cable 1M Nylon Braided', 'Goods', '8544', 59, '1M Nylon Braided'),
(3, '8944638557241', 'Type C to USB A 3.1 Cable 1M Nylon Braided', 'Goods', '8544', 59, '1M Nylon Braided'),
(4, '8944638557258', '2 USB Car Chrarger 3.1A', 'Goods', '00000000', 59, '3.1A , 2USB'),
(5, '8944638557265', '2 USB Car Chrarger 3.1A', 'Goods', '00000000', 59, '3.1A , 2USB'),
(6, '8944638557272', '2 USB Car Chrarger 3.1A', 'Goods', '00000000', 59, '3.1A , 2USB'),
(7, '4811210164002', 'USB micro Cable', 'Goods', '8544', 59, 'USB Micro Cable 1.5M'),
(8, '4811210164019', 'USB Micro Cable', 'Goods', '8544', 59, '1.5M'),
(9, '4811210164026', 'USB Lightning Cable', 'Goods', '8544', 59, 'Lightening Cable 1.5M'),
(10, '4811210164033', 'USB Lightning Cable', 'Goods', '8544', 59, 'Lightening Cable 1.5M'),
(11, '4811210164033', '2 in 1 USB Micro Lightning Cable', 'Goods', '8544', 59, 'Nylon Braided, 2 in 1 Cable, Lightening + Micro, 1.5M'),
(12, '4811210164057', '2 in 1 USB Micro Lightning Cable', 'Goods', '8544', 59, 'Nylon Braided, 2 in 1 Cable, Lightening + Micro, 1.5M'),
(13, '4811210164064', 'LCD Writing Tablet 8.5\"', 'Goods', '00000000', 59, 'LCD Writing Tablet. Size : 8.5\"'),
(14, '4811210164071', 'LCD Writing Tablet 8.5\"', 'Goods', '00000000', 59, 'LCD Writing Tablet. Size : 8.5\"'),
(15, '4811210164088', 'LCD Writing Tablet 8.5\"', 'Goods', '00000000', 59, 'LCD Writing Tablet. Size : 8.5\"'),
(16, '4811210164095', 'LCD Writing Tablet 8.5\"', 'Goods', '00000000', 59, 'LCD Writing Tablet. Size : 8.5\"'),
(17, '4811210164101', 'LCD Writing Tablet 8.5\"', 'Goods', '00000000', 59, 'LCD Writing Tablet. Size : 8.5\"'),
(18, '4811210164118', 'USB Charging Hub. 4 Port', 'Goods', '00000000', 59, '4 Port'),
(19, '4811210164125', '4 Port USB 3.0 Hub', 'Goods', '00000000', 59, '4 Port, USB 3.0'),
(20, '4811210164132', 'IP Camera', 'Goods', '85258090', 59, 'small'),
(21, '4811210164149', 'IP Camera', 'Goods', '85258090', 59, 'Big'),
(22, 'currogatedbox01', 'Corrugated Box 65*40*230', 'Goods', '4819', 59, 'SMR-3PLY Universal Box 65*40*230 MM I.D.'),
(23, 'carchpac01', 'Car Charger Carton', 'Goods', '4819', 59, 'Car Charger Carton 400*3'),
(24, 'adservfees01', 'Ad Service Fees', 'Services', '998365', 0, 'Sale Of Space For Ad Service Fees'),
(25, 'storefees01', 'Storage Fees', 'Services', '996729', 0, 'Storage FEes'),
(26, 'fbawhsf01', 'FBA Weight Handling Sipping Fees', 'Services', '996812', 0, 'FBA Weight Handling Sipping Fees'),
(27, 'fbapnpf01', 'FBA Pick And Pack fees', 'Services', '998599', 0, 'FBA Pick And Pack fees'),
(28, 'shipchrgbf01', 'Shipping Chargeback Fee ', 'Services', '996812', 0, 'Shipping Chargeback Fee '),
(29, 'eswhf01', 'Easy Ship Weight Handling Fee', 'Services', '996812', 0, 'Easy Ship Weight Handling Fee'),
(30, 'fixclfees01', 'Fixed Closing Fee ', 'Services', '998599', 0, 'Fixed Closing Fee '),
(31, 'listfees01', 'Listing Fee', 'Services', '998599', 0, 'Listing Fee'),
(32, 'refndprofee01', 'Refund Processing Fee', 'Services', '998599', 0, 'Refund Processing Fee'),
(33, 'collectfees01', 'Collection Fee ', 'Services', '998599', 0, 'Collection Fee \r\n'),
(34, 'commfees01', 'Commission Fee ', 'Services', '998599', 0, 'Commission Fee '),
(35, 'removefees', 'Removal Fee', 'Services', '998599', 0, 'Removal Fee'),
(36, 'amzadopt', 'Amazon Sponsored AD Optimization', 'Services', '998313 ', 0, 'Amazon Sponsored AD Optimization Service'),
(37, 'Router', 'Router Tp-link Tl-wr840n', 'Goods', '85176930', 59, 'Router Tp-link Tl-wr840n'),
(38, 'Tally.erp9', 'Tally.ERP 9 Silver ', 'Unknown', '85238020', 0, 'Tally.ERP 9 Silver,For Serial No:796272354\r\n'),
(39, 'Airtravel', 'Air Travel And Related Charges', 'Services', '996425', 0, 'Air Travel And Related Charges'),
(40, 'Airportcharges', 'Airport Charges', 'Services', '00000000', 0, 'Airport Charges'),
(41, 'roombook', 'goibibo.com', 'Services', '998552', 0, 'Hotel Room Booking By goibibo.com'),
(42, 'motophone', 'Motorola Black Cordless And Corded Phone ', 'Goods', '85171190', 59, 'Motorola Black Cordless And Corded Phone '),
(43, 'HPprinter', 'HP 1020 Plus Single-Function Laser Printer ', 'Goods', '8443', 59, 'HP 1020 Plus Single-Function Laser Printer '),
(44, 'serchrgprint', 'HP Printer Servicing Charges', 'Services', '00000000', 0, 'HP Printer Servicing Charges'),
(45, 'ledmondell', 'Led Monitor Dell', 'Goods', '85285200', 59, 'Led Monitor Dell 18.5\"');

-- --------------------------------------------------------

--
-- Table structure for table `Payment Sources`
--

CREATE TABLE `Payment Sources` (
  `Payment Source ID` int(11) NOT NULL,
  `Payment Type` enum('Unknown','Bank Account','Credit Card','Cash Payment') NOT NULL,
  `Account Number` varchar(30) NOT NULL,
  `Owner Name` varchar(30) NOT NULL,
  `Bank Name` enum('Unknown','No Bank','HDFC BANK','ICICI BANK','AXIS BANK','SBI BANK','KOTAK BANK') NOT NULL,
  `Notes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase Challan Register`
--

CREATE TABLE `Purchase Challan Register` (
  `Challan ID` int(11) NOT NULL,
  `Purchase ID` int(11) NOT NULL,
  `Metres` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Purchased Products`
--

CREATE TABLE `Purchased Products` (
  `Purchased Item ID` int(11) NOT NULL,
  `Purchase ID` int(11) NOT NULL,
  `Item ID` int(11) NOT NULL,
  `HSN Code` varchar(10) NOT NULL,
  `Item Type` enum('Unknown','Goods','Services') NOT NULL DEFAULT 'Unknown',
  `Unit Price` decimal(15,2) NOT NULL,
  `Quantity` decimal(15,2) NOT NULL,
  `Unit ID` int(11) NOT NULL DEFAULT '59',
  `Discount` decimal(15,2) NOT NULL,
  `Taxable Value` decimal(15,2) NOT NULL,
  `GST ID` int(11) NOT NULL,
  `CGST` decimal(15,2) NOT NULL,
  `SGST` decimal(15,2) NOT NULL,
  `IGST` decimal(15,2) NOT NULL,
  `UGST` decimal(15,2) NOT NULL,
  `Cess ID` int(11) NOT NULL DEFAULT '0',
  `Cess Amount` decimal(15,2) NOT NULL,
  `Tax Amount` decimal(15,2) NOT NULL,
  `Total Product Amount` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase Payment Register`
--

CREATE TABLE `Purchase Payment Register` (
  `Purchase Payment ID` int(11) NOT NULL,
  `Purchase ID` int(11) NOT NULL,
  `Payment Mode` enum('Unknown','Bank Account Transfer','Credit Card','Debit Card','PayPal','Cash Payment','Cheque','Demand Draft','Paytm Wallet Transfer','Foreign Remittance','Deduction at Source') NOT NULL,
  `Paid Amount` decimal(15,2) NOT NULL,
  `Payment Terms` varchar(50) NOT NULL,
  `Payment Type` enum('Complete Payment','Advance Payment','Partial Payment','Balance Payment','Instalment Payment') NOT NULL DEFAULT 'Complete Payment',
  `Company Account ID` int(11) NOT NULL,
  `Vendor Account ID` int(11) NOT NULL,
  `Payment Reference Number` varchar(20) NOT NULL,
  `Payment Notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Purchase Register`
--

CREATE TABLE `Purchase Register` (
  `Purchase ID` int(11) NOT NULL,
  `Invoice Number` varchar(30) NOT NULL,
  `Invoice Date` date NOT NULL,
  `Company GSTIN` varchar(16) NOT NULL DEFAULT '27BIMPB4559A1ZG',
  `Vendor ID` int(11) NOT NULL,
  `Supplier State ID` int(11) NOT NULL,
  `Place of Supply State ID` int(11) NOT NULL DEFAULT '27',
  `Total Taxable Value` decimal(15,2) NOT NULL,
  `Total Discount` decimal(15,2) NOT NULL,
  `CGST` decimal(15,2) NOT NULL,
  `SGST` decimal(15,2) NOT NULL,
  `IGST` decimal(15,2) NOT NULL,
  `UGST` decimal(15,2) NOT NULL,
  `Cess Amount` decimal(15,2) NOT NULL,
  `Total Tax Amount` decimal(15,2) NOT NULL,
  `Round Off` decimal(15,2) NOT NULL,
  `Total Amount` decimal(15,2) NOT NULL,
  `Reverse Charge` enum('N','Y') NOT NULL DEFAULT 'N',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sales Challan Register`
--

CREATE TABLE `Sales Challan Register` (
  `Sales Challan ID` int(11) NOT NULL,
  `Sales ID` int(11) NOT NULL,
  `Metres` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Sales Payment Register`
--

CREATE TABLE `Sales Payment Register` (
  `Sales Payment ID` int(11) NOT NULL,
  `Purchase ID` int(11) NOT NULL,
  `Payment Mode` enum('Unknown','Bank Account Transfer','Credit Card','Debit Card','PayPal','Cash Payment','Cheque','Demand Draft','Paytm Wallet Transfer','Foreign Remittance','Deduction at Source') NOT NULL,
  `Paid Amount` decimal(15,2) NOT NULL,
  `Payment Terms` varchar(50) NOT NULL,
  `Payment Type` enum('Complete Payment','Advance Payment','Partial Payment','Balance Payment','Instalment Payment') NOT NULL,
  `Company Account ID` int(11) NOT NULL,
  `Vendor Account ID` int(11) NOT NULL,
  `Payment Reference Number` varchar(20) NOT NULL,
  `Payment Notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Sales Products`
--

CREATE TABLE `Sales Products` (
  `Sales Item ID` int(11) NOT NULL,
  `Sales ID` int(11) NOT NULL,
  `Item ID` int(11) NOT NULL,
  `HSN Code` varchar(10) NOT NULL,
  `Item Type` enum('Goods','Services') NOT NULL,
  `Unit Price` decimal(15,2) NOT NULL,
  `Quantity` decimal(15,2) NOT NULL,
  `Unit ID` int(11) NOT NULL DEFAULT '59',
  `Discount` decimal(15,2) NOT NULL,
  `Taxable Value` decimal(15,2) NOT NULL,
  `GST ID` int(11) NOT NULL,
  `CGST` decimal(15,2) NOT NULL,
  `SGST` decimal(15,2) NOT NULL,
  `IGST` decimal(15,2) NOT NULL,
  `UGST` decimal(15,2) NOT NULL,
  `Cess ID` int(11) NOT NULL DEFAULT '0',
  `Cess Amount` decimal(15,2) NOT NULL,
  `Tax Amount` decimal(15,2) NOT NULL,
  `Total Product Amount` decimal(15,2) NOT NULL,
  `Item Status` enum('Shipped','Cancelled','Returned','Pending') NOT NULL DEFAULT 'Shipped'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Sales Register`
--

CREATE TABLE `Sales Register` (
  `Sales ID` int(11) NOT NULL,
  `Order ID` varchar(25) DEFAULT NULL,
  `Invoice Number` varchar(20) NOT NULL,
  `Invoice Date` date NOT NULL,
  `Invoice Type` enum('B2B','B2C') NOT NULL DEFAULT 'B2C',
  `Order Date` date NOT NULL,
  `Vendor ID` int(11) NOT NULL,
  `Sales Type` enum('E-Commerce','Other Than E-Commerce') NOT NULL DEFAULT 'E-Commerce',
  `Ecommerce Vendor ID` int(11) NOT NULL,
  `Place of Supply State ID` int(11) NOT NULL DEFAULT '0',
  `Supplier State ID` int(11) NOT NULL DEFAULT '27',
  `Total Taxable Value` decimal(10,2) NOT NULL,
  `Total Discount` decimal(10,2) NOT NULL,
  `GST ID` int(11) NOT NULL,
  `CGST` decimal(10,2) NOT NULL,
  `SGST` decimal(10,2) NOT NULL,
  `IGST` decimal(10,2) NOT NULL,
  `UGST` decimal(10,2) NOT NULL,
  `Cess Amount` decimal(10,2) NOT NULL,
  `Total Tax Amount` decimal(10,2) NOT NULL,
  `Shipping Cost` decimal(10,2) NOT NULL,
  `Round Off` decimal(10,2) NOT NULL,
  `Total Amount` decimal(10,2) NOT NULL,
  `Reverse Charge` enum('N','Y') NOT NULL DEFAULT 'N',
  `Notes` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `State Directory`
--

CREATE TABLE `State Directory` (
  `State ID` int(11) NOT NULL,
  `State Name` varchar(30) NOT NULL,
  `State Tax Code` varchar(50) NOT NULL,
  `ISO Code` varchar(10) NOT NULL,
  `State Code` varchar(5) NOT NULL,
  `ST or UT` enum('NA','ST','UT') NOT NULL DEFAULT 'NA'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Stock Register`
--

CREATE TABLE `Stock Register` (
  `Item ID` int(11) NOT NULL,
  `Items in Stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Units`
--

CREATE TABLE `Units` (
  `Unit ID` int(11) NOT NULL,
  `Unit Code` varchar(5) NOT NULL,
  `Unit` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Units`
--

INSERT INTO `Units` (`Unit ID`, `Unit Code`, `Unit`) VALUES
(0, 'NA', 'Unknown'),
(1, 'AMP', 'AMPULES'),
(2, 'BAG', 'BAG'),
(3, 'BGS', 'BAGS'),
(4, 'BLS', 'BAILS'),
(5, 'BTL', 'BOTTLES'),
(6, 'BOU', 'BOU'),
(7, 'BOX', 'BOXES'),
(8, 'BKL', 'BUCKLES'),
(9, 'BLK', 'BULK'),
(10, 'BUN', 'BUNCHES'),
(11, 'BDL', 'BUNDLES'),
(12, 'CAN', 'CANS'),
(13, 'CTN', 'CARTONS'),
(14, 'CAS', 'CASES'),
(15, 'CMS', 'CENTIMETER'),
(16, 'CHI', 'CHEST'),
(17, 'CLS', 'COILS'),
(18, 'COL', 'COLLIES'),
(19, 'CRI', 'CRATES'),
(20, 'CCM', 'CUBIC CENTIMETER'),
(21, 'CIN', 'CUBIC INCHES'),
(22, 'CBM', 'CUBIC METER'),
(23, 'CQM', 'CUBIC METERS'),
(24, 'CYL', 'CYLINDER'),
(25, 'SDM', 'DECAMETER SQUARE'),
(26, 'DAY', 'DAYS'),
(27, 'DOZ', 'DOZEN'),
(28, 'DRM', 'DRUMS'),
(29, 'FTS', 'FEET'),
(30, 'FLK', 'FLASKS'),
(31, 'GMS', 'GRAMS'),
(32, 'TON', 'GREAT BRITAIN TON'),
(33, 'GGR', 'GREAT GROSS'),
(34, 'GRS', 'GROSS'),
(35, 'GYD', 'GROSS YARDS'),
(36, 'HBK', 'HABBUCK'),
(37, 'HKS', 'HANKS'),
(38, 'HRS', 'HOURS'),
(39, 'INC', 'INCHES'),
(40, 'JTA', 'JOTTA'),
(41, 'KGS', 'KILOGRAMS'),
(42, 'KLR', 'KILOLITER'),
(43, 'KME', 'KILOMETERS'),
(44, 'LTR', 'LITERS'),
(45, 'LOG', 'LOGS'),
(46, 'LOT', 'LOTS'),
(47, 'MTR', 'METER'),
(48, 'MTS', 'METRIC TON'),
(49, 'MGS', 'MILLIGRAMS'),
(50, 'MLT', 'MILLILITRE'),
(51, 'MMT', 'MILLIMETER'),
(52, 'NONE', 'NOT CHOSEN'),
(53, 'NOS', 'NUMBERS'),
(54, 'ODD', 'ODDS'),
(55, 'PAC', 'PACKS'),
(56, 'PAI', 'PAILS'),
(57, 'PRS', 'PAIRS'),
(58, 'PLT', 'PALLETS'),
(59, 'PCS', 'PIECES'),
(60, 'LBS', 'POUNDS'),
(61, 'QTL', 'QUINTAL'),
(62, 'REL', 'REELS'),
(63, 'ROL', 'ROLLS'),
(64, 'SET', 'SETS'),
(65, 'SHT', 'SHEETS'),
(66, 'SLB', 'SLABS'),
(67, 'SQF', 'SQUARE FEET'),
(68, 'SQI', 'SQUARE INCHES'),
(69, 'SQC', 'SQUARE CENTIMETERS'),
(70, 'SQM', 'SQUARE METER'),
(71, 'SQY', 'SQUARE YARDS'),
(72, 'BLO', 'STEEL BLOCKS'),
(73, 'TBL', 'TABLES'),
(74, 'TBS', 'TABLETS'),
(75, 'TGM', 'TEN GROSS'),
(76, 'THD', 'THOUSANDS'),
(77, 'TIN', 'TINS'),
(78, 'TOL', 'TOLA'),
(79, 'TRK', 'TRUNK'),
(80, 'TUB', 'TUBES'),
(81, 'UNT', 'UNITS'),
(82, 'UGS', 'US GALLONS'),
(83, 'VLS', 'Vials'),
(84, 'CSK', 'WOODEN CASES'),
(85, 'YDS', 'YARDS');

-- --------------------------------------------------------

--
-- Table structure for table `Vendor Bank Account`
--

CREATE TABLE `Vendor Bank Account` (
  `Vendor Account ID` int(11) NOT NULL,
  `Vendor ID` int(11) NOT NULL,
  `Beneficiary Name` varchar(50) NOT NULL,
  `Account Number` varchar(20) NOT NULL,
  `Beneficiary Address` varchar(300) NOT NULL,
  `Beneficiary Bank` varchar(20) NOT NULL,
  `Beneficiary Bank Address` varchar(300) NOT NULL,
  `SWIFT IFSC Code` varchar(20) NOT NULL,
  `Bank Code` varchar(10) NOT NULL,
  `Branch Code` varchar(10) NOT NULL,
  `Account Type` enum('Invalid Account','Company Account','Alibaba Trade Assurance Account','Current Account','Saving Account') NOT NULL DEFAULT 'Invalid Account'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Vendor Register`
--

CREATE TABLE `Vendor Register` (
  `Vendor ID` int(11) NOT NULL,
  `Vendor Name` varchar(100) NOT NULL DEFAULT 'Unknown',
  `Vendor Type` enum('Unknown','GST Registered','GST Unregistered','Foriegn Vendor') NOT NULL DEFAULT 'Unknown',
  `GSTIN` varchar(15) DEFAULT NULL,
  `PAN` varchar(15) NOT NULL,
  `Phone` varchar(300) DEFAULT NULL,
  `Email ID` varchar(50) DEFAULT NULL,
  `Address` varchar(300) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State ID` int(11) NOT NULL,
  `Country` varchar(20) NOT NULL DEFAULT 'INDIA',
  `Pin Code` varchar(7) DEFAULT NULL,
  `Website` varchar(30) DEFAULT NULL,
  `Business Type` enum('Unknown','Manufacturer','Trader','Manufacturer and Trader','Graphic Designer','Printing Company','Packing Material','Customs Department','Freight Agent','Other') NOT NULL DEFAULT 'Unknown'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Cess Class`
--
ALTER TABLE `Cess Class`
  ADD PRIMARY KEY (`Cess ID`);

--
-- Indexes for table `Company Bank Accounts`
--
ALTER TABLE `Company Bank Accounts`
  ADD PRIMARY KEY (`Account ID`);

--
-- Indexes for table `Company Employee`
--
ALTER TABLE `Company Employee`
  ADD PRIMARY KEY (`Employee ID`),
  ADD KEY `Employee_Bank_Account` (`Bank Account ID`);

--
-- Indexes for table `Credit Debit Note`
--
ALTER TABLE `Credit Debit Note`
  ADD PRIMARY KEY (`Note ID`),
  ADD KEY `CDN_Supply_State_ID` (`Place of Supply State ID`),
  ADD KEY `CDN_Supplier_State_ID` (`Supplier State ID`),
  ADD KEY `CDN_VENDOR_ID` (`Vendor ID`);

--
-- Indexes for table `Credit Debit Note Products`
--
ALTER TABLE `Credit Debit Note Products`
  ADD PRIMARY KEY (`Note Item ID`),
  ADD UNIQUE KEY `Sale_cons_prod_Check_Item` (`Note ID`,`Item ID`),
  ADD KEY `CDN_Prod_GST_ID` (`GST ID`),
  ADD KEY `CDN_Prod_HSN_Code` (`HSN Code`),
  ADD KEY `CDN_Prod_Item_ID` (`Item ID`),
  ADD KEY `CDN_Prod_Unit_ID` (`Unit ID`);

--
-- Indexes for table `CustomerBase`
--
ALTER TABLE `CustomerBase`
  ADD PRIMARY KEY (`Customer ID`);

--
-- Indexes for table `Ecommerce Vendor`
--
ALTER TABLE `Ecommerce Vendor`
  ADD PRIMARY KEY (`Ecommerce Vendor ID`);

--
-- Indexes for table `GST Class`
--
ALTER TABLE `GST Class`
  ADD PRIMARY KEY (`GST ID`);

--
-- Indexes for table `HSN Directory`
--
ALTER TABLE `HSN Directory`
  ADD PRIMARY KEY (`HSN Code`),
  ADD KEY `HSN_Cess_ID` (`Cess ID`),
  ADD KEY `HSN_GST_ID` (`GST ID`);

--
-- Indexes for table `Item Master`
--
ALTER TABLE `Item Master`
  ADD PRIMARY KEY (`Item ID`),
  ADD KEY `Item_HSN_Code` (`HSN Code`),
  ADD KEY `Item_Unit_ID` (`Unit ID`);

--
-- Indexes for table `Payment Sources`
--
ALTER TABLE `Payment Sources`
  ADD PRIMARY KEY (`Payment Source ID`);

--
-- Indexes for table `Purchase Challan Register`
--
ALTER TABLE `Purchase Challan Register`
  ADD PRIMARY KEY (`Challan ID`),
  ADD KEY `Challan_Purchase_ID` (`Purchase ID`);

--
-- Indexes for table `Purchased Products`
--
ALTER TABLE `Purchased Products`
  ADD PRIMARY KEY (`Purchased Item ID`),
  ADD UNIQUE KEY `Sale_cons_prod_Check_Item` (`Purchase ID`,`Item ID`),
  ADD KEY `Purchased_Prod_GST_ID` (`GST ID`),
  ADD KEY `Purchased_Prod_HSN` (`HSN Code`),
  ADD KEY `Purchased_Prod_Item_ID` (`Item ID`),
  ADD KEY `Purchased_Prod_unit_ID` (`Unit ID`);

--
-- Indexes for table `Purchase Register`
--
ALTER TABLE `Purchase Register`
  ADD PRIMARY KEY (`Purchase ID`),
  ADD UNIQUE KEY `Invoice Number` (`Invoice Number`),
  ADD KEY `Purchase_Supplier_state_id` (`Supplier State ID`),
  ADD KEY `Purchase_Supply_state_id` (`Place of Supply State ID`),
  ADD KEY `Purchase_Vendor_ID` (`Vendor ID`);

--
-- Indexes for table `Sales Challan Register`
--
ALTER TABLE `Sales Challan Register`
  ADD PRIMARY KEY (`Sales Challan ID`),
  ADD KEY `Sales_Challan_Sales_ID` (`Sales ID`);

--
-- Indexes for table `Sales Products`
--
ALTER TABLE `Sales Products`
  ADD PRIMARY KEY (`Sales Item ID`),
  ADD UNIQUE KEY `Sale_prod_Check_Item` (`Sales ID`,`Item ID`);

--
-- Indexes for table `Sales Register`
--
ALTER TABLE `Sales Register`
  ADD PRIMARY KEY (`Sales ID`),
  ADD KEY `Sales_Ecommerce_Vendor_ID` (`Ecommerce Vendor ID`),
  ADD KEY `Sales_Supplier_state_id` (`Supplier State ID`),
  ADD KEY `Sales_Supply_state_id` (`Place of Supply State ID`),
  ADD KEY `Sales_Vendor_ID` (`Vendor ID`);

--
-- Indexes for table `State Directory`
--
ALTER TABLE `State Directory`
  ADD PRIMARY KEY (`State ID`);

--
-- Indexes for table `Stock Register`
--
ALTER TABLE `Stock Register`
  ADD UNIQUE KEY `Item ID` (`Item ID`);

--
-- Indexes for table `Units`
--
ALTER TABLE `Units`
  ADD PRIMARY KEY (`Unit ID`),
  ADD UNIQUE KEY `Unit Code` (`Unit Code`);

--
-- Indexes for table `Vendor Bank Account`
--
ALTER TABLE `Vendor Bank Account`
  ADD PRIMARY KEY (`Vendor Account ID`),
  ADD KEY `Vendor_Bank_Account_ID` (`Vendor ID`);

--
-- Indexes for table `Vendor Register`
--
ALTER TABLE `Vendor Register`
  ADD PRIMARY KEY (`Vendor ID`),
  ADD KEY `Vendor_State_ID` (`State ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Credit Debit Note`
--
ALTER TABLE `Credit Debit Note`
  MODIFY `Note ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Credit Debit Note Products`
--
ALTER TABLE `Credit Debit Note Products`
  MODIFY `Note Item ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Purchase Challan Register`
--
ALTER TABLE `Purchase Challan Register`
  MODIFY `Challan ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Purchased Products`
--
ALTER TABLE `Purchased Products`
  MODIFY `Purchased Item ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT for table `Purchase Register`
--
ALTER TABLE `Purchase Register`
  MODIFY `Purchase ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `Sales Challan Register`
--
ALTER TABLE `Sales Challan Register`
  MODIFY `Sales Challan ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Sales Products`
--
ALTER TABLE `Sales Products`
  MODIFY `Sales Item ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Sales Register`
--
ALTER TABLE `Sales Register`
  MODIFY `Sales ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Company Employee`
--
ALTER TABLE `Company Employee`
  ADD CONSTRAINT `Employee_Bank_Account` FOREIGN KEY (`Bank Account ID`) REFERENCES `Company Bank Accounts` (`Account ID`);

--
-- Constraints for table `Credit Debit Note`
--
ALTER TABLE `Credit Debit Note`
  ADD CONSTRAINT `CDN_Supplier_State_ID` FOREIGN KEY (`Supplier State ID`) REFERENCES `State Directory` (`State ID`),
  ADD CONSTRAINT `CDN_Supply_State_ID` FOREIGN KEY (`Place of Supply State ID`) REFERENCES `State Directory` (`State ID`),
  ADD CONSTRAINT `CDN_VENDOR_ID` FOREIGN KEY (`Vendor ID`) REFERENCES `Vendor Register` (`Vendor ID`);

--
-- Constraints for table `Credit Debit Note Products`
--
ALTER TABLE `Credit Debit Note Products`
  ADD CONSTRAINT `CDN_Prod_GST_ID` FOREIGN KEY (`GST ID`) REFERENCES `GST Class` (`GST ID`),
  ADD CONSTRAINT `CDN_Prod_HSN_Code` FOREIGN KEY (`HSN Code`) REFERENCES `HSN Directory` (`HSN Code`),
  ADD CONSTRAINT `CDN_Prod_Item_ID` FOREIGN KEY (`Item ID`) REFERENCES `Item Master` (`Item ID`),
  ADD CONSTRAINT `CDN_Prod_Note_ID` FOREIGN KEY (`Note ID`) REFERENCES `Credit Debit Note` (`Note ID`),
  ADD CONSTRAINT `CDN_Prod_Unit_ID` FOREIGN KEY (`Unit ID`) REFERENCES `Units` (`Unit ID`);

--
-- Constraints for table `HSN Directory`
--
ALTER TABLE `HSN Directory`
  ADD CONSTRAINT `HSN_Cess_ID` FOREIGN KEY (`Cess ID`) REFERENCES `Cess Class` (`Cess ID`),
  ADD CONSTRAINT `HSN_GST_ID` FOREIGN KEY (`GST ID`) REFERENCES `GST Class` (`GST ID`);

--
-- Constraints for table `Item Master`
--
ALTER TABLE `Item Master`
  ADD CONSTRAINT `Item_HSN_Code` FOREIGN KEY (`HSN Code`) REFERENCES `HSN Directory` (`HSN Code`),
  ADD CONSTRAINT `Item_Unit_ID` FOREIGN KEY (`Unit ID`) REFERENCES `Units` (`Unit ID`);

--
-- Constraints for table `Purchase Challan Register`
--
ALTER TABLE `Purchase Challan Register`
  ADD CONSTRAINT `Challan_Purchase_ID` FOREIGN KEY (`Purchase ID`) REFERENCES `Purchase Register` (`Purchase ID`);

--
-- Constraints for table `Purchased Products`
--
ALTER TABLE `Purchased Products`
  ADD CONSTRAINT `Purchased_Prod_GST_ID` FOREIGN KEY (`GST ID`) REFERENCES `GST Class` (`GST ID`),
  ADD CONSTRAINT `Purchased_Prod_HSN` FOREIGN KEY (`HSN Code`) REFERENCES `HSN Directory` (`HSN Code`),
  ADD CONSTRAINT `Purchased_Prod_Item_ID` FOREIGN KEY (`Item ID`) REFERENCES `Item Master` (`Item ID`),
  ADD CONSTRAINT `Purchased_Prod_Purchase_ID` FOREIGN KEY (`Purchase ID`) REFERENCES `Purchase Register` (`Purchase ID`),
  ADD CONSTRAINT `Purchased_Prod_unit_ID` FOREIGN KEY (`Unit ID`) REFERENCES `Units` (`Unit ID`);

--
-- Constraints for table `Purchase Register`
--
ALTER TABLE `Purchase Register`
  ADD CONSTRAINT `Purchase_Supplier_state_id` FOREIGN KEY (`Supplier State ID`) REFERENCES `State Directory` (`State ID`),
  ADD CONSTRAINT `Purchase_Supply_state_id` FOREIGN KEY (`Place of Supply State ID`) REFERENCES `State Directory` (`State ID`),
  ADD CONSTRAINT `Purchase_Vendor_ID` FOREIGN KEY (`Vendor ID`) REFERENCES `Vendor Register` (`Vendor ID`);

--
-- Constraints for table `Sales Challan Register`
--
ALTER TABLE `Sales Challan Register`
  ADD CONSTRAINT `Challan_Sales_ID` FOREIGN KEY (`Sales ID`) REFERENCES `Sales Register` (`Sales ID`);

--
-- Constraints for table `Sales Register`
--
ALTER TABLE `Sales Register`
  ADD CONSTRAINT `Sales_Ecommerce_Vendor_ID` FOREIGN KEY (`Ecommerce Vendor ID`) REFERENCES `Ecommerce Vendor` (`Ecommerce Vendor ID`),
  ADD CONSTRAINT `Sales_Supplier_state_id` FOREIGN KEY (`Supplier State ID`) REFERENCES `State Directory` (`State ID`),
  ADD CONSTRAINT `Sales_Supply_state_id` FOREIGN KEY (`Place of Supply State ID`) REFERENCES `State Directory` (`State ID`),
  ADD CONSTRAINT `Sales_Vendor_ID` FOREIGN KEY (`Vendor ID`) REFERENCES `Vendor Register` (`Vendor ID`);

--
-- Constraints for table `Stock Register`
--
ALTER TABLE `Stock Register`
  ADD CONSTRAINT `Stock_Item_ID` FOREIGN KEY (`Item ID`) REFERENCES `Item Master` (`Item ID`);

--
-- Constraints for table `Vendor Bank Account`
--
ALTER TABLE `Vendor Bank Account`
  ADD CONSTRAINT `Vendor_Bank_Account_ID` FOREIGN KEY (`Vendor ID`) REFERENCES `Vendor Register` (`Vendor ID`);

--
-- Constraints for table `Vendor Register`
--
ALTER TABLE `Vendor Register`
  ADD CONSTRAINT `Vendor_State_ID` FOREIGN KEY (`State ID`) REFERENCES `State Directory` (`State ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
