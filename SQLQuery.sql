SELECT CruiseShip.cruiseShipID, CruiseShip.shipName, Cruise.cruiseID
FROM CruiseShip JOIN Cruise ON CruiseShip.cruiseShipID = Cruise.cruiseShipID JOIN SailTo ON Cruise.cruiseID = SailTo.sailingID
WHERE SailTo.countryName = 'Cyprus' AND YEAR(SailTo.arrivalTime) = '2018'