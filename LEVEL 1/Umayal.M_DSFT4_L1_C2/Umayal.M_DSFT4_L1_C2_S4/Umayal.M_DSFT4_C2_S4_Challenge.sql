use hr;

-- task1
select count(employee_id) from employees;
-- task2
select department_id,count(department_id) from employees group by department_id;
-- task3
select employee_id,first_name,salary from employees where salary>6000;
-- task4
select employee_id,count(employee_id) from employees where salary>20000;
-- task5
select * from departments;
select count(department_id=60) as 'No.of.employee in IT DEPARTMENT' from employees;
-- task6
SET SQL_SAFE_UPDATES= 0;
alter table employees add column (Annual_CTC int not null);
describe employees;
update employees SET Annual_CTC=salary*12;
-- task7
alter table employees add Incremented_Annual_CTC int not null;
update employees SET Incremented_Annual_CTC= (salary+(salary*0.2))*12 where salary BETWEEN 2000  and 15000;
update employees SET Incremented_Annual_CTC = (salary+(salary*0.1))*12 where salary BETWEEN 16000 and 20000;
update employees SET Incremented_Annual_CTC= (salary+(salary*0.05))*12 where salary BETWEEN 21000 and 25000;
select * from employees;
-- task8
select * from employees where commission_pct is not null;
-- task9
select concat(first_name,'  ', last_name),commission_pct as Full_Name from employees where commission_pct is null;
-- task10
select employee_id,first_name,last_name,phone_number,email from employees where commission_pct is not null;
-- task11
select * from employees;
select * from employees where department_id= 10 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 20 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 30 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 50 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 60 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 80 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 90 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 100 order by incremented_annual_ctc desc limit 3;
select * from employees where department_id= 110 order by incremented_annual_ctc desc limit 3;
-- task 12
select department_id,max(Incremented_Annual_CTC) as 'HIGHEST CTC' from employees group by department_id order by Incremented_Annual_CTC desc limit 3;
-- task13
select * from employees where job_id like '%clerk%';
-- task14
select count(employee_id) as Clerk_Emp_Count,avg(salary) as Clerk_Avg_Salary from employees where job_id like '%clerk%';
-- task15
select count(employee_id), department_id from employees group by department_id;
-- task16
select department_id,avg(salary) from employees group by department_id; 
-- task17
select count(employee_id), department_id from employees where salary between 7000 and 10000 group by department_id;
-- task18
select employee_id,first_name,last_name,hire_date,(current_date()-hire_date)/365 as Experience_By_Today from employees group by employee_id;
