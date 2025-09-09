START TRANSACTION;

DROP TABLE IF EXISTS orders, menu_items, customers, locations;

CREATE TABLE locations (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  city VARCHAR(100) NOT NULL
);

CREATE TABLE menu_items (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(6,2) NOT NULL,
  location_id INT NOT NULL,
  FOREIGN KEY (location_id) REFERENCES locations(id)
);

CREATE TABLE customers (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE
);

CREATE TABLE orders (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  menu_item_id INT NOT NULL,
  order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (customer_id) REFERENCES customers(id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items(id)
);

-- Sample data
INSERT INTO locations (name, city) VALUES
('Downtown Diner', 'Springfield'),
('Uptown Eats', 'Springfield');

INSERT INTO menu_items (name, price, location_id) VALUES
('Burger', 9.99, 1),
('Salad', 6.99, 1),
('Pizza', 12.50, 2);

INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Smith', 'alice@example.com'),
('Bob', 'Jones', 'bob@example.com');

INSERT INTO orders (customer_id, menu_item_id) VALUES
(1, 1),
(2, 3);

COMMIT;
