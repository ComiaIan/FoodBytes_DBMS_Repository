CREATE database foodbytes;

USE foodbytes;

-- users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin')
);

-- restaurants table
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

-- table para sa mga food items
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- table ng cart
CREATE TABLE carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    food_item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (food_item_id) REFERENCES food_items(id) ON DELETE CASCADE,
    UNIQUE(user_id, food_item_id)  -- Ensures each item is added only once per user
);

INSERT INTO users (username, password, role) VALUES
('ian', '12345', 'user'),
('admin', '12345', 'admin');

INSERT INTO restaurants (name, address) VALUES
('Pilotos', 'Pallocan East'),
('Itaewon', 'Gulod'),
('Kwatogs', 'Alangilan');

INSERT INTO food_items (restaurant_id, name, price) VALUES
(1, 'Chocolatte', 100),
(1, 'Barako', 85),
(1, 'Spanish Latte', 100),
(1, 'Lechon Kawali', 220),
(2, 'Spanish Latte', 140),
(2, 'Americano', 110),
(2, 'Sandwich', 180),
(3, 'Chami', 85),
(3, 'Canton', 89),
(3, 'Pansit', 89);

SELECT * FROM users;
SELECT * FROM carts;
SELECT * FROM food_items;
SELECT * FROM restaurants;

