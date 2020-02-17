--#### Data Engineering
--* Use the information you have to create a table schema for each of the six CSV files. Remember to specify data types, primary keys, foreign keys, and other constraints.
-- Drop the tables
DROP TABLE IF EXISTS Titles;
DROP TABLE IF EXISTS Salaries;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Dept_Manager;
DROP TABLE IF EXISTS Dept_Employee;
DROP TABLE IF EXISTS Departments;

--CREATE TABLES, WITH KEYS AND IMPORT DATA

Create Table Titles(
	emp_no integer,
	title varchar not null,
	from_date date not null,
	to_date date not null
)

select * from Titles;

CREATE TABLE "Departments" (
    "dept_no" Varchar   NOT NULL,
    "dept_name" Varchar   NOT NULL
);

select * from "Departments";

CREATE TABLE "Employees" (
    "emp_no" Integer   NOT NULL,
    "birth_date" Timestamp   NOT NULL,
    "first_name" Varchar   NOT NULL,
    "last_name" Varchar   NOT NULL,
    "gender" Varchar   NOT NULL,
    "hire_date" Timestamp   NOT NULL
);

select * from "Employees";

CREATE TABLE "Dept_Manager" (
    "ID" serial   NOT NULL,
    "dept_no" Varchar   NOT NULL,
    "emp_no" Integer   NOT NULL,
    "from_date" Timestamp   NOT NULL,
    "to_date" Timestamp   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "emp_no"
     )
);

select * from "Dept_Manager";

CREATE TABLE "Dept_Employee" (
    "ID" serial   NOT NULL,
    "emp_no" Integer   NOT NULL,
    "dept_no" Varchar   NOT NULL,
    "from_date" Timestamp   NOT NULL,
    "to_date" Timestamp   NOT NULL,
    CONSTRAINT "pk_Dept_Employee" PRIMARY KEY (
        "ID"
     )
);

select * from "Dept_Employee";


CREATE TABLE "Salaries" (
    "ID" serial   NOT NULL,
    "emp_no" Integer   NOT NULL,
    "salary" Integer   NOT NULL,
    "from_date" Timestamp   NOT NULL,
    "to_date" Timestamp   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "ID"
     )
);

select * from "Salaries";

---====================
--IMPORT DATA TO TABLES
--Using import 
--======================
-- #### Data Analysis
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

Select "Employees".emp_no, "Employees".last_name, "Employees".first_name, "Employees".gender,
"Salaries".salary 
From "Employees"
Inner Join "Salaries" ON "Employees".emp_no = "Salaries".emp_no


-- List employees who were hired in 1986.
Select * 
From "Employees"
Where "hire_date" > '1985-12-31 23:59:59' 
	AND "hire_date" < '1987-01-01 00:00:00'


-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
Select "Dept_Manager".dept_no, 
"Departments".dept_name,
"Dept_Manager".emp_no,  
"Employees".last_name, "Employees".first_name,
"Dept_Manager".from_date, "Dept_Manager".to_date
From "Dept_Manager"
Inner Join "Employees" ON "Dept_Manager".emp_no = "Employees".emp_no 
Inner Join "Departments" ON  "Dept_Manager".dept_no = "Departments".dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

Select "Employees".emp_no, "Employees".last_name, "Employees".first_name, 
"Departments".dept_name
From "Employees"
Join "Dept_Employee" 
	ON  "Employees".emp_no = "Dept_Employee".emp_no
	Join "Departments"
		ON "Dept_Employee".dept_no = "Departments".dept_no 
		

--5. List all employees whose first name is "Hercules" and last names begin with "B."
Select * From "Employees"
Where first_name = 'Hercules'
	AND last_name like 'B%'

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
Select "Employees".emp_no, "Employees".last_name, "Employees".first_name, 
"Departments".dept_name
From "Departments"
Join "Dept_Employee"
	ON "Dept_Employee".dept_no = "Departments".dept_no
	Join "Employees"
		ON "Employees".emp_no = "Dept_Employee".emp_no
			Where "Departments".dept_name = 'Sales'


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select "Employees".emp_no, "Employees".last_name, "Employees".first_name, 
"Departments".dept_name
From "Departments"
Join "Dept_Employee"
	ON "Dept_Employee".dept_no = "Departments".dept_no
	Join "Employees"
		ON "Employees".emp_no = "Dept_Employee".emp_no
			Where "Departments".dept_name = 'Sales' 
			OR "Departments".dept_name = 'Development' 
Order By "Departments".dept_name

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
Select last_name, count(*) AS "Employee Similar Last_Name"
From "Employees"
Group By last_name
Order by Count(*) desc, last_name

-- End



