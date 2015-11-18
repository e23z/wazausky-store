-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.6.17 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura do banco de dados para wazausky_store
CREATE DATABASE IF NOT EXISTS `wazausky_store` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `wazausky_store`;


-- Copiando estrutura para tabela wazausky_store.autores
CREATE TABLE IF NOT EXISTS `autores` (
  `id` int(11) unsigned NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wazausky_store.autores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` (`id`, `nome`) VALUES
	(1, 'Isaac Asimov'),
	(2, 'Arthur C. Clarke');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;


-- Copiando estrutura para tabela wazausky_store.livros
CREATE TABLE IF NOT EXISTS `livros` (
  `id` int(10) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `ibsn` varchar(30) NOT NULL,
  `paginas` smallint(6) NOT NULL,
  `autor` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Autores_Livros` (`autor`),
  CONSTRAINT `FK_Autores_Livros` FOREIGN KEY (`autor`) REFERENCES `autores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela wazausky_store.livros: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` (`id`, `nome`, `ibsn`, `paginas`, `autor`) VALUES
	(1, 'Eu, Robô', '9788576572008', 320, 1),
	(2, 'O Fim da Eternidade', '9788576570417', 256, 1),
	(3, '2001 - Uma Odisseia No Espaço', '9788576571551', 336, 2);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
