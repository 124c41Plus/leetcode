/*
Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
*/

IF EXISTS (SELECT sys.tables.name FROM sys.tables WHERE sys.tables.name = 'Logs')
DROP TABLE Logs
CREATE TABLE Logs (Id int, Num int)
INSERT INTO Logs (Id, Num) VALUES ('1', '1')
INSERT INTO Logs (Id, Num) VALUES ('2', '1')
INSERT INTO Logs (Id, Num) VALUES ('3', '1')
INSERT INTO Logs (Id, Num) VALUES ('4', '2')
INSERT INTO Logs (Id, Num) VALUES ('5', '1')
INSERT INTO Logs (Id, Num) VALUES ('6', '2')
INSERT INTO Logs (Id, Num) VALUES ('7', '2')

SELECT DISTINCT num as ConsecutiveNums
FROM
(
SELECT num,LEAD(num) OVER(ORDER BY id) AS lead, LAG(num) OVER (ORDER BY id) AS lag
FROM Logs
)t
WHERE num=lead and num=lag;