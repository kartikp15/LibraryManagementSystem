create database dbms;
use dbms;
CREATE TABLE Book_Details  
(   ISBN_Code int PRIMARY KEY,  
    Book_Title varchar(100),  
    Language varchar(10),  
    Binding_Id int,  
    No_Copies_Actual int,  
    No_Copies_Current int,  
    Category_id int,  
    Publication_year int,
    FOREIGN KEY(Binding_Id) REFERENCES Binding_Details(Binding_Id),
    FOREIGN KEY(Category_Id) REFERENCES Category_Details(Category_Id));
desc Book_Details;

CREATE TABLE Binding_details  
( Binding_id int PRIMARY KEY,  
    Binding_Name varchar(50));
desc Binding_details;

CREATE TABLE Category_Details  
( Category_Id int PRIMARY KEY,  
  Category_Name varchar(50));
desc Category_Details;

CREATE TABLE Borrower_Details  
(   Borrower_Id int PRIMARY KEY,  
    Book_Id int,  
    Borrowed_From date,  
    Borrowed_TO date,  
    Actual_Return_Date date,  
    Issued_by int,
    FOREIGN KEY(Book_Id) REFERENCES Book_Details(ISBN_Code),
    FOREIGN KEY(Issued_by) REFERENCES Staff_Details(Staff_Id));
desc Borrower_Details;

CREATE TABLE Staff_Details  
(   Staff_Id int PRIMARY KEY,  
    Staff_Name varchar(50),  
    Password varchar(16),  
    Is_Admin float,  
    Designation varchar(20) );
desc Staff_Details;

Create TABLE Student_Details  
(   Student_Id varchar(10) PRIMARY KEY,  
    Student_Name varchar(50),  
    Sex Varchar(20),  
    Date_Of_Birth date,  
    Borrower_Id int,  
    Department varchar(10),  
    contact_Number varchar(11),
    FOREIGN KEY(Borrower_Id) REFERENCES Borrower_Details(Borrower_Id));
desc Student_Details;

Create Table Shelf_Details  
(   Shelf_id int PRIMARY KEY,  
    Shelf_No int,  
    Floor_No int  );
desc Shelf_Details;

ALTER TABLE Book_Details  
ADD(Shelf_Id int);  
ALTER TABLE Book_Details  
ADD CONSTRAINT Shelf_Id_FK FOREIGN KEY(Shelf_Id) REFERENCES Shelf_Details(Shelf_Id);  

insert into Book_Details values ( 978938984,'LET US C', 'ENGLISH', 1, 245, 178, 111, 2007);
insert into Book_Details values ( 978938994,'OBJECT ORIENTED PROGRAMMING WITH C++', 'ENGLISH', 2, 180, 89, 333, 2008);
insert into Book_Details values ( 817808670,'DATA STRUCTURES AND ALGORITHM ANALYSIS IN C++', 'ENGLISH', 1, 145, 65, 222, 2002);
insert into Book_Details values ( 978020106,'OPERATING SYSTEM CONCEPTS', 'ENGLISH', 2, 78, 31, 444, 1991);
insert into Book_Details values ( 978020107,'MODERN OPERATING SYSTEMS', 'ENGLISH', 2, 78, 31, 444, 1992,03);
insert into Book_Details values ( 917808670,'HTML & CSS: Design and Build Web Sites', 'ENGLISH', 1, 50, 23, 888, 2011,02);
insert into Book_Details values ( 978081780,'Head First HTML and CSS', 'ENGLISH', 2, 30, 14, 888, 2005,02);
insert into Book_Details values ( 817809780,'Learning Web Design', 'ENGLISH', 2, 36, 18, 888, 2012,02);
insert into Book_Details values ( 867009780,'Computer Networks', 'ENGLISH', 1, 55, 40, 555, 1981,01);
insert into Book_Details values ( 978080867,'Computer Networking: A Top-down Approach', 'ENGLISH', 1, 35, 25, 555, 2000,01);
insert into Book_Details values ( 867081780,'Networking All-in-One For Dummies', 'ENGLISH', 2, 54, 44, 555, 2021,01);
insert into Book_Details values ( 978020180,'Principles of Compiler Design', 'ENGLISH', 2, 120, 72, 666, 1997,04);
insert into Book_Details values ( 978020230,'Compiler Design in C', 'ENGLISH', 1, 154, 82, 666, 1990,04);
insert into Book_Details values ( 978010230,'Head First JavaScript Programming: A Brain-Friendly Guide', 'ENGLISH', 1, 154, 82, 777, 2014,03);
insert into Book_Details values ( 977010230,'Eloquent JavaScript, 3rd Edition: A Modern Introduction to Programming', 'ENGLISH', 1, 111, 90, 777, 2018,03);
insert into Book_Details values ( 970210230,'JavaScript: The Good Parts', 'ENGLISH', 1, 93, 82, 777, 2008,03);

select * from Book_Details;

insert into Binding_details values ( 1, 'SOFT');
insert into Binding_details values ( 2, 'HARD');
select * from Binding_details;

insert into Category_Details values ( 111, 'BASIC PROGRAMMING LANGUAGE');
insert into Category_Details values ( 222, 'DATA STRUCTURES AND ALGORITHM');
insert into Category_Details values ( 333, 'OBJECT ORIENTED PROGRAMMING');
insert into Category_Details values ( 444, 'OPERATING SYSTEMS');
insert into Category_Details values ( 555, 'COMPUTER NETWORKS');
insert into Category_Details values ( 666, 'COMPILER DESIGN');
insert into Category_Details values ( 777, 'JAVA SCRIPT');
insert into Category_Details values ( 888, 'HTML & CSS');
select * from Category_Details;

