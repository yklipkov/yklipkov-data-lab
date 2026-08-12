--Завдання 1.3.
SELECT COUNT(*) as employees_total from employees; 
--Завдання 2.1.
select first_name, last_name from employees  where manager_id = 101 order by employee_id; 
--Завдання 2.2.
select first_name, last_name, salary from employees  where salary < 4000 order by salary; 
--Завдання 2.3.
select employee_id, first_name, last_name, hire_date from employees where extract(year from hire_date) = 1996 order by hire_date; 
--Завдання 2.4.
select employee_id, first_name, last_name, email from employees where email like '%example.com' order by email; 
--Завдання 2.5.
select employee_id, first_name, last_name, department_id from employees where department_id in (20,30) order by department_id, employee_id; 
--Завдання 2.6.
select employee_id, first_name from employees where LOWER(first_name) LIKE '%a' order by first_name; 
--Завдання 2.7.
select employee_id, first_name, last_name, salary, commission_pct from employees where salary > 6000 and commission_pct = 0.15 order by salary desc; 
--Завдання 2.8.
select employee_id, first_name, last_name, phone_number from employees where phone_number like '515%' order by phone_number; 
--Завдання 2.9.
select employee_id, first_name, last_name, salary  from employees where department_id =20 order by salary desc; 
--Завдання 2.10.
select employee_id, first_name, last_name, hire_date from employees order by hire_date, employee_id LIMIT 7; 
--Завдання 2.11.
select employee_id, first_name, last_name, salary from employees where salary > 4000 ORDER by employee_id limit 5; 
--Завдання 2.12.
select employee_id, first_name, last_name, CAST(round(salary,0) AS TEXT) || ' EUR' AS salary_eur from employees order by employee_id; 
--Завдання 2.13.
select employee_id, first_name, last_name from employees where manager_id = 101 order by last_name; 
--Завдання 2.14.
select employee_id, first_name, last_name, salary from employees order by salary desc offset 3 limit 10; 
--Завдання 2.15.
select employee_id, first_name, last_name, hire_date from employees where hire_date > '2000-01-01' order by hire_date desc; 
--Завдання 3.1.
select ROUND(AVG(salary), 2) as avg_salary from employees where job_id LIKE 'S%'; 
--Завдання 3.2.
select department_id, min(salary) as min_salary, max (salary) as max_salary from employees group by department_id order by department_id; 
--Завдання 3.3.
select count(*) as employees_count from employees where salary > 3000; 
--Завдання 3.4.
select department_id, sum(salary) as total_salary from employees group by department_id  having sum(salary) > 10000 order by total_salary desc; 
--Завдання 3.5.
select employee_id, first_name, last_name, COALESCE(commission_pct, 0) as commission from employees order by employee_id; 
--Завдання 3.6.
select employee_id, last_name, salary + salary * COALESCE(commission_pct, 0) as total_income from employees where salary + salary * COALESCE(commission_pct, 0) > 5000 order by total_income desc; 
--Завдання 4.1.
select a.first_name, a.last_name, b.job_title from employees as a inner join jobs as b on a.job_id = b.job_id order by last_name; 
--Завдання 4.2.
select first_name, last_name, salary, job_title from employees as a inner join jobs as b on a.job_id = b.job_id where salary > 5000 order by salary desc; 
--Завдання 4.3.
select first_name, last_name, department_name  from employees as a  left join departments as d on a.department_id = d.department_id order by last_name;  
--Завдання 4.4.
select department_name , first_name, last_name from employees as a  right join departments as d on a.department_id = d.department_id order by department_name; 
--Завдання 4.5.
select first_name, last_name, department_name  from employees as a full outer join departments as d on a.department_id = d.department_id order by department_name, last_name; 
--Завдання 4.6.
select first_name, last_name, job_title, department_name from employees as a join jobs as b on a.job_id = b.job_id left join departments as d on a.department_id = d.department_id order by department_name, last_name; 
--Завдання 4.7.
select department_name, count (employee_id) as employees_count from departments as d left join employees as a on a.department_id = d.department_id group by department_name order by employees_count desc; 
--Завдання 4.8.
select department_name, count (employee_id) as employees_count from departments as d left join employees as a on a.department_id = d.department_id group by department_name having count (employee_id) >3 order by employees_count desc; 
--Завдання 4.9.
select department_name, country_name from departments as d join locations as l on d.location_id = l.location_id join countries as c on c.country_id = l.country_id order by country_name, department_name;   
--Завдання 4.10.
select first_name, last_name, department_name from employees as a  left join departments as d on a.department_id = d.department_id join locations as l on d.location_id = l.location_id join countries as c on c.country_id = l.country_id join regions as r on r.region_id = c.region_id where r.region_name = 'Europe' order by last_name;    
--Завдання 5.1.
select employee_id, first_name, last_name, salary from employees where salary > (select AVG(salary) from employees) order by salary desc;  
--Завдання 5.2.
select department_id, department_name from departments where department_id in (select department_id from employees group by department_id having sum(salary) > 100000) order by department_id; 
--Завдання 5.3.
select employee_id, first_name, last_name from employees where department_id in (select department_id from departments where location_id in (select location_id from locations where city like ('S%') )) ORDER by employee_id; 
--Завдання 5.4.
select a.employee_id, a.last_name, a.salary, a.job_id from employees as a where salary > (select max_salary from jobs as j where j.job_id = a.job_id) order by salary desc; 
--Завдання 5.5.
select department_id, department_name from departments where department_id not in (select department_id from employees where department_id is not null) order by department_id; 
--Завдання 5.6.
select department_id, count(*) as employees_count from employees where department_id in (select department_id from employees group by department_id having avg(salary) > 15000) group by department_id order by department_id;
