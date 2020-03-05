/*
X city built a new stadium, each day many people visit it and the stats are saved as these columns: id, visit_date, people

Please write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).

For example, the table stadium:
+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 1    | 2017-01-01 | 10        |
| 2    | 2017-01-02 | 109       |
| 3    | 2017-01-03 | 150       |
| 4    | 2017-01-04 | 99        |
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
For the sample data above, the output is:

+------+------------+-----------+
| id   | visit_date | people    |
+------+------------+-----------+
| 5    | 2017-01-05 | 145       |
| 6    | 2017-01-06 | 1455      |
| 7    | 2017-01-07 | 199       |
| 8    | 2017-01-08 | 188       |
+------+------------+-----------+
Note:
Each day only have one row record, and the dates are increasing with id increasing.
*/

Create table If Not Exists stadium (id int, visit_date DATE NULL, people int);
Truncate table stadium;
insert into stadium (id, visit_date, people) values ('1', '2017-01-01', '10');
insert into stadium (id, visit_date, people) values ('2', '2017-01-02', '109');
insert into stadium (id, visit_date, people) values ('3', '2017-01-03', '150');
insert into stadium (id, visit_date, people) values ('4', '2017-01-04', '99');
insert into stadium (id, visit_date, people) values ('5', '2017-01-05', '145');
insert into stadium (id, visit_date, people) values ('6', '2017-01-06', '1455');
insert into stadium (id, visit_date, people) values ('7', '2017-01-07', '199');
insert into stadium (id, visit_date, people) values ('8', '2017-01-08', '188');

select distinct a.id, a.visit_date, a.people from stadium as a
left join stadium as b on a.id = b.id -1
left join stadium as c on a.id = c.id -2
left join stadium as d on a.id = d.id +1
left join stadium as e on a.id = e.id +2
WHERE a.people >= 100
AND ((b.people >= 100 and c.people >= 100)
OR (b.people >= 100 and d.people >= 100)
OR (e.people >= 100 and d.people >= 100))
ORDER BY a.id
