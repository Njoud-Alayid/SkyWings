CREATE DATABASE skyWing;
USE skyWing;

CREATE TABLE Admin (
	AdminID varchar(10) PRIMARY KEY,
    A_SSN varchar(10) NOT NULL,
    A_FName varchar(20) NOT NULL,
    A_LName varchar(20) NOT NULL,
    A_Bdate date NOT NULL,
    A_Gender varchar(1) NOT NULL,
    Salary int NOT NULL,
    A_Email varchar(100) NOT NULL,
    A_Password varchar(15) NOT NULL,
    A_Phone varchar(10) NOT NULL
);

ALTER TABLE Admin
ADD CHECK (A_Gender IN ('F' , 'M'));

CREATE TABLE Passenger (
    P_SSN varchar(10) PRIMARY KEY,
    P_FName varchar(20) NOT NULL,
    P_LName varchar(20) NOT NULL,
    P_Bdate date NOT NULL,
    P_Gender varchar(1) NOT NULL,
    P_Email varchar(100) NOT NULL,
    P_Password varchar(15) NOT NULL,
    P_Phone varchar(10) NOT NULL
);

ALTER TABLE Passenger
ADD CHECK (P_Gender IN ('F' , 'M'));

CREATE TABLE Airport (
	AirportID varchar(3) PRIMARY KEY,
    AirportName varchar(255) NOT NULL,
    Location varchar(20) NOT NULL
);

CREATE TABLE Airplane (
	AirplaneID varchar(5) PRIMARY KEY,
    Capacity int NOT NULL
);

CREATE TABLE Flight (
	FlightNo varchar(3) PRIMARY KEY,
    FlightType varchar(20) NOT NULL,
	DepartTime time NOT NULL,
    ArrivalTime time NOT NULL,
    DepartCity varchar(15) NOT NULL,
    ArrivalCity varchar(15) NOT NULL,
    DepartAirport varchar(3) NOT NULL,
    ArrivalAirport varchar(3) NOT NULL,
    AirplaneID varchar(5) NOT NULL,
    Gate varchar(2) NOT NULL,
    F_Date date NOT NULL,
    
    FOREIGN KEY (DepartAirport) REFERENCES Airport (AirportID),
    FOREIGN KEY (ArrivalAirport) REFERENCES Airport (AirportID),
    FOREIGN KEY (AirplaneID) REFERENCES Airplane (AirplaneID)
);

ALTER TABLE Flight
ADD CHECK (FlightType IN ("Oneway" , "Round"));


CREATE TABLE Reservation (
	ReservationCode varchar(6) PRIMARY KEY,
    FlightNo varchar(3) NOT NULL,
    SeatNo varchar(2) NOT NULL,
    Passneger_SSN varchar(10) NOT NULL,
    TotalPrice int NOT NULL,
    
    FOREIGN KEY (FlightNo) REFERENCES Flight (FlightNo)
    ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (Passneger_SSN) REFERENCES Passenger (P_SSN)
);

#drop database skyWing;

#filling admin
INSERT INTO `skyWing`.`Admin` (`AdminID`, `A_SSN`, `A_FName`, `A_LName`, `A_Bdate`, `A_Gender`, `Salary`, `A_Email`, `A_Password`, `A_Phone`) VALUES ('2220004241', '1131111111', 'Layan', 'Suliman', '2003-01-01', 'F', '30000', '2220004241@skywing.sa', 'Layan2003', '0502230978');
INSERT INTO `skyWing`.`Admin` (`AdminID`, `A_SSN`, `A_FName`, `A_LName`, `A_Bdate`, `A_Gender`, `Salary`, `A_Email`, `A_Password`, `A_Phone`) VALUES ('2220003159', '1132222222', 'Njoud', 'Fareed', '2003-02-02', 'F', '30000', '2220003159@skywing.sa', 'Njoud2003', '0532947679');
INSERT INTO `skyWing`.`Admin` (`AdminID`, `A_SSN`, `A_FName`, `A_LName`, `A_Bdate`, `A_Gender`, `Salary`, `A_Email`, `A_Password`, `A_Phone`) VALUES ('2220003042', '1133333333', 'Remaz', 'Khalid', '2003-03-03', 'f', '30000', '2220003042@skywing.sa', 'Remaz2003', '0565765909');
INSERT INTO `skyWing`.`Admin` (`AdminID`, `A_SSN`, `A_FName`, `A_LName`, `A_Bdate`, `A_Gender`, `Salary`, `A_Email`, `A_Password`, `A_Phone`) VALUES ('2220006035', '1134444444', 'Sara', 'Waleed', '2003-04-04', 'f', '30000', '2220006035@skywing.sa', 'Sara@2003', '0551730519');
INSERT INTO `skyWing`.`Admin` (`AdminID`, `A_SSN`, `A_FName`, `A_LName`, `A_Bdate`, `A_Gender`, `Salary`, `A_Email`, `A_Password`, `A_Phone`) VALUES ('2220007144', '1135555555', 'Shaden', 'Mishal', '2003-05-05', 'F', '30000', '2220007144@skywing.sa', 'Shaden2003', '0546402688');
INSERT INTO `skyWing`.`Admin` (`AdminID`, `A_SSN`, `A_FName`, `A_LName`, `A_Bdate`, `A_Gender`, `Salary`, `A_Email`, `A_Password`, `A_Phone`) VALUES ('2220006151', '1136666666', 'Zahra', 'Yahya', '2003-06-06', 'F', '30000', '2220006151@skywing.sa', 'Zahra2003', '0583184420');

