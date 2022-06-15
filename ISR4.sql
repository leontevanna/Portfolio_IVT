-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projwork4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projwork4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projwork4` DEFAULT CHARACTER SET utf8 ;
USE `projwork4` ;

-- -----------------------------------------------------
-- Table `projwork4`.`CustomerTab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projwork4`.`CustomerTab` (
  `CustomerNum` INT NOT NULL AUTO_INCREMENT,
  `CustomerName` VARCHAR(255) NOT NULL,
  `CustomerAddress` VARCHAR(355) NOT NULL,
  `CustomerPhone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerNum`),
  UNIQUE INDEX `CustomerNum_UNIQUE` (`CustomerNum` ASC) VISIBLE,
  UNIQUE INDEX `CustomerPhone_UNIQUE` (`CustomerPhone` ASC) VISIBLE,
  UNIQUE INDEX `CustomerAddress_UNIQUE` (`CustomerAddress` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projwork4`.`ProductTab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projwork4`.`ProductTab` (
  `CatalogNum` INT NOT NULL,
  `Product` VARCHAR(255) NOT NULL,
  `PriceOne` INT NOT NULL,
  PRIMARY KEY (`CatalogNum`),
  UNIQUE INDEX `CatalogNum_UNIQUE` (`CatalogNum` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projwork4`.`OrderTub`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projwork4`.`OrderTub` (
  `OrderNum` INT NOT NULL,
  `ProductID` INT NOT NULL,
  `Quantity` INT NOT NULL,
  `CustomerID` INT NOT NULL,
  PRIMARY KEY (`OrderNum`),
  INDEX `OrderToCustomer_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `OrderToProduct_idx` (`ProductID` ASC) VISIBLE,
  CONSTRAINT `OrderToCustomer`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `projwork4`.`CustomerTab` (`CustomerNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderToProduct`
    FOREIGN KEY (`ProductID`)
    REFERENCES `projwork4`.`ProductTab` (`CatalogNum`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
