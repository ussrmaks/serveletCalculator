\c shop_java_lesson;

-- Таблица Categories
CREATE TABLE Categories (
                            category_id SERIAL PRIMARY KEY,
                            category_name VARCHAR(100) NOT NULL
);

-- Таблица Suppliers
CREATE TABLE Suppliers (
                           supplier_id SERIAL PRIMARY KEY,
                           supplier_name VARCHAR(100) NOT NULL,
                           contact_name VARCHAR(100),
                           address VARCHAR(255),
                           phone VARCHAR(20),
                           email VARCHAR(100)
);

-- Таблица Products
CREATE TABLE Products (
                          product_id SERIAL PRIMARY KEY,
                          name VARCHAR(255) NOT NULL,
                          description TEXT,
                          price NUMERIC(10, 2) NOT NULL,
                          category_id INT REFERENCES Categories(category_id),
                          supplier_id INT REFERENCES Suppliers(supplier_id),
                          stock_quantity INT NOT NULL
);

-- Таблица Customers
CREATE TABLE Customers (
                           customer_id SERIAL PRIMARY KEY,
                           first_name VARCHAR(50) NOT NULL,
                           last_name VARCHAR(50) NOT NULL,
                           email VARCHAR(100),
                           phone VARCHAR(20),
                           address VARCHAR(255)
);

-- Таблица Orders
CREATE TABLE Orders (
                        order_id SERIAL PRIMARY KEY,
                        customer_id INT REFERENCES Customers(customer_id),
                        order_date DATE NOT NULL,
                        total_amount NUMERIC(10, 2) NOT NULL
);

-- Таблица OrderItems
CREATE TABLE OrderItems (
                            order_item_id SERIAL PRIMARY KEY,
                            order_id INT REFERENCES Orders(order_id),
                            product_id INT REFERENCES Products(product_id),
                            quantity INT NOT NULL,
                            price NUMERIC(10, 2) NOT NULL
);
