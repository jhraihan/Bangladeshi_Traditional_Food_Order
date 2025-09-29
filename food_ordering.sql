-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2025 at 09:21 PM
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
-- Database: `food_ordering`
--

-- --------------------------------------------------------

--
-- Table structure for table `food_items`
--

CREATE TABLE `food_items` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_color` varchar(7) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_items`
--

INSERT INTO `food_items` (`id`, `name`, `category`, `description`, `price`, `image_color`, `created_at`) VALUES
(26, 'Biryani', 'rice', 'Fragrant rice cooked with aromatic spices and tender meat', 320.00, '#8B4513', '2025-09-28 20:52:36'),
(27, 'Hilsa Fish Curry', 'curry', 'National fish cooked in mustard gravy with spices', 450.00, '#FFD700', '2025-09-28 20:52:36'),
(28, 'Beef Bhuna', 'curry', 'Slow-cooked beef with traditional Bengali spices', 280.00, '#8B0000', '2025-09-28 20:52:36'),
(29, 'Bhuna Khichuri', 'rice', 'Aromatic rice and lentils cooked with special spices', 180.00, '#CD853F', '2025-09-28 20:52:36'),
(30, 'Kala Bhuna', 'curry', 'Traditional dark beef curry with rich flavors', 350.00, '#654321', '2025-09-28 20:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_email` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('pending','confirmed','preparing','delivered') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_email`, `customer_phone`, `total_amount`, `status`, `created_at`) VALUES
(1, 'jahid', 'abc@gmail.com', '1234', 320.00, 'pending', '2025-09-24 21:13:50'),
(2, 'jahid', 'jahid@gmail.com', '12345678900', 920.00, 'pending', '2025-09-27 11:47:55'),
(3, 'a', 'a@gmail.com', '123', 320.00, 'pending', '2025-09-27 11:49:25'),
(4, 'abc', 'abc@gmail.com', '23', 320.00, 'pending', '2025-09-27 16:50:29'),
(5, 'a', 'a@gmail.com', '123', 320.00, 'pending', '2025-09-27 17:37:17'),
(6, 'jahid', 'jahid@gmail.com', '12345676454', 320.00, 'pending', '2025-09-27 17:49:02'),
(7, 'jahid', 'jahid@gmail.com', '1234', 640.00, 'confirmed', '2025-09-27 19:37:54'),
(8, 'rafsi', 'rafsi@gmail.com', '1234', 770.00, 'confirmed', '2025-09-27 19:45:08'),
(9, 'ifty', 'ifty@gmail.com', '1234', 1160.00, 'confirmed', '2025-09-28 10:24:29'),
(11, 'tahir', 'tahir@gmail.com', '1233', 570.00, 'confirmed', '2025-09-28 20:21:52'),
(12, 'faysal', 'faysal@gmail.com', '1234', 320.00, 'confirmed', '2025-09-28 20:29:45');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `food_item_id` int(11) DEFAULT NULL,
  `food_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `food_item_id`, `food_name`, `quantity`, `price`) VALUES
(1, 1, 1, 'Biryani', 1, 320.00),
(2, 2, 1, 'Biryani', 2, 320.00),
(3, 2, 3, 'Beef Bhuna', 1, 280.00),
(4, 3, 1, 'Biryani', 1, 320.00),
(5, 4, 1, 'Biryani', 1, 320.00),
(6, 5, 1, 'Biryani', 1, 320.00),
(7, 6, 1, 'Biryani', 1, 320.00),
(8, 7, 1, 'Biryani', 2, 320.00),
(9, 8, 1, 'Biryani', 1, 320.00),
(10, 8, 2, 'Hilsa Fish Curry', 1, 450.00),
(11, 9, 1, 'Biryani', 2, 320.00),
(12, 9, 3, 'Beef Bhuna', 1, 280.00),
(13, 9, 5, 'Rasgulla', 2, 120.00),
(15, 11, 5, 'Rasgulla', 1, 120.00),
(16, 11, 7, 'Hilsa Fish Curry', 1, 450.00),
(17, 12, 21, 'Biryani', 1, 320.00);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('customer','vendor') DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `food_items`
--
ALTER TABLE `food_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `food_items`
--
ALTER TABLE `food_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
