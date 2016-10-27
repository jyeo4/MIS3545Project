USE Electechdb;

/* 1. Multiple SELECT * queries to display all the records from each table. */

SELECT * FROM dbo.Category; 

SELECT * FROM dbo.Customer;

SELECT * FROM dbo.OrderDetail;

SELECT * FROM dbo.Product;

SELECT * FROM dbo.Purchase;

SELECT * FROM dbo.Supplier;

/* 2. A query that uses an aggregate function. We want to find the total revenue for each product*/

SELECT p.Name, SUM(o.LineTotal) AS Total_Revenue
FROM dbo.OrderDetail AS o
JOIN dbo.Product AS p ON o.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY SUM(o.LineTotal) DESC;

/* 3. A query that selects records from two tables using INNER JOIN. We want to see which product is in which category and the description */

SELECT p.Name as Product_Name, c.CategoryName, c.Description
FROM dbo.Product AS p
INNER JOIN dbo.Category AS c ON p.CategoryID = c.CategoryID
ORDER BY c.CategoryName;

/* 4. LEFT OUTER JOIN query. We have a company without a contact person, so the fields ContactName and Contact Number are blank.
We used left outer join to see which products have a supplier but not a contact person within the company.*/

SELECT s.CompanyName, s.ContactName, s.ContactNumber, p.Name AS ProductName
FROM dbo.Supplier AS s
LEFT OUTER JOIN dbo.Product AS p ON s.SupplierID = p.SupplierID
ORDER BY p.Name;

/* 5. Subquery We want to find which products to focus our business on. 
So we found the sales of products that sold 1 quantity but has a line total greater than the average unit price($703).
This tells us that there are 7 products that has a price greater than $703 */


SELECT p.Name, o.LineTotal
FROM dbo.Product as p
JOIN dbo.OrderDetail as o ON p.ProductID = o.ProductID
WHERE o.quantity = 1 and o.LineTotal >
	(SELECT AVG(o.UnitPrice)
	FROM dbo.OrderDetail as o
	WHERE o.quantity = 1)
ORDER BY o.LineTotal DESC;

