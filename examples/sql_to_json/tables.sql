CREATE TABLE `example`(
`id` INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id),
`title` VARCHAR(200) NOT NULL,
`author` VARCHAR(100) NOT NULL
);

INSERT INTO `example`(`id`, `title`, `author`) VALUES (null, 'This is the example', 'Ensetgeek');
INSERT INTO `example`(`id`, `title`, `author`) VALUES (null, 'Example of MyJSON', 'Ensetgeek');
INSERT INTO `example`(`id`, `title`, `author`) VALUES (null, 'Only in CodeCanyon', 'Ensetgeek');
INSERT INTO `example`(`id`, `title`, `author`) VALUES (null, 'Hope you enjoy it!', 'Ensetgeek');