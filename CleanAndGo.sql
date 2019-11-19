create schema CleanandGo;

create table if not exists Employee(
	SSN char(9) not NULL,
    employeeID char(9),
    Fname varchar(20),
    Minitial char,
    Lname varchar(20),
    gender varchar(20),
    DateofEmployment date,
    positionHired varchar(20),
    salary decimal(8,2),
	address varchar(100),

	primary key(SSN)
    
); 

create table if not exists Supplier(
	Supplier_ID varchar(25),
    Suppliername varchar(20),
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
    Service_Name varchar(20),
    Description varchar(50),
    Rate decimal(9,2),
    Duration decimal(9,2),
    
    primary key (service_ID)
);

create table if not exists Customer(
	Customer_ID varchar(50),
    Fname varchar(25),
    Mint char,
    Lname varchar(220),
    Address varchar(100),
    Email varchar(50),
    Telephone varchar(20),
    CCinfo varchar(225), ##assuming credit card info accepts a string
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
    BrandName varchar(25),
    EquipmentType varchar(20),
    MaintPrice decimal(9,2),
	ExpensePA integer(9),
	foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (E_ID)
    
);

create table if not exists CleanSupplies(
	A_ID int,
	CName varchar(225),
    UsageLevel varchar(225),
    CurInv integer(9),
    SafetyInformation varchar(50),
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
    DateofNextMaintainence date,
    foreign key (EquipmentID) references Equipment(E_ID) on delete cascade,
    primary key (EquipmentID, DateofNextMaintainence)
);

create table if not exists Sell(
	A_ID int,
    Supplier_ID varchar(50),
    Sale_ID integer(9) auto_increment,
    SaleDate date,
    DiliveryDate date,
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
    Description varchar(50),
    foreign key (SSN) references Employee(SSN) on delete cascade,
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (SSN, A_ID)
);

create table if not exists TransactionInfo(
	SSN char(9),
    Customer_ID varchar(20),
    Service_ID varchar(20),
    TransactionDate timestamp,
    Tx_ID integer(9) auto_increment,
    AmountCharge decimal(9,2),
    Satisfaction varchar(25),
    foreign key (SSN) references Employee(SSN) on delete cascade,
    foreign key (Customer_ID) references Customer(Customer_ID) on delete cascade,
    foreign key (Service_ID) references Service(Service_ID) on delete cascade,
    primary key (SSN, Customer_ID, Service_ID)
);
