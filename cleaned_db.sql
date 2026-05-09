-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2025 at 04:21 PM
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
-- Database: `profelar_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `balance` double(20,2) NOT NULL DEFAULT 0.00,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `salary_date` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `balance`, `name`, `photo`, `email`, `email_verified_at`, `password`, `type`, `phone`, `salary_date`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 64209.38, 'profelar', '/public/admin/assets/images/profile/1762811895FP1.jpg', 'admin@gmail.com', '2022-08-30 07:44:48', '$2y$10$oLRpzZbnfm0H5MgdUzvJN.OtJln4bmAaTH4g8SuvGUlr91rRLjUse', 'admin', '43345', '2024-01-17', 'Barishal, Bangladesh', 'znEmC4wjQylB5ysQRmbTH3GXTesTobEVrIrBo4UOlcDe7HRZ0tjqEprY8Wjq', '2021-12-26 07:37:05', '2025-11-10 23:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `admin_ledgers`
--

CREATE TABLE `admin_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `perticulation` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `debit` double NOT NULL DEFAULT 0,
  `credit` double NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected','default') NOT NULL DEFAULT 'default',
  `date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_ledgers`
--

INSERT INTO `admin_ledgers` (`id`, `admin_id`, `reason`, `perticulation`, `amount`, `debit`, `credit`, `status`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 'payment_charge', 'Withdraw approval charge', 100, 15, 0, 'approved', '10-11-2025 05:40', '2025-11-09 23:40:58', '2025-11-09 23:40:58');

-- --------------------------------------------------------

--
-- Table structure for table `bank_lists`
--

CREATE TABLE `bank_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `bank_code` varchar(255) NOT NULL,
  `gtr_bank_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_lists`
--

INSERT INTO `bank_lists` (`id`, `country`, `bank_code`, `gtr_bank_code`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PH', 'GCASH', 'GCASH', 'BANK PAY', 1, '2024-08-20 07:35:27', '2024-08-20 07:35:27'),
(4, 'NG', 'PHPPAYMAYA', 'PMP', 'CRYPTO', 1, '2024-08-20 07:35:27', '2024-08-20 07:35:27');

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bonus_name` varchar(255) NOT NULL,
  `counter` int(11) DEFAULT 0 COMMENT 'user get service count',
  `set_service_counter` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`id`, `bonus_name`, `counter`, `set_service_counter`, `code`, `amount`, `status`, `created_at`, `updated_at`) VALUES
