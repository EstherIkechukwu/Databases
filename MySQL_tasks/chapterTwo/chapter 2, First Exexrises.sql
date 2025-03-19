SELECT SKU, SKU_DESCRIPTION FROM INVENTORY;
SELECT SKU_Description, SKU FROM inventory;
SELECT WarehouseID FROM inventory;
SELECT distinct WarehouseID from inventory;
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder FROM INVENTORY;
SELECT * FROM inventory; 
SELECT * FROM inventory WHERE QuantityOnHand > 0;
SELECT SKU, SKU_Description, WarehouseID FROM inventory WHERE QuantityOnHand = 0 order by WarehouseID asc;
SELECT SKU, SKU_Description, WarehouseID FROM inventory WHERE QuantityOnHand > 0 order by WarehouseID desc, SKU asc;
SELECT SKU, SKU_Description, WarehouseID FROM inventory WHERE QuantityOnHand = 0 and QuantityOnOrder > 0 order by WarehouseID desc, SKU asc;
SELECT SKU, SKU_Description, WarehouseID FROM inventory WHERE QuantityOnHand = 0 and QuantityOnOrder = 0 order by WarehouseID desc, SKU asc;
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM inventory WHERE QuantityOnHand > 1 and QuantityOnHand < 10;
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM inventory WHERE QuantityOnHand between 2 and 9;
SELECT distinct SKU, SKU_Description FROM inventory WHERE SKU_Description LIKE 'Half-Dome%';
SELECT distinct SKU, SKU_Description FROM inventory WHERE SKU_Description LIKE '%Climb%';
SELECT distinct SKU, SKU_Description FROM inventory WHERE SKU_Description LIKE '__d%';
SELECT MIN(QuantityOnHand) as Min_Quantity, MAX(QuantityOnHand) as Max_Quantity, AVG(QuantityOnHand) as Avg_Quantity, SUM(QuantityOnHand) as Total_Quantity, COUNT(QuantityOnHand) as Count_Quantity FROM inventory;
SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHand FROM inventory group by WarehouseID order by TotalItemsOnHand desc;
SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHandLT3 FROM inventory WHERE QuantityOnHand < 3 group by WarehouseID order by TotalItemsOnHandLT3 desc;
SELECT WarehouseID, SUM(QuantityOnHand) as TotalItemsOnHandLT3 FROM inventory WHERE QuantityOnHand < 3 group by WarehouseID having COUNT(SKU) < 2 order by TotalItemsOnHandLT3 desc;


