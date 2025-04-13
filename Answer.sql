 --Create database bookstore  
 CREATE DATABASE bookstore;

 -- We   use created database bookstore 
 USE bookstore;
 Database changed

 -- Create table customer
 CREATE TABLE customer (customer_id INT AUTO_INCREMENT PRIMARY KEY,
    -> first_name VARCHAR(50) NOT NULL,
    -> last_name VARCHAR(50) NOT NULL,
    -> email VARCHAR(30) NOT NULL UNIQUE,
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



  -- Create table book language
   CREATE TABLE book_language(
    -> language_id INT AUTO_INCREMENT PRIMARY KEY,
    -> language_name VARCHAR(50) NOT NULL UNIQUE
    -> )

   -- Create table publisher
    CREATE TABLE publisher(
    -> publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    -> publisher_name VARCHAR(100) NOT NULL UNIQUE
    -> )

    -- Create table author
    CREATE TABLE author(
    -> author_id INT AUTO_INCREMENT PRIMARY KEY,
    -> first_name VARCHAR(50) NOT NULL,
    -> last_name VARCHAR(50) NOT NULL
    -> );

   -- Create table book
    CREATE TABLE book(
    -> book_id INT AUTO_INCREMENT PRIMARY KEY,
    -> title VARCHAR(100) NOT NULL,
    -> isbn VARCHAR(20) NOT NULL UNIQUE,
    -> price DECIMAL(10, 2) NOT NULL,
    -> publication_date DATE,
    -> language_id INT NOT NULL,
    -> publisher_id INT NOT NULL,
    -> FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    -> FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
    -> );

    -- create table book author
      CREATE TABLE book_author(
    -> book_id INT NOT NULL,
    -> author_id INT NOT NULL,
    -> PRIMARY KEY (book_id, author_id),
    -> FOREIGN KEY (book_id) REFERENCES book(book_id),
    -> );

     -- Create table shipping method
      CREATE TABLE shipping_method(
    -> shipping_method_id INT AUTO_INCREMENT PRIMARY KEY,
    -> method_name VARCHAR (20) NOT NULL UNIQUE,
    -> cost DECIMAL (10, 2) NOT NULL
    -> );

     -- Create a table order status
     CREATE TABLE order_status(
    -> status_id INT AUTO_INCREMENT PRIMARY KEY,
    -> status_name VARCHAR (30) NOT NULL UNIQUE
    -> );

    -- Create a table customer_order
     CREATE TABLE customer_order(
    -> order_id INT AUTO_INCREMENT PRIMARY KEY,
    -> customer_id INT NOT NULL,
    -> order_date DATETIME NOT NULL,
    -> shipping_method_id INT NOT NULL,
    -> total_amount DECIMAL(10, 2) NOT NULL,
    -> FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    -> FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(shipping_method_id)
    -> );

    -- Create table for order line
     CREATE TABLE order_line(
    -> order_id INT NOT NULL,
    -> line_id INT AUTO_INCREMENT PRIMARY KEY,
    -> book_id INT NOT NULL,
    -> quantity INT NOT NULL,
    -> price decimal(10, 2) NOT NULL,
    -> FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    -> FOREIGN KEY (status_id) REFERENCES order_status(status_id)
    -> );

     -- create a table order history
      CREATE TABLE order_history(
    -> history_id INT AUTO_INCREMENT PRIMARY KEY,
    -> order_id INT NOT NULL,
    -> status_id INT NOT NULL,
    -> status_date DATETIME NOT NULL,
    -> FOREIGN KEY (order_id) REFERENCES customer_order(order_id),
    -> FOREIGN KEY (status_id) REFERENCES order_status(status_id)
    -> );

      -- Create new user
      CREATE USER 'mishaelmatende'@'localhost' IDENTIFIED BY '0000';
      CREATE USER 'adelarnyFEB'@'localhost' IDENTIFIED BY '0000';
      CREATE USER 'chepkwonychepchieng'@'localhost' IDENTIFIED BY '0000';

      -- Grant user access
      GRANT ALL PRIVILEDGES ON bookstore.* To 'mishaelmatende'@'localhost';
      GRANT ALL PRIVILEDGES ON bookstore.* To 'adelarnyFEB'@'localhost';
      GRANT ALL PRIVILEDGES ON bookstore.* To 'chepkwonychepchieng'@'localhost';
