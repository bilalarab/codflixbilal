-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour codflix
CREATE DATABASE IF NOT EXISTS `codflix` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `codflix`;

-- Listage de la structure de la table codflix. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table codflix.genre : 19 rows
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`id`, `name`) VALUES
	(27, 'Horror'),
	(28, 'Action'),
	(12, 'Adventure'),
	(16, 'Animation'),
	(35, 'Comedy'),
	(80, 'Crime'),
	(99, 'Documentary'),
	(18, 'Drama'),
	(10751, 'Family'),
	(14, 'Fantasy'),
	(36, 'History'),
	(10402, 'Music'),
	(9648, 'Mystery'),
	(10749, 'Romance'),
	(878, 'Science Fiction'),
	(10770, 'TV Movie'),
	(53, 'Thriller'),
	(10752, 'War'),
	(37, 'Western');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;

-- Listage de la structure de la table codflix. history
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `finish_date` date NOT NULL,
  `watch_duration` mediumint(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Listage des données de la table codflix.history : 0 rows
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;

-- Listage de la structure de la table codflix. media
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `genre_id` int(20) NOT NULL,
  `poster` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `status` varchar(50) NOT NULL DEFAULT '',
  `release_date` varchar(255) NOT NULL DEFAULT '',
  `runtime` int(20) NOT NULL DEFAULT '0',
  `summary` text NOT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `vote_count` int(20) NOT NULL,
  `vote_average` float NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Listage des données de la table codflix.media : 22 rows
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` (`id`, `genre_id`, `poster`, `type`, `status`, `release_date`, `runtime`, `summary`, `trailer_url`, `vote_count`, `vote_average`, `title`) VALUES
	(45, 18, '/1Duc3EBiegywczxTWekvy03HWai.jpg', 'movie', 'Released', '2019-01-25', 98, 'Britt-Marie, a woman in her sixties, decides to leave her husband and start anew. Having been housewife for most of her life and and living in small backwater town of Borg, there isn\'t many jobs available and soon she finds herself fending a youth football team.', NULL, 13, 5.2, 'Britt-Marie var här'),
	(46, 12, '/mhDdx7o7hhrxrikq8aqPLLnS9w8.jpg', 'movie', 'Released', '2020-06-12', 95, 'Artemis Fowl is a 12-year-old genius and descendant of a long line of criminal masterminds. He soon finds himself in an epic battle against a race of powerful underground fairies who may be behind his father\'s disappearance.', NULL, 418, 5.9, 'Artemis Fowl'),
	(47, 878, '/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg', 'movie', 'Released', '2019-09-17', 123, 'The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown.', NULL, 3786, 6.1, 'Ad Astra'),
	(48, 35, '/wXBxd34dFEx6Wruf5Ch5jKLBxDi.jpg', 'movie', 'Released', '2020-06-19', 107, 'After failing to make it on Broadway, April returns to her hometown and reluctantly begins training a misfit group of young dancers for a competition.', NULL, 185, 8.1, 'Feel the Beat'),
	(49, 28, '/qnlChF8U4diiykXQYs1miigGy7t.jpg', 'movie', 'Released', '2020-06-19', 92, 'A small time delinquent, turned police mechanic for a go fast task force, is forced to defend his innocence when his mentor is killed by dirty cops.', NULL, 128, 6.9, 'Balle perdue'),
	(50, 28, '/aQvJ5WPzZgYVDrxLX4R6cLJCEaQ.jpg', 'movie', 'Released', '2020-02-12', 99, 'Based on the global blockbuster videogame franchise from Sega, Sonic the Hedgehog tells the story of the world’s speediest hedgehog as he embraces his new home on Earth. In this live-action adventure comedy, Sonic and his new best friend team up to defend the planet from the evil genius Dr. Robotnik and his plans for world domination.', NULL, 4741, 7.5, 'Sonic the Hedgehog'),
	(51, 53, '/hau6iHAIWJmlnaaZ0QRYZu9T6B1.jpg', 'movie', 'Released', '2012-11-04', 90, 'When the rumored whereabouts of Osama bin Laden are revealed, the CIA readies a team of seasoned U.S. Navy SEALs for the mission of a lifetime. Despite inconclusive evidence that bin Laden is inside the compound, and ignoring the possible ramifications of an unannounced attack on Pakistani soil, the Pentagon orders the attack. The SEAL Team bands together to complete their mission of justice in a riveting final showdown.', NULL, 186, 5.9, 'Seal Team Six: The Raid on Osama Bin Laden'),
	(52, 53, '/nrW048JoWofimI5AKXDTBzvxqRr.jpg', 'movie', 'Released', '2019-12-26', 93, 'When terrorists try to seize control of a Berlin-Paris flight, a soft-spoken young American co-pilot struggles to save the lives of the passengers and crew while forging a surprising connection with one of the hijackers.', NULL, 94, 5.9, '7500'),
	(53, 27, '/2Gi9ZA4kRKKsWguUoTvIyj40dxF.jpg', 'movie', 'Released', '2020-06-19', 93, 'In an effort to repair their relationship, a couple books a vacation in the countryside for themselves and their daughter. What starts as a perfect retreat begins to fall apart as one loses their grip on reality, and a sinister force tries to tear them apart.', NULL, 31, 5.1, 'You Should Have Left'),
	(54, 28, '/h4VB6m0RwcicVEZvzftYZyKXs6K.jpg', 'movie', 'Released', '2020-02-05', 109, 'Harley Quinn joins forces with a singer, an assassin and a police detective to help a young girl who had a hit placed on her after she stole a rare diamond from a crime lord.', NULL, 4648, 7.2, 'Birds of Prey (and the Fantabulous Emancipation of One Harley Quinn)'),
	(55, 53, '/5EufsDwXdY2CVttYOk2WtYhgKpa.jpg', 'movie', 'Released', '2020-02-26', 124, 'When Cecilia\'s abusive ex takes his own life and leaves her his fortune, she suspects his death was a hoax. As a series of coincidences turn lethal, Cecilia works to prove that she is being hunted by someone nobody can see.', NULL, 2201, 7.2, 'The Invisible Man'),
	(56, 35, '/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg', 'movie', 'Released', '2019-05-30', 133, 'All unemployed, Ki-taek\'s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.', NULL, 8078, 8.5, '기생충'),
	(57, 10752, '/yx4cp1ljJMDSFeEex0Zjv45b55E.jpg', 'movie', 'Released', '2020-06-12', 156, 'Four African-American Vietnam veterans return to Vietnam. They are in search of the remains of their fallen squad leader and the promise of buried treasure. These heroes battle forces of humanity and nature while confronted by the lasting ravages of the immorality of the Vietnam War.', NULL, 215, 6.9, 'Da 5 Bloods'),
	(58, 80, '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', 'movie', 'Released', '2019-10-02', 122, 'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.', NULL, 13340, 8.2, 'Joker'),
	(59, 12, '/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg', 'movie', 'Released', '2018-04-25', 149, 'As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.', NULL, 18632, 8.3, 'Avengers: Infinity War'),
	(60, 16, '/f4aul3FyD3jv3v4bul1IrkWZvzq.jpg', 'movie', 'Released', '2020-02-29', 102, 'In a suburban fantasy world, two teenage elf brothers embark on an extraordinary quest to discover if there is still a little magic left out there.', NULL, 2304, 7.9, 'Onward'),
	(61, 28, '/ucktgbaMSaETUDLUBp1ubGD6aNj.jpg', 'movie', 'In Production', '2020-07-02', 91, 'A gang of thieves plan a heist during a hurricane and encounter trouble when a disgraced cop tries to force everyone in the building to evacuate.', NULL, 0, 0, 'Force of Nature'),
	(62, 28, '/xT98tLqatZPQApyRmlPL12LtiWp.jpg', 'movie', 'Released', '2014-12-10', 144, 'Immediately after the events of The Desolation of Smaug, Bilbo and the dwarves try to defend Erebor\'s mountain of treasure from others who claim it: the men of the ruined Laketown and the elves of Mirkwood. Meanwhile an army of Orcs led by Azog the Defiler is marching on Erebor, fueled by the rise of the dark lord Sauron. Dwarves, elves and men must unite, and the hope for Middle-Earth falls into Bilbo\'s hands.', NULL, 9938, 7.3, 'The Hobbit: The Battle of the Five Armies'),
	(63, 28, '/db32LaOibwEliAmSL2jjDF6oDdj.jpg', 'movie', 'Released', '2019-12-18', 142, 'The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.', NULL, 4953, 6.5, 'Star Wars: The Rise of Skywalker'),
	(64, 12, '/3iYQTLGoy7QnjcUYRJy4YrAgGvp.jpg', 'movie', 'Released', '2019-05-22', 128, 'A kindhearted street urchin named Aladdin embarks on a magical adventure after finding a lamp that releases a wisecracking genie while a power-hungry Grand Vizier vies for the same lamp that has the power to make their deepest wishes come true.', NULL, 6210, 7.1, 'Aladdin'),
	(65, 12, '/wuMc08IPKEatf9rnMNXvIDxqP4W.jpg', 'movie', 'Released', '2001-11-16', 152, 'Harry Potter has lived under the stairs at his aunt and uncle\'s house his whole life. But on his 11th birthday, he learns he\'s a powerful wizard -- with a place waiting for him at the Hogwarts School of Witchcraft and Wizardry. As he learns to harness his newfound powers with the help of the school\'s kindly headmaster, Harry uncovers the truth about his parents\' deaths -- and about the villain who\'s to blame.', NULL, 17263, 7.9, 'Harry Potter and the Philosopher\'s Stone'),
	(66, 10752, '/iZf0KyrE25z1sage4SYFLCCrMi9.jpg', 'movie', 'Released', '2019-12-25', 119, 'At the height of the First World War, two young British soldiers must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers.', NULL, 5495, 7.9, '1917');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;

-- Listage de la structure de la table codflix. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Listage des données de la table codflix.user : ~3 rows (environ)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `email`, `password`) VALUES
	(1, 'coding@gmail.com', '123456'),
	(2, 'non@oui.oui', 'oui'),
	(3, 'nodsdsn@oui.oui', 'bilal');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
