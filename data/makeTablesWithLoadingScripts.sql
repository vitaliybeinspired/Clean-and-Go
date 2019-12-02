create schema CleanandGo

create table if not exists Employee(
	SSN char(9) not NULL,
    Fname varchar(20),
    Minitial varchar(10),
    Lname varchar(20),
    gender varchar(20),
    DateHired date,
    position varchar(20),
    salary decimal(8,2),
	address varchar(100),
	telephone varchar(20),

	primary key(SSN)
    
); 

create table if not exists Supplier(
	Supplier_ID varchar(25),
    Supplier_Name varchar(20),
    Telephone varchar(20),
    Address varchar(100),
    
    primary key (Supplier_ID)
);

create table if not exists Assets(
	A_ID int auto_increment,

	primary key(A_ID)
);

create table if not exists Service(
	service_ID varchar(50),
    S_Name varchar(20),
    Description varchar(50),
    Rate decimal(9,2),
    Duration decimal(9,2),
    
    primary key (service_ID)
);

create table if not exists Customer(
	Customer_ID varchar(50),
    Fname varchar(25),
    Minitial varchar(10),
    Lname varchar(220),
    Address varchar(100),
    Email varchar(50),
    Telephone varchar(20),
    Credit_Card varchar(225), ##assuming credit card info accepts a string
    primary key (Customer_ID)
    
);

create table if not exists Eschedule(
	ESSN char(9),
    Workday date,
    StartTime varchar(225),
    EndTime varchar(225),
    Hours decimal(9,2),
    foreign key (ESSN) references Employee(SSN) on delete cascade,
    primary key (ESSN,Workday)
    
);

create table if not exists Equipment(
	E_ID varchar(50),
    A_ID int,
    Brand_Name varchar(25),
    E_Type varchar(20),
    MaintPrice decimal(9,2),
	foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (E_ID)
    
);

create table if not exists CleanSupplies(
	A_ID int,
	CName varchar(225),
    CUsage varchar(225),
    Inventory integer(9),
    SafetyInfo varchar(50),
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (CName)
    
);

create table if not exists Building(
	Building_ID int,
	A_ID int,
    Rent decimal(9,2),
    Utilities decimal(9,2),
    DateofSign date,
    foreign key (A_ID) references Assets(A_ID),
    primary key(Building_ID)
);

create table if not exists MSchedule(
	EquipmentID varchar(50),
    NextMaintDate date,
    foreign key (EquipmentID) references Equipment(E_ID) on delete cascade,
    primary key (EquipmentID, NextMaintDate)
);

create table if not exists Sells(
	A_ID int,
    Supplier_ID varchar(25),
    DatePurchased date,
    DeliveryDate date,
    description varchar(50),
    QuantityPurchaced decimal(9,2),
    AmountDue decimal(9,2),
    PricePerUnit decimal(9,2),
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    foreign key (Supplier_ID) references Supplier(Supplier_ID) on delete cascade,
    primary key (A_ID, Supplier_ID)
);

create table if not exists Uses(
	SSN char(9),
    A_ID int,
	TimeOfUse timestamp,
    Description varchar(50),
    foreign key (SSN) references Employee(SSN) on delete cascade,
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (SSN, A_ID,TimeOfUse)
);

create table if not exists TransactionInfo(
	SSN char(9),
    Customer_ID varchar(20),
    Service_ID varchar(20),
    TransactionDate timestamp,
    AmountCharged decimal(9,2),
    Satisfaction varchar(25),
    foreign key (SSN) references Employee(SSN) on delete cascade,
    foreign key (Customer_ID) references Customer(Customer_ID) on delete cascade,
    foreign key (Service_ID) references Service(Service_ID) on delete cascade,
    primary key (SSN, Customer_ID, Service_ID)
);

insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();

DELIMITER $$
CREATE PROCEDURE newCustomer(IN CID varchar(50),IN Fst varchar(25),IN Mnt char(1), IN Lst varchar(220),IN addr varchar(100),IN email varchar(50),IN phone varchar(20),IN cc varchar(225))
BEGIN
  INSERT INTO Customer VALUES(CID,Fst,Mnt,Lst,addr,email,phone,cc);
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE insertAssets(IN A_ID int(11) )
BEGIN
insert into Assets values(A_ID); 
END$$
DELIMITER ;

DELIMITER $$
 CREATE PROCEDURE add_employee(IN SSN char(9), IN Fname varchar(20), IN Minitial char(1), IN Lname varchar(20), IN gender varchar(20),
 IN DateHired date, IN position varchar(20), IN salary decimal(8,2), IN addres varchar(100), IN telephone varchar(20))
 
 BEGIN
 INSERT INTO Employee VALUES(SSN, Fname, Minitial, Lname, gender, DateHired, position, salary, address, telephone);
 END$$
 DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_equipment(OUT E_ID varchar(50), OUT A_ID int(11), IN Brand_Name varchar(25), 
IN E_Type varchar(20), IN MaintPrice decimal)

BEGIN
INSERT INTO Equipment VALUES(E_ID, A_ID, Brand_Name, E_Type, MaintPrice);
END$$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE add_service(IN service_ID varchar(50), IN S_Name varchar(20), IN Description varchar(50), IN Rate decimal, 
IN Duration decimal) 

BEGIN
INSERT INTO Service VALUES(service_ID, S_Name, Description, Rate, Duration);
END$$
DELIMITER ;




LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\employee' REPLACE
INTO TABLE Employee
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'
(SSN, Fname, Minitial,Lname,gender,@temp,position,salary,address,telephone)
SET DateHired = str_to_date(@temp,'%Y-%m-%d');

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\supplier' REPLACE
INTO TABLE Supplier
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\service' REPLACE
INTO TABLE Service
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\customer' REPLACE
INTO TABLE Customer
FIELDS terminated by ',' enclosed by ''
lines TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\eschedule' REPLACE
INTO TABLE Eschedule
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\equipment' REPLACE
INTO TABLE Equipment
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\cleansupplies' REPLACE
INTO TABLE CleanSupplies
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\building' REPLACE
INTO TABLE Building
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\mschedule' REPLACE
INTO TABLE MSchedule
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n';


SET foreign_key_checks = 0;
LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\sells' REPLACE
INTO TABLE Sells
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n';
SET foreign_key_checks = 1;

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\uses' REPLACE
INTO TABLE Uses
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 

SET foreign_key_checks = 0;
LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\transaction' REPLACE
INTO TABLE TransactionInfo
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 
SET foreign_key_checks = 1;
