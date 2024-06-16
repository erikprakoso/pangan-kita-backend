-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2024 at 04:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pangan_kita_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `photo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `photo`) VALUES
(1, 'Fruits', 'fruits.jpg'),
(2, 'Vegetables', 'vegetables.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `food_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `name`, `food_id`) VALUES
(1, 'Vitamin A', 1),
(2, 'Vitamin C', 1),
(3, 'Fiber', 2),
(4, 'Vitamin B6', 3);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(15) NOT NULL,
  `price` float NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `name`, `description`, `photo`, `whatsapp_number`, `price`, `category_id`) VALUES
(1, 'Apple', 'A fruit with red or green skin and a crisp flesh.', 'apple.jpg', '123456789', 1.99, 1),
(2, 'Banana', 'A long curved fruit which grows in clusters.', 'banana.jpg', '987654321', 0.99, 1),
(3, 'Carrot', 'A long, orange vegetable with a green top.', 'carrot.jpg', '111222333', 0.5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`) VALUES
(1, 'superadmin@example.com', 'superadmin', 'pbkdf2:sha256:600000$4uJM9r7pkIxQfA3j$b006286ecb443d7b397161cf228f045ae39e3c2e5bcbaeaedbbf2f5acf013b3d'),
(2, 'superadmin@example.com', 'superadmin', 'pbkdf2:sha256:600000$3IHc2FTxZV8kQN0d$564814df0c020cde667f93a5e2f076e37be8d01187b71cd6e8938ecb468dd5a6'),
(3, 'superadmin@example.com', 'superadmin', 'pbkdf2:sha256:600000$Zgz3WMr2GDPQnaNv$ee5d4356e8f3812c0f9d37c76a3f43d710f89cee7bcbfdd6187703bb3baca896'),
(4, 'superadmin@example.com', 'superadmin', 'pbkdf2:sha256:600000$XrhuTu0B05Po5mb1$13063edaadc4609892b423264b2a17879620334d6df9b7fe7e995d7c864ea5aa'),
(5, 'superadmin@example.com', 'superadmin', 'pbkdf2:sha256:600000$WDsLhAHQUV9H59RA$4eecf36143d24039c4e31b7d5153e79df65b6575ebcca2528f7829ba2c22f95f');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `content_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
