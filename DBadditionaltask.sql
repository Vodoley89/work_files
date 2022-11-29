create table staff (staff_id int primary key,
first_name text,
post_name text,
post_id int
);



insert into staff (staff_id, 
first_name,
post_name,
post_id) values (1 , 'Ivan', 'manager', 1);

insert into staff (staff_id, 
first_name,
post_name,
post_id) values (2 , 'Il`ya', 'manager', 1); 

insert into staff (staff_id, 
first_name,
post_name,
post_id) values (3 , 'Boris', 'manager', 1); 

insert into staff (staff_id, 
first_name,
post_name,
post_id) values (4 , 'Kolya', 'senior_manager', 2); 

select * from staff
