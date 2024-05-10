-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 10, 2024 at 03:02 PM
-- Server version: 10.5.23-MariaDB-0+deb11u1
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bitcointracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `bitcoin_prices`
--

CREATE TABLE `bitcoin_prices` (
  `id` int(11) NOT NULL,
  `current_price` decimal(10,2) DEFAULT NULL,
  `low_24h` decimal(10,2) DEFAULT NULL,
  `high_24h` decimal(10,2) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bitcoin_prices`
--

INSERT INTO `bitcoin_prices` (`id`, `current_price`, `low_24h`, `high_24h`, `timestamp`) VALUES
(4, '63015.63', '59864.80', '66166.40', '2024-05-08 06:50:56'),
(5, '63304.06', '60138.90', '66469.30', '2024-05-08 07:17:43'),
(6, '63162.71', '60004.60', '66320.80', '2024-05-08 07:35:21'),
(7, '63217.99', '60057.10', '66378.90', '2024-05-08 07:45:34'),
(8, '63152.67', '59995.00', '66310.30', '2024-05-09 07:51:02'),
(9, '63092.68', '59938.00', '66247.30', '2024-05-09 08:00:02'),
(10, '63046.61', '59894.30', '66198.90', '2024-05-09 08:05:02'),
(11, '62990.29', '59840.80', '66139.80', '2024-05-09 08:10:02'),
(12, '62936.81', '59790.00', '66083.70', '2024-05-09 08:15:02'),
(13, '62981.34', '59832.30', '66130.40', '2024-05-10 08:20:02'),
(14, '62966.51', '59818.20', '66114.80', '2024-05-10 08:25:02'),
(15, '63003.66', '59853.50', '66153.80', '2024-05-11 08:30:02'),
(16, '63016.41', '59865.60', '66167.20', '2024-05-11 08:35:02'),
(17, '63022.96', '59871.80', '66174.10', '2024-05-11 08:40:02'),
(18, '62973.52', '59824.80', '66122.20', '2024-05-12 08:45:02'),
(19, '62988.79', '59839.30', '66138.20', '2024-05-12 08:50:02'),
(20, '63009.98', '59859.50', '66160.50', '2024-05-12 08:55:02'),
(21, '63023.57', '59872.40', '66174.80', '2024-05-13 08:57:59'),
(22, '63075.90', '59922.10', '66229.70', '2024-05-14 09:00:02'),
(23, '62981.79', '59832.70', '66130.90', '2024-05-15 09:05:02'),
(24, '62946.72', '59799.40', '66094.10', '2024-05-16 09:10:02'),
(25, '62912.37', '59766.80', '66058.00', '2024-05-17 09:15:02'),
(26, '62985.77', '59836.50', '66135.10', '2024-05-18 09:20:02'),
(27, '62984.60', '59835.40', '66133.80', '2024-05-19 09:25:02'),
(28, '62952.30', '59804.70', '66099.90', '2024-05-20 09:30:02'),
(29, '63008.17', '59857.80', '66158.60', '2024-05-10 09:35:02'),
(30, '63029.05', '59877.60', '66180.50', '2024-05-10 09:40:02'),
(31, '63193.62', '60033.90', '66353.30', '2024-05-10 09:45:02'),
(32, '63125.07', '59968.80', '66281.30', '2024-05-10 09:50:01'),
(33, '63131.51', '59974.90', '66288.10', '2024-05-10 09:55:03'),
(34, '63006.46', '59856.10', '66156.80', '2024-05-10 11:20:01'),
(35, '63061.09', '59908.00', '66214.10', '2024-05-10 11:25:03'),
(36, '63074.90', '59921.20', '66228.60', '2024-05-10 11:30:02'),
(37, '63064.12', '59910.90', '66217.30', '2024-05-10 11:35:02'),
(38, '63043.49', '59891.30', '66195.70', '2024-05-10 11:40:02'),
(39, '63074.85', '59921.10', '66228.60', '2024-05-10 11:45:01'),
(40, '63191.90', '60032.30', '66351.50', '2024-05-10 11:50:02'),
(41, '63256.22', '60093.40', '66419.00', '2024-05-10 11:55:02'),
(42, '63222.84', '60061.70', '66384.00', '2024-05-10 12:10:02'),
(43, '63333.54', '60166.90', '66500.20', '2024-05-10 12:17:15'),
(44, '63240.79', '60078.80', '66402.80', '2024-05-10 12:20:03'),
(45, '63151.53', '59994.00', '66309.10', '2024-05-10 12:25:02'),
(46, '63282.50', '60118.40', '66446.60', '2024-05-10 12:30:02'),
(47, '63296.28', '60131.50', '66461.10', '2024-05-10 12:35:02'),
(48, '63304.06', '60138.90', '66469.30', '2024-05-10 12:40:02'),
(49, '63257.08', '60094.20', '66419.90', '2024-05-10 12:45:02'),
(50, '63074.88', '59921.10', '66228.60', '2024-05-10 12:50:02'),
(51, '63133.98', '59977.30', '66290.70', '2024-05-10 12:55:02'),
(52, '63082.65', '59928.50', '66236.80', '2024-05-10 13:00:01'),
(53, '62989.91', '59840.40', '66139.40', '2024-05-10 14:00:02');

-- --------------------------------------------------------

--
-- Table structure for table `cryptocurrency_rates`
--

CREATE TABLE `cryptocurrency_rates` (
  `id` int(11) NOT NULL,
  `crypto_name` varchar(50) NOT NULL,
  `crypto_symbol` varchar(10) NOT NULL,
  `current_price` decimal(18,8) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cryptocurrency_rates`
--

INSERT INTO `cryptocurrency_rates` (`id`, `crypto_name`, `crypto_symbol`, `current_price`, `timestamp`) VALUES
(801, 'Bitcoin', 'btc', '63106.00000000', '2024-05-10 14:00:02'),
(802, 'Ethereum', 'eth', '3030.34000000', '2024-05-10 14:00:02'),
(803, 'Tether', 'usdt', '0.99984900', '2024-05-10 14:00:03'),
(804, 'BNB', 'bnb', '596.78000000', '2024-05-10 14:00:03'),
(805, 'Solana', 'sol', '153.20000000', '2024-05-10 14:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `cryptocurrency_rates_history`
--

CREATE TABLE `cryptocurrency_rates_history` (
  `id` int(11) NOT NULL,
  `crypto_id` int(11) DEFAULT NULL,
  `previous_price` decimal(18,6) DEFAULT NULL,
  `previous_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cryptocurrency_rates_history`
--

INSERT INTO `cryptocurrency_rates_history` (`id`, `crypto_id`, `previous_price`, `previous_timestamp`) VALUES
(1, 801, '62894.000000', '2024-05-10 09:42:57'),
(2, 802, '3029.160000', '2024-05-10 09:42:58'),
(3, 803, '0.999651', '2024-05-10 09:42:58'),
(4, 804, '593.260000', '2024-05-10 09:42:59'),
(5, 805, '153.720000', '2024-05-10 09:42:59'),
(6, 801, '63011.000000', '2024-05-10 09:48:14'),
(7, 802, '3031.890000', '2024-05-10 09:48:14'),
(8, 803, '1.000000', '2024-05-10 09:48:15'),
(9, 804, '593.430000', '2024-05-10 09:48:15'),
(10, 805, '153.880000', '2024-05-10 09:48:15'),
(11, 801, '63011.000000', '2024-05-10 09:48:59'),
(12, 802, '3031.890000', '2024-05-10 09:48:59'),
(13, 803, '1.000000', '2024-05-10 09:49:00'),
(14, 804, '593.430000', '2024-05-10 09:49:00'),
(15, 805, '153.880000', '2024-05-10 09:49:00'),
(16, 801, '63003.000000', '2024-05-10 13:00:16'),
(17, 802, '3025.270000', '2024-05-10 13:00:17'),
(18, 803, '0.999345', '2024-05-10 13:00:17'),
(19, 804, '594.070000', '2024-05-10 13:00:17'),
(20, 805, '153.230000', '2024-05-10 13:00:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bitcoin_prices`
--
ALTER TABLE `bitcoin_prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cryptocurrency_rates`
--
ALTER TABLE `cryptocurrency_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crypto_symbol` (`crypto_symbol`);

--
-- Indexes for table `cryptocurrency_rates_history`
--
ALTER TABLE `cryptocurrency_rates_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crypto_id` (`crypto_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bitcoin_prices`
--
ALTER TABLE `bitcoin_prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `cryptocurrency_rates`
--
ALTER TABLE `cryptocurrency_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=836;

--
-- AUTO_INCREMENT for table `cryptocurrency_rates_history`
--
ALTER TABLE `cryptocurrency_rates_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cryptocurrency_rates_history`
--
ALTER TABLE `cryptocurrency_rates_history`
  ADD CONSTRAINT `cryptocurrency_rates_history_ibfk_1` FOREIGN KEY (`crypto_id`) REFERENCES `cryptocurrency_rates` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
