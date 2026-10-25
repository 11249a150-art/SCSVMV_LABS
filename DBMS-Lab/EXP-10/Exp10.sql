-- PL/SQL blocks, exceptions, procedures, functions, triggers, and cursors
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Employee_Exp10 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE Employee_Exp10 (EmpID NUMBER PRIMARY KEY, EmployeeName VARCHAR2(50), Salary NUMBER(10,2), Department VARCHAR2(30), UpdatedAt TIMESTAMP);
INSERT INTO Employee_Exp10 VALUES (1, 'Anu', 45000, 'IT', SYSTIMESTAMP);
INSERT INTO Employee_Exp10 VALUES (2, 'Bala', 52000, 'HR', SYSTIMESTAMP);

DECLARE
  employee_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO employee_count FROM Employee_Exp10;
  DBMS_OUTPUT.PUT_LINE('Employees: ' || employee_count);
EXCEPTION WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

CREATE OR REPLACE FUNCTION annual_salary (monthly_salary NUMBER) RETURN NUMBER IS
BEGIN
  RETURN monthly_salary * 12;
END;
/

CREATE OR REPLACE PROCEDURE give_raise (employee_id NUMBER, percentage NUMBER) IS
BEGIN
  UPDATE Employee_Exp10 SET Salary = Salary * (1 + percentage / 100) WHERE EmpID = employee_id;
END;
/

CREATE OR REPLACE TRIGGER employee_updated_at
BEFORE UPDATE ON Employee_Exp10
FOR EACH ROW
BEGIN
  :NEW.UpdatedAt := SYSTIMESTAMP;
END;
/

BEGIN
  give_raise(1, 10);
  DBMS_OUTPUT.PUT_LINE('Annual salary: ' || annual_salary(45000));
  FOR employee_record IN (SELECT EmpID, EmployeeName, Salary FROM Employee_Exp10 ORDER BY EmpID) LOOP
    DBMS_OUTPUT.PUT_LINE(employee_record.EmpID || ': ' || employee_record.EmployeeName || ' ' || employee_record.Salary);
  END LOOP;
  COMMIT;
EXCEPTION WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
/

SELECT * FROM Employee_Exp10;