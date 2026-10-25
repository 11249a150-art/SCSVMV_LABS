-- Integrity constraints
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Student_Exp4 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Department_Exp4 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Department_Exp4 (
  DeptID NUMBER PRIMARY KEY,
  DeptName VARCHAR2(50) CONSTRAINT uq_dept_exp4 UNIQUE NOT NULL
);

CREATE TABLE Student_Exp4 (
  RollNo NUMBER PRIMARY KEY,
  StudentName VARCHAR2(50) CONSTRAINT nn_name_exp4 NOT NULL,
  Age NUMBER CONSTRAINT ck_age_exp4 CHECK (Age BETWEEN 17 AND 30),
  Email VARCHAR2(80) CONSTRAINT uq_email_exp4 UNIQUE,
  Gender VARCHAR2(15) DEFAULT 'Not Specified',
  DeptID NUMBER REFERENCES Department_Exp4(DeptID)
);

INSERT INTO Department_Exp4 VALUES (1, 'Computer Science');
INSERT INTO Department_Exp4 VALUES (2, 'Electronics');
INSERT INTO Student_Exp4 (RollNo, StudentName, Age, Email, Gender, DeptID)
VALUES (101, 'Arun', 20, 'arun@email.com', 'Male', 1);
INSERT INTO Student_Exp4 (RollNo, StudentName, Age, Email, DeptID)
VALUES (102, 'Priya', 21, 'priya@email.com', 2);

ALTER TABLE Student_Exp4 ADD CONSTRAINT ck_name_exp4 CHECK (LENGTH(StudentName) >= 3);
SELECT * FROM Student_Exp4;
SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name IN ('STUDENT_EXP4', 'DEPARTMENT_EXP4');

-- Execute separately to observe constraint errors:
-- INSERT INTO Student_Exp4 VALUES (103, NULL, 22, 'test@email.com', 'Female', 1);
-- INSERT INTO Student_Exp4 VALUES (104, 'Kumar', 23, 'arun@email.com', 'Male', 1);
-- INSERT INTO Student_Exp4 VALUES (101, 'Ravi', 22, 'ravi@email.com', 'Male', 1);
-- INSERT INTO Student_Exp4 VALUES (105, 'Sita', 35, 'sita@email.com', 'Female', 1);
-- INSERT INTO Student_Exp4 VALUES (106, 'Meena', 20, 'meena@email.com', 'Female', 9);

COMMIT;