create table Genre_list (Genre_id int primary key,
Name_G text
);


create table Genres_Executers (GE_id int primary key,
Executer_id int,
Genre_id int,
foreign key (Executer_id) references Executer (Executer_id),
foreign key (Genre_id) references Genre_list(Genre_id)
);


create table Executer (Executer_id int primary key,
Nickname text
);


create table Album_Exct (AE_id int primary key,
Album_id int,
Executer_id int,
foreign key (Album_id) references Album_list (Album_id),
foreign key (Executer_id) references Executer(Executer_id)
);


create table Album_list (Album_id int primary key,
Name_A text,
Year_A text
);


create table Track_list (Track_id int primary key,
Name_T text,
Duration time,
Album_id int,
foreign key (Album_id) references Album_list(Album_id)
);


create table Collection_Tracks (CT_id int primary key,
Coll_id int,
Track_id int,
foreign key (Coll_id) references Collection(Coll_id),
foreign key (Track_id) references Track_list (Track_id)
);


create table Collection (Coll_id int primary key,
Name_C text,
Year_C text
);
















