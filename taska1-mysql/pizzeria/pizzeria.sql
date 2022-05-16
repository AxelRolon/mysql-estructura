-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pizzeria1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria1` DEFAULT CHARACTER SET utf8mb3 ;
USE `pizzeria1` ;

-- -----------------------------------------------------
-- Table `pizzeria1`.`provincias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`provincias` (
  `id_provincia` SMALLINT NOT NULL AUTO_INCREMENT,
  `provincia` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`localidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`localidad` (
  `id_localidad` SMALLINT NOT NULL AUTO_INCREMENT,
  `nombre_localidad` VARCHAR(45) NOT NULL,
  `id_provincia` SMALLINT NOT NULL,
  PRIMARY KEY (`id_localidad`),
  INDEX `fk_localidad_provincias1_idx1` (`id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_localidad_provincias1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `pizzeria1`.`provincias` (`id_provincia`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`cliente` (
  `id_cliente` SMALLINT NOT NULL AUTO_INCREMENT,
  `nombre_cliente` VARCHAR(45) NOT NULL,
  `apellido_cliente` VARCHAR(45) NOT NULL,
  `direccion_cliente` TEXT NOT NULL,
  `cp_cliente` SMALLINT(5) UNSIGNED ZEROFILL NOT NULL,
  `numero_cliente` INT NOT NULL,
  `localidad_id_localidad` SMALLINT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_localidad1_idx` (`localidad_id_localidad` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_localidad1`
    FOREIGN KEY (`localidad_id_localidad`)
    REFERENCES `pizzeria1`.`localidad` (`id_localidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `pizzeria1`.`tienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`tienda` (
  `id_tienda` SMALLINT NOT NULL AUTO_INCREMENT,
  `nombre_tienda` VARCHAR(45) NOT NULL,
  `direccion_tienda` VARCHAR(45) NOT NULL,
  `id_localidad` SMALLINT NOT NULL,
  `cp_tienda` SMALLINT(5) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id_tienda`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`empleado` (
  `id_empleadp` SMALLINT NOT NULL AUTO_INCREMENT,
  `nombre_empleado` VARCHAR(45) NOT NULL,
  `apellido_empleado` VARCHAR(45) NOT NULL,
  `nif_empleado` VARCHAR(20) NOT NULL,
  `tienda_id_tienda` SMALLINT NOT NULL,
  `numero_empleado` INT NOT NULL,
  `cargo` SET('cocinero', 'repartidor') NOT NULL,
  PRIMARY KEY (`id_empleadp`),
  UNIQUE INDEX `nif_empleado_UNIQUE` (`nif_empleado` ASC) VISIBLE,
  INDEX `fk_empleado_tienda1_idx` (`tienda_id_tienda` ASC) VISIBLE,
  CONSTRAINT `fk_empleado_tienda1`
    FOREIGN KEY (`tienda_id_tienda`)
    REFERENCES `pizzeria1`.`tienda` (`id_tienda`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`productos_bebidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`productos_bebidas` (
  `id_bebeida` SMALLINT NOT NULL,
  `descripcion_pro` VARCHAR(100) NULL DEFAULT NULL,
  `precio_producto` DOUBLE(8,2) UNSIGNED NOT NULL,
  `foto_producto` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_bebeida`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`productos_hamburguesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`productos_hamburguesas` (
  `id_hamburguesa` SMALLINT NOT NULL AUTO_INCREMENT,
  `descripcion_pro` VARCHAR(100) NULL DEFAULT NULL,
  `precio_producto` DECIMAL(8,2) UNSIGNED NOT NULL,
  `foto_producto` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_hamburguesa`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`productos_pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`productos_pizza` (
  `id_pizza` SMALLINT NOT NULL AUTO_INCREMENT,
  `pizzas_14cm` SET('margarita', 'napolitana', 'hawaiana', 'peperoni', 'nulo') NULL DEFAULT NULL,
  `pizzas_17cm` SET('margarita', 'napolitana', 'hawaiana', 'peperoni', 'nulo') NULL DEFAULT NULL,
  `pizzas_21cm` SET('margarita', 'napolitana', 'hawaiana', 'peperoni', 'nulo') NULL DEFAULT NULL,
  `descripcion_pro` VARCHAR(100) NULL DEFAULT NULL,
  `precio_producto` DOUBLE(8,2) UNSIGNED NOT NULL,
  `foto_producto` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_pizza`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `pizzeria1`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria1`.`pedidos` (
  `id_pedido` SMALLINT NOT NULL AUTO_INCREMENT,
  `fecha_pedido` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo_pedido` SET('domicilio', 'recogida') NOT NULL,
  `id_pizza` SMALLINT NULL DEFAULT NULL,
  `id_hamburguesa` SMALLINT NULL DEFAULT NULL,
  `id_bebida` SMALLINT NULL DEFAULT NULL,
  `id_cliente` SMALLINT NOT NULL,
  `cantidad_id_pizza` SET('1', '2', '3', '4', '5', '6', '7', '8', '9') NULL DEFAULT NULL,
  `cantidad_id_hamburguesa` SET('1', '2', '3', '4', '5', '6', '7', '8', '9') NULL DEFAULT NULL,
  `cantidad_id_bebidas` SET('1', '2', '3', '4', '5', '6', '7', '8', '9') NULL DEFAULT NULL,
  `precio_total` DECIMAL(2,0) UNSIGNED ZEROFILL NOT NULL,
  `id_tienda` SMALLINT NOT NULL,
  `id_repartidor` SMALLINT NULL DEFAULT NULL,
  `fechahora_entrega_pedido` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE INDEX `id_cliente_UNIQUE` (`id_cliente` ASC) VISIBLE,
  INDEX `id_pizza_idx` (`id_pizza` ASC) VISIBLE,
  INDEX `id_hamburguesa_idx` (`id_hamburguesa` ASC) VISIBLE,
  INDEX `id_bebida_idx` (`id_bebida` ASC) VISIBLE,
  INDEX `fk_id_tienda_idx` (`id_tienda` ASC) VISIBLE,
  INDEX `fk_id_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_id_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `pizzeria1`.`cliente` (`id_cliente`),
  CONSTRAINT `fk_id_tienda`
    FOREIGN KEY (`id_tienda`)
    REFERENCES `pizzeria1`.`tienda` (`id_tienda`),
  CONSTRAINT `id_bebida`
    FOREIGN KEY (`id_bebida`)
    REFERENCES `pizzeria1`.`productos_bebidas` (`id_bebeida`),
  CONSTRAINT `id_hamburguesa`
    FOREIGN KEY (`id_hamburguesa`)
    REFERENCES `pizzeria1`.`productos_hamburguesas` (`id_hamburguesa`),
  CONSTRAINT `id_pizza`
    FOREIGN KEY (`id_pizza`)
    REFERENCES `pizzeria1`.`productos_pizza` (`id_pizza`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
