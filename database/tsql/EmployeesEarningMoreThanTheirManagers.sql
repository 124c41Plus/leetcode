/*
The Employee table holds all employees including their managers.
Every employee has an Id, and there is also a column for the manager Id.

+----+-------+--------+-----------+
| Id | Name  | Salary | ManagerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | NULL      |
| 4  | Max   | 90000  | NULL      |
+----+-------+--------+-----------+
Given the Employee table, write a SQL query that finds out employees who earn more than their managers.
For the above table, Joe is the only employee who earns more than his manager.

+----------+
| Employee |
+----------+
| Joe      |
+----------+
*/

IF (EXISTS ((SELECT sys.tables.name FROM sys.tables WHERE sys.tables.name = 'Employee')))
BEGIN
	DROP TABLE Employee
	CREATE TABLE Employee(Id int, Name varchar(255), Salary int, ManagerId int)
END

INSERT INTO Employee (Id, Name, Salary, ManagerId) values ('1', 'Joe', '70000', '3')
INSERT INTO Employee (Id, Name, Salary, ManagerId) values ('2', 'Henry', '80000', '4')
INSERT INTO Employee (Id, Name, Salary, ManagerId) values ('3', 'Sam', '60000', NULL)
INSERT INTO Employee (Id, Name, Salary, ManagerId) values ('4', 'Max', '90000', NULL)

SELECT Employee.Name [Employee] FROM Employee
LEFT JOIN Employee AS Managers ON Employee.ManagerId = Managers.Id
WHERE Managers.Id IS NOT NULL
AND Employee.Salary > Managers.Salary