-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Doctor` (
  `id_Doctor` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `Salary` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Doctor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medical` (
  `Overtime_rate` INT NULL,
  `id_Doctor` INT NULL,
  `medical_id` INT NOT NULL,
  PRIMARY KEY (`medical_id`),
  INDEX `fk_Medical_1_idx` (`id_Doctor` ASC) VISIBLE,
  CONSTRAINT `fk_Medical_1`
    FOREIGN KEY (`id_Doctor`)
    REFERENCES `mydb`.`Doctor` (`id_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Specialist` (
  `Field_area` INT NULL,
  `Specialist_id` VARCHAR(45) NOT NULL,
  `id_doctor` INT NULL,
  PRIMARY KEY (`Specialist_id`),
  INDEX `fk_Specialist_1_idx` (`id_doctor` ASC) VISIBLE,
  CONSTRAINT `fk_Specialist_1`
    FOREIGN KEY (`id_doctor`)
    REFERENCES `mydb`.`Doctor` (`id_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
  `id_Payment` INT NOT NULL,
  `Method` VARCHAR(45) NULL,
  `Details` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Payment`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `phone_number` VARCHAR(45) NULL,
  `Date_of_birth` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Bill` (
  `idBill` INT NOT NULL,
  `patient_id` INT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `fk_Bill_1_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_Bill_1`
    FOREIGN KEY (`patient_id`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Appointment` (
  `idAppointment` INT NOT NULL,
  `date` VARCHAR(45) NULL,
  `time` VARCHAR(45) NULL,
  `idAppointment_idDoctor` INT NULL,
  `idAppointment_idPatient` INT NULL,
  PRIMARY KEY (`idAppointment`),
  INDEX `fk_Appointment_1_idx` (`idAppointment_idDoctor` ASC) VISIBLE,
  INDEX `fk_Appointment_2_idx` (`idAppointment_idPatient` ASC) VISIBLE,
  CONSTRAINT `fk_Appointment_1`
    FOREIGN KEY (`idAppointment_idDoctor`)
    REFERENCES `mydb`.`Doctor` (`id_Doctor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_2`
    FOREIGN KEY (`idAppointment_idPatient`)
    REFERENCES `mydb`.`Patient` (`idPatient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Transaction` (
  `idTransaction` INT NOT NULL,
  `bill_transaction` INT NULL,
  `payment_transcation` INT NULL,
  PRIMARY KEY (`idTransaction`),
  INDEX `fk_Transaction_1_idx` (`payment_transcation` ASC) VISIBLE,
  INDEX `fk_Transaction_2_idx` (`bill_transaction` ASC) VISIBLE,
  CONSTRAINT `fk_Transaction_1`
    FOREIGN KEY (`payment_transcation`)
    REFERENCES `mydb`.`Payment` (`id_Payment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaction_2`
    FOREIGN KEY (`bill_transaction`)
    REFERENCES `mydb`.`Bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
