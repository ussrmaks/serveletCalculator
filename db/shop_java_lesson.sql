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
-- Заполнение таблицы Categories
INSERT INTO Categories (category_name) VALUES
                                           ('Электроника'),
                                           ('Одежда'),
                                           ('Книги'),
                                           ('Бытовая техника');

-- Заполнение таблицы Suppliers
INSERT INTO Suppliers (supplier_name, contact_name, address, phone, email) VALUES
                                                                               ('TechSupplier', 'Иван Иванов', 'Москва, ул. Техническая, 10', '+79991234567', 'tech@example.com'),
                                                                               ('ClothSupplier', 'Петр Петров', 'Санкт-Петербург, ул. Ткацкая, 5', '+79992345678', 'cloth@example.com'),
                                                                               ('BookSupplier', 'Сидор Сидоров', 'Новосибирск, ул. Книжная, 3', '+79993456789', 'book@example.com');

-- Заполнение таблицы Products
INSERT INTO Products (name, description, price, category_id, supplier_id, stock_quantity) VALUES
                                                                                              ('Смартфон', 'Мощный смартфон с OLED-экраном', 50000.00, 1, 1, 100),
                                                                                              ('Ноутбук', 'Легкий и мощный ноутбук', 80000.00, 1, 1, 50),
                                                                                              ('Футболка', 'Хлопковая футболка', 1500.00, 2, 2, 200),
                                                                                              ('Джинсы', 'Классические джинсы', 3000.00, 2, 2, 150),
                                                                                              ('Книга "Война и мир"', 'Классика русской литературы', 1000.00, 3, 3, 300),
                                                                                              ('Микроволновая печь', 'Компактная микроволновка', 7000.00, 4, 1, 80);

-- Заполнение таблицы Customers
INSERT INTO Customers (first_name, last_name, email, phone, address) VALUES
                                                                         ('Алексей', 'Смирнов', 'alex@example.com', '+79994567890', 'Москва, ул. Пушкина, 15'),
                                                                         ('Мария', 'Иванова', 'maria@example.com', '+79995678901', 'Санкт-Петербург, ул. Лермонтова, 20'),
                                                                         ('Дмитрий', 'Петров', 'dmitry@example.com', '+79996789012', 'Новосибирск, ул. Гоголя, 25');

-- Заполнение таблицы Orders
INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
                                                               (1, '2025-03-01', 51500.00),
                                                               (2, '2025-03-05', 4500.00),
                                                               (3, '2025-03-10', 80000.00);

-- Заполнение таблицы OrderItems
INSERT INTO OrderItems (order_id, product_id, quantity, price) VALUES
                                                                   (1, 1, 1, 50000.00),  -- Смартфон
                                                                   (1, 3, 1, 1500.00),   -- Футболка
                                                                   (2, 4, 1, 3000.00),   -- Джинсы
                                                                   (2, 5, 1, 1000.00),   -- Книга
                                                                   (3, 2, 1, 80000.00);  -- Ноутбук

 -- Просмотр таблиц
SELECT * FROM categories

SELECT * FROM customers