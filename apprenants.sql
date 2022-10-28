-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db
-- Généré le : ven. 28 oct. 2022 à 11:00
-- Version du serveur : 8.0.31
-- Version de PHP : 8.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `apprenants`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_apprenant` int NOT NULL,
  `nom_apprenant` varchar(50) NOT NULL,
  `prenom_apprenant` varchar(50) NOT NULL,
  `mail_apprenant` varchar(250) NOT NULL,
  `id_experience` int DEFAULT NULL,
  `experience_test` enum('novice','intermediaire','expert') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id_apprenant`, `nom_apprenant`, `prenom_apprenant`, `mail_apprenant`, `id_experience`, `experience_test`) VALUES
(1, 'ZOUITEN', 'Guinel', 'guinel.zouiten@isen-ouest.yncrea.fr', 1, NULL),
(2, 'LE GRAND', 'Kevin', 'kevin.le-grand@isen-ouest.yncrea.fr', 1, NULL),
(3, 'PETIARD', 'Harold', 'harold.petiard@isen-ouest.yncrea.fr', 1, NULL),
(4, 'SCANU', 'David', 'david.scanu@isen-ouest.yncrea.fr', 1, NULL),
(5, 'ANCELIN', 'Antoine', 'antoine.ancelin@isen-ouest.yncrea.fr', 1, NULL),
(6, 'JOURNAUX', 'Johann', 'johann.journaux@isen-ouest.yncrea.fr', 1, NULL),
(7, 'LEBARBIER', 'Charley', 'charley.lebarbier@isen-ouest.yncrea.fr', 1, NULL),
(8, 'DIABY', 'Amadou', 'amadou.diaby@isen-ouest.yncrea.fr', 1, NULL),
(9, 'DAUMER', 'Geoffroy', 'geoffroy.daumer@isen-ouest.yncrea.fr', 1, NULL),
(10, 'JULES', 'Dimitri', 'dimitri.jules@isen-ouest.yncrea.fr', 1, NULL),
(11, 'GUERIN', 'Basile', 'basile.guerin@isen-ouest.yncrea.fr', 1, NULL),
(12, 'OSWALD', 'Viacheslav', 'viacheslav.oswald@isen-ouest.yncrea.fr', 1, NULL),
(13, 'DUSSART', 'Ramata-Soraya', 'ramata-soraya.dussart@isen-ouest.yncrea.fr', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_groupe`
--

CREATE TABLE `etudiant_groupe` (
  `id_apprenant` int NOT NULL,
  `id_groupes` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `experience`
--

CREATE TABLE `experience` (
  `id_experience` int NOT NULL,
  `nom_experience` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `experience`
--

INSERT INTO `experience` (`id_experience`, `nom_experience`) VALUES
(1, 'novice'),
(2, 'intermediaire'),
(3, 'expert');

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_groupe` int NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_apprenant`),
  ADD KEY `fk_exp_apprenant` (`id_experience`);

--
-- Index pour la table `etudiant_groupe`
--
ALTER TABLE `etudiant_groupe`
  ADD KEY `id_groupes` (`id_groupes`),
  ADD KEY `numero_groupe` (`id_apprenant`);

--
-- Index pour la table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`id_experience`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_groupe`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_apprenant` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `experience`
--
ALTER TABLE `experience`
  MODIFY `id_experience` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_groupe` int NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `fk_exp_apprenant` FOREIGN KEY (`id_experience`) REFERENCES `experience` (`id_experience`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `etudiant_groupe`
--
ALTER TABLE `etudiant_groupe`
  ADD CONSTRAINT `etudiant_groupe_ibfk_1` FOREIGN KEY (`id_groupes`) REFERENCES `groupe` (`id_groupe`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `etudiant_groupe_ibfk_2` FOREIGN KEY (`id_apprenant`) REFERENCES `etudiant` (`id_apprenant`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
