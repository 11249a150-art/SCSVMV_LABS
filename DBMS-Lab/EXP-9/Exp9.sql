-- Relationships, joins, and subqueries
BEGIN EXECUTE IMMEDIATE 'DROP TABLE OrderItem_Exp9 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Product_Exp9 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Customer_Exp9 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Order_Exp9 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE Customer_Exp9 (CustomerID NUMBER PRIMARY KEY, CustomerName VARCHAR2(50), City VARCHAR2(30));
CREATE TABLE Order_Exp9 (OrderID NUMBER PRIMARY KEY, CustomerID NUMBER REFERENCES Customer_Exp9, OrderDate DATE);
CREATE TABLE Product_Exp9 (ProductID NUMBER PRIMARY KEY, ProductName VARCHAR2(50), Price NUMBER(10,2));
CREATE TABLE OrderItem_Exp9 (OrderID NUMBER REFERENCES Order_Exp9, ProductID NUMBER REFERENCES Product_Exp9, Quantity NUMBER CHECK (Quantity > 0), PRIMARY KEY (OrderID, ProductID));
INSERT ALL INTO Customer_Exp9 VALUES (1, 'Anu', 'Chennai') INTO Customer_Exp9 VALUES (2, 'Bala', 'Kanchipuram') SELECT 1 FROM dual;
INSERT ALL INTO Order_Exp9 VALUES (101, 1, DATE '2026-03-01') INTO Order_Exp9 VALUES (102, 2, DATE '2026-03-02') SELECT 1 FROM dual;
INSERT ALL INTO Product_Exp9 VALUES (10, 'Keyboard', 1200) INTO Product_Exp9 VALUES (20, 'Monitor', 9000) SELECT 1 FROM dual;
INSERT ALL INTO OrderItem_Exp9 VALUES (101, 10, 2) INTO OrderItem_Exp9 VALUES (101, 20, 1) INTO OrderItem_Exp9 VALUES (102, 10, 1) SELECT 1 FROM dual;
SELECT c.CustomerName, o.OrderID, p.ProductName, oi.Quantity FROM Customer_Exp9 c JOIN Order_Exp9 o ON o.CustomerID = c.CustomerID JOIN OrderItem_Exp9 oi ON oi.OrderID = o.OrderID JOIN Product_Exp9 p ON p.ProductID = oi.ProductID;
SELECT CustomerName FROM Customer_Exp9 WHERE CustomerID IN (SELECT CustomerID FROM Order_Exp9);
SELECT c.CustomerName, NVL(SUM(p.Price * oi.Quantity), 0) AS OrderValue FROM Customer_Exp9 c LEFT JOIN Order_Exp9 o ON o.CustomerID = c.CustomerID LEFT JOIN OrderItem_Exp9 oi ON oi.OrderID = o.OrderID LEFT JOIN Product_Exp9 p ON p.ProductID = oi.ProductID GROUP BY c.CustomerName;
COMMIT;