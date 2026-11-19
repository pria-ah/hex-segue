select * from employee;

-- 1. display employee salary rounded to 0 decimal places
select emp_id, round(salary, 0) as rounded_salary
from employee;

-- 2. display salary rounded to 1 decimal place
select emp_id, round(salary, 1) as rounded_salary
from employee;

-- 3. display the ceil value of every employee's salary
select emp_id, ceil(salary) as ceil_salary
from employee;

-- 4. display the floor value of every employee's salary
select emp_id, floor(salary) as floor_salary
from employee;

-- 5. calculate the absolute difference between salary and bonus
select emp_id, abs(salary - bonus) as difference
from employee;

-- 6. calculate the remainder when salary is divided by 1000
select emp_id, mod(salary, 1000) as remainder
from employee;

-- 7. calculate the square of every employee's age
select emp_id, power(age, 2) as age_square
from employee;

-- 8. calculate the square root of employee salary
select emp_id, sqrt(salary) as salary_square_root
from employee;

-- 9. truncate salary to 1 decimal place
select emp_id, truncate(salary, 1) as truncated_salary
from employee;

-- 10. calculate total salary + bonus for every employee
select emp_id, salary + bonus as total_salary
from employee;

-- 1. display all employee names in uppercase
select upper(concat(first_name, ' ', last_name)) as employee_name
from employee;

-- 2. display all department names in lowercase
select distinct lower(department) as department_name
from employee;

-- 3. display the length of every employee's first name
select first_name, length(first_name) as name_length
from employee;

-- 4. display full name by combining first name and last name
select concat(first_name, ' ', last_name) as full_name
from employee;

-- 5. display the first three characters of every employee's name
select first_name, substring(first_name, 1, 3) as first_three_characters
from employee;

-- 6. display the last three characters of every employee's email
select email, right(email, 3) as last_three_characters
from employee;

-- 7. extract the first five characters of every email
select email, left(email, 5) as first_five_characters
from employee;

-- 8. replace gmail.com with company.com in every email
select email, replace(email, 'gmail.com', 'company.com') as new_email
from employee;

-- 9. display employee names in reverse order
select first_name, reverse(first_name) as reversed_name
from employee;

-- 10. find the position of @ in every employee's email
select email, locate('@', email) as at_position
from employee;

-- 11. display full names with a space between first and last names
select concat(first_name, ' ', last_name) as full_name
from employee;

-- 12. display the first two characters of every department
select department, left(department, 2) as first_two_characters
from employee;

-- 13. combine employee name and department into one column
select concat(first_name, ' ', last_name, ' - ', department) as employee_details
from employee;

-- 14. display the first name in uppercase and last name in lowercase
select upper(first_name) as first_name,
       lower(last_name) as last_name
from employee;

-- 15. count the characters in every employee's full name
select concat(first_name, ' ', last_name) as full_name,
       length(concat(first_name, ' ', last_name)) as name_length
from employee;
