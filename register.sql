CREATE TABLE `technogeek`.`user` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(500) NOT NULL,
  `email` VARCHAR(500) NOT NULL,
  `password` VARCHAR(500) NOT NULL,
  `gender` VARCHAR(10) NOT NULL,
  ` about` VARCHAR(1000) NULL DEFAULT 'Hey ! I am using Techno Geek a Technological Blog ',
  `rdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));
