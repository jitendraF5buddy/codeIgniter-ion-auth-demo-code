-- phpMyAdmin SQL Dump
-- version 4.0.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 14, 2017 at 05:08 PM
-- Server version: 5.6.14
-- PHP Version: 5.5.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `auth_login`
--

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('d65f4810023e28226b9459e9ada7412b', '::1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 ', 1500023104, 'a:1:{s:9:"user_data";s:0:"";}'),
('fecde4ea9077817c5316b9d6d33e76bd', '::1', 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 ', 1500032254, 'a:1:{s:9:"user_data";s:0:"";}');

-- --------------------------------------------------------

--
-- Table structure for table `ErrorLanguage`
--

CREATE TABLE IF NOT EXISTS `ErrorLanguage` (
  `error_lang_id` int(11) NOT NULL AUTO_INCREMENT,
  `ID` varchar(255) NOT NULL,
  `Country` varchar(255) NOT NULL,
  PRIMARY KEY (`error_lang_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `ErrorLanguage`
--

INSERT INTO `ErrorLanguage` (`error_lang_id`, `ID`, `Country`) VALUES
(1, 'en_AU', 'Australia'),
(2, 'de_AT', 'Austria'),
(3, 'nl_BE', 'Belgium (Dutch)'),
(4, 'fr_BE', 'Belgium (French)'),
(5, 'en_CA', 'Canada'),
(6, 'fr_CA', 'Canada (French)'),
(7, 'zh_CN', 'China'),
(8, 'fr_FR', 'France'),
(9, 'de_DE', 'Germany'),
(10, 'zh_HK', 'Hong Kong'),
(11, 'en_IN', 'India'),
(12, 'en_IE', 'Ireland'),
(13, 'it_IT', 'Italy'),
(14, 'nl_NL', 'Netherlands'),
(15, 'en_SG', 'Singapore'),
(16, 'es_ES', 'Spain'),
(17, 'de_CH', 'Switzerland'),
(18, 'en_GB', 'United Kingdom'),
(19, 'en_US', 'United States');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'sub-user', 'Sub Admin');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `devID` varchar(255) NOT NULL,
  `appID` varchar(255) NOT NULL,
  `certID` varchar(255) NOT NULL,
  `serverUrl` varchar(255) NOT NULL,
  `userToken` text NOT NULL,
  `paypalEmailAddress` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `devID`, `appID`, `certID`, `serverUrl`, `userToken`, `paypalEmailAddress`, `created_at`, `updated_at`) VALUES
(1, 'a9b53f96-311c-445e-9b83-28c2b1a0390f', 'Pushpend-EbayUplo-SBX-0090738eb-a3940b25User', 'SBX-090738ebf608-2ab1-4db6-96ef-50d4', 'https://api.sandbox.ebay.com/ws/api.dll', 'AgAAAA**AQAAAA**aAAAAA**d+rhWA**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GlDZWHqA6dj6x9nY+seQ**2CYEAA**AAMAAA**j6cVT9QHp9Xs8t+ZatUPQB4D4mvgNJc4ogIQw4YHaZGDhgO0FI1WFK+1VtMn9BCLJN+g0iyIFbR+568DQ/EoWn+qX3PLUFs3G9c6G7BKu4SKdMkJ04qf1jyrb0idFBmLKNY9aZ2GhUN7QbtASvlXO/rKDAzJNAjfgW01LnJH34MOkFefu62dpwqK59fHMVYAhz90e6/9GtxF1ShND8t7CYO4ni1/jk24kMnvj/vbdtA+ze1JvehEqg0/W5d+BT/29cMWFq7bvNVTr5rL+gsH2fKkcmXZFcoPkWckKWKb54le5jNWTNFd+CDYQ3mZxU9ptQ0M69hZytfUH6yScaO74GudWW30U4//ZAPUZlarcdrxIgmeQt7qB7V5J1HKgjJPVsHSL8wPUAbh7u2kIDPtq9Vt+Ej6bixEDooE/0wbCRZUqvuHnOxwbPbY7YTNasLyQ/EI9IUkBdj354cog5Bkb6dlU41E4s8mMe65FO9riYPwlc0rvV+29SHIXSlUlG5UwEnGx/G3xq4tTsE8VFZjfybHaUyUv4RQdLLuEv3NBUO84dDECUoQyyV8UFP8qzzroGgIsmQ1OrtATRXCk016Bu2oCLr24dlOQnL+ZCSTe86QFBn6HMDBq7J/BuDdSFUglkUpKXwyOIYnPEBelHbFESqHbhPayNQPmJTPFc+xSX9KoYEb8I20wOyJFa2btRCNilGKVTFMj1QBw30B1hORTi1nBwY3cJCSsA4rMNo4oCHbfM04zj9icWz9Gc3oetjl', 'example@example.com', '2017-03-29 06:35:54', '2017-06-17 03:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `fullname` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `street_number` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(16) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `image` longtext NOT NULL,
  `image_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `fullname`, `address`, `street_number`, `route`, `address1`, `address2`, `phone`, `city`, `zip_code`, `state`, `country`, `image`, `image_name`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$08$nJU9EbLM6/4NAwYVaRPpPOeY.4bfTOZz3wUdlH55i3yrfpzPb6H1y', NULL, 'samandarmeena@gmail.com', NULL, 'FqSce8xelicf9212071997a5f03d914f4d88d7f6', 1500031999, NULL, 1268889823, 1500028685, 1, 'Nikesh', 'M Mayora', 'Admin fullname', '56, Mahatma Gandhi Road, New Palasia, Indore, Madhya Pradesh, India', 56, 'Mahatma Gandhi Road', 'Escondido', 'F5 Buddy', '123456789', 'Indore', '452001', 'MP', 'India', '/9j/4AAQSkZJRgABAQAAAQABAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2ODApLCBxdWFsaXR5ID0gODAK/9sAQwAGBAUGBQQGBgUGBwcGCAoQCgoJCQoUDg8MEBcUGBgXFBYWGh0lHxobIxwWFiAsICMmJykqKRkfLTAtKDAlKCko/9sAQwEHBwcKCAoTCgoTKBoWGigoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgo/8AAEQgBLAH0AwEiAAIRAQMRAf/EAB8AAAEFAQEBAQEBAAAAAAAAAAABAgMEBQYHCAkKC//EALUQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+v/EAB8BAAMBAQEBAQEBAQEAAAAAAAABAgMEBQYHCAkKC//EALURAAIBAgQEAwQHBQQEAAECdwABAgMRBAUhMQYSQVEHYXETIjKBCBRCkaGxwQkjM1LwFWJy0QoWJDThJfEXGBkaJicoKSo1Njc4OTpDREVGR0hJSlNUVVZXWFlaY2RlZmdoaWpzdHV2d3h5eoKDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uLj5OXm5+jp6vLz9PX29/j5+v/aAAwDAQACEQMRAD8A+oKKKKYgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoopCQOpoAWmTSxwRPLNIkcSDczucBR6k04so6kCuW8baBaeJobe21Ga7FjDIJWjgkCpKw6B+DkD09aAN/TdTsNUiaXTb22vI1O0vbyrIAfQkGrdeUaP4R0nwhrw1fSrm/WQ/JJEZR5boeoKhRn1HvXpJ1W0CqxmXDDIycfzoG0XqKypdagUfuxvP5friohq80pxb2xf8Cf5UCNqistJdUl6QxRA92b+lSrBet/rbpV9kT+tAF+kLADJIA96qizz/AKyed/Ytj+VSLaQL/wAswf8Ae5/nQA5riFesqZ9M06ORZAShyB7YpVRV+6oH0FOoAKKKKACiiigAooooAQkAEnoKZ58X99R9eKkpCAeoBoAQOrfdYH6GnVE0ETdUX8qYbVP4HkT/AHWoAsUVTa3uV/1dz+Drn+tRO2ox9Eil+jY/mBQBo0VjvqdxDzPauo9dpx+dLHrkLH5gAPXJ/wAKANekZgqlmICjkk9qpx6nbSEBXBPoCD/WqGsCDUGjhleQwxsHZFOA59G9RQBrW91Bcgm2nimCnBMbhsH8Kmrhfs0djraX2nCUSE4kjQ/KU7giu4WRGAKsCD6GgB1FJkUtABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFQTGYN8gUp7daAJ6Kp5mb+/wDlimmGRuqMfqR/jTsBbaWNerr+dRtcxjpk/QVB5En939RS/Zpf9j8//rUaAPa7/up+ZqJrmU9CF+gp32aT/Y/M/wCFJ9lk/wBj8z/hRoBC0jt95mP41F5aZztGfXFWzaSeqfnTGtZh0Cn6GncCDaPSsHxh4s03wfpBvNUm2ITtRepcnsBWh4k1D+wNEu9UvIZGgtk3MI8FjyAMc+prwPxRrcvie6luZ3kRLiPZHEcFbcYI49Tzknv9AKmUrFRjc6l/iJpWqQRuJNjynKxrG5GP94gA16B4YttG1uKWXSrqfZG22RGQK6ntnjv6185J4Xhe1VLjVr0xwr8gVVGfbnNesfBSVE1wohmLvB5bsz8MF5GR0z71KY2j2C20qztwNsQY+r/NV0AAYAAFLRVEBRRRQAUUUUAFFFFABRRRQAUUmR60bh6igBaKTIpaACiiigAooooAKKKKACq1xYWtxnzoUJPcDB/MVZooA52/8O2YjeVrl4YVBZi5BVR+NcQ/jjw5ZmSKG+k8mLK73jYjjqflHA+uK6X4tTtD4SlRXkTzW2Eo2D90/n0FfNtt4chghnkj1O+DTfejbBXn6YpNlJXPefBXxC0LxHfSabaSxJeoCVCtlZR6gkA59j+tdr5K5JPP1r5k8UO982nXFldT6fcWe0rLB94kY5/SvdPh14rPimxdHgdby3VfNbgK+eMj06dKakr2Bx6nTGFG6oDShCv3GZfocVaFvIf4cfU0otX77PzqrkldZrhOkm4f7QzUq30g+/ED7g4p/wBlf/Z/Oj7K/wDs/nRoAq38X8Suv1Gf5VKt3A3SVR9Tj+dQG0f/AGPz/wDrUw2bn+EfnSsgNAMGGVII9qWss2Lg5VMH2IpRFdJ0eQfU5osBp0VnK99naoVj6uMD9K0BnHPWkAtFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFBGRUBt+6Oyn60AT0VXxOvQhvrSG4Zf8AWJj3/wD10AWaKhW4Q9cr9RUiurfdYH6GgB1FFFABRRVHUNUtbFkSZyZX5WJBlj749PegC9RWXpuu2OoTtBDKVuF5MUg2tj1Hr+FalAHlfxg8SPPo2oaFptuk00qiOR3JAHIJAx34rx/TNL1iaGJItMlkZBg7XT+pr17xJo0sOs3TOmVkkaRT6gnNLpMQtWHyj8Klq5otFocVpXg7Xr4Mr2It1b+KaQAfkuTXZ+EPBup+HNRju4bu2lbkMroQACO3PP6V19pqSrGAVP8AOp5L+IjO7b9eKaSE2y+l5cAEyCL8Mil+2zdo1rMS5UnOc1Ms4Peq0JLovJ/7kf5ml+1zekf5GqE9ysFvLM5+WNS5+gGa5+DxbAY9067SF3MPTCsT/wCi3/KjQLHX/a5vRPyNH2ub0T8j/jWfY3a3dv5qD5dzJ+KsVP6g1OHyeOTT0EWftM3qg/Ck+0Tf3x+AqEAk5Y/hTwvtRYBTLKf+WjfhxTGDt1dj9TUoT1oLIDhfmPoKYGJd6bqMuoJPDqrw26jH2ZYUKt7liN35EVj6lofiCW8e4t/EP2YFdiR+QGROeuCfmb3OR7dK7PazdSFHoOTTlhUHpz6nk1DgmbwxE4bW7bJ/oc3ZW2pwXRefUXuINgUJ5Sod3diQBnPPoOa0hc3Sfdd/+BNmtBoQahktzTSSM5Tc3dlb+0rpD83I/Cl/tmVfvjB91z/Kh4SO1VZbfI4+U07Eln+3sfxQ/wCfxo/t73h/P/69YlzFLFklSR6jmqf2jHekFjp/7ebtGp+gNIddm/hiiH+8TXDvriZAXAJOOT0OQP5n9KfY6st3CzqehA/NQw/RhSuh2O2GuS90iJ9sinHXH2/6uMH6muNa9PrUL3x9aLoLGh41S98RWYtA8MUIO4FQSwOMc5PTrXnN54J1i3ixbRx3Y9Uba35Hj9a7aHU1U/M2fYdanbXG24jQj8Mfzo0GjzG48J+IJYsLpcv4yIP5tXQfDi+1PwbqM66lpyi0uABI3mguCDxgDI7nqfSuo/tWd+35tWTfJPezBURSxPGMtUW1uPfc9ohlSaFJY2DI6hlI7g9KfVHQ7eS00ezt5jmSOJVb2OOlJresWGh6fJe6rdRWtsnV3PU+gHUn2HNWZl+iuE0X4q+FtW1ZNOjvJLa4kbbF9piMayHsA3TJ9Diu7oAKKKKACikJAGScCoJL23j+9Kufbn+VAFiisxtXiLFYY3lb0AoE2oz/AOrgSJT3c/5/lQBp0VnCxuJObm7f/dj4/wA/lV23hWCPYhYjrljk0ASUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUARtDG38IH04qJ7UHlWOfcZqzRQBV8qZB8rZ+jf0P+NNWaVB++IH+8pA/PpVyigCuboLGXK5UDOVIIrBt1tVv59RwWuJl2ks2QB6Adq3LqxguVYMm1mGNyHafzFcXZ3VuzQx3VwIVYhdx7n0z2/GgaC40+3bUUu7WORrtG3KwbofwrubSUzW0UjDazKCR6HuKht7eCCHECAHHU0iI+cu2D328Zp7gTz28Vwu2eNXX0YZqi2haexz5GPox/xqyykjG9/wAGNCB0GA7H/e5osBnnw3YjcU85Sxz9/OPzrG1Gwn0+T7xaI9G7fQ11gmYffX8Vp5McyFTtZTwVI/pSsFzg1YA9Np9uKmSZx0fP+9WrrenWNpE05u4rReuJmwp+nevPL/xlpdpNtjL3OCQ3ldD9CamU4x3Z0UcNVru1KLZ19zILm1mt5wwjlQxsVPYjBxWVJ4Va5cvbSEI7ZIkGBgtITz9JXH5VJ4U8Y+H9WuktYm+zXr8IlyRlj6KRxn24Ndvsx1fH0GKcXGauncmtRq0JclWLT8zO0bTTYabb2ryeY0a4ZgMbm6k/ic1fwi8FlB9O9DGMdcn6nNRtOq8DA9MVZiTbh2Vj+GP50hd/9hf1rPl1GFR/rASQzADnO3riiG7SeFJYmDIwyDQBeJB+8S31/wAKcJB0AwKpCX3p6yCgC8rZqVaopJVmOUA0AWQuaClIs4AoM4NLUBjRg9qie2BqbzRVNNWtJJZEWUEpKIT7uRnApgMktT2rNvNKjmySpVv7y8VvpLHIPkdTyRwe460pRTQB5PqXg+7SeR4ZRJEWLcDDDJc9Pq4/KqlvALAPEqybiQSGGOgA/kBXrz26t2rm/F11o+j2X2jWZY0VuEXGXc+ijrUSSSu2aQjKpJRirtnE5lfoAP1p62rP98k/WsGXx3pButsNrdxwZ+/IAcj6A8V23hOXSdewYtUt15/1QbEh/A//AF6zjUhLRM6a2CxFBc1SDSKllprzyrFChdz0UV2Nl4PtBCPtjO0hHIQ4A/rW9ZWVrYRlYEVB/Ex6n6mllvY04XLn26fnWtjiuZsfhbSkVR5LtgY+aQkmr1npVjZtutraNGH8WMn8zUUl5K2du1PoMmqplmByZ5CfrTsBu1x/jTwxpfiaW2fWIpnW0YmIpKygE4zkdD07itFppWHMr/8AfVLFNJhlkYFMcCiwHl/iX4ceG7q4e4drxT2RJFCj6fLn9a9F8KazGdGt7d2lllgHlFmbJIHQkk5JxjmuX8V3Ftby7UmAkb/ln1P19q2PAGl2d5pRvLiISyNIygMcqAPboaXUfQ6M6r5jFYFDMOoXLkfgKav9pzg5AiHbLBePwya1kRY1CooVR0AGAKdQSY40iWQ5ubtm9kHP5nP8qtRaVaR8mMyH1kOf06VeooAaiLGu1FVV9AMU6iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA8K+MvxT1Hw3rc9lpLtHHbKqyERbyXIzn2GCK828JXmo+Omubey1m/sBHG0rbgJFI3KAME8dSa7Hx+zW3xW1cgKd3lnDDIOY1rn5pntL15bI/ZXcYYw/JuHvis29TVLQ+kPCssknh3Tzcy+dOIVWSTGN7gYY49yDWqTXiPgP4gnRrV7LVIpbi33F45Izl1J6g5PIzzXVyfFTSQcR2l6591UD+daKSsQ4s9DzS5rA0vxFDqNsk1ui4YZwX6H0PFX472cnLwRBfVZSf8A2UVVxGhTWRT1FVTfBfvJ+TVzniH4h6D4evYrXV5Z4HkTzFYRFlIzjqM+lTKSirtmlOlOrLlpq78jpbmyhuEZJ40lRuqyKGB/A15X42+FD31y1z4dnhtlYfNayEhM+qkZx9K6q1+KPg25ICa5ChP/AD1R0/mK6m31OwuI0khu4HRwGVg4wQehFZyVOsrPU66FfFZfPmjePqtH8mfLmr+B/FGjsXn0ucovIlg/eAe/y5I/GvaPh34ml1vwzE925a9t2ME5PUsOhP1BH45r0KOSKZcxSJIvqpBFRS2FtKzM0Kbm6sBgn8ailh1SleL0OjHZtPHUlCtBcy2a/E5y/uHktZVhfZKVOxs9D2rmZb+5uRuRirygSop6rKnDL7Z/qfSu01HSLWKJpTcGBR3Y5FcjK8UcpECiRQxYP5eMk9Tz9a3Z5KKhmZ8yQsf+fuHH/j6/59RWnpMj2sk0QRhbnEkfHCg/w/n+mKrfaJMYAwMYwT2pBI7dx/OgZvLdj1qRbsetc+Gf+9j6CpFZz/G36U7iOiS6HrU6XXvXOx7v7zfmasLn+8//AH0aLhY31uh61ILj3rDQt2dh+NShn/56H8hSuFizrl9Pb6XO9ojyTkbUVBk5Ncc0UtjkQhme1IiiPI826k+8/wCHQf8AAfSupEsi9WX8v/r04XDeiHHv/wDWoA5hbm6t18uzmLMn+gWxJ+9I2DJKfYfyPtXT+Fbue6E9w7k2i4gtwf4gnDOfqf5U0iFipe2XK52naPlyMHH1FXdPSJIUht9saIMBAMYFCBms1wiIzuwVVGST2FfO/iC7vfHGvz3NtbXNwm4pCqISEQHgeg9T7mvfWiV0KSfMrDBB6EUIkUMYSNVRF4CqMAVnVpe1sm9Dvy/HLBOU1G8nt5Hh+mfCvVbt0a6eOyhJ+YM258ewHH5mvWdD8NaXolqsOn2cUZAw0pUNI/uzdT/KtQ3EOcCRfzrH1PxXoumTNDfahBDMoBMbH5hnpwOaUKNOlqXicxxePfJLbsl/V/mbYUAAZ4HTJoJrjJfiP4cDhI715nJwFjhckn8q68QzuOEA/wB5v8K1jOMtmcNWhVo29pFq/dWBmqNmpz2t0MYERz/tnj9KgaG6UEyJEP8Adcn+lUZDt1Iz8HmuT1Txja6bfvaXME5dTjcmCP5iszWPiDaW1q5tLeeS4I+QOAFB9TzS5kOzPIPiZ4luLf4gaxG2oXUUMJRI44QuBhRkEkE9cn8a1fg/8Q3tdabY28OAkytnLqCD0PfAODWW8UF5dSXN3bW89xKxZ5JIwSx96ngYQTAQRRRYPGxAKxcupol0PrezuEu7SG4hJMUqCRSRjgjIqas7w4pTw/pinqLWIH/vgVo1qYhRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFV7u4EIQDG9zgf41YrA8TySQSWkyqWQblbHYnGP5GgEeYeMfA/iK/8AFl3q8McF5HMRtEUiowUAAAhsc4HYmua1Dwf4j8wn+xro/QA/yNe1R6wqryxX/eGKJNdQKR5qfnUuK3LUnseCSeHNfg5bR7kf721f5ms65sNc3FRZxW/vJKDj8FzXt2q6pHMCPMU/jXJ3YSVyQGb6KTStYq9zN8AG60a0NvNcPM7SNKzEYGSc4A9K9Et9b2oNwrjreCUH93Ft/wBpz/Qf/WrSgspJOXZn/QflTTYrG7ca5Gcgfe9M5P5V5R8ax9vtNMnClWjkdMkY4IB/9lr0VbQIMYx7Cue8a+Gp9etLaK2lijMTliJM4OR7VnWjzwaOvAVlRxEajdkv8jwdbUd2r6B8LNIfDWl7nPFtGOn+yK5vTfhmiTI+oXnmRg5Mcabc/jn+ld6sEcEKoi7UQABVHQDsBWWHounds7s2x8MSoxg72Pnd3kt76Z7V5Ij5jEFGKnrXpnws1DX5Jbm4uNRv3swmxBLOzKWz2BPYD9a3YtCg2zXLaLbB2Jff5BdVGfcYz+Q96vRSvhBAoWJBgKFAB+v+A/OnTouErtkYvMo16fs4x+bsalzPcXTBriZ5COm45xUOw1BFK0YYyyb2J6DAAoN4u7+grpueQWNlKBimwypMgZDkGpMUXAF61MgqMUBHyxDcHp7UxFxOlTL2qnGkmRkjGMHmpo43G3c2SDk80AWxwacWxVMLKA3zDOeKeGIQbjk45pDHySYqs0xB602V8mq7NQItJdMKmW8I71jPdoGIU9DgmnidXUjOCe/pRcdiXxVc383h29XS550vQgMZjkIbggkD3IBFeDXmsahcsy3l9eSMDgiSVjj8zXtTS3Magbw2DneoBz7Ef4VTltbbVJZGk0q3uyB8x8jcyn/ex/h+NYVqTqbM9TL8fHCJqUL366X/ABH/AAfmC+EiFcg/aHz7nArzf4lM8vjfVHZ+dyDp2CLXq2iILW1+zx2cdoEY4jiB2n36DmsfxV4OtdfuBciR7a7xhpFXcHHbI45981NSi5U1FdDbBZjCljJ15aKV/lseb+Brfz/GOjrIAyLcK5Hrt+b+lfTsV/HxuO3/AHuK8R0HwHe6Vr1pe/bYnhgfccKQx9sdP1r0f7TKvRj+NPDU3Ti0yc6xcMVUjKDukv1OwFyrDg1UvpiIztciucS/MZ+YAe6nFSG981DtYMD69a6bnjWPKvEOh6rZ3bypcJfx72bMh2ScnOD2P14rltUurtztOnXII4+Xa38jXsWpR+ZuyD+Vc7JYoHJIFRYq553Yx3s5Aj068J/65Gte28M6/ctug0yQehldUA+uTn9K7iwjWBuMAVsm/CJgMPwNPkQczN3wDqep2NlY6Z4huIbm5KiMSxjAB7L2yO2etd7Xj1lPPc6vZrCrF/OTGRgA5Few1RDCiiigQUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFQ3VvHdQNFMuUb9KmooA5Sfw9dqWMMiMM8DODiqMujaj3iJ+hBruaKB3OAOg6g5/1DfjgVLD4Uu3IMgjQe7f4V3VFFg5jmYfCkKR/PMTJ7LwPwpX8P3A4jmix75FdLRQFzl/8AhH7v/npD/wB9H/CkHh26PWaEfQn/AArqaKAuc2nhtjjzbkAeir/9etKx0aztMFY/McfxScmtKigVzJ8VSSw+HNQa3WNpfJYKHzt545x9a8churxPv6aCfVJwR+oFew+LpVi8O3rMeqhR9SQK8zhj34xUsuJnSXN8V3fZreBO7SzZx+AH9aq3f2n7H9re8XyeSGtogQcemd2awPirOkEmkwOzDezswQZYL8oyBkZ71dt/GcJ0uGxsdHuBDFGI0y4yQO5460DLPg7WWuTMJZGdTIdhdQrY46gcV2itkAivCrvxBd6drsZmtnt4S/POQCfXj2r1/wAP6il9aI6sDkUIGbI61KtRCnqaoknVwOOfwFSiRf8Aa/I1RaZYw25tuTwSPakguV3484PnoO9AzQLjGQahkfiolfCKD6UjNQIY5rL1i9Fpau2Ruxx9avzuEQseleSeP/EUsl9HZWStLKW+4nWkxo2/Deux3qD7TfzxyKcfNCpQ+4wM/rXY2jG4+W1ubC6YdVVyjD9W/lXEaKup2FlG02kSkFQwKvkEflWRdzrH4z0i/NtcWoe7i+0CQDaPnAyDnuOvA/WpKPRNUN7GpAsQx/2Zhj9QK3/hJcXjajqEVxbwwwtGrDDlnyDjk4AxzS6nGGU4qz8OmWPWrmMnDPCcfgwp9SXsd5eWNveJtuIlb0PQj6GsSfwwuc29wyj0cZ/WukoqiLnKHw5eD7s0B+pI/pTH8O37Ljfb/Xcf8K66igdzkh4eviMPJb/mT/Sp4fC6Hm4mA9olx+v/ANaumooC5yN14VmBPkTI6+jcGs2bwzeg/wCoDfRhXoFFFguecf8ACOX3a2b9Klh8KX8p+eNIx6sw/pXoVFAXOd8OeHE0xjPcFZLnnGOiD298V0VFFAgooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAON+I9yfs9pZqf8AWOZG+g6fqf0rlGkisrKSedgscalmPtW14tf7Rr0meREqxj8sn9SawpYft2sabZHmATJJKPUBhtH5/wAqRSOJ+IlsIrnSYrmx/wCJ5cr9rkkkyVt4DkJCADgngsxx1JwcVdsYrxLZdpt+nRoWx/6HXZ/F9dP0zWtK1a7uPLmmQ2wjYfKVUlt2egwXxz1yMdDWSviDTkg3+fAFx18xQKXUfQ4fXNNl1/TrvT7qyitr+IiSCSIfLMv+z7juP8a5zw14h1PwxcfZtRsbiWJTjdGuT+XWun1nxhq9zqUkfha1SWHZsadrdZwxzn5dwI49cVTt38fzpjIQn+N4o1I/MCgDsdO8a6ddopEOooT2NlKcfiFrWTXLFhnfKP8Aehcf0rzibw54suomk1PXfIi7kTFAPrgYqpY+ATeyyPb+JYbh14cIfM2n3IanqB6p/bVgf+Wrf9+2/wAKX+2rH/nq3/ftv8K88X4cXIC/8ThDg/8APE//ABVSH4e3OMf2uv8A37P/AMVRqGh3x1ux/wCer/8Aftv8KrXXiWxtxkpev/1zs5X/AFC159e/DaR0aSTW0jCjlzGRtH13UuleDtVPOgeLUmwM4iuiR+S5o1DQu+JvHc06NbaRpWoySNxue3ZB+tQeA/Dt3YXE/iXxFC5kVCIbfGWZj0AHck1fWz+JNim2K+hulHqI2/Vhmq0etfEOxc/bbM3kRYFle0TOMgkB1AI6etIDubYa/LZedcRWFm78+QEZ2UehIYDNcVrStDrtnca9Yw3+mpJ+/ijDIxU9x83UdevOK7628Z2VzaoZQIJSo3RO4DofQg9KwLzUdJ17XtP0ma8SP7XMsWUO9hk8DAzjJ4yeBnmmwR08KzWd5c6Peu0lxbANFK3WeE/cf69j7g+tN06Y6br9pcdED7X/AN08H+dafxFiEGu6ZfRjDxR7Gx/EhPI/Ws/VoQybhz3oBHqtFU9GuDdaVaTk5Z4lLfXHP61cpkBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRSOdqk+gzQB5rqLebf3Un96Rj+tVLOG63vd2axGZZ1Cea2B8mDz7danf7xz1qTRDu0WGQ9ZJZH/N2x+lDKOpvNGtfFGk2Umpr++QFlaI4AJ64BzwcDrWcnw/01GBHlj3ECg/nW94W40G1B7bv/QjWrQIw7fwtpkKgGN5Mf3nP9MVeh0mwh/1dpAD6lAT+Zq9RQI8p+P7/wDFPWFhEAommMhAGOFGP/Zq4f4e2CWnh5pI4x50tzJvbuQqpgfqfzrvfinb/wBp63ZwIdywwktjsSf/AKwrzbWrbXLLUI7LR9wthH5hIOBvYkH8cKtLrctbWOuYyj+H9abmX+7+orjU0HxlcuW/tHykP8IGcVJN4X8YIuU1Zj9VouFjrLi2e8ga2k+VJx5RYdt3H9a4f4PI2lePtPlHCSSGE+4YEf1pbiDxdYxgs7SsnOVbn613cGiRWE9tdRLhoZFcEexzS3A9mktYJf8AWQxt9VBqrJo9k/8AyxCn/ZJFXkZXQMhDKRkEd6dVEHOX3hSzushmyvo6B6raZ4F0uyv4bzBaWFg6KqhFDDocDr+ddZRQFzh/iEAbyzB7xt/MVlFfM02InkhcflxWt8Qf+P6x/wCub/zFZWnHfprqf4XYf1/rQiuh1/guTfoMS/8APN2X9c/1rdrmvArf6Dcx/wB2bP5gf4V0tBLCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACobw4tJj6I38qmqvqHFhc/wDXNv5UAecznaGY9gTVyyg+z6LYxEcpGgP1wM/rVO7UtG49QRWveYWJQPUfzpso6DwmwbQbcj+9IPydhWvWV4XTZoduMY5c/m7GtWkSwqvqFyLSymuG/wCWak/j2qxWH4xkK6OUH/LRwv8AX+lAHCrJJc3Mkr8yOfvH65rSstPUnJXJ9TUVjCODjmotS137PdjTtNCy32Mt3CD6etBR0cVokafNtX60rxQsPlZT+NYtjbIY9+qxteTt182QlR/wEcfpVe50m3fcbWNLZ+xjG3H4jFMDTurND1UVl3UZjheMDKkcD0rPXU9R0Vguqfv7QnAkHJH49/oea1Zpo5oVkiYPG4yrDoRUjOh8DX7z2kttMfnhOR9D/wDX/nXT1594Pm8rX1QdJUZf6/0r0GmiXuFFFFAjh/iCf+JhYj/pm38xWbpA/wBFnHq279AP6Vf+IR/4mVp/1yP86q6On+gu/wDeOPy//XQiuhueCDg3y+jIf5/4V1Ncr4K4uNQH+5/7NXVUEsKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKr6j/x4XP/AFzb+VWKr6j/AMeFx/1zb+VAHAOubiMdiwH61NrFnN/aFg0dy3kPcRJLF0BUuoOPzphH+kxf76/zrQ1PM2o6XCv8d5GfwQ7/AP2SmyjsLeFLeFIol2ogwBnNSUUUiQrnvGZAsrfd90y4z74NdDWX4ltjc6TMEGXT94B646/pmgEcNqN1/ZekXl4FLtFGWVQOWOOB+dZXhKx+z2kV26AalfIs9wznLKD2/wA9605ZFW0ZpGxHGyswPQAGrURP2iU7RjChSB1plGX4o8U6Z4bgV9RlPmMMrEgyxHr6Ae5rB0L4n6Fq10tvmS3ZjgM5Urntkg8fjXlHxl8278VXq3BcxK6qADjACjH4dfxri9NtVjv43gL5zz2GO/AqebUdj6r8R3r232NWtGurKd/Kn2RlyucBTweByecHtVHTUlsrm8059xiQ+ZCx7g9R/L8Sat+GZJJPBti075kNqMs3+73ou33X8Cg4dbbc2O2T/wDWptdRF/wy3/FSWSryxLfltOa9LrgfAdkX1WW5IOyFMZPdj/8AWzXfUITCiiigR558S32ajadcGE9P96jQTu0RG/6aOP0X/GnfE9Ct9pkv8LRyxn65Qj9N1VfDMxexkj/hQ5H1P/6qYzofBv8Ax93/ANE/ma6quW8HD/Sr/wCif1rqaQmFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFV9Q/48Lj/rm38qsVBfDNlOP+mbfyoA4FzieM+jD+daunD7R4nsweRDFJN9Dwg/8AQ2rIuODn0NbXgwefquq3H8MYjtwffBc/+hL+VNjOtooopCCjrRRQBwvifTY7AyO6/wChT/IeOF3cYPoPes+zJWMROfmQY+o7GvR5YkmjaOVFdGGGVhkEVzt/4YR/mspTGR91W7fQ+n1zTHc898VeENP8RMss++K4UbfMTHI9x3rI0j4Z6RZyF7lpbn0ThF/HHJ/OvQptL1SA4a180D+KM8n8P/r1EtnqUhxHp0wP/TT5R/WjQZTm2xxpAiLHbRqNxK/KFH8IqtbRNd6kY4kJu7gZCY+6g6FvQc10Vt4XvLl1e/mSNQchF5x+Hc+5P4V0ulaVa6YjC2T535eRuWf6n+lDFcXR9PTTbFIE5b7zt/ebuavUUUhBRRRQByPxMg36HBcAc29yh/Bsp/7MK5vwof3V3/wH+td74qtDfeHNRt0GZGhYp/vAZX9QK4nw4q/ZJZU+7KqsPoRTQ0dH4NH7++/4B/7NXUVzPg0fvL4+6f8As1dNQJhRRRSAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAqG9/485/9xv5VNTJk8yF0/vKRQB51e4Csc4AGa6H4cxn/AIRmO6YYa8lkuT9GY7f/AB0LXJatNBPZ3MHnIHdGj255yQRjFekaPaix0qztFGBBCkf5ACmxsuUUUUhBRRRQAUUUUAFFFFABRRRQAUUUUAFFFFACEZGD0rz/AEyAWkd5Z97aVox/u5JX9CK9Brh/EhhsdauHeRIzcIjfMcZxkUDRp+DvvXv1X+tdLXOeCdsllPcRsGV5NoI74H/166OgTCiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigDjZPhl4Pk8Q/25JokLar9oF39oMkmfNDbt2N2OvPTFdlRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFc34t8EeHPF8ls/iPS4r5rYMIi7uu0NjP3SPQV0lFAFHRNJstD0q303Srdbeyt12xRKSQoznGTk9TV6iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD//2Q==', 'phantom-2-vision-93b945aff62e6c39b36658998626c513.png');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(23, 21, 2),
(13, 22, 2),
(14, 23, 2),
(15, 24, 2),
(16, 25, 2),
(17, 26, 2),
(18, 27, 2),
(19, 28, 2),
(20, 29, 2),
(21, 30, 2),
(22, 31, 2),
(12, 32, 2),
(24, 33, 2),
(25, 34, 3),
(26, 35, 2),
(27, 36, 2),
(28, 37, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
