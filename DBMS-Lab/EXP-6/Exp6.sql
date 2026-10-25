-- Aggregate functions, GROUP BY, and HAVING
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Sales_Exp6 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE Sales_Exp6 (SaleID NUMBER PRIMARY KEY, SaleDate DATE, Region VARCHAR2(20), Category VARCHAR2(30), Amount NUMBER(10,2));
INSERT ALL
  INTO Sales_Exp6 VALUES (1, DATE '2026-01-05', 'North', 'Laptop', 75000)
  INTO Sales_Exp6 VALUES (2, DATE '2026-01-10', 'South', 'Phone', 45000)
  INTO Sales_Exp6 VALUES (3, DATE '2026-02-02', 'North', 'Phone', 30000)
  INTO Sales_Exp6 VALUES (4, DATE '2026-02-12', 'East', 'Laptop', 82000)
  INTO Sales_Exp6 VALUES (5, DATE '2026-02-18', 'South', 'Laptop', 68000)
  INTO Sales_Exp6 VALUES (6, DATE '2026-03-01', 'East', 'Phone', 52000)
SELECT 1 FROM dual;
SELECT COUNT(*) AS TotalSales, SUM(Amount) AS TotalAmount, AVG(Amount) AS AverageAmount, MIN(Amount) AS MinimumAmount, MAX(Amount) AS MaximumAmount FROM Sales_Exp6;
SELECT Region, COUNT(*) AS NumberOfSales, SUM(Amount) AS RegionTotal FROM Sales_Exp6 GROUP BY Region ORDER BY Region;
SELECT Category, SUM(Amount) AS CategoryTotal FROM Sales_Exp6 GROUP BY Category HAVING SUM(Amount) > 100000;
SELECT Region, Category, SUM(Amount) AS TotalAmount FROM Sales_Exp6 GROUP BY ROLLUP (Region, Category);
COMMIT;