
-- Database: portfolio_analysis

-- Table structure for table `users`
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
);

-- Table structure for table `portfolios`
CREATE TABLE IF NOT EXISTS `portfolios` (
  `portfolio_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` INT(11) NOT NULL,
  `portfolio_name` VARCHAR(255) NOT NULL,
  `description` TEXT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`portfolio_id`),
  FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
);

-- Table structure for table `assets`
CREATE TABLE IF NOT EXISTS `assets` (
  `asset_id` INT(11) NOT NULL AUTO_INCREMENT,
  `portfolio_id` INT(11) NOT NULL,
  `asset_name` VARCHAR(255) NOT NULL,
  `asset_type` VARCHAR(50),
  `quantity` DECIMAL(10, 2) NOT NULL,
  `price_per_unit` DECIMAL(10, 2) NOT NULL,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`asset_id`),
  FOREIGN KEY (`portfolio_id`) REFERENCES `portfolios` (`portfolio_id`)
);

-- Table structure for table `transactions`
CREATE TABLE IF NOT EXISTS `transactions` (
  `transaction_id` INT(11) NOT NULL AUTO_INCREMENT,
  `asset_id` INT(11) NOT NULL,
  `transaction_type` ENUM('Buy', 'Sell') NOT NULL,
  `quantity` DECIMAL(10, 2) NOT NULL,
  `transaction_price` DECIMAL(10, 2) NOT NULL,
  `transaction_date` DATE NOT NULL,
  PRIMARY KEY (`transaction_id`),
  FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`)
);
