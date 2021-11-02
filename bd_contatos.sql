-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.1.73-community - MySQL Community Server (GPL)
-- OS do Servidor:               Win32
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bd_contatos
CREATE DATABASE IF NOT EXISTS `bd_contatos` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `bd_contatos`;

-- Copiando estrutura para tabela bd_contatos.contato
CREATE TABLE IF NOT EXISTS `contato` (
  `cont_id` varchar(50) COLLATE armscii8_bin NOT NULL DEFAULT '',
  `cont_nome` varchar(100) COLLATE armscii8_bin DEFAULT '',
  `cont_empresa` varchar(100) COLLATE armscii8_bin DEFAULT '',
  PRIMARY KEY (`cont_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_contatos.contato_email
CREATE TABLE IF NOT EXISTS `contato_email` (
  `conte_id` int(11) NOT NULL AUTO_INCREMENT,
  `conte_cont_id` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `conte_email` varchar(100) COLLATE armscii8_bin DEFAULT '',
  `conte_tipo` varchar(20) COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`conte_id`),
  KEY `email_contato` (`conte_cont_id`) USING BTREE,
  CONSTRAINT `emails` FOREIGN KEY (`conte_cont_id`) REFERENCES `contato` (`cont_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_contatos.contato_telefone
CREATE TABLE IF NOT EXISTS `contato_telefone` (
  `contt_id` int(11) NOT NULL AUTO_INCREMENT,
  `contt_cont_id` varchar(50) COLLATE armscii8_bin DEFAULT NULL,
  `contt_ddd` varchar(3) COLLATE armscii8_bin DEFAULT '',
  `contt_numero` varchar(10) COLLATE armscii8_bin DEFAULT '',
  `contt_tipo` varchar(20) COLLATE armscii8_bin DEFAULT '',
  PRIMARY KEY (`contt_id`),
  KEY `telefone_contato` (`contt_cont_id`) USING BTREE,
  CONSTRAINT `telefones` FOREIGN KEY (`contt_cont_id`) REFERENCES `contato` (`cont_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela bd_contatos.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usu_id` varchar(50) COLLATE armscii8_bin NOT NULL,
  `usu_nome` varchar(100) COLLATE armscii8_bin NOT NULL,
  `usu_login` varchar(20) COLLATE armscii8_bin NOT NULL,
  `usu_senha` varchar(20) COLLATE armscii8_bin NOT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
