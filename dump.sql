--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
INSERT INTO `file` (`file_id`,`name`,`mime_type`,`key`,`url`)
VALUES (1,'photo1','image/png','some-file-key1','https://example1.com'),
(2,'photo2','image/png','some-file-key2','https://example2.com'),
(3,'photo3','image/jpeg','some-file-key3','https://example3.com'),
(4,'photo4','image/png','some-file-key4','https://example4.com'),
(5,'photo5','image/jpeg','some-file-key5','https://example5.com');
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`,`username`,`first_name`,`last_name`,`avatar_id`)
VALUES (1,'johndoe','John','Doe',1),
(2,'jimsmith','Jim','Smith',null),
(3,'sarawilson','Sara','Wilson',null),
(4,'bobjohnson','Bob','Johnson',4),
(5,'amywilliams','Amy','Williams',3);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `user_login`
--

LOCK TABLES `user_login` WRITE;
/*!40000 ALTER TABLE `user_login` DISABLE KEYS */;
INSERT INTO `user_login` (`user_id`,`email`,`password`)
VALUES (1,'johndoe@example.com','password1'),
(2,'jimsmith@example.com','password2'),
(3,'sarawilson@example.com','password3'),
(4,'bobjohnson@example.com','password4'),
(5,'amywilliams@example.com','password5');
/*!40000 ALTER TABLE `user_login` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`country_id`,`name`)
VALUES (1,'UK'),(2,'Spain'),(3,'Australia'),(4,'France'),(5,'Japan'),(6,'USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` (`person_id`,`first_name`,`last_name`,`date_of_birth`,`gender`,`country_id`,`main_photo_id`)
VALUES (1,'Liam','Johnson','1995-12-20','MALE',1,3),
(2,'Emma','Wilson','1999-05-25','FEMALE',2,2),
(3,'Noah','Martinez','1994-04-02','NOT_SPECIFIED',2,3),
(4,'Olivia','Brown','1998-07-14','FEMALE',3,null),
(5,'Mia','Davis','2001-11-11','NOT_SPECIFIED',4,1),
(6,'Chris','Williams','1982-09-08','MALE',5,5),
(7,'Alice','Johnson','1990-01-01','FEMALE',6,2),
(8,'Sam','Smith','1985-03-12','MALE',6,null);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `person_detail`
--

LOCK TABLES `person_detail` WRITE;
/*!40000 ALTER TABLE `person_detail` DISABLE KEYS */;
INSERT INTO `person_detail` (`person_id`,`biography`)
VALUES (2,'This is a short user bio...'),
(5,'Another short user bio...'),
(6,'This user has pretty simple bio...');
/*!40000 ALTER TABLE `person_detail` ENABLE KEYS */;
UNLOCK TABLES;
  

--
-- Dumping data for table `person_photo`
--

LOCK TABLES `person_photo` WRITE;
/*!40000 ALTER TABLE `person_photo` DISABLE KEYS */;
INSERT INTO `person_photo` (`person_id`,`photo_id`)
VALUES (1,1),(1,2),(3,3),(4,3),(4,5),(7,2);
/*!40000 ALTER TABLE `person_photo` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` (`movie_id`,`director_id`,`country_id`,`title`,`budget`,`release_date`,`duration`,`poster_id`)
VALUES (1,4,1,'The Godfather',1200000,'2023-01-06','03:34:45',4),
(2,5,4,'The Dark Knight',550000,null,'02:29:31',null),
(3,2,5,'The Lord of the Rings: The Return of the King',1350000,'2015-11-02','03:26:01',2),
(4,2,5,'he Lord of the Rings: The Fellowship of the Ring',1750000,'2017-07-21',null,2),
(5,1,1,'Forrest Gump',null,'1999-08-29',null,1),
(6,2,2,'Inception',2800000,'2024-12-04','01:59:36',3),
(7,5,3,'Fight Club',980000,'2022-03-19','02:11:14',5);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `movie_detail`
--

LOCK TABLES `movie_detail` WRITE;
/*!40000 ALTER TABLE `movie_detail` DISABLE KEYS */;
INSERT INTO `movie_detail` (`movie_id`,`description`)
VALUES (1,'This is a short movie description...'),
(3,'Another short movie description...'),
(6,'Another looooooooooooooooong movie description...'),
(7,'This movie has pretty simple description...');
/*!40000 ALTER TABLE `movie_detail` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` (`genre_id`,`name`)
VALUES (1,'comedy'),(2,'drama'),(3,'thriller'),(4,'horror'),(5,'crime'),(6,'fantazy'),(7,'action');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` (`movie_id`,`genre_id`)
VALUES (1,2),(1,5),(2,3),(3,6),(5,2),(6,3),(6,7),(7,3);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
INSERT INTO `character` (`character_id`,`name`,`role`)
VALUES (1,'Joker','SUPPORTING'),(2,'Forrest Gump','LEADING'),(3,'Batman','LEADING'),(4,'Gollum','BACKGROUND'),(5,'Gollum','SUPPORTING');
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `character_detail`
--

LOCK TABLES `character_detail` WRITE;
/*!40000 ALTER TABLE `character_detail` DISABLE KEYS */;
INSERT INTO `character_detail` (`character_id`,`description`)
VALUES (1,'This is Joker description'),(2,'This is Forrest Gump description'),(3,'This is Batman description'),(4,'This is Gollum description');
/*!40000 ALTER TABLE `character_detail` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `movie_actor`
--

LOCK TABLES `movie_actor` WRITE;
/*!40000 ALTER TABLE `movie_actor` DISABLE KEYS */;
INSERT INTO `movie_actor` (`movie_id`,`person_id`,`character_id`)
VALUES (1,4,null),(2,1,1),(2,2,3),(3,1,4),(3,3,null),(3,4,null),(4,4,5),(5,2,2),(5,3,null),(7,5,null);
/*!40000 ALTER TABLE `movie_actor` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `movie_character`
--

LOCK TABLES `movie_character` WRITE;
/*!40000 ALTER TABLE `movie_character` DISABLE KEYS */;
INSERT INTO `movie_character` (`movie_id`,`character_id`)
VALUES (2,1),(5,2),(2,3),(3,4),(4,4);
/*!40000 ALTER TABLE `movie_character` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Dumping data for table `favorite_movie`
--

LOCK TABLES `favorite_movie` WRITE;
/*!40000 ALTER TABLE `favorite_movie` DISABLE KEYS */;
INSERT INTO `favorite_movie` (`movie_id`,`user_id`)
VALUES (2,1),(3,1),(6,1),(6,2),(3,3),(4,3),(1,5),(4,5),(5,5),(7,5);
/*!40000 ALTER TABLE `favorite_movie` ENABLE KEYS */;
UNLOCK TABLES;