CREATE DATABASE payroll;
USE payroll;
-- Table: Department
CREATE TABLE Department (
    Job_ID int NOT NULL,
    Job_dept varchar(20) NOT NULL,
    Dept_description text NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY (Job_ID)
);

-- Table: Employee
CREATE TABLE Employee (
    Employee_ID int NOT NULL,
    Name varchar(20) NOT NULL,
    Gender varchar(20) NOT NULL,
    Age text NOT NULL,
    Contact varchar(20) NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY (Employee_ID)
);

-- Table: Leave
CREATE TABLE `Leave` (
    Leave_ID int NOT NULL,
    Emp_ID int NOT NULL,
    Date date NOT NULL,
    Status varchar(20) NOT NULL,
    Reason varchar(20) NOT NULL,
    CONSTRAINT Leave_pk PRIMARY KEY (Leave_ID)
);

-- Table: Payroll
CREATE TABLE Payroll (
    Payroll_ID int NOT NULL,
    Emp_ID int NOT NULL,
    Job_ID int NOT NULL,
    Salary_ID int NOT NULL,
    Leave_ID int NOT NULL,
    Date date NOT NULL,
    Amount float NOT NULL,
    CONSTRAINT Payroll_pk PRIMARY KEY (Payroll_ID)
);

-- Table: Salary
CREATE TABLE Salary (
    Salary_ID int NOT NULL,
    Emp_ID int NOT NULL,
    Amount float NOT NULL,
    Annual_Salary FLOAT NOT NULL,
    Bonus float NOT NULL,
    CONSTRAINT Salary_pk PRIMARY KEY (Salary_ID)
);

-- Reference: Leave_Employee (table: Leave)
ALTER TABLE `Leave` ADD CONSTRAINT Leave_Employee FOREIGN KEY Leave_Employee (Emp_ID)
    REFERENCES Employee (Employee_ID);

-- Reference: Payroll_Department (table: Payroll)
ALTER TABLE Payroll ADD CONSTRAINT Payroll_Department FOREIGN KEY Payroll_Department (Job_ID)
    REFERENCES Department (Job_ID);

-- Reference: Payroll_Employee (table: Payroll)
ALTER TABLE Payroll ADD CONSTRAINT Payroll_Employee FOREIGN KEY Payroll_Employee (Emp_ID)
    REFERENCES Employee (Employee_ID);

-- Reference: Payroll_Leave (table: Payroll)
ALTER TABLE Payroll ADD CONSTRAINT Payroll_Leave FOREIGN KEY Payroll_Leave (Leave_ID)
    REFERENCES `Leave` (Leave_ID);

-- Reference: Payroll_Salary (table: Payroll)
ALTER TABLE Payroll ADD CONSTRAINT Payroll_Salary FOREIGN KEY Payroll_Salary (Salary_ID)
    REFERENCES Salary (Salary_ID);

-- Reference: Salary_Employee (table: Salary)
ALTER TABLE Salary ADD CONSTRAINT Salary_Employee FOREIGN KEY Salary_Employee (Emp_ID)
    REFERENCES Employee (Employee_ID);


