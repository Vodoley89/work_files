create table if not exists Genre_list (Genre_id SERIAL primary key ,
Name_G  VARCHAR (50)
);



create table if not exists Genres_Executers (GE_id SERIAL primary key,
Executer_id int,
Genre_id int,
foreign key (Executer_id) references Executer (Executer_id),
foreign key (Genre_id) references Genre_list(Genre_id)
);




create table if not exists Executer (Executer_id SERIAL primary key,
Nickname VARCHAR (50)
);


create table if not exists Album_Exct (AE_id SERIAL primary key,
Album_id int,
Executer_id int,
foreign key (Album_id) references Album_list (Album_id),
foreign key (Executer_id) references Executer(Executer_id)
);



create table if not exists Album_list (Album_id SERIAL primary key,
Name_A VARCHAR (100),
Year_A int
);



create table if not exists Track_list (Track_id SERIAL primary key,
Name_T VARCHAR (50),
Duration int,
Album_id int,
foreign key (Album_id) references Album_list(Album_id)
);


create table if not exists Collection_Tracks (CT_id SERIAL primary key,
Coll_id int,
Track_id int,
foreign key (Coll_id) references Collection(Coll_id),
foreign key (Track_id) references Track_list (Track_id)
);


create table if not exists Collection (Coll_id SERIAL primary key,
Name_C VARCHAR (50),
Year_C int
);
