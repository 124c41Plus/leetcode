/*
Suppose that a website contains two tables, the Customers table and the Orders table.
Write a SQL query to find all customers who never order anything.

Table: Customers.

+----+-------+
| Id | Name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+
Table: Orders.

+----+------------+
| Id | CustomerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+
Using the above tables as example, return the following:

+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

*/

If Not Exists(Select * from sys.tables where sys.tables.name = 'Customers')
Truncate table Customers
Create Table Customer (Id int, Name varchar(255))
insert into Customer (Id, Name) values ('1', 'Joe')
insert into Customer (Id, Name) values('2', 'Henry')
insert into Customer (Id, Name) values('3', 'Sam')
insert into Customer (Id, Name) values('4', 'Max')

If Not Exists( select * from sys.tables where sys.tables.name = 'Orders')
Truncate table Orders
Create Table Orders (Id int, CustomerId int)
insert into  Orders (Id, CustomerId) values ('1', '3')
insert into  orders (Id, CustomerId) values ('2', '1')

Select Name [Customers] from Customer
LEFT JOIN Orders on Customer.Id = Orders.CustomerId
WHERE Orders.CustomerId is null


