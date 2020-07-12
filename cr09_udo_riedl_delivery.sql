-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Jul 2020 um 18:35
-- Server-Version: 10.4.13-MariaDB
-- PHP-Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_udo_riedl_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_udo_riedl_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_udo_riedl_delivery`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accepted_by`
--

CREATE TABLE `accepted_by` (
  `accepted_by_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `fk_in_employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `accepted_by`
--

INSERT INTO `accepted_by` (`accepted_by_id`, `date_time`, `fk_in_employee_id`) VALUES
(1, '2020-01-01 08:30:00', 1),
(2, '2020-02-02 09:30:00', 2),
(3, '2020-03-03 10:30:00', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `adress`
--

CREATE TABLE `adress` (
  `adress_id` int(11) NOT NULL,
  `fk_route_id` int(11) DEFAULT NULL,
  `zip_code` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `housenumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `adress`
--

INSERT INTO `adress` (`adress_id`, `fk_route_id`, `zip_code`, `city`, `street`, `housenumber`) VALUES
(1, 1, '1111', 'acity', 'astreet', 11),
(2, 2, '1111', 'acity', 'bstreet', 22),
(3, 3, '1111', 'ccity', 'cstreet', 33);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `branch_office`
--

CREATE TABLE `branch_office` (
  `branch_office_id` int(11) NOT NULL,
  `fk_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `branch_office`
--

INSERT INTO `branch_office` (`branch_office_id`, `fk_adress_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_info_id` int(11) DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `brings` enum('yes','no') DEFAULT NULL,
  `get` enum('yes','no') DEFAULT NULL,
  `letter` enum('yes','no') DEFAULT NULL,
  `package` enum('yes','no') DEFAULT NULL,
  `identification_card` enum('yes','no') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_info_id`, `fk_adress_id`, `brings`, `get`, `letter`, `package`, `identification_card`) VALUES
(1, 1, 1, 'yes', 'no', 'no', 'yes', 'yes'),
(2, 2, 2, 'yes', 'no', 'no', 'yes', 'yes'),
(3, 3, 3, 'yes', 'no', 'no', 'yes', 'yes');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `delivered_deposited`
--

CREATE TABLE `delivered_deposited` (
  `delivered_deposited_id` int(11) NOT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `delivered_deposited`
--

INSERT INTO `delivered_deposited` (`delivered_deposited_id`, `date_time`) VALUES
(1, '2020-01-01 10:10:10'),
(2, '2020-02-02 10:20:20'),
(3, '2020-03-03 10:30:30'),
(4, '2020-04-04 10:40:40'),
(5, '2020-05-05 10:50:50');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `info`
--

CREATE TABLE `info` (
  `info_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `birth_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `info`
--

INSERT INTO `info` (`info_id`, `first_name`, `last_name`, `birth_date`) VALUES
(1, 'first', 'name', '1991-01-01'),
(2, 'second', 'sname', '1992-02-02'),
(3, 'third', 'thname', '1993-03-03'),
(4, 'fourth', 'founame', '0000-00-00'),
(5, 'fifth', 'fivname', '0000-00-00'),
(6, 'sixth', 'sixname', '0000-00-00'),
(7, 'seventh', 'sevname', '0000-00-00'),
(8, 'aighth', 'aigname', '0000-00-00'),
(9, 'nineth', 'ninename', '0000-00-00'),
(10, 'tenth', 'tenthname', '0000-00-00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `in_employee`
--

CREATE TABLE `in_employee` (
  `in_employee_id` int(11) NOT NULL,
  `fk_info_id` int(11) DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `employed_since` date DEFAULT NULL,
  `fk_branch_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `in_employee`
--

INSERT INTO `in_employee` (`in_employee_id`, `fk_info_id`, `fk_adress_id`, `employed_since`, `fk_branch_office_id`) VALUES
(1, 3, 3, '0000-00-00', 1),
(2, 4, 3, '0000-00-00', 1),
(3, 4, 3, '0000-00-00', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `letter`
--

CREATE TABLE `letter` (
  `letter_id` int(11) NOT NULL,
  `fk_qr_code_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `letter`
--

INSERT INTO `letter` (`letter_id`, `fk_qr_code_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `out_employee`
--

CREATE TABLE `out_employee` (
  `out_employee_id` int(11) NOT NULL,
  `fk_info_id` int(11) DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL,
  `employed_since` date DEFAULT NULL,
  `fk_route_id` int(11) DEFAULT NULL,
  `fk_truck_id` int(11) DEFAULT NULL,
  `fk_branch_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `out_employee`
--

INSERT INTO `out_employee` (`out_employee_id`, `fk_info_id`, `fk_adress_id`, `employed_since`, `fk_route_id`, `fk_truck_id`, `fk_branch_office_id`) VALUES
(1, 6, 2, '2020-06-06', 1, 1, 1),
(2, 7, 2, '2020-07-07', 2, 2, 1),
(3, 8, 2, '2020-08-08', 3, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `fk_qr_code_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `package`
--

INSERT INTO `package` (`package_id`, `fk_qr_code_id`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `qr_code`
--

CREATE TABLE `qr_code` (
  `qr_code_id` int(11) NOT NULL,
  `fk_sender_id` int(11) DEFAULT NULL,
  `fk_recipient_id` int(11) DEFAULT NULL,
  `package` enum('yes','no') DEFAULT NULL,
  `letter` enum('yes','no') DEFAULT NULL,
  `weight` decimal(5,0) DEFAULT NULL,
  `price` decimal(5,0) DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL,
  `fk_accepted_by_id` int(11) DEFAULT NULL,
  `fk_out_employee_id` int(11) DEFAULT NULL,
  `fk_delivered_deposited_id` int(11) DEFAULT NULL,
  `fk_branch_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `qr_code`
--

INSERT INTO `qr_code` (`qr_code_id`, `fk_sender_id`, `fk_recipient_id`, `package`, `letter`, `weight`, `price`, `fk_customer_id`, `fk_accepted_by_id`, `fk_out_employee_id`, `fk_delivered_deposited_id`, `fk_branch_office_id`) VALUES
(1, 1, 1, 'yes', 'no', '12', '11', 1, 1, 1, 1, 1),
(2, 2, 2, 'yes', 'no', '12', '11', 2, 2, 2, 2, 1),
(3, 3, 3, 'yes', 'no', '12', '11', 3, 3, 3, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `recipient`
--

CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `recipient`
--

INSERT INTO `recipient` (`recipient_id`, `first_name`, `last_name`, `fk_adress_id`) VALUES
(1, 'aname', 'alastname', 2),
(2, 'bname', 'blastname', 2),
(3, 'cname', 'clastname', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `route`
--

CREATE TABLE `route` (
  `route_id` int(11) NOT NULL,
  `district` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `route`
--

INSERT INTO `route` (`route_id`, `district`) VALUES
(1, 'first district'),
(2, 'second district'),
(3, 'third district');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `sender`
--

CREATE TABLE `sender` (
  `sender_id` int(11) NOT NULL,
  `first_name` varchar(55) DEFAULT NULL,
  `last_name` varchar(55) DEFAULT NULL,
  `fk_adress_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `sender`
--

INSERT INTO `sender` (`sender_id`, `first_name`, `last_name`, `fk_adress_id`) VALUES
(1, 'first', 'fname', 3),
(2, 'second', 'sname', 3),
(3, 'third', 'thname', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `truck`
--

CREATE TABLE `truck` (
  `truck_id` int(11) NOT NULL,
  `mileage` decimal(8,0) DEFAULT NULL,
  `fk_branch_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `truck`
--

INSERT INTO `truck` (`truck_id`, `mileage`, `fk_branch_office_id`) VALUES
(1, '10000', 1),
(2, '20000', 1),
(3, '30000', 1),
(4, '40000', 1),
(5, '50000', 1);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accepted_by`
--
ALTER TABLE `accepted_by`
  ADD PRIMARY KEY (`accepted_by_id`),
  ADD KEY `fk_in_employee_id` (`fk_in_employee_id`);

--
-- Indizes für die Tabelle `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`adress_id`),
  ADD KEY `fk_route_id` (`fk_route_id`);

--
-- Indizes für die Tabelle `branch_office`
--
ALTER TABLE `branch_office`
  ADD PRIMARY KEY (`branch_office_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_info_id` (`fk_info_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indizes für die Tabelle `delivered_deposited`
--
ALTER TABLE `delivered_deposited`
  ADD PRIMARY KEY (`delivered_deposited_id`);

--
-- Indizes für die Tabelle `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`info_id`);

--
-- Indizes für die Tabelle `in_employee`
--
ALTER TABLE `in_employee`
  ADD PRIMARY KEY (`in_employee_id`),
  ADD KEY `fk_info_id` (`fk_info_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`),
  ADD KEY `fk_branch_office_id` (`fk_branch_office_id`);

--
-- Indizes für die Tabelle `letter`
--
ALTER TABLE `letter`
  ADD PRIMARY KEY (`letter_id`),
  ADD KEY `fk_qr_code_id` (`fk_qr_code_id`);

--
-- Indizes für die Tabelle `out_employee`
--
ALTER TABLE `out_employee`
  ADD PRIMARY KEY (`out_employee_id`),
  ADD KEY `fk_info_id` (`fk_info_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`),
  ADD KEY `fk_route_id` (`fk_route_id`),
  ADD KEY `fk_truck_id` (`fk_truck_id`),
  ADD KEY `fk_branch_office_id` (`fk_branch_office_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_qr_code_id` (`fk_qr_code_id`);

--
-- Indizes für die Tabelle `qr_code`
--
ALTER TABLE `qr_code`
  ADD PRIMARY KEY (`qr_code_id`),
  ADD KEY `fk_sender_id` (`fk_sender_id`),
  ADD KEY `fk_recipient_id` (`fk_recipient_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`),
  ADD KEY `fk_accepted_by_id` (`fk_accepted_by_id`),
  ADD KEY `fk_out_employee_id` (`fk_out_employee_id`),
  ADD KEY `fk_delivered_deposited_id` (`fk_delivered_deposited_id`),
  ADD KEY `fk_branch_office_id` (`fk_branch_office_id`);

--
-- Indizes für die Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`recipient_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indizes für die Tabelle `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indizes für die Tabelle `sender`
--
ALTER TABLE `sender`
  ADD PRIMARY KEY (`sender_id`),
  ADD KEY `fk_adress_id` (`fk_adress_id`);

--
-- Indizes für die Tabelle `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`truck_id`),
  ADD KEY `fk_branch_office_id` (`fk_branch_office_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `accepted_by`
--
ALTER TABLE `accepted_by`
  ADD CONSTRAINT `accepted_by_ibfk_1` FOREIGN KEY (`fk_in_employee_id`) REFERENCES `in_employee` (`in_employee_id`);

--
-- Constraints der Tabelle `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`);

--
-- Constraints der Tabelle `branch_office`
--
ALTER TABLE `branch_office`
  ADD CONSTRAINT `branch_office_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_info_id`) REFERENCES `info` (`info_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `in_employee`
--
ALTER TABLE `in_employee`
  ADD CONSTRAINT `in_employee_ibfk_1` FOREIGN KEY (`fk_info_id`) REFERENCES `info` (`info_id`),
  ADD CONSTRAINT `in_employee_ibfk_2` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`),
  ADD CONSTRAINT `in_employee_ibfk_3` FOREIGN KEY (`fk_branch_office_id`) REFERENCES `branch_office` (`branch_office_id`);

--
-- Constraints der Tabelle `letter`
--
ALTER TABLE `letter`
  ADD CONSTRAINT `letter_ibfk_1` FOREIGN KEY (`fk_qr_code_id`) REFERENCES `qr_code` (`qr_code_id`);

--
-- Constraints der Tabelle `out_employee`
--
ALTER TABLE `out_employee`
  ADD CONSTRAINT `out_employee_ibfk_1` FOREIGN KEY (`fk_info_id`) REFERENCES `info` (`info_id`),
  ADD CONSTRAINT `out_employee_ibfk_10` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`),
  ADD CONSTRAINT `out_employee_ibfk_11` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `out_employee_ibfk_12` FOREIGN KEY (`fk_truck_id`) REFERENCES `truck` (`truck_id`),
  ADD CONSTRAINT `out_employee_ibfk_13` FOREIGN KEY (`fk_branch_office_id`) REFERENCES `branch_office` (`branch_office_id`),
  ADD CONSTRAINT `out_employee_ibfk_2` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`),
  ADD CONSTRAINT `out_employee_ibfk_3` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `out_employee_ibfk_4` FOREIGN KEY (`fk_truck_id`) REFERENCES `truck` (`truck_id`),
  ADD CONSTRAINT `out_employee_ibfk_5` FOREIGN KEY (`fk_info_id`) REFERENCES `info` (`info_id`),
  ADD CONSTRAINT `out_employee_ibfk_6` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`),
  ADD CONSTRAINT `out_employee_ibfk_7` FOREIGN KEY (`fk_route_id`) REFERENCES `route` (`route_id`),
  ADD CONSTRAINT `out_employee_ibfk_8` FOREIGN KEY (`fk_truck_id`) REFERENCES `truck` (`truck_id`),
  ADD CONSTRAINT `out_employee_ibfk_9` FOREIGN KEY (`fk_info_id`) REFERENCES `info` (`info_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_qr_code_id`) REFERENCES `qr_code` (`qr_code_id`);

--
-- Constraints der Tabelle `qr_code`
--
ALTER TABLE `qr_code`
  ADD CONSTRAINT `qr_code_ibfk_1` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `qr_code_ibfk_10` FOREIGN KEY (`fk_accepted_by_id`) REFERENCES `accepted_by` (`accepted_by_id`),
  ADD CONSTRAINT `qr_code_ibfk_11` FOREIGN KEY (`fk_out_employee_id`) REFERENCES `out_employee` (`out_employee_id`),
  ADD CONSTRAINT `qr_code_ibfk_12` FOREIGN KEY (`fk_delivered_deposited_id`) REFERENCES `delivered_deposited` (`delivered_deposited_id`),
  ADD CONSTRAINT `qr_code_ibfk_13` FOREIGN KEY (`fk_branch_office_id`) REFERENCES `branch_office` (`branch_office_id`),
  ADD CONSTRAINT `qr_code_ibfk_2` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`),
  ADD CONSTRAINT `qr_code_ibfk_3` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `qr_code_ibfk_4` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`),
  ADD CONSTRAINT `qr_code_ibfk_5` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `qr_code_ibfk_6` FOREIGN KEY (`fk_accepted_by_id`) REFERENCES `accepted_by` (`accepted_by_id`),
  ADD CONSTRAINT `qr_code_ibfk_7` FOREIGN KEY (`fk_sender_id`) REFERENCES `sender` (`sender_id`),
  ADD CONSTRAINT `qr_code_ibfk_8` FOREIGN KEY (`fk_recipient_id`) REFERENCES `recipient` (`recipient_id`),
  ADD CONSTRAINT `qr_code_ibfk_9` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`);

--
-- Constraints der Tabelle `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `sender`
--
ALTER TABLE `sender`
  ADD CONSTRAINT `sender_ibfk_1` FOREIGN KEY (`fk_adress_id`) REFERENCES `adress` (`adress_id`);

--
-- Constraints der Tabelle `truck`
--
ALTER TABLE `truck`
  ADD CONSTRAINT `truck_ibfk_1` FOREIGN KEY (`fk_branch_office_id`) REFERENCES `branch_office` (`branch_office_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
