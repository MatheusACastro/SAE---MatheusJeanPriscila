-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Maio-2016 às 13:50
-- Versão do servidor: 5.7.9
-- PHP Version: 5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sae`
--
create database sae;
use sae;
-- --------------------------------------------------------

--
-- Estrutura da tabela `5w2h`
--

DROP TABLE IF EXISTS `5w2h`;
CREATE TABLE IF NOT EXISTS `5w2h` (
  `id_5w2h` int(11) NOT NULL AUTO_INCREMENT,
  `oque` varchar(45) DEFAULT NULL,
  `como` varchar(45) DEFAULT NULL,
  `onde` varchar(45) DEFAULT NULL,
  `quando` varchar(45) DEFAULT NULL,
  `porque` varchar(45) DEFAULT NULL,
  `quem` varchar(45) DEFAULT NULL,
  `quanto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_5w2h`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `5w2h`
--

INSERT INTO `5w2h` (`id_5w2h`, `oque`, `como`, `onde`, `quando`, `porque`, `quem`, `quanto`) VALUES
(1, 'What1', 'How1', 'Where1', 'When1', 'Why1', 'Who1', 'How much1'),
(2, 'What2', 'How2', 'Where2', 'When2', 'Why2', 'Who2', 'How much2');

-- --------------------------------------------------------

--
-- Estrutura da tabela `acao_estrategica`
--

DROP TABLE IF EXISTS `acao_estrategica`;
CREATE TABLE IF NOT EXISTS `acao_estrategica` (
  `id_acao_estrategica` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `custo_planejado` float DEFAULT NULL,
  `custo_realizado` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `membro_id_membro` int(11) NOT NULL,
  `area_id_area` int(11) NOT NULL,
  `5w2h_id_5w2h` int(11) NOT NULL,
  PRIMARY KEY (`id_acao_estrategica`),
  KEY `fk_acao_estrategica_membro_idx` (`membro_id_membro`),
  KEY `fk_acao_estrategica_area1_idx` (`area_id_area`),
  KEY `fk_acao_estrategica_5w2h1_idx` (`5w2h_id_5w2h`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `acao_estrategica`
--

INSERT INTO `acao_estrategica` (`id_acao_estrategica`, `nome`, `descricao`, `custo_planejado`, `custo_realizado`, `status`, `membro_id_membro`, `area_id_area`, `5w2h_id_5w2h`) VALUES
(1, 'Ficar famoso', 'Todo mundo nos conhecer', 10.5, 1.99, 2, 1, 3, 1),
(2, 'Amigos', 'Todo mundo ser amigo', 0, 1.8, 5, 2, 5, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `area`
--

INSERT INTO `area` (`id_area`, `nome`) VALUES
(1, 'Administrativo-Financeiro'),
(2, 'Marketing e Vendas'),
(3, 'Presidencia'),
(4, 'Projetos'),
(5, 'Recursos Humanos'),
(6, 'Nucleo de Qualidade'),
(7, 'Nucleo de Responsabilidadde Social Empresarial');

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

DROP TABLE IF EXISTS `atividade`;
CREATE TABLE IF NOT EXISTS `atividade` (
  `id_atividade` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `data_inicio` int(11) DEFAULT NULL,
  `termino_planejado` int(11) DEFAULT NULL,
  `termino_efetivo` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entrega_planejada` int(11) DEFAULT NULL,
  `entrega_realizada` int(11) DEFAULT NULL,
  `obs` varchar(120) DEFAULT NULL,
  `acao_estrategica_id_acao_estrategica` int(11) NOT NULL,
  PRIMARY KEY (`id_atividade`),
  KEY `fk_atividade_acao_estrategica1_idx` (`acao_estrategica_id_acao_estrategica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `membro`
--

DROP TABLE IF EXISTS `membro`;
CREATE TABLE IF NOT EXISTS `membro` (
  `id_membro` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `cargo_em_execucao` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id_membro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `membro`
--

INSERT INTO `membro` (`id_membro`, `nome`, `cargo_em_execucao`) VALUES
(1, 'Caio', 'Presidente'),
(2, 'Paulo', 'Recursos Humanos');

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `acao_estrategica`
--
ALTER TABLE `acao_estrategica`
  ADD CONSTRAINT `fk_acao_estrategica_5w2h1` FOREIGN KEY (`5w2h_id_5w2h`) REFERENCES `5w2h` (`id_5w2h`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acao_estrategica_area1` FOREIGN KEY (`area_id_area`) REFERENCES `area` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_acao_estrategica_membro` FOREIGN KEY (`membro_id_membro`) REFERENCES `membro` (`id_membro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `fk_atividade_acao_estrategica1` FOREIGN KEY (`acao_estrategica_id_acao_estrategica`) REFERENCES `acao_estrategica` (`id_acao_estrategica`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
