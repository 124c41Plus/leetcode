/*
The Employee table holds all employees. Every employee has an Id, a salary, and there is also a column for the department Id.

+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
The Department table holds all departments of the company.

+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
Write a SQL query to find employees who have the highest salary in each of the departments. For the above tables, your SQL query should return the following rows (order of rows does not matter).

+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+

Explanation:

Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
*/
IF NOT EXISTS(SELECT sys.tables.name from sys.tables where sys.tables.name = 'Employee')
CREATE TABLE Employee (Id int, Name varchar(30), Salary int, DepartmentId int)
CREATE TABLE Department (Id int, Name varchar(30))

Insert into Employee (id, name, salary, departmentid) values ('1', 'Joe', '70000', '1')
Insert into Employee (id, name, salary, departmentid) values ('2', 'Jim', '90000', '1')
Insert into Employee (id, name, salary, departmentid) values ('3', 'Henry', '80000', '2')
Insert into Employee (id, name, salary, departmentid) values ('4', 'Sam', '60000', '2')
Insert into Employee (id, name, salary, departmentid) values ('5', 'Max', '90000', '1')
Insert into Department(id, name) values ('1', 'IT')
Insert into Department(id, name) values ('2', 'Sales')

Select department.Name [Department], 
	   t.Name [Employee], t.Salary  from department
left join (
Select *, RANK() OVER(partition by employee.departmentid order by salary desc) as rn FROM Employee
) as t on department.id = t.DepartmentId
WHERE RN = '1'



SELECT d.Name AS Department, 
       t.Name AS Employee,  
       t.Salary
FROM Department d
JOIN (SELECT *, 
      RANK() OVER(PARTITION BY DepartmentId ORDER BY Salary DESC) AS sal_rank 
      FROM Employee) t
ON d.Id = t.DepartmentId
WHERE t.sal_rank = 1 


DROP TABLE Employee
DROP TABLE Department
