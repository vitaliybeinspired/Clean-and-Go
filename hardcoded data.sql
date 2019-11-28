#employee values
insert into Employee values('111000111', 'Vitaliy', 'V', 'Stepanov', 'Male', '2015-12-05', 'Software Engineer', 300000.00, '123 street, renton, wa', '5551110000');
insert into Employee values('222000222', 'Maxwell', 'G', 'Peters', 'Male', '2013-11-21', 'Technician', 255000.00, '223 street, seattle, wa', '5552220000');
insert into Employee values('333000333', 'AJ', 'A', 'Apolonio', 'Male', '2011-01-05', 'Marketing', 420000.00, '323 street, kent, wa', '5553330000');
insert into Employee values('444000444', 'Dominick', 'W', 'Couzijn', 'Male', '2014-12-15', 'Sales', 250000.00, '423 street, bellevue, wa', '5554440000');
insert into Employee values('555000555', 'Ivana', 'V', 'Humpalot', 'Female', '2013-12-04', 'Accounting', 45000.00, '523 street, bellevue, wa', '5555550000');
insert into Employee values('666000666', 'John', 'A', 'Conner', 'Female', '2012-11-05', 'Mechanic', 80000.00, '623 street, kent, wa', '5556660000');
insert into Employee values('777000777', 'Austin', 'T', 'Powers', 'Male', '2018-05-05', 'Secretary', 26000.00, '723 street, renton, wa', '5557770000');
insert into Employee values('888000888', 'Jessica', 'V', 'Alba', 'Female', '2012-05-15', 'Clerk', 25000.00, '823 street, renton, wa', '5558880000');
insert into Employee values('999000999', 'Katie', 'B', 'Holmes', 'Female', '2016-12-05', 'Maintenance', 24000.00, '923 street, seattle, wa', '5559990000');
insert into Employee values('000111000', 'Tony', 'D', 'Stark', 'Male', '2018-12-05', 'Associate', 23000.00, '023 street, seattle, wa', '5550000000');

#Supplier
insert into Supplier values('123', 'Wholesale', '206-123-456', '123st 98108 Seattle');
insert into Supplier values('124', 'Cosco', '425-123-456', '7st 22222 Renton');
insert into Supplier values('125', 'Underground', '111-123-456', 'Chinatown Seattle');
insert into Supplier values('126', 'LT', '453-188-456', '123st 12412 CALI');
insert into Supplier values('127', 'Ford', '216-123-156', '123st FORD HQ');
insert into Supplier values('128', 'SupplierA', '246-173-956', '125st 91111 Seattle');
insert into Supplier values('129', 'CleanerPlug', '286-199-756', '193st 98108 Kent');
insert into Supplier values('111', 'Amazon', '111-113-486', 'Seattle Amazon HQ');
insert into Supplier values('222', 'Safeway', '226-129-956', '126st 35364 Renton');
insert into Supplier values('133', 'BulkBuy', '776-173-756', '167st 87654 Bellevue');

#Assets
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();insert into Assets values();insert into Assets values();insert into Assets values(); 
insert into Assets values();

#do this 21 times 
#A_ID(1) is taken by building
#A_ID (2-11) are taken by equipment
#A_ID(12-21) are taken by cleaning supplies 

#Service
#working
insert into Service values('01', 'House Cleaning', 'Vacumn, Mop, Deep house clean', 25.0, 6.0);
Insert into Service values('02', 'Pressure Washing', 'Pressure washing surface', 50.0, 7.0);
Insert into Service values('03', 'software engineering', 'if ur good at something never do it for free', 100000.0, 9900.0);
Insert into Service values('04', 'Hanging with Max', 'what is life', 1.0, 900000.0);
Insert into Service values('05', 'Vitality with Vitaly', 'get your energy levels up', 7.0, 1.0);
Insert into Service values('06', 'House Renovation', 'any house renovation project', 100.0, 120.0);
Insert into Service values('07', 'Dum Dum', 'increase your IQ with Dom', 10000.0, 0.1);
Insert into Service values('08', 'Glass cleaning', 'window cleaning', 5.0, 2.0);
Insert into Service values('09', 'VR with AJ', 'enjoy our local VR setup with AJ', 20.0, 1.0);
Insert into Service values('10', 'Birthday Catering', 'set up party, provide food catering', 100.0, 5.0);

