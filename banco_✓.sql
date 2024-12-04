-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Dez-2024 às 18:41
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sa_felipe`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `id_categ` int(11) NOT NULL,
  `desc_categ` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id_categ`, `desc_categ`) VALUES
(1, 'Processador'),
(2, 'Placa Mãe'),
(6, 'Mouse'),
(9, 'Memória Ram'),
(10, 'Teclado'),
(11, 'Monitor'),
(12, 'Cooler'),
(13, 'placa de video');

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `email_cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nome_cliente`, `email_cliente`) VALUES
(1, 'felipe', 'felipe1705@gmail.com'),
(3, 'leandro', 'lendro@gmail.com');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_usuarios`
--

CREATE TABLE `login_usuarios` (
  `id_login` int(3) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `senha` varchar(30) NOT NULL,
  `nivel` varchar(18) DEFAULT NULL,
  `funcionario` varchar(30) DEFAULT NULL,
  `qntd_os` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `login_usuarios`
--

INSERT INTO `login_usuarios` (`id_login`, `usuario`, `senha`, `nivel`, `funcionario`, `qntd_os`) VALUES
(1, 'adm', '123', 'Administrador', 'Adm', 0),
(48, 'sergio', '123', 'Funcionário', 'sergio', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `os`
--

CREATE TABLE `os` (
  `id_os` int(3) NOT NULL,
  `os_data_inicio` date NOT NULL,
  `os_data_fim` date DEFAULT NULL,
  `os_previsto` date NOT NULL,
  `os_descriçao` text NOT NULL,
  `os_atribuido` varchar(30) NOT NULL,
  `os_sit` varchar(20) NOT NULL,
  `os_preco` decimal(10,0) NOT NULL,
  `os_prod_1` varchar(50) NOT NULL,
  `os_prod_2` varchar(50) DEFAULT NULL,
  `os_prod_3` varchar(50) DEFAULT NULL,
  `cliente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `os`
--

INSERT INTO `os` (`id_os`, `os_data_inicio`, `os_data_fim`, `os_previsto`, `os_descriçao`, `os_atribuido`, `os_sit`, `os_preco`, `os_prod_1`, `os_prod_2`, `os_prod_3`, `cliente`) VALUES
(12, '2024-11-25', NULL, '2024-11-15', 'leandro estragou o pc', 'Jerso', 'Pendente', '1000', '3090 nvi', 'LG 144hz', NULL, 'leandro'),
(21, '2024-11-27', NULL, '2024-11-07', 'muitogrande grande de mais demasiado grande que nem a biblia quie é grande', 'sergio', 'Pendente', '123', 'ryzen 5 rtx on sla oq', NULL, NULL, 'felipe'),
(22, '2024-12-04', NULL, '2024-12-18', 'asdasd', 'admin', 'Pendente', '123', 'LG 144hz', NULL, NULL, 'felipe');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_prod` int(11) NOT NULL,
  `desc_prod` varchar(50) DEFAULT NULL,
  `qntd_prod` int(11) DEFAULT NULL,
  `prec_prod` decimal(10,2) DEFAULT NULL,
  `categoria` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id_prod`, `desc_prod`, `qntd_prod`, `prec_prod`, `categoria`) VALUES
(1, 'RTX', -1, '2000.00', 'placa de video'),
(2, 'ryzen 5 rtx on sla oq', 121, '2500.00', 'placa'),
(3, 'LG 144hz', 2, '200.00', 'Monitor'),
(4, 'BackLit Preto', 2, '300.00', 'Teclado'),
(5, 'teclado redragon', 122, '300.00', 'Teclado'),
(6, '3090 nvi', 120, '3500.99', 'Mouse');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categ`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `login_usuarios`
--
ALTER TABLE `login_usuarios`
  ADD PRIMARY KEY (`id_login`);

--
-- Índices para tabela `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id_os`),
  ADD KEY `fk_cod_login` (`os_atribuido`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_prod`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `login_usuarios`
--
ALTER TABLE `login_usuarios`
  MODIFY `id_login` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `os`
--
ALTER TABLE `os`
  MODIFY `id_os` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_prod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
