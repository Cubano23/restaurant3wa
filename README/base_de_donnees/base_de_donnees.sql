-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Jeu 05 Juillet 2018 à 17:24
-- Version du serveur :  5.7.22-0ubuntu0.16.04.1
-- Version de PHP :  7.0.30-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `booking`
--

CREATE TABLE `booking` (
  `id` int(11) NOT NULL,
  `bookingDate` date NOT NULL,
  `bookingTime` time NOT NULL,
  `numberOfSeats` tinyint(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `creationTimeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `booking`
--

INSERT INTO `booking` (`id`, `bookingDate`, `bookingTime`, `numberOfSeats`, `user_id`, `creationTimeStamp`) VALUES
(1, '2018-06-30', '13:00:00', 3, 2, '2018-06-28 14:50:49'),
(2, '2018-06-29', '12:00:00', 10, 3, '2018-06-28 15:00:28');

-- --------------------------------------------------------

--
-- Structure de la table `meal`
--

CREATE TABLE `meal` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `photo` varchar(30) NOT NULL,
  `description` varchar(250) NOT NULL,
  `quantityInStock` tinyint(4) NOT NULL,
  `buyPrice` double NOT NULL,
  `salePrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `meal`
--

INSERT INTO `meal` (`id`, `name`, `photo`, `description`, `quantityInStock`, `buyPrice`, `salePrice`) VALUES
(1, 'hotdog', 'hotdog.jpeg', 'delicieux hotdog', 40, 2, 5),
(2, 'frites', 'frites.jpg', 'frites maison', 100, 1, 3),
(3, 'Bacon Cheeseburguer', 'bacon_cheeseburger.jpg', 'servi avec des frites', 50, 4, 15),
(4, 'Bagel thon', 'bagel_thon.jpg', 'poisson frais', 20, 5, 16),
(5, 'Carrot cake', 'carrot_cake.jpg', 'gateau vegie', 12, 2, 8),
(6, 'Chocolate Donut', 'chocolate_donut.jpg', '100% cacao', 14, 0.5, 3),
(7, 'Coca cola', 'coca.jpg', 'trade mark', 100, 0.3, 3.5),
(8, 'Milkshake', 'milkshake.jpg', 'une vrai boisson', 50, 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `orderLine`
--

CREATE TABLE `orderLine` (
  `id` int(11) NOT NULL,
  `quantityOrdered` int(4) NOT NULL,
  `meal_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `priceEach` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `orderLine`
--

INSERT INTO `orderLine` (`id`, `quantityOrdered`, `meal_id`, `order_id`, `priceEach`) VALUES
(1, 2, 2, 1, 11),
(2, 2, 1, 17, 5),
(3, 3, 6, 17, 3),
(4, 2, 1, 18, 5),
(5, 3, 6, 18, 3),
(6, 2, 1, 19, 5),
(7, 3, 6, 19, 3),
(8, 5, 1, 19, 5),
(9, 2, 1, 20, 5),
(10, 3, 6, 20, 3),
(11, 5, 1, 20, 5),
(12, 78, 1, 20, 5),
(13, 2, 1, 21, 5),
(14, 3, 6, 21, 3),
(15, 5, 1, 21, 5),
(16, 78, 1, 21, 5),
(17, 5, 1, 21, 5),
(18, 2, 1, 22, 5),
(19, 3, 6, 22, 3),
(20, 5, 1, 22, 5),
(21, 78, 1, 22, 5),
(22, 5, 1, 22, 5),
(23, 2, 1, 23, 5),
(24, 3, 6, 23, 3),
(25, 5, 1, 23, 5),
(26, 78, 1, 23, 5),
(27, 5, 1, 23, 5);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `totalAmount` double NOT NULL,
  `taxRate` float DEFAULT NULL,
  `taxAmount` double DEFAULT NULL,
  `creationTimeStamp` datetime NOT NULL,
  `completeTimeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `totalAmount`, `taxRate`, `taxAmount`, `creationTimeStamp`, `completeTimeStamp`) VALUES
(1, 1, 20, NULL, NULL, '2018-07-05 14:39:34', '2018-07-05 14:39:34'),
(2, 2, 419, NULL, NULL, '2018-07-05 15:01:08', '2018-07-05 15:01:08'),
(3, 2, 459, NULL, NULL, '2018-07-05 15:01:47', '2018-07-05 15:01:47'),
(4, 2, 923, NULL, NULL, '2018-07-05 15:02:18', '2018-07-05 15:02:18'),
(5, 2, 987, NULL, NULL, '2018-07-05 15:04:29', '2018-07-05 15:04:29'),
(6, 2, 1062, NULL, NULL, '2018-07-05 15:07:23', '2018-07-05 15:07:23'),
(7, 2, 1142, NULL, NULL, '2018-07-05 15:14:27', '2018-07-05 15:14:27'),
(8, 2, 1172, NULL, NULL, '2018-07-05 15:16:15', '2018-07-05 15:16:15'),
(9, 2, 2282, NULL, NULL, '2018-07-05 15:17:21', '2018-07-05 15:17:21'),
(10, 2, 2314, NULL, NULL, '2018-07-05 15:20:43', '2018-07-05 15:20:43'),
(11, 2, 2320, NULL, NULL, '2018-07-05 15:27:22', '2018-07-05 15:27:22'),
(12, 2, 2320, NULL, NULL, '2018-07-05 15:27:30', '2018-07-05 15:27:30'),
(13, 2, 2340, NULL, NULL, '2018-07-05 15:44:54', '2018-07-05 15:44:54'),
(14, 2, 2772, NULL, NULL, '2018-07-05 15:47:07', '2018-07-05 15:47:07'),
(15, 2, 16, NULL, NULL, '2018-07-05 16:25:07', '2018-07-05 16:25:07'),
(16, 2, 2772, NULL, NULL, '2018-07-05 16:26:12', '2018-07-05 16:26:12'),
(17, 2, 19, NULL, NULL, '2018-07-05 16:30:48', '2018-07-05 16:30:48'),
(18, 2, 19, NULL, NULL, '2018-07-05 16:39:01', '2018-07-05 16:39:01'),
(19, 2, 44, NULL, NULL, '2018-07-05 16:41:54', '2018-07-05 16:41:54'),
(20, 2, 434, NULL, NULL, '2018-07-05 16:55:22', '2018-07-05 16:55:22'),
(21, 2, 459, NULL, NULL, '2018-07-05 17:10:07', '2018-07-05 17:10:07'),
(22, 2, 459, NULL, NULL, '2018-07-05 17:13:30', '2018-07-05 17:13:30'),
(23, 2, 459, NULL, NULL, '2018-07-05 17:18:22', '2018-07-05 17:18:22');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(54) NOT NULL,
  `birthDate` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `city` varchar(40) NOT NULL,
  `zipCod` char(5) NOT NULL,
  `country` varchar(20) NOT NULL,
  `phone` char(10) NOT NULL,
  `creationTimeStamp` datetime NOT NULL,
  `lastLoginTimeStamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `firstName`, `lastName`, `email`, `password`, `birthDate`, `address`, `city`, `zipCod`, `country`, `phone`, `creationTimeStamp`, `lastLoginTimeStamp`) VALUES
(1, 'bruno', 'soares', 'bsrs23@gmail.com', '123456', '2018-05-12', '42 rue rene claire', 'paris', '75018', 'France', '606060610', '2018-06-25 15:51:49', '2018-06-25 15:51:49'),
(2, 'Bruno', 'Soares', 'bsrs23@gmail.com', '123', '1979-01-23', '39 rue de paris', 'perray', '78610', 'France', '0642123388', '2018-06-28 12:15:54', '2018-06-28 12:15:54'),
(3, 'Ali', 'A.', 'ali@gmail.com', '123', '1996-01-18', '42 rue rene claire', 'paris', '75018', 'France', '606060610', '2018-06-28 14:59:30', '2018-06-28 14:59:30');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `meal`
--
ALTER TABLE `meal`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orderLine`
--
ALTER TABLE `orderLine`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `booking`
--
ALTER TABLE `booking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `meal`
--
ALTER TABLE `meal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `orderLine`
--
ALTER TABLE `orderLine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
