--Team Name: Electech, Team Members: Jason Lee, Jake Yeo

Create Database Electechdb;

Use Electechdb;

--Create the supplier, product, category, orderdetail, purchase, customer tables
Create Table Supplier(
SupplierID bigint NOT NULL PRIMARY KEY,
CompanyName varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
City varchar(50) NOT NULL,
State varchar(50) NOT NULL,
Zipcode bigint NOT NULL,
Country varchar(50) NOT NULL,
ContactName varchar(50) NULL,
ContactNumber varchar(50) NULL);

Create Table Product(
ProductID bigint NOT NULL PRIMARY KEY,
Name varchar(50) NOT NULL,
ProductNumber bigint NOT NULL,
CategoryID bigint NOT NULL,
Price float NOT NULL,
SupplierID bigint NOT NULL);

Create Table Category(
CategoryID bigint NOT NULL PRIMARY KEY,
CategoryName varchar(50) NOT NULL,
Description varchar(50) NOT NULL);

Create Table OrderDetail(
OrderDetailID bigint NOT NULL PRIMARY KEY,
PurchaseID bigint NOT NULL,
ProductID bigint NOT NULL,
Quantity bigint NOT NULL,
UnitPrice float NOT NULL,
LineTotal float NOT NULL);

Create Table Purchase(
PurchaseID bigint NOT NULL PRIMARY KEY,
CustomerID bigint NOT NULL,
DateOrdered date NOT NULL,
Time time(7) NOT NULL);

Create Table Customer(
CustomerID bigint NOT NULL PRIMARY KEY,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Address varchar(50) NOT NULL,
Email varchar(50) NOT NULL,
PhoneNumber varchar(50) NOT NULL);

--Create the relationship: the first FK in Product
Alter Table Product add Constraint FK_CategoryID
Foreign Key (CategoryID) References Category(CategoryID);
Alter Table Product add Constraint FK_SupplierID
Foreign Key (SupplierID) References Supplier(SupplierID);

--Create the relationsihp: the first FK in OrderDetail
Alter Table OrderDetail add Constraint FK_PurchaseID
Foreign Key (PurchaseID) References Purchase(PurchaseID);
Alter Table OrderDetail add Constraint FK_ProductID
Foreign Key (ProductID) References Product(ProductID);

--Create the relationship: the first FK in Purchase
Alter Table Purchase add Constraint FK_CustomerID
Foreign Key (CustomerID) References Customer(CustomerID);

--Add Suppliers
Insert INTO Supplier (SupplierID, CompanyName, Address, City, State, Zipcode, Country, ContactName, ContactNumber) Values
(1, 'Samsang', '1970 Napa Ct', 'Bothell', 'AZ', '98011', 'US', 'Steven Smith', '9013435324'),
(2, 'LZ', '793 Crawford Street', 'Kenmore', 'CT', '98028', 'US', 'Alan Choi', '6453749082'),
(3, 'Boce', '2601 Cambridge Drive', 'Snohomish', 'MA', '02457', 'US', 'Jake Sander', '9018186410'),
(4, 'Lenobo', '1356 Grove Way', 'Monroe', 'CA', '34029', 'US', 'Chris Li', '6469037253'),
(5, 'Abble', '390 Ridgewood Ct', 'Carnation', 'NY', '10003', 'US', 'Joon Hughes', '9016453218'),
(6, 'Panaxonik', '5802 Ampersand Drive', 'Seattle', 'FL', '84039', 'US', 'Jay Shim', '8917653421'),
(7, 'Microhard', '9825 Coralie Drive', 'Edmonds', 'MA', '23467', 'US', 'Shawn Steers', '9017640394'),
(8, 'Indel', '3708 Montana', 'Bellevue', 'CO', '06776', 'US', 'Jason Amoako', '6463520193'),
(9, 'Tell', '3514 Sunshine', 'Index', 'MT', '24314', 'US', 'David Wang', '7450928172'),
(10, 'Doshiba', '3770 Viewpoint Ct', 'Renton', 'OK', '09889', 'US', 'Wayne Kwon', '9017564432');

--Delete ContactName and Contact Number
UPDATE Supplier SET Supplier.ContactName = NULL WHERE ContactName LIKE 'Wayne Kwon';
UPDATE Supplier SET ContactNumber = NULL WHERE ContactNumber LIKE '9017564432';

--Add Category
Insert INTO Category(CategoryID, CategoryName, Description) Values
(1, 'Cellphone', 'Mobile Phone'),
(2, 'Laptop', 'Notebook Computer'),
(3, 'Tablet', 'Portable Computer'),
(4, 'Accessory', 'Accessories for electronic devices');

