 --Create database bookstore  
 CREATE DATABASE bookstore;

 -- We   use created database bookstore 
 USE bookstore;
 Database changed

 -- Create table customer
 CREATE TABLE customer (customer_id INT AUTO_INCREMENT PRIMARY KEY,
    -> first_name VARCHAR(50) NOT NULL,
    -> last_name VARCHAR(50) NOT NULL,
    -> email VARCHAR(30) NULL UNIQUE,
    -> phone VARCHAR(20));

 --  Create table country
 CREATE TABLE country(
    -> country_id INT AUTO_INCREMENT PRIMARY KEY,
    -> country_name VARCHAR(100) NOT NULL UNIQUE
    -> );

 -- Create table address status
  CREATE TABLE address(
    -> address_id INT AUTO_INCREMENT PRIMARY KEY,
    -> street VARCHAR(50) NOT NULL,
    -> city VARCHAR(50) NOT NULL,
    -> postal_code VARCHAR(20) NOT NULL,
    -> country_id INT  NOT NULL,
    -> FOREIGN KEY (country_id) REFERENCES country(country_id)
    -> );

 -- Create table address 
 CREATE TABLE address_status(
    -> status_id INT AUTO_INCREMENT PRIMARY KEY,
    -> status_name VARCHAR(50) NOT NULL UNIQUE
    -> );

 -- Create customer address table
 CREATE TABLE customer_address(
    -> customer_id INT NOT NULL,
    -> address_id INT NOT NULL,
    -> status_id INT NOT NULL,
    -> PRIMARY KEY (customer_id, address_id),
    -> FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    -> FOREIGN KEY (address_id) REFERENCES address(address_id),
    -> FOREIGN KEY (status_id) REFERENCES address_status(status_id)
    -> );
