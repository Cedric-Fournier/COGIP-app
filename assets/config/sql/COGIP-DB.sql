-- MySQL Script generated by MySQL Workbench
-- mer 29 aoû 2018 10:00:17 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema COGIP-DB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema COGIP-DB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `COGIP-DB` DEFAULT CHARACTER SET utf8 ;
USE `COGIP-DB` ;

-- -----------------------------------------------------
-- Table `COGIP-DB`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COGIP-DB`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(30) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COGIP-DB`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COGIP-DB`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NULL,
  `street` VARCHAR(50) NULL,
  `number` VARCHAR(5) NULL,
  `zip` VARCHAR(10) NULL,
  `city` VARCHAR(30) NULL,
  `country` VARCHAR(30) NULL,
  `VAT` VARCHAR(12) NULL,
  `phone` VARCHAR(20) NULL,
  `type` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_company_type1_idx` (`type` ASC),
  CONSTRAINT `fk_company_type1`
    FOREIGN KEY (`type`)
    REFERENCES `COGIP-DB`.`type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COGIP-DB`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COGIP-DB`.`person` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(30) NULL,
  `lastname` VARCHAR(30) NULL,
  `phone` VARCHAR(30) NULL,
  `email` VARCHAR(30) NULL,
  `company` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_person_company1_idx` (`company` ASC),
  CONSTRAINT `fk_person_company1`
    FOREIGN KEY (`company`)
    REFERENCES `COGIP-DB`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `COGIP-DB`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `COGIP-DB`.`bill` (
  `number` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `object` VARCHAR(30) NULL,
  `company` INT NOT NULL,
  `person` INT NOT NULL,
  PRIMARY KEY (`number`),
  INDEX `fk_bill_company1_idx` (`company` ASC),
  INDEX `fk_bill_person1_idx` (`person` ASC),
  CONSTRAINT `fk_bill_company1`
    FOREIGN KEY (`company`)
    REFERENCES `COGIP-DB`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_person1`
    FOREIGN KEY (`person`)
    REFERENCES `COGIP-DB`.`person` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `COGIP-DB`.`type`
-- -----------------------------------------------------
START TRANSACTION;
USE `COGIP-DB`;
INSERT INTO `COGIP-DB`.`type` (`id`, `type`) VALUES (1, 'fournisseur');
INSERT INTO `COGIP-DB`.`type` (`id`, `type`) VALUES (2, 'client');

COMMIT;


-- -----------------------------------------------------
-- Data for table `COGIP-DB`.`company`
-- -----------------------------------------------------
START TRANSACTION;
USE `COGIP-DB`;
INSERT INTO `COGIP-DB`.`company` (`id`, `name`, `street`, `number`, `zip`, `city`, `country`, `VAT`, `phone`, `type`) VALUES (1, 'WebDevelopper', 'rue de la putterie', '6', '1000', 'Bruxelles', 'Belgique', '048349728', '024215736', 2);
INSERT INTO `COGIP-DB`.`company` (`id`, `name`, `street`, `number`, `zip`, `city`, `country`, `VAT`, `phone`, `type`) VALUES (2, 'Coca-Cola', 'avenue de l\'obésité', '99', '1030', 'Bruxelles', 'Belgique', '347812395', '024753214', 1);
INSERT INTO `COGIP-DB`.`company` (`id`, `name`, `street`, `number`, `zip`, `city`, `country`, `VAT`, `phone`, `type`) VALUES (5, 'Chez Jonny', 'rue des jonnys', '1', '1000', 'Bruxelles', 'Belgique', '351745029', '023219854', 2);
INSERT INTO `COGIP-DB`.`company` (`id`, `name`, `street`, `number`, `zip`, `city`, `country`, `VAT`, `phone`, `type`) VALUES (6, 'Paul & Company', 'avenue des pendus', '5', '1040', 'Bruxelles', 'Belgique', '032478159', '022540120', 1);
INSERT INTO `COGIP-DB`.`company` (`id`, `name`, `street`, `number`, `zip`, `city`, `country`, `VAT`, `phone`, `type`) VALUES (7, 'WebDesign', 'boulevard de Monaco', '145', '1020', 'Bruxelles', 'Belgique', '325149657', '022198530', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `COGIP-DB`.`person`
-- -----------------------------------------------------
START TRANSACTION;
USE `COGIP-DB`;
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (3, 'Cedric', 'Fournier', '0499123456', 'cedricfournier@email.com', 1);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (4, 'Adrien', 'd\'Oreye', '0489824514', 'adriendoreye@email.com', 1);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (5, 'Stephane', 'Wilfort', '04172569', 'stephanewilfort@email.com', 1);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (6, 'Genièvre', 'Van Chou', '0429541239', 'genievrevanchou@email.com', 2);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (7, 'Julie', 'Dupont', '0478503654', 'juliedupont@email.com', 1);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (8, 'Marie', 'Dupont', '0478500200', 'mariedupont@email.com', 1);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (9, 'John', 'Smith', '0497007977', 'johnsmith@email.com', 2);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (10, 'Henry', 'Salvador', '024821214', 'henrysalvador@email.com', 2);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (11, 'Nadege', 'Demae', '0415326701', 'nadegedemae@email.com', 2);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (12, 'Simon', 'Simon', '0428012088', 'simonsimon@email.com', 2);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (13, 'Simon', 'Puech', '0491366769', 'puech.simon@gmail.com', 5);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (14, 'Hulk', 'Hogan', '0491568453', 'hh@gmail.com', 5);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (15, 'Jules', 'Verne', '0491199546', 'jv@gmail.com', 5);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (16, 'Thibault', 'Gribaumont', '04912366589', 't.g@gmail.com', 5);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (17, 'Geraldine', 'Gribaumont', '0491758426', 'gg@gmail.com', 5);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (18, 'David', 'Goodenough', '0491112233', 'david.doodenough@gmail.com', 6);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (19, 'Bob', 'Lennon', '0491733742', 'lelennon@gmail.com', 6);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (20, 'Fanatsio', 'Ilien', '0491568451', 'fantasio974@gmail.com', 6);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (21, 'Vanessa', 'Paradis', '0491654875', 'rondoudou@gmail.com', 6);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (22, 'Guillaume', 'Kreit', '0491010203', 'dodo@gmail.com', 6);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (23, 'Jean-Rachid', 'Rochefort', '021473254', 'jr-rochefort@email.com', 7);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (24, 'Emily', 'Marghella', '021540266', 'em.marghella@email.com', 7);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (25, 'Cookie', 'Chocolat', '0426241709', 'cookie.choco@email.com', 7);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (26, 'Salami', 'Manger', '0475241895', 'salamiemanger@email.com', 7);
INSERT INTO `COGIP-DB`.`person` (`id`, `firstname`, `lastname`, `phone`, `email`, `company`) VALUES (27, 'François', 'Du Voison', '0429661144', 'francoisduvoisin@email.com', 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `COGIP-DB`.`bill`
-- -----------------------------------------------------
START TRANSACTION;
USE `COGIP-DB`;
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (1, '2018-08-07', 'allez-ciné', 1, 3);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (2, '2018-07-08', 'challenge php', 1, 4);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (3, '2018-06-10', 'onepage unicode', 1, 5);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (4, '2018-04-09', 'onepage orange', 2, 6);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (5, '2018-08-12', 'livraison 2 pal', 1, 7);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (6, '2018-08-14', 'livraison 5 pal', 1, 8);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (7, '2018-08-17', 'opération marketing', 2, 9);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (8, '2018-08-21', 'joyeux noel', 2, 10);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (9, '2018-08-29', 'assomption', 2, 11);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (10, '2018-08-15', '3 pizza + 2 pates', 2, 12);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (11, '2018-08-28', 'panier surprise Web Dev', 5, 13);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (12, '2018-08-29', 'panier surprise coca-cola', 5, 14);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (13, '2018-08-23', 'panier surprise BeCode', 5, 15);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (14, '2018-08-27', 'panier surprise BeCentral', 5, 16);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (15, '2018-08-08', 'devis chantier Charleroi', 5, 17);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (16, '2018-08-21', 'livraison matériel Charleroi', 6, 18);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (17, '2018-08-29', 'Main d\'oeuvre Charleroi', 6, 19);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (18, '2018-07-01', 'Devis Chantier Bruxelles', 6, 20);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (19, '2018-05-07', 'Devis Chantier BeCode', 6, 21);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (20, '2018-08-13', 'Main d\'Oreuvre BeCode', 6, 22);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (21, '2018-05-16', 'Template Coca-Cola', 7, 23);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (22, '2018-03-20', 'Design Becode', 7, 24);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (23, '2017-11-01', 'Multiple Design for WebDev', 7, 25);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (24, '2018-07-06', 'Client', 7, 26);
INSERT INTO `COGIP-DB`.`bill` (`number`, `date`, `object`, `company`, `person`) VALUES (25, '2018-06-02', 'Refonte de notre site', 7, 27);

COMMIT;
