-- DML and DDL operations
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Employee_Exp2 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Employee_Exp2 (
  EmpID NUMBER PRIMARY KEY,
  EmployeeName VARCHAR2(50) NOT NULL,
  Department VARCHAR2(30),
  Salary NUMBER(10,2),
  JoinDate DATE
);

INSERT INTO Employee_Exp2 VALUES (101, 'Anjali Sharma', 'IT', 45000, DATE '2023-06-15');
INSERT INTO Employee_Exp2 VALUES (102, 'Ravi Kumar', 'HR', 38000, DATE '2022-03-10');
INSERT INTO Employee_Exp2 VALUES (103, 'Priya Singh', 'Finance', 52000, DATE '2021-11-01');
INSERT INTO Employee_Exp2 VALUES (104, 'Karthik Iyer', 'IT', 47000, DATE '2023-01-20');
INSERT INTO Employee_Exp2 VALUES (105, 'Meera Das', 'Finance', 43000, DATE '2019-08-12');

SELECT * FROM Employee_Exp2;
SELECT * FROM Employee_Exp2 WHERE Department = 'Finance' AND Salary > 40000;
UPDATE Employee_Exp2 SET Salary = Salary * 1.10 WHERE Department = 'IT';
DELETE FROM Employee_Exp2 WHERE JoinDate < DATE '2020-01-01';
ALTER TABLE Employee_Exp2 ADD Phone VARCHAR2(15);
ALTER TABLE Employee_Exp2 MODIFY (EmployeeName VARCHAR2(80));
ALTER TABLE Employee_Exp2 RENAME COLUMN Department TO Dept;
SELECT * FROM Employee_Exp2 ORDER BY Salary;

COMMIT;