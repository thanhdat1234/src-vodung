-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.37 - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for a-thien
CREATE DATABASE IF NOT EXISTS `a-thien` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `a-thien`;

-- Dumping structure for table a-thien.cms_canreturn
CREATE TABLE IF NOT EXISTS `cms_canreturn` (
  `store_id` int(5) NOT NULL,
  `order_id` int(10) NOT NULL DEFAULT '0',
  `input_id` int(10) NOT NULL DEFAULT '0',
  `product_id` int(10) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`store_id`,`order_id`,`input_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_canreturn: ~4 rows (approximately)
/*!40000 ALTER TABLE `cms_canreturn` DISABLE KEYS */;
INSERT INTO `cms_canreturn` (`store_id`, `order_id`, `input_id`, `product_id`, `price`, `quantity`, `user_init`, `user_upd`, `created`, `updated`) VALUES
	(6, 0, 1, 1, 2500000, 100, 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, 0, 2, 2, 125000, 10, 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, 1, 0, 1, 3490000, 10, 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(6, 2, 0, 2, 199000, 1, 1, NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cms_canreturn` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_customers
CREATE TABLE IF NOT EXISTS `cms_customers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(255) NOT NULL,
  `customer_code` varchar(10) NOT NULL,
  `customer_phone` varchar(20) NOT NULL,
  `customer_email` varchar(150) NOT NULL,
  `customer_addr` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `customer_birthday` date NOT NULL,
  `customer_gender` tinyint(1) NOT NULL,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_customers: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_customers` DISABLE KEYS */;
INSERT INTO `cms_customers` (`ID`, `customer_name`, `customer_code`, `customer_phone`, `customer_email`, `customer_addr`, `notes`, `customer_birthday`, `customer_gender`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(2, 'Khách mua lẻ', 'KH000001', '0868896944', 'khachle@posbasic.net', 'Q1 HCM', '', '1969-12-31', 0, '2018-06-12 03:32:32', '2018-06-12 10:32:32', 1, 1),
	(3, 'Khách lẻ', 'KH000002', '', '', '', '', '1970-01-01', 0, '2018-06-12 02:52:44', '0000-00-00 00:00:00', 1, 0);
/*!40000 ALTER TABLE `cms_customers` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_input
CREATE TABLE IF NOT EXISTS `cms_input` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `input_code` varchar(9) NOT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `order_id` int(10) NOT NULL DEFAULT '0',
  `input_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `total_price` int(13) NOT NULL,
  `total_origin_price_return` int(13) NOT NULL DEFAULT '0',
  `total_quantity` int(9) NOT NULL,
  `discount` int(11) NOT NULL,
  `total_money` int(13) NOT NULL,
  `payed` int(11) NOT NULL,
  `lack` int(13) NOT NULL,
  `detail_input` text NOT NULL,
  `input_status` tinyint(1) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `canreturn` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table a-thien.cms_input: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_input` DISABLE KEYS */;
INSERT INTO `cms_input` (`ID`, `input_code`, `supplier_id`, `store_id`, `order_id`, `input_date`, `notes`, `payment_method`, `total_price`, `total_origin_price_return`, `total_quantity`, `discount`, `total_money`, `payed`, `lack`, `detail_input`, `input_status`, `created`, `updated`, `user_init`, `user_upd`, `deleted`, `canreturn`) VALUES
	(1, 'PN0000001', 1, 6, 0, '2018-02-28 16:46:57', '', 1, 250000000, 0, 100, 0, 250000000, 0, 250000000, '[{"id":"1","quantity":"100","price":"2500000"}]', 1, '2018-02-28 09:46:57', '0000-00-00 00:00:00', 1, 0, 0, 1),
	(2, 'PN0000002', 2, 6, 0, '2018-06-12 09:52:27', '', 3, 1250000, 0, 10, 0, 1250000, 250000, 1000000, '[{"id":"2","quantity":"10","price":"125000"}]', 1, '2018-06-12 02:52:27', '0000-00-00 00:00:00', 1, 0, 0, 1);
/*!40000 ALTER TABLE `cms_input` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_inventory
CREATE TABLE IF NOT EXISTS `cms_inventory` (
  `store_id` int(5) NOT NULL,
  `product_id` int(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`store_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_inventory: ~19 rows (approximately)
/*!40000 ALTER TABLE `cms_inventory` DISABLE KEYS */;
INSERT INTO `cms_inventory` (`store_id`, `product_id`, `quantity`, `user_init`, `user_upd`, `created`, `updated`) VALUES
	(6, 1, 90, 1, 1, '2018-02-28 09:48:53', '2018-02-28 16:48:53'),
	(6, 2, 7, 1, 1, '2018-06-12 02:53:15', '2018-06-12 09:53:15'),
	(6, 3, 1, 1, NULL, '2022-03-29 04:39:17', '0000-00-00 00:00:00'),
	(6, 4, 1, 1, NULL, '2022-03-29 04:42:34', '0000-00-00 00:00:00'),
	(6, 5, 1, 1, NULL, '2022-03-29 04:44:43', '0000-00-00 00:00:00'),
	(6, 6, 0, 1, NULL, '2022-03-29 04:48:43', '0000-00-00 00:00:00'),
	(6, 7, 1, 1, NULL, '2022-03-29 04:50:15', '0000-00-00 00:00:00'),
	(6, 8, 1, 1, NULL, '2022-03-29 04:51:25', '0000-00-00 00:00:00'),
	(6, 9, 1, 1, NULL, '2022-03-29 04:53:43', '0000-00-00 00:00:00'),
	(6, 10, 1, 1, NULL, '2022-03-29 04:56:19', '0000-00-00 00:00:00'),
	(6, 12, 111, 1, NULL, '2022-04-11 14:19:19', '0000-00-00 00:00:00'),
	(6, 13, 111, 1, NULL, '2022-04-11 15:07:11', '0000-00-00 00:00:00'),
	(6, 14, 10, 1, NULL, '2022-04-16 09:00:39', '0000-00-00 00:00:00'),
	(6, 15, 10, 1, NULL, '2022-04-16 09:08:48', '0000-00-00 00:00:00'),
	(6, 16, 1, 1, NULL, '2022-04-16 19:49:42', '0000-00-00 00:00:00'),
	(6, 17, 1, 1, NULL, '2022-04-16 19:49:50', '0000-00-00 00:00:00'),
	(6, 18, 1, 1, NULL, '2022-04-16 19:51:11', '0000-00-00 00:00:00'),
	(6, 19, 1, 1, NULL, '2022-04-16 19:51:21', '0000-00-00 00:00:00'),
	(8, 11, 123, 1, NULL, '2022-04-06 14:32:15', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cms_inventory` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_orders
CREATE TABLE IF NOT EXISTS `cms_orders` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `output_code` varchar(9) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `input_id` int(10) NOT NULL DEFAULT '0',
  `sell_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `total_price` int(13) NOT NULL,
  `total_origin_price` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `customer_pay` int(11) NOT NULL,
  `vat` int(3) NOT NULL DEFAULT '0',
  `total_money` int(13) NOT NULL,
  `total_quantity` int(9) NOT NULL,
  `lack` int(13) NOT NULL,
  `detail_order` text NOT NULL,
  `order_status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  `sale_id` int(5) NOT NULL DEFAULT '0',
  `canreturn` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_orders: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_orders` DISABLE KEYS */;
INSERT INTO `cms_orders` (`ID`, `output_code`, `customer_id`, `store_id`, `input_id`, `sell_date`, `notes`, `payment_method`, `total_price`, `total_origin_price`, `coupon`, `customer_pay`, `vat`, `total_money`, `total_quantity`, `lack`, `detail_order`, `order_status`, `deleted`, `created`, `updated`, `user_init`, `user_upd`, `sale_id`, `canreturn`) VALUES
	(1, 'PX0000001', 2, 6, 0, '2018-02-28 16:48:53', '                                                            ', 1, 34900000, 25000000, 0, 34900000, 0, 34900000, 10, 0, '[{"id":"1","quantity":"10","price":"3490000","discount":"0"}]', 1, 0, '2018-02-28 09:48:53', '0000-00-00 00:00:00', 1, 0, 1, 1),
	(2, 'PX0000002', 3, 6, 0, '2018-06-12 09:52:56', '                                    ', 1, 597000, 375000, 0, 597000, 0, 597000, 3, 0, '[{"id":"2","quantity":"3","price":"199000","discount":"0"}]', 1, 0, '2018-06-12 02:53:15', '2018-06-12 09:53:15', 1, 0, 1, 1);
/*!40000 ALTER TABLE `cms_orders` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_payment
CREATE TABLE IF NOT EXISTS `cms_payment` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `input_id` int(10) NOT NULL DEFAULT '0',
  `payment_code` varchar(9) NOT NULL,
  `type_id` tinyint(1) NOT NULL,
  `store_id` int(11) NOT NULL,
  `payment_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `total_money` int(13) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_payment: ~3 rows (approximately)
/*!40000 ALTER TABLE `cms_payment` DISABLE KEYS */;
INSERT INTO `cms_payment` (`ID`, `input_id`, `payment_code`, `type_id`, `store_id`, `payment_date`, `notes`, `payment_method`, `total_money`, `deleted`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(1, 1, 'PC0000001', 2, 6, '2018-02-28 16:46:57', '', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
	(2, 2, 'PC0000002', 2, 6, '2018-06-12 09:52:27', '', 3, 250000, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0),
	(3, 0, 'PC0000003', 6, 6, '2018-06-12 10:00:13', 'trả tiền cho khách', 1, 50000, 0, '2018-06-12 03:00:13', '0000-00-00 00:00:00', 1, 0);
/*!40000 ALTER TABLE `cms_payment` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_permissions
CREATE TABLE IF NOT EXISTS `cms_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_url` varchar(255) NOT NULL,
  `permission_name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_permissions: ~19 rows (approximately)
/*!40000 ALTER TABLE `cms_permissions` DISABLE KEYS */;
INSERT INTO `cms_permissions` (`id`, `permission_url`, `permission_name`) VALUES
	(1, 'backend/dashboard', 'Tổng quan'),
	(2, 'backend/order', 'Đơn hàng'),
	(3, 'backend/product', 'Hàng Hóa'),
	(4, 'backend/customer', 'Khách hàng'),
	(5, 'backend/import', 'Nhập kho'),
	(6, 'backend/transfer', 'Chuyển kho'),
	(7, 'backend/inventory', 'Tồn kho'),
	(8, 'backend/revenue', 'Doanh số'),
	(9, '', 'Phiếu thu'),
	(10, 'backend/profit', 'Lợi nhuận'),
	(11, 'backend/config', 'Thiết lập'),
	(12, '', 'Sửa đơn hàng'),
	(13, '', 'Xóa đơn hàng'),
	(14, '', 'Tạo đơn hàng'),
	(15, '', 'Sửa phiếu nhập'),
	(16, '', 'Xóa phiếu nhập'),
	(17, '', 'Tạo phiếu nhập'),
	(18, '', 'phiếu chi'),
	(19, '', 'Pos');
/*!40000 ALTER TABLE `cms_permissions` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_products
CREATE TABLE IF NOT EXISTS `cms_products` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prd_code` varchar(15) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `prd_sls` int(11) NOT NULL,
  `prd_origin_price` int(11) NOT NULL,
  `prd_sell_price` int(11) NOT NULL,
  `prd_status` tinyint(1) NOT NULL DEFAULT '1',
  `prd_inventory` tinyint(1) NOT NULL,
  `prd_allownegative` tinyint(1) NOT NULL,
  `prd_edit_price` tinyint(1) NOT NULL DEFAULT '1',
  `prd_manufacture_id` int(11) NOT NULL,
  `prd_unit_id` int(11) NOT NULL DEFAULT '0',
  `prd_group_id` int(11) NOT NULL,
  `prd_image_url` text,
  `prd_descriptions` text NOT NULL,
  `prd_hot` tinyint(1) NOT NULL,
  `prd_new` tinyint(1) NOT NULL,
  `prd_highlight` tinyint(1) NOT NULL,
  `display_website` tinyint(1) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_products: ~19 rows (approximately)
/*!40000 ALTER TABLE `cms_products` DISABLE KEYS */;
INSERT INTO `cms_products` (`ID`, `prd_code`, `prd_name`, `prd_sls`, `prd_origin_price`, `prd_sell_price`, `prd_status`, `prd_inventory`, `prd_allownegative`, `prd_edit_price`, `prd_manufacture_id`, `prd_unit_id`, `prd_group_id`, `prd_image_url`, `prd_descriptions`, `prd_hot`, `prd_new`, `prd_highlight`, `display_website`, `created`, `updated`, `user_init`, `user_upd`, `deleted`) VALUES
	(1, 'SP00001', 'Samsung Galaxy J3 Pro', 90, 2500000, 3490000, 1, 1, 1, 1, 3, 21, 7, '', '', 0, 0, 0, 0, '2018-02-28 09:48:53', '2018-02-28 16:48:53', 1, 0, 0),
	(2, 'SP00002', 'Nước hoa chanel', 7, 125000, 199000, 1, 0, 0, 1, 4, 22, 12, '1528771886.jpg', '', 0, 0, 0, 0, '2018-06-12 02:53:15', '2018-06-12 09:53:15', 1, 0, 0),
	(3, 'SP00003', 'Dell vostro 2421', 1, 4000000, 4800000, 1, 0, 0, 1, 5, 23, 13, '', '<p>Dell Vostro 2421 i3-2375M/ Ram 4GB/ SSD 120 GB/ M&agrave;n 14 inch</p>', 0, 0, 0, 0, '2022-03-29 04:40:02', '2022-03-29 04:40:02', 1, 1, 0),
	(4, 'SP00004', 'Dell Vostro 1014', 1, 2000000, 2500000, 1, 0, 0, 1, 5, 23, 13, '1648528942.jpg', '<p>Dell Vostro 2421 i3-2375M/ Ram 4GB/ SSD 120 GB/ M&agrave;n 14 inch</p>', 0, 0, 0, 0, '2022-03-29 04:42:34', '0000-00-00 00:00:00', 1, 0, 0),
	(5, 'SP00005', 'HP probook 440 G4', 1, 7000000, 7500000, 1, 1, 1, 1, 9, 23, 13, '1648529059.jpg', '<p>HP ProBook 440G4 / I3 - 7100U / 4GB RAM / SSD 120GB / M&agrave;n 14inch</p>', 0, 0, 0, 0, '2022-03-29 04:44:43', '0000-00-00 00:00:00', 1, 0, 0),
	(6, 'SP00006', 'HP probook 430 G3', 0, 4000000, 6800000, 1, 1, 1, 1, 9, 23, 13, '1648529312.jpg', '<p>HP ProBook 430G3 / I3 - 6100U / 4 GB RAM / M&agrave;n 14 inch</p>', 0, 0, 0, 0, '2022-03-29 04:48:43', '0000-00-00 00:00:00', 1, 0, 0),
	(7, 'SP00007', 'HP ProBook 430G2', 1, 4000000, 6000000, 1, 0, 0, 1, 9, 23, 13, '1648529396.jpg', '<p>HP ProBook 430G2 / I3 - 5010U / 4GB RAM / 120GB SSD / M&agrave;n 14inch</p>', 0, 0, 0, 0, '2022-03-29 04:50:15', '0000-00-00 00:00:00', 1, 0, 0),
	(8, 'SP00008', 'LENOVO G40', 1, 4000000, 4300000, 1, 0, 0, 1, 7, 23, 13, '1648529481.jpg', '<p>LENOVO G40 PENTIUM - N3540 / 4GB RAM / SSD 120GB / M&Agrave;N 14INCH</p>', 0, 0, 0, 0, '2022-03-29 04:51:25', '0000-00-00 00:00:00', 1, 0, 0),
	(9, 'SP00009', 'Asus S451LA', 1, 4000000, 6500000, 1, 1, 1, 1, 6, 20, 13, '', '<p>Asus S451LA/ I5 - 4210U/ Ram 4Gb/ HDD 500Gb / M&agrave;n 14inch</p>', 0, 0, 0, 0, '2022-03-29 04:54:49', '2022-03-29 04:54:49', 1, 1, 0),
	(10, 'SP00010', 'Asus X542UQR', 1, 4000000, 8000000, 1, 1, 1, 1, 6, 23, 13, '1648529771.jpg', '<p>Asus X542UQR I5 - 8250U / Ram 4Gb / Card 940MX / HDD 1Tb</p>', 0, 0, 0, 0, '2022-03-29 04:56:19', '0000-00-00 00:00:00', 1, 0, 0),
	(11, 'abcabc', 'Test sản phẩm', 123, 123, 1234, 0, 1, 1, 1, 1, 20, 7, '', '', 0, 0, 0, 0, '2022-04-11 14:17:19', '2022-04-11 14:17:19', 1, 1, 1),
	(12, '11', 'Test sản phẩm - copy', 111, 1111, 1111, 1, 0, 0, 1, 1, 23, 7, '16496867530.png,16496867531.jpg', '', 0, 0, 0, 0, '2022-04-11 14:40:22', '2022-04-11 14:40:22', 1, 0, 1),
	(13, 'SP00011', 'Test sản phẩm - copy', 111, 111, 11, 1, 0, 0, 1, 1, 20, 7, '16496896300.png', '', 0, 0, 0, 0, '2022-04-16 16:32:55', '2022-04-16 16:32:55', 1, 1, 1),
	(14, 'SP00012', 'Test sản phẩm - copy', 10, 10, 10, 1, 0, 0, 1, 1, 20, 7, '', '', 0, 0, 0, 0, '2022-04-16 16:32:52', '2022-04-16 16:32:52', 1, 0, 1),
	(15, 'ABC', 'Sản phẩm test 1', 10, 1000000, 1200000, 1, 0, 0, 1, 5, 20, 13, '16501122070.jpg', '', 0, 0, 0, 0, '2022-04-16 16:32:49', '2022-04-16 16:32:49', 1, 1, 1),
	(16, 'SP00013', 'Dell vostro 2421', 1, 4000000, 0, 1, 1, 1, 1, 5, 23, 13, '', '', 0, 0, 0, 0, '2022-04-16 19:52:05', '2022-04-16 19:52:05', 1, 0, 1),
	(17, 'SP00014', 'Dell vostro 2421', 1, 4000000, 0, 1, 1, 1, 1, 5, 23, 13, '', '', 0, 0, 0, 0, '2022-04-16 19:50:34', '2022-04-16 19:50:34', 1, 0, 1),
	(18, 'SP00015', 'Dell vostro 2421', 1, 4000000, 0, 1, 0, 0, 1, 5, 23, 13, '', '', 0, 0, 0, 0, '2022-04-16 19:52:02', '2022-04-16 19:52:02', 1, 0, 1),
	(19, 'SP00016', 'Dell vostro 2421', 1, 4000000, 0, 1, 0, 0, 1, 5, 23, 13, '16501386800.jpg,', '', 0, 0, 0, 0, '2022-04-16 19:51:21', '0000-00-00 00:00:00', 1, 0, 0);
/*!40000 ALTER TABLE `cms_products` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_products_config
CREATE TABLE IF NOT EXISTS `cms_products_config` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `prd_config_name` varchar(255) NOT NULL,
  `prd_config_value` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_init` int(11) NOT NULL,
  `user_update` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_products_config: ~10 rows (approximately)
/*!40000 ALTER TABLE `cms_products_config` DISABLE KEYS */;
INSERT INTO `cms_products_config` (`ID`, `prd_config_name`, `prd_config_value`, `product_id`, `user_init`, `user_update`, `created_at`, `updated`) VALUES
	(2, 'Câú Hình', 'Màn 5 inch', 0, 1, 1, '2022-04-11 22:06:47', '2022-04-12 01:25:55'),
	(3, 'Ram', '32GB', 0, 1, 1, '2022-04-11 22:15:34', '2022-04-12 01:25:36'),
	(4, 'CPU', 'i5', 0, 1, NULL, '2022-04-12 01:26:07', '2022-04-11 18:26:07'),
	(5, 'CPu', 'i7', 0, 1, NULL, '2022-04-14 00:23:18', '2022-04-13 17:23:18'),
	(6, 'CPU', '1', 0, 1, NULL, '2022-04-14 00:24:07', '2022-04-13 17:24:07'),
	(7, 'Ram', '16Gb', 13, 1, 1, '2022-04-16 08:59:36', '2022-04-16 08:59:36'),
	(9, 'Ram', '16GB', 14, 1, NULL, '2022-04-16 09:00:39', '2022-04-16 09:00:39'),
	(10, 'Màn ', '5inch', 14, 1, NULL, '2022-04-16 09:00:39', '2022-04-16 09:00:39'),
	(11, 'CPU', 'I7', 14, 1, NULL, '2022-04-16 09:00:39', '2022-04-16 09:00:39'),
	(12, 'CPU', 'i5', 15, 1, 1, '2022-04-16 09:08:48', '2022-04-16 09:08:48');
/*!40000 ALTER TABLE `cms_products_config` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_products_group
CREATE TABLE IF NOT EXISTS `cms_products_group` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prd_group_name` varchar(255) NOT NULL,
  `parentid` int(11) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` tinyint(4) NOT NULL,
  `user_upd` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_products_group: ~11 rows (approximately)
/*!40000 ALTER TABLE `cms_products_group` DISABLE KEYS */;
INSERT INTO `cms_products_group` (`ID`, `prd_group_name`, `parentid`, `level`, `lft`, `rgt`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(2, 'Iphone', 0, 0, 0, 1, '2022-04-17 16:32:51', '2022-04-17 16:32:51', 1, 0),
	(3, 'PHONE', 0, 0, 2, 3, '2022-04-17 16:32:51', '2022-04-17 16:32:51', 1, 0),
	(4, 'KAKDD', 0, 0, 4, 5, '2022-04-17 16:32:51', '2022-04-17 16:32:51', 1, 0),
	(5, 'DDDD', 0, 0, 6, 7, '2022-04-17 16:32:51', '2022-04-17 16:32:51', 1, 0),
	(6, '1', 0, 0, 8, 9, '2022-04-17 16:32:51', '2022-04-17 16:32:51', 1, 0),
	(7, 'Điện thoại', -1, 0, 0, 0, '2018-02-28 09:31:16', '0000-00-00 00:00:00', 1, 0),
	(9, 'Tablet', -1, 0, 0, 0, '2018-02-28 09:40:25', '0000-00-00 00:00:00', 1, 0),
	(11, 'Phụ kiện', -1, 0, 0, 0, '2018-02-28 09:43:51', '0000-00-00 00:00:00', 1, 0),
	(12, 'Nước hoa', -1, 0, 0, 0, '2018-06-12 02:50:55', '0000-00-00 00:00:00', 1, 0),
	(13, 'LAPTOP', -1, 0, 0, 0, '2022-03-29 11:36:01', '0000-00-00 00:00:00', 1, 0),
	(14, 'abcd', 7, 1, 0, 0, '2022-04-06 21:46:18', '0000-00-00 00:00:00', 1, 0);
/*!40000 ALTER TABLE `cms_products_group` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_products_manufacture
CREATE TABLE IF NOT EXISTS `cms_products_manufacture` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prd_manuf_name` varchar(255) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table a-thien.cms_products_manufacture: ~11 rows (approximately)
/*!40000 ALTER TABLE `cms_products_manufacture` DISABLE KEYS */;
INSERT INTO `cms_products_manufacture` (`ID`, `prd_manuf_name`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(1, 'iphone', '2018-02-28 09:44:05', '0000-00-00 00:00:00', 1, 0),
	(2, 'Nokia', '2018-02-28 09:44:13', '0000-00-00 00:00:00', 1, 0),
	(3, 'Samsung', '2018-02-28 09:44:19', '0000-00-00 00:00:00', 1, 0),
	(4, 'Chanel', '2018-06-12 02:51:07', '0000-00-00 00:00:00', 1, 0),
	(5, 'DELL', '2022-03-29 11:36:16', '0000-00-00 00:00:00', 1, 0),
	(6, 'ASUS', '2022-03-29 11:36:30', '0000-00-00 00:00:00', 1, 0),
	(7, 'LENOVO', '2022-03-29 11:36:40', '0000-00-00 00:00:00', 1, 0),
	(8, 'ACER', '2022-03-29 11:36:45', '0000-00-00 00:00:00', 1, 0),
	(9, 'HP', '2022-03-29 11:36:49', '0000-00-00 00:00:00', 1, 0),
	(10, 'SONY', '2022-03-29 11:36:59', '0000-00-00 00:00:00', 1, 0),
	(11, 'APPLE', '2022-03-29 11:37:19', '0000-00-00 00:00:00', 1, 0);
/*!40000 ALTER TABLE `cms_products_manufacture` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_products_unit
CREATE TABLE IF NOT EXISTS `cms_products_unit` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prd_unit_name` varchar(255) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Dumping data for table a-thien.cms_products_unit: ~3 rows (approximately)
/*!40000 ALTER TABLE `cms_products_unit` DISABLE KEYS */;
INSERT INTO `cms_products_unit` (`ID`, `prd_unit_name`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(20, 'Thùng', '2018-02-28 09:11:59', '0000-00-00 00:00:00', 1, 0),
	(21, 'Cái', '2018-02-28 09:43:23', '0000-00-00 00:00:00', 1, 0),
	(23, 'Máy', '2022-03-29 11:33:04', '0000-00-00 00:00:00', 1, 0);
/*!40000 ALTER TABLE `cms_products_unit` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_product_options
CREATE TABLE IF NOT EXISTS `cms_product_options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table a-thien.cms_product_options: ~0 rows (approximately)
/*!40000 ALTER TABLE `cms_product_options` DISABLE KEYS */;
INSERT INTO `cms_product_options` (`id`, `title`, `code`, `order`, `created_at`, `updated_at`) VALUES
	(1, 'Model', 'model', 0, '2022-04-17 22:48:37', '2022-04-17 22:48:39'),
	(2, 'Main', 'main', 1, '2022-04-17 22:48:33', '2022-04-17 22:48:35'),
	(3, 'CPU', 'cpu', 2, '2022-04-17 22:49:00', '2022-04-17 22:49:01'),
	(4, 'Ram', 'ram', 3, '2022-04-17 22:49:17', '2022-04-17 22:49:17'),
	(5, 'Ổ Cứng', 'o-cung', 4, '2022-04-17 22:49:23', '2022-04-17 22:49:23'),
	(6, 'Màn Hình', 'man-hinh', 5, '2022-04-17 22:50:01', '2022-04-17 22:50:02'),
	(7, 'Vỏ Máy', 'vo-may', 6, '2022-04-17 22:50:09', '2022-04-17 22:50:08');
/*!40000 ALTER TABLE `cms_product_options` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_product_option_vlaue
CREATE TABLE IF NOT EXISTS `cms_product_option_vlaue` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table a-thien.cms_product_option_vlaue: ~0 rows (approximately)
/*!40000 ALTER TABLE `cms_product_option_vlaue` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_product_option_vlaue` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_receipt
CREATE TABLE IF NOT EXISTS `cms_receipt` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT '0',
  `receipt_code` varchar(9) NOT NULL,
  `type_id` tinyint(1) NOT NULL,
  `store_id` int(11) NOT NULL,
  `receipt_date` datetime NOT NULL,
  `notes` varchar(255) NOT NULL,
  `receipt_method` tinyint(4) NOT NULL,
  `total_money` int(13) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_receipt: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_receipt` DISABLE KEYS */;
INSERT INTO `cms_receipt` (`ID`, `order_id`, `receipt_code`, `type_id`, `store_id`, `receipt_date`, `notes`, `receipt_method`, `total_money`, `deleted`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(1, 1, 'PT0000001', 3, 6, '2018-02-28 16:48:53', '                                                            ', 1, 34900000, 0, '2018-02-28 09:48:53', '0000-00-00 00:00:00', 1, 0),
	(2, 2, 'PT0000002', 3, 6, '2018-06-12 09:52:56', '                                    ', 1, 597000, 0, '2018-06-12 02:53:15', '2018-06-12 02:53:15', 1, 1);
/*!40000 ALTER TABLE `cms_receipt` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_report
CREATE TABLE IF NOT EXISTS `cms_report` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_code` varchar(9) NOT NULL,
  `transaction_id` int(10) NOT NULL DEFAULT '0',
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(5) NOT NULL,
  `date` datetime DEFAULT '0000-00-00 00:00:00',
  `notes` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `discount` int(11) NOT NULL DEFAULT '0',
  `total_money` int(13) NOT NULL DEFAULT '0',
  `origin_price` int(11) NOT NULL DEFAULT '0',
  `input` int(11) NOT NULL DEFAULT '0',
  `output` int(9) NOT NULL DEFAULT '0',
  `price` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  `sale_id` int(5) NOT NULL DEFAULT '0',
  `supplier_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_report: ~24 rows (approximately)
/*!40000 ALTER TABLE `cms_report` DISABLE KEYS */;
INSERT INTO `cms_report` (`ID`, `transaction_code`, `transaction_id`, `customer_id`, `store_id`, `date`, `notes`, `product_id`, `discount`, `total_money`, `origin_price`, `input`, `output`, `price`, `deleted`, `created`, `updated`, `user_init`, `user_upd`, `sale_id`, `supplier_id`, `type`, `stock`) VALUES
	(1, 'SP00001', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 1, 0, 0, 0, 0, 0, 0, 0, '2018-02-28 09:45:36', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 0),
	(2, 'PN0000001', 1, 0, 6, '2018-02-28 16:46:57', '', 1, 0, 250000000, 0, 100, 0, 2500000, 0, '2018-02-28 09:46:57', '0000-00-00 00:00:00', 1, 0, 0, 1, 2, 100),
	(3, 'PX0000001', 1, 2, 6, '2018-02-28 16:48:53', '                                                            ', 1, 0, 34900000, 25000000, 0, 10, 3490000, 0, '2018-02-28 09:48:53', '0000-00-00 00:00:00', 1, 0, 1, 0, 3, 90),
	(4, 'SP00002', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 2, 0, 0, 0, 0, 0, 0, 0, '2018-06-12 02:51:33', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 0),
	(5, 'PN0000002', 2, 0, 6, '2018-06-12 09:52:27', '', 2, 0, 1250000, 0, 10, 0, 125000, 1, '2018-06-12 02:53:15', '2018-06-12 02:53:15', 1, 1, 0, 2, 2, 10),
	(6, 'PX0000002', 2, 3, 6, '2018-06-12 09:52:56', '                                    ', 2, 0, 199000, 125000, 0, 1, 199000, 1, '2018-06-12 02:53:15', '2018-06-12 02:53:15', 1, 1, 1, 0, 3, 9),
	(7, 'PX0000002', 2, 3, 6, '2018-06-12 09:52:56', '                                    ', 2, 0, 597000, 375000, 0, 3, 199000, 0, '2018-06-12 02:53:15', '0000-00-00 00:00:00', 1, 0, 1, 0, 3, 7),
	(8, 'SP00003', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 3, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:39:17', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(9, 'SP00004', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 4, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:42:34', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(10, 'SP00005', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 5, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:44:43', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(11, 'SP00006', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 6, 0, 0, 0, 0, 0, 0, 0, '2022-03-29 04:48:43', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 0),
	(12, 'SP00007', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 7, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:50:15', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(13, 'SP00008', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 8, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:51:25', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(14, 'SP00009', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 9, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:53:43', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(15, 'SP00010', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 10, 0, 0, 0, 1, 0, 0, 0, '2022-03-29 04:56:19', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(16, 'abcabc', 0, 0, 8, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 11, 0, 0, 0, 123, 0, 0, 0, '2022-04-06 14:32:15', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 123),
	(17, '11', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 12, 0, 0, 0, 111, 0, 0, 0, '2022-04-11 14:19:19', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 111),
	(18, 'SP00011', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 13, 0, 0, 0, 111, 0, 0, 0, '2022-04-11 15:07:11', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 111),
	(19, 'SP00012', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 14, 0, 0, 0, 10, 0, 0, 0, '2022-04-16 09:00:39', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 10),
	(20, 'ABC', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 15, 0, 0, 0, 10, 0, 0, 0, '2022-04-16 09:08:48', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 10),
	(21, 'SP00013', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 16, 0, 0, 0, 1, 0, 0, 0, '2022-04-16 19:49:42', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(22, 'SP00014', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 17, 0, 0, 0, 1, 0, 0, 0, '2022-04-16 19:49:50', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(23, 'SP00015', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 18, 0, 0, 0, 1, 0, 0, 0, '2022-04-16 19:51:11', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1),
	(24, 'SP00016', 0, 0, 6, '0000-00-00 00:00:00', 'Khai báo hàng hóa', 19, 0, 0, 0, 1, 0, 0, 0, '2022-04-16 19:51:21', '0000-00-00 00:00:00', 1, 0, 0, 0, 1, 1);
/*!40000 ALTER TABLE `cms_report` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_stores
CREATE TABLE IF NOT EXISTS `cms_stores` (
  `ID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `store_image` varchar(100) DEFAULT NULL,
  `store_name` varchar(255) NOT NULL,
  `store_manager` varchar(50) DEFAULT NULL,
  `store_phone` varchar(30) DEFAULT NULL,
  `store_address` varchar(200) DEFAULT NULL,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_stores: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_stores` DISABLE KEYS */;
INSERT INTO `cms_stores` (`ID`, `store_image`, `store_name`, `store_manager`, `store_phone`, `store_address`, `user_init`, `user_upd`, `created`, `updated`) VALUES
	(6, NULL, 'Cửa hàng số 1', NULL, NULL, NULL, 1, 1, '2018-06-12 02:43:43', '2018-06-12 09:43:43'),
	(8, NULL, 'Cửa hàng số 2', NULL, NULL, NULL, 1, 0, '2018-06-12 02:43:53', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `cms_stores` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_suppliers
CREATE TABLE IF NOT EXISTS `cms_suppliers` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `supplier_code` varchar(10) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `supplier_phone` varchar(30) NOT NULL,
  `supplier_email` varchar(150) NOT NULL,
  `supplier_addr` varchar(255) NOT NULL,
  `tax_code` varchar(255) NOT NULL,
  `notes` text NOT NULL,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_suppliers: ~2 rows (approximately)
/*!40000 ALTER TABLE `cms_suppliers` DISABLE KEYS */;
INSERT INTO `cms_suppliers` (`ID`, `supplier_code`, `supplier_name`, `supplier_phone`, `supplier_email`, `supplier_addr`, `tax_code`, `notes`, `created`, `updated`, `user_init`, `user_upd`) VALUES
	(1, 'NCC00001', 'NCC Mặc Định', '0868896944', 'ncc@posbasic.net', 'Q1, HCM', '', '', '2018-02-28 16:46:40', '2018-06-12 03:33:12', 1, 1),
	(2, 'NCC00002', 'Chanel', '0868896944', '', '', '', '', '2018-06-12 09:52:04', '0000-00-00 00:00:00', 1, 0);
/*!40000 ALTER TABLE `cms_suppliers` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_templates
CREATE TABLE IF NOT EXISTS `cms_templates` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `type` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `content` text CHARACTER SET utf8 NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `user_upd` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table a-thien.cms_templates: ~4 rows (approximately)
/*!40000 ALTER TABLE `cms_templates` DISABLE KEYS */;
INSERT INTO `cms_templates` (`id`, `type`, `name`, `content`, `created`, `updated`, `user_upd`) VALUES
	(1, 1, 'Hóa đơn bán hàng (Pos)', '<table style="width:100%">\n	<tbody>\n		<tr>\n			<td>Mỹ Phẩm POSBASIC</td>\n		</tr>\n		<tr>\n			<td>Địa chỉ: 210 L&ecirc; Hồng Phong, P. L&yacute; Thường Kiệt, TP. Hồ Ch&iacute; Minh</td>\n		</tr>\n		<tr>\n			<td>Điện thoại: 08 68896944,&nbsp;Mở cửa: 08:00 - 21:00 h&agrave;ng ng&agrave;y</td>\n		</tr>\n	</tbody>\n</table>\n\n<div style="text-align:center"><strong>H&Oacute;A ĐƠN B&Aacute;N H&Agrave;NG</strong><br />\n<strong>{Ma_Don_Hang}</strong></div>\n\n<div>\n<p><strong>Ng&agrave;y b&aacute;n:</strong> {Ngay_Xuat}<br />\n<strong>Kh&aacute;ch h&agrave;ng:</strong> {Khach_Hang}<br />\n<strong>Địa Chỉ:</strong> {DC_Khach_Hang}<br />\n<strong>ĐT: </strong>{DT_Khach_Hang}</p>\n</div>\n\n<div>{Chi_Tiet_San_Pham}</div>\n\n<div>&nbsp;</div>\n\n<table style="width:100%">\n	<tbody>\n		<tr>\n			<td style="text-align:right">Tổng tiền h&agrave;ng:</td>\n			<td style="text-align:right">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Giảm gi&aacute;:</td>\n			<td style="text-align:right">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Đặt cọc</td>\n			<td style="text-align:right">{Khach_Dua}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Tổng thanh to&aacute;n:</td>\n			<td style="text-align:right"><strong>{Con_No}</strong></td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Tổng c&ocirc;ng nợ</td>\n			<td style="text-align:right">{Cong_No}</td>\n		</tr>\n	</tbody>\n</table>\n\n<p style="text-align:center">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\n\n<p>Ghi ch&uacute;: Qu&yacute; kh&aacute;ch kiểm tra đơn h&agrave;ng trước khi ra khỏi cửa h&agrave;ng.</p>\n\n<p style="text-align:right">&nbsp;<strong>NGƯỜI B&Aacute;N H&Agrave;NG</strong></p>\n\n<p style="text-align:right">&nbsp;</p>\n\n<p style="text-align:right"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {Thu_Ngan}</strong></p>\n', NULL, '2018-06-12 10:31:33', 1),
	(2, 2, 'Hóa đơn bán hàng (order)', '<table style="width:100%">\n	<tbody>\n		<tr>\n			<td>Mỹ Phẩm POSBASIC</td>\n		</tr>\n		<tr>\n			<td>Địa chỉ: 210 L&ecirc; Hồng Phong, P. L&yacute; Thường Kiệt, TP. Hồ Ch&iacute; Minh</td>\n		</tr>\n		<tr>\n			<td>Điện thoại: 08 68896944</td>\n		</tr>\n	</tbody>\n</table>\n\n<div style="text-align:center"><strong>H&Oacute;A ĐƠN B&Aacute;N H&Agrave;NG</strong><br />\n<strong>{Ma_Don_Hang}</strong></div>\n\n<div><strong>Ng&agrave;y b&aacute;n:</strong> {Ngay_Xuat}</div>\n\n<div><strong>Kh&aacute;ch h&agrave;ng:</strong> {Khach_Hang}</div>\n\n<div><strong>Thu ng&acirc;n:</strong> {Thu_Ngan}</div>\n\n<p>&nbsp;</p>\n\n<table style="width:100%">\n	<tbody>\n		<tr>\n			<td style="width:35%"><strong>Đơn gi&aacute;</strong></td>\n			<td style="text-align:center; width:30%"><strong>SL</strong></td>\n			<td style="text-align:right"><strong>TT</strong></td>\n		</tr>\n		<tr>\n			<td colspan="3">{Ten_Hang_Hoa}</td>\n		</tr>\n		<tr>\n			<td>{Don_Gia}</td>\n			<td style="text-align:center">{So_Luong}</td>\n			<td style="text-align:right">{Thanh_Tien}</td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<table style="width:100%">\n	<tbody>\n		<tr>\n			<td style="text-align:right">Tổng tiền h&agrave;ng:</td>\n			<td style="text-align:right">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Giảm gi&aacute;:</td>\n			<td style="text-align:right">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Th&agrave;nh tiền:</td>\n			<td style="text-align:right">{Tong_Tien}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Kh&aacute;ch đưa</td>\n			<td style="text-align:right">{Khach_Dua}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Tổng thanh to&aacute;n:</td>\n			<td style="text-align:right"><strong>{Con_No}</strong></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p style="text-align:left">Ghi ch&uacute;: {Ghi_Chu}</p>\n\n<div style="text-align:left">Xin cảm ơn v&agrave; hẹn gặp lại!</div>\n', NULL, '2018-06-12 09:48:34', 1),
	(3, 3, 'Hóa đơn phiếu nhập', '<table style="width:100%">\n	<tbody>\n		<tr>\n			<td>Mỹ Phẩm POSBASIC</td>\n		</tr>\n		<tr>\n			<td>Địa chỉ: 210 L&ecirc; Hồng Phong, P. L&yacute; Thường Kiệt, TP. Hồ Ch&iacute; Minh</td>\n		</tr>\n		<tr>\n			<td>Điện thoại: 08 68896944</td>\n		</tr>\n	</tbody>\n</table>\n\n<div style="text-align:center"><strong>H&Oacute;A ĐƠN NHẬP H&Agrave;NG</strong><br />\n<strong>{Ma_Phieu_Nhap}</strong></div>\n\n<div><strong>Ng&agrave;y nhập:</strong> {Ngay_Nhập}</div>\n\n<div><strong>Nh&agrave; cung cấp:</strong> {Nha_Cung_Cap}</div>\n\n<div><strong>Người nhập:</strong> {Thu_Ngan}</div>\n\n<div>&nbsp;</div>\n\n<p>{Chi_Tiet_San_Pham}</p>\n\n<table style="width:100%">\n	<tbody>\n		<tr>\n			<td style="text-align:right">Tổng tiền h&agrave;ng:</td>\n			<td style="text-align:right">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Giảm gi&aacute;:</td>\n			<td style="text-align:right">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Th&agrave;nh tiền:</td>\n			<td style="text-align:right">{Tong_Tien}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Thanh to&aacute;n</td>\n			<td style="text-align:right">{Tra_Tien}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">C&ograve;n nợ:</td>\n			<td style="text-align:right"><strong>{Con_No}</strong></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>Số tiền bằng chữ: {So_Tien_Bang_Chu}</p>\n\n<p>Ghi ch&uacute;: vui l&ograve;ng lấy h&oacute;a đơn</p>\n\n<div style="text-align:left">Xin cảm ơn v&agrave; hẹn gặp lại!</div>\n', NULL, '2018-06-12 09:48:54', 1),
	(4, 4, 'Phiếu chuyển kho', '<table style="width:100%">\n	<tbody>\n		<tr>\n			<td>Mỹ Phẩm POSBASIC</td>\n		</tr>\n		<tr>\n			<td>Địa chỉ: 210 L&ecirc; Hồng Phong, P. L&yacute; Thường Kiệt, TP. Hồ Ch&iacute; Minh</td>\n		</tr>\n		<tr>\n			<td>Điện thoại: 08 68896944</td>\n		</tr>\n	</tbody>\n</table>\n\n<div style="text-align:center"><strong>H&Oacute;A ĐƠN B&Aacute;N H&Agrave;NG</strong><br />\n<strong>{Ma_Don_Hang}</strong></div>\n\n<div>\n<p><strong>Ng&agrave;y b&aacute;n:</strong> {Ngay_Xuat}<br />\n<strong>Kh&aacute;ch h&agrave;ng:</strong> {Khach_Hang}<br />\n<strong>Địa Chỉ:</strong> {DC_Khach_Hang}<br />\n<strong>ĐT: </strong>{DT_Khach_Hang}</p>\n</div>\n\n<div>{Chi_Tiet_San_Pham}</div>\n\n<div>&nbsp;</div>\n\n<table style="width:100%">\n	<tbody>\n		<tr>\n			<td style="text-align:right">Tổng tiền h&agrave;ng:</td>\n			<td style="text-align:right">{Tong_Tien_Hang}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Giảm gi&aacute;:</td>\n			<td style="text-align:right">{Chiec_Khau}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Đặt cọc</td>\n			<td style="text-align:right">{Khach_Dua}</td>\n		</tr>\n		<tr>\n			<td style="text-align:right">Tổng thanh to&aacute;n:</td>\n			<td style="text-align:right"><strong>{Con_No}</strong></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style="text-align:center">Số tiền bằng chữ: {So_Tien_Bang_Chu}&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\n\n<p style="text-align:right">&nbsp;<strong>NGƯỜI B&Aacute;N H&Agrave;NG</strong></p>\n\n<p style="text-align:right">&nbsp;</p>\n\n<p style="text-align:right"><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</strong></p>\n', NULL, '2018-06-12 09:49:14', 1);
/*!40000 ALTER TABLE `cms_templates` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_transfer
CREATE TABLE IF NOT EXISTS `cms_transfer` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transfer_code` varchar(9) NOT NULL,
  `from_store` int(11) NOT NULL,
  `to_store` int(11) NOT NULL,
  `notes` varchar(255) NOT NULL,
  `total_quantity` int(9) NOT NULL,
  `detail_transfer` text NOT NULL,
  `transfer_status` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_init` int(11) NOT NULL,
  `user_upd` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_transfer: ~0 rows (approximately)
/*!40000 ALTER TABLE `cms_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_transfer` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_users
CREATE TABLE IF NOT EXISTS `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(255) NOT NULL,
  `email` varchar(120) NOT NULL,
  `display_name` varchar(120) NOT NULL,
  `user_status` tinyint(4) NOT NULL DEFAULT '1',
  `group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `logined` datetime(1) DEFAULT NULL,
  `ip_logged` varchar(255) DEFAULT '1',
  `recode` varchar(255) DEFAULT NULL,
  `code_time_out` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_users: ~3 rows (approximately)
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;
INSERT INTO `cms_users` (`id`, `username`, `password`, `salt`, `email`, `display_name`, `user_status`, `group_id`, `store_id`, `created`, `updated`, `logined`, `ip_logged`, `recode`, `code_time_out`) VALUES
	(1, 'posbasic', 'acafabfb3b45089f905b5c8c0698f63c', 'GsV3TQXMytmADVjb817hblQmp6rg1ybqulyz4qE21W3y4bAsCpvdeFO1GGr4Rbdcu2HW0', 'posbasic@gmail.com', 'POSBASIC', 1, 1, 6, '2017-09-25 22:53:08', '2022-04-17 15:00:55', '2022-04-17 22:00:55.0', NULL, '', ''),
	(12, 'hoangson', '8d4fb745d6c378a166ee31fffb30e00d', 'sBKr8!oA2YO3)hLf8dwQKnLCMJ##VSr!mEmbvb7pVCBTVJv34u)VBo(SBIJCiIBOQ6Zjk', 'hoangsondev212@gmail.com', 'Hoàng Sơn', 1, 1, 6, '2017-12-17 14:26:39', '2018-06-12 02:45:41', '2017-12-30 11:55:55.0', '172.16.0.6', NULL, NULL),
	(14, 'sale', '1f5b8d6c2a26725f001b343106b24af2', 'NYYku#JtpuTH4nPcHM^DeczfQV^dMzAVoPP(InxlY&7MK3rYDBt2wCy(g)@0238J#PWcC', 'sales@posbasic.net', 'Sale', 1, 12, 6, '2018-03-02 13:35:15', '2018-06-12 02:50:00', '2018-03-02 13:36:02.0', '172.16.0.6', NULL, NULL);
/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;

-- Dumping structure for table a-thien.cms_users_group
CREATE TABLE IF NOT EXISTS `cms_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_permission` varchar(255) NOT NULL,
  `group_registered` datetime NOT NULL,
  `group_updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table a-thien.cms_users_group: ~8 rows (approximately)
/*!40000 ALTER TABLE `cms_users_group` DISABLE KEYS */;
INSERT INTO `cms_users_group` (`id`, `group_name`, `group_permission`, `group_registered`, `group_updated`) VALUES
	(1, 'Ban Giám đốc', '["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]', '2016-01-22 02:58:58', '2022-04-14 21:16:15'),
	(2, 'Quản lý', '["1","2","3","4","5","6","7","8"]', '2016-01-22 03:00:40', '2017-10-28 20:17:04'),
	(7, 'Nhân viên', '["1","19"]', '2017-10-28 20:15:57', '2017-12-29 16:11:05'),
	(8, 'Giám Sát', '["1","2","8","9","10","17","18"]', '2017-11-09 03:02:14', '2017-12-28 05:09:17'),
	(9, 'admin', '["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]', '2017-11-19 20:15:42', '2017-12-27 20:57:46'),
	(10, 'Kế toán', '["2","3","4","7","8","10"]', '2017-11-21 16:58:18', '2017-11-21 16:58:36'),
	(11, 'Thủ Kho', '["1","2","3","4","5","6","7","8"]', '2017-11-21 16:58:43', '2017-11-21 16:58:59'),
	(12, 'Bán hàng', '["19"]', '2018-02-28 16:10:26', '2018-02-28 16:10:34');
/*!40000 ALTER TABLE `cms_users_group` ENABLE KEYS */;

-- Dumping structure for trigger a-thien.cms_canreturn_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_canreturn_UPDATE` BEFORE UPDATE ON `cms_canreturn` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_customers_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_customers_UPDATE` BEFORE UPDATE ON `cms_customers` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_input_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_input_UPDATE` BEFORE UPDATE ON `cms_input` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_inventory_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_inventory_UPDATE` BEFORE UPDATE ON `cms_inventory` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_orders_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_orders_UPDATE` BEFORE UPDATE ON `cms_orders` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_payment_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_payment_UPDATE` BEFORE UPDATE ON `cms_payment` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_products_group_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_products_group_UPDATE` BEFORE UPDATE ON `cms_products_group` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_products_manufacture_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_products_manufacture_UPDATE` BEFORE UPDATE ON `cms_products_manufacture` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_products_unit_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_products_unit_UPDATE` BEFORE UPDATE ON `cms_products_unit` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_products_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_products_UPDATE` BEFORE UPDATE ON `cms_products` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_receipt_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_receipt_UPDATE` BEFORE UPDATE ON `cms_receipt` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_report_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_report_UPDATE` BEFORE UPDATE ON `cms_report` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.cms_stores_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cms_stores_UPDATE` BEFORE UPDATE ON `cms_stores` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.MyTable_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `MyTable_UPDATE` BEFORE UPDATE ON `cms_transfer` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger a-thien.suppliers_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `suppliers_UPDATE` BEFORE UPDATE ON `cms_suppliers` FOR EACH ROW BEGIN
        -- Set the udpate date
    Set new.updated = now();
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
