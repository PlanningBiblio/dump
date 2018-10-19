-- MySQL dump 10.15  Distrib 10.0.36-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: planningb
-- ------------------------------------------------------
-- Server version	10.0.36-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pb_absences`
--

DROP TABLE IF EXISTS `pb_absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_absences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perso_id` int(11) NOT NULL DEFAULT '0',
  `debut` datetime NOT NULL,
  `fin` datetime NOT NULL,
  `motif` text NOT NULL,
  `motif_autre` text NOT NULL,
  `commentaires` text NOT NULL,
  `etat` text NOT NULL,
  `demande` datetime NOT NULL,
  `valide` int(11) NOT NULL DEFAULT '0',
  `validation` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valide_n1` int(11) NOT NULL DEFAULT '0',
  `validation_n1` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pj1` int(1) DEFAULT '0',
  `pj2` int(1) DEFAULT '0',
  `so` int(1) DEFAULT '0',
  `groupe` varchar(14) DEFAULT NULL,
  `cal_name` varchar(300) NOT NULL,
  `ical_key` text NOT NULL,
  `uid` text,
  `rrule` text,
  PRIMARY KEY (`id`),
  KEY `cal_name` (`cal_name`),
  KEY `perso_id` (`perso_id`),
  KEY `debut` (`debut`),
  KEY `fin` (`fin`),
  KEY `groupe` (`groupe`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_absences`
--

