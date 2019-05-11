SELECT CruiseShip.cruiseShipID, CruiseShip.shipName, Cruise.cruiseID
FROM CruiseShip JOIN Cruise ON CruiseShip.cruiseShipID = Cruise.cruiseShipID JOIN SailTo ON Cruise.cruiseID = SailTo.sailingID
WHERE SailTo.countryName = 'Cyprus' AND YEAR(SailTo.arrivalTime) = '2018'


SELECT Person.personID, Person.firstName, Person.surName, Person.dateOfBirth, Person.email, Person.phone
FROM Person JOIN Employee ON Person.personID != Employee.employeeID JOIN CruiseOrder ON CruiseOrder.personID = Employee.employeeID 
JOIN Sailing ON CruiseOrder.cruiseID = Sailing.sailingID
WHERE MONTH(Sailing.leavingTime) = 'January' AND YEAR(Sailing.leavingTime) = '2019'


SELECT Company.companyID, Company.companyName, Company.phone
FROM Company JOIN Transport ON Company.companyID = Transport.companyID JOIN Sailing ON Transport.seaTransportID = Sailing.sailingID
WHERE (Transport.goodsType = 'Container' OR Transport.goodsType = 'Hazard') AND DATEDIFF(D, Sailing.leavingTime, GETDATE()) < 7
UNION
SELECT Company.companyID, Company.companyName, Company.phone
FROM Company JOIN Transport ON Company.companyID = Transport.companyID JOIN CargoShip ON Transport.cargoShipID = CargoShip.cargoShipID
WHERE Transport.weightGoods + Transport.volumeGoods = CargoShip.maxCapacity + CargoShip.maxVolume


SELECT TOP 20 Person.firstName + ' ' + Person.surName AS 'FullName', Employee.employeeID
FROM Person JOIN Employee on Person.personID = Employee.employeeID JOIN jobInSailing ON Employee.employeeID = jobInSailing.employeeID 
JOIN Sailing ON jobInSailing.sailingID = Sailing.sailingID
WHERE DATEDIFF(YEAR, Employee.startWorkDate, GETDATE()) >= 5 AND YEAR(Sailing.leavingTime) = '2018' AND YEAR(Sailing.returnTime) = '2018'
ORDER BY COUNT(jobInSailing.sailingID)


/*We assume that the minimum time to stop a ship from goint out to a sail is 5 minutes*/
SELECT Transport.seaTransportID, Sailing.leavingTime, Transport.cargoShipID
FROM CargoShip JOIN Transport ON CargoShip.cargoShipID = Transport.cargoShipID JOIN Sailing ON Transport.seaTransportID = Sailing.sailingID
WHERE DATEDIFF(MINUTE, Sailing.leavingTime, GETDATE()) > 5 AND Transport.weightGoods > CargoShip.maxCapacity AND Transport.volumeGoods > CargoShip.maxVolume
ORDER BY Sailing.leavingTime DESC


SELECT Q1.sailingID, CONCAT(Q1.leavingTime,' - ',Q1.returnTime) AS dateRange1, Q2.sailingID, CONCAT(Q2.leavingTime,' - ',Q2.returnTime) AS dateRange2
FROM	
		(SELECT S.sailingID, S.leavingTime, S.returnTime, SAT.countryName, SAT.portName
		FROM Sailing S INNER JOIN SeaTransport ST ON s.sailingID = ST.seaTransportID INNER JOIN SailTo SAT 
		ON SAT.sailingID = S.sailingID) Q1 
INNER JOIN  
		(SELECT S.sailingID, S.leavingTime, S.returnTime, SAT.countryName, SAT.portName
		FROM Sailing S INNER JOIN SeaTransport ST ON s.sailingID = ST.seaTransportID INNER JOIN SailTo SAT 
		ON SAT.sailingID = S.sailingID) Q2 ON Q1.sailingID < Q2.sailingID
WHERE DATEDIFF(DAY, Q1.leavingTime, GETDATE()) <= 365*2 AND Q1.leavingTime <= Q2.returnTime AND Q2.leavingTime <= Q1.returnTime
AND Q1.countryName = Q2.countryName AND Q1.portName = Q2.portName


SELECT YEAR(S.leavingTime) AS Year, ST.countryName, ST.portName, COUNT(CO.personID) AS NumOfOrders
FROM Sailing S INNER JOIN CruiseOrder CO ON S.sailingID = CO.cruiseID INNER JOIN SailTo ST ON S.sailingID = ST.sailingID
WHERE YEAR(s.leavingTime) BETWEEN 2010 AND 2019
GROUP BY ST.countryName, ST.portName, YEAR(S.leavingTime)
ORDER BY YEAR(S.leavingTime) DESC, NumOfOrders DESC


SELECT S.cruiseID, COUNT(Room.roomType) AS numOfEmptySuites
FROM Room LEFT JOIN CruiseOrder ON Room.cruiseShipID = CruiseOrder.cruiseShipID JOIN 
(SELECT Cruise.cruiseID FROM Cruise JOIN Sailing ON Cruise.cruiseID = Sailing.sailingID
WHERE Sailing.leavingTime < GETDATE()) S ON CruiseOrder.cruiseID = S.cruiseID 
WHERE Room.roomType = 'Suite' AND CruiseOrder.roomNumber = NULL