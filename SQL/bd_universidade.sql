/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bd_universidade` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `bd_universidade`;

/*Table structure for table `tb_alunos` */

DROP TABLE IF EXISTS `tb_alunos`;

CREATE TABLE `tb_alunos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(10) unsigned NOT NULL,
  `matricula` varchar(10) DEFAULT NULL,
  `situacao` enum('R','I','A') DEFAULT 'R' COMMENT 'R->Regula/I->Irregula/A->Análise',
  `cadastrado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cadastrado_por` int(11) DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int(11) DEFAULT NULL,
  `oculto` enum('N','S') NOT NULL DEFAULT 'N' COMMENT 'N->Não/S->Sim',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0->Inativo/1->Ativo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `aluno_matricula` (`matricula`),
  KEY `aluno_situacao` (`situacao`),
  KEY `aluno_datas_cadastro` (`cadastrado_em`,`atualizado_em`),
  KEY `aluno_usuario_cadastro` (`cadastrado_por`,`atualizado_por`),
  KEY `aluno_oculto_status` (`id`,`oculto`,`status`),
  KEY `FK_aluno_pessoa_idpessoa` (`id_pessoa`),
  CONSTRAINT `FK_aluno_pessoa_idpessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `tb_pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_alunos` */

insert  into `tb_alunos`(`id`,`id_pessoa`,`matricula`,`situacao`,`cadastrado_em`,`cadastrado_por`,`atualizado_em`,`atualizado_por`,`oculto`,`status`) values 
(1,1,'2015010101','R','2021-11-23 14:23:05',NULL,NULL,NULL,'N','1'),
(2,2,'2015010102','R','2021-11-23 14:23:06',NULL,NULL,NULL,'N','1'),
(3,3,'2015010103','R','2021-11-23 14:23:07',NULL,NULL,NULL,'N','1'),
(4,4,'2015010104','R','2021-11-23 14:23:08',NULL,NULL,NULL,'N','1'),
(5,5,'2015010105','R','2021-11-23 14:23:08',NULL,NULL,NULL,'N','1'),
(6,6,'2015010106','R','2021-11-23 14:23:09',NULL,NULL,NULL,'N','1');

/*Table structure for table `tb_disciplina` */

DROP TABLE IF EXISTS `tb_disciplina`;

CREATE TABLE `tb_disciplina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `carga_horaria` varchar(4) DEFAULT NULL,
  `cadastrado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `cadastrado_por` int(11) DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int(11) DEFAULT NULL,
  `oculto` enum('N','S') DEFAULT 'N' COMMENT 'N->Não/S->Sim',
  `status` enum('0','1') DEFAULT '1' COMMENT '0->Inativo/1->Ativo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `disciplina_codigo` (`codigo`),
  KEY `disciplina_nome` (`nome`),
  KEY `disciplina_cargahoraria` (`carga_horaria`),
  KEY `disciplina_datacadastro` (`cadastrado_em`,`atualizado_em`),
  KEY `disciplina_usuariocadastro` (`cadastrado_por`,`atualizado_por`),
  KEY `disciplina_oculto_status` (`id`,`oculto`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_disciplina` */

insert  into `tb_disciplina`(`id`,`codigo`,`nome`,`carga_horaria`,`cadastrado_em`,`cadastrado_por`,`atualizado_em`,`atualizado_por`,`oculto`,`status`) values 
(1,'BDI','BANCO DE DADOS I','100','2021-11-23 14:21:43',1,NULL,NULL,'N','1'),
(2,'BDII','BANCO DE DADOS II','100','2021-11-23 14:21:43',1,NULL,NULL,'N','1'),
(3,'BDIII','BANCO DE DADOS III','100','2021-11-23 14:21:43',1,NULL,NULL,'N','1'),
(4,'PABD','PROGRAMAÇÃO COM ACESSO A BANCO DE DADOS','100','2021-11-23 14:21:43',1,NULL,NULL,'N','1'),
(5,'POO','PROGRAMAÇÃO ORIENTADA A OBJETOS','80','2021-11-23 14:21:43',1,NULL,NULL,'N','1'),
(6,'ENGS','ENGENHARIA DE SOFTWARE','80','2021-11-23 14:21:43',1,NULL,NULL,'N','1'),
(7,'WEB','AUTORIA WEB','50','2021-11-23 14:21:43',1,NULL,NULL,'N','1');

/*Table structure for table `tb_historico_academico` */

DROP TABLE IF EXISTS `tb_historico_academico`;

