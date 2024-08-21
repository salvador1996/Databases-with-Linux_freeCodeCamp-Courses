-- Create the database
CREATE DATABASE SupermarketDB;
USE SupermarketDB;

-- Create Categories table
CREATE TABLE Categories (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL,
    Description TEXT
);

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(150) NOT NULL,
    ContactName VARCHAR(100),
    ContactEmail VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(150) NOT NULL,
    CategoryID INT,
    SupplierID INT,
    UnitPrice DECIMAL(10, 2),
    UnitsInStock INT,
    UnitsOnOrder INT DEFAULT 0,
    ReorderLevel INT DEFAULT 0,
    Discontinued BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

-- Create StockMovements table
CREATE TABLE StockMovements (
    MovementID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    MovementDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    Quantity INT,
    MovementType ENUM('IN', 'OUT'),  -- 'IN' for adding stock, 'OUT' for removing stock
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Optional: Create Locations table
CREATE TABLE Locations (
    LocationID INT AUTO_INCREMENT PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Description TEXT
);

-- Insert sample data into Categories table
INSERT INTO Categories (CategoryName, Description) VALUES
('Dairy', 'Milk, cheese, and other dairy products'),
('Beverages', 'Soft drinks, coffee, tea, etc.'),
('Bakery', 'Bread, pastries, and other baked goods');

-- Insert sample data into Suppliers table
INSERT INTO Suppliers (SupplierName, ContactName, ContactEmail, Phone, Address) VALUES
('Fresh Farms', 'John Doe', 'johndoe@freshfarms.com', '123-456-7890', '123 Farm Road, Farmville'),
('Beverage Co', 'Jane Smith', 'janesmith@beverageco.com', '098-765-4321', '456 Beverage Street, Drinktown');

-- Insert sample data into Products table
INSERT INTO Products (ProductName, CategoryID, SupplierID, UnitPrice, UnitsInStock, ReorderLevel) VALUES
('Whole Milk', 1, 1, 2.50, 100, 20),
('Cheddar Cheese', 1, 1, 5.00, 50, 10),
('Orange Juice', 2, 2, 3.00, 200, 30);

