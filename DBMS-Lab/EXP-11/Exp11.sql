-- Mini database design projects: compact starter schemas
CREATE TABLE StudentProject_Exp11 (StudentID NUMBER PRIMARY KEY, StudentName VARCHAR2(60), Course VARCHAR2(40), Phone VARCHAR2(15));
CREATE TABLE PatientProject_Exp11 (PatientID NUMBER PRIMARY KEY, PatientName VARCHAR2(60), Diagnosis VARCHAR2(100), Doctor VARCHAR2(60));
CREATE TABLE RailwayProject_Exp11 (TicketID NUMBER PRIMARY KEY, PassengerName VARCHAR2(60), TrainNo NUMBER, TravelDate DATE, SeatNo VARCHAR2(10));
CREATE TABLE TimetableProject_Exp11 (EntryID NUMBER PRIMARY KEY, CourseCode VARCHAR2(20), Faculty VARCHAR2(60), RoomNo VARCHAR2(15), ClassTime VARCHAR2(30));
CREATE TABLE HotelProject_Exp11 (BookingID NUMBER PRIMARY KEY, GuestName VARCHAR2(60), RoomNo VARCHAR2(10), CheckIn DATE, CheckOut DATE);
INSERT INTO StudentProject_Exp11 VALUES (1, 'Anu', 'BCA', '9000000001');
INSERT INTO PatientProject_Exp11 VALUES (1, 'Bala', 'General checkup', 'Dr Rao');
INSERT INTO RailwayProject_Exp11 VALUES (1, 'Charles', 12674, DATE '2026-04-15', 'A1-12');
INSERT INTO TimetableProject_Exp11 VALUES (1, 'DBMS', 'Dr Hemapoorani', 'Lab-1', '09:00-11:00');
INSERT INTO HotelProject_Exp11 VALUES (1, 'Divya', '204', DATE '2026-04-15', DATE '2026-04-17');
COMMIT;

SELECT * FROM StudentProject_Exp11;
SELECT * FROM PatientProject_Exp11;
SELECT * FROM RailwayProject_Exp11;
SELECT * FROM TimetableProject_Exp11;
SELECT * FROM HotelProject_Exp11;