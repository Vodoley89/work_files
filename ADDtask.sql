create table Post (post_id int primary key,
post_name text
);

insert into Post(post_id, post_name) values (001 , 'senior_manager');
insert into Post(post_id, post_name) values (002 , 'manager');



create table Staff (staffID int primary key,
staff_name text,
department text,
postID int, 
foreign key (postID) references Post (post_id)
);



insert into Staff (staffID, staff_name, department, postID) values (11, 'Oleg', 'programmer', 002);
insert into Staff (staffID, staff_name, department, postID) values (22, 'Il`ya', 'enginer', 002);
insert into Staff (staffID, staff_name, department, postID) values (777, 'Boris', 'IT department', 001);


select * from Staff