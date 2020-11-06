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
  `state` CHAR(2) NULL,
  `zip` VARCHAR(45) NULL,
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
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `biography` VARCHAR(5000) NULL,
  `image` VARCHAR(5000) NULL,
  `create_date` DATETIME NULL,
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
  `brewery_website` VARCHAR(5000) NULL,
  `brewery_logo_url` LONGTEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_brewery_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_brewery_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type_of_beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type_of_beer` ;

CREATE TABLE IF NOT EXISTS `type_of_beer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type_description` TEXT NULL,
  `type_name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer` ;

CREATE TABLE IF NOT EXISTS `beer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `alcohol_content` DECIMAL NULL,
  `brewery_id` INT NULL,
  `type_of_beer_id` INT NULL,
  `image_url` LONGTEXT NULL,
  `description` LONGTEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beer_brewery1_idx` (`brewery_id` ASC),
  INDEX `fk_beer_type_of_beer1_idx` (`type_of_beer_id` ASC),
  CONSTRAINT `fk_beer_brewery1`
    FOREIGN KEY (`brewery_id`)
    REFERENCES `brewery` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beer_type_of_beer1`
    FOREIGN KEY (`type_of_beer_id`)
    REFERENCES `type_of_beer` (`id`)
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
  `website` VARCHAR(5000) NULL,
  `description` LONGTEXT NULL,
  `address_id` INT NULL,
  `time_last_updated` DATETIME NULL,
  `owner_id` INT NULL,
  `logo_url` LONGTEXT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_bar_address1_idx` (`address_id` ASC),
  INDEX `fk_bar_user1_idx` (`owner_id` ASC),
  CONSTRAINT `fk_bar_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bar_user1`
    FOREIGN KEY (`owner_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beer_price`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beer_price` ;

CREATE TABLE IF NOT EXISTS `beer_price` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `beer_price` DECIMAL NULL,
  `bar_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  `size_price` DOUBLE NULL,
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
  `rating_date` DATETIME NULL,
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
  `rating_date` DATETIME NULL,
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


-- -----------------------------------------------------
-- Table `user_has_bar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_bar` ;

CREATE TABLE IF NOT EXISTS `user_has_bar` (
  `user_id` INT NOT NULL,
  `bar_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `bar_id`),
  INDEX `fk_user_has_bar_bar1_idx` (`bar_id` ASC),
  INDEX `fk_user_has_bar_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_bar_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_bar_bar1`
    FOREIGN KEY (`bar_id`)
    REFERENCES `bar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_has_beer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_has_beer` ;