#filling Passenger
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('1234567890', 'Asma', 'Ali', '1990-05-15', 'F', 'Asma@gmail.com', 'Asma1234', '0534567890');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('2345678901', 'Maha', 'Khalid', '1985-09-23', 'F', 'MahaKH@gmail.com', 'Maha1234', '0545678901');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('3456789012', 'Leen', 'Fahad', '1978-11-07', 'F', 'Leennn@gmail.com', 'Leen1234', '0556789012');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('4567890123', 'Khalid', 'Saad', '2002-03-29', 'M', 'Khalid_SAl@gmail.com', 'KhalidS123', '0567890123');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('5678901234', 'Reem,', 'Turki', '1999-08-12', 'F', 'Reem@hotmail.com', 'Reem1234', '0578901234');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('6789012345', 'Eman', 'Abdulrahman', '1982-06-18', 'F', 'Eman@gmail.com', 'Eman1234', '0589012345');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('7890123456', 'Saud', 'Osama', '1975-12-03', 'M', 'Saud75@gmail.com', 'Saud000', '0590123456');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('8901234567', 'Ahmad', 'Faisal', '1988-02-25', 'M', 'AhmadFaisal@hotmail.com', 'Ahmad1234', '0501234567');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('9012345678', 'Noura', 'Mishal', '1973-04-10', 'F', 'Noura_Mish@gmail.com', 'Nouraish1', '0512345678');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('9876543210', 'Mohsen', 'Majed', '2003-07-21', 'M', 'MMohsen@hotmail.com', 'Mohsen03', '0576543210');

INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('8765432123', 'Lulwa', 'Ali', '1992-10-05', 'F', 'Lulu@gmail.com', 'Lulwa1234', '0565432109');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('7654321098', 'Latifah', 'Khalid', '1987-01-17', 'F', 'LatiKhalid@gmail.com', 'Latifah123', '0554321098');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('6543210987', 'Rashid', 'Khalid', '1979-08-30', 'M', 'Rashid1979@hotmail.com', 'Rashid1234', '0543210987');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('5432109876', 'AbdulAziz', 'Saud', '2000-12-14', 'M', 'Aziz12@hotmail.com', 'Azoz1234', '0532109876');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('4321098765', 'Fahad', 'Badr', '1995-04-26', 'M', 'FahadB@gmail.com', 'Fahad123', '0521098765');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('3210987654', 'Noura', 'Sanad', '1980-09-08', 'F', 'N_Sanad@hotmail.com', 'Noura1980', '0510987654');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('2109876543', 'Manar', 'Hamad', '1971-11-12', 'F', 'Manar@gmail.com', 'Manar71H', '0509876543');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('1098765432', 'Sultan', 'Hamid', '2003-02-03', 'M', 'Sultan123@hotmail.com', 'Sultan123', '0598765432');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('0987654321', 'Omar', 'Abdulrahman', '1997-06-07', 'M', 'Omaromar@gmail.com', 'OmarA123', '0587654321');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('9876543220', 'Ibtihal', 'Mousa', '1989-03-20', 'F', 'Ibtihal@hotmail.com', 'Ibtihal89', '0576543220');

INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('8765432109', 'Muneera', 'Naji', '1976-05-02', 'F', 'MunNaji@gmail.com', 'Muneera1234', '0565432109');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('7654321111', 'Rawan', 'Jeber', '1991-07-24', 'F', 'RawanJA@hotmail.com', 'Rawan1234', '0554321111');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('6543210222', 'Khalid', 'Sultan', '1984-10-15', 'M', 'KhalidS@gmail.com', '1&Khalid', '0543210222');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('5432109333', 'Salih', 'Mohammad', '2001-01-28', 'M', 'Salih_0@hotmail.com', 'Salih123', '0532109333');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('4321098444', 'Bassam', 'Saad', '1996-05-09', 'M', 'BassamSaad@gmail.com', 'Bassam@96', '0521098444');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('3210987555', 'Mohammad', 'Faris', '1983-07-31', 'M', 'MohammadFar@gmail.com', 'Mohammad123', '0510987555');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('2109876666', 'Nouf', 'Ali', '1977-09-13', 'F', 'Noufi@hotmail.com', 'NoufAli00', '0509876666');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('1098765777', 'Danah', 'Nawaf', '1964-11-26', 'F', 'Danoo@hotmail.com', 'Danah1234', '0598765777');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('0987654888', 'Arwa', 'Talal', '1962-02-08', 'F', 'ArwaTalal@gmail.com', 'Arwa_Account', '0587654888');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('9876543999', 'Majed', 'Fahad', '1972-04-18', 'M', 'Majedd72@hotmail.com', 'M12ajed', '0576543999');

INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('8765432152', 'Faisal', 'Thamer', '1986-06-29', 'M', 'FaisalTham@hotmail.com', 'Faisal1234', '0565432100');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('7654321011', 'Hessah', 'Sami', '1974-08-11', 'F', 'Hessah@gmail.com', 'Sami1234', '0554321098');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('6543210922', 'Sarah', 'Hussain', '1957-12-23', 'F', 'SarahBintHussain@gmail.com', 'Sarah1234', '0543210987');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('5432109833', 'Layan', 'Abdulatif', '1994-03-06', 'F', 'Layan@hotmail.com', 'Layan0123', '0532109876');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('4321098744', 'Manal', 'Abdullah', '1981-05-19', 'F', 'Manal81@gmail.com', 'Manal123', '0521098765');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('3210987655', 'Reham', 'Ahmad', '1970-07-01', 'F', 'Reham1970@gmail.com', 'Reham1234', '0510987654');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('2109876566', 'Naif', 'Mishal', '1956-09-04', 'M', 'NaifMishal@gmail.com', 'NaifPass1', '0509876543');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('1098765477', 'Halah', 'Salman', '1985-11-16', 'F', 'Halah85Salman@gmail.com', 'Halah1234', '0598765432');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('0987654388', 'Ruba', 'Suliman', '1978-01-28', 'F', 'Ruba_Suliman@hotmail.com', 'Ruba1234', '0587654321');
INSERT INTO `skyWing`.`Passenger` (`P_SSN`, `P_FName`, `P_LName`, `P_Bdate`, `P_Gender`, `P_Email`, `P_Password`, `P_Phone`)
VALUES ('9876543299', 'Meshari', 'Salman', '1961-06-10', 'M', 'MeshariSalman_1961@gmail.com', 'Meshari1234', '0576543210');


#filling Airplane
INSERT INTO `skyWing`.`Airplane` (`AirplaneID`, `Capacity`) VALUES ('SWA#1', '28');
INSERT INTO `skyWing`.`Airplane` (`AirplaneID`, `Capacity`) VALUES ('SWA#2', '28');
INSERT INTO `skyWing`.`Airplane` (`AirplaneID`, `Capacity`) VALUES ('SWA#3', '28');
INSERT INTO `skyWing`.`Airplane` (`AirplaneID`, `Capacity`) VALUES ('SWA#4', '28');
INSERT INTO `skyWing`.`Airplane` (`AirplaneID`, `Capacity`) VALUES ('SWA#5', '28');
INSERT INTO `skyWing`.`Airplane` (`AirplaneID`, `Capacity`) VALUES ('SWA#6', '28');

#filling Airport
INSERT INTO `skyWing`.`Airport` (`AirportID`, `AirportName`, `Location`) VALUES ('DMM', 'King Fahd International Airport', 'Dammam');
INSERT INTO `skyWing`.`Airport` (`AirportID`, `AirportName`, `Location`) VALUES ('JED', 'King Abdulaziz International Airport', 'Jeddah');
INSERT INTO `skyWing`.`Airport` (`AirportID`, `AirportName`, `Location`) VALUES ('RUH', 'King Khalid International Airport ', 'Riyadh');

