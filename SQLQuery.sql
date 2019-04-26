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


/*Return to check this query*/
/*SELECT Sailing.sailingID + ' ' + Sailing.leavingTime + ' ' + Sailing.returnTime as 'Overlap Sailing'
FROM Transport JOIN (SELECT Sailing.returnTime FROM Sailing JOIN SailTo ON Sailing.sailingID = SailTo.sailingID WHERE DATEDIFF(YEAR, Sailing.returnTime, GETDATE())>= 2 
						AND Sailing.leavingTime <= Sailing.returnTime AND Sailing.returnTime >= Sailing.leavingTime AND SailTo.countryName = SailTo.countryName AND SailTo.portName
						= SailTo.portName))
GROUP BY Sailing.leavingTime*/


SELECT SailTo.countryName + ' ' + SailTo.portName AS 'Destination', COUNT(CruiseOrder.personID) AS numOfOrders
FROM CruiseOrder JOIN Sailing ON CruiseOrder.cruiseID = Sailing.sailingID JOIN SailTo ON Sailing.sailingID = SailTo.sailingID
WHERE YEAR(Sailing.returnTime) BETWEEN 2015 AND 2019
GROUP BY SailTo.countryName, SailTo.portName
ORDER BY Sailing.returnTime DESC, numOfOrders DESC


SELECT S.cruiseID, COUNT(Room.roomType) AS numOfEmptySuits
FROM Room LEFT JOIN CruiseOrder ON Room.cruiseShipID = CruiseOrder.cruiseShipID JOIN 
(SELECT Cruise.cruiseID FROM Cruise JOIN Sailing ON Cruise.cruiseID = Sailing.sailingID
WHERE Sailing.leavingTime < GETDATE()) S ON CruiseOrder.cruiseID = S.cruiseID 
WHERE Room.roomType = 'Suite' AND CruiseOrder.roomNumber = NULL