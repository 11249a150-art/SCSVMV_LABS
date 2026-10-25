-- Subqueries and set operators
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Enrollment_Exp5 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Course_Exp5 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Student_Exp5 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Student_Exp5 (RollNo NUMBER PRIMARY KEY, StudentName VARCHAR2(50), DeptID NUMBER);
CREATE TABLE Course_Exp5 (CourseID NUMBER PRIMARY KEY, CourseName VARCHAR2(50), Credits NUMBER);
CREATE TABLE Enrollment_Exp5 (RollNo NUMBER REFERENCES Student_Exp5, CourseID NUMBER REFERENCES Course_Exp5, Marks NUMBER CHECK (Marks BETWEEN 0 AND 100), PRIMARY KEY (RollNo, CourseID));

INSERT ALL
  INTO Student_Exp5 VALUES (101, 'Arun', 1)
  INTO Student_Exp5 VALUES (102, 'Priya', 2)
  INTO Student_Exp5 VALUES (103, 'Kumar', 1)
  INTO Student_Exp5 VALUES (104, 'Sita', 3)
  INTO Student_Exp5 VALUES (105, 'Meena', 2)
SELECT 1 FROM dual;
INSERT ALL
  INTO Course_Exp5 VALUES (1, 'Data Structures', 4)
  INTO Course_Exp5 VALUES (2, 'Digital Circuits', 3)
  INTO Course_Exp5 VALUES (3, 'Thermodynamics', 4)
  INTO Course_Exp5 VALUES (4, 'DBMS', 4)
SELECT 1 FROM dual;
INSERT ALL
  INTO Enrollment_Exp5 VALUES (101, 1, 85)
  INTO Enrollment_Exp5 VALUES (101, 4, 78)
  INTO Enrollment_Exp5 VALUES (102, 2, 60)
  INTO Enrollment_Exp5 VALUES (102, 4, 55)
  INTO Enrollment_Exp5 VALUES (103, 1, 90)
  INTO Enrollment_Exp5 VALUES (103, 4, 88)
  INTO Enrollment_Exp5 VALUES (104, 3, 70)
  INTO Enrollment_Exp5 VALUES (105, 2, 45)
SELECT 1 FROM dual;

SELECT StudentName FROM Student_Exp5 WHERE DeptID IN (1, 3);
SELECT DISTINCT s.StudentName, e.Marks FROM Student_Exp5 s JOIN Enrollment_Exp5 e ON e.RollNo = s.RollNo WHERE e.Marks > ANY (SELECT Marks FROM Enrollment_Exp5 WHERE CourseID = 2);
SELECT DISTINCT s.StudentName, e.Marks FROM Student_Exp5 s JOIN Enrollment_Exp5 e ON e.RollNo = s.RollNo WHERE e.Marks > ALL (SELECT Marks FROM Enrollment_Exp5 WHERE CourseID = 2);
SELECT StudentName FROM Student_Exp5 s WHERE EXISTS (SELECT 1 FROM Enrollment_Exp5 e WHERE e.RollNo = s.RollNo);
SELECT StudentName FROM Student_Exp5 s WHERE NOT EXISTS (SELECT 1 FROM Enrollment_Exp5 e WHERE e.RollNo = s.RollNo);
SELECT RollNo FROM Enrollment_Exp5 WHERE CourseID = 1 UNION SELECT RollNo FROM Enrollment_Exp5 WHERE CourseID = 4;
SELECT RollNo FROM Enrollment_Exp5 WHERE CourseID = 1 INTERSECT SELECT RollNo FROM Enrollment_Exp5 WHERE CourseID = 4;

COMMIT;