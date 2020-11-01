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

COMMIT;


-- -----------------------------------------------------
-- Data for table `type_of_beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (1, 'Lager', 'Lager');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (2, 'IPA', 'IPA');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (3, 'IPA-American', 'IPA-American');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (4, 'Lager-American Light', 'Lager-American Light');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (5, 'IPA-Session / India Session Ale', 'IPA-Session / India Session Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (6, 'Red Ale- American Amber / Red', 'Red Ale- American Amber / Red');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (7, 'Blonde Ale', 'Blonde Ale');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (8, 'IPA - Imperial / Double', 'IPA - Imperial / Double');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (9, 'Stout - Milk / Sweet ', 'Stout - Milk / Sweet');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (10, 'Brown Ale - American', 'Brown Ale - American');
INSERT INTO `type_of_beer` (`id`, `type_description`, `type_name`) VALUES (11, 'IPA - Hazy', 'IPA - Hazy');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beer`
-- -----------------------------------------------------
START TRANSACTION;
USE `beerhounddb`;
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (1, 'Modus Hoperandi', 6.8, 1, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQxDe05BJsaeMEk2wUuwGVGs8S1CR-j0zdwpA&usqp=CAU');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (2, 'Modus Mandarina', 6.8, 1, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRsWKa5nkrJr0YW5f2zbj_GjzJdoe03jBUzOw&usqp=CAU');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (3, 'Pinstripe Red Ale', 5.2, 1, 6, 'https://untappd.akamaized.net/site/beer_logos/beer-9477_48271_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (4, 'True Blonde Ale', 5.3, 1, 7, 'https://untappd.akamaized.net/site/beer_logos/beer-8501_c9c22_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (5, 'Mexican Logger', 5.2, 1, 4, 'https://untappd.akamaized.net/site/beer_logos/beer-30647_32ec7_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (6, 'Decadent Imperial IPA', 10.0, 1, 8, 'https://untappd.akamaized.net/site/beer_logos/beer-12522_5520d_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (7, 'Rudie Session IPA', 4.5, 1, 5, 'https://untappd.akamaized.net/site/beer_logos/beer-731757_58883_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (8, 'Steel Toe Stout', 5.4, 1, 9, 'https://untappd.akamaized.net/site/beer_logos/beer-5439_dc879_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (9, 'Buster Nut Brown', 5.3, 1, 10, 'https://untappd.akamaized.net/site/beer_logos/beer-6734_a42e7_sm.jpeg');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (10, 'Codename: Superfan', 6.5, 2, 3, 'https://lh3.googleusercontent.com/JWv5rpzfhTadv2plM5hTVbkmJJ7hda5cZCE8Au5V0iLS62UkFqnSJRtZBI6LXOwUFPDs3415OCeiyQVmf59_-5sHenizLdQlBV45oRb8bp1rzPrw0K-j7SGPtjXMru3j6cUUpRbOTO1ziIvaPQJRnzk0IXemWCvnv_y3fWQnsiolD9a_5A14diLTm0zfPGWZl-R9qCvU3wuKl48suxROBto2KUInSGGkeIr9HpAJ5TAX9ZHDmdcfoZIz0ZZS2fh426O8GdwfOD04v7pVB81YxnT_bS4ZyJ6weY6lmo0-yuZMd4pnRh_GaFH23c2eifwRpYnngpHRdUDTQRIj81LoOVY7BZeylJfQn_qfp9hdnnrDAIzV5Ukd4ZOCuoCeHkkNMRQpyZPw1WEC_92FrXYIkxSgTNPRs_teMcIRcvJilqkcAkKAZcKjFtZeO4D41_alRphklAoSCgCUdq1WlNaci4VqJhfbhDv6KFmE4q2HlKVUTCz6mon14zev1m-E8QvxALrv9WyMqfs92ApWBHfYBPb36rKxKlTQewNktBzngLRjRweEqM8njLXbVfhq2RAoUXm9bZ0atJ2hhizN2hlT_Sxqp0vyD20N4a4VciXM0G3rE-ngBgoxUDR2ng23MgQL3ueJFiU9t5Q28_WwBlj4zuvZAB8jqVTfn5FefYLX5iHdwFo-hTUhpD54=w1000-no');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (11, 'Intergalactic Juice Hunter', 8.0, 2, 8, 'https://lh3.googleusercontent.com/PkrTf9oFebCz_kE-YjoMHpQ0ahHi210QrbbdPN4Zbi9UtUiELLpLvKA9vgENujpk3t9fpy2e4a97fu7j-oTIA-bBKNtgEUd4DFXuXtlwCpqcqHevd_rZdFDkdWEKd5ukK18BS5gBo3YVvYcZEl99zO0oz9h__nOqJDBDVzn0PGVe41CqKRyJE322MdfB55PeSqEbro3tGf0ozb4AlhCx7Ne5ZGP109CEbLP44w7fCq7uEqWyu9uFSDAPxtCsZDJrrbGbFbdtudM2my_mT5Gbw5Nfpfur9lFSbYHSyyQnZVT0-mFD5N5mqDPJH3E3beElYZd6nVe2gjHlSuxCRmKc2T8rblrsoOv1AMMdlcpw67d2_4mNkTaHu5bgLS3Um46LQDWMRQJ0kr9nMZEhhwtN64hIL6-72g0DyFCEenbvMri9CF4r58SoNfqBN42-94tKqHJdfwu63qvi66eCn_V63X6B4HZQjuZX1gNz7glqNhw5Ly2e0q9u18reAokmfSSWEi9YDF3ozLygPoEasGdFm_-krKvc4lmhAshoLcpu-DWJ0wjQh0gXv7MCWRE55oX4SIF7A9pxrYIDSyFDAuXOqT2bd_FeX7NY7tqFdg7BnBN0yIzrLg7bnh-jZ6-vCEW8-yFBrwnzpalH_Rw8lqYv-SUaJA8VRRkVHigvzZeN6ZppIF00cWGSIOpS=w1000-no');
INSERT INTO `beer` (`id`, `name`, `alcohol_content`, `brewery_id`, `type_of_beer_id`, `image_url`) VALUES (12, 'Colorado Kid', 7.2, 2, 11, 'https://lh3.googleusercontent.com/P12ibRmDlNYGhVmXZB_7w1yi6e-QTaFyBMFR2wrksnUdiZd86ll4ZRt1lwf1iS8ksWchYvbj498cnp1ij7rLJ31M--u0nGnyRm1u5PObJ1KtrNOCFldSAFPaVsvMtnD1Ltbn01OAr_zeHGdO666bUaZ67lkpk6j703CX-LO8ZMa6z4A5nyRXWys7yx6bzwtfMJQpAo7aFlKblJlMdtr0VNsqGKuYlaUvoe5V5uyZsXJUicew4ybES4foMpQAJ32P8g8WHSx75DUzoAYlcpDe0-7JT3AHCy7-4N9RMxveqb42g44ln0CuYj3gRY0ErWKOkqWvRww0wjt1MrhIbgpePnVlU_Yvct686upcfLGUHigVOAUknZRPJaAPNhHWPCDO5l82NxMTy57gLCinqzdOpJeAwknoq-vWWuS9Hcdc0rF4jved7uL4SRu_DarfE2DoJGUcC2kyqq0tW61Iqxx01_6eSb-knU7EIgjTvunnF99jqTx-UWiDjXInbhjt_-n7gauAJVYVPLHzgvtYD8fTN0sXtaijxsSpIQ4-5xMPyhv4TFZpxm_hEZvfMxxwLc-GjigDIaNMUtVhCJ9RMkxzwo0mIS7A-KyLtUmrl_Bxtto7uLSw2v-LQIe2qSyDoccRLdxxz7WhOElDCHZMhKcdOrlrpUfDf_aWjcTTyniRGeXyStzySBsaRNWwwM3-xFEMzWUF0pq8CBGkcAEAXJjYmbgu=w1000-no');

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

