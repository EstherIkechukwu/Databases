-- 2.40
SELECT I.SKU, I.SKU_Description,      
W.WarehouseID, W.WarehouseCity, W.WarehouseState 
FROM INVENTORY I JOIN WAREHOUSE W 
ON I.WarehouseID = W.WarehouseID 
WHERE W.WarehouseCity = 'Atlanta'      
OR W.WarehouseCity = 'Bangor'      
OR W.WarehouseCity = 'Chicago';

-- 2.41
SELECT I.SKU, I.SKU_Description, W.WarehouseID, 
W.WarehouseCity, W.WarehouseState
FROM inventory I JOIN warehouse W
ON I.WarehouseID = W.WarehouseID 
WHERE W.WarehouseCity IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.42
SELECT I.SKU, I.SKU_Description, W.WarehouseID, 
W.WarehouseCity, W.WarehouseState
FROM inventory I JOIN warehouse W
ON I.WarehouseID = W.WarehouseID 
WHERE W.WarehouseCity <> 'Atlanta'      
OR W.WarehouseCity <> 'Bangor'      
OR W.WarehouseCity <> 'Chicago';

-- 2.43
SELECT I.SKU, I.SKU_Description, W.WarehouseID, 
W.WarehouseCity, W.WarehouseState
FROM inventory I JOIN warehouse W
ON I.WarehouseID = W.WarehouseID 
WHERE W.WarehouseCity NOT IN ('Atlanta', 'Bangor', 'Chicago');

-- 2.44
SELECT CONCAT(SKU_Description, ' is located in ', WarehouseCity) as ItemLocation
FROM Inventory I JOIN Warehouse W
ON I.WarehouseID = W.WarehouseID;

-- 2.45
SELECT I.SKU, I.SKU_Description, I.WarehouseId 
FROM INVENTORY I 
where I.warehouseId in ( SELECT WarehouseId 
FROM Warehouse W
WHERE Manager = 'Lucille Smith'); 

-- 2.46
SELECT I.SKU, I.SKU_Description, W.WarehouseID 
FROM inventory I JOIN warehouse W
on I.WarehouseID = W.WarehouseID 
where Manager = 'Lucille Smith';

-- 2.47
SELECT I.SKU, I.SKU_Description, I.WarehouseID
FROM Inventory I
JOIN Warehouse W
ON I.WarehouseID = W.WarehouseID
WHERE W.Manager = 'Lucille Smith';

-- 2.48
SELECT WarehouseID, AVG(QuantityOnHand) as AverageQuantityOnHand
FROM Inventory I
WHERE WarehouseID IN (
    SELECT W.WarehouseID
    FROM Warehouse W
    WHERE W.Manager = 'Lucille Smith'
)
GROUP BY WarehouseID;

-- 2.49
SELECT I.WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM Inventory I, Warehouse W
WHERE I.WarehouseID = W.WarehouseID
  AND W.Manager = 'Lucille Smith'
GROUP BY I.WarehouseID;

-- 2.50
SELECT I.WarehouseID, AVG(QuantityOnHand) AS AverageQuantityOnHand
FROM Inventory I
JOIN Warehouse W
ON I.WarehouseID = W.WarehouseID
WHERE W.Manager = 'Lucille Smith'
GROUP BY I.WarehouseID;


 






