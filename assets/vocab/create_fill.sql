-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema vocab
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema vocab
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `vocab` DEFAULT CHARACTER SET utf8 ;
USE `vocab` ;

-- -----------------------------------------------------
-- Table `vocab`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`language` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` CHAR(2) NULL,
  `title` VARCHAR(16) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`frequency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`frequency` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` SMALLINT(1) UNSIGNED NOT NULL,
  `label` VARCHAR(45) NOT NULL,
  `description` VARCHAR(128) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `value_UNIQUE` (`value` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`pos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`pos` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NULL,
  `short` VARCHAR(8) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `value_UNIQUE` (`value` ASC) VISIBLE,
  UNIQUE INDEX `short_UNIQUE` (`short` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`lexeme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`lexeme` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(128) NOT NULL,
  `description` VARCHAR(45) NULL,
  `note` VARCHAR(128) NULL,
  `origin` TEXT NULL,
  `created_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `language_id` INT UNSIGNED NOT NULL DEFAULT 1,
  `frequency_id` INT UNSIGNED NULL,
  `pos_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lexeme_language1_idx` (`language_id` ASC) VISIBLE,
  INDEX `fk_lexeme_frequency1_idx` (`frequency_id` ASC) VISIBLE,
  INDEX `fk_lexeme_pos1_idx` (`pos_id` ASC) VISIBLE,
  CONSTRAINT `fk_lexeme_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `vocab`.`language` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lexeme_frequency1`
    FOREIGN KEY (`frequency_id`)
    REFERENCES `vocab`.`frequency` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lexeme_pos1`
    FOREIGN KEY (`pos_id`)
    REFERENCES `vocab`.`pos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`level` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` CHAR(2) NOT NULL,
  `label` VARCHAR(32) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `value_UNIQUE` (`value` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`label`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`label` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(32) NULL,
  `short` VARCHAR(8) NULL,
  `pos_id` INT UNSIGNED NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`pronunciation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`pronunciation` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NULL,
  `audio_path` VARCHAR(256) NULL,
  `lexeme_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pronunciation_lexeme1_idx` (`lexeme_id` ASC) VISIBLE,
  CONSTRAINT `fk_pronunciation_lexeme1`
    FOREIGN KEY (`lexeme_id`)
    REFERENCES `vocab`.`lexeme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`meaning`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`meaning` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(128) NULL,
  `translation` VARCHAR(128) NOT NULL,
  `note` VARCHAR(128) NULL,
  `commentary` TEXT NULL,
  `created_ts` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `lexeme_id` INT UNSIGNED NOT NULL,
  `level_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meaning_lexeme1_idx` (`lexeme_id` ASC) VISIBLE,
  INDEX `fk_meaning_level1_idx` (`level_id` ASC) VISIBLE,
  CONSTRAINT `fk_meaning_lexeme1`
    FOREIGN KEY (`lexeme_id`)
    REFERENCES `vocab`.`lexeme` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meaning_level1`
    FOREIGN KEY (`level_id`)
    REFERENCES `vocab`.`level` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`tag`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`tag` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(32) NULL,
  `short` VARCHAR(8) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`quote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`quote` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `excerpt` LONGTEXT NULL,
  `source` VARCHAR(128) NULL,
  `meaning_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quote_meaning1_idx` (`meaning_id` ASC) VISIBLE,
  CONSTRAINT `fk_quote_meaning1`
    FOREIGN KEY (`meaning_id`)
    REFERENCES `vocab`.`meaning` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`tag_meaning`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`tag_meaning` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tag_id` INT UNSIGNED NOT NULL,
  `meaning_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tag_meaning_tag1_idx` (`tag_id` ASC) VISIBLE,
  INDEX `fk_tag_meaning_meaning1_idx` (`meaning_id` ASC) VISIBLE,
  CONSTRAINT `fk_tag_meaning_tag1`
    FOREIGN KEY (`tag_id`)
    REFERENCES `vocab`.`tag` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tag_meaning_meaning1`
    FOREIGN KEY (`meaning_id`)
    REFERENCES `vocab`.`meaning` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vocab`.`label_meaning`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `vocab`.`label_meaning` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `label_id` INT UNSIGNED NOT NULL,
  `meaning_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_label_meaning_label1_idx` (`label_id` ASC) VISIBLE,
  INDEX `fk_label_meaning_meaning1_idx` (`meaning_id` ASC) VISIBLE,
  CONSTRAINT `fk_label_meaning_label1`
    FOREIGN KEY (`label_id`)
    REFERENCES `vocab`.`label` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_label_meaning_meaning1`
    FOREIGN KEY (`meaning_id`)
    REFERENCES `vocab`.`meaning` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `vocab`.`language`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`language` (`id`, `code`, `title`) VALUES (1, 'en', 'English');
INSERT INTO `vocab`.`language` (`id`, `code`, `title`) VALUES (2, 'de', 'German');
INSERT INTO `vocab`.`language` (`id`, `code`, `title`) VALUES (3, 'fr', 'French');
INSERT INTO `vocab`.`language` (`id`, `code`, `title`) VALUES (4, 'ru', 'Russian');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`frequency`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`frequency` (`id`, `value`, `label`, `description`) VALUES (1, 1, 'used rarely', 'in the lower 50% of commonly used words');
INSERT INTO `vocab`.`frequency` (`id`, `value`, `label`, `description`) VALUES (2, 2, 'used occasionally', 'one of the 30000 mostly common used words');
INSERT INTO `vocab`.`frequency` (`id`, `value`, `label`, `description`) VALUES (3, 3, 'in common usage', 'one of the 10000 mostly common used words');
INSERT INTO `vocab`.`frequency` (`id`, `value`, `label`, `description`) VALUES (4, 4, 'very common', 'on of the 4000 mostly common used words');
INSERT INTO `vocab`.`frequency` (`id`, `value`, `label`, `description`) VALUES (5, 5, 'extemely common', 'on the 1000 mostly common used words');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`pos`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (1, 'adjective', 'adj.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (2, 'adverb', 'adv.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (3, 'article', 'art.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (4, 'combining form', 'comb.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (5, 'conjunction', 'conj.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (6, 'determiner', 'det.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (7, 'expression', 'exp.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (8, 'interjection', 'int.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (9, 'noun', 'n.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (10, 'numeral', 'num.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (11, 'phrase', 'phr.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (12, 'postfix', 'postf.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (13, 'predeterminer', 'predet.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (14, 'prefix', 'pref.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (15, 'preposition', 'prep.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (16, 'pronoun', 'pron.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (17, 'suffix', 'suff.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (18, 'verb', 'v.');
INSERT INTO `vocab`.`pos` (`id`, `value`, `short`) VALUES (19, 'particle', 'part.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`lexeme`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`lexeme` (`id`, `value`, `description`, `note`, `origin`, `created_ts`, `language_id`, `frequency_id`, `pos_id`) VALUES (1, 'Volk', NULL, NULL, NULL, DEFAULT, 2, NULL, 9);
INSERT INTO `vocab`.`lexeme` (`id`, `value`, `description`, `note`, `origin`, `created_ts`, `language_id`, `frequency_id`, `pos_id`) VALUES (2, 'people', NULL, NULL, NULL, DEFAULT, 1, 5, 9);
INSERT INTO `vocab`.`lexeme` (`id`, `value`, `description`, `note`, `origin`, `created_ts`, `language_id`, `frequency_id`, `pos_id`) VALUES (3, 'clever', 'smart', NULL, NULL, DEFAULT, 1, 3, 1);
INSERT INTO `vocab`.`lexeme` (`id`, `value`, `description`, `note`, `origin`, `created_ts`, `language_id`, `frequency_id`, `pos_id`) VALUES (4, 'beautiful', 'attractive', NULL, NULL, DEFAULT, 1, 4, 1);
INSERT INTO `vocab`.`lexeme` (`id`, `value`, `description`, `note`, `origin`, `created_ts`, `language_id`, `frequency_id`, `pos_id`) VALUES (5, 'pretty', 'attractive', NULL, NULL, DEFAULT, 1, 4, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`level`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (1, 'a0', 'beginner');
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (2, 'a1', 'elementary');
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (3, 'a2', 'pre-intermediate');
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (4, 'b1', 'intermediate');
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (5, 'b2', 'upper intermediate');
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (6, 'c1', 'advanced');
INSERT INTO `vocab`.`level` (`id`, `value`, `label`) VALUES (7, 'c2', 'proficient');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`label`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (1, 'comparative', 'comp.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (2, 'postonminal', 'postnom.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (3, 'postpositive', 'postpos.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (4, 'predicative', 'pred.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (5, 'prenominal', 'prenom.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (6, 'superlative', 'sup.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (7, 'ungradable', 'ungrad.', 1);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (8, 'idiom', 'idiom', 7);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (9, 'proverb', 'prov.', 7);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (10, 'abbreviation', 'abbr.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (11, 'acronym', 'acr.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (12, 'countable', 'count.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (13, 'feminine', 'fem.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (14, 'masculine', 'masc.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (15, 'neuter', 'neut.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (16, 'plural', 'pl.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (17, 'singular', 'sing.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (18, 'uncountable', 'uncount.', 9);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (19, 'cardinal', 'card.', 10);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (20, 'ordinal', 'ord.', 10);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (21, 'idiom', 'idiom', 11);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (22, 'demonstrative', 'dem.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (23, 'indefinite', 'indef.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (24, 'interrogative', 'int.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (25, 'objective', 'obj.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (26, 'personal', 'pers.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (27, 'possessive', 'poss.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (28, 'predicate', 'predic.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (29, 'reflexive', 'refl.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (30, 'relative', 'rel.', 16);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (31, 'auxiliary', 'aux.', 18);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (32, 'irregular', 'irr.', 18);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (33, 'intransitive', 'intr.', 18);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (34, 'linking', 'link.', 18);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (35, 'modal', 'mod.', 18);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (36, 'phrasal', 'phr.', 18);
INSERT INTO `vocab`.`label` (`id`, `value`, `short`, `pos_id`) VALUES (37, 'transitive', 'tr.', 18);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`pronunciation`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`pronunciation` (`id`, `value`, `audio_path`, `lexeme_id`) VALUES (1, 'ˈpiː.pəl', NULL, 2);
INSERT INTO `vocab`.`pronunciation` (`id`, `value`, `audio_path`, `lexeme_id`) VALUES (2, 'fɔlk', NULL, 1);
INSERT INTO `vocab`.`pronunciation` (`id`, `value`, `audio_path`, `lexeme_id`) VALUES (3, 'ˈklev.ɚ', NULL, 3);
INSERT INTO `vocab`.`pronunciation` (`id`, `value`, `audio_path`, `lexeme_id`) VALUES (4, 'ˈbjuː.tɪ.fəl', NULL, 4);
INSERT INTO `vocab`.`pronunciation` (`id`, `value`, `audio_path`, `lexeme_id`) VALUES (5, 'ˈprɪt.i', NULL, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`meaning`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`meaning` (`id`, `description`, `translation`, `note`, `commentary`, `created_ts`, `lexeme_id`, `level_id`) VALUES (1, 'Gruppe von Menschen mit gleicher Kultur, Sprache und Geschichte', 'люди', NULL, NULL, NULL, 1, 1);
INSERT INTO `vocab`.`meaning` (`id`, `description`, `translation`, `note`, `commentary`, `created_ts`, `lexeme_id`, `level_id`) VALUES (2, 'men, women, and children', 'люди', NULL, NULL, NULL, 2, 1);
INSERT INTO `vocab`.`meaning` (`id`, `description`, `translation`, `note`, `commentary`, `created_ts`, `lexeme_id`, `level_id`) VALUES (3, 'having or showing the ability to learn and understand things quickly and easily', 'умный', NULL, NULL, NULL, 3, 2);
INSERT INTO `vocab`.`meaning` (`id`, `description`, `translation`, `note`, `commentary`, `created_ts`, `lexeme_id`, `level_id`) VALUES (4, 'very attractive', 'красивый, прекрасный', NULL, NULL, NULL, 4, 2);
INSERT INTO `vocab`.`meaning` (`id`, `description`, `translation`, `note`, `commentary`, `created_ts`, `lexeme_id`, `level_id`) VALUES (5, 'pleasant to look at, or (especially of girls or women or things relating to them) attractive or pleasant in a delicate way', 'симпатичный', NULL, NULL, NULL, 5, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`tag`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (1, 'approving', 'appr.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (2, 'archaic', 'arch.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (3, 'Black', 'Bl.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (4, 'derogatory', 'derog.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (5, 'disapproving', 'disappr.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (6, 'formal', 'form.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (7, 'humorous', 'humor.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (8, 'informal', 'inf.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (9, 'literary', 'lit.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (10, 'offensive', 'offens.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (11, 'old-fashioned', 'old.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (12, 'slang', 'sl.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (13, 'taboo', 'taboo');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (14, 'UK', 'UK');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (15, 'urban', 'urb.');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (16, 'US', 'US');
INSERT INTO `vocab`.`tag` (`id`, `value`, `short`) VALUES (17, 'vulgar', 'vulg.');

COMMIT;


-- -----------------------------------------------------
-- Data for table `vocab`.`quote`
-- -----------------------------------------------------
START TRANSACTION;
USE `vocab`;
INSERT INTO `vocab`.`quote` (`id`, `excerpt`, `source`, `meaning_id`) VALUES (1, 'Tim is clever.', NULL, 3);
INSERT INTO `vocab`.`quote` (`id`, `excerpt`, `source`, `meaning_id`) VALUES (2, 'Sue is beautiful.', NULL, 4);
INSERT INTO `vocab`.`quote` (`id`, `excerpt`, `source`, `meaning_id`) VALUES (3, 'Mary and Sue are pretty.', NULL, 5);
INSERT INTO `vocab`.`quote` (`id`, `excerpt`, `source`, `meaning_id`) VALUES (4, 'That\'s a pretty hat you\'re wearing.', NULL, 5);
INSERT INTO `vocab`.`quote` (`id`, `excerpt`, `source`, `meaning_id`) VALUES (5, 'She\'s a very charming and very pretty girl. ', NULL, 5);

COMMIT;

