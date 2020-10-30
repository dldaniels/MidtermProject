-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema beerhounddb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `beerhounddb` ;

-- -----------------------------------------------------
-- Schema beerhounddb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `beerhounddb` DEFAULT CHARACTER SET utf8 ;
USE `beerhounddb` ;

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NULL,
  `address_id` INT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `brewery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brewery` ;

CREATE TABLE IF NOT EXISTS `brewery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_brewery_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_brewery_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer` ;

CREATE TABLE IF NOT EXISTS `beer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `alcohol_content` DECIMAL NULL,
  `brewery_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beer_brewery1_idx` (`brewery_id` ASC),
  CONSTRAINT `fk_beer_brewery1`
    FOREIGN KEY (`brewery_id`)
    REFERENCES `brewery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bar` ;

CREATE TABLE IF NOT EXISTS `bar` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `website` VARCHAR(45) NULL,
  `description` LONGTEXT NULL,
  `address_id` INT NULL,
  `time_last_updated` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bar_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_bar_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `price` ;

CREATE TABLE IF NOT EXISTS `price` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `beer_price` DECIMAL NULL,
  `bar_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_price_bar1_idx` (`bar_id` ASC),
  INDEX `fk_price_beer1_idx` (`beer_id` ASC),
  CONSTRAINT `fk_price_bar1`
    FOREIGN KEY (`bar_id`)
    REFERENCES `bar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_price_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_rating` ;

CREATE TABLE IF NOT EXISTS `beer_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `star_rating` INT NULL,
  `review` LONGTEXT NULL,
  `beer_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beer_rating_beer1_idx` (`beer_id` ASC),
  INDEX `fk_beer_rating_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_beer_rating_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bar_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bar_rating` ;

CREATE TABLE IF NOT EXISTS `bar_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `star_rating` INT NULL,
  `review` LONGTEXT NULL,
  `bar_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bar_rating_bar1_idx` (`bar_id` ASC),
  INDEX `fk_bar_rating_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_bar_rating_bar1`
    FOREIGN KEY (`bar_id`)
    REFERENCES `bar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bar_rating_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS beerhounduser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'beerhounduser'@'localhost' IDENTIFIED BY 'beerhounduser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'beerhounduser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, 'address', 'denver', 'CO', 80221);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `name`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `brewery`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `brewery` (`id`, `name`, `address_id`) VALUES (1, 'Test Brewery', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `beer` (`id`, `name`, `type`, `alcohol_content`, `brewery_id`) VALUES (1, 'Test Beer', 'Some Type', 5.2, 1);
INSERT INTO `beer` (`id`, `name`, `type`, `alcohol_content`, `brewery_id`) VALUES (2, NULL, NULL, NULL, 1);
INSERT INTO `beer` (`id`, `name`, `type`, `alcohol_content`, `brewery_id`) VALUES (3, NULL, NULL, NULL, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bar`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`) VALUES (1, 'Some Bar', 'phone number', 'website', 'description', 1, NULL);
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`) VALUES (2, 'another bar', NULL, NULL, NULL, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `price`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `price` (`id`, `beer_price`, `bar_id`, `beer_id`) VALUES (1, 1.50, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `beer_rating` (`id`, `star_rating`, `review`, `beer_id`, `user_id`) VALUES (1, 2, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bar_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `bar_rating` (`id`, `star_rating`, `review`, `bar_id`, `user_id`) VALUES (1, 1, NULL, 1, 1);

COMMIT;

