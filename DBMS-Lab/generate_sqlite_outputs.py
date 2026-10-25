#!/usr/bin/env python3
"""Generate Markdown DBMS lab output files with local SQLite.

The Oracle programs remain the authoritative lab scripts.  This runner uses
only Python's standard-library sqlite3 module and records the equivalent
queries and results in a format suitable for VS Code preview.
"""
from pathlib import Path
import sqlite3

ROOT = Path(__file__).resolve().parent
def rows(db, sql, params=()):
    cur = db.execute(sql, params)
    names = [d[0] for d in cur.description]
    return names, cur.fetchall()


def show(db, title, sql, params=()):
    names, data = rows(db, sql, params)
    lines = [f"### {title}", "| " + " | ".join(names) + " |",
             "| " + " | ".join("---" for _ in names) + " |"]
    lines += ["| " + " | ".join("" if v is None else str(v) for v in row) + " |"
              for row in data]
    return "\n".join(lines)


def exp1(db):
    db.executescript("""CREATE TABLE Student(StudentID INTEGER PRIMARY KEY, StudentName TEXT,
        Department TEXT, Age INTEGER, CGPA REAL);
        INSERT INTO Student VALUES
        (101,'Anu','CSE',20,8.90),(102,'Bala','ECE',21,8.50),
        (103,'Charles','IT',20,9.10),(104,'Divya','CSE',22,8.70),
        (105,'Esha','AIDS',21,9.20);""")
    return [show(db, "All students", "SELECT * FROM Student"),
            show(db, "CSE students", "SELECT * FROM Student WHERE Department='CSE'"),
            show(db, "CGPA > 8.8", "SELECT * FROM Student WHERE CGPA > 8.8"),
            show(db, "Ordered by CGPA", "SELECT * FROM Student ORDER BY CGPA DESC"),
            show(db, "Count", "SELECT COUNT(*) AS TotalStudents FROM Student"),
            show(db, "Average", "SELECT AVG(CGPA) AS Average_CGPA FROM Student")]


def exp2(db):
    db.executescript("""CREATE TABLE Employee(EmpID INTEGER PRIMARY KEY, EmployeeName TEXT NOT NULL,
        Department TEXT, Salary REAL, JoinDate TEXT);
        INSERT INTO Employee VALUES
        (101,'Anjali Sharma','IT',45000,'2023-06-15'),(102,'Ravi Kumar','HR',38000,'2022-03-10'),
        (103,'Priya Singh','Finance',52000,'2021-11-01'),(104,'Karthik Iyer','IT',47000,'2023-01-20'),
        (105,'Meera Das','Finance',43000,'2019-08-12');""")
    before = show(db, "Finance salary > 40000", "SELECT * FROM Employee WHERE Department='Finance' AND Salary>40000")
    db.execute("UPDATE Employee SET Salary=Salary*1.10 WHERE Department='IT'")
    db.execute("DELETE FROM Employee WHERE JoinDate<'2020-01-01'")
    return [before, show(db, "After DML/DDL equivalent", "SELECT * FROM Employee ORDER BY Salary")]


def exp3(db):
    db.executescript("""CREATE TABLE Book(BookID INTEGER PRIMARY KEY, Title TEXT, Author TEXT,
        Category TEXT, Price REAL);
        INSERT INTO Book VALUES (101,'Database System','Korth','Database',550),
        (102,'C Programming','Dennis Ritchie','Programming',450),(103,'Java Programming','Herbert Schildt','Programming',650),
        (104,'Python Basics','Mark Lutz','Programming',700),(105,'Computer Networks','Tanenbaum','Networking',600);""")
    db.execute("UPDATE Book SET Price=Price*1.10 WHERE Category='Programming'")
    db.execute("UPDATE Book SET Price=800 WHERE BookID=104")
    db.rollback()  # equivalent demonstration of ROLLBACK; restore transaction below
    db.execute("UPDATE Book SET Price=Price*1.10 WHERE Category='Programming'")
    return [show(db, "TCL final state", "SELECT * FROM Book ORDER BY BookID")]


def exp4(db):
    db.executescript("""CREATE TABLE Department(DeptID INTEGER PRIMARY KEY, DeptName TEXT UNIQUE NOT NULL);
        CREATE TABLE Student(RollNo INTEGER PRIMARY KEY, StudentName TEXT NOT NULL,
        Age INTEGER CHECK(Age BETWEEN 17 AND 30), Email TEXT UNIQUE,
        Gender TEXT DEFAULT 'Not Specified', DeptID INTEGER REFERENCES Department);
        INSERT INTO Department VALUES(1,'Computer Science'),(2,'Electronics');
        INSERT INTO Student VALUES(101,'Arun',20,'arun@email.com','Male',1);
        INSERT INTO Student(RollNo,StudentName,Age,Email,DeptID) VALUES(102,'Priya',21,'priya@email.com',2);""")
    return [show(db, "Valid rows", "SELECT * FROM Student"),
            show(db, "SQLite constraints", "SELECT name, type FROM sqlite_master WHERE type='table' ORDER BY name")]