CREATE TABLE IF NOT EXISTS `user_has_beer` (
  `user_id` INT NOT NULL,
  `beer_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `beer_id`),
  INDEX `fk_user_has_beer_beer1_idx` (`beer_id` ASC),
  INDEX `fk_user_has_beer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_beer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_beer_beer1`
    FOREIGN KEY (`beer_id`)
    REFERENCES `beer` (`id`)
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, '189 S Washington st.', 'Denver', 'CO', '80221');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (2, '3040 Teller St. ', 'Wheat Ridge ', 'CO', '80033');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (3, '1939 88th ave', 'Westminster', 'CO', '80229');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (4, '1739 S. Crimson ct.', 'Littleton', 'CO', '80225');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (5, '1919 E. Juniper dr.', 'Aurora', 'CO', '80099');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (6, '1444 W 36th ave', 'Denver', 'CO', '80212');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (7, '225 Girard St. ', 'Durango', 'CO', '81303');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (8, '301 E. Simpson St. ', 'Lafayette', 'CO', '80026');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (9, '5265 Wadsworth Bypass', 'Arvada', 'CO', '80002');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (10, '7605 W 44th Ave unit f', 'Wheat Ridge', 'CO', '80033');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (11, '7000 W 38th Ave', 'Wheat Ridge', 'CO', '80033');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (12, '846 Broadway', 'Denver', 'CO', '80203');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (13, '980 Grant St', 'Denver', 'CO', '80203');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (14, '1946 Market St', 'Denver', 'CO', '80202');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (15, '1925 Blake St.', 'Denver', 'CO', '80202');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (16, '5515 Vance St', 'Arvada', 'CO', '80002');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (17, '6995 W 38th. Ave.', 'Wheat Ridge', 'CO', '80033');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (18, '7514 Grandview Ave.', 'Arvada', 'CO', '80002');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (19, '4910 Nautilus Ct', 'Boulder', 'CO', '80301');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (20, '3000 Main Ave.', 'Durango', 'CO', '81301');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (21, '4607 Wedgewood BLVD.', 'Frederick', 'MD', '21703');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (22, '2201 Arapahoe St. ', 'Denver', 'CO', '80205');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (23, '1265 Boston Ave', 'Longmont', 'CO', '80501');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (24, '800 East Lincoln Avenue', 'Fort Collins', 'CO', '80524');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (25, '1640 S Sunset St.', 'Longmont', 'CO', '80501');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (26, '2920 Larimer St.', 'Denver', 'CO', '80205');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (27, '801 East Second Ave.', 'Durango', 'CO', '81301');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (28, '156 Society DR. ', 'Telluride', 'CO', '81435');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (29, '475 Grand Ave.', 'Del Norte', 'CO', '81132');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (30, '1401 Miner St', 'Idaho Springs', 'CO', '80452');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (31, '1898 S Flatiron Court', 'Boulder ', 'CO', '80301');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (32, '10051 W 48th. Ave', 'Wheat Ridge', 'CO', '80033');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (33, '1111 Lincoln St', 'Denver', 'CO', '80203');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (34, '1101 S Pearl St', 'Denver', 'CO', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (35, '4395 Yates St', 'Denver', 'CO', '80212');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (36, '2219 W 32nd Ave', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (37, '3480 Park Ave W.', 'Denver', 'CO', '80216');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (38, '4275 Tennyson St.', 'Denver', 'CO', '80212');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (39, '2301 Blake St.', 'Denver', 'CO', '80205');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (40, '2017 S University Blvd', 'Denver', 'CO', '80210');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `zip`) VALUES (41, '8025 W Bowles Ave.', 'Littleton', 'CO', '80123');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `biography`, `image`, `create_date`) VALUES (1, 'admin', 'admin', 1, 'ADMIN', 1, 'Adam', 'Adminson', 'adam@admin.com', 'Adam Adminson is an Admin', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `biography`, `image`, `create_date`) VALUES (2, 'ladiesman029', 'password', 1, 'user', 2, 'Bob', 'Johnson', 'bobJohnson@gmail.com', 'Bob Johnson likes to drink beer ', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `biography`, `image`, `create_date`) VALUES (3, 'bmc1999', 'password', 1, 'user', 3, 'Big', 'McLargehuge', 'ILiftBro@yahoo.com', 'When Big is drinking beer he is found in the gym with his bros lifting and working on his swole pecs', NULL, NULL);
INSERT INTO `user` (`id`, `username`, `password`, `enabled`, `role`, `address_id`, `first_name`, `last_name`, `email`, `biography`, `image`, `create_date`) VALUES (4, 'bhc2000', 'password', 1, 'user', 4, 'Blast', 'HardCheese', 'bhardcheese@yahoo.com', 'Blast Hardcheese is a fun guy that enjoys raising chickens and pack burrow racing.', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `brewery`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (1, 'Ska Brewing', 7, 'https://skabrewing.com/', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQYFoRYV_TB4tyXE4GOh06O1lOXx-LfgmWcIw&usqp=CAU');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (2, 'Odd13 Brewing', 8, 'http://www.odd13brewing.com/', 'data:image/jpeg;base64,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');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (3, 'Avery Brewing ', 19, 'https://www.averybrewing.com/', 'https://d2pxm94gkd1wuq.cloudfront.net/BreweryLogos/Standard/794173726.avery.a.logo.whitecircle.png');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (4, 'Durango Brewing Company', 20, 'http://www.durangobrewing.com/', 'http://www.durangobrewing.com/Images/DBC_LandingPage.jpg');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (5, 'Flying Dog Brewery', 21, 'https://www.flyingdog.com/', 'https://www.flyingdog.com/static/images/global/fd-logo-text.png');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (6, 'Great Divide Brewing Company', 22, 'https://greatdivide.com/', 'https://greatdivide.com/wp-content/uploads/2016/06/great-divide-logo.jpg');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (7, 'Left Hand Brewing Company', 23, 'https://www.lefthandbrewing.com/', 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f5/Left_Hand_Logo.jpg/170px-Left_Hand_Logo.jpg');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (8, 'Odell Brewing Company', 24, 'https://www.odellbrewing.com/', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/33/Odell_Brewing_Company_logo.png/170px-Odell_Brewing_Company_logo.png');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (9, 'Oskar Blues Brewery', 25, 'https://www.oskarblues.com/', 'https://upload.wikimedia.org/wikipedia/en/thumb/7/77/Oskar_Blues_Brewery_logo.png/220px-Oskar_Blues_Brewery_logo.png');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (10, 'Ratio Beerworks', 26, 'http://ratiobeerworks.com/', 'https://d2pxm94gkd1wuq.cloudfront.net/BreweryLogos/Standard/9305.ratio-beerworks.jpg');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (11, 'Steamworks Brewing Company', 27, 'https://steamworksbrewing.com/', 'https://downtowndurango.org/uploads/thumbs/St_9076_SW_Corplogo_COFlagback_2015.png');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (12, 'Telluride Brewing Company', 28, 'https://www.telluridebrewingco.com/', 'https://static.wixstatic.com/media/772018_51be7baace854bf9b86336c063a2f403~mv2_d_2283_1501_s_2.png/v1/fill/w_183,h_120,al_c,q_85,usm_0.66_1.00_0.01/TBC-logo.webp');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (13, 'Three Barrel Brewing Company', 29, 'https://www.threebarrelbrew.com/', 'https://static.wixstatic.com/media/6840b4_3dbe7a44c0ef4530b8132ec2b896b68b~mv2.png/v1/fill/w_351,h_299,al_c,q_85,usm_0.66_1.00_0.01/ThreeBarrelBadge.webp');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (14, 'Tommy Knocker Brewery', 30, 'https://tommyknocker.com/', 'https://utfb-images.untappd.com/WoSUzpByGhKNsv3jJ2TTSZAG?auto=compress');
INSERT INTO `brewery` (`id`, `name`, `address_id`, `brewery_website`, `brewery_logo_url`) VALUES (15, 'Upslope Brewing Company', 31, 'https://www.upslopebrewing.com/#', 'https://upload.wikimedia.org/wikipedia/en/thumb/6/60/Upslope_Brewing_Company_logo.jpg/160px-Upslope_Brewing_Company_logo.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `type_of_beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (1, 'Lager', 'American Lager');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (2, 'IPA', 'IPA-English');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (3, 'IPA-American', 'IPA-American');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (4, 'Lager-American Light', 'Lager-American Light');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (5, 'IPA-Session / India Session Ale', 'IPA-Session / India Session Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (6, 'Red Ale- American Amber / Red', 'American Amber / Red-Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (7, 'Blonde Ale', 'Blonde Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (8, 'IPA - Imperial / Double', 'IPA - Imperial / Double');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (9, 'Stout - Milk / Sweet ', 'Milk Stout');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (10, 'Brown Ale', 'Brown Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (11, 'IPA - Hazy', 'IPA - Hazy');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (12, 'Belgian Style Ale', 'Belgian Style Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (13, '', 'Pilsner');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (14, NULL, 'Wheat Beer');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (15, NULL, 'Dark Lager');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (16, NULL, 'Stout');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (17, NULL, 'Porter');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (18, NULL, 'Oatmeal Stout');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (19, NULL, 'Irish Dry Stout');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (20, NULL, 'Specialty Beer');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (21, NULL, 'Wild & Sour Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (22, NULL, 'Other');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (1, 'Modus Hoperandi', 6.8, 1, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxDe05BJsaeMEk2wUuwGVGs8S1CR-j0zdwpA&usqp=CAU', 'An American-style India Pale Ale with a deep golden-orange color. Bitter and hoppy, with a surprisingly smooth finish.\n');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (2, 'Modus Mandarina', 6.8, 1, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRsWKa5nkrJr0YW5f2zbj_GjzJdoe03jBUzOw&usqp=CAU', 'A unique twist on Modus Hoperandi, this citrus IPA is dry-hopped with a generous portion of Mandarina Bavaria hops and brewed with sweet orange peels.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (3, 'Pinstripe Red Ale', 5.2, 1, 6, 'https://untappd.akamaized.net/site/beer_logos/beer-9477_48271_sm.jpeg', 'Waterfalls of Pinstripe Red Ale. Brewed with caramel malts and Liberty hops, it has a slight fruity finish and will dance with your tastebuds till last call, then take them home and not get weird about it the next day');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (4, 'True Blonde Ale', 5.3, 1, 7, 'https://untappd.akamaized.net/site/beer_logos/beer-8501_c9c22_sm.jpeg', 'The taste is mildly sweet from the use of local honey, followed by bready malts, a touch of tangy wheat, a pleasantly mild bitterness, and citrus hop flavors in the end.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (5, 'Mexican Logger', 5.2, 1, 4, 'https://untappd.akamaized.net/site/beer_logos/beer-30647_32ec7_sm.jpeg', 'The perfect Mexican Lager. Light and refreshing, it really hits the spot after a long day of brutal chainsaw work.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (6, 'Decadent Imperial IPA', 10.0, 1, 8, 'https://untappd.akamaized.net/site/beer_logos/beer-12522_5520d_sm.jpeg', 'The flavors of bitter grapefruit and caramel-like sweetness smack the taste buds, but there is plenty of bitterness throughout. There is just the right amount of finishing hops and carbonation to set you up for the next round.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (7, 'Rudie Session IPA', 4.5, 1, 5, 'https://untappd.akamaized.net/site/beer_logos/beer-731757_58883_sm.jpeg', 'A brew you can drink for breakfast. A beer to reward yourself with after a hard day’s work. or if your hard day’s work is mowing the lawn, consider drinking on the job');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (8, 'Steel Toe Stout', 5.4, 1, 9, 'https://untappd.akamaized.net/site/beer_logos/beer-5439_dc879_sm.jpeg', 'This traditional English Cream Stout is brewed with actual milk sugar to create a creamy and sweet brew. Jet-black in color, the latte frothy head will make you mooo for more.\n\n');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (9, 'Buster Nut Brown', 5.3, 1, 10, 'https://untappd.akamaized.net/site/beer_logos/beer-6734_a42e7_sm.jpeg', 'This Brown Ale has a touch of nuttiness provided by our good friends Mr. and Mrs. Victory and Munich Malt. The addition of Northern Brewer, Cascade, and Willamette hops smooth this beer out to create an incredibly drinkable Brown Ale.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (10, 'Codename: Superfan', 6.5, 2, 3, 'https://lh3.googleusercontent.com/JWv5rpzfhTadv2plM5hTVbkmJJ7hda5cZCE8Au5V0iLS62UkFqnSJRtZBI6LXOwUFPDs3415OCeiyQVmf59_-5sHenizLdQlBV45oRb8bp1rzPrw0K-j7SGPtjXMru3j6cUUpRbOTO1ziIvaPQJRnzk0IXemWCvnv_y3fWQnsiolD9a_5A14diLTm0zfPGWZl-R9qCvU3wuKl48suxROBto2KUInSGGkeIr9HpAJ5TAX9ZHDmdcfoZIz0ZZS2fh426O8GdwfOD04v7pVB81YxnT_bS4ZyJ6weY6lmo0-yuZMd4pnRh_GaFH23c2eifwRpYnngpHRdUDTQRIj81LoOVY7BZeylJfQn_qfp9hdnnrDAIzV5Ukd4ZOCuoCeHkkNMRQpyZPw1WEC_92FrXYIkxSgTNPRs_teMcIRcvJilqkcAkKAZcKjFtZeO4D41_alRphklAoSCgCUdq1WlNaci4VqJhfbhDv6KFmE4q2HlKVUTCz6mon14zev1m-E8QvxALrv9WyMqfs92ApWBHfYBPb36rKxKlTQewNktBzngLRjRweEqM8njLXbVfhq2RAoUXm9bZ0atJ2hhizN2hlT_Sxqp0vyD20N4a4VciXM0G3rE-ngBgoxUDR2ng23MgQL3ueJFiU9t5Q28_WwBlj4zuvZAB8jqVTfn5FefYLX5iHdwFo-hTUhpD54=w1000-no', 'Codename: Superfan is a deliciously modern take on the American IPA style, brewed with a variety of juicy American hops from the Pacific Northwest.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (11, 'Intergalactic Juice Hunter', 8.0, 2, 8, 'https://lh3.googleusercontent.com/PkrTf9oFebCz_kE-YjoMHpQ0ahHi210QrbbdPN4Zbi9UtUiELLpLvKA9vgENujpk3t9fpy2e4a97fu7j-oTIA-bBKNtgEUd4DFXuXtlwCpqcqHevd_rZdFDkdWEKd5ukK18BS5gBo3YVvYcZEl99zO0oz9h__nOqJDBDVzn0PGVe41CqKRyJE322MdfB55PeSqEbro3tGf0ozb4AlhCx7Ne5ZGP109CEbLP44w7fCq7uEqWyu9uFSDAPxtCsZDJrrbGbFbdtudM2my_mT5Gbw5Nfpfur9lFSbYHSyyQnZVT0-mFD5N5mqDPJH3E3beElYZd6nVe2gjHlSuxCRmKc2T8rblrsoOv1AMMdlcpw67d2_4mNkTaHu5bgLS3Um46LQDWMRQJ0kr9nMZEhhwtN64hIL6-72g0DyFCEenbvMri9CF4r58SoNfqBN42-94tKqHJdfwu63qvi66eCn_V63X6B4HZQjuZX1gNz7glqNhw5Ly2e0q9u18reAokmfSSWEi9YDF3ozLygPoEasGdFm_-krKvc4lmhAshoLcpu-DWJ0wjQh0gXv7MCWRE55oX4SIF7A9pxrYIDSyFDAuXOqT2bd_FeX7NY7tqFdg7BnBN0yIzrLg7bnh-jZ6-vCEW8-yFBrwnzpalH_Rw8lqYv-SUaJA8VRRkVHigvzZeN6ZppIF00cWGSIOpS=w1000-no', 'Boldly juicing where no one has juiced before, Odd13 Brewing goes intergalactic with an Imperial New England-styled IPA with the hops of Simcoe, Galaxy and Amarillo along with the smoothie touch of milk sugars for extra body, flavor and smoothness.\n\nCast in a pastel gold and a dull matte finish, the opaque Intergalactic Juice Hunter draws in the senses with a billowing scent of herbal tea, tropical fruit, berry, orchard fruit, citrus and fragrant grasses. With a rich and malty introduction, the cereal laden upstart is creamy with wheat, honey smacks and pastry dough.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (12, 'Colorado Kid', 7.2, 2, 11, 'https://lh3.googleusercontent.com/P12ibRmDlNYGhVmXZB_7w1yi6e-QTaFyBMFR2wrksnUdiZd86ll4ZRt1lwf1iS8ksWchYvbj498cnp1ij7rLJ31M--u0nGnyRm1u5PObJ1KtrNOCFldSAFPaVsvMtnD1Ltbn01OAr_zeHGdO666bUaZ67lkpk6j703CX-LO8ZMa6z4A5nyRXWys7yx6bzwtfMJQpAo7aFlKblJlMdtr0VNsqGKuYlaUvoe5V5uyZsXJUicew4ybES4foMpQAJ32P8g8WHSx75DUzoAYlcpDe0-7JT3AHCy7-4N9RMxveqb42g44ln0CuYj3gRY0ErWKOkqWvRww0wjt1MrhIbgpePnVlU_Yvct686upcfLGUHigVOAUknZRPJaAPNhHWPCDO5l82NxMTy57gLCinqzdOpJeAwknoq-vWWuS9Hcdc0rF4jved7uL4SRu_DarfE2DoJGUcC2kyqq0tW61Iqxx01_6eSb-knU7EIgjTvunnF99jqTx-UWiDjXInbhjt_-n7gauAJVYVPLHzgvtYD8fTN0sXtaijxsSpIQ4-5xMPyhv4TFZpxm_hEZvfMxxwLc-GjigDIaNMUtVhCJ9RMkxzwo0mIS7A-KyLtUmrl_Bxtto7uLSw2v-LQIe2qSyDoccRLdxxz7WhOElDCHZMhKcdOrlrpUfDf_aWjcTTyniRGeXyStzySBsaRNWwwM3-xFEMzWUF0pq8CBGkcAEAXJjYmbgu=w1000-no', 'Locally Sourced Hazy IPA w/ Troubadour Malts. Hopped with Cascade and Galaxy.\"\n');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (13, 'White Rascal', 5.6, 3, 12, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/11/desktop2x_1525984916_WEB_WhiteRascal_Cans_and_Glass.png', 'An authentic Belgian-style white ale, this Rascal is unfiltered and cleverly spiced with coriander and Curaçao orange peel producing a refreshingly zesty classic ale. As our flagship beer and silver medal winner of the Belgian Witbier category at the World Beer Cup 2018, we pay tribute to the history and time-honored tradition of the steadfast Belgian Witbier by brewing White Rascal with the same Belgian ingredients used by 15th century brewers from the village of Hoegaarden. The tales and images of demons are popular in Belgian folklore and we follow suit with our own White Rascal.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (14, 'Avery IPA', 6.5, 3, 2, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/10/desktop2x_1530887206_WEB_AveryIPA_Can_and_Glass.png', 'Avery IPA radiates with the crisp, floral, and resinous hoppiness of six different hop varieties, supported by a malty backbone and a dry finish. As the very first packaged IPA in the state of Colorado, this true Colorado IPA comes alive with a mountain of citrusy hops. At the time of its inception (1996), the India Pale Ale beer style was typically too bitter for many craft beer lovers, but that did not deter Adam Avery from brewing it. Oh how the times have changed, and for the better! We have honored the tradition of the original Avery India Pale Ale recipe with the continued use of 4 C hops, and have modernized it by dry-hopping with Idaho 7 and Simcoe hops. The result is a fresh and piney body with aromas of juicy citrus, all balanced by the subtle caramel sweetness of the malts. Hop Freaks Unite!');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (15, 'Ellie\'s Brown', 5.5, 3, 10, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/12/desktop2x_1531343169_Ellies_Can_and_Glass.png', 'This beautiful, deep russet brew is dominated by a chocolate and brown sugar maltiness with hints of vanilla and nuts, producing a very smooth, well-balanced, and quaffable brown ale. Originally named Elle\'s Brown Ale after Adam Avery\'s beloved chocolate lab, however one Cease and Desist letter from a certain fashion publication later, this classic American Brown Ale was renamed as Ellie. Elle didn\'t mind. Ellie\'s Brown Ale has all the characteristics of its namesake; friendly, mellow, and a little nutty. As Adam\'s best friend, she came with him to work everyday and was a steadfast companion for all his climbing adventures. Elle is missed, but she lives on in this beer as the mascot on the label.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (16, 'Avery Lager', 5.0, 3, 1, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/160/desktop2x_1538691596_WEB_AveryLager_Can_and_Glass.png', 'As a true representation of our time-honored craft, Avery Lager is clean and refreshing, with a smooth finish. We use pure Rocky Mountain water with two row and pilsner malts to create this quintessential lager. Sometimes, what seems so simple is actually the most complex. As is the case of Avery Lager, which takes 26 days to brew and perfect. This beer draws on the mastery garnered over the past two decades, as well as our German engineered brewhouse. As a true representation of our time-honored craft, Avery Lager is clean and refreshing, with a smooth finish.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (17, 'Hazyish IPA', 7.0, 3, 11, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/236/desktop2x_1553267992_WEB_HazyishIPA_Can_and_Glass.png', 'A juicy and hazy India Pale Ale with low bitterness, an expressive aroma of four different hop varieties, and a creamy mouthfeel. We wouldn\'t be Avery Brewing if we didn\'t put our own stamp on the juicy and hazy IPA style. We took all that is great in a hazy IPA; low bitterness paired with the powerful and juicy aroma of hops, and the silky sensation of the liquid, but brewed for excellent shelf stability and consistency from batch to batch.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (18, 'Maharaja IPA', 10.0, 3, 8, 'https://d1h6bqmdexfe1t.cloudfront.net/uploads/beer/bottle_image/20/desktop2x_1531343433_WEB_Maharaja_Can_and_Glass.png', 'The Maharaja flaunts his authority over a deranged amount of hops: tangy, vibrant, and intense along with an insane amount of malted barley – fashioning a dark amber hue and exquisite malt essence. Maharaja is derived from the sanskrit words mahat, meaning “great”, and rajan, meaning “king”. Much like its namesake, this Imperial IPA is regal, mighty, and dank. With citrusy hops and caramel toffee malts as his servants, he rules both with a heavy hand. Don\'t be fooled by unassuming drinkability, this beer is potent. Welcome to his kingdom!');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (19, 'Colorado Kölsch', 4.8, 11, 22, 'https://products0.imgix.drizly.com/ci-steamworks-colorado-kolsch-ale-7f0f8539e5f49704.jpeg?auto=format%2Ccompress&fm=jpg&q=20', 'The Colorado Kölsch is a derivative of the German Kölsch. It is a light and crisp ale with a hint of fruitiness. Available in 6-packs. ABV 4.8, IBU 16.1, SRM 3.4');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (20, 'Third Eye P.A', 6.4, 11, 3, 'https://cdn.beeradvocate.com/im/c_beer_image.gif', 'A pale ale with a strong malt backbone to balance a large hop bill which lends to spicy and citrus qualities');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (21, 'Lizard Head Red', 5.6, 11, 6, 'data:image/jpeg;base64,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', 'This is a medium-bodied brew with a nice hop balance that is dark red in color. Munich and caramel malts are used to produce the complex malt character.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (22, 'Backside Stout', 6.2, 11, 9, 'data:image/jpeg;base64,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', 'The Stout has an extremely complex malt and oat flavor; sweet with chocolate and roast overtones. The addition of a healthy amount of brewer\'s oats is detectable in the smooth, silky, finish');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (23, 'Ale Diablo', 8.5, 11, 12, 'https://cdn.beeradvocate.com/im/c_beer_image.gif', 'This Belgian Strong Golden Ale features a highly complex flavor profile. The addition of Riesling wine must and Belgian yeast brings forward hints of clove and fall fruit flavors, it hides it\'s high alcohol content well');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (24, 'Four Corners Pale Ale', 6.0, 4, 3, 'http://www.durangobrewing.com/Images/Beer%20Bottles/Year%20Round/DBC_Beer_FCPaleAle_2.png', 'Touches of pine, gentle citrus, and floral hints define the Durango Pale Ale. Engaging and always drinkable, smooth and rich pale malts blend with subtle hops for a well-balanced pale ale. Inspiring sun-lounging and meandering strolls along the lake, the Durango Pale Ale is destined for a simple kind of adventure.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (25, 'Southwest Lager', 5.5, 4, 1, 'http://www.durangobrewing.com/Images/Beer%20Bottles/Year%20Round/DBC_Beer_SWLager_3.png', 'Made in the strict German tradition, we use the finest Vienna, Pilsner and Munich malts to add depth to our Southwest Lager. The noble hops provide a gentle earthy spice while the lager yeast adds a slight mineral finish. Cheers!');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (26, 'Colorado Wheat', 5.1, 4, 14, 'http://www.durangobrewing.com/Images/Beer%20Bottles/Year%20Round/DBC_Beer_Wheat_1.png', 'True to Colorado style, our wheat ale is best enjoyed under the warm rays of the sun, with a light breeze and a switchback trail underfoot. Colorado-grown wheat teams up with enticing touches of sweet orange and a delicate lemon peel finish. Sessionable and refreshing, this unfiltered ale is meant to be enjoyed outdoors');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (27, 'Oatmeal Stout', 5.0, 15, 18, 'https://www.upslopebrewing.com/wp-content/uploads/2019/04/Oatmeal-Stout_Web-72dpi_Fabien.png', 'Smooth, roasty and sessionable, our Oatmeal Stout packs full flavor and a robust body for a silky drinking experience. Brewed with oats, roasted malts and East Kent Golding hops, our stout is perfectly balanced with a full body and smooth finish.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (28, 'Citra Pale Ale', 5.8, 15, 2, 'https://www.upslopebrewing.com/wp-content/uploads/2017/04/Citra-Pale-Ale_Web-72dpi_Fabien.png', 'Prominently featuring Citra hops, our Citra Pale Ale delivers pungent grapefruit and tropical fruit aromas on the nose with a semi-dry finish. Juicy notes imparted by the hops pair with the light caramel malt character to balance this drinkable, “go-to” American Pale Ale.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (29, 'Rocky Mountain Kölsch', 5.0, 15, 22, 'https://www.upslopebrewing.com/wp-content/uploads/2018/04/Rocky-Mountain-Kolsch_Web-72dpi_Fabien.png', 'Layered in flavors inspired by the backcountry, our Rocky Mountain Kölsch merges the easy-drinking character of traditional Kölsch yeast with our innovative spin. Colorado honey, sage and Mosaic and Lemondrop hops create a bright, lemon citrus character with a touch of hops.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (30, 'Craft lager', 4.8, 15, 1, 'https://www.upslopebrewing.com/wp-content/uploads/2017/04/Craft-Lager_Web-72dpi_Fabien.png', 'Craft Lager is a premium American lager brewed entirely of malted barley. This Colorado-style session beer stands side-by-side with our family of premium ales to bring you a clean, easy, light-bodied lager for the ages. 2019 Great American Beer Festival Silver Medal winner in the ‘International-Style Pilsener’ category.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (31, 'Blood Orange IPA', 6, 14, 2, 'https://products2.imgix.drizly.com/ci-tommyknocker-blood-orange-ipa-085be333817adf1b.png?auto=format%2Ccompress&fm=jpg&q=20', 'India Pale Ale brewed with Citra, Summit, Mandarina Bavaria, Mosaic, & Chinook hops and blood orange peels');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (32, 'Maple Nut Brown Ale', 4.5, 14, 10, 'https://products1.imgix.drizly.com/ci-tommyknocker-maple-nut-brown-ale-ea33d0aff2bc36c3.jpeg?auto=format%2Ccompress&fm=jpg&q=20', 'A flavorful brown ale brewed with a touch a pure maple syrup.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (33, 'Pick Axe Pale Ale', 5.5, 14, 2, 'https://cdn.beeradvocate.com/im/beers/75231.jpg', 'Easy drinking, classic, golden pale ale brewed with Chinook, Nugget, Amarillo, Columbus, Summit, and Willamette hops');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (34, 'Mountain City Amber', 5.3, 14, 6, 'https://cdn.justwineapp.com/assets/beer/bottle/tommyknocker-brewery-mountain-city-amber_1472062851.png', 'A mountain sunset colored American style Amber Ale. Crystal & Munich malts provide a delicately sweet malt character balanced with the spice of Colorado grown hops.  This beer is a great pairing with mountain air, savory foods, and good moods');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (35, 'Bad Phil Pale Ale', 6.6, 13, 2, 'https://static.wixstatic.com/media/6840b4_383066eff29241778b6cfcfec70b5ed9~mv2.gif', 'A hop-bittered ale with more intense flavor and aroma. Stronger alcohol and semi-dry finish. Pairs with spicy foods.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (36, 'Burnt Toast', 5.6, 13, 10, 'https://static.wixstatic.com/media/6840b4_0f0fa0a45f6f449699d57925729744ed~mv2.gif', 'Lively roasted coffee aromas, slightly bitter but smooth. Dark roast, caramel, and nutty flavors. Medium alcohol, dark brown color.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (37, 'Trashy Blonde', 4.9, 13, 7, 'https://static.wixstatic.com/media/6840b4_0dc7b32a7c3449b086f5e6a97213b8ff~mv2.gif', 'Low alcohol, easy drinking, and undemanding. Pale straw color with white bread aroma and a nice foamy head. Goes nicely with anything.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (38, 'Hop Trash IPA', 7.55, 13, 2, 'https://static.wixstatic.com/media/6840b4_169ae7cce7274a22be1c085fcbeca668~mv2.gif', 'Higher alcohol and higher bitterness with intense, almost overwhelming flavor. Rounded-mouth feel finish with some floral/herbal aromas.Pairs mostly with spicy, big flavors.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (39, 'Telluride Mountain Beer', 5.2, 12, 22, 'https://d1ynl4hb5mx7r8.cloudfront.net/wp-content/uploads/2019/05/31115734/665199008.tmb3_.photo_.credit.alex_.hoskin-768x576.jpeg', 'True to the style of its hometown in Germany, this Kolsch is proof that it’s not where you’re born that matters. It’s where you end up.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (40, 'Face Down Pale Ale', 5.7, 12, 2, 'https://images.ctfassets.net/sz2xpiwl6od9/3EhVxjRoXSgcOy6iCwSCOC/0c9d1acfa5e662f4eb24e2cbea69e95b/Telluride_Face_Down_Brown_17-10-25_CBB_Issue23_reviews-020_8x10.jpg?w=900', 'Toasty malt with a bit of coffee roast. Toast and caramel with a touch of chocolate and classic West Coast hops. Grassy hops with a bit of herbal and pine. Moderate sweetness into moderate bitterness that all finishes clean and dry. Very well-balanced. A fairly hops-forward brown.”');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (41, 'Tempter IPA', 6.4, 12, 2, 'https://cdn.beeradvocate.com/im/c_beer_image.gif', 'Named after the coolest backcountry run in North America, this American style IPA is bold yet balanced. Like the run, you will be “tempted” to explore the deep flavors created by using a copious amount of bold hops…its so good it should be illegal!');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (42, 'Fishwater Double IPA', 8.5, 12, 8, 'https://beerconnoisseur.com/sites/default/files/styles/beer_page_245w/public/beer/fishwater.jpg?itok=8gR6ELui', 'https://beerconnoisseur.com/sites/default/files/styles/beer_page_245w/public/beer/fishwater.jpg?itok=8gR6ELui');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (43, 'Domestica', 4.9, 10, 7, 'https://cdn.beeradvocate.com/im/placeholder-beer.jpg', 'Domestica is inspired by the roots of American brewing and is a great introduction to craft beer. The crispness of the malt bill, low bitterness from the European style hops, and a slightly higher carbonation draws similarities to American Light Lagers.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (44, 'Hold Steady ', 7.5, 10, 20, 'https://cdn.beeradvocate.com/im/placeholder-beer.jpg', 'This dark scotch ale is a smooth drinker that carries chocolate and a subtle smokiness. Esters of raisin and dark fruit are alive throughout while ending with a mild sweetness. Complex, yet approachable, Hold Steady is our most robust flagship offering at our Denver microbrewery.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (45, 'Antidote', 7.0, 10, 2, 'https://cdn.beeradvocate.com/im/placeholder-beer.jpg', 'Our brewers have California roots so it was a no brainer to create a West Coast style IPA. We dry hop Antidote with massive amounts of Centennial and Mandarina Bavaria hops to produce a dry and bitter initial taste, and finishes with a clean, crispy malt backbone, making it one of the best microbrews in Denver.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (46, 'Repeater', 6.1, 10, 2, 'https://cdn.beeradvocate.com/im/placeholder-beer.jpg', 'Repeater is right in between a pale and an india pale ale. As a micro brewery Denver, we use the slightly roastier Munich II malt which is found in many German beers, including Oktoberfests, to balance the hop additions and make for a more appealing option if you’re not into bitter IPAs or are looking for a bit more than a pale ale.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (47, 'Dales Pale Ale', 6.5, 9, 2, 'https://www.oskarblues.com/wp-content/uploads/2018/11/Dales-Render-With-Copy-1200x1200.png', 'This voluminously hopped mutha delivers a hoppy nose and assertive-but-balanced flavors of pale malts and citrusy floral hops from start to finish. Oskar Blues launched its canning ops in 2002, brewing and hand-canning Dale’s Pale Ale in the Lyons, Colorado, brewpub. America’s first-craft-canned mountain pale is a hearty, critically acclaimed trailblazer that changed the way craft beer fiends perceive portable beer');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (48, 'Can-O-Bliss Citra Double IPA', 8.2, 9, 8, 'https://www.oskarblues.com/wp-content/uploads/2018/11/COB-DIPA_Can_Render-With-Copy-1200x1200.png', 'Double down on bliss with Can-O-Bliss IPA Series taken to a higher level of uncommon, unfiltered and unrestrained. This DIPA chock full of Citra® hops delivers a one-two punch of hop aroma and blissful flavors of passionfruit and citrus, balanced with a substantial malt backbone.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (49, 'Mama\'s Little Yellow Pils', 5.3, 9, 13, 'https://beerconnoisseur.com/sites/default/files/styles/beer_page_245w/public/beer/oskar-blues-mammas-little-yella-pils.jpg?itok=xf4VUvpm', 'Oskar Blues’ Mama’s Little Yella Pils is an uncompromising, small-batch version of the beer that made Pilsen, Czech Republic, famous. Unlike mass market “pilsners” diluted with corn & rice, Mama’s is built with 100% pale malt, German specialty malts, and Saaz hops. While its rich with Czeched-out flavor, its gentle hopping (35 IBUs) and low ABV (just 5.3%) make it a luxurious but low-dose (by Oskar Blues standards) refresher.\n\n');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (50, 'Death Before Disco', 6.0, 7, 17, 'https://9e1f107ab36932bd7899-c167113948c837617fb235faa4253299.ssl.cf2.rackcdn.com/uploads/images/original/9dd6dc1078851a78ca795e2763cf62f8.png', 'Roasted malts create a full-bodied classic with rich chocolate malt and dark berry notes');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (51, 'Galactic Cowboy Nitro', 9.0, 7, 16, 'https://9e1f107ab36932bd7899-c167113948c837617fb235faa4253299.ssl.cf2.rackcdn.com/uploads/images/original/02c42d738ee28378437b841130e7e0d9.png', 'Blast off into the stratosphere and grab a fistful of stars! Smoother than Solo and darker than the Dark Side, Galactic Cowboy is brewed for cosmic adventure. With notes of bittersweet chocolate and black coffee, this high-octane stout is the fuel you need to wrangle the universe.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (52, 'Colorful Colorado Pale Ale', 5.6, 7, 2, 'https://9e1f107ab36932bd7899-c167113948c837617fb235faa4253299.ssl.cf2.rackcdn.com/uploads/images/original/bb495b7943b64f5c45b31fbb50ef2729.png', 'Welcome to Colorful Colorado, a bold, citrusy pale ale brewed with Rocky Mountain water for all your Centennial State adventures.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (53, 'Peanut Butter Milk Stout', 6.0, 7, 9, 'https://9e1f107ab36932bd7899-c167113948c837617fb235faa4253299.ssl.cf2.rackcdn.com/uploads/images/original/fd6b6e7e634b4b572f8e09040e8fb165.png', 'Rhythm and Blues. Batman and Robin. Peanut Butter and Chocolate. These classic duos never go out of style. Enter Peanut Butter Milk Stout. We took the pure milk chocolate bliss of our classic Milk Stout and added peanut buttery goodness. It’s like an adult peanut butter cup you can drink. It’s rich and decadent on the palate and lusciously lingers into a nutty, dry finish. A perfect pair you’ll want to share.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (54, '90 Schilling Ale', 5.3, 8, 6, 'https://www.odellbrewing.com/wp-content/uploads/2020/04/90-Shilling-ProductCrops-e1588041326994.png', '90 Shilling is our smooth and complex flagship beer. A medium-bodied amber ale with a distinct burnished copper color and a deeply pleasant aroma. The name 90 Shilling comes from the Scottish method of taxing beer. Only the highest quality beers were taxed 90 Shillings. We think you’ll find this original ale brilliantly refreshing, and worth every Shilling.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (55, 'Mountain Standard IPA', 6.5, 8, 2, 'https://www.odellbrewing.com/wp-content/uploads/2020/04/Mtn-Std-ProductCrops-e1588041298413.png', 'At 6.5%, this Mountain Style IPA is brewed with modern, American hop varieties which bring tropical hop aromas of pineapple, orange, and mango. To accentuate juicy hop aromas without using adjuncts or fruit, Mountain Standard IPA is triple dry-hopped. The result is an extremely drinkable IPA bursting with bright hop flavors, low bitterness, and a slight haze.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (56, 'Colorado Lager', 5.0, 8, 1, 'https://www.odellbrewing.com/wp-content/uploads/2020/05/Lager-Hero.png', 'Coming in at an approachable 5.0% ABV, we built this recipe using American hops, Colorado water, and premium malted barley without the addition of any adjuncts. This crisp and clean lager was brewed in Colorado, for Colorado, and all the things that make it home.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (57, 'Drumroll Hazy Pale Ale', 5.3, 8, 11, 'https://www.odellbrewing.com/wp-content/uploads/2020/05/Drumroll-Hero.png', 'A drumroll fills you with anticipation—much like the notes in this Hazy Pale Ale. Each year we select the rock-star hops of the harvest to craft this bold, juicy, tropically hop-forward brew, drumming up a citrus-inspired rhythm for what’s to come.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (58, 'Yeti', 9.5, 6, 16, 'https://greatdivide.com/wp-content/uploads/2016/06/Yeti_Cans.png', 'YETI IMPERIAL STOUT is an onslaught of the senses. It starts with big, roasty malt flavor that gives way to rich caramel and toffee notes. YETI gets its bold hop character from an enormous quantity of American hops. It weighs in at a hefty 75 IBUs.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (59, 'Titan IPA', 7.1, 6, 2, 'https://greatdivide.com/wp-content/uploads/2016/06/Titan-Can-Image-2019_Front-1.png', 'TITAN IPA is a big, aggressively hopped India Pale Ale brewed for hop disciples. It starts out with piney hop aromas and citrus hop flavors, and finishes with a nice rich, malty sweetness that is balanced with crisp hop bitterness.\n\n');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (60, 'Hercules Double IPA', 10, 6, 8, 'https://greatdivide.com/wp-content/uploads/2016/06/Hercules_2016_Front_LR-2.png', 'HERCULES DOUBLE IPA is not for the faint of heart. It is, however, fit for the gods. HERCULES delivers a huge amount of hops from start to finish. Its hefty backbone of nutty, malty sweetness balances its aggressive hop profile.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (61, 'Denver Pale Ale ', 5.0, 6, 2, 'https://greatdivide.com/wp-content/uploads/2016/06/Denver-Pale-Ale-5_12oz_Can_2020-1391x2048.png', 'This American Pale Ale opens with big citrus and pine notes, then smooths out with a faint toasted malt character and dry, slightly bitter finish. Denver Pale Ale is your go-to beer from city to trail and back again, no matter what the time or season.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (62, 'Gonzo Imperial Porter', 10, 5, 17, 'https://www.flyingdog.com/media/CACHE/images/beers/bottles/Gonzo_BottleTemplate_Os8bJB5/b61b97436f83244bad0e6c1924ece196.png', 'Too weird to live, too rare to die. Gonzo Imperial Porter is bold and forceful, like the man it was brewed to honor – Dr. Hunter S. Thompson. Complex layers of roasted chocolate, coffee, brown sugar, and vanilla malt flavors are balanced with a one-of-a-kind hop bite that hits you like a homemade firecracker. Buy the ticket and take the ride by pairing this rich and creamy porter with blue cheeses, smoked meats, BBQ, chili, chocolate and coffee desserts. Best shared with your closest circle of friends— real or hallucinated.');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (63, 'Double Dog Double IPA', 12, 5, 8, 'https://www.flyingdog.com/media/CACHE/images/beers/bottles/DoubleDog_BottleTemplate_WYR25P0/703a44d8b711e3713d54b3e6e5f49947.png', 'If I were you, I\'d consider logging off social media tonight. After all, Double Dog nights can get unpredictable...and the internet is forever. With an ABV over 12%, this wild, untamed Double IPA is seductively full-bodied, with a deep red color and subdued malty sweetness. Dried-fruit aromatics make it an ideal companion to hard cheeses that you’ll forget you ate in the morning. As world famous artist Ralph Steadman put it so succinctly, Double Dog is, “For that night. That other goddamn night.”');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (64, 'Snake Dog IPA', 7.1, 5, 2, 'https://www.flyingdog.com/media/CACHE/images/beers/bottles/SnakeDog_BottleTemplate/89162ea50dae1f98f6853a08bd3e9361.png', 'A potent snakebite of Citra, Mosaic, Warrior, Simcoe, and Columbus hops (more than 2lbs per barrel) gives this beer its citrus-forward superpower. Orange and tropical fruit aromas temper slightly-piney crispness, turning Snake Dog into a more complex breed of West Coast IPA. You’ll find Snake Dog bites hardest when paired with peppery cheeses, curries, and mild Thai dishes whose names you can’t pronounce properly');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`, `description`) VALUES (67, 'Bloodline Blood Orange Ale', 8, 5, 2, 'https://www.flyingdog.com/media/CACHE/images/beers/bottles/BLOODLINE_BottleTemplate/d853b4d85ce5a75db6007a2475813ebf.png', 'This is the beer you buy to convert the guy who “doesn’t really like IPAs.” Sweet blood orange puree is added toward the end of fermentation to balance the citrusy sharpness of Northern Brewer, Citra, and Mosaic hops, and deliver a hard-charging ABV to keep the good times rolling. Pairs brilliantly with lighter proteins, like gourmet seared Ahi tuna over nicoise salad, or leftover Thanksgiving turkey sandwiches topped with two pounds of mashed potatoes and three pounds of regret.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `bar`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (1, 'Firefly Saloon', '(303) 424-3670', NULL, 'description', 10, NULL, 1, '');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (2, 'Clancy\'s Irish Pub', '(720) 456-7320', 'https://iloveclancys.com/', 'This airy pub with 4 bars & 2 patios offers Irish grub, weekly brunch & live bands in a warm locale.', 11, NULL, 2, '');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (3, 'The Fainting Goat', '(303) 945-2323', 'http://thefaintinggoatdenver.com/menu/', 'Comfy Irish pub with rooftop patio, serving snacks, burgers & local beer, plus weekend brunch.', 12, NULL, 3, 'https://lh5.googleusercontent.com/p/AF1QipP2FGg712MMZuApl84HkszpBsEJGrHH4msXXxxq=w180-h180-n-k-no');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (4, 'Applebees Bar & Grill', '(303) 421-1032', 'http://www.applebees.com/menu', 'Full-service chain bar & grill providing hearty American eats in an informal setting.', 9, NULL, NULL, '');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (5, 'Charlie Brown\'s Bar & Grill', '(303) 860-1655', 'http://www.charliebrownsbarandgrill.com/best-bar-food-downtown-denver/', 'Old-time lounge where locals sing tunes at the piano & tip back classic drinks on the covered patio.', 13, NULL, NULL, 'https://lh5.googleusercontent.com/p/AF1QipPukwztE2S5k7699hlbIlW8bo3i_yUdJkQhZwh-=w180-h180-n-k-no');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (6, 'Lodo\'s Bar & Grill', '(303) 293-8555', 'https://www.lodosbarandgrill.com/', 'Lively hangout showing live sports on TV, serving burgers, sandwiches & weekend brunch.', 14, NULL, NULL, '');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (7, 'The 1Up Bar', '(303) 736-2230', 'https://the1uparcadebar.com/lodo/', 'Retro arcade & pinball games in a bustling, no-frills basement bar with pub food & a jukebox', 15, NULL, NULL, 'https://secureservercdn.net/72.167.241.134/h0l.5fb.myftpupload.com/wp-content/uploads/2018/10/cropped-1up-arcade-bar-logo-wht.png?time=1603807079');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (8, 'Texas Roadhouse', '(303) 423-1185', 'https://www.texasroadhouse.com/locations/colorado/arvada', 'Lively chain steakhouse serving American fare with a Southwestern spin amid Texas-themed decor.', 16, NULL, NULL, 'https://www.texasroadhouse.com/images/texas-roadhouse-logo@2x.fef1bf55d2d82cc0e91a06c56fa2c53f.webp');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (9, 'Colorado Plus Brew Pub and Taphouse', '(720) 353-4853', 'https://coloradoplus.net/', 'Warm, woodsy saloon featuring housemade brews plus many other local beers & upscale pub grub.', 17, NULL, NULL, 'https://coloradoplus.net/wp-content/uploads/2020/03/ColoradoPlus_LOGO_horizontal_201510.png');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (10, '12 Volt Tavern', '(303) 432-7463', NULL, 'Rustic neighborhood dive offering live music, drink specials & theme nights in an upbeat atmosphere.', 18, NULL, NULL, NULL);
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (11, 'Hoppers Sports Grill', '(303) 233-1331', 'http://hopperssportsgrill.com', 'Easygoing hangout with outdoor seating, beach volleyball, pool tables & typical American bar fare.', 32, NULL, NULL, 'https://www.milehighhappyhour.com/wp-content/uploads/2014/12/Hoppers-Sports-Grill5-1000x500.jpg');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (12, 'Stoneys Bar and Grill', '(303) 830-6839', 'http://www.stoneysbarandgrill.com/', 'Games, live bands & pub grub pack sports fans into this ski-resort-inspired setup.', 33, NULL, NULL, 'http://www.stoneysbarandgrill.com/wp-content/uploads/2018/01/STONEYS-Final-outlines.png');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (13, 'Pub on Pearl', '(303) 777-6768', 'https://www.thepubonpearl.com/', 'Straight-up corner hangout with a patio, pool, poker & sports on TV, plus sandwiches & snacks.', 34, NULL, NULL, 'https://www.thepubonpearl.com/wp-content/uploads/Pub-on-pearl-logo-web.png');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (14, 'Crow Bar', '(303) 862-4645', 'http://www.crowbardenver.com/', 'Craft beer & cocktails in a brick-walled space with retro fixtures, video games & sports on TV.', 35, NULL, NULL, 'http://www.crowbardenver.com/images/crowbarsm.png');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (15, 'Highland Tap and Burger', '(303) 287-4493', 'https://tapandburger.com/colorado-burger-places/highlands-denver-restaurants/', 'Lively bar & grill serving gourmet burgers & local microbrews in TV-filled digs with a patio.', 36, NULL, NULL, 'https://tapandburger.com/wp-content/uploads/2019/02/Westword.jpg');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (16, 'Roo Bar', '(303) 455-8700', 'http://www.roobarcolorado.com/', 'Pool, trivia, poker, a large menu with a Midwestern accent & more at this Packers-themed hangout.', 37, NULL, NULL, 'http://www.roobarcolorado.com/__static/8119b66a57203ea46941d3364758defd/thumbnail_img_2270(2).jpg');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (17, 'Atomic Cowboy', '(303) 377-7900', 'https://atomiccowboy.net/', 'Lively bar serving brews, breakfast biscuits & New York–style pizzas in a warm, energetic space', 38, NULL, NULL, 'https://denver.thedrinknation.com/images/bars/atomiccowboydenver.jpg');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (18, 'Blake Street Tavern ', '(303) 675-0505', 'https://www.blakestreettavern.com/menu', 'Sports fans head to this lively bar for beer & basic American bites in an airy setting with a patio.', 39, NULL, NULL, 'https://static.wixstatic.com/media/139de8_8a4c7bf07b23407d8f0f1229a0081879~mv2.png/v1/fill/w_116,h_109,al_c,q_95/Blake-Street-Tavern-Denver-Restaurant-Ba.webp');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (19, 'Crimson and Gold Tavern', '(720) 379-5454', 'http://www.candgdenver.com/', 'Basic bar catering to a college crowd with sports on TV, drink specials & classic American grub.', 40, NULL, NULL, 'http://www.candgdenver.com/wp-content/uploads/2017/07/crimson12.jpg');
INSERT INTO `bar` (`id`, `name`, `phone_number`, `website`, `description`, `address_id`, `time_last_updated`, `owner_id`, `logo_url`) VALUES (20, '303 Sports Grill', '(303) 500-6880', 'http://www.303sportsgrill.com/', 'Sports Bar', 41, NULL, NULL, 'https://static1.squarespace.com/static/5dae2e8e7b9456228557f7b6/t/5db9d0064ee21209162b5297/1598142760063/?format=1500w');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_price`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (1, 1.50, 1, 1, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (2, 2.00, 2, 1, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (3, 3.50, 3, 5, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (4, 3.00, 4, 3, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (5, 2.50, 5, 8, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (6, 4.00, 6, 4, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (7, 5.00, 7, 9, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (8, 5.99, 8, 2, NULL);
INSERT INTO `beer_price` (`id`, `beer_price`, `bar_id`, `beer_id`, `size_price`) VALUES (9, 6.50, 9, 4, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `beer_rating` (`id`, `star_rating`, `review`, `beer_id`, `user_id`, `rating_date`) VALUES (1, 2, NULL, 1, 1, NULL);
INSERT INTO `beer_rating` (`id`, `star_rating`, `review`, `beer_id`, `user_id`, `rating_date`) VALUES (2, 4, NULL, 2, 2, NULL);
INSERT INTO `beer_rating` (`id`, `star_rating`, `review`, `beer_id`, `user_id`, `rating_date`) VALUES (3, 5, NULL, 5, 3, NULL);
INSERT INTO `beer_rating` (`id`, `star_rating`, `review`, `beer_id`, `user_id`, `rating_date`) VALUES (4, 5, NULL, 1, 2, NULL);
INSERT INTO `beer_rating` (`id`, `star_rating`, `review`, `beer_id`, `user_id`, `rating_date`) VALUES (5, 5, NULL, 3, 3, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `bar_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `bar_rating` (`id`, `star_rating`, `review`, `bar_id`, `user_id`, `rating_date`) VALUES (1, 1, NULL, 1, 1, NULL);
INSERT INTO `bar_rating` (`id`, `star_rating`, `review`, `bar_id`, `user_id`, `rating_date`) VALUES (2, 5, NULL, 3, 2, NULL);
INSERT INTO `bar_rating` (`id`, `star_rating`, `review`, `bar_id`, `user_id`, `rating_date`) VALUES (3, 4, NULL, 2, 3, NULL);
INSERT INTO `bar_rating` (`id`, `star_rating`, `review`, `bar_id`, `user_id`, `rating_date`) VALUES (4, 5, NULL, 2, 4, NULL);
INSERT INTO `bar_rating` (`id`, `star_rating`, `review`, `bar_id`, `user_id`, `rating_date`) VALUES (5, 3, NULL, 5, 2, NULL);

COMMIT;

