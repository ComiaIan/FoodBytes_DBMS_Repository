# 🍔 FoodBytes
## **I. Project Overview**
FoodBytes is a Java console application allowing users to register, log in, and place food orders. Users can explore restaurant menus, add items to a cart, and complete the checkout process. The application includes user authentication and a small database of users, food items, and orders.

This project showcases essential Object-Oriented Programming (OOP) principles in Java and demonstrates a simple yet scalable structure for future expansions.

## **II. MySQL Integration**
The application uses MySQL as the backend database to store and manage data for users, restaurants, food items, and orders. Below are the details of the MySQL database setup:

### Database Structure
#### 1. **Database Creation**
The database contains four main tables:

#### 2. **Users Table**
The `users` table stores user credentials and roles:
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin')
);
```
- **Columns:**
  - `id`: Unique identifier for each user.
  - `username`: Username chosen by the user (unique).
  - `password`: Encrypted password.
  - `role`: Defines whether the user is a regular user or an admin.

#### 3. **Restaurants Table**
The `restaurants` table holds restaurant details:
```sql
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);
```
- **Columns:**
  - `id`: Unique identifier for each restaurant.
  - `name`: Name of the restaurant.
  - `address`: Address of the restaurant.

#### 4. **Food Items Table**
The `food_items` table lists food items and their associated restaurants:
```sql
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);
```
- **Columns:**
  - `id`: Unique identifier for each food item.
  - `name`: Name of the food item.
  - `price`: Price of the food item.
  - `restaurant_id`: Foreign key linking the food item to its restaurant. Deleting a restaurant cascades and deletes related food items.

#### 5. **Carts Table**
The `carts` table manages the user’s cart items:
```sql
CREATE TABLE carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    food_item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (food_item_id) REFERENCES food_items(id) ON DELETE CASCADE,
    UNIQUE(user_id, food_item_id)
);
```
- **Columns:**
  - `id`: Unique identifier for each cart entry.
  - `user_id`: Foreign key linking the cart to a specific user.
  - `food_item_id`: Foreign key linking the cart to a specific food item.
  - `quantity`: Number of units of the food item in the cart.
  - **Constraints:** Each user can add a food item to their cart only once (`UNIQUE(user_id, food_item_id)`).

### Key Features of the Database Design
- **Normalization:** The tables are normalized to reduce redundancy and improve data integrity.
- **Foreign Key Relationships:**
  - Users are linked to carts.
  - Food items are linked to restaurants and carts.
- **Cascade Deletes:**
  - Deleting a user removes their cart entries.
  - Deleting a restaurant removes its associated food items.

### Query to Set Up the Database
```sql
CREATE DATABASE foodbytes;
USE foodbytes;

-- Users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin')
);

-- Restaurants table
CREATE TABLE restaurants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

-- Food items table
CREATE TABLE food_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    restaurant_id INT,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
);

-- Carts table
CREATE TABLE carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    food_item_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (food_item_id) REFERENCES food_items(id) ON DELETE CASCADE,
    UNIQUE(user_id, food_item_id)
);
```

## III. Integration of the Sustainable Development Goal (SDG)
The project aligns with <ins>**SDG 12: Responsible Consumption and Production**</ins> by encouraging mindful food ordering to reduce waste. Users are able to review their cart and order only what they need. Future updates can include tracking ordering patterns or suggesting sustainable meal options, further contributing to responsible consumption practices.

## IV. Instructions for Running the Program
### Prerequisites
- JDK 8 or higher
- MySQL Workbench for executing the SQL Query
- IDE (I used IntelliJ IDEA)

### Setup Instructions
1. Clone the Repository
2. Database Setup
   - Execute the provided SQL query on your MySQL Workbench.
   - Update the URL, USERNAME, and PASSWORD in the `Database` class.
3. Using the Application
   - **Register:** Create your account, or use the preloaded user (Username: `ian`, Password: `12345`).
   - **Login:** Log in with your username and password.
   - **Browse and Add to Cart:** Select food items and add them to your cart.
   - **Checkout:** Review and confirm your order to complete the transaction.

