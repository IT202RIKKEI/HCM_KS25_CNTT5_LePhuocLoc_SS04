-- CREATE DATABASE ShopManager;

-- USE ShopManager;

CREATE TABLE Categories (
	category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(18,2) NOT NULL CHECK(price > 0),
    stock INT NOT NULL CHECK(stock > 0),
	category_id INT NOT NULL,
    FOREIGN KEY(category_id) REFERENCES Categories(category_id)
);
-- thêm dữ liệu cho CateGories
INSERT INTO Categories(category_name)
VALUES 
('Điện tử'),
('Thời trang');

-- Thêm dữ liệu cho Products
INSERT INTO Products(product_name, price, stock , category_id)
VALUES
('iPhone 15', 25000000 , 10, 1),
('Samsung S23', 20000000 , 5, 1),
('Áo sơ mi nam', 500000, 50, 2),
('Giày thể thao', 1200000, 20, 2);

-- CẬP NHẬT DỮ LIỆU
SET SQL_SAFE_UPDATES = 0;
UPDATE Products
SET price = 26000000 WHERE product_name = 'iPhone 15';

UPDATE Products
SET stock = stock + 10
WHERE category_id = 1;

-- XÓA DỮ LIỆU
DELETE FROM Products
WHERE product_id = 4 OR price < 1000000;


-- TRUY VẤN
SELECT * FROM Product;
SELECT * FROM Products WHERE stock > 15;
SELECT * FROM Products WHERE Price >= 1000000 AND Price <= 25000000;
SELECT * FROM Products WHERE product_name <> 'iPhone 15' AND stock > 0;
SELECT * FROM Products WHERE category_id = 1 AND price > 500000;
