/*Write a SQL query to find all duplicate emails in a table named Person.

+----+---------+
| Id | Email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+
For example, your query should return the following for the above table:

+---------+
| Email   |
+---------+
| a@b.com |
+---------+
*/

IF EXISTS (SELECT sys.tables.name FROM sys.tables where sys.tables.name = 'Person')
DROP TABLE Person
CREATE TABLE Person (Id int, Email varchar(50))
INSERT INTO Person (Id, Email) VALUES ('1', 'a@b.com')
INSERT INTO Person (Id, Email) VALUES ('2', 'c@b.com')
INSERT INTO Person (Id, Email) VALUES ('3', 'a@b.com')

SELECT Email FROM Person
GROUP BY Email
HAVING Count(Email) > 1