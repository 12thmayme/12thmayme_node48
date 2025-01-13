CREATE TABLE user (
user_id INT PRIMARY KEY AUTO_INCREMENT,
full_name VARCHAR(255),
email VARCHAR(255),
password VARCHAR(255)
);

CREATE TABLE restaurant (
    res_id INT PRIMARY KEY AUTO_INCREMENT,
    res_name VARCHAR(255),
    image VARCHAR(255),
    `desc` TEXT
);

CREATE TABLE food_type (
type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR(255)
);

CREATE TABLE food (
    food_id INT PRIMARY KEY AUTO_INCREMENT,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price FLOAT,
    description TEXT,
    type_id INT,
    FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    food_id INT,
    FOREIGN KEY (food_id) REFERENCES food(food_id),
    amount INT,
    code VARCHAR(10),
    arr_sub_id VARCHAR(255)
);

CREATE TABLE like_res (
    like_res_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    res_id INT,
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
    date_like DATETIME
);

CREATE TABLE rate_res (
    rate_res_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    res_id INT,
    FOREIGN KEY (res_id) REFERENCES restaurant(res_id),
    amount INT,
    date_rate DATETIME
);

CREATE TABLE sub_food (
    sub_id INT PRIMARY KEY AUTO_INCREMENT, 
    sub_name VARCHAR(255),                
    sub_price FLOAT,                       
    food_id INT,                           
    FOREIGN KEY (food_id) REFERENCES food(food_id) 
);


INSERT INTO user (full_name, email, password) VALUES
('John Doe', 'john@example.com', 'password123'),
('Jane Smith', 'jane@example.com', 'mypassword456'),
('Alice Brown', 'alice@example.com', 'alice789'),
('Bob Wilson', 'bob@example.com', 'bobpassword'),
('Charlie Johnson', 'charlie@example.com', 'charlie1234');

INSERT INTO restaurant (res_name, image, `desc`) VALUES
('Gourmet Kitchen', 'gourmet.jpg', 'A fine dining restaurant.'),
('Sushi Haven', 'sushi.jpg', 'Authentic Japanese sushi.'),
('Pizza Palace', 'pizza.jpg', 'Italian wood-fired pizzas.'),
('BBQ Heaven', 'bbq.jpg', 'World-class barbecue flavors.'),
('Vegan Delight', 'vegan.jpg', 'Delicious plant-based meals.');

INSERT INTO food_type (type_name) VALUES
('Fast Food'),
('Seafood'),
('Vegan'),
('Desserts'),
('Grilled');

INSERT INTO food (food_name, image, price, description, type_id) VALUES
('Cheeseburger', 'burger.jpg', 5.99, 'Classic cheeseburger.', 1),
('Grilled Salmon', 'salmon.jpg', 15.99, 'Fresh salmon.', 2),
('Vegan Salad', 'salad.jpg', 7.99, 'Healthy vegan salad.', 3),
('Chocolate Cake', 'cake.jpg', 4.99, 'Rich chocolate cake.', 4),
('BBQ Ribs', 'ribs.jpg', 12.99, 'Tender BBQ ribs.', 5);

INSERT INTO `order` (user_id, food_id, amount, code, arr_sub_id) VALUES
(1, 1, 2, 'ORD001', 'SUB001'),
(2, 2, 1, 'ORD002', 'SUB002'),
(3, 3, 3, 'ORD003', 'SUB003'),
(4, 4, 4, 'ORD004', 'SUB004'),
(5, 5, 1, 'ORD005', NULL);

INSERT INTO like_res (user_id, res_id, date_like) VALUES
(1, 1, '2025-01-01 12:00:00'),
(2, 2, '2025-01-02 14:00:00'),
(3, 3, '2025-01-03 16:00:00'),
(4, 4, '2025-01-04 18:00:00'),
(5, 5, '2025-01-05 20:00:00');

INSERT INTO rate_res (user_id, res_id, amount, date_rate) VALUES
(1, 1, 5, '2025-01-01 12:30:00'),
(2, 2, 4, '2025-01-02 14:30:00'),
(3, 3, 3, '2025-01-03 16:30:00'),
(4, 4, 5, '2025-01-04 18:30:00'),
(5, 5, 2, '2025-01-05 20:30:00');

INSERT INTO sub_food (sub_name, sub_price, food_id) VALUES
('Extra Cheese', 1.50, 1), -- Cheeseburger
('Bacon', 2.00, 1),        -- Cheeseburger
('Avocado', 2.50, 1),      -- Cheeseburger
('Garlic Butter', 0.99, 2), -- Grilled Salmon
('Lemon Slice', 0.50, 2),   -- Grilled Salmon
('Croutons', 0.75, 3),      -- Vegan Salad
('Dressing', 0.99, 3),      -- Vegan Salad
('Extra Chocolate', 1.25, 4), -- Chocolate Cake
('Whipped Cream', 0.50, 4),  -- Chocolate Cake
('BBQ Sauce', 1.00, 5),      -- BBQ Ribs
('Garlic Bread', 1.99, 6),   -- Margherita Pizza
('Olives', 1.50, 6),         -- Margherita Pizza
('Sweet Chili Sauce', 0.75, 7), -- Spring Rolls
('Guacamole', 2.50, 8),      -- Tacos
('Rice', 1.50, 9),           -- Butter Chicken
('Soy Sauce', 0.99, 10),     -- Sushi Platter
('Parmesan Cheese', 1.25, 11), -- Pasta Alfredo
('Chili Oil', 0.75, 12),     -- Dim Sum Basket
('Pickled Jalapenos', 0.99, 13), -- Fish Tacos
('Mint Chutney', 1.00, 14);  -- Paneer Tikka


SELECT lr.user_id, u.full_name, COUNT(lr.res_id) AS total_likes
FROM like_res lr
INNER JOIN user u ON lr.user_id = u.user_id
GROUP BY lr.user_id, u.full_name
ORDER BY total_likes DESC
LIMIT 5;

SELECT lr.res_id, r.res_name, COUNT(lr.user_id) AS total_likes
FROM like_res lr
INNER JOIN restaurant r ON lr.res_id = r.res_id
GROUP BY lr.res_id, r.res_name
ORDER BY total_likes DESC
LIMIT 2;

SELECT o.user_id, u.full_name, COUNT(o.order_id) AS total_orders
FROM `order` o
INNER JOIN user u ON o.user_id = u.user_id
GROUP BY o.user_id, u.full_name
ORDER BY total_orders DESC
LIMIT 1;

SELECT u.user_id, u.full_name
FROM user u
LEFT JOIN `order` o ON u.user_id = o.user_id
LEFT JOIN like_res lr ON u.user_id = lr.user_id
LEFT JOIN rate_res rr ON u.user_id = rr.user_id
WHERE o.user_id IS NULL 
  AND lr.user_id IS NULL 
  AND rr.user_id IS NULL;








