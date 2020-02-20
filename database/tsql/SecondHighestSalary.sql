/*Write a SQL query to get the second highest salary from the Employee table.

+----+--------+
| Id | Salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
For example, given the above Employee table, the query should return 200 
as the second highest salary. If there is no second highest salary, 
then the query should return null.

+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+

*/
IF EXISTS(SELECT sys.tables.name FROM sys.tables where sys.tables.name = 'Employee')
DROP TABLE Employee
CREATE TABLE Employee (Id int, Salary int)
INSERT INTO Employee (Id, Salary) values ('1', '100')
INSERT INTO Employee (Id, Salary) values ('2', '200')
INSERT INTO Employee (Id, Salary) values ('3', '300')

SELECT max(t2.HighestSalary) AS SecondHighestSalary
FROM
(SELECT CASE WHEN sal_rank=2 THEN Salary ELSE null END AS HighestSalary
FROM (SELECT Salary,RANK() OVER (ORDER BY Salary DESC) AS sal_rank FROM Employee) AS t
) AS t2;