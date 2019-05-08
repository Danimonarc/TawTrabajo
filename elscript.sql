	-- MySQL Script generated by MySQL Workbench
	-- Fri May  3 20:53:37 2019
	-- Model: New Model    Version: 1.0
	-- MySQL Workbench Forward Engineering

	SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
	SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
	SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

	-- -----------------------------------------------------
	-- Schema taw
	-- -----------------------------------------------------

	-- -----------------------------------------------------
	-- Schema taw
	-- -----------------------------------------------------
	CREATE SCHEMA IF NOT EXISTS `taw` DEFAULT CHARACTER SET latin1 ;
	USE `taw` ;

	-- -----------------------------------------------------
	-- Table `taw`.`usuario`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `taw`.`usuario` (
	  `id` INT(11) NOT NULL	auto_increment,
	  `correo` VARCHAR(45) NOT NULL,
	  `contrasena` VARCHAR(45) NOT NULL,
	  `nombre` VARCHAR(45) NOT NULL,
	  `apellidos` VARCHAR(45) NULL DEFAULT NULL,
	  `fechaNacimiento` DATE NOT NULL,
	  PRIMARY KEY (`id`))
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = latin1;


	-- -----------------------------------------------------
	-- Table `taw`.`amigo`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `taw`.`amigo` (
	  `id1` INT(11) NOT NULL,
	  `id2` INT(11) NOT NULL,
	  PRIMARY KEY (`id1`, `id2`),
	  INDEX `userid2` (`id2` ASC) VISIBLE,
	  CONSTRAINT `userid1`
		FOREIGN KEY (`id1`)
		REFERENCES `taw`.`usuario` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	  CONSTRAINT `userid2`
		FOREIGN KEY (`id2`)
		REFERENCES `taw`.`usuario` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE)
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = latin1;


	-- -----------------------------------------------------
	-- Table `taw`.`grupo`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `taw`.`grupo` (
	  `id` INT(11) NOT NULL,
	  `nombre` VARCHAR(45) NOT NULL,
	  `descripcion` VARCHAR(45) NULL DEFAULT NULL,
	  `privado` TINYINT(4) NOT NULL,
	  `imagen` VARCHAR(45) NULL DEFAULT NULL,
	  PRIMARY KEY (`id`))
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = latin1
	COMMENT = '	';


	-- -----------------------------------------------------
	-- Table `taw`.`gruposusuario`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `taw`.`gruposusuario` (
	  `grupoId` INT(11) NOT NULL,
	  `usuarioId` INT(11) NOT NULL,
	  PRIMARY KEY (`grupoId`, `usuarioId`),
	  INDEX `usuarioFK` (`usuarioId` ASC) VISIBLE,
	  CONSTRAINT `grupoFK`
		FOREIGN KEY (`grupoId`)
		REFERENCES `taw`.`grupo` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	  CONSTRAINT `usuarioFK`
		FOREIGN KEY (`usuarioId`)
		REFERENCES `taw`.`usuario` (`id`)
		ON DELETE CASCADE
		ON UPDATE CASCADE)
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = latin1;


	-- -----------------------------------------------------
	-- Table `taw`.`post`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `taw`.`post` (
	  `id` INT(11) NOT NULL,
	  `contenido` VARCHAR(45) NOT NULL,
	  `privado` TINYINT(4) NOT NULL,
	  `grupo_id` INT(11) NULL,
	  `usuario_id` INT(11) NOT NULL,
	  PRIMARY KEY (`id`, `usuario_id`),
	  INDEX `fk_post_grupo1_idx` (`grupo_id` ASC) VISIBLE,
	  INDEX `fk_post_usuario1_idx` (`usuario_id` ASC) VISIBLE,
	  CONSTRAINT `fk_post_grupo1`
		FOREIGN KEY (`grupo_id`)
		REFERENCES `taw`.`grupo` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_post_usuario1`
		FOREIGN KEY (`usuario_id`)
		REFERENCES `taw`.`usuario` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB
	DEFAULT CHARACTER SET = latin1;


	-- -----------------------------------------------------
	-- Table `taw`.`comentario`
	-- -----------------------------------------------------
	CREATE TABLE IF NOT EXISTS `taw`.`comentario` (
	  `texto` LONGTEXT NULL,
	  `fecha` DATETIME NULL,
	  `post_id` INT(11) NOT NULL,
	  `usuario_id` INT(11) NOT NULL,
	  PRIMARY KEY (`post_id`, `usuario_id`),
	  INDEX `fk_comentario_usuario1_idx` (`usuario_id` ASC) VISIBLE,
	  CONSTRAINT `fk_comentario_post1`
		FOREIGN KEY (`post_id`)
		REFERENCES `taw`.`post` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
	  CONSTRAINT `fk_comentario_usuario1`
		FOREIGN KEY (`usuario_id`)
		REFERENCES `taw`.`usuario` (`id`)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION)
	ENGINE = InnoDB;


	SET SQL_MODE=@OLD_SQL_MODE;
	SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
	SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
	