-- Disable foreign key checks to prevent errors while dropping tables
SET FOREIGN_KEY_CHECKS = 0;

-- Drop tables in the correct order (dependent tables first)
DROP TABLE IF EXISTS `rota`;
DROP TABLE IF EXISTS `shift`;
DROP TABLE IF EXISTS `staff`;
DROP TABLE IF EXISTS `inventory`;
DROP TABLE IF EXISTS `check_out`;
DROP TABLE IF EXISTS `item`;
DROP TABLE IF EXISTS `student`;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- Recreate tables

CREATE TABLE `student` (
    `student_id` INT NOT NULL AUTO_INCREMENT,
    `gender` VARCHAR(20),
    `first_name` VARCHAR(20),
    `last_name` VARCHAR(20),
    `email` VARCHAR(255),
    `program` VARCHAR(200) NULL,
    PRIMARY KEY (`student_id`)
);

CREATE TABLE `item` (
    `item_id` INT NOT NULL AUTO_INCREMENT,
    `item_cat` VARCHAR(200) NOT NULL,
    `item_name` VARCHAR(200) NOT NULL,
    `item_size` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`item_id`),
    CONSTRAINT `uc_item_item_name` UNIQUE (`item_name`)
);

CREATE TABLE `check_out` (
    `check_out_id` INT NOT NULL AUTO_INCREMENT,
    `student_id` INT NOT NULL,
    `date` DATE,
    `item_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`check_out_id`),
    CONSTRAINT `fk_check_out_student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_check_out_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
);

-- Ensure `date` is indexed for foreign key reference
CREATE INDEX `idx_check_out_date` ON `check_out` (`date`);

CREATE TABLE `inventory` (
    `inv_id` INT NOT NULL AUTO_INCREMENT,
    `item_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    PRIMARY KEY (`inv_id`),
    CONSTRAINT `fk_inventory_item_id` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE
);

CREATE TABLE `staff` (
    `staff_id` VARCHAR(20) NOT NULL,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `position` VARCHAR(100) NOT NULL,
    `hourly_rate` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`staff_id`)
);

CREATE TABLE `shift` (
    `shift_id` VARCHAR(20) NOT NULL,
    `day_of_week` VARCHAR(10) NOT NULL,
    `start_time` TIME NOT NULL,
    `end_time` TIME NOT NULL,
    PRIMARY KEY (`shift_id`)
);

CREATE TABLE `rota` (
    `row_id` INT NOT NULL AUTO_INCREMENT,
    `rota_id` VARCHAR(20) NOT NULL,
    `date` DATE NOT NULL,
    `shift_id` VARCHAR(20) NOT NULL,
    `staff_id` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`row_id`),
    CONSTRAINT `fk_rota_shift_id` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_rota_staff_id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE,
    CONSTRAINT `fk_rota_date` FOREIGN KEY (`date`) REFERENCES `check_out` (`date`) ON DELETE CASCADE
);

-- Create Index for fast search on first_name in student table
CREATE INDEX `idx_student_first_name` ON `student` (`first_name`);