LOCK TABLES `pb_absences` WRITE;
/*!40000 ALTER TABLE `pb_absences` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_absences_infos`
--

DROP TABLE IF EXISTS `pb_absences_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_absences_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debut` date NOT NULL DEFAULT '0000-00-00',
  `fin` date NOT NULL DEFAULT '0000-00-00',
  `texte` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_absences_infos`
--

LOCK TABLES `pb_absences_infos` WRITE;
/*!40000 ALTER TABLE `pb_absences_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_absences_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_absences_recurrentes`
--

DROP TABLE IF EXISTS `pb_absences_recurrentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_absences_recurrentes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL,
  `perso_id` int(11) DEFAULT NULL,
  `event` text,
  `end` enum('0','1') NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` varchar(20) NOT NULL DEFAULT '',
  `last_check` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `perso_id` (`perso_id`),
  KEY `end` (`end`),
  KEY `last_check` (`last_check`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_absences_recurrentes`
--

LOCK TABLES `pb_absences_recurrentes` WRITE;
/*!40000 ALTER TABLE `pb_absences_recurrentes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_absences_recurrentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_acces`
--

DROP TABLE IF EXISTS `pb_acces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_acces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `groupe_id` int(11) NOT NULL,
  `groupe` text NOT NULL,
  `page` varchar(50) NOT NULL,
  `ordre` int(2) NOT NULL DEFAULT '0',
  `categorie` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_acces`
--

LOCK TABLES `pb_acces` WRITE;
/*!40000 ALTER TABLE `pb_acces` DISABLE KEYS */;
INSERT INTO `pb_acces` VALUES (1,'Authentification',99,'','authentification.php',0,''),(2,'Planning - Index',99,'','planning/index.php',0,''),(3,'Planning par poste - Index',99,'','planning/poste/index.php',0,''),(4,'Planning par poste - Semaine',99,'','planning/poste/semaine.php',0,''),(5,'Aide',99,'','aide/index.php',0,''),(6,'Absences - Index',100,'','absences/index.php',0,''),(7,'Absences - Voir',100,'','absences/voir.php',0,''),(8,'Absences - Ajouter',100,'','absences/ajouter.php',0,''),(9,'Personnel - Password',100,'','personnel/password.php',0,''),(10,'Admin Index',100,'','admin/index.php',0,''),(11,'Agenda - index',100,'Agenda','agenda/index.php',0,''),(12,'Absences - Modif',100,'','absences/modif.php',0,''),(13,'Absences - Modif2',100,'','absences/modif2.php',0,''),(14,'Absences - Suppression',100,'','absences/delete.php',0,''),(15,'Absences - Infos',201,'Gestion des absences, validation niveau 1','absences/infos.php',30,'Absences'),(16,'Personnel - Index',4,'Voir les fiches des agents','personnel/index.php',60,'Agents'),(17,'Personnel - Modif',4,'Voir les fiches des agents','personnel/modif.php',60,'Agents'),(18,'Liste des postes - Index',5,'Gestion des postes','postes/index.php',160,'Postes'),(19,'Liste des postes - Modif',5,'Gestion des postes','postes/modif.php',160,'Postes'),(20,'Liste des postes - Valid',5,'Gestion des postes','postes/valid.php',160,'Postes'),(21,'Planning Poste - Suppression',301,'Cr&eacute;ation / modification des plannings, utilisation et gestion des mod&egrave;les','planning/poste/supprimer.php',110,'Planning'),(22,'Planning Poste - Importer un mod&egrave;le',301,'Cr&eacute;ation / modification des plannings, utilisation et gestion des mod&egrave;les','planning/poste/importer.php',110,'Planning'),(23,'Planning Poste - Enregistrer un mod&egrave;le',301,'Cr&eacute;ation / modification des plannings, utilisation et gestion des mod&egrave;les','planning/poste/enregistrer.php',110,'Planning'),(24,'D&eacute;bogage',13,'D&eacute;bogage','',0,''),(25,'Statistiques',17,'Acc&egrave;s au statistiques','statistiques/index.php',170,'Statistiques'),(26,'stats agents par poste',17,'Acc&egrave;s au statistiques','statistiques/agents.php',170,'Statistiques'),(27,'stats postes par agent',17,'Acc&egrave;s au statistiques','statistiques/postes.php',170,'Statistiques'),(28,'Statistiques Postes de renfort',17,'Acc&egrave;s au statistiques','statistiques/postes_renfort.php',170,'Statistiques'),(29,'Statistiques par poste (synth&egrave;se)',17,'Acc&egrave;s au statistiques','statistiques/postes_synthese.php',170,'Statistiques'),(30,'Statistiques',17,'Acc&egrave;s au statistiques','statistiques/service.php',170,'Statistiques'),(31,'Statistiques',17,'Acc&egrave;s au statistiques','statistiques/statut.php',170,'Statistiques'),(32,'Feuille de temps-  index',17,'Acc&egrave;s au statistiques','statistiques/temps.php',170,'Statistiques'),(33,'Configuration avanc&eacute;e',20,'Configuration avanc&eacute;e','admin/config.php',0,''),(34,'Personnel - Suppression',21,'Gestion des agents','personnel/suppression.php',70,'Agents'),(35,'Personnel - Valid',21,'Gestion des agents','personnel/valid.php',70,'Agents'),(36,'Gestion du personnel',21,'Gestion des agents','',70,'Agents'),(37,'Configuration des tableaux',22,'Configuration des tableaux','planning/postes_cfg/index.php',140,'Planning'),(38,'Configuration des horaires des tableaux',22,'Configuration des tableaux','planning/postes_cfg/horaires.php',140,'Planning'),(39,'Configuration des horaires des tableaux',22,'Configuration des tableaux','planning/postes_cfg/copie.php',140,'Planning'),(40,'Configuration des lignes des tableaux',22,'Configuration des tableaux','planning/postes_cfg/lignes.php',140,'Planning'),(41,'Activit&eacute;s - Index',5,'Gestion des postes','activites/index.php',160,'Postes'),(42,'Activit&eacute;s - Modification',5,'Gestion des postes','activites/modif.php',160,'Postes'),(43,'Activit&eacute;s - Validation',5,'Gestion des postes','activites/valid.php',160,'Postes'),(44,'Planning - Mod&egrave;les',301,'Cr&eacute;ation / modification des plannings, utilisation et gestion des mod&egrave;les','planning/modeles/index.php',110,'Planning'),(45,'Planning - Mod&egrave;les',301,'Cr&eacute;ation / modification des plannings, utilisation et gestion des mod&egrave;les','planning/modeles/modif.php',110,'Planning'),(46,'Planning - Mod&egrave;les',301,'Cr&eacute;ation / modification des plannings, utilisation et gestion des mod&egrave;les','planning/modeles/valid.php',110,'Planning'),(47,'Personnel - Suppression liste',21,'Gestion des agents','personnel/suppression-liste.php',70,'Agents'),(48,'Configuration des tableaux - Modif',22,'Configuration des tableaux','planning/postes_cfg/modif.php',140,'Planning'),(49,'Informations',23,'Informations','infos/index.php',0,''),(50,'Informations',23,'Informations','infos/modif.php',0,''),(51,'Informations',23,'Informations','infos/supprime.php',0,''),(52,'Informations',23,'Informations','infos/ajout.php',0,''),(53,'Configuration des tableaux - Modif',22,'Configuration des tableaux','planning/postes_cfg/lignes_sep.php',140,'Planning'),(54,'Configuration des tableaux - Modif',22,'Configuration des tableaux','planning/postes_cfg/groupes.php',140,'Planning'),(55,'Configuration des tableaux - Modif',22,'Configuration des tableaux','planning/postes_cfg/groupes2.php',140,'Planning'),(56,'Modification des plannings - menudiv',1001,'Modification des plannings','planning/poste/menudiv.php',120,'Planning'),(57,'Modification des plannings - majdb',1001,'Modification des plannings','planning/poste/majdb.php',120,'Planning'),(58,'Personnel - Importation',21,'Gestion des agents','personnel/import.php',70,'Agents'),(59,'Jours f&eacute;ri&eacute;s',25,'Gestion des jours f&eacute;ri&eacute;s','joursFeries/index.php',0,''),(60,'Jours f&eacute;ri&eacute;s',25,'Gestion des jours f&eacute;ri&eacute;s','joursFeries/valid.php',0,''),(61,'Voir les agendas de tous',3,'Voir les agendas de tous','',55,'Agendas'),(62,'Modifier ses propres absences',6,'Modifier ses propres absences','',20,'Absences'),(63,'Statistiques',17,'Acc&egrave;s au statistiques','statistiques/samedis.php',170,'Statistiques'),(64,'Gestion des absences, validation niveau 2',501,'Gestion des absences, validation niveau 2','',40,'Absences'),(65,'Statistiques',17,'Acc&egrave;s au statistiques','statistiques/absences.php',170,'Statistiques'),(66,'Gestion des absences, pi&egrave;ces justificatives',701,'Gestion des absences, pi&egrave;ces justificatives','',50,'Absences'),(67,'Planning Hebdo - Index',24,'Gestion des heures de pr&eacute;sence','planningHebdo/index.php',80,'Heures de pr&eacute;sence'),(68,'Planning Hebdo - Configuration',24,'Gestion des heures de pr&eacute;sence','planningHebdo/configuration.php',80,'Heures de pr&eacute;sence'),(69,'Planning Hebdo - Modif',100,'','planningHebdo/modif.php',0,''),(70,'Planning Hebdo - Mon Compte',100,'','monCompte.php',0,''),(71,'Planning Hebdo - Validation',100,'','planningHebdo/valid.php',0,''),(72,'Planning Hebdo - suppression',24,'Gestion des heures de pr&eacute;sence','planningHebdo/supprime.php',80,'Heures de pr&eacute;sence'),(73,'Modification des commentaires des plannings',801,'Modification des commentaires des plannings','',130,'Planning'),(74,'Griser les cellules des plannings',901,'Griser les cellules des plannings','',125,'Planning'),(75,'Validations / Notifications',21,'Gestion des agents','notifications/index.php',70,'Agents');
/*!40000 ALTER TABLE `pb_acces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_activites`
--

DROP TABLE IF EXISTS `pb_activites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_activites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `supprime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_activites`
--

LOCK TABLES `pb_activites` WRITE;
/*!40000 ALTER TABLE `pb_activites` DISABLE KEYS */;
INSERT INTO `pb_activites` VALUES (1,'Assistance audiovisuel',NULL),(2,'Assistance autoformation',NULL),(3,'Communication',NULL),(4,'Communication r&eacute;serve',NULL),(5,'Inscription',NULL),(6,'Pr&ecirc;t/retour de document',NULL),(7,'Pr&ecirc;t de mat&eacute;riel',NULL),(8,'Rangement',NULL),(9,'Renseignement',NULL),(10,'Renseignement bibliographique',NULL),(11,'Renseignement r&eacute;serve',NULL),(12,'Renseignement sp&eacute;cialis&eacute;',NULL);
/*!40000 ALTER TABLE `pb_activites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_appel_dispo`
--

DROP TABLE IF EXISTS `pb_appel_dispo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_appel_dispo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site` int(11) NOT NULL DEFAULT '1',
  `poste` int(11) NOT NULL DEFAULT '0',
  `date` varchar(10) DEFAULT NULL,
  `debut` varchar(8) DEFAULT NULL,
  `fin` varchar(8) DEFAULT NULL,
  `destinataires` text,
  `sujet` text,
  `message` text,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_appel_dispo`
--

LOCK TABLES `pb_appel_dispo` WRITE;
/*!40000 ALTER TABLE `pb_appel_dispo` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_appel_dispo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_config`
--

DROP TABLE IF EXISTS `pb_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `valeur` text NOT NULL,
  `commentaires` text NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `valeurs` text NOT NULL,
  `ordre` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_config`
--

LOCK TABLES `pb_config` WRITE;
/*!40000 ALTER TABLE `pb_config` DISABLE KEYS */;
INSERT INTO `pb_config` VALUES (1,'Version','info','2.7.14','Version de l&apos;application',' Divers','',0),(2,'URL','info','http://demo-planningb.test.biblibre.eu','URL de l&apos;application',' Divers','',10),(3,'Mail-IsEnabled','boolean','0','Active ou d&eacute;sactive l&apos;envoi des mails','Messagerie','',10),(4,'toutlemonde','boolean','0','Affiche ou non l&apos;utilisateur \"tout le monde\" dans le menu.','Planning','',5),(5,'Mail-IsMail-IsSMTP','enum','IsSMTP','Classe &agrave; utiliser : SMTP, fonction PHP IsMail','Messagerie','IsSMTP,IsMail',10),(6,'Mail-WordWrap','','50','','Messagerie','',10),(7,'Mail-Hostname','','','Nom d\'h&ocirc;te du serveur pour l&apos;envoi des mails.','Messagerie','',10),(8,'Mail-Host','','','Nom FQDN ou IP du serveur SMTP.','Messagerie','',10),(9,'Mail-Port','','25','Port du serveur SMTP','Messagerie','',10),(10,'Mail-SMTPSecure','enum','','Cryptage utilis&eacute; par le serveur STMP.','Messagerie',',ssl,tls',10),(11,'Mail-SMTPAuth','boolean','0','Le serveur SMTP requiert-il une authentification?','Messagerie','',10),(12,'Mail-Username','','','Nom d&apos;utilisateur pour le serveur SMTP.','Messagerie','',10),(13,'Mail-Password','password','sOJsxgfgh6U=','Mot de passe pour le serveur SMTP','Messagerie','',10),(14,'Mail-From','','no-reply@planningbiblio.fr','Adresse email de l&apos;expediteur.','Messagerie','',10),(15,'Mail-FromName','','Planning','Nom de l&apos;expediteur.','Messagerie','',10),(16,'Mail-Signature','textarea','Ce message a été envoyé par Planning Biblio.\r\nMerci de ne pas y répondre.','Signature des e-mails','Messagerie','',10),(17,'Dimanche','boolean','1','Utiliser le planning le dimanche',' Divers','',20),(18,'nb_semaine','enum','2','Nombre de semaine pour l\'emploi du temps','Heures de pr&eacute;sence','1,2,3',0),(19,'dateDebutPlHebdo','date','','Date de d&eacute;but permettant la rotation des plannings hebdomadaires (pour l&apos;utilisation de 3 plannings hebdomadaires. Format JJ/MM/AAAA)','Heures de pr&eacute;sence','',0),(20,'ctrlHresAgents','boolean','1','Contr&ocirc;le des heures des agents le samedi et le dimanche','Planning','',0),(21,'agentsIndispo','boolean','1','Afficher les agents indisponibles','Planning','',5),(22,'Granularite','enum2','30','Granularit&eacute; des champs horaires.',' Divers','[[60,\"Heure\"],[30,\"Demi-heure\"],[15,\"Quart d&apos;heure\"],[5,\"5 minutes\"]]',30),(23,'Absences-planning','enum2','0','Afficher la liste des absences sur la page du planning','Absences','[[0,\"\"],[1,\"simple\"],[2,\"d&eacute;taill&eacute;\"],[3,\"absents et pr&eacute;sents\"]]',25),(24,'Auth-Mode','enum','SQL','M&eacute;thode d&apos;authentification','Authentification','SQL,LDAP,LDAP-SQL,CAS,CAS-SQL',7),(25,'Absences-apresValidation','boolean','1','Autoriser l&apos;enregistrement des absences apr&egrave;s validation des plannings','Absences','',10),(26,'Absences-planningVide','boolean','1','Autoriser le d&eacute;p&ocirc;t d&apos;absences sur des plannings en cours d&apos;&eacute;laboration','Absences','',8),(27,'Multisites-nombre','enum','1','Nombre de sites','Multisites','1,2,3,4,5,6,7,8,9,10',15),(28,'Multisites-site1','text','','Nom du site N&deg;1','Multisites','',15),(29,'Multisites-site2','text','','Nom du site N&deg;2','Multisites','',15),(30,'Multisites-site3','text','','Nom du site N&deg;3','Multisites','',15),(31,'Multisites-site4','text','','Nom du site N&deg;4','Multisites','',15),(32,'Multisites-site5','text','','Nom du site N&deg;5','Multisites','',15),(33,'Multisites-site6','text','','Nom du site N&deg;6','Multisites','',15),(34,'Multisites-site7','text','','Nom du site N&deg;7','Multisites','',15),(35,'Multisites-site8','text','','Nom du site N&deg;8','Multisites','',15),(36,'Multisites-site9','text','','Nom du site N&deg;9','Multisites','',15),(37,'Multisites-site10','text','','Nom du site N&deg;10','Multisites','',15),(38,'hres4semaines','boolean','0','Afficher le total d&apos;heures des 4 derni&egrave,res semaine dans le menu','Planning','',5),(39,'Auth-Anonyme','boolean','0','Autoriser les logins anonymes','Authentification','',7),(40,'EDTSamedi','boolean','0','Emplois du temps diff&eacute;rents les semaines o&ugrave; les samedis sont travaill&eacute;s','Heures de pr&eacute;sence','',0),(41,'ClasseParService','boolean','0','Classer les agents par service dans le menu d&eacute;roulant du planning','Planning','',5),(42,'Alerte2SP','boolean','1','Alerter si l&apos;agent fera 2 plages de service public de suite','Planning','',5),(43,'CatAFinDeService','boolean','1','Alerter si aucun agent de cat&eacute;gorie A n&apos;est plac&eacute; en fin de service','Planning','',0),(44,'Recup-Agent','enum','Texte','Type de champ pour la r&eacute;cup&eacute;ration des samedis dans la fiche des agents.<br/>Rien [vide], champ <b>texte</b> ou <b>menu d&eacute;roulant</b>','Cong&eacute;s',',Texte,Menu d&eacute;roulant',40),(45,'Absences-validation','boolean','0','Les absences doivent &ecirc;tre valid&eacute;es par un administrateur avant d&apos;&ecirc;tre prises en compte','Absences','',30),(46,'Absences-non-validees','boolean','1','Dans les plannings, afficher en rouge les agents pour lesquels une absence non-valid&eacute;e est enregistr&eacute;e','Absences','',35),(47,'Absences-tous','boolean','0','Autoriser l&apos;enregistrement d&apos;absences pour tous les agents en une fois','Absences','',37),(48,'Absences-adminSeulement','boolean','0','Autoriser la saisie des absences aux administrateurs seulement.','Absences','',20),(49,'display_errors','boolean','0','Afficher les erreurs PHP','D&eacute;bogage','',4),(50,'Mail-Planning','textarea','','Adresses e-mails de la cellule planning, s&eacute;par&eacute;es par des ;','Messagerie','',10),(51,'Planning-sansRepas','boolean','1','Afficher une notification pour les Sans Repas dans le menu d&eacute;roulant et dans le planning','Planning','',10),(52,'Planning-dejaPlace','boolean','1','Afficher une notification pour les agents d&eacute;j&agrave; plac&eacute; sur un poste dans le menu d&eacute;roulant du planning','Planning','',20),(53,'Absences-notifications1','checkboxes','[\"0\",\"1\",\"2\",\"3\"]','Destinataires des notifications de nouvelles absences','Absences','[[0,\"Aux agents ayant le droit de g&eacute;rer les absences\"],[1,\"Au responsable direct\"],[2,\"A la cellule planning\"],[3,\"A l&apos;agent concern&eacute;\"]]',40),(54,'Absences-notifications2','checkboxes','[\"0\",\"1\",\"2\",\"3\"]','Destinataires des notifications de modification d&apos;absences','Absences','[[0,\"Aux agents ayant le droit de g&eacute;rer les absences\"],[1,\"Au responsable direct\"],[2,\"A la cellule planning\"],[3,\"A l&apos;agent concern&eacute;\"]]',50),(55,'Absences-notifications3','checkboxes','[\"1\"]','Destinataires des notifications des validations niveau 1','Absences','[[0,\"Aux agents ayant le droit de g&eacute;rer les absences\"],[1,\"Au responsable direct\"],[2,\"A la cellule planning\"],[3,\"A l&apos;agent concern&eacute;\"]]',60),(56,'Absences-notifications4','checkboxes','[\"3\"]','Destinataires des notifications des validations niveau 2','Absences','[[0,\"Aux agents ayant le droit de g&eacute;rer les absences\"],[1,\"Au responsable direct\"],[2,\"A la cellule planning\"],[3,\"A l&apos;agent concern&eacute;\"]]',65),(57,'Absences-notifications-agent-par-agent','boolean','0','Gestion des notifications et des droits de validations agent par agent. Si cette option est activÃ©e, les paramÃ¨tres Absences-notifications1, 2, 3 et 4 seront Ã©crasÃ©s par les choix fait dans la page de configuration des notifications du menu Administration - Notifications','Absences','',67),(58,'Absences-notifications-titre','text','','Titre personnalis&eacute; pour les notifications de nouvelles absences','Absences','',70),(59,'Absences-notifications-message','textarea','','Message personnalis&eacute; pour les notifications de nouvelles absences','Absences','',80),(60,'Statistiques-Heures','textarea','','Afficher des statistiques sur les cr&eacute;neaux horaires voulus. Les cr&eacute;neaux doivent &ecirc;tre au format 00h00-00h00 et s&eacute;par&eacute;s par des ; Exemple : 19h00-20h00; 20h00-21h00; 21h00-22h00','Statistiques','',10),(61,'Affichage-theme','text','demo','Th&egrave;me de l&apos;application.','Affichage','',10),(62,'Affichage-titre','text','','Titre affich&eacute; sur la page d&apos;accueil','Affichage','',20),(63,'Affichage-etages','boolean','0','Afficher les &eacute;tages des postes dans le planning','Affichage','',30),(64,'Planning-NbAgentsCellule','enum','2','Nombre d&apos;agents maximum par cellule','Planning','1,2,3,4,5,6,7,8,10,11,12,13,14,15,16,17,18,19,20',2),(65,'Planning-lignesVides','boolean','1','Afficher ou non les lignes vides dans les plannings valid&eacute;s','Planning','',3),(66,'Planning-SR-debut','enum2','12:00:00','Heure de d&eacute;but pour la v&eacute;rification des sans repas','Planning','[[\"11:00:00\",\"11h00\"],[\"11:15:00\",\"11h15\"],[\"11:30:00\",\"11h30\"],[\"11:45:00\",\"11h45\"],[\"12:00:00\",\"12h00\"],[\"12:15:00\",\"12h15\"],[\"12:30:00\",\"12h30\"],[\"12:45:00\",\"12h45\"],[\"13:00:00\",\"13h00\"],[\"13:15:00\",\"13h15\"],[\"13:30:00\",\"13h30\"],[\"13:45:00\",\"13h45\"],[\"14:00:00\",\"14h00\"],[\"14:15:00\",\"14h15\"],[\"14:30:00\",\"14h30\"],[\"14:45:00\",\"14h45\"]]',11),(67,'Planning-SR-fin','enum2','14:00:00','Heure de fin pour la v&eacute;rification des sans repas','Planning','[[\"11:15:00\",\"11h15\"],[\"11:30:00\",\"11h30\"],[\"11:45:00\",\"11h45\"],[\"12:00:00\",\"12h00\"],[\"12:15:00\",\"12h15\"],[\"12:30:00\",\"12h30\"],[\"12:45:00\",\"12h45\"],[\"13:00:00\",\"13h00\"],[\"13:15:00\",\"13h15\"],[\"13:30:00\",\"13h30\"],[\"13:45:00\",\"13h45\"],[\"14:00:00\",\"14h00\"],[\"14:15:00\",\"14h15\"],[\"14:30:00\",\"14h30\"],[\"14:45:00\",\"14h45\"],[\"15:00:00\",\"15h00\"]]',12),(68,'Planning-Absences-Heures-Hebdo','boolean','0','Prendre en compte les absences pour calculer le nombre d&apos;heures de SP &agrave; effectuer. (Module PlanningHebdo requis)','Planning','',30),(69,'CAS-Debug','boolean','0','Activer le d&eacutebogage pour CAS. Cr&eacute;&eacute; un fichier &quot;cas_debug.txt&quot; dans le dossier &quot;[TEMP]&quot;','CAS','',50),(70,'PlanningHebdo','boolean','1','Utiliser ou non le module &ldquo;Planning Hebdo&rdquo;. Ce module permet d&apos;enregistrer plusieurs plannings de pr&eacute;sence par agent en d&eacute;finissant des p&eacute;riodes d&apos;utilisation. (Incompatible avec l&apos;option EDTSamedi)','Heures de pr&eacute;sence','',40),(71,'PlanningHebdo-Agents','boolean','1','Autoriser les agents &agrave; saisir leurs plannings de pr&eacute;sence (avec le module Planning Hebdo). Les plannings saisis devront &ecirc;tre valid&eacute;s par un administrateur.','Heures de pr&eacute;sence','',50),(72,'PlanningHebdo-Pause2','boolean','0','2 pauses dans une journ&eacute;e','Heures de pr&eacute;sence','',60),(73,'PlanningHebdo-Notifications','enum2','droit','A qui envoyer les notifications de nouveaux plannings de pr&eacute;sence (Module Planning Hebdo)','Heures de pr&eacute;sence','[[\"droit\",\"Agents ayant le droit de g&eacute;rer les plannings de pr&eacute;sence\"],[\"Mail-Planning\",\"Cellule planning\"]]',70),(74,'Planning-Notifications','boolean','0','Envoyer une notification aux agents lors de la validation des plannings les concernant','Planning','',40),(75,'Planning-TableauxMasques','boolean','1','Autoriser le masquage de certains tableaux du planning','Planning','',50),(76,'Planning-AppelDispo','boolean','0','Permettre l&apos;envoi d&apos;un mail aux agents disponibles pour leur demander s&apos;ils sont volontaires pour occuper le poste choisi.','Planning','',60),(77,'Planning-AppelDispoSujet','text','Appel à disponibilité [poste] [date] [debut]-[fin]','Sujet du mail pour les appels &agrave; disponibilit&eacute;','Planning','',70),(78,'Planning-AppelDispoMessage','textarea','Chers tous,\r\n\r\nLe poste [poste] est vacant le [date] de [debut] à [fin].\r\n\r\nSi vous souhaitez occuper ce poste, vous pouvez répondre à cet e-mail.\r\n\r\nCordialement,\r\nLa cellule planning','Corps du mail pour les appels &agrave; disponibilit&eacute;','Planning','',80),(79,'LDAP-Host','','','Nom d&apos;h&ocirc;te ou adresse IP du serveur LDAP','LDAP','',10),(80,'LDAP-Port','','','Port du serveur LDAP','LDAP','',20),(81,'LDAP-Protocol','enum','ldap','Protocol utilis&eacute;','LDAP','ldap,ldaps',30),(82,'LDAP-Suffix','','','Base LDAP','LDAP','',40),(83,'LDAP-Filter','','','Filtre LDAP. OpenLDAP essayez \"(objectclass=inetorgperson)\" , Active Directory essayez \"(&(objectCategory=person)(objectClass=user))\". Vous pouvez bien-s&ucirc;r personnaliser votre filtre.','LDAP','',50),(84,'LDAP-RDN','','','DN de connexion au serveur LDAP, laissez vide si connexion anonyme','LDAP','',60),(85,'LDAP-Password','password','sOJsxgfgh6U=','Mot de passe de connexion','LDAP','',70),(86,'LDAP-ID-Attribute','enum','uid','Attribut d&apos;authentification (OpenLDAP : uid, Active Directory : samaccountname)','LDAP','uid,samaccountname',80),(87,'CAS-Hostname','','','Nom d&apos;h&ocirc;te du serveur CAS','CAS','',30),(88,'CAS-Port','','8080','Port serveur CAS','CAS','',30),(89,'CAS-Version','enum','2','Version du serveur CAS','CAS','2,3,4',30),(90,'CAS-CACert','','','Chemin absolut du certificat de l&apos;Autorit&eacute; de Certification. Si pas renseign&eacute;, l&apos;identit&eacute; du serveur ne sera pas v&eacute;rifi&eacute;e.','CAS','',30),(91,'CAS-SSLVersion','enum2','1','Version SSL/TLS &agrave; utiliser pour les &eacute;changes avec le serveur CAS','CAS','[[1,\"TLSv1\"],[4,\"TLSv1_0\"],[5,\"TLSv1_1\"],[6,\"TLSv1_2\"]]',45),(92,'CAS-ServiceURL','text','','URL de Planning Biblio. A renseigner seulement si la redirection ne fonctionne pas aprÃ¨s authentification sur le serveur CAS, si vous utilisez un Reverse Proxy par exemple.','CAS','',47),(93,'CAS-URI','','cas','Page de connexion CAS','CAS','',30),(94,'CAS-URI-Logout','','cas/logout','Page de d&eacute;connexion CAS','CAS','',30),(95,'Rappels-Actifs','boolean','0','Activer les rappels','Rappels','',10),(96,'Rappels-Jours','enum2','3','Nombre de jours &agrave; contr&ocirc;ler pour les rappels','Rappels','[[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7]]',20),(97,'Rappels-Renfort','boolean','0','Contr&ocirc;ler les postes de renfort lors des rappels','Rappels','',30),(98,'IPBlocker-TimeChecked','text','10','Recherche les &eacute;checs d&apos;authentification lors des N derni&egrave;res minutes. ( 0 = IPBlocker d&eacute;sactiv&eacute; )','Authentification','',40),(99,'IPBlocker-Attempts','text','5','Nombre d&apos;&eacute;checs d&apos;authentification autoris&eacute;s lors des N derni&egrave;res minutes','Authentification','',50),(100,'IPBlocker-Wait','text','10','Temps de blocage de l&apos;IP en minutes','Authentification','',60),(101,'ICS-Server1','text','','URL du 1<sup>er</sup> serveur ICS avec la variable OpenURL entre crochets. Ex: http://server.domain.com/calendars/[email].ics','ICS','',10),(102,'ICS-Pattern1','text','','Motif d&apos;absence pour les &eacute;v&eacute;nements import&eacute;s du 1<sup>er</sup> serveur. Ex: Agenda Personnel','ICS','',20),(103,'ICS-Status1','enum2','CONFIRMED','Importer tous les &eacute;v&eacute;nements ou seulement les &eacute;v&eacute;nements confirm&eacute;s (attribut STATUS = CONFIRMED). Si \"tous\" est choisi, les &eacute;v&eacute;nements non-confirm&eacute;s seront enregistr&eacute;s comme des absences en attente de validation','ICS','[[\"CONFIRMED\",\"Confirm&eacute;s\"],[\"ALL\",\"Tous\"]]',22),(104,'ICS-Server2','text','','URL du 2<sup>&egrave;me</sup> serveur ICS avec la variable OpenURL entre crochets. Ex: http://server2.domain.com/holiday/[login].ics','ICS','',30),(105,'ICS-Pattern2','text','','Motif d&apos;absence pour les &eacute;v&eacute;nements import&eacute;s du 2<sup>&egrave;me</sup> serveur. Ex: Cong&eacute;s','ICS','',40),(106,'ICS-Status2','enum2','CONFIRMED','Importer tous les &eacute;v&eacute;nements ou seulement les &eacute;v&eacute;nements confirm&eacute;s (attribut STATUS = CONFIRMED). Si \"tous\" est choisi, les &eacute;v&eacute;nements non-confirm&eacute;s seront enregistr&eacute;s comme des absences en attente de validation','ICS','[[\"CONFIRMED\",\"Confirm&eacute;s\"],[\"ALL\",\"Tous\"]]',42),(107,'ICS-Server3','boolean','0','Utiliser une URL d&eacute;finie pour chaque agent dans le menu Administration / Les agents','ICS','',44),(108,'ICS-Pattern3','text','','Motif d&apos;absence pour les &eacute;v&eacute;nements import&eacute;s depuis l&apos;URL d&eacute;finie dans la fiche des agents. Ex: Agenda personnel','ICS','',45),(109,'ICS-Status3','enum2','CONFIRMED','Importer tous les &eacute;v&eacute;nements ou seulement les &eacute;v&eacute;nements confirm&eacute;s (attribut STATUS = CONFIRMED). Si \"tous\" est choisi, les &eacute;v&eacute;nements non-confirm&eacute;s seront enregistr&eacute;s comme des absences en attente de validation','ICS','[[\"CONFIRMED\",\"Confirm&eacute;s\"],[\"ALL\",\"Tous\"]]',47),(110,'ICS-Export','boolean','0','Autoriser l&apos;exportation des plages de service public sous forme de calendriers ICS. Un calendrier par agent, accessible &agrave; l&apos;adresse [SERVER]/ics/calendar.php?login=[login_de_l_agent]','ICS','',60),(111,'ICS-Code','boolean','1','Prot&eacute;ger les calendriers ICS par des codes de faÃ§on &agrave; ce qu&apos;on ne puisse pas deviner les URLs. Si l&apos;option est activ&eacute;e, les URL seront du type : [SERVER]/ics/calendar.php?login=[login_de_l_agent]&amp;code=[code_al&eacute;atoire]','ICS','',70),(112,'PlanningHebdo-CSV','text','','Emplacement du fichier CSV &agrave; importer (importation automatis&eacute;e) Ex: /dossier/fichier.csv','Heures de pr&eacute;sence','',90),(113,'Agenda-Plannings-Non-Valides','boolean','1','Afficher ou non les plages de service public des plannings non valid&eacute;s dans les agendas.','Agenda','',10),(114,'Hamac-csv','text','','Chemin d&apos;acc&egrave;s au fichier CSV pour l&apos;importation des absences depuis Hamac','Hamac','',10),(115,'Hamac-motif','text','','Motif pour les absences import&eacute;s depuis Hamac. Ex: Hamac','Hamac','',20),(116,'Hamac-status','enum2','1,2,3,5,6','Importer les absences valid&eacute;es et en attente de validation ou seulement les absences valid&eacute;es.','Hamac','[[\"1,2,3,5,6\",\"Valid&eacute;es et en attente de validation\"],[\"2\",\"Valid&eacute;es\"]]',30),(117,'Hamac-id','enum2','login','Champ Planning Biblio &agrave; utiliser pour mapper les agents.','Hamac','[[\"login\",\"Login\"],[\"matricule\",\"Matricule\"]]',40);
/*!40000 ALTER TABLE `pb_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_cron`
--

DROP TABLE IF EXISTS `pb_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_cron` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `m` varchar(2) DEFAULT NULL,
  `h` varchar(2) DEFAULT NULL,
  `dom` varchar(2) DEFAULT NULL,
  `mon` varchar(2) DEFAULT NULL,
  `dow` varchar(2) DEFAULT NULL,
  `command` varchar(200) DEFAULT NULL,
  `comments` varchar(500) DEFAULT NULL,
  `last` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_cron`
--

LOCK TABLES `pb_cron` WRITE;
/*!40000 ALTER TABLE `pb_cron` DISABLE KEYS */;
INSERT INTO `pb_cron` VALUES (1,'0','0','*','*','*','planningHebdo/cron.daily.php','Daily Cron for planningHebdo module','2018-10-19 11:17:01');
/*!40000 ALTER TABLE `pb_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_edt_samedi`
--

DROP TABLE IF EXISTS `pb_edt_samedi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_edt_samedi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perso_id` int(11) NOT NULL,
  `semaine` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_edt_samedi`
--

LOCK TABLES `pb_edt_samedi` WRITE;
/*!40000 ALTER TABLE `pb_edt_samedi` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_edt_samedi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_heures_absences`
--

DROP TABLE IF EXISTS `pb_heures_absences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_heures_absences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semaine` date DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `heures` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_heures_absences`
--

LOCK TABLES `pb_heures_absences` WRITE;
/*!40000 ALTER TABLE `pb_heures_absences` DISABLE KEYS */;
INSERT INTO `pb_heures_absences` VALUES (6,'2018-10-15',1539941891,'[]'),(9,'2018-10-22',1539942740,'[]');
/*!40000 ALTER TABLE `pb_heures_absences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_heures_sp`
--

DROP TABLE IF EXISTS `pb_heures_sp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_heures_sp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `semaine` date DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `heures` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_heures_sp`
--

LOCK TABLES `pb_heures_sp` WRITE;
/*!40000 ALTER TABLE `pb_heures_sp` DISABLE KEYS */;
INSERT INTO `pb_heures_sp` VALUES (6,'2018-10-15',1539941891,'{\"4\":\"12\",\"5\":\"8\",\"7\":\"35\",\"11\":\"35\",\"3\":\"12\",\"8\":\"35\",\"6\":\"35\",\"9\":\"12\",\"10\":\"20\",\"2\":0}'),(9,'2018-10-22',1539942740,'{\"4\":\"12\",\"5\":\"8\",\"7\":\"35\",\"11\":\"35\",\"3\":\"12\",\"12\":\"25\",\"13\":\"9\",\"14\":\"35\",\"8\":\"35\",\"6\":\"35\",\"9\":\"12\",\"10\":\"20\",\"2\":0}');
/*!40000 ALTER TABLE `pb_heures_sp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_hidden_tables`
--

DROP TABLE IF EXISTS `pb_hidden_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_hidden_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perso_id` int(11) NOT NULL DEFAULT '0',
  `tableau` int(11) NOT NULL DEFAULT '0',
  `hidden_tables` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_hidden_tables`
--

LOCK TABLES `pb_hidden_tables` WRITE;
/*!40000 ALTER TABLE `pb_hidden_tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_hidden_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_infos`
--

DROP TABLE IF EXISTS `pb_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `texte` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_infos`
--

LOCK TABLES `pb_infos` WRITE;
/*!40000 ALTER TABLE `pb_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_ip_blocker`
--

DROP TABLE IF EXISTS `pb_ip_blocker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_ip_blocker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(20) NOT NULL,
  `login` varchar(100) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ip` (`ip`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_ip_blocker`
--

LOCK TABLES `pb_ip_blocker` WRITE;
/*!40000 ALTER TABLE `pb_ip_blocker` DISABLE KEYS */;
INSERT INTO `pb_ip_blocker` VALUES (1,'::1','admin','success','2018-05-18 11:17:43'),(2,'::1','admin','success','2018-05-18 11:30:25'),(3,'10.187.209.10',' admin','success','2018-10-15 09:54:13'),(4,'10.187.209.10','admin','failed','2018-10-18 07:22:33'),(5,'10.187.209.10','admin','success','2018-10-18 07:22:49'),(6,'10.187.209.10','admin','success','2018-10-18 10:21:20'),(7,'10.187.209.10','admin','success','2018-10-19 09:17:00');
/*!40000 ALTER TABLE `pb_ip_blocker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_jours_feries`
--

DROP TABLE IF EXISTS `pb_jours_feries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_jours_feries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(10) DEFAULT NULL,
  `jour` date DEFAULT NULL,
  `ferie` int(1) DEFAULT NULL,
  `fermeture` int(1) DEFAULT NULL,
  `nom` text,
  `commentaire` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_jours_feries`
--

LOCK TABLES `pb_jours_feries` WRITE;
/*!40000 ALTER TABLE `pb_jours_feries` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_jours_feries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_lignes`
--

DROP TABLE IF EXISTS `pb_lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_lignes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_lignes`
--

LOCK TABLES `pb_lignes` WRITE;
/*!40000 ALTER TABLE `pb_lignes` DISABLE KEYS */;
INSERT INTO `pb_lignes` VALUES (1,'Magasins'),(2,'Mezzanine'),(3,'Rez de chauss&eacute;e'),(4,'Rez de jardin');
/*!40000 ALTER TABLE `pb_lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_log`
--

DROP TABLE IF EXISTS `pb_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` text,
  `program` varchar(30) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_log`
--

LOCK TABLES `pb_log` WRITE;
/*!40000 ALTER TABLE `pb_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_menu`
--

DROP TABLE IF EXISTS `pb_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `niveau1` int(11) NOT NULL,
  `niveau2` int(11) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `url` varchar(500) NOT NULL,
  `condition` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_menu`
--

LOCK TABLES `pb_menu` WRITE;
/*!40000 ALTER TABLE `pb_menu` DISABLE KEYS */;
INSERT INTO `pb_menu` VALUES (1,10,0,'Absences','absences/voir.php',NULL),(2,10,10,'Voir les absences','absences/voir.php',NULL),(3,10,20,'Ajouter une absence','absences/ajouter.php',NULL),(4,10,30,'Informations','absences/infos.php',NULL),(5,20,0,'Agenda','agenda/index.php',NULL),(6,30,0,'Planning','planning/poste/index.php',NULL),(7,40,0,'Statistiques','statistiques/index.php',NULL),(8,40,10,'Feuille de temps','statistiques/temps.php',NULL),(9,40,20,'Par agent','statistiques/agents.php',NULL),(10,40,30,'Par poste','statistiques/postes.php',NULL),(11,40,40,'Par poste (Synth&egrave;se)','statistiques/postes_synthese.php',NULL),(12,40,50,'Postes de renfort','statistiques/postes_renfort.php',NULL),(13,40,24,'Par service','statistiques/service.php',NULL),(14,40,60,'Samedis','statistiques/samedis.php',NULL),(15,40,70,'Absences','statistiques/absences.php',NULL),(16,40,26,'Par statut','statistiques/statut.php',NULL),(17,50,0,'Administration','admin/index.php',NULL),(18,50,10,'Informations','infos/index.php',NULL),(19,50,20,'Les activit&eacute;s','activites/index.php',NULL),(20,50,30,'Les agents','personnel/index.php',NULL),(21,50,40,'Les postes','postes/index.php',NULL),(22,50,50,'Les mod&egrave;les','planning/modeles/index.php',NULL),(23,50,60,'Les tableaux','planning/postes_cfg/index.php',NULL),(24,50,70,'Jours de fermeture','joursFeries/index.php',NULL),(25,50,75,'Plannings de pr&eacute;sence','planningHebdo/index.php','config=PlanningHebdo'),(26,50,77,'Validations / Notifications','notifications/index.php','config=Absences-notifications-agent-par-agent'),(27,50,80,'Configuration','admin/config.php',NULL),(28,60,0,'Aide','aide/index.php',NULL);
/*!40000 ALTER TABLE `pb_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_personnel`
--

DROP TABLE IF EXISTS `pb_personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `prenom` text NOT NULL,
  `mail` text NOT NULL,
  `statut` text NOT NULL,
  `categorie` varchar(30) NOT NULL DEFAULT '',
  `service` text NOT NULL,
  `arrivee` date NOT NULL DEFAULT '0000-00-00',
  `depart` date NOT NULL DEFAULT '0000-00-00',
  `postes` text NOT NULL,
  `actif` varchar(20) NOT NULL DEFAULT 'true',
  `droits` varchar(500) NOT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `commentaires` text NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `heures_hebdo` varchar(6) NOT NULL,
  `heures_travail` float NOT NULL,
  `sites` text NOT NULL,
  `temps` text NOT NULL,
  `informations` text NOT NULL,
  `recup` text NOT NULL,
  `supprime` enum('0','1','2') NOT NULL DEFAULT '0',
  `mails_responsables` text NOT NULL,
  `matricule` varchar(100) NOT NULL DEFAULT '',
  `code_ics` varchar(100) DEFAULT NULL,
  `url_ics` text,
  `check_ics` varchar(10) DEFAULT '[1,1,1]',
  `check_hamac` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_personnel`
--

LOCK TABLES `pb_personnel` WRITE;
/*!40000 ALTER TABLE `pb_personnel` DISABLE KEYS */;
INSERT INTO `pb_personnel` VALUES (1,'admin','admin','sysop@biblibre.com','','','','0000-00-00','0000-00-00','','Inactif','[\"6\",\"201\",\"501\",\"701\",\"3\",\"4\",\"21\",\"24\",\"301\",\"1001\",\"901\",\"801\",\"22\",\"5\",\"17\",\"13\",\"25\",\"23\",6,9,99,100,20]','admin','4c7fd3424b056221b121fbcb859363e0','Compte cr&eacute;&eacute; lors de l&apos;installation du planning','2018-10-19 11:17:00','0',0,'','[[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"]]','','','0','','',NULL,NULL,'[0,0,0]',0),(2,'Tout le monde','','','','','','0000-00-00','0000-00-00','','Actif','[99,100]','','','Compte cr&eacute;&eacute; lors de l&apos;installation du planning','0000-00-00 00:00:00','',0,'','[[\"09:00:00\",\"12:00:00\",\"13:00:00\",\"17:00:00\"],[\"09:00:00\",\"12:00:00\",\"13:00:00\",\"17:00:00\"],[\"09:00:00\",\"12:00:00\",\"13:00:00\",\"17:00:00\"],[\"09:00:00\",\"12:00:00\",\"13:00:00\",\"17:00:00\"],[\"09:00:00\",\"12:00:00\",\"13:00:00\",\"17:00:00\"],[\"\",\"\",\"\",\"\"]]','','','0','','',NULL,NULL,'[1,1,1]',1),(3,'Polyvalent','Philippe','agent1@example.com','Conservateur','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]','Actif','[99,100]','agent.agent-1','8b1a14b6837464f363514962d16a3fc5','','0000-00-00 00:00:00','12',35,'','[[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"],[\"\",\"\",\"\",\"\"]]','','','0','','',NULL,NULL,'[0,0,0]',0),(4,'Audiovisuel','Alfred','agent2@example.com','Biblioth&eacute;caire','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"1\",\"2\",\"8\"]','Actif','[99,100]','agent.audiovisuel','9951620589e871ec997a7a78cee4f8fb','','0000-00-00 00:00:00','12',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(5,'Conservateur','Caroline','agent3@example.com','Conservateur','Titulaire','P&ocirc;le conservation','0000-00-00','0000-00-00','[\"9\",\"10\",\"11\",\"12\"]','Actif','[99,100]','agent.conservateur','ace91c8e09d27563b0210e541f5d408f','','0000-00-00 00:00:00','8',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(6,'Rangement','Renaud','agent4@example.com','Magasinier','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"8\"]','Actif','[99,100]','renaud.rangement','7fdb804c584e842cbd7fe630324968f2','','0000-00-00 00:00:00','35',35,'','','','','0','','',NULL,'','[0,0,0]',0),(7,'Inscriptions','Ingrid','agent5@example.com','AB','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"5\",\"8\"]','Actif','[99,100]','ingrid.inscriptions','27b79159b8589f21219f33f36f12467a','','0000-00-00 00:00:00','35',35,'','','','','0','','',NULL,'','[0,0,0]',0),(8,'Prêt','Patrick','agent6@example.com','Magasinier','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"7\",\"6\",\"8\",\"9\"]','Actif','[99,100]','patrick.pret','e5359e2fbad10144f203e1cd90a879ce','','0000-00-00 00:00:00','35',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(9,'Renseignements','Rébecca','agent7@example.com','Conservateur','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"4\",\"3\",\"6\",\"8\",\"10\",\"9\"]','Actif','[99,100]','rebecca.renseignements','dd10c56383f881fcab15778207bbb60b','','0000-00-00 00:00:00','12',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(10,'Réserve','Rafaëlle','agent8@exemple.com','Biblioth&eacute;caire','Titulaire','P&ocirc;le collection','0000-00-00','0000-00-00','[\"4\",\"11\",\"12\"]','Actif','[99,100]','rafaelle.reserve','427c244e303d684fbacb3e4b83329fc5','','0000-00-00 00:00:00','20',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(11,'Inscriptions','Béatrice','agent9@example.com','Biblioth&eacute;caire','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"5\",\"8\"]','Actif','[99,100]','isabelle.inscriptions-2','3b43c3fed440d89b81bc27f27e54b4e7','','0000-00-00 00:00:00','35',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(12,'Polyvalent','Cyril','agent10@example.com','Biblioth&eacute;caire','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\",\"8\",\"9\",\"10\",\"11\",\"12\"]','Actif','[99,100]','cyril.polyvalent-2','f6a3366f08a82268801e0a13deb16aa2','','0000-00-00 00:00:00','25',35,'','','','','0','','',NULL,NULL,'[0,0,0]',0),(13,'Polyvalent','Bénoit','agent11@example.com','Biblioth&eacute;caire','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"1\",\"2\",\"4\",\"3\",\"5\",\"7\",\"6\",\"8\",\"10\",\"11\",\"12\",\"9\"]','Actif','[99,100]','benoit.polyvalent','98934bbd566f2035717841670835a5d7','','0000-00-00 00:00:00','9',35,'','','','','0','','',NULL,'','[0,0,0]',0),(14,'Polyvalent','Jérôme','agent12@example.com','Biblioth&eacute;caire','Titulaire','P&ocirc;le public','0000-00-00','0000-00-00','[\"1\",\"2\",\"4\",\"3\",\"5\",\"7\",\"6\",\"8\",\"10\",\"11\",\"12\",\"9\"]','Actif','[99,100]','jerome.polyvalent','51c763bb76ee0d44d1792ec72a9998f6','','0000-00-00 00:00:00','35',35,'','','','','0','','',NULL,'','[0,0,0]',0);
/*!40000 ALTER TABLE `pb_personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_notes`
--

DROP TABLE IF EXISTS `pb_pl_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `site` int(3) NOT NULL DEFAULT '1',
  `text` text,
  `perso_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_notes`
--

LOCK TABLES `pb_pl_notes` WRITE;
/*!40000 ALTER TABLE `pb_pl_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_pl_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_notifications`
--

DROP TABLE IF EXISTS `pb_pl_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(10) DEFAULT NULL,
  `site` int(2) NOT NULL DEFAULT '1',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data` text,
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `site` (`site`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_notifications`
--

LOCK TABLES `pb_pl_notifications` WRITE;
/*!40000 ALTER TABLE `pb_pl_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_pl_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste`
--

DROP TABLE IF EXISTS `pb_pl_poste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `perso_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `poste` int(11) NOT NULL DEFAULT '0',
  `absent` enum('0','1','2') NOT NULL DEFAULT '0',
  `chgt_login` int(4) DEFAULT NULL,
  `chgt_time` datetime NOT NULL,
  `debut` time NOT NULL,
  `fin` time NOT NULL,
  `supprime` enum('0','1') DEFAULT '0',
  `site` int(3) DEFAULT '1',
  `grise` enum('0','1') DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `site` (`site`)
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste`
--

LOCK TABLES `pb_pl_poste` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste` DISABLE KEYS */;
INSERT INTO `pb_pl_poste` VALUES (1,3,'2018-10-18',24,'0',1,'2018-10-18 12:21:41','11:30:00','13:00:00','0',1,'0'),(2,3,'2018-10-18',36,'0',1,'2018-10-18 12:21:49','13:00:00','14:30:00','0',1,'0'),(3,3,'2018-10-18',24,'0',1,'2018-10-18 12:22:20','14:30:00','16:00:00','0',1,'0'),(5,5,'2018-10-18',12,'0',1,'2018-10-19 11:20:54','19:00:00','20:00:00','0',1,'0'),(32,3,'2018-10-15',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(7,9,'2018-10-18',36,'0',1,'2018-10-19 11:36:06','10:00:00','11:30:00','0',1,'0'),(8,3,'2018-10-18',4,'0',1,'2018-10-19 11:36:11','10:00:00','11:30:00','0',1,'0'),(9,9,'2018-10-18',5,'0',1,'2018-10-19 11:36:15','11:30:00','13:00:00','0',1,'0'),(10,8,'2018-10-18',6,'0',1,'2018-10-19 11:38:13','11:30:00','13:00:00','0',1,'0'),(11,8,'2018-10-18',7,'0',1,'2018-10-19 11:38:16','13:00:00','14:30:00','0',1,'0'),(12,9,'2018-10-18',8,'0',1,'2018-10-19 11:38:22','14:30:00','16:00:00','0',1,'0'),(13,5,'2018-10-18',13,'0',1,'2018-10-19 11:38:27','11:30:00','13:00:00','0',1,'0'),(14,5,'2018-10-18',14,'0',1,'2018-10-19 11:38:30','13:00:00','14:30:00','0',1,'0'),(15,4,'2018-10-18',28,'0',1,'2018-10-19 11:38:36','11:00:00','12:00:00','0',1,'0'),(16,7,'2018-10-18',25,'0',1,'2018-10-19 11:38:38','12:00:00','13:00:00','0',1,'0'),(17,11,'2018-10-18',4,'0',1,'2018-10-19 11:38:46','11:30:00','13:00:00','0',1,'0'),(18,11,'2018-10-18',4,'0',1,'2018-10-19 11:41:33','13:00:00','14:30:00','0',1,'0'),(19,8,'2018-10-18',5,'0',1,'2018-10-19 11:41:35','14:30:00','16:00:00','0',1,'0'),(20,11,'2018-10-18',4,'0',1,'2018-10-19 11:41:39','16:00:00','17:30:00','0',1,'0'),(21,3,'2018-10-18',5,'0',1,'2018-10-19 11:41:44','16:00:00','17:30:00','0',1,'0'),(22,10,'2018-10-18',23,'0',1,'2018-10-19 11:41:58','14:00:00','16:00:00','0',1,'0'),(23,9,'2018-10-18',23,'0',1,'2018-10-19 11:42:02','16:00:00','18:00:00','0',1,'0'),(24,7,'2018-10-18',25,'0',1,'2018-10-19 11:42:12','11:00:00','12:00:00','0',1,'0'),(25,6,'2018-10-18',26,'0',1,'2018-10-19 11:42:14','11:00:00','12:00:00','0',1,'0'),(26,4,'2018-10-18',28,'0',1,'2018-10-19 11:42:16','12:00:00','13:00:00','0',1,'0'),(27,6,'2018-10-18',26,'0',1,'2018-10-19 11:42:19','12:00:00','13:00:00','0',1,'0'),(28,11,'2018-10-18',24,'0',1,'2018-10-19 11:42:28','10:00:00','11:30:00','0',1,'0'),(29,8,'2018-10-18',5,'0',1,'2018-10-19 11:42:32','10:00:00','11:30:00','0',1,'0'),(30,5,'2018-10-18',7,'0',1,'2018-10-19 11:42:37','10:00:00','11:30:00','0',1,'0'),(33,3,'2018-10-15',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(34,3,'2018-10-15',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(35,5,'2018-10-15',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(36,9,'2018-10-15',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(37,3,'2018-10-15',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(38,9,'2018-10-15',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(39,8,'2018-10-15',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(40,8,'2018-10-15',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(41,9,'2018-10-15',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(42,5,'2018-10-15',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(43,5,'2018-10-15',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(44,4,'2018-10-15',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(45,7,'2018-10-15',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(46,11,'2018-10-15',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(47,11,'2018-10-15',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(48,8,'2018-10-15',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(49,11,'2018-10-15',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(50,3,'2018-10-15',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(51,10,'2018-10-15',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(52,9,'2018-10-15',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(53,7,'2018-10-15',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(54,6,'2018-10-15',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(55,4,'2018-10-15',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(56,6,'2018-10-15',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(57,11,'2018-10-15',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(58,8,'2018-10-15',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(59,5,'2018-10-15',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(60,3,'2018-10-16',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(61,3,'2018-10-16',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(62,3,'2018-10-16',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(63,5,'2018-10-16',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(64,9,'2018-10-16',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(65,3,'2018-10-16',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(66,9,'2018-10-16',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(67,8,'2018-10-16',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(68,8,'2018-10-16',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(69,9,'2018-10-16',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(70,5,'2018-10-16',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(71,5,'2018-10-16',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(72,4,'2018-10-16',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(73,7,'2018-10-16',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(74,11,'2018-10-16',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(75,11,'2018-10-16',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(76,8,'2018-10-16',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(77,11,'2018-10-16',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(78,3,'2018-10-16',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(79,10,'2018-10-16',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(80,9,'2018-10-16',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(81,7,'2018-10-16',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(82,6,'2018-10-16',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(83,4,'2018-10-16',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(84,6,'2018-10-16',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(85,11,'2018-10-16',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(86,8,'2018-10-16',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(87,5,'2018-10-16',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(88,3,'2018-10-17',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(89,3,'2018-10-17',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(90,3,'2018-10-17',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(91,5,'2018-10-17',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(92,9,'2018-10-17',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(93,3,'2018-10-17',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(94,9,'2018-10-17',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(95,8,'2018-10-17',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(96,8,'2018-10-17',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(97,9,'2018-10-17',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(98,5,'2018-10-17',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(99,5,'2018-10-17',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(100,4,'2018-10-17',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(101,7,'2018-10-17',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(102,11,'2018-10-17',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(103,11,'2018-10-17',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(104,8,'2018-10-17',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(105,11,'2018-10-17',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(106,3,'2018-10-17',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(107,10,'2018-10-17',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(108,9,'2018-10-17',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(109,7,'2018-10-17',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(110,6,'2018-10-17',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(111,4,'2018-10-17',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(112,6,'2018-10-17',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(113,11,'2018-10-17',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(114,8,'2018-10-17',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(115,5,'2018-10-17',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(116,3,'2018-10-19',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(117,3,'2018-10-19',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(118,3,'2018-10-19',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(119,5,'2018-10-19',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(120,9,'2018-10-19',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(121,3,'2018-10-19',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(122,9,'2018-10-19',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(123,8,'2018-10-19',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(124,8,'2018-10-19',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(125,9,'2018-10-19',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(126,5,'2018-10-19',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(127,5,'2018-10-19',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(128,4,'2018-10-19',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(129,7,'2018-10-19',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(130,11,'2018-10-19',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(131,11,'2018-10-19',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(132,8,'2018-10-19',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(133,11,'2018-10-19',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(134,3,'2018-10-19',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(135,10,'2018-10-19',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(136,9,'2018-10-19',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(137,7,'2018-10-19',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(138,6,'2018-10-19',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(139,4,'2018-10-19',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(140,6,'2018-10-19',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(141,11,'2018-10-19',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(142,8,'2018-10-19',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(143,5,'2018-10-19',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(199,5,'2018-10-22',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(198,3,'2018-10-22',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(197,3,'2018-10-22',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(196,3,'2018-10-22',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(195,4,'2018-10-21',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(194,3,'2018-10-21',36,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(193,7,'2018-10-21',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(192,8,'2018-10-21',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(191,11,'2018-10-21',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(190,7,'2018-10-21',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(189,8,'2018-10-21',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(188,3,'2018-10-21',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(187,8,'2018-10-21',7,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(186,4,'2018-10-21',7,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(185,3,'2018-10-21',24,'0',NULL,'0000-00-00 00:00:00','17:30:00','19:00:00','0',1,'0'),(184,9,'2018-10-21',36,'0',NULL,'0000-00-00 00:00:00','17:30:00','19:00:00','0',1,'0'),(183,9,'2018-10-20',36,'0',1,'2018-10-19 11:46:23','17:30:00','19:00:00','0',1,'0'),(182,3,'2018-10-20',24,'0',1,'2018-10-19 11:46:21','17:30:00','19:00:00','0',1,'0'),(181,4,'2018-10-20',7,'0',1,'2018-10-19 11:46:16','11:30:00','13:00:00','0',1,'0'),(180,8,'2018-10-20',7,'0',1,'2018-10-19 11:46:09','14:30:00','16:00:00','0',1,'0'),(179,3,'2018-10-20',7,'0',1,'2018-10-19 11:46:06','13:00:00','14:30:00','0',1,'0'),(178,8,'2018-10-20',6,'0',1,'2018-10-19 11:46:03','11:30:00','13:00:00','0',1,'0'),(177,7,'2018-10-20',4,'0',1,'2018-10-19 11:46:01','13:00:00','14:30:00','0',1,'0'),(176,11,'2018-10-20',4,'0',1,'2018-10-19 11:45:59','11:30:00','13:00:00','0',1,'0'),(175,8,'2018-10-20',5,'0',1,'2018-10-19 11:45:56','10:00:00','11:30:00','0',1,'0'),(174,7,'2018-10-20',4,'0',1,'2018-10-19 11:45:53','10:00:00','11:30:00','0',1,'0'),(173,3,'2018-10-20',36,'0',1,'2018-10-19 11:45:47','11:30:00','13:00:00','0',1,'0'),(172,4,'2018-10-20',24,'0',1,'2018-10-19 11:45:45','10:00:00','11:30:00','0',1,'0'),(200,9,'2018-10-22',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(201,3,'2018-10-22',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(202,9,'2018-10-22',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(203,8,'2018-10-22',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(204,8,'2018-10-22',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(205,9,'2018-10-22',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(206,5,'2018-10-22',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(207,5,'2018-10-22',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(208,4,'2018-10-22',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(209,7,'2018-10-22',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(210,11,'2018-10-22',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(211,11,'2018-10-22',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(212,8,'2018-10-22',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(213,11,'2018-10-22',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(214,3,'2018-10-22',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(215,10,'2018-10-22',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(216,9,'2018-10-22',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(217,7,'2018-10-22',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(218,6,'2018-10-22',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(219,4,'2018-10-22',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(220,6,'2018-10-22',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(221,11,'2018-10-22',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(222,8,'2018-10-22',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(223,5,'2018-10-22',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(224,3,'2018-10-23',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(225,3,'2018-10-23',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(226,3,'2018-10-23',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(227,5,'2018-10-23',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(228,9,'2018-10-23',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(229,3,'2018-10-23',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(230,9,'2018-10-23',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(231,8,'2018-10-23',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(232,8,'2018-10-23',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(233,9,'2018-10-23',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(234,5,'2018-10-23',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(235,5,'2018-10-23',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(236,4,'2018-10-23',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(237,7,'2018-10-23',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(238,11,'2018-10-23',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(239,11,'2018-10-23',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(240,8,'2018-10-23',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(241,11,'2018-10-23',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(242,3,'2018-10-23',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(243,10,'2018-10-23',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(244,9,'2018-10-23',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(245,7,'2018-10-23',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(246,6,'2018-10-23',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(247,4,'2018-10-23',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(248,6,'2018-10-23',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(249,11,'2018-10-23',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(250,8,'2018-10-23',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(251,5,'2018-10-23',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(252,3,'2018-10-24',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(253,3,'2018-10-24',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(254,3,'2018-10-24',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(255,5,'2018-10-24',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(256,9,'2018-10-24',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(257,3,'2018-10-24',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(258,9,'2018-10-24',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(259,8,'2018-10-24',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(260,8,'2018-10-24',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(261,9,'2018-10-24',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(262,5,'2018-10-24',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(263,5,'2018-10-24',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(264,4,'2018-10-24',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(265,7,'2018-10-24',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(266,11,'2018-10-24',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(267,11,'2018-10-24',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(268,8,'2018-10-24',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(269,11,'2018-10-24',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(270,3,'2018-10-24',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(271,10,'2018-10-24',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(272,9,'2018-10-24',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(273,7,'2018-10-24',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(274,6,'2018-10-24',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(275,4,'2018-10-24',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(276,6,'2018-10-24',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(277,11,'2018-10-24',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(278,8,'2018-10-24',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(279,5,'2018-10-24',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(280,3,'2018-10-25',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(281,3,'2018-10-25',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(282,3,'2018-10-25',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(283,5,'2018-10-25',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(284,9,'2018-10-25',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(285,3,'2018-10-25',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(286,9,'2018-10-25',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(287,8,'2018-10-25',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(288,8,'2018-10-25',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(289,9,'2018-10-25',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(290,5,'2018-10-25',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(291,5,'2018-10-25',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(292,4,'2018-10-25',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(293,7,'2018-10-25',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(294,11,'2018-10-25',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(295,11,'2018-10-25',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(296,8,'2018-10-25',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(297,11,'2018-10-25',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(298,3,'2018-10-25',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(299,10,'2018-10-25',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(300,9,'2018-10-25',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(301,7,'2018-10-25',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(302,6,'2018-10-25',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(303,4,'2018-10-25',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(304,6,'2018-10-25',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(305,11,'2018-10-25',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(306,8,'2018-10-25',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(307,5,'2018-10-25',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(308,3,'2018-10-26',24,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(309,3,'2018-10-26',36,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(310,3,'2018-10-26',24,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(311,5,'2018-10-26',12,'0',NULL,'0000-00-00 00:00:00','19:00:00','20:00:00','0',1,'0'),(312,9,'2018-10-26',36,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(313,3,'2018-10-26',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(314,9,'2018-10-26',5,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(315,8,'2018-10-26',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(316,8,'2018-10-26',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(317,9,'2018-10-26',8,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(318,5,'2018-10-26',13,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(319,5,'2018-10-26',14,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(320,4,'2018-10-26',28,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(321,7,'2018-10-26',25,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(322,11,'2018-10-26',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(323,11,'2018-10-26',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(324,8,'2018-10-26',5,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(325,11,'2018-10-26',4,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(326,3,'2018-10-26',5,'0',NULL,'0000-00-00 00:00:00','16:00:00','17:30:00','0',1,'0'),(327,10,'2018-10-26',23,'0',NULL,'0000-00-00 00:00:00','14:00:00','16:00:00','0',1,'0'),(328,9,'2018-10-26',23,'0',NULL,'0000-00-00 00:00:00','16:00:00','18:00:00','0',1,'0'),(329,7,'2018-10-26',25,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(330,6,'2018-10-26',26,'0',NULL,'0000-00-00 00:00:00','11:00:00','12:00:00','0',1,'0'),(331,4,'2018-10-26',28,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(332,6,'2018-10-26',26,'0',NULL,'0000-00-00 00:00:00','12:00:00','13:00:00','0',1,'0'),(333,11,'2018-10-26',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(334,8,'2018-10-26',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(335,5,'2018-10-26',7,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(336,9,'2018-10-27',36,'0',NULL,'0000-00-00 00:00:00','17:30:00','19:00:00','0',1,'0'),(337,3,'2018-10-27',24,'0',NULL,'0000-00-00 00:00:00','17:30:00','19:00:00','0',1,'0'),(338,4,'2018-10-27',7,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(339,8,'2018-10-27',7,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(340,3,'2018-10-27',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(341,8,'2018-10-27',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(342,7,'2018-10-27',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(343,11,'2018-10-27',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(344,8,'2018-10-27',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(345,7,'2018-10-27',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(346,3,'2018-10-27',36,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(347,4,'2018-10-27',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(348,4,'2018-10-28',24,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(349,3,'2018-10-28',36,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(350,7,'2018-10-28',4,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(351,8,'2018-10-28',5,'0',NULL,'0000-00-00 00:00:00','10:00:00','11:30:00','0',1,'0'),(352,11,'2018-10-28',4,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(353,7,'2018-10-28',4,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(354,8,'2018-10-28',6,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(355,3,'2018-10-28',7,'0',NULL,'0000-00-00 00:00:00','13:00:00','14:30:00','0',1,'0'),(356,8,'2018-10-28',7,'0',NULL,'0000-00-00 00:00:00','14:30:00','16:00:00','0',1,'0'),(357,4,'2018-10-28',7,'0',NULL,'0000-00-00 00:00:00','11:30:00','13:00:00','0',1,'0'),(358,3,'2018-10-28',24,'0',NULL,'0000-00-00 00:00:00','17:30:00','19:00:00','0',1,'0'),(359,9,'2018-10-28',36,'0',NULL,'0000-00-00 00:00:00','17:30:00','19:00:00','0',1,'0'),(360,9,'2018-10-26',5,'0',1,'2018-10-19 11:47:59','13:00:00','14:30:00','0',1,'0'),(361,10,'2018-10-26',8,'0',1,'2018-10-19 11:48:08','11:30:00','13:00:00','0',1,'0'),(362,13,'2018-10-26',8,'0',1,'2018-10-19 11:52:21','10:00:00','11:30:00','0',1,'0'),(363,14,'2018-10-26',9,'0',1,'2018-10-19 11:52:23','10:00:00','11:30:00','0',1,'0'),(364,12,'2018-10-26',10,'0',1,'2018-10-19 11:52:25','10:00:00','11:30:00','0',1,'0'),(365,13,'2018-10-26',9,'0',1,'2018-10-19 11:52:29','11:30:00','13:00:00','0',1,'0'),(366,14,'2018-10-26',10,'0',1,'2018-10-19 11:52:32','11:30:00','13:00:00','0',1,'0'),(367,5,'2018-10-26',4,'0',1,'2018-10-19 11:52:47','20:00:00','22:00:00','0',1,'0');
/*!40000 ALTER TABLE `pb_pl_poste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_cellules`
--

DROP TABLE IF EXISTS `pb_pl_poste_cellules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_cellules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `tableau` int(11) NOT NULL,
  `ligne` int(11) NOT NULL,
  `colonne` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_cellules`
--

LOCK TABLES `pb_pl_poste_cellules` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_cellules` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_cellules` VALUES (1,1,1,0,1),(2,1,1,0,9),(3,1,1,1,1),(4,1,1,1,9),(5,1,1,3,1),(6,1,1,4,1),(7,1,1,6,1),(8,1,1,7,1),(9,1,1,7,9),(10,1,1,8,1),(11,1,1,8,9),(12,1,1,9,1),(13,1,1,9,9),(14,1,1,10,1),(15,1,1,10,9),(16,1,1,11,1),(17,1,1,11,9),(18,1,1,12,1),(19,1,1,14,1),(20,1,1,15,1),(21,1,1,15,9),(22,1,1,16,1),(23,1,1,16,9),(24,1,1,17,1),(25,1,1,17,9),(26,1,1,18,1),(27,1,1,18,9),(28,1,1,19,1),(29,1,1,19,9),(30,1,1,20,1),(31,1,1,20,9),(32,1,1,21,1),(33,1,1,21,9),(34,1,1,22,1),(35,1,1,22,9),(36,1,1,23,1),(37,1,1,23,8),(38,1,1,23,9),(39,1,2,0,1),(40,1,2,0,4),(41,1,3,0,12),(42,1,3,1,12),(43,1,3,2,12),(44,1,3,3,12),(45,1,3,4,12),(46,1,3,5,12),(47,1,3,6,12),(48,1,3,7,12),(49,1,3,8,12),(50,1,3,9,12),(51,1,3,10,12),(117,2,2,0,4),(116,2,2,0,1),(115,2,1,19,1),(114,2,1,18,1),(113,2,1,16,1),(112,2,1,14,1),(111,2,1,12,1),(110,2,1,11,1),(109,2,1,10,1),(108,2,1,9,1),(107,2,1,6,1),(106,2,1,4,1),(105,2,1,3,1),(104,2,1,1,1),(103,2,1,0,1);
/*!40000 ALTER TABLE `pb_pl_poste_cellules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_horaires`
--

DROP TABLE IF EXISTS `pb_pl_poste_horaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_horaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `debut` time NOT NULL DEFAULT '00:00:00',
  `fin` time NOT NULL DEFAULT '00:00:00',
  `tableau` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_horaires`
--

LOCK TABLES `pb_pl_poste_horaires` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_horaires` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_horaires` VALUES (1,'09:00:00','10:00:00',1,1),(2,'10:00:00','11:30:00',1,1),(3,'11:30:00','13:00:00',1,1),(4,'13:00:00','14:30:00',1,1),(5,'14:30:00','16:00:00',1,1),(6,'16:00:00','17:30:00',1,1),(7,'17:30:00','19:00:00',1,1),(8,'19:00:00','20:00:00',1,1),(9,'20:00:00','22:00:00',1,1),(10,'09:00:00','14:00:00',2,1),(11,'14:00:00','16:00:00',2,1),(12,'16:00:00','18:00:00',2,1),(13,'18:00:00','22:00:00',2,1),(14,'09:00:00','10:00:00',3,1),(15,'10:00:00','11:00:00',3,1),(16,'11:00:00','12:00:00',3,1),(17,'12:00:00','13:00:00',3,1),(18,'13:00:00','14:00:00',3,1),(19,'14:00:00','15:00:00',3,1),(20,'15:00:00','16:00:00',3,1),(21,'16:00:00','17:00:00',3,1),(22,'17:00:00','18:00:00',3,1),(23,'18:00:00','19:00:00',3,1),(24,'19:00:00','20:00:00',3,1),(25,'20:00:00','22:00:00',3,1),(71,'18:00:00','19:00:00',3,2),(70,'17:00:00','18:00:00',3,2),(69,'16:00:00','17:00:00',3,2),(68,'15:00:00','16:00:00',3,2),(67,'14:00:00','15:00:00',3,2),(66,'13:00:00','14:00:00',3,2),(65,'12:00:00','13:00:00',3,2),(64,'11:00:00','12:00:00',3,2),(63,'10:00:00','11:00:00',3,2),(62,'09:00:00','10:00:00',3,2),(61,'18:00:00','19:00:00',2,2),(60,'16:00:00','18:00:00',2,2),(59,'14:00:00','16:00:00',2,2),(58,'09:00:00','14:00:00',2,2),(57,'17:30:00','19:00:00',1,2),(56,'16:00:00','17:30:00',1,2),(55,'14:30:00','16:00:00',1,2),(54,'13:00:00','14:30:00',1,2),(53,'11:30:00','13:00:00',1,2),(52,'10:00:00','11:30:00',1,2),(51,'09:00:00','10:00:00',1,2);
/*!40000 ALTER TABLE `pb_pl_poste_horaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_lignes`
--

DROP TABLE IF EXISTS `pb_pl_poste_lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_lignes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `tableau` int(11) NOT NULL,
  `ligne` int(11) NOT NULL,
  `poste` varchar(30) NOT NULL,
  `type` enum('poste','ligne','titre','classe') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_lignes`
--

LOCK TABLES `pb_pl_poste_lignes` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_lignes` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_lignes` VALUES (1,1,1,0,'24','poste'),(2,1,1,1,'36','poste'),(3,1,1,2,'3','ligne'),(4,1,1,3,'4','poste'),(5,1,1,4,'5','poste'),(6,1,1,6,'6','poste'),(7,1,1,7,'7','poste'),(8,1,1,8,'8','poste'),(9,1,1,9,'9','poste'),(10,1,1,10,'10','poste'),(11,1,1,11,'11','poste'),(12,1,1,12,'12','poste'),(13,1,1,13,'4','ligne'),(14,1,1,15,'13','poste'),(15,1,1,16,'14','poste'),(16,1,1,17,'15','poste'),(17,1,1,18,'16','poste'),(18,1,1,19,'17','poste'),(19,1,1,20,'19','poste'),(20,1,1,21,'20','poste'),(21,1,1,22,'21','poste'),(22,1,1,23,'22','poste'),(23,1,1,0,'Mezzanine','titre'),(24,1,2,0,'23','poste'),(25,1,2,0,'R&eacute;serve','titre'),(26,1,3,0,'28','poste'),(27,1,3,1,'25','poste'),(28,1,3,2,'26','poste'),(29,1,3,3,'27','poste'),(30,1,3,4,'29','poste'),(31,1,3,5,'30','poste'),(32,1,3,6,'31','poste'),(33,1,3,7,'32','poste'),(34,1,3,8,'33','poste'),(35,1,3,9,'34','poste'),(36,1,3,10,'35','poste'),(37,1,3,0,'Rangement','titre'),(99,2,3,4,'29','poste'),(98,2,3,3,'27','poste'),(97,2,3,2,'26','poste'),(96,2,3,1,'25','poste'),(95,2,3,0,'28','poste'),(94,2,2,0,'23','poste'),(93,2,1,19,'20','poste'),(92,2,1,18,'19','poste'),(91,2,1,16,'16','poste'),(90,2,1,14,'14','poste'),(89,2,1,13,'13','poste'),(88,2,1,12,'4','ligne'),(87,2,1,11,'12','poste'),(86,2,1,10,'11','poste'),(85,2,1,9,'10','poste'),(84,2,1,6,'7','poste'),(83,2,1,5,'6','poste'),(82,2,1,4,'5','poste'),(81,2,1,3,'4','poste'),(80,2,1,2,'3','ligne'),(79,2,1,1,'36','poste'),(78,2,1,0,'24','poste'),(77,2,3,0,'Rangement','titre'),(76,2,2,0,'Réserve','titre'),(75,2,1,0,'Mezzanine','titre');
/*!40000 ALTER TABLE `pb_pl_poste_lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_modeles`
--

DROP TABLE IF EXISTS `pb_pl_poste_modeles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_modeles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `perso_id` int(11) NOT NULL,
  `poste` int(11) NOT NULL,
  `commentaire` text NOT NULL,
  `debut` time NOT NULL,
  `fin` time NOT NULL,
  `tableau` varchar(20) NOT NULL,
  `jour` varchar(10) NOT NULL,
  `site` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_modeles`
--

LOCK TABLES `pb_pl_poste_modeles` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_modeles` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_modeles` VALUES (1,'Mod&egrave;le 1',3,24,'','11:30:00','13:00:00','','',1),(2,'Mod&egrave;le 1',3,36,'','13:00:00','14:30:00','','',1),(3,'Mod&egrave;le 1',3,24,'','14:30:00','16:00:00','','',1),(4,'Mod&egrave;le 1',5,12,'','19:00:00','20:00:00','','',1),(5,'Mod&egrave;le 1',9,36,'','10:00:00','11:30:00','','',1),(6,'Mod&egrave;le 1',3,4,'','10:00:00','11:30:00','','',1),(7,'Mod&egrave;le 1',9,5,'','11:30:00','13:00:00','','',1),(8,'Mod&egrave;le 1',8,6,'','11:30:00','13:00:00','','',1),(9,'Mod&egrave;le 1',8,7,'','13:00:00','14:30:00','','',1),(10,'Mod&egrave;le 1',9,8,'','14:30:00','16:00:00','','',1),(11,'Mod&egrave;le 1',5,13,'','11:30:00','13:00:00','','',1),(12,'Mod&egrave;le 1',5,14,'','13:00:00','14:30:00','','',1),(13,'Mod&egrave;le 1',4,28,'','11:00:00','12:00:00','','',1),(14,'Mod&egrave;le 1',7,25,'','12:00:00','13:00:00','','',1),(15,'Mod&egrave;le 1',11,4,'','11:30:00','13:00:00','','',1),(16,'Mod&egrave;le 1',11,4,'','13:00:00','14:30:00','','',1),(17,'Mod&egrave;le 1',8,5,'','14:30:00','16:00:00','','',1),(18,'Mod&egrave;le 1',11,4,'','16:00:00','17:30:00','','',1),(19,'Mod&egrave;le 1',3,5,'','16:00:00','17:30:00','','',1),(20,'Mod&egrave;le 1',10,23,'','14:00:00','16:00:00','','',1),(21,'Mod&egrave;le 1',9,23,'','16:00:00','18:00:00','','',1),(22,'Mod&egrave;le 1',7,25,'','11:00:00','12:00:00','','',1),(23,'Mod&egrave;le 1',6,26,'','11:00:00','12:00:00','','',1),(24,'Mod&egrave;le 1',4,28,'','12:00:00','13:00:00','','',1),(25,'Mod&egrave;le 1',6,26,'','12:00:00','13:00:00','','',1),(26,'Mod&egrave;le 1',11,24,'','10:00:00','11:30:00','','',1),(27,'Mod&egrave;le 1',8,5,'','10:00:00','11:30:00','','',1),(28,'Mod&egrave;le 1',5,7,'','10:00:00','11:30:00','','',1),(29,'samedi standard',9,36,'','17:30:00','19:00:00','','',1),(30,'samedi standard',3,24,'','17:30:00','19:00:00','','',1),(31,'samedi standard',4,7,'','11:30:00','13:00:00','','',1),(32,'samedi standard',8,7,'','14:30:00','16:00:00','','',1),(33,'samedi standard',3,7,'','13:00:00','14:30:00','','',1),(34,'samedi standard',8,6,'','11:30:00','13:00:00','','',1),(35,'samedi standard',7,4,'','13:00:00','14:30:00','','',1),(36,'samedi standard',11,4,'','11:30:00','13:00:00','','',1),(37,'samedi standard',8,5,'','10:00:00','11:30:00','','',1),(38,'samedi standard',7,4,'','10:00:00','11:30:00','','',1),(39,'samedi standard',3,36,'','11:30:00','13:00:00','','',1),(40,'samedi standard',4,24,'','10:00:00','11:30:00','','',1),(41,'Semaine standard',3,24,'','11:30:00','13:00:00','','4',1),(42,'Semaine standard',3,36,'','13:00:00','14:30:00','','4',1),(43,'Semaine standard',3,24,'','14:30:00','16:00:00','','4',1),(44,'Semaine standard',5,12,'','19:00:00','20:00:00','','4',1),(45,'Semaine standard',3,24,'','11:30:00','13:00:00','','1',1),(46,'Semaine standard',9,36,'','10:00:00','11:30:00','','4',1),(47,'Semaine standard',3,4,'','10:00:00','11:30:00','','4',1),(48,'Semaine standard',9,5,'','11:30:00','13:00:00','','4',1),(49,'Semaine standard',8,6,'','11:30:00','13:00:00','','4',1),(50,'Semaine standard',8,7,'','13:00:00','14:30:00','','4',1),(51,'Semaine standard',9,8,'','14:30:00','16:00:00','','4',1),(52,'Semaine standard',5,13,'','11:30:00','13:00:00','','4',1),(53,'Semaine standard',5,14,'','13:00:00','14:30:00','','4',1),(54,'Semaine standard',4,28,'','11:00:00','12:00:00','','4',1),(55,'Semaine standard',7,25,'','12:00:00','13:00:00','','4',1),(56,'Semaine standard',11,4,'','11:30:00','13:00:00','','4',1),(57,'Semaine standard',11,4,'','13:00:00','14:30:00','','4',1),(58,'Semaine standard',8,5,'','14:30:00','16:00:00','','4',1),(59,'Semaine standard',11,4,'','16:00:00','17:30:00','','4',1),(60,'Semaine standard',3,5,'','16:00:00','17:30:00','','4',1),(61,'Semaine standard',10,23,'','14:00:00','16:00:00','','4',1),(62,'Semaine standard',9,23,'','16:00:00','18:00:00','','4',1),(63,'Semaine standard',7,25,'','11:00:00','12:00:00','','4',1),(64,'Semaine standard',6,26,'','11:00:00','12:00:00','','4',1),(65,'Semaine standard',4,28,'','12:00:00','13:00:00','','4',1),(66,'Semaine standard',6,26,'','12:00:00','13:00:00','','4',1),(67,'Semaine standard',11,24,'','10:00:00','11:30:00','','4',1),(68,'Semaine standard',8,5,'','10:00:00','11:30:00','','4',1),(69,'Semaine standard',5,7,'','10:00:00','11:30:00','','4',1),(70,'Semaine standard',3,36,'','13:00:00','14:30:00','','1',1),(71,'Semaine standard',3,24,'','14:30:00','16:00:00','','1',1),(72,'Semaine standard',5,12,'','19:00:00','20:00:00','','1',1),(73,'Semaine standard',9,36,'','10:00:00','11:30:00','','1',1),(74,'Semaine standard',3,4,'','10:00:00','11:30:00','','1',1),(75,'Semaine standard',9,5,'','11:30:00','13:00:00','','1',1),(76,'Semaine standard',8,6,'','11:30:00','13:00:00','','1',1),(77,'Semaine standard',8,7,'','13:00:00','14:30:00','','1',1),(78,'Semaine standard',9,8,'','14:30:00','16:00:00','','1',1),(79,'Semaine standard',5,13,'','11:30:00','13:00:00','','1',1),(80,'Semaine standard',5,14,'','13:00:00','14:30:00','','1',1),(81,'Semaine standard',4,28,'','11:00:00','12:00:00','','1',1),(82,'Semaine standard',7,25,'','12:00:00','13:00:00','','1',1),(83,'Semaine standard',11,4,'','11:30:00','13:00:00','','1',1),(84,'Semaine standard',11,4,'','13:00:00','14:30:00','','1',1),(85,'Semaine standard',8,5,'','14:30:00','16:00:00','','1',1),(86,'Semaine standard',11,4,'','16:00:00','17:30:00','','1',1),(87,'Semaine standard',3,5,'','16:00:00','17:30:00','','1',1),(88,'Semaine standard',10,23,'','14:00:00','16:00:00','','1',1),(89,'Semaine standard',9,23,'','16:00:00','18:00:00','','1',1),(90,'Semaine standard',7,25,'','11:00:00','12:00:00','','1',1),(91,'Semaine standard',6,26,'','11:00:00','12:00:00','','1',1),(92,'Semaine standard',4,28,'','12:00:00','13:00:00','','1',1),(93,'Semaine standard',6,26,'','12:00:00','13:00:00','','1',1),(94,'Semaine standard',11,24,'','10:00:00','11:30:00','','1',1),(95,'Semaine standard',8,5,'','10:00:00','11:30:00','','1',1),(96,'Semaine standard',5,7,'','10:00:00','11:30:00','','1',1),(97,'Semaine standard',3,24,'','11:30:00','13:00:00','','2',1),(98,'Semaine standard',3,36,'','13:00:00','14:30:00','','2',1),(99,'Semaine standard',3,24,'','14:30:00','16:00:00','','2',1),(100,'Semaine standard',5,12,'','19:00:00','20:00:00','','2',1),(101,'Semaine standard',9,36,'','10:00:00','11:30:00','','2',1),(102,'Semaine standard',3,4,'','10:00:00','11:30:00','','2',1),(103,'Semaine standard',9,5,'','11:30:00','13:00:00','','2',1),(104,'Semaine standard',8,6,'','11:30:00','13:00:00','','2',1),(105,'Semaine standard',8,7,'','13:00:00','14:30:00','','2',1),(106,'Semaine standard',9,8,'','14:30:00','16:00:00','','2',1),(107,'Semaine standard',5,13,'','11:30:00','13:00:00','','2',1),(108,'Semaine standard',5,14,'','13:00:00','14:30:00','','2',1),(109,'Semaine standard',4,28,'','11:00:00','12:00:00','','2',1),(110,'Semaine standard',7,25,'','12:00:00','13:00:00','','2',1),(111,'Semaine standard',11,4,'','11:30:00','13:00:00','','2',1),(112,'Semaine standard',11,4,'','13:00:00','14:30:00','','2',1),(113,'Semaine standard',8,5,'','14:30:00','16:00:00','','2',1),(114,'Semaine standard',11,4,'','16:00:00','17:30:00','','2',1),(115,'Semaine standard',3,5,'','16:00:00','17:30:00','','2',1),(116,'Semaine standard',10,23,'','14:00:00','16:00:00','','2',1),(117,'Semaine standard',9,23,'','16:00:00','18:00:00','','2',1),(118,'Semaine standard',7,25,'','11:00:00','12:00:00','','2',1),(119,'Semaine standard',6,26,'','11:00:00','12:00:00','','2',1),(120,'Semaine standard',4,28,'','12:00:00','13:00:00','','2',1),(121,'Semaine standard',6,26,'','12:00:00','13:00:00','','2',1),(122,'Semaine standard',11,24,'','10:00:00','11:30:00','','2',1),(123,'Semaine standard',8,5,'','10:00:00','11:30:00','','2',1),(124,'Semaine standard',5,7,'','10:00:00','11:30:00','','2',1),(125,'Semaine standard',3,24,'','11:30:00','13:00:00','','3',1),(126,'Semaine standard',3,36,'','13:00:00','14:30:00','','3',1),(127,'Semaine standard',3,24,'','14:30:00','16:00:00','','3',1),(128,'Semaine standard',5,12,'','19:00:00','20:00:00','','3',1),(129,'Semaine standard',9,36,'','10:00:00','11:30:00','','3',1),(130,'Semaine standard',3,4,'','10:00:00','11:30:00','','3',1),(131,'Semaine standard',9,5,'','11:30:00','13:00:00','','3',1),(132,'Semaine standard',8,6,'','11:30:00','13:00:00','','3',1),(133,'Semaine standard',8,7,'','13:00:00','14:30:00','','3',1),(134,'Semaine standard',9,8,'','14:30:00','16:00:00','','3',1),(135,'Semaine standard',5,13,'','11:30:00','13:00:00','','3',1),(136,'Semaine standard',5,14,'','13:00:00','14:30:00','','3',1),(137,'Semaine standard',4,28,'','11:00:00','12:00:00','','3',1),(138,'Semaine standard',7,25,'','12:00:00','13:00:00','','3',1),(139,'Semaine standard',11,4,'','11:30:00','13:00:00','','3',1),(140,'Semaine standard',11,4,'','13:00:00','14:30:00','','3',1),(141,'Semaine standard',8,5,'','14:30:00','16:00:00','','3',1),(142,'Semaine standard',11,4,'','16:00:00','17:30:00','','3',1),(143,'Semaine standard',3,5,'','16:00:00','17:30:00','','3',1),(144,'Semaine standard',10,23,'','14:00:00','16:00:00','','3',1),(145,'Semaine standard',9,23,'','16:00:00','18:00:00','','3',1),(146,'Semaine standard',7,25,'','11:00:00','12:00:00','','3',1),(147,'Semaine standard',6,26,'','11:00:00','12:00:00','','3',1),(148,'Semaine standard',4,28,'','12:00:00','13:00:00','','3',1),(149,'Semaine standard',6,26,'','12:00:00','13:00:00','','3',1),(150,'Semaine standard',11,24,'','10:00:00','11:30:00','','3',1),(151,'Semaine standard',8,5,'','10:00:00','11:30:00','','3',1),(152,'Semaine standard',5,7,'','10:00:00','11:30:00','','3',1),(153,'Semaine standard',3,24,'','11:30:00','13:00:00','','5',1),(154,'Semaine standard',3,36,'','13:00:00','14:30:00','','5',1),(155,'Semaine standard',3,24,'','14:30:00','16:00:00','','5',1),(156,'Semaine standard',5,12,'','19:00:00','20:00:00','','5',1),(157,'Semaine standard',9,36,'','10:00:00','11:30:00','','5',1),(158,'Semaine standard',3,4,'','10:00:00','11:30:00','','5',1),(159,'Semaine standard',9,5,'','11:30:00','13:00:00','','5',1),(160,'Semaine standard',8,6,'','11:30:00','13:00:00','','5',1),(161,'Semaine standard',8,7,'','13:00:00','14:30:00','','5',1),(162,'Semaine standard',9,8,'','14:30:00','16:00:00','','5',1),(163,'Semaine standard',5,13,'','11:30:00','13:00:00','','5',1),(164,'Semaine standard',5,14,'','13:00:00','14:30:00','','5',1),(165,'Semaine standard',4,28,'','11:00:00','12:00:00','','5',1),(166,'Semaine standard',7,25,'','12:00:00','13:00:00','','5',1),(167,'Semaine standard',11,4,'','11:30:00','13:00:00','','5',1),(168,'Semaine standard',11,4,'','13:00:00','14:30:00','','5',1),(169,'Semaine standard',8,5,'','14:30:00','16:00:00','','5',1),(170,'Semaine standard',11,4,'','16:00:00','17:30:00','','5',1),(171,'Semaine standard',3,5,'','16:00:00','17:30:00','','5',1),(172,'Semaine standard',10,23,'','14:00:00','16:00:00','','5',1),(173,'Semaine standard',9,23,'','16:00:00','18:00:00','','5',1),(174,'Semaine standard',7,25,'','11:00:00','12:00:00','','5',1),(175,'Semaine standard',6,26,'','11:00:00','12:00:00','','5',1),(176,'Semaine standard',4,28,'','12:00:00','13:00:00','','5',1),(177,'Semaine standard',6,26,'','12:00:00','13:00:00','','5',1),(178,'Semaine standard',11,24,'','10:00:00','11:30:00','','5',1),(179,'Semaine standard',8,5,'','10:00:00','11:30:00','','5',1),(180,'Semaine standard',5,7,'','10:00:00','11:30:00','','5',1),(181,'Semaine standard',4,24,'','10:00:00','11:30:00','','7',1),(182,'Semaine standard',3,36,'','11:30:00','13:00:00','','7',1),(183,'Semaine standard',7,4,'','10:00:00','11:30:00','','7',1),(184,'Semaine standard',8,5,'','10:00:00','11:30:00','','7',1),(185,'Semaine standard',11,4,'','11:30:00','13:00:00','','7',1),(186,'Semaine standard',7,4,'','13:00:00','14:30:00','','7',1),(187,'Semaine standard',8,6,'','11:30:00','13:00:00','','7',1),(188,'Semaine standard',3,7,'','13:00:00','14:30:00','','7',1),(189,'Semaine standard',8,7,'','14:30:00','16:00:00','','7',1),(190,'Semaine standard',4,7,'','11:30:00','13:00:00','','7',1),(191,'Semaine standard',3,24,'','17:30:00','19:00:00','','7',1),(192,'Semaine standard',9,36,'','17:30:00','19:00:00','','7',1),(193,'Semaine standard',9,36,'','17:30:00','19:00:00','','6',1),(194,'Semaine standard',3,24,'','17:30:00','19:00:00','','6',1),(195,'Semaine standard',4,7,'','11:30:00','13:00:00','','6',1),(196,'Semaine standard',8,7,'','14:30:00','16:00:00','','6',1),(197,'Semaine standard',3,7,'','13:00:00','14:30:00','','6',1),(198,'Semaine standard',8,6,'','11:30:00','13:00:00','','6',1),(199,'Semaine standard',7,4,'','13:00:00','14:30:00','','6',1),(200,'Semaine standard',11,4,'','11:30:00','13:00:00','','6',1),(201,'Semaine standard',8,5,'','10:00:00','11:30:00','','6',1),(202,'Semaine standard',7,4,'','10:00:00','11:30:00','','6',1),(203,'Semaine standard',3,36,'','11:30:00','13:00:00','','6',1),(204,'Semaine standard',4,24,'','10:00:00','11:30:00','','6',1);
/*!40000 ALTER TABLE `pb_pl_poste_modeles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_modeles_tab`
--

DROP TABLE IF EXISTS `pb_pl_poste_modeles_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_modeles_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `jour` int(11) NOT NULL,
  `tableau` int(11) NOT NULL,
  `site` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_modeles_tab`
--

LOCK TABLES `pb_pl_poste_modeles_tab` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_modeles_tab` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_modeles_tab` VALUES (1,'Mod&egrave;le 1',9,1,1),(2,'samedi standard',9,2,1),(3,'Semaine standard',4,1,1),(4,'Semaine standard',1,1,1),(5,'Semaine standard',2,1,1),(6,'Semaine standard',3,1,1),(7,'Semaine standard',5,1,1),(8,'Semaine standard',6,2,1),(9,'Semaine standard',7,2,1);
/*!40000 ALTER TABLE `pb_pl_poste_modeles_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_tab`
--

DROP TABLE IF EXISTS `pb_pl_poste_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_tab` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableau` int(20) NOT NULL,
  `nom` text NOT NULL,
  `site` int(2) NOT NULL DEFAULT '1',
  `supprime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_tab`
--

LOCK TABLES `pb_pl_poste_tab` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_tab` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_tab` VALUES (1,1,'Tableau 1',1,NULL),(2,2,'Samedi',1,NULL);
/*!40000 ALTER TABLE `pb_pl_poste_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_tab_affect`
--

DROP TABLE IF EXISTS `pb_pl_poste_tab_affect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_tab_affect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `tableau` int(11) NOT NULL,
  `site` int(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_tab_affect`
--

LOCK TABLES `pb_pl_poste_tab_affect` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_tab_affect` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_tab_affect` VALUES (1,'2018-10-18',1,1),(16,'2018-10-22',1,1),(17,'2018-10-23',1,1),(18,'2018-10-24',1,1),(19,'2018-10-25',1,1),(20,'2018-10-26',1,1),(21,'2018-10-27',2,1),(22,'2018-10-28',2,1),(9,'2018-10-15',1,1),(10,'2018-10-16',1,1),(11,'2018-10-17',1,1),(12,'2018-10-19',1,1),(14,'2018-10-20',2,1),(15,'2018-10-21',2,1);
/*!40000 ALTER TABLE `pb_pl_poste_tab_affect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_tab_grp`
--

DROP TABLE IF EXISTS `pb_pl_poste_tab_grp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_tab_grp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` text,
  `lundi` int(11) DEFAULT NULL,
  `mardi` int(11) DEFAULT NULL,
  `mercredi` int(11) DEFAULT NULL,
  `jeudi` int(11) DEFAULT NULL,
  `vendredi` int(11) DEFAULT NULL,
  `samedi` int(11) DEFAULT NULL,
  `dimanche` int(11) DEFAULT NULL,
  `site` int(2) NOT NULL DEFAULT '1',
  `supprime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_tab_grp`
--

LOCK TABLES `pb_pl_poste_tab_grp` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_tab_grp` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_tab_grp` VALUES (1,'Semaine standard',1,1,1,1,1,2,2,1,NULL);
/*!40000 ALTER TABLE `pb_pl_poste_tab_grp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_pl_poste_verrou`
--

DROP TABLE IF EXISTS `pb_pl_poste_verrou`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_pl_poste_verrou` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `verrou` int(1) NOT NULL DEFAULT '0',
  `validation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `perso` int(11) NOT NULL DEFAULT '0',
  `verrou2` int(1) NOT NULL DEFAULT '0',
  `validation2` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `perso2` int(11) NOT NULL DEFAULT '0',
  `vivier` int(1) NOT NULL DEFAULT '0',
  `site` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_pl_poste_verrou`
--

LOCK TABLES `pb_pl_poste_verrou` WRITE;
/*!40000 ALTER TABLE `pb_pl_poste_verrou` DISABLE KEYS */;
INSERT INTO `pb_pl_poste_verrou` VALUES (1,'2018-10-18',0,'0000-00-00 00:00:00',0,0,'2018-10-18 12:22:12',1,0,1),(2,'2018-10-26',0,'0000-00-00 00:00:00',0,0,'2018-10-19 11:53:04',1,0,1);
/*!40000 ALTER TABLE `pb_pl_poste_verrou` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_planning_hebdo`
--

DROP TABLE IF EXISTS `pb_planning_hebdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_planning_hebdo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perso_id` int(11) NOT NULL,
  `debut` date NOT NULL,
  `fin` date NOT NULL,
  `temps` text NOT NULL,
  `saisie` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modif` int(11) NOT NULL DEFAULT '0',
  `modification` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valide` int(11) NOT NULL DEFAULT '0',
  `validation` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `actuel` int(1) NOT NULL DEFAULT '0',
  `remplace` int(11) NOT NULL DEFAULT '0',
  `cle` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cle` (`cle`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_planning_hebdo`
--

LOCK TABLES `pb_planning_hebdo` WRITE;
/*!40000 ALTER TABLE `pb_planning_hebdo` DISABLE KEYS */;
INSERT INTO `pb_planning_hebdo` VALUES (1,4,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:32:58',0,'0000-00-00 00:00:00',1,'2018-10-19 09:32:58',0,0,NULL),(2,5,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:33:17',0,'0000-00-00 00:00:00',1,'2018-10-19 09:33:17',0,0,NULL),(3,7,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:33:28',0,'0000-00-00 00:00:00',1,'2018-10-19 09:33:28',0,0,NULL),(4,11,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:33:37',0,'0000-00-00 00:00:00',1,'2018-10-19 09:33:37',0,0,NULL),(5,3,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:33:54',0,'0000-00-00 00:00:00',1,'2018-10-19 09:33:54',0,0,NULL),(6,8,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:34:02',0,'0000-00-00 00:00:00',1,'2018-10-19 09:34:02',0,0,NULL),(7,6,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:34:11',0,'0000-00-00 00:00:00',1,'2018-10-19 09:34:11',0,0,NULL),(8,9,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:34:19',0,'0000-00-00 00:00:00',1,'2018-10-19 09:34:19',0,0,NULL),(9,10,'2018-10-01','2032-10-01','{\"0\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"1\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"2\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"3\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"4\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"5\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"7\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"8\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"9\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"10\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"11\":[\"08:00:00\",\"\",\"\",\"23:00:00\"],\"12\":[\"08:00:00\",\"\",\"\",\"23:00:00\"]}','2018-10-19 09:34:27',0,'0000-00-00 00:00:00',1,'2018-10-19 09:34:27',0,0,NULL),(10,12,'2018-10-01','2032-10-01','[[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"\",\"\",\"\",\"\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"\",\"\",\"\",\"\"]]','2018-10-19 09:51:27',0,'0000-00-00 00:00:00',1,'2018-10-19 09:51:27',0,0,NULL),(11,13,'2018-10-01','2032-10-01','[[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"\",\"\",\"\",\"\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"\",\"\",\"\",\"\"]]','2018-10-19 09:51:39',0,'0000-00-00 00:00:00',1,'2018-10-19 09:51:39',0,0,NULL),(12,14,'2018-10-01','2032-10-01','[[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"\",\"\",\"\",\"\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"08:00:00\",\"\",\"\",\"23:00:00\"],[\"\",\"\",\"\",\"\"]]','2018-10-19 09:51:49',0,'0000-00-00 00:00:00',1,'2018-10-19 09:51:49',0,0,NULL);
/*!40000 ALTER TABLE `pb_planning_hebdo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_planning_hebdo_periodes`
--

DROP TABLE IF EXISTS `pb_planning_hebdo_periodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_planning_hebdo_periodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `annee` varchar(9) DEFAULT NULL,
  `dates` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_planning_hebdo_periodes`
--

LOCK TABLES `pb_planning_hebdo_periodes` WRITE;
/*!40000 ALTER TABLE `pb_planning_hebdo_periodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_planning_hebdo_periodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_plugins`
--

DROP TABLE IF EXISTS `pb_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_plugins`
--

LOCK TABLES `pb_plugins` WRITE;
/*!40000 ALTER TABLE `pb_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_postes`
--

DROP TABLE IF EXISTS `pb_postes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_postes` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `nom` text NOT NULL,
  `groupe` text NOT NULL,
  `groupe_id` int(11) NOT NULL DEFAULT '0',
  `obligatoire` varchar(15) NOT NULL,
  `etage` text NOT NULL,
  `activites` text NOT NULL,
  `statistiques` enum('0','1') DEFAULT '1',
  `bloquant` enum('0','1') DEFAULT '1',
  `site` int(1) DEFAULT '1',
  `categories` text,
  `supprime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_postes`
--

LOCK TABLES `pb_postes` WRITE;
/*!40000 ALTER TABLE `pb_postes` DISABLE KEYS */;
INSERT INTO `pb_postes` VALUES (4,'Inscription 1','',0,'Obligatoire','RDC','[\"5\"]','1','1',1,'[]',NULL),(5,'Retour','',0,'Obligatoire','RDC','[\"6\"]','1','1',1,'[]',NULL),(6,'Prêt / retour 1','',0,'Obligatoire','RDC','[\"7\",\"6\"]','1','1',1,'[]',NULL),(7,'Prêt / retour 2','',0,'Renfort','RDC','[\"7\",\"6\"]','1','1',1,'[]',NULL),(8,'Prêt / retour 3','',0,'Renfort','RDC','[\"7\",\"6\"]','1','1',1,'[]',NULL),(9,'Prêt / retour 4','',0,'Renfort','RDC','[\"7\",\"6\"]','1','1',1,'[]',NULL),(10,'Inscription 2','',0,'Renfort','RDC','[5]','1','1',1,NULL,NULL),(11,'Communication RDC','',0,'Renfort','RDC','[\"3\"]','1','1',1,'[]',NULL),(12,'Renseignement RDC','',0,'Obligatoire','RDC','[9,10]','1','1',1,NULL,NULL),(13,'Renseignement sp&eacute;cialis&eacute; 1','',0,'Obligatoire','RDJ','[9,10,12]','1','1',1,NULL,NULL),(14,'Renseignement sp&eacute;cialis&eacute; 2','',0,'Renfort','RDJ','[9,10,12]','1','1',1,NULL,NULL),(15,'Renseignement sp&eacute;cialis&eacute; 3','',0,'Renfort','RDJ','[9,10,12]','1','1',1,NULL,NULL),(16,'Communication (banque 1)','',0,'Obligatoire','RDJ','[\"3\",\"7\",\"6\"]','1','1',1,'[]',NULL),(17,'Communication (banque 2)','',0,'Renfort','RDJ','[\"3\",\"9\",\"10\"]','1','1',1,'[]',NULL),(19,'Communication (coordination)','',0,'Obligatoire','RDJ','[3]','1','1',1,NULL,NULL),(20,'Communication (magasin 1)','',0,'Obligatoire','RDJ','[3]','1','1',1,NULL,NULL),(21,'Communication (magasin 2)','',0,'Obligatoire','RDJ','[\"3\"]','1','1',1,'[]',NULL),(22,'Communication (magasin 3)','',0,'Renfort','RDJ','[3]','1','1',1,NULL,NULL),(23,'Consultation de la réserve','',0,'Obligatoire','RDJ','[\"4\"]','1','1',1,'[]',NULL),(24,'Audiovisuel et autoformation','',0,'Obligatoire','Mezzanine','[\"1\",\"2\"]','1','1',1,'[]',NULL),(25,'Rangement 2','',0,'Obligatoire','RDC','[8]','1','1',1,NULL,NULL),(26,'Rangement 3','',0,'Obligatoire','RDC','[8]','1','1',1,NULL,NULL),(27,'Rangement 4','',0,'Renfort','RDC','[8]','1','1',1,NULL,NULL),(28,'Rangement 1','',0,'Obligatoire','Mezzanine','[8]','1','1',1,NULL,NULL),(29,'Rangement 5','',0,'Obligatoire','RDJ','[8]','1','1',1,NULL,NULL),(30,'Rangement 6','',0,'Obligatoire','RDJ','[8]','1','1',1,NULL,NULL),(31,'Rangement 7','',0,'Renfort','RDJ','[8]','1','1',1,NULL,NULL),(32,'Rangement 8','',0,'Renfort','RDJ','[8]','1','1',1,NULL,NULL),(33,'Rangement 9','',0,'Renfort','RDJ','[8]','1','1',1,NULL,NULL),(34,'Rangement 10','',0,'Obligatoire','Magasins','[8]','1','1',1,NULL,NULL),(35,'Rangement 11','',0,'Obligatoire','Magasins','[8]','1','1',1,NULL,NULL),(36,'Renseignement kiosque','',0,'Renfort','Mezzanine','[9,10]','1','1',1,NULL,NULL);
/*!40000 ALTER TABLE `pb_postes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_responsables`
--

DROP TABLE IF EXISTS `pb_responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_responsables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perso_id` int(11) NOT NULL DEFAULT '0',
  `responsable` int(11) NOT NULL DEFAULT '0',
  `notification` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_responsables`
--

LOCK TABLES `pb_responsables` WRITE;
/*!40000 ALTER TABLE `pb_responsables` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_select_abs`
--

DROP TABLE IF EXISTS `pb_select_abs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_select_abs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_select_abs`
--

LOCK TABLES `pb_select_abs` WRITE;
/*!40000 ALTER TABLE `pb_select_abs` DISABLE KEYS */;
INSERT INTO `pb_select_abs` VALUES (1,'Non justifi&eacute;e',1,0),(2,'Cong&eacute;s pay&eacute;s',2,0),(3,'Maladie',3,0),(4,'Cong&eacute; maternit&eacute;',4,0),(5,'R&eacute;union syndicale',5,0),(6,'Gr&egrave;ve',6,0),(7,'Formation',7,0),(8,'Concours',8,0),(9,'Stage',9,0),(10,'R&eacute;union',10,0),(11,'Entretien',11,0),(12,'Autre',12,0);
/*!40000 ALTER TABLE `pb_select_abs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_select_categories`
--

DROP TABLE IF EXISTS `pb_select_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_select_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_select_categories`
--

LOCK TABLES `pb_select_categories` WRITE;
/*!40000 ALTER TABLE `pb_select_categories` DISABLE KEYS */;
INSERT INTO `pb_select_categories` VALUES (1,'Cat&eacute;gorie A',10),(2,'Cat&eacute;gorie B',20),(3,'Cat&eacute;gorie C',30);
/*!40000 ALTER TABLE `pb_select_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_select_etages`
--

DROP TABLE IF EXISTS `pb_select_etages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_select_etages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_select_etages`
--

LOCK TABLES `pb_select_etages` WRITE;
/*!40000 ALTER TABLE `pb_select_etages` DISABLE KEYS */;
INSERT INTO `pb_select_etages` VALUES (1,'Mezzanine',1),(2,'RDC',2),(3,'RDJ',3),(4,'Magasins',4);
/*!40000 ALTER TABLE `pb_select_etages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_select_groupes`
--

DROP TABLE IF EXISTS `pb_select_groupes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_select_groupes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_select_groupes`
--

LOCK TABLES `pb_select_groupes` WRITE;
/*!40000 ALTER TABLE `pb_select_groupes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pb_select_groupes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_select_services`
--

DROP TABLE IF EXISTS `pb_select_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_select_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `rang` int(11) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_select_services`
--

LOCK TABLES `pb_select_services` WRITE;
/*!40000 ALTER TABLE `pb_select_services` DISABLE KEYS */;
INSERT INTO `pb_select_services` VALUES (1,'P&ocirc;le public',1,''),(2,'P&ocirc;le conservation',2,''),(3,'P&ocirc;le collection',3,''),(4,'P&ocirc;le informatique',4,''),(5,'P&ocirc;le administratif',5,''),(6,'Direction',6,'');
/*!40000 ALTER TABLE `pb_select_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pb_select_statuts`
--

DROP TABLE IF EXISTS `pb_select_statuts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pb_select_statuts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` text NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '0',
  `couleur` varchar(7) NOT NULL,
  `categorie` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pb_select_statuts`
--

LOCK TABLES `pb_select_statuts` WRITE;
/*!40000 ALTER TABLE `pb_select_statuts` DISABLE KEYS */;
INSERT INTO `pb_select_statuts` VALUES (1,'Conservateur',1,'',1),(2,'Biblioth&eacute;caire',2,'',1),(3,'AB',3,'',0),(4,'BAS',4,'',2),(5,'Magasinier',5,'',3),(6,'Etudiant',6,'',3),(7,'Garde de nuit',7,'',0),(8,'Autre',8,'',0);
/*!40000 ALTER TABLE `pb_select_statuts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-19 11:56:09
