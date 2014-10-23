-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 23, 2014 at 07:08 PM
-- Server version: 5.5.38-0ubuntu0.14.04.1
-- PHP Version: 5.5.15-4+deb.sury.org~precise+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cofee_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_app_config`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_app_config` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_app_config`
--

INSERT INTO `cofeeapp_app_config` (`key`, `value`) VALUES
('address', 'The Gatehouse\nMansion Gate\nLeeds\nLS7 4RF'),
('company', 'Free2Vape'),
('currency_side', '0'),
('currency_symbol', '£'),
('custom10_name', '0'),
('custom2_name', ''),
('custom3_name', ''),
('custom4_name', ''),
('custom5_name', ''),
('custom6_name', ''),
('custom7_name', ''),
('custom8_name', ''),
('custom9_name', ''),
('default_tax_1_name', 'V.A.T'),
('default_tax_1_rate', '20'),
('default_tax_2_name', ''),
('default_tax_2_rate', ''),
('default_tax_rate', '8'),
('email', 'admin@free2vape.co.uk'),
('fax', ''),
('language', 'en'),
('multi_store', '1'),
('phone', '0113 8950077'),
('print_after_sale', 'print_after_sale'),
('return_policy', 'Retain this receipt as proof or purchase'),
('timezone', 'Europe/London'),
('website', '');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_category`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(35) DEFAULT NULL,
  `category_description` varchar(250) DEFAULT NULL,
  `sub_category_description` varchar(250) DEFAULT NULL,
  `parent_category` int(11) DEFAULT '0',
  `status` enum('Enabled','Disabled') NOT NULL DEFAULT 'Enabled',
  `display_order` int(11) DEFAULT NULL,
  `saving_upto` decimal(12,2) NOT NULL,
  `type` enum('location','item') NOT NULL,
  `location` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `location_2` (`location`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `cofeeapp_category`
--

INSERT INTO `cofeeapp_category` (`id`, `category_name`, `category_description`, `sub_category_description`, `parent_category`, `status`, `display_order`, `saving_upto`, `type`, `location`) VALUES
(1, 'Cofee', 'Cofee', NULL, 0, 'Enabled', 1, 0.00, 'location', 'SHOP001'),
(2, 'Coppuchino', 'Coppuchino', NULL, 0, 'Enabled', NULL, 0.00, 'item', 'SHOP002'),
(3, 'Black Coppuchino', 'Black Coppuchino', NULL, 0, 'Enabled', NULL, 0.00, 'item', 'SHOP004'),
(8, '', '', NULL, 0, 'Disabled', 0, 0.00, 'item', '');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_employees`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_employees`
--

INSERT INTO `cofeeapp_employees` (`username`, `password`, `person_id`, `deleted`) VALUES
('admin', '439a6de57d475c1a0ba9bcb1c39f0af6', 1, 0),
('alina', '92bebfcb52b599ecd7f4403504b1fdc1', 10, 0),
('andyconlon', '2995553c3c8140797bc982a8dcd3f64d', 3, 0),
('benboydon', '2fc465031ad40b5e00de048ad9ad446e', 8, 0),
('bmcguire', 'cbdb47ed83e7a3a756d678d5cd8e5e77', 7, 0),
('cdanasiri', '65b31f4ee011f1533d449271c2309a43', 25, 0),
('czaremba', '5d447292c74151a8a5faec720264cbb4', 21, 0),
('gayanc', '236b6352f1116b7e3cf1fb358c3a5eca', 24, 0),
('glena', '30469882120cdb0da3f3596b991873f9', 5, 0),
('jasonnota', '4eb774c452e4ff89c78bcf1a9cb5a18f', 20, 0),
('jnota', '85b81b9f79b0a07d1c45207e6d9a92bc', 11, 1),
('peterhumphrey', '1558072b97ffa01dc171c9fb72cc38d4', 23, 0),
('Pippa', '62994c0625ba5e58bcf02c28159e217c', 9, 0),
('sabinab', 'fe4c33cd66a6cb8260a7dac826b0e8ce', 22, 0),
('smarshall', 'eb58f16df04e39cb0c7415cebae0179e', 6, 0),
('timmaynard', '7bf305b6fc3119c0932dce3e19ab84c6', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_images`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) COLLATE utf8_bin NOT NULL,
  `record_id` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `image` text COLLATE utf8_bin,
  `display_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='App Images' AUTO_INCREMENT=14 ;

--
-- Dumping data for table `cofeeapp_images`
--

INSERT INTO `cofeeapp_images` (`id`, `table`, `record_id`, `image`, `display_order`) VALUES
(1, 's00_02_locations ', 'SHOP001', 'Image 01', 0),
(2, 's00_02_locations ', 'SHOP001', 'Image 02', 2),
(3, 's00_02_locations ', 'SHOP002', 'Image 01', 0),
(4, 's00_02_locations ', 'SHOP003', 'Image 01', 0),
(5, 's00_02_locations ', 'SHOP002', 'Image 02', 0),
(6, 's00_02_locations ', 'SHOP003', 'Image 02', 0),
(7, 'cofee_app _items', 'ITM10', 'banner1.jpg', 0),
(8, 'cofee_app _items', 'ITM10', 'banner2.jpg', 0),
(9, 'cofee_app _items', 'ITM11', 'banner1.jpg', 0),
(10, 'cofee_app _items', 'ITM11', 'banner2.jpg', 0),
(11, 'cofee_app _category', '4', '1488818_490697721036405_600219282_n.jpg', 0),
(12, 'cofee_app _category', '5', '1488818_490697721036405_600219282_n.jpg', 0),
(13, 'cofee_app _category', '7', '808dab37-e859-45cb-8a3c-f1d44aa5b784.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_items`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_items` (
  `item_code` varchar(100) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  `location` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`item_code`),
  KEY `location` (`location`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Item Master Table';

--
-- Dumping data for table `cofeeapp_items`
--

INSERT INTO `cofeeapp_items` (`item_code`, `name`, `description`, `quantity`, `reorder_level`, `price`, `category`, `category_id`, `location`) VALUES
('ITM001', 'Coffee Light', 'Coffee Light', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP001'),
('ITM002', 'Coffee Light Green', 'Coffee Light Green', 15, 2, 15.00, 'Coppuchino', 2, 'SHOP001'),
('ITM003', 'Coffee Dark', 'Coffee Dark', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP002'),
('ITM004', 'Cofee Dark Absalute - edit', 'Cofee Dark Absalute', 20, 5, 12.00, '', 0, 'SHOP002'),
('ITM005', 'Green Tea', 'Green Tea', 20, 5, 12.00, 'Black Coppuchino', 3, 'SHOP003'),
('ITM006', 'Green Tea', 'Green Tea', 20, 5, 12.00, 'Black Coppuchino', 3, 'SHOP001'),
('ITM007', 'Cofee Dark Absalute', 'Cofee Dark Absalute', 20, 5, 12.00, 'Coppuchino', 2, 'SHOP004'),
('ITM008', 'Coffee Light', 'Coffee Light', 20, 5, 12.00, 'Black Coppuchino', 2, 'SHOP006'),
('ITM009', 'Coffee Light Green', 'Coffee Light Green', 15, 2, 15.00, 'Coppuchino', 2, 'SHOP006'),
('ITM10', 'cofeeapp', 'sdfsdf', 23423, 234234, 234.00, 'Coppuchino', 2, 'SHOP006'),
('ITM13', 'test', 'test gayan', 422, 5, 100.00, 'Black Coppuchino', 3, 'SHOP006');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_key_table`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_key_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_code` int(11) NOT NULL,
  `item_code` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cofeeapp_key_table`
--

INSERT INTO `cofeeapp_key_table` (`id`, `shop_code`, `item_code`) VALUES
(1, 8, 13);

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_locations`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_locations` (
  `shop_code` varchar(15) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `address` varchar(255) COLLATE utf8_bin NOT NULL,
  `featured` char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `longit` decimal(20,12) DEFAULT NULL,
  `latit` decimal(20,12) DEFAULT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `open_hours` decimal(12,2) DEFAULT NULL,
  `closed_hours` decimal(12,2) DEFAULT NULL,
  `availability` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `saving_upto` decimal(12,2) NOT NULL,
  `geo_address` text COLLATE utf8_bin NOT NULL,
  `saving_percent` decimal(12,2) NOT NULL,
  `status` enum('Pending','Approved','Suspend') COLLATE utf8_bin NOT NULL DEFAULT 'Pending',
  PRIMARY KEY (`shop_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Master Locations(Shops)';

--
-- Dumping data for table `cofeeapp_locations`
--

INSERT INTO `cofeeapp_locations` (`shop_code`, `name`, `description`, `address`, `featured`, `longit`, `latit`, `contact_no`, `open_hours`, `closed_hours`, `availability`, `created_at`, `saving_upto`, `geo_address`, `saving_percent`, `status`) VALUES
('1', 'New Cofee', 'New Cofee description', '                                                     Park Avenue Colombo 08 \n                                                ', '0', 151.233687200000, -33.833582800000, 2147483647, 9.00, 8.00, 1, '2014-07-29 23:00:00', 100.00, 'Park Avenue, Mosman, New South Wales, Australia', 10.00, 'Pending'),
('SHOP001', 'Shop One', '', '', '0', 7.073033000000, 79.996028000000, 770190352, 8.30, 5.00, 1, '2014-06-19 16:23:43', 0.00, '', 0.00, 'Pending'),
('SHOP002', 'Shop Two', '', '', '0', 79.542311198568, 6.622764020291, 770190352, 8.30, 5.00, 1, '2014-06-19 16:28:31', 0.00, '', 0.00, 'Pending'),
('SHOP003', 'Shop Three', 'Test Des ', '                                                      \n                                                ', '0', 146.916469300000, -36.080778500000, 770190352, 8.30, 5.00, 1, '2014-07-29 23:00:00', 0.00, 'Albury CBD, New South Wales, Australia', 0.00, 'Pending'),
('SHOP004', 'Shop Four', '', '', '0', 79.542311198566, 6.622764020293, 770190352, 8.30, 5.00, 1, '2014-06-19 16:29:17', 0.00, '', 0.00, 'Pending'),
('SHOP005', 'Shop Five', '', '', '0', 79.542311198565, 6.622764020294, 770190352, 8.30, 5.00, 1, '2014-06-19 16:29:35', 0.00, '', 0.00, 'Pending'),
('SHOP006', 'Shop Six', '', '', '0', 79.542311198564, 6.622764020295, 770190352, 8.30, 5.00, 1, '2014-06-19 16:29:56', 0.00, '', 0.00, 'Pending'),
('SHOP8', 'New Cofee', 'New Cofee description', 'Park Avenue Colombo 08', '0', 79.875237600000, 6.919059300000, 2147483647, 9.00, 8.00, 0, '2014-07-15 23:00:00', 100.00, 'Park Avenue, Colombo, Western Province, Sri Lanka', 10.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_location_categories`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_location_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(100) COLLATE utf8_bin NOT NULL,
  `category` int(11) NOT NULL,
  `type` enum('location','item') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  KEY `category` (`category`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Categories Item/Location' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `cofeeapp_location_categories`
--

INSERT INTO `cofeeapp_location_categories` (`id`, `location`, `category`, `type`) VALUES
(1, 'SHOP001', 1, 'location'),
(2, 'SHOP002', 1, 'location'),
(3, 'SHOP003', 1, 'location'),
(4, 'SHOP004', 1, 'location'),
(5, 'SHOP005', 1, 'location'),
(6, 'SHOP006', 1, 'location'),
(7, 'SHOP001', 2, 'item'),
(8, 'SHOP001', 3, 'item'),
(9, 'SHOP003', 3, 'item'),
(10, 'SHOP004', 2, 'item'),
(11, 'SHOP005', 3, 'item'),
(12, 'SHOP006', 3, 'item');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_member`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `contact_no` int(11) DEFAULT NULL,
  `picture` text COLLATE utf8_bin,
  `api_key` varchar(32) COLLATE utf8_bin NOT NULL,
  `activation_code` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_code` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Member Master Table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cofeeapp_member`
--

INSERT INTO `cofeeapp_member` (`id`, `first_name`, `last_name`, `email`, `password`, `contact_no`, `picture`, `api_key`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `status`, `created_at`, `last_login`) VALUES
(1, 'Gayan Chathuranga', NULL, 'chathurangagc@gmail.com', '471abd422f30292701efa0a1a53b32aa', 770190352, NULL, '26ffd8855f569db7c60cab2c71ae1be6', '', NULL, NULL, NULL, 1, '2014-06-18 06:47:04', '2014-06-18 06:47:04');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_member_subscription`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_member_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `item_code` varchar(15) COLLATE utf8_bin NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `subscription` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `usage` int(11) DEFAULT NULL,
  `subscribed_date` date NOT NULL,
  `revoked_date` date NOT NULL,
  `active` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `plan_id` (`plan_id`),
  KEY `member_id` (`member_id`),
  KEY `item_code` (`item_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='m00_01_member_subscription' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `cofeeapp_member_subscription`
--

INSERT INTO `cofeeapp_member_subscription` (`subscription_id`, `plan_id`, `item_code`, `member_id`, `subscription`, `usage`, `subscribed_date`, `revoked_date`, `active`) VALUES
(1, 'PLN01', 'ITM001', 1, 'Coffee Light Green', 27, '2014-06-29', '0000-00-00', '1'),
(2, 'PLN01', 'ITM002', 1, 'Coffee Light', 30, '2014-06-29', '0000-00-00', '1'),
(3, 'PLN02', 'ITM003', 1, 'Coffee Light Green', 30, '2014-06-29', '0000-00-00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_modules`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `parent_module` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_modules`
--

INSERT INTO `cofeeapp_modules` (`name_lang_key`, `desc_lang_key`, `sort`, `module_id`, `parent_module`) VALUES
('location_add', 'location_add_desc', 0, 'add', 'locations'),
('items_add_category', 'items_add_category_desc', 0, 'add_category', 'items'),
('employees_add_employee', 'employees_add_employee_desc', 0, 'add_employee', 'employees'),
('items_add_item', 'items_add_item_desc', 0, 'add_item', 'items'),
('plans_add_plan', 'plans_add_plan_desc', 0, 'add_plan', 'plans'),
('module_config', 'module_config_desc', 100, 'config', '0'),
('module_customers', 'module_customers_desc', 10, 'customers', '0'),
('module_employees', 'module_employees_desc', 80, 'employees', '0'),
('module_items', 'module_items_desc', 20, 'items', '0'),
('module_locations', 'module_locations_desc', 90, 'locations', '0'),
('location_manage', 'location_manage_desc', 0, 'manage', 'locations'),
('employees_manage_employee', 'employees_manage_employee_desc', 0, 'manage_employee', 'employees'),
('module_plans', 'module_plans_desc', 0, 'plans', '0'),
('plans_add', 'plans_add_desc', 0, 'plans_add', 'plans'),
('plans_manage', 'plans_manage_desc', 0, 'plans_manage', 'plans'),
('module_reports', 'module_reports_desc', 50, 'reports', '0'),
('items_show_category', 'items_show_category_desc', 0, 'show_category', 'items');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_order`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_order` (
  `order_id` varchar(100) NOT NULL,
  `member` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('APPROVED','PENDING','PROCESSING') NOT NULL DEFAULT 'PROCESSING',
  `sub_total` decimal(9,2) DEFAULT NULL,
  `grand_total` decimal(9,2) DEFAULT NULL,
  `vat` decimal(9,2) DEFAULT NULL,
  `discount` decimal(9,2) DEFAULT NULL,
  `shop_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_order_items`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_order_items` (
  `order_id` varchar(100) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `subscription_id` int(11) DEFAULT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` double(15,2) NOT NULL DEFAULT '0.00',
  `item_price` decimal(15,2) NOT NULL,
  `discount_percent` int(11) NOT NULL DEFAULT '0',
  `item_vat_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`order_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_order_member_subscription`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_order_member_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subscrb_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `item_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `mode` enum('TAKEAWAY','DINEOUT') NOT NULL DEFAULT 'TAKEAWAY',
  `order_date` datetime DEFAULT NULL,
  `order_status` enum('PENDING','ACCEPTED') DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `comments` text,
  `pickup_time` time DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscrb_id` (`subscrb_id`),
  KEY `item_code` (`item_code`),
  KEY `subscrb_id_2` (`subscrb_id`),
  KEY `member_id` (`member_id`),
  KEY `item_code_2` (`item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_people`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `cofeeapp_people`
--

INSERT INTO `cofeeapp_people` (`first_name`, `last_name`, `phone_number`, `email`, `address_1`, `address_2`, `city`, `state`, `zip`, `country`, `comments`, `person_id`) VALUES
('Admin', 'User', '555-555-5555', 'admin@free2vape.co.uk', 'Address 1', '', '', '', '', '', '', 1),
('Tim', 'Maynard', '', '', '', '', '', '', '', '', '', 2),
('Andrew', 'Conlon', '07534802380', 'andyconlon@free2vape.co.uk', '', '', '', '', '', '', '', 3),
('Gayan', 'Chathuranga', '94770190352', 'gayan.chathuranga@monara.com', 'Monara IT Ltd', '5/A, Park Avenue', 'Colombo 08', 'Select...', '80080', 'Sri Lanka', '', 4),
('Glen', 'Andrew', '07961263862', 'glen@free2vape.co.uk', '', '', '', '', '', '', '', 5),
('Shannon', 'Marshall', '07814781670', 'shannonmarshall9@hotmail.com', '', '', '', '', '', '', '', 6),
('Bekkii', 'McGuire', '07587392547', '', '', '', '', '', '', '', '', 7),
('Ben', 'Boydon', '07976510251', '', '', '', '', '', '', '', '', 8),
('Pippa', 'Shann', '', '', '', '', '', '', '', '', '', 9),
('Alina', 'Radu', '07424427479', 'radualina2013@gmail.com', '', '', '', '', '', '', '', 10),
('Jason', 'Nota', '', 'jason@free2vape.co.uk', '', '', '', '', '', '', '', 11),
('Jason', 'Nota', '', 'jason@pluspro.com', '', '', '', '', '', '', '', 20),
('Chloe', 'Zaremba', '07935883795', '', '', '', '', '', '', '', '', 21),
('sabina', 'bungard', '', '', '', '', '', '', '', '', '', 22),
('Peter', 'Humphrey', '', 'peter@free2vape.co.uk', '', '', '', '', '', '', '', 23),
('Gayan', 'Chathuranga', '770190352', 'gayan.c@pluspro.com', '', '', '', '', '', '', '', 24),
('Chathura', 'Dhanasiri', '770190352', 'cdanasiri@gmail.com', '', '', '', '', '', '', '', 25);

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_permissions`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_permissions` (
  `module_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  PRIMARY KEY (`module_id`,`person_id`),
  KEY `person_id` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_permissions`
--

INSERT INTO `cofeeapp_permissions` (`module_id`, `person_id`) VALUES
('add', 1),
('add_employee', 1),
('customers', 1),
('employees', 1),
('locations', 1),
('manage', 1),
('manage_employee', 1),
('module_plans', 1),
('subscriptions', 1),
('add_category', 24),
('add_employee', 24),
('add_item', 24),
('config', 24),
('customers', 24),
('employees', 24),
('items', 24),
('plans', 24),
('plans_add', 24),
('plans_manage', 24),
('show_category', 24),
('subscriptions', 24),
('items', 25),
('subscriptions', 25);

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_plan`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_plan` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `frequency` enum('Annual','Quarter') COLLATE utf8_bin NOT NULL DEFAULT 'Quarter',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `location` varchar(15) COLLATE utf8_bin NOT NULL,
  `category` varchar(100) COLLATE utf8_bin NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  `saving_upto` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `location` (`location`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Master Data';

--
-- Dumping data for table `cofeeapp_plan`
--

INSERT INTO `cofeeapp_plan` (`plan_id`, `name`, `description`, `quantity`, `price`, `frequency`, `start_date`, `end_date`, `location`, `category`, `category_id`, `status`, `saving_upto`) VALUES
('PLN01', 'Subscription Plan 01', 'Subscription Plan 01 Description', 60, 580.00, 'Quarter', '2014-06-04', '2014-06-26', 'SHOP001', 'Coppuchino', 2, '1', NULL),
('PLN02', 'Subscription Plan 02', 'Subscription Plan 02 Description', 20, 250.00, 'Quarter', '2014-06-18', '2014-06-20', 'SHOP001', 'Black Coppuchino', 3, '1', NULL),
('PLN03', 'Subscription Plan 01', 'Subscription Plan 01 Description', 10, 100.00, 'Quarter', '2014-06-04', '2014-06-26', 'SHOP002', 'Coppuchino', 2, '1', NULL),
('PLN04', 'Subscription Plan 01', 'Subscription Plan 01 Description', 20, 250.00, 'Quarter', '2014-06-18', '2014-06-20', 'SHOP003', 'Black Coppuchino', 3, '1', NULL),
('PLN05', 'Subscription Plan 02', 'Subscription Plan 02 Description', 10, 100.00, 'Quarter', '2014-06-04', '2014-06-26', 'SHOP003', 'Coppuchino', 2, '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_plan_items`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_plan_items` (
  `plan_id` varchar(15) COLLATE utf8_bin NOT NULL,
  `item_code` varchar(15) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(100) COLLATE utf8_bin NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  `saving_upto` decimal(12,2) DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin NOT NULL DEFAULT '1',
  KEY `item_code` (`item_code`),
  KEY `plan_id` (`plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Subscription Plan Item Data';

--
-- Dumping data for table `cofeeapp_plan_items`
--

INSERT INTO `cofeeapp_plan_items` (`plan_id`, `item_code`, `item_name`, `quantity`, `price`, `saving_upto`, `status`) VALUES
('PLN01', 'ITM002', 'Coffee Light Green', 30, 300.00, NULL, '1'),
('PLN01', 'ITM001', 'Coffee Light', 30, 280.00, NULL, '1'),
('PLN03', 'ITM003', '', 30, 30.00, NULL, '1'),
('PLN02', 'ITM001', 'New Item', 20, 580.00, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_reviews`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `added_on` date DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `subject` text COLLATE utf8_bin,
  `description` text COLLATE utf8_bin,
  `location` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `IP` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `url` text COLLATE utf8_bin,
  `rating` varchar(10) COLLATE utf8_bin DEFAULT NULL,
  `modified_by` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `is_approved` enum('Approved','Pending','Rejected') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_sessions`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cofeeapp_sessions`
--

INSERT INTO `cofeeapp_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('00cd44ead549c562ce6264df5ca15e40', '86.159.49.164', 'Mozilla/4.0 (Windows 7 6.1) Java/1.7.0_60', 1405339322, ''),
('03f27c0137d2c350311bd9f532d1ad8f', '123.231.123.74', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405347204, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('06db63a7bcc7362cf65a12c1b24f30b9', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079645, ''),
('08ffded08d05654d14c66213c0839fdc', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1396449135, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('091c67745f05a1202cff095bce2b4662', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325125, ''),
('09e3d3c2868c6784994a292fce369df5', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726834, ''),
('0a3c858f7f988a1dbe032db14395440c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404400209, ''),
('0a4c7c97facdf69d3a03a7d565edbf0b', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405097479, ''),
('0a5ab6219df774538488ded491b48936', '217.41.2.190', 'Mozilla/4.0 (Windows 7 6.1) Java/1.7.0_60', 1404383245, ''),
('0aba9be822a9322daa67023368702e60', '123.231.18.118', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36', 1404299936, ''),
('0bf30e96e22e3cf611fba3fbc29518ce', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808151, ''),
('0c6d3ee15007a7fb3f7ff2f279104edb', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404915370, ''),
('0d2615fb88628985e3992d7f2422ad69', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808137, ''),
('0d4dd68bb79753e1055e48d7ca4f407b', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404749843, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:2:"10";s:6:"source";s:3:"POS";}'),
('0ffc150efefdf5d79e15c7842bf773a3', '193.239.15.205', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396640452, 'a:8:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"2";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:13:"shop_address1";s:19:"16 Stonegate Road, ";s:13:"shop_address2";s:10:"Meanwood, ";s:13:"shop_address3";s:15:"Leeds , LS6 4HY";s:12:"shop_contact";s:11:"01138950077";}'),
('115bcd812741f89ab6e957c491b3b82d', '189.8.69.39', '0', 1396760033, ''),
('116ae1781029223eea18528e21473840', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403891565, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('11bf724a7d952a4d36578d040e1c5acb', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404226491, ''),
('121f6fe312d21c80da9aba1becd05b6d', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404202934, ''),
('125d07637bd80983ee3343d3de1d8bb3', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404385206, ''),
('13a0660493972d502448352c6dc3a70e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942803, ''),
('13be09775a06b12823240c8c9cc757be', '82.21.172.159', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1403891218, ''),
('13cdde00a39d5ab41b78b259f49434f1', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404289867, ''),
('146dd970c5a933b7f271e2aca61ef08d', '82.21.172.159', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1405097473, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:8:"OL15 8DA";s:6:"street";s:16:"35 Church Street";s:4:"city";s:13:"Littleborough";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:2:"23";s:6:"source";s:3:"POS";}'),
('14e1b4e9c51af8f71165737f22330ce4', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405433031, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"9";s:6:"source";s:3:"POS";}'),
('14fac8f838b128df2e4b32a51c9a4d13', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1399100324, ''),
('166d0210adef650c408c01a0a7ac3ee2', '103.247.48.154', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405098720, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"6";s:9:"shop_name";s:11:"Test 2 Shop";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('1769b4640c495502ebe4400b39b60420', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019917, ''),
('1789bd49c4b1ef634e99bce10424edb7', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808150, ''),
('17db862f12e026cf9ab241b94b9ef82d', '123.231.123.74', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405434483, ''),
('1829865f2a25ccbfc0af9d295587635f', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404116378, ''),
('187ab0f01c7e9acde36aa778861ba871', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405778372, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('19288a26614439f35e262cf3d5c79c42', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726801, ''),
('192bfb30303b4a16fce0a08b83cd6c5d', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079645, ''),
('19c7541ff8ff50e37c799cd16c87713f', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1399897978, 'a:16:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_sale";s:9:"wholesale";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"202";s:4:"line";i:1;s:4:"name";s:17:"F2V AMARETTO 18MG";s:11:"item_number";s:6:"100490";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:10:"store_type";s:8:"shopsale";}'),
('1a6a9d397f2c6bd9f5602a9f944c7465', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404632104, ''),
('1bab0c3e7b508c5e9c733b3fb071a6d0', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993274, ''),
('1e7f6e8cfb21133557e11a5c7cc29ee0', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325124, ''),
('215eb7b2865658d87bfd4f766444ac1c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404547284, ''),
('21fe5b38990943ea27324319df7c51ab', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410686, ''),
('226fb6a3d2e771548d8295a1b776b0a9', '123.231.18.118', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 1403065464, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"2";}'),
('228a48cc0cad146842f70c0552110cf9', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079536, ''),
('228dbb1a74db84d1fed94f22f984af88', '123.231.18.118', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404306615, ''),
('242104a059a9b797c50eed7b97ba2204', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 1401360843, ''),
('24a47492f8ff2551c6595b4cf0c088f7', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405358949, ''),
('24e0b9227740911657a7708317a50a0b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808237, ''),
('2522405fd4e122f059dae6bbaa5c6695', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019917, ''),
('2598a8c8a17f4adaad93b96fd4d81943', '89.168.204.27', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 1404844816, ''),
('267a3b89d074882d6db938dea301a106', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404732220, ''),
('26efbe7e41f25cea6f5e251fa10d468d', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404238051, ''),
('2745185018847187604a0000de53523f', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405435049, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:1:{i:1;a:15:{s:7:"item_id";s:3:"144";s:4:"line";i:1;s:4:"name";s:16:"F2V VANILLA 11mg";s:11:"item_number";s:6:"100432";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"3";s:8:"discount";s:1:"2";s:5:"price";s:4:"5.00";s:10:"base_price";s:4:"5.00";s:7:"overide";s:1:"1";s:4:"mode";s:8:"shopsale";s:7:"itemtax";s:4:"0.83";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('27c95356038d59d8f78abeb54b9de4b7', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396718290, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('28d3e069ab7b884898e9b73e427203d6', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726893, ''),
('2b164fbd2c90165d65c634aa14a7a619', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325125, ''),
('2bfa1434f8716e045b85a9ecbfddf80f', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808075, ''),
('2cadf9d5dc8ebcf3d95acf88aeced772', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019915, ''),
('2d838e3b78fc30bf673d63d474a6d0c5', '86.181.208.215', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404119705, ''),
('2d9d0034a8a115ff18cd6a16218a23a4', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325123, ''),
('2de7881eb2ebf3db5e2453656b4f0533', '188.29.165.117', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403006414, ''),
('2e69b6a16d9d5d00de28d4afbd330ed6', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404841223, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:2:"10";s:6:"source";s:3:"POS";}'),
('2e92d5cfe25398457184e9ede7e4c1f7', '46.208.80.93', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1403873465, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"9";s:6:"source";s:3:"POS";}'),
('3089fcd1d2aee528d09878a157f03fb3', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 1401360846, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('3098d84018e3473ba64d703652db0cea', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808150, ''),
('309f0718d95e6a983529784a9200cf5c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726812, ''),
('309fa4805deac42e6beef5d5a56d226d', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079600, ''),
('31944b6f06fde52509ccd8822b47b412', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726905, ''),
('3201ab94638f5e7fba2cf970ab623074', '103.247.50.131', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405418917, 'a:14:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('32c1806410d88e712673274b6a007c7e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404982274, ''),
('32f7a61289558e2a60edb3d3421a5033', '86.166.62.148', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405169777, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"4";s:9:"shop_name";s:6:"Morley";s:4:"code";s:7:"LS7 9BG";s:6:"street";s:15:"2 Windsor Court";s:4:"city";s:5:"Leeds";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:2:"10";s:6:"source";s:3:"POS";}'),
('34c887e0e7ee5e35af02dc9abdaf3203', '103.247.50.163', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396705154, 'a:12:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:13:"shop_address1";s:12:"Otley Road, ";s:13:"shop_address2";s:12:"Headingley, ";s:13:"shop_address3";s:13:"Leeds LS6 2AL";s:12:"shop_contact";s:11:"01138950074";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('3639ba265ddecbd69c32e3f5da571786', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410683, ''),
('36e5509c3b1ec0317ef477ed5ab43f61', '212.220.1.92', '0', 1396688424, ''),
('370f061894c71b39c1f39768946f2251', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405329353, ''),
('37911d3db3bdd579d08e86be9087a588', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079599, ''),
('37a0c78970e83a2d37d9372461c9b2a0', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1406007461, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('37b4010113e8800c008ba8e260baf356', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942801, ''),
('383aa33ca3f158fc591178311214fe2f', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.132 Safari/537.36', 1399037527, 'a:17:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:4:"cart";a:4:{i:1;a:11:{s:7:"item_id";s:2:"11";s:4:"line";i:1;s:4:"name";s:31:"ASPIRE BDC COIL or 3 for Â£10";s:11:"item_number";s:6:"100295";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:2;s:8:"discount";i:0;s:5:"price";s:4:"3.33";}i:2;a:11:{s:7:"item_id";s:3:"408";s:4:"line";i:2;s:4:"name";s:21:"CARTOMIZER CE4 purple";s:11:"item_number";s:6:"100698";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:2;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}i:3;a:11:{s:7:"item_id";s:1:"6";s:4:"line";i:3;s:4:"name";s:11:"CASE medium";s:11:"item_number";N;s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"6.67";}i:4;a:11:{s:7:"item_id";s:3:"410";s:4:"line";i:4;s:4:"name";s:19:"CARTOMIZER CE4 blue";s:11:"item_number";s:6:"100700";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('39293c489d6a64cb497e7d33aa252360', '188.29.165.117', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403006416, ''),
('3b415e7da95b66ab96309b9cdcc874b7', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1399631101, 'a:17:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:4:"cart";a:2:{i:1;a:11:{s:7:"item_id";s:3:"114";s:4:"line";i:1;s:4:"name";s:16:"F2V MENTHOL 24MG";s:11:"item_number";s:6:"100402";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}i:2;a:11:{s:7:"item_id";s:3:"100";s:4:"line";i:2;s:4:"name";s:18:"F2V RASPBERRY 11MG";s:11:"item_number";s:6:"100388";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('3d232a14573dc20c8b298caeca4908de', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405153819, ''),
('40b0649f0a2ff6c59e1b13fe9c0051b4', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0', 1406692647, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('4125763414f8e3473a0b1643b47b7dca', '37.152.35.210', '0', 1396624169, ''),
('4197bc808e0e893cc137fc952a0705bb', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404409967, ''),
('4212136372396d4f4de70a795400d8bd', '193.200.201.78', '0', 1396708281, ''),
('4284ef59ba5b27ec99ef387a95604a76', '217.41.2.190', 'Mozilla/4.0 (Windows 7 6.1) Java/1.7.0_60', 1404641608, ''),
('42f2aa3fa74ca3c6acb3f6f9385a9192', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396447617, 'a:5:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;}'),
('44eb5f5946becbd0594eb79cc36ff31e', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405360285, ''),
('454aaa0d36ef93077ef1368092836fee', '103.247.50.190', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396636287, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('45a0edc02fc588370b6ecab80f81ebb5', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808210, ''),
('45c5b3284428aa8ac128d5516e5f8608', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:29.0) Gecko/20100101 Firefox/29.0', 1403098417, ''),
('470d0bedf8d92d04c0ebee16a61f77b3', '193.239.15.205', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396562140, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"2";}'),
('489780dda8a7f9c7becb6947fd3408cc', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079642, ''),
('48fcc3cbd5012dad28688192dfa0cda5', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36', 1398335368, 'a:13:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('498a9fbda662e838565abca22c0f2df3', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404383245, ''),
('49bd63929549fc6002ac1c0b3e4340ce', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808075, ''),
('4ab40b4a464db418e1ec13b5cdbdcf33', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325129, ''),
('4c1555c1cee7384b79f72aa32d99a997', '188.29.165.107', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403526724, ''),
('4c532c625562fa7f2af0349a39f35db5', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405153821, ''),
('4cf1cbcd8c6964a40c378bd8e42e37a8', '123.231.18.118', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1396882086, 'a:8:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:13:"shop_address1";s:19:"16 Stonegate Road, ";s:13:"shop_address2";s:10:"Meanwood, ";s:13:"shop_address3";s:15:"Leeds , LS6 4HY";s:12:"shop_contact";s:11:"01138950077";s:9:"person_id";s:1:"1";}'),
('4d2ede2526923009d6b17d1202d4b402', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942803, ''),
('4d7a45c423e5d387219ff9563818d370', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079642, ''),
('4e68edbd10f89ebc91c4cecf85960c5b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405011893, ''),
('4ead47ee9b9195bb5bd4c2dd695b50f9', '123.231.123.74', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405432512, ''),
('4f61b20916bf14c791ed33fd4cda359e', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396636222, 'a:12:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:13:"shop_address1";s:19:"16 Stonegate Road, ";s:13:"shop_address2";s:10:"Meanwood, ";s:13:"shop_address3";s:15:"Leeds , LS6 4HY";s:12:"shop_contact";s:11:"01138950077";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"423";s:4:"line";i:1;s:4:"name";s:18:"KAMRY K1000 E-PIPE";s:11:"item_number";s:6:"100714";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:5:"37.50";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:1:{s:4:"Cash";a:2:{s:12:"payment_type";s:4:"Cash";s:14:"payment_amount";s:5:"45.00";}}}'),
('50a1ea51c4324e8b77bef611597bb5b4', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993275, ''),
('51d7ea179832937026d36e88e55c5c7b', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1398784192, 'a:13:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('528925602f9ebe98fb9e6c9d75ea6314', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404212164, ''),
('54f33f3bd471546b3001d20be17631b2', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1399449287, 'a:13:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('550dc3e9d1e3ece4c755593731d29245', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019916, ''),
('55347136539a53cee79b0d7a63534e77', '65.52.100.214', '0', 1405056491, ''),
('554d41389df7245a6d8cd08f5521cafa', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1398090606, 'a:11:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:1:"1";s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:1:"2";}'),
('55a5a97578536580cdc88b08211cbaff', '94.211.49.0', '0', 1396760359, ''),
('55cf5b5471fadcdc4304718b3df491cf', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404323832, ''),
('565f82c12481dac39667034996586ee0', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404839607, ''),
('57d5a9ec25242047d6c25e7ac9fc5bc4', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406225835, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:2:"24";}'),
('581b315642bb469c39634047e778acd0', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:29.0) Gecko/20100101 Firefox/29.0', 1402912341, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"5";s:6:"source";s:3:"POS";}'),
('584ecf68d9b9823f37e37fa21ba7adb0', '123.231.18.118', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404306278, ''),
('58b05bc7a74555df4a6821179d387446', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808151, ''),
('5a81996b56a66932cf2e6241574055cf', '92.40.248.105', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403185790, ''),
('5bd7db856a8cd6ff2d9c86beee1ce7cb', '103.246.39.212', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; MS-RTC LM 8; .NET ', 1403786557, ''),
('5d4695cd82a940219a00e3b06c5566a4', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410693, ''),
('5d533e1c2d9af0cfcf17ac9d926394d6', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079613, ''),
('5dae0fbcaf0c37583bd281f5bd010535', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406404456, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('5e216073a3976c831a50f8e11b1dc73d', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404719308, ''),
('5e7c9f47e703cab80e194ce6aa3752a7', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1398177065, 'a:11:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:1:"3";}'),
('5f49d5663669032800e33cde76a9c30a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993002, ''),
('6001ca458dedc0f9b2c371e90f72a04f', '149.254.49.246', '0', 1396664111, ''),
('6091d97e79806752614c2f157f7b1c80', '78.138.26.109', '0', 1396668478, ''),
('60d78cd628527af669c3c7c889d8460b', '65.52.100.214', '0', 1405045369, ''),
('60e799c9b38611c07097c51630263cb9', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942801, ''),
('633acec3388611df398bf174ad73ce9a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325125, ''),
('6347cee28dca7faea7f0bb78edf9fd5e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726833, ''),
('63543e23511e85abfa46b4989f9e0b14', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.132 Safari/537.36', 1400609155, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"419";s:4:"line";i:1;s:4:"name";s:31:"3400AMH 18650 BATTERY-panasonic";s:11:"item_number";s:6:"100710";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:5:"10.42";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:2:{i:1;a:10:{s:7:"item_id";s:3:"384";s:4:"line";i:1;s:4:"name";s:26:"ECHO KINGSIZE KIT rrP49.99";s:11:"description";s:0:"";s:12:"serialnumber";b:0;s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"1";s:8:"discount";s:1:"2";s:5:"price";s:5:"10.00";}i:2;a:10:{s:7:"item_id";s:3:"325";s:4:"line";i:2;s:4:"name";s:24:"V-USA PASSION FRUIT 18MG";s:11:"description";s:0:"";s:12:"serialnumber";b:0;s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"1";s:8:"discount";s:1:"0";s:5:"price";s:4:"1.75";}}s:9:"recv_mode";s:6:"return";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('63a32bb5d6e5994e877d5f8d470dedbb', '123.231.18.118', 'Mozilla/5.0 (X11; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0', 1404299896, 'a:14:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"5";s:9:"shop_name";s:9:"Test Shop";s:4:"code";s:0:"";s:6:"street";s:9:"Test Shop";s:4:"city";s:9:"Test Shop";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('63c04e751d78165c56cbdcb2f33000e2', '123.231.18.118', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1403784468, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"4";s:9:"shop_name";s:6:"Morley";s:4:"code";s:7:"LS7 9BG";s:6:"street";s:15:"2 Windsor Court";s:4:"city";s:5:"Leeds";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('64c3c4af1692056ff7e65c233f88575a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410683, ''),
('652f71e4348cb92b95b187dcaab02fbf', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403357044, ''),
('657cea5558d47504b54385377761374d', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404574338, ''),
('658b7dc9d5dd5f3c90dff8f2c93f1f32', '82.21.172.159', 'Mozilla/5.0 (compatible; Genieo/1.0 http://www.genieo.com/webfilter.html)', 1402772867, ''),
('66f5e414eb77ac8e58248c32acb31af7', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1397577745, ''),
('67d975cb515805be7575bb554151d900', '92.40.248.105', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403185786, ''),
('6802e67a1fea11d9e27cd5c79cf082f8', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079536, ''),
('6868f4def67075de396276e9f26b3839', '123.231.18.118', 'Mozilla/5.0 (X11; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0', 1404302901, 'a:14:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"5";s:9:"shop_name";s:9:"Test Shop";s:4:"code";s:0:"";s:6:"street";s:9:"Test Shop";s:4:"city";s:9:"Test Shop";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:1:"6";s:8:"cartRecv";a:1:{i:1;a:10:{s:7:"item_id";s:3:"505";s:4:"line";i:1;s:4:"name";s:13:"1100amh green";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"5.01";}}s:8:"supplier";i:-1;}'),
('690e35431a28c0e49a51f6165f17797c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325126, ''),
('6919a44d2b02d37a8e420b1ee182579b', '188.29.165.117', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403006416, ''),
('6922ac3baa04cc683a942ef4081842f8', '193.239.15.205', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B5', 1396686609, ''),
('6936b411679a563c6fb47b527c257f75', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1405013766, ''),
('695adad1a22029ff88127a2d9e4b683a', '92.239.224.206', '0', 1396664098, ''),
('6a151a8b93b8dba298ca1191bb2a4d45', '123.231.123.74', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405414927, ''),
('6a49c99060e6bc079e7bb929e5abb9e0', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405099490, ''),
('6bc0af9a5ae96b348fef3102ef718c8a', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404496184, ''),
('6c1fdf50ca45fd306421ef1eaffb8ca9', '197.200.94.229', 'Mozilla/4.0 compatible ZyBorg/1.0', 1396770181, ''),
('6d1e0e6a4b0da638ff2aeec270710d7a', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396555183, 'a:9:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('6d1ee52ffc6f9466296cc740b948bcb9', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.132 Safari/537.36', 1400658407, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"189";s:4:"line";i:1;s:4:"name";s:16:"F2V ANNISEED 0MG";s:11:"item_number";s:6:"100477";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";d:4.1699999999999999;}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;s:10:"store_type";s:8:"shopsale";}'),
('6d223936926a543f351521846a81ea37', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403878965, ''),
('6d3cadf487d17618da5508a40e9cdcbd', '86.159.49.164', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405322054, ''),
('6e5f508b3c249b6e3ae4cef68b26da1f', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808136, ''),
('6f9c4bdbddc6b2bcc32500297bc27191', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808169, ''),
('71fa0e6db4cc84a6456588608786bd86', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404323189, ''),
('735fe16d3d3730c23e7ae0a5e016fb61', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.116 Safari/537.36', 1398177094, 'a:17:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:1:"3";s:8:"supplier";i:-1;s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('747ba74685cffc32e615703b9c1b46e9', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404575783, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:2:"10";s:6:"source";s:3:"POS";}'),
('747eaf1691be42d31bb307a7f11c9ecc', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325127, ''),
('7490c265680c32eeea2d91acbdc80c38', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942802, ''),
('74f808fde150b2955ba05c7c9b9f6cde', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406114964, ''),
('758f9e40450e6b5237848de5ab4ea768', '123.231.18.118', 'Mozilla/5.0 (X11; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0', 1401708210, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('7a4bd398425c258075ae77b2668ebb2e', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1398712435, 'a:13:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('7a606bd46d84cee7944b6823413779d7', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808062, ''),
('7a7c882e0ac49e4ec4aa412b02367deb', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325127, ''),
('7c596710f0e3d328ef1a35452fb39b65', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1399967152, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"435";s:4:"line";i:1;s:4:"name";s:28:"efest 18650 2250 amh battery";s:11:"item_number";N;s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"3";s:8:"discount";s:1:"0";s:5:"price";s:4:"8.33";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('7d9e3936b4186f693137329885fd22cf', '92.40.248.105', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403185787, ''),
('7dda6dca0ab551e888756254a6917bab', '103.247.50.185', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405046246, ''),
('7e7e57e62507053945d811003d157dd8', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325128, ''),
('7f96af705c72a5701bf5180e7723fc0a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404988751, ''),
('7fd189962f32358fa0b0910b800dbe46', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726834, ''),
('801e9bcdbe84c967ea741ca8dafa1c8e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410684, ''),
('80343a1d98bd948d4d6ebdca4b047c06', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942800, ''),
('8041c27c605d6b1844d61d5c18d9ea08', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808237, ''),
('80796502487817f410943d13330321c7', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993004, ''),
('819575f2568470f60a80d6edd6060f51', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405165577, ''),
('83c0c845d3441ed5a564d9db05958c57', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1399652432, 'a:18:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('83e7f87ba90672bd630105b7b6b13164', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808107, ''),
('84873eba001350764a8b3cb3d3f32140', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1396718317, ''),
('84a19a0b734ef6e52462e71c1ea70da1', '218.189.42.161', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1397292978, 'a:16:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";N;s:6:"street";N;s:4:"city";N;s:7:"country";N;s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:4:"cart";a:3:{i:1;a:11:{s:7:"item_id";s:3:"211";s:4:"line";i:1;s:4:"name";s:21:"F2V DARK USA MIX 11MG";s:11:"item_number";s:6:"100499";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}i:2;a:11:{s:7:"item_id";s:3:"410";s:4:"line";i:2;s:4:"name";s:19:"CARTOMIZER CE4 blue";s:11:"item_number";s:6:"100700";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}i:3;a:11:{s:7:"item_id";s:3:"418";s:4:"line";i:3;s:4:"name";s:40:"2600AMH 18650 BATTERY- SAMSUNG SD1 18650";s:11:"item_number";s:6:"100709";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"7.50";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:2:{s:4:"Cash";a:2:{s:12:"payment_type";s:4:"Cash";s:14:"payment_amount";d:29.010000000000001563194018672220408916473388671875;}s:10:"Debit Card";a:2:{s:12:"payment_type";s:10:"Debit Card";s:14:"payment_amount";s:6:"-10.00";}}s:8:"cartRecv";a:1:{i:1;a:10:{s:7:"item_id";s:3:"421";s:4:"line";i:1;s:4:"name";s:20:"EVOD PURPLE (kanger)";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"2.15";}}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;}'),
('860d89d0e9f87daebb1fc050e86a42f3', '103.246.39.212', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; MS-RTC LM 8; .NET ', 1403786222, ''),
('875a1a73f0eea320fa6124c81175ae22', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993276, ''),
('8968c89def70796e16d2dd1651022b56', '188.29.165.107', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403526722, ''),
('89be6ef86436c2cf7f1bc5aa1d47c709', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404641608, ''),
('8a2643537d7818539216e296af7add59', '86.181.208.215', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404145158, ''),
('8a2dd93c3b07e3424edf46cd59812ec6', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404658112, ''),
('8ae8c9d59487d42b78a430b3bd148ab5', '188.29.165.117', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403006414, ''),
('8aec11a0b0d719a7c88aeec3cf39e4f0', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808076, ''),
('8b367de3fdc471ea9afe1ee9ba0a1aa6', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405434028, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:2:"10";s:6:"source";s:3:"POS";}'),
('8c7f874cb0bd19a8fab923013d699ab8', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993004, ''),
('8d167ac4769221be0d5c6a9fd883e7b8', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019915, ''),
('8db785d223ce402a742332008660e780', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726893, ''),
('8e59672ea32d704a8329fe98514e1fa2', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808135, ''),
('8ee9e72fed7211466239150767ed66c9', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/537.75.14', 1396719177, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";}'),
('90d100176b547c03da964c9454c8ac33', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726799, ''),
('916612a060b21beabb9083a61dd2fed6', '103.247.51.82', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1404103878, ''),
('93b502bd754d207ab7245cfe3bfad5d3', '87.117.197.26', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1405424054, ''),
('94fb0408253204baf1a51bfbb6920395', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396881184, 'a:15:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:13:"shop_address1";s:19:"16 Stonegate Road, ";s:13:"shop_address2";s:10:"Meanwood, ";s:13:"shop_address3";s:15:"Leeds , LS6 4HY";s:12:"shop_contact";s:11:"01138950077";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"249";s:4:"line";i:1;s:4:"name";s:31:"V-USA BANANOLATE MILKSHAKE 18MG";s:11:"item_number";s:6:"100538";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"5.00";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:1:{i:1;a:10:{s:7:"item_id";s:3:"420";s:4:"line";i:1;s:4:"name";s:19:"EVOD GREEN (kanger)";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"2.15";}}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;}'),
('952a026a8b4b8877b8d4591fa2d8ab4e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079613, ''),
('95cb6421b3470677e58a6dfba37dc191', '83.137.2.154', '0', 1396691399, '');
INSERT INTO `cofeeapp_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('96060574bf5d518325f084d37eb95826', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1400698889, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:1:"2";s:8:"supplier";i:-1;s:10:"store_type";s:8:"shopsale";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"386";s:4:"line";i:1;s:4:"name";s:44:"ECHO KINGSIZE MENTHOL REFILLS TIPS PACK OF 5";s:11:"item_number";N;s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"1";s:8:"discount";s:1:"0";s:5:"price";s:4:"10.5";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('9623ce38b3124e302ebf6a8220bc96c4', '82.21.172.159', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1404568837, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"4";s:9:"shop_name";s:6:"Morley";s:4:"code";s:7:"LS7 9BG";s:6:"street";s:15:"2 Windsor Court";s:4:"city";s:5:"Leeds";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('973bb4d00b7204fcdb4f0592748dd2aa', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1396718741, 'a:12:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:13:"shop_address1";s:19:"16 Stonegate Road, ";s:13:"shop_address2";s:10:"Meanwood, ";s:13:"shop_address3";s:15:"Leeds , LS6 4HY";s:12:"shop_contact";s:11:"01138950077";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('9870c5eb65fc025b5362d4b1791585a1', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079600, ''),
('989a6dd1348b1d9b7df51ade5ae5bd15', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808061, ''),
('99768187d1dc1473657fde2f97a4ca5c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404289865, ''),
('9abe07eefbe812c07c77c25be1ed3cd5', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079598, ''),
('9af8f3253fc9bf20f5d29b789eec470b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404289866, ''),
('9b9c5310c0aeb5d0f567472d5165fda4', '123.231.18.118', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404131057, ''),
('9ba16d83fbd7b25027a8923f1d7dc279', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019917, ''),
('9bc6062373381b8650d57376d7df149e', '123.231.18.118', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1404121155, ''),
('9c44943730f230db0513f38c5bdfa118', '92.40.248.105', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403185788, ''),
('9cf97ff51b0300d0e8d99e398f5c42c6', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1398712212, 'a:9:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";}'),
('9f3a66c366c179f1fa2ba4d9f6951ee2', '92.40.248.105', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403185789, ''),
('9fabe3867349ee08d19593665c7b5dce', '80.47.17.167', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 1396533506, 'a:6:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:2:"10";s:4:"line";i:1;s:4:"name";s:20:"650AMH BLING-DIAMOND";s:11:"item_number";s:6:"100293";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:5:"11.67";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('9fcc5c863965df5c2cff1f1f350a807e', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1397535911, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:9:"recv_mode";s:6:"return";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:14:"store_transfer";s:8:"Meanwood";}'),
('a0aa4eb44c36dd0b5809ba6897de89cb', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 1401967511, 'a:2:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"5";}'),
('a0dcc650d5b1ca5f08dcc64d9bbc5588', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410685, ''),
('a18e1d3ffad50dd8a58621eb215771ee', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405433951, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:8:"OL15 8DA";s:6:"street";s:16:"35 Church Street";s:4:"city";s:13:"Littleborough";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:1:"5";s:6:"source";s:3:"POS";}'),
('a25238855064a42107574d88877a4177', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726853, ''),
('a389ce3cdde3388889afa0355596bacd', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404985716, ''),
('a3ab3b1f4a6ef9d845b4b9208c3e4d20', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410693, ''),
('a4750a383443eb3912f3d80876132c7c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808137, ''),
('a4f2a3cf1fb8207f8dd60eff762cab4b', '86.97.68.145', '0', 1396694506, ''),
('a60e2938def5de15d42cd732a5358ec6', '193.239.15.205', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396697501, 'a:5:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"2";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;}'),
('a6f50561be91339c5f52aab9297ef874', '123.231.18.118', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.76 Safari/537.36', 1404301947, 'a:14:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"6";s:9:"shop_name";s:11:"Test 2 Shop";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:9:"recv_mode";s:8:"transfer";s:14:"store_transfer";s:1:"5";s:8:"cartRecv";a:0:{}s:8:"supplier";i:-1;}'),
('a833fcf57ba253ffd6c69b83a8da36da', '103.247.50.185', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405044223, ''),
('aa6a79730d42f59b4f02adec5712641e', '81.149.40.11', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404316382, ''),
('aa7f68eeb75fc6cf877304f74e9bc89b', '61.245.163.24', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1403785809, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"5";s:9:"shop_name";s:9:"Test Shop";s:4:"code";s:0:"";s:6:"street";s:9:"Test Shop";s:4:"city";s:9:"Test Shop";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:1:"2";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('ab6c89578b9844f9218244fa4a8324f3', '188.29.165.107', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403526723, ''),
('ac34e42d2136318533f6885e22dc49a1', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1398770175, ''),
('adeb14293f44ba821c4f728a1ecee00c', '31.205.91.19', '0', 1396816318, ''),
('adf273b409b3605f32f93a27e9557f18', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993005, ''),
('adfea673ed08fd011d63782a7c548c7c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0', 1401697235, 'a:14:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:1:"5";s:6:"source";s:3:"POS";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('ae02db67af9647fe451528f51120cb77', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942803, ''),
('aecabe1d4e4a7f2a4a659b06d7658e2a', '89.102.187.141', '0', 1396628540, ''),
('af2df18d9e01e8cdbd6f6913e25462d0', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/537.36', 1400673201, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('af752000f6b267a796ffc4e4312b405b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079646, ''),
('b059e398931d907e2079ac39fcd402d4', '91.252.42.89', '0', 1396774939, ''),
('b0814490ce71b77e139615040aecdd55', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079535, ''),
('b23afa71c06134a946a2af1bb1957e25', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808236, ''),
('b36b29f58a32944c3c50eaf27c0fb517', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396623616, 'a:12:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:4:"cart";a:1:{i:1;a:11:{s:7:"item_id";s:3:"100";s:4:"line";i:1;s:4:"name";s:18:"F2V RASPBERRY 11MG";s:11:"item_number";s:6:"100388";s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";i:1;s:8:"discount";i:0;s:5:"price";s:4:"4.17";}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:1:{s:4:"Cash";a:2:{s:12:"payment_type";s:4:"Cash";s:14:"payment_amount";s:4:"5.00";}}s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:13:"shop_address1";s:12:"Otley Road, ";s:13:"shop_address2";s:12:"Headingley, ";s:13:"shop_address3";s:13:"Leeds LS6 2AL";s:12:"shop_contact";s:11:"01138950074";}'),
('b4d85b47c366ad28450d41e7b0b42dcc', '103.246.39.212', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; InfoPath.1; .NET CLR 2.0.50727; .NET CLR 1.1.4322; MS-RTC LM 8; .NET ', 1403786231, ''),
('b5f34ddbdf5e5316f7e5b113d178a8aa', '92.40.248.105', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403185788, ''),
('b6732ce046137899adfe9064a05b2892', '82.21.172.159', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1403897005, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"5";s:9:"shop_name";s:9:"Test Shop";s:4:"code";s:0:"";s:6:"street";s:9:"Test Shop";s:4:"city";s:9:"Test Shop";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('b6b6279c76d846f80669b2acf8d9b0f5', '217.41.2.190', 'Mozilla/4.0 (Windows 7 6.1) Java/1.7.0_60', 1405331668, ''),
('b90f2a6513c9cb5a9ab410c8655791e9', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404468871, ''),
('b94f09b724ac8630fcd1ec28d4946111', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808135, ''),
('ba0b2b2da001604131b7ff2a0cbd29fb', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808211, ''),
('bae048c57d4bd3ac9241f1c194e5a50d', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404819153, ''),
('baeb182803cee48a7287f4ef34b5332c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410686, ''),
('bb324de453eef8318fe80e3a8623bf9a', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1405522703, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:10:"store_type";s:8:"shopsale";}'),
('bb8766e3a2a926f6434c3844d52f0d3b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079599, ''),
('bc7d9bf4a47211c4e01635238dd2a02c', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403971659, ''),
('bd9c0b5e2a699aaec68571a74f2913b7', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410684, ''),
('bf4c3faac4d9d78d3e8835483c568811', '61.245.163.42', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1403878314, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"2";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:1:{i:1;a:13:{s:7:"item_id";s:1:"6";s:4:"line";i:1;s:4:"name";s:11:"CASE medium";s:11:"item_number";N;s:11:"description";s:0:"";s:12:"serialnumber";s:0:"";s:21:"allow_alt_description";s:1:"0";s:13:"is_serialized";s:1:"0";s:8:"quantity";s:1:"1";s:8:"discount";s:1:"0";s:5:"price";s:2:"10";s:10:"base_price";s:4:"8.00";s:7:"overide";b:1;}}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('bfd6b439f3aaf0c935f2af1e86851564', '82.21.172.159', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:30.0) Gecko/20100101 Firefox/30.0', 1404061740, ''),
('c0022a9ddc5944bb877b779ed55031da', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404375132, ''),
('c037f1b91495bb65b36b8f081bbe4f36', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1396428524, 'a:5:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;}'),
('c0d2149625bb22684bed81f7cb44b29e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410681, ''),
('c1796f0dc5e1ec3914a860ec675d8144', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396461222, 'a:6:{s:9:"user_data";s:0:"";s:9:"person_id";s:1:"1";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('c42a58a115f7586d4c3e82856e1e35db', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410682, ''),
('c465f03b048ade04eec19b1552d8000a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404375132, ''),
('c48289a6d0c733118b6d91663f376da9', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405263291, ''),
('c5018a0d98ec7b94c58fc287eb2a7190', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019915, ''),
('c557b3186576c3767a13f5aa7e784cb1', '86.166.62.148', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405168997, ''),
('c66e7e02c58be2900ae87a566194cab8', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325123, ''),
('c6afe646fb557c5800f4ba50b67798b8', '94.166.218.84', '0', 1396704520, ''),
('c6d8d27b8fadff3159afa10c7032a5c7', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993275, ''),
('c72bc5c8bb7d25655d8333a5b6d0a75a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808134, ''),
('c8866d556e9af2775694df6f0352dd48', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405153819, ''),
('c8e7a69e4866113f1ab8ffaab0f18f4d', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993003, ''),
('c9d4b9339cf1798931db5dcf51fa014b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404547284, ''),
('caeb9d39759d488e34e1908fc1006974', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942804, ''),
('cd92be23c55a320e7b76013d9a115a21', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404632104, ''),
('cdc726779f06dfcf8db569764d3c1d36', '217.40.95.145', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:28.0) Gecko/20100101 Firefox/28.0', 1396881644, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:13:"shop_address1";s:19:"16 Stonegate Road, ";s:13:"shop_address2";s:10:"Meanwood, ";s:13:"shop_address3";s:15:"Leeds , LS6 4HY";s:12:"shop_contact";s:11:"01138950077";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:8:"supplier";i:-1;s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('cdfe2caf0a5c9be91046817f35070089', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1398332370, 'a:11:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:8:"supplier";i:-1;}'),
('ce2bedc4305662f583aad14a0e853512', '193.239.15.205', 'SiteSucker/2.5.1', 1396479400, ''),
('cfed961022d10a4f08cb43aa7e66324e', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1399025702, 'a:17:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('d38c8b220fbcf94b2052bbac4eb54875', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 1401174164, ''),
('d40f340fba6d8f14ee39eb184b483af5', '188.29.165.107', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403526721, ''),
('d43f25c6854f1b1afabace2e4f154538', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405410683, ''),
('d62fc35bfcd79cd0b0bf1ed4bae65148', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403942802, ''),
('d649471621e8ca3d84e77b4629cf3a0e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726853, ''),
('da684a4f05bdefe8c5653d7f84bdfd9f', '87.212.230.54', '0', 1396724066, ''),
('dc2acb3c0ade4eeb5c011efba7a068fe', '109.156.33.243', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405080306, ''),
('dcd61e607fe836aba1ede3fc3523780e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726798, ''),
('dd7d000f0ac60583b53e672b92db4467', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405153820, ''),
('de6bd9a688321f120bc003dd41881e1b', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993002, ''),
('dec7ad44b2f2c796f4133bd7854f4229', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808236, ''),
('e03a58398ce04797043ca558188f6bbd', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404928402, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"7";s:6:"source";s:3:"POS";}'),
('e159dc0b1df1d608b412f175a71021a6', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1397577745, ''),
('e35268bbdafd5f746f09f803772be26a', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405015103, ''),
('e378054c23ab53de27d5b4059d5cfa35', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404982274, ''),
('e4cd97c20e4822b06ac6c46471c8d6d6', '103.247.48.33', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:30.0) Gecko/20100101 Firefox/30.0', 1404930463, ''),
('e583596dd44ac7419c4b27e235dbe7d9', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993274, ''),
('e6e0aeeddc904471d21d4cf42b37d826', '65.52.100.214', '0', 1405045369, ''),
('e70c3fa2e28bc26611a9af997f9e722c', '80.44.246.216', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:24.0) Gecko/20100101 Firefox/24.0', 1401996323, ''),
('e8481c827e37b9070cf0de629477b404', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1399100325, ''),
('e848f1069450e5f0a4a9b99a2a86af8c', '65.52.100.214', '0', 1405056490, ''),
('e8b1f187b300b544bf2d6e668c1908eb', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404051757, ''),
('e8b9669b30d82887a889b5377e40cb6f', '109.145.65.26', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:26.0) Gecko/20100101 Firefox/26.0', 1405097425, 'a:19:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"5";s:9:"shop_name";s:9:"Test Shop";s:4:"code";s:0:"";s:6:"street";s:9:"Test Shop";s:4:"city";s:9:"Test Shop";s:7:"country";s:7:"England";s:11:"contact_num";s:0:"";s:9:"person_id";s:2:"20";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('e906d96e6467aea75882fef2d189869e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726906, ''),
('e91feda0b63c154452be53b1a0f2effa', '123.231.18.118', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36', 1396623752, ''),
('e9929cc14c63c2bcf2a7d68ab1c8d468', '193.239.15.205', 'Mozilla/5.0 (iPhone; CPU iPhone OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B5', 1396563667, ''),
('ea39c145dec7b40822e4882e04266efb', '103.247.48.171', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1404965395, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"3";s:9:"shop_name";s:13:"Littleborough";s:4:"code";s:8:"OL15 8DA";s:6:"street";s:16:"35 Church Street";s:4:"city";s:13:"Littleborough";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01706485001";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('eadfee0d82611f4601d76c4c63ecf906', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:32.0) Gecko/20100101 Firefox/32.0', 1414087493, 'a:3:{s:9:"user_data";s:0:"";s:9:"person_id";s:2:"24";s:7:"shop_id";s:7:"SHOP001";}'),
('ecda9c821c8835f01f9e225b7b65090e', '103.247.51.82', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1404104670, ''),
('ed7ebdb5e6b3d931b4e1113571ec8971', '86.159.49.164', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405426675, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"4";s:9:"shop_name";s:6:"Morley";s:4:"code";s:7:"LS7 9BG";s:6:"street";s:15:"2 Windsor Court";s:4:"city";s:5:"Leeds";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"6";s:6:"source";s:3:"POS";}'),
('ee6c46938c19d8923881d50747530c0c', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405325128, ''),
('eed91e3397a5103228579a137d253d71', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403019916, ''),
('efa1c436d2996139b526a177fb95b46e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404726812, ''),
('f08ab9a10b31ee1d39ef0ea9e9b3e84e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808107, ''),
('f20ebc919f394133c98793da6a031871', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808077, ''),
('f28ebf273f1c7c5236a5f72909985b3b', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36', 1406185173, ''),
('f30e7661a4aec3c855761e41b7a406f2', '103.247.48.171', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36', 1404966135, ''),
('f3a504ebb2d568bb94fdc12f0c58a612', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1402993276, ''),
('f4ef8d22bfee8c97509dcfbc9fbcedef', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404718537, ''),
('f5adc2d6e8ea3c8136fc1a4a83a1aa5e', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079646, ''),
('f681ca9f084646ca53f5a5c43a60eda9', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404289866, ''),
('f6cec4c1a8cb1647af2916a083bb5b1a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404719309, ''),
('f79e01703f586b5c13a880863edaa39a', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404808169, ''),
('f8bef5c3fce8e7ef87b9fa8e230c71bb', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1398770181, 'a:17:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"1";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}s:8:"cartRecv";a:0:{}s:9:"recv_mode";s:7:"receive";s:14:"store_transfer";s:14:"store_transfer";s:8:"supplier";i:-1;}'),
('fa8f7403e5cf27cda5683fe34857a921', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1405331668, ''),
('fabe23767234f8593f2ed49b71898b7c', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1400657883, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('fb165f3aabba8244c18e1b1ef0ed3f3a', '86.139.43.190', '0', 1396692765, ''),
('fbb28c73cfe18814cc6ebd684b2797cb', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:29.0) Gecko/20100101 Firefox/29.0', 1402579103, 'a:15:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"2";s:9:"shop_name";s:10:"Headingley";s:4:"code";s:4:"8000";s:6:"street";s:10:"headingely";s:4:"city";s:9:"headigley";s:7:"country";s:2:"UK";s:11:"contact_num";s:11:"01138950074";s:9:"person_id";s:1:"5";s:6:"source";s:3:"POS";s:10:"store_type";s:8:"shopsale";s:4:"cart";a:0:{}s:9:"sale_mode";s:4:"sale";s:8:"customer";i:-1;s:8:"payments";a:0:{}}'),
('fbe87a64a92e6c79f61dbd5b3e942ff6', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403885338, ''),
('fc226418e941d1a0308d0eb66567a333', '186.212.70.200', '0', 1396626938, ''),
('fca3a59a669833711c98d4f8537d0314', '217.41.2.190', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1403079598, ''),
('fcaeaf08735d446f4b25540bec8db731', '127.0.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.114 Safari/537.36', 1401337933, 'a:10:{s:9:"user_data";s:0:"";s:7:"shop_id";s:1:"1";s:9:"shop_name";s:8:"Meanwood";s:4:"code";s:0:"";s:6:"street";s:0:"";s:4:"city";s:0:"";s:7:"country";s:0:"";s:11:"contact_num";s:11:"01138950077";s:9:"person_id";s:1:"1";s:6:"source";s:3:"POS";}'),
('fd2a7e725e5cad9da254c0b1594ffa12', '127.0.0.1', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:29.0) Gecko/20100101 Firefox/29.0', 1400698363, ''),
('fd4230142ab0fe985dd2474012eeafcf', '103.247.50.158', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0', 1397292165, ''),
('fdab0f70521f3b1737c7fe4623e009e1', '213.123.190.205', 'Mozilla/5.0 (Windows NT 6.1; rv:30.0) Gecko/20100101 Firefox/30.0', 1404645757, '');

-- --------------------------------------------------------

--
-- Table structure for table `cofeeapp_user_locations`
--

CREATE TABLE IF NOT EXISTS `cofeeapp_user_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `location_id` varchar(15) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `cofeeapp_user_locations`
--

INSERT INTO `cofeeapp_user_locations` (`id`, `user_id`, `location_id`) VALUES
(1, 24, 'SHOP001'),
(2, 24, 'SHOP002');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cofeeapp_employees`
--
ALTER TABLE `cofeeapp_employees`
  ADD CONSTRAINT `cofeeapp_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `cofeeapp_people` (`person_id`);

--
-- Constraints for table `cofeeapp_items`
--
ALTER TABLE `cofeeapp_items`
  ADD CONSTRAINT `cofeeapp_items_ibfk_1` FOREIGN KEY (`location`) REFERENCES `cofeeapp_locations` (`shop_code`);

--
-- Constraints for table `cofeeapp_location_categories`
--
ALTER TABLE `cofeeapp_location_categories`
  ADD CONSTRAINT `cofeeapp_location_categories_ibfk_1` FOREIGN KEY (`location`) REFERENCES `cofeeapp_locations` (`shop_code`);

--
-- Constraints for table `cofeeapp_member_subscription`
--
ALTER TABLE `cofeeapp_member_subscription`
  ADD CONSTRAINT `cofeeapp_member_subscription_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `cofeeapp_member` (`id`),
  ADD CONSTRAINT `cofeeapp_member_subscription_ibfk_2` FOREIGN KEY (`plan_id`) REFERENCES `cofeeapp_plan` (`plan_id`),
  ADD CONSTRAINT `cofeeapp_member_subscription_ibfk_4` FOREIGN KEY (`item_code`) REFERENCES `cofeeapp_plan_items` (`item_code`);

--
-- Constraints for table `cofeeapp_plan`
--
ALTER TABLE `cofeeapp_plan`
  ADD CONSTRAINT `cofeeapp_plan_ibfk_1` FOREIGN KEY (`location`) REFERENCES `cofeeapp_locations` (`shop_code`);

--
-- Constraints for table `cofeeapp_plan_items`
--
ALTER TABLE `cofeeapp_plan_items`
  ADD CONSTRAINT `cofeeapp_plan_items_ibfk_2` FOREIGN KEY (`item_code`) REFERENCES `cofeeapp_items` (`item_code`),
  ADD CONSTRAINT `cofeeapp_plan_items_ibfk_3` FOREIGN KEY (`plan_id`) REFERENCES `cofeeapp_plan` (`plan_id`);

--
-- Constraints for table `cofeeapp_user_locations`
--
ALTER TABLE `cofeeapp_user_locations`
  ADD CONSTRAINT `cofeeapp_user_locations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `cofeeapp_people` (`person_id`),
  ADD CONSTRAINT `cofeeapp_user_locations_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `cofeeapp_locations` (`shop_code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
