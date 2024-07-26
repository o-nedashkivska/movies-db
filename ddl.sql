CREATE SCHEMA IF NOT EXISTS `movies-db`;
USE `movies-db`;


-- -----------------------------------------------------
-- Table `movies-db`.`file`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`file` (
  `file_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `mime_type` VARCHAR(100) NOT NULL,
  `key` TINYTEXT NOT NULL,
  `url` TINYTEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`file_id`))
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`user` (
  `user_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `avatar_id` SMALLINT UNSIGNED NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_avatar`
    FOREIGN KEY (`avatar_id`)
    REFERENCES `movies-db`.`file` (`file_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`user_login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`user_login` (
  `user_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `movies-db`.`user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`country` (
  `country_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`country_id`))
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`person` (
  `person_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `date_of_birth` DATE NULL,
  `gender` ENUM('MALE','FEMALE','NOT_SPECIFIED') NOT NULL,
  `country_id` TINYINT UNSIGNED NULL,
  `main_photo_id` SMALLINT UNSIGNED NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_person_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `movies-db`.`country` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_person_main_photo`
    FOREIGN KEY (`main_photo_id`)
    REFERENCES `movies-db`.`file` (`file_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`person_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`person_detail` (
  `person_id` SMALLINT UNSIGNED NOT NULL,
  `biography` TEXT NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`),
  CONSTRAINT `fk_person_detail_id`
    FOREIGN KEY (`person_id`)
    REFERENCES `movies-db`.`person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`person_photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`person_photo` (
  `person_id` SMALLINT UNSIGNED NOT NULL,
  `photo_id` SMALLINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`, `photo_id`),
  CONSTRAINT `fk_person_photo_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `movies-db`.`person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_person_photo_photo`
    FOREIGN KEY (`photo_id`)
    REFERENCES `movies-db`.`file` (`file_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`movie` (
  `movie_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `director_id` SMALLINT UNSIGNED NOT NULL,
  `country_id` TINYINT UNSIGNED NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `budget` DECIMAL(15,2) UNSIGNED NULL,
  `release_date` DATE NULL,
  `duration` TIME NULL,
  `poster_id` SMALLINT UNSIGNED NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `fk_movie_country`
    FOREIGN KEY (`country_id`)
    REFERENCES `movies-db`.`country` (`country_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_director`
    FOREIGN KEY (`director_id`)
    REFERENCES `movies-db`.`person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_poster`
    FOREIGN KEY (`poster_id`)
    REFERENCES `movies-db`.`file` (`file_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`movie_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`movie_detail` (
  `movie_id` SMALLINT UNSIGNED NOT NULL,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`movie_id`),
  CONSTRAINT `fk_movie_detail_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies-db`.`movie` (`movie_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`genre` (
  `genre_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`genre_id`))
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`movie_genre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`movie_genre` (
  `movie_id` SMALLINT UNSIGNED NOT NULL,
  `genre_id` TINYINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`movie_id`, `genre_id`),
  CONSTRAINT `fk_movie_genre_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies-db`.`movie` (`movie_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_genre_genre`
    FOREIGN KEY (`genre_id`)
    REFERENCES `movies-db`.`genre` (`genre_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`character` (
  `character_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `role` ENUM('LEADING','SUPPORTING','BACKGROUND') NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`character_id`))
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`character_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`character_detail` (
  `character_id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` TEXT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`character_id`),
  CONSTRAINT `fk_character_detail_character`
    FOREIGN KEY (`character_id`)
    REFERENCES `movies-db`.`character` (`character_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`movie_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`movie_actor` (
  `movie_id` SMALLINT UNSIGNED NOT NULL,
  `person_id` SMALLINT UNSIGNED NOT NULL,
  `character_id` SMALLINT UNSIGNED NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`movie_id`, `person_id`),
  CONSTRAINT `fk_movie_actor_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies-db`.`movie` (`movie_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_actor_person`
    FOREIGN KEY (`person_id`)
    REFERENCES `movies-db`.`person` (`person_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_actor_character`
    FOREIGN KEY (`character_id`)
    REFERENCES `movies-db`.`character` (`character_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`movie_character`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`movie_character` (
  `movie_id` SMALLINT UNSIGNED NOT NULL,
  `character_id` SMALLINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`movie_id`, `character_id`),
  CONSTRAINT `fk_movie_character_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies-db`.`movie` (`movie_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_movie_character_character`
    FOREIGN KEY (`character_id`)
    REFERENCES `movies-db`.`character` (`character_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;


-- -----------------------------------------------------
-- Table `movies-db`.`favorite_movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movies-db`.`favorite_movie` (
  `movie_id` SMALLINT UNSIGNED NOT NULL,
  `user_id` SMALLINT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`movie_id`, `user_id`),
  CONSTRAINT `fk_favorite_movie_movie`
    FOREIGN KEY (`movie_id`)
    REFERENCES `movies-db`.`movie` (`movie_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_favorite_movie_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `movies-db`.`user` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE=INNODB;