CREATE TABLE department (
  dname        varchar(25) not null,
  dnumber      integer(4),
  mgrssn       char(9) not null, 
  mgrstartdate date,
  primary key (dnumber),
  key (dname)
);

CREATE TABLE dept_locations (
  dnumber   integer(4),
  dlocation varchar(15), 
  primary key (dnumber,dlocation),
  foreign key (dnumber) references department(dnumber) on delete cascade
);

CREATE TABLE project (
  pname      varchar(25) not null,
  pnumber    integer(4),
  plocation  varchar(15),
  dnum       integer(4) not null,
  primary key (pnumber),
  unique (pname),
  foreign key (employeednum) references department(dnumber) on delete cascade
);


CREATE TABLE employee (
  fname    varchar(15) not null, 
  minit    varchar(1),
  lname    varchar(15) not null,
  ssn      char(9),
  bdate    date,
  address  varchar(50),
  sex      char,
  salary   decimal(10,2),
  superssn char(9),
  dno      integer(4),
  primary key (ssn),
  foreign key (dno) references department(dnumber) on delete cascade
);

alter table employee  Add foreign key (superssn) references employee(ssn) on delete cascade;

alter table employee drop foreign key employee_ibfk_2;
alter table employee drop  key  superssn;

CREATE TABLE dependent (
  essn           char(9),
  dependent_name varchar(15),
  sex            char,
  bdate          date,
  relationship   varchar(8),
  primary key (essn,dependent_name),
  foreign key (essn) references employee(ssn) on delete cascade
);


CREATE TABLE works_on (
  essn   char(9),
  pno    integer(4),
  hours  decimal(4,1),
  primary key (essn,pno),
  foreign key (essn) references employee(ssn) on delete cascade,
  foreign key (pno) references project(pnumber) on delete cascade
);


##DROP TABLE works_on;
##DROP TABLE dependent;
##DROP TABLE employee;
##DROP TABLE project;
#DROP TABLE dept_locations;
##DROP TABLE department;