CREATE DATABASE Service;
USE Service;
CREATE TABLE `Client` (
  `Client_ID` int PRIMARY KEY,
  `Name` varchar(255),
  `Address` varchar(255),
  `Email` varchar(255),
  `Phone_Number` varchar(255)
);

CREATE TABLE `Driver` (
  `Driver_ID` int PRIMARY KEY,
  `Name` varchar(255),
  `Email` varchar(255),
  `Phone_Number` varchar(255)
);

CREATE TABLE `Vehicle` (
  `Vehicle_ID` int PRIMARY KEY,
  `License_Plate` varchar(255),
  `Capacity` int
);

CREATE TABLE `Trip` (
  `Trip_ID` int PRIMARY KEY,
  `Start_Location` varchar(255),
  `End_Location` varchar(255),
  `Date` date,
  `Cost` float,
  `Client_ID` int,
  `Driver_ID` int,
  `Vehicle_ID` int
);

CREATE TABLE `Payment` (
  `Payment_ID` int PRIMARY KEY,
  `Amount` float,
  `Payment_Method` varchar(255),
  `Payment_Date` date,
  `Status` varchar(255),
  `Client_ID` int,
  `Trip_ID` int
);

CREATE TABLE `Ratings` (
  `Rating_ID` int PRIMARY KEY,
  `Rating_Value` int,
  `Comment` varchar(255),
  `Date` date,
  `Client_ID` int,
  `Driver_ID` int
);

ALTER TABLE `Client` ADD FOREIGN KEY (`Client_ID`) REFERENCES `Trip` (`Client_ID`);

ALTER TABLE `Driver` ADD FOREIGN KEY (`Driver_ID`) REFERENCES `Trip` (`Driver_ID`);

ALTER TABLE `Vehicle` ADD FOREIGN KEY (`Vehicle_ID`) REFERENCES `Trip` (`Vehicle_ID`);

ALTER TABLE `Client` ADD FOREIGN KEY (`Client_ID`) REFERENCES `Payment` (`Client_ID`);

ALTER TABLE `Trip` ADD FOREIGN KEY (`Trip_ID`) REFERENCES `Payment` (`Trip_ID`);

ALTER TABLE `Client` ADD FOREIGN KEY (`Client_ID`) REFERENCES `Ratings` (`Client_ID`);

ALTER TABLE `Driver` ADD FOREIGN KEY (`Driver_ID`) REFERENCES `Ratings` (`Driver_ID`);

INSERT INTO Client (Client_ID, Name, Address, Email, Phone_Number) VALUES 
	(1, 'Ahmed Ali', 'Cairo', 'ahmed1@gmail.com', '01000123456'),
	(2, 'Sara Mahmoud', 'Giza', 'sara2@gmail.com', '01011234567'),
	(3, 'Mohamed Adel', 'Alexandria', 'mohamed3@gmail.com', '01022345678'),
	(4, 'Heba Said', 'Mansoura', 'heba4@gmail.com', '01033456789'),
	(5, 'Khaled Amin', 'Tanta', 'khaled5@gmail.com', '01044567890'),
	(6, 'Laila Youssef', 'Asyut', 'laila6@gmail.com', '01055678901'),
	(7, 'Omar Hassan', 'Suez', 'omar7@gmail.com', '01066789012'),
	(8, 'Rana Ibrahim', 'Ismailia', 'rana8@gmail.com', '01077890123'),
	(9, 'Yasser Mostafa', 'Zagazig', 'yasser9@gmail.com', '01088901234'),
	(10, 'Nada Fathy', 'Fayoum', 'nada10@gmail.com', '01099012345');

	 
	INSERT INTO Driver (Driver_ID, Name, Email, Phone_Number) VALUES 
	(1, 'Hassan Saleh', 'hassan1@gmail.com', '01200123456'),
	(2, 'Mostafa Nabil', 'mostafa2@gmail.com', '01211234567'),
	(3, 'Ramy Kamel', 'ramy3@gmail.com', '01222345678'),
	(4, 'Mona Ayman', 'mona4@gmail.com', '01233456789'),
	(5, 'Youssef Tarek', 'youssef5@gmail.com', '01244567890'),
	(6, 'Kareem Salah', 'kareem6@gmail.com', '01255678901'),
	(7, 'Tamer Farid', 'tamer7@gmail.com', '01266789012'),
	(8, 'Aya Anwar', 'aya8@gmail.com', '01277890123'),
	(9, 'Fady Osama', 'fady9@gmail.com', '01288901234'),
	(10, 'Nour Hassan', 'nour10@gmail.com', '01299012345');

	 
	 INSERT INTO Vehicle (Vehicle_ID, License_Plate, Capacity) VALUES 
	(1, 'ABC-1234', 2),
	(2, 'DEF-5678', 4),
	(3, 'GHI-9101', 3),
	(4, 'JKL-1123', 5),
	(5, 'MNO-4567', 6),
	(6, 'PQR-8910', 3),
	(7, 'STU-1314', 4),
	(8, 'VWX-1516', 2),
	(9, 'YZA-1718', 5),
	(10, 'BCD-1920', 6);


	 INSERT INTO Trip (Trip_ID, Start_Location, End_Location, Date, Cost, Client_ID, Driver_ID, Vehicle_ID) VALUES 
	(1, 'Cairo', 'Giza', '2024-11-01', 150.00, 1, 1, 1),
	(2, 'Alexandria', 'Cairo', '2024-11-02', 300.00, 2, 2, 2),
	(3, 'Mansoura', 'Tanta', '2024-11-03', 100.00, 3, 3, 3);

	 
	INSERT INTO Payment (Payment_ID, Amount, Payment_Method, Payment_Date, Status, Client_ID, Trip_ID) VALUES 
	(1, 150.00, 'Credit Card', '2024-11-01', 'Paid', 1, 1),
	(2, 300.00, 'Cash', '2024-11-02', 'Pending', 2, 2),
	(3, 100.00, 'Bank Transfer', '2024-11-03', 'Paid', 3, 3);


	INSERT INTO Ratings (Rating_ID, Rating_Value, Comment, Date, Client_ID, Driver_ID) VALUES 
	(1, 5, 'Excellent service', '2024-11-01', 1, 1),
	(2, 4, 'Very good', '2024-11-02', 2, 2),
	(3, 3, 'Average', '2024-11-03', 3, 3);


	SELECT * FROM Client WHERE Name LIKE '%Ahmed%';
	SELECT Client_ID, SUM(Amount) AS Total_Paid FROM Payment GROUP BY Client_ID;
	SELECT * FROM Trip ORDER BY Cost ASC;
	SELECT Name, Address FROM Client ;
    SELECT Trip.Trip_ID,
    Client.Name AS Client_Name,
    Driver.Name AS Driver_Name,
    Vehicle.License_Plate,
    Trip.Start_Location,
    Trip.End_Location,
    Trip.Date,
    Trip.Cost
FROM Trip
JOIN Client ON Trip.Client_ID = Client.Client_ID
JOIN Driver ON Trip.Driver_ID = Driver.Driver_ID
JOIN Vehicle ON Trip.Vehicle_ID = Vehicle.Vehicle_ID;


