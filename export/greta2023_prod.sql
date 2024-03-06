-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 06 mars 2024 à 18:08
-- Version du serveur : 5.7.19-log
-- Version de PHP : 8.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `greta2023_prod`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1727ACA70` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `name`, `slug`) VALUES
(1, NULL, 'Surf', 'surf'),
(2, NULL, 'Paddle', 'paddle'),
(3, NULL, 'Longboard', 'longboard'),
(4, NULL, 'Skakeboard', 'skakeboard'),
(5, 1, 'Shortboard', 'shortboard');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CA76ED395` (`user_id`),
  KEY `IDX_9474526C4B89032C` (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 'Commentaire 1', '2023-09-20 14:15:26', '2023-09-20 14:15:26'),
(2, 2, 3, 'Commentaire 2', '2023-09-20 14:20:17', '2023-09-20 14:20:17'),
(7, 4, 3, 'Test 2', '2023-09-25 09:32:40', '2023-09-25 09:56:41');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230912144409', '2023-09-12 14:50:43', 1156),
('DoctrineMigrations\\Version20230913075407', '2023-09-13 07:57:32', 1507),
('DoctrineMigrations\\Version20230913092518', '2023-09-13 09:27:58', 1746),
('DoctrineMigrations\\Version20230913124231', '2023-09-13 12:43:30', 1499),
('DoctrineMigrations\\Version20230913132111', '2023-09-13 13:22:29', 2812),
('DoctrineMigrations\\Version20230918132152', '2023-09-18 13:22:47', 3286),
('DoctrineMigrations\\Version20230920131636', '2023-09-20 13:18:50', 6309),
('DoctrineMigrations\\Version20230920132004', '2023-09-20 13:20:55', 1961),
('DoctrineMigrations\\Version20230925132845', '2023-09-25 13:29:41', 2091);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `active` tinyint(1) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_size` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DA76ED395` (`user_id`),
  KEY `IDX_5A8A6C8D12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `user_id`, `category_id`, `title`, `slug`, `content`, `image`, `created_at`, `active`, `image_name`, `image_size`, `updated_at`) VALUES
(1, 1, 3, 'Mon premier titre v2', 'mon-premier-titre-v2', '<p>Mon premier contenu v2</p>', 'https://contents.mediadecathlon.com/p1478814/k$fdcdbe5ee36062d4c61afa36c47242cc/1920x0/422pt225/845xcr325/default.jpg', '2023-09-18 09:53:58', 1, '', 0, NULL),
(2, 1, 1, 'Mikala Jones : la Cause de son Accident de Surf tragique', 'mikala-jones-la-cause-de-son-accident-de-surf-tragique', '<p><em>La communaut&eacute; du <strong>surf</strong> est une nouvelle fois endeuill&eacute;e suite &agrave; la mort tragique et pr&eacute;matur&eacute;e de l&rsquo;un de ses free surfeurs les plus appr&eacute;ci&eacute;s,&nbsp;<strong>Mikala Jones</strong>, 44 ans, mort des suites d&rsquo;un terrible accident de surf aux Mentawai.</em></p>\r\n\r\n<p>Les images de Mikala Jones avaient fait le tour du monde car c&rsquo;&eacute;tait l&rsquo;un des tous meilleurs pour filmer l&rsquo;int&eacute;rieur des tubes qu&rsquo;il surfait avec sa GoPro et offrir des angles de vue in&eacute;dits. Il &eacute;tait &eacute;galement appr&eacute;ci&eacute; pour sa gentillesse et son humilit&eacute;.</p>\r\n\r\n<p>Les d&eacute;tails de l&rsquo;accident sont incomplets mais on en sait suffisamment aujourd&rsquo;hui pour d&eacute;terminer la cause de son d&eacute;c&egrave;s.</p>\r\n\r\n<p>Mikala Jones et sa famille s&eacute;journaient au Awera Resort dans le North Sipora (Mentawai).</p>\r\n\r\n<p>Alors qu&rsquo;il surfait le dimanche 9 juillet 2023 aux alentours de 9 heures 15 du matin, il aurait subi un accident de surf contre sa planche occasionnant une blessure profonde au niveau de son aine gauche.</p>\r\n\r\n<p>La blessure profonde faisait environ 10 centim&egrave;tres de long et aurait touch&eacute; l&rsquo;art&egrave;re f&eacute;morale, l&rsquo;une des plus grosses art&egrave;res de l&rsquo;organisme dont la perforation peut &ecirc;tre rapidement fatale.</p>\r\n\r\n<p>C&rsquo;est malheureusement ce qui est arriv&eacute; &agrave; Mikala Jones qui aurait fait un choc h&eacute;morragique des suites des pertes importantes de sang.</p>\r\n\r\n<p>La cause probable de cette plaie profonde est une&nbsp;<strong>d&eacute;rive de sa planche de surf</strong>.</p>\r\n\r\n<p>Les responsables du Awera Resort ont imm&eacute;diatement contact&eacute; le&nbsp;<strong>Mentawai Hospital</strong>&nbsp;qui a envoy&eacute; une &eacute;quipe pour r&eacute;cup&eacute;rer Mikala Jones &agrave; Tuapejat Pier o&ugrave; il avait &eacute;t&eacute; transport&eacute; par bateau. Malheureusement, sa mort a &eacute;t&eacute; prononc&eacute;e &agrave; l&rsquo;h&ocirc;pital.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mikala Jones laisse une femme et trois enfants et toute une famille dans la peine derri&egrave;re lui. Nous leur adressons toutes nos condol&eacute;ances et nos pens&eacute;es en ce tragique moment.</p>\r\n\r\n<p>Il est important de relater cet accident pour illustrer une nouvelle fois les d&eacute;g&acirc;ts que peuvent occasionner les d&eacute;rives et les parties tranchantes de nos planches de surf et l&rsquo;int&eacute;r&ecirc;t de d&eacute;velopper et de promouvoir des&nbsp;<a href=\"https://blog.surf-prevention.com/2010/12/05/derives-proteck-power-flex-surf/\">produits moins coupants</a>.</p>\r\n\r\n<p>Ce n&rsquo;est pas une question de niveau car on peut &ecirc;tre atteint par ce type d&rsquo;accident&nbsp;<strong>quel que soit son niveau</strong>&nbsp;: de la&nbsp;<strong><a href=\"https://twitter.com/surfprevention/status/1009793955356135424\">d&eacute;butante de 24 ans</a></strong>&nbsp;d&eacute;c&eacute;d&eacute;e en Gironde &agrave; un surfeur professionnel comme Mikala Jones en passant par ce&nbsp;<strong><a href=\"https://twitter.com/surfprevention/status/1538473150308134912\">surfeur breton de 50 ans</a></strong>&nbsp;l&rsquo;ann&eacute;e derni&egrave;re.&nbsp;<strong><a href=\"https://blog.surf-prevention.com/2010/06/10/interview-philippe-malvaux-revient-sur-son-grave-accident-de-surf/\">Philippe Malvaux</a></strong>&nbsp;nous avait &eacute;galement racont&eacute; comment il avait &eacute;chapp&eacute; de peu au pire.</p>\r\n\r\n<p>M&ecirc;me si les blessures art&eacute;rielles sont fort heureusement relativement rares, elles surviennent tout de m&ecirc;me suffisamment r&eacute;guli&egrave;rement pour que des actions de pr&eacute;vention soient mises en &oelig;uvre. Ce nouvel accident doit inciter encore plus &agrave; travailler sur les parties vuln&eacute;rantes des planches de surf pour les rendre moins traumatog&egrave;nes.</p>\r\n\r\n<p>Ride in peace Mikala.</p>\r\n\r\n<p>&nbsp;</p>', 'https://blog.surf-prevention.com/wp-content/uploads/2023/07/mikala-jones-652x613.jpg', '2023-09-18 12:18:42', 1, '', 0, NULL),
(3, 1, 1, 'test', 'test', '<p>Test de contenu</p>', 'https://www.surfcamp.fr/wp-content/uploads/2020/03/image-18-1-1536x485.jpg', '2023-09-18 12:20:57', 1, '', 0, NULL),
(4, 4, 1, 'QUEL EST LE MEILLEUR TEMPS DE L’ANNÉE POUR FAIRE UN VOYAGE DE SURF EN AMÉRIQUE CENTRALE?', 'quel-est-le-meilleur-temps-de-lannee-pour-faire-un-voyage-de-surf-en-amerique-centrale', '<p>Es-tu &agrave; la recherche de barrels ou est-ce ton premier voyage de surf? Certains diront que le meilleur moment est quand tu d&eacute;cides de prendre le temps de le faire (ou quand tu en as besoin psychologiquement..!). En fait c&rsquo;est toujours un bon temps pour partir faire le plein d&rsquo;&eacute;nergie et de vitamine sea. Mais &ccedil;a d&eacute;pend de ce que tu recherches comme exp&eacute;rience. Voici quelques conseils et information bas&eacute;e sur les cycles m&eacute;t&eacute;orologiques des swells (la houle, ce qui cr&eacute;e les vague) pour t&rsquo;aider &agrave; choisir le meilleur moment pour faire ton voyage de surf en Am&eacute;rique Centrale&nbsp;</em><em>sur la c&ocirc;te Pacifique, entre le sud du Mexique (Oaxaca) et&nbsp; le nord du P&eacute;rou ( Mancora):</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/surf-girl-trip.jpg\"><img alt=\"\" src=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/surf-girl-trip.jpg\" style=\"height:718px; width:958px\" /></a></p>\r\n\r\n<h3><strong>Un voyage de surf en Am&eacute;rique Centrale de d&eacute;cembre &agrave; fin avril</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>&lsquo;&rsquo;La dry season&rsquo;&rsquo;- Le meilleur temps pour avoir une semaine ensoleill&eacute;e, avec des vagues tranquilles.</strong></h4>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Les vagues sont g&eacute;n&eacute;ralement plus petites, le soleil plombant et le ciel bleu. C&rsquo;est un bon moment pour les surfeurs d&eacute;butants et les surfeurs interm&eacute;diaires qui veulent pratiquer et progresser. L&rsquo;eau peut &ecirc;tre un peu froide dans le sud du&nbsp;<a href=\"https://surfexpedition.com/fr/voyage-de-surf-expedition-nicaragua/\"><em><strong>Nicaragua</strong></em></a>&nbsp;(entre San Juan del Sur et Pochomil) tout comme au nord du Costa Rica (Witches Rock, Tamarindo, Playa Grande, Nosara, Samara, Santa Teresa, Malpais Jaco, Playa Hermosa) surtout entre janvier et mars&hellip;&nbsp;Un wetsuit est donc une bonne id&eacute;e. Tu n&rsquo;auras pas besoin d&rsquo;un 3-4mm comme sur la c&ocirc;te est des &Eacute;tats-Unis mais am&egrave;ne-toi un haut de wetsuit d&rsquo;un ou 2mm, tu seras plus confortable pour &lsquo;&rsquo;paddler&rsquo;&rsquo; tout en restant plus longtemps dans l&rsquo;eau. Porter un top de wetsuit t&rsquo;aidera grandement &agrave; pr&eacute;venir l&rsquo;irritation et rash pouvant &ecirc;tre caus&eacute; par la friction de ton ventre avec la planche, surtout si &ccedil;a fait longtemps que tu n&rsquo;as pas surf&eacute; ou que c&rsquo;est ta premi&egrave;re fois..</p>\r\n\r\n<p>Durant cette p&eacute;riode, le vent souffle &lsquo;&rsquo;offshore&rsquo;&rsquo; rendant les vagues lisses. Le vent peut &ecirc;tre assez fort par moment mais il se calme et l&rsquo;eau se r&eacute;chauffe vers la fin du mois de mars, alors si tu voyages a ce moment l&agrave;, tu peux laisser ton wetsuit &agrave; la maison. Donc, si c&rsquo;est ton premier &lsquo;&rsquo;surf trip&rsquo;&rsquo; et que tu recherches du beau temps, opte pour un voyage entre janvier et fin-avril si possible..</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>Pas envie de porter de wetsuit?</strong></h4>\r\n\r\n<p>Si l&rsquo;id&eacute;e de devoir porter un wetsuit te donne froid dans le dos, notrc camp de surf au&nbsp;<a href=\"https://surfexpedition.com/fr/voyage-costa-rica-surf-camp-retraite-de-yoga/\"><em><strong>Costa Rica</strong></em></a>&nbsp;, situ&eacute; dans le sud du Costa Rica, b&eacute;n&eacute;ficie d&rsquo;eau &agrave; temp&eacute;rature tropicale &agrave; l&rsquo;ann&eacute;e longue. Donc tu pourras surfer en bikini ou board short pour tes vacances entre d&eacute;cembre et mars, contrairement au nord du Costa Rica et au sud du Nicaragua.</p>\r\n\r\n<p><a href=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/isabelle-surf-avril.jpg\"><img alt=\"surf-costa-rica-avril\" src=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/isabelle-surf-avril.jpg\" style=\"height:718px; width:958px\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Voyager pour le surf en Am&eacute;rique Centrale&nbsp;</strong><strong>de la fin-avril &agrave; la fin ao&ucirc;t</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>&ldquo;La green season&rdquo;- Le meilleur temps pour avoir des swells consistants</strong></h4>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&rsquo;est la p&eacute;riode la plus optimale pour &ldquo;scorer&rdquo; des grosses vagues avec des journ&eacute;es ensoleill&eacute;es. Les quelques jours et soir&eacute;es de pluie rendent les arbres et la v&eacute;g&eacute;tation verdoyante et la for&ecirc;t luxuriante. C&rsquo;est pourquoi on appelle cette saison la &ldquo;green season&rdquo;! Les paysages sont magnifiques, ce qui donne des photos &agrave; couper le souffle! La saison des pluie commencent &agrave; se faire sentir davantage vers la fin juin, donc certaines journ&eacute;es peuvent parfois &ecirc;tre pluvieuses mais ce sont les nuits qui sont les plus arros&eacute;es. Durant les mois de la &lsquo;&rsquo;green season&rsquo;&rsquo;, les vagues sont plus r&eacute;guli&egrave;res et les vents plus calme. L&rsquo;eau est chaude partout, donc pas besoin de wetsuit! Si tu cherches un maximum de vagues avant tout, c&rsquo;est le meilleur moment pour voyager.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h6>VOICI LE GENRE DE VAGUE QUE NOUS RECEVONS &Agrave; NOS SPOTS D&Eacute;BUTANTS DURANT UN SWELL MOYEN. DE LONGUE VAGUES LENTES ET SMOOTH.. PARFAITES POUR AJUSTER SA POSITION SUR LA PLANCHE ET PRATIQUER &Agrave; PRENDRE SA DIRECTION SUR UNE VAGUE VERTE, G&Eacute;N&Eacute;RER DE LA VITESSE ET &Eacute;VENTUELLEMENT, &Agrave; FAIRE DES VIRAGES VERS LE HAUT DE LA VAGUE.. PAS PIRE POUR UNE FILLE QUI N&rsquo;AVAIT JAMAIS SURF&Eacute;E DE SA VIE!</h6>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h5><strong>NE MANQUE PAS LE PREMIER GROS SWELL DE L&rsquo;ANN&Eacute;E!</strong></h5>\r\n\r\n<p>Autour de la derni&egrave;re semaine d&rsquo;avril et la premi&egrave;re de mai, la c&ocirc;te Pacifique re&ccedil;oit habituellement le premier gros swell Sud-Sud-Ouest. Si tu es un surfeur exp&eacute;riment&eacute;, garde un oeil sur les pr&eacute;visions de surf via les site&nbsp;<em><strong><a href=\"http://magicseaweed.com/\">magicseaweed.com</a></strong></em>&nbsp;et&nbsp;<strong><em><a href=\"http://www.surfline.com/\">surfline.com</a></em></strong>&nbsp;et commence &agrave; t&rsquo;entra&icirc;ner pour en profiter au maximum! Apr&egrave;s ce premier gros swell, les conditions redeviennent r&eacute;guli&egrave;res et tous les niveaux peuvent alors en profiter jusqu&rsquo;au prochain gros swell.. Il y aura une dizaine d&rsquo;autres gros swells de ce genre durant la p&eacute;riode mai-novembre.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Conseils-pour-surf-première-fois\" src=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/jungle.jpg\" style=\"height:600px; width:900px\" /></p>\r\n\r\n<h3>&nbsp;</h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>Un voyage de surf en Am&eacute;rique Centrale de Septembre &agrave; Novembre</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h4><strong>&ldquo; La vrai rainy season&rsquo;&rsquo; &ndash; parfait pour des sessions de surf seul dans l&rsquo;eau dans des vagues tr&egrave;s puissantes&nbsp;</strong></h4>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>C&rsquo;est la p&eacute;riode la plus intense de la saison des pluies. Soit on l&rsquo;&eacute;vite &agrave; tout prix, soit on en profite parce que l&rsquo; automne, c&rsquo;est les plus grosses vagues! C&rsquo;est souvent pendant cette p&eacute;riode de l&rsquo;ann&eacute;e que les meilleurs surfeurs voyagent en Am&eacute;rique Centrale. Les vagues sont puissantes et il n&rsquo;y a presque personne dans l&rsquo;eau. Les surfeurs avanc&eacute;s pr&eacute;f&egrave;rent habituellement sacrifier leur bronzage pour profiter de sessions de surf moins achaland&eacute;s.</p>\r\n\r\n<h5><strong>QUELQUES CONSEILS POUR TON VOYAGE DE SURF:</strong></h5>\r\n\r\n<p>Sauf que trois semaines sans soleil, &ccedil;a peut par contre &ecirc;tre un peu intense. Alors un petit conseil: apporte-toi des bouchons pour les oreilles! Les fortes pluies remplissent les rivi&egrave;res pr&egrave;s des zones agricoles et d&eacute;versent parfois pleins de salet&eacute;s dans l&rsquo;eau. Pour t&rsquo;&eacute;viter une infection aux oreilles, on te recommande 2 marques:&nbsp;<em><strong><a href=\"http://macksearplugs.com/\">Mack&rsquo;s* earplugs&nbsp;</a></strong></em>(jetables et abordables- c&rsquo;est un silicone qui se moule &agrave; ton oreille) et&nbsp;<em><strong><a href=\"http://surfears.com/\">Surf Ears</a></strong></em>&nbsp;(disponibles en plusieurs tailles et con&ccedil;us pour les pros- laisse le son passer en bloquant l&rsquo;eau).</p>\r\n\r\n<p>Dans un souci d&rsquo;offrir le meilleur service &agrave; notre client&egrave;le, nous ne sommes pas en op&eacute;ration durant ces mois de l&rsquo;ann&eacute;e. Les vagues et la m&eacute;t&eacute;o ne sont pas optimales pour donner des cours agr&eacute;ables et faire progresser les &eacute;tudiants rapidement.</p>\r\n\r\n<p><a href=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/backside.jpg\"><img alt=\"best-time-to-surf-big-swell-central-america\" src=\"https://surfexpedition.com/fr/wp-content/uploads/2017/11/backside-1024x683.jpg\" style=\"height:683px; width:1024px\" /></a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h3><strong>En conclusion</strong></h3>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Il est presque impossible de pr&eacute;dire l&rsquo;humeur de m&egrave;re nature, surtout avec les changements climatiques de nos jours. Tout le monde aura une opinion diff&eacute;rente sur quand et o&ugrave; aller pour partir faire un voyage de surf en Am&eacute;rique Centrale. Par exemple, nous avons re&ccedil;u un gros swell (comme on aurait normalement en juillet) en f&eacute;vrier &agrave; chaque ann&eacute;e depuis 2 ans, dans le&nbsp;<strong><em><a href=\"https://surfexpedition.com/fr/voyage-costa-rica-surf-camp-retraite-de-yoga/\">sud du Costa Rica</a></em></strong>. Il commence aussi a avoir plus de swell en mars qu&rsquo;auparavant. Donc les saisons changent un peu avec le bouleversement du climat. Tu peux &eacute;videmment regarder les tendances, mais il est difficile de baser ses d&eacute;cisions simplement sur la m&eacute;t&eacute;o. Donc un autre bon conseil, c&rsquo;est de choisir une r&eacute;gion qui t&rsquo;offre plusieurs spots de surf. Tu auras plus de chances de trouver les conditions favorables pour atteindre tes objectifs en r&eacute;pondant &agrave; ton niveau de confort dans l&rsquo;eau et &agrave; tes besoins au fil de ta progression. Si tu souhaites partir avec de bonnes bases en surf et acqu&eacute;rir les connaissances pour surfer de fa&ccedil;on s&eacute;curitaire en t&rsquo;&eacute;clatant au maximum, tu peux consulter notre&nbsp;<em><strong><a href=\"https://surfexpedition.com/fr/calendrier-surf-expedition-2019/\">calendrier de voyages de surf&nbsp;</a></strong></em>et te joindre &agrave; un de nos voyages et exp&eacute;ditions!</p>\r\n\r\n<p>On se voit dans l&rsquo;eau!</p>\r\n\r\n<p>*ps. Nous n&rsquo;avons aucune entente de r&eacute;tributions avec ces compagnies! Ce sont les marques que nous utilisons personnellement.</p>', 'https://surfexpedition.com/fr/wp-content/uploads/2017/11/surfergirl.jpg', '2023-09-25 13:40:38', 1, 'surfergirl-65118dd73fa06261700209.jpg', 159765, '2023-09-25 13:40:39');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `display_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`, `display_name`) VALUES
(1, 'user1@mail.com', '[\"ROLE_ADMIN\"]', '$2y$13$uRdHyIMgpQbjRamoXw8X.OutZPKcId0jMsdbm6a7UDGgAHZboh8iq', 1, 'Phil'),
(2, 'user2@mail.com', '[\"ROLE_MODERATEUR\"]', '$2y$13$L/mYODec.yYm1cDyg6N3TOAFeKVMrxHV3v/zzDopp3t1wm95J596q', 1, 'User2'),
(4, 'user4@mail.com', '[\"ROLE_REDACTEUR\"]', '$2y$13$eNfdzmVaRw/QtbjCCttuWOBvjW2iIGYw/VkopETr4uJ5nvbOYb3BG', 1, 'User Quatre');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`),
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK_5A8A6C8D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_5A8A6C8DA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
