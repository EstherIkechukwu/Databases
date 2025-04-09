SHOW tables;

-- A
SELECT * FROM customer;
SELECT * FROM invoice;
SELECT * FROM invoice_item;

-- B
SELECT LastName, FirstName, Phone 
FROM customer;

-- C
SELECT  LastName, FirstName, Phone 
FROM customer 
where FirstName = "Nikki";

-- D
SELECT 
    c.LastName, 
    c.FirstName, 
    c.Phone, 
    i.DateIn, 
    i.DateOut 
FROM Customer c 
INNER JOIN invoice i 
ON c.CustomerID = i.CustomerID 
WHERE i.TotalAmount > 100.00;
    
-- E
SELECT LastName, FirstName, Phone 
FROM customer 
where FirstName 
LIKE 'B%';

-- F
SELECT LastName, FirstName, Phone
FROM Customer
WHERE LastName 
LIKE '%cat%';

-- G
SELECT LastName, FirstName, Phone 
FROM customer 
where Phone
like '_23%';

-- H
SELECT MAX(TotalAmount) AS MaxAmount,
MIN(TotalAmount) AS MinAmount 
FROM invoice;

-- I
SELECT avg(totalAmount) as AvgAmount
from invoice;

-- J
SELECT count(*) as CustomersNumber 
from CUSTOMER;

-- K
SELECT LastName, FirstName, 
COUNT(*) as CustomerCount
FROM Customer
GROUP BY LastName, FirstName;

-- L
SELECT LastName, FirstName, 
COUNT(*) as CustomerCount
FROM Customer
GROUP BY LastName, FirstName;

-- M
SELECT LastName, FirstName, Phone
FROM Customer
WHERE CustomerID IN (
    SELECT CustomerID
    FROM invoice
    WHERE TotalAmount > 100.00
)
ORDER BY LastName asc, FirstName desc;

-- N
SELECT DISTINCT c.LastName, c.FirstName, c.Phone
FROM Customer c, invoice i
WHERE c.CustomerID = i.CustomerID
  AND i.TotalAmount > 100.00
ORDER BY c.LastName asc, c.FirstName desc;

-- O
SELECT DISTINCT c.LastName, c.FirstName, c.Phone
FROM Customer c
INNER JOIN invoice i ON c.CustomerID = i.CustomerID
WHERE i.TotalAmount > 100.00
ORDER BY c.LastName asc, c.FirstName desc;

-- P
SELECT LastName, FirstName, Phone 
FROM CUSTOMER I
WHERE CustomerID IN (
    SELECT i.CustomerID 
    FROM INVOICE_ITEM I 
    WHERE I.Item = 'Dress Shirt'
)
ORDER BY LastName ASC, FirstName DESC;

-- Q
SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C, INVOICE I, INVOICE_ITEM II 
WHERE C.CustomerID = I.CustomerID AND I.InvoiceNumber = II.InvoiceNumber AND II.Item = 'Dress Shirt' 
ORDER BY C.LastName ASC, C.FirstName DESC;

-- R
SELECT C.LastName AS CustomerLastName, C.FirstName AS CustomerFirstName, 
       R.LastName AS ReferredByLastName, R.FirstName AS ReferredByFirstName 
FROM CUSTOMER C 
LEFT JOIN CUSTOMER R ON C.ReferredBy = R.CustomerID;

-- S
SELECT C.LastName, C.FirstName, C.Phone 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.InvoiceNumber IN (
    SELECT InvoiceNumber 
    FROM INVOICE_ITEM 
    WHERE Item = 'Dress Shirt'
)
ORDER BY C.LastName ASC, C.FirstName DESC;

-- T
SELECT C.LastName, C.FirstName, C.Phone, I.TotalAmount 
FROM CUSTOMER C 
JOIN INVOICE I ON C.CustomerID = I.CustomerID 
WHERE I.InvoiceNumber IN (
    SELECT InvoiceNumber 
    FROM INVOICE_ITEM 
    WHERE Item = 'Dress Shirt'
)
UNION 
SELECT C.LastName, C.FirstName, C.Phone, NULL AS TotalAmount 
FROM CUSTOMER C 
WHERE C.CustomerID NOT IN (
    SELECT CustomerID 
    FROM INVOICE I 
    JOIN INVOICE_ITEM II ON I.InvoiceNumber = II.InvoiceNumber 
    WHERE II.Item = 'Dress Shirt'
)
ORDER BY TotalAmount ASC, LastName ASC, FirstName DESC;





