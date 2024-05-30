-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Creato il: Mag 26, 2024 alle 20:33
-- Versione del server: 8.0.36
-- Versione PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_film`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `attore`
--

CREATE TABLE `attore` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `regista`
--

CREATE TABLE `regista` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `birthday_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



-- --------------------------------------------------------

--
-- Struttura della tabella `genere`
--

CREATE TABLE `genere` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Struttura della tabella `film`
--

CREATE TABLE `film` (
  `id` int NOT NULL,
  `synopsis` text COLLATE utf8mb4_general_ci,
  `title` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `duration` int NOT NULL,
  `released_year` year NOT NULL,
  `poster` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `film_attore`
--

CREATE TABLE `film_attore` (
  `film_id` int NOT NULL,
  `attore_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `film_regista`
--

CREATE TABLE `film_regista` (
  `film_id` int NOT NULL,
  `regista_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Struttura della tabella `film_genere`
--

CREATE TABLE `film_genere` (
  `film_id` int NOT NULL,
  `genere_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Struttura della tabella `film_user`
--

CREATE TABLE `film_user` (
  `film_id` int NOT NULL,
  `user_id` int NOT NULL,
  `rating` float DEFAULT NULL
) ;


-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(50) NOT NULL,
  `profile_photo` varchar(256) NOT NULL,
  `registration_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `attore`
--
ALTER TABLE `attore`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `regista`
--
ALTER TABLE `regista`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `genere`
--
ALTER TABLE `genere`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `film_attore`
--
ALTER TABLE `film_attore`
  ADD PRIMARY KEY (`film_id`,`attore_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `attore_id` (`attore_id`);

--
-- Indici per le tabelle `film_regista`
--
ALTER TABLE `film_regista`
  ADD PRIMARY KEY (`film_id`,`regista_id`),
  ADD KEY `film_id` (`film_id`),
  ADD KEY `regista_id` (`regista_id`);

--
-- Indici per le tabelle `film_genere`
--
ALTER TABLE `film_genere`
  ADD PRIMARY KEY (`film_id`,`genere_id`),
  ADD KEY `genere_id` (`genere_id`);

--
-- Indici per le tabelle `film_user`
--
ALTER TABLE `film_user`
  ADD PRIMARY KEY (`film_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `attore`
--
ALTER TABLE `attore`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT per la tabella `regista`
--
ALTER TABLE `regista`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `genere`
--
ALTER TABLE `genere`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT per la tabella `film`
--
ALTER TABLE `film`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `film_attore`
--
ALTER TABLE `film_attore`
  ADD CONSTRAINT `film_attore_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `film_attore_ibfk_2` FOREIGN KEY (`attore_id`) REFERENCES `attore` (`id`);

--
-- Limiti per la tabella `film_regista`
--
ALTER TABLE `film_regista`
  ADD CONSTRAINT `film_regista_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `film_regista_ibfk_2` FOREIGN KEY (`regista_id`) REFERENCES `regista` (`id`);

--
-- Limiti per la tabella `film_genere`
--
ALTER TABLE `film_genere`
  ADD CONSTRAINT `film_genere_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `film_genere_ibfk_2` FOREIGN KEY (`genere_id`) REFERENCES `genere` (`id`);

--
-- Limiti per la tabella `film_user`
--
ALTER TABLE `film_user`
  ADD CONSTRAINT `film_user_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `film_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
