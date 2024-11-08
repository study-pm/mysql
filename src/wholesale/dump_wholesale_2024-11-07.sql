-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wholesale
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wholesale
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wholesale` DEFAULT CHARACTER SET utf8 ;
USE `wholesale` ;

-- -----------------------------------------------------
-- Table `wholesale`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wholesale`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор товара',
  `title` VARCHAR(128) NOT NULL COMMENT 'Наименование товара',
  `price` DECIMAL(8,2) NOT NULL,
  `priority` TINYINT NOT NULL COMMENT 'Приоритетность товара (чем выше приоритет, тем более востребованным является товар)',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = 'Таблица товарных позиций (Каталог товаров)';


-- -----------------------------------------------------
-- Table `wholesale`.`sale`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wholesale`.`sale` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор заявки',
  `quantity` SMALLINT UNSIGNED NOT NULL COMMENT 'Количество товара',
  `create_ts` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата создания записи',
  `product_id` INT UNSIGNED NOT NULL COMMENT 'Идентификатор товара',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_order_Product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_Product`
    FOREIGN KEY (`product_id`)
    REFERENCES `wholesale`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Таблица заявок (Журнал реализации)';


-- -----------------------------------------------------
-- Table `wholesale`.`stock1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wholesale`.`stock1` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор записи',
  `quantity` SMALLINT UNSIGNED NOT NULL COMMENT 'Количество товара на складе',
  `product_id` INT UNSIGNED NOT NULL COMMENT 'Идентификатор товара',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_cash_Product1_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `Product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_cash_Product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `wholesale`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Таблица состояния ближнего склада (Наполнение кэш-склада)';


-- -----------------------------------------------------
-- Table `wholesale`.`stock2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wholesale`.`stock2` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` SMALLINT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL COMMENT 'Идентификатор товара',
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_store_Product1_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `Product_id_UNIQUE` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_store_Product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `wholesale`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Таблица состояния удаленного склада (Наполнение дальнего склада)';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `wholesale`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `wholesale`;
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (1, '10.4\" Планшет HUAWEI MatePad SE LTE 128 ГБ черный', 15999, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (2, 'Карта памяти Patriot EP microSDXC 1024 ГБ [PEF1TBEP31MCX]', 10499, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (3, 'Сушильная машина Gorenje D2HNA92/C серый', 57999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (4, 'Умная колонка VK Капсула Мини серый', 5499, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (5, 'Кронштейн для ТВ DEXP BL-55CFTS-3 черный', 5399, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (6, 'Посудомоечная машина Hotpoint HFS 1C57 белый', 309999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (7, '16\" Ноутбук HUAWEI MateBook D 16 2024 MCLF-X серый', 53299, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (8, 'Стиральная машина Samsung WW60AG4S00CELP белый', 37999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (9, 'Наушники TWS Realme Buds Air 5 Pro черный', 7999, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (10, 'Стиральная машина Hotpoint-Ariston NSB 7239 ZK VE RU белый', 28999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (11, '4 ТБ Жесткий диск WD Purple Surveillance [WD43PURZ]', 13499, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (12, '50\" (127 см) LED-телевизор Xiaomi TV A 50 2025 черный', 34999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (13, '6.1\" Смартфон Apple iPhone 15 128 ГБ черный', 81899, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (14, 'Наушники TWS Honor Choice Earbuds X5 Pro серый', 3499, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (15, '6.78\" Смартфон HONOR 200 Pro 512 ГБ черный', 64999, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (16, '16\" Ноутбук HONOR MagicBook X 16 2024 Born-F5651C серый', 67999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (17, '17.3\" Ноутбук Machenike L17 Satellite серебристый', 99999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (18, 'Процессор Intel Core i5-12400F OEM', 11499, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (19, 'Оперативная память Kingston FURY Beast Black [KF432C16BBK2/16] 16 ГБ', 4199, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (20, 'Аэрогриль Viomi Smart Air Fryer Pro 6L черный', 9999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (21, 'Встраиваемая посудомоечная машина Hotpoint HI 5D84 DW', 52999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (22, 'Материнская плата MSI PRO H610M-E DDR4', 7199, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (23, '16\" Ноутбук HONOR MagicBook Pro 16 фиолетовый', 134999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (24, 'Корпус Cougar Duoface Pro RGB [CGR-5AD1B-RGB ] черный', 8499, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (25, 'Видеокарта KFA2 GeForce RTX 4060 CORE Black [46NSL8MD9NXK]', 36999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (26, 'Контроллер присоединения МИР КПР-01М', 578.90, 0);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (27, 'Портативная игровая консоль Steam Deck OLED', 96999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (28, '6.6\" Смартфон Samsung Galaxy A55 5G 256 ГБ синий', 42999, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (29, 'Игровая консоль PlayStation 5 Slim', 66999, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (30, 'Геймпад беспроводной/проводной 8BitDo Ultimate 2.4G черный', 4399, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (31, 'Смарт-часы Apple Watch SE 2023 40mm', 26999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (32, 'Фен Dyson Supersonic HD07 серый/коричневый', 38999, 0);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (33, 'Блок питания Cougar GEX850 [31GE085001P01] черный', 10199, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (34, 'Электрочайник Aceline EK-P2000W бежевый', 999, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (35, 'Вытяжка телескопическая Aceline ET-45W белый/белый', 4999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (36, 'Коммутатор TP-Link LS1005G', 1299, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (37, '6.53\" Смартфон Xiaomi Redmi 9C 128 ГБ серый', 12999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (38, '4 ТБ Жесткий диск Seagate BarraCuda [ST4000DM004]', 11599, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (39, 'Пневматический очиститель Konoos KAD-520FI', 850, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (40, 'Фен Philips BHD300/10 белый/розовый', 2199, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (41, 'Процессор Intel Core i5-13400 OEM', 20999, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (42, 'Корпус Cougar MX410 Mesh [CGR-5VM6B-MESH] черный', 4599, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (43, 'Блок питания Cougar BXM 700W [CGR BXM-700] оранжевый, черный', 7999, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (44, 'Кулер для процессора DEEPCOOL AG300 MARRS [R-AG300-BKMNMN-G]', 1799, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (45, 'Материнская плата MSI PRO B760M-A WIFI DDR4', 14499, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (46, 'Оперативная память Apacer NOX [AH4U32G32C28YMBAA-2] 32 ГБ', 6999, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (47, '500 ГБ SSD M.2 накопитель MSI SPATIUM M390 [S78-440K170-P83]', 4599, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (48, 'Переходник однонаправленный DEXP HDMI - DVI-I', 180, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (49, 'Мышь проводная Logitech M90 [910-001970] черный', 599, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (50, 'Память USB Flash 16 ГБ Netac U182 [NT03U182N-016G-30RE]', 450, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (51, 'Ретро-консоль DEXP RetroGAME 6 + 777 игр', 3199, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (52, 'Кард-ридер DEXP RM-01', 350, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (53, 'Карта памяти Smartbuy microSDHC 32 ГБ [SB32GBSDCL10-01]', 599, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (54, '4 ТБ Жесткий диск WD Blue [WD40EZAZ]', 9299, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (55, 'Переключатель ORIENT HS0301L+', 850, 0);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (56, 'Кабель FinePower HDMI - DVI-D, 3 м', 550, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (57, 'Геймпад проводной 8BitDo Ultimate for PC черный', 2299, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (58, 'Стол компьютерный МФ Мастер Интерплей-1 черный/красный', 4999, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (59, '4 ТБ Жесткий диск Toshiba DT02 [DT02ABA400]', 12699, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (60, '4 ТБ Жесткий диск Toshiba DT02-V [DT02ABA400V]', 11999, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (61, '24\" Монитор Samsung S24C310EAI черный', 9999, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (62, '6.6\" Смартфон Samsung Galaxy A14 64 ГБ черный', 12199, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (63, '480 ГБ 2.5\" SATA накопитель Kingston A400 [SA400S37/480G]', 3999, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (64, 'Память USB Flash 32 ГБ Smartbuy Crown', 499, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (65, 'Память USB Flash 32 ГБ Smartbuy Clue [SB32GBCLU-K3]', 599, 4);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (66, '8 ТБ Жесткий диск Seagate BarraCuda [ST8000DM004]', 19599, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (67, '8 ТБ Жесткий диск Seagate SkyHawk [ST8000VX010]', 19499, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (68, 'Инструмент для обжима TALON TOOL HT-500R', 1050, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (69, 'Кабельный тестер Aceline T-1', 499, 3);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (70, 'Коннектор RJ45 FinePower RJ45 кат.6e 8P8C', 99, 2);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (71, 'Коннектор RJ45 FinePower RJ45 кат.5е 8P8C', 99, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (72, 'Батарейка FinePower Ultra крона / 6LR61', 250, 1);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (73, 'Изолирующий защитный колпачок RJ45 FinePower RJ45', 89, 5);
INSERT INTO `wholesale`.`product` (`id`, `title`, `price`, `priority`) VALUES (74, 'Батарейка GP Super AA / AA (LR6/ER14505/FR6/R6P)', 250, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wholesale`.`sale`
-- -----------------------------------------------------
START TRANSACTION;
USE `wholesale`;
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (1, 10, '2024-08-03 09:10:03', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (2, 3, '2024-05-07 19:12:24', 1);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (3, 2, '2024-06-05 10:32:15', 8);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (4, 1, '2024-03-25 17:14:33', 3);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (5, 5, '2024-04-17 18:45:02', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (6, 3, '2024-09-21 12:48:01', 22);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (7, 4, '2023-12-30 13:51:45', 11);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (8, 22, '2023-11-12 11:24:42', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (9, 2, '2024-10-21 12:49:00', 18);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (10, 2, '2024-10-15 09:42:27', 25);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (11, 3, '2024-09-24 14:24:08', 4);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (12, 1, '2023-11-02 10:13:08', 17);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (13, 6, '2024-07-14 17:23:51', 19);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (14, 4, '2023-10-27 14:42:09', 5);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (15, 1, '2024-03-15 19:24:05', 23);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (16, 1, '2024-10-03 08:10:13', 28);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (17, 1, '2024-09-25 19:12:20', 29);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (18, 2, '2024-08-13 12:47:12', 30);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (19, 1, '2024-10-21 08:25:59', 31);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (20, 1, '2024-10-22 15:15:08', 23);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (21, 2, '2024-10-22 16:44:17', 33);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (22, 3, '2024-10-22 19:40:04', 34);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (23, 2, '2024-04-18 11:14:22', 27);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (24, 1, '2024-10-22 21:49:02', 35);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (25, 4, '2024-07-26 08:59:03', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (26, 1, '2023-11-17 12:02:19', 13);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (27, 2, '2024-10-25 13:45:52', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (28, 1, '2024-10-24 09:23:47', 22);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (29, 3, '2023-12-08 14:25:07', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (30, 2, '2024-10-25 13:47:13', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (31, 2, '2024-10-24 12:34:17', 14);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (32, 1, '2024-10-23 19:22:35', 28);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (33, 1, '2023-01-01 17:45:00', 37);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (34, 1, '2023-01-16 12:06:00', 38);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (35, 1, '2023-01-18 17:03:00', 39);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (36, 1, '2023-03-03 17:05:05', 40);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (37, 1, '2023-05-08 17:27:00', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (38, 1, '2023-05-08 17:27:00', 41);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (39, 1, '2023-05-08 17:27:00', 42);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (40, 1, '2023-05-08 17:27:00', 43);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (41, 1, '2023-05-08 17:27:00', 44);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (42, 1, '2023-05-08 17:27:00', 45);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (43, 2, '2023-05-08 17:27:00', 46);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (44, 2, '2023-05-08 17:27:00', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (45, 1, '2023-05-08 17:27:00', 48);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (46, 1, '2023-05-09 10:53:00', 49);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (47, 1, '2023-05-09 10:57:00', 50);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (48, 1, '2023-06-01 19:07:00', 51);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (49, 1, '2023-06-18 18:10:00', 52);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (50, 1, '2023-06-18 18:14:00', 53);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (51, 1, '2023-06-25 18:35:00', 54);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (52, 1, '2023-07-12 14:37:00', 55);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (53, 1, '2023-07-12 14:39:00', 56);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (54, 1, '2023-09-19 17:45:00', 57);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (55, 1, '2023-11-23 13:43:00', 54);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (56, 1, '2023-11-27 18:29:00', 58);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (57, 1, '2024-01-06 16:32:00', 59);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (58, 1, '2024-02-01 11:40:00', 60);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (59, 1, '2024-02-03 16:56:00', 61);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (60, 1, '2024-02-17 16:20:00', 62);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (61, 1, '2024-03-09 19:27:00', 63);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (62, 1, '2024-03-09 19:47:00', 64);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (63, 1, '2024-03-09 19:47:00', 65);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (64, 1, '2024-05-02 18:43:00', 66);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (65, 2, '2024-10-26 19:12:13', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (66, 1, '2024-10-26 20:48:03', 14);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (67, 1, '2024-10-26 20:48:57', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (68, 1, '2024-10-25 18:49:07', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (69, 1, '2024-10-26 20:49:07', 44);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (70, 1, '2024-10-26 20:50:12', 41);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (71, 1, '2024-08-05 11:49:00', 67);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (72, 1, '2024-08-05 11:52:00', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (73, 1, '2024-09-02 18:07:00', 36);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (74, 1, '2024-09-02 18:56:08', 2);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (75, 1, '2024-08-25 12:32:59', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (76, 1, '2024-10-26 20:59:45', 9);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (77, 1, '2024-09-02 18:36:00', 68);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (78, 1, '2024-09-02 18:36:00', 69);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (79, 3, '2024-09-02 18:36:00', 70);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (80, 1, '2024-09-02 19:19:00', 72);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (81, 1, '2024-09-16 17:56:00', 73);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (82, 1, '2024-09-16 17:56:00', 71);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (83, 1, '2024-09-16 17:56:00', 36);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (84, 1, '2024-09-29 18:28:00', 74);
INSERT INTO `wholesale`.`sale` (`id`, `quantity`, `create_ts`, `product_id`) VALUES (85, 1, '2024-09-30 19:20:00', 36);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wholesale`.`stock1`
-- -----------------------------------------------------
START TRANSACTION;
USE `wholesale`;
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (1, 14, 9);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (2, 3, 16);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (3, 4, 5);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (4, 2, 17);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (5, 6, 19);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (6, 4, 11);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (7, 2, 22);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (8, 3, 18);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (9, 2, 7);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (10, 5, 14);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (11, 2, 24);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (12, 3, 28);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (13, 1, 29);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (14, 3, 30);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (15, 1, 31);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (16, 4, 4);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (17, 1, 33);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (18, 6, 34);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (19, 5, 15);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (20, 1, 23);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (21, 2, 25);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (22, 2, 27);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (23, 3, 36);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (24, 3, 39);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (28, 3, 41);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (29, 1, 43);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (30, 3, 44);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (31, 2, 45);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (32, 2, 46);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (33, 4, 48);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (34, 3, 50);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (35, 4, 51);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (36, 4, 52);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (37, 9, 53);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (38, 3, 56);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (39, 1, 60);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (40, 1, 61);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (41, 9, 63);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (42, 12, 64);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (43, 3, 65);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (44, 1, 66);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (45, 2, 68);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (46, 2, 69);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (47, 6, 70);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (48, 14, 71);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (49, 9, 72);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (50, 7, 73);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (25, 1, 2);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (26, 1, 13);
INSERT INTO `wholesale`.`stock1` (`id`, `quantity`, `product_id`) VALUES (27, 1, 37);

COMMIT;


-- -----------------------------------------------------
-- Data for table `wholesale`.`stock2`
-- -----------------------------------------------------
START TRANSACTION;
USE `wholesale`;
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (1, 12, 28);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (2, 3, 19);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (3, 7, 13);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (4, 9, 15);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (5, 25, 14);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (6, 2, 10);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (7, 5, 17);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (8, 6, 22);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (9, 1, 12);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (10, 8, 11);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (11, 3, 29);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (12, 11, 1);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (13, 7, 30);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (14, 1, 3);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (15, 3, 31);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (16, 9, 5);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (17, 8, 4);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (18, 4, 33);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (19, 2, 7);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (20, 12, 34);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (21, 33, 9);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (22, 1, 35);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (23, 13, 36);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (24, 3, 37);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (25, 4, 38);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (26, 7, 39);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (27, 2, 40);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (28, 89, 41);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (29, 0, 42);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (30, 0, 43);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (31, 150, 44);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (32, 10, 45);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (33, 3, 46);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (34, 0, 47);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (35, 11, 48);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (36, 1, 49);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (37, 4, 50);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (38, 13, 51);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (39, 5, 52);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (40, 9, 53);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (41, 0, 54);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (42, 0, 55);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (43, 3, 56);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (44, 0, 57);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (45, 2, 58);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (46, 0, 59);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (47, 1, 60);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (48, 125, 61);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (49, 0, 62);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (50, 3131, 63);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (51, 621, 64);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (52, 80, 65);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (53, 2, 66);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (54, 0, 67);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (55, 2, 68);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (56, 15, 2);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (57, 2, 69);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (58, 7, 70);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (59, 568, 71);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (60, 208, 72);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (61, 8, 73);
INSERT INTO `wholesale`.`stock2` (`id`, `quantity`, `product_id`) VALUES (62, 0, 74);

COMMIT;

