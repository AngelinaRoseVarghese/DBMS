CREATE TABLE Items( itemid NUMBER PRIMARY KEY, itemname VARCHAR2(50),
 category VARCHAR2(50), price NUMBER,
 instock NUMBER CHECK (instock >= 0));
INSERT INTO Items VALUES (1,'Samsung GalaxyS26Ulta','Mobile',65000,13);
INSERT INTO Items VALUES (2,'Apple MacBook Laptop','Electronics',75000,5);
INSERT INTO Items VALUES (3,'Headphones','Accessories',3500,10);
INSERT INTO Items VALUES (4,'PS5','Mobile',50000,7);
INSERT INTO Items VALUES (5,'Speaker','Electronics',24000,4);
select * from Items;

CREATE TABLE Customers ( custid NUMBER PRIMARY KEY,custname VARCHAR2(53),address
VARCHAR2(110), state VARCHAR2(50));
INSERT INTO Customers VALUES (1,'Fatma','Erattupeta','Kerala');
INSERT INTO Customers VALUES (2,'Mickey','Rolla','Sharjah');
INSERT INTO Customers VALUES (3,'Gonca','Deira','Dubai');
INSERT INTO Customers VALUES (4,'Flavious','Al Baraha','Dubai');
INSERT INTO Customers VALUES (5,'Halime','kozhikode','kerala');
select * from Customers;

CREATE TABLE Orders (orderid NUMBER PRIMARY KEY, itemid NUMBER, custid NUMBER,quantity
NUMBER, orderdate DATE,
 FOREIGN KEY (itemid) REFERENCES Items(itemid),FOREIGN KEY (custid) REFERENCES
Customers(custid));
INSERT INTO Orders VALUES (1101,1,1,2,TO_DATE('21-11-2024','DD-MM-YYYY'));
INSERT INTO Orders VALUES (1102,2,2,1,TO_DATE('23-11-2026','DD-MM-YYYY'));
INSERT INTO Orders VALUES (1103,3,3,3,TO_DATE('31-03-2018','DD-MM-YYYY'));
INSERT INTO Orders VALUES (1104,4,4,1,TO_DATE('21-10-2022','DD-MM-YYYY'));
INSERT INTO Orders VALUES (1105,5,5,2,TO_DATE('31-01-2025','DD-MM-YYYY'));

select * from Orders;

CREATE TABLE Delivery( deliveryid NUMBER PRIMARY KEY,orderid NUMBER,custid NUMBER,FOREIGN KEY(orderid) REFERENCES Orders(orderid),FOREIGN KEY(custid) REFERENCES Customers(custid));

INSERT INTO Delivery VALUES (5001,1101,1);
INSERT INTO Delivery VALUES (5002,1102,2);
INSERT INTO Delivery VALUES (5003,1103,3);
SELECT * FROM Delivery;

SELECT DISTINCT c.*
FROM Customers c
JOIN Orders o ON c.custid = o.custid
JOIN Delivery d ON o.orderid = d.orderid;

SELECT DISTINCT c.*
FROM Customers c
JOIN Orders o ON c.custid = o.custid;

SELECT DISTINCT c.*
FROM Customers c
JOIN Orders o ON c.custid = o.custid
JOIN Delivery d ON o.orderid = d.orderid;

insert INTO Customers values(6,'Jerry','Pala','Kerala');
INSERT INTO Orders VALUES (1106,1,6,1,TO_DATE('9-9-2020','DD-MM-YYYY'));

SELECT o.orderdate FROM Orders o JOIN Customers c ON o.custid = c.custid WHERE c.custname LIKE 'J%';

SELECT i.itemname, i.price FROM Items i JOIN Orders o ON i.itemid = o.itemid JOIN Customers c ON o.custid = c.custid WHERE c.custname = 'Mickey';

SELECT DISTINCT c.* FROM Customers c JOIN Orders o ON c.custid = o.custid LEFT JOIN Delivery d ON o.orderid = d.orderid WHERE o.orderdate > TO_DATE('31-JAN-2013','DD-MON-YYYY') AND d.deliveryid IS NULL;

 
SELECT itemid FROM Orders UNION SELECT o.itemid FROM Orders o JOIN Delivery d ON o.orderid = d.orderid WHERE d.deliveryid IS NULL;

SELECT custname FROM Customers WHERE custid IN (  SELECT custid FROM Orders ) INTERSECT SELECT custname FROM Customers WHERE custid IN ( SELECT o.custid FROM Orders o JOIN Delivery d ON o.orderid = d.orderid);

SELECT custname FROM Customers WHERE custid IN (SELECT custid FROM Orders) MINUS SELECT custname FROM Customers WHERE custid IN ( SELECT o.custid FROM Orders o JOIN Delivery d ON o.orderid = d.orderid );

SELECT c.custname FROM Customers c JOIN Orders o ON c.custid = o.custid GROUP BY c.custname HAVING COUNT(o.orderid) = (SELECT MAX(cnt) FROM (SELECT COUNT(orderid) cnt FROM Orders GROUP BY custid));

SELECT DISTINCT c.*FROM Customers c JOIN Orders o ON c.custid=o.custid JOIN Items i ON o.itemid=i.itemid WHERE i.price>5000;

SELECT custname,address FROM Customers WHERE custid NOT IN (SELECT o.custid FROM Orders o JOIN Items I ON o.itemid=i.itemid WHERE i.itemname='Samsung GalaxyS26Ulta');

SELECT c.custname,o.orderid FROM Customers c LEFT JOIN Orders o ON c.custid=o.custid; SELECT c.custname,o.orderid FROM Customers c RIGHT JOIN Orders o ON c.custid=o.custid;

SELECT state,COUNT(*) AS TOTAL_CUSTOMERS FROM Customers GROUP BY state;

SELECT * FROM Items WHERE price>(SELECT AVG(price)FROM Items);
