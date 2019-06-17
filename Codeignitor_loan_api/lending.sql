-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2019 at 06:19 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lending`
--

-- --------------------------------------------------------

--
-- Table structure for table `lend_admin`
--

CREATE TABLE `lend_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_admin`
--

INSERT INTO `lend_admin` (`id`, `username`, `password`, `rdate`) VALUES
(3, 'mnyabwilo', 'ef584765d82f78e9544dfadb3b26f1a4', '2019-03-25 04:33:03');

-- --------------------------------------------------------

--
-- Table structure for table `lend_advance_payments`
--

CREATE TABLE `lend_advance_payments` (
  `admin_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `borrower_loan_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `total_payments` varchar(255) NOT NULL,
  `payment_ids` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_advance_payments`
--

INSERT INTO `lend_advance_payments` (`admin_id`, `id`, `borrower_loan_id`, `borrower_id`, `total_payments`, `payment_ids`) VALUES
(3, 6, 34, 7, '12687.5', 238),
(3, 7, 35, 8, '30450', 243);

-- --------------------------------------------------------

--
-- Table structure for table `lend_borrower`
--

CREATE TABLE `lend_borrower` (
  `id` int(11) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone_cell` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `income` varchar(45) DEFAULT NULL,
  `civil_status` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `age` varchar(45) DEFAULT NULL,
  `employment_status` varchar(45) DEFAULT NULL,
  `job_title` varchar(45) DEFAULT NULL,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `mi` varchar(45) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  `birth_date` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_borrower`
--

INSERT INTO `lend_borrower` (`id`, `company`, `password`, `address`, `phone_cell`, `email`, `income`, `civil_status`, `sex`, `age`, `employment_status`, `job_title`, `fname`, `lname`, `mi`, `rdate`, `birth_date`) VALUES
(7, 'Nogiza Africa Ltd', '', 'Temeke', '0656463626', 'mnyabwilowilson@gmail.com', '900000', 'married', NULL, '25', 'Employed', 'CEO', 'wilson', 'mnyabwilo', 'andrea', '2019-03-25 05:50:19', '12/12/1994'),
(8, 'Nogiza', '', 'Temeke, Buza\r\nTemeke, Maganga', '0764635470', 'mnyabwilowilson@gmail.com', '3000000', 'Married', NULL, '56', 'Self Employment', 'Director', 'Rosemary', 'Choyo', 'Fulgence', '2019-04-03 05:59:57', '12/09/1965');

-- --------------------------------------------------------

--
-- Table structure for table `lend_borrower_loans`
--

CREATE TABLE `lend_borrower_loans` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT 'ACTIVE',
  `loan_date` date DEFAULT NULL,
  `loan_amount` float DEFAULT NULL,
  `loan_category` varchar(255) DEFAULT NULL,
  `loan_amount_interest` float DEFAULT NULL,
  `loan_amount_term` float DEFAULT NULL,
  `loan_amount_total` float DEFAULT NULL,
  `next_payment_id` int(11) DEFAULT NULL,
  `rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `loan_months` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_borrower_loans`
--

INSERT INTO `lend_borrower_loans` (`id`, `borrower_id`, `loan_id`, `status`, `loan_date`, `loan_amount`, `loan_category`, `loan_amount_interest`, `loan_amount_term`, `loan_amount_total`, `next_payment_id`, `rdate`, `loan_months`) VALUES
(34, 7, 9, 'CLOSED', '2019-03-25', 50000, '', 187.5, 12687.5, 50750, 237, '2019-03-25 02:50:36', 1),
(35, 8, 9, 'CLOSED', '2019-04-03', 60000, '', 225, 15225, 60900, 241, '2019-04-03 10:58:45', 1),
(36, 8, 9, 'ACTIVE', '2019-04-07', 25000, '', 93.75, 6343.75, 25375, 245, '2019-04-07 01:43:16', 1),
(37, 7, 8, 'ACTIVE', '2019-04-07', 300000, '', 3750, 78750, 315000, 249, '2019-04-07 04:09:18', 2);

-- --------------------------------------------------------

--
-- Table structure for table `lend_borrower_loan_settings`
--

CREATE TABLE `lend_borrower_loan_settings` (
  `id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL,
  `borrower_loan_id` int(11) DEFAULT NULL,
  `lname` varchar(90) DEFAULT NULL,
  `interest` float DEFAULT NULL,
  `terms` varchar(45) DEFAULT NULL,
  `frequency` varchar(45) DEFAULT NULL,
  `late_fee` int(11) DEFAULT NULL,
  `months` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_borrower_loan_settings`
--

INSERT INTO `lend_borrower_loan_settings` (`id`, `loan_id`, `borrower_loan_id`, `lname`, `interest`, `terms`, `frequency`, `late_fee`, `months`) VALUES
(14, 9, 34, 'Lipa kila wiki 1', 1.5, '4', 'Weekly', NULL, 1),
(15, 9, 35, 'Lipa kila wiki 1', 1.5, '4', 'Weekly', NULL, 1),
(16, 9, 36, 'Lipa kila wiki 1', 1.5, '4', 'Weekly', NULL, 1),
(17, 8, 37, 'Lipa kila wiki 2', 2.5, '4', '2 Weeks', NULL, 2);

-- --------------------------------------------------------

--
-- Table structure for table `lend_loan`
--

CREATE TABLE `lend_loan` (
  `id` int(11) NOT NULL,
  `lname` varchar(90) DEFAULT NULL,
  `interest` float DEFAULT NULL,
  `terms` varchar(45) DEFAULT NULL,
  `frequency` varchar(45) DEFAULT NULL,
  `late_fee` int(11) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_loan`
--

INSERT INTO `lend_loan` (`id`, `lname`, `interest`, `terms`, `frequency`, `late_fee`, `rdate`) VALUES
(8, 'Lipa kila wiki 2', 2.5, '12', '2 Weeks', NULL, '2011-09-22 14:59:48'),
(9, 'Lipa kila wiki 1', 1.5, NULL, 'Weekly', NULL, '2019-03-25 05:09:35'),
(10, 'Lipa kila mwezi', 6, NULL, 'Monthly', NULL, '2019-04-07 04:23:19');

-- --------------------------------------------------------

--
-- Table structure for table `lend_logs`
--

CREATE TABLE `lend_logs` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `action` varchar(45) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `loan_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_logs`
--

INSERT INTO `lend_logs` (`id`, `admin_id`, `action`, `rdate`, `type`, `description`, `loan_id`, `payment_id`, `ip_address`) VALUES
(7, 3, NULL, NULL, 'move', '<strong>Payment #</strong>(3), <strong>Original Date</strong>(2019-04-15), <strong>Move-in Date</strong>(2019-04-17), <br /><strong>Notes</strong>: analipwa', 34, 239, '0.0.0.0'),
(6, 3, NULL, NULL, 'advance_payment', '<strong>Payment #</strong>(2), <strong>Total Amount</strong>(12687.5)', 34, 6, '0.0.0.0'),
(5, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(1), <strong>Amount</strong>(12687.5)', 34, 237, '0.0.0.0'),
(8, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(3), <strong>Amount</strong>(12687.5)', 34, 239, '0.0.0.0'),
(9, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(4), <strong>Amount</strong>(12687.5)', 34, 240, '0.0.0.0'),
(10, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(1), <strong>Amount</strong>(15225)', 35, 241, '0.0.0.0'),
(11, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(2), <strong>Amount</strong>(15225)', 35, 242, '0.0.0.0'),
(12, 3, NULL, NULL, 'advance_payment', '<strong>Payment #</strong>(3), <strong>Total Amount</strong>(30450)', 35, 7, '0.0.0.0'),
(13, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(1), <strong>Amount</strong>(6343.75)', 36, 245, '0.0.0.0'),
(14, 3, NULL, NULL, 'move', '<strong>Payment #</strong>(2), <strong>Original Date</strong>(2019-04-22), <strong>Move-in Date</strong>(2019-04-06)', 36, 246, '0.0.0.0'),
(15, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(2), <strong>Amount</strong>(6343.75)', 36, 246, '0.0.0.0'),
(16, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(1), <strong>Amount</strong>(78750)', 37, 249, '0.0.0.0'),
(17, 3, NULL, NULL, 'move', '<strong>Payment #</strong>(2), <strong>Original Date</strong>(2019-04-30), <strong>Move-in Date</strong>(2019-04-01)', 37, 250, '0.0.0.0'),
(18, 3, NULL, NULL, 'move', '<strong>Payment #</strong>(2), <strong>Original Date</strong>(2019-04-01), <strong>Move-in Date</strong>(2019-04-30)', 37, 250, '0.0.0.0'),
(19, 3, NULL, NULL, 'payment', '<strong>Payment #</strong>(2), <strong>Amount</strong>(78750)', 37, 250, '0.0.0.0');

-- --------------------------------------------------------

--
-- Table structure for table `lend_payments`
--

CREATE TABLE `lend_payments` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `borrower_loan_id` int(11) DEFAULT NULL,
  `payment_sched` date DEFAULT NULL,
  `payment_number` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `status` varchar(45) DEFAULT 'UNPAID',
  `rdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_sched_prev` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_payments`
--

INSERT INTO `lend_payments` (`id`, `borrower_id`, `borrower_loan_id`, `payment_sched`, `payment_number`, `amount`, `status`, `rdate`, `payment_sched_prev`) VALUES
(240, 7, 34, '2019-04-22', 4, 12687.5, 'PAID', '2019-03-25 02:50:36', '0000-00-00'),
(239, 7, 34, '2019-04-17', 3, 12687.5, 'PAID', '2019-03-25 02:50:36', '2019-04-15'),
(238, 7, 34, '2019-04-08', 2, 12687.5, 'PAID', '2019-03-25 02:50:36', '0000-00-00'),
(237, 7, 34, '2019-04-01', 1, 12687.5, 'PAID', '2019-03-25 02:50:36', '0000-00-00'),
(241, 8, 35, '2019-04-10', 1, 15225, 'PAID', '2019-04-03 10:58:45', '0000-00-00'),
(242, 8, 35, '2019-04-17', 2, 15225, 'PAID', '2019-04-03 10:58:45', '0000-00-00'),
(243, 8, 35, '2019-04-24', 3, 15225, 'PAID', '2019-04-03 10:58:45', '0000-00-00'),
(244, 8, 35, '2019-05-01', 4, 15225, 'PAID', '2019-04-03 10:58:45', '0000-00-00'),
(245, 8, 36, '2019-04-15', 1, 6343.75, 'PAID', '2019-04-07 01:43:16', '0000-00-00'),
(246, 8, 36, '2019-04-06', 2, 6343.75, 'PAID', '2019-04-07 01:43:16', '2019-04-22'),
(247, 8, 36, '2019-04-29', 3, 6343.75, 'UNPAID', '2019-04-07 01:43:16', '0000-00-00'),
(248, 8, 36, '2019-05-06', 4, 6343.75, 'UNPAID', '2019-04-07 01:43:16', '0000-00-00'),
(249, 7, 37, '2019-04-15', 1, 78750, 'PAID', '2019-04-07 04:09:18', '0000-00-00'),
(250, 7, 37, '2019-04-30', 2, 78750, 'PAID', '2019-04-07 04:09:18', '2019-04-01'),
(251, 7, 37, '2019-05-15', 3, 78750, 'UNPAID', '2019-04-07 04:09:18', '0000-00-00'),
(252, 7, 37, '2019-05-30', 4, 78750, 'UNPAID', '2019-04-07 04:09:18', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `lend_transactions`
--

CREATE TABLE `lend_transactions` (
  `id` int(11) NOT NULL,
  `borrower_id` int(11) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `admin_id` varchar(45) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `advance_payment_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lend_transactions`
--

INSERT INTO `lend_transactions` (`id`, `borrower_id`, `payment`, `admin_id`, `payment_id`, `rdate`, `advance_payment_id`) VALUES
(41, 7, 12688, '3', 238, '2019-03-25 02:51:20', 6),
(40, 7, 12688, '3', 237, '2019-03-25 02:51:12', 0),
(42, 7, 12688, '3', 239, '2019-04-03 10:57:02', 0),
(43, 7, 12688, '3', 240, '2019-04-03 10:57:06', 0),
(44, 8, 15225, '3', 241, '2019-04-06 04:13:23', 0),
(45, 8, 15225, '3', 242, '2019-04-06 04:59:43', 0),
(46, 8, 15225, '3', 243, '2019-04-07 00:49:32', 7),
(47, 8, 15225, '3', 244, '2019-04-07 00:49:32', 7),
(48, 8, 6344, '3', 245, '2019-04-07 02:29:38', 0),
(49, 8, 6344, '3', 246, '2019-04-09 03:15:30', 0),
(50, 7, 78750, '3', 249, '2019-04-09 03:15:46', 0),
(51, 7, 78750, '3', 250, '2019-04-09 03:19:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_category`
--

CREATE TABLE `loan_category` (
  `loan_category_id` int(11) NOT NULL,
  `loan_category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lend_admin`
--
ALTER TABLE `lend_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_advance_payments`
--
ALTER TABLE `lend_advance_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_borrower`
--
ALTER TABLE `lend_borrower`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_borrower_loans`
--
ALTER TABLE `lend_borrower_loans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_borrower_loan_settings`
--
ALTER TABLE `lend_borrower_loan_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_loan`
--
ALTER TABLE `lend_loan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_logs`
--
ALTER TABLE `lend_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_payments`
--
ALTER TABLE `lend_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lend_transactions`
--
ALTER TABLE `lend_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_category`
--
ALTER TABLE `loan_category`
  ADD PRIMARY KEY (`loan_category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lend_admin`
--
ALTER TABLE `lend_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `lend_advance_payments`
--
ALTER TABLE `lend_advance_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lend_borrower`
--
ALTER TABLE `lend_borrower`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lend_borrower_loans`
--
ALTER TABLE `lend_borrower_loans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `lend_borrower_loan_settings`
--
ALTER TABLE `lend_borrower_loan_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `lend_loan`
--
ALTER TABLE `lend_loan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `lend_logs`
--
ALTER TABLE `lend_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `lend_payments`
--
ALTER TABLE `lend_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=253;

--
-- AUTO_INCREMENT for table `lend_transactions`
--
ALTER TABLE `lend_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `loan_category`
--
ALTER TABLE `loan_category`
  MODIFY `loan_category_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