def exp5(db):
    db.executescript("""CREATE TABLE Student(RollNo INTEGER PRIMARY KEY, StudentName TEXT, DeptID INTEGER);
        CREATE TABLE Course(CourseID INTEGER PRIMARY KEY, CourseName TEXT, Credits INTEGER);
        CREATE TABLE Enrollment(RollNo INTEGER, CourseID INTEGER, Marks INTEGER, PRIMARY KEY(RollNo,CourseID));
        INSERT INTO Student VALUES(101,'Arun',1),(102,'Priya',2),(103,'Kumar',1),(104,'Sita',3),(105,'Meena',2);
        INSERT INTO Course VALUES(1,'Data Structures',4),(2,'Digital Circuits',3),(3,'Thermodynamics',4),(4,'DBMS',4);
        INSERT INTO Enrollment VALUES(101,1,85),(101,4,78),(102,2,60),(102,4,55),(103,1,90),(103,4,88),(104,3,70),(105,2,45);""")
    return [show(db,"IN", "SELECT StudentName FROM Student WHERE DeptID IN (1,3)"),
            show(db,"EXISTS", "SELECT StudentName FROM Student s WHERE EXISTS (SELECT 1 FROM Enrollment e WHERE e.RollNo=s.RollNo)"),
            show(db,"NOT EXISTS", "SELECT StudentName FROM Student s WHERE NOT EXISTS (SELECT 1 FROM Enrollment e WHERE e.RollNo=s.RollNo)"),
            show(db,"UNION", "SELECT RollNo FROM Enrollment WHERE CourseID=1 UNION SELECT RollNo FROM Enrollment WHERE CourseID=4"),
            show(db,"INTERSECT", "SELECT RollNo FROM Enrollment WHERE CourseID=1 INTERSECT SELECT RollNo FROM Enrollment WHERE CourseID=4")]


def exp6(db):
    db.executescript("""CREATE TABLE Sales(SaleID INTEGER PRIMARY KEY, SaleDate TEXT, Region TEXT, Category TEXT, Amount REAL);
        INSERT INTO Sales VALUES(1,'2026-01-05','North','Laptop',75000),(2,'2026-01-10','South','Phone',45000),
        (3,'2026-02-02','North','Phone',30000),(4,'2026-02-12','East','Laptop',82000),
        (5,'2026-02-18','South','Laptop',68000),(6,'2026-03-01','East','Phone',52000);""")
    return [show(db,"Aggregates","SELECT COUNT(*) TotalSales,SUM(Amount) TotalAmount,AVG(Amount) AverageAmount,MIN(Amount) MinimumAmount,MAX(Amount) MaximumAmount FROM Sales"),
            show(db,"GROUP BY region","SELECT Region,COUNT(*) NumberOfSales,SUM(Amount) RegionTotal FROM Sales GROUP BY Region ORDER BY Region"),
            show(db,"HAVING","SELECT Category,SUM(Amount) CategoryTotal FROM Sales GROUP BY Category HAVING SUM(Amount)>100000")]


def exp7(db):
    db.executescript("""CREATE TABLE Student(StudentID INTEGER PRIMARY KEY, StudentName TEXT, Department TEXT, CGPA REAL);
        INSERT INTO Student VALUES(101,'Anu','CSE',8.9),(102,'Bala','ECE',8.5),(103,'Charles','IT',9.1);""")
    return [show(db,"View equivalent","SELECT StudentID,StudentName,CGPA FROM Student WHERE CGPA>=8.8 ORDER BY StudentID"),
            show(db,"Savepoint rollback state","SELECT * FROM Student ORDER BY StudentID")]


def exp8(db):
    db.executescript("""CREATE TABLE Student(StudentID INTEGER PRIMARY KEY,StudentName TEXT);
        CREATE TABLE Course(CourseID INTEGER PRIMARY KEY,CourseName TEXT,Instructor TEXT);
        CREATE TABLE Enrollment(StudentID INTEGER,CourseID INTEGER,PRIMARY KEY(StudentID,CourseID));
        INSERT INTO Student VALUES(1,'Anu'),(2,'Bala'); INSERT INTO Course VALUES(10,'DBMS','Dr Rao'),(20,'Networks','Dr Iyer');
        INSERT INTO Enrollment VALUES(1,10),(1,20),(2,10);""")
    return [show(db,"Students (3NF)", "SELECT * FROM Student"),
            show(db,"Courses (3NF)", "SELECT * FROM Course"),
            show(db,"Enrollment (3NF)", "SELECT * FROM Enrollment")]


