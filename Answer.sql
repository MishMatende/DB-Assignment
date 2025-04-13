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
    -> FOREIGN KEY (author_id) REFERENCES author(author_id),
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
    -> status_id INT NOT NULL,
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
   
   -- create user admin
   CREATE USER 'admin'@'localhost'
    -> IDENTIFIED BY 'pass1234';
    GRANT ALL PRIVILEGES ON bookstore.*  TO 'admin'@'localhost';

     -- Create user staff
      CREATE USER 'staff'@'localhost'
    -> IDENTIFIED BY 'staff1234';
      GRANT SELECT, INSERT, UPDATE ON bookstore.customer_order TO 'staff'@'localhost';
      GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'staff'@'localhost';
      GRANT SELECT, INSERT, UPDATE ON bookstore.order_line TO 'bookstore_staff'@'localhost';
      GRANT SELECT, INSERT, UPDATE ON bookstore.order_history TO 'bookstore_staff'@'localhost';
      GRANT SELECT ON bookstore.customer TO 'bookstore_staff'@'localhost';
      GRANT SELECT ON bookstore.book_language TO 'bookstore_staff'@'localhost';
      GRANT SELECT ON bookstore.publisher TO 'bookstore_staff'@'localhost';
      GRANT SELECT ON bookstore.author TO 'bookstore_staff'@'localhost';
      GRANT SELECT ON bookstore.shipping_method TO 'bookstore_staff'@'localhost';
      GRANT SELECT ON bookstore.order_status TO 'bookstore_staff'@'localhost';

    -- Create customer user
    CREATE USER 'customer'@'localhost'
    -> IDENTIFIED BY 'customer1234';
    GRANT SELECT, UPDATE ON bookstore.customer TO 'customer'@'localhost';
    GRANT SELECT, UPDATE ON bookstore.customer_order TO 'customer'@'localhost';
    GRANT SELECT, UPDATE ON bookstore.order_line TO 'customer'@'localhost';
    GRANT SELECT, UPDATE ON bookstore.order_history TO 'customer'@'localhost';

    -- inserting values to the table
    -- Insert into 
     INSERT INTO country (country_name) VALUES ('Kenya'), ('Ghana'); 

      -- Insert into address_status
     INSERT INTO address_status (status_name)
    -> VALUE ('current'), ('old');

 -- Insert into customer
  INSERT INTO customer (first_name, last_name, email, phone)
    -> VALUES( 'James', 'Peter', 'jamespeter@email.com', '+254702585568'),
    -> ('Sandra', 'Pearl', 'sandra@email.com', '+5475144144');

    -- insert into address
    INSERT INTO address (street, city, postal_code, country_id)
    -> VALUES ('Tom Mboya', 'Nairobi', '30400', 1),
    -> ('Ghana_avenue', 'Accra', '50400', 2);

    -- insert into customer_address
    INSERT INTO customer_address (customer_id, address_id, status_id)
    -> VALUES (1, 1, 1 ), (2, 2, 1);

    
-- Insert into book_language
INSERT INTO book_language (language_name) VALUES ('English'), ('French');

-- Insert into publisher
INSERT INTO publisher (publisher_name) VALUES ('Penguin Books'), ('HarperCollins');

-- Insert into author
INSERT INTO author (first_name, last_name) VALUES ('J.K.', 'Rowling'), ('George', 'Orwell');

-- Insert into book
INSERT INTO book (title, isbn, price, publication_date, language_id, publisher_id)
VALUES ('Harry Potter', '9780590353427', 29.99, '1997-06-26', 1, 1),
       ('1984', '9780451524935', 15.99, '1949-06-08', 1, 2);

-- Insert into book_author
INSERT INTO book_author (book_id, author_id) VALUES (1, 1), (2, 2);

-- Insert into shipping_method
INSERT INTO shipping_method (method_name, cost) VALUES ('Standard', 5.99), ('Express', 12.99);

-- Insert into order_status
INSERT INTO order_status (status_name) VALUES ('Pending'), ('Shipped'), ('Delivered');

-- Insert into cust_order
INSERT INTO cust_order (customer_id, order_date, shipping_method_id, total_amount)
VALUES (1, '2025-04-11 10:00:00', 1, 35.98),
       (2, '2025-04-11 12:00:00', 2, 28.98);

-- Insert into order_line
INSERT INTO order_line (order_id, book_id, quantity, price)
VALUES (1, 1, 1, 29.99),
       (2, 2, 1, 15.99);

-- Insert into order_history
INSERT INTO order_history (order_id, status_id, status_date)
VALUES (1, 1, '2025-04-11 10:05:00'),
       (1, 2, '2025-04-12 09:00:00'),
       (2, 1, '2025-04-11 12:05:00');


      