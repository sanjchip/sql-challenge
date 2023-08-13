-- Data Engineering

CREATE TABLE Titles (
	title_id VARCHAR  NOT NULL,
    title VARCHAR   NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * from Titles;

CREATE TABLE Employees (
    emp_no INT  NOT NULL,
	emp_title_id VARCHAR  NOT NULL,
    birth_date date  NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR  NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_date date   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id),
	PRIMARY KEY (emp_no)
);
	
SELECT * from Employees;


CREATE TABLE Departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR UNIQUE  NOT NULL,
	PRIMARY KEY (dept_no)
);	

SELECT * from Departments;

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
	dept_no VARCHAR   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * from Department_Employees;

CREATE TABLE Department_Manager (
    dept_no VARCHAR   NOT NULL,
    emp_no int   NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);	

SELECT * from Department_Manager;

CREATE TABLE Salaries (
    emp_no int   NOT NULL,
	salary INTEGER   NOT NULL,  
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * from Salaries;


Set datestyle to ISO, MDY

COPY Titles FROM 'C:\Users\sanji\data\titles.csv' DELIMITER ',' CSV HEADER;
COPY Employees FROM 'C:\Users\sanji\data\employees.csv' DELIMITER ',' CSV HEADER;
COPY Departments FROM 'C:\Users\sanji\data\departments.csv' DELIMITER ',' CSV HEADER;
COPY Department_Employees FROM 'C:\Users\sanji\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
COPY Department_Manager FROM 'C:\Users\sanji\data\dept_manager.csv' DELIMITER ',' CSV HEADER;
COPY Salaries FROM 'C:\Users\sanji\data\salaries.csv' DELIMITER ',' CSV HEADER;