(21, 'Promo code', 30, 30, '638594', 4, 'inactive', '2024-03-06 12:55:10', '2025-05-20 17:38:30'),
(22, 'Mbtech', 6, 10, 'Mb8881', 1500, 'active', '2025-05-20 17:11:20', '2025-11-09 23:24:35'),
(23, 'Mbtech', 1, 1, 'Mb8882', 5000, 'inactive', '2025-05-20 17:36:24', '2025-05-20 17:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `bonus_ledgers`
--

CREATE TABLE `bonus_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `bonus_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `bonus_code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `checkins`
--

CREATE TABLE `checkins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` varchar(255) NOT NULL,
  `amount` double(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `off` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=valid,1=used,2=expired',
  `expire_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `method_name` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `oid` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL COMMENT 'User Deposit Amount',
  `final_amount` double(20,2) NOT NULL DEFAULT 0.00,
  `pay_link` text DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  `date` varchar(255) NOT NULL,
  `status` enum('pending','rejected','approved') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_03_16_074227_create_admins_table', 1),
(6, '2023_03_17_123007_create_packages_table', 2),
(8, '2023_03_27_103153_create_payment_methods_table', 3),
(10, '2023_03_28_074201_create_deposits_table', 4),
(11, '2023_03_28_142734_create_user_ledgers_table', 5),
(12, '2023_03_28_142802_create_admin_ledgers_table', 6),
(13, '2023_03_30_071745_create_vip_sliders_table', 7),
(14, '2023_03_30_150139_create_settings_table', 8),
(15, '2023_04_01_185541_create_bonuses_table', 9),
(16, '2023_04_01_205009_create_bonus_ledgers_table', 10),
(17, '2023_04_05_203304_create_purchases_table', 11),
(18, '2023_04_09_200835_create_minings_table', 12),
(19, '2023_06_17_105403_create_usdts_table', 13),
(20, '2023_12_23_120509_create_recharges_table', 14);

-- --------------------------------------------------------

--
-- Table structure for table `official_posts`
--

CREATE TABLE `official_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `official_posts`
--

INSERT INTO `official_posts` (`id`, `title`, `content`, `images`, `link`, `likes`, `created_at`, `updated_at`) VALUES
(1, '🎉🎉 Congratulations to my team members Siza and Lungi for leading their team in successfully organizing the Bean Drivin charity event in Durban. 🎊', '🎉🎉 Congratulations to my team members Siza and Lungi for leading their team in successfully organizing the Bean Drivin charity event in Durban. 🎊💃🏻 Their team, on behalf of Bean Drivin, supported and delivered supplies to many impoverished families in the area. The villagers expressed their deep gratitude and appreciation for Bean Drivin\'s kind act. Improving the environment in more communities is the future of our country. 🥰 Helping them is like sowing a seed of love for our country🇿🇦🇿🇦. 💪🏻I hope more team members will become protectors of South Africa, leading it to greater prosperity and spreading the love of Bean Drivin. ❤️📌The best way to build a team is through face-to-face communication. ✅❤️Share Bean Drivin, let\'s spread love, and let those around you join this loving family. ❤️', '[\"https:\\/\\/files.beancloud.live\\/20250815\\/ec628a56c677cb2c11b213f78b6c8b52.png\",\"https:\\/\\/files.beancloud.live\\/20250815\\/7f89db83f1e8ee26cb2e63506fb817dc.png\"]', 'https://nano-dev.shop/official', 293, '2025-09-05 20:38:29', '2025-09-05 20:38:29'),
(3, 'Congratulations to Zakithi and Lihle for hosting a fantastic offline meeting! 🎉✨', 'Congratulations to Zakithi and Lihle for hosting a fantastic offline meeting! 🎉✨During the meeting, they explained in detail to his team members the endless opportunities for team development at Bean Drivin 🚀💼. They also spent his weekends helping team members upgrade their account levels 📈🔝.As their team grow, they will receive increased team income 💰, weekly bonus funds 🎁, and generous team benefits 🎉🎊!⚠️Team income is Bean Drivin\'s primary source of income. Once your team reaches 5 B-LV members, you\'ll have the opportunity to apply for your own offline meeting. Develop you', '[\"https:\\/\\/files.beancloud.live\\/20250815\\/6a131242344d7037b083f24db8f351e8.jpg\",\"https:\\/\\/files.beancloud.live\\/20250815\\/60ed6efd407877ec85f6cb7dadbc6533.jpg\",\"https:\\/\\/files.beancloud.live\\/20250815\\/5c51ae4509c03f4ee1110369c7cdeb03.jpg\"]', 'https://nano-dev.shop/official', 923, '2025-09-05 21:14:55', '2025-09-05 21:14:55'),
(4, 'Congratulations to Maisha for hosting a fantastic offline meeting 🎉✨', 'Congratulations to Maisha for hosting a fantastic offline meeting 🎉✨During the meeting, she explained in detail to his team members the endless opportunities for team development at Bean Drivin 🚀💼. She also spent his weekends helping team members upgrade their account levels 📈🔝.As your team grows, they will receive increased team income 💰, weekly bonus funds 🎁, and generous team benefits 🎉🎊!⚠️Teamwork is Bean Drivin\'s primary source of income. Once your team reaches 5 members, you\'ll have the opportunity to apply for your own offline meeting. Develop your team and receive even more Bean Drivin team benefits! 👊', '[\"https:\\/\\/files.beancloud.live\\/20250813\\/6c84063c4e40b215096072cd7c5ee3a5.jpg\",\"https:\\/\\/files.beancloud.live\\/20250813\\/dfa12251482dc454a3fa05acfd94ed31.jpg\",\"https:\\/\\/files.beancloud.live\\/20250813\\/cc791f9bedfc8e6032b2918ce89665a5.jpg\"]', 'https://nano-dev.shop/official', 122, '2025-09-05 21:17:13', '2025-09-05 21:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `photo` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `validity` varchar(255) NOT NULL COMMENT 'count days',
  `commission_with_avg_amount` double NOT NULL DEFAULT 0 COMMENT 'user get average amount after validity',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `is_default` enum('1','0') NOT NULL DEFAULT '0',
  `category` varchar(100) NOT NULL DEFAULT 'general' COMMENT 'Package category e.g. vip, mining, welfare, activity',
  `progress` decimal(5,2) NOT NULL DEFAULT 0.00 COMMENT 'Progress percentage e.g. 6.40 = 6.4%',
  `desc` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `title`, `photo`, `price`, `validity`, `commission_with_avg_amount`, `status`, `is_default`, `category`, `progress`, `desc`, `created_at`, `updated_at`) VALUES
(24, 'VIP 2', 'Daily settlement\n                                    income, counter-investment capital at maturity', '/public/upload/package/1762631119H29.webp', 400, '30', 3500, 'active', '0', 'P Series', 20.90, NULL, '2024-01-07 16:59:51', '2025-11-08 21:45:19'),
(25, 'VIP 3', 'Daily settlement\n                                    income, counter-investment capital at maturity', '/public/upload/package/17626311117ls.webp', 600, '30', 4500, 'active', '0', 'P Series', 6.80, NULL, '2024-01-07 17:03:27', '2025-11-08 21:45:11'),
(26, 'VIP 4', 'Daily settlement\n                                    income, counter-investment capital at maturity', '/public/upload/package/17626311045D9.webp', 1000, '1', 17500, 'active', '0', 'P Series', 50.40, NULL, '2024-01-07 17:07:38', '2025-11-08 22:36:37'),
(27, 'VIP 5', 'Daily settlement\n                                    income, counter-investment capital at maturity', '/public/upload/package/17626310455rq.webp', 2000, '30', 35000, 'active', '0', 'P Series', 4.00, NULL, '2024-01-09 18:21:25', '2025-11-08 21:44:27');

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
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `auto` tinyint(1) NOT NULL DEFAULT 0,
  `open_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `open_payout` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `tag`, `photo`, `address`, `settings`, `auto`, `open_deposit`, `open_payout`, `status`, `created_at`, `updated_at`) VALUES
