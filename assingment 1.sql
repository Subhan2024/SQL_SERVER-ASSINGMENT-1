create database CompanyDB;

use CompanyDB;

CREATE TABLE Employees(
    EmployeeID INT IDENTITy not null,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DepartmentID INT,
    Salary decimal(10 , 2) not null,
	foreign key (DepartmentID) references Departments(DepartmentID),
);

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary)
VALUES ('Subhan' , 'Khan' , 1 , 30000.00),
('Rehman' , 'Khan' , 2 , 50000.00),
('Ubaid' , 'Zada' , 3 , 62000.00),
('Zain' , 'Sarfaraz' , 4, 25000.00),
('Zakir' , 'Khan' , 5 , 50000.00),
('Sadan' , 'khan' , 5 , 90000.00),
('Ebad' , 'uddin' , 4 , 42000.00),
('Shazaib' , 'Khan' , 4 , 20000.00),
('Rizwan' , 'Khan' , 3 , 31000.00),
('Tayyab' , 'usman' , 2 , 30000.00);
 
select * from Employees;
select * from Departments;

CREATE TABLE Departments(
DepartmentID int not null unique identity,
DepartmentName varchar(255)not null
);

INSERT INTO Departments(DepartmentName)
VALUES ('IT'),
('Manager'),
('Ast.Manager'),
('mangement'),
('Employee');
alter table Employees drop column HireDate;
ALTER TABLE Employees ADD HireDate DATETIME;

UPDATE Employees set Salary = Salary * 1.1 where DepartmentID = 1;

DELETE FROM Employees where Salary < 30000;

SELECT E.FirstName , E.LastName , D.DepartmentName , E.Salary FROM Employees E INNER JOIN Departments D on E.DepartmentID = D.DepartmentID;	

SELECT D.DepartmentID, D.DepartmentName , COUNT(E.EmployeeID) AS NumberofEmployees FROM Departments D LEFT JOIN Employees E ON D.DepartmentID = E.DepartmentID
GROUP BY D.DepartmentID , D.DepartmentName; 

SELECT D.DepartmentID, D.DepartmentName, COUNT(E.EmployeeID) AS NumberOfEmployees FROM Departments D LEFT JOIN Employees E ON D.DepartmentID = 
E.DepartmentID GROUP BY D.DepartmentID, D.DepartmentName;

SELECT FirstName, LastName, HireDate FROM Employees WHERE HireDate > '2023-01-01';