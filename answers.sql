USE salesdb;
-- Q1. - **Write an SQL query** to transform this table into **1NF**, ensuring that each row represents a single product for an order
-- Creating the normalized table structure for 1NF
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50),
    PRIMARY KEY (OrderID, Product)
);
-- Inserting the sample data with each product having its row
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone'); 
SELECT * FROM ProductDetail_1NF -- displaying the table in 1_NF
ORDER BY OrderID, Product;

-- Q2.  Write an SQL query to transform this table into **2NF** by removing partial dependencies
-- spliting the table into two to remove partial dependency
CREATE TABLE Orders1 (      -- order table
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE OrderDetails2 ( -- order deatails table
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders1(OrderID)
);

INSERT INTO Orders1 (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

INSERT INTO OrderDetails2 (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
-- Display Orders table
SELECT * FROM Orders1 
ORDER BY OrderID;
-- Display Order Details table
SELECT * FROM OrderDetails2 
ORDER BY OrderID, Product;