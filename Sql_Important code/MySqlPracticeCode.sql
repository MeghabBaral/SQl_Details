DROP DATABASE IF EXISTS `Practice`;
CREATE DATABASE `Practice`;
USE `Practice`;
CREATE TABLE `Subjects` (
  `Subject_id` int(11) NOT NULL,
  `Subject_Name` varchar(50) NOT NULL,
  `Professor` varchar(50) NOT NULL,
  PRIMARY KEY (`Subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Subjects` VALUES (1,'DataBase Management','Dr.Aryal');
INSERT INTO `Subjects` VALUES (2,'Advance Programming','Dr.Ying');
INSERT INTO `Subjects` VALUES (3,'Data Mining','Dr.Willson');
INSERT INTO `Subjects` VALUES (4,'Machine Learning','Dr.Baral');
INSERT INTO `Subjects` VALUES (5,'User Interface Design','Dr.Bakri');

CREATE TABLE `Students` (
  `Student_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `Subject_id` int(11) NOT NULL,
  PRIMARY KEY (`Student_id`),
  KEY `fk_Students_Subjects_idx` (`Subject_id`),
  CONSTRAINT `fk_Students_Subjects_idx` FOREIGN KEY (`Subject_id`) REFERENCES `Subjects` (`Subject_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `Students` VALUES (37270,'Yovonnda','Magrannell',5);
INSERT INTO `Students` VALUES (33391,'D\'arcy','Nortunen',1);
INSERT INTO `Students` VALUES (37851,'Sayer','Matterson',1);
INSERT INTO `Students` VALUES (40448,'Mindy','Crissil',1);
INSERT INTO `Students` VALUES (56274,'Keriann','Alloisi',1);

CREATE VIEW College
AS 
SELECT a.Subject_id,Subject_Name,Professor,Student_id,first_name,last_name
FROM Subjects as a
join Students as b
on a.Subject_id=b.Subject_id





