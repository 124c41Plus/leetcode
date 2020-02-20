/*
Write a SQL query to get the nth highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the nth highest salary where n = 2 is 200. If there is no nth highest salary, then the query should return null.

+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+

*/

Create Function getNthHighestSalary(@N int) RETURNS int AS
BEGIN
	RETURN(
	SELECT COALESCE(Salary, NULL) AS Salary From employee
	ORDER BY Salary DESC
	OFFSET @N -1 ROWS
	FETCH NEXT 1 ROWS ONLY
	);
	END

	GO


IF NOT EXISTS(SELECT sys.tables.name from sys.tables WHERE sys.tables.name = 'Employee')
CREATE TABLE Employee (Id int, Salary int)
TRUNCATE TABLE Employee
Insert into Employee (Id, Salary) values ('1','100')
Insert into Employee (Id, Salary) values ('2','200')
Insert into Employee (Id, Salary) values ('3','300')


SELECT dbo.getNthHighestSalary(1)[Salary];
DROP TABLE Employee
DROP FUNCTION getNthHighestSalary;