-- Driver with the highest revenue in Lagos
SELECT R.RiderID, R.Name, SUM(P.Amount) AS TotalRevenue 
FROM Riders R 
JOIN Payments P;


-- Find rides where the fare is more than 50% higher or lower than the average fare
SELECT r.RideID, r.Fare, avgFare.AvgFare AS 'Average Fare'
FROM Rides r
CROSS JOIN (SELECT AVG(Fare) AS AvgFare FROM Rides) avgFare
WHERE r.Fare > (avgFare.AvgFare * 1.5)
OR r.Fare < (avgFare.AvgFare * 0.5);


-- Find riders in Lagos who rated their drivers less than 3 on average
SELECT r.RiderID, r.Name, AVG(ri.Rating) AS 'Average Rating'
FROM Riders r
JOIN Rides ri ON r.RiderID = ri.RiderID
GROUP BY r.RiderID, r.Name
HAVING AVG(ri.Rating) < 3;

-- Find the top 5 Lagos neighborhoods with the highest average fare
SELECT r.City AS Area, ROUND(AVG(ri.Fare), 2) AS 'Average Fare'
FROM Riders r
JOIN Rides ri ON r.RiderID = ri.RiderID
GROUP BY r.City
ORDER BY 'Average Fare' DESC
LIMIT 5;

-- Drivers in Lagos who have not received any rides in the last 30 days
SELECT d.DriverID, d.Name
FROM Drivers d
LEFT JOIN Rides r ON d.DriverID = r.DriverID
WHERE r.RideID IS NULL;