#filling Flight
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('001', 'oneway', '07:25:00', '08:30:00', 'Dammam', 'Riyadh', 'DMM', 'RUH', 'SWA#2', '01', '2024-06-03');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('002', 'round', '18:05:00', '20:35:00', 'Dammam', 'Jeddah', 'DMM', 'JED', 'SWA#3', '02', '2024-06-03');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('003', 'oneway', '09:00:00', '10:05:00', 'Riyadh', 'Dammam', 'RUH', 'DMM', 'SWA#1', '01', '2024-06-04');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('004', 'oneway', '17:35:00', '19:40:00', 'Jeddah', 'Dammam', 'JED', 'DMM', 'SWA#6', '04', '2024-06-04');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('005', 'oneway', '20:20:00', '21:25:00', 'Riyadh', 'Dammam', 'RUH', 'DMM', 'SWA#2', '10', '2024-06-05');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('006', 'oneway', '15:50:00', '17:25:00', 'Jeddah', 'Riyadh', 'JED', 'RUH', 'SWA#5', '04', '2024-06-05');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('007', 'oneway', '04:55:00', '06:05:00', 'Dammam', 'Riyadh', 'DMM', 'RUH', 'SWA#4', '02', '2024-06-06');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('008', 'oneway', '22:05:00', '23:50:00', 'Riyadh', 'Jeddah', 'RUH', 'JED', 'SWA#6', '03', '2024-06-06');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('009', 'round', '14:00:00', '16:05:00', 'Jeddah', 'Dammam', 'JED', 'DMM', 'SWA#3', '09', '2024-06-07');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('010', 'oneway', '00:30:00', '03:00:00', 'Dammam', 'Jeddah', 'DMM', 'JED', 'SWA#1', '01', '2024-06-07');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('011', 'round', '11:40:00', '12:45:00', 'Riyadh', 'Dammam', 'JED', 'DMM', 'SWA#5', '08', '2024-06-07');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('012', 'oneway', '13:10:00', '14:45:00', 'Jeddah', 'Riyadh', 'JED', 'RUH', 'SWA#4', '07', '2024-06-08');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('013', 'round', '01:30:00', '02:40:00', 'Dammam', 'Riyadh', 'DMM', 'RUH', 'SWA#5', '04', '2024-06-09');
INSERT INTO `skyWing`.`Flight` (`FlightNo`, `FlightType`, `DepartTime`, `ArrivalTime`, `DepartCity`, `ArrivalCity`, `DepartAirport`, `ArrivalAirport`, `AirplaneID`, `Gate`, `F_Date`)
VALUES ('014', 'oneway', '17:25:00', '19:10:00', 'Riyadh', 'Jeddah', 'RUH', 'JED', 'SWA#3', '05', '2024-06-09');

#filling Reservation
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('01', '001', 'A1', '2345678901', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('02', '001', 'B3', '3456789012', '640');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('03', '001', 'D7', '4567890123', '440');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('04', '002', 'A2', '5678901234', '840');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('05', '002', 'D3', '6789012345', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('06', '002', 'B6', '7890123456', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('07', '003', 'C1', '8901234567', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('08', '003', 'C4', '1234567890', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('09', '003', 'A5', '9012345678', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('10', '004', 'B2', '9876543210', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('11', '004', 'A4', '8765432123', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('12', '004', 'D6', '7654321098', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('13', '005', 'B1', '6543210987', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('14', '005', 'A3', '5432109876', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('15', '005', 'A7', '4321098765', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('16', '006', 'D1', '3210987654', '840');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('17', '006', 'A3', '2109876543', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('18', '006', 'B5', '1098765432', '440');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('19', '007', 'C2', '0987654321', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('20', '007', 'D4', '9876543220', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('21', '007', 'A6', '8765432109', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('22', '008', 'A1', '7654321111', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('23', '008', 'B1', '6543210222', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('24', '009', 'B4', '5678901234', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('25', '009', 'C6', '6789012345', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('26', '009', 'B3', '7890123456', '640');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('27', '010', 'C2', '5432109333', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('28', '010', 'D2', '4321098444', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('29', '010', 'A2', '3210987555', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('30', '011', 'B3', '2109876666', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('31', '011', 'B4', '1098765777', '640');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('32', '011', 'A7', '0987654888', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('33', '012', 'A4', '9876543999', '600');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('34', '012', 'A3', '8765432152', '640');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('35', '012', 'D2', '7654321011', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('36', '013', 'D5', '2109876666', '400');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('37', '013', 'A5', '1098765777', '440');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('38', '013', 'D3', '0987654888', '640');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('39', '014', 'C2', '6543210922', '800');
INSERT INTO `skyWing`.`Reservation` (`ReservationCode`, `FlightNo`, `SeatNo`, `Passneger_SSN`, `TotalPrice`) VALUES ('40', '014', 'D2', '5432109833', '840');
