-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/c31dBy
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "dept_no" Varchar   NOT NULL,
    "dept_name" Varchar   NOT NULL
);

CREATE TABLE "Employees" (
    "emp_no" Integer   NOT NULL,
    "birth_date" Timestamp   NOT NULL,
    "first_name" Varchar   NOT NULL,
    "last_name" Varchar   NOT NULL,
    "gender" Varchar   NOT NULL,
    "hire_date" Timestamp   NOT NULL
);

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

CREATE TABLE "Titles" (
    "ID" serial   NOT NULL,
    "emp_no" Integer   NOT NULL,
    "title" Varchar   NOT NULL,
    "from_date" Timestamp   NOT NULL,
    "to_date" Timestamp   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "ID"
     )
);

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

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Manager" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employee" ADD CONSTRAINT "fk_Dept_Employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

