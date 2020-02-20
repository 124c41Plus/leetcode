/*
Write a SQL query to rank scores. If there is a tie between two scores, 
both should have the same ranking. Note that after a tie, the next ranking
number should be the next consecutive integer value. In other words,
there should be no "holes" between ranks.

+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
For example, given the above Scores table, your query should generate the following
report (order by highest score):

+-------+------+
| Score | Rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+
*/

IF EXISTS (SELECT sys.tables.name FROM sys.tables WHERE sys.tables.name = 'Scores')
DROP TABLE Scores
CREATE TABLE Scores (Id int, Score Decimal (3,2))
INSERT INTO Scores (Id, Score) VALUES ('1', '3.5')
INSERT INTO Scores (Id, Score) VALUES ('2', '3.65')
INSERT INTO Scores (Id, Score) VALUES ('3', '4.0')
INSERT INTO Scores (Id, Score) VALUES ('4', '3.85')
INSERT INTO Scores (Id, Score) VALUES ('5', '4.0')
INSERT INTO Scores (Id, Score) VALUES ('6', '3.65')

SELECT Scores.Score, DENSE_RANK() Over(order by score desc) from Scores