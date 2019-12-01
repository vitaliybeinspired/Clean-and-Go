
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

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\sells' REPLACE
INTO TABLE Sells
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n';

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\uses' REPLACE
INTO TABLE Uses
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 

LOAD DATA LOCAL INFILE 'C:\\Users\\max0p\\OneDrive\\Desktop\\Project2Data\\transaction' REPLACE
INTO TABLE TransactionInfo
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\r\n'; 
