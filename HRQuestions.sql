USE HR

--SQL HR EXERCISES

--1
SELECT e.first_name , e.last_name , e.department_id , d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id


--2
SELECT e.first_name,e.last_name, 
d.department_name, l.city, l.state_province
FROM employees e 
JOIN departments d  
ON e.department_id = d.department_id  
JOIN locations l
ON d.location_id = l.location_id


--3
SELECT e.first_name , e.last_name ,e.salary ,j_g.grade_level
FROM employees e
JOIN job_grades j_g
ON e.salary BETWEEN j_g.lowest_sal AND j_g.highest_sal


--4
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE d.department_id IN (40,80)


--5
SELECT e.first_name, e.last_name, d.department_name ,l.city, l.state_province
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
JOIN locations l 
ON d.location_id=l.location_id
WHERE e.first_name LIKE '%z%'


--6
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id=e.department_id


--7
SELECT e.first_name, e.last_name, e.salary
FROM employees e
WHERE e.salary < (SELECT salary 
                  FROM employees
				  WHERE employee_id=182)



--8
--employee can be manager so i will check  id employeeId=managerId and i must use alias in select because i will selcet data from the same column.
SELECT e.first_name "EMPLOYEE FIRST NAME", m.first_name "MANAGER NAME"
FROM employees e
JOIN employees m
ON e.manager_id=m.employee_id



--9
SELECT d.department_name ,l.city ,l.state_province 
FROM departments d
JOIN locations l
ON d.location_id=l.location_id


--10
SELECT e.first_name, e.last_name, d.department_id, d.department_name
FROM departments d
RIGHT JOIN employees e
ON d.department_id=e.department_id



--11
SELECT e.first_name "EMPLOYEE FIRST NAME", m.first_name "MANAGER"
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id


--12
SELECT e.first_name , e.last_name ,e.department_id
FROM employees e
WHERE e.department_id IN (SELECT e.department_id 
                       FROM employees e 
					   WHERE e.last_name='Taylor')



--13
--we can see from the data that no one strated at the 1993-01-01 and ended bofore or at 1997-08-31
SELECT j.job_title , d.department_name , e.first_name + ' ' + e.last_name 'employee name' ,jh.start_date
FROM job_history jh
JOIN jobs j
ON jh.job_id=j.job_id
JOIN departments d
ON d.department_id=jh.department_id
JOIN employees e
ON jh.employee_id=e.employee_id
WHERE jh.start_date='1993-01-01' AND jh.end_date<='1997-08-31' 



--14
SELECT j.job_title, e.first_name +' '+ e.last_name 'employee full name', j.max_salary-e.salary 'difference'
FROM employees e
JOIN jobs j
ON e.job_id=j.job_id


--15
--all the commission-pct in the data are 0.
SELECT d.department_name, AVG(e.salary) 'salary average', SUM(e.commission_pct) 'number of employees receiving commissions'
FROM employees e
JOIN departments d
ON e.department_id=d.department_id
GROUP BY department_name




