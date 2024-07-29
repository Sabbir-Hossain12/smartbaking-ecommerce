-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 29, 2024 at 09:33 AM
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
-- Database: `smartbaking`
--

-- --------------------------------------------------------

--
-- Table structure for table `addbanners`
--

CREATE TABLE `addbanners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `add_link` text DEFAULT NULL,
  `add_image` longtext NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addbanners`
--

INSERT INTO `addbanners` (`id`, `add_link`, `add_image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'https://arishatex.com/products/category/mens-items', 'public/images/addbanner/1711205557_Navy and Pink Modern Digital Marketing Agency SEEK Cover Image.png', 'Active', '2022-06-11 11:18:46', '2024-03-25 23:20:55'),
(2, NULL, 'public/images/addbanner/1711205567_4-min.png', 'Active', '2022-06-11 11:18:46', '2024-03-24 05:09:44'),
(3, NULL, 'public/images/addbanner/1711205579_5-min.png', 'Active', '2022-06-11 11:18:46', '2024-03-24 05:09:37'),
(4, 'http://localhost/ayebazar/', 'public/images/addbanner/1662806980_mrk0XIL2iXt7TPbwicn9YNwJK1RJot0EJ1MNKWBz.jpeg', 'Inactive', '2022-06-11 11:18:46', '2023-10-24 23:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `profile` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone`, `email`, `email_verified_at`, `password`, `status`, `profile`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Seenur(Super Admin)', '01600000000', 'admin@gmail.com', NULL, '$2y$10$o3.uHEVCSkJYAzyxa6kDkOk9hW6LvMXqyhsQPHErvwBw4pQY17N9e', 'Active', 'public/images/admin/profile/1700475609_shopping-bag.png', NULL, '2022-06-01 03:01:09', '2023-11-20 04:20:09'),
(11, 'Sohel', '01916504945', 'admin@bigbazarbd24.com', NULL, '$2y$10$1geZhNfNmWWTekog0.YID.XcevNEXud4N5wvXdlHkjVQLVrZ0N.Je', 'Active', NULL, NULL, '2023-11-20 10:01:41', '2023-11-20 10:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `attribute_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Weight', 'Active', '2022-06-12 04:09:25', '2023-09-08 02:40:05'),
(2, 'Size', 'Active', '2022-06-12 04:09:32', '2023-09-08 02:40:03'),
(3, 'Colour', 'Active', '2022-06-13 11:18:47', '2023-09-08 02:40:26');

-- --------------------------------------------------------

--
-- Table structure for table `attrvalues`
--

CREATE TABLE `attrvalues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` text DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attrvalues`
--

INSERT INTO `attrvalues` (`id`, `attribute_id`, `attribute_name`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Colour', 'Black', 'Active', '2023-09-08 02:40:50', '2023-09-08 02:40:50'),
(2, 3, 'Colour', 'Blue', 'Active', '2023-09-08 02:41:03', '2023-09-08 02:41:03'),
(3, 3, 'Colour', 'White', 'Active', '2023-09-08 02:41:12', '2023-09-08 02:41:12'),
(4, 3, 'Colour', 'Maroon', 'Active', '2023-09-08 02:41:21', '2023-09-08 02:41:21'),
(5, 3, 'Colour', 'Pink', 'Active', '2023-09-08 02:41:30', '2023-09-08 02:41:30'),
(6, 3, 'Colour', 'Green', 'Active', '2023-09-08 02:41:42', '2023-09-08 02:41:42'),
(8, 2, 'Size', 'Free Size', 'Active', '2023-09-08 02:43:00', '2023-09-08 02:43:00'),
(9, 2, 'Size', 'M', 'Active', '2023-09-08 02:43:06', '2023-09-08 02:43:06'),
(10, 2, 'Size', 'L', 'Active', '2023-09-08 02:43:10', '2023-09-08 02:43:10'),
(11, 1, 'Weight', '.5 kg', 'Active', '2023-09-08 02:59:23', '2023-09-09 00:19:47'),
(12, 1, 'Weight', '1kg', 'Active', '2023-09-08 02:59:29', '2023-09-08 02:59:29'),
(13, 2, 'Size', 'XL', 'Active', '2023-09-09 00:18:27', '2023-09-09 00:18:27'),
(14, 2, 'Size', 'XXL', 'Active', '2023-09-09 00:18:32', '2023-09-09 00:18:32'),
(15, 2, 'Size', '38', 'Active', '2023-09-09 00:18:47', '2023-09-09 00:18:47'),
(16, 2, 'Size', '40', 'Active', '2023-09-09 00:18:52', '2023-09-09 00:18:52'),
(17, 2, 'Size', '42', 'Active', '2023-09-09 00:18:56', '2023-09-09 00:18:56'),
(18, 2, 'Size', '44', 'Active', '2023-09-09 00:19:00', '2023-09-09 00:19:00'),
(19, 2, 'Size', '46', 'Active', '2023-09-09 00:19:05', '2023-09-09 00:19:05'),
(20, 2, 'Size', '48', 'Active', '2023-09-09 00:19:08', '2023-09-09 00:19:08'),
(21, 3, 'Colour', 'Magenta', 'Active', '2023-09-09 00:24:12', '2023-09-09 00:24:12'),
(22, 3, 'Colour', 'Yellow', 'Active', '2023-09-09 00:24:19', '2023-09-09 00:24:19'),
(23, 3, 'Colour', 'Red', 'Active', '2023-09-09 00:24:24', '2023-09-09 00:24:24'),
(24, 3, 'Colour', 'Bangi', 'Active', '2023-09-09 00:24:30', '2023-09-09 00:24:30'),
(25, 3, 'Colour', 'Aqua', 'Active', '2023-09-09 00:24:36', '2023-09-09 00:24:36'),
(26, 3, 'Colour', 'Misty', 'Active', '2023-09-09 00:24:43', '2023-09-09 00:24:43'),
(27, 3, 'Colour', 'Gold', 'Active', '2023-09-09 00:24:48', '2023-09-09 00:24:48'),
(28, 3, 'Colour', 'Tiya', 'Active', '2023-09-09 00:24:54', '2023-09-09 00:24:54'),
(29, 3, 'Colour', 'Olive', 'Active', '2023-09-09 00:24:59', '2023-09-09 00:24:59'),
(30, 3, 'Colour', 'Purple', 'Active', '2023-09-09 00:25:06', '2023-09-09 00:25:06'),
(31, 3, 'Colour', 'Ash', 'Active', '2023-09-09 00:25:12', '2023-09-09 00:25:12'),
(32, 3, 'Colour', 'Light Ash', 'Active', '2023-09-09 00:25:19', '2023-09-09 00:25:19'),
(33, 3, 'Colour', 'Dark Ash', 'Active', '2023-09-09 00:25:24', '2023-09-09 00:25:24'),
(34, 3, 'Colour', 'Light Yellow', 'Active', '2023-09-09 00:25:35', '2023-09-09 00:25:35'),
(35, 3, 'Colour', 'Deep Yellow', 'Active', '2023-09-09 00:25:42', '2023-09-09 00:25:42'),
(36, 3, 'Colour', 'Light Green', 'Active', '2023-09-09 00:25:51', '2023-09-09 00:25:51'),
(37, 3, 'Colour', 'Light Pink', 'Active', '2023-09-09 00:26:09', '2023-09-09 00:26:09'),
(38, 3, 'Colour', 'Deep Green', 'Active', '2023-09-09 00:27:00', '2023-09-09 00:27:00'),
(39, 2, 'Size', 'S', 'Active', '2023-09-10 00:57:48', '2023-09-10 00:57:48'),
(40, 2, 'Size', '5-8 Years', 'Active', '2023-09-10 00:59:16', '2023-09-10 00:59:16'),
(41, 2, 'Size', '8-12 Years', 'Active', '2023-09-10 01:00:20', '2023-09-10 01:00:20'),
(42, 3, 'Colour', 'Onion', 'Active', '2023-09-10 03:31:20', '2023-09-10 03:31:20'),
(43, 3, 'Colour', 'Peach', 'Active', '2023-09-10 03:31:27', '2023-09-10 03:31:27'),
(44, 3, 'Colour', 'Velvet', 'Active', '2023-09-10 03:55:18', '2023-09-10 04:03:02'),
(45, 3, 'Colour', 'Paste', 'Active', '2023-09-10 03:55:23', '2023-09-10 03:55:23'),
(46, 3, 'Colour', 'Biscuit', 'Active', '2023-09-10 03:55:44', '2023-09-10 03:55:44'),
(47, 3, 'Colour', 'Orrange', 'Active', '2023-09-10 04:06:51', '2023-09-10 04:06:51'),
(48, 3, 'Colour', 'Sea Green', 'Active', '2023-09-10 04:07:36', '2023-09-10 04:07:36'),
(49, 3, 'Colour', 'Camel', 'Active', '2023-09-11 04:06:55', '2023-10-26 01:43:00'),
(50, 3, 'Colour', 'Brown', 'Active', '2023-10-26 05:38:24', '2023-10-26 05:38:24'),
(51, 3, 'Colour', 'Midnight Black', 'Active', '2023-11-01 01:59:59', '2023-11-01 01:59:59'),
(52, 3, 'Colour', 'Sky Blue', 'Active', '2023-11-01 02:00:11', '2023-11-01 02:00:11'),
(53, 3, 'Colour', 'Polar Silver', 'Active', '2023-11-01 02:00:21', '2023-11-01 02:00:21'),
(54, 3, 'Colour', 'Onyx Gray', 'Active', '2023-11-01 02:32:37', '2023-11-01 02:32:37'),
(55, 3, 'Colour', 'Mint Green', 'Active', '2023-11-01 02:32:54', '2023-11-01 02:32:54'),
(56, 3, 'Colour', 'Ice Blue', 'Active', '2023-11-01 02:33:13', '2023-11-01 02:33:13'),
(57, 3, 'Colour', 'Sunrise Gold', 'Active', '2023-11-01 02:36:25', '2023-11-01 02:36:25'),
(58, 3, 'Colour', 'Orange', 'Active', '2023-11-03 09:19:06', '2023-11-03 09:19:06'),
(59, 3, 'Colour', 'Silver', 'Active', '2023-11-03 09:19:26', '2023-11-03 09:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `basicinfos`
--

CREATE TABLE `basicinfos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `usd_rate` float(10,2) DEFAULT 0.00,
  `phone_one` varchar(255) DEFAULT NULL,
  `phone_two` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `facebook_pixel` text DEFAULT NULL,
  `google_analytics` text DEFAULT NULL,
  `chat_box` text DEFAULT NULL,
  `marquee_text` longtext DEFAULT NULL,
  `inside_dhaka_charge` varchar(255) DEFAULT NULL,
  `outside_dhaka_charge` varchar(255) DEFAULT NULL,
  `insie_dhaka` varchar(255) DEFAULT NULL,
  `outside_dhaka` varchar(255) DEFAULT NULL,
  `cash_on_delivery` varchar(255) DEFAULT NULL,
  `refund_rule` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `google` varchar(255) DEFAULT NULL,
  `rss` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `service_payment_status` varchar(255) NOT NULL DEFAULT 'Itstation',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `basicinfos`
--

INSERT INTO `basicinfos` (`id`, `usd_rate`, `phone_one`, `phone_two`, `email`, `logo`, `address`, `facebook_pixel`, `google_analytics`, `chat_box`, `marquee_text`, `inside_dhaka_charge`, `outside_dhaka_charge`, `insie_dhaka`, `outside_dhaka`, `cash_on_delivery`, `refund_rule`, `contact`, `facebook`, `twitter`, `google`, `rss`, `pinterest`, `linkedin`, `youtube`, `service_payment_status`, `created_at`, `updated_at`) VALUES
(1, 112.00, '01731115588', NULL, 'admin@gmail.com', 'public/images/categorybanner/1716637526_1716455558_images (1).jpg', 'Office & Shop Address:\r\nGround Floor\r\nHouse : 01\r\nRoad : 7/A\r\nSector : 05\r\nUttara Dhaka - 1230', '', '', '', 'Danpite.tech অনলাইন শপিং এ আপনাকে স্বাগতম । সকাল ৯ টা থেকে রাত ১০ টা পর্যন্ত ফোনে অর্ডার করতে পারবেন, রাত ১০ টার পরে ( অর্ডার করুন ) ক্লিক করে অর্ডার করার জন্য অনুরোধ করছি ।', '60', '100', '2-3 working days', '3-4 working days', 'ON', 'Within 7 Days', '01731115588', 'https://www.facebook.com/profile.php?id=100054504337934', NULL, NULL, NULL, NULL, NULL, NULL, 'Itstation', '2022-07-29 22:20:59', '2024-05-25 05:45:26');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand_icon` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `slug`, `brand_icon`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Xiaomi Redmi', 'xiaomi-redmi', 'public/images/brand/1698824585_Xiaomi-logo.png', 'Active', '2023-11-01 01:43:05', '2023-11-01 01:48:30'),
(3, 'Samsung', 'samsung', 'public/images/brand/1698824732_Samsung.jpg', 'Active', '2023-11-01 01:45:32', '2023-11-01 01:45:32'),
(4, 'Realme', 'realme', 'public/images/brand/1698824777_realme.png', 'Active', '2023-11-01 01:46:17', '2023-11-01 01:46:17'),
(5, 'New', 'new', 'public/images/brand/1716631930_1663407230_kidszone.webp', 'Active', '2024-05-25 04:12:10', '2024-05-25 04:12:10');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_icon` text DEFAULT NULL,
  `category_image` text DEFAULT NULL,
  `front_status` tinyint(4) NOT NULL DEFAULT 1,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `slug`, `category_icon`, `category_image`, `front_status`, `status`, `created_at`, `updated_at`) VALUES
(16, 'Men\'s Items', 'mens-items', 'public/images/category/1711266088_3.webp', NULL, 0, 'Active', '2024-03-23 08:18:41', '2024-05-25 04:08:05'),
(17, 'Boys Items', 'boys-items', 'public/images/category/1711266493_311124140_196870402702576_861870455480665238_n.webp', NULL, 1, 'Active', '2024-03-24 01:48:13', '2024-03-24 01:48:13'),
(18, 'Girls Items', 'girls-items', 'public/images/category/1711266653_offset_833514.webp', NULL, 1, 'Active', '2024-03-24 01:50:53', '2024-03-24 01:50:53'),
(19, 'Ladies Items', 'ladies-items', 'public/images/category/1711266833_main-qimg-c79272abe2aa4b7c87ca35132499075e.webp', NULL, 1, 'Active', '2024-03-24 01:53:53', '2024-03-24 01:53:53'),
(20, 'Men\'s  Boys Panjabi Item', 'mens-boys-panjabi-item', 'public/images/category/1711267082_Xhk0Y5cCJ1l8KhUXn2Kmt8qCZvUpBiSnbFTXoyzQ.webp', NULL, 1, 'Active', '2024-03-24 01:58:02', '2024-03-24 01:58:02'),
(21, 'Men\'s Ladies Wallet Item', 'mens-ladies-wallet-item', 'public/images/category/1711267156_aaabada6-f25e-4507-8383-44a812517750.6dafd33b43062dcb912513c9d0aafb38.webp', NULL, 1, 'Active', '2024-03-24 01:59:16', '2024-03-24 01:59:16'),
(24, 'HandyCraft', 'handycraft', 'public/images/category/1720683062_two.webp', NULL, 1, 'Active', '2024-07-11 01:31:02', '2024-07-11 01:31:02'),
(25, 'Art', 'art', 'public/images/category/1720683076_one.webp', NULL, 1, 'Active', '2024-07-11 01:31:16', '2024-07-11 01:31:16'),
(26, 'Pot', 'pot', 'public/images/category/1720683098_two.webp', NULL, 1, 'Active', '2024-07-11 01:31:38', '2024-07-11 01:31:38');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `courier_id` int(11) NOT NULL,
  `division` varchar(255) DEFAULT NULL,
  `cityName` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `courier_id`, `division`, `cityName`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Barishal', 'Active', '2020-04-28 09:13:29', '2020-04-28 09:13:29'),
(2, 1, NULL, 'Chandpur', 'Active', '2020-04-28 09:13:30', '2020-04-28 09:13:30'),
(3, 1, NULL, 'Chapainawabganj', 'Active', '2020-04-28 09:13:31', '2020-04-28 09:13:31'),
(4, 1, NULL, 'Chittagong', 'Active', '2020-04-28 09:13:32', '2020-04-28 09:13:32'),
(5, 1, NULL, 'Chuadanga ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(6, 1, NULL, 'Cox\'s Bazar', 'Active', '2020-04-28 09:13:35', '2020-04-28 09:13:35'),
(7, 1, NULL, 'Cumilla', 'Active', '2020-04-28 09:13:35', '2020-04-28 09:13:35'),
(8, 1, NULL, 'Dhaka', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(9, 1, NULL, 'Dinajpur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(10, 1, NULL, 'Faridpur', 'Active', '2020-04-28 09:13:40', '2020-04-28 09:13:40'),
(11, 1, NULL, 'Habiganj', 'Active', '2020-04-28 09:13:41', '2020-04-28 09:13:41'),
(12, 1, NULL, 'Jashore', 'Active', '2020-04-28 09:13:42', '2020-04-28 09:13:42'),
(13, 1, NULL, 'Jhalokathi', 'Active', '2020-04-28 09:13:44', '2020-04-28 09:13:44'),
(14, 1, NULL, 'Jhenidah', 'Active', '2020-04-28 09:13:45', '2020-04-28 09:13:45'),
(15, 1, NULL, 'Khulna', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(16, 1, NULL, 'Lakshmipur', 'Active', '2020-04-28 09:13:47', '2020-04-28 09:13:47'),
(17, 1, NULL, 'Lalmonirhat ', 'Active', '2020-04-28 09:13:47', '2020-04-28 09:13:47'),
(18, 1, NULL, 'Magura ', 'Active', '2020-04-28 09:13:48', '2020-04-28 09:13:48'),
(19, 1, NULL, 'Meherpur', 'Active', '2020-04-28 09:13:50', '2020-04-28 09:13:50'),
(20, 1, NULL, 'Naogaon', 'Active', '2020-04-28 09:13:51', '2020-04-28 09:13:51'),
(21, 1, NULL, 'Narshingdi', 'Active', '2020-04-28 09:13:52', '2020-04-28 09:13:52'),
(22, 1, NULL, 'Natore', 'Active', '2020-04-28 09:13:53', '2020-04-28 09:13:53'),
(23, 1, NULL, 'Nilphamari', 'Active', '2020-04-28 09:13:55', '2020-04-28 09:13:55'),
(24, 1, NULL, 'Noakhali', 'Active', '2020-04-28 09:13:56', '2020-04-28 09:13:56'),
(25, 1, NULL, 'Pirojpur', 'Active', '2020-04-28 09:13:57', '2020-04-28 09:13:57'),
(26, 1, NULL, 'Rajshahi', 'Active', '2020-04-28 09:13:59', '2020-04-28 09:13:59'),
(27, 1, NULL, 'Rangpur', 'Active', '2020-04-28 09:14:00', '2020-04-28 09:14:00'),
(28, 1, NULL, 'Sirajganj', 'Active', '2020-04-28 09:14:01', '2020-04-28 09:14:01'),
(29, 1, NULL, 'Sylhet', 'Active', '2020-04-28 09:14:02', '2020-04-28 09:14:02'),
(30, 2, NULL, 'Nasirabad', 'Active', '2020-04-28 09:13:29', '2020-04-28 09:13:29'),
(31, 2, NULL, 'Halishohor', 'Active', '2020-04-29 09:13:29', '2020-04-29 09:13:29'),
(32, 2, NULL, 'C.E.P.Z', 'Active', '2020-04-30 09:13:29', '2020-04-30 09:13:29'),
(33, 2, NULL, 'Keranirhat', 'Active', '2020-05-01 09:13:29', '2020-05-01 09:13:29'),
(34, 2, NULL, 'Kalurghat', 'Active', '2020-05-02 09:13:29', '2020-05-02 09:13:29'),
(35, 2, NULL, 'Hajigonj', 'Active', '2020-05-03 09:13:29', '2020-05-03 09:13:29'),
(36, 2, NULL, 'Comilla', 'Active', '2020-05-04 09:13:29', '2020-05-04 09:13:29'),
(37, 2, NULL, 'Feni', 'Active', '2020-05-05 09:13:29', '2020-05-05 09:13:29'),
(38, 2, NULL, 'Naokhali', 'Active', '2020-05-06 09:13:29', '2020-05-06 09:13:29'),
(39, 2, NULL, 'Chowmohoni', 'Active', '2020-05-07 09:13:29', '2020-05-07 09:13:29'),
(40, 2, NULL, 'Cox\'s Bazar', 'Active', '2020-05-08 09:13:29', '2020-05-08 09:13:29'),
(41, 2, NULL, 'B-Baria', 'Active', '2020-05-09 09:13:29', '2020-05-09 09:13:29'),
(42, 2, NULL, 'Laxmipur', 'Active', '2020-05-10 09:13:29', '2020-05-10 09:13:29'),
(43, 2, NULL, 'Rangamati', 'Active', '2020-05-11 09:13:29', '2020-05-11 09:13:29'),
(44, 2, NULL, 'Hatia', 'Active', '2020-05-12 09:13:29', '2020-05-12 09:13:29'),
(45, 2, NULL, 'Bogura', 'Active', '2020-05-13 09:13:29', '2020-05-13 09:13:29'),
(46, 2, NULL, 'Chapainawabgonj', 'Active', '2020-05-14 09:13:29', '2020-05-14 09:13:29'),
(47, 2, NULL, 'Rajshahi', 'Active', '2020-05-15 09:13:29', '2020-05-15 09:13:29'),
(48, 2, NULL, 'Naogaon', 'Active', '2020-05-16 09:13:29', '2020-05-16 09:13:29'),
(49, 2, NULL, 'Jaypurhat', 'Active', '2020-05-17 09:13:29', '2020-05-17 09:13:29'),
(50, 2, NULL, 'Natore', 'Active', '2020-05-18 09:13:29', '2020-05-18 09:13:29'),
(51, 2, NULL, 'Pabna', 'Active', '2020-05-19 09:13:29', '2020-05-19 09:13:29'),
(52, 2, NULL, 'Sirajgonj', 'Active', '2020-05-20 09:13:29', '2020-05-20 09:13:29'),
(53, 2, NULL, 'Baneshor', 'Active', '2020-05-21 09:13:29', '2020-05-21 09:13:29'),
(54, 2, NULL, 'Rangpur', 'Active', '2020-05-22 09:13:29', '2020-05-22 09:13:29'),
(55, 2, NULL, 'Gaibandah', 'Active', '2020-05-23 09:13:29', '2020-05-23 09:13:29'),
(56, 2, NULL, 'Sayedpur', 'Active', '2020-05-24 09:13:29', '2020-05-24 09:13:29'),
(57, 2, NULL, 'Dinajpur', 'Active', '2020-05-25 09:13:29', '2020-05-25 09:13:29'),
(58, 2, NULL, 'Kurigram', 'Active', '2020-05-26 09:13:29', '2020-05-26 09:13:29'),
(59, 2, NULL, 'Lalmonirhat', 'Active', '2020-05-27 09:13:29', '2020-05-27 09:13:29'),
(60, 2, NULL, 'Thakurgaon', 'Active', '2020-05-28 09:13:29', '2020-05-28 09:13:29'),
(61, 2, NULL, 'Panchigar', 'Active', '2020-05-29 09:13:29', '2020-05-29 09:13:29'),
(62, 2, NULL, 'Sylhet', 'Active', '2020-05-30 09:13:29', '2020-05-30 09:13:29'),
(63, 2, NULL, 'Moulovibazar', 'Active', '2020-05-31 09:13:29', '2020-05-31 09:13:29'),
(64, 2, NULL, 'Sreemangal', 'Active', '2020-06-01 09:13:29', '2020-06-01 09:13:29'),
(65, 2, NULL, 'Lamabazar', 'Active', '2020-06-02 09:13:29', '2020-06-02 09:13:29'),
(66, 2, NULL, 'Chatok', 'Active', '2020-06-03 09:13:29', '2020-06-03 09:13:29'),
(67, 2, NULL, 'Sunamgonj', 'Active', '2020-06-04 09:13:29', '2020-06-04 09:13:29'),
(68, 2, NULL, 'Barisal', 'Active', '2020-06-05 09:13:29', '2020-06-05 09:13:29'),
(69, 2, NULL, 'Patuakhali', 'Active', '2020-06-06 09:13:29', '2020-06-06 09:13:29'),
(70, 2, NULL, 'Jhalokathi', 'Active', '2020-06-07 09:13:29', '2020-06-07 09:13:29'),
(71, 2, NULL, 'Bhola', 'Active', '2020-06-08 09:13:29', '2020-06-08 09:13:29'),
(72, 2, NULL, 'Borguna', 'Active', '2020-06-09 09:13:29', '2020-06-09 09:13:29'),
(73, 2, NULL, 'Benapole', 'Active', '2020-06-10 09:13:29', '2020-06-10 09:13:29'),
(74, 2, NULL, 'Khulna', 'Active', '2020-06-11 09:13:29', '2020-06-11 09:13:29'),
(75, 2, NULL, 'Satkhira', 'Active', '2020-06-12 09:13:29', '2020-06-12 09:13:29'),
(76, 2, NULL, 'bagerhat', 'Active', '2020-06-13 09:13:29', '2020-06-13 09:13:29'),
(77, 2, NULL, 'Chuadanga', 'Active', '2020-06-14 09:13:29', '2020-06-14 09:13:29'),
(78, 2, NULL, 'Khulna Doulatpur', 'Active', '2020-06-15 09:13:29', '2020-06-15 09:13:29'),
(79, 2, NULL, 'Khulna Biman Office', 'Active', '2020-06-16 09:13:29', '2020-06-16 09:13:29'),
(80, 2, NULL, 'Jasshor', 'Active', '2020-06-17 09:13:29', '2020-06-17 09:13:29'),
(81, 2, NULL, 'Meherpur', 'Active', '2020-06-18 09:13:29', '2020-06-18 09:13:29'),
(82, 2, NULL, 'Jhenaidah', 'Active', '2020-06-19 09:13:29', '2020-06-19 09:13:29'),
(83, 2, NULL, 'Kustia', 'Active', '2020-06-20 09:13:29', '2020-06-20 09:13:29'),
(84, 2, NULL, 'Mongla', 'Active', '2020-06-21 09:13:29', '2020-06-21 09:13:29'),
(85, 2, NULL, 'Nawapara', 'Active', '2020-06-22 09:13:29', '2020-06-22 09:13:29'),
(86, 2, NULL, 'Narail', 'Active', '2020-06-23 09:13:29', '2020-06-23 09:13:29'),
(87, 2, NULL, 'Magura', 'Active', '2020-06-24 09:13:29', '2020-06-24 09:13:29'),
(88, 2, NULL, 'Faridpur', 'Active', '2020-06-25 09:13:29', '2020-06-25 09:13:29'),
(89, 2, NULL, 'Gazipur', 'Active', '2020-06-26 09:13:29', '2020-06-26 09:13:29'),
(90, 2, NULL, 'Narayangonj', 'Active', '2020-06-27 09:13:29', '2020-06-27 09:13:29'),
(91, 2, NULL, 'Jamalpur', 'Active', '2020-06-28 09:13:29', '2020-06-28 09:13:29'),
(92, 2, NULL, 'Mymensingh', 'Active', '2020-06-29 09:13:29', '2020-06-29 09:13:29'),
(93, 2, NULL, 'Savar', 'Active', '2020-06-30 09:13:29', '2020-06-30 09:13:29'),
(94, 2, NULL, 'DEPZ', 'Active', '2020-07-01 09:13:29', '2020-07-01 09:13:29'),
(95, 2, NULL, 'Tongi', 'Active', '2020-07-02 09:13:29', '2020-07-02 09:13:29'),
(96, 2, NULL, 'Gopalgonj', 'Active', '2020-07-03 09:13:29', '2020-07-03 09:13:29'),
(97, 2, NULL, 'Tekerhat', 'Active', '2020-07-04 09:13:29', '2020-07-04 09:13:29'),
(98, 2, NULL, 'Manikgonj', 'Active', '2020-07-05 09:13:29', '2020-07-05 09:13:29'),
(99, 2, NULL, 'Sherpur-Bogura', 'Active', '2020-07-06 09:13:29', '2020-09-07 18:43:37'),
(100, 2, NULL, 'Kishorgonj', 'Active', '2020-07-07 09:13:29', '2020-07-07 09:13:29'),
(101, 2, NULL, 'Tangail', 'Active', '2020-07-08 09:13:29', '2020-07-08 09:13:29'),
(102, 2, NULL, 'Bhairab', 'Active', '2020-07-09 09:13:29', '2020-07-09 09:13:29'),
(103, 2, NULL, 'Maona', 'Active', '2020-07-10 09:13:29', '2020-07-10 09:13:29'),
(104, 2, NULL, 'Narsingdi', 'Active', '2020-07-11 09:13:29', '2020-07-11 09:13:29'),
(105, 2, NULL, 'Rajbari', 'Active', '2020-07-12 09:13:29', '2020-07-12 09:13:29'),
(106, 2, NULL, 'Konabari', 'Active', '2020-07-13 09:13:29', '2020-07-13 09:13:29'),
(107, 2, NULL, 'Kallyanpur', 'Active', '2020-07-14 09:13:29', '2020-07-14 09:13:29'),
(108, 2, NULL, 'UTTRA', 'Active', '2020-07-15 09:13:29', '2020-07-15 09:13:29'),
(109, 2, NULL, 'Victoria Park', 'Active', '2020-07-16 09:13:29', '2020-07-16 09:13:29'),
(110, 2, NULL, 'Kawran Bazar', 'Active', '2020-07-17 09:13:29', '2020-07-17 09:13:29'),
(111, 2, NULL, 'Chamelibag', 'Active', '2020-07-18 09:13:29', '2020-07-18 09:13:29'),
(112, 2, NULL, 'Motaleb Plaza', 'Active', '2020-07-19 09:13:29', '2020-07-19 09:13:29'),
(113, 2, NULL, 'Corporate', 'Active', '2020-07-20 09:13:29', '2020-07-20 09:13:29'),
(114, 2, NULL, 'Shamoly', 'Active', '2020-07-21 09:13:29', '2020-07-21 09:13:29'),
(115, 2, NULL, 'Keranigonj', 'Active', '2020-07-22 09:13:29', '2020-07-22 09:13:29'),
(116, 2, NULL, 'Jatrabari', 'Active', '2020-07-23 09:13:29', '2020-07-23 09:13:29'),
(117, 2, NULL, 'Mirpur', 'Active', '2020-07-24 09:13:29', '2020-07-24 09:13:29'),
(118, 2, NULL, 'Dhanmondi', 'Active', '2020-07-25 09:13:29', '2020-07-25 09:13:29'),
(119, 2, NULL, 'Babu Bazar', 'Active', '2020-07-26 09:13:29', '2020-07-26 09:13:29'),
(120, 2, NULL, 'Savar', 'Active', '2020-07-27 09:13:29', '2020-07-27 09:13:29'),
(121, 2, NULL, 'Gazipur', 'Active', '2020-07-28 09:13:29', '2020-07-28 09:13:29'),
(122, 2, NULL, 'Narayanganj', 'Active', '2020-07-29 09:13:29', '2020-07-29 09:13:29'),
(123, 2, NULL, 'Faridpur', 'Active', '2020-07-30 09:13:29', '2020-07-30 09:13:29'),
(124, 2, NULL, 'Tangail', 'Active', '2020-07-31 09:13:29', '2020-07-31 09:13:29'),
(125, 2, NULL, 'Mymensingh', 'Active', '2020-08-01 09:13:29', '2020-08-01 09:13:29'),
(126, 2, NULL, 'Tekerhat', 'Active', '2020-08-02 09:13:29', '2020-08-02 09:13:29'),
(127, 2, NULL, 'Shariatpur', 'Active', '2020-08-03 09:13:29', '2020-08-03 09:13:29'),
(128, 2, NULL, 'Jamalpur', 'Active', '2020-08-04 09:13:29', '2020-08-04 09:13:29'),
(129, 2, NULL, 'Savar DEPZ', 'Active', '2020-08-05 09:13:29', '2020-08-05 09:13:29'),
(130, 2, NULL, 'Kishoreganj', 'Active', '2020-08-06 09:13:29', '2020-08-06 09:13:29'),
(131, 2, NULL, 'Rajbari', 'Active', '2020-08-07 09:13:29', '2020-08-07 09:13:29'),
(132, 2, NULL, 'Manikganj', 'Active', '2020-08-08 09:13:29', '2020-08-08 09:13:29'),
(133, 2, NULL, 'Tongi', 'Active', '2020-08-09 09:13:29', '2020-08-09 09:13:29'),
(134, 2, NULL, 'Sherpur-Jamalpur', 'Active', '2020-08-10 09:13:29', '2020-09-07 18:43:26'),
(135, 2, NULL, 'Agrabad', 'Active', '2020-08-11 09:13:29', '2020-08-11 09:13:29'),
(136, 2, NULL, 'Korbanigon', 'Active', '2020-08-12 09:13:29', '2020-08-12 09:13:29'),
(137, 2, NULL, 'Jublee Road', 'Active', '2020-08-13 09:13:29', '2020-08-13 09:13:29'),
(138, 2, NULL, 'Sandip', 'Active', '2020-08-14 09:13:29', '2020-08-14 09:13:29'),
(139, 2, NULL, 'Keranihat', 'Active', '2020-08-15 09:13:29', '2020-08-15 09:13:29'),
(140, 2, NULL, 'Haslishohor', 'Active', '2020-08-16 09:13:29', '2020-08-16 09:13:29'),
(141, 2, NULL, 'Chittagong EPZ', 'Active', '2020-08-17 09:13:29', '2020-08-17 09:13:29'),
(142, 2, NULL, 'Kalurghat', 'Active', '2020-08-18 09:13:29', '2020-08-18 09:13:29'),
(143, 2, NULL, 'Lohagora', 'Active', '2020-08-19 09:13:29', '2020-08-19 09:13:29'),
(144, 2, NULL, 'Nasirabad', 'Active', '2020-08-20 09:13:29', '2020-08-20 09:13:29'),
(145, 2, NULL, 'Reaz Uddin Bazar', 'Active', '2020-08-21 09:13:29', '2020-08-21 09:13:29'),
(146, 2, NULL, 'Cox`s Bazar', 'Active', '2020-08-22 09:13:29', '2020-08-22 09:13:29'),
(147, 2, NULL, 'Borisal', 'Active', '2020-08-23 09:13:29', '2020-08-23 09:13:29'),
(148, 2, NULL, 'Feni', 'Active', '2020-08-24 09:13:29', '2020-08-24 09:13:29'),
(149, 2, NULL, 'Noakhali', 'Active', '2020-08-25 09:13:29', '2020-08-25 09:13:29'),
(150, 2, NULL, 'Laxmipur', 'Active', '2020-08-26 09:13:29', '2020-08-26 09:13:29'),
(151, 2, NULL, 'Rangamati', 'Active', '2020-08-27 09:13:29', '2020-08-27 09:13:29'),
(152, 2, NULL, 'Brahmanbaria', 'Active', '2020-08-28 09:13:29', '2020-08-28 09:13:29'),
(153, 2, NULL, 'Chandpur', 'Active', '2020-08-29 09:13:29', '2020-08-29 09:13:29'),
(154, 2, NULL, 'Chowmuhuni', 'Active', '2020-08-30 09:13:29', '2020-08-30 09:13:29'),
(155, 2, NULL, 'Comilla', 'Active', '2020-08-31 09:13:29', '2020-08-31 09:13:29'),
(156, 2, NULL, 'Pirojpur Branch', 'Active', '2020-09-01 09:13:29', '2020-09-01 09:13:29'),
(157, 2, NULL, 'Jhalokathi Branch', 'Active', '2020-09-02 09:13:29', '2020-09-02 09:13:29'),
(158, 2, NULL, 'Patuakhali Branch', 'Active', '2020-09-03 09:13:29', '2020-09-03 09:13:29'),
(159, 2, NULL, 'Khulna', 'Active', '2020-09-04 09:13:29', '2020-09-04 09:13:29'),
(160, 2, NULL, 'Jessore', 'Active', '2020-09-05 09:13:29', '2020-09-05 09:13:29'),
(161, 2, NULL, 'Sathkira', 'Active', '2020-09-06 09:13:29', '2020-09-06 09:13:29'),
(162, 2, NULL, 'Bagerhat', 'Active', '2020-09-07 09:13:29', '2020-09-07 09:13:29'),
(163, 2, NULL, 'Chuadanga', 'Active', '2020-09-08 09:13:29', '2020-09-08 09:13:29'),
(164, 2, NULL, 'Benapole', 'Active', '2020-09-09 09:13:29', '2020-09-09 09:13:29'),
(165, 2, NULL, 'Kushtia', 'Active', '2020-09-10 09:13:29', '2020-09-10 09:13:29'),
(166, 2, NULL, 'Biman', 'Active', '2020-09-11 09:13:29', '2020-09-11 09:13:29'),
(167, 2, NULL, 'Daulatpur', 'Active', '2020-09-12 09:13:29', '2020-09-12 09:13:29'),
(168, 2, NULL, 'Fulbari', 'Active', '2020-09-13 09:13:29', '2020-09-13 09:13:29'),
(169, 2, NULL, 'Shib Bari', 'Active', '2020-09-14 09:13:29', '2020-09-14 09:13:29'),
(170, 2, NULL, 'Nirala Branch', 'Active', '2020-09-15 09:13:29', '2020-09-15 09:13:29'),
(171, 2, NULL, 'Rajshahi', 'Active', '2020-09-16 09:13:29', '2020-09-16 09:13:29'),
(172, 2, NULL, 'Naogaon', 'Active', '2020-09-17 09:13:29', '2020-09-17 09:13:29'),
(173, 2, NULL, 'Joypurhat', 'Active', '2020-09-18 09:13:29', '2020-09-18 09:13:29'),
(174, 2, NULL, 'Sirajgonj', 'Active', '2020-09-19 09:13:29', '2020-09-19 09:13:29'),
(175, 2, NULL, 'Natore', 'Active', '2020-09-20 09:13:29', '2020-09-20 09:13:29'),
(176, 2, NULL, 'Bogra', 'Active', '2020-09-21 09:13:29', '2020-09-21 09:13:29'),
(177, 2, NULL, 'Chapinawabganj', 'Active', '2020-09-22 09:13:29', '2020-09-22 09:13:29'),
(178, 2, NULL, 'Pabna', 'Active', '2020-09-23 09:13:29', '2020-09-23 09:13:29'),
(179, 2, NULL, 'Joypurhat', 'Active', '2020-09-24 09:13:29', '2020-09-24 09:13:29'),
(180, 2, NULL, 'Sylhet Branch', 'Active', '2020-09-25 09:13:29', '2020-09-25 09:13:29'),
(181, 2, NULL, 'Moulvibazar Branch', 'Active', '2020-09-26 09:13:29', '2020-09-26 09:13:29'),
(182, 2, NULL, 'Sunamganj Branch', 'Active', '2020-09-27 09:13:29', '2020-09-27 09:13:29'),
(183, 2, NULL, 'Srimangal Branch', 'Active', '2020-09-28 09:13:29', '2020-09-28 09:13:29'),
(184, 2, NULL, 'Thakurgaon Branch', 'Active', '2020-09-29 09:13:29', '2020-09-29 09:13:29'),
(185, 2, NULL, 'Ponchogor Branch', 'Active', '2020-09-30 09:13:29', '2020-09-30 09:13:29'),
(186, 2, NULL, 'Lalmonirhat Branch', 'Active', '2020-10-01 09:13:29', '2020-10-01 09:13:29'),
(187, 2, NULL, 'Rangpur Branch', 'Active', '2020-10-02 09:13:29', '2020-10-02 09:13:29'),
(188, 2, NULL, 'Dinajpur Branch', 'Active', '2020-10-03 09:13:29', '2020-10-03 09:13:29'),
(189, 2, NULL, 'Gaibandha Branch', 'Active', '2020-10-04 09:13:29', '2020-10-04 09:13:29'),
(190, 2, NULL, 'Syedpur Branch', 'Active', '2020-10-05 09:13:29', '2020-10-05 09:13:29'),
(191, 2, NULL, 'Kurigram Branch', 'Active', '2020-10-06 09:13:29', '2020-10-06 09:13:29'),
(269, 4, NULL, 'Dhaka', 'Active', '2020-04-28 15:10:02', '2020-04-28 15:10:02'),
(270, 4, NULL, 'Dhaka (Outside City)', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(271, 4, NULL, 'Chittagong City', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(272, 4, NULL, 'Chittagong (Outside City)', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(273, 4, NULL, 'khulna-City', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(274, 4, NULL, 'khulna (Outside City)', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(275, 4, NULL, 'Sylhet-City', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(276, 4, NULL, 'Sylhet (Outside City)', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(277, 4, NULL, 'Rajshahi City', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(278, 4, NULL, 'Rajshahi (Outside City)', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(279, 4, NULL, 'Gazipur', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(280, 4, NULL, 'Comilla', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(281, 4, NULL, 'Rangpur', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(282, 4, NULL, 'Narayanganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(283, 4, NULL, 'Jessore', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(284, 4, NULL, 'Bogra', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(285, 4, NULL, 'Barisal', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(286, 4, NULL, 'Dinajpur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(287, 4, NULL, 'Mymensingh', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(288, 4, NULL, 'Noakhali', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(289, 4, NULL, 'Feni', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(290, 4, NULL, 'Coxs Bazar', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(291, 4, NULL, 'Moulvibazar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(292, 4, NULL, 'Brahmanbaria', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(293, 4, NULL, 'Tangail', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(294, 4, NULL, 'Kushtia', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(295, 4, NULL, 'Habiganj', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(296, 4, NULL, 'Pabna', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(297, 4, NULL, 'Chandpur', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(298, 4, NULL, 'Naogaon', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(299, 4, NULL, 'Sirajganj', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(300, 4, NULL, 'Satkhira', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(301, 4, NULL, 'Faridpur', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(302, 4, NULL, 'Jamalpur', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(303, 4, NULL, 'Thakurgaon', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(304, 4, NULL, 'Narsingdi', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(305, 4, NULL, 'Kishoreganj', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(306, 4, NULL, 'Lakshmipur', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(307, 4, NULL, 'Chapai-Nawabganj', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(308, 4, NULL, 'Sunamganj', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(309, 4, NULL, 'Nilphamari', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(310, 4, NULL, 'Bagerhat', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(311, 4, NULL, 'Jhenaidah', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(312, 4, NULL, 'Meherpur', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(313, 4, NULL, 'Lalmonirhat', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(314, 4, NULL, 'Gopalganj', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(315, 4, NULL, 'Sherpur', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(316, 4, NULL, 'Natore', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(317, 4, NULL, 'Patuakhali', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(318, 4, NULL, 'Khagrachhari', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(319, 4, NULL, 'Munshiganj', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(320, 4, NULL, 'Kurigram', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(321, 4, NULL, 'Madaripur', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(322, 4, NULL, 'Chuadanga', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(323, 4, NULL, 'Rangamati', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(324, 4, NULL, 'Netrokona', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(325, 4, NULL, 'Pirojpur', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(326, 4, NULL, 'Magura', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(327, 4, NULL, 'Gaibandha', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(328, 4, NULL, 'Panchagarh', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(329, 4, NULL, 'Manikganj', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(330, 4, NULL, 'Jhalokati', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(331, 4, NULL, 'Narail', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(332, 4, NULL, 'Joypurhat', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(333, 4, NULL, 'Rajbari', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(334, 4, NULL, 'Shariatpur', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(335, 4, NULL, 'Bandarban', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(336, 4, NULL, 'Bhola', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(337, 4, NULL, 'Barguna', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(338, 7, NULL, 'Chokoria', 'Active', '2020-04-28 22:13:29', '2020-04-28 22:13:29'),
(339, 7, NULL, 'Cox\'s bazar', 'Active', '2020-04-29 22:13:29', '2020-04-29 22:13:29'),
(340, 7, NULL, 'Comilla', 'Active', '2020-04-30 22:13:29', '2020-04-30 22:13:29'),
(341, 7, NULL, 'Chandpur', 'Active', '2020-05-01 22:13:29', '2020-05-01 22:13:29'),
(342, 7, NULL, 'Hajigong', 'Active', '2020-05-02 22:13:29', '2020-05-02 22:13:29'),
(343, 7, NULL, 'Brahmanbaria', 'Active', '2020-05-03 22:13:29', '2020-05-03 22:13:29'),
(344, 7, NULL, 'Feni', 'Active', '2020-05-04 22:13:29', '2020-05-04 22:13:29'),
(345, 7, NULL, 'Chawmohony', 'Active', '2020-05-05 22:13:29', '2020-05-05 22:13:29'),
(346, 7, NULL, 'Maijdi', 'Active', '2020-05-06 22:13:29', '2020-05-06 22:13:29'),
(347, 7, NULL, 'Luxmipur', 'Active', '2020-05-07 22:13:29', '2020-05-07 22:13:29'),
(348, 7, NULL, 'A.K. Khan', 'Active', '2020-05-08 22:13:29', '2020-05-08 22:13:29'),
(349, 7, NULL, 'Khatunganj', 'Active', '2020-05-09 22:13:29', '2020-05-09 22:13:29'),
(350, 7, NULL, 'Kadamtoli', 'Active', '2020-05-10 22:13:29', '2020-05-10 22:13:29'),
(351, 7, NULL, 'Agrabad', 'Active', '2020-05-11 22:13:29', '2020-05-11 22:13:29'),
(352, 7, NULL, 'Chittagong EPZ', 'Active', '2020-05-12 22:13:29', '2020-05-12 22:13:29'),
(353, 7, NULL, 'Muradpur', 'Active', '2020-05-13 22:13:29', '2020-05-13 22:13:29'),
(354, 7, NULL, 'Khulna', 'Active', '2020-05-14 22:13:29', '2020-05-14 22:13:29'),
(355, 7, NULL, 'Nawapara', 'Active', '2020-05-15 22:13:29', '2020-05-15 22:13:29'),
(356, 7, NULL, 'Khalishpur', 'Active', '2020-05-16 22:13:29', '2020-05-16 22:13:29'),
(357, 7, NULL, 'Jessore New Market', 'Active', '2020-05-17 22:13:29', '2020-05-17 22:13:29'),
(358, 7, NULL, 'Jessore R.N. Road', 'Active', '2020-05-18 22:13:29', '2020-05-18 22:13:29'),
(359, 7, NULL, 'Jheniadah', 'Active', '2020-05-19 22:13:29', '2020-05-19 22:13:29'),
(360, 7, NULL, 'Kustia', 'Active', '2020-05-20 22:13:29', '2020-05-20 22:13:29'),
(361, 7, NULL, 'Rajshahi', 'Active', '2020-05-21 22:13:29', '2020-05-21 22:13:29'),
(362, 7, NULL, 'Baneshor', 'Active', '2020-05-22 22:13:29', '2020-05-22 22:13:29'),
(363, 7, NULL, 'Natore', 'Active', '2020-05-23 22:13:29', '2020-05-23 22:13:29'),
(364, 7, NULL, 'Chapainawbabganj', 'Active', '2020-05-24 22:13:29', '2020-05-24 22:13:29'),
(365, 7, NULL, 'Pabna', 'Active', '2020-05-25 22:13:29', '2020-05-25 22:13:29'),
(366, 7, NULL, 'Sirajganj', 'Active', '2020-05-26 22:13:29', '2020-05-26 22:13:29'),
(367, 7, NULL, 'Ishordi', 'Active', '2020-05-27 22:13:29', '2020-05-27 22:13:29'),
(368, 7, NULL, 'Bogra', 'Active', '2020-05-28 22:13:29', '2020-05-28 22:13:29'),
(369, 7, NULL, 'Naogaon', 'Active', '2020-05-29 22:13:29', '2020-05-29 22:13:29'),
(370, 7, NULL, 'Rangpur', 'Active', '2020-05-30 22:13:29', '2020-05-30 22:13:29'),
(371, 7, NULL, 'Syedpur', 'Active', '2020-05-31 22:13:29', '2020-05-31 22:13:29'),
(372, 7, NULL, 'Gobindaganj', 'Active', '2020-06-01 22:13:29', '2020-06-01 22:13:29'),
(373, 7, NULL, 'Dinajpur', 'Active', '2020-06-02 22:13:29', '2020-06-02 22:13:29'),
(374, 7, NULL, 'Birampur', 'Active', '2020-06-03 22:13:29', '2020-06-03 22:13:29'),
(375, 7, NULL, 'Fulbari', 'Active', '2020-06-04 22:13:29', '2020-06-04 22:13:29'),
(376, 7, NULL, 'Thakurgaon', 'Active', '2020-06-05 22:13:29', '2020-06-05 22:13:29'),
(377, 7, NULL, 'Sylhet', 'Active', '2020-06-06 22:13:29', '2020-06-06 22:13:29'),
(378, 7, NULL, 'Kadamgoli', 'Active', '2020-06-07 22:13:29', '2020-06-07 22:13:29'),
(379, 7, NULL, 'Moulvibazar', 'Active', '2020-06-08 22:13:29', '2020-06-08 22:13:29'),
(380, 7, NULL, 'Srimongal', 'Active', '2020-06-09 22:13:29', '2020-06-09 22:13:29'),
(381, 7, NULL, 'Habiganj', 'Active', '2020-06-10 22:13:29', '2020-06-10 22:13:29'),
(382, 7, NULL, 'Barisal', 'Active', '2020-06-11 22:13:29', '2020-06-11 22:13:29'),
(383, 7, NULL, 'Tekerhat', 'Active', '2020-06-12 22:13:29', '2020-06-12 22:13:29'),
(384, 7, NULL, 'Patuakhali', 'Active', '2020-06-13 22:13:29', '2020-06-13 22:13:29'),
(385, 7, NULL, 'Central Shorting Centre', 'Active', '2020-06-14 22:13:29', '2020-06-14 22:13:29'),
(386, 7, NULL, 'Mohammadpur', 'Active', '2020-06-15 22:13:29', '2020-06-15 22:13:29'),
(387, 7, NULL, 'Kawran Bazar', 'Active', '2020-06-16 22:13:29', '2020-06-16 22:13:29'),
(388, 7, NULL, 'Mohakhali', 'Active', '2020-06-17 22:13:29', '2020-06-17 22:13:29'),
(389, 7, NULL, 'Malibagh', 'Active', '2020-06-18 22:13:29', '2020-06-18 22:13:29'),
(390, 7, NULL, 'Malitola', 'Active', '2020-06-19 22:13:29', '2020-06-19 22:13:29'),
(391, 7, NULL, 'Bangla Bazar', 'Active', '2020-06-20 22:13:29', '2020-06-20 22:13:29'),
(392, 7, NULL, 'Chokbazar', 'Active', '2020-06-21 22:13:29', '2020-06-21 22:13:29'),
(393, 7, NULL, 'EPZ Dhaka', 'Active', '2020-06-22 22:13:29', '2020-06-22 22:13:29'),
(394, 7, NULL, 'Kawranbazar', 'Active', '2020-06-23 22:13:29', '2020-06-23 22:13:29'),
(395, 7, NULL, 'Nitaiganj', 'Active', '2020-06-24 22:13:29', '2020-06-24 22:13:29'),
(396, 7, NULL, 'Nawbabpur', 'Active', '2020-06-25 22:13:29', '2020-06-25 22:13:29'),
(397, 7, NULL, 'Gulistan', 'Active', '2020-06-26 22:13:29', '2020-06-26 22:13:29'),
(398, 7, NULL, 'Mirpur-10', 'Active', '2020-06-27 22:13:29', '2020-06-27 22:13:29'),
(399, 7, NULL, 'Mirpur-11', 'Active', '2020-06-28 22:13:29', '2020-06-28 22:13:29'),
(400, 7, NULL, 'Bijoy Nagar', 'Active', '2020-06-29 22:13:29', '2020-06-29 22:13:29'),
(401, 7, NULL, 'Elephant Road', 'Active', '2020-06-30 22:13:29', '2020-06-30 22:13:29'),
(402, 7, NULL, 'Uttara', 'Active', '2020-07-01 22:13:29', '2020-07-01 22:13:29'),
(403, 7, NULL, 'Jatrabari', 'Active', '2020-07-02 22:13:29', '2020-07-02 22:13:29'),
(404, 7, NULL, 'Polyal Market', 'Active', '2020-07-03 22:13:29', '2020-07-03 22:13:29'),
(405, 7, NULL, 'Stadium Market', 'Active', '2020-07-04 22:13:29', '2020-07-04 22:13:29'),
(406, 7, NULL, 'Bangla Motor', 'Active', '2020-07-05 22:13:29', '2020-07-05 22:13:29'),
(407, 7, NULL, 'Airport', 'Active', '2020-07-06 22:13:29', '2020-07-06 22:13:29'),
(408, 7, NULL, 'Keraniganj', 'Active', '2020-07-07 22:13:29', '2020-07-07 22:13:29'),
(409, 7, NULL, 'Savar', 'Active', '2020-07-08 22:13:29', '2020-07-08 22:13:29'),
(410, 7, NULL, 'Baipail', 'Active', '2020-07-09 22:13:29', '2020-07-09 22:13:29'),
(411, 7, NULL, 'Tongi', 'Active', '2020-07-10 22:13:29', '2020-07-10 22:13:29'),
(412, 7, NULL, 'Gazipur', 'Active', '2020-07-11 22:13:29', '2020-07-11 22:13:29'),
(413, 7, NULL, 'Mawna', 'Active', '2020-07-12 22:13:29', '2020-07-12 22:13:29'),
(414, 7, NULL, 'Munshiganj', 'Active', '2020-07-13 22:13:29', '2020-07-13 22:13:29'),
(415, 7, NULL, 'Narayanganj', 'Active', '2020-07-14 22:13:29', '2020-07-14 22:13:29'),
(416, 7, NULL, 'Manikganj', 'Active', '2020-07-15 22:13:29', '2020-07-15 22:13:29'),
(417, 7, NULL, 'Narsingdi', 'Active', '2020-07-16 22:13:29', '2020-07-16 22:13:29'),
(418, 7, NULL, 'Baburhat', 'Active', '2020-07-17 22:13:29', '2020-07-17 22:13:29'),
(419, 7, NULL, 'Bhairab', 'Active', '2020-07-18 22:13:29', '2020-07-18 22:13:29'),
(420, 7, NULL, 'Kishoreganj', 'Active', '2020-07-19 22:13:29', '2020-07-19 22:13:29'),
(421, 7, NULL, 'Bhaluka', 'Active', '2020-07-20 22:13:29', '2020-07-20 22:13:29'),
(422, 7, NULL, 'Mymensingh', 'Active', '2020-07-21 22:13:29', '2020-07-21 22:13:29'),
(423, 7, NULL, 'Jamalpur', 'Active', '2020-07-22 22:13:29', '2020-07-22 22:13:29'),
(424, 7, NULL, 'Faridpur', 'Active', '2020-07-23 22:13:29', '2020-07-23 22:13:29'),
(425, 7, NULL, 'Tangail', 'Active', '2020-07-24 22:13:29', '2020-07-24 22:13:29'),
(426, 7, NULL, 'Nasirabad', 'Active', '2020-07-25 22:13:29', '2020-07-25 22:13:29'),
(427, 7, NULL, 'Olangkar Mour', 'Active', '2020-07-26 22:13:29', '2020-07-26 22:13:29'),
(428, 7, NULL, 'Comilla City', 'Active', '2020-07-27 22:13:29', '2020-07-27 22:13:29'),
(429, 7, NULL, 'Khulna City', 'Active', '2020-07-28 22:13:29', '2020-07-28 22:13:29'),
(430, 7, NULL, 'Jessore', 'Active', '2020-07-29 22:13:29', '2020-07-29 22:13:29'),
(431, 7, NULL, 'Benapole', 'Active', '2020-07-30 22:13:29', '2020-07-30 22:13:29'),
(432, 7, NULL, 'Nowapara', 'Active', '2020-07-31 22:13:29', '2020-07-31 22:13:29'),
(433, 7, NULL, 'Jhenaidah', 'Active', '2020-08-01 22:13:29', '2020-08-01 22:13:29'),
(434, 7, NULL, 'Kaliganj', 'Active', '2020-08-02 22:13:29', '2020-08-02 22:13:29'),
(435, 7, NULL, 'Kustia', 'Active', '2020-08-03 22:13:29', '2020-08-03 22:13:29'),
(436, 7, NULL, 'Bheramara', 'Active', '2020-08-04 22:13:29', '2020-08-04 22:13:29'),
(437, 7, NULL, 'Meherpur', 'Active', '2020-08-05 22:13:29', '2020-08-05 22:13:29'),
(438, 7, NULL, 'Gangni', 'Active', '2020-08-06 22:13:29', '2020-08-06 22:13:29'),
(439, 7, NULL, 'Rajshahi City', 'Active', '2020-08-07 22:13:29', '2020-08-07 22:13:29'),
(440, 7, NULL, 'Baneshor', 'Active', '2020-08-08 22:13:29', '2020-08-08 22:13:29'),
(441, 7, NULL, 'Chapainawbabganj', 'Active', '2020-08-09 22:13:29', '2020-08-09 22:13:29'),
(442, 7, NULL, 'Shibganj', 'Active', '2020-08-10 22:13:29', '2020-08-10 22:13:29'),
(443, 7, NULL, 'Natore', 'Active', '2020-08-11 22:13:29', '2020-08-11 22:13:29'),
(444, 7, NULL, 'Bonpara', 'Active', '2020-08-12 22:13:29', '2020-08-12 22:13:29'),
(445, 7, NULL, 'Rajapur', 'Active', '2020-08-13 22:13:29', '2020-08-13 22:13:29'),
(446, 7, NULL, 'Pabna', 'Active', '2020-08-14 22:13:29', '2020-08-14 22:13:29'),
(447, 7, NULL, 'Ishordi', 'Active', '2020-08-15 22:13:29', '2020-08-15 22:13:29'),
(448, 7, NULL, 'Bera', 'Active', '2020-08-16 22:13:29', '2020-08-16 22:13:29'),
(449, 7, NULL, 'Kashinathpur', 'Active', '2020-08-17 22:13:29', '2020-08-17 22:13:29'),
(450, 7, NULL, 'Sirajhganj', 'Active', '2020-08-18 22:13:29', '2020-08-18 22:13:29'),
(451, 7, NULL, 'Shahjadpur', 'Active', '2020-08-19 22:13:29', '2020-08-19 22:13:29'),
(452, 7, NULL, 'Belkuchi', 'Active', '2020-08-20 22:13:29', '2020-08-20 22:13:29'),
(453, 7, NULL, 'Ullapara', 'Active', '2020-08-21 22:13:29', '2020-08-21 22:13:29'),
(454, 7, NULL, 'Chandaikona', 'Active', '2020-08-22 22:13:29', '2020-08-22 22:13:29'),
(455, 7, NULL, 'Bogra', 'Active', '2020-08-23 22:13:29', '2020-08-23 22:13:29'),
(456, 7, NULL, 'Sherpur', 'Active', '2020-08-24 22:13:29', '2020-08-24 22:13:29'),
(457, 7, NULL, 'Dhunot', 'Active', '2020-08-25 22:13:29', '2020-08-25 22:13:29'),
(458, 7, NULL, 'Majhiya', 'Active', '2020-08-26 22:13:29', '2020-08-26 22:13:29'),
(459, 7, NULL, 'Mokamtola', 'Active', '2020-08-27 22:13:29', '2020-08-27 22:13:29'),
(460, 7, NULL, 'Sonatola', 'Active', '2020-08-28 22:13:29', '2020-08-28 22:13:29'),
(461, 7, NULL, 'Adamdhigi', 'Active', '2020-08-29 22:13:29', '2020-08-29 22:13:29'),
(462, 7, NULL, 'Dupchaciya', 'Active', '2020-08-30 22:13:29', '2020-08-30 22:13:29'),
(463, 7, NULL, 'Santahar', 'Active', '2020-08-31 22:13:29', '2020-08-31 22:13:29'),
(464, 7, NULL, 'Nawgaon', 'Active', '2020-09-01 22:13:29', '2020-09-01 22:13:29'),
(465, 7, NULL, 'Nojipur', 'Active', '2020-09-02 22:13:29', '2020-09-02 22:13:29'),
(466, 7, NULL, 'Mohadebpur', 'Active', '2020-09-03 22:13:29', '2020-09-03 22:13:29'),
(467, 7, NULL, 'Sapahar', 'Active', '2020-09-04 22:13:29', '2020-09-04 22:13:29'),
(468, 7, NULL, 'Joypurhat', 'Active', '2020-09-05 22:13:29', '2020-09-05 22:13:29'),
(469, 7, NULL, 'Kalai', 'Active', '2020-09-06 22:13:29', '2020-09-06 22:13:29'),
(470, 7, NULL, 'Panchbibi', 'Active', '2020-09-07 22:13:29', '2020-09-07 22:13:29'),
(471, 7, NULL, 'Rangpur City', 'Active', '2020-09-08 22:13:29', '2020-09-08 22:13:29'),
(472, 7, NULL, 'Pirganj-02', 'Active', '2020-09-09 22:13:29', '2020-09-07 18:42:57'),
(473, 7, NULL, 'Shothibari', 'Active', '2020-09-10 22:13:29', '2020-09-10 22:13:29'),
(474, 7, NULL, 'Mithapukur', 'Active', '2020-09-11 22:13:29', '2020-09-11 22:13:29'),
(475, 7, NULL, 'Haragach', 'Active', '2020-09-12 22:13:29', '2020-09-12 22:13:29'),
(476, 7, NULL, 'Taraganj', 'Active', '2020-09-13 22:13:29', '2020-09-13 22:13:29'),
(477, 7, NULL, 'Badarganj', 'Active', '2020-09-14 22:13:29', '2020-09-14 22:13:29'),
(478, 7, NULL, 'Gaibandha', 'Active', '2020-09-15 22:13:29', '2020-09-15 22:13:29'),
(479, 7, NULL, 'Gobindaganj', 'Active', '2020-09-16 22:13:29', '2020-09-16 22:13:29'),
(480, 7, NULL, 'Polashbari', 'Active', '2020-09-17 22:13:29', '2020-09-17 22:13:29'),
(481, 7, NULL, 'Lalmonirhat', 'Active', '2020-09-18 22:13:29', '2020-09-18 22:13:29'),
(482, 7, NULL, 'Hatibandha', 'Active', '2020-09-19 22:13:29', '2020-09-19 22:13:29'),
(483, 7, NULL, 'Tujbhandar', 'Active', '2020-09-20 22:13:29', '2020-09-20 22:13:29'),
(484, 7, NULL, 'Kurigram', 'Active', '2020-09-21 22:13:29', '2020-09-21 22:13:29'),
(485, 7, NULL, 'Nageshori', 'Active', '2020-09-22 22:13:29', '2020-09-22 22:13:29'),
(486, 7, NULL, 'Ulipur', 'Active', '2020-09-23 22:13:29', '2020-09-23 22:13:29'),
(487, 7, NULL, 'Nilphamari', 'Active', '2020-09-24 22:13:29', '2020-09-24 22:13:29'),
(488, 7, NULL, 'Syedpur', 'Active', '2020-09-25 22:13:29', '2020-09-25 22:13:29'),
(489, 7, NULL, 'Dhomar', 'Active', '2020-09-26 22:13:29', '2020-09-26 22:13:29'),
(490, 7, NULL, 'Joldhaka', 'Active', '2020-09-27 22:13:29', '2020-09-27 22:13:29'),
(491, 7, NULL, 'Dhimla', 'Active', '2020-09-28 22:13:29', '2020-09-28 22:13:29'),
(492, 7, NULL, 'Dinajpur', 'Active', '2020-09-29 22:13:29', '2020-09-29 22:13:29'),
(493, 7, NULL, 'Fulbari', 'Active', '2020-09-30 22:13:29', '2020-09-30 22:13:29'),
(494, 7, NULL, 'Birampur', 'Active', '2020-10-01 22:13:29', '2020-10-01 22:13:29'),
(495, 7, NULL, 'Birganj', 'Active', '2020-10-02 22:13:29', '2020-10-02 22:13:29'),
(496, 7, NULL, 'Hili', 'Active', '2020-10-03 22:13:29', '2020-10-03 22:13:29'),
(497, 7, NULL, 'Ranirbandor', 'Active', '2020-10-04 22:13:29', '2020-10-04 22:13:29'),
(498, 7, NULL, 'Parbortipur', 'Active', '2020-10-05 22:13:29', '2020-10-05 22:13:29'),
(499, 7, NULL, 'Raniganj', 'Active', '2020-10-06 22:13:29', '2020-10-06 22:13:29'),
(500, 7, NULL, 'Setabganj', 'Active', '2020-10-07 22:13:29', '2020-10-07 22:13:29'),
(501, 7, NULL, 'Thakurgaon', 'Active', '2020-10-08 22:13:29', '2020-10-08 22:13:29'),
(502, 7, NULL, 'Pirganj-01', 'Active', '2020-10-09 22:13:29', '2020-09-07 18:42:51'),
(503, 7, NULL, 'Ranishongkoil', 'Active', '2020-10-10 22:13:29', '2020-10-10 22:13:29'),
(504, 7, NULL, 'Panchagar', 'Active', '2020-10-11 22:13:29', '2020-10-11 22:13:29'),
(505, 7, NULL, 'Boda', 'Active', '2020-10-12 22:13:29', '2020-10-12 22:13:29'),
(506, 7, NULL, 'Debiganj', 'Active', '2020-10-13 22:13:29', '2020-10-13 22:13:29'),
(507, 7, NULL, 'Mirpur-10', 'Active', '2020-10-14 22:13:29', '2020-10-14 22:13:29'),
(508, 7, NULL, 'Shamoly', 'Active', '2020-10-15 22:13:29', '2020-10-15 22:13:29'),
(509, 7, NULL, 'Mohammadpur', 'Active', '2020-10-16 22:13:29', '2020-10-16 22:13:29'),
(510, 7, NULL, 'Gulshan-2', 'Active', '2020-10-17 22:13:29', '2020-10-17 22:13:29'),
(511, 7, NULL, 'Badda', 'Active', '2020-10-18 22:13:29', '2020-10-18 22:13:29'),
(512, 7, NULL, 'Elephant Road', 'Active', '2020-10-19 22:13:29', '2020-10-19 22:13:29'),
(513, 7, NULL, 'Malitola', 'Active', '2020-10-20 22:13:29', '2020-10-20 22:13:29'),
(514, 7, NULL, 'Nababpur', 'Active', '2020-10-21 22:13:29', '2020-10-21 22:13:29'),
(515, 7, NULL, 'Patuatoli', 'Active', '2020-10-22 22:13:29', '2020-10-22 22:13:29'),
(516, 7, NULL, 'Bangla Bazar', 'Active', '2020-10-23 22:13:29', '2020-10-23 22:13:29'),
(517, 7, NULL, 'New Market', 'Active', '2020-10-24 22:13:29', '2020-10-24 22:13:29'),
(518, 7, NULL, 'Mohakhali', 'Active', '2020-10-25 22:13:29', '2020-10-25 22:13:29'),
(519, 7, NULL, 'Malibag', 'Active', '2020-10-26 22:13:29', '2020-10-26 22:13:29'),
(520, 7, NULL, 'Siddique Bazar', 'Active', '2020-10-27 22:13:29', '2020-10-27 22:13:29'),
(521, 7, NULL, 'Motijheel', 'Active', '2020-10-28 22:13:29', '2020-10-28 22:13:29'),
(522, 7, NULL, 'Jatrabari', 'Active', '2020-10-29 22:13:29', '2020-10-29 22:13:29'),
(523, 7, NULL, 'Keraniganj', 'Active', '2020-10-30 22:13:29', '2020-10-30 22:13:29'),
(524, 7, NULL, 'Uttara', 'Active', '2020-10-31 22:13:29', '2020-10-31 22:13:29'),
(525, 7, NULL, 'Savar', 'Active', '2020-11-01 23:13:29', '2020-11-01 23:13:29'),
(526, 7, NULL, 'Baipail', 'Active', '2020-11-02 23:13:29', '2020-11-02 23:13:29'),
(527, 7, NULL, 'Gazipur City', 'Active', '2020-11-03 23:13:29', '2020-11-03 23:13:29'),
(528, 7, NULL, 'Konabari', 'Active', '2020-11-04 23:13:29', '2020-11-04 23:13:29'),
(529, 7, NULL, 'Mawna', 'Active', '2020-11-05 23:13:29', '2020-11-05 23:13:29'),
(530, 7, NULL, 'Mymensingh', 'Active', '2020-11-06 23:13:29', '2020-11-06 23:13:29'),
(531, 7, NULL, 'Modhupur', 'Active', '2020-11-07 23:13:29', '2020-11-07 23:13:29'),
(532, 7, NULL, 'Tangail', 'Active', '2020-11-08 23:13:29', '2020-11-08 23:13:29'),
(533, 7, NULL, 'Narayanganj', 'Active', '2020-11-09 23:13:29', '2020-11-09 23:13:29'),
(534, 7, NULL, 'Rupganj', 'Active', '2020-11-10 23:13:29', '2020-11-10 23:13:29'),
(535, 7, NULL, 'Narsingdi', 'Active', '2020-11-11 23:13:29', '2020-11-11 23:13:29'),
(536, 7, NULL, 'Baburhat', 'Active', '2020-11-12 23:13:29', '2020-11-12 23:13:29'),
(537, 7, NULL, 'Bhairab', 'Active', '2020-11-13 23:13:29', '2020-11-13 23:13:29'),
(538, 7, NULL, 'Chittagong', 'Active', '2020-11-14 23:13:29', '2020-11-14 23:13:29'),
(539, 7, NULL, 'Agrabad', 'Active', '2020-11-15 23:13:29', '2020-11-15 23:13:29'),
(540, 7, NULL, 'Khatunganj', 'Active', '2020-11-16 23:13:29', '2020-11-16 23:13:29'),
(541, 7, NULL, 'EPZ', 'Active', '2020-11-17 23:13:29', '2020-11-17 23:13:29'),
(542, 7, NULL, 'Chotopul', 'Active', '2020-11-18 23:13:29', '2020-11-18 23:13:29'),
(543, 7, NULL, 'sherpur', 'Active', '2020-04-28 22:13:29', '2020-04-28 22:13:29'),
(544, 7, NULL, 'valuka', 'Active', '2020-04-29 22:13:29', '2020-04-29 22:13:29'),
(545, 7, NULL, 'Baipail', 'Active', '2020-04-30 22:13:29', '2020-04-30 22:13:29'),
(546, 8, NULL, 'narayanganj', 'Active', '2020-05-01 22:13:29', '2020-05-01 22:13:29'),
(547, 8, NULL, 'baipail', 'Active', '2020-05-02 22:13:29', '2020-05-02 22:13:29'),
(548, 8, NULL, 'Nobabpur', 'Active', '2020-05-03 22:13:29', '2020-05-03 22:13:29'),
(549, 8, NULL, 'Keranigonj', 'Active', '2020-05-04 22:13:29', '2020-05-04 22:13:29'),
(550, 8, NULL, 'Konabari', 'Active', '2020-05-05 22:13:29', '2020-05-05 22:13:29'),
(551, 8, NULL, 'mawna', 'Active', '2020-05-06 22:13:29', '2020-05-06 22:13:29'),
(552, 8, NULL, 'munshiganj', 'Active', '2020-05-07 22:13:29', '2020-05-07 22:13:29'),
(553, 8, NULL, 'manikganj', 'Active', '2020-05-08 22:13:29', '2020-05-08 22:13:29'),
(554, 8, NULL, 'Saver ', 'Active', '2020-05-09 22:13:29', '2020-05-09 22:13:29'),
(555, 8, NULL, 'Tongi', 'Active', '2020-05-10 22:13:29', '2020-05-10 22:13:29'),
(556, 8, NULL, 'Gazipur', 'Active', '2020-05-11 22:13:29', '2020-05-11 22:13:29'),
(557, 8, NULL, 'Faridpur', 'Active', '2020-05-12 22:13:29', '2020-05-12 22:13:29'),
(558, 8, NULL, 'Norsingdi', 'Active', '2020-05-13 22:13:29', '2020-05-13 22:13:29'),
(559, 8, NULL, 'Vairab', 'Active', '2020-05-14 22:13:29', '2020-05-14 22:13:29'),
(560, 8, NULL, 'kishorgonj', 'Active', '2020-05-15 22:13:29', '2020-05-15 22:13:29'),
(561, 8, NULL, 'tangail', 'Active', '2020-05-16 22:13:29', '2020-05-16 22:13:29'),
(562, 8, NULL, 'Mynmanshingh', 'Active', '2020-05-17 22:13:29', '2020-05-17 22:13:29'),
(563, 8, NULL, 'jamalpur', 'Active', '2020-05-18 22:13:29', '2020-05-18 22:13:29'),
(564, 8, NULL, 'Agrabad', 'Active', '2020-05-19 22:13:29', '2020-05-19 22:13:29'),
(565, 8, NULL, 'A K Khan', 'Active', '2020-05-20 22:13:29', '2020-05-20 22:13:29'),
(566, 8, NULL, 'Khatungong', 'Active', '2020-05-21 22:13:29', '2020-05-21 22:13:29'),
(567, 8, NULL, 'kodomtoli ctg', 'Active', '2020-05-22 22:13:29', '2020-05-22 22:13:29'),
(568, 8, NULL, 'EPZ-CTG', 'Active', '2020-05-23 22:13:29', '2020-05-23 22:13:29'),
(569, 8, NULL, 'Muradpur', 'Active', '2020-05-24 22:13:29', '2020-05-24 22:13:29'),
(570, 8, NULL, 'Chokoria', 'Active', '2020-05-25 22:13:29', '2020-05-25 22:13:29'),
(571, 8, NULL, 'CoxBazar', 'Active', '2020-05-26 22:13:29', '2020-05-26 22:13:29'),
(572, 8, NULL, 'Comilla', 'Active', '2020-05-27 22:13:29', '2020-05-27 22:13:29'),
(573, 8, NULL, 'Chadpur', 'Active', '2020-05-28 22:13:29', '2020-05-28 22:13:29'),
(574, 8, NULL, 'Hajigong', 'Active', '2020-05-29 22:13:29', '2020-05-29 22:13:29'),
(575, 8, NULL, 'B.Baria', 'Active', '2020-05-30 22:13:29', '2020-05-30 22:13:29'),
(576, 8, NULL, 'Feni', 'Active', '2020-05-31 22:13:29', '2020-05-31 22:13:29'),
(577, 8, NULL, 'Chowmuhani', 'Active', '2020-06-01 22:13:29', '2020-06-01 22:13:29'),
(578, 8, NULL, 'Majdee', 'Active', '2020-06-02 22:13:29', '2020-06-02 22:13:29'),
(579, 8, NULL, 'Loxmipur', 'Active', '2020-06-03 22:13:29', '2020-06-03 22:13:29'),
(580, 8, NULL, 'KHULNA', 'Active', '2020-06-04 22:13:29', '2020-06-04 22:13:29'),
(581, 8, NULL, 'Khalishpur', 'Active', '2020-06-05 22:13:29', '2020-06-05 22:13:29'),
(582, 8, NULL, 'Nowapara', 'Active', '2020-06-06 22:13:29', '2020-06-06 22:13:29'),
(583, 8, NULL, 'Jessore (new Market )', 'Active', '2020-06-07 22:13:29', '2020-06-07 22:13:29'),
(584, 8, NULL, 'Jessore (R,N Road )', 'Active', '2020-06-08 22:13:29', '2020-06-08 22:13:29'),
(585, 8, NULL, 'Magura', 'Active', '2020-06-09 22:13:29', '2020-06-09 22:13:29'),
(586, 8, NULL, 'Jhinaidhah', 'Active', '2020-06-10 22:13:29', '2020-06-10 22:13:29'),
(587, 8, NULL, 'Kustia', 'Active', '2020-06-11 22:13:29', '2020-06-11 22:13:29'),
(588, 8, NULL, 'RajSHAHI', 'Active', '2020-06-12 22:13:29', '2020-06-12 22:13:29'),
(589, 8, NULL, 'Baneshsar', 'Active', '2020-06-13 22:13:29', '2020-06-13 22:13:29'),
(590, 8, NULL, 'Nator', 'Active', '2020-06-14 22:13:29', '2020-06-14 22:13:29'),
(591, 8, NULL, 'Chapainobabgong', 'Active', '2020-06-15 22:13:29', '2020-06-15 22:13:29'),
(592, 8, NULL, 'Pabna', 'Active', '2020-06-16 22:13:29', '2020-06-16 22:13:29'),
(593, 8, NULL, 'Sirajgong', 'Active', '2020-06-17 22:13:29', '2020-06-17 22:13:29'),
(594, 8, NULL, 'Esshardi', 'Active', '2020-06-18 22:13:29', '2020-06-18 22:13:29'),
(595, 8, NULL, 'Bogura', 'Active', '2020-06-19 22:13:29', '2020-06-19 22:13:29'),
(596, 8, NULL, 'Nowgoan', 'Active', '2020-06-20 22:13:29', '2020-06-20 22:13:29'),
(597, 8, NULL, 'Rongpur', 'Active', '2020-06-21 22:13:29', '2020-06-21 22:13:29'),
(598, 8, NULL, 'Syeadpur', 'Active', '2020-06-22 22:13:29', '2020-06-22 22:13:29'),
(599, 8, NULL, 'Gobindagonj (r.pur)', 'Active', '2020-06-23 22:13:29', '2020-06-23 22:13:29'),
(600, 8, NULL, 'Dinajpur', 'Active', '2020-06-24 22:13:29', '2020-06-24 22:13:29'),
(601, 8, NULL, 'Birampur', 'Active', '2020-06-25 22:13:29', '2020-06-25 22:13:29'),
(602, 8, NULL, 'Fulbari', 'Active', '2020-06-26 22:13:29', '2020-06-26 22:13:29'),
(603, 8, NULL, 'Thakurgoan', 'Active', '2020-06-27 22:13:29', '2020-06-27 22:13:29'),
(604, 8, NULL, 'Sylhet', 'Active', '2020-06-28 22:13:29', '2020-06-28 22:13:29'),
(605, 8, NULL, 'Kadomtoly', 'Active', '2020-06-29 22:13:29', '2020-06-29 22:13:29'),
(606, 8, NULL, 'Moulavibazar', 'Active', '2020-06-30 22:13:29', '2020-06-30 22:13:29'),
(607, 8, NULL, 'Sreemongal', 'Active', '2020-07-01 22:13:29', '2020-07-01 22:13:29'),
(608, 8, NULL, 'Hobigong', 'Active', '2020-07-02 22:13:29', '2020-07-02 22:13:29'),
(609, 8, NULL, 'Barishal', 'Active', '2020-07-03 22:13:29', '2020-07-03 22:13:29'),
(610, 8, NULL, 'Takerhat', 'Active', '2020-07-04 22:13:29', '2020-07-04 22:13:29'),
(611, 8, NULL, 'Patuakhali', 'Active', '2020-07-05 22:13:29', '2020-07-05 22:13:29'),
(614, 8, NULL, 'Sherpur', 'Active', '2020-06-18 03:38:19', '2020-06-18 03:38:19'),
(615, 8, NULL, 'Valuka-ভালুকা', 'Active', '2020-06-25 22:39:41', '2020-06-25 22:39:41'),
(619, 13, NULL, 'Laksham', 'Active', '2020-09-07 18:35:19', '2020-09-07 18:35:19'),
(620, 13, NULL, 'Anderkilla', 'Active', '2020-09-07 18:40:29', '2020-09-07 18:40:29'),
(622, 2, NULL, 'Nilphamari', 'Active', '2020-09-07 18:42:28', '2020-09-07 18:42:28'),
(623, 7, NULL, 'Patgram', 'Active', '2020-09-07 18:46:07', '2020-09-07 18:46:07'),
(624, 8, NULL, 'Baburhat', 'Active', '2020-09-07 19:50:03', '2020-09-07 19:50:03'),
(625, 13, NULL, 'Maijdee', 'Active', '2020-11-27 01:21:04', '2020-11-27 01:21:04'),
(627, 3, NULL, 'Barisal', 'Active', '2022-02-20 09:54:44', '2022-02-20 09:54:44'),
(628, 25, NULL, 'Jhalakati', 'Active', '2022-02-20 09:55:47', '2022-02-20 09:55:47'),
(629, 3, NULL, 'Pirojpur', 'Active', '2022-02-20 09:56:00', '2022-02-20 09:56:00'),
(630, 3, NULL, 'Patuakhali', 'Active', '2022-02-20 09:56:13', '2022-02-20 09:56:13'),
(631, 3, NULL, 'Bhola', 'Active', '2022-02-20 09:56:44', '2022-02-20 09:56:44'),
(632, 3, NULL, 'Barguna', 'Active', '2022-02-20 09:57:18', '2022-02-20 09:57:18'),
(634, 3, NULL, 'Bandarban', 'Active', '2022-02-20 09:59:06', '2022-02-20 09:59:06'),
(635, 3, NULL, 'Brahmanbaria', 'Active', '2022-02-20 09:59:20', '2022-02-20 09:59:20'),
(636, 3, NULL, 'Chandpur', 'Active', '2022-02-20 09:59:42', '2022-02-20 09:59:42'),
(637, 3, NULL, 'Chittagong', 'Active', '2022-02-20 09:59:52', '2022-02-20 09:59:52'),
(638, 3, NULL, 'Comilla', 'Active', '2022-02-20 10:00:35', '2022-02-20 10:00:35'),
(639, 3, NULL, 'Cox\'s Bazar', 'Active', '2022-02-20 10:00:52', '2022-02-20 10:00:52'),
(640, 3, NULL, 'Feni', 'Active', '2022-02-20 10:01:04', '2022-02-20 10:01:04'),
(641, 3, NULL, 'Khagrachhari', 'Active', '2022-02-20 10:01:14', '2022-02-20 10:01:14'),
(642, 3, NULL, 'Lakshmipur', 'Active', '2022-02-20 10:01:25', '2022-02-20 10:01:25'),
(643, 3, NULL, 'Noakhali', 'Active', '2022-02-20 10:01:34', '2022-02-20 10:01:34'),
(644, 3, NULL, 'Rangamati', 'Active', '2022-02-20 10:01:47', '2022-02-20 10:01:47'),
(645, 3, NULL, 'Dhaka', 'Active', '2022-02-20 10:02:30', '2022-02-20 10:02:30'),
(646, 3, NULL, 'Faridpur', 'Active', '2022-02-20 10:02:46', '2022-02-20 10:02:46'),
(647, 3, NULL, 'Gazipur', 'Active', '2022-02-20 10:02:54', '2022-02-20 10:02:54'),
(648, 3, NULL, 'Gopalganj', 'Active', '2022-02-20 10:03:07', '2022-02-20 10:03:07'),
(649, 3, NULL, 'Kishoreganj', 'Active', '2022-02-20 10:03:34', '2022-02-20 10:03:34'),
(650, 3, NULL, 'Madaripur', 'Active', '2022-02-20 10:03:54', '2022-02-20 10:03:54'),
(651, 3, NULL, 'Manikganj', 'Active', '2022-02-20 10:04:11', '2022-02-20 10:04:11'),
(652, 3, NULL, 'Munshiganj', 'Active', '2022-02-20 10:04:19', '2022-02-20 10:04:19'),
(653, 3, NULL, 'Narayanganj', 'Active', '2022-02-20 10:04:29', '2022-02-20 10:04:29'),
(654, 3, NULL, 'Narsingdi', 'Active', '2022-02-20 10:04:40', '2022-02-20 10:04:40'),
(655, 3, NULL, 'Rajbari', 'Active', '2022-02-20 10:04:53', '2022-02-20 10:04:53'),
(656, 3, NULL, 'Shariatpur', 'Active', '2022-02-20 10:05:04', '2022-02-20 10:05:04'),
(657, 3, NULL, 'Tangail', 'Active', '2022-02-20 10:05:26', '2022-02-20 10:05:26'),
(658, 3, NULL, 'Bagerhat', 'Active', '2022-02-20 10:05:35', '2022-02-20 10:05:35'),
(659, 3, NULL, 'Chuadanga', 'Active', '2022-02-20 10:06:31', '2022-02-20 10:06:31'),
(660, 3, NULL, 'Jessore', 'Active', '2022-02-20 10:06:45', '2022-02-20 10:06:45'),
(661, 3, NULL, 'Jhenaidah', 'Active', '2022-02-20 10:06:56', '2022-02-20 10:06:56'),
(662, 3, NULL, 'Khulna', 'Active', '2022-02-20 10:07:05', '2022-02-20 10:07:05'),
(663, 3, NULL, 'Kushtia', 'Active', '2022-02-20 10:07:15', '2022-02-20 10:07:15'),
(664, 3, NULL, 'Magura', 'Active', '2022-02-20 10:07:27', '2022-02-20 10:07:27'),
(665, 3, NULL, 'Meherpur', 'Active', '2022-02-20 10:07:37', '2022-02-20 10:07:37'),
(666, 3, NULL, 'Narail', 'Active', '2022-02-20 10:07:49', '2022-02-20 10:07:49'),
(667, 3, NULL, 'Satkhira', 'Active', '2022-02-20 10:08:05', '2022-02-20 10:08:05'),
(668, 3, NULL, 'Jamalpur', 'Active', '2022-02-20 10:08:27', '2022-02-20 10:08:27'),
(669, 3, NULL, 'Mymensingh', 'Active', '2022-02-20 10:08:48', '2022-02-20 10:08:48'),
(670, 3, NULL, 'Netrokona', 'Active', '2022-02-20 10:08:59', '2022-02-20 10:08:59'),
(671, 3, NULL, 'Sherpur', 'Active', '2022-02-20 10:09:25', '2022-02-20 10:09:25'),
(672, 3, NULL, 'Bogra', 'Active', '2022-02-20 10:09:34', '2022-02-20 10:09:34'),
(673, 3, NULL, 'Joypurhat', 'Active', '2022-02-20 10:09:43', '2022-02-20 10:09:43'),
(674, 3, NULL, 'Naogaon', 'Active', '2022-02-20 10:09:56', '2022-02-20 10:09:56'),
(675, 3, NULL, 'Natore', 'Active', '2022-02-20 10:10:06', '2022-02-20 10:10:06'),
(676, 3, NULL, 'Chapai Nawabganj', 'Active', '2022-02-20 10:10:21', '2022-02-20 10:10:21'),
(677, 3, NULL, 'Pabna', 'Active', '2022-02-20 10:10:30', '2022-02-20 10:10:30'),
(678, 3, NULL, 'Rajshahi', 'Active', '2022-02-20 10:10:40', '2022-02-20 10:10:40'),
(679, 3, NULL, 'Sirajganj', 'Active', '2022-02-20 10:10:48', '2022-02-20 10:10:48'),
(680, 3, NULL, 'Dinajpur', 'Active', '2022-02-20 10:10:58', '2022-02-20 10:10:58'),
(681, 3, NULL, 'Gaibandha', 'Active', '2022-02-20 10:11:11', '2022-02-20 10:11:11'),
(682, 3, NULL, 'Kurigram', 'Active', '2022-02-20 10:11:30', '2022-02-20 10:11:30'),
(683, 3, NULL, 'Lalmonirhat', 'Active', '2022-02-20 10:12:14', '2022-02-20 10:12:14'),
(684, 3, NULL, 'Nilphamari', 'Active', '2022-02-20 10:12:49', '2022-02-20 10:12:49'),
(685, 3, NULL, 'Panchagarh', 'Active', '2022-02-20 10:12:56', '2022-02-20 10:12:56'),
(686, 3, NULL, 'Rangpur', 'Active', '2022-02-20 10:13:05', '2022-02-20 10:13:05'),
(687, 3, 'Dhaka', 'Thakurgaon', 'Active', '2022-02-20 10:13:20', '2022-02-23 09:14:00');
INSERT INTO `cities` (`id`, `courier_id`, `division`, `cityName`, `status`, `created_at`, `updated_at`) VALUES
(688, 3, NULL, 'Habiganj', 'Active', '2022-02-20 10:13:38', '2022-02-20 10:13:38'),
(689, 3, NULL, 'Moulvibazar', 'Active', '2022-02-20 10:13:58', '2022-02-20 10:13:58'),
(690, 3, NULL, 'Sunamganj', 'Active', '2022-02-20 10:14:12', '2022-02-20 10:14:12'),
(691, 3, NULL, 'Sylhet', 'Active', '2022-02-20 10:14:23', '2022-02-20 10:14:23'),
(692, 3, NULL, 'Jhalokathi', 'Active', '2022-02-23 09:59:18', '2022-02-23 09:59:18'),
(693, 10, 'Barishal', 'Barguna', 'Active', '2022-02-24 04:01:09', '2022-02-24 08:34:06'),
(694, 10, 'Barishal', 'Barisal', 'Active', '2022-02-24 04:02:11', '2022-02-24 08:34:05'),
(695, 10, 'Barishal', 'Bhola', 'Active', '2022-02-24 04:02:23', '2022-02-24 08:34:04'),
(696, 10, 'Barishal', 'Jhalokati', 'Active', '2022-02-24 04:02:34', '2022-02-24 08:34:03'),
(697, 10, 'Barishal', 'Patuakhali', 'Active', '2022-02-24 04:02:46', '2022-02-24 08:34:02'),
(698, 10, 'Barishal', 'Pirojpur', 'Active', '2022-02-24 04:02:59', '2022-02-24 08:34:00'),
(699, 10, 'Chattogram', 'Bandarban', 'Active', '2022-02-24 04:03:10', '2022-02-24 08:33:58'),
(700, 10, 'Chattogram', 'Brahmanbaria', 'Active', '2022-02-24 04:04:32', '2022-02-24 08:33:57'),
(701, 10, 'Chattogram', 'Chandpur', 'Active', '2022-02-24 04:04:42', '2022-02-24 08:33:56'),
(702, 10, 'Chattogram', 'Chittagong', 'Active', '2022-02-24 04:04:52', '2022-02-24 08:33:54'),
(703, 10, 'Chattogram', 'Comilla', 'Active', '2022-02-24 04:05:06', '2022-02-24 08:33:52'),
(704, 10, 'Chattogram', 'Cox\'s Bazar', 'Active', '2022-02-24 04:05:17', '2022-02-24 08:33:51'),
(705, 10, 'Chattogram', 'Feni', 'Active', '2022-02-24 04:05:26', '2022-02-24 08:33:50'),
(706, 10, 'Chattogram', 'Khagrachhari', 'Active', '2022-02-24 04:05:36', '2022-02-24 08:33:45'),
(707, 10, 'Chattogram', 'Lakshmipur', 'Active', '2022-02-24 04:05:49', '2022-02-24 08:33:47'),
(708, 10, 'Chattogram', 'Noakhali', 'Active', '2022-02-24 04:06:01', '2022-02-24 08:33:44'),
(709, 10, 'Chattogram', 'Rangamati', 'Active', '2022-02-24 04:06:11', '2022-02-24 08:33:42'),
(710, 10, 'Dhaka', 'Dhaka', 'Active', '2022-02-24 04:06:36', '2022-02-24 06:41:34'),
(711, 10, 'Dhaka', 'Faridpur', 'Active', '2022-02-24 04:06:47', '2022-02-24 08:33:41'),
(712, 10, 'Dhaka', 'Gazipur', 'Active', '2022-02-24 04:06:56', '2022-02-24 08:33:40'),
(713, 10, 'Dhaka', 'Gopalganj', 'Active', '2022-02-24 04:12:38', '2022-02-24 08:33:39'),
(714, 10, 'Dhaka', 'Kishoreganj', 'Active', '2022-02-24 04:12:49', '2022-02-24 08:33:38'),
(715, 10, 'Dhaka', 'Madaripur', 'Active', '2022-02-24 04:13:01', '2022-02-24 08:33:37'),
(716, 10, 'Dhaka', 'Manikganj', 'Active', '2022-02-24 04:13:11', '2022-02-24 08:33:32'),
(717, 10, 'Dhaka', 'Munshiganj', 'Active', '2022-02-24 04:13:21', '2022-02-24 08:33:30'),
(718, 10, 'Dhaka', 'Narayanganj', 'Active', '2022-02-24 04:13:42', '2022-02-24 08:33:29'),
(719, 10, 'Dhaka', 'Narsingdi', 'Active', '2022-02-24 04:13:51', '2022-02-24 08:33:29'),
(720, 10, 'Dhaka', 'Rajbari', 'Active', '2022-02-24 04:14:01', '2022-02-24 08:33:28'),
(721, 10, 'Dhaka', 'Shariatpur', 'Active', '2022-02-24 04:14:13', '2022-02-24 08:33:27'),
(722, 10, 'Dhaka', 'Tangail', 'Active', '2022-02-24 04:14:22', '2022-02-24 08:33:26'),
(723, 10, 'Khulna', 'Bagerhat', 'Active', '2022-02-24 04:14:31', '2022-02-24 08:33:25'),
(724, 10, 'Khulna', 'Chuadanga', 'Active', '2022-02-24 04:14:40', '2022-02-24 08:33:24'),
(725, 10, 'Khulna', 'Jessore', 'Active', '2022-02-24 04:14:49', '2022-02-24 08:33:23'),
(726, 10, 'Khulna', 'Jhenaidah', 'Active', '2022-02-24 04:15:58', '2022-02-24 08:33:21'),
(727, 10, 'Khulna', 'Khulna', 'Active', '2022-02-24 04:16:09', '2022-02-24 08:33:19'),
(728, 10, 'Khulna', 'Kushtia', 'Active', '2022-02-24 04:16:28', '2022-02-24 08:33:18'),
(729, 10, 'Khulna', 'Magura', 'Active', '2022-02-24 04:16:38', '2022-02-24 08:33:18'),
(730, 10, 'Khulna', 'Meherpur', 'Active', '2022-02-24 04:16:46', '2022-02-24 08:33:16'),
(731, 10, 'Khulna', 'Narail', 'Active', '2022-02-24 04:16:56', '2022-02-24 08:33:15'),
(732, 10, 'Khulna', 'Satkhira', 'Active', '2022-02-24 04:17:07', '2022-02-24 08:33:14'),
(733, 10, 'Mymenshing', 'Jamalpur', 'Active', '2022-02-24 04:17:19', '2022-02-24 08:33:14'),
(734, 10, 'Mymenshing', 'Mymensingh', 'Active', '2022-02-24 04:17:28', '2022-02-24 08:33:12'),
(735, 10, 'Mymenshing', 'Netrokona', 'Active', '2022-02-24 04:17:37', '2022-02-24 08:33:11'),
(736, 10, 'Mymenshing', 'Sherpur', 'Active', '2022-02-24 04:17:45', '2022-02-24 08:33:11'),
(737, 10, 'Rajshahi', 'Bogra', 'Active', '2022-02-24 04:17:54', '2022-02-24 08:33:09'),
(738, 10, 'Rajshahi', 'Joypurhat', 'Active', '2022-02-24 04:18:02', '2022-02-24 08:33:08'),
(739, 10, 'Rajshahi', 'Naogaon', 'Active', '2022-02-24 04:18:12', '2022-02-24 08:33:07'),
(740, 10, 'Rajshahi', 'Natore', 'Active', '2022-02-24 04:19:03', '2022-02-24 08:33:06'),
(741, 10, 'Rajshahi', 'Chapai Nawabganj', 'Active', '2022-02-24 04:19:15', '2022-02-24 08:33:05'),
(742, 10, 'Rajshahi', 'Pabna', 'Active', '2022-02-24 04:19:23', '2022-02-24 08:33:04'),
(743, 10, 'Rajshahi', 'Rajshahi', 'Active', '2022-02-24 04:19:34', '2022-02-24 08:33:03'),
(744, 10, 'Rajshahi', 'Sirajganj', 'Active', '2022-02-24 04:19:43', '2022-02-24 08:33:02'),
(745, 10, 'Rangpur', 'Dinajpur', 'Active', '2022-02-24 04:19:52', '2022-02-24 08:33:01'),
(746, 10, 'Rangpur', 'Gaibandha', 'Active', '2022-02-24 04:20:02', '2022-02-24 08:32:53'),
(747, 10, 'Rangpur', 'Kurigram', 'Active', '2022-02-24 04:20:48', '2022-02-24 08:32:50'),
(748, 10, 'Rangpur', 'Lalmonirhat', 'Active', '2022-02-24 04:20:57', '2022-02-24 08:32:48'),
(749, 10, 'Rangpur', 'Nilphamari', 'Active', '2022-02-24 04:21:10', '2022-02-24 08:32:47'),
(750, 10, 'Rangpur', 'Panchagarh', 'Active', '2022-02-24 04:21:23', '2022-02-24 08:32:46'),
(751, 10, 'Rangpur', 'Rangpur', 'Active', '2022-02-24 04:21:33', '2022-02-24 08:32:43'),
(752, 10, 'Rangpur', 'Thakurgaon', 'Active', '2022-02-24 04:21:42', '2022-02-24 08:32:45'),
(753, 10, 'Sylhet', 'Habiganj', 'Active', '2022-02-24 04:21:55', '2022-02-24 08:32:42'),
(754, 10, 'Sylhet', 'Moulvibazar', 'Active', '2022-02-24 04:22:06', '2022-02-24 08:32:41'),
(755, 10, 'Sylhet', 'Sunamganj', 'Active', '2022-02-24 04:22:18', '2022-02-24 08:32:56'),
(756, 10, 'Sylhet', 'Sylhet', 'Active', '2022-02-24 04:22:28', '2022-02-24 08:32:39'),
(757, 2, 'Rajshahi', 'Iswardi', 'Active', '2022-06-27 08:53:51', '2022-06-27 08:53:51'),
(758, 2, 'Chattogram', 'kazirdewri', 'Active', '2022-06-30 08:16:40', '2022-06-30 08:16:40'),
(759, 1, 'Rangpur', 'gaibanda', 'Active', '2022-06-30 10:47:15', '2022-06-30 10:47:15'),
(760, 1, 'Sylhet', 'sunamganj', 'Active', '2022-07-01 05:05:08', '2022-07-01 05:05:08'),
(761, 1, 'Rajshahi', 'Joypurhat', 'Active', '2022-07-04 03:27:56', '2022-07-04 03:27:56'),
(762, 2, 'Chattogram', 'hathazari', 'Active', '2022-07-13 10:50:08', '2022-07-13 10:50:08'),
(763, 2, 'Chattogram', 'chakoria', 'Active', '2022-07-13 10:53:06', '2022-08-03 00:07:35'),
(764, 1, 'Barishal', 'bhola sadar', 'Active', '2022-07-19 09:09:33', '2022-08-03 00:07:33'),
(765, 28, 'Chattogram', 'Noakhali', 'Active', '2023-11-16 03:57:20', '2023-11-16 03:57:20');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `order_id`, `comment`, `user_id`, `admin_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'BG771 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-16 02:35:16', '2024-07-16 02:35:16'),
(2, 2, 'BG772 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-17 05:47:31', '2024-07-17 05:47:31'),
(3, 3, 'BG773 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-17 05:49:55', '2024-07-17 05:49:55'),
(4, 4, 'BG774 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-26 08:36:50', '2024-07-26 08:36:50'),
(5, 5, 'BG775 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-26 08:51:19', '2024-07-26 08:51:19'),
(6, 5, 'Seenur(Super Admin) Successfully Update Info of #BG775', NULL, 1, '0', '2024-07-26 08:51:42', '2024-07-26 08:51:42'),
(7, 5, 'Seenur(Super Admin) Successfully Update #BG775 Order status to Completed', NULL, 1, '1', '2024-07-26 08:51:59', '2024-07-26 08:51:59'),
(8, 5, 'Seenur(Super Admin) Successfully Update #BG775 Order status to Invoiced', NULL, 1, '1', '2024-07-26 08:52:08', '2024-07-26 08:52:08'),
(9, 6, 'BG776 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-26 09:37:19', '2024-07-26 09:37:19'),
(10, 7, 'BG777 Order Has Been Created for Seenur(Super Admin)', NULL, 1, '0', '2024-07-26 09:46:31', '2024-07-26 09:46:31'),
(11, 7, 'Seenur(Super Admin) Successfully Update Info of #BG777', NULL, 1, '0', '2024-07-26 09:46:45', '2024-07-26 09:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_invoice_id` varchar(255) NOT NULL,
  `web_ID` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL,
  `customer_phone` varchar(255) NOT NULL,
  `complain_message` text NOT NULL,
  `site_name` varchar(255) DEFAULT NULL,
  `solved_by` varchar(255) DEFAULT NULL,
  `solved_date` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Pending',
  `complainDate` date DEFAULT NULL,
  `solvedDate` date DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complanenotes`
--

CREATE TABLE `complanenotes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `complain_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `couriers`
--

CREATE TABLE `couriers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `courierName` varchar(255) NOT NULL,
  `hasCity` varchar(255) NOT NULL,
  `hasZone` varchar(255) NOT NULL,
  `courierCharge` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `couriers`
--

INSERT INTO `couriers` (`id`, `courierName`, `hasCity`, `hasZone`, `courierCharge`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Sundorban', 'on', 'on', '120', 'Inactive', '2020-04-28 13:19:40', '2023-11-20 08:45:10'),
(2, 'Sa Paribahan', 'on', 'on', '120', 'Inactive', '2020-04-28 13:43:17', '2023-11-20 08:45:19'),
(4, 'Akhter Express', 'off', 'off', '75', 'Inactive', '2020-05-03 08:08:13', '2023-10-29 00:04:30'),
(7, 'করতোয়া কুরিয়ার', 'on', 'off', '100', 'Inactive', '2020-05-14 18:07:59', '2023-11-20 08:45:26'),
(8, 'AJR courier', 'on', 'off', '100', 'Inactive', '2020-05-14 18:16:36', '2023-11-20 08:45:35'),
(10, 'RedX', 'on', 'on', '55', 'Active', '2020-07-15 01:50:40', '2022-03-07 06:17:48'),
(13, 'Janani Courier', 'on', 'on', '120', 'Inactive', '2020-09-07 18:34:41', '2023-10-29 00:03:36'),
(14, 'Oditiya Delivery', 'off', 'off', '60', 'Inactive', '2020-09-20 02:04:43', '2022-03-07 06:18:15'),
(16, 'Office Sale', 'off', 'off', '00', 'Inactive', '2020-11-14 19:15:32', '2022-08-03 00:07:13'),
(17, 'Daraz Seller', 'off', 'off', '15%', 'Inactive', '2020-11-16 15:26:54', '2022-03-07 06:18:39'),
(18, 'Baksho BD Courier', 'off', 'off', '80', 'Inactive', '2020-12-02 02:53:39', '2022-03-07 06:18:46'),
(23, 'Stead Fast', 'on', 'on', '60', 'Active', '2021-09-16 09:50:26', '2023-11-20 08:45:54'),
(25, 'PaperFly', 'on', 'on', '95', 'Inactive', '2022-02-20 09:53:50', '2023-11-20 08:44:19'),
(26, 'Ali Express', 'on', '', '60', 'Inactive', '2022-11-09 04:32:13', '2023-11-20 08:44:12'),
(28, 'pathao', 'on', 'on', '100', 'Active', '2023-11-16 03:56:21', '2023-11-16 03:56:21'),
(29, 'Ecourier', 'on', 'on', '100', 'Active', '2023-11-20 08:44:47', '2023-11-20 08:44:47');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `customerName` varchar(255) NOT NULL,
  `customerPhone` varchar(255) NOT NULL,
  `customerAddress` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `order_id`, `customerName`, `customerPhone`, `customerAddress`, `created_at`, `updated_at`) VALUES
(3, 1, 'Porter Butler', '01926241906', 'Quia consequatur sit', '2024-07-16 02:35:16', '2024-07-16 02:35:16'),
(4, 2, 'Caldwell Holder', '01786460658', 'Nostrum praesentium', '2024-07-17 05:47:31', '2024-07-17 05:47:31'),
(5, 3, 'Hillary Long', '01786460658', '549', '2024-07-17 05:49:55', '2024-07-17 05:49:55'),
(6, 4, 'Sabbir Bhuiyan', '01786460658', '549 Ashkona, Dakshin Khan, Dhaka North City corporation, Dhaka', '2024-07-26 08:36:50', '2024-07-26 08:36:50'),
(7, 5, 'Karim', '01786460658', 'Molestiae non totam', '2024-07-26 08:51:19', '2024-07-26 08:51:19'),
(8, 6, 'Sabbir Bhuiyan', '01786460658', '549', '2024-07-26 09:37:19', '2024-07-26 09:37:19'),
(9, 7, 'Hillary Long', '01956531906', '549 Ashkona, Dakshin Khan, Dhaka North City corporation, Dhaka', '2024-07-26 09:46:31', '2024-07-26 09:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `information`
--

CREATE TABLE `information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `information`
--

INSERT INTO `information` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'about_us', '<p style=\"text-align:center\"><span style=\"font-size:20px\"><span style=\"font-family:Comic Sans MS,cursive\">About Us</span></span></p>\r\n\r\n<div class=\"breadcrumb\">\r\n<div class=\"container\"><!-- /.breadcrumb-inner --></div>\r\n<!-- /.container --></div>\r\n<!-- /.breadcrumb -->\r\n\r\n<div class=\"body-content\">\r\n<div class=\"container\">\r\n<div class=\"contact-page\">\r\n<div class=\"row\">\r\n<div class=\"col-md-9 contact-form\">\r\n<div class=\"col-md-12\">\r\n<form>\r\n<h4>আমরা সবসময়ই সম্মানিত গ্রাহকদের সকল প্রকার মতামত ও পরামর্শকে গুরুত্বের সাথে বিবেচনা করি। আমাদের সেবার মান উন্নয়নে আমরা জানতে চাই আপনার কথা ।</h4>\r\n\r\n<p>যোগাযোগ করুন নিম্নে বর্ণিত ঠিকানা সমূহেঃ</p>\r\n\r\n<h2>হেড অফিসঃ</h2>\r\n\r\n<address>&nbsp;</address>\r\n\r\n<h2>অফিস সময়ঃ</h2>\r\n\r\n<p>সকাল ৯ টা থেকে রাত ১০টা</p>\r\n\r\n<h2>কাস্টমার কেয়ার সার্ভিসঃ</h2>\r\n\r\n<p>সপ্তাহে ৭ দিন ২৪ ঘণ্টা</p>\r\n\r\n<p>ইমেইল করুন -</p>\r\n\r\n<p>contact@arishtex.com</p>\r\n\r\n<p>ফোনঃ 01731115588</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>কাস্টমার সাপোর্ট এর জন্য যোগাযোগ করুনঃ</h2>\r\n</form>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n\r\n<div class=\"fadeInUp logo-slider wow\" id=\"brands-carousel\">\r\n<div class=\"logo-slider-inner\">\r\n<div class=\"brand-slider custom-carousel owl-carousel owl-theme\" id=\"brand-slider\"><!--/.item--></div>\r\n<!-- /.owl-carousel #logo-slider --></div>\r\n<!-- /.logo-slider-inner --></div>\r\n<!-- /.logo-slider --></div>\r\n</div>', '2022-07-26 04:36:15', '2024-03-23 08:33:06'),
(2, 'contact_us', NULL, '2022-07-26 04:36:15', '2023-10-24 13:07:42'),
(3, 'shipping_guide', NULL, '2022-07-26 04:36:15', '2024-03-24 05:03:24'),
(4, 'investor_relation', '....', '2022-07-26 04:36:15', '2022-07-26 04:36:15'),
(5, 'company', '<p>Everyday more than 1000 products are added in arishatex.com To get new product update subscribe now.</p>', '2022-07-26 04:36:15', '2024-03-24 05:06:34'),
(6, 'customer_service', '<div class=\"container\" style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\r\n<div class=\"row\">\r\n<div class=\"col-md-12\">\r\n<p style=\"text-align:center\"><strong><span style=\"color:#3498db\"><span style=\"font-size:22px\">Customer Service</span></span></strong></p>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>সপ্তাহে ৭ দিন ২৪ ঘণ্টা</p>\r\n\r\n<p>ইমেইল করুন -</p>\r\n\r\n<p>contact@arishatex.com</p>\r\n\r\n<p>ফোনঃ 01731115588</p>\r\n</div>\r\n</div>\r\n</div>', '2022-07-26 04:36:15', '2024-03-24 04:56:42'),
(7, 'help_center', '<blockquote>\r\n<h1><strong>Help Center</strong></h1>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>সপ্তাহে ৭ দিন ২৪ ঘণ্টা</p>\r\n\r\n<p>ইমেইল করুন -</p>\r\n\r\n<p>contact@arishatex.com</p>\r\n\r\n<p>ফোনঃ 01731115588</p>\r\n</blockquote>', '2022-07-26 04:36:15', '2024-03-24 04:58:14'),
(8, 'faq', '<p>...........</p>', '2022-07-26 04:36:15', '2023-09-06 06:30:43'),
(9, 'terms_codition', '<h1><strong>Privacy and Confidentiality&nbsp;</strong></h1>\r\n\r\n<p>Welcome to the AjkerDeal Android Application (the &quot;App&quot;) operated by <strong>AjkerDeal.com Limited (Registration Number: &#39;&#39;)</strong>. We respect your privacy and want to protect your personal information. To learn more, please read this Privacy Policy.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>This Privacy Policy explains how we collect, use and (under certain conditions) disclose your personal information. This Privacy Policy also explains the steps we have taken to secure your personal information. Finally, this Privacy Policy explains your options regarding the collection, use and disclosure of your personal information. By visiting the app directly or through another app, you accept the practices described in this Policy.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Data protection is a matter of trust and your privacy is important to us. We shall therefore only use your name and other information which relates to you in the manner set out in this Privacy Policy. We will only collect information where it is necessary for us to do so and we will only collect information if it is relevant to our dealings with you.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We will only keep your information for as long as we are either required to by law or as is relevant for the purposes for which it was collected.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>You can visit the app without having to provide personal details. During your visit to the App you remain anonymous and at no time can we identify you unless you have an account on the App and log on with your user name and password.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>1. Data that we collect&nbsp;</strong></h4>\r\n\r\n<p>We may collect various pieces of information if you seek to place an order for a product with us on the App.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We collect, store and process your data for processing your purchase on the App and any possible later claims, and to provide you with our services. We may collect personal information including, but not limited to, your title, name, gender, date of birth, email address, postal address, delivery address (if different), telephone number, mobile number, fax number, payment details, payment card details or bank account details.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We will use the information you provide to enable us to process your orders and to provide you with the services and information offered through our app and which you request. Further, we will use the information you provide to administer your account with us; verify and carry out financial transactions in relation to payments you make; audit the downloading of data from our app; improve the layout and/or content of the pages of our app and customize them for users; identify visitors on our app; carry out research on our users&#39; demographics; send you information we think you may find useful or which you have requested from us, including information about our products and services, provided you have indicated that you have not objected to being contacted for these purposes. Subject to obtaining your consent we may contact you by email with details of other products and services. If you prefer not to receive any marketing communications from us, you can opt out at any time.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We may pass your name and address on to a third party in order to make delivery of the product to you (for example to our courier or supplier). You must only submit to us the Appinformation which is accurate and not misleading and you must keep it up to date and inform us of changes.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your actual order details may be stored with us but for security reasons cannot be retrieved directly by us. However, you may access this information by logging into your account on the App. Here you can view the details of your orders that have been completed, those which are open and those which are shortly to be dispatched and administer your address details, bank details ( for refund purposes) and any newsletter to which you may have subscribed. You undertake to treat the personal access data confidentially and not make it available to unauthorized third parties. We cannot assume any liability for misuse of passwords unless this misuse is our fault.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Other uses of your Personal Information&nbsp;</strong></p>\r\n\r\n<p>We may use your personal information for opinion and market research. Your details are anonymous and will only be used for statistical purposes. You can choose to opt out of this at any time. Any answers to surveys or opinion polls we may ask you to complete will not be forwarded on to third parties. Disclosing your email address is only necessary if you would like to take part in competitions. We save the answers to our surveys separately from your email address.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Your mobile number will be publicly visible only if you sell your own products using classified feature and make the deal open for sell. If publicly shared contact number causes privacy issue, you have liberty to take down any of your classified deal whenever you want to.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We may also send you other information about us, the App, our other websites or Apps, our products, sales promotions, our newsletters, anything relating to other companies in our group or our business partners. If you would prefer not to receive any of this additional information as detailed in this paragraph (or any part of it) please click the &#39;unsubscribe&#39; link in any email that we send to you. Within 7 working days (days which are neither (i) a Sunday, nor (ii) a public holiday anywhere in Pakistan) of receipt of your instruction we will cease to send you information as requested. If your instruction is unclear we will contact you for clarification.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We may further anonymize data about users of the App generally and use it for various purposes, including ascertaining the general location of the users and usage of certain aspects of the App or a link contained in an email to those registered to receive them, and supplying that anonymized data to third parties such as publishers. However, that anonymized data will not be capable of identifying you personally.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Competitions&nbsp;</strong></p>\r\n\r\n<p>For any competition we use the data to notify winners and advertise our offers. You can find more details where applicable in our participation terms for the respective competition.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Third Parties and Links&nbsp;</strong></p>\r\n\r\n<p>We may pass your details to other companies in our group. We may also pass your details to our agents and subcontractors to help us with any of our uses of your data set out in our Privacy Policy. For example, we may use third parties to assist us with delivering products to you, to help us to collect payments from you, to analyze data and to provide us with marketing or customer service assistance.</p>\r\n\r\n<p>We may exchange information with third parties for the purposes of fraud protection and credit risk reduction. We may transfer our databases containing your personal information if we sell our business or part of it. Other than as set out in this Privacy Policy, we shall NOT sell or disclose your personal data to third parties without obtaining your prior consent unless this is necessary for the purposes set out in this Privacy Policy or unless we are required to do so by law. The Site may contain advertisements of third parties and links to other sites or frames of other sites. Please be aware that we are not responsible for the privacy practices or content of those third parties or other sites, nor for any third party to whom we transfer your data in accordance with our Privacy Policy.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Third Party Libraries and Dependencies</strong></p>\r\n\r\n<p>We are using following third party libraries and dependencies for the App. We do not provide any user information such as Photos, Username, Email to any of the third party libraries and dependencies. Please be aware that we are not responsible for the privacy practices or content of those third party library and dependencies.</p>\r\n\r\n<ol>\r\n	<li>Io.grpc:grpc-okhttp:1.4.0</li>\r\n	<li>Io.grpc:grpc-protobuf-lite:1.4.0</li>\r\n	<li>Io.grpc:grpc-stub:1.4.0</li>\r\n	<li>Org.jetbrains.kotlin:kotlin-stdlib:1.3.41</li>\r\n	<li>Androidx.core:core:1.2.0-alpha02</li>\r\n	<li>Androidx.legacy:legacy-support-v4:1.0.0</li>\r\n	<li>Androidx.appcompat:appcompat:1.0.2</li>\r\n	<li>Com.google.android.material:material:1.0.0</li>\r\n	<li>Androidx.legacy:legacy-support-v4:1.0.0</li>\r\n	<li>Androidx.recyclerview:recyclerview:1.0.0</li>\r\n	<li>Androidx.cardview:cardview:1.0.0</li>\r\n	<li>Androidx.browser:browser:1.0.0</li>\r\n	<li>Androidx.constraintlayout:constraintlayout:1.1.3</li>\r\n	<li>Androidx.navigation:navigation-fragment:2.1.0-alpha05</li>\r\n	<li>Androidx.lifecycle:lifecycle-extensions:2.0.0</li>\r\n	<li>Androidx.room:room-runtime:2.1.0</li>\r\n	<li>Androidx.room:room-compiler:2.1.0</li>\r\n	<li>com.jakewharton.timber:timber:4.7.1</li>\r\n	<li>Androidx.multidex:multidex:2.0.1</li>\r\n	<li>Com.squareup.retrofit2:retrofit:2.5.0</li>\r\n	<li>Com.squareup.retrofit2:converter-gson:2.5.0</li>\r\n	<li>Com.squareup.okhttp3:okhttp:3.12.3</li>\r\n	<li>Com.google.code.gson:gson:2.7</li>\r\n	<li>Com.squareup.okhttp3:logging-interceptor:3.12.3</li>\r\n	<li>com.crashlytics.sdk.android:crashlytics:2.9.0@aar&#39;) { transitive = true}</li>\r\n	<li>Com.google.firebase:firebase-core:17.0.0</li>\r\n	<li>Com.google.firebase:firebase-database:18.0.0</li>\r\n	<li>Com.google.firebase:firebase-storage:18.0.0</li>\r\n	<li>Com.google.firebase:firebase-messaging:19.0.1</li>\r\n	<li>Com.google.firebase:firebase-invites:17.0.0</li>\r\n	<li>Com.google.firebase:firebase-appindexing:19.0.0</li>\r\n	<li>Com.google.firebase:firebase-perf:18.0.1</li>\r\n	<li>Com.google.android.gms:play-services-auth:17.0.0</li>\r\n	<li>Com.google.android.gms:play-services-analytics:16.0.8</li>\r\n	<li>Com.google.android.gms:play-services-location:16.0.0</li>\r\n	<li>com.google.auth:google-auth-library-oauth2-http:0.7.0&#39;)&nbsp;</li>\r\n	<li>Com.facebook.android:facebook-applinks:5.0.0</li>\r\n	<li>Com.facebook.android:facebook-login:5.0.0</li>\r\n	<li>Com.facebook.android:account-kit-sdk:4.22.1</li>\r\n	<li>Com.github.bumptech.glide:glide:4.9.0</li>\r\n	<li>Com.github.bumptech.glide:compiler:4.9.0</li>\r\n	<li>Com.jakewharton:butterknife:10.1.0</li>\r\n	<li>Com.jakewharton:butterknife-compiler:10.1.0</li>\r\n	<li>Com.nineoldandroids:library:2.4.0</li>\r\n	<li>com.daimajia.slider:library:1.1.5@aar</li>\r\n	<li>com.squareup.picasso:picasso:2.6.0-SNAPSHOT</li>\r\n	<li>De.hdodenhof:circleimageview:3.0.0</li>\r\n	<li>com.github.jd-alexander:LikeButton:0.2.3</li>\r\n	<li>Com.mikhaellopez:hfrecyclerview:1.0.0</li>\r\n	<li>com.github.chrisbanes:PhotoView:2.0.0&#39;</li>\r\n	<li>Org.florescu.android.rangeseekbar:rangeseekbar-library:0.3.0</li>\r\n	<li>&nbsp;net.gotev:speech:1.3.1</li>\r\n	<li>Javax.annotation:javax.annotation-api:1.2</li>\r\n	<li>Org.jsoup:jsoup:1.10.2</li>\r\n	<li>Nl.dionsegijn:konfetti:1.1.2</li>\r\n	<li>Com.facebook.shimmer:shimmer:0.4.0</li>\r\n	<li>com.github.omegaes:Whatsapp-API:1.0.3</li>\r\n	<li>Jp.wasabeef:richeditor-android:1.2.2</li>\r\n	<li>com.caverock:androidsvg-aar:1.3</li>\r\n</ol>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<ol start=\"2\">\r\n	<li><strong>Permissions</strong></li>\r\n</ol>\r\n\r\n<p>READ EXTERNAL STORAGE: Ajkerdeal App reads External Storage of User&rsquo;s phone to allow users to upload their photos to participate in different App activity such as profile photo, different photos of products and tools. The photos users upload at are their own choice. Ajkerdeal doesn&rsquo;t share these photos with any party or vendors. Users can reject or avoid to give Read External Storage permission.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>WRITE EXTERNAL STORAGE: Ajkerdeal App writes App configurations and preferences at User&rsquo;s app with user&rsquo;s permission. No harmful or misleading information are saved at user&rsquo;s external storage.&nbsp; Users can reject or avoid to give Write External Storage permission.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>RECORD AUDIO: Ajkerdeal uses Google Speech API for users to search with voice. The audio permission is used for that purpose only.&nbsp; Users can reject or avoid to give Record Audio permission.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>CAMERA: Users can upload their profile photo, review their product with photos. Camera permission is taken from users for those purposes only. No photos of Users are used without their consent. Users can reject or avoid to give camera permission.</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<p>FOREGROUND SERVICE: This service is used to let users know uploading progress at foreground. Ajkerdeal keeps user&rsquo;s uploaded photo data secured as per policy.&nbsp;</p>\r\n\r\n<p><br />\r\n&nbsp;</p>\r\n\r\n<ol start=\"3\">\r\n	<li><strong>Security</strong></li>\r\n</ol>\r\n\r\n<p>We have in place appropriate technical and security measures to prevent unauthorized or unlawful access to or accidental loss of or destruction or damage to your information. When we collect data through the App, we collect your personal details on a secure server. We use firewalls on our servers. Our security procedures mean that we may occasionally request proof of identity before we disclose personal information to you. You are responsible for protecting against unauthorized access to your password and to your computer.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ol start=\"4\">\r\n	<li><strong>Your rights</strong></li>\r\n</ol>\r\n\r\n<p>If you are concerned about your data you have the right to request access to the personal data which we may hold or process about you. You have the right to require us to correct any inaccuracies in your data free of charge. At any stage you also have the right to ask us to stop using your personal data for direct marketing purposes.</p>\r\n\r\n<p>&nbsp;</p>', NULL, '2023-10-24 13:03:18'),
(10, 'aye-eddy', '<p>Hello</p>', '2022-07-29 03:35:34', '2022-07-29 03:37:10'),
(11, 'what-we-offers', '<div class=\"table-responsive\">\r\n<table class=\"align-middle mb-0 table table-bordered table-hover text-start\">\r\n	<thead>\r\n		<tr>\r\n			<th scope=\"col\"><input type=\"checkbox\" /></th>\r\n			<th scope=\"col\">Date</th>\r\n			<th scope=\"col\">Invoice</th>\r\n			<th scope=\"col\">Customer</th>\r\n			<th scope=\"col\">Amount</th>\r\n			<th scope=\"col\">Status</th>\r\n			<th scope=\"col\">Action</th>\r\n		</tr>\r\n	</thead>\r\n	<tbody>\r\n		<tr>\r\n			<td><input type=\"checkbox\" /></td>\r\n			<td>01 Jan 2045</td>\r\n			<td>INV-0123</td>\r\n			<td>Jhon Doe</td>\r\n			<td>$123</td>\r\n			<td>Paid</td>\r\n			<td><a class=\"btn btn-sm btn-primary\" href=\"\">Detail</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td><input type=\"checkbox\" /></td>\r\n			<td>01 Jan 2045</td>\r\n			<td>INV-0123</td>\r\n			<td>Jhon Doe</td>\r\n			<td>$123</td>\r\n			<td>Paid</td>\r\n			<td><a class=\"btn btn-sm btn-primary\" href=\"\">Detail</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td><input type=\"checkbox\" /></td>\r\n			<td>01 Jan 2045</td>\r\n			<td>INV-0123</td>\r\n			<td>Jhon Doe</td>\r\n			<td>$123</td>\r\n			<td>Paid</td>\r\n			<td><a class=\"btn btn-sm btn-primary\" href=\"\">Detail</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td><input type=\"checkbox\" /></td>\r\n			<td>01 Jan 2045</td>\r\n			<td>INV-0123</td>\r\n			<td>Jhon Doe</td>\r\n			<td>$123</td>\r\n			<td>Paid</td>\r\n			<td><a class=\"btn btn-sm btn-primary\" href=\"\">Detail</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td><input type=\"checkbox\" /></td>\r\n			<td>01 Jan 2045</td>\r\n			<td>INV-0123</td>\r\n			<td>Jhon Doe</td>\r\n			<td>$123</td>\r\n			<td>Paid</td>\r\n			<td><a class=\"btn btn-sm btn-primary\" href=\"\">Detail</a></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n</div>', '2022-07-29 03:36:47', '2022-07-29 03:36:47'),
(12, 'new-products-1', NULL, '2023-10-29 00:41:43', '2023-10-29 00:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'a:1:{i:0;s:1:\"2\";}', '2024-05-25 04:38:11', '2024-05-25 04:38:11'),
(2, 'a:1:{i:0;s:1:\"2\";}', '2024-05-25 04:38:41', '2024-05-25 04:38:41'),
(3, 'a:1:{i:0;s:1:\"5\";}', '2024-07-26 08:52:14', '2024-07-26 08:52:14'),
(4, 'a:1:{i:0;s:1:\"5\";}', '2024-07-26 08:52:33', '2024-07-26 08:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `menu_banner` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_name`, `slug`, `menu_banner`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Home', 'home', 'public/images/menu/1662543788_icon2.png', 'Active', '2022-09-07 03:43:08', '2023-09-09 03:10:05'),
(7, 'Combo Offer', 'combo-offer', 'public/images/menu/1662543698_product-3.jpg', 'Active', '2022-09-07 03:41:38', '2023-09-09 03:10:07'),
(8, 'Brands', 'brands', 'public/images/menu/1662543743_danpitee.png', 'Active', '2022-09-07 03:42:06', '2023-09-09 03:10:09'),
(10, 'New Products', 'new-products', 'public/images/menu/1662543839_bg.jpg', 'Active', '2022-09-07 03:43:59', '2023-09-09 03:09:26'),
(11, 'Flash Sale', 'flash-sale', 'public/images/menu/1662543860_slides-1.jpg', 'Active', '2022-09-07 03:44:20', '2023-09-09 03:10:10'),
(12, 'New Products', 'new-products-1', 'public/images/menu/1694250632_2775139_398065-PD2B5P-161.jpg', 'Active', '2023-09-09 03:10:32', '2023-09-09 03:10:32'),
(14, 'পিতলের সামগ্রী', 'pitler-samgree', 'public/images/menu/1702870910_ca0dc6ed7cb918bebc081d81357e53e6.jpg_750x750.jpg_.webp', 'Active', '2023-12-17 21:41:50', '2023-12-17 21:41:50'),
(15, 'স্টেইনলেস স্টিলের সামগ্রী', 'steinles-stiler-samgree', 'public/images/menu/1702870988_beeeb569fe589dfbac6b7ba3a3daadcd (1).jpg', 'Active', '2023-12-17 21:43:08', '2023-12-17 21:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 24),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_05_10_165358_create_permission_tables', 1),
(6, '2022_05_30_170041_create_admins_table', 1),
(9, '2022_06_05_135337_create_paymenticons_table', 3),
(10, '2022_06_05_154500_create_policymenus_table', 4),
(11, '2022_06_05_160425_create_brands_table', 5),
(13, '2022_06_05_161534_create_categories_table', 6),
(14, '2022_06_05_162356_create_subcategories_table', 6),
(15, '2022_06_05_174116_create_menus_table', 7),
(16, '2022_06_05_175240_create_sliders_table', 8),
(17, '2022_06_11_163434_create_addbanners_table', 9),
(18, '2022_06_12_083742_create_servicepackages_table', 10),
(19, '2022_06_12_094150_create_attributes_table', 11),
(20, '2022_06_12_101406_create_attrvalues_table', 12),
(21, '2022_06_13_151836_create_products_table', 13),
(22, '2022_07_26_095343_create_information_table', 14),
(23, '2022_06_03_155714_create_basicinfos_table', 15),
(24, '2022_07_31_113927_create_orders_table', 16),
(25, '2022_07_31_114256_create_customers_table', 16),
(26, '2022_07_31_114332_create_orderproducts_table', 16),
(27, '2022_07_31_154506_create_comments_table', 17),
(28, '2022_08_03_054431_create_couriers_table', 18),
(29, '2022_08_03_054554_create_cities_table', 18),
(30, '2022_08_03_054617_create_zones_table', 18),
(31, '2022_08_03_062427_create_purchases_table', 19),
(32, '2022_08_03_062457_create_stocks_table', 19),
(33, '2022_08_03_062528_create_suppliers_table', 19),
(34, '2022_08_03_062605_create_paymenttypes_table', 20),
(35, '2022_08_03_062728_create_paymentcompletes_table', 20),
(36, '2022_08_03_062729__create_payments_table', 21),
(37, '2022_08_03_104040_create_invoices_table', 22),
(38, '2022_08_04_100314_create_complains_table', 23),
(39, '2022_08_04_100558_create_complanenotes_table', 23),
(40, '2024_07_08_105733_create_weights_table', 25);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(2, 'App\\Models\\Admin', 11),
(5, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 7),
(5, 'App\\Models\\User', 8),
(5, 'App\\Models\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `orderproducts`
--

CREATE TABLE `orderproducts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `productCode` varchar(255) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `productPrice` int(11) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orderproducts`
--

INSERT INTO `orderproducts` (`id`, `order_id`, `product_id`, `productCode`, `productName`, `color`, `size`, `productPrice`, `discount`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 189, 'BNL000173', 'Dummy Weight', NULL, NULL, 808, 0.00, 174, '2024-07-16 02:35:16', '2024-07-16 02:35:16'),
(2, 2, 189, 'BNL000173', 'Dummy Weight', NULL, NULL, 855, 0.00, 775, '2024-07-17 05:47:31', '2024-07-17 05:47:31'),
(3, 3, 189, 'BNL000173', 'Dummy Weight', NULL, NULL, 855, 0.00, 5, '2024-07-17 05:49:55', '2024-07-17 05:49:55'),
(4, 4, 189, 'BNL000173', 'Dummy Weight', 'Blue', NULL, 855, 0.00, 20, '2024-07-26 08:36:50', '2024-07-26 08:36:50'),
(6, 5, 189, 'BNL000173', 'Dummy Weight', NULL, NULL, 808, 0.00, 20, '2024-07-26 08:51:42', '2024-07-26 08:51:42'),
(7, 6, 169, 'BNL000167', 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', NULL, NULL, 1990, 0.00, 20, '2024-07-26 09:37:19', '2024-07-26 09:37:19'),
(9, 7, 189, 'BNL000173', 'Dummy Weight', NULL, NULL, 855, 0.00, 6, '2024-07-26 09:46:45', '2024-07-26 09:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceID` varchar(255) NOT NULL,
  `entry_complete` varchar(255) DEFAULT NULL,
  `web_id` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `Payment` varchar(255) DEFAULT NULL,
  `customerNote` text DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `paymentAgentNumber` varchar(255) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `subTotal` int(11) NOT NULL,
  `deliveryCharge` int(11) DEFAULT NULL,
  `discountCharge` int(11) DEFAULT NULL,
  `paymentAmount` int(11) DEFAULT NULL,
  `orderDate` date NOT NULL,
  `deliveryDate` date DEFAULT NULL,
  `completeDate` date DEFAULT NULL,
  `last_updated` date DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Processing',
  `admin_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `invoiceID`, `entry_complete`, `web_id`, `user_id`, `Payment`, `customerNote`, `memo`, `payment_type_id`, `payment_id`, `paymentAgentNumber`, `courier_id`, `city_id`, `zone_id`, `subTotal`, `deliveryCharge`, `discountCharge`, `paymentAmount`, `orderDate`, `deliveryDate`, `completeDate`, `last_updated`, `status`, `admin_id`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 'BG771', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3232, 100, NULL, NULL, '2024-07-16', NULL, NULL, NULL, 'Processing', 1, 1, '2024-07-16 02:35:16', '2024-07-16 02:35:16'),
(2, 'BG772', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2565, 100, NULL, NULL, '2024-07-17', NULL, NULL, NULL, 'Processing', 1, 1, '2024-07-17 05:47:31', '2024-07-17 05:47:31'),
(3, 'BG773', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1710, 100, NULL, NULL, '2024-07-17', NULL, NULL, NULL, 'Processing', 1, 1, '2024-07-17 05:49:55', '2024-07-17 05:49:55'),
(4, 'BG774', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17100, 60, NULL, NULL, '2024-07-26', NULL, NULL, NULL, 'Processing', 1, 1, '2024-07-26 08:36:50', '2024-07-26 08:36:50'),
(5, 'BG775', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 10, 0, 0, 16220, 60, 0, 0, '2024-07-26', NULL, NULL, NULL, 'Invoiced', 1, 1, '2024-07-26 08:51:19', '2024-07-26 08:52:08'),
(6, 'BG776', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 19900, 60, NULL, NULL, '2024-07-26', NULL, NULL, NULL, 'Processing', 1, 1, '2024-07-26 09:37:19', '2024-07-26 09:37:19'),
(7, 'BG777', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 10, 0, 0, 5230, 100, 0, 0, '2024-07-26', NULL, NULL, NULL, 'Processing', 1, 1, '2024-07-26 09:46:31', '2024-07-26 09:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymentcompletes`
--

CREATE TABLE `paymentcompletes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_type_id` int(11) DEFAULT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `trid` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `userID` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paymentcompletes`
--

INSERT INTO `paymentcompletes` (`id`, `order_id`, `payment_type_id`, `payment_id`, `amount`, `trid`, `date`, `userID`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL, 0, NULL, '2024-05-25', 1, '2024-05-25 04:37:50', '2024-05-25 04:37:50'),
(2, 5, NULL, NULL, 0, NULL, '2024-07-26', 1, '2024-07-26 08:51:42', '2024-07-26 08:51:42'),
(3, 7, NULL, NULL, 0, NULL, '2024-07-26', 1, '2024-07-26 09:46:45', '2024-07-26 09:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `paymenticons`
--

CREATE TABLE `paymenticons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_type_name` varchar(255) NOT NULL,
  `payment_icon` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paymenticons`
--

INSERT INTO `paymenticons` (`id`, `payment_type_name`, `payment_icon`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Discover', 'public/images/paymenticon/1654443105_2.png', 'Active', '2022-06-05 09:31:45', '2022-06-05 09:36:56'),
(4, 'Visa', 'public/images/paymenticon/1654614620_nidfont.jpg', 'Active', '2022-06-07 09:10:20', '2022-06-07 09:10:20');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_type_id` bigint(20) UNSIGNED NOT NULL,
  `paymentNumber` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paymenttypes`
--

CREATE TABLE `paymenttypes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paymentTypeName` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `paymenttypes`
--

INSERT INTO `paymenttypes` (`id`, `paymentTypeName`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bkash', 'Active', '2022-11-05 07:59:52', '2022-11-08 01:55:28'),
(2, 'Mobile Recharge', 'Active', '2022-11-06 00:05:49', '2022-11-06 00:05:49'),
(3, 'Roket', 'Active', '2022-11-07 22:47:01', '2022-11-07 22:47:01'),
(4, 'Nagad', 'Active', '2022-11-08 01:54:47', '2022-11-08 01:54:47');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `group_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(2, 'dashboard.edit', 'admin', 'dashboard', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(3, 'admin.create', 'admin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(4, 'admin.view', 'admin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(5, 'admin.edit', 'admin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(6, 'admin.delete', 'admin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(7, 'admin.approved', 'admin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(8, 'role.create', 'admin', 'role', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(9, 'role.view', 'admin', 'role', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(10, 'role.edit', 'admin', 'role', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(11, 'role.delete', 'admin', 'role', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(12, 'role.approved', 'admin', 'role', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(13, 'profile.view', 'admin', 'profile', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(14, 'profile.edit', 'admin', 'profile', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(15, 'category.create', 'admin', 'category', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(16, 'category.view', 'admin', 'category', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(17, 'category.edit', 'admin', 'category', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(18, 'category.delete', 'admin', 'category', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(19, 'category.approved', 'admin', 'category', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(20, 'dashboard.view', 'web', 'dashboard', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(21, 'dashboard.edit', 'web', 'dashboard', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(22, 'profile.view', 'web', 'profile', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(23, 'profile.edit', 'web', 'profile', '2022-06-01 03:01:10', '2022-06-01 03:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `policymenus`
--

CREATE TABLE `policymenus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `policy_menu_name` varchar(255) NOT NULL,
  `policy_text` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `policymenus`
--

INSERT INTO `policymenus` (`id`, `policy_menu_name`, `policy_text`, `status`, `created_at`, `updated_at`) VALUES
(1, 'MONEY BACK', '30 Days Money Back Guarantee', 'Active', '2022-06-05 09:52:19', '2022-07-20 11:15:01'),
(3, 'SPECIAL SALE', 'Extra $5 off on all items', 'Active', '2022-06-05 09:52:42', '2022-06-07 09:10:58'),
(4, 'FREE SHIPPING', 'Shipping on orders over $99', 'Active', '2022-07-16 01:44:08', '2022-07-20 11:15:02');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `color` text DEFAULT NULL,
  `size` text DEFAULT NULL,
  `weight` text DEFAULT NULL,
  `ProductName` varchar(255) NOT NULL,
  `ProductSlug` varchar(255) NOT NULL,
  `ProductBreaf` longtext DEFAULT NULL,
  `ProductDetails` longtext DEFAULT NULL,
  `ProductSku` varchar(255) NOT NULL,
  `youtube_embade` varchar(255) DEFAULT NULL,
  `ProductRegularPrice` decimal(10,2) DEFAULT 0.00,
  `ProductSalePrice` decimal(10,2) DEFAULT 0.00,
  `Discount` varchar(255) DEFAULT '0',
  `ProductImage` varchar(255) NOT NULL DEFAULT 'public/images/product/default.jpg',
  `ViewProductImage` varchar(255) NOT NULL DEFAULT 'public/images/product/default.jpg',
  `PostImage` longtext DEFAULT NULL,
  `MetaTitle` varchar(255) DEFAULT NULL,
  `MetaKey` varchar(255) DEFAULT NULL,
  `MetaDescription` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `event` tinyint(4) NOT NULL DEFAULT 1,
  `frature` tinyint(4) NOT NULL DEFAULT 0,
  `top_rated` tinyint(4) NOT NULL DEFAULT 0,
  `best_selling` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `subcategory_id`, `brand_id`, `color`, `size`, `weight`, `ProductName`, `ProductSlug`, `ProductBreaf`, `ProductDetails`, `ProductSku`, `youtube_embade`, `ProductRegularPrice`, `ProductSalePrice`, `Discount`, `ProductImage`, `ViewProductImage`, `PostImage`, `MetaTitle`, `MetaKey`, `MetaDescription`, `status`, `event`, `frature`, `top_rated`, `best_selling`, `created_at`, `updated_at`) VALUES
(169, 16, NULL, NULL, NULL, NULL, NULL, 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', 'stylist-premium-quality-summer-polo-shirt-for-men-polo-t-shirt', '১০ লিটার ১৯৯০ টাকা ( ১৩ কেজি চাল )\r\n১৫ লিটার ২৪৯০ টাকা ( ১৮ কেজি চাল )\r\n২০ লিটার ২৯৯০ টাকা  ( ২৩ কেজি চাল )\r\n২৫ লিটার ৩৪৯০ টাকা ( ২৮ কেজি চাল )\r\n৩০ লিটার ৩৯৯০ টাকা ( ৩৫ কেজি চাল )', '<h3>Product Overview</h3>\r\n    <h3>Unmatched Quality and Comfort: Black Embroidered Polo Shirts</h3>\r\n    <p>Discover the epitome of durability, quality, and style with our \r\nblack embroidered polo shirts. Crafted from 100% cotton knitted \r\nbio-washed pique fabric, these polo shirts promise not only supreme \r\ncomfort but also longevity.</p>\r\n    <p>Perfect for the discerning man, our men\'s embroidered polo shirts\r\n are designed to withstand regular wear, making them a cost-effective \r\naddition to your wardrobe. The vibrant embroidered golf shirts feature a\r\n 4 x 4 inches embroidery area, offering up to 6 thread colors for \r\nbright, quality colors, and sharp details that make your design pop.</p>\r\n    <h3>Personalize Your Style &amp; Brand Identity with Customizable Polo T-Shirts</h3>\r\n    <p>Elevate your brand or personal style with our customizable polo \r\nshirts. Whether you\'re looking to create custom polo shirts for \r\nbusiness, provide uniforms, or promote an event, our shirts are your \r\nblank canvas. Upload your artwork, design online, or select from our \r\ntemplates to make your customized polo t-shirts truly unique.</p>\r\n    <p>With options for personalization down to the last detail, \r\nincluding the specific embroidery on the left chest, these shirts are \r\ntailored to meet your individual needs. The custom embroidered polo and \r\nprofessional polo shirt options ensure that your brand stands out in the\r\n most elegant and engaging way possible.</p><p></p>', 'BNL000167', NULL, 2490.00, 1990.00, '20', 'public/images/product/image/17112045596258b4c760f7-ab26-42d9-91bb-bb54f0db786c.png', 'public/images/product/image/17112045596258b4c760f7-ab26-42d9-91bb-bb54f0db786c.webp', '[\"1702882509_71V19HbNqjL._AC_UF894,1000_QL80_.jpg\"]', NULL, NULL, NULL, 'Active', 1, 0, 1, 1, '2023-12-18 00:55:09', '2024-07-27 00:53:37'),
(170, 16, NULL, 0, NULL, NULL, NULL, 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', 'stylist-premium-quality-summer-polo-shirt-for-men-polo-t-shirt-1', 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', '<h3>Product Overview</h3>\r\n    <h3>Unmatched Quality and Comfort: Black Embroidered Polo Shirts</h3>\r\n    <p>Discover the epitome of durability, quality, and style with our \r\nblack embroidered polo shirts. Crafted from 100% cotton knitted \r\nbio-washed pique fabric, these polo shirts promise not only supreme \r\ncomfort but also longevity.</p>\r\n    <p>Perfect for the discerning man, our men\'s embroidered polo shirts\r\n are designed to withstand regular wear, making them a cost-effective \r\naddition to your wardrobe. The vibrant embroidered golf shirts feature a\r\n 4 x 4 inches embroidery area, offering up to 6 thread colors for \r\nbright, quality colors, and sharp details that make your design pop.</p>\r\n    <h3>Personalize Your Style &amp; Brand Identity with Customizable Polo T-Shirts</h3>\r\n    <p>Elevate your brand or personal style with our customizable polo \r\nshirts. Whether you\'re looking to create custom polo shirts for \r\nbusiness, provide uniforms, or promote an event, our shirts are your \r\nblank canvas. Upload your artwork, design online, or select from our \r\ntemplates to make your customized polo t-shirts truly unique.</p>\r\n    <p>With options for personalization down to the last detail, \r\nincluding the specific embroidery on the left chest, these shirts are \r\ntailored to meet your individual needs. The custom embroidered polo and \r\nprofessional polo shirt options ensure that your brand stands out in the\r\n most elegant and engaging way possible.</p><p></p>', 'BNL000170', NULL, 200.00, 400.00, '50', 'public/images/product/image/17112049206014trouserpoloshirts_8.webp', 'public/images/product/image/17112049206014trouserpoloshirts_8.webp', NULL, NULL, NULL, NULL, 'Active', 1, 0, 1, 1, '2024-03-23 08:42:00', '2024-07-27 00:53:36'),
(171, 16, NULL, 0, NULL, NULL, NULL, 'Stylist Premium Quality Summer Polo Shirt For Men', 'stylist-premium-quality-summer-polo-shirt-for-men', 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', '<h3>Product Overview</h3>\r\n    <h3>Unmatched Quality and Comfort: Black Embroidered Polo Shirts</h3>\r\n    <p>Discover the epitome of durability, quality, and style with our \r\nblack embroidered polo shirts. Crafted from 100% cotton knitted \r\nbio-washed pique fabric, these polo shirts promise not only supreme \r\ncomfort but also longevity.</p>\r\n    <p>Perfect for the discerning man, our men\'s embroidered polo shirts\r\n are designed to withstand regular wear, making them a cost-effective \r\naddition to your wardrobe. The vibrant embroidered golf shirts feature a\r\n 4 x 4 inches embroidery area, offering up to 6 thread colors for \r\nbright, quality colors, and sharp details that make your design pop.</p>\r\n    <h3>Personalize Your Style &amp; Brand Identity with Customizable Polo T-Shirts</h3>\r\n    <p>Elevate your brand or personal style with our customizable polo \r\nshirts. Whether you\'re looking to create custom polo shirts for \r\nbusiness, provide uniforms, or promote an event, our shirts are your \r\nblank canvas. Upload your artwork, design online, or select from our \r\ntemplates to make your customized polo t-shirts truly unique.</p>\r\n    <p>With options for personalization down to the last detail, \r\nincluding the specific embroidery on the left chest, these shirts are \r\ntailored to meet your individual needs. The custom embroidered polo and \r\nprofessional polo shirt options ensure that your brand stands out in the\r\n most elegant and engaging way possible.</p><p></p>', 'BNL000171', NULL, 200.00, 400.00, '50', 'public/images/product/image/17112049473527organic-9681-4129132-1.webp', 'public/images/product/image/17112049473527organic-9681-4129132-1.webp', NULL, NULL, NULL, NULL, 'Active', 1, 0, 1, 1, '2024-03-23 08:42:27', '2024-07-27 00:53:34'),
(172, 16, 29, NULL, NULL, NULL, NULL, 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', 'stylist-premium-quality-summer-polo-shirt-for-men-polo-t-shirt-2', 'Stylist Premium Quality Summer Polo Shirt For Men - Polo T Shirt', '<h3>Product Overview</h3>\r\n    <h3>Unmatched Quality and Comfort: Black Embroidered Polo Shirts</h3>\r\n    <p>Discover the epitome of durability, quality, and style with our \r\nblack embroidered polo shirts. Crafted from 100% cotton knitted \r\nbio-washed pique fabric, these polo shirts promise not only supreme \r\ncomfort but also longevity.</p>\r\n    <p>Perfect for the discerning man, our men\'s embroidered polo shirts\r\n are designed to withstand regular wear, making them a cost-effective \r\naddition to your wardrobe. The vibrant embroidered golf shirts feature a\r\n 4 x 4 inches embroidery area, offering up to 6 thread colors for \r\nbright, quality colors, and sharp details that make your design pop.</p>\r\n    <h3>Personalize Your Style & Brand Identity with Customizable Polo T-Shirts</h3>\r\n    <p>Elevate your brand or personal style with our customizable polo \r\nshirts. Whether you\'re looking to create custom polo shirts for \r\nbusiness, provide uniforms, or promote an event, our shirts are your \r\nblank canvas. Upload your artwork, design online, or select from our \r\ntemplates to make your customized polo t-shirts truly unique.</p>\r\n    <p>With options for personalization down to the last detail, \r\nincluding the specific embroidery on the left chest, these shirts are \r\ntailored to meet your individual needs. The custom embroidered polo and \r\nprofessional polo shirt options ensure that your brand stands out in the\r\n most elegant and engaging way possible.</p><p></p>', 'BNL000172', NULL, 400.00, 200.00, '50', 'public/images/product/image/17112049663016image00001-PhotoRoom_63_800x.webp', 'public/images/product/image/17112049663016image00001-PhotoRoom_63_800x.webp', NULL, NULL, NULL, NULL, 'Active', 1, 0, 1, 1, '2024-03-23 08:42:46', '2024-07-27 00:53:32'),
(189, 16, 36, 3, '[\"Black\",\"Blue\",\"White\",\"Maroon\"]', '[\"M\",\"L\",\"XL\"]', NULL, 'Dummy Weight', 'dummy-weight', 'dummy Short Description', '<p>dummy Description<br></p>', 'BNL000173', 'embade', NULL, NULL, NULL, 'public/images/product/image/17209337634070one.jpg', 'public/images/product/image/17209337634070one.webp', '[\"1720933763_one.jpg\",\"1720933763_two.jpg\"]', 'title', 'title', 'desc', 'Active', 1, 0, 1, 1, '2024-07-13 23:09:23', '2024-07-27 00:52:39'),
(190, 17, 30, 3, '[\"Black\",\"White\",\"Maroon\",\"Pink\",\"Green\",\"Tiya\",\"Purple\",\"Dark Ash\",\"Deep Yellow\",\"Onion\",\"Velvet\",\"Orrange\",\"Camel\",\"Brown\",\"Sky Blue\",\"Polar Silver\",\"Mint Green\"]', '[\"Free Size\",\"XL\",\"XXL\",\"38\",\"40\",\"42\",\"44\",\"S\",\"5-8 Years\",\"8-12 Years\"]', NULL, 'Delilah Duke', 'delilah-duke', 'Incididunt nulla del', NULL, 'BNL000190', 'Sit molestiae volup', 521.00, 116.00, '78', 'public/images/product/image/172215019331951f427434-7ca0-46b2-b5d1-7d31843859b6_funky-focus-red-flower-field-after.avif', 'public/images/product/image/172215019331951f427434-7ca0-46b2-b5d1-7d31843859b6_funky-focus-red-flower-field-after.avif', NULL, NULL, NULL, NULL, 'Active', 1, 0, 0, 1, '2024-07-28 01:03:13', '2024-07-28 01:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoiceID` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `invoiceID`, `date`, `product_id`, `supplier_id`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(1, '2023-09-08', '2023-09-08', 1, 1, 100, 'Active', '2023-09-08 02:29:02', '2023-09-08 02:29:02'),
(2, '2023-09-08', '2023-09-08', 2, 1, 100, 'Active', '2023-09-08 02:34:10', '2023-09-08 02:34:10'),
(3, '2023-09-08', '2023-09-08', 3, 1, 100, 'Active', '2023-09-08 03:09:03', '2023-09-08 03:09:03'),
(4, '2023-09-08', '2023-09-08', 4, 1, 100, 'Active', '2023-09-08 03:52:07', '2023-09-08 03:52:07'),
(5, '2023-09-10', '2023-09-10', 5, 1, 100, 'Active', '2023-09-10 00:55:05', '2023-09-10 00:55:05'),
(6, '2023-09-10', '2023-09-10', 6, 1, 100, 'Active', '2023-09-10 01:09:00', '2023-09-10 01:09:00'),
(7, '2023-09-10', '2023-09-10', 7, 1, 100, 'Active', '2023-09-10 02:11:20', '2023-09-10 02:11:20'),
(8, '2023-09-10', '2023-09-10', 8, 1, 100, 'Active', '2023-09-10 03:31:08', '2023-09-10 03:31:08'),
(9, '2023-09-10', '2023-09-10', 9, 1, 100, 'Active', '2023-09-10 03:39:19', '2023-09-10 03:39:19'),
(10, '2023-09-10', '2023-09-10', 10, 1, 100, 'Active', '2023-09-10 03:56:36', '2023-09-10 03:56:36'),
(11, '2023-09-10', '2023-09-10', 11, 1, 100, 'Active', '2023-09-10 03:56:40', '2023-09-10 03:56:40'),
(12, '2023-09-10', '2023-09-10', 12, 1, 100, 'Active', '2023-09-10 04:01:10', '2023-09-10 04:01:10'),
(13, '2023-09-10', '2023-09-10', 13, 1, 100, 'Active', '2023-09-10 04:07:55', '2023-09-10 04:07:55'),
(14, '2023-09-10', '2023-09-10', 14, 1, 100, 'Active', '2023-09-10 04:51:04', '2023-09-10 04:51:04'),
(15, '2023-09-10', '2023-09-10', 15, 1, 100, 'Active', '2023-09-10 04:57:00', '2023-09-10 04:57:00'),
(16, '2023-09-10', '2023-09-10', 16, 1, 100, 'Active', '2023-09-10 05:25:41', '2023-09-10 05:25:41'),
(17, '2023-09-10', '2023-09-10', 17, 1, 100, 'Active', '2023-09-10 06:17:25', '2023-09-10 06:17:25'),
(18, '2023-09-10', '2023-09-10', 18, 1, 100, 'Active', '2023-09-10 06:32:05', '2023-09-10 06:32:05'),
(19, '2023-09-10', '2023-09-10', 19, 1, 100, 'Active', '2023-09-10 06:36:08', '2023-09-10 06:36:08'),
(20, '2023-09-10', '2023-09-10', 20, 1, 100, 'Active', '2023-09-10 06:39:22', '2023-09-10 06:39:22'),
(21, '2023-09-10', '2023-09-10', 21, 1, 100, 'Active', '2023-09-10 06:42:46', '2023-09-10 06:42:46'),
(22, '2023-09-11', '2023-09-11', 22, 1, 100, 'Active', '2023-09-11 00:04:15', '2023-09-11 00:04:15'),
(23, '2023-09-11', '2023-09-11', 23, 1, 100, 'Active', '2023-09-11 00:06:28', '2023-09-11 00:06:28'),
(24, '2023-09-11', '2023-09-11', 24, 1, 100, 'Active', '2023-09-11 00:08:55', '2023-09-11 00:08:55'),
(25, '2023-09-11', '2023-09-11', 25, 1, 100, 'Active', '2023-09-11 00:10:40', '2023-09-11 00:10:40'),
(26, '2023-09-11', '2023-09-11', 26, 1, 100, 'Active', '2023-09-11 00:13:01', '2023-09-11 00:13:01'),
(27, '2023-09-11', '2023-09-11', 27, 1, 100, 'Active', '2023-09-11 03:25:28', '2023-09-11 03:25:28'),
(28, '2023-09-11', '2023-09-11', 28, 1, 100, 'Active', '2023-09-11 03:36:09', '2023-09-11 03:36:09'),
(29, '2023-09-11', '2023-09-11', 29, 1, 100, 'Active', '2023-09-11 03:38:12', '2023-09-11 03:38:12'),
(30, '2023-09-11', '2023-09-11', 30, 1, 100, 'Active', '2023-09-11 03:39:53', '2023-09-11 03:39:53'),
(31, '2023-09-11', '2023-09-11', 31, 1, 100, 'Active', '2023-09-11 03:43:29', '2023-09-11 03:43:29'),
(32, '2023-09-11', '2023-09-11', 32, 1, 100, 'Active', '2023-09-11 03:55:23', '2023-09-11 03:55:23'),
(33, '2023-09-11', '2023-09-11', 33, 1, 100, 'Active', '2023-09-11 03:58:29', '2023-09-11 03:58:29'),
(34, '2023-09-11', '2023-09-11', 34, 1, 100, 'Active', '2023-09-11 04:02:54', '2023-09-11 04:02:54'),
(35, '2023-09-11', '2023-09-11', 35, 1, 100, 'Active', '2023-09-11 04:07:53', '2023-09-11 04:07:53'),
(36, '2023-09-13', '2023-09-13', 36, 1, 100, 'Active', '2023-09-13 05:09:13', '2023-09-13 05:09:13'),
(37, '2023-09-13', '2023-09-13', 37, 1, 100, 'Active', '2023-09-13 05:11:04', '2023-09-13 05:11:04'),
(38, '2023-09-13', '2023-09-13', 38, 1, 100, 'Active', '2023-09-13 05:19:10', '2023-09-13 05:19:10'),
(39, '2023-09-14', '2023-09-14', 39, 1, 100, 'Active', '2023-09-14 07:03:25', '2023-09-14 07:03:25'),
(40, '2023-09-14', '2023-09-14', 40, 1, 100, 'Active', '2023-09-14 07:09:06', '2023-09-14 07:09:06'),
(41, '2023-09-14', '2023-09-14', 41, 1, 100, 'Active', '2023-09-14 07:18:56', '2023-09-14 07:18:56'),
(42, '2023-09-14', '2023-09-14', 42, 1, 100, 'Active', '2023-09-14 07:24:44', '2023-09-14 07:24:44'),
(43, '2023-09-14', '2023-09-14', 43, 1, 100, 'Active', '2023-09-14 07:40:57', '2023-09-14 07:40:57'),
(44, '2023-09-14', '2023-09-14', 44, 1, 100, 'Active', '2023-09-14 07:46:46', '2023-09-14 07:46:46'),
(45, '2023-09-15', '2023-09-15', 45, 1, 100, 'Active', '2023-09-15 07:33:04', '2023-09-15 07:33:04'),
(46, '2023-09-15', '2023-09-15', 46, 1, 100, 'Active', '2023-09-15 07:36:15', '2023-09-15 07:36:15'),
(47, '2023-10-12', '2023-10-12', 47, 1, 100, 'Active', '2023-10-12 01:21:35', '2023-10-12 01:21:35'),
(48, '2023-10-12', '2023-10-12', 48, 1, 100, 'Active', '2023-10-12 01:35:55', '2023-10-12 01:35:55'),
(49, '2023-10-12', '2023-10-12', 49, 1, 100, 'Active', '2023-10-12 01:35:58', '2023-10-12 01:35:58'),
(50, '2023-10-12', '2023-10-12', 50, 1, 100, 'Active', '2023-10-12 01:39:29', '2023-10-12 01:39:29'),
(51, '2023-10-12', '2023-10-12', 51, 1, 100, 'Active', '2023-10-12 01:42:10', '2023-10-12 01:42:10'),
(52, '2023-10-25', '2023-10-25', 52, 1, 100, 'Active', '2023-10-25 02:17:16', '2023-10-25 02:17:16'),
(53, '2023-10-25', '2023-10-25', 53, 1, 100, 'Active', '2023-10-25 02:25:19', '2023-10-25 02:25:19'),
(54, '2023-10-25', '2023-10-25', 54, 1, 100, 'Active', '2023-10-25 02:29:34', '2023-10-25 02:29:34'),
(55, '2023-10-25', '2023-10-25', 55, 1, 100, 'Active', '2023-10-25 02:29:37', '2023-10-25 02:29:37'),
(56, '2023-10-25', '2023-10-25', 56, 1, 100, 'Active', '2023-10-25 06:26:12', '2023-10-25 06:26:12'),
(57, '2023-10-25', '2023-10-25', 57, 1, 100, 'Active', '2023-10-25 06:26:41', '2023-10-25 06:26:41'),
(58, '2023-10-25', '2023-10-25', 58, 1, 100, 'Active', '2023-10-25 06:30:07', '2023-10-25 06:30:07'),
(59, '2023-10-25', '2023-10-25', 59, 1, 100, 'Active', '2023-10-25 06:30:21', '2023-10-25 06:30:21'),
(60, '2023-10-25', '2023-10-25', 60, 1, 100, 'Active', '2023-10-25 10:48:22', '2023-10-25 10:48:22'),
(61, '2023-10-25', '2023-10-25', 61, 1, 100, 'Active', '2023-10-25 10:57:59', '2023-10-25 10:57:59'),
(62, '2023-10-25', '2023-10-25', 62, 1, 100, 'Active', '2023-10-25 11:00:51', '2023-10-25 11:00:51'),
(63, '2023-10-25', '2023-10-25', 63, 1, 100, 'Active', '2023-10-25 11:02:32', '2023-10-25 11:02:32'),
(64, '2023-10-25', '2023-10-25', 64, 1, 100, 'Active', '2023-10-25 11:04:34', '2023-10-25 11:04:34'),
(65, '2023-10-25', '2023-10-25', 65, 1, 100, 'Active', '2023-10-25 11:06:46', '2023-10-25 11:06:46'),
(66, '2023-10-25', '2023-10-25', 67, 1, 100, 'Active', '2023-10-25 11:15:07', '2023-10-25 11:15:07'),
(67, '2023-10-25', '2023-10-25', 68, 1, 100, 'Active', '2023-10-25 11:16:19', '2023-10-25 11:16:19'),
(68, '2023-10-25', '2023-10-25', 69, 1, 100, 'Active', '2023-10-25 11:17:47', '2023-10-25 11:17:47'),
(69, '2023-10-25', '2023-10-25', 70, 1, 100, 'Active', '2023-10-25 11:19:07', '2023-10-25 11:19:07'),
(70, '2023-10-25', '2023-10-25', 71, 1, 100, 'Active', '2023-10-25 11:20:00', '2023-10-25 11:20:00'),
(71, '2023-10-25', '2023-10-25', 72, 1, 100, 'Active', '2023-10-25 11:20:53', '2023-10-25 11:20:53'),
(72, '2023-10-25', '2023-10-25', 73, 1, 100, 'Active', '2023-10-25 11:21:43', '2023-10-25 11:21:43'),
(73, '2023-10-25', '2023-10-25', 74, 1, 100, 'Active', '2023-10-25 11:22:40', '2023-10-25 11:22:40'),
(74, '2023-10-25', '2023-10-25', 75, 1, 100, 'Active', '2023-10-25 11:23:28', '2023-10-25 11:23:28'),
(75, '2023-10-25', '2023-10-25', 76, 1, 100, 'Active', '2023-10-25 11:24:29', '2023-10-25 11:24:29'),
(76, '2023-10-25', '2023-10-25', 77, 1, 100, 'Active', '2023-10-25 11:29:19', '2023-10-25 11:29:19'),
(77, '2023-10-25', '2023-10-25', 78, 1, 100, 'Active', '2023-10-25 11:30:50', '2023-10-25 11:30:50'),
(78, '2023-10-25', '2023-10-25', 79, 1, 100, 'Active', '2023-10-25 11:34:52', '2023-10-25 11:34:52'),
(79, '2023-10-25', '2023-10-25', 80, 1, 100, 'Active', '2023-10-25 11:44:33', '2023-10-25 11:44:33'),
(80, '2023-10-26', '2023-10-26', 81, 1, 100, 'Active', '2023-10-25 22:51:16', '2023-10-25 22:51:16'),
(81, '2023-10-26', '2023-10-26', 82, 1, 100, 'Active', '2023-10-26 00:44:29', '2023-10-26 00:44:29'),
(82, '2023-10-26', '2023-10-26', 83, 1, 100, 'Active', '2023-10-26 00:49:35', '2023-10-26 00:49:35'),
(83, '2023-10-26', '2023-10-26', 84, 1, 100, 'Active', '2023-10-26 00:51:29', '2023-10-26 00:51:29'),
(84, '2023-10-26', '2023-10-26', 85, 1, 100, 'Active', '2023-10-26 01:02:20', '2023-10-26 01:02:20'),
(85, '2023-10-26', '2023-10-26', 86, 1, 100, 'Active', '2023-10-26 01:08:04', '2023-10-26 01:08:04'),
(86, '2023-10-26', '2023-10-26', 87, 1, 100, 'Active', '2023-10-26 01:23:25', '2023-10-26 01:23:25'),
(87, '2023-10-26', '2023-10-26', 88, 1, 100, 'Active', '2023-10-26 01:49:44', '2023-10-26 01:49:44'),
(88, '2023-10-26', '2023-10-26', 89, 1, 100, 'Active', '2023-10-26 05:40:56', '2023-10-26 05:40:56'),
(89, '2023-10-26', '2023-10-26', 90, 1, 100, 'Active', '2023-10-26 05:44:40', '2023-10-26 05:44:40'),
(90, '2023-10-26', '2023-10-26', 91, 1, 100, 'Active', '2023-10-26 05:47:21', '2023-10-26 05:47:21'),
(91, '2023-10-26', '2023-10-26', 92, 1, 100, 'Active', '2023-10-26 05:49:57', '2023-10-26 05:49:57'),
(92, '2023-10-26', '2023-10-26', 93, 1, 100, 'Active', '2023-10-26 05:53:34', '2023-10-26 05:53:34'),
(93, '2023-10-26', '2023-10-26', 94, 1, 100, 'Active', '2023-10-26 05:58:06', '2023-10-26 05:58:06'),
(94, '2023-10-26', '2023-10-26', 95, 1, 100, 'Active', '2023-10-26 06:04:18', '2023-10-26 06:04:18'),
(95, '2023-10-26', '2023-10-26', 96, 1, 100, 'Active', '2023-10-26 06:05:53', '2023-10-26 06:05:53'),
(96, '2023-10-26', '2023-10-26', 97, 1, 100, 'Active', '2023-10-26 06:08:48', '2023-10-26 06:08:48'),
(97, '2023-10-26', '2023-10-26', 98, 1, 100, 'Active', '2023-10-26 06:10:13', '2023-10-26 06:10:13'),
(98, '2023-10-28', '2023-10-28', 99, 1, 100, 'Active', '2023-10-28 00:38:57', '2023-10-28 00:38:57'),
(99, '2023-10-28', '2023-10-28', 100, 1, 100, 'Active', '2023-10-28 00:40:51', '2023-10-28 00:40:51'),
(100, '2023-10-28', '2023-10-28', 101, 1, 100, 'Active', '2023-10-28 00:43:10', '2023-10-28 00:43:10'),
(101, '2023-10-28', '2023-10-28', 102, 1, 100, 'Active', '2023-10-28 00:44:33', '2023-10-28 00:44:33'),
(102, '2023-10-28', '2023-10-28', 103, 1, 100, 'Active', '2023-10-28 00:49:25', '2023-10-28 00:49:25'),
(103, '2023-10-28', '2023-10-28', 104, 1, 100, 'Active', '2023-10-28 00:51:20', '2023-10-28 00:51:20'),
(104, '2023-10-28', '2023-10-28', 105, 1, 100, 'Active', '2023-10-28 00:54:48', '2023-10-28 00:54:48'),
(105, '2023-10-29', '2023-10-29', 106, 1, 100, 'Active', '2023-10-29 00:55:08', '2023-10-29 00:55:08'),
(106, '2023-10-29', '2023-10-29', 107, 1, 100, 'Active', '2023-10-29 01:03:53', '2023-10-29 01:03:53'),
(107, '2023-10-30', '2023-10-30', 108, 1, 100, 'Active', '2023-10-30 07:26:19', '2023-10-30 07:26:19'),
(108, '2023-10-30', '2023-10-30', 109, 1, 100, 'Active', '2023-10-30 07:29:47', '2023-10-30 07:29:47'),
(109, '2023-10-30', '2023-10-30', 110, 1, 100, 'Active', '2023-10-30 07:53:07', '2023-10-30 07:53:07'),
(110, '2023-10-31', '2023-10-31', 111, 1, 100, 'Active', '2023-10-30 23:01:04', '2023-10-30 23:01:04'),
(111, '2023-10-31', '2023-10-31', 112, 1, 100, 'Active', '2023-10-30 23:18:07', '2023-10-30 23:18:07'),
(112, '2023-10-31', '2023-10-31', 113, 1, 100, 'Active', '2023-10-30 23:20:22', '2023-10-30 23:20:22'),
(113, '2023-10-31', '2023-10-31', 114, 1, 100, 'Active', '2023-10-31 01:03:36', '2023-10-31 01:03:36'),
(114, '2023-10-31', '2023-10-31', 115, 1, 100, 'Active', '2023-10-31 01:06:07', '2023-10-31 01:06:07'),
(115, '2023-10-31', '2023-10-31', 116, 1, 100, 'Active', '2023-10-31 05:57:37', '2023-10-31 05:57:37'),
(116, '2023-11-01', '2023-11-01', 117, 1, 100, 'Active', '2023-11-01 01:59:13', '2023-11-01 01:59:13'),
(117, '2023-11-01', '2023-11-01', 118, 1, 100, 'Active', '2023-11-01 02:08:49', '2023-11-01 02:08:49'),
(118, '2023-11-01', '2023-11-01', 119, 1, 100, 'Active', '2023-11-01 02:10:36', '2023-11-01 02:10:36'),
(119, '2023-11-01', '2023-11-01', 120, 1, 100, 'Active', '2023-11-01 02:43:37', '2023-11-01 02:43:37'),
(120, '2023-11-01', '2023-11-01', 121, 1, 100, 'Active', '2023-11-01 02:46:02', '2023-11-01 02:46:02'),
(121, '2023-11-01', '2023-11-01', 122, 1, 100, 'Active', '2023-11-01 02:51:43', '2023-11-01 02:51:43'),
(122, '2023-11-01', '2023-11-01', 123, 1, 100, 'Active', '2023-11-01 02:53:01', '2023-11-01 02:53:01'),
(123, '2023-11-01', '2023-11-01', 124, 1, 100, 'Active', '2023-11-01 02:59:54', '2023-11-01 02:59:54'),
(124, '2023-11-03', '2023-11-03', 125, 1, 100, 'Active', '2023-11-03 09:14:11', '2023-11-03 09:14:11'),
(125, '2023-11-03', '2023-11-03', 126, 1, 100, 'Active', '2023-11-03 09:31:33', '2023-11-03 09:31:33'),
(126, '2023-11-03', '2023-11-03', 127, 1, 100, 'Active', '2023-11-03 09:34:13', '2023-11-03 09:34:13'),
(127, '2023-11-03', '2023-11-03', 128, 1, 100, 'Active', '2023-11-03 09:49:59', '2023-11-03 09:49:59'),
(128, '2023-11-07', '2023-11-07', 129, 1, 100, 'Active', '2023-11-06 23:02:21', '2023-11-06 23:02:21'),
(129, '2023-11-07', '2023-11-07', 130, 1, 100, 'Active', '2023-11-06 23:24:17', '2023-11-06 23:24:17'),
(130, '2023-11-07', '2023-11-07', 131, 1, 100, 'Active', '2023-11-07 07:12:16', '2023-11-07 07:12:16'),
(131, '2023-11-07', '2023-11-07', 132, 1, 100, 'Active', '2023-11-07 07:20:04', '2023-11-07 07:20:04'),
(132, '2023-11-07', '2023-11-07', 133, 1, 100, 'Active', '2023-11-07 07:23:24', '2023-11-07 07:23:24'),
(133, '2023-11-07', '2023-11-07', 134, 1, 100, 'Active', '2023-11-07 07:27:31', '2023-11-07 07:27:31'),
(134, '2023-11-07', '2023-11-07', 135, 1, 100, 'Active', '2023-11-07 07:31:21', '2023-11-07 07:31:21'),
(135, '2023-11-07', '2023-11-07', 136, 1, 100, 'Active', '2023-11-07 07:34:57', '2023-11-07 07:34:57'),
(136, '2023-11-07', '2023-11-07', 137, 1, 100, 'Active', '2023-11-07 07:38:14', '2023-11-07 07:38:14'),
(137, '2023-11-07', '2023-11-07', 138, 1, 100, 'Active', '2023-11-07 07:42:42', '2023-11-07 07:42:42'),
(138, '2023-11-07', '2023-11-07', 139, 1, 100, 'Active', '2023-11-07 07:48:26', '2023-11-07 07:48:26'),
(139, '2023-11-07', '2023-11-07', 140, 1, 100, 'Active', '2023-11-07 07:51:38', '2023-11-07 07:51:38'),
(140, '2023-11-07', '2023-11-07', 141, 1, 100, 'Active', '2023-11-07 07:57:26', '2023-11-07 07:57:26'),
(141, '2023-11-10', '2023-11-10', 142, 1, 100, 'Active', '2023-11-10 07:32:15', '2023-11-10 07:32:15'),
(142, '2023-11-11', '2023-11-11', 143, 1, 100, 'Active', '2023-11-11 07:18:24', '2023-11-11 07:18:24'),
(143, '2023-11-11', '2023-11-11', 144, 1, 100, 'Active', '2023-11-11 07:19:10', '2023-11-11 07:19:10'),
(144, '2023-11-11', '2023-11-11', 145, 1, 100, 'Active', '2023-11-11 07:19:52', '2023-11-11 07:19:52'),
(145, '2023-11-11', '2023-11-11', 146, 1, 100, 'Active', '2023-11-11 07:21:02', '2023-11-11 07:21:02'),
(146, '2023-11-13', '2023-11-13', 147, 1, 100, 'Active', '2023-11-13 09:08:30', '2023-11-13 09:08:30'),
(147, '2023-11-18', '2023-11-18', 148, 1, 100, 'Active', '2023-11-18 02:29:11', '2023-11-18 02:29:11'),
(148, '2023-11-18', '2023-11-18', 149, 1, 100, 'Active', '2023-11-18 02:36:11', '2023-11-18 02:36:11'),
(149, '2023-11-18', '2023-11-18', 150, 1, 100, 'Active', '2023-11-18 02:36:58', '2023-11-18 02:36:58'),
(150, '2023-11-21', '2023-11-21', 151, 1, 100, 'Active', '2023-11-21 08:08:03', '2023-11-21 08:08:03'),
(151, '2023-11-21', '2023-11-21', 152, 1, 100, 'Active', '2023-11-21 09:03:02', '2023-11-21 09:03:02'),
(152, '2023-11-21', '2023-11-21', 153, 1, 100, 'Active', '2023-11-21 09:06:42', '2023-11-21 09:06:42'),
(153, '2023-11-22', '2023-11-22', 154, 1, 100, 'Active', '2023-11-22 06:18:40', '2023-11-22 06:18:40'),
(154, '2023-11-22', '2023-11-22', 155, 1, 100, 'Active', '2023-11-22 06:47:18', '2023-11-22 06:47:18'),
(155, '2023-11-23', '2023-11-23', 156, 1, 100, 'Active', '2023-11-23 09:20:16', '2023-11-23 09:20:16'),
(156, '2023-11-23', '2023-11-23', 157, 1, 100, 'Active', '2023-11-23 09:24:47', '2023-11-23 09:24:47'),
(157, '2023-11-24', '2023-11-24', 158, 1, 100, 'Active', '2023-11-24 02:50:37', '2023-11-24 02:50:37'),
(158, '2023-11-26', '2023-11-26', 159, 1, 100, 'Active', '2023-11-26 09:14:37', '2023-11-26 09:14:37'),
(159, '2023-11-26', '2023-11-26', 160, 1, 100, 'Active', '2023-11-26 09:17:05', '2023-11-26 09:17:05'),
(160, '2023-11-26', '2023-11-26', 161, 1, 100, 'Active', '2023-11-26 09:19:13', '2023-11-26 09:19:13'),
(161, '2023-11-26', '2023-11-26', 162, 1, 100, 'Active', '2023-11-26 09:32:45', '2023-11-26 09:32:45'),
(162, '2023-12-18', '2023-12-18', 163, 1, 100, 'Active', '2023-12-17 23:07:19', '2023-12-17 23:07:19'),
(163, '2023-12-18', '2023-12-18', 164, 1, 100, 'Active', '2023-12-17 23:10:36', '2023-12-17 23:10:36'),
(164, '2023-12-18', '2023-12-18', 165, 1, 100, 'Active', '2023-12-17 23:13:54', '2023-12-17 23:13:54'),
(165, '2023-12-18', '2023-12-18', 166, 1, 100, 'Active', '2023-12-17 23:45:26', '2023-12-17 23:45:26'),
(166, '2023-12-18', '2023-12-18', 169, 1, 100, 'Active', '2023-12-18 00:55:09', '2023-12-18 00:55:09'),
(167, '2024-03-23', '2024-03-23', 170, 1, 100, 'Active', '2024-03-23 08:42:00', '2024-03-23 08:42:00'),
(168, '2024-03-23', '2024-03-23', 171, 1, 100, 'Active', '2024-03-23 08:42:27', '2024-03-23 08:42:27'),
(169, '2024-03-23', '2024-03-23', 172, 1, 100, 'Active', '2024-03-23 08:42:46', '2024-03-23 08:42:46'),
(170, '2024-03-23', '2024-03-23', 173, 1, 100, 'Active', '2024-03-23 08:45:01', '2024-03-23 08:45:01'),
(171, '2024-03-23', '2024-03-23', 174, 1, 100, 'Active', '2024-03-23 08:45:29', '2024-03-23 08:45:29'),
(172, '2024-05-25', '2024-05-25', 175, 1, 100, 'Active', '2024-05-25 04:28:31', '2024-05-25 04:28:31'),
(173, '2024-05-25', '2024-05-25', 176, 1, 100, 'Active', '2024-05-25 05:39:44', '2024-05-25 05:39:44'),
(174, '2024-07-13', '2024-07-13', 177, 1, 100, 'Active', '2024-07-13 12:25:50', '2024-07-13 12:25:50'),
(175, '2024-07-13', '2024-07-13', 178, 1, 100, 'Active', '2024-07-13 12:27:47', '2024-07-13 12:27:47'),
(176, '2024-07-13', '2024-07-13', 179, 1, 100, 'Active', '2024-07-13 12:30:30', '2024-07-13 12:30:30'),
(177, '2024-07-13', '2024-07-13', 180, 1, 100, 'Active', '2024-07-13 13:00:50', '2024-07-13 13:00:50'),
(178, '2024-07-13', '2024-07-13', 187, 1, 100, 'Active', '2024-07-13 13:21:16', '2024-07-13 13:21:16'),
(179, '2024-07-14', '2024-07-14', 188, 1, 100, 'Active', '2024-07-13 22:42:50', '2024-07-13 22:42:50'),
(180, '2024-07-14', '2024-07-14', 189, 1, 100, 'Active', '2024-07-13 23:09:23', '2024-07-13 23:09:23'),
(181, '2024-07-28', '2024-07-28', 190, 1, 100, 'Active', '2024-07-28 01:03:13', '2024-07-28 01:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(2, 'admin', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(3, 'manager', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(4, 'user', 'admin', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(5, 'user', 'web', '2022-06-01 03:01:10', '2022-06-01 03:01:10'),
(6, 'Delar', 'web', '2022-06-01 03:17:36', '2022-06-01 03:17:36'),
(7, 'Networker', 'web', '2022-07-16 02:19:36', '2022-07-16 02:19:36'),
(8, 'Affiliater', 'web', '2022-07-16 02:20:09', '2022-07-16 02:20:09'),
(9, 'Agent', 'web', '2022-07-16 02:20:28', '2022-07-16 02:20:28');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(13, 2),
(14, 1),
(14, 2),
(15, 1),
(15, 2),
(16, 1),
(16, 2),
(17, 1),
(17, 2),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 6),
(20, 7),
(20, 8),
(21, 5),
(21, 6),
(21, 7),
(21, 8),
(22, 5),
(22, 7),
(22, 9),
(23, 5),
(23, 7),
(23, 9);

-- --------------------------------------------------------

--
-- Table structure for table `servicepackages`
--

CREATE TABLE `servicepackages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `servicepackage_name` text DEFAULT NULL,
  `package_text` text DEFAULT NULL,
  `roles` int(11) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `servicepackages`
--

INSERT INTO `servicepackages` (`id`, `servicepackage_name`, `package_text`, `roles`, `status`, `created_at`, `updated_at`) VALUES
(1, 'General Customer', 'Buy your need.', 5, 'Active', '2022-06-12 03:25:33', '2022-07-20 11:13:45'),
(2, 'AYEBAZAR DEALER', 'urchase dealership and become a vendor of Ayebazar', 6, 'Inactive', '2022-07-16 02:19:14', '2022-07-20 11:13:54'),
(3, 'NETWORK MARKETING', 'Make referral and earn money', 7, 'Active', '2022-07-16 02:21:39', '2022-07-20 11:13:43'),
(4, 'AFFILIATE', 'Do affiliate to achieve your goal.', 8, 'Active', '2022-07-16 02:22:18', '2022-07-20 11:13:41'),
(5, 'AYEBAZAR AGENT', 'Become a agent and earn', 9, 'Active', '2022-07-16 02:22:38', '2024-03-13 11:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slider_small_title` varchar(255) DEFAULT NULL,
  `slider_title` varchar(255) NOT NULL,
  `slider_text` text DEFAULT NULL,
  `slider_btn_name` varchar(255) DEFAULT NULL,
  `slider_btn_link` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `slider_image` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_small_title`, `slider_title`, `slider_text`, `slider_btn_name`, `slider_btn_link`, `slug`, `slider_image`, `status`, `created_at`, `updated_at`) VALUES
(4, NULL, 'new', NULL, NULL, NULL, 'new', 'public/images/slider/1711274820_Navy and Pink Modern Digital Marketing Agency SEEK Cover Image (1).png', 'Inactive', '2024-03-24 04:07:00', '2024-05-25 05:56:14'),
(5, NULL, 'new', NULL, NULL, NULL, 'new-1', 'public/images/slider/1712219526_Navy and Pink Modern Digital Marketing Agency SEEK Cover Image (8).png', 'Inactive', '2024-03-24 04:07:00', '2024-05-25 05:56:16'),
(6, NULL, 'new', NULL, NULL, NULL, 'new-2', 'public/images/slider/1711274820_Navy and Pink Modern Digital Marketing Agency SEEK Cover Image (1).png', 'Inactive', '2024-03-24 04:07:00', '2024-05-25 05:56:18'),
(7, NULL, 'one', NULL, NULL, NULL, 'one', 'public/images/slider/1716638275_1712219526_Navy and Pink Modern Digital Marketing Agency SEEK Cover Image (8).png', 'Active', '2024-05-25 05:57:55', '2024-05-25 05:57:55'),
(8, NULL, 'two', NULL, NULL, NULL, 'two', 'public/images/slider/1716638305_1711203103_4-min.png', 'Active', '2024-05-25 05:58:25', '2024-05-25 05:58:25'),
(9, NULL, 'three', NULL, NULL, NULL, 'three', 'public/images/slider/1716638351_1667374824_fec22406-72b7-4b97-ace7-44c0012f5efe.jpg_1200x1200.jpg', 'Active', '2024-05-25 05:59:11', '2024-05-25 05:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `purchase` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `product_id`, `purchase`, `stock`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 100, '2023-09-08 02:29:02', '2023-09-08 02:29:02'),
(2, 2, 0, 100, '2023-09-08 02:34:10', '2023-09-08 02:34:10'),
(3, 3, 0, 100, '2023-09-08 03:09:03', '2023-09-08 03:09:03'),
(4, 4, 0, 100, '2023-09-08 03:52:07', '2023-09-08 03:52:07'),
(5, 5, 0, 100, '2023-09-10 00:55:05', '2023-09-10 00:55:05'),
(6, 6, 0, 100, '2023-09-10 01:09:00', '2023-09-10 01:09:00'),
(7, 7, 0, 100, '2023-09-10 02:11:20', '2023-09-10 02:11:20'),
(8, 8, 0, 100, '2023-09-10 03:31:08', '2023-09-10 03:31:08'),
(9, 9, 0, 100, '2023-09-10 03:39:19', '2023-09-10 03:39:19'),
(10, 10, 0, 100, '2023-09-10 03:56:36', '2023-09-10 03:56:36'),
(11, 11, 0, 100, '2023-09-10 03:56:40', '2023-09-10 03:56:40'),
(12, 12, 0, 100, '2023-09-10 04:01:10', '2023-09-10 04:01:10'),
(13, 13, 0, 100, '2023-09-10 04:07:55', '2023-09-10 04:07:55'),
(14, 14, 0, 100, '2023-09-10 04:51:04', '2023-09-10 04:51:04'),
(15, 15, 0, 100, '2023-09-10 04:57:00', '2023-09-10 04:57:00'),
(16, 16, 0, 100, '2023-09-10 05:25:41', '2023-09-10 05:25:41'),
(17, 17, 0, 100, '2023-09-10 06:17:25', '2023-09-10 06:17:25'),
(18, 18, 0, 100, '2023-09-10 06:32:05', '2023-09-10 06:32:05'),
(19, 19, 0, 100, '2023-09-10 06:36:08', '2023-09-10 06:36:08'),
(20, 20, 0, 100, '2023-09-10 06:39:22', '2023-09-10 06:39:22'),
(21, 21, 0, 100, '2023-09-10 06:42:46', '2023-09-10 06:42:46'),
(22, 22, 0, 100, '2023-09-11 00:04:15', '2023-09-11 00:04:15'),
(23, 23, 0, 100, '2023-09-11 00:06:28', '2023-09-11 00:06:28'),
(24, 24, 0, 100, '2023-09-11 00:08:55', '2023-09-11 00:08:55'),
(25, 25, 0, 100, '2023-09-11 00:10:40', '2023-09-11 00:10:40'),
(26, 26, 0, 100, '2023-09-11 00:13:01', '2023-09-11 00:13:01'),
(27, 27, 0, 100, '2023-09-11 03:25:28', '2023-09-11 03:25:28'),
(28, 28, 0, 100, '2023-09-11 03:36:09', '2023-09-11 03:36:09'),
(29, 29, 0, 100, '2023-09-11 03:38:12', '2023-09-11 03:38:12'),
(30, 30, 0, 100, '2023-09-11 03:39:53', '2023-09-11 03:39:53'),
(31, 31, 0, 100, '2023-09-11 03:43:29', '2023-09-11 03:43:29'),
(32, 32, 0, 100, '2023-09-11 03:55:23', '2023-09-11 03:55:23'),
(33, 33, 0, 100, '2023-09-11 03:58:29', '2023-09-11 03:58:29'),
(34, 34, 0, 100, '2023-09-11 04:02:54', '2023-09-11 04:02:54'),
(35, 35, 0, 100, '2023-09-11 04:07:53', '2023-09-11 04:07:53'),
(36, 36, 0, 100, '2023-09-13 05:09:13', '2023-09-13 05:09:13'),
(37, 37, 0, 100, '2023-09-13 05:11:04', '2023-09-13 05:11:04'),
(38, 38, 0, 100, '2023-09-13 05:19:10', '2023-09-13 05:19:10'),
(39, 39, 0, 100, '2023-09-14 07:03:25', '2023-09-14 07:03:25'),
(40, 40, 0, 100, '2023-09-14 07:09:06', '2023-09-14 07:09:06'),
(41, 41, 0, 100, '2023-09-14 07:18:56', '2023-09-14 07:18:56'),
(42, 42, 0, 100, '2023-09-14 07:24:44', '2023-09-14 07:24:44'),
(43, 43, 0, 100, '2023-09-14 07:40:57', '2023-09-14 07:40:57'),
(44, 44, 0, 100, '2023-09-14 07:46:46', '2023-09-14 07:46:46'),
(45, 45, 0, 100, '2023-09-15 07:33:04', '2023-09-15 07:33:04'),
(46, 46, 0, 100, '2023-09-15 07:36:15', '2023-09-15 07:36:15'),
(47, 47, 0, 100, '2023-10-12 01:21:35', '2023-10-12 01:21:35'),
(48, 48, 0, 100, '2023-10-12 01:35:55', '2023-10-12 01:35:55'),
(49, 49, 0, 100, '2023-10-12 01:35:58', '2023-10-12 01:35:58'),
(50, 50, 0, 100, '2023-10-12 01:39:29', '2023-10-12 01:39:29'),
(51, 51, 0, 100, '2023-10-12 01:42:10', '2023-10-12 01:42:10'),
(52, 52, 0, 100, '2023-10-25 02:17:16', '2023-10-25 02:17:16'),
(53, 53, 0, 100, '2023-10-25 02:25:19', '2023-10-25 02:25:19'),
(54, 54, 0, 100, '2023-10-25 02:29:34', '2023-10-25 02:29:34'),
(55, 55, 0, 100, '2023-10-25 02:29:37', '2023-10-25 02:29:37'),
(56, 56, 0, 100, '2023-10-25 06:26:12', '2023-10-25 06:26:12'),
(57, 57, 0, 100, '2023-10-25 06:26:41', '2023-10-25 06:26:41'),
(58, 58, 0, 100, '2023-10-25 06:30:07', '2023-10-25 06:30:07'),
(59, 59, 0, 100, '2023-10-25 06:30:21', '2023-10-25 06:30:21'),
(60, 60, 0, 100, '2023-10-25 10:48:22', '2023-10-25 10:48:22'),
(61, 61, 0, 100, '2023-10-25 10:57:59', '2023-10-25 10:57:59'),
(62, 62, 0, 100, '2023-10-25 11:00:51', '2023-10-25 11:00:51'),
(63, 63, 0, 100, '2023-10-25 11:02:32', '2023-10-25 11:02:32'),
(64, 64, 0, 100, '2023-10-25 11:04:34', '2023-10-25 11:04:34'),
(65, 65, 0, 100, '2023-10-25 11:06:46', '2023-10-25 11:06:46'),
(66, 67, 0, 100, '2023-10-25 11:15:07', '2023-10-25 11:15:07'),
(67, 68, 0, 100, '2023-10-25 11:16:19', '2023-10-25 11:16:19'),
(68, 69, 0, 100, '2023-10-25 11:17:47', '2023-10-25 11:17:47'),
(69, 70, 0, 100, '2023-10-25 11:19:07', '2023-10-25 11:19:07'),
(70, 71, 0, 100, '2023-10-25 11:20:00', '2023-10-25 11:20:00'),
(71, 72, 0, 100, '2023-10-25 11:20:53', '2023-10-25 11:20:53'),
(72, 73, 0, 100, '2023-10-25 11:21:43', '2023-10-25 11:21:43'),
(73, 74, 0, 100, '2023-10-25 11:22:40', '2023-10-25 11:22:40'),
(74, 75, 0, 100, '2023-10-25 11:23:28', '2023-10-25 11:23:28'),
(75, 76, 0, 100, '2023-10-25 11:24:29', '2023-10-25 11:24:29'),
(76, 77, 0, 100, '2023-10-25 11:29:19', '2023-10-25 11:29:19'),
(77, 78, 0, 100, '2023-10-25 11:30:50', '2023-10-25 11:30:50'),
(78, 79, 0, 100, '2023-10-25 11:34:52', '2023-10-25 11:34:52'),
(79, 80, 0, 100, '2023-10-25 11:44:33', '2023-10-25 11:44:33'),
(80, 81, 0, 100, '2023-10-25 22:51:16', '2023-10-25 22:51:16'),
(81, 82, 0, 100, '2023-10-26 00:44:29', '2023-10-26 00:44:29'),
(82, 83, 0, 100, '2023-10-26 00:49:35', '2023-10-26 00:49:35'),
(83, 84, 0, 100, '2023-10-26 00:51:29', '2023-10-26 00:51:29'),
(84, 85, 0, 100, '2023-10-26 01:02:20', '2023-10-26 01:02:20'),
(85, 86, 0, 100, '2023-10-26 01:08:04', '2023-10-26 01:08:04'),
(86, 87, 0, 100, '2023-10-26 01:23:25', '2023-10-26 01:23:25'),
(87, 88, 0, 98, '2023-10-26 01:49:44', '2023-11-18 10:23:12'),
(88, 89, 0, 100, '2023-10-26 05:40:56', '2023-10-26 05:40:56'),
(89, 90, 0, 100, '2023-10-26 05:44:40', '2023-10-26 05:44:40'),
(90, 91, 0, 100, '2023-10-26 05:47:21', '2023-10-26 05:47:21'),
(91, 92, 0, 100, '2023-10-26 05:49:57', '2023-10-26 05:49:57'),
(92, 93, 0, 100, '2023-10-26 05:53:34', '2023-10-26 05:53:34'),
(93, 94, 0, 100, '2023-10-26 05:58:06', '2023-10-26 05:58:06'),
(94, 95, 0, 100, '2023-10-26 06:04:18', '2023-10-26 06:04:18'),
(95, 96, 0, 100, '2023-10-26 06:05:53', '2023-10-26 06:05:53'),
(96, 97, 0, 100, '2023-10-26 06:08:48', '2023-10-26 06:08:48'),
(97, 98, 0, 100, '2023-10-26 06:10:13', '2023-10-26 06:10:13'),
(98, 99, 0, 100, '2023-10-28 00:38:57', '2023-10-28 00:38:57'),
(99, 100, 0, 100, '2023-10-28 00:40:51', '2023-10-28 00:40:51'),
(100, 101, 0, 100, '2023-10-28 00:43:10', '2023-10-28 00:43:10'),
(101, 102, 0, 100, '2023-10-28 00:44:33', '2023-10-28 00:44:33'),
(102, 103, 0, 100, '2023-10-28 00:49:25', '2023-10-28 00:49:25'),
(103, 104, 0, 100, '2023-10-28 00:51:20', '2023-10-28 00:51:20'),
(104, 105, 0, 100, '2023-10-28 00:54:48', '2023-10-28 00:54:48'),
(105, 106, 0, 100, '2023-10-29 00:55:08', '2023-10-29 00:55:08'),
(106, 107, 0, 100, '2023-10-29 01:03:53', '2023-10-29 01:03:53'),
(107, 108, 0, 100, '2023-10-30 07:26:19', '2023-10-30 07:26:19'),
(108, 109, 0, 100, '2023-10-30 07:29:47', '2023-10-30 07:29:47'),
(109, 110, 0, 100, '2023-10-30 07:53:07', '2023-10-30 07:53:07'),
(110, 111, 0, 100, '2023-10-30 23:01:04', '2023-10-30 23:01:04'),
(111, 112, 0, 100, '2023-10-30 23:18:07', '2023-10-30 23:18:07'),
(112, 113, 0, 100, '2023-10-30 23:20:22', '2023-10-30 23:20:22'),
(113, 114, 0, 100, '2023-10-31 01:03:36', '2023-10-31 01:03:36'),
(114, 115, 0, 100, '2023-10-31 01:06:07', '2023-10-31 01:06:07'),
(115, 116, 0, 100, '2023-10-31 05:57:37', '2023-10-31 05:57:37'),
(116, 117, 0, 100, '2023-11-01 01:59:13', '2023-11-01 01:59:13'),
(117, 118, 0, 100, '2023-11-01 02:08:49', '2023-11-01 02:08:49'),
(118, 119, 0, 100, '2023-11-01 02:10:36', '2023-11-01 02:10:36'),
(119, 120, 0, 100, '2023-11-01 02:43:37', '2023-11-01 02:43:37'),
(120, 121, 0, 100, '2023-11-01 02:46:02', '2023-11-01 02:46:02'),
(121, 122, 0, 100, '2023-11-01 02:51:43', '2023-11-01 02:51:43'),
(122, 123, 0, 100, '2023-11-01 02:53:01', '2023-11-01 02:53:01'),
(123, 124, 0, 100, '2023-11-01 02:59:54', '2023-11-01 02:59:54'),
(124, 125, 0, 100, '2023-11-03 09:14:11', '2023-11-03 09:14:11'),
(125, 126, 0, 100, '2023-11-03 09:31:33', '2023-11-03 09:31:33'),
(126, 127, 0, 100, '2023-11-03 09:34:13', '2023-11-03 09:34:13'),
(127, 128, 0, 100, '2023-11-03 09:49:59', '2023-11-03 09:49:59'),
(128, 129, 0, 100, '2023-11-06 23:02:21', '2023-11-06 23:02:21'),
(129, 130, 0, 100, '2023-11-06 23:24:17', '2023-11-06 23:24:17'),
(130, 131, 0, 100, '2023-11-07 07:12:16', '2023-11-07 07:12:16'),
(131, 132, 0, 100, '2023-11-07 07:20:04', '2023-11-07 07:20:04'),
(132, 133, 0, 100, '2023-11-07 07:23:24', '2023-11-07 07:23:24'),
(133, 134, 0, 100, '2023-11-07 07:27:31', '2023-11-07 07:27:31'),
(134, 135, 0, 100, '2023-11-07 07:31:21', '2023-11-07 07:31:21'),
(135, 136, 0, 100, '2023-11-07 07:34:57', '2023-11-07 07:34:57'),
(136, 137, 0, 100, '2023-11-07 07:38:14', '2023-11-07 07:38:14'),
(137, 138, 0, 100, '2023-11-07 07:42:42', '2023-11-07 07:42:42'),
(138, 139, 0, 100, '2023-11-07 07:48:26', '2023-11-07 07:48:26'),
(139, 140, 0, 100, '2023-11-07 07:51:38', '2023-11-07 07:51:38'),
(140, 141, 0, 100, '2023-11-07 07:57:26', '2023-11-07 07:57:26'),
(141, 142, 0, 100, '2023-11-10 07:32:15', '2023-11-10 07:32:15'),
(142, 143, 0, 96, '2023-11-11 07:18:24', '2023-11-19 09:52:36'),
(143, 144, 0, 99, '2023-11-11 07:19:10', '2023-11-19 09:52:36'),
(144, 145, 0, 93, '2023-11-11 07:19:52', '2023-11-19 09:52:36'),
(145, 146, 0, 99, '2023-11-11 07:21:02', '2023-11-19 09:52:36'),
(146, 147, 0, 100, '2023-11-13 09:08:30', '2023-11-13 09:08:30'),
(147, 148, 0, 100, '2023-11-18 02:29:11', '2023-11-18 02:29:11'),
(148, 149, 0, 100, '2023-11-18 02:36:11', '2023-11-18 02:36:11'),
(149, 150, 0, 100, '2023-11-18 02:36:58', '2023-11-18 02:36:58'),
(150, 151, 0, 100, '2023-11-21 08:08:03', '2023-11-21 08:08:03'),
(151, 152, 0, 100, '2023-11-21 09:03:02', '2023-11-21 09:03:02'),
(152, 153, 0, 100, '2023-11-21 09:06:42', '2023-11-21 09:06:42'),
(153, 154, 0, 100, '2023-11-22 06:18:40', '2023-11-22 06:18:40'),
(154, 155, 0, 100, '2023-11-22 06:47:18', '2023-11-22 06:47:18'),
(155, 156, 0, 100, '2023-11-23 09:20:16', '2023-11-23 09:20:16'),
(156, 157, 0, 100, '2023-11-23 09:24:47', '2023-11-23 09:24:47'),
(157, 158, 0, 100, '2023-11-24 02:50:37', '2023-11-24 02:50:37'),
(158, 159, 0, 100, '2023-11-26 09:14:37', '2023-11-26 09:14:37'),
(159, 160, 0, 100, '2023-11-26 09:17:05', '2023-11-26 09:17:05'),
(160, 161, 0, 100, '2023-11-26 09:19:13', '2023-11-26 09:19:13'),
(161, 162, 0, 100, '2023-11-26 09:32:45', '2023-11-26 09:32:45'),
(162, 163, 0, 100, '2023-12-17 23:07:19', '2023-12-17 23:07:19'),
(163, 164, 0, 100, '2023-12-17 23:10:36', '2023-12-17 23:10:36'),
(164, 165, 0, 100, '2023-12-17 23:13:54', '2023-12-17 23:13:54'),
(165, 166, 0, 100, '2023-12-17 23:45:26', '2023-12-17 23:45:26'),
(166, 169, 0, 100, '2023-12-18 00:55:09', '2023-12-18 00:55:09'),
(167, 170, 0, 100, '2024-03-23 08:42:00', '2024-03-23 08:42:00'),
(168, 171, 0, 100, '2024-03-23 08:42:27', '2024-03-23 08:42:27'),
(169, 172, 0, 100, '2024-03-23 08:42:46', '2024-03-23 08:42:46'),
(170, 173, 0, 100, '2024-03-23 08:45:01', '2024-03-23 08:45:01'),
(171, 174, 0, 100, '2024-03-23 08:45:29', '2024-03-23 08:45:29'),
(172, 175, 0, 100, '2024-05-25 04:28:31', '2024-05-25 04:28:31'),
(173, 176, 0, 100, '2024-05-25 05:39:44', '2024-05-25 05:39:44'),
(174, 177, 0, 100, '2024-07-13 12:25:50', '2024-07-13 12:25:50'),
(175, 178, 0, 100, '2024-07-13 12:27:47', '2024-07-13 12:27:47'),
(176, 179, 0, 100, '2024-07-13 12:30:30', '2024-07-13 12:30:30'),
(177, 180, 0, 100, '2024-07-13 13:00:50', '2024-07-13 13:00:50'),
(178, 187, 0, 100, '2024-07-13 13:21:16', '2024-07-13 13:21:16'),
(179, 188, 0, 100, '2024-07-13 22:42:50', '2024-07-13 22:42:50'),
(180, 189, 0, 100, '2024-07-13 23:09:23', '2024-07-13 23:09:23'),
(181, 190, 0, 100, '2024-07-28 01:03:13', '2024-07-28 01:03:13');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_category_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `subcategory_icon` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `sub_category_name`, `slug`, `category_id`, `status`, `subcategory_icon`, `created_at`, `updated_at`) VALUES
(29, 'Men\'s Polo Shirt', 'mens-polo-shirt', 16, 'Active', 'public/images/category/1711266184_EPL-06-Torquise-Blue.jpg', '2023-11-20 08:38:54', '2024-03-24 01:43:04'),
(30, 'Boys T-shirt', 'boys-t-shirt', 17, 'Active', 'public/images/subcategory/1711267720_JB08AB-PRIMARY-IMAGE.jpg', '2024-03-24 02:08:40', '2024-03-24 02:08:40'),
(31, 'Boys Top Burton Set', 'boys-top-burton-set', 17, 'Active', 'public/images/category/1711268025_download.jpeg', '2024-03-24 02:13:24', '2024-03-24 02:13:45'),
(32, 'Boys Shirt Full Sleeve', 'boys-shirt-full-sleeve', 17, 'Active', 'public/images/subcategory/1711268224_boys-full-sleevet-shirt-500x500.webp', '2024-03-24 02:17:04', '2024-03-24 02:17:04'),
(33, 'Boys Shirt Half Sleeve', 'boys-shirt-half-sleeve', 17, 'Active', 'public/images/subcategory/1711268324_boys-designer-t-shirt-500x500.webp', '2024-03-24 02:18:44', '2024-03-24 02:18:44'),
(34, 'Men\'s Shirt Half Sleeve', 'mens-shirt-half-sleeve', 16, 'Active', 'public/images/subcategory/1711268545_3.webp', '2024-03-24 02:22:25', '2024-03-24 02:22:25'),
(35, 'Men\'s Shirt Full Sleeve', 'mens-shirt-full-sleeve', 16, 'Active', 'public/images/subcategory/1711268780_659db3df5de4982cec28068e-plain-long-sleeve-shirt-men-grey.jpg', '2024-03-24 02:26:20', '2024-03-24 02:26:20'),
(36, 'Mens T-shirt', 'mens-t-shirt', 16, 'Active', 'public/images/category/1711268974_StripedTees-2.1_533x.webp', '2024-03-24 02:27:50', '2024-03-24 02:29:34'),
(37, 'Boys Jeans & Denim Pant', 'boys-jeans-denim-pant', 17, 'Active', 'public/images/subcategory/1711269156_5d7c8b2e28883534e02de55e-large.webp', '2024-03-24 02:32:36', '2024-03-24 02:32:36'),
(38, 'Boys Cargo Short Pant', 'boys-cargo-short-pant', 17, 'Active', 'public/images/subcategory/1711269320_DSCF0281_900x.webp', '2024-03-24 02:35:20', '2024-03-24 02:35:20'),
(39, 'Men\'s Cargo Short Pant', 'mens-cargo-short-pant', 16, 'Active', 'public/images/subcategory/1711269373_s-l1200.webp', '2024-03-24 02:36:13', '2024-03-24 02:36:13'),
(40, 'Boys Cargo Pant', 'boys-cargo-pant', 17, 'Active', 'public/images/category/1711269705_01_103193231_SI_00.webp', '2024-03-24 02:41:33', '2024-03-24 02:41:45'),
(41, 'Man\'s Cargo Pant', 'mans-cargo-pant', 16, 'Active', 'public/images/subcategory/1711269751_qonh1Ao0qBSe2ds8EbeBaY6D8RRSgGQLnnSEp4e8.jpg', '2024-03-24 02:42:31', '2024-03-24 02:42:31'),
(42, 'Men\'s Joggers Pant', 'mens-joggers-pant', 16, 'Active', 'public/images/subcategory/1711269955_men-jogger-500x500.webp', '2024-03-24 02:45:55', '2024-03-24 02:45:55'),
(43, 'Boys Joggers Pant', 'boys-joggers-pant', 17, 'Active', 'public/images/subcategory/1711269986_97473092f4f16b7a72473fae92b1e22a.jpg', '2024-03-24 02:46:26', '2024-03-24 02:46:26'),
(44, 'Men\'s Hoodie Jacket', 'mens-hoodie-jacket', 16, 'Active', 'public/images/subcategory/1711270212_Wholesale-Outdoor-Winter-Warm-Fleece-Men-Hoodie-Coat-Padded-Jacket.webp', '2024-03-24 02:50:12', '2024-03-24 02:50:12'),
(45, 'boys Hoodie Jacket', 'boys-hoodie-jacket', 17, 'Active', 'public/images/subcategory/1711270251_ba1c45e943014114b39be196ea25c71e.jpeg', '2024-03-24 02:50:51', '2024-03-24 02:50:51'),
(46, 'Girl\'s Hoodie Jacket', 'girls-hoodie-jacket', 18, 'Active', 'public/images/subcategory/1711270280_de241fdc-2b8a-4f8c-bd37-e1e9cb8bd5be.png', '2024-03-24 02:51:20', '2024-03-24 02:51:20'),
(47, 'Men\'s Jacket', 'mens-jacket', 16, 'Active', 'public/images/subcategory/1711270458_2ffd85078fac290662c713a4019a99a7.jpg', '2024-03-24 02:54:18', '2024-03-24 02:54:18'),
(48, 'Boys Jacket', 'boys-jacket', 17, 'Active', 'public/images/subcategory/1711270488_faalg_512.webp', '2024-03-24 02:54:48', '2024-03-24 02:54:48'),
(49, 'Girls Jacket', 'girls-jacket', 18, 'Active', 'public/images/subcategory/1711270528_523063708-4-34_5.webp', '2024-03-24 02:55:28', '2024-03-24 02:55:28'),
(50, 'Men\'s Sweater', 'mens-sweater', 16, 'Active', 'public/images/subcategory/1711270620_Mens-C+K-herobanner.jpeg', '2024-03-24 02:57:00', '2024-03-24 02:57:00'),
(51, 'Boys Sweater', 'boys-sweater', 17, 'Active', 'public/images/category/1711270739_fancy-boys-sweater-500x500.webp', '2024-03-24 02:58:11', '2024-03-24 02:58:59'),
(52, 'Men\'s Twill Pant', 'mens-twill-pant', 16, 'Active', 'public/images/subcategory/1711270907_BW-5323-300-3195_khaki_1800x.webp', '2024-03-24 03:01:47', '2024-03-24 03:01:47'),
(53, 'Boys Twill Pant', 'boys-twill-pant', 17, 'Active', 'public/images/subcategory/1711270935_51ExGC8um0L._AC_UY1000_.jpg', '2024-03-24 03:02:15', '2024-03-24 03:02:15'),
(54, 'Men\'s Boxer (Undergarments)', 'mens-boxer-undergarments', 16, 'Active', 'public/images/subcategory/1711271027_0534825_mens-boxer-combo-7-pcs-assorted-cotton-stretch-underwear.jpeg', '2024-03-24 03:03:47', '2024-03-24 03:03:47'),
(55, 'Men\'s Short Pant', 'mens-short-pant', 16, 'Active', 'public/images/subcategory/1711271244_SPANT-102_KHAKI_model02.webp', '2024-03-24 03:07:24', '2024-03-24 03:07:24'),
(56, 'Boys Short Pant', 'boys-short-pant', 17, 'Active', 'public/images/subcategory/1711271272_Hot-Selling-High-School-Uniforms-Boys-Short-Pants.jpg', '2024-03-24 03:07:52', '2024-03-24 03:07:52'),
(57, 'Men\'s Top Burton Set', 'mens-top-burton-set', 16, 'Active', 'public/images/subcategory/1711271698_23827100301_4.webp', '2024-03-24 03:14:58', '2024-03-24 03:14:58'),
(58, 'Men\'s Jeans & Denim Pant', 'mens-jeans-denim-pant', 16, 'Active', 'public/images/subcategory/1711271753_9832146b72e84aa7892dadf62ec0a0ab.jpeg', '2024-03-24 03:15:53', '2024-03-24 03:15:53'),
(59, 'Men\'s Cargo Joggers Pant', 'mens-cargo-joggers-pant', 16, 'Active', 'public/images/subcategory/1711271923_61NV7noRi9L._AC_UY350_.jpg', '2024-03-24 03:18:43', '2024-03-24 03:18:43'),
(60, 'Men\'s Sweatshirt', 'mens-sweatshirt', 16, 'Active', 'public/images/subcategory/1711272038_Benetton_22A_3J68U200M_17T_P_Full_Card_v.webp', '2024-03-24 03:20:38', '2024-03-24 03:20:38'),
(61, 'Girls Sweatshirt', 'girls-sweatshirt', 18, 'Active', 'public/images/subcategory/1711272065_5-6-years-m-c-sweat-girl-007-grn-miss-chief-original-imafw2y3t3zpzpcz.webp', '2024-03-24 03:21:05', '2024-03-24 03:21:05'),
(62, 'Boys Cargo Joggers Pant', 'boys-cargo-joggers-pant', 17, 'Active', 'public/images/subcategory/1711272282_65bd8dca3c6ef40ee6317a26-tlaenson-boys-cargo-joggers-pants.jpg', '2024-03-24 03:24:42', '2024-03-24 03:24:42'),
(63, 'Boys Sweatshirt', 'boys-sweatshirt', 17, 'Active', 'public/images/subcategory/1711272416_523063428-1-34_5.webp', '2024-03-24 03:26:56', '2024-03-24 03:26:56'),
(64, 'Girls Polo Shirt', 'girls-polo-shirt', 18, 'Active', 'public/images/subcategory/1711272439_BGPOLO-CT-NRF-91.jpg', '2024-03-24 03:27:19', '2024-03-24 03:27:19'),
(65, 'Girls Frock', 'girls-frock', 18, 'Active', 'public/images/subcategory/1711272675_girls-frock-gs17425-black-model-image.webp', '2024-03-24 03:31:15', '2024-03-24 03:31:15'),
(66, 'Girls T shirt', 'girls-t-shirt', 18, 'Active', 'public/images/subcategory/1711272714_fc1618efe1c94b16b999c172cc8a3288.jpeg', '2024-03-24 03:31:54', '2024-03-24 03:31:54'),
(67, 'Ladies Tops One Piece', 'ladies-tops-one-piece', 19, 'Active', 'public/images/subcategory/1711272735_71tn4Feo1AL._AC_UY1100_.jpg', '2024-03-24 03:32:15', '2024-03-24 03:32:15'),
(68, 'Ladies Three Piece', 'ladies-three-piece', 19, 'Active', 'public/images/subcategory/1711272839_product-jpeg-500x500.webp', '2024-03-24 03:33:59', '2024-03-24 03:33:59'),
(69, 'Ladies Trouser', 'ladies-trouser', 19, 'Active', 'public/images/subcategory/1711272855_1.webp', '2024-03-24 03:34:15', '2024-03-24 03:34:15'),
(70, 'Ladies Pant', 'ladies-pant', 19, 'Active', 'public/images/subcategory/1711273000_ladies-trousers.webp', '2024-03-24 03:36:40', '2024-03-24 03:36:40'),
(71, 'Ladies Jeggings', 'ladies-jeggings', 19, 'Active', 'public/images/subcategory/1711273025_89b8473b5c6aafd14050024b25bc304f.jpg_300x0q75.webp', '2024-03-24 03:37:05', '2024-03-24 03:37:05'),
(72, 'Ladies Plazo', 'ladies-plazo', 19, 'Active', 'public/images/subcategory/1711273041_9bf219147a5fc87e81fd6eb146ccd24a.jpg', '2024-03-24 03:37:21', '2024-04-02 08:47:15');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `supplierName` varchar(255) NOT NULL,
  `supplierPhone` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `supplierName`, `supplierPhone`, `status`, `created_at`, `updated_at`) VALUES
(1, 'BIGBAZARBD24.COM', '01601551997', 'Active', '2022-08-03 01:30:44', '2023-10-29 00:02:42');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `otp` varchar(255) DEFAULT NULL,
  `active_status` varchar(255) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `profile` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Inactive',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `otp`, `active_status`, `email_verified_at`, `password`, `profile`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Mahi', 'mahi@bigbazarbd24.com', '01948561243', NULL, '0', NULL, '$2y$10$IyEuGomeTE4cP73h3jLej.GCCz7bsOhMzI9LZhr7rdkoUxwTHrmJe', NULL, 'Inactive', NULL, '2023-11-20 09:59:09', '2023-11-20 09:59:09'),
(3, 'Silvi', 'silvi@bigbazarbd24.com', '01797287355', NULL, '0', NULL, '$2y$10$OaUBhVFtaX8yamYdDGzIseEo7XHfwLfyUpHxrTiLmjFSh2gazKnWO', NULL, 'Inactive', NULL, '2023-11-20 10:00:03', '2023-11-20 10:00:03'),
(4, 'Riad', 'riad@bigbazarbd24.com', '01604816001', NULL, '0', NULL, '$2y$10$dpM.BIWRLA121q0ln9kl3OunCiBUBI41SkaAc93qQehBLr3tZs5qO', NULL, 'Inactive', NULL, '2023-11-20 10:02:59', '2023-11-20 10:02:59'),
(5, 'Arafat', 'radboss7070@gmail.com', '01861112329', '475451', '0', NULL, '$2y$10$LSDtbTmjOU3/P4KuEuBDHug3ie.9viR6hRg9wE26.Go2TVneAsLYy', NULL, 'Inactive', NULL, '2023-11-22 21:58:34', '2023-11-22 21:58:34'),
(6, 'Amanda', 'XrqAWV.bhhjhph@tonetics.biz', '578-444-34-15', '857517', '0', NULL, '$2y$10$bAqxPltCKdXOVnRiKrJvu.mOiViuuvMp2PVHG0UTLr5VsL7qsfvUO', NULL, 'Inactive', NULL, '2023-12-25 04:11:47', '2023-12-25 04:11:47');

-- --------------------------------------------------------

--
-- Table structure for table `weights`
--

CREATE TABLE `weights` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attrvalue_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `weight_name` varchar(255) DEFAULT NULL,
  `productRegularPrice` decimal(10,2) DEFAULT NULL,
  `productSalePrice` int(11) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `weights`
--

INSERT INTO `weights` (`id`, `attrvalue_id`, `product_id`, `weight_name`, `productRegularPrice`, `productSalePrice`, `discount`, `created_at`, `updated_at`) VALUES
(2, 11, 187, '.5 kg', 100.00, 85, 15.00, '2024-07-13 13:21:16', '2024-07-13 13:21:16'),
(3, 12, 187, '1kg', 500.00, 450, 10.00, '2024-07-13 13:21:16', '2024-07-13 13:21:16'),
(6, 11, 189, '.5 kg', 850.00, 808, 5.00, '2024-07-13 23:09:23', '2024-07-13 23:09:23'),
(7, 12, 189, '1kg', 950.00, 855, 10.00, '2024-07-13 23:09:23', '2024-07-13 23:09:23');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `courier_id` int(11) NOT NULL,
  `zoneId` int(11) DEFAULT NULL,
  `city_id` varchar(255) NOT NULL,
  `zoneName` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`id`, `courier_id`, `zoneId`, `city_id`, `zoneName`, `status`, `created_at`, `updated_at`) VALUES
(3, 2, NULL, '3', 'Chapainawabganj Sadar', 'Active', '2020-04-28 09:13:32', '2020-04-28 09:13:32'),
(4, 2, NULL, '4', '2 no gate', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(5, 2, NULL, '4', 'Agrabad', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(6, 2, NULL, '4', 'Agrabad (CDA)', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(7, 2, NULL, '4', 'Akbar Shah', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(8, 2, NULL, '4', 'AK khan Road', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(9, 2, NULL, '4', 'Alongkar mor', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(10, 2, NULL, '4', 'Andarkilla', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(11, 2, NULL, '4', 'Badamtolir mor', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(12, 2, NULL, '4', 'Baizid', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(13, 2, NULL, '4', 'Baizid Bostami', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(14, 2, NULL, '4', 'Bakalia', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(15, 2, NULL, '4', 'Bandortila', 'Active', '2020-04-28 09:13:33', '2020-04-28 09:13:33'),
(16, 2, NULL, '4', 'Baroaulia', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(17, 1, NULL, '4', 'Baroiyarhat Bazar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(18, 1, NULL, '4', 'Bata goli', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(19, 1, NULL, '4', 'Bayezid Bostami Road', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(20, 1, NULL, '4', 'Bhatiari', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(21, 1, NULL, '4', 'Bibir Hat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(22, 1, NULL, '4', ' Bohaddarhat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(23, 1, NULL, '4', 'Boro Darogahat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(24, 1, NULL, '4', 'Boro Pol', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(25, 1, NULL, '4', 'Bortakia', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(26, 1, NULL, '4', 'CEPZ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(28, 1, NULL, '4', 'Chamelibag', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(29, 1, NULL, '4', 'Chandanpura', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(30, 1, NULL, '4', 'Chandgaon', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(31, 1, NULL, '4', 'Chateshwary', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(32, 1, NULL, '4', 'Chawkbazar North Side ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(33, 1, NULL, '4', 'Chawkbazar South side ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(34, 1, NULL, '4', 'Chittagong Kalurghat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(35, 1, NULL, '4', 'Chittagong Port', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(36, 1, NULL, '4', 'Chittagong Suburb', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(37, 1, NULL, '4', 'Chittagong University', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(38, 1, NULL, '4', 'Chowdhury Hat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(39, 1, NULL, '4', 'Chowmuhuni', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(40, 1, NULL, '4', 'City gate', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(41, 1, NULL, '4', 'CTG Cantonment', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(42, 1, NULL, '4', 'CTG wirless', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(43, 1, NULL, '4', 'CUET', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(44, 1, NULL, '4', 'Dev Pahar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(45, 1, NULL, '4', 'Dewan hat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(46, 1, NULL, '4', 'Dhoniala Para', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(47, 1, NULL, '4', 'Double Mooring', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(48, 1, NULL, '4', 'Eanyet bazar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(49, 1, NULL, '4', 'East Madarbari', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(50, 1, NULL, '4', 'Fouzdarhat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(51, 1, NULL, '4', 'Foys Lake', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(52, 1, NULL, '4', ' GEC', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(53, 1, NULL, '4', 'Golpahar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(54, 1, NULL, '4', 'Halishahar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(55, 1, NULL, '4', 'Hathazari ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(56, 1, NULL, '4', 'Jamalkhan ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(57, 1, NULL, '4', 'Jublee Road', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(58, 1, NULL, '4', 'kadamrasul', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(59, 1, NULL, '4', 'Kadamtoli', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(60, 1, NULL, '4', 'Kalamia Bazar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(61, 1, NULL, '4', 'Kapashgola', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(62, 1, NULL, '4', 'Kaptai rastar matha', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(63, 1, NULL, '4', 'Katir Hut', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(64, 1, NULL, '4', 'Kazir Dewri', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(65, 1, NULL, '4', 'K B Aman Ali Road', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(66, 1, NULL, '4', 'Khatunganj', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(67, 1, NULL, '4', ' Khulshi ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(68, 1, NULL, '4', 'Kodomtoli', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(69, 1, NULL, '4', 'Kornelhat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(70, 1, NULL, '4', 'Kotowali Ctg', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(71, 1, NULL, '4', 'Kumira', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(72, 1, NULL, '4', 'Lakhan Bazar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(73, 1, NULL, '4', 'Laldighir par', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(74, 1, NULL, '4', 'Lalkhan Bazar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(75, 1, NULL, '4', 'Love Lane', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(76, 1, NULL, '4', 'Majir Ghat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(77, 1, NULL, '4', 'Mehedibag', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(78, 1, NULL, '4', 'Mirsarai', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(79, 1, NULL, '4', 'Modunaghat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(80, 1, NULL, '4', 'Mohammadpur CTG', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(81, 1, NULL, '4', 'Momin Road', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(82, 1, NULL, '4', 'Muradpur', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(83, 1, NULL, '4', 'Nasirabad', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(84, 1, NULL, '4', 'New Market', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(85, 1, NULL, '4', 'New Mooring', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(86, 1, NULL, '4', 'Noapara', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(87, 1, NULL, '4', 'Noju Miar hat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(88, 1, NULL, '4', 'Nondonkanon', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(89, 1, NULL, '4', 'North Khulshi', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(90, 1, NULL, '4', 'O.R Nizam Road', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(91, 1, NULL, '4', 'Oxygen ', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(92, 1, NULL, '4', 'Oxyzen Mor', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(93, 1, NULL, '4', 'Pahartoli', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(94, 1, NULL, '4', 'Panchlaish', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(95, 1, NULL, '4', 'Patharghata', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(96, 1, NULL, '4', 'Potenga', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(97, 1, NULL, '4', 'Rohomotganj', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(98, 1, NULL, '4', 'Sadar Ghat', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(99, 1, NULL, '4', 'Shitakundo', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(100, 1, NULL, '4', 'Sholakbahar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(101, 1, NULL, '4', 'Sholoshohor', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(102, 1, NULL, '4', 'Shugondha', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(103, 1, NULL, '4', 'Shulokhbor', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(104, 1, NULL, '4', 'South Khulshi', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(105, 1, NULL, '4', 'Terri bazar', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(106, 1, NULL, '4', 'Textile', 'Active', '2020-04-28 09:13:34', '2020-04-28 09:13:34'),
(107, 1, NULL, '5', 'Chuadanga ', 'Active', '2020-04-28 09:13:35', '2020-04-28 09:13:35'),
(108, 1, NULL, '6', 'Chokoria', 'Active', '2020-04-28 09:13:35', '2020-04-28 09:13:35'),
(109, 1, NULL, '6', 'Cox\'s bazar sadar', 'Active', '2020-04-28 09:13:35', '2020-04-28 09:13:35'),
(110, 1, NULL, '7', 'Cantoment Area, Kotbari, Chandina, University ', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(111, 1, NULL, '7', 'Chowddagram, Cewra, Mia Bazar. Choara.', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(112, 1, NULL, '7', 'Dawdkandi, Bazar. Asmania Bazar,Shohidnagar', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(113, 1, NULL, '7', 'Hajiganj Sadar ', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(114, 1, NULL, '7', 'Homna,Cinaiya Mor,Kashipur,Dulalpur.Meghna', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(115, 1, NULL, '7', 'Kandirpar', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(116, 1, NULL, '7', 'Kandirpar,Racecourse,Dhormopur,Dhakurpara.Chortha.', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(117, 1, NULL, '7', 'Laksam,Nangolkot,Monohorgonj,Mudafforgonj', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(118, 1, NULL, '7', 'Muradnagar Main Bazar, Devidwar, Companigonj', 'Active', '2020-04-28 09:13:36', '2020-04-28 09:13:36'),
(119, 1, NULL, '8', '60 feet', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(120, 1, NULL, '8', 'Abdullahpur', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(121, 1, NULL, '8', 'Aftab Nagar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(122, 1, NULL, '8', 'Agargaon', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(123, 1, NULL, '8', 'Aga Sadiq Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(124, 1, NULL, '8', 'A-MES', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(125, 1, NULL, '8', 'Arambag', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(126, 1, NULL, '8', 'Arambagh', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(127, 1, NULL, '8', 'Arjatpara', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(128, 1, NULL, '8', 'Armanitola', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(129, 1, NULL, '8', 'Asad Avenue', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(130, 1, NULL, '8', 'Ashkona-Dakkhin khan', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(131, 1, NULL, '8', 'Azimpur', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(132, 1, NULL, '8', 'Aziz Sarani', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(133, 1, NULL, '8', 'Babar Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(134, 1, NULL, '8', 'Babubazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(135, 1, NULL, '8', 'Badda', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(136, 1, NULL, '8', 'Baily Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(137, 1, NULL, '8', 'bakshibazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(138, 1, NULL, '8', 'Bakshi Bazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(139, 1, NULL, '8', 'Balughat', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(140, 1, NULL, '8', 'Banani', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(141, 1, NULL, '8', 'Banasree', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(142, 1, NULL, '8', 'Bangla bazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(143, 1, NULL, '8', 'Bangla College', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(144, 1, NULL, '8', 'banglamotor', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(145, 1, NULL, '8', 'Bangshal', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(146, 1, NULL, '8', 'Baridhara', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(147, 1, NULL, '8', 'barontak', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(148, 1, NULL, '8', 'Bashundhara ', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(149, 1, NULL, '8', 'bashundhara city', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(150, 1, NULL, '8', 'Bawnia', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(151, 1, NULL, '8', 'Begumbazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(152, 1, NULL, '8', 'Bijay Nagar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(153, 1, NULL, '8', 'Bongshal', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(154, 1, NULL, '8', 'Boro Shahebr Bazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(155, 1, NULL, '8', 'Chairman Bari', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(156, 1, NULL, '8', 'Chakbazar', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(157, 1, NULL, '8', 'Chalabon', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(158, 1, NULL, '8', 'Chankharpul', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(159, 1, NULL, '8', 'Coca-cola', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(160, 1, NULL, '8', 'Darussalam', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(161, 1, NULL, '8', 'Demra', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(162, 1, NULL, '8', 'dhaka cantonment', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(163, 1, NULL, '8', 'Dhanmondi', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(164, 1, NULL, '8', 'Dilkusha', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(165, 1, NULL, '8', 'Diya Bari', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(166, 1, NULL, '8', 'East west dental hospital', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(167, 1, NULL, '8', 'ECB', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(168, 1, NULL, '8', 'Elenbari', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(169, 1, NULL, '8', 'Elephant Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(170, 1, NULL, '8', 'Faidabad', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(171, 1, NULL, '8', 'Farmgate', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(172, 1, NULL, '8', 'fatickchari', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(173, 1, NULL, '8', 'FDC', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(174, 1, NULL, '8', 'Fokirapool', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(175, 1, NULL, '8', 'Gabtoli', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(176, 1, NULL, '8', 'Gendaria', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(177, 1, NULL, '8', 'Geneva Camp', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(178, 1, NULL, '8', 'Golapbag', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(179, 1, NULL, '8', 'Gopibagh', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(180, 1, NULL, '8', 'GPO', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(181, 1, NULL, '8', 'greenroad', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(182, 1, NULL, '8', 'Green Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(183, 1, NULL, '8', 'Gulistan', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(184, 1, NULL, '8', 'gulshan', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(185, 1, NULL, '8', 'Gulshan-1', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(186, 1, NULL, '8', 'Gulshan-2 ', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(187, 1, NULL, '8', 'Haji Camp', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(188, 1, NULL, '8', 'Hatirpool', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(189, 1, NULL, '8', 'Hazaribag', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(190, 1, NULL, '8', 'Humayun Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(191, 1, NULL, '8', 'Indira Road', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(192, 1, NULL, '8', 'Islampur', 'Active', '2020-04-28 09:13:38', '2020-04-28 09:13:38'),
(193, 1, NULL, '8', 'jagannathpur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(194, 1, NULL, '8', 'Jagannath University', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(195, 1, NULL, '8', 'Jahangir Gate', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(196, 1, NULL, '8', 'jamuna future park', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(197, 1, NULL, '8', 'Jatrabari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(198, 1, NULL, '8', 'Kaderabad', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(199, 1, NULL, '8', 'kafrul', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(200, 1, NULL, '8', 'Kakrail', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(201, 1, NULL, '8', 'Kalabagan', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(202, 1, NULL, '8', 'Kallyanpur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(203, 1, NULL, '8', 'Kalshi', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(204, 1, NULL, '8', 'Kamalapur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(205, 1, NULL, '8', 'kamal ataturk avenue', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(206, 1, NULL, '8', 'Kamarpara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(207, 1, NULL, '8', 'Kathalbagan', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(208, 1, NULL, '8', 'Kawla', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(209, 1, NULL, '8', 'Kawran Bazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(210, 1, NULL, '8', 'Kazipara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(211, 1, NULL, '8', 'Khamar Bari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(212, 1, NULL, '8', 'Khilgaon', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(213, 1, NULL, '8', 'Khilgaon Taltola', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(214, 1, NULL, '8', 'Khilkhet', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(215, 1, NULL, '8', 'Kochukhet', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(216, 1, NULL, '8', 'Konapara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(217, 1, NULL, '8', 'Korail Bosti', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(218, 1, NULL, '8', 'Koshai Bari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(219, 1, NULL, '8', 'Kuril', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(220, 1, NULL, '8', 'kurmitola', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(221, 1, NULL, '8', 'Lakshmibazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(222, 1, NULL, '8', 'Lalbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(223, 1, NULL, '8', 'lalbagh', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(224, 1, NULL, '8', 'Malibagh', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(225, 1, NULL, '8', 'malitola', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(226, 1, NULL, '8', 'manikdhi', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(227, 1, NULL, '8', 'Manik Mia Avenue', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(228, 1, NULL, '8', 'Matikata', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(229, 1, NULL, '8', 'Matuwail', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(230, 1, NULL, '8', 'Meradia', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(231, 1, NULL, '8', 'Mintu Road', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(232, 1, NULL, '8', 'Mirpur 1', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(233, 1, NULL, '8', 'Mirpur 10', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(234, 1, NULL, '8', 'Mirpur 11 ', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(235, 1, NULL, '8', 'Mirpur 12', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(236, 1, NULL, '8', 'Mirpur 14', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(237, 1, NULL, '8', 'Mirpur 2', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(238, 1, NULL, '8', 'Mirpur 6', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(239, 1, NULL, '8', 'Mirpur 7', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(240, 1, NULL, '8', 'Mirpur DOHS', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(241, 1, NULL, '8', 'Mitford', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(242, 1, NULL, '8', 'Modhubag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(243, 1, NULL, '8', 'Mogbazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(244, 1, NULL, '8', 'Mohakhali', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(245, 1, NULL, '8', 'Mohakhali Wireless', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(246, 1, NULL, '8', 'Monipur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(247, 1, NULL, '8', 'Monipuripara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(248, 1, NULL, '8', 'Motijheel', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(249, 1, NULL, '8', 'Nabisco', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(250, 1, NULL, '8', 'Nakhalpara ', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(251, 1, NULL, '8', 'Namapara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(252, 1, NULL, '8', 'Narinda', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(253, 1, NULL, '8', 'Nawabpur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(254, 1, NULL, '8', 'Naya Bazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(255, 1, NULL, '8', 'Nazim Uddin Road', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(256, 1, NULL, '8', 'Nazirabazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(257, 1, NULL, '8', 'Nazira Bazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(258, 1, NULL, '8', 'Nilkhet', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(259, 1, NULL, '8', 'Norda', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(260, 1, NULL, '8', 'Nurerchala', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(261, 1, NULL, '8', 'Paikpara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(262, 1, NULL, '8', 'Paltan', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(263, 1, NULL, '8', 'Panthapath', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(264, 1, NULL, '8', 'Paribag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(265, 1, NULL, '8', 'Patuatuli', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(266, 1, NULL, '8', 'Peyarabag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(267, 1, NULL, '8', 'Pink City', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(268, 1, NULL, '8', 'Polashi', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(269, 1, NULL, '8', 'Postogola', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(270, 1, NULL, '8', 'Pragati Sarani', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(271, 1, NULL, '8', 'Press Club', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(272, 1, NULL, '8', 'Raja bari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(273, 1, NULL, '8', 'Rajabazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(274, 1, NULL, '8', 'rajarbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(275, 1, NULL, '8', 'ramna', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(276, 1, NULL, '8', 'Rampura', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(277, 1, NULL, '8', 'ranavola', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(278, 1, NULL, '8', 'Rasulbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(279, 1, NULL, '8', 'Rayerbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(280, 1, NULL, '8', 'rayerbazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(281, 1, NULL, '8', 'Rayer Bazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(282, 1, NULL, '8', 'razabajar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(283, 1, NULL, '8', 'Sadarghat', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(284, 1, NULL, '8', 'Saydabad', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(285, 1, NULL, '8', 'Science Lab', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(286, 1, NULL, '8', 'Senpara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(287, 1, NULL, '8', 'Shahbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(288, 1, NULL, '8', 'Shaheenbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(289, 1, NULL, '8', 'Shahidbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(290, 1, NULL, '8', 'Shahjadpur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(291, 1, NULL, '8', 'Shajahanpur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(292, 1, NULL, '8', 'Shakharibazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(293, 1, NULL, '8', 'Shammibag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(294, 1, NULL, '8', 'Shanir Akhra', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(295, 1, NULL, '8', 'Shankar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(296, 1, NULL, '8', 'shantibagh', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(297, 1, NULL, '8', 'Shantinagar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(298, 1, NULL, '8', 'Shegunbagicha', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(299, 1, NULL, '8', 'sher e bangla agricultural university', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(300, 1, NULL, '8', 'Shersah Suri Road', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(301, 1, NULL, '8', 'Shewrapara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(302, 1, NULL, '8', 'shiddesawari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(303, 1, NULL, '8', 'Shiddeshwari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(304, 1, NULL, '8', 'Shobujbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(305, 1, NULL, '8', 'Shutrapur', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(306, 1, NULL, '8', 'shyamoli', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(307, 1, NULL, '8', 'Siraz market', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(308, 1, NULL, '8', 'Sobhanbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(309, 1, NULL, '8', 'Solimullah Road', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(310, 1, NULL, '8', 'SONY Cinema Hall', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(311, 1, NULL, '8', 'South Bishil', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(312, 1, NULL, '8', 'South Jatrabari', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(313, 1, NULL, '8', 'Sukrabad', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(314, 1, NULL, '8', 'swamibag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(315, 1, NULL, '8', 'Tallabag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(316, 1, NULL, '8', 'Tatibazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(317, 1, NULL, '8', 'Tazmahal Road', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(318, 1, NULL, '8', 'Technical', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(319, 1, NULL, '8', 'Tejgaon', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(320, 1, NULL, '8', 'Tejkunipara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(321, 1, NULL, '8', 'Tejturi Bazar', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(322, 1, NULL, '8', 'Tikatoli', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(323, 1, NULL, '8', 'Tolarbag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(324, 1, NULL, '8', 'Tolar Bag', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(325, 1, NULL, '8', 'Ulon', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(326, 1, NULL, '8', 'Urdu Road', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(327, 1, NULL, '8', 'Uttara', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(328, 1, NULL, '8', 'Uttara Residential Model Town', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(329, 1, NULL, '8', 'Uttar Khan', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(330, 1, NULL, '8', 'Vasan Tek', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(331, 1, NULL, '8', 'Vootergoli', 'Active', '2020-04-28 09:13:39', '2020-04-28 09:13:39'),
(332, 1, NULL, '9', 'Dinajpur ', 'Active', '2020-04-28 09:13:40', '2020-04-28 09:13:40'),
(333, 1, NULL, '10', 'Faridpur Sadar', 'Active', '2020-04-28 09:13:41', '2020-04-28 09:13:41'),
(334, 1, NULL, '11', 'Habigonj Sadar', 'Active', '2020-04-28 09:13:42', '2020-04-28 09:13:42'),
(335, 1, NULL, '12', 'Jashore sadar', 'Active', '2020-04-28 09:13:44', '2020-04-28 09:13:44'),
(336, 1, NULL, '13', 'Jhalokathi', 'Active', '2020-04-28 09:13:45', '2020-04-28 09:13:45'),
(337, 1, NULL, '14', 'Haryana khunda Thana', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(338, 1, NULL, '14', 'Jhenidah sadar ', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(339, 1, NULL, '14', 'Kaliganj Thana', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(340, 1, NULL, '14', 'kotchandpur Thana', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(341, 1, NULL, '14', 'Maheshpur Thana', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(342, 1, NULL, '14', 'Shailakupa Thana', 'Active', '2020-04-28 09:13:46', '2020-04-28 09:13:46'),
(343, 1, NULL, '15', 'Khulna', 'Active', '2020-04-28 09:13:47', '2020-04-28 09:13:47'),
(344, 1, NULL, '16', 'Laksmipur Sadar ', 'Active', '2020-04-28 09:13:47', '2020-04-28 09:13:47'),
(345, 1, NULL, '17', 'Lalmonirhat ', 'Active', '2020-04-28 09:13:48', '2020-04-28 09:13:48'),
(346, 1, NULL, '18', 'Magura', 'Active', '2020-04-28 09:13:50', '2020-04-28 09:13:50'),
(347, 1, NULL, '18', 'Mohammadpur Thana', 'Active', '2020-04-28 09:13:50', '2020-04-28 09:13:50'),
(348, 1, NULL, '18', 'Shalikha Thana', 'Active', '2020-04-28 09:13:50', '2020-04-28 09:13:50'),
(349, 1, NULL, '18', 'Sreepur Thana', 'Active', '2020-04-28 09:13:50', '2020-04-28 09:13:50'),
(350, 1, NULL, '19', 'Meherpur sadar ', 'Active', '2020-04-28 09:13:51', '2020-04-28 09:13:51'),
(351, 1, NULL, '20', 'Nougaon Sadar', 'Active', '2020-04-28 09:13:52', '2020-04-28 09:13:52'),
(352, 1, NULL, '21', 'Narshingdi Sadar', 'Active', '2020-04-28 09:13:53', '2020-04-28 09:13:53'),
(353, 1, NULL, '22', 'Natore Sadar ', 'Active', '2020-04-28 09:13:55', '2020-04-28 09:13:55'),
(354, 1, NULL, '23', 'Nilphamari ', 'Active', '2020-04-28 09:13:56', '2020-04-28 09:13:56'),
(355, 1, NULL, '23', 'Saidpur ', 'Active', '2020-04-28 09:13:56', '2020-04-28 09:13:56'),
(356, 1, NULL, '24', 'Noakhali Sadar, Maizde, Sonapur Bazar', 'Active', '2020-04-28 09:13:57', '2020-04-28 09:13:57'),
(357, 1, NULL, '25', 'Pirojpur Sadar', 'Active', '2020-04-28 09:13:59', '2020-04-28 09:13:59'),
(358, 1, NULL, '26', 'Rajshahi', 'Active', '2020-04-28 09:14:00', '2020-04-28 09:14:00'),
(359, 1, NULL, '27', 'Rangpur', 'Active', '2020-04-28 09:14:01', '2020-04-28 09:14:01'),
(360, 1, NULL, '28', 'Sirajganj Sadar', 'Active', '2020-04-28 09:14:02', '2020-04-28 09:14:02'),
(361, 1, NULL, '29', 'Beanibazar', 'Active', '2020-04-28 09:14:03', '2020-04-28 09:14:03'),
(362, 1, NULL, '29', 'Sylhet', 'Active', '2020-04-28 09:14:03', '2020-04-28 09:14:03'),
(363, 4, NULL, '269', 'Adabor', 'Active', '2020-04-28 15:20:36', '2020-04-28 15:20:36'),
(364, 4, NULL, '269', 'Aftabnagar', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(365, 4, NULL, '269', 'Agargaon', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(366, 4, NULL, '269', 'Azimpur', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(367, 4, NULL, '269', 'Air-hq', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(368, 4, NULL, '269', 'Ashrafabad', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(369, 4, NULL, '269', 'Badda', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(370, 4, NULL, '269', 'Biman-bandar', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(371, 4, NULL, '269', 'Bangshal', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(372, 4, NULL, '269', 'Bhasantek', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(373, 4, NULL, '269', 'Bhatara', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(374, 4, NULL, '269', 'Banani', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(375, 4, NULL, '269', 'Basabo', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(376, 4, NULL, '269', 'Banasree', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(377, 4, NULL, '269', 'Baridhara', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(378, 4, NULL, '269', 'Baridhara-j-block', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(379, 4, NULL, '269', 'Basundhara-ra', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(380, 4, NULL, '269', 'Bawnia', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(381, 4, NULL, '269', 'Buet', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(382, 4, NULL, '269', 'Bdr-head-quarter', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(383, 4, NULL, '269', 'Babu-bazar', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(384, 4, NULL, '269', 'Baf-base', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(385, 4, NULL, '269', 'Bangla-academy', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(386, 4, NULL, '269', 'Bangabhaban', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(387, 4, NULL, '269', 'Chakbazar', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(388, 4, NULL, '269', 'Dakshinkhan', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(389, 4, NULL, '269', 'Darus-salam', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(390, 4, NULL, '269', 'Dhaka-cantonment', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(391, 4, NULL, '269', 'Dhanmondi', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(392, 4, NULL, '269', 'Dhaka-university', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(393, 4, NULL, '269', 'Dohs-banani', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(394, 4, NULL, '269', 'Dohs-baridhara', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(395, 4, NULL, '269', 'Dohs-mirpur', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(396, 4, NULL, '269', 'Dohs-mohakhali', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(397, 4, NULL, '269', 'Dhaka-medical-college', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(398, 4, NULL, '269', 'Dhaka-cantt', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(399, 4, NULL, '269', 'Dilkhusha', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(400, 4, NULL, '269', 'Doyagonj', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(401, 4, NULL, '269', 'Eskaton', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(402, 4, NULL, '269', 'Farmgate', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(403, 4, NULL, '269', 'Faridabad', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(404, 4, NULL, '269', 'Gulshan', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(405, 4, NULL, '269', 'Gendaria', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(406, 4, NULL, '269', 'Gabtoli', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(407, 4, NULL, '269', 'Ganabhaban', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(408, 4, NULL, '269', 'Green-road', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(409, 4, NULL, '269', 'Gulshan-model-town', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(410, 4, NULL, '269', 'Gopibag', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(411, 4, NULL, '269', 'Hazaribagh', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(412, 4, NULL, '269', 'High-court', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(413, 4, NULL, '269', 'Haji-camp', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(414, 4, NULL, '269', 'Indira-road', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(415, 4, NULL, '269', 'Jatrabari', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(416, 4, NULL, '269', 'Jagannath-university', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(417, 4, NULL, '269', 'Jigatola', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(418, 4, NULL, '269', 'Kafrul', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(419, 4, NULL, '269', 'Kamrangirchar', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(420, 4, NULL, '269', 'Kalabagan', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(421, 4, NULL, '269', 'Khilkhet', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(422, 4, NULL, '269', 'Kotwali', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(423, 4, NULL, '269', 'Khilgaon', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(424, 4, NULL, '269', 'Kakrail', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(425, 4, NULL, '269', 'Kallyanpur', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(426, 4, NULL, '269', 'Kalshi', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(427, 4, NULL, '269', 'Karzon-hall', 'Active', '2020-04-28 15:21:29', '2020-04-28 15:21:29'),
(428, 4, NULL, '269', 'Kathalbagan', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(429, 4, NULL, '269', 'Kamlapur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(430, 4, NULL, '269', 'Lalbag', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(431, 4, NULL, '269', 'Lalmatia', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(432, 4, NULL, '269', 'Lakshibazar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(433, 4, NULL, '269', 'Mirpur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(434, 4, NULL, '269', 'Mohammadpur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(435, 4, NULL, '269', 'Rampura', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(436, 4, NULL, '269', 'Motijheel', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(437, 4, NULL, '269', 'Mugdapara', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(438, 4, NULL, '269', 'Malibagh', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(439, 4, NULL, '269', 'Matikata', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(440, 4, NULL, '269', 'Merul-badda', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(441, 4, NULL, '269', 'Moghbazaar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(442, 4, NULL, '269', 'Mohakhali', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(443, 4, NULL, '269', 'Matuail', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(444, 4, NULL, '269', 'Mirpur-police-complex', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(445, 4, NULL, '269', 'Mirpur-cantt', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(446, 4, NULL, '269', 'Mirpur-section-11', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(447, 4, NULL, '269', 'Mitford', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(448, 4, NULL, '269', 'Manikdi', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(449, 4, NULL, '269', 'Mohammedpur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(450, 4, NULL, '269', 'Mirpur-zoo', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(451, 4, NULL, '269', 'Mohammadpur-housing', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(452, 4, NULL, '269', 'Mirpur-1', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(453, 4, NULL, '269', 'Maniknagar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(454, 4, NULL, '269', 'New-market', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(455, 4, NULL, '269', 'Niketan', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(456, 4, NULL, '269', 'Nikunja', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(457, 4, NULL, '269', 'Nakhalpara', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(458, 4, NULL, '269', 'Nababpur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(459, 4, NULL, '269', 'Natunbazar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(460, 4, NULL, '269', 'Pallabi', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(461, 4, NULL, '269', 'Paltan', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(462, 4, NULL, '269', 'Paikpara', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(463, 4, NULL, '269', 'Panthapath', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(464, 4, NULL, '269', 'Pink-city', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(465, 4, NULL, '269', 'Postagola', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(466, 4, NULL, '269', 'Pilkhana', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(467, 4, NULL, '269', 'Ramna', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(468, 4, NULL, '269', 'Rupnagar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(469, 4, NULL, '269', 'Rayerbazar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(470, 4, NULL, '269', 'Rajarbagh-police-line', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(471, 4, NULL, '269', 'Razia-sultana-road', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(472, 4, NULL, '269', 'Rupnagar--tso', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(473, 4, NULL, '269', 'Rayerbag', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(474, 4, NULL, '269', 'Sabujbagh', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(475, 4, NULL, '269', 'Shyampur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(476, 4, NULL, '269', 'Sher-e-bangla-nagar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(477, 4, NULL, '269', 'Shah-ali', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(478, 4, NULL, '269', 'Shahbagh', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(479, 4, NULL, '269', 'Shahjahanpur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(480, 4, NULL, '269', 'Sutrapur', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(481, 4, NULL, '269', 'Shaymoli', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(482, 4, NULL, '269', 'Sangsad-bhaban', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(483, 4, NULL, '269', 'Sher-e--banglanagar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(484, 4, NULL, '269', 'Sayedabad', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(485, 4, NULL, '269', 'Shantinagar', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(486, 4, NULL, '269', 'Segunbagicha', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(487, 4, NULL, '269', 'Sekertek', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(488, 4, NULL, '269', 'Shewrapara', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(489, 4, NULL, '269', 'Shipahibag', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(490, 4, NULL, '269', 'Siddheswari', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(491, 4, NULL, '269', 'Sukrabad', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(492, 4, NULL, '269', 'Tejgaon', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(493, 4, NULL, '269', 'Tejgaon-air-port', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(494, 4, NULL, '269', 'Uttara', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(495, 4, NULL, '269', 'Uttar-khan', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(496, 4, NULL, '269', 'Uttara-model-town', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(497, 4, NULL, '269', 'Wari', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(498, 4, NULL, '269', 'Wari-tso', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(499, 4, NULL, '269', 'Zigatola-staff-quarter', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(500, 4, NULL, '269', 'Tongi', 'Active', '2020-04-28 15:21:30', '2020-04-28 15:21:30'),
(501, 4, NULL, '270', 'Demra', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(502, 4, NULL, '270', 'Keranigonj', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(503, 4, NULL, '270', 'Savar', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(504, 4, NULL, '270', 'Ashulia', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(505, 4, NULL, '270', 'Dhamrai', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(506, 4, NULL, '270', 'Dohar', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(507, 4, NULL, '270', 'Nawabganj', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(508, 4, NULL, '270', 'Palamganj', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(509, 4, NULL, '270', 'Dhonia', 'Active', '2020-04-28 15:21:32', '2020-04-28 15:21:32'),
(510, 4, NULL, '271', 'Chittagong-gpo', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(511, 4, NULL, '271', 'Chaktai', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(512, 4, NULL, '271', 'Central-govt.-office-building', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(513, 4, NULL, '271', 'Ustc', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(514, 4, NULL, '271', 'Ctg.-hazi-camp', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(515, 4, NULL, '271', 'Ctg.-zame-mosjid', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(516, 4, NULL, '271', 'Lama-bazar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(517, 4, NULL, '271', 'Ctg.-medical-college', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(518, 4, NULL, '271', 'Crb', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(519, 4, NULL, '271', 'Baitush-sharaf', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(520, 4, NULL, '271', 'Andorkilla', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(521, 4, NULL, '271', 'Double-muring', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(522, 4, NULL, '271', 'Chittagong-education-board', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(523, 4, NULL, '271', 'Pathantuli', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(524, 4, NULL, '271', 'Riazuddin-bazar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(525, 4, NULL, '271', 'Ctg-govt-college', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(526, 4, NULL, '271', 'Agrabad', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(527, 4, NULL, '271', 'Ctg.-court-building', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(528, 4, NULL, '271', 'Custom-house', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(529, 4, NULL, '271', 'Naziriya-naimia-mahmodia-madrasha', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(530, 4, NULL, '271', 'Darul-ma-arif', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(531, 4, NULL, '271', 'Azimpara', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(532, 4, NULL, '271', 'Chawkbazar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(533, 4, NULL, '271', 'Patenga', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(534, 4, NULL, '271', 'Chittagong airport', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(535, 4, NULL, '271', 'Politechnic-in', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(536, 4, NULL, '271', 'Bayezid bostami', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(537, 4, NULL, '271', 'Amin-jute-mills', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(538, 4, NULL, '271', 'Jalalabad', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(539, 4, NULL, '271', 'Anandabazar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(540, 4, NULL, '271', 'North-kotwali', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(541, 4, NULL, '271', 'Sailers coloni', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(542, 4, NULL, '271', 'Al--amin-baria-madrasha', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(543, 4, NULL, '271', 'Middle-patenga', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(544, 4, NULL, '271', 'Rampura-tso', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(545, 4, NULL, '271', 'Halishshar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(546, 4, NULL, '271', 'North-halishahar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(547, 4, NULL, '271', 'Chandgaon', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(548, 4, NULL, '271', 'Chittagong bandar', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(549, 4, NULL, '271', 'Jaldia merine accademy', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(550, 4, NULL, '271', 'Mohard', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(551, 4, NULL, '271', 'Pahartali', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(552, 4, NULL, '271', 'Wazedia-madrasha', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(553, 4, NULL, '271', 'Chittagong-customs-accademy', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36');
INSERT INTO `zones` (`id`, `courier_id`, `zoneId`, `city_id`, `zoneName`, `status`, `created_at`, `updated_at`) VALUES
(554, 4, NULL, '271', 'Epz-ctg', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(555, 4, NULL, '271', 'Firozshah-collony', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(556, 4, NULL, '271', 'Halishahar-housing-estate', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(557, 4, NULL, '271', 'East-joara', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(558, 4, NULL, '271', 'Gachbaria', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(559, 4, NULL, '271', 'Chittagong cantonment', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(560, 4, NULL, '271', 'Panchlaish', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(561, 4, NULL, '271', 'Kotwali', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(562, 4, NULL, '271', 'Khulshi', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(563, 4, NULL, '271', 'Other', 'Active', '2020-04-28 15:22:36', '2020-04-28 15:22:36'),
(564, 4, NULL, '272', 'Fatikchhari', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(565, 4, NULL, '272', 'Rangunia', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(566, 4, NULL, '272', 'Anowara', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(567, 4, NULL, '272', 'Raozan', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(568, 4, NULL, '272', 'Banshkhali', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(569, 4, NULL, '272', 'Lohagara', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(570, 4, NULL, '272', 'Chandanaish', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(571, 4, NULL, '272', 'Boalkhali', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(572, 4, NULL, '272', 'Double-mooring', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(573, 4, NULL, '272', 'Panchlaish', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(574, 4, NULL, '272', 'Karnaphuli', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(575, 4, NULL, '272', 'Hathazari', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(576, 4, NULL, '272', 'Mirsharai', 'Active', '2020-04-28 15:22:40', '2020-04-28 15:22:40'),
(577, 4, NULL, '272', 'Patiya', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(578, 4, NULL, '272', 'Satkania', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(579, 4, NULL, '272', 'Bandar', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(580, 4, NULL, '272', 'Pahartali', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(581, 4, NULL, '272', 'Jaldi', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(582, 4, NULL, '272', 'Urirchar', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(583, 4, NULL, '272', 'Sandwip', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(584, 4, NULL, '272', 'Sitakunda', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(585, 4, NULL, '272', 'Kotwali', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(586, 4, NULL, '272', 'Bhujpur', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(587, 4, NULL, '272', 'Dohazari', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(588, 4, NULL, '272', 'Barama', 'Active', '2020-04-28 15:22:41', '2020-04-28 15:22:41'),
(589, 4, NULL, '273', 'Khulna-sadar', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(590, 4, NULL, '273', 'Custom-house', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(591, 4, NULL, '273', 'Newmarket', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(592, 4, NULL, '273', 'Khulna-gpo', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(593, 4, NULL, '273', 'Atra-shilpa-area', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(594, 4, NULL, '273', 'Bit-khulna', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(595, 4, NULL, '273', 'Jahanabad cantonment', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(596, 4, NULL, '273', 'Khulna-shipyard', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(597, 4, NULL, '273', 'Khulna-university', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(598, 4, NULL, '273', 'Siramani', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(599, 4, NULL, '273', 'Sonali-jute-mills', 'Active', '2020-04-28 15:23:17', '2020-04-28 15:23:17'),
(600, 4, NULL, '273', 'Kia', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(601, 4, NULL, '273', 'Bidc-road', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(602, 4, NULL, '273', 'Boyra-police-line', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(603, 4, NULL, '273', 'Khalishpur-town', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(604, 4, NULL, '273', 'Boyra-postal-colony', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(605, 4, NULL, '273', 'Muzgunni', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(606, 4, NULL, '273', 'Dcs', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(607, 4, NULL, '273', 'Bl-college', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(608, 4, NULL, '273', 'Phulbari-gate', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(609, 4, NULL, '273', 'Koylaghata', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(610, 4, NULL, '273', 'Khulna-court', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(611, 4, NULL, '273', 'Khulna-bazar', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(612, 4, NULL, '273', 'Kdsb', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(613, 4, NULL, '273', 'Bania-khamar', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(614, 4, NULL, '273', 'Dolkhola', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(615, 4, NULL, '273', 'Sonadanga', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(616, 4, NULL, '273', 'Other', 'Active', '2020-04-28 15:23:18', '2020-04-28 15:23:18'),
(617, 4, NULL, '274', 'Khan-jahan-ali', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(618, 4, NULL, '274', 'Dumuria', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(619, 4, NULL, '274', 'Paikgachha', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(620, 4, NULL, '274', 'Batiaghata', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(621, 4, NULL, '274', 'Koyra', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(622, 4, NULL, '274', 'Terokhada', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(623, 4, NULL, '274', 'Phultala', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(624, 4, NULL, '274', 'Dighalia', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(625, 4, NULL, '274', 'Kotwali', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(626, 4, NULL, '274', 'Khalishpur', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(627, 4, NULL, '274', 'Sonadanga', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(628, 4, NULL, '274', 'Doulatpur', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(629, 4, NULL, '274', 'Alaipur', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(630, 4, NULL, '274', 'Chalna bazar', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(631, 4, NULL, '274', 'Madinabad', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(632, 4, NULL, '274', 'Sajiara', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(633, 4, NULL, '274', 'Rupsha', 'Active', '2020-04-28 15:23:22', '2020-04-28 15:23:22'),
(634, 4, NULL, '275', 'Sylhet-sadar', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(635, 4, NULL, '275', 'Jalalabad', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(636, 4, NULL, '275', 'Jalalabad-cantoment', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(637, 4, NULL, '275', 'Mogla', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(638, 4, NULL, '275', 'Ranga-hajiganj', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(639, 4, NULL, '275', 'Sylhet-biman-bondar', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(640, 4, NULL, '275', 'Sylhet-cadet-col', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(641, 4, NULL, '275', 'Khadimnagar', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(642, 4, NULL, '275', 'Silam', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(643, 4, NULL, '275', 'Birahimpur', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(644, 4, NULL, '275', 'Kadamtali', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(645, 4, NULL, '275', 'Kamalbazer', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(646, 4, NULL, '275', 'Lalbazar', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(647, 4, NULL, '275', 'Shahjalal-university-of-science-and-technology', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(648, 4, NULL, '275', 'Other', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(649, 4, NULL, '275', 'Ragib-rabeya-medical-college', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(650, 4, NULL, '275', 'Osmani-nagor', 'Active', '2020-04-28 15:24:36', '2020-04-28 15:24:36'),
(651, 4, NULL, '276', 'Gowainghat', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(652, 4, NULL, '276', 'Balaganj', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(653, 4, NULL, '276', 'Kanaighat', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(654, 4, NULL, '276', 'Beani-bazar', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(655, 4, NULL, '276', 'Bishwanath', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(656, 4, NULL, '276', 'Jaintapur', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(657, 4, NULL, '276', 'Zakiganj', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(658, 4, NULL, '276', 'Companiganj', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(659, 4, NULL, '276', 'Golapganj', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(660, 4, NULL, '276', 'Fenchuganj', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(661, 4, NULL, '276', 'Osmani-nagor', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(662, 4, NULL, '276', 'Dakshin-surma', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(663, 4, NULL, '276', 'Sylhet-cadet-col', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(664, 4, NULL, '276', 'Silam', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(665, 4, NULL, '276', 'Birahimpur', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(666, 4, NULL, '276', 'Kadamtali', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(667, 4, NULL, '276', 'Kamalbazer', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(668, 4, NULL, '276', 'Lalbazar', 'Active', '2020-04-28 15:24:41', '2020-04-28 15:24:41'),
(669, 4, NULL, '277', 'Binodpur-bazar', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(670, 4, NULL, '277', 'Ghuramara', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(671, 4, NULL, '277', 'Kazla', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(672, 4, NULL, '277', 'Rajshahi-canttonment', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(673, 4, NULL, '277', 'Rajshahi-court', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(674, 4, NULL, '277', 'Rajshahi sadar', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(675, 4, NULL, '277', 'Rajshahi university', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(676, 4, NULL, '277', 'Sapura', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(677, 4, NULL, '277', 'Other', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(678, 4, NULL, '277', 'Padma r/a', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(679, 4, NULL, '277', 'Rajshahi-college', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(680, 4, NULL, '277', 'Rajshahi-medical-college', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(681, 4, NULL, '277', 'Rajshahi-railway-station', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(682, 4, NULL, '277', 'Hetemkha', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(683, 4, NULL, '277', 'Postal-complex', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(684, 4, NULL, '277', 'Rajshahi-police-line', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(685, 4, NULL, '277', 'Shaheb-bazar', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(686, 4, NULL, '277', 'Ghoramara', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(687, 4, NULL, '277', 'Tanor', 'Active', '2020-04-28 15:25:51', '2020-04-28 15:25:51'),
(688, 4, NULL, '278', 'Godagari', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(689, 4, NULL, '278', 'Baghmara', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(690, 4, NULL, '278', 'Tanore', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(691, 4, NULL, '278', 'Mohanpur', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(692, 4, NULL, '278', 'Paba', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(693, 4, NULL, '278', 'Puthia', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(694, 4, NULL, '278', 'Durgapur', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(695, 4, NULL, '278', 'Charghat', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(696, 4, NULL, '278', 'Bagha', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(697, 4, NULL, '278', 'Lalitganj', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(698, 4, NULL, '278', 'Bhabaniganj', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(699, 4, NULL, '278', 'Sonatola', 'Active', '2020-04-28 15:25:57', '2020-04-28 15:25:57'),
(700, 4, NULL, '279', 'Gazipur-sadar', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(701, 4, NULL, '279', 'Kapasia', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(702, 4, NULL, '279', 'Kaliakair', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(703, 4, NULL, '279', 'Sreepur', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(704, 4, NULL, '279', 'Kaliganj', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(705, 4, NULL, '279', 'Monnunagar', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(706, 4, NULL, '279', 'B.o.f', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(707, 4, NULL, '279', 'Ershad-nagar', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(708, 4, NULL, '279', 'Tepirbari', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(709, 4, NULL, '279', 'Tongi', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(710, 4, NULL, '279', 'Duet-sub-post-office', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(711, 4, NULL, '279', 'Kasamkotton', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(712, 4, NULL, '279', 'Rajendrapur', 'Active', '2020-04-28 15:26:24', '2020-04-28 15:26:24'),
(713, 4, NULL, '280', 'Comilla-adarsha-sadar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(714, 4, NULL, '280', 'Muradnagar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(715, 4, NULL, '280', 'Chandina', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(716, 4, NULL, '280', 'Lalmai', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(717, 4, NULL, '280', 'Daudkandi', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(718, 4, NULL, '280', 'Barura', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(719, 4, NULL, '280', 'Nangalkot', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(720, 4, NULL, '280', 'Chauddagram', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(721, 4, NULL, '280', 'Burichang', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(722, 4, NULL, '280', 'Homna', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(723, 4, NULL, '280', 'Brahman-para', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(724, 4, NULL, '280', 'Manoharganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(725, 4, NULL, '280', 'Titas', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(726, 4, NULL, '280', 'Laksam', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(727, 4, NULL, '280', 'Meghna', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(728, 4, NULL, '280', 'Cantonment', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(729, 4, NULL, '280', 'Halima-nagar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(730, 4, NULL, '280', 'Courtbari', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(731, 4, NULL, '280', 'Suaganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(732, 4, NULL, '280', 'Debidwar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(733, 4, NULL, '280', 'Gangamandal', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(734, 4, NULL, '281', 'Rangpur-sadar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(735, 4, NULL, '281', 'Pirganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(736, 4, NULL, '281', 'Mitha-pukur', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(737, 4, NULL, '281', 'Pirgachha', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(738, 4, NULL, '281', 'Badarganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(739, 4, NULL, '281', 'Kaunia', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(740, 4, NULL, '281', 'Gangachara', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(741, 4, NULL, '281', 'Taraganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(742, 4, NULL, '282', 'Narayanganj-sadar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(743, 4, NULL, '282', 'Sonargaon', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(744, 4, NULL, '282', 'Rupganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(745, 4, NULL, '282', 'Fatulla', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(746, 4, NULL, '282', 'Siddhirganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(747, 4, NULL, '282', 'Araihazar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(748, 4, NULL, '282', 'Bandar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(749, 4, NULL, '282', 'Madanganj', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(750, 4, NULL, '282', 'Fatulla-bazar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(751, 4, NULL, '282', 'Baidder-bazar', 'Active', '2020-04-28 15:26:25', '2020-04-28 15:26:25'),
(752, 4, NULL, '283', 'Jessore-sadar', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(753, 4, NULL, '283', 'Manirampur', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(754, 4, NULL, '283', 'Bagharpara', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(755, 4, NULL, '283', 'Jhikargachha', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(756, 4, NULL, '283', 'Keshabpur', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(757, 4, NULL, '283', 'Chaugachha', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(758, 4, NULL, '283', 'Sharsha', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(759, 4, NULL, '283', 'Abhaynagar', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(760, 4, NULL, '283', 'Jessore-upa-shahar', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(761, 4, NULL, '283', 'Chanchra', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(762, 4, NULL, '283', 'Jessore-cantonment', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(763, 4, NULL, '283', 'Jessore-airbach', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(764, 4, NULL, '283', 'Noapara', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(765, 4, NULL, '284', 'Bogra-sadar', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(766, 4, NULL, '284', 'Nandigram', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(767, 4, NULL, '284', 'Shibganj', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(768, 4, NULL, '284', 'Sherpur', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(769, 4, NULL, '284', 'Kahaloo', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(770, 4, NULL, '284', 'Dhupchanchia', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(771, 4, NULL, '284', 'Adamdighi', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(772, 4, NULL, '284', 'Gabtali', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(773, 4, NULL, '284', 'Sonatola', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(774, 4, NULL, '284', 'Dhunat', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(775, 4, NULL, '284', 'Sariakandi', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(776, 4, NULL, '284', 'Shajahanpur', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(777, 4, NULL, '285', 'Barishal-sadar', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(778, 4, NULL, '285', 'Gournadi', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(779, 4, NULL, '285', 'Bakerganj', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(780, 4, NULL, '285', 'Wazirpur', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(781, 4, NULL, '285', 'Agailjhara', 'Active', '2020-04-28 15:26:26', '2020-04-28 15:26:26'),
(782, 4, NULL, '285', 'Mehendiganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(783, 4, NULL, '285', 'Babuganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(784, 4, NULL, '285', 'Muladi', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(785, 4, NULL, '285', 'Kashipur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(786, 4, NULL, '285', 'Jaguarhat', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(787, 4, NULL, '285', 'Barajalia', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(788, 4, NULL, '285', 'Sahebganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(789, 4, NULL, '285', 'Banaripara', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(790, 4, NULL, '286', 'Dinajpur-sadar', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(791, 4, NULL, '286', 'Biral', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(792, 4, NULL, '286', 'Birampur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(793, 4, NULL, '286', 'Phulbari', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(794, 4, NULL, '286', 'Birganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(795, 4, NULL, '286', 'Parbatipur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(796, 4, NULL, '286', 'Kaharole', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(797, 4, NULL, '286', 'Bochaganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(798, 4, NULL, '286', 'Ghoraghat', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(799, 4, NULL, '286', 'Chirirbandar', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(800, 4, NULL, '286', 'Hakimpur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(801, 4, NULL, '286', 'Khansama', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(802, 4, NULL, '286', 'Bangla hili', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(803, 4, NULL, '286', 'Maharajganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(804, 4, NULL, '286', 'Nawabganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(805, 4, NULL, '286', 'Osmanpur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(806, 4, NULL, '286', 'Setabganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(807, 4, NULL, '287', 'Mymensingh-sadar', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(808, 4, NULL, '287', 'Phulpur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(809, 4, NULL, '287', 'Ishwarganj', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(810, 4, NULL, '287', 'Muktagachha', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(811, 4, NULL, '287', 'Gauripur', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(812, 4, NULL, '287', 'Gaffargaon', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(813, 4, NULL, '287', 'Nandail', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(814, 4, NULL, '287', 'Haluaghat', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(815, 4, NULL, '287', 'Fulbaria', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(816, 4, NULL, '287', 'Trishal', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(817, 4, NULL, '287', 'Bhaluka', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(818, 4, NULL, '287', 'Tara kanda', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(819, 4, NULL, '287', 'Dhobaura', 'Active', '2020-04-28 15:26:27', '2020-04-28 15:26:27'),
(820, 4, NULL, '288', 'Noakhali-sadar', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(821, 4, NULL, '288', 'Begumganj', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(822, 4, NULL, '288', 'Chatkhil', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(823, 4, NULL, '288', 'Senbagh', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(824, 4, NULL, '288', 'Companiganj', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(825, 4, NULL, '288', 'Maizdi', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(826, 4, NULL, '288', 'Sonaimuri', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(827, 4, NULL, '288', 'Kabirhat', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(828, 4, NULL, '288', 'Basur hat', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(829, 4, NULL, '288', 'Hatiya', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(830, 4, NULL, '288', 'Suborno-char', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(831, 4, NULL, '288', 'Chaprashir hat', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(832, 4, NULL, '289', 'Feni-sadar', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(833, 4, NULL, '289', 'Daganbhuiyan', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(834, 4, NULL, '289', 'Sonagazi', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(835, 4, NULL, '289', 'Chhagalnaiya', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(836, 4, NULL, '289', 'Fulgazi', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(837, 4, NULL, '289', 'Parshuram', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(838, 4, NULL, '290', 'Coxsbazar sadar', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(839, 4, NULL, '290', 'Ramu', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(840, 4, NULL, '290', 'Chakaria', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(841, 4, NULL, '290', 'Maheshkhali', 'Active', '2020-04-28 15:26:28', '2020-04-28 15:26:28'),
(842, 4, NULL, '290', 'Ukhia', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(843, 4, NULL, '290', 'Teknaf', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(844, 4, NULL, '290', 'Pekua', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(845, 4, NULL, '290', 'Kutubdia', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(846, 4, NULL, '290', 'Gorakghat', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(847, 4, NULL, '290', 'Chiringga', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(848, 4, NULL, '291', 'Maulvibazar-sadar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(849, 4, NULL, '291', 'Barlekha', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(850, 4, NULL, '291', 'Kulaura', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(851, 4, NULL, '291', 'Rajnagar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(852, 4, NULL, '291', 'Kamalganj', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(853, 4, NULL, '291', 'Sreemangal', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(854, 4, NULL, '291', 'Juri', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(855, 4, NULL, '292', 'Brahmanbaria-sadar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(856, 4, NULL, '292', 'Nabinagar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(857, 4, NULL, '292', 'Nasirnagar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(858, 4, NULL, '292', 'Akhaura', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(859, 4, NULL, '292', 'Kasba', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(860, 4, NULL, '292', 'Banchharampur', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(861, 4, NULL, '292', 'Sarail', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(862, 4, NULL, '292', 'Bijoynagar', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(863, 4, NULL, '292', 'Kuti', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(864, 4, NULL, '292', 'Ashuganj', 'Active', '2020-04-28 15:26:29', '2020-04-28 15:26:29'),
(865, 4, NULL, '293', 'Tangail-sadar', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(866, 4, NULL, '293', 'Ghatail', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(867, 4, NULL, '293', 'Kalihati', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(868, 4, NULL, '293', 'Madhupur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(869, 4, NULL, '293', 'Mirzapur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(870, 4, NULL, '293', 'Nagarpur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(871, 4, NULL, '293', 'Gopalpur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(872, 4, NULL, '293', 'Delduar', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(873, 4, NULL, '293', 'Basail', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(874, 4, NULL, '293', 'Bhuapur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(875, 4, NULL, '293', 'Sakhipur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(876, 4, NULL, '293', 'Dhanbari', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(877, 4, NULL, '293', 'Kashkawlia', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(878, 4, NULL, '293', 'Pakutia', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(879, 4, NULL, '293', 'Chauhali', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(880, 4, NULL, '294', 'Kushtia-sadar', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(881, 4, NULL, '294', 'Bheramara', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(882, 4, NULL, '294', 'Kumarkhali', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(883, 4, NULL, '294', 'Daulatpur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(884, 4, NULL, '294', 'Mirpur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(885, 4, NULL, '294', 'Ganges bheramara', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(886, 4, NULL, '294', 'Janipur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(887, 4, NULL, '294', 'Rafayetpur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(888, 4, NULL, '294', 'Khoksa', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(889, 4, NULL, '295', 'Habiganj-sadar', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(890, 4, NULL, '295', 'Chunarughat', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(891, 4, NULL, '295', 'Baniachong', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(892, 4, NULL, '295', 'Nabiganj', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(893, 4, NULL, '295', 'Madhabpur', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(894, 4, NULL, '295', 'Bahubal', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(895, 4, NULL, '295', 'Ajmiriganj', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(896, 4, NULL, '295', 'Kalauk', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(897, 4, NULL, '295', 'Shaestaganj', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(898, 4, NULL, '295', 'Lakhai', 'Active', '2020-04-28 15:26:30', '2020-04-28 15:26:30'),
(899, 4, NULL, '296', 'Pabna-sadar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(900, 4, NULL, '296', 'Santhia', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(901, 4, NULL, '296', 'Chatmohar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(902, 4, NULL, '296', 'Sujanagar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(903, 4, NULL, '296', 'Atghoria', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(904, 4, NULL, '296', 'Ishwardi', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(905, 4, NULL, '296', 'Bhangura', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(906, 4, NULL, '296', 'Bera', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(907, 4, NULL, '296', 'Faridpur', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(908, 4, NULL, '296', 'Banwarinagar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(909, 4, NULL, '296', 'Debottar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(910, 4, NULL, '296', 'Ataikola', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(911, 4, NULL, '297', 'Chandpur-sadar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(912, 4, NULL, '297', 'Kachua', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(913, 4, NULL, '297', 'Shahrasti', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(914, 4, NULL, '297', 'Matlab-dakshin', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(915, 4, NULL, '297', 'Faridganj', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(916, 4, NULL, '297', 'Hajiganj', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(917, 4, NULL, '297', 'Haim-char', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(918, 4, NULL, '297', 'Matlab-uttar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(919, 4, NULL, '297', 'Matlobganj', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(920, 4, NULL, '298', 'Naogaon-sadar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(921, 4, NULL, '298', 'Niamatpur', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(922, 4, NULL, '298', 'Patnitala', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(923, 4, NULL, '298', 'Mahadebpur', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(924, 4, NULL, '298', 'Badalgachhi', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(925, 4, NULL, '298', 'Raninagar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(926, 4, NULL, '298', 'Atrai', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(927, 4, NULL, '298', 'Sapahar', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(928, 4, NULL, '298', 'Ahsanganj', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(929, 4, NULL, '298', 'Dhamoirhat', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(930, 4, NULL, '298', 'Nitpur', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(931, 4, NULL, '298', 'Prasadpur', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(932, 4, NULL, '298', 'Manda', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(933, 4, NULL, '298', 'Porsha', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(934, 4, NULL, '298', 'Baraigram', 'Active', '2020-04-28 15:26:31', '2020-04-28 15:26:31'),
(935, 4, NULL, '299', 'Sirajganj-sadar', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(936, 4, NULL, '299', 'Ullah-para', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(937, 4, NULL, '299', 'Royganj', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(938, 4, NULL, '299', 'Shahjadpur', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(939, 4, NULL, '299', 'Kamarkhanda', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(940, 4, NULL, '299', 'Belkuchi', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(941, 4, NULL, '299', 'Kazipur', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(942, 4, NULL, '299', 'Tarash', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(943, 4, NULL, '299', 'Salonga', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(944, 4, NULL, '299', 'Chauhali', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(945, 4, NULL, '299', 'Baiddya jam toil', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(946, 4, NULL, '299', 'Dhangora', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(947, 4, NULL, '300', 'Satkhira-sadar', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(948, 4, NULL, '300', 'Kaliganj', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(949, 4, NULL, '300', 'Tala', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(950, 4, NULL, '300', 'Kalaroa', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(951, 4, NULL, '300', 'Shyamnagar', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(952, 4, NULL, '300', 'Assasuni', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(953, 4, NULL, '300', 'Debhata', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(954, 4, NULL, '300', 'Nakipur', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(955, 4, NULL, '301', 'Faridpur-sadar', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(956, 4, NULL, '301', 'Nagarkanda', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(957, 4, NULL, '301', 'Boalmari', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(958, 4, NULL, '301', 'Bhanga', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(959, 4, NULL, '301', 'Madhukhali', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(960, 4, NULL, '301', 'Alfadanga', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(961, 4, NULL, '301', 'Sadarpur', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(962, 4, NULL, '301', 'Char-bhadrasan', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(963, 4, NULL, '301', 'Saltha', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(964, 4, NULL, '301', 'Shriangan', 'Active', '2020-04-28 15:26:32', '2020-04-28 15:26:32'),
(965, 4, NULL, '302', 'Jamalpur-sadar', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(966, 4, NULL, '302', 'Melandaha', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(967, 4, NULL, '302', 'Madarganj', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(968, 4, NULL, '302', 'Sarishabari', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(969, 4, NULL, '302', 'Islampur', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(970, 4, NULL, '302', 'Bakshiganj', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(971, 4, NULL, '302', 'Dewanganj', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(972, 4, NULL, '303', 'Thakurgaon-sadar', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(973, 4, NULL, '303', 'Pirganj', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(974, 4, NULL, '303', 'Ranisankail', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(975, 4, NULL, '303', 'Baliadangi', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(976, 4, NULL, '303', 'Haripur', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(977, 4, NULL, '303', 'Jibanpur', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(978, 4, NULL, '304', 'Narsingdi-sadar', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(979, 4, NULL, '304', 'Manohardi', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(980, 4, NULL, '304', 'Shibpur', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(981, 4, NULL, '304', 'Raipura', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(982, 4, NULL, '304', 'Palash', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(983, 4, NULL, '304', 'Belabo', 'Active', '2020-04-28 15:26:33', '2020-04-28 15:26:33'),
(984, 4, NULL, '305', 'Kishoreganj-sadar', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(985, 4, NULL, '305', 'Bajitpur', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(986, 4, NULL, '305', 'Tarail', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(987, 4, NULL, '305', 'Pakundia', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(988, 4, NULL, '305', 'Karimganj', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(989, 4, NULL, '305', 'Itna', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(990, 4, NULL, '305', 'Katiadi', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(991, 4, NULL, '305', 'Hossainpur', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(992, 4, NULL, '305', 'Mithamain', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(993, 4, NULL, '305', 'Kuliar-char', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(994, 4, NULL, '305', 'Nikli', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(995, 4, NULL, '305', 'Austagram', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(996, 4, NULL, '305', 'Bhairab', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(997, 4, NULL, '306', 'Lakshmipur-sadar', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(998, 4, NULL, '306', 'Ramganj', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(999, 4, NULL, '306', 'Raipur', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1000, 4, NULL, '306', 'Ramgati', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1001, 4, NULL, '306', 'Char alexgander', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1002, 4, NULL, '307', 'Chapai-nababganj-sadar', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1003, 4, NULL, '307', 'Nachole', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1004, 4, NULL, '307', 'Shibganj u.p.o', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1005, 4, NULL, '307', 'Bholahat', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1006, 4, NULL, '307', 'Rohanpur', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1007, 4, NULL, '307', 'Gomostapur', 'Active', '2020-04-28 15:26:34', '2020-04-28 15:26:34'),
(1008, 4, NULL, '308', 'Sunamganj-sadar', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1009, 4, NULL, '308', 'Chhatak', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1010, 4, NULL, '308', 'Jagannathpur', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1011, 4, NULL, '308', 'Dharampasha', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1012, 4, NULL, '308', 'Derai', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1013, 4, NULL, '308', 'Dowarabazar', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1014, 4, NULL, '308', 'Tahirpur', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1015, 4, NULL, '308', 'Jamalganj', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1016, 4, NULL, '308', 'Sullah', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1017, 4, NULL, '308', 'Bishwambarpur', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1018, 4, NULL, '308', 'Dakshin-sunamganj', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1019, 4, NULL, '308', 'Sachna', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1020, 4, NULL, '308', 'Ghungiar', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1021, 4, NULL, '309', 'Nilphamari-sadar', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1022, 4, NULL, '309', 'Jaldhaka', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1023, 4, NULL, '309', 'Domar', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1024, 4, NULL, '309', 'Dimla', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1025, 4, NULL, '309', 'Saidpur', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1026, 4, NULL, '309', 'Kishoreganj', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1027, 4, NULL, '310', 'Bagerhat-sadar', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1028, 4, NULL, '310', 'Rampal', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1029, 4, NULL, '310', 'Morrelganj', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1030, 4, NULL, '310', 'Kachua', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1031, 4, NULL, '310', 'Fakirhat', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1032, 4, NULL, '310', 'Chitalmari', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1033, 4, NULL, '310', 'Mollahat', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1034, 4, NULL, '310', 'Mongla', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1035, 4, NULL, '310', 'Sarankhola', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1036, 4, NULL, '310', 'Chalna anchorage', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1037, 4, NULL, '310', 'Rayenda', 'Active', '2020-04-28 15:26:35', '2020-04-28 15:26:35'),
(1038, 4, NULL, '311', 'Jhenaidah-sadar', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1039, 4, NULL, '311', 'Kaliganj', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1040, 4, NULL, '311', 'Shailkupa', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1041, 4, NULL, '311', 'Maheshpur', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1042, 4, NULL, '311', 'Kotchandpur', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1043, 4, NULL, '311', 'Harinakunda', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1044, 4, NULL, '311', 'Naldanga', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1045, 4, NULL, '312', 'Meherpur-sadar', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1046, 4, NULL, '312', 'Gangni', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1047, 4, NULL, '312', 'Mujib-nagar', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1048, 4, NULL, '313', 'Lalmonirhat-sadar', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1049, 4, NULL, '313', 'Patgram', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1050, 4, NULL, '313', 'Hatibandha', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1051, 4, NULL, '313', 'Aditmari', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1052, 4, NULL, '313', 'Kaliganj', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1053, 4, NULL, '313', 'Tushbhandar', 'Active', '2020-04-28 15:26:36', '2020-04-28 15:26:36'),
(1054, 4, NULL, '314', 'Gopalganj-sadar', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1055, 4, NULL, '314', 'Muksudpur', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1056, 4, NULL, '314', 'Kashiani', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1057, 4, NULL, '314', 'Kotalipara', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1058, 4, NULL, '314', 'Tungipara', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1059, 4, NULL, '315', 'Sherpur-sadar', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1060, 4, NULL, '315', 'Nalitabari', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1061, 4, NULL, '315', 'Nakla', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1062, 4, NULL, '315', 'Sreebardi', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1063, 4, NULL, '315', 'Jhenaigati', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1064, 4, NULL, '315', 'Bakshigonj', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1065, 4, NULL, '315', 'Jamuna fertilizer factory', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1066, 4, NULL, '316', 'Natore-sadar', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1067, 4, NULL, '316', 'Singra', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1068, 4, NULL, '316', 'Lalpur', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1069, 4, NULL, '316', 'Gurudaspur', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1070, 4, NULL, '316', 'Bagatipara', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1071, 4, NULL, '316', 'Naldanga', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1072, 4, NULL, '316', 'Gopalpur upo', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1073, 4, NULL, '316', 'Harua', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1074, 4, NULL, '316', 'Laxman', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1075, 4, NULL, '316', 'Baraigram', 'Active', '2020-04-28 15:26:37', '2020-04-28 15:26:37'),
(1076, 4, NULL, '317', 'Patuakhali-sadar', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1077, 4, NULL, '317', 'Bauphal', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1078, 4, NULL, '317', 'Galachipa', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1079, 4, NULL, '317', 'Mirzaganj', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1080, 4, NULL, '317', 'Dashmina', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1081, 4, NULL, '317', 'Kalapara', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1082, 4, NULL, '317', 'Rangabali', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1083, 4, NULL, '317', 'Khepupara', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1084, 4, NULL, '317', 'Dumki', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1085, 4, NULL, '318', 'Khagrachhari sadar', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1086, 4, NULL, '318', 'Matiranga', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1087, 4, NULL, '318', 'Dighinala', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1088, 4, NULL, '318', 'Lakshmichhari', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1089, 4, NULL, '318', 'Ramgarh', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1090, 4, NULL, '318', 'Mahalchhari', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1091, 4, NULL, '318', 'Manikchhari', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1092, 4, NULL, '318', 'Panchhari', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1093, 4, NULL, '319', 'Munshiganj-sadar', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1094, 4, NULL, '319', 'Serajdikhan', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1095, 4, NULL, '319', 'Sreenagar', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1096, 4, NULL, '319', 'Tongibari', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1097, 4, NULL, '319', 'Lohajang', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1098, 4, NULL, '319', 'Gazaria', 'Active', '2020-04-28 15:26:38', '2020-04-28 15:26:38'),
(1099, 4, NULL, '320', 'Kurigram-sadar', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1100, 4, NULL, '320', 'Phulbari', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1101, 4, NULL, '320', 'Ulipur', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1102, 4, NULL, '320', 'Rajarhat', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39');
INSERT INTO `zones` (`id`, `courier_id`, `zoneId`, `city_id`, `zoneName`, `status`, `created_at`, `updated_at`) VALUES
(1103, 4, NULL, '320', 'Bhurungamari', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1104, 4, NULL, '320', 'Nageshwari', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1105, 4, NULL, '320', 'Raumari', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1106, 4, NULL, '320', 'Chilmari', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1107, 4, NULL, '320', 'Char-rajibpur', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1108, 4, NULL, '321', 'Madaripur-sadar', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1109, 4, NULL, '321', 'Rajoir', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1110, 4, NULL, '321', 'Shibchar', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1111, 4, NULL, '321', 'Kalkini', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1112, 4, NULL, '321', 'Barhamganj', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1113, 4, NULL, '322', 'Chuadanga-sadar', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1114, 4, NULL, '322', 'Alamdanga', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1115, 4, NULL, '322', 'Jiban-nagar', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1116, 4, NULL, '322', 'Damurhuda', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1117, 4, NULL, '322', 'Doulatganj', 'Active', '2020-04-28 15:26:39', '2020-04-28 15:26:39'),
(1118, 4, NULL, '323', 'Rangamati-sadar', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1119, 4, NULL, '323', 'Langadu', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1120, 4, NULL, '323', 'Naniarchar', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1121, 4, NULL, '323', 'Baghaichhari', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1122, 4, NULL, '323', 'Barkal', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1123, 4, NULL, '323', 'Jurai-chhari', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1124, 4, NULL, '323', 'Kawkhali', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1125, 4, NULL, '323', 'Rajasthali', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1126, 4, NULL, '323', 'Belai-chhari', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1127, 4, NULL, '323', 'Kaptai', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1128, 4, NULL, '323', 'Kalampati', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1129, 4, NULL, '323', 'Marishya', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1130, 4, NULL, '324', 'Netrokona-sadar', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1131, 4, NULL, '324', 'Kendua', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1132, 4, NULL, '324', 'Purbadhala', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1133, 4, NULL, '324', 'Kalmakanda', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1134, 4, NULL, '324', 'Atpara', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1135, 4, NULL, '324', 'Barhatta', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1136, 4, NULL, '324', 'Durgapur', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1137, 4, NULL, '324', 'Mohanganj', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1138, 4, NULL, '324', 'Khaliajuri', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1139, 4, NULL, '324', 'Dharmapasha', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1140, 4, NULL, '324', 'Dhobaura', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1141, 4, NULL, '324', 'Madan', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1142, 4, NULL, '324', 'Moddhynagar', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1143, 4, NULL, '325', 'Pirojpur-sadar', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1144, 4, NULL, '325', 'Nazirpur', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1145, 4, NULL, '325', 'Mathbaria', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1146, 4, NULL, '325', 'Kawkhali', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1147, 4, NULL, '325', 'Nesarabad (swarupkati)', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1148, 4, NULL, '325', 'Indurkani', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1149, 4, NULL, '325', 'Bhandaria', 'Active', '2020-04-28 15:26:40', '2020-04-28 15:26:40'),
(1150, 4, NULL, '326', 'Magura-sadar', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1151, 4, NULL, '326', 'Shalikha', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1152, 4, NULL, '326', 'Mohammadpur', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1153, 4, NULL, '326', 'Sreepur', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1154, 4, NULL, '326', 'Arpara', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1155, 4, NULL, '327', 'Gaibandha-sadar', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1156, 4, NULL, '327', 'Gobindaganj', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1157, 4, NULL, '327', 'Sadullapur', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1158, 4, NULL, '327', 'Palashbari', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1159, 4, NULL, '327', 'Saghata', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1160, 4, NULL, '327', 'Sundarganj', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1161, 4, NULL, '327', 'Fulchhari', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1162, 4, NULL, '327', 'Bonarpara', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1163, 4, NULL, '328', 'Panchagarh-sadar', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1164, 4, NULL, '328', 'Boda', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1165, 4, NULL, '328', 'Debiganj', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1166, 4, NULL, '328', 'Atwari', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1167, 4, NULL, '328', 'Tentulia', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1168, 4, NULL, '328', 'Chotto-dab', 'Active', '2020-04-28 15:26:41', '2020-04-28 15:26:41'),
(1169, 4, NULL, '329', 'Manikganj-sadar', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1170, 4, NULL, '329', 'Ghior', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1171, 4, NULL, '329', 'Saturia', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1172, 4, NULL, '329', 'Shibalaya', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1173, 4, NULL, '329', 'Harirampur', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1174, 4, NULL, '329', 'Daulatpur', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1175, 4, NULL, '329', 'Singair', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1176, 4, NULL, '329', 'Lechhraganj', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1177, 4, NULL, '330', 'Jhalokathi-sadar', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1178, 4, NULL, '330', 'Rajapur', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1179, 4, NULL, '330', 'Nalchiti', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1180, 4, NULL, '330', 'Kathalia', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1181, 4, NULL, '331', 'Narail-sadar', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1182, 4, NULL, '331', 'Lohagara', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1183, 4, NULL, '331', 'Naragati', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1184, 4, NULL, '331', 'Kalia', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1185, 4, NULL, '331', 'Laxmipasha', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1186, 4, NULL, '331', 'Mohajan', 'Active', '2020-04-28 15:26:42', '2020-04-28 15:26:42'),
(1187, 4, NULL, '332', 'Joypurhat-sadar', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1188, 4, NULL, '332', 'Panchbibi', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1189, 4, NULL, '332', 'Akkelpur', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1190, 4, NULL, '332', 'Kalai', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1191, 4, NULL, '332', 'Khetlal', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1192, 4, NULL, '333', 'Rajbari-sadar', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1193, 4, NULL, '333', 'Pangsha', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1194, 4, NULL, '333', 'Baliakandi', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1195, 4, NULL, '333', 'Goalandaghat', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1196, 4, NULL, '333', 'Kalukhali', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1197, 4, NULL, '334', 'Shariatpur-sadar', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1198, 4, NULL, '334', 'Naria', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1199, 4, NULL, '334', 'Zanjira', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1200, 4, NULL, '334', 'Gosairhat', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1201, 4, NULL, '334', 'Bhedarganj', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1202, 4, NULL, '334', 'Damudya', 'Active', '2020-04-28 15:26:43', '2020-04-28 15:26:43'),
(1203, 4, NULL, '335', 'Bandarban-sadar', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1204, 4, NULL, '335', 'Naikhongchhari', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1205, 4, NULL, '335', 'Lama', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1206, 4, NULL, '335', 'Ruma', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1207, 4, NULL, '335', 'Thanchi', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1208, 4, NULL, '335', 'Alikadam', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1209, 4, NULL, '335', 'Roanchhari', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1210, 4, NULL, '336', 'Bhola-sadar', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1211, 4, NULL, '336', 'Charfasson', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1212, 4, NULL, '336', 'Lalmohan-upo', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1213, 4, NULL, '336', 'Tazumuddin', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1214, 4, NULL, '336', 'Borhanuddin-upo', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1215, 4, NULL, '336', 'Daulat-khan', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1216, 4, NULL, '336', 'Hajirhat', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1217, 4, NULL, '336', 'Hatshoshiganj', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1218, 4, NULL, '336', 'Manpura', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1219, 4, NULL, '337', 'Barguna-sadar', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1220, 4, NULL, '337', 'Betagi', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1221, 4, NULL, '337', 'Amtali', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1222, 4, NULL, '337', 'Taltali', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1223, 4, NULL, '337', 'Bamna', 'Active', '2020-04-28 15:26:44', '2020-04-28 15:26:44'),
(1334, 3, NULL, '632', 'Amtali', 'Active', '2022-02-23 09:51:10', '2022-02-23 09:51:10'),
(1335, 3, NULL, '632', 'Bamna', 'Active', '2022-02-23 09:51:29', '2022-02-23 09:51:29'),
(1336, 3, NULL, '632', 'Barguna-Sadar', 'Active', '2022-02-23 09:51:51', '2022-02-23 09:51:51'),
(1337, 3, NULL, '627', 'Betagi', 'Active', '2022-02-23 09:52:04', '2022-02-23 09:52:04'),
(1338, 3, NULL, '627', 'Patharghata', 'Active', '2022-02-23 09:52:14', '2022-02-23 09:52:14'),
(1339, 3, NULL, '627', 'Taltali', 'Active', '2022-02-23 09:52:26', '2022-02-23 09:52:26'),
(1340, 3, NULL, '627', 'Agailjhara', 'Active', '2022-02-23 09:52:42', '2022-02-23 09:52:42'),
(1341, 3, NULL, '627', 'Babuganj', 'Active', '2022-02-23 09:52:50', '2022-02-23 09:52:50'),
(1342, 3, NULL, '627', 'Bakerganj', 'Active', '2022-02-23 09:53:00', '2022-02-23 09:53:00'),
(1343, 3, NULL, '627', 'Banaripara', 'Active', '2022-02-23 09:53:11', '2022-02-23 09:53:11'),
(1344, 3, NULL, '627', 'Barishal-Sadar', 'Active', '2022-02-23 09:53:35', '2022-02-23 09:53:35'),
(1345, 3, NULL, '627', 'Gouranadi', 'Active', '2022-02-23 09:53:49', '2022-02-23 09:53:49'),
(1346, 3, NULL, '627', 'Hizla', 'Active', '2022-02-23 09:53:59', '2022-02-23 09:53:59'),
(1347, 3, NULL, '627', 'Mehendiganj', 'Active', '2022-02-23 09:54:10', '2022-02-23 09:54:10'),
(1348, 3, NULL, '627', 'Muladi', 'Active', '2022-02-23 09:54:20', '2022-02-23 09:54:20'),
(1349, 3, NULL, '627', 'Uzirpur', 'Active', '2022-02-23 09:54:30', '2022-02-23 09:54:30'),
(1350, 3, NULL, '631', 'Bhola-Sadar', 'Active', '2022-02-23 09:56:40', '2022-02-23 09:56:40'),
(1351, 3, NULL, '631', 'Borhanuddin', 'Active', '2022-02-23 09:56:55', '2022-02-23 09:56:55'),
(1352, 3, NULL, '631', 'Charfassion', 'Active', '2022-02-23 09:57:04', '2022-02-23 09:57:04'),
(1353, 3, NULL, '631', 'Daulatkhan', 'Active', '2022-02-23 09:57:16', '2022-02-23 09:57:16'),
(1354, 3, NULL, '631', 'Lalmohan', 'Active', '2022-02-23 09:57:28', '2022-02-23 09:57:28'),
(1355, 3, NULL, '631', 'Monpura', 'Active', '2022-02-23 09:57:37', '2022-02-23 09:57:37'),
(1356, 3, NULL, '631', 'Tazumuddin', 'Active', '2022-02-23 09:57:47', '2022-02-23 09:57:47'),
(1357, 3, NULL, '692', 'Jhalokathi-Sadar', 'Active', '2022-02-23 10:00:23', '2022-02-23 10:00:23'),
(1358, 3, NULL, '692', 'Kathalia', 'Active', '2022-02-23 10:01:15', '2022-02-23 10:01:15'),
(1359, 3, NULL, '692', 'Nalchity', 'Active', '2022-02-23 10:01:31', '2022-02-23 10:21:03'),
(1360, 3, NULL, '692', 'Rajapur', 'Active', '2022-02-23 10:22:37', '2022-02-23 10:22:37'),
(1361, 3, NULL, '630', 'Bauphal', 'Active', '2022-02-23 10:23:46', '2022-02-23 10:23:46'),
(1362, 3, NULL, '630', 'Dashmina', 'Active', '2022-02-23 10:24:19', '2022-02-23 10:24:19'),
(1363, 3, NULL, '656', 'Goshairhat', 'Active', '2022-02-23 10:24:36', '2022-02-23 10:24:36'),
(1364, 3, NULL, '656', 'Damuddya', 'Active', '2022-02-23 10:24:56', '2022-02-23 10:24:56'),
(1365, 3, NULL, '630', 'Dumki', 'Active', '2022-02-23 10:25:02', '2022-02-23 10:25:02'),
(1366, 3, NULL, '656', 'Janjira', 'Active', '2022-02-23 10:25:12', '2022-02-23 10:25:12'),
(1367, 3, NULL, '630', 'Galachipa', 'Active', '2022-02-23 10:25:20', '2022-02-23 10:25:20'),
(1368, 3, NULL, '656', 'Naria', 'Active', '2022-02-23 10:25:22', '2022-02-23 10:25:22'),
(1369, 3, NULL, '656', 'Shariatpur-Sadar', 'Active', '2022-02-23 10:25:36', '2022-02-23 10:25:36'),
(1370, 3, NULL, '630', 'Kalapara', 'Active', '2022-02-23 10:25:37', '2022-02-23 10:25:37'),
(1371, 3, NULL, '657', 'Basail', 'Active', '2022-02-23 10:25:48', '2022-02-23 10:25:48'),
(1372, 3, NULL, '630', 'Mirjaganj', 'Active', '2022-02-23 10:25:58', '2022-02-23 10:25:58'),
(1373, 3, NULL, '657', 'Bhuapur', 'Active', '2022-02-23 10:25:59', '2022-02-23 10:25:59'),
(1374, 3, NULL, '657', 'Delduar', 'Active', '2022-02-23 10:26:10', '2022-02-23 10:26:10'),
(1375, 3, NULL, '657', 'Dhanbari', 'Active', '2022-02-23 10:26:21', '2022-02-23 10:26:21'),
(1376, 3, NULL, '657', 'Ghatail', 'Active', '2022-02-23 10:26:47', '2022-02-23 10:26:47'),
(1377, 3, NULL, '630', 'Patuakhali-S', 'Active', '2022-02-23 10:26:48', '2022-02-23 10:26:48'),
(1378, 3, NULL, '657', 'Gopalpur', 'Active', '2022-02-23 10:27:00', '2022-02-23 10:27:00'),
(1379, 3, NULL, '630', 'Rangabali', 'Active', '2022-02-23 10:27:05', '2022-02-23 10:27:05'),
(1380, 3, NULL, '657', 'Kalihati', 'Active', '2022-02-23 10:27:11', '2022-02-23 10:27:11'),
(1381, 3, NULL, '657', 'Madhupur', 'Active', '2022-02-23 10:27:21', '2022-02-23 10:27:21'),
(1382, 3, NULL, '657', 'Mirzapur', 'Active', '2022-02-23 10:27:31', '2022-02-23 10:27:31'),
(1383, 3, NULL, '657', 'Nagarpur', 'Active', '2022-02-23 10:27:40', '2022-02-23 10:27:40'),
(1384, 3, NULL, '657', 'Shakhipur', 'Active', '2022-02-23 10:27:50', '2022-02-23 10:27:50'),
(1385, 3, NULL, '629', 'Bhandaria', 'Active', '2022-02-23 10:27:56', '2022-02-23 10:27:56'),
(1386, 3, NULL, '657', 'Tangail-Sadar', 'Active', '2022-02-23 10:28:02', '2022-02-23 10:28:02'),
(1387, 3, NULL, '629', 'Kawkhali', 'Active', '2022-02-23 10:28:23', '2022-02-23 10:28:23'),
(1388, 3, NULL, '658', 'Bagerhat-Sadar', 'Active', '2022-02-23 10:28:37', '2022-02-23 10:28:37'),
(1389, 3, NULL, '629', 'Mothbaria', 'Active', '2022-02-23 10:28:46', '2022-02-23 10:28:46'),
(1390, 3, NULL, '658', 'Chitalmari', 'Active', '2022-02-23 10:28:58', '2022-02-23 10:28:58'),
(1391, 3, NULL, '629', 'Nazirpur', 'Active', '2022-02-23 10:29:07', '2022-02-23 10:29:07'),
(1392, 3, NULL, '658', 'Fakirhat', 'Active', '2022-02-23 10:29:20', '2022-02-23 10:29:20'),
(1393, 3, NULL, '629', 'Nesarabad', 'Active', '2022-02-23 10:29:26', '2022-02-23 10:29:26'),
(1394, 3, NULL, '629', 'Pirojpur-S', 'Active', '2022-02-23 10:29:49', '2022-02-23 10:29:49'),
(1395, 3, NULL, '629', 'Zianagar', 'Active', '2022-02-23 10:30:04', '2022-02-23 10:30:04'),
(1396, 3, NULL, '635', 'Akhaura', 'Active', '2022-02-23 10:30:34', '2022-02-23 10:30:34'),
(1397, 3, NULL, '635', 'Ashuganj', 'Active', '2022-02-23 10:30:54', '2022-02-23 10:30:54'),
(1398, 3, NULL, '635', 'B.Baria-S', 'Active', '2022-02-23 10:31:12', '2022-02-23 10:31:12'),
(1399, 3, NULL, '635', 'Bancharampur', 'Active', '2022-02-23 10:31:26', '2022-02-23 10:31:26'),
(1400, 3, NULL, '658', 'Kachua', 'Active', '2022-02-23 10:31:39', '2022-02-23 10:31:39'),
(1401, 3, NULL, '635', 'Bijoynagar', 'Active', '2022-02-23 10:31:41', '2022-02-23 10:31:41'),
(1402, 3, NULL, '635', 'Kasba', 'Active', '2022-02-23 10:31:55', '2022-02-23 10:31:55'),
(1403, 3, NULL, '658', 'Mollahat', 'Active', '2022-02-23 10:32:11', '2022-02-23 10:32:11'),
(1404, 3, NULL, '635', 'Nabinagar', 'Active', '2022-02-23 10:32:12', '2022-02-23 10:32:12'),
(1405, 3, NULL, '658', 'Mongla', 'Active', '2022-02-23 10:32:25', '2022-02-23 10:32:25'),
(1406, 3, NULL, '635', 'Nasirnagar', 'Active', '2022-02-23 10:32:28', '2022-02-23 10:32:28'),
(1407, 3, NULL, '658', 'Morrelganj', 'Active', '2022-02-23 10:32:37', '2022-02-23 10:32:37'),
(1408, 3, NULL, '658', 'Rampal', 'Active', '2022-02-23 10:32:46', '2022-02-23 10:32:46'),
(1409, 3, NULL, '635', 'Sarail', 'Active', '2022-02-23 10:32:47', '2022-02-23 10:32:47'),
(1410, 3, NULL, '658', 'Sharankhola', 'Active', '2022-02-23 10:32:57', '2022-02-23 10:32:57'),
(1411, 3, NULL, '634', 'Alikadam', 'Active', '2022-02-23 10:33:07', '2022-02-23 10:33:07'),
(1412, 3, NULL, '659', 'Alamdanga', 'Active', '2022-02-23 10:33:16', '2022-02-23 10:33:16'),
(1413, 3, NULL, '634', 'Bandarban-S', 'Active', '2022-02-23 10:33:24', '2022-02-23 10:33:24'),
(1414, 3, NULL, '659', 'Chuadanga-Sadar', 'Active', '2022-02-23 10:33:29', '2022-02-23 10:33:29'),
(1415, 3, NULL, '634', 'Lama', 'Active', '2022-02-23 10:33:37', '2022-02-23 10:33:37'),
(1416, 3, NULL, '659', 'Damurhuda', 'Active', '2022-02-23 10:33:38', '2022-02-23 10:33:38'),
(1417, 3, NULL, '634', 'Naikhyongchari', 'Active', '2022-02-23 10:33:51', '2022-02-23 10:33:51'),
(1418, 3, NULL, '634', 'Rowangchari', 'Active', '2022-02-23 10:34:02', '2022-02-23 10:34:02'),
(1419, 3, NULL, '659', 'Jibannagar', 'Active', '2022-02-23 10:34:03', '2022-02-23 10:34:03'),
(1420, 3, NULL, '660', 'Abhoynagar', 'Active', '2022-02-23 10:34:18', '2022-02-23 10:34:18'),
(1421, 3, NULL, '634', 'Ruma', 'Active', '2022-02-23 10:34:18', '2022-02-23 10:34:18'),
(1422, 3, NULL, '660', 'Bagherpara', 'Active', '2022-02-23 10:34:32', '2022-02-23 10:34:32'),
(1423, 3, NULL, '634', 'Thanchi', 'Active', '2022-02-23 10:34:36', '2022-02-23 10:34:36'),
(1424, 3, NULL, '660', 'Chowgacha', 'Active', '2022-02-23 10:34:44', '2022-02-23 10:34:44'),
(1425, 3, NULL, '660', 'Jashore-Sadar', 'Active', '2022-02-23 10:34:57', '2022-02-23 10:34:57'),
(1426, 3, NULL, '636', 'Chandpur-S', 'Active', '2022-02-23 10:34:59', '2022-02-23 10:34:59'),
(1427, 3, NULL, '660', 'Jhikargacha', 'Active', '2022-02-23 10:35:08', '2022-02-23 10:35:08'),
(1428, 3, NULL, '636', 'Faridganj', 'Active', '2022-02-23 10:35:13', '2022-02-23 10:35:13'),
(1429, 3, NULL, '660', 'Keshabpur', 'Active', '2022-02-23 10:35:16', '2022-02-23 10:35:16'),
(1430, 3, NULL, '660', 'Monirampur', 'Active', '2022-02-23 10:36:41', '2022-02-23 10:36:41'),
(1431, 3, NULL, '660', 'Sarsha', 'Active', '2022-02-23 10:36:57', '2022-02-23 10:36:57'),
(1432, 3, NULL, '636', 'Haimchar', 'Active', '2022-02-23 10:37:05', '2022-02-23 10:37:05'),
(1433, 3, NULL, '661', 'Harinakunda', 'Active', '2022-02-23 10:37:14', '2022-02-23 10:37:14'),
(1434, 3, NULL, '636', 'Haziganj', 'Active', '2022-02-23 10:37:25', '2022-02-23 10:37:25'),
(1435, 3, NULL, '661', 'Jhenaidah-Sadar', 'Active', '2022-02-23 10:37:25', '2022-02-23 10:37:34'),
(1436, 3, NULL, '636', 'Kachua', 'Active', '2022-02-23 10:37:44', '2022-02-23 10:37:44'),
(1437, 3, NULL, '636', 'Matlab (Dakshin)', 'Active', '2022-02-23 10:38:04', '2022-02-23 10:38:04'),
(1438, 3, NULL, '636', 'Matlab (Uttar)', 'Active', '2022-02-23 10:38:25', '2022-02-23 10:38:25'),
(1439, 3, NULL, '661', 'Kotchandpur', 'Active', '2022-02-23 10:38:31', '2022-02-23 10:38:31'),
(1440, 3, NULL, '661', 'Kaliganj', 'Active', '2022-02-23 10:38:40', '2022-02-23 10:38:40'),
(1441, 3, NULL, '636', 'Shahrasti', 'Active', '2022-02-23 10:38:43', '2022-02-23 10:38:43'),
(1442, 3, NULL, '661', 'Moheshpur', 'Active', '2022-02-23 10:39:05', '2022-02-23 10:39:05'),
(1443, 3, NULL, '637', 'Anwara', 'Active', '2022-02-23 10:39:08', '2022-02-23 10:39:08'),
(1444, 3, NULL, '661', 'Shailkupa', 'Active', '2022-02-23 10:39:15', '2022-02-23 10:39:15'),
(1445, 3, NULL, '637', 'Banskhali', 'Active', '2022-02-23 10:39:23', '2022-02-23 10:39:23'),
(1446, 3, NULL, '662', 'Batiaghata', 'Active', '2022-02-23 10:39:33', '2022-02-23 10:39:33'),
(1447, 3, NULL, '637', 'Boalkhali', 'Active', '2022-02-23 10:39:36', '2022-02-23 10:39:36'),
(1448, 3, NULL, '662', 'Dacope', 'Active', '2022-02-23 10:39:45', '2022-02-23 10:39:45'),
(1449, 3, NULL, '637', 'Chandanish', 'Active', '2022-02-23 10:39:52', '2022-02-23 10:39:52'),
(1450, 3, NULL, '662', 'Dighalia', 'Active', '2022-02-23 10:39:56', '2022-02-23 10:39:56'),
(1451, 3, NULL, '662', 'Dumuria', 'Active', '2022-02-23 10:41:15', '2022-02-23 10:41:15'),
(1452, 3, NULL, '662', 'Koira', 'Active', '2022-02-23 10:41:43', '2022-02-23 10:41:43'),
(1453, 3, NULL, '637', 'Fatikchari', 'Active', '2022-02-23 10:41:45', '2022-02-23 10:41:45'),
(1454, 3, NULL, '662', 'Paikgacha', 'Active', '2022-02-23 10:41:52', '2022-02-23 10:41:52'),
(1455, 3, NULL, '637', 'Hathazari', 'Active', '2022-02-23 10:42:00', '2022-02-23 10:42:00'),
(1456, 3, NULL, '662', 'Paikgacha', 'Active', '2022-02-23 10:42:03', '2022-02-23 10:42:03'),
(1457, 3, NULL, '662', 'Rupsa', 'Active', '2022-02-23 10:42:12', '2022-02-23 10:42:12'),
(1458, 3, NULL, '662', 'Terokhada', 'Active', '2022-02-23 10:42:21', '2022-02-23 10:42:32'),
(1459, 3, NULL, '637', 'Karnaphuli', 'Active', '2022-02-23 10:42:23', '2022-02-23 10:42:23'),
(1460, 3, NULL, '637', 'Lohagara', 'Active', '2022-02-23 10:42:39', '2022-02-23 10:42:39'),
(1461, 3, NULL, '663', 'Bheramara', 'Active', '2022-02-23 10:42:51', '2022-02-23 10:42:51'),
(1462, 3, NULL, '637', 'Mirsharai', 'Active', '2022-02-23 10:42:58', '2022-02-23 10:42:58'),
(1463, 3, NULL, '663', 'Daulatpur', 'Active', '2022-02-23 10:43:02', '2022-02-23 10:43:02'),
(1464, 3, NULL, '637', 'Patiya', 'Active', '2022-02-23 10:43:11', '2022-02-23 10:43:11'),
(1465, 3, NULL, '663', 'Khoksha', 'Active', '2022-02-23 10:43:15', '2022-02-23 10:43:15'),
(1466, 3, NULL, '637', 'Rangunia', 'Active', '2022-02-23 10:43:27', '2022-02-23 10:43:27'),
(1467, 3, NULL, '663', 'Kumarkhali', 'Active', '2022-02-23 10:43:35', '2022-02-23 10:43:35'),
(1468, 3, NULL, '637', 'Raojan', 'Active', '2022-02-23 10:43:46', '2022-02-23 10:43:46'),
(1469, 3, NULL, '663', 'Kushtia-Sadar', 'Active', '2022-02-23 10:43:50', '2022-02-23 10:43:50'),
(1470, 3, NULL, '637', 'Sandwip', 'Active', '2022-02-23 10:44:04', '2022-02-23 10:44:04'),
(1471, 3, NULL, '663', 'Mirpur', 'Active', '2022-02-23 10:44:18', '2022-02-23 10:44:18'),
(1472, 3, NULL, '637', 'Satkania', 'Active', '2022-02-23 10:44:23', '2022-02-23 10:44:23'),
(1473, 3, NULL, '664', 'Magura-Sadar', 'Active', '2022-02-23 10:44:32', '2022-02-23 10:44:32'),
(1474, 3, NULL, '637', 'Sitakunda', 'Active', '2022-02-23 10:44:38', '2022-02-23 10:44:38'),
(1475, 3, NULL, '664', 'Mohammadpur', 'Active', '2022-02-23 10:44:46', '2022-02-23 10:44:46'),
(1476, 3, NULL, '639', 'Chakoria', 'Active', '2022-02-23 10:44:55', '2022-02-23 10:44:55'),
(1477, 3, NULL, '664', 'Salikha', 'Active', '2022-02-23 10:44:56', '2022-02-23 10:44:56'),
(1478, 3, NULL, '664', 'Sreepur', 'Active', '2022-02-23 10:45:08', '2022-02-23 10:45:08'),
(1479, 3, NULL, '639', 'Cox\'S Bazar-S', 'Active', '2022-02-23 10:45:12', '2022-02-23 10:45:12'),
(1480, 3, NULL, '664', 'Gangni', 'Active', '2022-02-23 10:45:32', '2022-02-23 10:45:32'),
(1481, 3, NULL, '639', 'Kutubdia', 'Active', '2022-02-23 10:45:33', '2022-02-23 10:45:33'),
(1482, 3, NULL, '664', 'Meherpur-Sadar', 'Active', '2022-02-23 10:45:44', '2022-02-23 10:45:53'),
(1483, 3, NULL, '639', 'Moheskhali', 'Active', '2022-02-23 10:45:47', '2022-02-23 10:45:47'),
(1484, 3, NULL, '637', 'Pekua', 'Active', '2022-02-23 10:46:05', '2022-02-23 10:46:05'),
(1485, 3, NULL, '639', 'Pekua', 'Active', '2022-02-23 10:46:32', '2022-02-23 10:46:32'),
(1486, 3, NULL, '639', 'Ramu', 'Active', '2022-02-23 10:46:52', '2022-02-23 10:46:52'),
(1487, 3, NULL, '665', 'Mujib Nagar', 'Active', '2022-02-23 10:47:04', '2022-02-23 10:47:04'),
(1488, 3, NULL, '639', 'Teknaf', 'Active', '2022-02-23 10:47:07', '2022-02-23 10:47:07'),
(1489, 3, NULL, '666', 'Kalia', 'Active', '2022-02-23 10:47:18', '2022-02-23 10:47:18'),
(1490, 3, NULL, '666', 'Lohagara', 'Active', '2022-02-23 10:47:29', '2022-02-23 10:47:29'),
(1491, 3, NULL, '639', 'Ukhiya', 'Active', '2022-02-23 10:47:30', '2022-02-23 10:47:30'),
(1492, 3, NULL, '666', 'Narail-Sadar', 'Active', '2022-02-23 10:47:50', '2022-02-23 10:47:50'),
(1493, 3, NULL, '638', 'Barura', 'Active', '2022-02-23 10:47:57', '2022-02-23 10:47:57'),
(1494, 3, NULL, '638', 'Brahmanpara', 'Active', '2022-02-23 10:48:22', '2022-02-23 10:48:22'),
(1495, 3, NULL, '638', 'Burichong', 'Active', '2022-02-23 10:48:36', '2022-02-23 10:48:36'),
(1496, 3, NULL, '667', 'Assasuni', 'Active', '2022-02-23 10:48:49', '2022-02-23 10:48:49'),
(1497, 3, NULL, '638', 'Chandina', 'Active', '2022-02-23 10:48:49', '2022-02-23 10:48:49'),
(1498, 3, NULL, '667', 'Debhata', 'Active', '2022-02-23 10:48:59', '2022-02-23 10:48:59'),
(1499, 3, NULL, '638', 'Chouddagram', 'Active', '2022-02-23 10:49:02', '2022-02-23 10:49:02'),
(1500, 3, NULL, '667', 'Kalaroa', 'Active', '2022-02-23 10:49:10', '2022-02-23 10:49:10'),
(1501, 3, NULL, '638', 'Cumilla-S', 'Active', '2022-02-23 10:49:19', '2022-02-23 10:49:19'),
(1502, 3, NULL, '667', 'Kaliganj', 'Active', '2022-02-23 10:49:33', '2022-02-23 10:49:33'),
(1503, 3, NULL, '638', 'Cumilla-S Daksin', 'Active', '2022-02-23 10:49:39', '2022-02-23 10:49:39'),
(1504, 3, NULL, '667', 'Satkhira-Sadar', 'Active', '2022-02-23 10:49:48', '2022-02-23 10:49:48'),
(1505, 3, NULL, '638', 'Daudkandi', 'Active', '2022-02-23 10:49:52', '2022-02-23 10:49:52'),
(1506, 3, NULL, '667', 'Shyamnagar', 'Active', '2022-02-23 10:50:03', '2022-02-23 10:50:03'),
(1507, 3, NULL, '638', 'Debidwar', 'Active', '2022-02-23 10:50:08', '2022-02-23 10:50:08'),
(1508, 3, NULL, '667', 'Tala', 'Active', '2022-02-23 10:50:13', '2022-02-23 10:50:13'),
(1509, 3, NULL, '638', 'Homna', 'Active', '2022-02-23 10:50:26', '2022-02-23 10:50:26'),
(1510, 3, NULL, '668', 'Bakshiganj', 'Active', '2022-02-23 10:50:27', '2022-02-23 10:50:27'),
(1511, 3, NULL, '638', 'Laksham', 'Active', '2022-02-23 10:50:40', '2022-02-23 10:50:40'),
(1512, 3, NULL, '668', 'Dewanganj', 'Active', '2022-02-23 10:50:41', '2022-02-23 10:50:41'),
(1513, 3, NULL, '668', 'Islampur', 'Active', '2022-02-23 10:50:57', '2022-02-23 10:50:57'),
(1514, 3, NULL, '668', 'Jamalpur-Sadar', 'Active', '2022-02-23 10:51:14', '2022-02-23 10:51:14'),
(1515, 3, NULL, '638', 'Lalmai', 'Active', '2022-02-23 10:51:18', '2022-02-23 10:51:18'),
(1516, 3, NULL, '668', 'Madarganj', 'Active', '2022-02-23 10:51:29', '2022-02-23 10:51:29'),
(1517, 3, NULL, '638', 'Meghna', 'Active', '2022-02-23 10:51:31', '2022-02-23 10:51:31'),
(1518, 3, NULL, '668', 'Melendah', 'Active', '2022-02-23 10:51:41', '2022-02-23 10:51:41'),
(1519, 3, NULL, '638', 'Monohorganj', 'Active', '2022-02-23 10:51:43', '2022-02-23 10:51:43'),
(1520, 3, NULL, '668', 'Sarishabari', 'Active', '2022-02-23 10:51:52', '2022-02-23 10:51:52'),
(1521, 3, NULL, '638', 'Muradnagar', 'Active', '2022-02-23 10:52:02', '2022-02-23 10:52:02'),
(1522, 3, NULL, '638', 'Nangalkot', 'Active', '2022-02-23 10:52:17', '2022-02-23 10:52:17'),
(1523, 3, NULL, '669', 'Bhaluka', 'Active', '2022-02-23 10:52:21', '2022-02-23 10:52:21'),
(1524, 3, NULL, '669', 'Dhobaura', 'Active', '2022-02-23 10:52:33', '2022-02-23 10:52:33'),
(1525, 3, NULL, '638', 'Titas', 'Active', '2022-02-23 10:52:35', '2022-02-23 10:52:35'),
(1526, 3, NULL, '640', 'Chhagalniya', 'Active', '2022-02-23 10:52:50', '2022-02-23 10:52:50'),
(1527, 3, NULL, '669', 'Fulbaria', 'Active', '2022-02-23 10:53:01', '2022-02-23 10:53:01'),
(1528, 3, NULL, '640', 'Daganbhuiyan', 'Active', '2022-02-23 10:53:09', '2022-02-23 10:53:09'),
(1529, 3, NULL, '669', 'Gaffargaon', 'Active', '2022-02-23 10:53:11', '2022-02-23 10:53:11'),
(1530, 3, NULL, '669', 'Gouripur', 'Active', '2022-02-23 10:53:30', '2022-02-23 10:53:30'),
(1531, 3, NULL, '640', 'Feni-S', 'Active', '2022-02-23 10:53:32', '2022-02-23 10:53:32'),
(1532, 3, NULL, '669', 'Haluaghat', 'Active', '2022-02-23 10:53:46', '2022-02-23 10:53:46'),
(1533, 3, NULL, '640', 'Fulgazi', 'Active', '2022-02-23 10:53:47', '2022-02-23 10:53:47'),
(1534, 3, NULL, '669', 'Ishwarganj', 'Active', '2022-02-23 10:53:58', '2022-02-23 10:53:58'),
(1535, 3, NULL, '640', 'Porshuram', 'Active', '2022-02-23 10:54:03', '2022-02-23 10:54:03'),
(1536, 3, NULL, '669', 'Muktagacha', 'Active', '2022-02-23 10:54:13', '2022-02-23 10:54:13'),
(1537, 3, NULL, '640', 'Sonagazi', 'Active', '2022-02-23 10:54:20', '2022-02-23 10:54:20'),
(1538, 3, NULL, '669', 'Mymensingh-Sadar', 'Active', '2022-02-23 10:54:27', '2022-02-23 10:54:27'),
(1539, 3, NULL, '669', 'Nandail', 'Active', '2022-02-23 10:54:40', '2022-02-23 10:54:40'),
(1540, 3, NULL, '641', 'Dighinala', 'Active', '2022-02-23 10:54:43', '2022-02-23 10:54:43'),
(1541, 3, NULL, '669', 'Phulpur', 'Active', '2022-02-23 10:54:56', '2022-02-23 10:54:56'),
(1542, 3, NULL, '641', 'Guimara', 'Active', '2022-02-23 10:55:03', '2022-02-23 10:55:03'),
(1543, 3, NULL, '669', 'Tarakanda', 'Active', '2022-02-23 10:55:07', '2022-02-23 10:55:07'),
(1544, 3, NULL, '669', 'Trishal', 'Active', '2022-02-23 10:55:20', '2022-02-23 10:55:20'),
(1545, 3, NULL, '641', 'Khagrachari-S', 'Active', '2022-02-23 10:55:23', '2022-02-23 10:55:23'),
(1546, 3, NULL, '641', 'Laxmichari', 'Active', '2022-02-23 10:55:40', '2022-02-23 10:55:40'),
(1547, 3, NULL, '670', 'Atpara', 'Active', '2022-02-23 10:55:44', '2022-02-23 10:55:44'),
(1548, 3, NULL, '641', 'Mahalchari', 'Active', '2022-02-23 10:55:58', '2022-02-23 10:55:58'),
(1549, 3, NULL, '670', 'Barhatta', 'Active', '2022-02-23 10:55:58', '2022-02-23 10:55:58'),
(1550, 3, NULL, '641', 'Manikchari', 'Active', '2022-02-23 10:56:17', '2022-02-23 10:56:17'),
(1551, 3, NULL, '670', 'Durgapur', 'Active', '2022-02-23 10:56:18', '2022-02-23 10:56:18'),
(1552, 3, NULL, '641', 'Matiranga', 'Active', '2022-02-23 10:56:33', '2022-02-23 10:56:33'),
(1553, 3, NULL, '670', 'Kalmakanda', 'Active', '2022-02-23 10:56:40', '2022-02-23 10:56:40'),
(1554, 3, NULL, '641', 'Panchari', 'Active', '2022-02-23 10:56:47', '2022-02-23 10:56:47'),
(1555, 3, NULL, '670', 'Kendua', 'Active', '2022-02-23 10:56:52', '2022-02-23 10:56:52'),
(1556, 3, NULL, '641', 'Ramgarh', 'Active', '2022-02-23 10:57:03', '2022-02-23 10:57:03'),
(1557, 3, NULL, '670', 'Khaliajuri', 'Active', '2022-02-23 10:57:05', '2022-02-23 10:57:05'),
(1558, 3, NULL, '670', 'Madan', 'Active', '2022-02-23 10:57:38', '2022-02-23 10:57:38'),
(1559, 3, NULL, '642', 'Komol Nagar', 'Active', '2022-02-23 10:57:44', '2022-02-23 10:57:44'),
(1560, 3, NULL, '670', 'Mohanganj', 'Active', '2022-02-23 10:57:54', '2022-02-23 10:57:54'),
(1561, 3, NULL, '642', 'Laxmipur-S', 'Active', '2022-02-23 10:58:08', '2022-02-23 10:58:08'),
(1562, 3, NULL, '670', 'Netrakona-Sadar', 'Active', '2022-02-23 10:58:08', '2022-02-23 10:58:08'),
(1563, 3, NULL, '670', 'Purbadhala', 'Active', '2022-02-23 10:58:22', '2022-02-23 10:58:22'),
(1564, 3, NULL, '642', 'Raipur', 'Active', '2022-02-23 10:58:24', '2022-02-23 10:58:24'),
(1565, 3, NULL, '642', 'Ramganj', 'Active', '2022-02-23 10:58:40', '2022-02-23 10:58:40'),
(1566, 3, NULL, '671', 'Jhenaigati', 'Active', '2022-02-23 10:58:48', '2022-02-23 10:58:48'),
(1567, 3, NULL, '671', 'Nakla', 'Active', '2022-02-23 10:59:00', '2022-02-23 10:59:00'),
(1568, 3, NULL, '642', 'Ramgati', 'Active', '2022-02-23 10:59:01', '2022-02-23 10:59:01'),
(1569, 3, NULL, '671', 'Nalitabari', 'Active', '2022-02-23 10:59:15', '2022-02-23 10:59:15'),
(1570, 3, NULL, '671', 'Sherpur-Sadar', 'Active', '2022-02-23 10:59:30', '2022-02-23 10:59:38'),
(1571, 3, NULL, '643', 'Begumganj', 'Active', '2022-02-23 10:59:37', '2022-02-23 10:59:37'),
(1572, 3, NULL, '643', 'Chatkhil', 'Active', '2022-02-23 10:59:59', '2022-02-23 10:59:59'),
(1573, 3, NULL, '643', 'Companiganj', 'Active', '2022-02-23 11:00:20', '2022-02-23 11:00:20'),
(1574, 3, NULL, '643', 'Hatiya', 'Active', '2022-02-23 11:00:38', '2022-02-23 11:00:38'),
(1575, 3, NULL, '643', 'Kabir Hat', 'Active', '2022-02-23 11:00:58', '2022-02-23 11:00:58'),
(1576, 3, NULL, '671', 'Sreebordi', 'Active', '2022-02-23 11:01:02', '2022-02-23 11:01:02'),
(1577, 3, NULL, '643', 'Noakhali-S', 'Active', '2022-02-23 11:01:15', '2022-02-23 11:01:15'),
(1578, 3, NULL, '672', 'Adamdighi', 'Active', '2022-02-23 11:01:27', '2022-02-23 11:01:27'),
(1579, 3, NULL, '643', 'Senbag', 'Active', '2022-02-23 11:01:31', '2022-02-23 11:01:31'),
(1580, 3, NULL, '672', 'Bogura-Sadar', 'Active', '2022-02-23 11:01:44', '2022-02-23 11:01:54'),
(1581, 3, NULL, '643', 'Sonaimuri', 'Active', '2022-02-23 11:01:51', '2022-02-23 11:01:51'),
(1582, 3, NULL, '643', 'Subarna Char', 'Active', '2022-02-23 11:02:15', '2022-02-23 11:02:15'),
(1583, 3, NULL, '672', 'Dhunot', 'Active', '2022-02-23 11:02:22', '2022-02-23 11:02:22'),
(1584, 3, NULL, '672', 'Dhupchancia', 'Active', '2022-02-23 11:02:37', '2022-02-23 11:02:37'),
(1585, 3, NULL, '644', 'Baghaichari', 'Active', '2022-02-23 11:02:40', '2022-02-23 11:02:40'),
(1586, 3, NULL, '672', 'Gabtali', 'Active', '2022-02-23 11:02:56', '2022-02-23 11:02:56'),
(1587, 3, NULL, '644', 'Barkal', 'Active', '2022-02-23 11:03:02', '2022-02-23 11:03:02'),
(1588, 3, NULL, '672', 'Kahaloo', 'Active', '2022-02-23 11:03:17', '2022-02-23 11:03:17'),
(1589, 3, NULL, '644', 'Belaichari', 'Active', '2022-02-23 11:03:22', '2022-02-23 11:03:22'),
(1590, 3, NULL, '672', 'Nandigram', 'Active', '2022-02-23 11:03:31', '2022-02-23 11:03:31'),
(1591, 3, NULL, '644', 'Juraichari', 'Active', '2022-02-23 11:03:42', '2022-02-23 11:03:42'),
(1592, 3, NULL, '672', 'Sariakandi', 'Active', '2022-02-23 11:03:44', '2022-02-23 11:03:44'),
(1593, 3, NULL, '672', 'Shajahanpur', 'Active', '2022-02-23 11:03:55', '2022-02-23 11:03:55'),
(1594, 3, NULL, '644', 'Kaptai', 'Active', '2022-02-23 11:03:57', '2022-02-23 11:03:57'),
(1595, 3, NULL, '672', 'Sherpur', 'Active', '2022-02-23 11:04:07', '2022-02-23 11:04:07'),
(1596, 3, NULL, '644', 'Kaukhali', 'Active', '2022-02-23 11:04:12', '2022-02-23 11:04:12'),
(1597, 3, NULL, '644', 'Langadu', 'Active', '2022-02-23 11:04:38', '2022-02-23 11:04:38'),
(1598, 3, NULL, '672', 'Shibganj', 'Active', '2022-02-23 11:04:56', '2022-02-23 11:04:56'),
(1599, 3, NULL, '644', 'Nanniarchar', 'Active', '2022-02-23 11:04:58', '2022-02-23 11:04:58'),
(1600, 3, NULL, '672', 'Sonatala', 'Active', '2022-02-23 11:05:08', '2022-02-23 11:05:08'),
(1601, 3, NULL, '644', 'Rajosthali', 'Active', '2022-02-23 11:05:14', '2022-02-23 11:05:14'),
(1602, 3, NULL, '676', 'Bholahat', 'Active', '2022-02-23 11:05:29', '2022-02-23 11:05:29'),
(1603, 3, NULL, '645', 'Rangamati-S', 'Active', '2022-02-23 11:05:40', '2022-02-23 11:05:40'),
(1604, 3, NULL, '676', 'Gomostapur', 'Active', '2022-02-23 11:05:41', '2022-02-23 11:05:41'),
(1605, 3, NULL, '676', 'Nachol', 'Active', '2022-02-23 11:05:53', '2022-02-23 11:05:53'),
(1606, 3, NULL, '645', 'Dhamrai', 'Active', '2022-02-23 11:05:58', '2022-02-23 11:05:58'),
(1607, 3, NULL, '676', 'Nawabganj-Sadar', 'Active', '2022-02-23 11:06:08', '2022-02-23 11:06:08'),
(1608, 3, NULL, '645', 'Dohar', 'Active', '2022-02-23 11:06:12', '2022-02-23 11:06:12'),
(1609, 3, NULL, '676', 'Shibganj', 'Active', '2022-02-23 11:06:21', '2022-02-23 11:06:21'),
(1610, 3, NULL, '645', 'Keraniganj', 'Active', '2022-02-23 11:06:25', '2022-02-23 11:06:25'),
(1611, 3, NULL, '49', 'Akkelpur', 'Active', '2022-02-23 11:06:36', '2022-02-23 11:06:53'),
(1612, 3, NULL, '645', 'Nawabganj', 'Active', '2022-02-23 11:06:48', '2022-02-23 11:06:48'),
(1613, 3, NULL, '645', 'Savar', 'Active', '2022-02-23 11:07:02', '2022-02-23 11:07:02'),
(1614, 3, NULL, '673', 'Joypurhat-Sadar', 'Active', '2022-02-23 11:07:12', '2022-02-23 11:07:12'),
(1615, 3, NULL, '646', 'Alfadanga', 'Active', '2022-02-23 11:07:22', '2022-02-23 11:07:22'),
(1616, 3, NULL, '673', 'Kalai', 'Active', '2022-02-23 11:07:25', '2022-02-23 11:07:25'),
(1617, 3, NULL, '646', 'Bhanga', 'Active', '2022-02-23 11:07:36', '2022-02-23 11:07:36'),
(1618, 3, NULL, '673', 'Khetlal', 'Active', '2022-02-23 11:07:39', '2022-02-23 11:07:39'),
(1619, 3, NULL, '673', 'Panchbibi', 'Active', '2022-02-23 11:07:49', '2022-02-23 11:07:49'),
(1620, 3, NULL, '646', 'Boalmari', 'Active', '2022-02-23 11:07:54', '2022-02-23 11:07:54'),
(1621, 3, NULL, '674', 'Atrai', 'Active', '2022-02-23 11:08:07', '2022-02-23 11:08:07'),
(1622, 3, NULL, '646', 'Charbhadrasan', 'Active', '2022-02-23 11:08:09', '2022-02-23 11:08:09'),
(1623, 3, NULL, '674', 'Badalgachi', 'Active', '2022-02-23 11:08:28', '2022-02-23 11:08:28'),
(1624, 3, NULL, '674', 'Dhamoirhat', 'Active', '2022-02-23 11:08:39', '2022-02-23 11:08:39'),
(1625, 3, NULL, '646', 'Faridpur-S', 'Active', '2022-02-23 11:08:40', '2022-02-23 11:08:40'),
(1626, 3, NULL, '674', 'Manda', 'Active', '2022-02-23 11:08:51', '2022-02-23 11:08:51'),
(1627, 3, NULL, '646', 'Madhukhali', 'Active', '2022-02-23 11:08:56', '2022-02-23 11:08:56'),
(1628, 3, NULL, '674', 'Mohadevpur', 'Active', '2022-02-23 11:09:03', '2022-02-23 11:09:03'),
(1629, 3, NULL, '646', 'Nagarkanda', 'Active', '2022-02-23 11:09:13', '2022-02-23 11:09:13'),
(1630, 3, NULL, '674', 'Naogaon-Sadar', 'Active', '2022-02-23 11:09:19', '2022-02-23 11:09:19'),
(1631, 3, NULL, '646', 'Sadarpur', 'Active', '2022-02-23 11:09:29', '2022-02-23 11:09:29'),
(1632, 3, NULL, '646', 'Saltha', 'Active', '2022-02-23 11:09:45', '2022-02-23 11:09:45'),
(1633, 3, NULL, '674', 'Niamatpur', 'Active', '2022-02-23 11:09:50', '2022-02-23 11:09:50'),
(1634, 3, NULL, '674', 'Patnitala', 'Active', '2022-02-23 11:10:07', '2022-02-23 11:10:07'),
(1635, 3, NULL, '647', 'Gazipur-S', 'Active', '2022-02-23 11:10:14', '2022-02-23 11:10:14'),
(1636, 3, NULL, '647', 'Kaliakoir', 'Active', '2022-02-23 11:10:38', '2022-02-23 11:10:38'),
(1637, 3, NULL, '674', 'Porsha', 'Active', '2022-02-23 11:10:38', '2022-02-23 11:10:38'),
(1638, 3, NULL, '647', 'Kaliganj', 'Active', '2022-02-23 11:10:52', '2022-02-23 11:10:52'),
(1639, 3, NULL, '674', 'Raninagar', 'Active', '2022-02-23 11:10:59', '2022-02-23 11:10:59'),
(1640, 3, NULL, '647', 'Kapasia', 'Active', '2022-02-23 11:11:07', '2022-02-23 11:11:07'),
(1641, 3, NULL, '674', 'Shapahar', 'Active', '2022-02-23 11:11:14', '2022-02-23 11:11:14'),
(1642, 3, NULL, '647', 'Sreepur', 'Active', '2022-02-23 11:11:20', '2022-02-23 11:11:20'),
(1643, 3, NULL, '675', 'Bagatipara', 'Active', '2022-02-23 11:11:34', '2022-02-23 11:11:34'),
(1644, 3, NULL, '648', 'Gopalganj-S', 'Active', '2022-02-23 11:11:45', '2022-02-23 11:11:45'),
(1645, 3, NULL, '675', 'Baraigram', 'Active', '2022-02-23 11:11:47', '2022-02-23 11:11:47'),
(1646, 3, NULL, '648', 'Kasiani', 'Active', '2022-02-23 11:12:01', '2022-02-23 11:12:01'),
(1647, 3, NULL, '675', 'Gurudaspur', 'Active', '2022-02-23 11:12:04', '2022-02-23 11:12:04'),
(1648, 3, NULL, '675', 'Lalpur', 'Active', '2022-02-23 11:12:18', '2022-02-23 11:12:18'),
(1649, 3, NULL, '648', 'Kotwalipara', 'Active', '2022-02-23 11:12:19', '2022-02-23 11:12:19'),
(1650, 3, NULL, '648', 'Muksudpur', 'Active', '2022-02-23 11:12:35', '2022-02-23 11:12:35'),
(1651, 3, NULL, '675', 'Naldanga', 'Active', '2022-02-23 11:12:35', '2022-02-23 11:12:35'),
(1652, 3, NULL, '675', 'Natore-Sadar', 'Active', '2022-02-23 11:12:51', '2022-02-23 11:12:51'),
(1653, 3, NULL, '675', 'Singra', 'Active', '2022-02-23 11:13:02', '2022-02-23 11:13:02'),
(1654, 3, NULL, '648', 'Tungipara', 'Active', '2022-02-23 11:13:06', '2022-02-23 11:13:06'),
(1655, 3, NULL, '677', 'Atghoria', 'Active', '2022-02-23 11:13:19', '2022-02-23 11:13:19'),
(1656, 3, NULL, '677', 'Bera', 'Active', '2022-02-23 11:13:29', '2022-02-23 11:13:29'),
(1657, 3, NULL, '677', 'Bhangura', 'Active', '2022-02-23 11:13:39', '2022-02-23 11:13:39'),
(1658, 3, NULL, '649', 'Austagram', 'Active', '2022-02-23 11:13:48', '2022-02-23 11:13:48'),
(1659, 3, NULL, '677', 'Chatmohar', 'Active', '2022-02-23 11:13:49', '2022-02-23 11:13:49'),
(1660, 3, NULL, '677', 'Faridpur', 'Active', '2022-02-23 11:13:59', '2022-02-23 11:13:59'),
(1661, 3, NULL, '677', 'Ishwardi', 'Active', '2022-02-23 11:14:07', '2022-02-23 11:14:07'),
(1662, 3, NULL, '649', 'Bajitpur', 'Active', '2022-02-23 11:14:07', '2022-02-23 11:14:07'),
(1663, 3, NULL, '677', 'Pabna-Sadar', 'Active', '2022-02-23 11:14:18', '2022-02-23 11:14:18'),
(1664, 3, NULL, '649', 'Bhairab', 'Active', '2022-02-23 11:14:21', '2022-02-23 11:14:21'),
(1665, 3, NULL, '677', 'Santhia', 'Active', '2022-02-23 11:14:29', '2022-02-23 11:14:29'),
(1666, 3, NULL, '677', 'Sujanagar', 'Active', '2022-02-23 11:14:37', '2022-02-23 11:14:37'),
(1667, 3, NULL, '649', 'Hossainpur', 'Active', '2022-02-23 11:14:37', '2022-02-23 11:14:37'),
(1668, 3, NULL, '649', 'Itna', 'Active', '2022-02-23 11:14:52', '2022-02-23 11:14:52'),
(1669, 3, NULL, '678', 'Bagha', 'Active', '2022-02-23 11:14:59', '2022-02-23 11:14:59'),
(1670, 3, NULL, '678', 'Bagmara', 'Active', '2022-02-23 11:15:09', '2022-02-23 11:15:09'),
(1671, 3, NULL, '649', 'Karimganj', 'Active', '2022-02-23 11:15:09', '2022-02-23 11:15:09'),
(1672, 3, NULL, '678', 'Charghat', 'Active', '2022-02-23 11:15:24', '2022-02-23 11:15:24'),
(1673, 3, NULL, '649', 'Katiadi', 'Active', '2022-02-23 11:15:31', '2022-02-23 11:15:31'),
(1674, 3, NULL, '678', 'Durgapur', 'Active', '2022-02-23 11:15:38', '2022-02-23 11:15:38'),
(1675, 3, NULL, '649', 'Kishoreganj-S', 'Active', '2022-02-23 11:15:56', '2022-02-23 11:15:56'),
(1676, 3, NULL, '678', 'Godagari', 'Active', '2022-02-23 11:15:56', '2022-02-23 11:15:56'),
(1677, 3, NULL, '678', 'Mohanpur', 'Active', '2022-02-23 11:16:06', '2022-02-23 11:16:06'),
(1678, 3, NULL, '649', 'Kuliarchar', 'Active', '2022-02-23 11:16:12', '2022-02-23 11:16:12'),
(1679, 3, NULL, '678', 'Paba', 'Active', '2022-02-23 11:16:16', '2022-02-23 11:16:16'),
(1680, 3, NULL, '649', 'Mithamoin', 'Active', '2022-02-23 11:16:27', '2022-02-23 11:16:27'),
(1681, 3, NULL, '678', 'Puthia', 'Active', '2022-02-23 11:16:27', '2022-02-23 11:16:27'),
(1682, 3, NULL, '678', 'Tanore', 'Active', '2022-02-23 11:16:36', '2022-02-23 11:16:36'),
(1683, 3, NULL, '649', 'Nikli', 'Active', '2022-02-23 11:16:43', '2022-02-23 11:16:43'),
(1684, 3, NULL, '679', 'Belkuchi', 'Active', '2022-02-23 11:17:02', '2022-02-23 11:17:02'),
(1685, 3, NULL, '649', 'Pakundia', 'Active', '2022-02-23 11:17:03', '2022-02-23 11:17:03'),
(1686, 3, NULL, '679', 'Chowhali', 'Active', '2022-02-23 11:17:13', '2022-02-23 11:17:13'),
(1687, 3, NULL, '649', 'Tarail', 'Active', '2022-02-23 11:17:20', '2022-02-23 11:17:20'),
(1688, 3, NULL, '679', 'Kamarkhand', 'Active', '2022-02-23 11:17:24', '2022-02-23 11:17:24'),
(1689, 3, NULL, '679', 'Kazipur', 'Active', '2022-02-23 11:17:35', '2022-02-23 11:17:35'),
(1690, 3, NULL, '650', 'Kalkini', 'Active', '2022-02-23 11:17:41', '2022-02-23 11:17:41'),
(1691, 3, NULL, '679', 'Raiganj', 'Active', '2022-02-23 11:17:57', '2022-02-23 11:17:57'),
(1692, 3, NULL, '650', 'Madaripur-S', 'Active', '2022-02-23 11:18:07', '2022-02-23 11:18:07'),
(1693, 3, NULL, '679', 'Shahzadpur', 'Active', '2022-02-23 11:18:09', '2022-02-23 11:18:09'),
(1694, 3, NULL, '650', 'Rajoir', 'Active', '2022-02-23 11:18:28', '2022-02-23 11:18:28'),
(1695, 3, NULL, '679', 'Sirajganj-Sadar', 'Active', '2022-02-23 11:18:42', '2022-02-23 11:18:42'),
(1696, 3, NULL, '650', 'Shibchar', 'Active', '2022-02-23 11:18:43', '2022-02-23 11:18:43'),
(1697, 3, NULL, '679', 'Tarash', 'Active', '2022-02-23 11:18:53', '2022-02-23 11:18:53'),
(1698, 3, NULL, '679', 'Ullapara', 'Active', '2022-02-23 11:19:09', '2022-02-23 11:19:09'),
(1699, 3, NULL, '651', 'Daulatpur', 'Active', '2022-02-23 11:19:13', '2022-02-23 11:19:13'),
(1700, 3, NULL, '680', 'Birampur', 'Active', '2022-02-23 11:19:28', '2022-02-23 11:19:28'),
(1701, 3, NULL, '651', 'Ghior', 'Active', '2022-02-23 11:19:39', '2022-02-23 11:19:39'),
(1702, 3, NULL, '680', 'Birganj', 'Active', '2022-02-23 11:19:48', '2022-02-23 11:19:48'),
(1703, 3, NULL, '651', 'Harirampur', 'Active', '2022-02-23 11:20:00', '2022-02-23 11:20:00'),
(1704, 3, NULL, '680', 'Birol', 'Active', '2022-02-23 11:20:01', '2022-02-23 11:20:01'),
(1705, 3, NULL, '680', 'Bochaganj', 'Active', '2022-02-23 11:20:11', '2022-02-23 11:20:11'),
(1706, 3, NULL, '651', 'Manikganj-S', 'Active', '2022-02-23 11:20:14', '2022-02-23 11:20:14'),
(1707, 3, NULL, '680', 'Chirirbandar', 'Active', '2022-02-23 11:20:20', '2022-02-23 11:20:20'),
(1708, 3, NULL, '651', 'Saturia', 'Active', '2022-02-23 11:20:26', '2022-02-23 11:20:26'),
(1709, 3, NULL, '680', 'Dinajpur-Sadar', 'Active', '2022-02-23 11:20:36', '2022-02-23 11:20:36'),
(1710, 3, NULL, '651', 'Shivalaya', 'Active', '2022-02-23 11:20:39', '2022-02-23 11:20:39'),
(1711, 3, NULL, '680', 'Fulbari', 'Active', '2022-02-23 11:20:47', '2022-02-23 11:20:47'),
(1712, 3, NULL, '680', 'Ghoraghat', 'Active', '2022-02-23 11:20:55', '2022-02-23 11:20:55'),
(1713, 3, NULL, '651', 'Singair', 'Active', '2022-02-23 11:21:02', '2022-02-23 11:21:02'),
(1714, 3, NULL, '680', 'Hakimpur', 'Active', '2022-02-23 11:21:04', '2022-02-23 11:21:04'),
(1715, 3, NULL, '680', 'Kaharol', 'Active', '2022-02-23 11:21:13', '2022-02-23 11:21:13'),
(1716, 3, NULL, '680', 'Khanshama', 'Active', '2022-02-23 11:21:22', '2022-02-23 11:21:22'),
(1717, 3, NULL, '652', 'Gazaria', 'Active', '2022-02-23 11:21:24', '2022-02-23 11:21:24'),
(1718, 3, NULL, '680', 'Nawabganj', 'Active', '2022-02-23 11:21:35', '2022-02-23 11:21:35'),
(1719, 3, NULL, '652', 'Lauhajong', 'Active', '2022-02-23 11:21:38', '2022-02-23 11:21:38'),
(1720, 3, NULL, '680', 'Parbatipur', 'Active', '2022-02-23 11:21:43', '2022-02-23 11:21:43'),
(1721, 3, NULL, '681', 'Fulchari', 'Active', '2022-02-23 11:21:52', '2022-02-23 11:22:04'),
(1722, 3, NULL, '652', 'Munshiganj-S', 'Active', '2022-02-23 11:21:55', '2022-02-23 11:21:55'),
(1723, 3, NULL, '652', 'Sirajdikhan', 'Active', '2022-02-23 11:22:14', '2022-02-23 11:22:14'),
(1724, 3, NULL, '652', 'Sreenagar', 'Active', '2022-02-23 11:22:30', '2022-02-23 11:22:30'),
(1725, 3, NULL, '652', 'Tongibari', 'Active', '2022-02-23 11:22:48', '2022-02-23 11:22:48'),
(1726, 3, NULL, '681', 'Gaibandha-Sadar', 'Active', '2022-02-23 11:22:54', '2022-02-23 11:22:54'),
(1727, 3, NULL, '681', 'Gobindaganj', 'Active', '2022-02-23 11:23:16', '2022-02-23 11:23:16'),
(1728, 3, NULL, '653', 'Araihazar', 'Active', '2022-02-23 11:23:24', '2022-02-23 11:23:24'),
(1729, 3, NULL, '681', 'Sadullapur', 'Active', '2022-02-23 11:23:31', '2022-02-23 11:23:31'),
(1730, 3, NULL, '681', 'Palashbari', 'Active', '2022-02-23 11:23:45', '2022-02-23 11:23:45'),
(1731, 3, NULL, '653', 'Bandar', 'Active', '2022-02-23 11:23:45', '2022-02-23 11:23:45'),
(1732, 3, NULL, '653', 'Narayanganj-S', 'Active', '2022-02-23 11:24:01', '2022-02-23 11:24:01'),
(1733, 3, NULL, '681', 'Sadullapur', 'Active', '2022-02-23 11:24:12', '2022-02-23 11:24:12'),
(1734, 3, NULL, '653', 'Rupganj', 'Active', '2022-02-23 11:24:17', '2022-02-23 11:24:17'),
(1735, 3, NULL, '681', 'Saghata', 'Active', '2022-02-23 11:24:22', '2022-02-23 11:24:22'),
(1736, 3, NULL, '653', 'Sonargaon', 'Active', '2022-02-23 11:24:32', '2022-02-23 11:24:32'),
(1737, 3, NULL, '681', 'Sundarganj', 'Active', '2022-02-23 11:24:36', '2022-02-23 11:24:36'),
(1738, 3, NULL, '682', 'Bhurungamari', 'Active', '2022-02-23 11:24:56', '2022-02-23 11:24:56'),
(1739, 3, NULL, '654', 'Belabo', 'Active', '2022-02-23 11:25:00', '2022-02-23 11:25:00'),
(1740, 3, NULL, '682', 'Chilmari', 'Active', '2022-02-23 11:25:16', '2022-02-23 11:25:16'),
(1741, 3, NULL, '654', 'Monohardi', 'Active', '2022-02-23 11:25:17', '2022-02-23 11:25:17'),
(1742, 3, NULL, '682', 'Fulbari', 'Active', '2022-02-23 11:25:28', '2022-02-23 11:25:28'),
(1743, 3, NULL, '654', 'Narshingdi-S', 'Active', '2022-02-23 11:25:34', '2022-02-23 11:25:34'),
(1744, 3, NULL, '682', 'Kurigram-Sadar', 'Active', '2022-02-23 11:25:43', '2022-02-23 11:25:43'),
(1745, 3, NULL, '654', 'Palash', 'Active', '2022-02-23 11:25:48', '2022-02-23 11:25:48'),
(1746, 3, NULL, '682', 'Nageswari', 'Active', '2022-02-23 11:25:59', '2022-02-23 11:25:59'),
(1747, 3, NULL, '682', 'Nageswari', 'Active', '2022-02-23 11:26:10', '2022-02-23 11:26:10'),
(1748, 3, NULL, '654', 'Raipura', 'Active', '2022-02-23 11:26:16', '2022-02-23 11:26:16'),
(1749, 3, NULL, '682', 'Rajibpur', 'Active', '2022-02-23 11:26:20', '2022-02-23 11:26:20'),
(1750, 3, NULL, '682', 'Rajibpur', 'Active', '2022-02-23 11:26:32', '2022-02-23 11:26:32'),
(1751, 3, NULL, '654', 'Shibpur', 'Active', '2022-02-23 11:26:32', '2022-02-23 11:26:32'),
(1752, 3, NULL, '682', 'Rowmari', 'Active', '2022-02-23 11:26:44', '2022-02-23 11:26:44'),
(1753, 3, NULL, '655', 'Baliakandi', 'Active', '2022-02-23 11:26:59', '2022-02-23 11:26:59'),
(1754, 3, NULL, '682', 'Ulipur', 'Active', '2022-02-23 11:27:06', '2022-02-23 11:27:06'),
(1755, 3, NULL, '655', 'Goalanda', 'Active', '2022-02-23 11:27:18', '2022-02-23 11:27:18'),
(1756, 3, NULL, '683', 'Aditmari', 'Active', '2022-02-23 11:27:19', '2022-02-23 11:27:19'),
(1757, 3, NULL, '683', 'Hatibandha', 'Active', '2022-02-23 11:27:31', '2022-02-23 11:27:31'),
(1758, 3, NULL, '655', 'Kalukhali', 'Active', '2022-02-23 11:27:32', '2022-02-23 11:27:32'),
(1759, 3, NULL, '683', 'Kaliganj', 'Active', '2022-02-23 11:27:42', '2022-02-23 11:27:42'),
(1760, 3, NULL, '655', 'Pangsha', 'Active', '2022-02-23 11:27:48', '2022-02-23 11:27:48');
INSERT INTO `zones` (`id`, `courier_id`, `zoneId`, `city_id`, `zoneName`, `status`, `created_at`, `updated_at`) VALUES
(1761, 3, NULL, '683', 'Lalmonirhat-Sadar', 'Active', '2022-02-23 11:27:56', '2022-02-23 11:27:56'),
(1762, 3, NULL, '683', 'Patgram', 'Active', '2022-02-23 11:28:06', '2022-02-23 11:28:06'),
(1763, 3, NULL, '684', 'Dimla', 'Active', '2022-02-23 11:28:18', '2022-02-23 11:28:18'),
(1764, 3, NULL, '655', 'Rajbari-S', 'Active', '2022-02-23 11:28:19', '2022-02-23 11:28:19'),
(1765, 3, NULL, '684', 'Domar', 'Active', '2022-02-23 11:28:28', '2022-02-23 11:28:28'),
(1766, 3, NULL, '656', 'Bhedarganj', 'Active', '2022-02-23 11:28:37', '2022-02-23 11:28:37'),
(1767, 3, NULL, '684', 'Jaldhaka', 'Active', '2022-02-23 11:28:47', '2022-02-23 11:28:47'),
(1768, 3, NULL, '684', 'Kishoreganj', 'Active', '2022-02-23 11:29:03', '2022-02-23 11:29:03'),
(1769, 3, NULL, '684', 'Nilphamari', 'Active', '2022-02-23 11:29:16', '2022-02-23 11:29:16'),
(1770, 3, NULL, '684', 'Sayedpur', 'Active', '2022-02-23 11:29:32', '2022-02-23 11:29:32'),
(1771, 3, NULL, '685', 'Atwari', 'Active', '2022-02-23 11:29:50', '2022-02-23 11:29:50'),
(1772, 3, NULL, '685', 'Boda', 'Active', '2022-02-23 11:29:57', '2022-02-23 11:29:57'),
(1773, 3, NULL, '685', 'Debiganj', 'Active', '2022-02-23 11:30:08', '2022-02-23 11:30:08'),
(1774, 3, NULL, '685', 'Panchagarh-Sadar', 'Active', '2022-02-23 11:30:21', '2022-02-23 11:30:21'),
(1775, 3, NULL, '685', 'Tetulia', 'Active', '2022-02-23 11:30:34', '2022-02-23 11:30:34'),
(1776, 3, NULL, '686', 'Badarganj', 'Active', '2022-02-23 11:30:45', '2022-02-23 11:31:22'),
(1777, 3, NULL, '686', 'Gangachara', 'Active', '2022-02-23 11:30:53', '2022-02-23 11:31:29'),
(1778, 3, NULL, '686', 'Kaunia', 'Active', '2022-02-23 11:31:49', '2022-02-23 11:31:49'),
(1779, 3, NULL, '686', 'Mithapukur', 'Active', '2022-02-23 11:32:04', '2022-02-23 11:32:04'),
(1780, 3, NULL, '686', 'Pirgacha', 'Active', '2022-02-23 11:32:18', '2022-02-23 11:32:18'),
(1781, 3, NULL, '686', 'Pirganj', 'Active', '2022-02-23 11:32:31', '2022-02-23 11:32:31'),
(1782, 3, NULL, '686', 'Rangpur-Sadar', 'Active', '2022-02-23 11:32:45', '2022-02-23 11:32:45'),
(1783, 3, NULL, '686', 'Taraganj', 'Active', '2022-02-23 11:32:58', '2022-02-23 11:32:58'),
(1784, 3, NULL, '687', 'Baliadangi', 'Active', '2022-02-23 11:33:10', '2022-02-23 11:33:45'),
(1785, 3, NULL, '687', 'Haripur', 'Active', '2022-02-23 11:33:21', '2022-02-23 11:33:36'),
(1786, 3, NULL, '687', 'Pirganj', 'Active', '2022-02-23 11:33:59', '2022-02-23 11:33:59'),
(1787, 3, NULL, '687', 'Ranisankail', 'Active', '2022-02-23 11:34:08', '2022-02-23 11:34:08'),
(1788, 3, NULL, '687', 'Thakurgaon-Sadar', 'Active', '2022-02-23 11:34:22', '2022-02-23 11:34:22'),
(1789, 3, NULL, '688', 'Azmiriganj', 'Active', '2022-02-23 11:34:45', '2022-02-23 11:34:45'),
(1790, 3, NULL, '688', 'Bahubal', 'Active', '2022-02-23 11:34:54', '2022-02-23 11:34:54'),
(1791, 3, NULL, '688', 'Baniachong', 'Active', '2022-02-23 11:35:05', '2022-02-23 11:35:05'),
(1792, 3, NULL, '688', 'Chunarughat', 'Active', '2022-02-23 11:35:16', '2022-02-23 11:35:16'),
(1793, 3, NULL, '688', 'Habiganj-Sadar', 'Active', '2022-02-23 11:35:31', '2022-02-23 11:35:31'),
(1794, 3, NULL, '688', 'Lakhai', 'Active', '2022-02-23 11:35:41', '2022-02-23 11:35:41'),
(1795, 3, NULL, '688', 'Madhabpur', 'Active', '2022-02-23 11:35:50', '2022-02-23 11:35:50'),
(1796, 3, NULL, '688', 'Nabiganj', 'Active', '2022-02-23 11:36:01', '2022-02-23 11:36:01'),
(1797, 3, NULL, '688', 'Sayestaganj', 'Active', '2022-02-23 11:36:17', '2022-02-23 11:36:17'),
(1798, 3, NULL, '689', 'Barlekha', 'Active', '2022-02-23 11:37:05', '2022-02-23 11:37:05'),
(1799, 3, NULL, '689', 'Juri', 'Active', '2022-02-23 11:37:44', '2022-02-23 11:37:44'),
(1800, 3, NULL, '689', 'Kamalganj', 'Active', '2022-02-23 11:37:53', '2022-02-23 11:37:53'),
(1801, 3, NULL, '689', 'Kulaura', 'Active', '2022-02-23 11:38:01', '2022-02-23 11:38:01'),
(1802, 3, NULL, '689', 'Moulvibazar-Sadar', 'Active', '2022-02-23 11:38:11', '2022-02-23 11:38:11'),
(1803, 3, NULL, '691', 'Balaganj', 'Active', '2022-02-23 11:38:14', '2022-02-23 11:38:14'),
(1804, 3, NULL, '689', 'Rajnagar', 'Active', '2022-02-23 11:38:22', '2022-02-23 11:38:22'),
(1805, 3, NULL, '689', 'Sreemangal', 'Active', '2022-02-23 11:38:34', '2022-02-23 11:38:34'),
(1806, 3, NULL, '691', 'Beanibazar', 'Active', '2022-02-23 11:38:34', '2022-02-23 11:38:34'),
(1807, 3, NULL, '690', 'Biswamvarpur', 'Active', '2022-02-23 11:38:50', '2022-02-23 11:38:50'),
(1808, 3, NULL, '691', 'Biswanath', 'Active', '2022-02-23 11:38:53', '2022-02-23 11:38:53'),
(1809, 3, NULL, '690', 'Chatak', 'Active', '2022-02-23 11:39:02', '2022-02-23 11:39:02'),
(1810, 3, NULL, '691', 'Companiganj', 'Active', '2022-02-23 11:39:10', '2022-02-23 11:39:10'),
(1811, 3, NULL, '690', 'Dakhin Sunamganj', 'Active', '2022-02-23 11:39:18', '2022-02-23 11:39:18'),
(1812, 3, NULL, '690', 'Derai', 'Active', '2022-02-23 11:39:26', '2022-02-23 11:39:26'),
(1813, 3, NULL, '691', 'Dakshin Surma', 'Active', '2022-02-23 11:39:32', '2022-02-23 11:39:32'),
(1814, 3, NULL, '690', 'Dharmapasha', 'Active', '2022-02-23 11:39:36', '2022-02-23 11:39:36'),
(1815, 3, NULL, '690', 'Doarabazar', 'Active', '2022-02-23 11:39:45', '2022-02-23 11:39:45'),
(1816, 3, NULL, '691', 'Fenchuganj', 'Active', '2022-02-23 11:39:48', '2022-02-23 11:39:48'),
(1817, 3, NULL, '690', 'Jagannathpur', 'Active', '2022-02-23 11:39:57', '2022-02-23 11:39:57'),
(1818, 3, NULL, '691', 'Golapganj', 'Active', '2022-02-23 11:40:06', '2022-02-23 11:40:06'),
(1819, 3, NULL, '690', 'Jamalganj', 'Active', '2022-02-23 11:40:06', '2022-02-23 11:40:06'),
(1820, 3, NULL, '690', 'Sulla', 'Active', '2022-02-23 11:40:15', '2022-02-23 11:40:15'),
(1821, 3, NULL, '691', 'Gowainghat', 'Active', '2022-02-23 11:40:25', '2022-02-23 11:40:25'),
(1822, 3, NULL, '690', 'Sunamganj-Sadar', 'Active', '2022-02-23 11:40:29', '2022-02-23 11:40:29'),
(1823, 3, NULL, '690', 'Tahirpur', 'Active', '2022-02-23 11:40:39', '2022-02-23 11:40:39'),
(1824, 3, NULL, '691', 'Jointiapur', 'Active', '2022-02-23 11:40:41', '2022-02-23 11:40:41'),
(1825, 3, NULL, '691', 'Zakiganj', 'Active', '2022-02-23 11:40:57', '2022-02-23 11:40:57'),
(1826, 3, NULL, '691', 'Sylhet-Sadar', 'Active', '2022-02-23 11:41:08', '2022-02-23 11:41:08'),
(1827, 3, NULL, '691', 'Kanaighat', 'Active', '2022-02-23 11:41:13', '2022-02-23 11:41:13'),
(1828, 3, NULL, '691', 'Osmaninagar', 'Active', '2022-02-23 11:41:29', '2022-02-23 11:41:29'),
(1829, 10, 1, '710', 'Mohammadpur(Dhaka)', 'Active', '2022-02-24 06:04:45', '2022-02-24 06:04:45'),
(1830, 10, 2, '710', 'Dhanmondi - Rd 3', 'Active', '2022-02-24 06:07:35', '2022-02-24 06:07:35'),
(1831, 10, 3, '710', 'Gulshan', 'Active', '2022-02-24 06:07:52', '2022-02-24 06:07:52'),
(1832, 10, 5, '710', 'Kallyanpur', 'Active', '2022-02-24 06:08:17', '2022-02-24 06:08:17'),
(1833, 10, 6, '710', 'Shyamoli', 'Active', '2022-02-24 06:08:39', '2022-02-24 06:08:39'),
(1834, 10, 7, '710', 'Adabor', 'Active', '2022-02-24 06:12:41', '2022-02-24 06:12:41'),
(1835, 10, 8, '710', 'Darussalam', 'Active', '2022-02-24 06:12:58', '2022-02-24 06:12:58'),
(1836, 10, 9, '710', 'Gabtoli', 'Active', '2022-02-24 06:13:15', '2022-02-24 06:13:15'),
(1837, 10, 10, '710', 'Pallabi', 'Active', '2022-02-24 06:13:30', '2022-02-24 06:13:30'),
(1838, 10, 11, '710', 'Lalmatia', 'Active', '2022-02-24 06:13:46', '2022-02-24 06:13:46'),
(1839, 10, 12, '710', 'Mirpur DOHS', 'Active', '2022-02-24 06:14:05', '2022-02-24 06:14:05'),
(1840, 10, 13, '710', 'Kochukhet', 'Active', '2022-02-24 06:14:53', '2022-02-24 06:14:53'),
(1841, 10, 14, '710', 'Gudaraghat (Badda)', 'Active', '2022-02-24 06:15:10', '2022-02-24 06:15:10'),
(1842, 10, 17, '710', 'Agargaon', 'Active', '2022-02-24 06:15:28', '2022-02-24 06:15:28'),
(1843, 10, 18, '710', 'Monipur', 'Active', '2022-02-24 06:15:43', '2022-02-24 06:15:43'),
(1844, 10, 19, '710', 'Sher-E-Bangla Nagar', 'Active', '2022-02-24 06:16:03', '2022-02-24 06:16:03'),
(1845, 10, 20, '710', 'Ibrahimpur', 'Active', '2022-02-24 06:16:18', '2022-02-24 06:16:18'),
(1846, 10, 21, '710', 'Cantonment Post Office', 'Active', '2022-02-24 06:16:31', '2022-02-24 06:16:31'),
(1847, 10, 22, '710', 'Mirpur Cantonment', 'Active', '2022-02-24 06:16:45', '2022-02-24 06:16:55'),
(1848, 10, 23, '710', 'Kafrul', 'Active', '2022-02-24 06:17:28', '2022-02-24 06:17:28'),
(1849, 10, 24, '710', 'Vashantek', 'Active', '2022-02-24 06:17:47', '2022-02-24 06:17:47'),
(1850, 10, 25, '710', 'Manikdi', 'Active', '2022-02-24 06:18:12', '2022-02-24 06:18:12'),
(1851, 10, 26, '710', 'Matikata', 'Active', '2022-02-24 06:18:25', '2022-02-24 06:18:25'),
(1852, 10, 27, '710', 'M.E.S', 'Active', '2022-02-24 06:18:49', '2022-02-24 06:18:49'),
(1853, 10, 28, '710', 'Rupnagar Residential Area', 'Active', '2022-02-24 06:19:17', '2022-02-24 06:19:17'),
(1854, 10, 29, '710', 'Duaripara', 'Active', '2022-02-24 06:19:29', '2022-02-24 06:19:29'),
(1855, 10, 30, '710', 'Rainkhola', 'Active', '2022-02-24 06:19:44', '2022-02-24 06:19:44'),
(1856, 10, 31, '710', 'Mirpur Diabari', 'Active', '2022-02-24 06:19:57', '2022-02-24 06:19:57'),
(1857, 10, 32, '710', 'Mazar Road', 'Active', '2022-02-24 06:20:11', '2022-02-24 06:20:11'),
(1858, 10, 33, '710', 'Shagufta', 'Active', '2022-02-24 06:20:25', '2022-02-24 06:20:25'),
(1859, 10, 34, '710', 'Bawnia', 'Active', '2022-02-24 06:20:38', '2022-02-24 06:22:22'),
(1860, 10, 35, '710', 'Baigertek', 'Active', '2022-02-24 06:20:52', '2022-02-24 06:20:52'),
(1861, 10, 36, '710', 'Madina nagar', 'Active', '2022-02-24 06:21:05', '2022-02-24 06:21:05'),
(1862, 10, 37, '710', 'Dewanpara', 'Active', '2022-02-24 06:21:18', '2022-02-24 06:21:18'),
(1863, 10, 39, '710', 'Namapara', 'Active', '2022-02-24 06:25:40', '2022-02-24 06:25:40'),
(1864, 10, 40, '710', 'Mastertek', 'Active', '2022-02-24 06:25:55', '2022-02-24 06:25:55'),
(1865, 10, 41, '710', 'Balughat', 'Active', '2022-02-24 06:26:12', '2022-02-24 06:26:12'),
(1866, 10, 42, '710', 'Barontek', 'Active', '2022-02-24 06:26:24', '2022-02-24 06:26:24'),
(1867, 10, 43, '710', 'Goltek', 'Active', '2022-02-24 06:29:23', '2022-02-24 06:29:23'),
(1868, 10, 44, '710', 'Kurmitola', 'Active', '2022-02-24 06:29:35', '2022-02-24 06:29:35'),
(1869, 10, 45, '710', 'Shewra', 'Active', '2022-02-24 06:29:47', '2022-02-24 06:29:47'),
(1870, 10, 46, '710', 'Ainusbag', 'Active', '2022-02-24 06:30:11', '2022-02-24 06:30:11'),
(1871, 10, 47, '710', 'Uttarkhan', 'Active', '2022-02-24 06:30:23', '2022-02-24 06:30:23'),
(1872, 10, 48, '710', 'Dakshinkhan', 'Active', '2022-02-24 06:30:34', '2022-02-24 06:30:34'),
(1873, 10, 49, '710', 'Fayedabad', 'Active', '2022-02-24 06:30:52', '2022-02-24 06:30:52'),
(1874, 10, 50, '710', 'Ashkona', 'Active', '2022-02-24 06:31:05', '2022-02-24 06:31:05'),
(1875, 10, 51, '710', 'Kuril', 'Active', '2022-02-24 06:31:20', '2022-02-24 06:31:20'),
(1876, 10, 53, '710', 'Savar', 'Active', '2022-02-24 06:31:33', '2022-02-24 06:31:33'),
(1877, 10, 61, '710', 'Savar Cantonment', 'Active', '2022-02-24 06:31:49', '2022-02-24 06:32:07'),
(1878, 10, 63, '710', 'Tongi', 'Active', '2022-02-24 06:32:22', '2022-02-24 06:32:22'),
(1879, 10, 66, '710', 'Khilkhet', 'Active', '2022-02-24 06:33:09', '2022-02-24 06:33:09'),
(1880, 10, 67, '710', 'Nikunja', 'Active', '2022-02-24 06:33:22', '2022-02-24 06:33:22'),
(1881, 10, 68, '710', 'Sonali Bank Staff Quarter', 'Active', '2022-02-24 06:34:05', '2022-02-24 06:34:05'),
(1882, 10, 69, '710', 'Hajipara (Rampura)', 'Active', '2022-02-24 06:34:26', '2022-02-24 06:34:26'),
(1883, 10, 70, '710', 'Kawla', 'Active', '2022-02-24 06:34:37', '2022-02-24 06:34:37'),
(1884, 10, 71, '710', 'Naddapara (Dakshinkhan Hub )', 'Active', '2022-02-24 06:34:55', '2022-02-24 06:34:55'),
(1885, 10, 72, '710', 'Bashundhara R/A', 'Active', '2022-02-24 06:35:26', '2022-02-24 06:35:26'),
(1886, 10, 73, '710', 'Vatara', 'Active', '2022-02-24 06:35:37', '2022-02-24 06:35:37'),
(1887, 10, 74, '710', 'Nadda', 'Active', '2022-02-24 06:35:52', '2022-02-24 06:35:52'),
(1888, 10, 75, '710', 'Baridhara', 'Active', '2022-02-24 06:36:02', '2022-02-24 06:36:02'),
(1889, 10, 76, '710', 'Baridhara DOHS', 'Active', '2022-02-24 06:36:12', '2022-02-24 06:36:12'),
(1890, 10, 77, '710', 'Notun Bazar', 'Active', '2022-02-24 06:36:28', '2022-02-24 06:36:28'),
(1891, 10, 78, '710', 'Adarsha Nagar (Badda)', 'Active', '2022-02-24 06:36:48', '2022-02-24 06:36:48'),
(1892, 10, 79, '710', 'Shahjadpur', 'Active', '2022-02-24 06:37:16', '2022-02-24 06:37:16'),
(1893, 10, 80, '710', 'Uttor Badda', 'Active', '2022-02-24 06:38:38', '2022-02-24 06:38:38'),
(1894, 10, 81, '710', 'Middle Badda', 'Active', '2022-02-24 06:44:58', '2022-02-24 06:44:58'),
(1895, 10, 82, '710', 'South Badda', 'Active', '2022-02-24 06:45:09', '2022-02-24 06:45:09'),
(1896, 10, 83, '710', 'Merul Badda', 'Active', '2022-02-24 06:45:27', '2022-02-24 06:45:27'),
(1897, 10, 84, '710', 'Niketon', 'Active', '2022-02-24 06:45:40', '2022-02-24 06:45:40'),
(1898, 10, 85, '710', 'Banani', 'Active', '2022-02-24 06:45:52', '2022-02-24 06:45:52'),
(1899, 10, 86, '710', 'Banani DOHS', 'Active', '2022-02-24 06:46:04', '2022-02-24 06:46:04'),
(1900, 10, 87, '710', 'Mohakhali', 'Active', '2022-02-24 06:46:15', '2022-02-24 06:46:15'),
(1901, 10, 88, '710', 'Mohakhali DOHS', 'Active', '2022-02-24 06:46:30', '2022-02-24 06:46:30'),
(1902, 10, 89, '710', 'South Monipur', 'Active', '2022-02-24 06:46:41', '2022-02-24 06:46:41'),
(1903, 10, 90, '710', 'Shah Ali Bag', 'Active', '2022-02-24 06:46:51', '2022-02-24 06:46:51'),
(1904, 10, 91, '710', 'Aziz Palli', 'Active', '2022-02-24 06:47:05', '2022-02-24 06:47:05'),
(1905, 10, 92, '710', 'Bashtola', 'Active', '2022-02-24 06:47:34', '2022-02-24 06:47:34'),
(1906, 10, 93, '710', 'South Baridhara DIT Project', 'Active', '2022-02-24 06:48:04', '2022-02-24 06:48:04'),
(1907, 10, 94, '710', 'Aftabnagar', 'Active', '2022-02-24 06:48:23', '2022-02-24 06:48:23'),
(1908, 10, 95, '710', 'Bijoy Shoroni', 'Active', '2022-02-24 06:48:35', '2022-02-24 06:48:35'),
(1909, 10, 96, '710', 'Farmgate', 'Active', '2022-02-24 06:48:45', '2022-02-24 06:48:45'),
(1910, 10, 97, '710', 'Indira Road', 'Active', '2022-02-24 06:48:56', '2022-02-24 06:48:56'),
(1911, 10, 98, '710', 'Tejgaon', 'Active', '2022-02-24 06:49:08', '2022-02-24 06:49:08'),
(1912, 10, 99, '710', 'Tejkunipara', 'Active', '2022-02-24 06:49:17', '2022-02-24 06:49:17'),
(1913, 10, 100, '710', 'Razabazar', 'Active', '2022-02-24 06:49:33', '2022-02-24 06:49:33'),
(1914, 10, 101, '710', 'Sukrabad', 'Active', '2022-02-24 06:49:45', '2022-02-24 06:49:45'),
(1915, 10, 102, '710', 'Panthopath', 'Active', '2022-02-24 06:50:11', '2022-02-24 06:50:11'),
(1916, 10, 103, '710', 'Kalabagan', 'Active', '2022-02-24 06:50:20', '2022-02-24 06:50:20'),
(1917, 10, 104, '710', 'Green Road', 'Active', '2022-02-24 06:50:31', '2022-02-24 06:50:31'),
(1918, 10, 105, '710', 'Manik Mia Avenue', 'Active', '2022-02-24 06:50:41', '2022-02-24 06:50:41'),
(1919, 10, 106, '710', 'Asad Avenue', 'Active', '2022-02-24 06:50:59', '2022-02-24 06:50:59'),
(1920, 10, 107, '710', 'West Dhanmondi', 'Active', '2022-02-24 06:51:10', '2022-02-24 06:51:10'),
(1921, 10, 108, '710', 'Shankar', 'Active', '2022-02-24 06:51:45', '2022-02-24 06:51:45'),
(1922, 10, 109, '710', 'Rayer Bazar', 'Active', '2022-02-24 06:52:04', '2022-02-24 06:52:04'),
(1923, 10, 110, '710', 'Tallabag', 'Active', '2022-02-24 06:52:23', '2022-02-24 06:52:23'),
(1924, 10, 111, '710', 'Hazaribag', 'Active', '2022-02-24 06:52:34', '2022-02-24 06:52:34'),
(1925, 10, 112, '710', 'Pilkhana', 'Active', '2022-02-24 06:52:44', '2022-02-24 06:52:44'),
(1926, 10, 113, '710', 'Nawabgonj Puran Dhaka', 'Active', '2022-02-24 06:52:57', '2022-02-24 06:52:57'),
(1927, 10, 114, '710', 'New Market', 'Active', '2022-02-24 06:53:08', '2022-02-24 06:53:08'),
(1928, 10, 115, '710', 'Azimpur', 'Active', '2022-02-24 06:53:25', '2022-02-24 06:53:25'),
(1929, 10, 116, '710', 'Nilkhet', 'Active', '2022-02-24 06:53:35', '2022-02-24 06:53:35'),
(1930, 10, 117, '710', 'Lalbagh', 'Active', '2022-02-24 06:53:47', '2022-02-24 06:53:47'),
(1931, 10, 118, '710', 'Chawkbazar (Dhaka)', 'Active', '2022-02-24 06:54:00', '2022-02-24 06:54:00'),
(1932, 10, 119, '710', 'Naya Bazar', 'Active', '2022-02-24 06:54:23', '2022-02-24 06:54:23'),
(1933, 10, 120, '710', 'Tatibazar', 'Active', '2022-02-24 06:54:35', '2022-02-24 06:54:35'),
(1934, 10, 121, '710', 'Luxmi Bazar', 'Active', '2022-02-24 06:54:48', '2022-02-24 06:54:48'),
(1935, 10, 123, '710', 'Puran Dhaka', 'Active', '2022-02-24 06:55:21', '2022-02-24 06:55:21'),
(1936, 10, 124, '710', 'Siddique Bazar', 'Active', '2022-02-24 06:55:32', '2022-02-24 06:55:32'),
(1937, 10, 125, '710', 'Tikatuly', 'Active', '2022-02-24 06:55:41', '2022-02-24 06:55:41'),
(1938, 10, 126, '710', 'Motijheel', 'Active', '2022-02-24 06:55:50', '2022-02-24 06:55:50'),
(1939, 10, 127, '710', 'Nawabpur', 'Active', '2022-02-24 06:56:01', '2022-02-24 06:56:01'),
(1940, 10, 128, '710', 'Kaptan Bazar', 'Active', '2022-02-24 06:56:16', '2022-02-24 06:56:16'),
(1941, 10, 129, '710', 'Gulistan', 'Active', '2022-02-24 06:56:27', '2022-02-24 06:56:27'),
(1942, 10, 130, '710', 'Bongo Bazar', 'Active', '2022-02-24 06:56:41', '2022-02-24 06:56:41'),
(1943, 10, 131, '710', 'Chankarpul', 'Active', '2022-02-24 06:56:58', '2022-02-24 06:56:58'),
(1944, 10, 132, '710', 'Palashi', 'Active', '2022-02-24 06:57:10', '2022-02-24 06:57:10'),
(1945, 10, 133, '710', 'Dhakeshwari', 'Active', '2022-02-24 06:57:20', '2022-02-24 06:57:20'),
(1946, 10, 134, '710', 'Kamalapur', 'Active', '2022-02-24 06:57:32', '2022-02-24 06:57:32'),
(1947, 10, 135, '710', 'Wari', 'Active', '2022-02-24 06:57:43', '2022-02-24 06:57:43'),
(1948, 10, 136, '710', 'Narinda', 'Active', '2022-02-24 06:57:55', '2022-02-24 06:58:19'),
(1949, 10, 137, '710', 'Dainik Bangla Mor', 'Active', '2022-02-24 06:58:30', '2022-02-24 06:58:59'),
(1950, 10, 139, '710', 'Fakirapul', 'Active', '2022-02-24 06:59:19', '2022-02-24 06:59:29'),
(1951, 10, 140, '710', 'Kakrail', 'Active', '2022-02-24 06:59:55', '2022-02-24 06:59:55'),
(1952, 10, 141, '710', 'Naya Paltan', 'Active', '2022-02-24 07:00:10', '2022-02-24 07:00:10'),
(1953, 10, 142, '710', 'Bijoynagar (Paltan)', 'Active', '2022-02-24 07:00:20', '2022-02-24 07:00:20'),
(1954, 10, 143, '710', 'Press Club', 'Active', '2022-02-24 07:00:37', '2022-02-24 07:00:37'),
(1955, 10, 144, '710', 'High Court', 'Active', '2022-02-24 07:00:56', '2022-02-24 07:00:56'),
(1956, 10, 145, '710', 'Dhaka University', 'Active', '2022-02-24 07:01:14', '2022-02-24 07:01:14'),
(1957, 10, 146, '710', 'Dhaka Medical', 'Active', '2022-02-24 07:01:27', '2022-02-24 07:01:27'),
(1958, 10, 147, '710', 'Bongo Bondhu Avenue', 'Active', '2022-02-24 07:01:40', '2022-02-24 07:01:40'),
(1959, 10, 148, '710', 'Kazi Nazrul Islam Avenue', 'Active', '2022-02-24 07:01:52', '2022-02-24 07:01:52'),
(1960, 10, 149, '710', 'Kawran Bazar', 'Active', '2022-02-24 07:02:04', '2022-02-24 07:02:04'),
(1961, 10, 150, '710', 'Ramna', 'Active', '2022-02-24 07:02:24', '2022-02-24 07:02:24'),
(1962, 10, 151, '710', 'Shantinagar', 'Active', '2022-02-24 07:02:35', '2022-02-24 07:02:35'),
(1963, 10, 152, '710', 'Shantibag', 'Active', '2022-02-24 07:02:49', '2022-02-24 07:02:49'),
(1964, 10, 153, '710', 'Baily Road', 'Active', '2022-02-24 07:03:01', '2022-02-24 07:03:01'),
(1965, 10, 154, '710', 'Minto Road', 'Active', '2022-02-24 07:03:11', '2022-02-24 07:03:11'),
(1966, 10, 155, '710', 'Old Elephant Road', 'Active', '2022-02-24 07:03:22', '2022-02-24 07:03:22'),
(1967, 10, 156, '710', 'Eskaton Garden Road', 'Active', '2022-02-24 07:03:33', '2022-02-24 07:03:33'),
(1968, 10, 157, '710', 'Eskaton', 'Active', '2022-02-24 07:03:43', '2022-02-24 07:03:43'),
(1969, 10, 158, '710', 'Moghbazar', 'Active', '2022-02-24 07:04:01', '2022-02-24 07:04:01'),
(1970, 10, 159, '710', 'Mouchak', 'Active', '2022-02-24 07:04:12', '2022-02-24 07:04:12'),
(1971, 10, 160, '710', 'Malibag', 'Active', '2022-02-24 07:04:24', '2022-02-24 07:04:24'),
(1972, 10, 161, '710', 'Rampura', 'Active', '2022-02-24 07:04:35', '2022-02-24 07:04:35'),
(1973, 10, 162, '710', 'Shahbag', 'Active', '2022-02-24 07:04:46', '2022-02-24 07:04:46'),
(1974, 10, 163, '710', 'Katabon', 'Active', '2022-02-24 07:04:58', '2022-02-24 07:04:58'),
(1975, 10, 164, '710', 'Hatirpool', 'Active', '2022-02-24 07:05:11', '2022-02-24 07:05:11'),
(1976, 10, 165, '710', 'Bashabo', 'Active', '2022-02-24 07:05:21', '2022-02-24 07:05:21'),
(1977, 10, 166, '710', 'Khilgaon', 'Active', '2022-02-24 07:05:34', '2022-02-24 07:05:34'),
(1978, 10, 167, '710', 'Middle Bashabo', 'Active', '2022-02-24 07:05:47', '2022-02-24 07:05:47'),
(1979, 10, 168, '710', 'Goran', 'Active', '2022-02-24 07:06:12', '2022-02-24 07:06:12'),
(1980, 10, 169, '710', 'Madartek', 'Active', '2022-02-24 07:06:27', '2022-02-24 07:06:27'),
(1981, 10, 170, '710', 'Manik Nagar', 'Active', '2022-02-24 07:06:38', '2022-02-24 07:06:38'),
(1982, 10, 171, '710', 'Shahjahanpur', 'Active', '2022-02-24 07:06:48', '2022-02-24 07:06:48'),
(1983, 10, 172, '710', 'Banasree (Rampura)', 'Active', '2022-02-24 07:07:01', '2022-02-24 07:07:01'),
(1984, 10, 173, '710', 'Meradia', 'Active', '2022-02-24 07:07:17', '2022-02-24 07:07:17'),
(1985, 10, 174, '710', 'Khilbari Tek (Badda)', 'Active', '2022-02-24 07:07:33', '2022-02-24 07:07:33'),
(1986, 10, 175, '710', 'Bawaliapara (Narayangaj)', 'Active', '2022-02-24 07:07:45', '2022-02-24 07:07:45'),
(1987, 10, 177, '710', 'Mughdapara', 'Active', '2022-02-24 07:08:04', '2022-02-24 07:08:04'),
(1988, 10, 178, '710', 'Golapbag (Dhaka)', 'Active', '2022-02-24 07:08:10', '2022-02-24 07:08:10'),
(1989, 10, 179, '710', 'Jatrabari', 'Active', '2022-02-24 07:08:19', '2022-02-24 07:08:19'),
(1990, 10, 181, '710', 'Hatirjheel', 'Active', '2022-02-24 07:08:33', '2022-02-24 07:08:33'),
(1991, 10, 182, '710', 'Banglamotor', 'Active', '2022-02-24 07:08:49', '2022-02-24 07:08:49'),
(1992, 10, 183, '710', 'Paribag', 'Active', '2022-02-24 07:08:59', '2022-02-24 07:08:59'),
(1993, 10, 184, '710', 'Bakshibazar', 'Active', '2022-02-24 07:09:09', '2022-02-24 07:09:09'),
(1994, 10, 185, '710', 'Elephant Road', 'Active', '2022-02-24 07:09:21', '2022-02-24 07:09:21'),
(1995, 10, 186, '710', 'Kathalbagan', 'Active', '2022-02-24 07:09:31', '2022-02-24 07:09:31'),
(1996, 10, 187, '710', 'Malibagh Taltola', 'Active', '2022-02-24 07:09:42', '2022-02-24 07:09:42'),
(1997, 10, 188, '710', 'Central Road', 'Active', '2022-02-24 07:09:55', '2022-02-24 07:09:55'),
(1998, 10, 189, '710', 'Sabujbag', 'Active', '2022-02-24 07:10:05', '2022-02-24 07:10:05'),
(1999, 10, 190, '710', 'Shiddheswari', 'Active', '2022-02-24 07:10:14', '2022-02-24 07:10:14'),
(2000, 10, 263, '710', 'Dolaikhal', 'Active', '2022-02-24 07:10:24', '2022-02-24 07:10:24'),
(2001, 10, 266, '710', 'Shegunbagicha', 'Active', '2022-02-24 07:10:38', '2022-02-24 07:10:38'),
(2002, 10, 267, '710', 'Rajarbag', 'Active', '2022-02-24 07:10:53', '2022-02-24 07:10:53'),
(2003, 10, 269, '710', 'Babubazar', 'Active', '2022-02-24 07:11:10', '2022-02-24 07:11:10'),
(2004, 10, 270, '710', 'Islampur(Dhaka)', 'Active', '2022-02-24 07:11:29', '2022-02-24 07:11:29'),
(2005, 10, 271, '710', 'Imamgonj', 'Active', '2022-02-24 07:11:39', '2022-02-24 07:11:39'),
(2006, 10, 272, '710', 'Nayabazar', 'Active', '2022-02-24 07:11:50', '2022-02-24 07:11:50'),
(2007, 10, 273, '710', 'Zigatola', 'Active', '2022-02-24 07:12:01', '2022-02-24 07:12:01'),
(2008, 10, 275, '710', 'Kazipara', 'Active', '2022-02-24 07:12:17', '2022-02-24 07:12:17'),
(2009, 10, 276, '710', 'Shewrapara', 'Active', '2022-02-24 07:12:29', '2022-02-24 07:12:29'),
(2010, 10, 277, '710', 'Kalshi', 'Active', '2022-02-24 07:12:39', '2022-02-24 07:12:39'),
(2011, 10, 278, '710', 'Demra', 'Active', '2022-02-24 07:12:49', '2022-02-24 07:12:49'),
(2012, 10, 282, '710', 'Ashulia', 'Active', '2022-02-24 07:13:02', '2022-02-24 07:13:02'),
(2013, 10, 283, '710', 'Amin Bazar', 'Active', '2022-02-24 07:13:15', '2022-02-24 07:13:15'),
(2014, 10, 284, '710', 'Sutrapur', 'Active', '2022-02-24 07:13:27', '2022-02-24 07:13:27'),
(2015, 10, 286, '710', 'Kamrangichar', 'Active', '2022-02-24 07:13:38', '2022-02-24 07:13:38'),
(2016, 10, 288, '710', 'Purana Paltan', 'Active', '2022-02-24 07:14:11', '2022-02-24 07:14:11'),
(2017, 10, 292, '710', 'Shyampur', 'Active', '2022-02-24 07:14:22', '2022-02-24 07:14:22'),
(2018, 10, 296, '710', 'Dholaipar', 'Active', '2022-02-24 07:14:31', '2022-02-24 07:14:31'),
(2019, 10, 305, '710', 'Keranigonj', 'Active', '2022-02-24 07:14:43', '2022-02-24 07:14:43'),
(2020, 10, 306, '710', 'Monipuripara', 'Active', '2022-02-24 07:14:54', '2022-02-24 07:14:54'),
(2021, 10, 309, '710', 'Bosila', 'Active', '2022-02-24 07:15:04', '2022-02-24 07:15:04'),
(2022, 10, 313, '710', 'Shonir Akhra', 'Active', '2022-02-24 07:15:18', '2022-02-24 07:15:18'),
(2023, 10, 315, '710', 'Mirpur 2', 'Active', '2022-02-24 07:15:31', '2022-02-24 07:15:31'),
(2024, 10, 316, '710', 'Bongshal', 'Active', '2022-02-24 07:15:43', '2022-02-24 07:15:43'),
(2025, 10, 319, '710', 'Siddweswari', 'Active', '2022-02-24 07:15:57', '2022-02-24 07:15:57'),
(2026, 10, 323, '710', 'Nakhalpara', 'Active', '2022-02-24 07:16:10', '2022-02-24 07:16:10'),
(2027, 10, 324, '710', 'Dokshingaon', 'Active', '2022-02-24 07:16:20', '2022-02-24 07:16:20'),
(2028, 10, 325, '710', 'Joar Shahara', 'Active', '2022-02-24 07:16:33', '2022-02-24 07:16:33'),
(2029, 10, 326, '710', 'Science Lab', 'Active', '2022-02-24 07:16:49', '2022-02-24 07:16:49'),
(2030, 10, 327, '710', 'Sobhanbag', 'Active', '2022-02-24 07:17:06', '2022-02-24 07:17:06'),
(2031, 10, 329, '710', 'ECB Chattar', 'Active', '2022-02-24 07:17:22', '2022-02-24 07:17:22'),
(2032, 10, 334, '710', 'Arambag (Motijheel)', 'Active', '2022-02-24 07:17:34', '2022-02-24 07:17:34'),
(2033, 10, 346, '710', 'Armanitola', 'Active', '2022-02-24 07:17:45', '2022-02-24 07:17:45'),
(2034, 10, 349, '710', 'Islambag', 'Active', '2022-02-24 07:17:55', '2022-02-24 07:17:55'),
(2035, 10, 352, '710', 'Kamarpara', 'Active', '2022-02-24 07:18:06', '2022-02-24 07:18:06'),
(2036, 10, 354, '710', 'Mitford', 'Active', '2022-02-24 07:18:17', '2022-02-24 07:18:17'),
(2037, 10, 355, '710', 'Shakhari Bazar', 'Active', '2022-02-24 07:18:29', '2022-02-24 07:18:29'),
(2038, 10, 356, '710', 'Katherpol', 'Active', '2022-02-24 07:18:48', '2022-02-24 07:18:48'),
(2039, 10, 357, '710', 'Bangla Bazar', 'Active', '2022-02-24 07:18:59', '2022-02-24 07:18:59'),
(2040, 10, 358, '710', 'Patuatuly', 'Active', '2022-02-24 07:19:09', '2022-02-24 07:19:09'),
(2041, 10, 359, '710', 'Dohar', 'Active', '2022-02-24 07:25:27', '2022-02-24 07:25:27'),
(2042, 10, 365, '710', 'Dhamrai', 'Active', '2022-02-24 07:25:43', '2022-02-24 07:25:43'),
(2043, 10, 396, '710', 'Nandipara', 'Active', '2022-02-24 07:25:55', '2022-02-24 07:25:55'),
(2044, 10, 397, '710', 'Nazira Bazar', 'Active', '2022-02-24 07:26:10', '2022-02-24 07:26:10'),
(2045, 10, 403, '710', 'Gopibag', 'Active', '2022-02-24 07:26:23', '2022-02-24 07:26:23'),
(2046, 10, 404, '710', 'Shwamibag', 'Active', '2022-02-24 07:26:36', '2022-02-24 07:26:36'),
(2047, 10, 405, '710', 'Sayedabad', 'Active', '2022-02-24 07:27:03', '2022-02-24 07:27:03'),
(2048, 10, 406, '710', 'Sadarghat (Dhaka)', 'Active', '2022-02-24 07:27:24', '2022-02-24 07:27:24'),
(2049, 10, 407, '710', 'Kaltabazar', 'Active', '2022-02-24 07:27:33', '2022-02-24 07:27:33'),
(2050, 10, 408, '710', 'Jurain', 'Active', '2022-02-24 07:27:49', '2022-02-24 07:27:49'),
(2051, 10, 409, '710', 'Gandaria', 'Active', '2022-02-24 07:27:56', '2022-02-24 07:27:56'),
(2052, 10, 411, '710', 'RayerBag', 'Active', '2022-02-24 07:28:16', '2022-02-24 07:28:16'),
(2053, 10, 412, '710', 'Faridabad (Jatrabari)', 'Active', '2022-02-24 07:28:22', '2022-02-24 07:28:22'),
(2054, 10, 413, '710', 'Matuail', 'Active', '2022-02-24 07:28:35', '2022-02-24 07:28:35'),
(2055, 10, 414, '710', 'Donia', 'Active', '2022-02-24 07:28:45', '2022-02-24 07:28:45'),
(2056, 10, 415, '710', 'Postogola', 'Active', '2022-02-24 07:29:00', '2022-02-24 07:29:00'),
(2057, 10, 417, '710', 'Konapara', 'Active', '2022-02-24 07:29:15', '2022-02-24 07:29:15'),
(2058, 10, 418, '710', 'Dhaka Uddyan', 'Active', '2022-02-24 07:29:26', '2022-02-24 07:29:26'),
(2059, 10, 426, '710', 'Shekhertek', 'Active', '2022-02-24 07:29:34', '2022-02-24 07:29:34'),
(2060, 10, 446, '710', 'Nawabgonj (Dhaka)', 'Active', '2022-02-24 07:29:53', '2022-02-24 07:29:53'),
(2061, 10, 448, '710', 'CWH', 'Active', '2022-02-24 07:30:04', '2022-02-24 07:30:04'),
(2062, 10, 449, '710', 'Mirpur Taltola', 'Active', '2022-02-24 07:30:16', '2022-02-24 07:30:16'),
(2063, 10, 638, '711', 'Alfadanga', 'Active', '2022-02-24 07:30:41', '2022-02-24 08:44:34'),
(2064, 10, 639, '711', 'Bhanga', 'Active', '2022-02-24 07:30:53', '2022-02-24 08:47:45'),
(2065, 10, 640, '711', 'Boalmari', 'Active', '2022-02-24 07:31:09', '2022-02-24 08:46:43'),
(2066, 10, 641, '711', 'Char Bhadrasan', 'Active', '2022-02-24 07:31:20', '2022-02-24 07:42:12'),
(2067, 10, 642, '711', 'Faridpur Sadar', 'Active', '2022-02-24 07:31:36', '2022-02-24 08:47:09'),
(2068, 10, 643, '711', 'Madhukhali', 'Active', '2022-02-24 07:31:46', '2022-02-24 07:42:30'),
(2069, 10, 644, '711', 'Nagarkanda', 'Active', '2022-02-24 07:32:03', '2022-02-24 08:44:51'),
(2070, 10, 645, '711', 'Sadarpur', 'Active', '2022-02-24 07:32:11', '2022-02-24 07:42:59'),
(2071, 10, 646, '711', 'Saltha', 'Active', '2022-02-24 07:32:21', '2022-02-24 07:43:36'),
(2072, 10, 647, '712', 'Chowrasta (Gazipur)', 'Active', '2022-02-24 07:32:33', '2022-02-24 08:49:53'),
(2073, 10, 648, '712', 'Kaliakoir', 'Active', '2022-02-24 07:32:44', '2022-02-24 07:44:17'),
(2074, 10, 649, '712', 'Kaliganj(Gazipur)', 'Active', '2022-02-24 07:33:00', '2022-02-24 07:33:00'),
(2075, 10, 650, '712', 'Kapasia', 'Active', '2022-02-24 07:33:26', '2022-02-24 07:44:37'),
(2076, 10, 651, '712', 'Sreepur(Gazipur)', 'Active', '2022-02-24 07:33:39', '2022-02-24 07:44:26'),
(2077, 10, 652, '713', 'Gopalganj Sadar', 'Active', '2022-02-24 07:33:49', '2022-02-24 07:45:17'),
(2078, 10, 653, '713', 'Kasiani', 'Active', '2022-02-24 07:34:01', '2022-02-24 07:45:38'),
(2079, 10, 654, '713', 'Kotalipara', 'Active', '2022-02-24 07:34:14', '2022-02-24 07:45:47'),
(2080, 10, 655, '713', 'Maksudpur', 'Active', '2022-02-24 07:34:24', '2022-02-24 07:45:58'),
(2081, 10, 656, '713', 'Tungipara', 'Active', '2022-02-24 07:34:57', '2022-02-24 07:46:33'),
(2082, 10, 657, '733', 'Bakshiganj', 'Active', '2022-02-24 07:35:12', '2022-02-24 07:46:50'),
(2083, 10, 658, '733', 'Dewanganj', 'Active', '2022-02-24 07:35:25', '2022-02-24 07:47:12'),
(2084, 10, 659, '733', 'Islampur(Jamalpur)', 'Active', '2022-02-24 07:35:53', '2022-02-24 07:47:25'),
(2085, 10, 660, '733', 'Jamalpur Sadar', 'Active', '2022-02-24 07:36:06', '2022-02-24 07:47:46'),
(2086, 10, 661, '733', 'Madarganj', 'Active', '2022-02-24 07:36:19', '2022-02-24 07:48:27'),
(2087, 10, 662, '733', 'Melandah', 'Active', '2022-02-24 07:36:30', '2022-02-24 07:48:42'),
(2088, 10, 663, '733', 'Sharishabari', 'Active', '2022-02-24 07:36:38', '2022-02-24 07:49:02'),
(2089, 10, 664, '714', 'Austogram', 'Active', '2022-02-24 07:37:05', '2022-02-24 07:49:58'),
(2090, 10, 665, '714', 'Bajitpur', 'Active', '2022-02-24 07:37:15', '2022-02-24 07:50:17'),
(2091, 10, 666, '714', 'Bhairab', 'Active', '2022-02-24 07:37:26', '2022-02-24 07:50:34'),
(2092, 10, 667, '714', 'Hosainpur', 'Active', '2022-02-24 07:37:39', '2022-02-24 07:50:48'),
(2093, 10, 668, '714', 'Itna', 'Active', '2022-02-24 07:37:52', '2022-02-24 07:51:22'),
(2094, 10, 669, '714', 'Karimganj', 'Active', '2022-02-24 07:38:01', '2022-02-24 07:51:34'),
(2095, 10, 670, '714', 'Katiadi', 'Active', '2022-02-24 07:38:13', '2022-02-24 07:51:45'),
(2096, 10, 671, '714', 'Kishoreganj Sadar', 'Active', '2022-02-24 07:38:26', '2022-02-24 07:52:04'),
(2097, 10, 672, '714', 'Kuliarchar', 'Active', '2022-02-24 07:38:37', '2022-02-24 07:52:16'),
(2098, 10, 673, '714', 'Mithamain', 'Active', '2022-02-24 07:38:49', '2022-02-24 07:52:39'),
(2099, 10, 674, '714', 'Nikli', 'Active', '2022-02-24 07:39:01', '2022-02-24 07:52:59'),
(2100, 10, 675, '714', 'Pakundia', 'Active', '2022-02-24 07:53:27', '2022-02-24 08:18:50'),
(2101, 10, 676, '714', 'Tarail', 'Active', '2022-02-24 07:53:44', '2022-02-24 08:19:12'),
(2102, 10, 677, '715', 'Kalkini', 'Active', '2022-02-24 07:54:08', '2022-02-24 08:25:04'),
(2103, 10, 678, '715', 'Madaripur Sadar', 'Active', '2022-02-24 07:54:30', '2022-02-24 08:29:12'),
(2104, 10, 679, '715', 'Rajoir', 'Active', '2022-02-24 07:54:45', '2022-02-24 08:29:28'),
(2105, 10, 680, '715', 'Shibchar', 'Active', '2022-02-24 07:55:12', '2022-02-24 08:30:09'),
(2106, 10, 681, '98', 'Daulatpur(Manikganj)', 'Active', '2022-02-24 07:55:30', '2022-02-24 08:28:45'),
(2107, 10, 682, '98', 'Ghior', 'Active', '2022-02-24 08:17:30', '2022-02-24 08:30:35'),
(2108, 10, 683, '716', 'Harirampur (Manikganj)', 'Active', '2022-02-24 09:02:10', '2022-02-24 09:02:10'),
(2109, 10, 684, '716', 'Manikganj Sadar', 'Active', '2022-02-24 09:02:38', '2022-02-24 09:02:38'),
(2110, 10, 685, '716', 'Saturia', 'Active', '2022-02-24 09:03:11', '2022-02-24 09:03:11'),
(2111, 10, 686, '716', 'Shibalaya', 'Active', '2022-02-24 09:03:37', '2022-02-24 09:03:37'),
(2112, 10, 687, '716', 'Singair', 'Active', '2022-02-24 09:03:50', '2022-02-24 09:03:50'),
(2113, 10, 688, '717', 'Gazaria', 'Active', '2022-02-24 09:04:07', '2022-02-24 09:04:07'),
(2114, 10, 689, '717', 'Lauhajang', 'Active', '2022-02-24 09:04:25', '2022-02-24 09:04:25'),
(2115, 10, 690, '717', 'Katakhali (Munshiganj)', 'Active', '2022-02-24 09:04:41', '2022-02-24 09:04:41'),
(2116, 10, 691, '717', 'Serajdikhan', 'Active', '2022-02-24 09:04:58', '2022-02-24 09:04:58'),
(2117, 10, 692, '717', 'Sreenagar', 'Active', '2022-02-24 09:05:29', '2022-02-24 09:05:29'),
(2118, 10, 693, '717', 'Tangibari', 'Active', '2022-02-24 09:05:45', '2022-02-24 09:05:45'),
(2120, 10, 694, '734', 'Valuka', 'Active', '2022-02-24 09:06:31', '2022-02-24 09:06:31'),
(2121, 10, 695, '734', 'Dhubaura', 'Active', '2022-02-24 09:06:45', '2022-02-24 09:06:45'),
(2122, 10, 696, '734', 'Fulbaria (Mymensingh)', 'Active', '2022-02-24 09:07:40', '2022-02-24 09:07:40'),
(2123, 10, 697, '734', 'Fulpur', 'Active', '2022-02-24 09:07:51', '2022-02-24 09:07:51'),
(2124, 10, 698, '734', 'Goffargaon', 'Active', '2022-02-24 09:08:05', '2022-02-24 09:08:05'),
(2125, 10, 699, '734', 'Koltapara (Gouripur Mymensingh)', 'Active', '2022-02-24 09:08:26', '2022-02-24 09:08:26'),
(2126, 10, 700, '734', 'Haluaghat', 'Active', '2022-02-24 09:08:39', '2022-02-24 09:08:39'),
(2127, 10, 701, '734', 'Iswarganj', 'Active', '2022-02-24 09:08:52', '2022-02-24 09:08:52'),
(2128, 10, 702, '734', 'Kacharighat (Mymensingh)', 'Active', '2022-02-24 09:09:05', '2022-02-24 09:09:05'),
(2129, 10, 703, '734', 'Muktagacha', 'Active', '2022-02-24 09:09:16', '2022-02-24 09:09:16'),
(2130, 10, 704, '734', 'Nandail', 'Active', '2022-02-24 09:09:29', '2022-02-24 09:09:29'),
(2131, 10, 705, '734', 'Trishal', 'Active', '2022-02-24 09:09:40', '2022-02-24 09:09:40'),
(2132, 10, 706, '718', 'Araihazar', 'Active', '2022-02-24 09:09:58', '2022-02-24 09:09:58'),
(2133, 10, 707, '718', 'Bandar (Narayanganj)', 'Active', '2022-02-24 09:10:18', '2022-02-24 09:10:18'),
(2134, 10, 708, '718', 'Chashara (Narayanganj)', 'Active', '2022-02-24 09:10:50', '2022-02-24 09:10:50'),
(2135, 10, 709, '718', 'Rupganj', 'Active', '2022-02-24 09:11:14', '2022-02-24 09:11:14'),
(2136, 10, 710, '718', 'Sonargaon', 'Active', '2022-02-24 09:11:29', '2022-02-24 09:11:29'),
(2137, 10, 711, '719', 'Belabo', 'Active', '2022-02-24 09:12:02', '2022-02-24 09:12:02'),
(2138, 10, 712, '719', 'Monohardi', 'Active', '2022-02-24 09:12:15', '2022-02-24 09:12:15'),
(2139, 10, 713, '719', 'Velanogor (Narsingdi)', 'Active', '2022-02-24 09:12:29', '2022-02-24 09:12:29'),
(2140, 10, 714, '719', 'Palash', 'Active', '2022-02-24 09:12:42', '2022-02-24 09:12:42'),
(2141, 10, 715, '719', 'Raipura (Bhairab)', 'Active', '2022-02-24 09:12:56', '2022-02-24 09:12:56'),
(2142, 10, 716, '719', 'Shibpur', 'Active', '2022-02-24 09:13:20', '2022-02-24 09:13:20'),
(2143, 10, 717, '735', 'Atpara', 'Active', '2022-02-24 09:13:40', '2022-02-24 09:13:52'),
(2144, 10, 718, '735', 'Barhatta', 'Active', '2022-02-24 09:15:08', '2022-02-24 09:15:08'),
(2145, 10, 719, '735', 'Durgapur(Netrokona)', 'Active', '2022-02-24 09:15:26', '2022-02-24 09:15:26'),
(2146, 10, 720, '735', 'Kalmakanda', 'Active', '2022-02-24 09:15:44', '2022-02-24 09:15:44'),
(2147, 10, 721, '735', 'Kendua', 'Active', '2022-02-24 09:15:57', '2022-02-24 09:15:57'),
(2148, 10, 722, '735', 'Khaliajuri', 'Active', '2022-02-24 09:16:15', '2022-02-24 09:16:15'),
(2149, 10, 723, '735', 'Madan', 'Active', '2022-02-24 09:18:01', '2022-02-24 09:18:01'),
(2150, 10, 724, '735', 'Mohanganj', 'Active', '2022-02-24 09:18:15', '2022-02-24 09:18:15'),
(2151, 10, 725, '735', 'Netrokona Sadar', 'Active', '2022-02-24 09:18:30', '2022-02-24 09:18:30'),
(2152, 10, 726, '735', 'Purbadhala (Netrokona)', 'Active', '2022-02-24 09:18:42', '2022-02-24 09:18:42'),
(2153, 10, 727, '720', 'Baliakandi', 'Active', '2022-02-24 09:19:03', '2022-02-24 09:19:03'),
(2154, 10, 728, '720', 'Goalunda', 'Active', '2022-02-24 09:19:15', '2022-02-24 09:19:15'),
(2155, 10, 729, '720', 'Pangsha', 'Active', '2022-02-24 09:19:26', '2022-02-24 09:19:26'),
(2156, 10, 730, '720', 'Rajbari Sadar', 'Active', '2022-02-24 09:19:47', '2022-02-24 09:19:47'),
(2157, 10, 731, '720', 'Kalukhali', 'Active', '2022-02-24 09:19:58', '2022-02-24 09:19:58'),
(2158, 10, 732, '721', 'Bhedarganj', 'Active', '2022-02-24 09:20:28', '2022-02-24 09:20:28'),
(2159, 10, 733, '721', 'Damudiya', 'Active', '2022-02-24 09:20:46', '2022-02-24 09:20:46'),
(2160, 10, 734, '721', 'Gosairhat', 'Active', '2022-02-24 09:20:57', '2022-02-24 09:20:57'),
(2161, 10, 735, '721', 'Zajira', 'Active', '2022-02-24 09:21:11', '2022-02-24 09:21:11'),
(2162, 10, 736, '721', 'Naria', 'Active', '2022-02-24 09:21:24', '2022-02-24 09:21:24'),
(2163, 10, 737, '721', 'Shariatpur Sadar', 'Active', '2022-02-24 09:21:42', '2022-02-24 09:21:42'),
(2164, 10, 738, '736', 'Jhenaigati', 'Active', '2022-02-24 09:21:59', '2022-02-24 09:21:59'),
(2165, 10, 739, '736', 'Nakla', 'Active', '2022-02-24 09:22:12', '2022-02-24 09:22:12'),
(2166, 10, 740, '736', 'Nalitabari', 'Active', '2022-02-24 09:22:26', '2022-02-24 09:22:26'),
(2167, 10, 741, '736', 'Sherpur Sadar', 'Active', '2022-02-24 09:22:38', '2022-02-24 09:22:38'),
(2168, 10, 742, '736', 'Sribordi', 'Active', '2022-02-24 09:22:49', '2022-02-24 09:22:49'),
(2170, 10, 743, '722', 'Bashail', 'Active', '2022-02-24 09:23:50', '2022-02-24 09:23:50'),
(2171, 10, 744, '722', 'Bhuapur', 'Active', '2022-02-24 09:24:08', '2022-02-24 09:24:08'),
(2172, 10, 745, '722', 'Delduar', 'Active', '2022-02-24 09:24:19', '2022-02-24 09:24:19'),
(2173, 10, 746, '722', 'Ghatail', 'Active', '2022-02-24 09:24:28', '2022-02-24 09:24:28'),
(2174, 10, 747, '722', 'Gopalpur (Tangail)', 'Active', '2022-02-24 09:24:40', '2022-02-24 09:25:10'),
(2175, 10, 748, '722', 'Kalihati', 'Active', '2022-02-24 09:24:50', '2022-02-24 09:25:18'),
(2176, 10, 749, '722', 'Mirzapur', 'Active', '2022-02-24 09:25:54', '2022-02-24 09:25:54'),
(2177, 10, 750, '722', 'Modhupur', 'Active', '2022-02-24 09:26:04', '2022-02-24 09:26:04'),
(2178, 10, 751, '722', 'Nagarpur', 'Active', '2022-02-24 09:26:14', '2022-02-24 09:26:14'),
(2179, 10, 752, '722', 'Shakhipur', 'Active', '2022-02-24 09:26:25', '2022-02-24 09:26:25'),
(2180, 10, 753, '722', 'Tangail Sadar', 'Active', '2022-02-24 09:26:37', '2022-02-24 09:26:37'),
(2181, 10, 754, '722', 'Dhanbari', 'Active', '2022-02-24 09:26:48', '2022-02-24 09:26:48'),
(2183, 10, 755, '723', 'Bagerhat Sadar', 'Active', '2022-02-24 09:27:50', '2022-02-24 09:27:50'),
(2184, 10, 756, '723', 'Chitalmari', 'Active', '2022-02-24 09:28:10', '2022-02-24 09:28:10'),
(2185, 10, 757, '723', 'Fakirhat (Bagerhat)', 'Active', '2022-02-24 09:28:26', '2022-02-24 09:28:26'),
(2186, 10, 758, '723', 'Kachua(Bagerhat)', 'Active', '2022-02-24 09:28:45', '2022-02-24 09:28:45'),
(2187, 10, 759, '723', 'Mollarhat', 'Active', '2022-02-24 09:29:00', '2022-02-24 09:29:00'),
(2188, 10, 760, '723', 'Mongla', 'Active', '2022-02-24 09:29:14', '2022-02-24 09:29:14'),
(2189, 10, 761, '723', 'Morelganj', 'Active', '2022-02-24 09:29:40', '2022-02-24 09:29:40'),
(2190, 10, 762, '723', 'Rampal', 'Active', '2022-02-24 09:29:50', '2022-02-24 09:29:55'),
(2191, 10, 763, '723', 'Sarankhola', 'Active', '2022-02-24 09:30:10', '2022-02-24 09:30:10'),
(2192, 10, 764, '724', 'Alamdanga', 'Active', '2022-02-24 09:30:26', '2022-02-24 09:30:26'),
(2193, 10, 765, '724', 'Chuadanga Sadar', 'Active', '2022-02-24 09:30:39', '2022-02-24 09:30:39'),
(2194, 10, 766, '724', 'Damurhuda', 'Active', '2022-02-24 09:30:53', '2022-02-24 09:30:53'),
(2195, 10, 767, '724', 'Jibannagar', 'Active', '2022-02-24 09:31:04', '2022-02-24 09:31:04'),
(2196, 10, 768, '725', 'Noapara (Jessore)', 'Active', '2022-02-24 09:31:21', '2022-02-24 09:31:21'),
(2197, 10, 769, '725', 'Bagherpara', 'Active', '2022-02-24 09:31:31', '2022-02-24 09:31:31'),
(2198, 10, 770, '725', 'Chowgacha', 'Active', '2022-02-24 09:31:44', '2022-02-24 09:31:44'),
(2199, 10, 771, '725', 'Jessore Sadar', 'Active', '2022-02-24 09:32:03', '2022-02-24 09:32:03'),
(2200, 10, 772, '725', 'Jhikargacha', 'Active', '2022-02-24 09:32:21', '2022-02-24 09:32:21'),
(2201, 10, 773, '725', 'Keshabpur', 'Active', '2022-02-24 09:32:35', '2022-02-24 09:32:35'),
(2202, 10, 774, '725', 'Manirampur', 'Active', '2022-02-24 09:32:48', '2022-02-24 09:32:48'),
(2203, 10, 775, '725', 'Sharsha', 'Active', '2022-02-24 09:33:00', '2022-02-24 09:33:00'),
(2207, 10, 776, '726', 'Kotchandpur', 'Active', '2022-02-24 09:35:39', '2022-02-24 09:35:39'),
(2208, 10, 777, '726', 'Harinakunda', 'Active', '2022-02-24 09:35:54', '2022-02-24 09:35:54'),
(2209, 10, 778, '726', 'Jhenaidah Sadar', 'Active', '2022-02-24 09:36:11', '2022-02-24 09:36:11'),
(2210, 10, 779, '726', 'Kaliganj(Jhenaidah)', 'Active', '2022-02-24 09:37:31', '2022-02-24 09:37:31'),
(2211, 10, 780, '726', 'Moheshpur', 'Active', '2022-02-24 09:38:27', '2022-02-24 09:38:27'),
(2212, 10, 781, '726', 'Shailkupa', 'Active', '2022-02-24 09:38:39', '2022-02-24 09:38:39'),
(2213, 10, 782, '727', 'Batiaghata', 'Active', '2022-02-25 06:12:17', '2022-02-25 06:12:17'),
(2214, 10, 783, '727', 'Dacope', 'Active', '2022-02-25 06:12:32', '2022-02-25 06:12:32'),
(2215, 10, 784, '727', 'Dighalia', 'Active', '2022-02-25 06:12:48', '2022-02-25 06:12:48'),
(2216, 10, 785, '727', 'Dumuria', 'Active', '2022-02-25 06:13:01', '2022-02-25 06:13:01'),
(2217, 10, 786, '727', 'Phultala', 'Active', '2022-02-25 06:13:14', '2022-02-25 06:13:14'),
(2218, 10, 787, '727', 'Koira', 'Active', '2022-02-25 06:13:26', '2022-02-25 06:13:26'),
(2219, 10, 788, '727', 'Paikgacha', 'Active', '2022-02-25 06:13:38', '2022-02-25 06:13:38'),
(2220, 10, 789, '727', 'Rupsac', 'Active', '2022-02-25 06:13:51', '2022-02-25 06:13:51'),
(2221, 10, 790, '727', 'Khalispur', 'Active', '2022-02-25 06:14:04', '2022-02-25 06:14:04'),
(2222, 10, 791, '727', 'Sonadanga', 'Active', '2022-02-25 06:14:14', '2022-02-25 06:14:14'),
(2223, 10, 792, '727', 'Khan jahan ali', 'Active', '2022-02-25 06:14:59', '2022-02-25 06:14:59'),
(2224, 10, 793, '727', 'Doulatpur', 'Active', '2022-02-25 06:15:09', '2022-02-25 06:15:09'),
(2225, 10, 794, '727', 'Terokhada', 'Active', '2022-02-25 06:15:43', '2022-02-25 06:15:43'),
(2227, 10, 795, '728', 'Bheramara', 'Active', '2022-02-25 06:16:25', '2022-02-25 06:16:25'),
(2228, 10, 796, '728', 'Daulatpur (Kushtia)', 'Active', '2022-02-25 06:16:44', '2022-02-25 06:16:44'),
(2229, 10, 797, '728', 'Khoksha', 'Active', '2022-02-25 06:16:57', '2022-02-25 06:16:57'),
(2230, 10, 798, '728', 'Kumarkhali', 'Active', '2022-02-25 06:17:07', '2022-02-25 06:17:07'),
(2231, 10, 799, '728', 'Kushtia Sadar', 'Active', '2022-02-25 06:17:21', '2022-02-25 06:17:21'),
(2232, 10, 800, '728', 'Mirpur (Kushtia)', 'Active', '2022-02-25 06:17:39', '2022-02-25 06:17:39'),
(2233, 10, 801, '729', 'Magura Sadar', 'Active', '2022-02-25 06:17:58', '2022-02-25 06:17:58'),
(2234, 10, 802, '729', 'Mohammadpur (Magura)', 'Active', '2022-02-25 06:18:12', '2022-02-25 06:18:12'),
(2235, 10, 803, '729', 'Shalikha', 'Active', '2022-02-25 06:18:26', '2022-02-25 06:18:26'),
(2236, 10, 804, '729', 'Sreepur (Magura)', 'Active', '2022-02-25 06:18:43', '2022-02-25 06:18:43'),
(2244, 10, 805, '730', 'Gangni', 'Active', '2022-02-25 06:21:49', '2022-02-25 06:21:49'),
(2245, 10, 806, '730', 'Meherpur Sadar', 'Active', '2022-02-25 06:22:07', '2022-02-25 06:22:07'),
(2246, 10, 807, '730', 'Mujibnagar', 'Active', '2022-02-25 06:22:22', '2022-02-25 06:22:37'),
(2247, 10, 808, '731', 'Kalia', 'Active', '2022-02-25 06:23:46', '2022-02-25 06:23:46'),
(2248, 10, 809, '731', 'Lohagara(Narail)', 'Active', '2022-02-25 06:24:16', '2022-02-25 06:24:16'),
(2249, 10, 810, '731', 'Narail Sadar', 'Active', '2022-02-25 06:24:35', '2022-02-25 06:24:35'),
(2252, 10, 811, '732', 'Assasuni', 'Active', '2022-02-25 06:25:30', '2022-02-25 06:25:30'),
(2253, 10, 812, '732', 'Debhata', 'Active', '2022-02-25 06:25:40', '2022-02-25 06:25:40'),
(2254, 10, 813, '732', 'Kaliganj(Satkhira)', 'Active', '2022-02-25 06:25:53', '2022-02-25 06:25:53'),
(2255, 10, 814, '732', 'Kolaroa', 'Active', '2022-02-25 06:26:06', '2022-02-25 06:26:06'),
(2256, 10, 815, '732', 'Satkhira Sadar', 'Active', '2022-02-25 06:26:18', '2022-02-25 06:26:18'),
(2257, 10, 816, '732', 'Shyamnagar', 'Active', '2022-02-25 06:26:29', '2022-02-25 06:26:29'),
(2258, 10, 817, '732', 'Tala', 'Active', '2022-02-25 06:26:41', '2022-02-25 06:26:41'),
(2259, 10, 818, '737', 'Adamdighi (Bogra)', 'Active', '2022-02-25 06:27:10', '2022-02-25 06:27:10'),
(2260, 10, 819, '737', 'Bogra Sadar', 'Active', '2022-02-25 06:27:29', '2022-02-25 06:27:29'),
(2261, 10, 820, '737', 'Dhunot', 'Active', '2022-02-25 06:27:43', '2022-02-25 06:27:43'),
(2262, 10, 821, '737', 'Dhubchanchia', 'Active', '2022-02-25 06:27:57', '2022-02-25 06:27:57'),
(2263, 10, 822, '737', 'Gabtali (Bogra)', 'Active', '2022-02-25 06:28:09', '2022-02-25 06:28:09'),
(2264, 10, 823, '737', 'Kahaloo', 'Active', '2022-02-25 06:28:21', '2022-02-25 06:28:21'),
(2265, 10, 824, '737', 'Nandigram', 'Active', '2022-02-25 06:28:35', '2022-02-25 06:28:35'),
(2266, 10, 825, '737', 'Sariakandi', 'Active', '2022-02-25 06:28:56', '2022-02-25 06:28:56'),
(2267, 10, 826, '737', 'Sherpur (Bogra)', 'Active', '2022-02-25 06:29:23', '2022-02-25 06:29:23'),
(2268, 10, 827, '737', 'Shibganj ( Bogra )', 'Active', '2022-02-25 06:29:39', '2022-02-25 06:29:39'),
(2269, 10, 828, '737', 'Sonatola', 'Active', '2022-02-25 06:29:51', '2022-02-25 06:29:51'),
(2270, 10, 829, '737', 'Shajahanpur (Bogura)', 'Active', '2022-02-25 06:30:05', '2022-02-25 06:30:05'),
(2271, 10, 830, '741', 'Bholahat', 'Active', '2022-02-25 06:30:21', '2022-02-25 06:30:21'),
(2272, 10, 831, '741', 'Gomastapur', 'Active', '2022-02-25 06:30:41', '2022-02-25 06:30:41'),
(2273, 10, 832, '741', 'Nachole', 'Active', '2022-02-25 06:30:53', '2022-02-25 06:30:53'),
(2274, 10, 833, '741', 'Nawabganj Sadar', 'Active', '2022-02-25 06:31:12', '2022-02-25 06:31:12'),
(2275, 10, 834, '741', 'Shipganj ( Chapai )', 'Active', '2022-02-25 06:31:26', '2022-02-25 06:31:26'),
(2276, 10, 835, '738', 'Akkelpur', 'Active', '2022-02-25 06:31:47', '2022-02-25 06:31:47'),
(2277, 10, 836, '738', 'Joypurhat Sadar', 'Active', '2022-02-25 06:32:17', '2022-02-25 06:32:17'),
(2278, 10, 837, '738', 'Kalai', 'Active', '2022-02-25 06:32:48', '2022-02-25 06:32:48'),
(2279, 10, 838, '738', 'Khetlal', 'Active', '2022-02-25 06:33:06', '2022-02-25 06:33:06'),
(2280, 10, 839, '738', 'Panchbibi', 'Active', '2022-02-25 06:33:29', '2022-02-25 06:33:29'),
(2281, 10, 840, '739', 'Atrai', 'Active', '2022-02-25 06:33:45', '2022-02-25 06:33:45'),
(2282, 10, 841, '739', 'Badalgachi', 'Active', '2022-02-25 06:34:00', '2022-02-25 06:34:00'),
(2283, 10, 842, '739', 'Dhamoirhat', 'Active', '2022-02-25 06:34:16', '2022-02-25 06:34:16'),
(2284, 10, 843, '739', 'Manda(Naogaon)', 'Active', '2022-02-25 06:34:44', '2022-02-25 06:34:44'),
(2285, 10, 844, '739', 'Mahadebpur', 'Active', '2022-02-25 06:34:56', '2022-02-25 06:34:56'),
(2286, 10, 845, '739', 'Naogaon Sadar', 'Active', '2022-02-25 06:35:11', '2022-02-25 06:35:11'),
(2287, 10, 846, '739', 'Niamatpur', 'Active', '2022-02-25 06:35:23', '2022-02-25 06:35:23'),
(2288, 10, 847, '739', 'Patnitala', 'Active', '2022-02-25 06:35:35', '2022-02-25 06:35:35'),
(2289, 10, 848, '739', 'Porsha', 'Active', '2022-02-25 06:37:24', '2022-02-25 06:37:24'),
(2290, 10, 849, '739', 'Raninagar', 'Active', '2022-02-25 06:37:42', '2022-02-25 06:37:42'),
(2291, 10, 850, '739', 'Shapahar', 'Active', '2022-02-25 06:38:03', '2022-02-25 06:38:03'),
(2292, 10, 8510, '740', 'Baghatipara', 'Active', '2022-02-25 06:38:43', '2022-02-25 06:38:43'),
(2293, 10, 852, '740', 'Baraigram', 'Active', '2022-02-25 06:38:58', '2022-02-25 06:38:58'),
(2294, 10, 853, '740', 'Gurudaspur', 'Active', '2022-02-25 06:39:18', '2022-02-25 06:39:18'),
(2295, 10, 854, '740', 'Lalpur', 'Active', '2022-02-25 06:39:30', '2022-02-25 06:39:30'),
(2296, 10, 855, '740', 'Natore Sadar', 'Active', '2022-02-25 06:39:54', '2022-02-25 06:40:03'),
(2297, 10, 856, '740', 'Singra', 'Active', '2022-02-25 06:40:27', '2022-02-25 06:40:27'),
(2299, 10, 858, '742', 'Bera', 'Active', '2022-02-25 06:41:05', '2022-02-25 06:41:05'),
(2301, 10, 857, '742', 'Atgharia', 'Active', '2022-02-25 06:42:25', '2022-02-25 06:42:25'),
(2302, 10, 859, '742', 'Bhangura', 'Active', '2022-02-25 06:42:37', '2022-02-25 06:44:00'),
(2303, 10, 860, '742', 'Chatmohar', 'Active', '2022-02-25 06:42:47', '2022-02-25 06:44:08'),
(2304, 10, 861, '742', 'Faridpur ( Pabna )', 'Active', '2022-02-25 06:43:02', '2022-02-25 06:44:17'),
(2305, 10, 862, '742', 'Iswardi', 'Active', '2022-02-25 06:43:20', '2022-02-25 06:44:23'),
(2306, 10, 863, '742', 'Pabna Sadar', 'Active', '2022-02-25 06:45:01', '2022-02-25 06:45:01'),
(2307, 10, 864, '742', 'Santhia', 'Active', '2022-02-25 06:45:14', '2022-02-25 06:45:14'),
(2308, 10, 865, '742', 'Sujanagar', 'Active', '2022-02-25 06:45:25', '2022-02-25 06:45:25'),
(2310, 10, 866, '743', 'Bagha', 'Active', '2022-02-25 06:46:08', '2022-02-25 06:46:08'),
(2311, 10, 867, '743', 'Bagmara (Rajshahi)', 'Active', '2022-02-25 06:46:26', '2022-02-25 06:46:26'),
(2312, 10, 868, '743', 'Charghat', 'Active', '2022-02-25 06:46:38', '2022-02-25 06:46:38'),
(2313, 10, 869, '743', 'Durgapur(Rajshahi)', 'Active', '2022-02-25 06:46:52', '2022-02-25 06:46:52'),
(2314, 10, 870, '743', 'Godagari', 'Active', '2022-02-25 06:47:10', '2022-02-25 06:47:10'),
(2315, 10, 871, '743', 'Mohanpur (Rajshahi)', 'Active', '2022-02-25 06:47:24', '2022-02-25 06:47:24'),
(2316, 10, 872, '743', 'Paba', 'Active', '2022-02-25 06:47:37', '2022-02-25 06:47:37'),
(2317, 10, 873, '743', 'Putia', 'Active', '2022-02-25 06:48:08', '2022-02-25 06:48:08'),
(2318, 10, 874, '743', 'Tanore', 'Active', '2022-02-25 06:48:19', '2022-02-25 06:48:19'),
(2319, 10, 875, '743', 'Sadar', 'Active', '2022-02-25 06:48:32', '2022-02-25 06:48:32'),
(2321, 10, 876, '744', 'Belkuchi', 'Active', '2022-02-25 06:49:21', '2022-02-25 06:49:21');
INSERT INTO `zones` (`id`, `courier_id`, `zoneId`, `city_id`, `zoneName`, `status`, `created_at`, `updated_at`) VALUES
(2322, 10, 877, '744', 'Chowhali', 'Active', '2022-02-25 06:49:45', '2022-02-25 06:49:45'),
(2323, 10, 878, '744', 'Kamarkhanda', 'Active', '2022-02-25 06:49:58', '2022-02-25 06:49:58'),
(2324, 10, 879, '744', 'Kazipur', 'Active', '2022-02-25 06:50:08', '2022-02-25 06:50:08'),
(2325, 10, 880, '744', 'Raiganj', 'Active', '2022-02-25 06:50:43', '2022-02-25 06:50:43'),
(2326, 10, 881, '744', 'Shahajadpur (Sirajganj)', 'Active', '2022-02-25 06:51:12', '2022-02-25 06:51:12'),
(2327, 10, 882, '744', 'Sirajganj Sadar', 'Active', '2022-02-25 06:51:28', '2022-02-25 06:51:28'),
(2328, 10, 883, '744', 'Tarash', 'Active', '2022-02-25 06:51:44', '2022-02-25 06:51:44'),
(2329, 10, 884, '744', 'Ullapara', 'Active', '2022-02-25 06:52:00', '2022-02-25 06:52:00'),
(2331, 10, 885, '753', 'Ajmeriganj', 'Active', '2022-02-25 06:52:46', '2022-02-25 06:52:46'),
(2332, 10, 886, '753', 'Bahubal (Shayestaganj Hub)', 'Active', '2022-02-25 06:52:57', '2022-02-25 06:52:57'),
(2333, 10, 887, '753', 'Baniachang', 'Active', '2022-02-25 06:53:13', '2022-02-25 06:53:13'),
(2334, 10, 888, '753', 'Chunarughat (Shayestaganj Hub)', 'Active', '2022-02-25 06:53:28', '2022-02-25 06:53:28'),
(2335, 10, 889, '753', 'Habiganj Sadar', 'Active', '2022-02-25 06:53:43', '2022-02-25 06:53:43'),
(2336, 10, 890, '753', 'Lakhai', 'Active', '2022-02-25 06:53:54', '2022-02-25 06:53:54'),
(2337, 10, 891, '753', 'Madhabpur (Shayestaganj Hub)', 'Active', '2022-02-25 06:54:08', '2022-02-25 06:54:08'),
(2338, 10, 892, '753', 'Nabiganj', 'Active', '2022-02-25 06:54:19', '2022-02-25 06:54:19'),
(2339, 10, 893, '754', 'Barlekha', 'Active', '2022-02-25 06:54:32', '2022-02-25 06:54:32'),
(2340, 10, 894, '754', 'Kamalganj', 'Active', '2022-02-25 06:54:45', '2022-02-25 06:54:45'),
(2341, 10, 895, '754', 'Kulaura', 'Active', '2022-02-25 06:55:10', '2022-02-25 06:55:10'),
(2342, 10, 896, '754', 'Moulvibazar Sadar', 'Active', '2022-02-25 06:55:30', '2022-02-25 06:55:30'),
(2343, 10, 897, '754', 'Rajnagar', 'Active', '2022-02-25 06:55:44', '2022-02-25 06:55:44'),
(2344, 10, 898, '754', 'Sreemongal', 'Active', '2022-02-25 06:56:01', '2022-02-25 06:56:01'),
(2345, 10, 899, '754', 'Juri', 'Active', '2022-02-25 06:56:14', '2022-02-25 06:56:14'),
(2346, 10, 900, '755', 'Biswambharpur', 'Active', '2022-02-25 06:56:46', '2022-02-25 06:56:46'),
(2347, 10, 901, '755', 'Chattak', 'Active', '2022-02-25 06:57:00', '2022-02-25 06:57:00'),
(2348, 10, 902, '755', 'Derai', 'Active', '2022-02-25 06:57:12', '2022-02-25 06:57:12'),
(2349, 10, 903, '755', 'Dharmapasha', 'Active', '2022-02-25 06:57:23', '2022-02-25 06:57:23'),
(2350, 10, 904, '755', 'Dowarabazar', 'Active', '2022-02-25 06:57:35', '2022-02-25 06:57:35'),
(2351, 10, 905, '755', 'Jagannathpur', 'Active', '2022-02-25 06:57:46', '2022-02-25 06:57:46'),
(2352, 10, 906, '755', 'Jamalganj', 'Active', '2022-02-25 06:58:02', '2022-02-25 06:58:02'),
(2353, 10, 907, '755', 'Sulla', 'Active', '2022-02-25 06:58:12', '2022-02-25 06:58:12'),
(2354, 10, 908, '755', 'Traffic Point (Sunamganj Sadar)', 'Active', '2022-02-25 06:58:23', '2022-02-25 06:58:23'),
(2355, 10, 909, '755', 'Taherpur', 'Active', '2022-02-25 06:58:33', '2022-02-25 06:58:33'),
(2356, 10, 910, '755', 'South Sunamganj', 'Active', '2022-02-25 06:58:47', '2022-02-25 06:58:47'),
(2359, 10, 911, '756', 'Balaganj', 'Active', '2022-02-25 06:59:55', '2022-02-25 06:59:55'),
(2360, 10, 912, '756', 'Beanibazar', 'Active', '2022-02-25 07:00:08', '2022-02-25 07:00:08'),
(2361, 10, 913, '756', 'Biswanath', 'Active', '2022-02-25 07:00:19', '2022-02-25 07:00:19'),
(2362, 10, 914, '756', 'Companyganj (Sylhet)', 'Active', '2022-02-25 07:00:35', '2022-02-25 07:01:18'),
(2363, 10, 915, '756', 'Fenchuganj', 'Active', '2022-02-25 07:00:53', '2022-02-25 07:00:53'),
(2364, 10, 916, '756', 'Gowainghat', 'Active', '2022-02-25 07:01:08', '2022-02-25 07:01:08'),
(2365, 10, 917, '756', 'Golapganj (Sylhet)', 'Active', '2022-02-26 06:38:23', '2022-02-26 06:38:23'),
(2366, 10, 918, '756', 'Jaintapur', 'Active', '2022-02-26 06:40:37', '2022-02-26 06:40:37'),
(2367, 10, 919, '756', 'Zakiganj', 'Active', '2022-02-26 06:40:50', '2022-02-26 06:40:50'),
(2368, 10, 920, '756', 'Kanaighat', 'Active', '2022-02-26 08:15:08', '2022-02-26 08:15:08'),
(2369, 10, 921, '693', 'Amberkhana (Sylhet)', 'Active', '2022-02-26 08:16:28', '2022-02-26 08:16:28'),
(2370, 10, 922, '756', 'South Surma', 'Active', '2022-02-26 08:17:08', '2022-02-26 08:17:08'),
(2554, 10, 923, '693', 'Amtali', 'Active', '2022-02-26 09:46:39', '2022-02-26 09:46:39'),
(2555, 10, 924, '693', 'Bamna', 'Active', '2022-02-26 09:47:00', '2022-02-26 09:47:00'),
(2605, 10, 1300, '710', 'BDR Market-Sector 6', 'Active', '2022-02-27 05:33:55', '2022-02-27 05:33:55'),
(2606, 10, 925, '693', 'Barguna Sadar', 'Active', '2022-02-27 05:34:37', '2022-02-27 05:34:37'),
(2607, 10, 1301, '710', 'Moinartek', 'Active', '2022-02-27 05:35:07', '2022-02-27 05:35:07'),
(2608, 10, 926, '693', 'Betagi', 'Active', '2022-02-27 05:35:13', '2022-02-27 05:35:13'),
(2609, 10, 1302, '710', 'Atipara', 'Active', '2022-02-27 05:35:19', '2022-02-27 05:35:26'),
(2610, 10, 1303, '710', 'Kotbari (Dakshinkhan)', 'Active', '2022-02-27 05:35:41', '2022-02-27 05:35:41'),
(2611, 10, 927, '693', 'Patharghata (Barguna)', 'Active', '2022-02-27 05:35:41', '2022-02-27 05:35:41'),
(2612, 10, 1304, '710', 'Dewan City', 'Active', '2022-02-27 05:35:53', '2022-02-27 05:35:53'),
(2613, 10, 1305, '710', 'Mollartek', 'Active', '2022-02-27 05:36:04', '2022-02-27 05:36:04'),
(2614, 10, 928, '694', 'Agailjhara', 'Active', '2022-02-27 05:36:12', '2022-02-27 05:36:12'),
(2615, 10, 1306, '710', 'Gawair', 'Active', '2022-02-27 05:36:16', '2022-02-27 05:36:16'),
(2616, 10, 1307, '710', 'Kosaibari', 'Active', '2022-02-27 05:36:30', '2022-02-27 05:36:30'),
(2617, 10, 929, '694', 'Babuganj', 'Active', '2022-02-27 05:36:38', '2022-02-27 05:36:38'),
(2618, 10, 1308, '710', 'Prembagan', 'Active', '2022-02-27 05:36:40', '2022-02-27 05:36:40'),
(2619, 10, 1309, '710', 'Kachkura', 'Active', '2022-02-27 05:36:57', '2022-02-27 05:36:57'),
(2620, 10, 930, '694', 'Bakerganj', 'Active', '2022-02-27 05:37:09', '2022-02-27 05:37:09'),
(2621, 10, 1310, '710', 'Helal Market', 'Active', '2022-02-27 05:37:09', '2022-02-27 05:37:09'),
(2622, 10, 1311, '710', 'Chamur Khan', 'Active', '2022-02-27 05:37:19', '2022-02-27 05:37:19'),
(2623, 10, 1312, '710', 'Society', 'Active', '2022-02-27 05:37:29', '2022-02-27 05:37:29'),
(2624, 10, 931, '694', 'Banaripara', 'Active', '2022-02-27 05:37:32', '2022-02-27 05:37:32'),
(2625, 10, 1313, '710', 'Ismailkholla', 'Active', '2022-02-27 05:37:41', '2022-02-27 05:37:41'),
(2626, 10, 1314, '710', 'Masterpara', 'Active', '2022-02-27 05:37:57', '2022-02-27 05:37:57'),
(2627, 10, 932, '694', 'Barisal Sadar', 'Active', '2022-02-27 05:37:58', '2022-02-27 05:37:58'),
(2628, 10, 1315, '710', 'Munda (Malibug Hub)', 'Active', '2022-02-27 05:38:19', '2022-02-27 05:38:19'),
(2629, 10, 933, '694', 'Gournadi (Barisal)', 'Active', '2022-02-27 05:38:32', '2022-02-27 05:38:32'),
(2630, 10, 1316, '710', 'Barua', 'Active', '2022-02-27 05:38:39', '2022-02-27 05:38:39'),
(2631, 10, 1317, '710', 'Namapara-Khilkhet', 'Active', '2022-02-27 05:38:50', '2022-02-27 05:39:36'),
(2632, 10, 934, '694', 'Hijla', 'Active', '2022-02-27 05:38:57', '2022-02-27 05:38:57'),
(2633, 10, 935, '694', 'Mehendiganj', 'Active', '2022-02-27 05:39:27', '2022-02-27 05:39:27'),
(2634, 10, 936, '694', 'Muladi', 'Active', '2022-02-27 05:39:52', '2022-02-27 05:39:52'),
(2635, 10, 937, '694', 'Wazirpur', 'Active', '2022-02-27 05:40:18', '2022-02-27 05:40:18'),
(2636, 10, 1318, '710', 'Ahalia-Uttara', 'Active', '2022-02-27 05:40:29', '2022-02-27 05:40:29'),
(2637, 10, 1319, '710', 'Ainusbag-Dakshinkhan', 'Active', '2022-02-27 05:40:40', '2022-02-27 05:40:40'),
(2638, 10, 938, '695', 'Bhola Sadar', 'Active', '2022-02-27 05:40:48', '2022-02-27 05:40:48'),
(2639, 10, 1320, '710', 'Diabari', 'Active', '2022-02-27 05:40:51', '2022-02-27 05:40:51'),
(2640, 10, 1321, '710', 'Habib Market-Uttara', 'Active', '2022-02-27 05:41:02', '2022-02-27 05:41:02'),
(2641, 10, 939, '695', 'Borhanuddin', 'Active', '2022-02-27 05:41:12', '2022-02-27 05:41:12'),
(2642, 10, 1322, '710', 'Pakuria-Uttara', 'Active', '2022-02-27 05:41:16', '2022-02-27 05:41:16'),
(2643, 10, 1323, '710', 'Aftab Nagar', 'Active', '2022-02-27 05:41:29', '2022-02-27 05:41:29'),
(2644, 10, 940, '695', 'Charfession', 'Active', '2022-02-27 05:41:35', '2022-02-27 05:41:35'),
(2645, 10, 1324, '710', 'Gulbagh', 'Active', '2022-02-27 05:41:42', '2022-02-27 05:41:42'),
(2646, 10, 1325, '710', 'Meradiya Bazar', 'Active', '2022-02-27 05:42:01', '2022-02-27 05:42:01'),
(2647, 10, 941, '695', 'Daulatkhan', 'Active', '2022-02-27 05:42:15', '2022-02-27 05:42:15'),
(2648, 10, 1326, '710', 'Mirbagh', 'Active', '2022-02-27 05:42:36', '2022-02-27 05:42:36'),
(2649, 10, 942, '695', 'Lalmohan', 'Active', '2022-02-27 05:42:47', '2022-02-27 05:42:47'),
(2650, 10, 1327, '710', 'Modhubagh', 'Active', '2022-02-27 05:42:49', '2022-02-27 05:42:49'),
(2651, 10, 943, '695', 'Manpura', 'Active', '2022-02-27 05:43:16', '2022-02-27 05:43:16'),
(2652, 10, 944, '695', 'Tajumuddin', 'Active', '2022-02-27 05:43:41', '2022-02-27 05:43:41'),
(2653, 10, 1328, '710', 'Rampura TV center', 'Active', '2022-02-27 05:43:53', '2022-02-27 05:43:53'),
(2654, 10, 945, '696', 'Jhalokathi Sadar', 'Active', '2022-02-27 05:44:06', '2022-02-27 05:44:06'),
(2655, 10, 1329, '710', 'TV gate', 'Active', '2022-02-27 05:44:12', '2022-02-27 05:44:12'),
(2656, 10, 946, '696', 'Kathalia', 'Active', '2022-02-27 05:44:27', '2022-02-27 05:44:27'),
(2657, 10, 1330, '710', 'Ulan road', 'Active', '2022-02-27 05:44:40', '2022-02-27 05:44:40'),
(2658, 10, 947, '696', 'Nalchiti', 'Active', '2022-02-27 05:44:48', '2022-02-27 05:44:48'),
(2659, 10, 1331, '710', 'Mirpur 10', 'Active', '2022-02-27 05:45:00', '2022-02-27 05:45:00'),
(2660, 10, 1332, '710', 'Gudaraghat-Mirpur', 'Active', '2022-02-27 05:45:10', '2022-02-27 05:45:10'),
(2661, 10, 948, '696', 'Rajapur (Jhalokathi)', 'Active', '2022-02-27 05:45:18', '2022-02-27 05:45:18'),
(2662, 10, 1333, '710', 'Namapara-Mirpur', 'Active', '2022-02-27 05:45:38', '2022-02-27 05:45:38'),
(2663, 10, 1334, '710', 'Oxygen', 'Active', '2022-02-27 05:45:52', '2022-02-27 05:45:52'),
(2664, 10, 1335, '710', 'Technical', 'Active', '2022-02-27 05:46:05', '2022-02-27 05:46:05'),
(2665, 10, 1336, '710', 'Mirpur 13 /14 / 15', 'Active', '2022-02-27 05:48:49', '2022-02-27 05:48:49'),
(2666, 10, 1337, '710', 'Benaroshi Polli', 'Active', '2022-02-27 05:49:02', '2022-02-27 05:49:02'),
(2667, 10, 949, '697', 'Bauphal', 'Active', '2022-02-27 05:49:11', '2022-02-27 05:49:11'),
(2668, 10, 1338, '710', 'Beribadh-Mirpur', 'Active', '2022-02-27 05:49:13', '2022-02-27 05:49:13'),
(2669, 10, 1339, '710', 'Buddhijibi Road', 'Active', '2022-02-27 05:49:33', '2022-02-27 05:49:33'),
(2670, 10, 950, '697', 'Dasmina', 'Active', '2022-02-27 05:49:39', '2022-02-27 05:49:39'),
(2671, 10, 1340, '710', 'Purobi Cinema Hall', 'Active', '2022-02-27 05:49:51', '2022-02-27 05:49:51'),
(2672, 10, 951, '697', 'Dumki', 'Active', '2022-02-27 05:49:56', '2022-02-27 05:49:56'),
(2673, 10, 1341, '710', 'Mondir-Mirpur', 'Active', '2022-02-27 05:50:05', '2022-02-27 05:50:05'),
(2674, 10, 952, '697', 'Galachipa', 'Active', '2022-02-27 05:50:14', '2022-02-27 05:50:14'),
(2675, 10, 1342, '710', 'Palasnagor', 'Active', '2022-02-27 05:50:18', '2022-02-27 05:50:18'),
(2676, 10, 1343, '710', 'Purobi', 'Active', '2022-02-27 05:50:27', '2022-02-27 05:50:27'),
(2677, 10, 1344, '710', 'Rupnagor', 'Active', '2022-02-27 05:50:37', '2022-02-27 05:50:37'),
(2678, 10, 953, '693', 'Kalapara', 'Active', '2022-02-27 05:50:41', '2022-02-27 05:50:41'),
(2679, 10, 1345, '710', 'Senpara', 'Active', '2022-02-27 05:50:47', '2022-02-27 05:50:47'),
(2680, 10, 1346, '710', 'BRTA', 'Active', '2022-02-27 05:50:57', '2022-02-27 05:50:57'),
(2681, 10, 1347, '710', 'Zoo', 'Active', '2022-02-27 05:51:08', '2022-02-27 05:51:08'),
(2682, 10, 1348, '710', 'Niketon Bazar', 'Active', '2022-02-27 05:51:23', '2022-02-27 05:51:23'),
(2684, 10, 953, '697', 'Kalapara', 'Active', '2022-02-27 05:51:40', '2022-02-27 05:51:40'),
(2686, 10, 954, '697', 'Mirjaganj', 'Active', '2022-02-27 05:52:04', '2022-02-27 05:52:04'),
(2687, 10, 955, '697', 'Patuakhali Sadar', 'Active', '2022-02-27 05:52:30', '2022-02-27 05:52:30'),
(2688, 10, 1349, '702', 'Kotwali Chattogram', 'Active', '2022-02-27 05:52:47', '2022-02-27 05:52:47'),
(2689, 10, 956, '698', 'Bhandaria', 'Active', '2022-02-27 05:53:01', '2022-02-27 05:53:01'),
(2690, 10, 1350, '702', 'Agrabad', 'Active', '2022-02-27 05:53:05', '2022-02-27 05:53:05'),
(2693, 10, 957, '698', 'Kaukhali (Perojpur)', 'Active', '2022-02-27 05:53:29', '2022-02-27 05:53:29'),
(2696, 10, 958, '698', 'Mothbaria', 'Active', '2022-02-27 05:53:54', '2022-02-27 05:53:54'),
(2698, 10, 959, '698', 'Nesarabad (Shawrupkathi)', 'Active', '2022-02-27 05:54:27', '2022-02-27 05:54:27'),
(2699, 10, 960, '698', 'Nazirpur', 'Active', '2022-02-27 05:54:52', '2022-02-27 05:54:52'),
(2700, 10, 961, '698', 'Pirojpur Sadar', 'Active', '2022-02-27 05:55:29', '2022-02-27 05:55:29'),
(2701, 10, 1351, '710', 'AK Khan', 'Active', '2022-02-27 05:55:43', '2022-02-27 05:55:43'),
(2702, 10, 962, '698', 'Zia Nagar (Indurkani)', 'Active', '2022-02-27 05:55:51', '2022-02-27 05:55:51'),
(2703, 10, 1352, '702', 'Al- Amin Baria Madra', 'Active', '2022-02-27 05:56:12', '2022-02-27 05:56:12'),
(2704, 10, 963, '699', 'Ali Kadam', 'Active', '2022-02-27 05:56:28', '2022-02-27 05:56:28'),
(2705, 10, 1353, '702', 'Al- Amin Baria Madrasa', 'Active', '2022-02-27 05:56:39', '2022-02-27 05:56:39'),
(2707, 10, 964, '699', 'Bandarban Sadar', 'Active', '2022-02-27 05:56:59', '2022-02-27 05:56:59'),
(2708, 10, 1355, '702', 'Anandabazar', 'Active', '2022-02-27 05:57:22', '2022-02-27 05:57:22'),
(2709, 10, 965, '698', 'Lama', 'Active', '2022-02-27 05:57:28', '2022-02-27 05:57:28'),
(2710, 10, 1354, '702', 'Amin Jute Mills', 'Active', '2022-02-27 05:57:35', '2022-02-27 05:57:35'),
(2711, 10, 966, '699', 'Nakhoyngchari', 'Active', '2022-02-27 05:57:50', '2022-02-27 05:57:50'),
(2713, 10, 1357, '702', 'Anawara Paroikora', 'Active', '2022-02-27 05:58:05', '2022-02-27 05:58:05'),
(2714, 10, 967, '699', 'Rawanchari', 'Active', '2022-02-27 05:58:22', '2022-02-27 05:58:22'),
(2715, 10, 1356, '702', 'Anawara Paroikora', 'Active', '2022-02-27 05:58:25', '2022-02-27 05:58:25'),
(2716, 10, 1358, '702', 'Bayezid Bostami', 'Active', '2022-02-27 05:58:38', '2022-02-27 05:58:38'),
(2717, 10, 1359, '702', 'Boalkhali Charandwip', 'Active', '2022-02-27 05:58:49', '2022-02-27 05:58:49'),
(2718, 10, 968, '699', 'Ruma', 'Active', '2022-02-27 05:58:53', '2022-02-27 05:58:53'),
(2719, 10, 1360, '702', 'Boalkhali Iqbal Park', 'Active', '2022-02-27 05:59:05', '2022-02-27 05:59:05'),
(2720, 10, 1361, '702', 'Boalkhali Kadurkha', 'Active', '2022-02-27 05:59:20', '2022-02-27 05:59:20'),
(2721, 10, 969, '699', 'Thanchi', 'Active', '2022-02-27 05:59:26', '2022-02-27 05:59:26'),
(2722, 10, 1362, '702', 'Boalkhali Kanungopara', 'Active', '2022-02-27 05:59:33', '2022-02-27 05:59:33'),
(2723, 10, 1363, '702', 'Boalkhali Sadar', 'Active', '2022-02-27 05:59:45', '2022-02-27 05:59:45'),
(2724, 10, 1364, '702', 'Boalkhali Sakpura', 'Active', '2022-02-27 05:59:56', '2022-02-27 05:59:56'),
(2725, 10, 1365, '702', 'Boalkhali Saroatoli', 'Active', '2022-02-27 06:00:06', '2022-02-27 06:00:06'),
(2726, 10, 970, '700', 'Akhaura', 'Active', '2022-02-27 06:00:08', '2022-02-27 06:00:08'),
(2727, 10, 1366, '702', 'Cadet College', 'Active', '2022-02-27 06:00:18', '2022-02-27 06:00:18'),
(2728, 10, 1367, '702', 'Chandgaon', 'Active', '2022-02-27 06:00:27', '2022-02-27 06:00:27'),
(2729, 10, 1368, '702', 'Chattogram Airport', 'Active', '2022-02-27 06:00:40', '2022-02-27 06:00:40'),
(2730, 10, 971, '700', 'Ashuganj (Bhairab)', 'Active', '2022-02-27 06:00:46', '2022-02-27 06:00:46'),
(2731, 10, 1369, '702', 'Chattogram Bandar', 'Active', '2022-02-27 06:00:57', '2022-02-27 06:00:57'),
(2732, 10, 1370, '702', 'Chattogram Cantonment', 'Active', '2022-02-27 06:01:11', '2022-02-27 06:01:11'),
(2733, 10, 1371, '702', 'Chattogram Chawkbazar', 'Active', '2022-02-27 06:01:21', '2022-02-27 06:01:21'),
(2734, 10, 972, '700', 'Bancharampur (Nabinagar)', 'Active', '2022-02-27 06:01:23', '2022-02-27 06:01:23'),
(2735, 10, 1372, '702', 'Chattogram Customs Acca', 'Active', '2022-02-27 06:01:32', '2022-02-27 06:01:32'),
(2736, 10, 973, '700', 'Paikpara (Brahmanbaria Sadar)', 'Active', '2022-02-27 06:01:44', '2022-02-27 06:01:44'),
(2737, 10, 1373, '702', 'Chattogram GPO', 'Active', '2022-02-27 06:01:46', '2022-02-27 06:01:46'),
(2738, 10, 974, '700', 'Kashba (Nabinagar)', 'Active', '2022-02-27 06:02:03', '2022-02-27 06:02:03'),
(2739, 10, 1374, '702', 'Chattogram New Market', 'Active', '2022-02-27 06:02:08', '2022-02-27 06:02:08'),
(2740, 10, 1375, '702', 'Chattogram Oxygen', 'Active', '2022-02-27 06:02:18', '2022-02-27 06:02:18'),
(2741, 10, 975, '700', 'Nabinagar (Nabinagar Hub)', 'Active', '2022-02-27 06:02:22', '2022-02-27 06:02:22'),
(2742, 10, 1376, '702', 'Chattogram Politechnic Institute', 'Active', '2022-02-27 06:02:30', '2022-02-27 06:02:30'),
(2743, 10, 1377, '702', 'Chattogram Sailors Colony', 'Active', '2022-02-27 06:02:42', '2022-02-27 06:02:42'),
(2744, 10, 976, '700', 'Nasirnagar (Bhairab Hub)', 'Active', '2022-02-27 06:02:50', '2022-02-27 06:02:50'),
(2745, 10, 1378, '702', 'Colonel Hat', 'Active', '2022-02-27 06:02:59', '2022-02-27 06:02:59'),
(2746, 10, 1379, '702', 'Combined Military Hospital (CMH)', 'Active', '2022-02-27 06:03:11', '2022-02-27 06:03:11'),
(2747, 10, 977, '700', 'Sarail (Bhairab Hub)', 'Active', '2022-02-27 06:03:17', '2022-02-27 06:03:17'),
(2748, 10, 1380, '702', 'Court Buliding', 'Active', '2022-02-27 06:03:25', '2022-02-27 06:03:25'),
(2749, 10, 1381, '702', 'Dakkhin Ghatchak', 'Active', '2022-02-27 06:03:39', '2022-02-27 06:03:52'),
(2750, 10, 1382, '702', 'Dakkshin Pahartoli', 'Active', '2022-02-27 06:04:05', '2022-02-27 06:04:05'),
(2751, 10, 978, '701', 'Chandpur Sadar', 'Active', '2022-02-27 06:04:07', '2022-02-27 06:04:07'),
(2752, 10, 1383, '702', 'Double Mooring', 'Active', '2022-02-27 06:04:20', '2022-02-27 06:04:20'),
(2753, 10, 979, '701', 'Faridganj', 'Active', '2022-02-27 06:04:26', '2022-02-27 06:04:26'),
(2754, 10, 1384, '702', 'East Joara Barma', 'Active', '2022-02-27 06:04:36', '2022-02-27 06:04:36'),
(2755, 10, 980, '701', 'Haimchar', 'Active', '2022-02-27 06:04:48', '2022-02-27 06:04:48'),
(2756, 10, 1385, '702', 'East Joara Dohazari', 'Active', '2022-02-27 06:04:50', '2022-02-27 06:04:50'),
(2757, 10, 1386, '702', 'East Joara East Joara', 'Active', '2022-02-27 06:05:03', '2022-02-27 06:05:03'),
(2758, 10, 981, '701', 'Hajiganj (Chandpur)', 'Active', '2022-02-27 06:05:09', '2022-02-27 06:05:09'),
(2759, 10, 1387, '702', 'East Joara Gachbaria', 'Active', '2022-02-27 06:05:15', '2022-02-27 06:05:15'),
(2760, 10, 1388, '702', 'Export Processing', 'Active', '2022-02-27 06:05:43', '2022-02-27 06:05:43'),
(2761, 10, 982, '701', 'Kachua(Chandpur)', 'Active', '2022-02-27 06:05:45', '2022-02-27 06:05:45'),
(2762, 10, 1389, '702', 'Fakirkill', 'Active', '2022-02-27 06:05:59', '2022-02-27 06:05:59'),
(2763, 10, 983, '701', 'Matlab (South)', 'Active', '2022-02-27 06:06:07', '2022-02-27 06:06:07'),
(2764, 10, 1390, '702', 'Fatikchhari Bhandar Sharif', 'Active', '2022-02-27 06:06:24', '2022-02-27 06:06:24'),
(2765, 10, 984, '701', 'Matlab (North)(Chengarchar)', 'Active', '2022-02-27 06:06:33', '2022-02-27 06:06:33'),
(2766, 10, 1391, '702', 'Fatikchhari Harualchhari', 'Active', '2022-02-27 06:06:34', '2022-02-27 06:06:34'),
(2767, 10, 1392, '702', 'Fatikchhari Najirhat', 'Active', '2022-02-27 06:06:48', '2022-02-27 06:06:48'),
(2768, 10, 985, '701', 'Shahrasti', 'Active', '2022-02-27 06:06:54', '2022-02-27 06:06:54'),
(2769, 10, 1393, '702', 'Fatikchhari Nanupur', 'Active', '2022-02-27 06:07:00', '2022-02-27 06:07:00'),
(2770, 10, 1394, '702', 'Fatikchhari Narayanhat', 'Active', '2022-02-27 06:07:14', '2022-02-27 06:07:14'),
(2771, 10, 986, '702', 'Anwara', 'Active', '2022-02-27 06:07:16', '2022-02-27 06:07:16'),
(2772, 10, 987, '702', 'Banshkhali', 'Active', '2022-02-27 06:07:34', '2022-02-27 06:07:34'),
(2773, 10, 1395, '702', 'Firozshah', 'Active', '2022-02-27 06:07:35', '2022-02-27 06:07:35'),
(2774, 10, 988, '702', 'Boalkhali', 'Active', '2022-02-27 06:07:52', '2022-02-27 06:07:52'),
(2775, 10, 1396, '702', 'GEC', 'Active', '2022-02-27 06:08:04', '2022-02-27 06:08:04'),
(2776, 10, 989, '702', 'Chandanaish', 'Active', '2022-02-27 06:08:16', '2022-02-27 06:08:16'),
(2777, 10, 990, '702', 'Fatikchari', 'Active', '2022-02-27 06:08:40', '2022-02-27 06:08:40'),
(2778, 10, 1397, '702', 'Halishahar', 'Active', '2022-02-27 06:16:23', '2022-02-27 06:16:23'),
(2779, 10, 1398, '702', 'Halishshar', 'Active', '2022-02-27 06:16:41', '2022-02-27 06:16:41'),
(2780, 10, 1399, '702', 'Chattogram University', 'Active', '2022-02-27 06:16:53', '2022-02-27 06:16:53'),
(2781, 10, 991, '702', 'Hathazari', 'Active', '2022-02-27 06:17:01', '2022-02-27 06:17:01'),
(2782, 10, 1400, '702', 'Hathazari Fatahabad', 'Active', '2022-02-27 06:17:05', '2022-02-27 06:17:05'),
(2783, 10, 1401, '702', 'Hathazari Gorduara', 'Active', '2022-02-27 06:17:16', '2022-02-27 06:17:16'),
(2784, 10, 1402, '702', 'Hathazari Katirhat', 'Active', '2022-02-27 06:17:26', '2022-02-27 06:17:26'),
(2785, 10, 1403, '702', 'Hathazari Madrasa`', 'Active', '2022-02-27 06:17:37', '2022-02-27 06:17:37'),
(2786, 10, 992, '702', 'Lohagara', 'Active', '2022-02-27 06:17:43', '2022-02-27 06:17:43'),
(2787, 10, 1404, '702', 'Hathazari Mirzapur', 'Active', '2022-02-27 06:17:54', '2022-02-27 06:17:54'),
(2788, 10, 1405, '702', 'Hathazari Nuralibari', 'Active', '2022-02-27 06:18:06', '2022-02-27 06:18:06'),
(2789, 10, 993, '702', 'Mirsarai', 'Active', '2022-02-27 06:18:07', '2022-02-27 06:18:07'),
(2790, 10, 1406, '702', 'Hathazari Yunus Nagar', 'Active', '2022-02-27 06:18:16', '2022-02-27 06:18:16'),
(2791, 10, 1407, '702', 'Jalalabad', 'Active', '2022-02-27 06:18:31', '2022-02-27 06:18:31'),
(2792, 10, 994, '702', 'Patiya', 'Active', '2022-02-27 06:18:43', '2022-02-27 06:18:43'),
(2793, 10, 1408, '702', 'Jaldi Banigram', 'Active', '2022-02-27 06:18:44', '2022-02-27 06:18:44'),
(2794, 10, 1409, '702', 'Jaldi Gunagari', 'Active', '2022-02-27 06:18:55', '2022-02-27 06:18:55'),
(2795, 10, 1410, '702', 'Jaldi Khan Bahadur', 'Active', '2022-02-27 06:19:06', '2022-02-27 06:19:06'),
(2796, 10, 995, '702', 'Rangunia', 'Active', '2022-02-27 06:19:06', '2022-02-27 06:19:06'),
(2797, 10, 1411, '702', 'Jaldi Sadar', 'Active', '2022-02-27 06:19:20', '2022-02-27 06:19:20'),
(2798, 10, 1412, '702', 'Jaldia Marine Academy', 'Active', '2022-02-27 06:19:34', '2022-02-27 06:19:34'),
(2799, 10, 996, '702', 'Raojan', 'Active', '2022-02-27 06:19:35', '2022-02-27 06:19:35'),
(2800, 10, 1413, '702', 'Jaldia Merine Accade', 'Active', '2022-02-27 06:19:47', '2022-02-27 06:19:47'),
(2801, 10, 997, '702', 'Sandwip (Guptachara)', 'Active', '2022-02-27 06:19:56', '2022-02-27 06:19:56'),
(2802, 10, 1414, '702', 'Kadeer Nagar', 'Active', '2022-02-27 06:20:00', '2022-02-27 06:20:00'),
(2803, 10, 1415, '702', 'Kaptai Chandraghona', 'Active', '2022-02-27 06:20:12', '2022-02-27 06:20:19'),
(2804, 10, 998, '702', 'Satkania', 'Active', '2022-02-27 06:20:21', '2022-02-27 06:20:21'),
(2805, 10, 999, '702', 'Sitakundu', 'Active', '2022-02-27 06:20:46', '2022-02-27 06:20:46'),
(2806, 10, 1000, '703', 'Barura', 'Active', '2022-02-27 06:21:12', '2022-02-27 06:21:12'),
(2807, 10, 1416, '709', 'Kaptai Kaptai Project', 'Active', '2022-02-27 06:21:17', '2022-02-27 06:21:17'),
(2810, 10, 1419, '702', 'Kattuli', 'Active', '2022-02-27 06:21:49', '2022-02-27 06:21:49'),
(2811, 10, 1001, '703', 'Brahmanpara', 'Active', '2022-02-27 06:21:55', '2022-02-27 06:21:55'),
(2812, 10, 1002, '703', 'Burichang', 'Active', '2022-02-27 06:22:28', '2022-02-27 06:22:28'),
(2813, 10, 1417, '709', 'Kaptai Nuton Bazar', 'Active', '2022-02-27 06:22:42', '2022-02-27 06:22:42'),
(2814, 10, 1418, '709', 'Kaptai Sadar', 'Active', '2022-02-27 06:22:56', '2022-02-27 06:22:56'),
(2815, 10, 1003, '703', 'Chandina', 'Active', '2022-02-27 06:22:58', '2022-02-27 06:22:58'),
(2816, 10, 1420, '702', 'Khulshi', 'Active', '2022-02-27 06:23:18', '2022-02-27 06:23:59'),
(2817, 10, 1004, '703', 'Chowddagram', 'Active', '2022-02-27 06:23:23', '2022-02-27 06:23:23'),
(2818, 10, 1421, '702', 'Lohagara Chunti', 'Active', '2022-02-27 06:23:28', '2022-02-27 06:24:11'),
(2819, 10, 1005, '703', 'Comilla Sadar', 'Active', '2022-02-27 06:23:44', '2022-02-27 06:23:44'),
(2820, 10, 1006, '693', 'Daudkandi', 'Active', '2022-02-27 06:24:09', '2022-02-27 06:24:09'),
(2821, 10, 1422, '702', 'Lohagara Padua', 'Active', '2022-02-27 06:24:27', '2022-02-27 06:24:27'),
(2822, 10, 1007, '703', 'Debiduar', 'Active', '2022-02-27 06:24:34', '2022-02-27 06:24:34'),
(2823, 10, 1423, '702', 'Middle Patenga', 'Active', '2022-02-27 06:24:47', '2022-02-27 06:24:47'),
(2824, 10, 1008, '703', 'Homna', 'Active', '2022-02-27 06:24:55', '2022-02-27 06:24:55'),
(2825, 10, 1424, '702', 'Mirsharai Abutorab', 'Active', '2022-02-27 06:24:59', '2022-02-27 06:24:59'),
(2826, 10, 1425, '702', 'Mirsharai Azampur', 'Active', '2022-02-27 06:27:31', '2022-02-27 06:27:31'),
(2827, 10, 1009, '703', 'Laksam', 'Active', '2022-02-27 06:27:40', '2022-02-27 06:27:40'),
(2828, 10, 1426, '702', 'Mirsharai Bharawazhat', 'Active', '2022-02-27 06:27:41', '2022-02-27 06:27:41'),
(2829, 10, 1427, '702', 'Mirsharai Darrogahat', 'Active', '2022-02-27 06:27:53', '2022-02-27 06:27:53'),
(2830, 10, 1428, '702', 'Mirsharai Joarganj', 'Active', '2022-02-27 06:28:03', '2022-02-27 06:28:03'),
(2831, 10, 1429, '702', 'Mirsharai Korerhat', 'Active', '2022-02-27 06:28:21', '2022-02-27 06:28:21'),
(2832, 10, 1430, '702', 'Mirsharai Mohazanhat', 'Active', '2022-02-27 06:28:31', '2022-02-27 06:28:31'),
(2833, 10, 1431, '702', 'Mohard', 'Active', '2022-02-27 06:28:42', '2022-02-27 06:28:42'),
(2834, 10, 1432, '702', 'Muradnagar - Hathazari', 'Active', '2022-02-27 06:28:56', '2022-02-27 06:28:56'),
(2835, 10, 1010, '703', 'Meghna', 'Active', '2022-02-27 06:29:05', '2022-02-27 06:29:05'),
(2836, 10, 1433, '702', 'Nasirabad', 'Active', '2022-02-27 06:29:10', '2022-02-27 06:29:10'),
(2837, 10, 1434, '702', 'North Halishahar', 'Active', '2022-02-27 06:29:31', '2022-02-27 06:29:31'),
(2838, 10, 1435, '702', 'North Kattali', 'Active', '2022-02-27 06:29:43', '2022-02-27 06:29:43'),
(2839, 10, 1011, '703', 'Muradnagar - Cumilla', 'Active', '2022-02-27 06:29:47', '2022-02-27 06:29:47'),
(2840, 10, 1436, '702', 'North Katuli', 'Active', '2022-02-27 06:29:54', '2022-02-27 06:29:54'),
(2841, 10, 1437, '702', 'Noyabazar', 'Active', '2022-02-27 06:30:03', '2022-02-27 06:30:03'),
(2842, 10, 1438, '702', 'Pahartoli', 'Active', '2022-02-27 06:30:12', '2022-02-27 06:30:12'),
(2843, 10, 1439, '702', 'Panchlaish', 'Active', '2022-02-27 06:30:22', '2022-02-27 06:31:07'),
(2844, 10, 1012, '703', 'Nangolkot', 'Active', '2022-02-27 06:30:24', '2022-02-27 06:30:24'),
(2845, 10, 1440, '702', 'Patenga', 'Active', '2022-02-27 06:30:38', '2022-02-27 06:30:38'),
(2846, 10, 1013, '703', 'Titas', 'Active', '2022-02-27 06:30:58', '2022-02-27 06:30:58'),
(2847, 10, 1441, '702', 'Patiya Budhpara', 'Active', '2022-02-27 06:31:38', '2022-02-27 06:31:38'),
(2848, 10, 1014, '703', 'Monoharganj', 'Active', '2022-02-27 06:31:39', '2022-02-27 06:31:39'),
(2849, 10, 1442, '702', 'Patiya Sadar', 'Active', '2022-02-27 06:32:01', '2022-02-27 06:32:58'),
(2850, 10, 1015, '703', 'Comilla Sadar South', 'Active', '2022-02-27 06:32:08', '2022-02-27 06:32:08'),
(2851, 10, 1443, '702', 'Rampur', 'Active', '2022-02-27 06:32:11', '2022-02-27 06:33:06'),
(2852, 10, 1444, '702', 'Rampura TSO', 'Active', '2022-02-27 06:32:27', '2022-02-27 06:33:17'),
(2853, 10, 1016, '704', 'Chakoria', 'Active', '2022-02-27 06:32:50', '2022-02-27 06:32:50'),
(2854, 10, 1445, '702', 'Rangunia Dhamair', 'Active', '2022-02-27 06:33:50', '2022-02-27 06:33:50'),
(2855, 10, 1017, '704', 'Kolatoli (Cox\'s Bazar)', 'Active', '2022-02-27 06:33:54', '2022-02-27 06:33:54'),
(2856, 10, 1446, '702', 'Rangunia Sadar', 'Active', '2022-02-27 06:34:06', '2022-02-27 06:34:06'),
(2857, 10, 1018, '704', 'Kutubdia', 'Active', '2022-02-27 06:34:28', '2022-02-27 06:34:28'),
(2858, 10, 1447, '702', 'Ranir Hat', 'Active', '2022-02-27 06:34:43', '2022-02-27 06:34:43'),
(2860, 10, 1019, '704', 'Moheshkhali', 'Active', '2022-02-27 06:35:01', '2022-02-27 06:35:01'),
(2861, 10, 1448, '702', 'Raozan B.I.T Post Office', 'Active', '2022-02-27 06:35:24', '2022-02-27 06:35:24'),
(2862, 10, 1020, '704', 'Pekua', 'Active', '2022-02-27 06:35:32', '2022-02-27 06:35:32'),
(2863, 10, 1449, '702', 'Raozan Beenajuri', 'Active', '2022-02-27 06:35:36', '2022-02-27 06:35:36'),
(2864, 10, 1450, '702', 'Raozan Dewanpur', 'Active', '2022-02-27 06:35:47', '2022-02-27 06:35:47'),
(2865, 10, 1021, '704', 'Ramu', 'Active', '2022-02-27 06:35:59', '2022-02-27 06:35:59'),
(2866, 10, 1451, '702', 'Raozan Fatepur', 'Active', '2022-02-27 06:36:00', '2022-02-27 06:36:00'),
(2867, 10, 1452, '702', 'Raozan Guzra Noapara', 'Active', '2022-02-27 06:36:12', '2022-02-27 06:36:12'),
(2868, 10, 1453, '702', 'Raozan jagannath Hat', 'Active', '2022-02-27 06:36:25', '2022-02-27 06:36:25'),
(2869, 10, 1454, '702', 'Raozan Kundeshwari', 'Active', '2022-02-27 06:36:40', '2022-02-27 06:36:40'),
(2870, 10, 1455, '702', 'Raozan Mohamuni', 'Active', '2022-02-27 06:36:52', '2022-02-27 06:36:52'),
(2871, 10, 1456, '702', 'Raozan Pouroshobha', 'Active', '2022-02-27 06:37:02', '2022-02-27 06:37:02'),
(2872, 10, 1457, '702', 'Rauzan Gahira', 'Active', '2022-02-27 06:37:14', '2022-02-27 06:37:14'),
(2873, 10, 1458, '702', 'Sadarghat', 'Active', '2022-02-27 06:37:24', '2022-02-27 06:37:33'),
(2874, 10, 1459, '702', 'Sandwip Shiberhat', 'Active', '2022-02-27 06:37:56', '2022-02-27 06:37:56'),
(2875, 10, 1022, '704', 'Teknaf', 'Active', '2022-02-27 06:38:01', '2022-02-27 06:38:01'),
(2876, 10, 1460, '702', 'Sandwip Urirchar', 'Active', '2022-02-27 06:38:17', '2022-02-27 06:38:17'),
(2877, 10, 1461, '702', 'Satkania Baitul Ijjat', 'Active', '2022-02-27 06:45:30', '2022-02-27 06:45:30'),
(2878, 10, 1462, '702', 'Satkania Bazalia', 'Active', '2022-02-27 06:45:52', '2022-02-27 06:45:52'),
(2879, 10, 1463, '702', 'Sayad Bari', 'Active', '2022-02-27 06:46:11', '2022-02-27 06:46:11'),
(2880, 10, 1464, '702', 'Sitakunda Barabkunda', 'Active', '2022-02-27 06:46:27', '2022-02-27 06:46:27'),
(2881, 10, 1465, '702', 'Sitakunda Baroidhala', 'Active', '2022-02-27 06:46:40', '2022-02-27 06:46:40'),
(2882, 10, 1466, '702', 'Sitakunda Bawashbaria', 'Active', '2022-02-27 06:46:55', '2022-02-27 06:46:55'),
(2883, 10, 1467, '702', 'Sitakunda Bhatiari', 'Active', '2022-02-27 06:47:12', '2022-02-27 06:47:12'),
(2884, 10, 1468, '702', 'Sitakunda Fouzdarhat', 'Active', '2022-02-27 06:47:24', '2022-02-27 06:47:24'),
(2885, 10, 1023, '704', 'Ukhia', 'Active', '2022-02-27 06:47:42', '2022-02-27 06:47:42'),
(2886, 10, 1469, '702', 'Sitakunda Jafrabad', 'Active', '2022-02-27 06:47:43', '2022-02-27 06:47:43'),
(2887, 10, 1470, '702', 'Sitakunda Kumira', 'Active', '2022-02-27 06:48:09', '2022-02-27 06:48:09'),
(2888, 10, 1471, '702', 'South Halishahar', 'Active', '2022-02-27 06:48:23', '2022-02-27 06:48:23'),
(2889, 10, 1024, '705', 'Chagalnayya', 'Active', '2022-02-27 06:48:25', '2022-02-27 06:48:25'),
(2890, 10, 1472, '702', 'Uttar Gatchak', 'Active', '2022-02-27 06:48:35', '2022-02-27 06:48:35'),
(2891, 10, 1473, '702', 'Wazedia', 'Active', '2022-02-27 06:48:46', '2022-02-27 06:48:46'),
(2892, 10, 1025, '705', 'Daganbhuiyan', 'Active', '2022-02-27 06:48:52', '2022-02-27 06:48:52'),
(2893, 10, 1474, '710', 'No area', 'Active', '2022-02-27 06:49:11', '2022-02-27 06:49:11'),
(2894, 10, 1026, '705', 'Feni Sadar', 'Active', '2022-02-27 06:49:20', '2022-02-27 06:49:20'),
(2895, 10, 1475, '712', 'Mawna', 'Active', '2022-02-27 06:49:26', '2022-02-27 06:49:26'),
(2896, 10, 1476, '712', 'Rajendrapur', 'Active', '2022-02-27 06:49:38', '2022-02-27 06:49:38'),
(2897, 10, 1027, '705', 'Parshuram', 'Active', '2022-02-27 06:49:44', '2022-02-27 06:49:44'),
(2898, 10, 1028, '705', 'Fulgazi', 'Active', '2022-02-27 06:50:06', '2022-02-27 06:50:06'),
(2899, 10, 1477, '712', 'Bhawal Gazipur', 'Active', '2022-02-27 06:50:12', '2022-02-27 06:50:12'),
(2900, 10, 1029, '704', 'Sonagazi', 'Active', '2022-02-27 06:50:25', '2022-02-27 06:50:25'),
(2901, 10, 1478, '712', 'Vobanipur Gazipur', 'Active', '2022-02-27 06:50:34', '2022-02-27 06:50:34'),
(2902, 10, 1479, '712', 'Barmi Sreepur (Gazipur)', 'Active', '2022-02-27 06:50:50', '2022-02-27 06:50:50'),
(2903, 10, 1030, '706', 'Dighinala', 'Active', '2022-02-27 06:50:59', '2022-02-27 06:50:59'),
(2904, 10, 1480, '712', 'Fulbaria Gazipur', 'Active', '2022-02-27 06:51:09', '2022-02-27 06:51:09'),
(2905, 10, 1481, '745', 'Eastern Housing (Pallabi)', 'Active', '2022-02-27 06:51:28', '2022-02-27 06:51:28'),
(2906, 10, 1031, '706', 'Khagrachari Sadar', 'Active', '2022-02-27 06:51:52', '2022-02-27 06:51:52'),
(2907, 10, 1482, '703', 'Gouripur (Comilla)', 'Active', '2022-02-27 06:51:56', '2022-02-27 06:51:56'),
(2908, 10, 1483, '745', 'College mor (Dinajpur)', 'Active', '2022-02-27 06:52:10', '2022-02-27 06:52:10'),
(2909, 10, 1032, '706', 'Laksmichari', 'Active', '2022-02-27 06:52:20', '2022-02-27 06:52:20'),
(2910, 10, 1484, '745', 'Boromath (Dinajpur)', 'Active', '2022-02-27 06:52:22', '2022-02-27 06:52:22'),
(2911, 10, 1485, '745', 'Pulhat', 'Active', '2022-02-27 06:52:55', '2022-02-27 06:52:55'),
(2912, 10, 1486, '745', 'Newtown (Dinajpur)', 'Active', '2022-02-27 06:53:11', '2022-02-27 06:53:11'),
(2913, 10, 1033, '706', 'Mohalchari', 'Active', '2022-02-27 06:53:11', '2022-02-27 06:53:11'),
(2914, 10, 1487, '745', 'Lilir mor', 'Active', '2022-02-27 06:53:22', '2022-02-27 06:53:22'),
(2915, 10, 1034, '706', 'Manikchari', 'Active', '2022-02-27 06:53:39', '2022-02-27 06:53:39'),
(2916, 10, 1488, '745', 'Modern mor (Dinajpur)', 'Active', '2022-02-27 06:53:59', '2022-02-27 06:53:59'),
(2917, 10, 1035, '706', 'Matiranga', 'Active', '2022-02-27 06:54:07', '2022-02-27 06:54:07'),
(2918, 10, 1489, '755', 'Old bustand (Sunamganj)', 'Active', '2022-02-27 06:54:13', '2022-02-27 06:54:13'),
(2920, 10, 1036, '706', 'Panchari', 'Active', '2022-02-27 06:54:41', '2022-02-27 06:54:41'),
(2921, 10, 1491, '755', 'Hason Nagar', 'Active', '2022-02-27 06:54:56', '2022-02-27 06:54:56'),
(2922, 10, 1037, '705', 'Ramgor', 'Active', '2022-02-27 06:55:05', '2022-02-27 06:55:05'),
(2923, 10, 1490, '755', 'Kazirpoint (Sunamganj)', 'Active', '2022-02-27 06:55:20', '2022-02-27 06:55:20'),
(2924, 10, 1492, '755', 'Moddho bazar (Sunamganj)', 'Active', '2022-02-27 06:55:41', '2022-02-27 06:55:41'),
(2927, 10, 1038, '707', 'Laksmipur Sadar', 'Active', '2022-02-27 06:56:20', '2022-02-27 06:56:20'),
(2928, 10, 1039, '707', 'Ramgati', 'Active', '2022-02-27 06:56:48', '2022-02-27 06:56:48'),
(2929, 10, 1493, '756', 'wazkhali', 'Active', '2022-02-27 06:56:53', '2022-02-27 06:56:53'),
(2930, 10, 1494, '756', 'Zindabazar', 'Active', '2022-02-27 06:57:04', '2022-02-27 06:57:04'),
(2931, 10, 1495, '756', 'Pathantula', 'Active', '2022-02-27 06:57:17', '2022-02-27 06:57:17'),
(2932, 10, 1040, '707', 'Ramganj', 'Active', '2022-02-27 06:57:17', '2022-02-27 06:57:17'),
(2933, 10, 1496, '756', 'Subidbazar', 'Active', '2022-02-27 06:57:33', '2022-02-27 06:57:33'),
(2934, 10, 1497, '756', 'Akhalia', 'Active', '2022-02-27 06:57:46', '2022-02-27 06:57:46'),
(2935, 10, 1041, '707', 'Raipur (Lakshmipur)', 'Active', '2022-02-27 06:57:48', '2022-02-27 06:57:48'),
(2936, 10, 1042, '707', 'Kamalnagar', 'Active', '2022-02-27 06:58:15', '2022-02-27 06:58:15'),
(2937, 10, 1043, '708', 'Begumganj', 'Active', '2022-02-27 06:58:43', '2022-02-27 06:58:43'),
(2938, 10, 1044, '708', 'Chatkhil', 'Active', '2022-02-27 06:59:17', '2022-02-27 06:59:17'),
(2939, 10, 1045, '708', 'Companiganj (Noakhali)', 'Active', '2022-02-27 07:00:15', '2022-02-27 07:00:15'),
(2940, 10, 1498, '756', 'Tilaghor', 'Active', '2022-02-27 07:01:15', '2022-02-27 07:01:15'),
(2941, 10, 1499, '756', 'Shibganj(sylhet)', 'Active', '2022-02-27 07:03:57', '2022-02-27 07:03:57'),
(2942, 10, 1500, '756', 'Uposhohor(Sylhet)', 'Active', '2022-02-27 07:04:17', '2022-02-27 07:04:17'),
(2943, 10, 1046, '708', 'Hatiya', 'Active', '2022-02-27 07:04:25', '2022-02-27 07:04:25'),
(2944, 10, 1501, '756', 'Kodomtoli', 'Active', '2022-02-27 07:04:54', '2022-02-27 07:04:54'),
(2945, 10, 1047, '708', 'Maijdee (Noakhali)', 'Active', '2022-02-27 07:05:01', '2022-02-27 07:05:01'),
(2946, 10, 1502, '756', 'Sheikhghat', 'Active', '2022-02-27 07:05:08', '2022-02-27 07:05:08'),
(2947, 10, 1503, '756', 'Majortila', 'Active', '2022-02-27 07:05:21', '2022-02-27 07:05:21'),
(2948, 10, 1048, '708', 'Senbag', 'Active', '2022-02-27 07:05:24', '2022-02-27 07:05:24'),
(2949, 10, 1504, '756', 'Subhanighat', 'Active', '2022-02-27 07:05:34', '2022-02-27 07:05:34'),
(2951, 10, 1049, '708', 'Sonaimuri', 'Active', '2022-02-27 07:06:01', '2022-02-27 07:06:01'),
(2953, 10, 1050, '708', 'Subarnachar', 'Active', '2022-02-27 07:06:26', '2022-02-27 07:06:26'),
(2954, 10, 1505, '719', 'Madhabdi (Narsingdi)', 'Active', '2022-02-27 07:06:48', '2022-02-27 07:06:48'),
(2955, 10, 1506, '719', 'Babur Haat (Narsingdi)', 'Active', '2022-02-27 07:07:13', '2022-02-27 07:07:13'),
(2956, 10, 1507, '719', 'Pachdona More (Narsingdi)', 'Active', '2022-02-27 07:08:00', '2022-02-27 07:08:00'),
(2957, 10, 1508, '719', 'Shaheprotab More (Narsingdi)', 'Active', '2022-02-27 07:08:13', '2022-02-27 07:08:13'),
(2958, 10, 1509, '719', 'West Brammondi (Narsingdi)', 'Active', '2022-02-27 07:08:33', '2022-02-27 07:08:33'),
(2959, 10, 1510, '719', 'East Brammondi (Narsingdi)', 'Active', '2022-02-27 07:08:46', '2022-02-27 07:08:46'),
(2960, 10, 1511, '719', 'Songita Bazar (Narsingdi)', 'Active', '2022-02-27 07:08:59', '2022-02-27 07:08:59'),
(2961, 10, 1512, '719', 'Shatirpara', 'Active', '2022-02-27 07:09:16', '2022-02-27 07:09:16'),
(2962, 10, 1513, '719', 'Hasnabad Bazar (Narsingdi)', 'Active', '2022-02-27 07:09:31', '2022-02-27 07:09:31'),
(2969, 10, 1514, '753', 'Rajnogor', 'Active', '2022-02-27 07:12:59', '2022-02-27 07:12:59'),
(2970, 10, 1515, '753', 'Chowdhury Bazar (Habiganj)', 'Active', '2022-02-27 07:13:13', '2022-02-27 07:13:13'),
(2971, 10, 1516, '753', 'Sultanmahmudpur', 'Active', '2022-02-27 07:13:23', '2022-02-27 07:13:23'),
(2972, 10, 1517, '753', 'Gatiabazar', 'Active', '2022-02-27 07:13:33', '2022-02-27 07:13:33'),
(2973, 10, 1518, '753', 'Mahmudabad', 'Active', '2022-02-27 07:13:43', '2022-02-27 07:13:43'),
(2974, 10, 1519, '753', 'Duliakal', 'Active', '2022-02-27 07:13:54', '2022-02-27 07:13:54'),
(2975, 10, 1520, '753', 'Mohonpur (Habiganj)', 'Active', '2022-02-27 07:14:08', '2022-02-27 07:14:08'),
(2976, 10, 1521, '700', 'Kawtoly (Brahmanbaria)', 'Active', '2022-02-27 07:14:31', '2022-02-27 07:14:31'),
(2977, 10, 1522, '700', 'T.A Road (Brahmanbaria)', 'Active', '2022-02-27 07:14:58', '2022-02-27 07:14:58'),
(2978, 10, 1523, '700', 'Sarak bazar (Brahmanbaria)', 'Active', '2022-02-27 07:15:17', '2022-02-27 07:15:17'),
(2979, 10, 1524, '700', 'Moddopara (Brahmanbaria)', 'Active', '2022-02-27 07:15:32', '2022-02-27 07:15:32'),
(2980, 10, 1525, '700', 'Birashar (Brahmanbaria)', 'Active', '2022-02-27 07:15:45', '2022-02-27 07:15:45'),
(2981, 10, 1526, '700', 'Medda (Brahmanbaria)', 'Active', '2022-02-27 07:16:01', '2022-02-27 07:16:01'),
(2982, 10, 1527, '700', 'Gatura- Pirbari (Brahmanbaria)', 'Active', '2022-02-27 07:16:15', '2022-02-27 07:16:15'),
(2983, 10, 1528, '734', 'Chorpara (Mymensingh)', 'Active', '2022-02-27 07:16:35', '2022-02-27 07:16:35'),
(2984, 10, 1529, '734', 'Kachijhuli', 'Active', '2022-02-27 07:16:46', '2022-02-27 07:16:46'),
(2985, 10, 1530, '734', 'College Road (Mymensigh)', 'Active', '2022-02-27 07:16:59', '2022-02-27 07:16:59'),
(2986, 10, 1531, '734', 'Akua', 'Active', '2022-02-27 07:17:13', '2022-02-27 07:17:13'),
(2987, 10, 1532, '734', 'Agriculture University (Mymensingh)', 'Active', '2022-02-27 07:17:27', '2022-02-27 07:17:27'),
(2988, 10, 1533, '734', 'Zilla School Mor (Mymensingh)', 'Active', '2022-02-27 07:17:42', '2022-02-27 07:17:42'),
(2989, 10, 1534, '734', 'Rohomotpur Bypass', 'Active', '2022-02-27 07:17:55', '2022-02-27 07:17:55'),
(2990, 10, 1535, '734', 'Mashkanda', 'Active', '2022-02-27 07:18:08', '2022-02-27 07:18:08'),
(2991, 10, 1536, '712', 'Pubail', 'Active', '2022-02-27 07:18:24', '2022-02-27 07:18:24'),
(2992, 10, 1537, '712', 'Mirerbazar', 'Active', '2022-02-27 07:18:44', '2022-02-27 07:18:44'),
(2993, 10, 1538, '712', 'Ulokhola', 'Active', '2022-02-27 07:18:56', '2022-02-27 07:19:04'),
(2994, 10, 1539, '712', 'Modhumita', 'Active', '2022-02-27 07:19:25', '2022-02-27 07:19:25'),
(2995, 10, 1540, '712', 'Miraspara', 'Active', '2022-02-27 07:19:38', '2022-02-27 07:19:38'),
(2996, 10, 1541, '712', 'Pagar', 'Active', '2022-02-27 07:19:54', '2022-02-27 07:19:54'),
(2997, 10, 1542, '712', 'Jinumarket', 'Active', '2022-02-27 07:20:05', '2022-02-27 07:20:05'),
(2998, 10, 1543, '712', 'T & T(Gazipur)', 'Active', '2022-02-27 07:20:17', '2022-02-27 07:20:17'),
(2999, 10, 1544, '712', 'Shilmun', 'Active', '2022-02-27 07:20:27', '2022-02-27 07:20:27'),
(3000, 10, 1545, '712', 'Mudafa', 'Active', '2022-02-27 07:20:38', '2022-02-27 07:20:38'),
(3001, 10, 1546, '712', 'Khapara', 'Active', '2022-02-27 07:20:51', '2022-02-27 07:20:51'),
(3002, 10, 1547, '712', 'Malakerbari', 'Active', '2022-02-27 07:23:49', '2022-02-27 07:23:49'),
(3003, 10, 1548, '712', 'Bypass Road (Gazipur)', 'Active', '2022-02-27 07:24:02', '2022-02-27 07:24:02'),
(3004, 10, 1549, '712', 'Kodda', 'Active', '2022-02-27 07:24:13', '2022-02-27 07:24:13'),
(3005, 10, 1550, '712', 'Duet Road', 'Active', '2022-02-27 07:24:48', '2022-02-27 07:24:48'),
(3006, 10, 1551, '712', 'Shibbari', 'Active', '2022-02-27 07:25:33', '2022-02-27 07:25:33'),
(3007, 10, 1552, '712', 'Shimultoli', 'Active', '2022-02-27 07:25:43', '2022-02-27 07:25:55'),
(3008, 10, 1553, '712', 'Jorpukur', 'Active', '2022-02-27 07:26:14', '2022-02-27 07:26:14'),
(3009, 10, 1554, '712', 'Salna', 'Active', '2022-02-27 07:26:24', '2022-02-27 07:26:24'),
(3010, 10, 1555, '712', 'Porabari Bazar', 'Active', '2022-02-27 07:26:35', '2022-02-27 07:26:35'),
(3011, 10, 1556, '712', 'Dhaladia Gazipur', 'Active', '2022-02-27 07:26:45', '2022-02-27 07:26:45'),
(3012, 10, 1557, '712', 'Hotapara', 'Active', '2022-02-27 07:26:56', '2022-02-27 07:26:56'),
(3013, 10, 1558, '712', 'Bager bazar', 'Active', '2022-02-27 07:27:08', '2022-02-27 07:27:08'),
(3014, 10, 1559, '712', 'Member Bari Gazipur', 'Active', '2022-02-27 07:27:21', '2022-02-27 07:27:21'),
(3015, 10, 1560, '712', 'Gorgoria masterbari', 'Active', '2022-02-27 07:27:33', '2022-02-27 07:27:33'),
(3016, 10, 1561, '712', 'Mc Bazar', 'Active', '2022-02-27 07:27:54', '2022-02-27 07:28:08'),
(3017, 10, 1562, '712', 'Nayanpur Sreepur', 'Active', '2022-02-27 07:28:31', '2022-02-27 07:28:31'),
(3018, 10, 1563, '712', 'Konabari', 'Active', '2022-02-27 07:28:42', '2022-02-27 07:28:42'),
(3019, 10, 1564, '712', 'Mouchak Gazipur', 'Active', '2022-02-27 07:29:10', '2022-02-27 07:29:10'),
(3020, 10, 1565, '712', 'Kashempur', 'Active', '2022-02-27 07:29:19', '2022-02-27 07:29:19'),
(3021, 10, 1566, '712', 'Shafipur', 'Active', '2022-02-27 07:29:28', '2022-02-27 07:29:28'),
(3022, 10, 1567, '712', 'Joyna Bazar', 'Active', '2022-02-27 07:29:40', '2022-02-27 07:29:40'),
(3023, 10, 1568, '712', 'Pollibiddut Gazipur', 'Active', '2022-02-27 07:29:51', '2022-02-27 07:29:51'),
(3024, 10, 1569, '712', 'Chondra Gazipur', 'Active', '2022-02-27 07:30:02', '2022-02-27 07:30:02'),
(3025, 10, 1570, '712', 'Rajabari Sreepur', 'Active', '2022-02-27 07:30:17', '2022-02-27 07:30:17'),
(3026, 10, 1571, '710', 'Jahangir Gate', 'Active', '2022-02-27 07:30:32', '2022-02-27 07:30:32'),
(3027, 10, 1572, '710', 'Nijhum gate', 'Active', '2022-02-27 07:30:46', '2022-02-27 07:30:46'),
(3028, 10, 1573, '712', 'BAF Bashar (Dhaka cantonment)', 'Active', '2022-02-27 07:30:57', '2022-02-27 07:30:57'),
(3029, 10, 1574, '712', 'Zia Colony', 'Active', '2022-02-27 07:31:07', '2022-02-27 07:31:07'),
(3030, 10, 1575, '712', 'MES colony', 'Active', '2022-02-27 07:31:18', '2022-02-27 07:31:18'),
(3031, 10, 1576, '704', 'Kalur Dokan', 'Active', '2022-02-27 07:31:39', '2022-02-27 07:31:39'),
(3032, 10, 1577, '704', 'Alir Jahal Road', 'Active', '2022-02-27 07:32:00', '2022-02-27 07:32:00'),
(3033, 10, 1578, '704', 'Barmis Market', 'Active', '2022-02-27 07:32:15', '2022-02-27 07:32:15'),
(3034, 10, 1579, '704', 'Bazar Ghata', 'Active', '2022-02-27 07:32:33', '2022-02-27 07:32:33'),
(3035, 10, 1580, '704', 'Laldighir Par (Cox\'s Bazar)', 'Active', '2022-02-27 07:32:50', '2022-02-27 07:32:50'),
(3036, 10, 1581, '704', 'Holiday Mor(Cox\'s Bazar)', 'Active', '2022-02-27 07:33:09', '2022-02-27 07:33:09'),
(3037, 10, 1582, '704', 'Laboni Point', 'Active', '2022-02-27 07:33:27', '2022-02-27 07:33:27'),
(3038, 10, 1583, '704', 'Sughandha Point', 'Active', '2022-02-27 07:33:48', '2022-02-27 07:33:48'),
(3039, 10, 1584, '704', 'Marin Drive Road', 'Active', '2022-02-27 07:34:14', '2022-02-27 07:34:14'),
(3040, 10, 1585, '704', 'Sonar Tara', 'Active', '2022-02-27 07:34:31', '2022-02-27 07:34:31'),
(3041, 10, 1586, '704', 'Jilonjha', 'Active', '2022-02-27 07:34:43', '2022-02-27 07:34:43'),
(3042, 10, 1587, '704', 'Tarabaniyer chora', 'Active', '2022-02-27 07:34:57', '2022-02-27 07:34:57'),
(3043, 10, 1588, '704', 'Romaliyer chora', 'Active', '2022-02-27 07:35:21', '2022-02-27 07:35:21'),
(3044, 10, 1589, '704', 'Khurushkul', 'Active', '2022-02-27 07:35:34', '2022-02-27 07:35:34'),
(3045, 10, 1590, '704', 'P M Khali', 'Active', '2022-02-27 07:35:48', '2022-02-27 07:35:48'),
(3046, 10, 1591, '704', 'Somity Para', 'Active', '2022-02-27 07:36:06', '2022-02-27 07:36:06'),
(3048, 10, 1592, '727', 'Amadee Bazar', 'Active', '2022-02-27 07:36:48', '2022-02-27 07:36:48'),
(3049, 10, 1593, '727', 'kopilmuni Bazar', 'Active', '2022-02-27 07:37:03', '2022-02-27 07:37:03'),
(3050, 10, 1594, '710', 'Arambag (Mirpur)', 'Active', '2022-02-27 07:37:16', '2022-02-27 07:37:16'),
(3051, 10, 1595, '710', 'Nazimuddin Road (Puran Dhaka)', 'Active', '2022-02-27 07:37:27', '2022-02-27 07:37:27'),
(3052, 10, 1596, '710', 'Nazimuddin Road (Malibag)', 'Active', '2022-02-27 07:37:45', '2022-02-27 07:37:45'),
(3053, 10, 1597, '710', 'Kodomtoli (Jatrabari)', 'Active', '2022-02-27 07:38:03', '2022-02-27 07:38:03'),
(3054, 10, 1598, '710', 'SDA', 'Active', '2022-02-27 07:38:22', '2022-02-27 07:38:22'),
(3055, 10, 1599, '753', 'Shayestaganj (Shayestaganj Hub)', 'Active', '2022-02-27 07:38:36', '2022-02-27 07:38:36'),
(3056, 10, 1600, '710', 'Mirpur 60 feet', 'Active', '2022-02-27 07:38:51', '2022-02-27 07:38:51'),
(3057, 10, 1601, '707', 'Alexandar', 'Active', '2022-02-27 07:39:20', '2022-02-27 07:39:20'),
(3058, 10, 1602, '697', 'Kuakata', 'Active', '2022-02-27 07:39:35', '2022-02-27 07:39:35'),
(3059, 10, 1603, '697', 'Subidkhali', 'Active', '2022-02-27 07:39:46', '2022-02-27 07:39:46'),
(3060, 10, 1604, '697', 'Khepupara', 'Active', '2022-02-27 07:40:26', '2022-02-27 07:40:26'),
(3061, 10, 1605, '697', 'Payra port', 'Active', '2022-02-27 07:40:50', '2022-02-27 07:40:50'),
(3062, 10, 1606, '697', 'Bagabandar', 'Active', '2022-02-27 07:41:02', '2022-02-27 07:41:02'),
(3063, 10, 1607, '697', 'Kalaia', 'Active', '2022-02-27 07:41:14', '2022-02-27 07:41:14'),
(3064, 10, 1608, '697', 'Mahipur', 'Active', '2022-02-27 07:41:28', '2022-02-27 07:41:28'),
(3065, 10, 1609, '697', 'Birpasha', 'Active', '2022-02-27 07:41:41', '2022-02-27 07:41:41'),
(3066, 10, 1610, '702', 'Sandwip (Enam Nagar)', 'Active', '2022-02-27 07:42:03', '2022-02-27 07:42:03'),
(3067, 10, 1051, '708', 'Kabir Hat', 'Active', '2022-02-27 07:42:07', '2022-02-27 07:42:07'),
(3068, 10, 1611, '702', 'Sandwip (Complex)', 'Active', '2022-02-27 07:42:20', '2022-02-27 07:42:20'),
(3069, 10, 1052, '709', 'Baghaichari', 'Active', '2022-02-27 07:42:40', '2022-02-27 07:42:40'),
(3070, 10, 1612, '702', 'Sandwip (Kalapaniya)', 'Active', '2022-02-27 07:42:47', '2022-02-27 07:42:47'),
(3071, 10, 1613, '702', 'Sandwip (Gasua)', 'Active', '2022-02-27 07:43:06', '2022-02-27 07:43:06'),
(3072, 10, 1053, '709', 'Barkal', 'Active', '2022-02-27 07:43:07', '2022-02-27 07:43:07'),
(3073, 10, 1614, '753', 'Ranigaon (Shayestaganj Hub)', 'Active', '2022-02-27 07:43:18', '2022-02-27 07:43:18'),
(3074, 10, 1615, '756', 'Putijuri (Shayestaganj Hub)', 'Active', '2022-02-27 07:43:35', '2022-02-27 07:43:35'),
(3075, 10, 1054, '709', 'Belaichari', 'Active', '2022-02-27 07:43:46', '2022-02-27 07:43:46'),
(3076, 10, 1616, '742', 'Banwarinagar (Pabna)', 'Active', '2022-02-27 07:43:58', '2022-02-27 07:43:58'),
(3077, 10, 1055, '709', 'Jurachari', 'Active', '2022-02-27 07:44:12', '2022-02-27 07:44:12'),
(3078, 10, 1617, '742', 'Debottar (Pabna)', 'Active', '2022-02-27 07:44:12', '2022-02-27 07:44:12'),
(3079, 10, 1618, '742', 'Kashinathpur (Pabna)', 'Active', '2022-02-27 07:44:29', '2022-02-27 07:44:29'),
(3080, 10, 1619, '742', 'Nakalia (Pabna)', 'Active', '2022-02-27 07:44:43', '2022-02-27 07:44:43'),
(3081, 10, 1056, '708', 'Kaptai', 'Active', '2022-02-27 07:44:43', '2022-02-27 07:44:43'),
(3082, 10, 1620, '742', 'Pakshi (Pabna)', 'Active', '2022-02-27 07:44:59', '2022-02-27 07:44:59'),
(3083, 10, 1621, '742', 'Sagarkandi (Pabna)', 'Active', '2022-02-27 07:45:11', '2022-02-27 07:45:11'),
(3084, 10, 1057, '709', 'Kawkhali (Rangamati)', 'Active', '2022-02-27 07:45:13', '2022-02-27 07:45:13'),
(3086, 10, 1058, '709', 'Langadu', 'Active', '2022-02-27 07:45:45', '2022-02-27 07:45:45'),
(3087, 10, 1059, '708', 'Naniarchar', 'Active', '2022-02-27 07:46:05', '2022-02-27 07:46:05'),
(3088, 10, 1622, '754', 'Shamshernagar (Moulvibazar)', 'Active', '2022-02-27 07:46:06', '2022-02-27 07:46:06'),
(3089, 10, 1060, '708', 'Rajasthali', 'Active', '2022-02-27 07:46:24', '2022-02-27 07:46:24'),
(3090, 10, 1623, '754', 'Sherpur (Moulvibazar)', 'Active', '2022-02-27 07:46:33', '2022-02-27 07:46:33'),
(3091, 10, 1624, '754', 'Baramchal (Kulaura)', 'Active', '2022-02-27 07:46:53', '2022-02-27 07:46:53'),
(3092, 10, 1061, '709', 'Rangamati Sadar', 'Active', '2022-02-27 07:47:03', '2022-02-27 07:47:03'),
(3093, 10, 1625, '754', 'Robir Bazar (Kulaura)', 'Active', '2022-02-27 07:47:13', '2022-02-27 07:47:13'),
(3094, 10, 1626, '700', 'Bijoynagor (Brahmanbaria)', 'Active', '2022-02-27 07:47:42', '2022-02-27 07:47:42'),
(3095, 10, 1062, '745', 'Birampur', 'Active', '2022-02-27 07:47:56', '2022-02-27 07:47:56'),
(3096, 10, 1627, '700', 'Shahbajpur (Brahmanbaria)', 'Active', '2022-02-27 07:48:08', '2022-02-27 07:48:08'),
(3097, 10, 1628, '700', 'Sohilpur (Brahmanbaria)', 'Active', '2022-02-27 07:48:23', '2022-02-27 07:48:23'),
(3098, 10, 1063, '745', 'Birganj', 'Active', '2022-02-27 07:48:41', '2022-02-27 07:48:41');
INSERT INTO `zones` (`id`, `courier_id`, `zoneId`, `city_id`, `zoneName`, `status`, `created_at`, `updated_at`) VALUES
(3099, 10, 1629, '700', 'Chandura (Brahmanbaria)', 'Active', '2022-02-27 07:48:48', '2022-02-27 07:48:48'),
(3100, 10, 1630, '700', 'Singarbil (Brahmanbaria)', 'Active', '2022-02-27 07:49:07', '2022-02-27 07:49:07'),
(3101, 10, 1064, '745', 'Birol', 'Active', '2022-02-27 07:49:10', '2022-02-27 07:49:10'),
(3102, 10, 1631, '700', 'Awliya Bazar (Brahmanbaria)', 'Active', '2022-02-27 07:49:23', '2022-02-27 07:49:23'),
(3103, 10, 1065, '745', 'Bochaganj', 'Active', '2022-02-27 07:49:41', '2022-02-27 07:49:41'),
(3104, 10, 1632, '700', 'Poirtola (Brahmanbaria)', 'Active', '2022-02-27 07:49:41', '2022-02-27 07:49:41'),
(3105, 10, 1633, '700', 'Ulchapara (Brahmanbaria)', 'Active', '2022-02-27 07:49:58', '2022-02-27 07:49:58'),
(3106, 10, 1066, '745', 'Chirirbandar', 'Active', '2022-02-27 07:50:09', '2022-02-27 07:50:09'),
(3107, 10, 1634, '700', 'Bhadugor (Brahmanbaria)', 'Active', '2022-02-27 07:50:24', '2022-02-27 07:50:24'),
(3108, 10, 1067, '745', 'Baluadanga (Dinajpur)', 'Active', '2022-02-27 07:50:31', '2022-02-27 07:50:31'),
(3109, 10, 1635, '700', 'Kumarshil more (Brahmanbaria)', 'Active', '2022-02-27 07:50:41', '2022-02-27 07:50:41'),
(3110, 10, 1068, '745', 'Phulbari (Dinajpur)', 'Active', '2022-02-27 07:50:56', '2022-02-27 07:50:56'),
(3111, 10, 1636, '710', 'Banasree Block - A', 'Active', '2022-02-27 07:51:15', '2022-02-27 07:51:15'),
(3112, 10, 1069, '745', 'Ghoraghat', 'Active', '2022-02-27 07:51:28', '2022-02-27 07:51:28'),
(3113, 10, 1637, '710', 'Banasree Block - B', 'Active', '2022-02-27 07:51:40', '2022-02-27 07:52:00'),
(3114, 10, 1070, '745', 'Hakimpur', 'Active', '2022-02-27 07:52:04', '2022-02-27 07:52:04'),
(3115, 10, 1638, '710', 'Banasree Block - C', 'Active', '2022-02-27 07:52:29', '2022-02-27 07:52:29'),
(3116, 10, 1071, '745', 'Kaharole', 'Active', '2022-02-27 07:52:36', '2022-02-27 07:52:36'),
(3117, 10, 1639, '710', 'Banasree Block - D', 'Active', '2022-02-27 07:53:00', '2022-02-27 07:53:00'),
(3118, 10, 1640, '710', 'Banasree Block - E', 'Active', '2022-02-27 07:53:27', '2022-02-27 07:53:27'),
(3119, 10, 1641, '710', 'Banasree Block - F', 'Active', '2022-02-27 07:53:42', '2022-02-27 07:53:42'),
(3120, 10, 1642, '710', 'Banasree Block - G', 'Active', '2022-02-27 07:54:16', '2022-02-27 07:54:16'),
(3121, 10, 1643, '710', 'Banasree Block - H', 'Active', '2022-02-27 07:54:52', '2022-02-27 07:54:52'),
(3122, 10, 1072, '745', 'Khanshama', 'Active', '2022-02-27 07:54:57', '2022-02-27 07:54:57'),
(3123, 10, 1644, '710', 'Banasree Block - I', 'Active', '2022-02-27 07:55:08', '2022-02-27 07:55:08'),
(3124, 10, 1645, '710', 'Banasree Block - J', 'Active', '2022-02-27 07:55:24', '2022-02-27 07:55:24'),
(3125, 10, 1646, '710', 'Banasree Block - K', 'Active', '2022-02-27 07:55:40', '2022-02-27 07:55:40'),
(3126, 10, 1073, '745', 'Nawabganj (Dinajpur)', 'Active', '2022-02-27 07:55:57', '2022-02-27 07:55:57'),
(3127, 10, 1647, '710', 'Banasree Block - L', 'Active', '2022-02-27 07:56:15', '2022-02-27 07:56:15'),
(3128, 10, 1074, '745', 'Parbatipur', 'Active', '2022-02-27 07:56:22', '2022-02-27 07:56:22'),
(3129, 10, 1648, '710', 'Banasree Block - M', 'Active', '2022-02-27 07:56:35', '2022-02-27 07:56:35'),
(3130, 10, 1649, '710', 'Banasree Block - N', 'Active', '2022-02-27 07:57:04', '2022-02-27 07:57:04'),
(3131, 10, 1075, '746', 'Fulchari', 'Active', '2022-02-27 07:57:21', '2022-02-27 07:57:21'),
(3132, 10, 1650, '710', 'Uttara Sector - 1', 'Active', '2022-02-27 07:57:24', '2022-02-27 07:57:24'),
(3133, 10, 1651, '710', 'Uttara Sector - 2', 'Active', '2022-02-27 07:57:47', '2022-02-27 07:57:47'),
(3134, 10, 1076, '746', 'Gaibandha Sadar', 'Active', '2022-02-27 07:57:57', '2022-02-27 07:57:57'),
(3135, 10, 1077, '746', 'Gobindaganj ( Gaibandha)', 'Active', '2022-02-27 07:58:25', '2022-02-27 07:58:25'),
(3136, 10, 1652, '710', 'Uttara Sector - 6', 'Active', '2022-02-27 07:58:43', '2022-02-27 07:58:43'),
(3137, 10, 1653, '710', 'Uttara Sector - 8', 'Active', '2022-02-27 07:58:54', '2022-02-27 07:58:54'),
(3138, 10, 1078, '746', 'Palashbari', 'Active', '2022-02-27 07:58:54', '2022-02-27 07:58:54'),
(3139, 10, 1654, '710', 'Uttara Sector - 10', 'Active', '2022-02-27 07:59:10', '2022-02-27 07:59:10'),
(3140, 10, 1655, '710', 'Uttara Sector - 12', 'Active', '2022-02-27 07:59:21', '2022-02-27 07:59:21'),
(3141, 10, 1079, '746', 'Sadullapur', 'Active', '2022-02-27 07:59:23', '2022-02-27 07:59:23'),
(3142, 10, 1656, '710', 'Uttara Sector - 13', 'Active', '2022-02-27 07:59:32', '2022-02-27 07:59:32'),
(3143, 10, 1080, '746', 'Shaghatta', 'Active', '2022-02-27 07:59:46', '2022-02-27 07:59:46'),
(3144, 10, 1657, '710', 'Uttara Sector - 15', 'Active', '2022-02-27 07:59:47', '2022-02-27 07:59:47'),
(3145, 10, 1081, '746', 'Sundarganj', 'Active', '2022-02-27 08:00:15', '2022-02-27 08:00:15'),
(3146, 10, 1658, '718', 'Signboard (Narayanganj)', 'Active', '2022-02-27 08:00:22', '2022-02-27 08:00:22'),
(3147, 10, 1659, '718', 'Jalkuri (Narayanganj)', 'Active', '2022-02-27 08:00:35', '2022-02-27 08:00:35'),
(3148, 10, 1660, '710', 'Dhanmondi - Rd 1', 'Active', '2022-02-27 08:00:45', '2022-02-27 08:00:45'),
(3149, 10, 1661, '710', 'Dhanmondi - Rd 2', 'Active', '2022-02-27 08:00:58', '2022-02-27 08:00:58'),
(3150, 10, 1082, '747', 'Bhurungamari', 'Active', '2022-02-27 08:00:59', '2022-02-27 08:00:59'),
(3151, 10, 1662, '710', 'Dhanmondi - Rd 4', 'Active', '2022-02-27 08:01:14', '2022-02-27 08:01:14'),
(3152, 10, 1663, '710', 'Dhanmondi - Rd 4A', 'Active', '2022-02-27 08:01:38', '2022-02-27 08:01:38'),
(3153, 10, 1664, '710', 'Dhanmondi - Rd 6', 'Active', '2022-02-27 08:01:50', '2022-02-27 08:01:50'),
(3154, 10, 1665, '710', 'Dhanmondi - Rd 6', 'Active', '2022-02-27 08:02:03', '2022-02-27 08:02:03'),
(3155, 10, 1083, '747', 'Chilmary', 'Active', '2022-02-27 08:02:12', '2022-02-27 08:02:12'),
(3156, 10, 1666, '710', 'Dhanmondi - Rd 3A', 'Active', '2022-02-27 08:02:16', '2022-02-27 08:02:16'),
(3157, 10, 1667, '710', 'Dhanmondi - Rd 6A', 'Active', '2022-02-27 08:02:31', '2022-02-27 08:02:31'),
(3158, 10, 1668, '710', 'Dhanmondi - Rd 8', 'Active', '2022-02-27 08:02:46', '2022-02-27 08:02:46'),
(3159, 10, 1084, '747', 'Fulbari (Kurigram)', 'Active', '2022-02-27 08:03:04', '2022-02-27 08:03:04'),
(3160, 10, 1669, '710', 'Dhanmondi - Rd 8A', 'Active', '2022-02-27 08:03:05', '2022-02-27 08:03:05'),
(3161, 10, 1670, '710', 'Dhanmondi - Rd 9', 'Active', '2022-02-27 08:03:24', '2022-02-27 08:03:24'),
(3162, 10, 1671, '710', 'Dhanmondi - Rd 9A', 'Active', '2022-02-27 08:03:39', '2022-02-27 08:03:39'),
(3163, 10, 1085, '747', 'Kurigram Sadar', 'Active', '2022-02-27 08:03:40', '2022-02-27 08:03:40'),
(3164, 10, 1672, '710', 'Dhanmondi - Rd 10', 'Active', '2022-02-27 08:03:51', '2022-02-27 08:03:51'),
(3165, 10, 1673, '710', 'Dhanmondi - Rd 12', 'Active', '2022-02-27 08:04:02', '2022-02-27 08:04:02'),
(3166, 10, 1674, '710', 'Dhanmondi - Rd 12A', 'Active', '2022-02-27 08:04:14', '2022-02-27 08:04:14'),
(3167, 10, 1086, '747', 'Nageswari', 'Active', '2022-02-27 08:04:17', '2022-02-27 08:04:17'),
(3168, 10, 1675, '710', 'Dhanmondi - Rd 15', 'Active', '2022-02-27 08:04:28', '2022-02-27 08:04:28'),
(3169, 10, 1676, '710', 'Dhanmondi - Rd 15 A', 'Active', '2022-02-27 08:04:45', '2022-02-27 08:04:45'),
(3170, 10, 1087, '747', 'Rajarhat', 'Active', '2022-02-27 08:04:47', '2022-02-27 08:04:47'),
(3171, 10, 1677, '710', 'Dhanmondi - Rd 27', 'Active', '2022-02-27 08:04:56', '2022-02-27 08:04:56'),
(3172, 10, 1678, '710', 'Dhanmondi - Rd 28', 'Active', '2022-02-27 08:05:09', '2022-02-27 08:05:09'),
(3173, 10, 1088, '747', 'Rajibpur', 'Active', '2022-02-27 08:05:20', '2022-02-27 08:05:20'),
(3174, 10, 1679, '710', 'Dhanmondi - Rd 29', 'Active', '2022-02-27 08:05:27', '2022-02-27 08:05:27'),
(3175, 10, 1680, '718', 'Shibu Market (Narayanganj)', 'Active', '2022-02-27 08:05:49', '2022-02-27 08:05:49'),
(3176, 10, 1089, '747', 'Rowmari', 'Active', '2022-02-27 08:05:58', '2022-02-27 08:05:58'),
(3177, 10, 1681, '710', 'Zafrabad', 'Active', '2022-02-27 08:06:01', '2022-02-27 08:06:01'),
(3178, 10, 1090, '747', 'Ulipur', 'Active', '2022-02-27 08:06:31', '2022-02-27 08:06:31'),
(3179, 10, 1682, '710', 'Sadek Khan Road', 'Active', '2022-02-27 08:06:41', '2022-02-27 08:06:41'),
(3180, 10, 1683, '710', 'Sher e Bangla Road', 'Active', '2022-02-27 08:06:57', '2022-02-27 08:06:57'),
(3181, 10, 1684, '710', 'Katasur', 'Active', '2022-02-27 08:07:10', '2022-02-27 08:07:10'),
(3182, 10, 1685, '710', 'Dhanmondi Staff Quarter', 'Active', '2022-02-27 08:07:21', '2022-02-27 08:07:21'),
(3183, 10, 1091, '748', 'Aditmari', 'Active', '2022-02-27 08:07:22', '2022-02-27 08:07:22'),
(3184, 10, 1686, '710', 'Uttara Sector - 16', 'Active', '2022-02-27 08:07:36', '2022-02-27 08:07:36'),
(3185, 10, 1687, '710', 'Uttara Sector - 17', 'Active', '2022-02-27 08:07:48', '2022-02-27 08:07:48'),
(3186, 10, 1688, '710', 'Uttara Sector - 18', 'Active', '2022-02-27 08:08:03', '2022-02-27 08:08:03'),
(3187, 10, 1689, '718', 'Chittagong Road (Narayanganj)', 'Active', '2022-02-27 08:08:20', '2022-02-27 08:08:20'),
(3188, 10, 1690, '710', 'Arshinagar', 'Active', '2022-02-27 08:08:34', '2022-02-27 08:08:34'),
(3189, 10, 1691, '710', 'Washpur', 'Active', '2022-02-27 08:08:43', '2022-02-27 08:08:43'),
(3190, 10, 1692, '710', 'Garden City', 'Active', '2022-02-27 08:09:01', '2022-02-27 08:09:01'),
(3191, 10, 1693, '710', 'Boddhovumi', 'Active', '2022-02-27 08:09:17', '2022-02-27 08:09:17'),
(3192, 10, 1694, '710', 'Mirpur - 6', 'Active', '2022-02-27 08:09:31', '2022-02-27 08:09:31'),
(3193, 10, 1695, '710', 'Mirpur - 7', 'Active', '2022-02-27 08:09:45', '2022-02-27 08:09:45'),
(3194, 10, 1696, '710', 'Mirpur - 11', 'Active', '2022-02-27 08:09:57', '2022-02-27 08:09:57'),
(3195, 10, 1697, '710', 'Mirpur - 11.5', 'Active', '2022-02-27 08:10:10', '2022-02-27 08:10:10'),
(3196, 10, 1698, '710', 'Mirpur - 12', 'Active', '2022-02-27 08:10:21', '2022-02-27 08:10:21'),
(3197, 10, 1699, '710', 'Mirpur - 13', 'Active', '2022-02-27 08:10:34', '2022-02-27 08:10:34'),
(3198, 10, 1700, '710', 'Mirpur - 15', 'Active', '2022-02-27 08:10:46', '2022-02-27 08:10:46'),
(3199, 10, 1092, '748', 'Hatibandha (Lalmonirhat)', 'Active', '2022-02-27 08:12:04', '2022-02-27 08:12:04'),
(3200, 10, 1093, '748', 'Kaliganj(Lalmonirhat)', 'Active', '2022-02-27 08:12:34', '2022-02-27 08:12:34'),
(3201, 10, 1094, '748', '1094 Lalmonirhat Sadar', 'Active', '2022-02-27 08:13:03', '2022-02-27 08:13:03'),
(3202, 10, 1095, '748', 'Patgram', 'Active', '2022-02-27 08:13:30', '2022-02-27 08:13:30'),
(3203, 10, 1096, '749', 'Dimla', 'Active', '2022-02-27 08:14:01', '2022-02-27 08:14:01'),
(3204, 10, 1097, '749', 'Domar', 'Active', '2022-02-27 08:14:31', '2022-02-27 08:14:31'),
(3205, 10, 1098, '749', 'Jaldhaka', 'Active', '2022-02-27 08:14:53', '2022-02-27 08:14:53'),
(3206, 10, 1099, '749', 'Kishoreganj ( Nilphamari)', 'Active', '2022-02-27 08:15:21', '2022-02-27 08:15:21'),
(3207, 10, 1100, '749', 'Nilphamari Sadar', 'Active', '2022-02-27 08:15:46', '2022-02-27 08:15:46'),
(3208, 10, 1101, '749', 'Saidpur', 'Active', '2022-02-27 08:16:13', '2022-02-27 08:16:13'),
(3209, 10, 1102, '693', 'Atwari (Panchagarh)', 'Active', '2022-02-27 08:16:37', '2022-02-27 08:16:37'),
(3210, 10, 1103, '750', 'Boda', 'Active', '2022-02-27 08:17:07', '2022-02-27 08:17:07'),
(3211, 10, 1104, '750', 'Debiganj', 'Active', '2022-02-27 08:17:28', '2022-02-27 08:17:28'),
(3212, 10, 1105, '750', 'Panchagarh Sadar', 'Active', '2022-02-27 08:17:52', '2022-02-27 08:17:52'),
(3213, 10, 1106, '750', 'Tetulia', 'Active', '2022-02-27 08:18:16', '2022-02-27 08:18:16'),
(3214, 10, 1107, '751', 'Badarganj', 'Active', '2022-02-27 08:18:57', '2022-02-27 08:18:57'),
(3215, 10, 1108, '751', 'Gangachara', 'Active', '2022-02-27 08:19:41', '2022-02-27 08:19:41'),
(3216, 10, 1109, '751', 'Kaunia (Rangpur)', 'Active', '2022-02-27 08:20:15', '2022-02-27 08:20:15'),
(3217, 10, 1110, '751', '1110 Mithapukur', 'Active', '2022-02-27 08:21:00', '2022-02-27 08:21:00'),
(3218, 10, 1110, '751', 'Mithapukur', 'Active', '2022-02-27 08:21:59', '2022-02-27 08:21:59'),
(3219, 10, 1111, '751', 'Pirgacha', 'Active', '2022-02-27 08:22:24', '2022-02-27 08:22:24'),
(3220, 10, 1112, '751', 'Pirganj(Rangpur)', 'Active', '2022-02-27 08:22:50', '2022-02-27 08:22:50'),
(3221, 10, 1113, '751', 'Rangpur Sadar', 'Active', '2022-02-27 08:23:21', '2022-02-27 08:23:21'),
(3222, 10, 1114, '751', 'Taraganj', 'Active', '2022-02-27 08:24:00', '2022-02-27 08:24:00'),
(3223, 10, 1115, '752', 'Baliadangi', 'Active', '2022-02-27 08:24:27', '2022-02-27 08:24:27'),
(3224, 10, 1116, '752', 'Haripur', 'Active', '2022-02-27 08:25:01', '2022-02-27 08:25:01'),
(3225, 10, 1117, '752', 'Pirganj(Thakurgaon)', 'Active', '2022-02-27 08:25:25', '2022-02-27 08:25:25'),
(3226, 10, 1118, '752', 'Ranishankail', 'Active', '2022-02-27 08:25:53', '2022-02-27 08:25:53'),
(3227, 10, 1119, '752', 'Thakurgaon Sadar', 'Active', '2022-02-27 08:26:14', '2022-02-27 08:26:14'),
(3228, 10, 1120, '727', 'Khulna Sadar', 'Active', '2022-02-27 08:26:43', '2022-02-27 08:26:43'),
(3229, 10, 1121, '743', 'Rajshahi Shadar', 'Active', '2022-02-27 08:28:13', '2022-02-27 08:28:13'),
(3230, 10, 1122, '702', 'Chittagong Sadar', 'Active', '2022-02-27 08:28:40', '2022-02-27 08:28:40'),
(3231, 10, 1123, '718', 'Siddhirganj', 'Active', '2022-02-27 08:29:18', '2022-02-27 08:29:18'),
(3232, 10, 1124, '718', 'Fatullah', 'Active', '2022-02-27 08:33:12', '2022-02-27 08:33:12'),
(3233, 10, 1125, '710', 'Kalatia', 'Active', '2022-02-27 08:33:41', '2022-02-27 08:33:41'),
(3234, 10, 1126, '741', 'Chapai Nawabganj Sadar', 'Active', '2022-02-27 08:34:18', '2022-02-27 08:34:18'),
(3235, 10, 1127, '710', 'Baipayl', 'Active', '2022-02-27 08:34:40', '2022-02-27 08:34:40'),
(3236, 10, 1128, '710', 'Manda(Dhaka)', 'Active', '2022-02-27 08:35:01', '2022-02-27 08:35:01'),
(3237, 10, 1129, '725', 'Benapole', 'Active', '2022-02-27 08:35:28', '2022-02-27 08:35:28'),
(3238, 10, 1130, '699', 'soho area', 'Active', '2022-02-27 08:37:34', '2022-02-27 08:37:34'),
(3239, 10, 1131, '710', 'Birulia', 'Active', '2022-02-27 08:38:08', '2022-02-27 08:38:08'),
(3240, 10, 1132, '710', 'Shahjahanpur (Dhaka)', 'Active', '2022-02-27 08:38:39', '2022-02-27 08:38:39'),
(3241, 10, 1133, '718', 'Shanarpar (Narayanganj)', 'Active', '2022-02-27 08:41:14', '2022-02-27 08:41:14'),
(3242, 10, 1134, '752', 'Shibganj (Thakurgaon Sadar)', 'Active', '2022-02-27 08:43:55', '2022-02-27 08:43:55'),
(3243, 10, 1135, '702', 'Bondor (Chittagong)', 'Active', '2022-02-27 08:44:51', '2022-02-27 08:44:51'),
(3244, 10, 1136, '702', 'Barahatia', 'Active', '2022-02-27 08:45:16', '2022-02-27 08:45:16'),
(3245, 10, 1137, '710', 'Haterrjheel', 'Active', '2022-02-27 08:46:08', '2022-02-27 08:46:08'),
(3246, 10, 1701, '710', 'Mirpur - 14', 'Active', '2022-02-27 08:52:51', '2022-02-27 08:52:51'),
(3247, 10, 1702, '754', 'Sarkar Bazar (Moulvibazar)', 'Active', '2022-02-27 08:53:17', '2022-02-27 08:53:17'),
(3248, 10, 1703, '754', 'Notun Bridge (Moulvibazar)', 'Active', '2022-02-27 08:53:42', '2022-02-27 08:53:42'),
(3249, 10, 1138, '702', 'Karnaphuli', 'Active', '2022-02-27 08:53:50', '2022-02-27 08:53:50'),
(3250, 10, 1704, '754', 'Tarapasha Bazar - Rajnagar', 'Active', '2022-02-27 08:54:02', '2022-02-27 08:54:02'),
(3251, 10, 1705, '754', 'Munshibazar - Kamalganj', 'Active', '2022-02-27 08:54:21', '2022-02-27 08:54:21'),
(3252, 10, 1139, '710', 'Dhaka uddan', 'Active', '2022-02-27 08:54:30', '2022-02-27 08:54:30'),
(3253, 10, 1706, '754', 'Munshibazar - Rajnagar', 'Active', '2022-02-27 08:54:38', '2022-02-27 08:54:38'),
(3254, 10, 1707, '754', 'Tengra Bazar - Rajnagar', 'Active', '2022-02-27 08:54:56', '2022-02-27 08:54:56'),
(3255, 10, 1140, '710', 'Nobodoy', 'Active', '2022-02-27 08:54:58', '2022-02-27 08:54:58'),
(3256, 10, 1708, '754', 'Mukam Bazar - Radar Unit (Moulvibazar)', 'Active', '2022-02-27 08:55:14', '2022-02-27 08:55:14'),
(3257, 10, 1141, '710', 'Chad Uddan', 'Active', '2022-02-27 08:55:27', '2022-02-27 08:55:27'),
(3258, 10, 1709, '754', 'Brahman Bazar - Kulaura', 'Active', '2022-02-27 08:55:41', '2022-02-27 08:55:41'),
(3259, 10, 1142, '710', 'Mohammadia Housing', 'Active', '2022-02-27 08:55:51', '2022-02-27 08:55:51'),
(3260, 10, 1710, '754', 'Patanushar - Shamshernagar', 'Active', '2022-02-27 08:56:01', '2022-02-27 08:56:01'),
(3261, 10, 1711, '754', 'Konokpur (Moulvibazar)', 'Active', '2022-02-27 08:56:16', '2022-02-27 08:56:16'),
(3262, 10, 1143, '710', 'Ring Road', 'Active', '2022-02-27 08:56:21', '2022-02-27 08:56:21'),
(3263, 10, 1712, '754', 'Adompur Bazar - Kamalganj', 'Active', '2022-02-27 08:56:30', '2022-02-27 08:56:30'),
(3264, 10, 1144, '710', 'Tajmahal Road', 'Active', '2022-02-27 08:56:48', '2022-02-27 08:56:48'),
(3265, 10, 1713, '754', 'Tilagao - Kulaura', 'Active', '2022-02-27 08:56:49', '2022-02-27 08:56:49'),
(3266, 10, 1714, '754', 'Bhatera - Kulaura', 'Active', '2022-02-27 08:57:09', '2022-02-27 08:57:09'),
(3267, 10, 1145, '710', 'Nurjahan Road', 'Active', '2022-02-27 08:57:19', '2022-02-27 08:57:19'),
(3268, 10, 1146, '710', 'Rajia Sultana Road', 'Active', '2022-02-27 08:57:55', '2022-02-27 08:57:55'),
(3269, 10, 1715, '754', 'Kazir Bazar (Moulvibazar)', 'Active', '2022-02-27 08:57:57', '2022-02-27 08:57:57'),
(3271, 10, 1147, '710', 'Uttara Sector-4', 'Active', '2022-02-27 08:58:26', '2022-02-27 08:58:26'),
(3274, 10, 1148, '710', 'Goaltek', 'Active', '2022-02-27 08:59:35', '2022-02-27 08:59:35'),
(3275, 10, 1149, '710', 'Chalabon', 'Active', '2022-02-27 08:59:56', '2022-02-27 08:59:56'),
(3277, 10, 1150, '710', 'Mollapara', 'Active', '2022-02-27 09:00:13', '2022-02-27 09:00:13'),
(3279, 10, 1151, '710', 'Azampur (East) (Dakshinkhan)', 'Active', '2022-02-27 09:00:34', '2022-02-27 09:00:34'),
(3281, 10, 1152, '710', 'Uttara Sector 5', 'Active', '2022-02-27 09:00:53', '2022-02-27 09:00:53'),
(3282, 10, 1153, '710', 'Uttara Sector 14', 'Active', '2022-02-27 09:01:15', '2022-02-27 09:01:15'),
(3283, 10, 1154, '710', 'Uttara Sector 3', 'Active', '2022-02-27 09:01:35', '2022-02-27 09:01:35'),
(3284, 10, 1716, '717', 'Kacari (Munshiganj)', 'Active', '2022-02-27 09:01:58', '2022-02-27 09:01:58'),
(3285, 10, 1155, '710', '1155 Uttara Sector 7', 'Active', '2022-02-27 09:02:00', '2022-02-27 09:02:00'),
(3286, 10, 1717, '717', 'Super Market Mor (Munshiganj)', 'Active', '2022-02-27 09:02:17', '2022-02-27 09:02:17'),
(3287, 10, 1156, '710', 'Uttara Sector 9', 'Active', '2022-02-27 09:02:18', '2022-02-27 09:02:18'),
(3288, 10, 1157, '710', '1157 Uttara Sector 11', 'Active', '2022-02-27 09:02:38', '2022-02-27 09:02:38'),
(3289, 10, 1718, '717', 'Munshir Hat (Munshiganj)', 'Active', '2022-02-27 09:02:41', '2022-02-27 09:02:41'),
(3290, 10, 1719, '717', 'Mirkadim (Munshiganj)', 'Active', '2022-02-27 09:02:54', '2022-02-27 09:02:54'),
(3291, 10, 1158, '710', 'Nalbhog', 'Active', '2022-02-27 09:02:57', '2022-02-27 09:02:57'),
(3292, 10, 1720, '717', 'Rikabibazar (Munshiganj)', 'Active', '2022-02-27 09:03:06', '2022-02-27 09:03:06'),
(3293, 10, 1721, '717', 'Sipahipara (Munshiganj)', 'Active', '2022-02-27 09:03:19', '2022-02-27 09:03:19'),
(3294, 10, 1159, '710', 'Azampur (West) (Uttara)', 'Active', '2022-02-27 09:03:27', '2022-02-27 09:03:27'),
(3295, 10, 1722, '717', 'Muktarpur (Munshiganj)', 'Active', '2022-02-27 09:03:32', '2022-02-27 09:03:32'),
(3296, 10, 1160, '710', 'Phulbaria', 'Active', '2022-02-27 09:03:51', '2022-02-27 09:03:51'),
(3297, 10, 1723, '710', 'Basher pull (Demra)', 'Active', '2022-02-27 09:03:56', '2022-02-27 09:03:56'),
(3298, 10, 1161, '710', 'Dhour', 'Active', '2022-02-27 09:04:08', '2022-02-27 09:04:08'),
(3299, 10, 1724, '710', 'Bamuail (Demra)', 'Active', '2022-02-27 09:04:12', '2022-02-27 09:04:12'),
(3300, 10, 1725, '710', 'Sharuliya (Demra)', 'Active', '2022-02-27 09:04:24', '2022-02-27 09:04:24'),
(3301, 10, 1726, '710', 'Rani mohol (Demra)', 'Active', '2022-02-27 09:04:37', '2022-02-27 09:04:37'),
(3302, 10, 1162, '710', 'Bhatuliya', 'Active', '2022-02-27 09:04:41', '2022-02-27 09:04:41'),
(3303, 10, 1727, '710', 'Staffquater (Demra)', 'Active', '2022-02-27 09:04:57', '2022-02-27 09:04:57'),
(3304, 10, 1163, '710', 'Bamnartek', 'Active', '2022-02-27 09:05:08', '2022-02-27 09:05:08'),
(3305, 10, 1728, '710', 'Demra bazar (Demra)', 'Active', '2022-02-27 09:05:09', '2022-02-27 09:05:09'),
(3306, 10, 1729, '710', 'Hajinogar (Demra)', 'Active', '2022-02-27 09:05:30', '2022-02-27 09:05:30'),
(3307, 10, 1730, '710', 'Boxnagar (Demra)', 'Active', '2022-02-27 09:05:42', '2022-02-27 09:05:42'),
(3308, 10, 1731, '710', 'Badsha mia road (Demra)', 'Active', '2022-02-27 09:05:53', '2022-02-27 09:05:53'),
(3309, 10, 1732, '710', 'Muslimnagar (Demra)', 'Active', '2022-02-27 09:06:07', '2022-02-27 09:06:07'),
(3310, 10, 1164, '710', 'Turag', 'Active', '2022-02-27 09:06:13', '2022-02-27 09:06:13'),
(3311, 10, 1733, '710', 'Nikunja 2', 'Active', '2022-02-27 09:06:21', '2022-02-27 09:06:21'),
(3312, 10, 1734, '712', 'Vannara (Gazipur)', 'Active', '2022-02-27 09:06:35', '2022-02-27 09:06:35'),
(3313, 10, 1165, '710', 'Kallanpur', 'Active', '2022-02-27 09:06:36', '2022-02-27 09:06:36'),
(3314, 10, 1735, '712', 'Sardarganj (Gazipur)', 'Active', '2022-02-27 09:06:49', '2022-02-27 09:06:49'),
(3315, 10, 1166, '710', 'Amin Bazar', 'Active', '2022-02-27 09:07:05', '2022-02-27 09:07:05'),
(3316, 10, 1736, '712', 'Sultan Market (Gazipur)', 'Active', '2022-02-27 09:07:41', '2022-02-27 09:07:41'),
(3317, 10, 1737, '710', 'Baroipara (Gazipur)', 'Active', '2022-02-27 09:07:55', '2022-02-27 09:07:55'),
(3318, 10, 1167, '710', '1167 Lalkuthi', 'Active', '2022-02-27 09:07:58', '2022-02-27 09:07:58'),
(3319, 10, 1738, '712', 'Goailbari bazar (Gazipur)', 'Active', '2022-02-27 09:08:08', '2022-02-27 09:08:08'),
(3321, 10, 1168, '710', 'Mirpur 1', 'Active', '2022-02-27 09:08:26', '2022-02-27 09:08:26'),
(3323, 10, 1169, '710', 'Tolarbag', 'Active', '2022-02-27 09:08:58', '2022-02-27 09:08:58'),
(3325, 10, 1170, '710', 'Ahmed Nagar', 'Active', '2022-02-27 09:09:17', '2022-02-27 09:09:17'),
(3326, 10, 1742, '712', 'Fulbaria bazar (Gazipur)', 'Active', '2022-02-27 09:09:20', '2022-02-27 09:09:20'),
(3327, 10, 1171, '710', 'Paikpara', 'Active', '2022-02-27 09:09:44', '2022-02-27 09:09:44'),
(3328, 10, 1172, '710', 'Pirerbag', 'Active', '2022-02-27 09:10:21', '2022-02-27 09:10:21'),
(3329, 10, 1739, '712', 'Hatimara (Gazipur)', 'Active', '2022-02-27 09:10:47', '2022-02-27 09:10:47'),
(3330, 10, 1173, '710', 'Taltola (Mirpur)', 'Active', '2022-02-27 09:10:52', '2022-02-27 09:10:52'),
(3331, 10, 1740, '712', 'Sardagonj (Gazipur)', 'Active', '2022-02-27 09:11:00', '2022-02-27 09:11:00'),
(3332, 10, 1741, '712', 'Ambagh (Gazipur)', 'Active', '2022-02-27 09:11:18', '2022-02-27 09:11:18'),
(3333, 10, 1174, '710', 'MES Colony', 'Active', '2022-02-27 09:11:24', '2022-02-27 09:11:24'),
(3334, 10, 1175, '710', 'Zia Colony', 'Active', '2022-02-27 09:11:54', '2022-02-27 09:11:54'),
(3335, 10, 1176, '710', 'Ajiz Market', 'Active', '2022-02-27 09:12:41', '2022-02-27 09:12:41'),
(3336, 10, 1743, '712', 'Madhobpur (Gazipur)', 'Active', '2022-02-27 09:13:10', '2022-02-27 09:13:10'),
(3337, 10, 1178, '710', 'Aga Nagar', 'Active', '2022-02-27 09:13:38', '2022-02-27 09:13:38'),
(3338, 10, 1179, '710', 'Kathuria', 'Active', '2022-02-27 09:14:04', '2022-02-27 09:14:04'),
(3339, 10, 1744, '712', 'Kabirpur (Gazipur)', 'Active', '2022-02-27 09:14:12', '2022-02-27 09:14:12'),
(3340, 10, 1745, '712', 'Walton high-tech (Gazipur)', 'Active', '2022-02-27 09:14:24', '2022-02-27 09:14:24'),
(3341, 10, 1746, '712', 'Walton micro-tech (Gazipur)', 'Active', '2022-02-27 09:14:38', '2022-02-27 09:14:38'),
(3342, 10, 1747, '712', 'Mollapara (Gazipur)', 'Active', '2022-02-27 09:14:51', '2022-02-27 09:14:51'),
(3343, 10, 1180, '710', 'Goljarbag', 'Active', '2022-02-27 09:14:52', '2022-02-27 09:14:52'),
(3344, 10, 1748, '712', 'Jalsukha (Gazipur)', 'Active', '2022-02-27 09:15:04', '2022-02-27 09:15:04'),
(3345, 10, 1749, '712', 'Gosatra (Gazipur)', 'Active', '2022-02-27 09:15:31', '2022-02-27 09:15:31'),
(3346, 10, 1750, '712', 'Companyganj (Comilla)', 'Active', '2022-02-27 09:16:29', '2022-02-27 09:16:29'),
(3349, 10, 1181, '710', 'Nazirabag', 'Active', '2022-02-27 09:17:49', '2022-02-27 09:17:49'),
(3350, 10, 1753, '754', 'Kajaldhara (Kulaura)', 'Active', '2022-02-27 09:18:03', '2022-02-27 09:18:03'),
(3351, 10, 1754, '754', 'Kotarkuna (Kulaura)', 'Active', '2022-02-27 09:18:21', '2022-02-27 09:18:21'),
(3352, 10, 1751, '754', 'Langla (Kulaura)', 'Active', '2022-02-27 09:19:11', '2022-02-27 09:19:11'),
(3353, 10, 1752, '754', 'Prithimpasha (Kulaura)', 'Active', '2022-02-27 09:19:26', '2022-02-27 09:19:26'),
(3354, 10, 1182, '710', 'Kaliganj - Keraniganj', 'Active', '2022-02-27 09:19:42', '2022-02-27 09:19:42'),
(3355, 10, 1183, '710', 'Nazarganj', 'Active', '2022-02-27 09:22:13', '2022-02-27 09:22:13'),
(3356, 10, 1184, '710', 'Zinzira', 'Active', '2022-02-27 09:22:54', '2022-02-27 09:22:54'),
(3357, 10, 1185, '710', 'Kunipara', 'Active', '2022-02-27 09:23:19', '2022-02-27 09:23:19'),
(3358, 10, 1186, '710', 'Babli Masjid', 'Active', '2022-02-27 09:23:40', '2022-02-27 09:23:40'),
(3359, 10, 1187, '710', 'Kaderabad Housing', 'Active', '2022-02-27 09:23:56', '2022-02-27 09:23:56'),
(3360, 10, 1188, '710', 'Kunia', 'Active', '2022-02-27 09:24:18', '2022-02-27 09:24:18'),
(3361, 10, 1189, '710', 'Gacha', 'Active', '2022-02-27 09:24:43', '2022-02-27 09:24:43'),
(3362, 10, 1190, '710', 'Boro Bari', 'Active', '2022-02-27 09:25:13', '2022-02-27 09:25:13'),
(3363, 10, 1191, '710', 'Board Bazar', 'Active', '2022-02-27 09:26:01', '2022-02-27 09:26:01'),
(3364, 10, 1192, '710', '1192 Kamarjuri', 'Active', '2022-02-27 09:26:18', '2022-02-27 09:26:18'),
(3365, 10, 1253, '710', 'Doyagonj', 'Active', '2022-02-27 09:26:28', '2022-02-27 09:26:28'),
(3366, 10, 1193, '710', 'Dattapara', 'Active', '2022-02-27 09:26:38', '2022-02-27 09:26:38'),
(3367, 10, 1254, '710', 'Farashgong', 'Active', '2022-02-27 09:26:40', '2022-02-27 09:26:40'),
(3368, 10, 1255, '710', 'Dholpur', 'Active', '2022-02-27 09:26:51', '2022-02-27 09:26:51'),
(3369, 10, 1194, '710', 'Auchpara', 'Active', '2022-02-27 09:26:55', '2022-02-27 09:26:55'),
(3370, 10, 1256, '710', 'Kodomtoli(Keraniganj)', 'Active', '2022-02-27 09:27:03', '2022-02-27 09:27:03'),
(3371, 10, 1257, '710', 'Kotwali (Puran Dhaka)', 'Active', '2022-02-27 09:27:17', '2022-02-27 09:27:17'),
(3372, 10, 1195, '710', 'Cherag Ali', 'Active', '2022-02-27 09:27:19', '2022-02-27 09:27:19'),
(3373, 10, 1258, '710', 'Railway Colony', 'Active', '2022-02-27 09:27:30', '2022-02-27 09:27:30'),
(3374, 10, 1196, '710', 'Tongi Bazar (Dhaka)', 'Active', '2022-02-27 09:27:42', '2022-02-27 09:27:42'),
(3375, 10, 1259, '710', 'Rajar Dewri', 'Active', '2022-02-27 09:27:42', '2022-02-27 09:27:42'),
(3376, 10, 1260, '710', 'Hasnabad', 'Active', '2022-02-27 09:28:23', '2022-02-27 09:28:23'),
(3377, 10, 1261, '710', 'Sat rowja', 'Active', '2022-02-27 09:28:37', '2022-02-27 09:28:37'),
(3378, 10, 1262, '710', 'Tantibazar', 'Active', '2022-02-27 09:28:48', '2022-02-27 09:28:48'),
(3379, 10, 1263, '710', 'Khairtail', 'Active', '2022-02-27 09:28:58', '2022-02-27 09:28:58'),
(3380, 10, 1197, '710', 'Ershadnagar', 'Active', '2022-02-27 09:29:06', '2022-02-27 09:29:06'),
(3381, 10, 1264, '710', 'Bonomala', 'Active', '2022-02-27 09:29:07', '2022-02-27 09:29:07'),
(3382, 10, 1265, '710', 'Morkun', 'Active', '2022-02-27 09:29:20', '2022-02-27 09:29:20'),
(3383, 10, 1198, '710', 'Sataish', 'Active', '2022-02-27 09:29:29', '2022-02-27 09:29:29'),
(3384, 10, 1266, '710', 'Bhadam', 'Active', '2022-02-27 09:29:31', '2022-02-27 09:29:31'),
(3385, 10, 1199, '710', 'Apollo', 'Active', '2022-02-27 09:29:52', '2022-02-27 09:29:52'),
(3386, 10, 1267, '710', 'Boro Dewra Dakkhin Para', 'Active', '2022-02-27 09:29:55', '2022-02-27 09:29:55'),
(3387, 10, 1268, '710', 'Rosulbagh(Mohakhali)', 'Active', '2022-02-27 09:30:11', '2022-02-27 09:30:11'),
(3388, 10, 1269, '712', 'Gopalpur', 'Active', '2022-02-27 09:30:21', '2022-02-27 09:30:21'),
(3389, 10, 1200, '710', 'Nurer Chala', 'Active', '2022-02-27 09:30:28', '2022-02-27 09:30:28'),
(3390, 10, 1270, '712', 'College Gate (Tongi)', 'Active', '2022-02-27 09:30:38', '2022-02-27 09:30:49'),
(3391, 10, 1201, '710', 'Bawaila Para', 'Active', '2022-02-27 09:30:58', '2022-02-27 09:30:58'),
(3392, 10, 1271, '710', 'Boardbazar', 'Active', '2022-02-27 09:31:02', '2022-02-27 09:31:02'),
(3393, 10, 1202, '710', 'Satarkul', 'Active', '2022-02-27 09:31:22', '2022-02-27 09:31:22'),
(3394, 10, 1272, '710', 'Gazipura', 'Active', '2022-02-27 09:31:26', '2022-02-27 09:31:26'),
(3395, 10, 1273, '710', 'Hossain Market (Tongi)', 'Active', '2022-02-27 09:31:41', '2022-02-27 09:31:41'),
(3396, 10, 1274, '710', 'Signboard (Gazipur)', 'Active', '2022-02-27 09:31:53', '2022-02-27 09:31:53'),
(3397, 10, 1206, '710', 'Khilbar Tek', 'Active', '2022-02-27 09:32:07', '2022-02-27 09:32:07'),
(3398, 10, 1275, '710', 'Joydebpur', 'Active', '2022-02-27 09:32:07', '2022-02-27 09:32:07'),
(3399, 10, 1276, '710', 'Dhirasrom', 'Active', '2022-02-27 09:32:18', '2022-02-27 09:32:18'),
(3400, 10, 1207, '710', 'Buddho Mondir', 'Active', '2022-02-27 09:32:25', '2022-02-27 09:32:25'),
(3401, 10, 1277, '710', 'Dattapara Road', 'Active', '2022-02-27 09:32:32', '2022-02-27 09:32:32'),
(3402, 10, 1208, '710', 'Sipahibag', 'Active', '2022-02-27 09:32:41', '2022-02-27 09:32:41'),
(3403, 10, 1209, '710', 'TT Para', 'Active', '2022-02-27 09:33:00', '2022-02-27 09:33:00'),
(3404, 10, 1278, '710', 'Badekomelosshor', 'Active', '2022-02-27 09:33:16', '2022-02-27 09:33:16'),
(3405, 10, 1210, '710', 'Eastern Housing (Adabor)', 'Active', '2022-02-27 09:33:20', '2022-02-27 09:33:20'),
(3406, 10, 1279, '710', 'Borobari', 'Active', '2022-02-27 09:33:25', '2022-02-27 09:33:25'),
(3407, 10, 1280, '710', 'Choidana', 'Active', '2022-02-27 09:33:35', '2022-02-27 09:33:35'),
(3408, 10, 1281, '710', 'Deger Chala', 'Active', '2022-02-27 09:33:47', '2022-02-27 09:33:47'),
(3409, 10, 1211, '710', 'Teskunipara', 'Active', '2022-02-27 09:33:48', '2022-02-27 09:33:48'),
(3410, 10, 1282, '710', 'Gazcha', 'Active', '2022-02-27 09:33:56', '2022-02-27 09:33:56'),
(3411, 10, 1283, '710', 'Hariken', 'Active', '2022-02-27 09:34:05', '2022-02-27 09:34:05'),
(3412, 10, 1212, '710', 'DHAKA TENARI MORE', 'Active', '2022-02-27 09:34:14', '2022-02-27 09:34:14'),
(3413, 10, 1284, '710', 'Khartail', 'Active', '2022-02-27 09:34:58', '2022-02-27 09:34:58'),
(3414, 10, 1285, '710', 'Majukhan', 'Active', '2022-02-27 09:35:09', '2022-02-27 09:35:09'),
(3415, 10, 1213, '710', 'Shahidnagar', 'Active', '2022-02-27 09:35:11', '2022-02-27 09:35:11'),
(3416, 10, 1286, '710', 'Milgate', 'Active', '2022-02-27 09:35:27', '2022-02-27 09:35:27'),
(3417, 10, 1287, '710', 'National University', 'Active', '2022-02-27 09:35:54', '2022-02-27 09:35:54'),
(3418, 10, 1214, '710', 'Jhigatola', 'Active', '2022-02-27 09:36:31', '2022-02-27 09:36:31'),
(3419, 10, 1215, '710', 'Polashi', 'Active', '2022-02-27 09:37:06', '2022-02-27 09:37:06'),
(3420, 10, 1288, '710', 'Surtaranga', 'Active', '2022-02-27 09:39:00', '2022-02-27 09:39:07'),
(3421, 10, 1216, '710', 'Satmoshjid Road', 'Active', '2022-02-27 09:39:58', '2022-02-27 09:39:58'),
(3422, 10, 1289, '710', 'Targach', 'Active', '2022-02-27 09:40:14', '2022-02-27 09:40:14'),
(3423, 10, 1217, '710', 'Shukrabad', 'Active', '2022-02-27 09:40:40', '2022-02-27 09:40:40'),
(3424, 10, 1290, '710', 'Rail Station', 'Active', '2022-02-27 09:40:50', '2022-02-27 09:40:50'),
(3425, 10, 1291, '710', 'Boro Dewra', 'Active', '2022-02-27 09:41:03', '2022-02-27 09:41:29'),
(3426, 10, 1218, '710', 'BNP Bazar', 'Active', '2022-02-27 09:41:23', '2022-02-27 09:41:23'),
(3427, 10, 1219, '710', 'Kalachandpur', 'Active', '2022-02-27 09:41:47', '2022-02-27 09:41:47'),
(3428, 10, 1220, '710', 'Jogonnathpur', 'Active', '2022-02-27 09:42:11', '2022-02-27 09:42:11'),
(3429, 10, 1292, '710', 'Uttarkhan Mazar', 'Active', '2022-02-27 09:42:18', '2022-02-27 09:42:18'),
(3430, 10, 1221, '710', 'Kuratuli', 'Active', '2022-02-27 09:42:30', '2022-02-27 09:42:30'),
(3431, 10, 1293, '710', 'Dakshinkhan Bazar', 'Active', '2022-02-27 09:42:34', '2022-02-27 09:43:08'),
(3432, 10, 1222, '710', 'Alatunnessa School Road', 'Active', '2022-02-27 09:43:01', '2022-02-27 09:43:01'),
(3433, 10, 1223, '710', 'Purbo Rampura', 'Active', '2022-02-27 09:43:33', '2022-02-27 09:43:33'),
(3434, 10, 1294, '710', 'Hajipara-Dakshinkhan', 'Active', '2022-02-27 09:44:08', '2022-02-27 09:44:08'),
(3435, 10, 1224, '710', 'Bou Bazar - Mohakhali, Dhaka', 'Active', '2022-02-27 09:44:08', '2022-02-27 09:44:08'),
(3436, 10, 1295, '710', 'Ranavola', 'Active', '2022-02-27 09:44:18', '2022-02-27 09:44:18'),
(3437, 10, 1225, '710', 'Chairman Goli', 'Active', '2022-02-27 09:44:26', '2022-02-27 09:44:26'),
(3438, 10, 1296, '710', 'Joynal Market', 'Active', '2022-02-27 09:44:33', '2022-02-27 09:44:33'),
(3439, 10, 1297, '710', 'Johura Market', 'Active', '2022-02-27 09:44:47', '2022-02-27 09:44:47'),
(3440, 10, 1226, '710', 'Confidence Tower, Jhilpar', 'Active', '2022-02-27 09:44:48', '2022-02-27 09:44:48'),
(3441, 10, 1298, '710', 'Habib Market', 'Active', '2022-02-27 09:45:00', '2022-02-27 09:45:00'),
(3442, 10, 1299, '710', 'BDR Market-House Building', 'Active', '2022-02-27 09:45:10', '2022-02-27 09:45:10'),
(3443, 10, 1227, '710', 'Fuji Trade Center', 'Active', '2022-02-27 09:45:13', '2022-02-27 09:45:13'),
(3444, 10, 1228, '710', 'Khil Barirtek', 'Active', '2022-02-27 09:46:21', '2022-02-27 09:46:21'),
(3445, 10, 1229, '710', 'Korail', 'Active', '2022-02-27 09:50:26', '2022-02-27 09:50:26'),
(3446, 10, 1230, '710', '1230 Mahanogor', 'Active', '2022-02-27 09:50:55', '2022-02-27 09:50:55'),
(3447, 10, 1231, '710', 'Nimtola', 'Active', '2022-02-27 09:51:19', '2022-02-27 09:51:19'),
(3448, 10, 1232, '710', 'Nurerchala', 'Active', '2022-02-27 09:51:38', '2022-02-27 09:51:38'),
(3449, 10, 1233, '710', 'Pastola Bazar', 'Active', '2022-02-27 09:51:55', '2022-02-27 09:51:55'),
(3450, 10, 1234, '710', 'Poschim Badda', 'Active', '2022-02-27 09:52:15', '2022-02-27 09:52:15'),
(3451, 10, 1235, '710', 'Purbo Badda', 'Active', '2022-02-27 09:52:43', '2022-02-27 09:52:43'),
(3452, 10, 1236, '710', 'Sat-tola Bazar', 'Active', '2022-02-27 09:53:18', '2022-02-27 09:53:18'),
(3453, 10, 1237, '710', 'Shaheenbagh', 'Active', '2022-02-27 09:53:40', '2022-02-27 09:53:40'),
(3454, 10, 1238, '710', 'Subastu', 'Active', '2022-02-27 09:54:15', '2022-02-27 09:54:15'),
(3455, 10, 1239, '710', 'ICDDRB', 'Active', '2022-02-27 09:54:44', '2022-02-27 09:54:44'),
(3456, 10, 1240, '710', 'Satrasta', 'Active', '2022-02-27 09:55:05', '2022-02-27 09:55:05'),
(3457, 10, 1241, '710', 'Tekpara Adorsonagor', 'Active', '2022-02-27 09:55:29', '2022-02-27 09:55:29'),
(3458, 10, 1242, '710', 'Uttar Badda', 'Active', '2022-02-27 09:56:02', '2022-02-27 09:56:02'),
(3459, 10, 1243, '710', '1243 Wireless', 'Active', '2022-02-27 09:56:22', '2022-02-27 09:56:22'),
(3460, 10, 1244, '710', 'Solmaid', 'Active', '2022-02-27 09:56:53', '2022-02-27 09:56:53'),
(3461, 10, 1245, '710', '300 Feet', 'Active', '2022-02-27 09:57:17', '2022-02-27 09:57:17'),
(3462, 10, 1246, '710', 'Mirhazirbagh', 'Active', '2022-02-27 09:57:34', '2022-02-27 09:57:34'),
(3463, 10, 1247, '718', '1247 Bhuigarh-Narayangonj', 'Active', '2022-02-27 09:58:00', '2022-02-27 09:58:00'),
(3464, 10, 1247, '718', 'Bhuigarh-Narayangonj', 'Active', '2022-02-27 09:58:20', '2022-02-27 09:58:20'),
(3465, 10, 1248, '710', 'Mahut Tuli', 'Active', '2022-02-27 09:58:47', '2022-02-27 09:58:47'),
(3466, 10, 1249, '710', 'Alubazar', 'Active', '2022-02-27 09:59:08', '2022-02-27 09:59:08'),
(3467, 10, 1250, '710', 'Badam Toli', 'Active', '2022-02-27 09:59:26', '2022-02-27 09:59:26'),
(3468, 10, 1251, '710', 'Chamelibag', 'Active', '2022-02-27 10:00:00', '2022-02-27 10:00:00'),
(3469, 10, 1252, '710', 'Dholaikhal', 'Active', '2022-02-27 10:00:23', '2022-02-27 10:00:23'),
(3470, 10, 4641, '699', 'Lama', 'Active', '2022-05-11 11:49:43', '2022-05-11 11:49:43'),
(3471, 10, 3516, '703', 'Daudkandi', 'Active', '2022-05-11 11:50:17', '2022-05-11 11:50:17'),
(3472, 10, 5400, '751', 'Rangpur Sadar', 'Active', '2022-05-11 11:50:43', '2022-05-11 11:50:43'),
(3474, 10, 4641, '699', 'Lama', 'Active', '2022-06-13 03:50:18', '2022-06-28 06:48:51'),
(3476, 10, 3930, '705', 'Sonagazi', 'Active', '2022-06-28 06:41:44', '2022-06-28 06:44:27'),
(3477, 10, 3516, '703', 'Daudkandi', 'Active', '2022-06-28 06:44:08', '2022-08-03 00:08:03');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addbanners`
--
ALTER TABLE `addbanners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attrvalues`
--
ALTER TABLE `attrvalues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attrvalues_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `basicinfos`
--
ALTER TABLE `basicinfos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complanenotes`
--
ALTER TABLE `complanenotes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `couriers`
--
ALTER TABLE `couriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `information_key_unique` (`key`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orderproducts`
--
ALTER TABLE `orderproducts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `paymentcompletes`
--
ALTER TABLE `paymentcompletes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `paymenticons`
--
ALTER TABLE `paymenticons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_payment_type_id_foreign` (`payment_type_id`);

--
-- Indexes for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `policymenus`
--
ALTER TABLE `policymenus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_subcategory_id_foreign` (`subcategory_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `servicepackages`
--
ALTER TABLE `servicepackages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sliders_slug_unique` (`slug`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subcategories_slug_unique` (`slug`),
  ADD KEY `subcategories_category_id_foreign` (`category_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weights_attrvalue_id_foreign` (`attrvalue_id`),
  ADD KEY `weights_product_id_foreign` (`product_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addbanners`
--
ALTER TABLE `addbanners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `attrvalues`
--
ALTER TABLE `attrvalues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `basicinfos`
--
ALTER TABLE `basicinfos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=767;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `complains`
--
ALTER TABLE `complains`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complanenotes`
--
ALTER TABLE `complanenotes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `couriers`
--
ALTER TABLE `couriers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `information`
--
ALTER TABLE `information`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `orderproducts`
--
ALTER TABLE `orderproducts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `paymentcompletes`
--
ALTER TABLE `paymentcompletes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `paymenticons`
--
ALTER TABLE `paymenticons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paymenttypes`
--
ALTER TABLE `paymenttypes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `policymenus`
--
ALTER TABLE `policymenus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `servicepackages`
--
ALTER TABLE `servicepackages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `weights`
--
ALTER TABLE `weights`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3478;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attrvalues`
--
ALTER TABLE `attrvalues`
  ADD CONSTRAINT `attrvalues_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_payment_type_id_foreign` FOREIGN KEY (`payment_type_id`) REFERENCES `paymenttypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `subcategories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `weights`
--
ALTER TABLE `weights`
  ADD CONSTRAINT `weights_attrvalue_id_foreign` FOREIGN KEY (`attrvalue_id`) REFERENCES `attrvalues` (`id`),
  ADD CONSTRAINT `weights_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