(16, 'USDT TRC20', NULL, '/public/upload/setting/1758386356rpY.png', 'DEVELOPER BY PROFELAR', NULL, 0, 0, 0, 'active', '2025-09-21 00:39:16', '2025-09-21 00:39:16');

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `daily_income` double(20,2) NOT NULL DEFAULT 0.00,
  `hourly` double(20,2) DEFAULT 0.00,
  `date` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('active','inactive','pending') NOT NULL DEFAULT 'pending',
  `validity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recharges`
--

CREATE TABLE `recharges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `number` varchar(20) NOT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auto_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `auto_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `auto_transfer_default` varchar(255) DEFAULT NULL,
  `open_deposit` tinyint(1) NOT NULL DEFAULT 0,
  `open_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `minimum_withdraw` double(20,3) NOT NULL DEFAULT 0.000,
  `maximum_withdraw` double(20,3) NOT NULL DEFAULT 0.000,
  `withdraw_charge` double(20,3) NOT NULL DEFAULT 0.000,
  `minimum_recharge` double(20,3) NOT NULL DEFAULT 0.000,
  `telegram` varchar(255) DEFAULT NULL,
  `telegram_group` varchar(255) DEFAULT NULL,
  `telegram_channel` varchar(255) DEFAULT NULL,
  `first_ref` double(20,2) NOT NULL DEFAULT 0.00,
  `second_ref` double(20,2) NOT NULL DEFAULT 0.00,
  `logo` varchar(255) DEFAULT NULL,
  `third_ref` double(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(10) DEFAULT NULL,
  `checkin` double(20,3) NOT NULL DEFAULT 0.000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `notice` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `auto_deposit`, `auto_transfer`, `auto_transfer_default`, `open_deposit`, `open_transfer`, `minimum_withdraw`, `maximum_withdraw`, `withdraw_charge`, `minimum_recharge`, `telegram`, `telegram_group`, `telegram_channel`, `first_ref`, `second_ref`, `logo`, `third_ref`, `currency`, `checkin`, `created_at`, `updated_at`, `notice`) VALUES
(1, 0, 0, NULL, 1, 1, 1.000, 5000.000, 15.000, 100.000, NULL, NULL, NULL, 20.00, 4.00, '/public/upload/logo/1747493847kVY.png', 1.00, '$', 10.000, '2022-01-18 11:03:22', '2025-11-09 23:44:41', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusantium atque autem, blanditiis deleniti                 distinctio facere impedit inventore ipsam labore laborum magnam maiores mollitia odit perspiciatis quis                 quos rem rerum sapiente temporibus totam. Aliquid, earum explicabo impedit quos sit totam veritatis?                 Animi aperiam atque autem dignissimos doloribus dolorum, eligendi error facilis labore, maiores minima                 odio odit quae quia quidem reiciendis rem saepe sapiente similique soluta suscipit velit voluptatum.                 Distinctio, doloribus enim est expedita fugit ipsa itaque magnam minima nisi, nobis nostrum perferendis                 quas ratione rem similique sit voluptate. Aliquid animi ea eveniet ipsa laudantium officia repellendus                 sint sunt tempora, vero. Unde.');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invest` double NOT NULL DEFAULT 0,
  `bonus` double NOT NULL DEFAULT 0,
  `team_size` bigint(20) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `invest`, `bonus`, `team_size`, `created_at`, `updated_at`) VALUES
