-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jan 12, 2023 at 06:41 AM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `college`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `author` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `author`, `body`, `create_date`) VALUES
(1, 'Who is Khabib Nurmagomedov?', 'SaidAli', '<p>Khabib Nurmagomedov is a retired Russian mixed martial artist, sambist, and judoka. He is a former two-time Combat Sambo World Champion and the former UFC Lightweight Champion. He is widely regarded as one of the greatest mixed martial artists of all time, and holds an unbeaten professional record of 29&ndash;0. He retired from MMA in October 2020 after a successful title defense against Justin Gaethje.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>Khabib Nurmagomedov was born on September 20, 1988 in the village of Sildi in the Tsumadinsky District of the Dagestan ARA, Soviet Union (now Russia). He began wrestling at a young age under the tutelage of his father Abdulmanap, who is a respected coach in the region. Khabib later began training in judo and sambo and quickly developed a reputation as a highly skilled and talented wrestler.</p>\n\n<p>Khabib made his professional mixed martial arts debut in September 2008, competing in a regional promotion in Russia. He quickly compiled an unbeaten record, winning several regional titles and attracting the attention of international MMA organizations.</p>\n\n<p>In 2011, Khabib signed with the UFC, the largest and most prominent MMA promotion in the world. He made his debut for the organization in January 2012, and quickly established himself as a top contender in the lightweight division.</p>\n\n<p>Khabib&#39;s rise to prominence was not without controversy. He is a devout muslim and his strong faith sometimes was at odds with the image-conscious and profane world of MMA. He also had a feud with Conor McGregor, which led to a post-fight altercation after Khabib defeated McGregor.</p>\n\n<p>Despite these controversies, Khabib&#39;s talent in the cage couldn&#39;t be denied. He won the lightweight championship by defeating Al Iaquinta in 2018, and defend it against some of the top contenders of the division, including Conor McGregor and Dustin Poirier. He retired in 2020 with an undefeated record of 29-0 and holding the lightweight title.</p>\n\n<p>In addition to his fighting career, Khabib is also known for his philanthropy, particularly his efforts to promote sports in underprivileged communities in his native Dagestan.</p>\n\n<p>Khabib Nurmagomedov was born on September 20, 1988 in the village of Sildi in the Tsumadinsky District of the Dagestan ARA, Soviet Union (now Russia). He began wrestling at a young age under the tutelage of his father Abdulmanap, who is a respected coach in the region. Khabib later began training in judo and sambo and quickly developed a reputation as a highly skilled and talented wrestler.</p>\n\n<p>Khabib made his professional mixed martial arts debut in September 2008, competing in a regional promotion in Russia. He quickly compiled an unbeaten record, winning several regional titles and attracting the attention of international MMA organizations.</p>\n\n<p>In 2011, Khabib signed with the UFC, the largest and most prominent MMA promotion in the world. He made his debut for the organization in January 2012, and quickly established himself as a top contender in the lightweight division.</p>\n\n<p>Khabib&#39;s rise to prominence was not without controversy. He is a devout muslim and his strong faith sometimes was at odds with the image-conscious and profane world of MMA. He also had a feud with Conor McGregor, which led to a post-fight altercation after Khabib defeated McGregor.</p>\n\n<p>Despite these controversies, Khabib&#39;s talent in the cage couldn&#39;t be denied. He won the lightweight championship by defeating Al Iaquinta in 2018, and defend it against some of the top contenders of the division, including Conor McGregor and Dustin Poirier. He retired in 2020 with an undefeated record of 29-0 and holding the lightweight title.</p>\n\n<p>In addition to his fighting career, Khabib is also known for his philanthropy, particularly his efforts to promote sports in underprivileged communities in his native Dagestan.</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<form>&nbsp;</form>\n\n<p>&nbsp;</p>\n\n<form>&nbsp;</form>\n', '2023-01-11 08:35:28'),
(3, 'About Yemen', 'muneer123', '<p>Welcome to the website dedicated to Yemen. Yemen is a country located in the Middle East, situated on the southwestern coast of the Arabian Peninsula. It is known for its rich culture and history, as well as its beautiful landscapes, including mountains and deserts. Unfortunately, Yemen has been plagued by ongoing conflict, poverty and humanitarian crisis. Our website aims to provide information and resources about the current situation in Yemen, as well as ways to support and assist those affected by the crisis. We hope that you will find our website informative and helpful. Thank you for visiting.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>We also aim to highlight the contributions and resilience of the Yemeni people, despite the ongoing challenges they face. We provide information about the country&#39;s history, culture, and traditions, in order to give a better understanding of the Yemen and its people.</p>\r\n\r\n<p>Our website also offers resources and opportunities for those looking to volunteer, donate or support the Yemen crisis, including links to reputable organizations working on the ground to provide humanitarian aid and assistance.</p>\r\n\r\n<p>We strive to be a source of hope and inspiration for the people of Yemen and those who care about their well-being. Our website is continuously updated with the latest news and information, and we welcome any feedback or suggestions to improve it.</p>\r\n\r\n<p>We hope you will find our website informative and helpful in your journey to better understand and support the people of Yemen. Thank you for visiting and for your continued support.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<form>&nbsp;</form>\r\n', '2023-01-11 19:11:22'),
(2, 'Why I love mysore?', 'ifrah123', '<p>I&#39;m not sure why you love Mysore, as I don&#39;t have enough context about your personal experience and connection to the city. However, I can tell you some reasons why Mysore is a city that many people appreciate:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Heritage: Mysore is known for its rich cultural heritage and history. The city was the capital of the Kingdom of Mysore from 1399 to 1947 and has many important historical monuments such as the Mysore Palace, Jaganmohan Palace, and St. Philomena&#39;s Church.</p>\r\n	</li>\r\n	<li>\r\n	<p>Art and Architecture: Mysore is also famous for its art and architecture, particularly its traditional Mysore-style paintings and its elaborate palaces. The Mysore Palace is a magnificent example of Indo-Saracenic architecture and is a popular tourist destination.</p>\r\n	</li>\r\n	<li>\r\n	<p>Festivals: Mysore is also known for its famous festivals such as the Mysore Dasara and the Mysore Yoga Festival which showcase the rich culture of the city and attracts a lot of visitors.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nature: Mysore is surrounded by picturesque natural beauty. The city is located at the base of the Chamundi Hills and visitors can explore the hilltop temple of Chamundeshwari and enjoy the beautiful views of the city.</p>\r\n	</li>\r\n	<li>\r\n	<p>Food: Mysore is also famous for its delicious local cuisine, which features a mix of South Indian and Mughal flavors. Some popular dishes include Dosa, Idli, Vada, and Mysore Pak, a sweet made from gram flour, ghee, and sugar.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>These are just some examples of what people love about Mysore. Of course everyone have different perspective and personal taste, so it&#39;s possible you have different reasons why you love the city.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>Climate: Mysore has a pleasant climate throughout the year, making it a comfortable place to visit and live. The city experiences moderate temperatures and has pleasant weather conditions, which can be enjoyed when visiting the many gardens and parks that are present in the city.</p>\r\n	</li>\r\n	<li>\r\n	<p>Yoga: Mysore has a reputation as a hub for yoga, as the city has several renowned yoga centers and gurus that teach the traditional Ashtanga yoga method. The city is also home to the Sri K Pattabhi Jois Ashtanga Yoga Institute (KPJAYI), which is considered one of the most authentic and traditional places to study Ashtanga yoga.</p>\r\n	</li>\r\n	<li>\r\n	<p>Culture: Mysore has a vibrant and diverse culture, which is reflected in the city&#39;s many art galleries, museums, and cultural centers. The city also has a rich tradition of classical dance and music, and visitors can enjoy performances of Kathak, Bharatanatyam and Kuchipudi</p>\r\n	</li>\r\n	<li>\r\n	<p>Economy: Mysore is also an important economic center in the state of KarnATAKA, with a strong manufacturing sector and a rapidly growing IT industry. The city is home to several large multinational companies, as well as many small and medium-sized businesses.</p>\r\n	</li>\r\n	<li>\r\n	<p>Education: Mysore is also well-known for its quality of education. The city has several prestigious educational institutions, including the University of Mysore, which is one of the oldest universities in the country.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>In summary, Mysore is a city that offers a blend of rich history, culture, natural beauty and modern development. There are many things to love about Mysore, whether you&#39;re interested in visiting historical monuments, experiencing the local culture, practicing yoga, or just enjoying the city&#39;s many pleasures.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<form>&nbsp;</form>\r\n', '2023-01-11 09:28:32');

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(300) NOT NULL,
  `DOB` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Mobile` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `Name`, `username`, `password`, `DOB`, `Email`, `Address`, `Department`, `Course`, `Mobile`) VALUES
(12, 'sadam ahmed', 'saadamsalad', '$5$rounds=535000$tyfGzD6tqUUqsrY4$Mf1mw8EsfthQOo8VHgSlcuXV42L1K1U7mdb2nFUQ1U5', '23/06/1991', 'cawaaleadan@gmail.com', 'galkavcyo ', 'computer science', 'master of computer science', 2147483647),
(13, 'mohamed said ahmed', 'afrah', '$5$rounds=535000$VUkYcgrXnlVD7Pjs$2mCwGepIo96z8iRoPKjC/bQ27z.vNUUHJihs1Bxcmz/', '23/06/1991', 'gaaboow1995@gmail.com', 'jamamamama', 'computer science', 'master of computer science', 2147483647),
(14, 'said', 'SaidAli', '$5$rounds=535000$Adt0PVcHFnHClACv$Yf7Xki0Kk7VDIiZAjJeZdAekmuzU.OWeBXekD12Qlb3', '10-01-1997', 'inacaliyusuf@gmail.com', 'mysore', 'Msc', 'Computer Science', 2147483647),
(15, 'IFRAH HIRSI', 'ifrah123', '$5$rounds=535000$uNvACf4W6beKWCw.$/bMzFAOYdtgomaiFt0FTVjTlnOytPrwrxFJeyu2QVA2', '10-06-2000', 'IFKA123@gmail.com', 'Helsinki', 'English', 'Computer Science', 2147483647),
(16, 'muneer ', 'muneer123', '$5$rounds=535000$cPcRpb61r4ddC.L0$Q2WAokjIg/P5/cF63Ei7EsHoUzUZ7h9IVuU8hvMYIz0', '10-06-2000', 'muneer@gmail.com', 'Mysore', 'Msc', 'Computer Science', 2147483647);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
