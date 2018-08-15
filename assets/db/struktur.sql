-- MySQL Script generated by MySQL Workbench
-- Wed Aug 15 16:25:47 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tugasweb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tugasweb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tugasweb2` DEFAULT CHARACTER SET utf8 ;
USE `tugasweb2` ;

-- -----------------------------------------------------
-- Table `tugasweb2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tugasweb2`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_username` VARCHAR(45) NULL,
  `user_password` VARCHAR(100) NULL,
  `user_full_name` VARCHAR(255) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tugasweb2`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tugasweb2`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(100) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tugasweb2`.`items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tugasweb2`.`items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(100) NULL,
  `item_price` DECIMAL NULL,
  `item_stock` DECIMAL(10,0) NULL,
  `category_id` INT NULL,
  `user_id` INT NULL,
  `item_input_date` TIMESTAMP NULL,
  `item_last_update` TIMESTAMP NULL,
  PRIMARY KEY (`item_id`),
  INDEX `fk_items_categories_idx` (`category_id` ASC),
  INDEX `fk_items_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_items_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `tugasweb2`.`categories` (`category_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL,
  CONSTRAINT `fk_items_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tugasweb2`.`users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tugasweb2`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tugasweb2`.`transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT,
  `transaction_date` TIMESTAMP NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transactions_users1_idx` (`user_id` ASC),
  CONSTRAINT `fk_transactions_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `tugasweb2`.`users` (`user_id`)
    ON DELETE SET NULL
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tugasweb2`.`details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tugasweb2`.`details` (
  `detail_id` INT NOT NULL AUTO_INCREMENT,
  `detail_price` DECIMAL NULL,
  `detail_qty` INT NULL,
  `detail_total` DECIMAL NULL,
  `transaction_id` INT NULL,
  `item_id` INT NULL,
  PRIMARY KEY (`detail_id`),
  INDEX `fk_details_transactions1_idx` (`transaction_id` ASC),
  INDEX `fk_details_items1_idx` (`item_id` ASC),
  CONSTRAINT `fk_details_transactions1`
    FOREIGN KEY (`transaction_id`)
    REFERENCES `tugasweb2`.`transactions` (`transaction_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_details_items1`
    FOREIGN KEY (`item_id`)
    REFERENCES `tugasweb2`.`items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;