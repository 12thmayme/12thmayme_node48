CREATE DATABASE node48_test
USE node48_test;

CREATE TABLE product (
product_name VARCHAR(100) NOT NULL,
image VARCHAR(255),
price double,
rate int
)

INSERT INTO product (product_name, image, price, rate) VALUES
('Product 1', 'https://example.com/images/product_1.jpg', 386.01, 0),
('Product 2', 'https://example.com/images/product_2.jpg', 289.07, 3),
('Product 3', 'https://example.com/images/product_3.jpg', 180.29, 3),
('Product 4', 'https://example.com/images/product_4.jpg', 378.59, 3),
('Product 5', 'https://example.com/images/product_5.jpg', 393.62, 4),
('Product 6', 'https://example.com/images/product_6.jpg', 215.47, 4),
('Product 7', 'https://example.com/images/product_7.jpg', 444.18, 5),
('Product 8', 'https://example.com/images/product_8.jpg', 120.35, 2),
('Product 9', 'https://example.com/images/product_9.jpg', 476.90, 3),
('Product 10', 'https://example.com/images/product_10.jpg', 499.43, 1),
('Product 11', 'https://example.com/images/product_11.jpg', 230.55, 4),
('Product 12', 'https://example.com/images/product_12.jpg', 401.76, 5),
('Product 13', 'https://example.com/images/product_13.jpg', 134.87, 0),
('Product 14', 'https://example.com/images/product_14.jpg', 158.20, 2),
('Product 15', 'https://example.com/images/product_15.jpg', 290.47, 5),
('Product 16', 'https://example.com/images/product_16.jpg', 302.34, 3),
('Product 17', 'https://example.com/images/product_17.jpg', 412.78, 1),
('Product 18', 'https://example.com/images/product_18.jpg', 368.15, 4),
('Product 19', 'https://example.com/images/product_19.jpg', 198.12, 2),
('Product 20', 'https://example.com/images/product_20.jpg', 290.89, 3);

SELECT * FROM product
SELECT product_name, image FROM product
SELECT product_name AS "Tên Sản Phẩm" FROM product

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY, -- Unique identifier for each user
    full_name VARCHAR(150) NOT NULL,        -- Full name of the user (up to 150 characters)
    email VARCHAR(255) NOT NULL UNIQUE,     -- Email address, must be unique
    phone VARCHAR(20),                      -- Phone number, allows NULL
    address TEXT,                           -- Address, allows longer text
    age INT CHECK (age >= 0 AND age <= 120) -- Age with a constraint for valid range
);

INSERT INTO users (full_name, email, phone, address, age) VALUES
('Grace Garcia', 'user1@gmail.com', '+1-838-2725', '594 Davis Street', 64),
('Jane Brown', 'user2@yahoo.com', '+1-574-4913', '737 Brown Street', 75),
('David Davis', 'user3@yahoo.com', '+1-316-4171', '245 Davis Street', 38),
('David Davis', 'user4@yahoo.com', '+1-261-8692', '652 Lee Street', 74),
('John Miller', 'user5@example.com', '+1-301-1937', '215 Williams Street', 51),
('Alice Brown', 'user6@gmail.com', '+1-482-9412', '437 Johnson Street', 34),
('Eve Garcia', 'user7@yahoo.com', '+1-765-4512', '129 Garcia Street', 22),
('Charlie Johnson', 'user8@gmail.com', '+1-349-1739', '981 Smith Street', 45),
('Hannah Martinez', 'user9@hotmail.com', '+1-482-6143', '847 Davis Street', 30),
('Frank Lee', 'user10@gmail.com', '+1-931-2059', '512 Brown Street', 29),
('Jane Williams', 'user11@gmail.com', '+1-715-8347', '719 Martinez Street', 67),
('Grace Smith', 'user12@gmail.com', '+1-293-5483', '436 Johnson Street', 43),
('Alice Garcia', 'user13@example.com', '+1-874-1265', '873 Lee Street', 58),
('Bob Brown', 'user14@yahoo.com', '+1-632-7658', '147 Garcia Street', 35),
('Charlie Martinez', 'user15@hotmail.com', '+1-497-9621', '763 Smith Street', 50),
('John Johnson', 'user16@gmail.com', '+1-248-1136', '471 Brown Street', 23),
('Hannah Davis', 'user17@yahoo.com', '+1-389-6025', '937 Miller Street', 55),
('Frank Johnson', 'user18@gmail.com', '+1-594-7392', '841 Garcia Street', 41),
('David Brown', 'user19@example.com', '+1-349-6721', '148 Martinez Street', 62),
('Eve Miller', 'user20@gmail.com', '+1-721-9843', '429 Smith Street', 27);

SELECT * from users
WHERE age BETWEEN 25 AND 30
ORDER BY age ASC


SELECT * from users
WHERE 25 < age and age < 30
ORDER BY age DESC

SELECT * from users
where full_name LIKE "%John%"

SELECT * FROM users
WHERE AGE = (
SELECT age FROM users
ORDER BY age DESC
LIMIT 1
)

SELECT COUNT(*) As "Total Users" from users

UPDATE users SET age = 30
WHERE full_name = 'John Doe'


DELETE FROM users
WHERE full_name = 'Benjamin Thomas'

SELECT * from users