--Add Product
Insert INTO Product (ProductID, Name, ProductNumber, CategoryID, Price, SupplierID) Values
(1, 'Yphone4', '104', '1', '789.99', '5'),
(2, 'Yphone5', '105', '1', '889.99', '5'),
(3, 'Yphone6', '106', '1', '989.99', '5'),
(4, 'Yphone7', '107', '1', '1089.99', '5'),
(5, 'Kalaxy4', '111', '1', '699.99', '1'),
(6, 'Kalaxy5', '112', '1', '799.99', '1'),
(7, 'Kalaxy6', '113', '1', '899.99', '1'),
(8, 'NetBookPro1', '121', '2', '1399.99', '4'),
(9, 'NetBookPro2', '122', '2', '1499.99', '4'),
(10, 'NetBookPro3', '123', '2', '1379.99', '4'),
(11, 'NetBookPro4', '124', '2', '1599.99', '4'),
(12, 'LZBook1', '131', '2', '1299.99', '2'),
(13, 'LZBook2', '132', '2', '1199.99', '2'),
(14, 'LZBook3', '133', '2', '1399.99', '2'),
(15, 'BoceLite1', '141', '2', '999.99', '3'),
(16, 'BoceLite2', '142', '2', '1099.99', '3'),
(17, 'BoceLite3', '143', '2', '1199.99', '3'),
(18, 'Panabook1', '151', '2', '1259.99', '6'),
(19, 'Panabook2', '152', '2', '1359.99', '6'),
(20, 'MicroLite1', '161', '3', '799.99', '7'),
(21, 'MicroLite2', '162', '3', '899.99', '7'),
(22, 'MicroLite3', '163', '3', '999.99', '7'),
(23, 'MicroLite4', '164', '3', '1099.99', '7'),
(24, 'Delbook1', '171', '3', '599.99', '8'),
(25, 'Delbook2', '172', '3', '699.99', '8'),
(26, 'Delbook3', '173', '3', '799.99', '8'),
(27, 'Delbook4', '174', '3', '899.99', '8'),
(28, 'TellPad1', '181', '3', '999.99', '9'),
(29, 'TellPad2', '182', '3', '979.99', '9'),
(30, 'TellPad3', '183', '3', '1099.99', '9'),
(31, 'TellPad4', '184', '3', '1199.99', '9'),
(32, 'DoshCase1', '191', '4', '59.99', '10'),
(33, 'DoshCase2', '192', '4', '59.99', '10'),
(34, 'DoshCase3', '193', '4', '69.99', '10'),
(35, 'DoshCase4', '194', '4', '59.99', '10'),
(36, 'DoshCase5', '195', '4', '59.99', '10'),
(37, 'DoshCase6', '196', '4', '49.99', '10'),
(38, 'DoshCase7', '197', '4', '59.99', '10'),
(39, 'DoshCase8', '198', '4', '59.99', '10'),
(40, 'DoshCase9', '199', '4', '79.99', '10'),
(41, 'DoshCase10', '200', '4', '89.99', '10');

--Add Customer
Insert INTO Customer(CustomerID, FirstName, LastName, Address, Email, PhoneNumber) Values
(1, 'Jason', 'Howard', '32 East 87th Street', 'ehoward@gamil.com', '9087463521'),
(2, 'Jenny', 'Healey', '8671 Westwood Lane', 'jhealey@gmail.com', '6467563892'),
(3, 'Eric', 'Fernandez', 'Chabbell Park', 'efernandez@gmail.com', '9178987653'),
(4, 'David', 'Kim', '254a Baker Street', 'dkim2@gmail.com', '9870493421'),
(5, 'Nancy', 'Lang', '2511 Baker Road', 'nlang@yahoo.com', '9098864544'),
(6, 'Ryan', 'Chung', 'Suite 800 2530 Slater Street', 'rchung2@gmail.com', '6463720662'),
(7, 'Eric', 'Choi', '2573 Dufferin Street', 'echoi@gmail.com', '2314536672'),
(8, 'Jay', 'Shim', '2520 Flanders Road', 'jshim@gmail.com', '9018762331'),
(9, 'Nico', 'Paik', '2509 W. Frankford', 'npaik@babson.edu', '6465760992'),
(10, 'Brian', 'Bizalion', '70 N.W. Plaza', 'bbizalion@gwu.edu', '9018921332');

--Add Purchase
Insert INTO Purchase(PurchaseID, CustomerID, DateOrdered, Time) Values
(200, 1, 'October 23, 2016', '10:30'),
(201, 2, 'July 12, 2016', '11:30'),
(202, 3, 'September 25, 2016', '19:30'),
(203, 4, 'February 4, 2016', '15:25'),
(204, 5, 'March 5, 2016', '16:27'),
(205, 6, 'July 7, 2016', '11:11'),
(206, 7, 'May 15, 2016', '12:30'),
(207, 8, 'January 24, 2016', '14:25'),
(208, 9, 'April 25, 2016', '19:13'),
(209, 10, 'June 6, 2016', '20:01');

--Add OrderDetail
Insert INTO OrderDetail(OrderDetailID, PurchaseID, ProductID, Quantity, UnitPrice, LineTotal) Values
(1, 200, 1, 1, '789.99', '789.99'),
(2, 200, 26, 1, '799.99', '799.99'),
(3, 201, 39, 3, '89.99', '269.97'),
(4, 202, 27, 2, '899.99', '1799.98'),
(5, 202, 37, 1, '59.99', '59.99'),
(6, 203, 4, 1, '1089.99', '1089.99'),
(7, 203, 34, 2, '59.99', '119.98'),
(8, 204, 30, 3, '1099.99', '3299.97'),
(9, 204, 37, 1, '59.99', '59.99'),
(10, 204, 38, 1, '79.99', '79.99'),
(11, 205, 20, 1, '799.99', '799.99'),
(12, 205, 32, 1, '59.99', '59.99'),
(13, 206, 11, 1, '1599.99', '1599.99'),
(14, 206, 33, 3, '59.99', '179.97'),
(15, 207, 39, 10, '89.99', '899.90'),
(16, 208, 12, 1, '1299.99', '1299.99'),
(17, 208, 32, 3, '69.99', '209.97'),
(18, 209, 37, 4, '59.99', '239.96'),
(19, 209, 15, 2, '999.99', '1999.98'),
(20, 209, 23, 1, '1099.99', '1099.99');