#Customer
#working with changed primary key 12345 -> 54321
insert into Customer values('12345', 'Boi', 'W', 'Li','555st 35233 Seattle', '123@hotmail.com','206-123-543','1234567890 123');
insert into Customer values('18888', 'Gurl', 'W', 'Li','555st 35233 Seattle', '132@hotmail.com','206-123-223','9876543 765');
insert into Customer values('44444', 'Man', 'A', 'Guy','888st 38883 Renton', '199@hotmail.com','116-183-543','1238887890 883');
insert into Customer values('54321', 'Boi', 'W', 'Li','555st 35233 Seattle', '133@hotmail.com','206-123-543','1234567890 123');
insert into Customer values('56665', 'Mike', 'J', 'Hawk','888st 880883 Bellevue', '155@hotmail.com','206-123-543','1888590890 999');
insert into Customer values('10045', 'Tony', 'P', 'Stark','StarkBuilding 100th floor, NewYork', 'IronMan@hotmail.com','998-773-043','12345457890 153');
insert into Customer values('19755', 'Peter', 'G', 'Parker','585st 88883 NY Bronx', 'spooderman@hotmail.com','116-555-888','9999567890 444');
insert into Customer values('99764', 'Kay', 'Q', 'John','526st 89233 Renton', 'abc@hotmail.com','425-123-543','1222222220 223');
insert into Customer values('99999', 'Jay', 'W', 'May','333st 33333 Seattle', 'zxc@hotmail.com','206-975-553','12345376390 114');
insert into Customer values('33333', 'Test', 'T', 'Test','Planet Earth', 'aaa@hotmail.com','266-123-543','9234567890 193');

#Eschedule
insert into Eschedule values('111000111', '2019-11-21', '0900', '1700',8);
insert into Eschedule values('222000222', '2019-11-21', '0900', '1700',8);
insert into Eschedule values('333000333', '2019-11-21', '0900', '1700',8);
insert into Eschedule values('444000444', '2019-11-21', '0900', '1700',8);
insert into Eschedule values('555000555', '2019-11-21', '0900', '1700',8);
insert into Eschedule values('666000666', '2019-11-21', '0500', '1300',8);
insert into Eschedule values('777000777', '2019-11-21', '0500', '1300',8);
insert into Eschedule values('888000888', '2019-11-21', '0500', '1300',8);
insert into Eschedule values('999000999', '2019-11-21', '0500', '1300',8);
insert into Eschedule values('000111000', '2019-11-21', '0500', '1300',8);

#Equipment
insert into Equipment values('01',2, 'LG', 'Washer', 250.00);
insert into Equipment values('02',3,'LG','Drier', 250.00);
insert into Equipment values('03',4,'GE','Ultra-Washer', 500.00);
insert into Equipment values('04',5,'GE','Ultra-Drier', 500.00);
insert into Equipment values('05',6,'LG','Vacum', 150.00);
insert into Equipment values('06',7,'GE','Duster', 50.00);
insert into Equipment values('07',8,'Roku','TV', 250.00);
insert into Equipment values('08',9,'Costco','Mop', 10.00);
insert into Equipment values('09',10,'LG','Swiffer', 30.00);
insert into Equipment values('010',11,'LG','Dust Pan', 20.00);

#CleanSupplies
#works with single quotes
#i think safetyinfo might need to be an int? It is the level where we need to order more isn’t it?
#unless mysql has a casting operation, how can we compare between int & varchar?
insert into CleanSupplies values(12,'Bleach','Disinfectant',74,75);
insert into CleanSupplies values(13,'Soap','Disinfectant',6,7);
insert into CleanSupplies values(14,'Lysol','Disinfectant',100,150);
insert into CleanSupplies values(15,'Rags','General Cleaning',200,175);
insert into CleanSupplies values(16,'Sponges','General Cleaning',200,150);
insert into CleanSupplies values(17,'Tide Pods','Clothes Cleaning', 500, 200);
insert into CleanSupplies values(18,'Dryer Sheets','Clothes Cleaning',10,5);
insert into CleanSupplies values(19,'Brillo Pads','General Cleaning',20,10);
insert into CleanSupplies values(20,'Swiffer Pads','General Cleaning',50,25);
insert into CleanSupplies values(21,'Abraxo Powder','General Cleaning',20,15);

