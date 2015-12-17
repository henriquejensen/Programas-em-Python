-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 17-Dez-2015 às 13:57
-- Versão do servidor: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proidea_dev1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_activity`
--

CREATE TABLE `pi_activity` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `begin` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `end` date NOT NULL,
  `name` varchar(500) NOT NULL,
  `status` int(11) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `responsible_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_async_event`
--

CREATE TABLE `pi_async_event` (
  `id` bigint(20) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `eventId` int(11) NOT NULL,
  `eventParams` text,
  `eventPriority` int(11) NOT NULL,
  `jobId` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign`
--

CREATE TABLE `pi_campaign` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `appealBegin` datetime DEFAULT NULL,
  `appealEnabled` bit(1) NOT NULL,
  `appealEnd` datetime DEFAULT NULL,
  `classificationBanner` varchar(200) DEFAULT NULL,
  `classificationBtnText` varchar(200) DEFAULT NULL,
  `closed` bit(1) NOT NULL,
  `deactivationAlertEnabled` bit(1) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `dummyInstitution` bit(1) NOT NULL,
  `institutionGroupRanked` bit(1) NOT NULL,
  `institutionRanked` bit(1) NOT NULL,
  `labelDeactivationInstitutionText` varchar(4000) DEFAULT NULL,
  `labelDeactivationInstitutionTooltip` varchar(1000) DEFAULT NULL,
  `labelDeactivationUserText` varchar(4000) DEFAULT NULL,
  `labelDeactivationUserTooltip` varchar(1000) DEFAULT NULL,
  `labelDummyInstitution` varchar(255) NOT NULL,
  `labelInstitutionGroup` varchar(255) NOT NULL,
  `labelInstitutionSelection` varchar(255) NOT NULL,
  `labelMyInstitution` varchar(255) NOT NULL,
  `labelRules` varchar(255) NOT NULL,
  `participativeEvaluated` bit(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `userRanked` bit(1) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `rules_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_campaign`
--

INSERT INTO `pi_campaign` (`id`, `deleted`, `appealBegin`, `appealEnabled`, `appealEnd`, `classificationBanner`, `classificationBtnText`, `closed`, `deactivationAlertEnabled`, `description`, `dummyInstitution`, `institutionGroupRanked`, `institutionRanked`, `labelDeactivationInstitutionText`, `labelDeactivationInstitutionTooltip`, `labelDeactivationUserText`, `labelDeactivationUserTooltip`, `labelDummyInstitution`, `labelInstitutionGroup`, `labelInstitutionSelection`, `labelMyInstitution`, `labelRules`, `participativeEvaluated`, `title`, `userRanked`, `company_id`, `rules_id`) VALUES
(1, b'0', NULL, b'0', NULL, NULL, 'Classificação', b'0', b'0', '<ol><li><span style="font-family: arial; font-size: medium;"><span style="color: rgb(0, 0, 0); background-color: rgb(253, 244, 244);">Prêmio para pró-reitoria, departamento ou setor:</span><span style="color: rgb(255, 255, 255); background-color: rgb(253, 244, 244);">&nbsp;R$100.000,00 (1º colocado)</span></span><br></li></ol>', b'1', b'0', b'0', '<p>A pontuação de sua instituição pode ter sido reduzida devido à desativação da conta de {0} usuários que realizaram ações que geraram pontos à ela.</p><p>Lavras, {1}.</p>', 'A pontuação de sua instituição pode ter sido reduzida devido à desativação da conta de {0} usuários que realizaram ações que geraram pontos à ela.', '<p>A sua pontuação pode ter sido reduzida devido à desativação da conta de {0} usuários que interagiram com suas ideias.</p><p>Lavras, {1}.</p>', 'A sua pontuação pode ter sido reduzida devido à desativação da conta de {0} usuários que interagiram com suas ideias.', 'Sem instituição', 'Grupo Institucional', 'Selecione sua instituição', 'Minha instituição', 'Edital', b'0', 'Rodada de desafios #1', b'0', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_inst`
--

CREATE TABLE `pi_campaign_inst` (
  `company_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `group_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_inst_deactivation_alert`
--

CREATE TABLE `pi_campaign_inst_deactivation_alert` (
  `generatedAt` date DEFAULT NULL,
  `hideAlert` bit(1) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_inst_group_score`
--

CREATE TABLE `pi_campaign_inst_group_score` (
  `lastUpdated` datetime DEFAULT NULL,
  `postedComments` int(11) NOT NULL,
  `postedDislikes` int(11) NOT NULL,
  `postedIdeas` int(11) NOT NULL,
  `postedLikes` int(11) NOT NULL,
  `receivedComments` int(11) NOT NULL,
  `receivedDislikes` int(11) NOT NULL,
  `receivedLikes` int(11) NOT NULL,
  `receivedUserLikes` int(11) NOT NULL,
  `totalScore` double NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_inst_score`
--

CREATE TABLE `pi_campaign_inst_score` (
  `lastUpdated` datetime DEFAULT NULL,
  `postedComments` int(11) NOT NULL,
  `postedDislikes` int(11) NOT NULL,
  `postedIdeas` int(11) NOT NULL,
  `postedLikes` int(11) NOT NULL,
  `receivedComments` int(11) NOT NULL,
  `receivedDislikes` int(11) NOT NULL,
  `receivedLikes` int(11) NOT NULL,
  `receivedUserLikes` int(11) NOT NULL,
  `totalScore` double NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_pi_evaluation_criterion`
--

CREATE TABLE `pi_campaign_pi_evaluation_criterion` (
  `pi_campaign_id` bigint(20) NOT NULL,
  `criterions_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_user_badge`
--

CREATE TABLE `pi_campaign_user_badge` (
  `average` double NOT NULL,
  `badge` int(11) NOT NULL,
  `evaluations` bigint(20) NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_campaign_user_score`
--

CREATE TABLE `pi_campaign_user_score` (
  `lastUpdated` datetime DEFAULT NULL,
  `postedComments` int(11) NOT NULL,
  `postedDislikes` int(11) NOT NULL,
  `postedIdeas` int(11) NOT NULL,
  `postedLikes` int(11) NOT NULL,
  `receivedComments` int(11) NOT NULL,
  `receivedDislikes` int(11) NOT NULL,
  `receivedLikes` int(11) NOT NULL,
  `receivedUserLikes` int(11) NOT NULL,
  `totalScore` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_city`
--

CREATE TABLE `pi_city` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `state_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_comment`
--

CREATE TABLE `pi_comment` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `moderationInfo` varchar(4000) DEFAULT NULL,
  `moderationStatus` int(11) NOT NULL,
  `posted` datetime DEFAULT NULL,
  `postedByIp` varchar(255) NOT NULL,
  `idea_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_company`
--

CREATE TABLE `pi_company` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `accessToken` varchar(255) DEFAULT NULL,
  `category` varchar(255) NOT NULL,
  `community` bit(1) NOT NULL,
  `createdAt` datetime NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `facebookId` varchar(255) DEFAULT NULL,
  `fanPage` bit(1) NOT NULL,
  `link` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photoLink` varchar(255) NOT NULL,
  `defaultLocale` varchar(16) NOT NULL,
  `headerImage` varchar(512) NOT NULL,
  `loadingImage` varchar(512) NOT NULL,
  `mobileWelcomeImage` varchar(512) NOT NULL,
  `theme` int(11) NOT NULL,
  `shortName` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_company`
--

INSERT INTO `pi_company` (`id`, `deleted`, `accessToken`, `category`, `community`, `createdAt`, `description`, `facebookId`, `fanPage`, `link`, `name`, `photoLink`, `defaultLocale`, `headerImage`, `loadingImage`, `mobileWelcomeImage`, `theme`, `shortName`) VALUES
(1, b'0', '', 'ensino', b'0', '2015-12-14 15:37:35', NULL, NULL, b'0', 'http://www.progolden.com.br/', 'progolden', 'https://pbs.twimg.com/profile_images/3662114136/5cb4a053c98007e3be3e2cabbe4328e3_400x400.jpeg', 'pt_BR', '', '', '', 4, 'pg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_company_domain`
--

CREATE TABLE `pi_company_domain` (
  `host` varchar(128) NOT NULL,
  `appleStoreUrl` varchar(500) DEFAULT NULL,
  `baseUrl` varchar(512) NOT NULL,
  `playStoreUrl` varchar(500) DEFAULT NULL,
  `portalEnabled` bit(1) NOT NULL,
  `company_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_company_domain`
--

INSERT INTO `pi_company_domain` (`host`, `appleStoreUrl`, `baseUrl`, `playStoreUrl`, `portalEnabled`, `company_id`) VALUES
('localhost:8080', NULL, 'http://localhost:8080/ProIdea/', NULL, b'0', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_company_group`
--

CREATE TABLE `pi_company_group` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_country`
--

CREATE TABLE `pi_country` (
  `id` bigint(20) NOT NULL,
  `locale` varchar(16) NOT NULL,
  `name` varchar(255) NOT NULL,
  `shortName` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_dashboard`
--

CREATE TABLE `pi_dashboard` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `increaseOfComments` bigint(20) DEFAULT NULL,
  `increaseOfDislikes` bigint(20) DEFAULT NULL,
  `increaseOfGames` bigint(20) DEFAULT NULL,
  `increaseOfIdeas` bigint(20) DEFAULT NULL,
  `increaseOfLikes` bigint(20) DEFAULT NULL,
  `increaseOfLogins` bigint(20) DEFAULT NULL,
  `increaseOfParticipants` bigint(20) DEFAULT NULL,
  `increaseOfValidations` bigint(20) DEFAULT NULL,
  `numberOfComments` bigint(20) DEFAULT NULL,
  `numberOfDislikes` bigint(20) DEFAULT NULL,
  `numberOfGames` bigint(20) DEFAULT NULL,
  `numberOfIdeas` bigint(20) DEFAULT NULL,
  `numberOfLikes` bigint(20) DEFAULT NULL,
  `numberOfLogins` bigint(20) DEFAULT NULL,
  `numberOfParticipants` bigint(20) DEFAULT NULL,
  `numberOfValidations` bigint(20) DEFAULT NULL,
  `percentOfComments` double NOT NULL,
  `percentOfDislikes` double NOT NULL,
  `percentOfGames` double NOT NULL,
  `percentOfIdeas` double NOT NULL,
  `percentOfLikes` double NOT NULL,
  `percentOfLogins` double NOT NULL,
  `percentOfParticipants` double NOT NULL,
  `percentOfValidations` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_denounce`
--

CREATE TABLE `pi_denounce` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `posted` datetime DEFAULT NULL,
  `status` int(11) NOT NULL,
  `type` int(11) DEFAULT NULL,
  `idea_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_dynamic_permission`
--

CREATE TABLE `pi_dynamic_permission` (
  `id` bigint(20) NOT NULL,
  `permission` int(11) DEFAULT NULL,
  `userRole_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_evaluation_criterion`
--

CREATE TABLE `pi_evaluation_criterion` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `shortTitle` varchar(96) NOT NULL,
  `tag` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_game`
--

CREATE TABLE `pi_game` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `begin` datetime DEFAULT NULL,
  `blockSimpleComment` bit(1) NOT NULL,
  `commentPreviousModeration` bit(1) NOT NULL,
  `dailyIdeasLimit` int(11) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `descriptionLabel` varchar(255) NOT NULL,
  `end` datetime DEFAULT NULL,
  `ideaBox` bit(1) NOT NULL,
  `ideaBoxClosed` bit(1) NOT NULL,
  `ideaPreviousModeration` bit(1) NOT NULL,
  `fiveStarDescription` varchar(1000) NOT NULL,
  `fourStarDescription` varchar(1000) NOT NULL,
  `oneStarDescription` varchar(1000) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `threeStarDescription` varchar(1000) NOT NULL,
  `twoStarDescription` varchar(1000) NOT NULL,
  `numberOfComments` bigint(20) NOT NULL,
  `numberOfIdeas` bigint(20) NOT NULL,
  `numberOfLikes` bigint(20) NOT NULL,
  `numberOfPermitedWordsInComment` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `photoLink` varchar(255) NOT NULL,
  `privateParticipation` bit(1) NOT NULL,
  `reward` varchar(255) NOT NULL,
  `rewardDescription` varchar(4000) DEFAULT NULL,
  `postComment` double NOT NULL,
  `postDislike` double NOT NULL,
  `postIdea` double NOT NULL,
  `postLike` double NOT NULL,
  `receiveComment` double NOT NULL,
  `receiveDislike` double NOT NULL,
  `receiveLike` double NOT NULL,
  `receiveUserLike` double NOT NULL,
  `sponsorPhotoLink` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `titleLabel` varchar(255) NOT NULL,
  `validUserRequired` bit(1) NOT NULL,
  `weekIdeasLimit` int(11) NOT NULL,
  `campaign_id` bigint(20) DEFAULT NULL,
  `company_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_game`
--

INSERT INTO `pi_game` (`id`, `deleted`, `begin`, `blockSimpleComment`, `commentPreviousModeration`, `dailyIdeasLimit`, `description`, `descriptionLabel`, `end`, `ideaBox`, `ideaBoxClosed`, `ideaPreviousModeration`, `fiveStarDescription`, `fourStarDescription`, `oneStarDescription`, `theme`, `threeStarDescription`, `twoStarDescription`, `numberOfComments`, `numberOfIdeas`, `numberOfLikes`, `numberOfPermitedWordsInComment`, `password`, `photoLink`, `privateParticipation`, `reward`, `rewardDescription`, `postComment`, `postDislike`, `postIdea`, `postLike`, `receiveComment`, `receiveDislike`, `receiveLike`, `receiveUserLike`, `sponsorPhotoLink`, `title`, `titleLabel`, `validUserRequired`, `weekIdeasLimit`, `campaign_id`, `company_id`) VALUES
(1, b'0', '2015-12-16 10:17:00', b'0', b'0', 0, 'acabe com o mosquito', 'Explique e justifique a importância de sua ideia', '2016-12-16 10:00:00', b'0', b'0', b'0', 'Contribuição de impacto alto com alta contribuição financeira (direta ou indiretamente): 25 pontos.', 'Contribuição de impacto alto (contribuição para toda organização, com alta repercussão): 16 pontos.', 'Não implementável ou custo/beneficio desfavorável: 1 ponto.', '', 'Contribuição de impacto médio (contribuição para todo setor ou produto): 9 pontos.', 'Contribuição de impacto baixo (limitado a uma função ou serviço): 4 pontos.', 0, 0, 0, 0, NULL, 'http://promanager.progolden.com.br/prostorager/file/2373', b'0', '1000', 'para o &nbsp;primeiro', 1, 0, 5, 1, 1, 0, 1, 15, NULL, 'Como acabar com o mosquito', 'Ideia', b'1', 0, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_game_awarding`
--

CREATE TABLE `pi_game_awarding` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `award` varchar(255) NOT NULL,
  `begin` datetime NOT NULL,
  `createdAt` datetime NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `end` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `ideaBox_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_game_priv_participant`
--

CREATE TABLE `pi_game_priv_participant` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `game_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_game_rules`
--

CREATE TABLE `pi_game_rules` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `fileUrl` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `lastModified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea`
--

CREATE TABLE `pi_idea` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `criterionEvaluationAverage` double NOT NULL,
  `description` varchar(4000) NOT NULL,
  `evaluation` double NOT NULL,
  `evaluationAverage` double NOT NULL,
  `facebookId` varchar(255) DEFAULT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `moderationInfo` varchar(4000) DEFAULT NULL,
  `moderationStatus` int(11) NOT NULL,
  `numberOfComments` bigint(20) NOT NULL,
  `numberOfCriterionEvaluations` bigint(20) NOT NULL,
  `numberOfDenounces` bigint(20) NOT NULL,
  `numberOfDislikes` bigint(20) NOT NULL,
  `numberOfEvaluations` bigint(20) NOT NULL,
  `numberOfLikes` bigint(20) NOT NULL,
  `posted` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `ideaCategory_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_battle`
--

CREATE TABLE `pi_idea_battle` (
  `lastModified` datetime NOT NULL,
  `winner` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `second_id` bigint(20) NOT NULL,
  `first_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_category`
--

CREATE TABLE `pi_idea_category` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `created` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `game_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_crit_battle`
--

CREATE TABLE `pi_idea_crit_battle` (
  `numberOfBattles` int(11) NOT NULL,
  `numberOfFirstWins` int(11) NOT NULL,
  `numberOfSecondWins` int(11) NOT NULL,
  `winner` int(11) NOT NULL,
  `second_id` bigint(20) NOT NULL,
  `first_id` bigint(20) NOT NULL,
  `criterion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_crit_eval`
--

CREATE TABLE `pi_idea_crit_eval` (
  `average` double NOT NULL,
  `numberOfEvaluations` int(11) NOT NULL,
  `idea_id` bigint(20) NOT NULL,
  `criterion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_eval`
--

CREATE TABLE `pi_idea_eval` (
  `committee` bit(1) NOT NULL,
  `evaluation` double NOT NULL,
  `lastModified` datetime NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `idea_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_keyword`
--

CREATE TABLE `pi_idea_keyword` (
  `keyword` varchar(64) NOT NULL,
  `idea_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_limbus`
--

CREATE TABLE `pi_idea_limbus` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(4000) NOT NULL,
  `evaluation` double NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `moderationInfo` varchar(4000) DEFAULT NULL,
  `moderationStatus` int(11) NOT NULL,
  `posted` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `ideaCategory_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_idea_metad`
--

CREATE TABLE `pi_idea_metad` (
  `evaluation` double NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `idea_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_marker`
--

CREATE TABLE `pi_marker` (
  `id` bigint(20) NOT NULL,
  `label` varchar(255) NOT NULL,
  `game_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_marker_pi_idea`
--

CREATE TABLE `pi_marker_pi_idea` (
  `markerList_id` bigint(20) NOT NULL,
  `ideas_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_portal`
--

CREATE TABLE `pi_portal` (
  `about` varchar(4000) NOT NULL,
  `bannerBtnText` varchar(1000) DEFAULT NULL,
  `bannerTitle` varchar(4000) DEFAULT NULL,
  `callFile` varchar(4000) DEFAULT NULL,
  `callText` varchar(4000) DEFAULT NULL,
  `captchaSecretkey` varchar(400) DEFAULT NULL,
  `captchaSitekey` varchar(400) DEFAULT NULL,
  `copyright` varchar(400) DEFAULT NULL,
  `description` varchar(4000) NOT NULL,
  `fbName` varchar(4000) DEFAULT NULL,
  `fbPage` varchar(100) DEFAULT NULL,
  `homeBanner` varchar(255) NOT NULL,
  `howWorks` varchar(4000) NOT NULL,
  `importance` varchar(4000) NOT NULL,
  `keywords` varchar(4000) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `name` varchar(2000) DEFAULT NULL,
  `privacy` varchar(4000) DEFAULT NULL,
  `sponsors` varchar(4000) DEFAULT NULL,
  `steps` varchar(4000) DEFAULT NULL,
  `supporters` varchar(4000) DEFAULT NULL,
  `terms` varchar(4000) DEFAULT NULL,
  `whenn` varchar(4000) NOT NULL,
  `domain_host` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_portal`
--

INSERT INTO `pi_portal` (`about`, `bannerBtnText`, `bannerTitle`, `callFile`, `callText`, `captchaSecretkey`, `captchaSitekey`, `copyright`, `description`, `fbName`, `fbPage`, `homeBanner`, `howWorks`, `importance`, `keywords`, `logo`, `name`, `privacy`, `sponsors`, `steps`, `supporters`, `terms`, `whenn`, `domain_host`) VALUES
('UFLA+ Soluções Inovadoras é uma consulta pública promovida pela Universidade Federal de Lavras para prospectar inovações na instituição por meio da participação social.', 'Comece Agora', 'Participe do PrêmioIdeia', '<a href = ''http://www.ufla.br/''>Descricao</a>', 'Chamada Publica', '6LdkkAwTAAAAAI2NwdrFME1L1Io-hktK7fbf45Cs', '6LdkkAwTAAAAAGqudt7BKGUSROGwG9WhTHnEjfGR', 'ufla', 'Descrição', NULL, NULL, 'http://promanager.progolden.com.br/prostorager/file/2362', 'Você pode enviar ideias, curtir, comentar e compartilhar outras ideias. A cada interação, você acumula pontos para disputar ótimos prêmios. Clique aqui e veja como participar.', 'Participando dos desafios de ideias desta consulta, você irá contribuir com a identificação e avaliação de soluções inovadoras para impulsionar o desenvolvimento institucional da UFLA.', 'Palavras-chave', 'http://promanager.progolden.com.br/prostorager/file/2354', 'progolden', 'http://www.ufla.br/', '<a href="http://www.ufla.br/" target="_blank" title="Ir para o site"><img src="http://www.eventos.ufla.br/iiiselem/images/ufla.png" alt="UFLA"></a>', 'http://promanager.progolden.com.br/prostorager/file/2363', '<a href="http://www.ufla.br/" target="_blank" title="Ir para o site"><img src="http://www.eventos.ufla.br/iiiselem/images/ufla.png" alt="UFLA"></a>', 'http://www.ufla.br/', 'A consulta iniciará às 16:00 (horário de Brasília) de 27 de maio de 2015. Clique aqui para consultar a Chamada Pública. Todos os cidadãos são convidados a participar desse grande desafio de ideias.', 'localhost:8080');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_portal_news`
--

CREATE TABLE `pi_portal_news` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `description` varchar(200) NOT NULL,
  `link` varchar(1000) NOT NULL,
  `photoLink` varchar(255) DEFAULT NULL,
  `title` varchar(140) NOT NULL,
  `portal_domain_host` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_project`
--

CREATE TABLE `pi_project` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `begin` date NOT NULL,
  `budget` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `end` date NOT NULL,
  `impacts` varchar(4000) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `responsible_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_state`
--

CREATE TABLE `pi_state` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `uf` varchar(32) NOT NULL,
  `country_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_stored_email`
--

CREATE TABLE `pi_stored_email` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `html` bit(1) NOT NULL,
  `message` varchar(4000) NOT NULL,
  `sent` bit(1) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `game_id` bigint(20) DEFAULT NULL,
  `to_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_system_notification`
--

CREATE TABLE `pi_system_notification` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `imageUrl` varchar(255) NOT NULL,
  `occurrence` datetime DEFAULT NULL,
  `type` varchar(32) NOT NULL,
  `visualized` bit(1) NOT NULL,
  `idea_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_tag`
--

CREATE TABLE `pi_tag` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `displayString` varchar(255) NOT NULL,
  `word` varchar(255) NOT NULL,
  `game_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_tag_count`
--

CREATE TABLE `pi_tag_count` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `count` bigint(20) DEFAULT NULL,
  `idea_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user`
--

CREATE TABLE `pi_user` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `accessLevel` int(11) NOT NULL,
  `accessToken` varchar(4000) DEFAULT NULL,
  `activationCode` varchar(255) DEFAULT NULL,
  `cellPhoneNumber` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `creationIpAddress` varchar(255) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `emailValidated` bit(1) NOT NULL,
  `emailValidationIpAddress` varchar(255) DEFAULT NULL,
  `facebookId` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `linkedinId` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneValidated` bit(1) NOT NULL,
  `phoneValidationIpAddress` varchar(255) DEFAULT NULL,
  `photoLink` varchar(255) DEFAULT NULL,
  `pretendedCellPhone` varchar(255) DEFAULT NULL,
  `smsCode` varchar(255) DEFAULT NULL,
  `smsCodesRequired` int(11) NOT NULL,
  `smsLastRequire` datetime DEFAULT NULL,
  `smsValidationsTried` int(11) NOT NULL,
  `suspect` bit(1) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `verified` bit(1) NOT NULL,
  `zipCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_user`
--

INSERT INTO `pi_user` (`id`, `deleted`, `accessLevel`, `accessToken`, `activationCode`, `cellPhoneNumber`, `createdAt`, `creationIpAddress`, `dateOfBirth`, `email`, `emailValidated`, `emailValidationIpAddress`, `facebookId`, `genre`, `link`, `linkedinId`, `locale`, `location`, `name`, `password`, `phoneValidated`, `phoneValidationIpAddress`, `photoLink`, `pretendedCellPhone`, `smsCode`, `smsCodesRequired`, `smsLastRequire`, `smsValidationsTried`, `suspect`, `username`, `verified`, `zipCode`) VALUES
(1, b'0', 10, '', NULL, '(35) 9911-91991', '2015-12-14 15:33:57', '127.0.0.1', '1990-01-01', 'teste@gmail.com', b'0', NULL, NULL, NULL, '', NULL, 'pt_BR', 'Lavras - MG', 'Teste Progolden', 'Bcu-d0aCUgs', b'0', NULL, '/ProIdea/public/default/img/icon_user.png', '', NULL, 0, NULL, 0, b'0', '273.124.144-60', b'0', '37200-000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_agreements`
--

CREATE TABLE `pi_user_agreements` (
  `id` bigint(20) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `createdByIp` varchar(255) NOT NULL,
  `game_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_award_score`
--

CREATE TABLE `pi_user_award_score` (
  `evaluationAvg` double NOT NULL,
  `evaluationSquareSum` double NOT NULL,
  `evaluationSum` double NOT NULL,
  `lastUpdated` datetime DEFAULT NULL,
  `postedIdeas` int(11) NOT NULL,
  `totalScore` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `awarding_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_browser`
--

CREATE TABLE `pi_user_browser` (
  `id` bigint(20) NOT NULL,
  `cookieId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `userAgent` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_user_browser`
--

INSERT INTO `pi_user_browser` (`id`, `cookieId`, `createdAt`, `userAgent`) VALUES
(1, '0', '2015-12-14 15:25:37', 'Not available'),
(2, 'HUowjqGL4RGaBXLJl9omLA', '2015-12-14 15:32:07', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36'),
(3, '9n3AHk9NNRLqmjGPPgQfDw', '2015-12-14 15:33:00', 'Jakarta Commons-HttpClient/3.1'),
(4, 'XC0oqxmbUZ5ceB9YFU8iRw', '2015-12-14 15:34:00', 'Jakarta Commons-HttpClient/3.1'),
(5, 'VDBpNIs-VUlZ9RL60nDSbg', '2015-12-14 15:35:00', 'Jakarta Commons-HttpClient/3.1'),
(6, 'wdSNN4JEwc8zSe58Weqs6w', '2015-12-14 15:36:00', 'Jakarta Commons-HttpClient/3.1'),
(7, '3mE3gmvja1xBndU6lrPqbg', '2015-12-14 15:37:00', 'Jakarta Commons-HttpClient/3.1'),
(8, '-ErtNKbT_GaslTMnio_SdA', '2015-12-14 15:38:00', 'Jakarta Commons-HttpClient/3.1'),
(9, 'EfhcQstWk_to3dI-sF_qBA', '2015-12-14 15:39:00', 'Jakarta Commons-HttpClient/3.1'),
(10, 'jLCUz17r05uB0DAW2GjID6f9_qbQdCR6', '2015-12-14 15:40:00', 'Jakarta Commons-HttpClient/3.1'),
(11, 'H766El0DXMQtqGwqj92S36f9_qbQdCR6', '2015-12-14 15:40:30', 'Jakarta Commons-HttpClient/3.1'),
(12, '9sYuns4mPwAcGT_qAyDEUqf9_qbQdCR6', '2015-12-14 15:41:00', 'Jakarta Commons-HttpClient/3.1'),
(13, 'uvERUAXY9r4u2leRrHlxn6f9_qbQdCR6', '2015-12-14 15:42:00', 'Jakarta Commons-HttpClient/3.1'),
(14, 'AGiOPQGW0twBZTPBHPZLuqf9_qbQdCR6', '2015-12-14 15:43:00', 'Jakarta Commons-HttpClient/3.1'),
(15, 'kU8AQn8equStk7_RtSstIKf9_qbQdCR6', '2015-12-14 15:44:00', 'Jakarta Commons-HttpClient/3.1'),
(16, 'Qy9YJ3jVFsnRHP7Rk28b3af9_qbQdCR6', '2015-12-14 15:45:00', 'Jakarta Commons-HttpClient/3.1'),
(17, 'AvwtZWvxFaMmOADBfH8rT6f9_qbQdCR6', '2015-12-14 15:46:00', 'Jakarta Commons-HttpClient/3.1'),
(18, 'RdMpTaIz5C9Xj_mJC-U6r6f9_qbQdCR6', '2015-12-14 15:47:00', 'Jakarta Commons-HttpClient/3.1'),
(19, 'mF6I6dB0ZSNU9kGW6YA6laf9_qbQdCR6', '2015-12-14 15:48:00', 'Jakarta Commons-HttpClient/3.1'),
(20, 'yw5lW3CqPH3l0RddWw8v96f9_qbQdCR6', '2015-12-14 15:49:00', 'Jakarta Commons-HttpClient/3.1'),
(21, 'puitJp0SNRofoooHnINEcqf9_qbQdCR6', '2015-12-14 15:50:00', 'Jakarta Commons-HttpClient/3.1'),
(22, 'tOtDAMaU3OHhit-3krsRv6f9_qbQdCR6', '2015-12-14 15:50:30', 'Jakarta Commons-HttpClient/3.1'),
(23, 'sH3y8IsXdMBJMkQqcg0xCaf9_qbQdCR6', '2015-12-14 15:51:00', 'Jakarta Commons-HttpClient/3.1'),
(24, 'ctcijxXloC6t64IlK5Z1_af9_qbQdCR6', '2015-12-14 15:52:00', 'Jakarta Commons-HttpClient/3.1'),
(25, 'uS3REN91ZSvuyoeqaopa0Kf9_qbQdCR6', '2015-12-14 15:53:00', 'Jakarta Commons-HttpClient/3.1'),
(26, 'shxQZtJUNUfQAxNCctHrp6f9_qbQdCR6', '2015-12-14 15:54:00', 'Jakarta Commons-HttpClient/3.1'),
(27, 'VwdICN94fx9BrSVlfxUbDKf9_qbQdCR6', '2015-12-14 15:55:00', 'Jakarta Commons-HttpClient/3.1'),
(28, 'qXB2aRjStx7Gr1yJcINMKaf9_qbQdCR6', '2015-12-14 15:56:00', 'Jakarta Commons-HttpClient/3.1'),
(29, '-b-9XhBVwY3DkafWX1RiD6f9_qbQdCR6', '2015-12-14 15:57:00', 'Jakarta Commons-HttpClient/3.1'),
(30, 'iSng82biRO_6Q8WdiLGJl6f9_qbQdCR6', '2015-12-14 15:58:00', 'Jakarta Commons-HttpClient/3.1'),
(31, 'dyNFX0RRx3BsqLEbgNhzO6f9_qbQdCR6', '2015-12-14 15:59:00', 'Jakarta Commons-HttpClient/3.1'),
(32, 'e45F2d3kH8J9u1peEXiSsKf9_qbQdCR6', '2015-12-14 16:00:00', 'Jakarta Commons-HttpClient/3.1'),
(33, 'UseYx2m-4LwoPqqh5nsY4Kf9_qbQdCR6', '2015-12-14 16:00:30', 'Jakarta Commons-HttpClient/3.1'),
(34, 'IaUPw1V7HWACDZpY6m0V6qf9_qbQdCR6', '2015-12-14 16:01:00', 'Jakarta Commons-HttpClient/3.1'),
(35, 'XuNicQrsJN6b8l36_KXIjaf9_qbQdCR6', '2015-12-14 16:02:00', 'Jakarta Commons-HttpClient/3.1'),
(36, 'nSCnxiuK2Ivk6Kh059qgYKf9_qbQdCR6', '2015-12-14 16:03:00', 'Jakarta Commons-HttpClient/3.1'),
(37, 'UnxqsTtjYOG8aKXY5qgvzaf9_qbQdCR6', '2015-12-14 16:04:00', 'Jakarta Commons-HttpClient/3.1'),
(38, 'YFUtt7ApKJ11eQAucc-2VKf9_qbQdCR6', '2015-12-14 16:05:00', 'Jakarta Commons-HttpClient/3.1'),
(39, '5XWggt6SViDKuu2a5IPMq6f9_qbQdCR6', '2015-12-14 16:06:00', 'Jakarta Commons-HttpClient/3.1'),
(40, 'lw3wqTi1nwX09iNKzCP_rKf9_qbQdCR6', '2015-12-14 16:07:00', 'Jakarta Commons-HttpClient/3.1'),
(41, 'uYVoCbLuaDM1nO8iz0gr1Kf9_qbQdCR6', '2015-12-14 16:08:00', 'Jakarta Commons-HttpClient/3.1'),
(42, 'ysybXiQYHJePsR9y5vw3aqf9_qbQdCR6', '2015-12-14 16:09:00', 'Jakarta Commons-HttpClient/3.1'),
(43, 'pXap3RQ34ylIoAbpTmW_Sqf9_qbQdCR6', '2015-12-14 16:10:00', 'Jakarta Commons-HttpClient/3.1'),
(44, 'L_IW_pZyOZp-9sc6qRii5Kf9_qbQdCR6', '2015-12-16 08:56:00', 'Jakarta Commons-HttpClient/3.1'),
(45, 'hLX46fN_xF1EUS4qescHpqf9_qbQdCR6', '2015-12-16 08:57:00', 'Jakarta Commons-HttpClient/3.1'),
(46, 'FL4tnqcUNnqEBk6GGgssXaf9_qbQdCR6', '2015-12-16 08:58:00', 'Jakarta Commons-HttpClient/3.1'),
(47, 'tsLhgDCrsvNbHBhB61YAuKf9_qbQdCR6', '2015-12-16 08:59:00', 'Jakarta Commons-HttpClient/3.1'),
(48, 'N-pjFExsEzLtAwQHbdRG46f9_qbQdCR6', '2015-12-16 09:00:00', 'Jakarta Commons-HttpClient/3.1'),
(49, 'p9eehlj2jM4H_yhlgipWwqf9_qbQdCR6', '2015-12-16 09:00:30', 'Jakarta Commons-HttpClient/3.1'),
(50, 'XaS-LZcGyPhxiXAnfIiPM6f9_qbQdCR6', '2015-12-16 09:01:00', 'Jakarta Commons-HttpClient/3.1'),
(51, '8UeQFUDHFjbo0EJWBx5ULKf9_qbQdCR6', '2015-12-16 09:02:00', 'Jakarta Commons-HttpClient/3.1'),
(52, 'TNYl8aIxBe759auAXUeDbKf9_qbQdCR6', '2015-12-16 09:03:00', 'Jakarta Commons-HttpClient/3.1'),
(53, 'BrvdFtUd25qfhmHJURPJKqf9_qbQdCR6', '2015-12-16 09:04:00', 'Jakarta Commons-HttpClient/3.1'),
(54, 'u9M-AyejSAWwBwGTA0NbtKf9_qbQdCR6', '2015-12-16 09:05:00', 'Jakarta Commons-HttpClient/3.1'),
(55, 'P-V8WOFOBYuq2zEhSWlNN6f9_qbQdCR6', '2015-12-16 09:06:00', 'Jakarta Commons-HttpClient/3.1'),
(56, 'iUp5tZvWF81kQ0dzUW94hKf9_qbQdCR6', '2015-12-16 09:07:00', 'Jakarta Commons-HttpClient/3.1'),
(57, 'yHHT4rETzGuzQL45o9r0NKf9_qbQdCR6', '2015-12-16 09:08:00', 'Jakarta Commons-HttpClient/3.1'),
(58, '3eDuGPGkrD1C6RElIp25Raf9_qbQdCR6', '2015-12-16 09:09:00', 'Jakarta Commons-HttpClient/3.1'),
(59, 'sefDqs9750XF1OShMzVwDqf9_qbQdCR6', '2015-12-16 09:10:00', 'Jakarta Commons-HttpClient/3.1'),
(60, 'i4kiZf9b9CQNGhbVNPoF7qf9_qbQdCR6', '2015-12-16 09:10:30', 'Jakarta Commons-HttpClient/3.1'),
(61, 'rY2Yc8zYupFJPCCoQGSVK6f9_qbQdCR6', '2015-12-16 09:11:00', 'Jakarta Commons-HttpClient/3.1'),
(62, 'j0vFcEoc_tJGL8kCD-92Paf9_qbQdCR6', '2015-12-16 09:12:00', 'Jakarta Commons-HttpClient/3.1'),
(63, 'xxFgaeq6lasgc-7LHzFvs6f9_qbQdCR6', '2015-12-16 09:13:00', 'Jakarta Commons-HttpClient/3.1'),
(64, 'vfI2Siic1vJpiWrhCH6hOqf9_qbQdCR6', '2015-12-16 09:14:00', 'Jakarta Commons-HttpClient/3.1'),
(65, 'YASfEn5KROa2tS1pHG4CRqf9_qbQdCR6', '2015-12-16 09:15:00', 'Jakarta Commons-HttpClient/3.1'),
(66, 'r7q_rBKxb9uRdSVZPHCz3qf9_qbQdCR6', '2015-12-16 09:16:00', 'Jakarta Commons-HttpClient/3.1'),
(67, 'FU3RPmLpNI-GqNc3vCnqYqf9_qbQdCR6', '2015-12-16 09:17:00', 'Jakarta Commons-HttpClient/3.1'),
(68, 'DDVSyXCvPXiiEVC0auIzQaf9_qbQdCR6', '2015-12-16 09:18:00', 'Jakarta Commons-HttpClient/3.1'),
(69, 'Cg6OgUQTFcTPoBQtBvY5_Kf9_qbQdCR6', '2015-12-16 09:19:00', 'Jakarta Commons-HttpClient/3.1'),
(70, '1zBVIk-JLZCTv7YpcPSjlKf9_qbQdCR6', '2015-12-16 09:20:00', 'Jakarta Commons-HttpClient/3.1'),
(71, 'e8NSp6_9IAsJx2GhPpjdTaf9_qbQdCR6', '2015-12-16 09:20:30', 'Jakarta Commons-HttpClient/3.1'),
(72, 'sm_dSZyzB5daTsRbOF_bZaf9_qbQdCR6', '2015-12-16 09:21:00', 'Jakarta Commons-HttpClient/3.1'),
(73, 'r3PSbJEJskJtQmE8_T6Xnaf9_qbQdCR6', '2015-12-16 09:22:00', 'Jakarta Commons-HttpClient/3.1'),
(74, 'DJdNnq4YI_RW115qn15WUKf9_qbQdCR6', '2015-12-16 09:23:00', 'Jakarta Commons-HttpClient/3.1'),
(75, 'HEffEFnkr4ubNCdNETApE6f9_qbQdCR6', '2015-12-16 09:24:00', 'Jakarta Commons-HttpClient/3.1'),
(76, 'M_-RqiHZXmEuzkOZkDi0Maf9_qbQdCR6', '2015-12-16 09:25:00', 'Jakarta Commons-HttpClient/3.1'),
(77, 'g1Czzp8AsHhZkPOgSceCWqf9_qbQdCR6', '2015-12-16 09:53:00', 'Jakarta Commons-HttpClient/3.1'),
(78, 'oge-3oPz85yNQskFi_okR6f9_qbQdCR6', '2015-12-16 09:54:00', 'Jakarta Commons-HttpClient/3.1'),
(79, 'CsgiiDRbIj216rsXMyFalaf9_qbQdCR6', '2015-12-16 09:55:00', 'Jakarta Commons-HttpClient/3.1'),
(80, '3VgPuzgm-9XhTcd_fBJuPaf9_qbQdCR6', '2015-12-16 09:56:00', 'Jakarta Commons-HttpClient/3.1'),
(81, '-o_bnaWxE8MdDwPjqod31Kf9_qbQdCR6', '2015-12-16 09:57:00', 'Jakarta Commons-HttpClient/3.1'),
(82, 'uk4QRggjOGuaKUj_dIc95qf9_qbQdCR6', '2015-12-16 09:58:00', 'Jakarta Commons-HttpClient/3.1'),
(83, 'NsO_p2j8gae4ctCzj737Fqf9_qbQdCR6', '2015-12-16 09:59:00', 'Jakarta Commons-HttpClient/3.1'),
(84, '-SJCZD6azj26al6wZqnlhKf9_qbQdCR6', '2015-12-16 10:00:00', 'Jakarta Commons-HttpClient/3.1'),
(85, 'gVj5jT3G6vbP0jC_U9hBgKf9_qbQdCR6', '2015-12-16 10:00:30', 'Jakarta Commons-HttpClient/3.1'),
(86, 'LJ9dPDSt_cIx8-vZw1Qitqf9_qbQdCR6', '2015-12-16 10:01:00', 'Jakarta Commons-HttpClient/3.1'),
(87, 'nr3mQlKNkLbIhS44krj_j6f9_qbQdCR6', '2015-12-16 10:02:00', 'Jakarta Commons-HttpClient/3.1'),
(88, 'CVAQNEROSJJ-vf7sI1gnF6f9_qbQdCR6', '2015-12-16 10:03:00', 'Jakarta Commons-HttpClient/3.1'),
(89, 'aL7sSVcq7SBLu0v8ROBuWaf9_qbQdCR6', '2015-12-16 10:04:00', 'Jakarta Commons-HttpClient/3.1'),
(90, 'zCSiQwcnJXsbkTK7nzHmTqf9_qbQdCR6', '2015-12-16 10:05:00', 'Jakarta Commons-HttpClient/3.1'),
(91, 'IeZ0juXjFSPmEK2DmyLxtaf9_qbQdCR6', '2015-12-16 10:06:00', 'Jakarta Commons-HttpClient/3.1'),
(92, 'tgp-8VzwTdAicfdyOFgQdKf9_qbQdCR6', '2015-12-16 10:07:00', 'Jakarta Commons-HttpClient/3.1'),
(93, 'q8gCo0f2dDlQhTnemBIh1Kf9_qbQdCR6', '2015-12-16 10:08:00', 'Jakarta Commons-HttpClient/3.1'),
(94, '2jgEZYIjjPVXWRfj-fpBi6f9_qbQdCR6', '2015-12-16 10:09:00', 'Jakarta Commons-HttpClient/3.1'),
(95, 'yTOorIcPfrDaCwW98meiNqf9_qbQdCR6', '2015-12-16 10:10:00', 'Jakarta Commons-HttpClient/3.1'),
(96, 'OCbWahWIMqaFAcNVitASyaf9_qbQdCR6', '2015-12-16 10:10:30', 'Jakarta Commons-HttpClient/3.1'),
(97, 'qSgLKlMqmaK6WqQVk-D-26f9_qbQdCR6', '2015-12-16 10:11:00', 'Jakarta Commons-HttpClient/3.1'),
(98, 'ybIRQtCIAbH9Y1TGgNUfP6f9_qbQdCR6', '2015-12-16 10:12:00', 'Jakarta Commons-HttpClient/3.1'),
(99, 'KW5MDkuxqdNsVvSHvS3e7Kf9_qbQdCR6', '2015-12-16 10:13:00', 'Jakarta Commons-HttpClient/3.1'),
(100, '_4NG6ceVJQPb-rsbAX6KLPKsi1QS4rOC', '2015-12-16 10:14:00', 'Jakarta Commons-HttpClient/3.1'),
(101, 'YvyqtS7gg-pqH-IUpiqIOpPrttJGNo0j', '2015-12-16 10:15:00', 'Jakarta Commons-HttpClient/3.1'),
(102, '0EDjI1QyxZAwA74Nb_NW1_Ksi1QS4rOC', '2015-12-16 10:16:00', 'Jakarta Commons-HttpClient/3.1'),
(103, '57SUwm0xOiJdUM621zXJBUZ1cPC8ay8B', '2015-12-16 10:17:00', 'Jakarta Commons-HttpClient/3.1'),
(104, 'r8GNias38jqXkoq6UHfQ9PKsi1QS4rOC', '2015-12-16 10:18:00', 'Jakarta Commons-HttpClient/3.1'),
(105, 'X5nSqBXdhHjkZtcsQ843m2ITrCDu9S_s', '2015-12-16 10:19:00', 'Jakarta Commons-HttpClient/3.1'),
(106, '0h9QrKZLJ_a-cjJY4H6OLpPrttJGNo0j', '2015-12-16 10:20:00', 'Jakarta Commons-HttpClient/3.1'),
(107, '4t6hOosRJ7Gnzzt4ofS4GnyCnT1uhqVo', '2015-12-16 10:20:30', 'Jakarta Commons-HttpClient/3.1'),
(108, 's_VrU4yq7Fy2CCZ9pgnmS8pNy1j6H-wt', '2015-12-16 10:21:00', 'Jakarta Commons-HttpClient/3.1'),
(109, 'Bvi270HDZonKSkepH8w0IZPrttJGNo0j', '2015-12-16 10:22:00', 'Jakarta Commons-HttpClient/3.1'),
(110, 'qzYzjODq-K-r3TnTqJhwJspNy1j6H-wt', '2015-12-16 10:23:00', 'Jakarta Commons-HttpClient/3.1'),
(111, 'YQbmkvto7C2uOKMn4He4kcpNy1j6H-wt', '2015-12-16 10:24:00', 'Jakarta Commons-HttpClient/3.1'),
(112, 'iNGRNrFs9AzgOD-49swruo5EwYYPRux_', '2015-12-16 10:25:00', 'Jakarta Commons-HttpClient/3.1'),
(113, '41PDW4wx7ov2aPdnC4Hr7_oEPBistF25', '2015-12-16 10:26:00', 'Jakarta Commons-HttpClient/3.1'),
(114, 'BUfpIe7Pj_1xVljZA0LAgjNLfFidC4pZ', '2015-12-16 10:27:00', 'Jakarta Commons-HttpClient/3.1'),
(115, '2MDtcCa0TawVwbRjr4_y4mITrCDu9S_s', '2015-12-16 10:28:00', 'Jakarta Commons-HttpClient/3.1'),
(116, 'Dd4XOhHjqqpDnEaY5siErPKsi1QS4rOC', '2015-12-16 10:29:00', 'Jakarta Commons-HttpClient/3.1'),
(117, 'u5RSgutjQ5si4Awfk5i9UfKsi1QS4rOC', '2015-12-16 10:30:00', 'Jakarta Commons-HttpClient/3.1'),
(118, '00vZ1zswly3BiH0NO0y9H_Ksi1QS4rOC', '2015-12-16 10:30:30', 'Jakarta Commons-HttpClient/3.1'),
(119, '8v9Mh4LHIDRx5rTDjNPPvpPrttJGNo0j', '2015-12-16 10:31:00', 'Jakarta Commons-HttpClient/3.1'),
(120, 'e3U7P9B2Avqr4jwoGWeFOvKsi1QS4rOC', '2015-12-16 10:32:00', 'Jakarta Commons-HttpClient/3.1'),
(121, 'O1UAcRjMhljo7j4Wyc83SkZ1cPC8ay8B', '2015-12-16 10:33:00', 'Jakarta Commons-HttpClient/3.1'),
(122, 'KMWN1VglfxrkKcS5COnKfI5EwYYPRux_', '2015-12-16 10:34:00', 'Jakarta Commons-HttpClient/3.1'),
(123, 'FhhkjfXHAssB5xyu5yCRKfKsi1QS4rOC', '2015-12-16 10:35:00', 'Jakarta Commons-HttpClient/3.1'),
(124, 'LWtj0fEqvgIHHclwJdR6fkZ1cPC8ay8B', '2015-12-16 10:36:00', 'Jakarta Commons-HttpClient/3.1'),
(125, 'V6hKYLWIqbVuywnwIsrhSpPrttJGNo0j', '2015-12-16 10:37:00', 'Jakarta Commons-HttpClient/3.1'),
(126, 'tjnhdcBOE4Axdm2uYzfeOs8zGXH670NX', '2015-12-16 10:38:00', 'Jakarta Commons-HttpClient/3.1'),
(127, 'kRj9HXPcIGCZ5KoRqV9W6UZ1cPC8ay8B', '2015-12-16 10:39:00', 'Jakarta Commons-HttpClient/3.1'),
(128, 'RZw3D7MENA02QVzCKths3nyCnT1uhqVo', '2015-12-16 10:40:00', 'Jakarta Commons-HttpClient/3.1'),
(129, 'eJaxG_EOzaPrvqCAsJi90pPrttJGNo0j', '2015-12-16 10:40:30', 'Jakarta Commons-HttpClient/3.1'),
(130, 'j0e0j_p3W93D8o6HhsSdHDNLfFidC4pZ', '2015-12-16 10:41:00', 'Jakarta Commons-HttpClient/3.1'),
(131, 'sxbgSHKXzkjeUMEzfmJj9mITrCDu9S_s', '2015-12-16 10:42:00', 'Jakarta Commons-HttpClient/3.1'),
(132, 'mdREzmw7LO2lvGPhOTZ-GmITrCDu9S_s', '2015-12-16 10:43:00', 'Jakarta Commons-HttpClient/3.1'),
(133, 'zO2hB4oHkJPFEShNmta5ufoEPBistF25', '2015-12-16 10:44:00', 'Jakarta Commons-HttpClient/3.1'),
(134, 'xatouqKv05fgw094udwM6s8zGXH670NX', '2015-12-16 10:45:00', 'Jakarta Commons-HttpClient/3.1'),
(135, 'twoW-N4MBR9zMHB0r88G0kZ1cPC8ay8B', '2015-12-16 10:46:00', 'Jakarta Commons-HttpClient/3.1'),
(136, 'HccVdI4lsTgBYvw_ttua2kZ1cPC8ay8B', '2015-12-16 10:47:00', 'Jakarta Commons-HttpClient/3.1'),
(137, 'rsGK3h-hiezzDGvozCs9snyCnT1uhqVo', '2015-12-16 10:48:00', 'Jakarta Commons-HttpClient/3.1'),
(138, '_6d10MQQXyuZ-rilsJkNCWITrCDu9S_s', '2015-12-16 10:49:00', 'Jakarta Commons-HttpClient/3.1'),
(139, 'bFFVfX0VYA12Xl9WFwYDVPKsi1QS4rOC', '2015-12-16 10:50:00', 'Jakarta Commons-HttpClient/3.1'),
(140, 'knHk0tUg-cQOJtovR0pjyo5EwYYPRux_', '2015-12-16 10:50:30', 'Jakarta Commons-HttpClient/3.1'),
(141, 'PJvQ5djwxSjG_Ep1hx6zckZ1cPC8ay8B', '2015-12-16 10:51:00', 'Jakarta Commons-HttpClient/3.1'),
(142, 'J7j8wB_HXJGfBIHpBCPgcvoEPBistF25', '2015-12-16 10:52:00', 'Jakarta Commons-HttpClient/3.1'),
(143, 'x5eMUFJ3UJY1Q79AZ83FOfKsi1QS4rOC', '2015-12-16 10:53:00', 'Jakarta Commons-HttpClient/3.1'),
(144, 'XTyp74Lmn8PoIU8LkGdgQfKsi1QS4rOC', '2015-12-16 10:54:00', 'Jakarta Commons-HttpClient/3.1'),
(145, 'dpiMgx4IVANbcTUrCGNejDNLfFidC4pZ', '2015-12-16 10:55:00', 'Jakarta Commons-HttpClient/3.1'),
(146, '5cIMM9RViuTXa-jODNbevvoEPBistF25', '2015-12-16 10:56:00', 'Jakarta Commons-HttpClient/3.1'),
(147, 'QE626Cey4XRnfZDpvSqjk2ITrCDu9S_s', '2015-12-16 10:57:00', 'Jakarta Commons-HttpClient/3.1'),
(148, '92M1iG1pMzJcqTyzYbz5rUZ1cPC8ay8B', '2015-12-16 10:58:00', 'Jakarta Commons-HttpClient/3.1'),
(149, 'r8YHSughNX67g2szlw5mgHyCnT1uhqVo', '2015-12-16 10:59:00', 'Jakarta Commons-HttpClient/3.1'),
(150, 'cJt1e4tjcGPO6MnFTcTm5PoEPBistF25', '2015-12-16 11:00:00', 'Jakarta Commons-HttpClient/3.1'),
(151, 'l_5pGJwgjbutzUV2sDoU4mITrCDu9S_s', '2015-12-16 11:00:30', 'Jakarta Commons-HttpClient/3.1'),
(152, '6IDXGxLRYE1_AwfMcJQYr45EwYYPRux_', '2015-12-16 11:01:00', 'Jakarta Commons-HttpClient/3.1'),
(153, '3MdQqiP6dt-KNc97byrgt_Ksi1QS4rOC', '2015-12-16 11:02:00', 'Jakarta Commons-HttpClient/3.1'),
(154, 'krUrEDdahnze0txPur6DSHyCnT1uhqVo', '2015-12-16 11:03:00', 'Jakarta Commons-HttpClient/3.1'),
(155, 'b6hc79yHL6ZOCtUc--WrsJPrttJGNo0j', '2015-12-16 11:04:00', 'Jakarta Commons-HttpClient/3.1'),
(156, 'yzbcUvoHFNHdE7Go7Q5xPI5EwYYPRux_', '2015-12-16 11:05:00', 'Jakarta Commons-HttpClient/3.1'),
(157, 'NGxzlnl1_M3xbdsIniMTUjNLfFidC4pZ', '2015-12-16 11:06:00', 'Jakarta Commons-HttpClient/3.1'),
(158, 'Zi9tvWSXPDPf0d8-FxVUfcpNy1j6H-wt', '2015-12-16 11:07:00', 'Jakarta Commons-HttpClient/3.1'),
(159, 'KnQUbEDyILulhxfsSMsMOWITrCDu9S_s', '2015-12-16 11:08:00', 'Jakarta Commons-HttpClient/3.1'),
(160, 'MApC7sqEswb-xNH_surGpcpNy1j6H-wt', '2015-12-16 11:09:00', 'Jakarta Commons-HttpClient/3.1'),
(161, '68os2x06OyldnhItWeBZZvKsi1QS4rOC', '2015-12-16 11:10:00', 'Jakarta Commons-HttpClient/3.1'),
(162, 'ULK3TxW9dXXdVng-ZzzSqkZ1cPC8ay8B', '2015-12-16 11:10:30', 'Jakarta Commons-HttpClient/3.1'),
(163, 'Jv7zl6lyu-EN_GpiEkfrAHyCnT1uhqVo', '2015-12-16 11:11:00', 'Jakarta Commons-HttpClient/3.1'),
(164, 'pPJG5zTxNUHtGbtcMoBXdPoEPBistF25', '2015-12-16 11:12:00', 'Jakarta Commons-HttpClient/3.1'),
(165, 'WHB187DSekbBeVNrSyQZapPrttJGNo0j', '2015-12-16 11:13:00', 'Jakarta Commons-HttpClient/3.1'),
(166, 'elMR_wE2aLUjV3hB3JegLDNLfFidC4pZ', '2015-12-16 11:14:00', 'Jakarta Commons-HttpClient/3.1'),
(167, 'VjYpSzj23D-R1aa6_rGTdEZ1cPC8ay8B', '2015-12-16 11:15:00', 'Jakarta Commons-HttpClient/3.1'),
(168, '46NOec--EAzGdgq_relN2TNLfFidC4pZ', '2015-12-16 11:16:00', 'Jakarta Commons-HttpClient/3.1'),
(169, 'T7vH1ILPDyxinUiZ1bkyn_oEPBistF25', '2015-12-16 11:17:00', 'Jakarta Commons-HttpClient/3.1'),
(170, 'hRf2tkoVR69AFtlvHQ9vm_oEPBistF25', '2015-12-16 11:18:00', 'Jakarta Commons-HttpClient/3.1'),
(171, 'WxV1Iz2RHohlrhUix2u2WM8zGXH670NX', '2015-12-16 11:19:00', 'Jakarta Commons-HttpClient/3.1'),
(172, '0jXlxRZx2O4dg2PA6XmPMDNLfFidC4pZ', '2015-12-16 11:20:00', 'Jakarta Commons-HttpClient/3.1'),
(173, 'x5cRSZ9WXtlQT-W2oVWmoXyCnT1uhqVo', '2015-12-16 11:20:30', 'Jakarta Commons-HttpClient/3.1'),
(174, '6kUwQHERqLwNDG0minWXTkZ1cPC8ay8B', '2015-12-16 11:21:00', 'Jakarta Commons-HttpClient/3.1'),
(175, 'D1j4304cZWr5kkKEki3CXmITrCDu9S_s', '2015-12-16 11:22:00', 'Jakarta Commons-HttpClient/3.1'),
(176, 'dTaW5q21B-XBq5fottpPz5PrttJGNo0j', '2015-12-16 11:23:00', 'Jakarta Commons-HttpClient/3.1'),
(177, 'nK7R-vbueF5_hZ5cAWRkhcpNy1j6H-wt', '2015-12-16 11:24:00', 'Jakarta Commons-HttpClient/3.1'),
(178, 'lXNC8ADCn-uy63-CgKRA8_oEPBistF25', '2015-12-16 11:25:00', 'Jakarta Commons-HttpClient/3.1'),
(179, '_ajZULKl64PULNycxdimWUZ1cPC8ay8B', '2015-12-16 11:26:00', 'Jakarta Commons-HttpClient/3.1'),
(180, 'ntmAvh_8ipBHF-hXKccUMc8zGXH670NX', '2015-12-16 11:27:00', 'Jakarta Commons-HttpClient/3.1'),
(181, 'kx54FgplQjGNTdNr8tlc1spNy1j6H-wt', '2015-12-16 11:28:00', 'Jakarta Commons-HttpClient/3.1'),
(182, 'cPoZQ_6DFHt5HAKEPK9SVUZ1cPC8ay8B', '2015-12-16 11:29:00', 'Jakarta Commons-HttpClient/3.1'),
(183, 'kyDPYzxdhp6rFvGYCwNyg0Z1cPC8ay8B', '2015-12-16 11:30:00', 'Jakarta Commons-HttpClient/3.1'),
(184, 'jfVKeNR0Yi7L4M-snc77g5PrttJGNo0j', '2015-12-16 11:30:30', 'Jakarta Commons-HttpClient/3.1'),
(185, 'mfckBH_d87aEGedFUv_By45EwYYPRux_', '2015-12-16 11:31:00', 'Jakarta Commons-HttpClient/3.1'),
(186, 'IXwYjDQodqbUb6U1u0dgZ_oEPBistF25', '2015-12-16 11:32:00', 'Jakarta Commons-HttpClient/3.1'),
(187, 'TOqhl_aIWXlelSSqgKeJ-cpNy1j6H-wt', '2015-12-16 11:33:00', 'Jakarta Commons-HttpClient/3.1'),
(188, '-TxoO0oOpkGrfvBc-n_KBfKsi1QS4rOC', '2015-12-16 11:34:00', 'Jakarta Commons-HttpClient/3.1'),
(189, 'sYfJ0ZAh0NKmL9SoWMxOAspNy1j6H-wt', '2015-12-16 11:35:00', 'Jakarta Commons-HttpClient/3.1'),
(190, 'XKakin-5Vk7vAbaa-vGsn88zGXH670NX', '2015-12-16 11:36:00', 'Jakarta Commons-HttpClient/3.1'),
(191, 'nUuU_amQls5RDLsWEpsFOJPrttJGNo0j', '2015-12-16 11:37:00', 'Jakarta Commons-HttpClient/3.1'),
(192, 'cm-fGvumFVmGSEH2HXBoJo5EwYYPRux_', '2015-12-16 11:38:00', 'Jakarta Commons-HttpClient/3.1'),
(193, '6jfn0laGgupBsnU3242Kj5PrttJGNo0j', '2015-12-16 11:39:00', 'Jakarta Commons-HttpClient/3.1'),
(194, '4AKJNZ1JBe4C7J1rgM3PlvoEPBistF25', '2015-12-16 11:40:00', 'Jakarta Commons-HttpClient/3.1'),
(195, '4YceFzrPQo0oEbm-zcE9TDNLfFidC4pZ', '2015-12-16 11:40:30', 'Jakarta Commons-HttpClient/3.1'),
(196, 'aFt-pghqehRyAe0O4XXWsY5EwYYPRux_', '2015-12-16 11:41:00', 'Jakarta Commons-HttpClient/3.1'),
(197, 'C3hUr3B20hGpRpJLeDiF6_Ksi1QS4rOC', '2015-12-16 11:42:00', 'Jakarta Commons-HttpClient/3.1'),
(198, 'ld8DXpH0CqYmhqVNSvhoxDNLfFidC4pZ', '2015-12-17 09:47:00', 'Jakarta Commons-HttpClient/3.1'),
(199, 'Ly3UnNR2FO-fArZJ5a0dno5EwYYPRux_', '2015-12-17 09:48:00', 'Jakarta Commons-HttpClient/3.1'),
(200, 'gL0d6okRi0NKbSFKRuvNwJPrttJGNo0j', '2015-12-17 09:49:00', 'Jakarta Commons-HttpClient/3.1'),
(201, 'Gpu4mUBoqJrnimzYqGOArTNLfFidC4pZ', '2015-12-17 09:50:00', 'Jakarta Commons-HttpClient/3.1'),
(202, 'dn28O6OmYgcVO95l9eJgT5PrttJGNo0j', '2015-12-17 09:50:30', 'Jakarta Commons-HttpClient/3.1'),
(203, 'L5IkWtMiywHpFNE792o4gDNLfFidC4pZ', '2015-12-17 09:51:00', 'Jakarta Commons-HttpClient/3.1'),
(204, '8GHAArs2Pvgkj9cWkLtyyI5EwYYPRux_', '2015-12-17 09:52:00', 'Jakarta Commons-HttpClient/3.1'),
(205, 'f1AUxg3CW0WPDe2jtdXRJTNLfFidC4pZ', '2015-12-17 09:53:00', 'Jakarta Commons-HttpClient/3.1'),
(206, '1VFieVUci2soLu2ysYDyfWITrCDu9S_s', '2015-12-17 09:54:00', 'Jakarta Commons-HttpClient/3.1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_crit_battle`
--

CREATE TABLE `pi_user_crit_battle` (
  `lastModified` datetime DEFAULT NULL,
  `winner` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `criterion_second_id` bigint(20) NOT NULL,
  `criterion_first_id` bigint(20) NOT NULL,
  `criterion_criterion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_crit_eval`
--

CREATE TABLE `pi_user_crit_eval` (
  `evaluation` double NOT NULL,
  `lastModified` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `criterion_idea_id` bigint(20) NOT NULL,
  `criterion_criterion_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_deactivation_alert`
--

CREATE TABLE `pi_user_deactivation_alert` (
  `generatedAt` date DEFAULT NULL,
  `hideAlert` bit(1) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_device`
--

CREATE TABLE `pi_user_device` (
  `id` bigint(20) NOT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `deviceType` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `tokenExpiration` datetime DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_inst`
--

CREATE TABLE `pi_user_inst` (
  `createdAt` datetime DEFAULT NULL,
  `createdByIp` varchar(255) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `campaign_id` bigint(20) NOT NULL,
  `company_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_login_log`
--

CREATE TABLE `pi_user_login_log` (
  `id` bigint(20) NOT NULL,
  `browserCookieId` varchar(255) NOT NULL,
  `browserId` bigint(20) NOT NULL,
  `ipAddress` varchar(255) NOT NULL,
  `loggedAt` datetime NOT NULL,
  `userCellPhone` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userFacebookId` varchar(255) DEFAULT NULL,
  `userId` bigint(20) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `userZipCode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pi_user_login_log`
--

INSERT INTO `pi_user_login_log` (`id`, `browserCookieId`, `browserId`, `ipAddress`, `loggedAt`, `userCellPhone`, `userEmail`, `userFacebookId`, `userId`, `userName`, `userZipCode`) VALUES
(1, 'HUowjqGL4RGaBXLJl9omLA', 2, '127.0.0.1', '2015-12-14 15:36:37', '(35) 9911-91991', 'teste@gmail.com', NULL, 1, 'Teste Progolden', '37200-000'),
(2, 'HUowjqGL4RGaBXLJl9omLA', 2, '127.0.0.1', '2015-12-16 08:59:42', '(35) 9911-91991', 'teste@gmail.com', NULL, 1, 'Teste Progolden', '37200-000'),
(3, 'HUowjqGL4RGaBXLJl9omLA', 2, '127.0.0.1', '2015-12-16 09:59:02', '(35) 9911-91991', 'teste@gmail.com', NULL, 1, 'Teste Progolden', '37200-000'),
(4, 'PPacLlxOb9VlLpeIqMPwQA', 2, '127.0.0.1', '2015-12-17 09:47:22', '(35) 9911-91991', 'teste@gmail.com', NULL, 1, 'Teste Progolden', '37200-000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_role`
--

CREATE TABLE `pi_user_role` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `roleAccessLevel` int(11) NOT NULL,
  `company_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_user_score`
--

CREATE TABLE `pi_user_score` (
  `lastUpdated` datetime DEFAULT NULL,
  `postedComments` int(11) NOT NULL,
  `postedDislikes` int(11) NOT NULL,
  `postedIdeas` int(11) NOT NULL,
  `postedLikes` int(11) NOT NULL,
  `receivedComments` int(11) NOT NULL,
  `receivedDislikes` int(11) NOT NULL,
  `receivedLikes` int(11) NOT NULL,
  `receivedUserLikes` int(11) NOT NULL,
  `totalScore` double NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `game_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pi_vote`
--

CREATE TABLE `pi_vote` (
  `id` bigint(20) NOT NULL,
  `deleted` bit(1) NOT NULL,
  `posted` datetime DEFAULT NULL,
  `postedByIp` varchar(255) NOT NULL,
  `value` double DEFAULT NULL,
  `idea_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pi_activity`
--
ALTER TABLE `pi_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_actv_createdAt` (`createdAt`),
  ADD KEY `idx_actv_deleted` (`deleted`),
  ADD KEY `FK_h19k19hat3yuv9o436eu6coos` (`project_id`),
  ADD KEY `FK_43arrl0goroj70mijbch2p63h` (`responsible_id`);

--
-- Indexes for table `pi_async_event`
--
ALTER TABLE `pi_async_event`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_campaign`
--
ALTER TABLE `pi_campaign`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cpg_deleted` (`deleted`),
  ADD KEY `idx_cpg_closed` (`closed`),
  ADD KEY `FK_1i4tn9t2xa8e8dm2nt70f0ktg` (`company_id`),
  ADD KEY `FK_mrlyym0sdf9gqv1vx8b77vvdt` (`rules_id`);

--
-- Indexes for table `pi_campaign_inst`
--
ALTER TABLE `pi_campaign_inst`
  ADD PRIMARY KEY (`company_id`,`campaign_id`),
  ADD KEY `FK_ddn01v81lql3ytt80m5pupt9y` (`campaign_id`),
  ADD KEY `FK_2scjblrb6dnlp1la7ionrcypm` (`group_id`);

--
-- Indexes for table `pi_campaign_inst_deactivation_alert`
--
ALTER TABLE `pi_campaign_inst_deactivation_alert`
  ADD PRIMARY KEY (`company_id`,`campaign_id`),
  ADD KEY `FK_acthxnipglqcwl9ksjxhg4r23` (`campaign_id`);

--
-- Indexes for table `pi_campaign_inst_group_score`
--
ALTER TABLE `pi_campaign_inst_group_score`
  ADD PRIMARY KEY (`group_id`,`campaign_id`),
  ADD KEY `idx_cigs_lastUpdated` (`lastUpdated`),
  ADD KEY `idx_cigs_totalScore` (`totalScore`),
  ADD KEY `FK_hrsimnsw0ritsgi73sr7gra9b` (`campaign_id`);

--
-- Indexes for table `pi_campaign_inst_score`
--
ALTER TABLE `pi_campaign_inst_score`
  ADD PRIMARY KEY (`company_id`,`campaign_id`),
  ADD KEY `idx_cis_lastUpdated` (`lastUpdated`),
  ADD KEY `idx_cis_totalScore` (`totalScore`),
  ADD KEY `FK_47jhqdy3jny9y3nwtd28e562n` (`campaign_id`);

--
-- Indexes for table `pi_campaign_pi_evaluation_criterion`
--
ALTER TABLE `pi_campaign_pi_evaluation_criterion`
  ADD KEY `FK_mergle8onsfd8rheuy5c9bo8b` (`criterions_id`),
  ADD KEY `FK_mya3ragcwro66tivncgcumh9q` (`pi_campaign_id`);

--
-- Indexes for table `pi_campaign_user_badge`
--
ALTER TABLE `pi_campaign_user_badge`
  ADD PRIMARY KEY (`user_id`,`campaign_id`),
  ADD KEY `idx_cub_evaluations` (`evaluations`),
  ADD KEY `FK_fxonevfuq34dgmh78myij2o2m` (`campaign_id`);

--
-- Indexes for table `pi_campaign_user_score`
--
ALTER TABLE `pi_campaign_user_score`
  ADD PRIMARY KEY (`user_id`,`campaign_id`),
  ADD KEY `idx_cus_lastUpdated` (`lastUpdated`),
  ADD KEY `idx_cus_totalScore` (`totalScore`),
  ADD KEY `FK_fpb48ekxtkdx5mmjmn4p5jpij` (`campaign_id`);

--
-- Indexes for table `pi_city`
--
ALTER TABLE `pi_city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_baivlwuiusvw05nkvmepjfadv` (`state_id`);

--
-- Indexes for table `pi_comment`
--
ALTER TABLE `pi_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_cmt_deleted` (`deleted`),
  ADD KEY `idx_cmt_posted` (`posted`),
  ADD KEY `idx_cmt_moderationStatus` (`moderationStatus`),
  ADD KEY `idx_cmt_search_mdrt` (`deleted`,`moderationStatus`),
  ADD KEY `idx_cmt_search_idea` (`idea_id`,`deleted`,`moderationStatus`),
  ADD KEY `FK_h1b8wb0us9fw22bgycd7hxh3y` (`user_id`);

--
-- Indexes for table `pi_company`
--
ALTER TABLE `pi_company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_196r2kmyotmn12ntugn4rtnm3` (`facebookId`),
  ADD UNIQUE KEY `UK_cpo3pxfuxaoc3c3e5ebi8qw53` (`shortName`);

--
-- Indexes for table `pi_company_domain`
--
ALTER TABLE `pi_company_domain`
  ADD PRIMARY KEY (`host`),
  ADD KEY `FK_awod3hfyvwd2btymc58rkax65` (`company_id`);

--
-- Indexes for table `pi_company_group`
--
ALTER TABLE `pi_company_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_6elfdkxs0tjvnyt61gj6cohep` (`campaign_id`,`label`);

--
-- Indexes for table `pi_country`
--
ALTER TABLE `pi_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_dashboard`
--
ALTER TABLE `pi_dashboard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_pyay366ynr5c3a0q96chnxxy4` (`date`);

--
-- Indexes for table `pi_denounce`
--
ALTER TABLE `pi_denounce`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_7636nj9pk5o73v88t1h4ot1rt` (`idea_id`,`user_id`),
  ADD KEY `idx_den_status` (`status`),
  ADD KEY `idx_den_deleted` (`deleted`),
  ADD KEY `idx_den_posted` (`posted`),
  ADD KEY `FK_7jp23oqtjf7mageh2flh99eq3` (`user_id`);

--
-- Indexes for table `pi_dynamic_permission`
--
ALTER TABLE `pi_dynamic_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_s3dajljwmobkbjxdejcy9k3oh` (`userRole_id`);

--
-- Indexes for table `pi_evaluation_criterion`
--
ALTER TABLE `pi_evaluation_criterion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_evlc_tag` (`tag`),
  ADD KEY `idx_evlc_deleted` (`deleted`),
  ADD KEY `FK_icqt4g27xgjoye7jdui24vrd0` (`company_id`);

--
-- Indexes for table `pi_game`
--
ALTER TABLE `pi_game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gme_filtering` (`deleted`,`ideaBox`,`end`,`begin`),
  ADD KEY `idx_gme_deleted` (`deleted`),
  ADD KEY `idx_gme_ideaBox` (`ideaBox`),
  ADD KEY `idx_gme_begin` (`begin`),
  ADD KEY `idx_gme_end` (`end`),
  ADD KEY `idx_gme_numberOfComments` (`numberOfComments`),
  ADD KEY `idx_gme_numberOfIdeas` (`numberOfIdeas`),
  ADD KEY `idx_gme_numberOfLikes` (`numberOfLikes`),
  ADD KEY `FK_rtr80wyfhvku3vqgva4tpd9a9` (`campaign_id`),
  ADD KEY `FK_ryci793pkerm9uus9o9v7f7h3` (`company_id`);

--
-- Indexes for table `pi_game_awarding`
--
ALTER TABLE `pi_game_awarding`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mvdjkbccwi43yi5f68hdb88cr` (`ideaBox_id`);

--
-- Indexes for table `pi_game_priv_participant`
--
ALTER TABLE `pi_game_priv_participant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_57qv4mkwnf0os1tr0h9mi8gab` (`user_id`,`game_id`),
  ADD KEY `FK_8fbqj98d8n53r91ukew62tf95` (`game_id`);

--
-- Indexes for table `pi_game_rules`
--
ALTER TABLE `pi_game_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pi_idea`
--
ALTER TABLE `pi_idea`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_9eik3ahqhu809l1udc6m02mmv` (`facebookId`),
  ADD KEY `idx_idea_filtering` (`game_id`,`user_id`,`moderationStatus`,`deleted`),
  ADD KEY `idx_idea_deleted` (`deleted`),
  ADD KEY `idx_idea_evaluation` (`evaluation`),
  ADD KEY `idx_idea_evaluationAvg` (`evaluationAverage`),
  ADD KEY `idx_idea_moderationStatus` (`moderationStatus`),
  ADD KEY `idx_idea_lastUpdated` (`lastUpdated`),
  ADD KEY `idx_idea_posted` (`posted`),
  ADD KEY `idx_idea_numberOfComments` (`numberOfComments`),
  ADD KEY `idx_idea_numberOfDenounces` (`numberOfDenounces`),
  ADD KEY `idx_idea_numberOfLikes` (`numberOfLikes`),
  ADD KEY `FK_3w7ks35p3id1igug0cf7cdhx0` (`ideaCategory_id`),
  ADD KEY `FK_eu2t6ovs2wfueqve98oeb147b` (`user_id`);

--
-- Indexes for table `pi_idea_battle`
--
ALTER TABLE `pi_idea_battle`
  ADD PRIMARY KEY (`user_id`,`second_id`,`first_id`),
  ADD KEY `idx_ibtl_lastModified` (`lastModified`),
  ADD KEY `idx_ibtl_winner` (`winner`),
  ADD KEY `FK_6utmtfa2pcfy15ofx4ttq0vyc` (`second_id`),
  ADD KEY `FK_82535tirlh52d283xh6k6gci7` (`first_id`);

--
-- Indexes for table `pi_idea_category`
--
ALTER TABLE `pi_idea_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ict_filtering` (`game_id`,`deleted`),
  ADD KEY `idx_ict_deleted` (`deleted`),
  ADD KEY `idx_ict_title` (`title`);

--
-- Indexes for table `pi_idea_crit_battle`
--
ALTER TABLE `pi_idea_crit_battle`
  ADD PRIMARY KEY (`second_id`,`first_id`,`criterion_id`),
  ADD KEY `idx_icbtl_lastModified` (`winner`),
  ADD KEY `idx_icbtl_numberOfBattles` (`numberOfBattles`),
  ADD KEY `FK_7j9rfr7peoqmcf8ds9jrq5xii` (`first_id`),
  ADD KEY `FK_i7ybvuy13kjhsvw1a0jyer526` (`criterion_id`);

--
-- Indexes for table `pi_idea_crit_eval`
--
ALTER TABLE `pi_idea_crit_eval`
  ADD PRIMARY KEY (`idea_id`,`criterion_id`),
  ADD KEY `idx_icevl_lastModified` (`average`),
  ADD KEY `idx_icevl_numberOfEvaluations` (`numberOfEvaluations`),
  ADD KEY `FK_5dopewfmvo8cqakq7jroltt7q` (`criterion_id`);

--
-- Indexes for table `pi_idea_eval`
--
ALTER TABLE `pi_idea_eval`
  ADD PRIMARY KEY (`user_id`,`idea_id`),
  ADD KEY `idx_ievl_lastModified` (`lastModified`),
  ADD KEY `idx_ievl_committee` (`committee`),
  ADD KEY `idx_ievl_evaluation` (`evaluation`),
  ADD KEY `FK_1eqp9rqjdtvveybvhs6fahark` (`idea_id`);

--
-- Indexes for table `pi_idea_keyword`
--
ALTER TABLE `pi_idea_keyword`
  ADD PRIMARY KEY (`keyword`,`idea_id`),
  ADD KEY `idx_ikw_keyword` (`keyword`),
  ADD KEY `FK_4919b8e1bdu761ueoxbbw1ejt` (`idea_id`);

--
-- Indexes for table `pi_idea_limbus`
--
ALTER TABLE `pi_idea_limbus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_ry0wvai6bliik2t44sfssdwbl` (`game_id`),
  ADD KEY `FK_27yk21pdyapgkkuydi23g9n0e` (`ideaCategory_id`),
  ADD KEY `FK_n09tw03rrqufq5l3evmjgtqjy` (`user_id`);

--
-- Indexes for table `pi_idea_metad`
--
ALTER TABLE `pi_idea_metad`
  ADD PRIMARY KEY (`project_id`,`idea_id`),
  ADD KEY `idx_imtd_evaluation` (`evaluation`),
  ADD KEY `FK_tdb2xxovah9r4ajpppbyoe1v4` (`idea_id`);

--
-- Indexes for table `pi_marker`
--
ALTER TABLE `pi_marker`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_466vfhq4fnedo271d0yd4r0o6` (`label`,`game_id`),
  ADD KEY `FK_1k8a1kwrx54e43wee6hvtnx3h` (`game_id`);

--
-- Indexes for table `pi_marker_pi_idea`
--
ALTER TABLE `pi_marker_pi_idea`
  ADD KEY `FK_2es3tbumo0etf5n5l1i4i8ioh` (`ideas_id`),
  ADD KEY `FK_48adaycrhhhwx8uh3rqwstnc6` (`markerList_id`);

--
-- Indexes for table `pi_portal`
--
ALTER TABLE `pi_portal`
  ADD PRIMARY KEY (`domain_host`);

--
-- Indexes for table `pi_portal_news`
--
ALTER TABLE `pi_portal_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ptn_deleted` (`deleted`),
  ADD KEY `FK_o17a4q05ihnt16d4piq56lkpe` (`portal_domain_host`);

--
-- Indexes for table `pi_project`
--
ALTER TABLE `pi_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_prj_createdAt` (`createdAt`),
  ADD KEY `idx_prj_deleted` (`deleted`),
  ADD KEY `FK_son3l8y5ywsfcsxulo3k84e5m` (`company_id`),
  ADD KEY `FK_dpwjcetej3bsf2v58u408n2d5` (`responsible_id`);

--
-- Indexes for table `pi_state`
--
ALTER TABLE `pi_state`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_nw8d5r4eqwp7kwm6nmbfvvaxl` (`country_id`);

--
-- Indexes for table `pi_stored_email`
--
ALTER TABLE `pi_stored_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_7h2uqrcl9h17x7q8n2hli9dgr` (`creator_id`),
  ADD KEY `FK_j0sndla52d5optrdfrks4hda5` (`game_id`),
  ADD KEY `FK_fd0gfrnajs3josb100noydkh8` (`to_id`);

--
-- Indexes for table `pi_system_notification`
--
ALTER TABLE `pi_system_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_3nqrg9bgo4e65gfr8knpljokj` (`user_id`,`idea_id`,`type`),
  ADD KEY `idx_sntf_occurrence` (`occurrence`),
  ADD KEY `idx_sntf_visualized` (`visualized`),
  ADD KEY `FK_b4l74y5bpnl7ypmnk06851a8j` (`idea_id`);

--
-- Indexes for table `pi_tag`
--
ALTER TABLE `pi_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_p3hq6trbuji0nvjiidh6accfe` (`word`,`game_id`),
  ADD KEY `FK_16hdfu9fwixfcdhjjche8bnox` (`game_id`);

--
-- Indexes for table `pi_tag_count`
--
ALTER TABLE `pi_tag_count`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_tjqf2tr6n1fgs8wpcrw25pyit` (`idea_id`,`tag_id`),
  ADD KEY `FK_t4kq1poasb20ku49crrfhx9xx` (`tag_id`);

--
-- Indexes for table `pi_user`
--
ALTER TABLE `pi_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_5a1q5vg82qp2h7996q4lrx19t` (`cellPhoneNumber`),
  ADD UNIQUE KEY `UK_4yw3tdq16a1bc6pmjkghnsgx7` (`email`),
  ADD UNIQUE KEY `UK_3qcw28l92y2sf0y8r47jsx72j` (`facebookId`),
  ADD UNIQUE KEY `UK_2yvr3ackenfoj4n5eyrjtaxdv` (`linkedinId`),
  ADD UNIQUE KEY `UK_qmy7s7nqdngjo6p7wr4m13ckp` (`username`);

--
-- Indexes for table `pi_user_agreements`
--
ALTER TABLE `pi_user_agreements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ja6ksa1fceuq4q9a5stb156hb` (`game_id`,`user_id`),
  ADD KEY `FK_k2hgnu7un0gwe2yi2tpcic80b` (`user_id`);

--
-- Indexes for table `pi_user_award_score`
--
ALTER TABLE `pi_user_award_score`
  ADD PRIMARY KEY (`user_id`,`awarding_id`),
  ADD KEY `idx_uas_lastUpdated` (`lastUpdated`),
  ADD KEY `idx_uas_totalScore` (`totalScore`),
  ADD KEY `FK_4mtvihpunj9sc60qqdk9kgve3` (`awarding_id`);

--
-- Indexes for table `pi_user_browser`
--
ALTER TABLE `pi_user_browser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_j0gfhldb4bau9ebhswnhi1203` (`cookieId`),
  ADD KEY `idx_ubr_cookieId` (`cookieId`),
  ADD KEY `idx_ubr_createdAt` (`createdAt`);

--
-- Indexes for table `pi_user_crit_battle`
--
ALTER TABLE `pi_user_crit_battle`
  ADD PRIMARY KEY (`user_id`,`criterion_second_id`,`criterion_first_id`,`criterion_criterion_id`),
  ADD KEY `idx_ucbtl_lastModified` (`lastModified`),
  ADD KEY `idx_ucbtl_winner` (`winner`),
  ADD KEY `FK_ly4h463k5gjc9ep4kgrt73ech` (`criterion_second_id`,`criterion_first_id`,`criterion_criterion_id`);

--
-- Indexes for table `pi_user_crit_eval`
--
ALTER TABLE `pi_user_crit_eval`
  ADD PRIMARY KEY (`user_id`,`criterion_idea_id`,`criterion_criterion_id`),
  ADD KEY `idx_ucevl_lastModified` (`lastModified`),
  ADD KEY `idx_ucevl_evaluation` (`evaluation`),
  ADD KEY `FK_3vrali8gd98bgn5sqqmy3gf1t` (`criterion_idea_id`,`criterion_criterion_id`);

--
-- Indexes for table `pi_user_deactivation_alert`
--
ALTER TABLE `pi_user_deactivation_alert`
  ADD PRIMARY KEY (`user_id`,`campaign_id`),
  ADD KEY `FK_qg6tqlhldyfu01i1ep3r5fuye` (`campaign_id`);

--
-- Indexes for table `pi_user_device`
--
ALTER TABLE `pi_user_device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_8q32hf1tiyxy29mj50fkfqhoc` (`user_id`);

--
-- Indexes for table `pi_user_inst`
--
ALTER TABLE `pi_user_inst`
  ADD PRIMARY KEY (`user_id`,`campaign_id`),
  ADD KEY `FK_6canqdy0f0irmhupllrldb716` (`campaign_id`),
  ADD KEY `FK_s8s7tfihchr8ueeixb3flt2ge` (`company_id`);

--
-- Indexes for table `pi_user_login_log`
--
ALTER TABLE `pi_user_login_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ull_userId` (`userId`),
  ADD KEY `idx_ull_browserId` (`browserId`),
  ADD KEY `idx_ull_ipAddress` (`ipAddress`),
  ADD KEY `idx_ull_loggedAt` (`loggedAt`),
  ADD KEY `idx_ull_filter` (`userId`,`loggedAt`);

--
-- Indexes for table `pi_user_role`
--
ALTER TABLE `pi_user_role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_2h4kut9iwy98nrohrq2x8mwb0` (`user_id`,`company_id`),
  ADD KEY `FK_17crkf69r85homty4aqdwyh1m` (`company_id`);

--
-- Indexes for table `pi_user_score`
--
ALTER TABLE `pi_user_score`
  ADD PRIMARY KEY (`user_id`,`game_id`),
  ADD KEY `idx_usc_lastUpdated` (`lastUpdated`),
  ADD KEY `idx_usc_totalScore` (`totalScore`),
  ADD KEY `FK_8yfrbs7hcse11y2noejf90hyc` (`game_id`);

--
-- Indexes for table `pi_vote`
--
ALTER TABLE `pi_vote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_n76amvewvglsis6yxlo3mdlg` (`idea_id`,`user_id`),
  ADD KEY `idx_vote_deleted` (`deleted`),
  ADD KEY `idx_vote_posted` (`posted`),
  ADD KEY `idx_vote_value` (`value`),
  ADD KEY `FK_4jdd195fthvqxjug4p1fvkfrj` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pi_activity`
--
ALTER TABLE `pi_activity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_async_event`
--
ALTER TABLE `pi_async_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_campaign`
--
ALTER TABLE `pi_campaign`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pi_city`
--
ALTER TABLE `pi_city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_comment`
--
ALTER TABLE `pi_comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_company`
--
ALTER TABLE `pi_company`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pi_company_group`
--
ALTER TABLE `pi_company_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_country`
--
ALTER TABLE `pi_country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_dashboard`
--
ALTER TABLE `pi_dashboard`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_denounce`
--
ALTER TABLE `pi_denounce`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_dynamic_permission`
--
ALTER TABLE `pi_dynamic_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_evaluation_criterion`
--
ALTER TABLE `pi_evaluation_criterion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_game`
--
ALTER TABLE `pi_game`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pi_game_awarding`
--
ALTER TABLE `pi_game_awarding`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_game_priv_participant`
--
ALTER TABLE `pi_game_priv_participant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_game_rules`
--
ALTER TABLE `pi_game_rules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_idea`
--
ALTER TABLE `pi_idea`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_idea_category`
--
ALTER TABLE `pi_idea_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_idea_limbus`
--
ALTER TABLE `pi_idea_limbus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_marker`
--
ALTER TABLE `pi_marker`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_portal_news`
--
ALTER TABLE `pi_portal_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_project`
--
ALTER TABLE `pi_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_state`
--
ALTER TABLE `pi_state`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_stored_email`
--
ALTER TABLE `pi_stored_email`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_system_notification`
--
ALTER TABLE `pi_system_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_tag`
--
ALTER TABLE `pi_tag`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_tag_count`
--
ALTER TABLE `pi_tag_count`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_user`
--
ALTER TABLE `pi_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pi_user_agreements`
--
ALTER TABLE `pi_user_agreements`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_user_browser`
--
ALTER TABLE `pi_user_browser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;
--
-- AUTO_INCREMENT for table `pi_user_device`
--
ALTER TABLE `pi_user_device`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_user_login_log`
--
ALTER TABLE `pi_user_login_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pi_user_role`
--
ALTER TABLE `pi_user_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pi_vote`
--
ALTER TABLE `pi_vote`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `pi_activity`
--
ALTER TABLE `pi_activity`
  ADD CONSTRAINT `FK_43arrl0goroj70mijbch2p63h` FOREIGN KEY (`responsible_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_h19k19hat3yuv9o436eu6coos` FOREIGN KEY (`project_id`) REFERENCES `pi_project` (`id`);

--
-- Limitadores para a tabela `pi_campaign`
--
ALTER TABLE `pi_campaign`
  ADD CONSTRAINT `FK_1i4tn9t2xa8e8dm2nt70f0ktg` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`),
  ADD CONSTRAINT `FK_mrlyym0sdf9gqv1vx8b77vvdt` FOREIGN KEY (`rules_id`) REFERENCES `pi_game_rules` (`id`);

--
-- Limitadores para a tabela `pi_campaign_inst`
--
ALTER TABLE `pi_campaign_inst`
  ADD CONSTRAINT `FK_2scjblrb6dnlp1la7ionrcypm` FOREIGN KEY (`group_id`) REFERENCES `pi_company_group` (`id`),
  ADD CONSTRAINT `FK_a6wpfo5dlxlmbufkrt31j21hs` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`),
  ADD CONSTRAINT `FK_ddn01v81lql3ytt80m5pupt9y` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`);

--
-- Limitadores para a tabela `pi_campaign_inst_deactivation_alert`
--
ALTER TABLE `pi_campaign_inst_deactivation_alert`
  ADD CONSTRAINT `FK_acthxnipglqcwl9ksjxhg4r23` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`),
  ADD CONSTRAINT `FK_mlsq9sf50d9ht5ofkx8j70bc2` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_campaign_inst_group_score`
--
ALTER TABLE `pi_campaign_inst_group_score`
  ADD CONSTRAINT `FK_ehtolpbmvcyms1fuidrftokpl` FOREIGN KEY (`group_id`) REFERENCES `pi_company_group` (`id`),
  ADD CONSTRAINT `FK_hrsimnsw0ritsgi73sr7gra9b` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`);

--
-- Limitadores para a tabela `pi_campaign_inst_score`
--
ALTER TABLE `pi_campaign_inst_score`
  ADD CONSTRAINT `FK_47jhqdy3jny9y3nwtd28e562n` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`),
  ADD CONSTRAINT `FK_mk59lcy668wlut2kpdo64kd92` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_campaign_pi_evaluation_criterion`
--
ALTER TABLE `pi_campaign_pi_evaluation_criterion`
  ADD CONSTRAINT `FK_mergle8onsfd8rheuy5c9bo8b` FOREIGN KEY (`criterions_id`) REFERENCES `pi_evaluation_criterion` (`id`),
  ADD CONSTRAINT `FK_mya3ragcwro66tivncgcumh9q` FOREIGN KEY (`pi_campaign_id`) REFERENCES `pi_campaign` (`id`);

--
-- Limitadores para a tabela `pi_campaign_user_badge`
--
ALTER TABLE `pi_campaign_user_badge`
  ADD CONSTRAINT `FK_fxonevfuq34dgmh78myij2o2m` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`),
  ADD CONSTRAINT `FK_lk17bhfbk1vkhkdyerw9jqjsw` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_campaign_user_score`
--
ALTER TABLE `pi_campaign_user_score`
  ADD CONSTRAINT `FK_fpb48ekxtkdx5mmjmn4p5jpij` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`),
  ADD CONSTRAINT `FK_qil7jbfabvyhqqb0e9wkn8ayt` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_city`
--
ALTER TABLE `pi_city`
  ADD CONSTRAINT `FK_baivlwuiusvw05nkvmepjfadv` FOREIGN KEY (`state_id`) REFERENCES `pi_state` (`id`);

--
-- Limitadores para a tabela `pi_comment`
--
ALTER TABLE `pi_comment`
  ADD CONSTRAINT `FK_h1b8wb0us9fw22bgycd7hxh3y` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_jakgffpsq40ne6qbnfu3wy9x6` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`);

--
-- Limitadores para a tabela `pi_company_domain`
--
ALTER TABLE `pi_company_domain`
  ADD CONSTRAINT `FK_awod3hfyvwd2btymc58rkax65` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_company_group`
--
ALTER TABLE `pi_company_group`
  ADD CONSTRAINT `FK_akbtkbp99q7qcd3mo95gj5jp` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`);

--
-- Limitadores para a tabela `pi_denounce`
--
ALTER TABLE `pi_denounce`
  ADD CONSTRAINT `FK_7jp23oqtjf7mageh2flh99eq3` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_bc4u77gtra8yf3meh6kfqtq80` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`);

--
-- Limitadores para a tabela `pi_dynamic_permission`
--
ALTER TABLE `pi_dynamic_permission`
  ADD CONSTRAINT `FK_s3dajljwmobkbjxdejcy9k3oh` FOREIGN KEY (`userRole_id`) REFERENCES `pi_user_role` (`id`);

--
-- Limitadores para a tabela `pi_evaluation_criterion`
--
ALTER TABLE `pi_evaluation_criterion`
  ADD CONSTRAINT `FK_icqt4g27xgjoye7jdui24vrd0` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_game`
--
ALTER TABLE `pi_game`
  ADD CONSTRAINT `FK_rtr80wyfhvku3vqgva4tpd9a9` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`),
  ADD CONSTRAINT `FK_ryci793pkerm9uus9o9v7f7h3` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_game_awarding`
--
ALTER TABLE `pi_game_awarding`
  ADD CONSTRAINT `FK_mvdjkbccwi43yi5f68hdb88cr` FOREIGN KEY (`ideaBox_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_game_priv_participant`
--
ALTER TABLE `pi_game_priv_participant`
  ADD CONSTRAINT `FK_3xhpdbvtqdgmeo28cva557tuv` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_8fbqj98d8n53r91ukew62tf95` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_idea`
--
ALTER TABLE `pi_idea`
  ADD CONSTRAINT `FK_3w7ks35p3id1igug0cf7cdhx0` FOREIGN KEY (`ideaCategory_id`) REFERENCES `pi_idea_category` (`id`),
  ADD CONSTRAINT `FK_eu2t6ovs2wfueqve98oeb147b` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_m59p17vijmgy97hqsx22ev5ik` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_idea_battle`
--
ALTER TABLE `pi_idea_battle`
  ADD CONSTRAINT `FK_55lgpgs67fd6f7suqy484fuka` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_6utmtfa2pcfy15ofx4ttq0vyc` FOREIGN KEY (`second_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_82535tirlh52d283xh6k6gci7` FOREIGN KEY (`first_id`) REFERENCES `pi_idea` (`id`);

--
-- Limitadores para a tabela `pi_idea_category`
--
ALTER TABLE `pi_idea_category`
  ADD CONSTRAINT `FK_orl173ctdr3dcdmr1eift3j9y` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_idea_crit_battle`
--
ALTER TABLE `pi_idea_crit_battle`
  ADD CONSTRAINT `FK_7j9rfr7peoqmcf8ds9jrq5xii` FOREIGN KEY (`first_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_cbk2ehggs8xjofxspvafn0f4f` FOREIGN KEY (`second_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_i7ybvuy13kjhsvw1a0jyer526` FOREIGN KEY (`criterion_id`) REFERENCES `pi_evaluation_criterion` (`id`);

--
-- Limitadores para a tabela `pi_idea_crit_eval`
--
ALTER TABLE `pi_idea_crit_eval`
  ADD CONSTRAINT `FK_5dopewfmvo8cqakq7jroltt7q` FOREIGN KEY (`criterion_id`) REFERENCES `pi_evaluation_criterion` (`id`),
  ADD CONSTRAINT `FK_i5t33ff7mipcfodrr82lk096p` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`);

--
-- Limitadores para a tabela `pi_idea_eval`
--
ALTER TABLE `pi_idea_eval`
  ADD CONSTRAINT `FK_1eqp9rqjdtvveybvhs6fahark` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_nfwdiuklkrxaqu2wtk395aop0` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_idea_keyword`
--
ALTER TABLE `pi_idea_keyword`
  ADD CONSTRAINT `FK_4919b8e1bdu761ueoxbbw1ejt` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`);

--
-- Limitadores para a tabela `pi_idea_limbus`
--
ALTER TABLE `pi_idea_limbus`
  ADD CONSTRAINT `FK_27yk21pdyapgkkuydi23g9n0e` FOREIGN KEY (`ideaCategory_id`) REFERENCES `pi_idea_category` (`id`),
  ADD CONSTRAINT `FK_n09tw03rrqufq5l3evmjgtqjy` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_ry0wvai6bliik2t44sfssdwbl` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_idea_metad`
--
ALTER TABLE `pi_idea_metad`
  ADD CONSTRAINT `FK_8k7n1mdh8mtg8iuo8paikkllg` FOREIGN KEY (`project_id`) REFERENCES `pi_project` (`id`),
  ADD CONSTRAINT `FK_tdb2xxovah9r4ajpppbyoe1v4` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`);

--
-- Limitadores para a tabela `pi_marker`
--
ALTER TABLE `pi_marker`
  ADD CONSTRAINT `FK_1k8a1kwrx54e43wee6hvtnx3h` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_marker_pi_idea`
--
ALTER TABLE `pi_marker_pi_idea`
  ADD CONSTRAINT `FK_2es3tbumo0etf5n5l1i4i8ioh` FOREIGN KEY (`ideas_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_48adaycrhhhwx8uh3rqwstnc6` FOREIGN KEY (`markerList_id`) REFERENCES `pi_marker` (`id`);

--
-- Limitadores para a tabela `pi_portal`
--
ALTER TABLE `pi_portal`
  ADD CONSTRAINT `FK_dgsqmt6b998oukeceee1dw7o` FOREIGN KEY (`domain_host`) REFERENCES `pi_company_domain` (`host`);

--
-- Limitadores para a tabela `pi_portal_news`
--
ALTER TABLE `pi_portal_news`
  ADD CONSTRAINT `FK_o17a4q05ihnt16d4piq56lkpe` FOREIGN KEY (`portal_domain_host`) REFERENCES `pi_portal` (`domain_host`);

--
-- Limitadores para a tabela `pi_project`
--
ALTER TABLE `pi_project`
  ADD CONSTRAINT `FK_dpwjcetej3bsf2v58u408n2d5` FOREIGN KEY (`responsible_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_son3l8y5ywsfcsxulo3k84e5m` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_state`
--
ALTER TABLE `pi_state`
  ADD CONSTRAINT `FK_nw8d5r4eqwp7kwm6nmbfvvaxl` FOREIGN KEY (`country_id`) REFERENCES `pi_country` (`id`);

--
-- Limitadores para a tabela `pi_stored_email`
--
ALTER TABLE `pi_stored_email`
  ADD CONSTRAINT `FK_7h2uqrcl9h17x7q8n2hli9dgr` FOREIGN KEY (`creator_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_fd0gfrnajs3josb100noydkh8` FOREIGN KEY (`to_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_j0sndla52d5optrdfrks4hda5` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_system_notification`
--
ALTER TABLE `pi_system_notification`
  ADD CONSTRAINT `FK_b4l74y5bpnl7ypmnk06851a8j` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_p09h9ycajxhgbe9lc6da9v7ec` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_tag`
--
ALTER TABLE `pi_tag`
  ADD CONSTRAINT `FK_16hdfu9fwixfcdhjjche8bnox` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_tag_count`
--
ALTER TABLE `pi_tag_count`
  ADD CONSTRAINT `FK_emhh9l0bw2kn2tvbcn8mqcc1w` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`),
  ADD CONSTRAINT `FK_t4kq1poasb20ku49crrfhx9xx` FOREIGN KEY (`tag_id`) REFERENCES `pi_tag` (`id`);

--
-- Limitadores para a tabela `pi_user_agreements`
--
ALTER TABLE `pi_user_agreements`
  ADD CONSTRAINT `FK_i7fqxpq8cbyf9gxy1so8i0swn` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`),
  ADD CONSTRAINT `FK_k2hgnu7un0gwe2yi2tpcic80b` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_user_award_score`
--
ALTER TABLE `pi_user_award_score`
  ADD CONSTRAINT `FK_4mtvihpunj9sc60qqdk9kgve3` FOREIGN KEY (`awarding_id`) REFERENCES `pi_game_awarding` (`id`),
  ADD CONSTRAINT `FK_7fmowmy123q9y5niw2bip0hvr` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_user_crit_battle`
--
ALTER TABLE `pi_user_crit_battle`
  ADD CONSTRAINT `FK_jf29vyvy9t44co79xqe5dw95o` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_ly4h463k5gjc9ep4kgrt73ech` FOREIGN KEY (`criterion_second_id`,`criterion_first_id`,`criterion_criterion_id`) REFERENCES `pi_idea_crit_battle` (`second_id`, `first_id`, `criterion_id`);

--
-- Limitadores para a tabela `pi_user_crit_eval`
--
ALTER TABLE `pi_user_crit_eval`
  ADD CONSTRAINT `FK_3vrali8gd98bgn5sqqmy3gf1t` FOREIGN KEY (`criterion_idea_id`,`criterion_criterion_id`) REFERENCES `pi_idea_crit_eval` (`idea_id`, `criterion_id`),
  ADD CONSTRAINT `FK_p9h3umhb2x1wt4il28lc7l6iy` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_user_deactivation_alert`
--
ALTER TABLE `pi_user_deactivation_alert`
  ADD CONSTRAINT `FK_hydm55qshkos9bjysglydfw8v` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_qg6tqlhldyfu01i1ep3r5fuye` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`);

--
-- Limitadores para a tabela `pi_user_device`
--
ALTER TABLE `pi_user_device`
  ADD CONSTRAINT `FK_8q32hf1tiyxy29mj50fkfqhoc` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_user_inst`
--
ALTER TABLE `pi_user_inst`
  ADD CONSTRAINT `FK_6canqdy0f0irmhupllrldb716` FOREIGN KEY (`campaign_id`) REFERENCES `pi_campaign` (`id`),
  ADD CONSTRAINT `FK_6f8l2stq7wdg3xq34i8xo3kbc` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_s8s7tfihchr8ueeixb3flt2ge` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`);

--
-- Limitadores para a tabela `pi_user_login_log`
--
ALTER TABLE `pi_user_login_log`
  ADD CONSTRAINT `FK_1uw8y3j40p0b0bv1mxvuviho0` FOREIGN KEY (`browserId`) REFERENCES `pi_user_browser` (`id`),
  ADD CONSTRAINT `FK_3gn1cgfuox8roecnjgslo9p3e` FOREIGN KEY (`userId`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_user_role`
--
ALTER TABLE `pi_user_role`
  ADD CONSTRAINT `FK_17crkf69r85homty4aqdwyh1m` FOREIGN KEY (`company_id`) REFERENCES `pi_company` (`id`),
  ADD CONSTRAINT `FK_3r855k19xxw6yto8enax1o02o` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`);

--
-- Limitadores para a tabela `pi_user_score`
--
ALTER TABLE `pi_user_score`
  ADD CONSTRAINT `FK_79pwh92dcvnoess4n24l9f04y` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_8yfrbs7hcse11y2noejf90hyc` FOREIGN KEY (`game_id`) REFERENCES `pi_game` (`id`);

--
-- Limitadores para a tabela `pi_vote`
--
ALTER TABLE `pi_vote`
  ADD CONSTRAINT `FK_4jdd195fthvqxjug4p1fvkfrj` FOREIGN KEY (`user_id`) REFERENCES `pi_user` (`id`),
  ADD CONSTRAINT `FK_atjm11p6eydmi23f5b1musg7x` FOREIGN KEY (`idea_id`) REFERENCES `pi_idea` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
