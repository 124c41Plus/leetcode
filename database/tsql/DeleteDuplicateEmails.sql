/*
Write a SQL query to delete all duplicate email entries in a table named Person, keeping only unique emails based on its smallest Id.

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Id is the primary key column for this table.
For example, after running your query, the above Person table should have the following rows:

+----+------------------+
| Id | Email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Note:

Your output is the whole Person table after executing your sql. Use delete statement.
*/

IF NOT EXISTS(SELECT * from sys.tables where sys.tables.name = 'Person')
CREATE TABLE Person (Id int, Email varchar(255))
TRUNCATE TABLE Person
insert into Person (Id, Email) values ('1', 'john@example.com')
insert into Person (Id, Email) values ('2', 'bob@example.com')
insert into Person (Id, Email) values ('3', 'john@example.com')
insert into Person (Id, Email) values ('5', 'john@example.com')

--Solution using row_numver Over Partition in TSQL, but the only option to solve this is in MySQL
DELETE from Person WHERE Id in
(Select id from (SELECT p1.id, row_number() OVER (Partition by p1.Email Order by p1.Id)[rn] FROM Person p1) del Where rn > 1)

SELECT Id, Email from Person
