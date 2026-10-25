-- Normalization example using functional dependencies
BEGIN EXECUTE IMMEDIATE 'DROP TABLE Enrollment_Exp8 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE StudentCourse_Exp8 PURGE'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
CREATE TABLE StudentCourse_Exp8 (StudentID NUMBER, StudentName VARCHAR2(50), CourseID NUMBER, CourseName VARCHAR2(50), Instructor VARCHAR2(50), PRIMARY KEY (StudentID, CourseID));
INSERT ALL
  INTO StudentCourse_Exp8 VALUES (1, 'Anu', 10, 'DBMS', 'Dr Rao')
  INTO StudentCourse_Exp8 VALUES (1, 'Anu', 20, 'Networks', 'Dr Iyer')
  INTO StudentCourse_Exp8 VALUES (2, 'Bala', 10, 'DBMS', 'Dr Rao')
SELECT 1 FROM dual;

CREATE TABLE Student_Exp8 (StudentID NUMBER PRIMARY KEY, StudentName VARCHAR2(50) NOT NULL);
CREATE TABLE Course_Exp8 (CourseID NUMBER PRIMARY KEY, CourseName VARCHAR2(50) NOT NULL, Instructor VARCHAR2(50));
CREATE TABLE Enrollment_Exp8 (StudentID NUMBER REFERENCES Student_Exp8, CourseID NUMBER REFERENCES Course_Exp8, PRIMARY KEY (StudentID, CourseID));
INSERT INTO Student_Exp8 SELECT DISTINCT StudentID, StudentName FROM StudentCourse_Exp8;
INSERT INTO Course_Exp8 SELECT DISTINCT CourseID, CourseName, Instructor FROM StudentCourse_Exp8;
INSERT INTO Enrollment_Exp8 SELECT StudentID, CourseID FROM StudentCourse_Exp8;
SELECT * FROM Student_Exp8;
SELECT * FROM Course_Exp8;
SELECT * FROM Enrollment_Exp8;
COMMIT;