-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cull_de_ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cull_de_ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cull_de_ampolla` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
USE `cull_de_ampolla` ;

-- -----------------------------------------------------
-- Table `cull_de_ampolla`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cull_de_ampolla`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nom_cliente` VARCHAR(45) NOT NULL,
  `telefono_cliente` INT NOT NULL,
  `correo_cliente` VARCHAR(45) NOT NULL,
  `cp_cliente` INT(5) UNSIGNED ZEROFILL NOT NULL,
  `registro_cliente` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  INDEX `id_recomen` (`id_cliente` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `cull_de_ampolla`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cull_de_ampolla`.`empleado` (
  `id_empleado` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empleado`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `cull_de_ampolla`.`gafas_pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cull_de_ampolla`.`gafas_pedidos` (
  `id_gafas` INT NOT NULL AUTO_INCREMENT,
  `gafa_descuento` SET('tommy', 'dior', 'alleflou', 'dc', 'null') NOT NULL DEFAULT 'dc',
  `graduacion_der` DECIMAL(2,1) NOT NULL,
  `graduacion_izq` DECIMAL(2,1) NOT NULL,
  `tipo_montura` SET('flotante', 'pasta', 'metallica') NOT NULL DEFAULT 'flotante',
  `color_montura` VARCHAR(45) NOT NULL,
  `color_cristal_izq` VARCHAR(15) NOT NULL,
  `color_cristal_der` VARCHAR(15) NOT NULL,
  `gafa_cualquiera` SET('tommy', 'dior', 'alleflou', 'dc', 'nulo') NULL DEFAULT 'nulo',
  PRIMARY KEY (`id_gafas`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `cull_de_ampolla`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cull_de_ampolla`.`proveedor` (
  `id_prov` INT NOT NULL,
  `nombrre` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `fax` INT NULL DEFAULT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `id_gafas` INT NOT NULL,
  `calle` VARCHAR(45) NOT NULL,
  `numero_calle` VARCHAR(45) NOT NULL,
  `numero_piso` VARCHAR(45) NULL DEFAULT NULL,
  `numero_puerta` VARCHAR(45) NULL DEFAULT NULL,
  `ciudad` VARCHAR(100) NOT NULL,
  `cp` SMALLINT(5) ZEROFILL NULL,
  `telefono_proveedor` INT(12) NOT NULL,
  `fax` INT NOT NULL,
  `nif` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_prov`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  INDEX `id_gafas_idx` (`id_gafas` ASC) VISIBLE,
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  CONSTRAINT `gafas_pro`
    FOREIGN KEY (`id_prov`)
    REFERENCES `cull_de_ampolla`.`gafas_pedidos` (`id_gafas`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


-- -----------------------------------------------------
-- Table `cull_de_ampolla`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cull_de_ampolla`.`venta` (
  `id_Factura` INT NOT NULL AUTO_INCREMENT,
  `id_empleado` INT NOT NULL,
  `id_gafas` INT NOT NULL,
  `id_cliente` INT NOT NULL,
  `fecha_compra` DATE NOT NULL,
  `es_recomendado` SET("si", "no") NOT NULL,
  `id_cliente_recomendado` INT NULL,
  PRIMARY KEY (`id_Factura`),
  INDEX `id_empleado_idx` (`id_empleado` ASC) VISIBLE,
  INDEX `id_gafas_idx` (`id_gafas` ASC) VISIBLE,
  INDEX `id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `id_cliente_recomendado_fk_idx` (`id_cliente_recomendado` ASC) VISIBLE,
  CONSTRAINT `id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `cull_de_ampolla`.`cliente` (`id_cliente`),
  CONSTRAINT `id_empleado`
    FOREIGN KEY (`id_empleado`)
    REFERENCES `cull_de_ampolla`.`empleado` (`id_empleado`),
  CONSTRAINT `id_gafas`
    FOREIGN KEY (`id_gafas`)
    REFERENCES `cull_de_ampolla`.`gafas_pedidos` (`id_gafas`),
  CONSTRAINT `id_cliente_recomendado_fk`
    FOREIGN KEY (`id_cliente_recomendado`)
    REFERENCES `cull_de_ampolla`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
