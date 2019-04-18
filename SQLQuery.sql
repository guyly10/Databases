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