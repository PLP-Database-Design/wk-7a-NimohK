--Question 1
-- Option 1: By entering OrderId manually
-- Creating ProductDetail table.
CREATE TABLE ProductDetail (
OrderId INT,
CustomerName VARCHAR(50),
Products VARCHAR (50)
);

-- Inserting data in the ProductDetail table.
INSERT INTO ProductDetail (OrderId, CustomerName, Products)
VALUES (101, "John Doe", "Laptop"),
(101, "John Doe", "Mouse"),
(102, "Jane Smith", "Tablet"),
(102, "Jane Smith", "Keyboard"),
(102, "Jane Smith", "Mouse"),
(103, "Emily Clark", "Phone");

-- Option 2: By creating an Order table and ProductDetail table.
CREATE TABLE Orders (
  OrderId INT PRIMARY KEY AUTO_INCREMENT,
  CustomerName VARCHAR(50)
);

ALTER TABLE Orders AUTO_INCREMENT = 101;

CREATE TABLE ProductDetail (
  ProductId INT PRIMARY KEY AUTO_INCREMENT,
  OrderId INT,
  Product VARCHAR(50),
  FOREIGN KEY (OrderId) REFERENCES Orders(OrderId)
);

-- Join query to retrieve OrderId, CustomerName, and Product
SELECT 
  o.OrderId,
  o.CustomerName,
  p.Product
FROM 
  Orders o
JOIN 
  ProductDetail p ON o.OrderId = p.OrderId;

  -- Question 2
  -- Creating Orders table
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(50)
);

-- Creating OrderDetails table
CREATE TABLE OrderDetails (
  OrderID INT,
  Product VARCHAR(50),
  Quantity INT,
  PRIMARY KEY (OrderID, Product),
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Inserting data into the Orders table.
INSERT INTO Orders (OrderID, CustomerName)
VALUES
  (101, 'John Doe'),
  (102, 'Jane Smith'),
  (103, 'Emily Clark');
  
  -- Inserting data into the OrderDetails table.
  INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES
  (101, 'Laptop', 2),
  (101, 'Mouse', 1),
  (102, 'Tablet', 3),
  (102, 'Keyboard', 1),
  (102, 'Mouse', 2),
  (103, 'Phone', 1);

-- Query to show combined data from both tables.
  SELECT 
  o.OrderID,
  o.CustomerName,
  d.Product,
  d.Quantity
FROM 
  Orders o
JOIN 
  OrderDetails d ON o.OrderID = d.OrderID;