-- Create the MySQL database and analysis table.
-- After running this script, use MySQL Workbench's Table Data Import Wizard
-- to import data/processed/customer_behavior_cleaned.csv into `customer`.

CREATE DATABASE IF NOT EXISTS customer_behavior;
USE customer_behavior;

DROP TABLE IF EXISTS customer;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    age INT NOT NULL,
    gender VARCHAR(20) NOT NULL,
    item_purchased VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    purchase_amount DECIMAL(10, 2) NOT NULL,
    location VARCHAR(50) NOT NULL,
    size VARCHAR(10) NOT NULL,
    color VARCHAR(50) NOT NULL,
    season VARCHAR(20) NOT NULL,
    review_rating DECIMAL(3, 1) NOT NULL,
    subscription_status VARCHAR(10) NOT NULL,
    shipping_type VARCHAR(50) NOT NULL,
    discount_applied VARCHAR(10) NOT NULL,
    previous_purchases INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    frequency_of_purchases VARCHAR(50) NOT NULL,
    age_group VARCHAR(30) NOT NULL,
    purchase_frequency_days INT NOT NULL
);

