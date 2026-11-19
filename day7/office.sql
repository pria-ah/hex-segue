create database office;
use office;
create table employee (
    emp_id int primary key,
    name varchar(50),
    department varchar(50),
    salary int,
    city varchar(50)
);
insert into employee values
(1, 'Amit', 'IT', 30000, 'Delhi'),
(2, 'Neha', 'HR', 45000, 'Mumbai'),
(3, 'Ravi', 'IT', 60000, 'Delhi'),
(4, 'Priya', 'Sales', 25000, 'Pune'),
(5, 'Rahul', 'HR', 50000, 'Delhi'),
(6, 'Sneha', 'Sales', 35000, 'Mumbai'),
(7, 'Karan', 'IT', 70000, 'Pune'),
(8, 'Pooja', 'HR', 40000, 'Delhi');

-- display all employee records
select * from employee;

-- display employees earning more than 40000
select name, salary
from employee
where salary > 40000;

-- display employees earning less than average salary
select name, salary
from employee
where salary < (select avg(salary) from employee);

-- display employees receiving maximum salary
select name, salary
from employee
where salary = (select max(salary) from employee);

-- display employees receiving minimum salary
select name, salary
from employee
where salary = (select min(salary) from employee);

-- display employees working in the same department as amit
select name, department
from employee
where department = (select department from employee where name = 'Amit');

-- display employees working in departments where salary is greater than 45000
select name, department, salary
from employee
where department in (
    select department
    from employee
    where salary > 45000
);

-- display employees whose salary is greater than all hr employees
select name, salary, department
from employee
where salary > all (
    select salary
    from employee
    where department = 'HR'
);

-- display employees whose salary is greater than any sales employee
select name, salary, department
from employee
where salary > any (
    select salary
    from employee
    where department = 'Sales'
);

-- display departments having average salary greater than company average salary
select department, avg(salary)
from employee
group by department
having avg(salary) > (select avg(salary) from employee);

-- display employees who are not working in it department
select name, department
from employee
where emp_id not in (
    select emp_id
    from employee
    where department = 'IT'
);