#Building
#working with double quoted date
insert into Building values(1,1,100000,25000,"2018-7-03");

#MSchedule
#working with single quoted first field
insert into MSchedule values('01','2019-04-01');
insert into MSchedule values('02','2019-05-02');
insert into MSchedule values('03','2019-06-03');
insert into MSchedule values('04','2019-07-04');
insert into MSchedule values('05','2019-08-05');
insert into MSchedule values('06','2019-09-06');
insert into MSchedule values('07','2019-10-07');
insert into MSchedule values('08','2019-11-08');
insert into MSchedule values('09','2019-12-09');
insert into MSchedule values('010','2020-01-10');

#sells : a_id is from(2-21) and supplier id is from(123-129, 111, 222, 133)
insert into Sells values(6, '123', "2018-11-24", "2018-11-27", 'test1', 20.00, 600.00, 30.00);
insert into Sells values(2, '129', "2018-10-24", "2018-11-24", 'test2', 2.00, 60.00, 30.00);
insert into Sells values(21, '111', "2018-12-29", "2019-1-5", 'test3', 10.00, 400.00, 40.00);
insert into Sells values(18, '222', "2019-11-24", "2019-11-27", 'test4', 20.00, 1600.00, 80.00);
insert into Sells values(9, '133', "2017-6-24", "2018-7-2", 'test5', 40.00, 800.00, 20.00);
insert into Sells values(7, '127', "2017-8-24", "2018-9-7", 'test6', 60.00, 600.00, 10.00);
insert into Sells values(13, '124', "2017-10-24", "2018-11-12", 'test7', 200.00, 600.00, 3.00);
insert into Sells values(17, '125', "2019-4-24", "2018-4-27", 'test8', 250.00, 1000.00, 40.00);
insert into Sells values(4, '133', "2019-2-24", "2018-6-19", 'test9', 25.00, 125.00, 3.00);
insert into Sells values(19, '111', "2019-1-24", "2019-3-7", 'test10', 12.00, 60.00, 5.00);

#uses table : ssn:(nnn000nnn n: 1-9, 000111000), a_id:(2-11)
#ssn, a_id, timeOfUse, description
insert into Uses values('111000111',2,"2019-10-2 13:30:02","test1");
insert into Uses values('222000222',3,"2019-1-4 10:40:23","test2");
insert into Uses values('333000333',4,"2019-7-26 05:05:57","test3");
insert into Uses values('444000444',5,"2019-8-18 06:10:19","test4");
insert into Uses values('555000555',6,"2019-4-21 10:45:02","test5");
insert into Uses values('666000666',7,"2019-8-15 08:35:02","test6");
insert into Uses values('777000777',8,"2019-2-27 12:37:29","test7");
insert into Uses values('888000888',9,"2019-9-13 00:36:22","test8");
insert into Uses values('999000999',10,"2019-7-4 13:35:52","test9");
insert into Uses values('000111000',11,"2019-6-7 18:34:12","test10");

#transaction info : ssn , customer id('10045','12345','18888','19755','33333','44444','54321','56665','99764','99999',), service id(01 -10)
insert into TransactionInfo values('111000111','10045','01',"2019-11-24 00:30:02", 10000.00, 'Highly Satisfied');
insert into TransactionInfo values('222000222','12345','02',"2019-11-24 00:00:09", 15000.00, 'Satisfied');
insert into TransactionInfo values('222000222','18888','05',"2019-11-24 00:30:47", 20000.00, 'Satisfied');
insert into TransactionInfo values('333000333','19755','10',"2019-11-24 00:00:12", 25000.00, 'Highly Satisfied');
insert into TransactionInfo values('333000333','33333','07',"2019-11-24 00:00:39", 50000.00, 'Average');
insert into TransactionInfo values('444000444','10045','01',"2019-11-24 00:30:41", 1500.00, 'Average');
insert into TransactionInfo values('777000777','44444','08',"2019-11-24 00:30:23", 2500.00, 'Bad Experience');
insert into TransactionInfo values('777000777','54321','08',"2019-11-24 00:00:54", 7000.00, 'Highly Satisfied');
insert into TransactionInfo values('111000111','99764','06',"2019-11-24 00:00:24", 800.00, 'Satisfied');
insert into TransactionInfo values('000111000','99999','09',"2019-11-24 00:30:11", 600.00, 'Average');

