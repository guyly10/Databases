INSERT INTO CargoShip (cargoShipID, shipName, manufacturingDate, maxCapacity, maxVolume) VALUES (1, 'Maid Of The Mist', '19001012', 100, 200)
INSERT INTO CargoShip (cargoShipID, shipName, manufacturingDate, maxCapacity, maxVolume) VALUES (2, 'USS Arizona','19401201', 200, 300)
INSERT INTO CargoShip (cargoShipID, shipName, manufacturingDate, maxCapacity, maxVolume) VALUES (3, 'Kursk', '19700503', 300, 400)
INSERT INTO CargoShip (cargoShipID, shipName, manufacturingDate, maxCapacity, maxVolume) VALUES (4, 'Ahi Eilat', '19900908', 400, 500)
INSERT INTO CargoShip (cargoShipID, shipName, manufacturingDate, maxCapacity, maxVolume) VALUES (5, 'Oceana', '20000209', 500, 600)
INSERT INTO CargoShip (cargoShipID, shipName, manufacturingDate, maxCapacity, maxVolume) VALUES (6, 'Oceana', '20000209', 500, 600)
INSERT INTO Company(companyID, companyName, phone) VALUES (10, 'Deliveries LTD', '0546361098')
INSERT INTO Company(companyID, companyName, phone) VALUES (20, 'Best Way', '0546361099')
INSERT INTO Company(companyID, companyName, phone) VALUES (30, 'Ship USA', '0546361100')
INSERT INTO Company(companyID, companyName, phone) VALUES (40, 'Africa Lines', '0546361101')
INSERT INTO Company(companyID, companyName, phone) VALUES (50, 'MSC', '0546361102')
INSERT INTO Country(countryName) VALUES ('Israel')
INSERT INTO Country(countryName) VALUES ('Bulgaria')
INSERT INTO Country(countryName) VALUES ('USA')
INSERT INTO Country(countryName) VALUES ('Greece')
INSERT INTO Country(countryName) VALUES ('Cyprus')
INSERT INTO CruiseShip(cruiseShipID, shipName, manufacturingDate, maxCapacity, maxNumberOfPeople) VALUES (100, 'Queen Marry', '20090406', 100, 500)
INSERT INTO CruiseShip(cruiseShipID, shipName, manufacturingDate, maxCapacity, maxNumberOfPeople) VALUES (200, 'Fun', '20100704', 300, 400)
INSERT INTO CruiseShip(cruiseShipID, shipName, manufacturingDate, maxCapacity, maxNumberOfPeople) VALUES (300, 'Ocean Splitter', '20121005', 20, 145)
INSERT INTO CruiseShip(cruiseShipID, shipName, manufacturingDate, maxCapacity, maxNumberOfPeople) VALUES (400, 'Med Club', '19750201', 20, 15)
INSERT INTO CruiseShip(cruiseShipID, shipName, manufacturingDate, maxCapacity, maxNumberOfPeople) VALUES (500, 'Watermelon', '20170506', 500, 900)
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (110, convert(datetime,'18-06-12 10:34:09 PM',5), convert(datetime,'18-09-12 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (210, convert(datetime,'25-07-15 10:34:09 PM',5), convert(datetime,'14-08-15 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (310, convert(datetime,'01-05-14 10:34:09 PM',5), convert(datetime,'12-06-14 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (410, convert(datetime,'12-12-13 10:34:09 PM',5), convert(datetime,'18-12-13 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (510, convert(datetime,'04-03-17 10:34:09 PM',5), convert(datetime,'18-06-17 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (610, convert(datetime,'06-08-18 10:34:09 PM',5), convert(datetime,'06-10-18 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (710, convert(datetime,'23-01-17 10:34:09 PM',5), convert(datetime,'23-05-17 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (810, convert(datetime,'14-09-17 10:34:09 PM',5), convert(datetime,'14-12-17 10:34:09 PM',5))
INSERT INTO Sailing(sailingID, leavingTime, returnTime) VALUES (910, convert(datetime,'17-11-17 10:34:09 PM',5), convert(datetime,'17-12-17 10:34:09 PM',5))
INSERT INTO Cruise(cruiseID, cruiseShipID) VALUES (110, 100)
INSERT INTO Cruise(cruiseID, cruiseShipID) VALUES (210, 200)
INSERT INTO Cruise(cruiseID, cruiseShipID) VALUES (310, 300)
INSERT INTO Cruise(cruiseID, cruiseShipID) VALUES (410, 400)
INSERT INTO Cruise(cruiseID, cruiseShipID) VALUES (510, 500)
INSERT INTO Person(personID, firstName, surName, dateOfBirth, phone, email) VALUES (203371701, 'Moti', 'Kakun', '19911224', '0541214741', 'gkjylr@gmail.com')
INSERT INTO Person(personID, firstName, surName, dateOfBirth, phone, email) VALUES (203371702, 'Kobi', 'Refua', '19930117', '0541214752', 'sadgf@gmail.com')
INSERT INTO Person(personID, firstName, surName, dateOfBirth, phone, email) VALUES (203371704, 'Nir', 'Gelad', '19900218', '0541214763', 'wer@gmail.com')
INSERT INTO Person(personID, firstName, surName, dateOfBirth, phone, email) VALUES (203371705, 'Avri', 'Thenoise', '19890815', '0541214774', 'werasd@gmail.com')
INSERT INTO Person(personID, firstName, surName, dateOfBirth, phone, email) VALUES (203371706, 'Oshrat', 'kotler', '19740427', '0541214785','uqwetru@gmail.com')
INSERT INTO Room(cruiseShipID, roomNumber, bedsAmount, roomType, price) VALUES (100, 123, 2, 'Standard', 700)
INSERT INTO Room(cruiseShipID, roomNumber, bedsAmount, roomType, price) VALUES (200, 124, 3, 'Suite', 100)
INSERT INTO Room(cruiseShipID, roomNumber, bedsAmount, roomType, price) VALUES (300, 125, 4, 'Standard', 500)
INSERT INTO Room(cruiseShipID, roomNumber, bedsAmount, roomType, price) VALUES (400, 126, 2, 'Standard', 600)
INSERT INTO Room(cruiseShipID, roomNumber, bedsAmount, roomType, price) VALUES (500, 127, 3, 'Suite', 70)
INSERT INTO Employee(employeeID, startWorkDate) VALUES ('203371701', '19991224')
INSERT INTO Employee(employeeID, startWorkDate) VALUES ('203371704', '19960218')
INSERT INTO Employee(employeeID, startWorkDate) VALUES ('203371706', '19780427')
INSERT INTO jobInSailing(sailingID, employeeID, jobTitle) VALUES (110, '203371701', 'chef')
INSERT INTO jobInSailing(sailingID, employeeID, jobTitle) VALUES (210, '203371704', 'cleaner')
INSERT INTO Port(countryName, portName) VALUES ('Israel', 'Haifa')
INSERT INTO Port(countryName, portName) VALUES ('Bulgaria', 'Varna')
INSERT INTO Port(countryName, portName) VALUES ('USA', 'NY')
INSERT INTO Port(countryName, portName) VALUES ('Greece', 'Khalkidiki')
INSERT INTO Port(countryName, portName) VALUES ('Cyprus', 'Larnaca')
INSERT INTO SailTo(countryName, portName, sailingID, arrivalTime, leavingTime) VALUES ('Israel', 'Haifa', 110, '20120619', '20120620')
INSERT INTO SailTo(countryName, portName, sailingID, arrivalTime, leavingTime) VALUES ('Bulgaria', 'Varna', 210, '20150726', '20150727')
INSERT INTO SailTo(countryName, portName, sailingID, arrivalTime, leavingTime) VALUES ('Greece', 'Khalkidiki', 110, '20120621', '20120622')
INSERT INTO SeaTransport(seaTransportID) VALUES (610)
INSERT INTO SeaTransport(seaTransportID) VALUES (710)
INSERT INTO SeaTransport(seaTransportID) VALUES (810)
INSERT INTO SeaTransport(seaTransportID) VALUES (910)
INSERT INTO Transport(companyID, seaTransportID, cargoShipID, weightGoods, volumeGoods, goodsType) VALUES (10, 610, 1, 20, 50, 'Fruits')
INSERT INTO Transport(companyID, seaTransportID, cargoShipID, weightGoods, volumeGoods, goodsType) VALUES (20, 710, 2, 47, 123, 'Fruits')
INSERT INTO Transport(companyID, seaTransportID, cargoShipID, weightGoods, volumeGoods, goodsType) VALUES (30, 810, 3, 897, 123, 'Fruits')
INSERT INTO Transport(companyID, seaTransportID, cargoShipID, weightGoods, volumeGoods, goodsType) VALUES (40, 910, 4, 85, 95, 'Fruits')