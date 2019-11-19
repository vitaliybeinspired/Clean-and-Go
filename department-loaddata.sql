LOAD DATA LOCAL INFILE 'C:/Users\\domin\\Downloads\\CompanySchema\\department.dat'
INTO TABLE department
FIELDS terminated by ',' enclosed by '"'
lines TERMINATED BY '\n'; 

load data local infile 'C:/Users\\domin\\Downloads\\CompanySchema\\dependent.dat'
into table dependent
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

load data local infile 'C:/Users\\domin\\Downloads\\CompanySchema\\dloc.dat'
into table dept_locations
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

load data local infile 'C:/Users\\domin\\Downloads\\CompanySchema\\employee.dat'
into table employee
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

load data local infile 'C:/Users\\domin\\Downloads\\CompanySchema\\project.dat'
into table project
fields terminated by ',' enclosed by '"'
lines terminated by '\n';

load data local infile 'C:/Users\\domin\\Downloads\\CompanySchema\\worksOn.dat'
into table works_on
fields terminated by ',' enclosed by '"'
lines terminated by '\n';