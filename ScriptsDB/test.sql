create table staff_data (
id serial primary key,
fk_name_id int references staff(id),
fk_l_name int references staff(id),
phone_id int references data_staff(id),
email_id int references data_staff(id)
);

create table staff(
id serial primary key,
name varchar(30),
l_name varchar (30)
);

create table data_staff (
id serial primary key,
phone int,
email varchar (30)
);



insert into data_staff (phone, email) values (12345, '12345@w.ru'),
										(14725, '14725@w.ru'),
										(36985, '36985@w.ru');
										
insert into staff (name, l_name) values ('Vasya', 'Vas'),
										('Kolya', 'Kol'),
										('Vanya', 'Van');
								
insert into staff_data (fk_name_id, fk_l_name, phone_id, email_id) values (1,1, 1,1),
									(2,2,2,2),
									(3,3,3,3);
								
								
select data_staff.phone, data_staff.email, staff.name, staff.l_name from data_staff left join staff_data using (id) left join staff using (id); and staff_data.id = staff.id;
