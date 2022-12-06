create table Department (Dep_id int primary key,
Dep_name varchar(20)
);


insert into Department(Dep_id, Dep_name) values (001 , 'IT');
insert into Department(Dep_id, Dep_name) values (002 , 'Developer');


create table Positions (Pos_id int primary key,
Pos_name varchar(20)
);

insert into Positions(Pos_id, Pos_name) values (1 , 'Director');
insert into Positions(Pos_id, Pos_name) values (2 , 'Developer')


create table Staff (id int primary key,
staff_name  varchar (30),
Dep_id int,
Pos_id INT,
foreign key (Dep_id) references Department(Dep_id),
foreign key (Pos_id) references Positions(Pos_id)
);



insert into Staff (id, staff_name, Dep_id, Pos_id) values (11, 'Oleg', 002, 2);
insert into Staff (id, staff_name, Dep_id, Pos_id) values (22, 'Viktor', 002, 2);
insert into Staff (id, staff_name, Dep_id, Pos_id) values (777, 'Boris', 001, 1);


select * from Staff