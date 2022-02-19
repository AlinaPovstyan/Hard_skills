-------HW_3------

select * from employees;
select * from salary_1;
select * from employee_salary;
select * from roles_1;
select * from roles_emloyee;


-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.

select employee_name, monthly_salary from employee_salary
join employees on employees.id = employee_id
join salary_1 on salary_1.id = salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.

select employee_name, monthly_salary from employee_salary
join employees on employees.id = employee_id
join salary_1 on salary_1.id = salary_id
where monthly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select employee_name, monthly_salary from employee_salary
left join employees on employees.id = employee_id
right join salary_1 on salary_1.id = salary_id
where employee_name is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)

select  employee_name, monthly_salary from employee_salary
left join employees on employees.id = employee_id
right join salary_1 on salary_1.id = salary_id
where employee_name is null and monthly_salary < 2000;

---второй вариант

select  employee_name, monthly_salary from employee_salary
left join employees on employees.id = employee_id
left join salary_1 on salary_1.id = salary_id
where monthly_salary < 2000;


-- 5. Найти всех работников кому не начислена ЗП.

select employee_name, monthly_salary from employee_salary
right join employees on employees.id = employee_id
left join salary_1 on salary_1.id = salary_id
where monthly_salary is null;


-- 6. Вывести всех работников с названиями их должности.

select employee_name, role_name from roles_employee
join employees on employees.id = employee_id
join roles_1 on roles_1.id = role_id;

-- 7. Вывести имена и должность только Java разработчиков.

select employee_name, role_name from roles_employee
join employees on employees.id = employee_id
join roles_1 on roles_1.id = role_id
where role_name like '%Java d%';

-- 8. Вывести имена и должность только Python разработчиков.

select employee_name, role_name from roles_employee
join employees on employees.id = employee_id
join roles_1 on roles_1.id = role_id
where role_name like '%Python dev%';

-- 9. Вывести имена и должность всех QA инженеров.

select employee_name, role_name from roles_employee
join employees on employees.id = employee_id
join roles_1 on roles_1.id = role_id
where role_name like '%QA%';

-- 10. Вывести имена и должность ручных QA инженеров.

select employee_name, role_name from roles_employee
join employees on employees.id = employee_id
join roles_1 on roles_1.id = role_id
where role_name like '%Manual QA%';

-- 11. Вывести имена и должность автоматизаторов QA

select employee_name, role_name from roles_employee
join employees on employees.id = employee_id
join roles_1 on roles_1.id = role_id
where role_name like '%Auto%QA%';

-- 12. Вывести имена и зарплаты Junior специалистов

select employee_name, monthly_salary, role_name from employee_salary
 join employees on employees.id = employee_salary.employee_id 
 join salary_1 on salary_1.id = salary_id
 join roles_employee on roles_employee.role_id = employees.id
 join roles_1 on roles_1.id = roles_employee.role_id 
where role_name like '%Junior%';


-- 13. Вывести имена и зарплаты Middle специалистов

select employee_name, monthly_salary, role_name from employee_salary
 join employees on employees.id = employee_salary.employee_id 
 join salary_1 on salary_1.id = salary_id
 join roles_employee on roles_employee.role_id = employee_salary.employee_id 
 join roles_1 on roles_1.id = roles_employee.role_id 
where role_name like '%Middle%'

-- 14. Вывести имена и зарплаты Senior специалистов

select employee_name, monthly_salary, role_name from employee_salary
join employees on employees.id = employee_salary.employee_id 
join salary_1 on salary_1.id = employee_salary.salary_id 
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
 
select role_name, monthly_salary from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Java dev%';

-- 16. Вывести зарплаты Python разработчиков

select role_name, monthly_salary from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Python dev%';


-- 17. Вывести имена и зарплаты Junior Python разработчиков

select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков

select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Middle%J%S%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков

select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Senior Java dev%';

-- 20. Вывести зарплаты Junior QA инженеров

select role_name, monthly_salary from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Junior%eng%';

-- 21. Вывести среднюю зарплату всех Junior специалистов

select avg(monthly_salary) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков

select sum(monthly_salary) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%J%S%';

-- 23. Вывести минимальную ЗП QA инженеров

select min(monthly_salary) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%QA%';

-- 24. Вывести максимальную ЗП QA инженеров

select max(monthly_salary) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%QA%';

-- 25. Вывести количество QA инженеров

select count(role_name) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%QA%';

----2 вариант

select count(role_name) from roles_employee
join roles_1 on roles_1.id  = roles_employee.role_id 
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.

select count(role_name) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%Middle%';

--- 2 вариант

select count(role_name) from roles_employee
join roles_1 on roles_1.id  = roles_employee.role_id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков

select count(role_name) from roles_employee
join roles_1 on roles_1.id  = roles_employee.role_id 
where role_name like '%dev%';

--- 2 вариант 

select count(role_name) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%dev%';


-- 28. Вывести фонд (сумму) зарплаты разработчиков.

select sum(monthly_salary) from employee_salary
join roles_employee on roles_employee.role_id = employee_salary.employee_id 
join roles_1 on roles_1.id = roles_employee.role_id 
join salary_1 on salary_1.id = employee_salary.salary_id
where role_name like '%dev%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию

select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
order by monthly_salary asc;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300


select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;


-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300

select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
where monthly_salary < 2300 
order by monthly_salary asc;


-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 
---1100, 1500, 2000

select employee_name,role_name, monthly_salary from employee_salary 
join employees on employees.id = employee_salary.employee_id
join roles_1 on roles_1.id = employee_salary.employee_id
join salary_1 on salary_1.id = employee_salary.salary_id
where monthly_salary in(1100,1500,2000)
order by monthly_salary asc;
