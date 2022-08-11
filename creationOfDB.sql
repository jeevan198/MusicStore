-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Music_store
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Music_store
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Music_store` DEFAULT CHARACTER SET utf8 ;
USE `Music_store` ;

-- -----------------------------------------------------
-- Table `Music_store`.`music_store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`music_store` (
  `storeId` INT NOT NULL AUTO_INCREMENT,
  `storeAddress` VARCHAR(45) NOT NULL,
  `store_phone_number` VARCHAR(20) NOT NULL,
  `storeZipcode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`storeId`),
  UNIQUE INDEX `store_mobno_UNIQUE` (`store_phone_number` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`employees` (
  `employeeId` INT NOT NULL AUTO_INCREMENT,
  `employeeName` VARCHAR(45) NOT NULL,
  `employeeAge` INT NOT NULL,
  `employeePhoneNumber` VARCHAR(20) NOT NULL,
  `music_store_storeId` INT NOT NULL,
  `employeeAddress` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employeeId`),
  INDEX `fk_employees_music_store1_idx` (`music_store_storeId` ASC) ,
  UNIQUE INDEX `emp_mobno_UNIQUE` (`employeePhoneNumber` ASC) ,
  CONSTRAINT `fk_employees_music_store1`
    FOREIGN KEY (`music_store_storeId`)
    REFERENCES `Music_store`.`music_store` (`storeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`customers` (
  `customerId` INT NOT NULL AUTO_INCREMENT,
  `customerFname` VARCHAR(45) NOT NULL,
  `customerLname` VARCHAR(45) NOT NULL,
  `customerPhoneNumber` VARCHAR(20) NOT NULL,
  `music_store_storeId` INT NOT NULL,
  `customerAge` INT NOT NULL,
  PRIMARY KEY (`customerId`),
  INDEX `fk_customers_music_store1_idx` (`music_store_storeId` ASC) ,
  UNIQUE INDEX `customer_mobno_UNIQUE` (`customerPhoneNumber` ASC) ,
  CONSTRAINT `fk_customers_music_store1`
    FOREIGN KEY (`music_store_storeId`)
    REFERENCES `Music_store`.`music_store` (`storeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`address` (
  `branchId` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `postal_code` VARCHAR(45) NOT NULL,
  `music_store_storeId` INT NOT NULL,
  PRIMARY KEY (`branchId`),
  INDEX `fk_address_music_store1_idx` (`music_store_storeId` ASC) ,
  CONSTRAINT `fk_address_music_store1`
    FOREIGN KEY (`music_store_storeId`)
    REFERENCES `Music_store`.`music_store` (`storeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`categories` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(45) NOT NULL,
  `categoryType` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`categoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`orders` (
  `orderId` INT NOT NULL AUTO_INCREMENT,
  `orderDate` DATETIME NOT NULL,
  `shipAmount` INT NOT NULL,
  `taxAmount` INT NOT NULL,
  `customers_customerId` INT NOT NULL,
  PRIMARY KEY (`orderId`),
  INDEX `fk_orders_customers1_idx` (`customers_customerId` ASC) ,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_customerId`)
    REFERENCES `Music_store`.`customers` (`customerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`order_items` (
  `itemId` INT NOT NULL AUTO_INCREMENT,
  `itemPrice` INT NOT NULL,
  `quantity` INT NOT NULL,
  `orders_orderId` INT NOT NULL,
  PRIMARY KEY (`itemId`),
  INDEX `fk_order_items_orders1_idx` (`orders_orderId` ASC) ,
  CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`orders_orderId`)
    REFERENCES `Music_store`.`orders` (`orderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`products` (
  `productId` INT NOT NULL AUTO_INCREMENT,
  `productName` VARCHAR(45) NOT NULL,
  `productType` VARCHAR(45) NOT NULL,
  `music_store_storeId` INT NOT NULL,
  `categories_categoryId` INT NOT NULL,
  `order_items_itemId` INT NOT NULL,
  `noOfProducts` INT NULL,
  PRIMARY KEY (`productId`),
  INDEX `fk_products_music_store1_idx` (`music_store_storeId` ASC) ,
  INDEX `fk_products_categories1_idx` (`categories_categoryId` ASC) ,
  INDEX `fk_products_order_items1_idx` (`order_items_itemId` ASC) ,
  CONSTRAINT `fk_products_music_store1`
    FOREIGN KEY (`music_store_storeId`)
    REFERENCES `Music_store`.`music_store` (`storeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_categories1`
    FOREIGN KEY (`categories_categoryId`)
    REFERENCES `Music_store`.`categories` (`categoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_order_items1`
    FOREIGN KEY (`order_items_itemId`)
    REFERENCES `Music_store`.`order_items` (`itemId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`singer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`singer` (
  `singerId` INT NOT NULL AUTO_INCREMENT,
  `singer_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `music_store_storeId` INT NOT NULL,
  `singerAge` INT NOT NULL,
  PRIMARY KEY (`singerId`),
  INDEX `fk_singer_music_store1_idx` (`music_store_storeId` ASC) ,
  CONSTRAINT `fk_singer_music_store1`
    FOREIGN KEY (`music_store_storeId`)
    REFERENCES `Music_store`.`music_store` (`storeId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`video` (
  `videoId` INT NOT NULL AUTO_INCREMENT,
  `actorName` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `singer_singerId` INT NOT NULL,
  `videoQuality` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`videoId`),
  INDEX `fk_video_singer1_idx` (`singer_singerId` ASC) ,
  CONSTRAINT `fk_video_singer1`
    FOREIGN KEY (`singer_singerId`)
    REFERENCES `Music_store`.`singer` (`singerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Music_store`.`audio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Music_store`.`audio` (
  `audioId` INT NOT NULL AUTO_INCREMENT,
  `singer` VARCHAR(45) NOT NULL,
  `music_director` VARCHAR(45) NOT NULL,
  `genre` VARCHAR(45) NOT NULL,
  `singer_singerId` INT NOT NULL,
  `lyricist` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`audioId`),
  INDEX `fk_audio_singer1_idx` (`singer_singerId` ASC) ,
  CONSTRAINT `fk_audio_singer1`
    FOREIGN KEY (`singer_singerId`)
    REFERENCES `Music_store`.`singer` (`singerId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
