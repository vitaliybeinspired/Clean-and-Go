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
    Sname varchar(20),
    Telephone varchar(20),
    Balance decimal(9,2),
    address varchar(100),
    
    primary key (Supplier_ID)
);

create table if not exists Assets(
	A_ID int auto_increment,

	primary key(A_ID)
);

create table if not exists service(
	serviceID varchar(50),
    serviceName varchar(20),
    description varchar(50),
    rate decimal(9,2),
    duration decimal(9,2),
    
    primary key (serviceID)
);

create table if not exists customer(
	C_ID varchar(50),
    Fname varchar(25),
    Mint char,
    Lname varchar(220),
    address varchar(100),
    email varchar(50),
    telephone varchar(20),
    CCinfo varchar(225), ##assuming credit card info accepts a string
    balance decimal(9,2),
    primary key (C_ID)
    
);

create table if not exists Eschedule(
	ESSN char(9),
    Workday date,
    Stime varchar(225),
    Etime varchar(225),
    Whours decimal(9,2),
    foreign key (ESSN) references Employee(SSN) on delete cascade,
    primary key (ESSN,Workday)
    
);

create table if not exists Equipment(
	E_ID varchar(50),
    A_ID int,
    Bname varchar(25),
    price decimal(9,2),
    Etype varchar(20),
    maintanancePrice decimal(9,2),
	ExpensePerYear integer(9),
    PurchaseDate date,
	foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (E_ID)
    
);

create table if not exists CleanSupplies(
	A_ID int,
	CName varchar(225),
    CUsage varchar(225),
    CurrentInventory integer(9),
    PricePerUnit decimal(9,2),
	ExpensePerYear integer(9),
    PurchaseDate varchar(225),
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (CName)
    
);

create table if not exists Building(
	A_id int,
    rent decimal(9,2),
    utilities decimal(9,2),
    foreign key (A_id) references Assets(A_ID),
    primary key(A_id)
);
create table if not exists MSchedule(
	EquipmentID varchar(50),
    dates date,
    foreign key (EquipmentID) references Equipment(E_ID) on delete cascade,
    primary key (EquipmentID, dates)
);

create table if not exists sell(
	A_ID int,
    Supplier_ID varchar(50),
    Sale_ID integer(9) auto_increment,
    SaleDate date,
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    foreign key (Supplier_ID) references Supplier(Supplier_ID) on delete cascade,
    primary key (Sale_ID)
);



create table if not exists Uses(
	SSN char(9),
    A_ID int,
    description varchar(50),
    foreign key (SSN) references Employee(SSN) on delete cascade,
    foreign key (A_ID) references Assets(A_ID) on delete cascade,
    primary key (SSN, A_ID)
);

create table if not exists trans(
	SSN char(9),
    C_ID varchar(20),
    serviceID varchar(20),
    Tstamp timestamp,
    T_ID integer(9) auto_increment, 
    foreign key (SSN) references Employee(SSN) on delete cascade,
    foreign key (C_ID) references customer(C_ID) on delete cascade,
    foreign key (serviceID) references service(serviceID) on delete cascade,
    primary key (T_ID)
);