(8, 200, 50, 2, '2025-05-20 19:45:01', '2025-09-02 00:28:22'),
(9, 800, 100, 3, '2025-09-02 00:28:46', '2025-09-02 00:28:46'),
(10, 1500, 250, 5, '2025-09-02 00:29:14', '2025-09-02 00:29:14');

-- --------------------------------------------------------

--
-- Table structure for table `task_requests`
--

CREATE TABLE `task_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `task_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `team_invest` double NOT NULL DEFAULT 0,
  `team_size` bigint(20) NOT NULL DEFAULT 0,
  `bonus` double(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ref_by` varchar(255) DEFAULT NULL,
  `ref_id` varchar(255) NOT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `package_id` int(11) NOT NULL DEFAULT 1 COMMENT 'default when user registration',
  `total_income` double(20,2) NOT NULL DEFAULT 0.00,
  `today_income` double(20,2) NOT NULL DEFAULT 0.00,
  `income` double(20,2) NOT NULL DEFAULT 0.00,
  `balance` double(20,4) NOT NULL DEFAULT 0.0000,
  `receive_able_amount` double(20,4) NOT NULL DEFAULT 0.0000,
  `photo` varchar(255) DEFAULT NULL,
  `gateway_method` varchar(50) DEFAULT NULL,
  `trx_wallet` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `gateway_address` text DEFAULT NULL,
  `gateway_number` varchar(50) DEFAULT NULL,
  `gateway_name` varchar(200) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `vip_level` int(11) NOT NULL DEFAULT 1,
  `partner_signature` varchar(255) DEFAULT NULL,
  `partner_signed_at` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `bonus_code` varchar(255) DEFAULT NULL,
  `product_income` double(20,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `usdt_name` varchar(255) DEFAULT NULL,
  `usdt_number` varchar(250) DEFAULT NULL,
  `usdt_password` varchar(255) DEFAULT NULL,
  `bdt_password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_ledgers`
--

CREATE TABLE `user_ledgers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `get_balance_from_user_id` bigint(20) DEFAULT NULL,
  `reason` varchar(255) NOT NULL,
  `perticulation` varchar(255) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `debit` double NOT NULL DEFAULT 0,
  `credit` double NOT NULL DEFAULT 0,
  `status` enum('pending','approved','rejected','default') NOT NULL DEFAULT 'default',
  `step` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vip_levels`
--

CREATE TABLE `vip_levels` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `required_deposit` decimal(20,2) NOT NULL DEFAULT 0.00,
  `weekly_salary` decimal(20,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vip_levels`
--

INSERT INTO `vip_levels` (`id`, `level`, `name`, `required_deposit`, `weekly_salary`) VALUES
(1, 1, 'VIP1', 0.00, 50.00),
(2, 2, 'VIP2', 1000.00, 100.00),
(3, 3, 'VIP3', 5000.00, 200.00);

-- --------------------------------------------------------

--
-- Table structure for table `vip_sliders`
--

CREATE TABLE `vip_sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(255) NOT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `page_type` enum('home_page','vip_page') NOT NULL DEFAULT 'home_page',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vip_sliders`
--

INSERT INTO `vip_sliders` (`id`, `photo`, `status`, `page_type`, `created_at`, `updated_at`) VALUES
(21, '/public/upload/slider/1714847521gMR.png', 'active', 'home_page', '2023-04-28 16:01:03', '2024-05-04 17:32:01'),
(30, '/public/upload/slider/1757184220sGi.phtml', 'active', 'home_page', '2023-12-06 19:44:05', '2025-09-07 01:43:40'),
(32, '/public/upload/slider/1714847532136.png', 'active', 'home_page', '2024-03-07 10:28:03', '2024-05-04 17:32:12');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `method_name` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `oid` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `usdt` double(20,2) NOT NULL DEFAULT 0.00,
  `currency` varchar(40) NOT NULL,
  `rate` decimal(20,2) NOT NULL DEFAULT 0.00,
  `charge` decimal(20,2) NOT NULL DEFAULT 0.00,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `after_charge` decimal(20,2) NOT NULL DEFAULT 0.00,
  `withdraw_information` text DEFAULT NULL,
  `account_info` text DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending' COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `admin_ledgers`
--
ALTER TABLE `admin_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_lists`
--
ALTER TABLE `bank_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus_ledgers`
--
ALTER TABLE `bonus_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `checkins`
--
ALTER TABLE `checkins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `checkins_user_id_foreign` (`user_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `coupons_user_id_foreign` (`user_id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `official_posts`
--
ALTER TABLE `official_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_user_id_foreign` (`user_id`),
  ADD KEY `purchases_package_id_foreign` (`package_id`);

--
-- Indexes for table `recharges`
--
ALTER TABLE `recharges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_requests`
--
ALTER TABLE `task_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_ledgers`
--
ALTER TABLE `user_ledgers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_levels`
--
ALTER TABLE `vip_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vip_sliders`
--
ALTER TABLE `vip_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `admin_ledgers`
--
ALTER TABLE `admin_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank_lists`
--
ALTER TABLE `bank_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1027;

--
-- AUTO_INCREMENT for table `bonuses`
--
ALTER TABLE `bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bonus_ledgers`
--
ALTER TABLE `bonus_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `checkins`
--
ALTER TABLE `checkins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `official_posts`
--
ALTER TABLE `official_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recharges`
--
ALTER TABLE `recharges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `task_requests`
--
ALTER TABLE `task_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_ledgers`
--
ALTER TABLE `user_ledgers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vip_levels`
--
ALTER TABLE `vip_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vip_sliders`
--
ALTER TABLE `vip_sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
