-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 15 avr. 2022 à 03:49
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `groupomania`
--

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL,
  `comment` varchar(500) NOT NULL,
  `authorId` int(11) NOT NULL,
  `postId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`idComment`, `comment`, `authorId`, `postId`) VALUES
(230, 'Du café', 113, 417),
(234, 'gogo', 112, 417),
(235, 'yes', 115, 417),
(236, 'chouette', 115, 423),
(237, 'Le chat', 115, 424);

-- --------------------------------------------------------

--
-- Structure de la table `like`
--

CREATE TABLE `like` (
  `likeId` int(11) NOT NULL,
  `postId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `like`
--

INSERT INTO `like` (`likeId`, `postId`, `userId`) VALUES
(670, 417, 112),
(674, 424, 115),
(675, 423, 115),
(676, 417, 115);

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

CREATE TABLE `post` (
  `postId` int(11) NOT NULL,
  `text` varchar(300) DEFAULT NULL,
  `imageUrl` varchar(300) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `like` int(11) DEFAULT 0,
  `authorId` int(11) NOT NULL,
  `comment` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`postId`, `text`, `imageUrl`, `date`, `like`, `authorId`, `comment`) VALUES
(417, 'Coucou', 'http://localhost:3000/images/post/image1649761946608.undefined', '2022-04-12 13:12:26', 2, 112, 3),
(423, 'Le monde', 'http://localhost:3000/images/post/image1649986287146.gif', '2022-04-15 03:31:27', 1, 113, 1),
(424, 'Salut', 'http://localhost:3000/images/post/image1649986405206.gif', '2022-04-15 03:33:25', 1, 115, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(250) NOT NULL,
  `pp` varchar(500) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `admin` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `email`, `password`, `pp`, `desc`, `admin`) VALUES
(112, 'userdeux', 'userdeux', 'userdeux@mail.com', '$2b$10$egWZKoSm4KaS0864mD9K7eIHpifoKV1HeEZrKaAchOv9d357uflN.', 'http://localhost:3000/images/profile/image1649566000690.png', NULL, 0),
(113, 'admin', 'admin', 'admin@mail.com', '$2b$10$S6MqCwFPhj467FeBzq3eu.OjKhoXxswAVWp1fHa26hmzKA4qz75GW', 'http://localhost:3000/images/profile/image1649566038469.png', 'admin', 1),
(115, 'userun', 'userun', 'userun@mail.com', '$2b$10$gvPGnp3R5fCdjtSrlEpLGOWbVFIVRpxiytFN24ihJeDW7eXc8b.62', 'http://localhost:3000/images/profile/image1649986380685.jpg', NULL, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`idComment`),
  ADD KEY `authorId_idx` (`authorId`),
  ADD KEY `postId_idx` (`postId`);

--
-- Index pour la table `like`
--
ALTER TABLE `like`
  ADD PRIMARY KEY (`likeId`),
  ADD KEY `postId_idx` (`postId`),
  ADD KEY `userIdlike_idx` (`userId`);

--
-- Index pour la table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`postId`),
  ADD KEY `authorId_idx` (`authorId`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `idComment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT pour la table `like`
--
ALTER TABLE `like`
  MODIFY `likeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=677;

--
-- AUTO_INCREMENT pour la table `post`
--
ALTER TABLE `post`
  MODIFY `postId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=425;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `author` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `postId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE;

--
-- Contraintes pour la table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `postIdlikes` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE,
  ADD CONSTRAINT `userIdlike` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `authorId` FOREIGN KEY (`authorId`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