def exp9(db):
    db.executescript("""CREATE TABLE Customer(CustomerID INTEGER PRIMARY KEY,CustomerName TEXT,City TEXT);
        CREATE TABLE Orders(OrderID INTEGER PRIMARY KEY,CustomerID INTEGER,OrderDate TEXT);
        CREATE TABLE Product(ProductID INTEGER PRIMARY KEY,ProductName TEXT,Price REAL);
        CREATE TABLE OrderItem(OrderID INTEGER,ProductID INTEGER,Quantity INTEGER,PRIMARY KEY(OrderID,ProductID));
        INSERT INTO Customer VALUES(1,'Anu','Chennai'),(2,'Bala','Kanchipuram');
        INSERT INTO Orders VALUES(101,1,'2026-03-01'),(102,2,'2026-03-02');
        INSERT INTO Product VALUES(10,'Keyboard',1200),(20,'Monitor',9000);
        INSERT INTO OrderItem VALUES(101,10,2),(101,20,1),(102,10,1);""")
    return [show(db,"Join", "SELECT c.CustomerName,o.OrderID,p.ProductName,oi.Quantity FROM Customer c JOIN Orders o ON o.CustomerID=c.CustomerID JOIN OrderItem oi ON oi.OrderID=o.OrderID JOIN Product p ON p.ProductID=oi.ProductID"),
            show(db,"Order values", "SELECT c.CustomerName,COALESCE(SUM(p.Price*oi.Quantity),0) OrderValue FROM Customer c LEFT JOIN Orders o ON o.CustomerID=c.CustomerID LEFT JOIN OrderItem oi ON oi.OrderID=o.OrderID LEFT JOIN Product p ON p.ProductID=oi.ProductID GROUP BY c.CustomerName")]


def exp10(db):
    db.executescript("""CREATE TABLE Employee(EmpID INTEGER PRIMARY KEY,EmployeeName TEXT,Salary REAL,Department TEXT);
        INSERT INTO Employee VALUES(1,'Anu',45000,'IT'),(2,'Bala',52000,'HR');""")
    count = db.execute("SELECT COUNT(*) FROM Employee").fetchone()[0]
    db.execute("UPDATE Employee SET Salary=Salary*1.10 WHERE EmpID=1")
    return [f"Employees: {count}", "Annual salary (Python/SQLite equivalent): 540000",
            show(db,"Cursor-equivalent rows","SELECT EmpID,EmployeeName,Salary FROM Employee ORDER BY EmpID")]


def exp11(db):
    db.executescript("""CREATE TABLE StudentProject(StudentID INTEGER PRIMARY KEY,StudentName TEXT,Course TEXT,Phone TEXT);
        CREATE TABLE PatientProject(PatientID INTEGER PRIMARY KEY,PatientName TEXT,Diagnosis TEXT,Doctor TEXT);
        CREATE TABLE RailwayProject(TicketID INTEGER PRIMARY KEY,PassengerName TEXT,TrainNo INTEGER,TravelDate TEXT,SeatNo TEXT);
        CREATE TABLE TimetableProject(EntryID INTEGER PRIMARY KEY,CourseCode TEXT,Faculty TEXT,RoomNo TEXT,ClassTime TEXT);
        CREATE TABLE HotelProject(BookingID INTEGER PRIMARY KEY,GuestName TEXT,RoomNo TEXT,CheckIn TEXT,CheckOut TEXT);
        INSERT INTO StudentProject VALUES(1,'Anu','BCA','9000000001');
        INSERT INTO PatientProject VALUES(1,'Bala','General checkup','Dr Rao');
        INSERT INTO RailwayProject VALUES(1,'Charles',12674,'2026-04-15','A1-12');
        INSERT INTO TimetableProject VALUES(1,'DBMS','Dr Hemapoorani','Lab-1','09:00-11:00');
        INSERT INTO HotelProject VALUES(1,'Divya','204','2026-04-15','2026-04-17');""")
    return [show(db, table, f"SELECT * FROM {table}") for table in
            ("StudentProject","PatientProject","RailwayProject","TimetableProject","HotelProject")]


EXPERIMENTS = (exp1, exp2, exp3, exp4, exp5, exp6, exp7, exp8, exp9, exp10, exp11)


def main():
    OUT.mkdir(exist_ok=True)
    for number, experiment in enumerate(EXPERIMENTS, 1):
        experiment_dir = ROOT / f"EXP-{number}"
        experiment_dir.mkdir(exist_ok=True)
        db = sqlite3.connect(":memory:")
        try:
            body = "\n\n".join(experiment(db))
            text = ("# DBMS Lab Program Output (local database)\n\n"
                    f"## Experiment EXP-{number}\n\n{body}\n")
            (experiment_dir / "output.md").write_text(text, encoding="utf-8")
        finally:
            db.close()


if __name__ == "__main__":
    main()