insert into Borrower_Details values ( 123987465, 978938984, '2022-02-21', '2022-05-21', '2022-03-15', 888665555);
insert into Borrower_Details values ( 678954321, 978938994, '2022-01-10', '2022-04-10', '2022-02-28', 333445555);
insert into Borrower_Details values ( 119988776, 817808670, '2021-11-18', '2022-02-18', '2022-03-05', 333445555);
insert into Borrower_Details values ( 119998756, 970210230, '2021-12-11', '2022-02-11', '2022-01-19', 222440033);
insert into Borrower_Details values ( 987688776, 817808670, '2021-10-12', '2022-01-12', '2022-01-31', 444332255);
insert into Borrower_Details values ( 654388776, 978010230, '2022-01-13', '2022-04-13', '2022-02-01', 333445555);
insert into Borrower_Details values ( 786488776, 867081780, '2022-02-16', '2022-05-16', '2022-03-22', 444332255);
insert into Borrower_Details values ( 984578776, 978020230, '2022-03-12', '2022-06-12', '2022-04-25', 555005453);
insert into Borrower_Details values ( 112671576, 978938984, '2022-01-19', '2022-04-19', '2022-02-15', 111400915);
select * from Borrower_Details;

insert into Staff_Details values ( 888665555, 'PARAMJEET SINGH', 'PARAMJEET888', 0, 'SENIOR_LIBRARIAN');
insert into Staff_Details values ( 333445555, 'PRAVEEN KUMAR', 'PRAVEEN333', 0, 'ASSISTANT_LIBRARIAN');
insert into Staff_Details values ( 444332255, 'JAIDEV BHATT', 'JAIDEV444', 0, 'ASSISTANT_LIBRARIAN');
insert into Staff_Details values ( 222440033, 'DEVESH PANDIT', 'DEVESH222', 0, 'PEON');
insert into Staff_Details values ( 111400915, 'ANKIT KUMAR', 'ANKIT111', 1, 'SENIOR_LIBRARIAN');
insert into Staff_Details values ( 555005453, 'NIKHIL SHARMA', 'NIKHIL555', 1, 'SENIOR_LIBRARIAN');
select * from Staff_Details;

insert into Student_Details values ( 11802072, 'KARTIK PATIAL', 'MALE', '2002-09-15', 123987465, 'IT', '08376931937');
insert into Student_Details values ( 11802081, 'LAKSHAY SHARMA', 'MALE', '2002-06-17', 678954321, 'IT', '09817608829');
insert into Student_Details values ( 11792082, 'VANSHIKA PANDEY', 'FEMALE', '2001-02-10', 119988776, 'COE', '09811920281');
insert into Student_Details values ( 11792081, 'DEVYANSHU KUMAR', 'MALE', '2001-09-20', 119998756, 'COE', '09811929871');
insert into Student_Details values ( 11719082, 'MANAN TANEJA', 'MALE', '2002-09-15', 987688776, 'COE', '08971920280');
insert into Student_Details values ( 90780092, 'VIDYUSHI GUPTA', 'FEMALE', '2003-04-11', 654388776, 'ECE', '06123920290');
insert into Student_Details values ( 91092002, 'AYUSH SINGH', 'MALE', '2002-07-15', 786488776, 'ECE', '03562920209');
insert into Student_Details values ( 56772082, 'AKASH ROY', 'MALE', '2001-03-14', 984578776, 'ECE', '08765920267');
insert into Student_Details values ( 65492982, 'URVI SINGH', 'FEMALE', '2003-02-23', 112671576, 'ECE', '07865920876');
select * from Student_Details;

insert into Shelf_Details values ( 01, 02, 01);
insert into Shelf_Details values ( 02, 03, 01);
insert into Shelf_Details values ( 03, 01, 01);
insert into Shelf_Details values ( 04, 01, 01);
insert into Shelf_Details values ( 05, 01, 02);
insert into Shelf_Details values ( 06, 03, 02);
select * from Shelf_Details;
update Book_Details SET Shelf_Id = 01 where ISBN_code = 978938984;
update Book_Details SET Shelf_Id = 02 where ISBN_code = 817808670;
update Book_Details SET Shelf_Id = 03 where ISBN_code = 978020106;
update Book_Details SET Shelf_Id = 05 where ISBN_code = 978938994;
select * from BOOK_DETAILS where Category_id = 444;
select * from Book_Details,Borrower_Details where Book_Id = ISBN_Code && Issued_by IN (select Staff_Id from Staff_details where Staff_Name = 'PRAVEEN KUMAR');
select distinct(Binding_id) from Binding_Details;
select ISBN_Code,Book_Title,Floor_No from Book_details as B,Shelf_Details as S where B.shelf_id = S.shelf_id and S.Floor_No = 01;  
select * from Student_Details,Borrower_Details where Department = 'IT' && Student_Details.Borrower_Id = Borrower_Details.Borrower_Id;
select * from Student_Details,Borrower_Details where Department = 'IT' && Student_Details.Borrower_Id = Borrower_Details.Borrower_Id && Book_Id IN (select ISBN_CODE from BOOK_DETAILS where Book_Title = 'LET US C' );