CREATE TABLE `tb_historico_academico` (
  `matricula` varchar(10) DEFAULT NULL,
  `codigo_turma` varchar(10) DEFAULT NULL,
  `frequencia` double DEFAULT NULL,
  `nota` double DEFAULT NULL,
  `cadastrado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `cadastrado_por` int(11) DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int(11) DEFAULT NULL,
  `oculto` enum('N','S') DEFAULT 'N',
  `status` enum('0','1') DEFAULT '1',
  KEY `historico_vida_academica` (`frequencia`,`nota`),
  KEY `historico_datacadastro` (`cadastrado_em`,`atualizado_em`),
  KEY `historico_usuariocadastro` (`cadastrado_por`,`atualizado_por`),
  KEY `historico_oculto_status` (`oculto`,`status`),
  KEY `FK_historico_turma_codturma` (`codigo_turma`),
  KEY `historico_join` (`matricula`,`codigo_turma`),
  CONSTRAINT `FK_historico_aluno_matricula` FOREIGN KEY (`matricula`) REFERENCES `tb_alunos` (`matricula`),
  CONSTRAINT `FK_historico_turma_codturma` FOREIGN KEY (`codigo_turma`) REFERENCES `tb_turma` (`codigo_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_historico_academico` */

insert  into `tb_historico_academico`(`matricula`,`codigo_turma`,`frequencia`,`nota`,`cadastrado_em`,`cadastrado_por`,`atualizado_em`,`atualizado_por`,`oculto`,`status`) values 
('2015010101','BD12015-1',100,100,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010101','POO2015-1',80,100,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010101','WEB2015-1',70,60,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010102','BD22015-1',70,60,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010102','POO2015-1',100,100,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010102','WEB2015-1',90,96,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010103','BD32015-1',100,100,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010103','POO2015-1',50,65,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010103','WEB2015-1',70,70,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010104','BD22015-1',75,75,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010104','WEB2015-1',80,80,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010105','BD32015-1',90,90,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010105','POO2015-1',79,88,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010106','BD12015-1',60,60,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010106','BD22015-1',60,70,'2021-11-23 14:38:46',1,NULL,NULL,'N','1'),
('2015010106','WEB2015-1',60,80,'2021-11-23 14:38:46',1,NULL,NULL,'N','1');

/*Table structure for table `tb_pessoa` */

DROP TABLE IF EXISTS `tb_pessoa`;

CREATE TABLE `tb_pessoa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `cep` varchar(50) DEFAULT NULL,
  `telefone_celular` varchar(50) DEFAULT NULL,
  `email_principal` varchar(255) DEFAULT NULL,
  `cadastrado_em` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cadastrado_por` int(11) DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int(11) DEFAULT NULL,
  `oculto` enum('N','S') NOT NULL DEFAULT 'N' COMMENT 'N->Não/S->Sim',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0->Inativo/1->Ativo',
  PRIMARY KEY (`id`),
  KEY `pessoa_nome` (`nome`),
  KEY `pessoa_rua` (`rua`),
  KEY `pessoa_bairro` (`bairro`),
  KEY `pessoa_numero` (`numero`),
  KEY `pessoa_complemento` (`complemento`),
  KEY `pessoa_cep` (`cep`),
  KEY `pessoa_telefoneprincipal` (`telefone_celular`),
  KEY `pessoa_emailprincipal` (`email_principal`),
  KEY `pessoa_datacadastro` (`cadastrado_em`,`atualizado_em`),
  KEY `pessoa_usuariocadastro` (`cadastrado_por`,`atualizado_por`),
  KEY `pessoa_oculto_status` (`oculto`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pessoa` */

insert  into `tb_pessoa`(`id`,`nome`,`cidade`,`rua`,`bairro`,`numero`,`complemento`,`cep`,`telefone_celular`,`email_principal`,`cadastrado_em`,`cadastrado_por`,`atualizado_em`,`atualizado_por`,`oculto`,`status`) values 
(1,'JOSÉ DE ALENCAR','NATAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:12:16',1,NULL,NULL,'N','1'),
(2,'JOÃO JOSÉ','JOÃO PESSOA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:12:21',1,NULL,NULL,'N','1'),
(3,'MARIA JOAQUINA','RECIFE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:12:25',1,NULL,NULL,'N','1'),
(4,'MARIA DAS DORES','FORTALEZA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:12:29',1,NULL,NULL,'N','1'),
(5,'JOSUÉ CLAUDINO DOS SANTOS','NATAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:12:46',1,NULL,NULL,'N','1'),
(6,'JOSUÉLISSON CLAUDINO DOS SANTOS','NATAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:12:52',1,NULL,NULL,'N','1'),
(7,'BRUNO THEODOR JHOHANSEN','BELO HORIZONTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:13:43',1,NULL,NULL,'N','0'),
(8,'NICKERSON FERREIRA','JOÃO PESSOA',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:14:28',1,NULL,NULL,'N','1'),
(9,'ADORILSON BEZERRA','NATAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:14:38',1,NULL,NULL,'N','1'),
(10,'DIEGO OLIVEIRA','NATAL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:14:39',1,NULL,NULL,'N','1'),
(11,'ADONIRAN BEZERRA','BELO HORIZONTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2021-11-23 14:14:46',1,NULL,NULL,'N','1');

/*Table structure for table `tb_professor` */

DROP TABLE IF EXISTS `tb_professor`;

CREATE TABLE `tb_professor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(10) unsigned NOT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `situacao` enum('R','I','A') DEFAULT 'R' COMMENT 'R->Regular/I->Irregular/A->Análise',
  `cadastrado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `cadastrado_por` int(11) DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int(11) DEFAULT NULL,
  `oculto` enum('N','S') DEFAULT 'N' COMMENT 'N->Não',
  `status` enum('0','1') DEFAULT '1' COMMENT 'S->Sim',
  PRIMARY KEY (`id`),
  UNIQUE KEY `professor_codigo` (`codigo`),
  KEY `professor_situacao` (`situacao`),
  KEY `professor_datacaastro` (`cadastrado_em`,`atualizado_em`),
  KEY `professor_usuariocadastro` (`cadastrado_por`,`atualizado_por`),
  KEY `professor_oculto_status` (`id`,`oculto`,`status`),
  KEY `professor_pessoa_idpessoa` (`id_pessoa`),
  CONSTRAINT `professor_pessoa_idpessoa` FOREIGN KEY (`id_pessoa`) REFERENCES `tb_pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_professor` */

insert  into `tb_professor`(`id`,`id_pessoa`,`codigo`,`situacao`,`cadastrado_em`,`cadastrado_por`,`atualizado_em`,`atualizado_por`,`oculto`,`status`) values 
(1,8,'212131','R','2021-11-23 14:25:06',1,NULL,NULL,'N','1'),
(2,9,'122135','R','2021-11-23 14:25:06',1,NULL,NULL,'N','1'),
(3,10,'192011','A','2021-11-23 14:25:06',1,NULL,NULL,'N','1'),
(4,11,'366548','R','2021-11-23 14:25:06',1,NULL,NULL,'N','1');

/*Table structure for table `tb_turma` */

DROP TABLE IF EXISTS `tb_turma`;

CREATE TABLE `tb_turma` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `codigo_turma` varchar(10) DEFAULT NULL,
  `codigo_disciplina` varchar(10) DEFAULT NULL,
  `codigo_professor` varchar(10) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `ano` year(4) DEFAULT NULL,
  `horário` varchar(50) DEFAULT NULL,
  `cadastrado_em` datetime DEFAULT CURRENT_TIMESTAMP,
  `cadastrado_por` int(11) DEFAULT NULL,
  `atualizado_em` datetime DEFAULT NULL,
  `atualizado_por` int(11) DEFAULT NULL,
  `oculto` enum('N','S') NOT NULL DEFAULT 'N' COMMENT 'N->Não/S->Sim',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0->Inativo/1->Ativo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `turma_codigo` (`codigo_turma`),
  KEY `turma_nome` (`nome`),
  KEY `turma_ano` (`ano`),
  KEY `turma_datacadastro` (`cadastrado_em`,`atualizado_em`),
  KEY `turma_usuariocadastro` (`cadastrado_por`,`atualizado_por`),
  KEY `turma_oculto_status` (`id`,`oculto`,`status`),
  KEY `FK_turma_professor` (`codigo_professor`),
  KEY `FK_turma_disciplina` (`codigo_disciplina`),
  CONSTRAINT `FK_turma_disciplina` FOREIGN KEY (`codigo_disciplina`) REFERENCES `tb_disciplina` (`codigo`),
  CONSTRAINT `FK_turma_professor` FOREIGN KEY (`codigo_professor`) REFERENCES `tb_professor` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_turma` */

insert  into `tb_turma`(`id`,`codigo_turma`,`codigo_disciplina`,`codigo_professor`,`nome`,`ano`,`horário`,`cadastrado_em`,`cadastrado_por`,`atualizado_em`,`atualizado_por`,`oculto`,`status`) values 
(1,'BD12015-1','BDI','212131','TURMA BANCO DE DADOS I',2015,'11H-12H','2021-11-23 14:26:35',1,NULL,NULL,'N','1'),
(2,'BD22015-1','BDII','122135','TURMA BANCO DE DADOS II',2015,'13H-14H','2021-11-23 14:27:17',1,NULL,NULL,'N','1'),
(3,'BD32015-1','BDIII','192011','TURMA BANCO DE DADOS III',2015,'08H-09H','2021-11-23 14:27:45',1,NULL,NULL,'N','1'),
(4,'POO2015-1','POO','192011','TURMA POO',2015,'07H-08H','2021-11-23 14:28:10',1,NULL,NULL,'N','1'),
(5,'WEB2015-1','WEB','212131','TURMA WEB',2015,'10H-11H','2021-11-23 14:29:29',1,NULL,NULL,'N','1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
