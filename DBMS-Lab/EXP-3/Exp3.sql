-- DCL and TCL commands
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE Book_Exp3 PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE Book_Exp3 (
  BookID NUMBER PRIMARY KEY,
  Title VARCHAR2(60),
  Author VARCHAR2(50),
  Category VARCHAR2(30),
  Price NUMBER(8,2)
);

INSERT ALL
  INTO Book_Exp3 VALUES (101, 'Database System', 'Korth', 'Database', 550)
  INTO Book_Exp3 VALUES (102, 'C Programming', 'Dennis Ritchie', 'Programming', 450)
  INTO Book_Exp3 VALUES (103, 'Java Programming', 'Herbert Schildt', 'Programming', 650)
  INTO Book_Exp3 VALUES (104, 'Python Basics', 'Mark Lutz', 'Programming', 700)
  INTO Book_Exp3 VALUES (105, 'Computer Networks', 'Tanenbaum', 'Networking', 600)
SELECT 1 FROM dual;

COMMIT;

-- Run these DCL statements as an administrator after creating STUDENT1.
-- CREATE USER student1 IDENTIFIED BY Student1Pass;
-- GRANT CREATE SESSION TO student1;
-- GRANT SELECT, INSERT, UPDATE ON Book_Exp3 TO student1;
-- REVOKE UPDATE ON Book_Exp3 FROM student1;

SAVEPOINT before_raise;
UPDATE Book_Exp3 SET Price = Price * 1.10 WHERE Category = 'Programming';
SAVEPOINT after_raise;
UPDATE Book_Exp3 SET Price = 800 WHERE BookID = 104;
ROLLBACK TO after_raise;
DELETE FROM Book_Exp3 WHERE BookID = 105;
ROLLBACK;
COMMIT;

SELECT * FROM Book_Exp3 ORDER BY BookID;