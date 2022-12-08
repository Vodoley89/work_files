create table if not exists Genre_list (Genre_id SERIAL primary key ,
Name_G  VARCHAR (50)
);

insert into Genre_list(Name_G) values   ('hip-hop'),
										('Alternative'),
										('Rok'),
										('Romantic'),
										('Shanson');


create table if not exists Genres_Executers (GE_id SERIAL primary key,
Executer_id int,
Genre_id int,
foreign key (Executer_id) references Executer (Executer_id),
foreign key (Genre_id) references Genre_list(Genre_id)
);

insert into Genres_Executers (Executer_id,Genre_id) values 	(1, 11),
															(2, 11),
															(3, 11),
															(4, 12),
															(5, 13),
															(6, 13),
															(7, 14),
															(8, 15);
															
															


create table if not exists Executer (Executer_id SERIAL primary key,
Nickname VARCHAR (50)
);

insert into Executer(Nickname) values   ('Каста'),
										('Многоточие'),
										('Miyagi'),
										('Skillet'),
										('FFDP'),
										('ACDC'),
										('Amedeo Minghi'),
										('М.Круг');


create table if not exists Album_Exct (AE_id SERIAL primary key,
Album_id int,
Executer_id int,
foreign key (Album_id) references Album_list (Album_id),
foreign key (Executer_id) references Executer(Executer_id)
);

insert into Album_Exct(Album_id, Executer_id) values 	(1,1),
														(1,2),
														(2,3),
														(2,4),
														(3,5),
														(3,6),
														(4,7),
														(4,8),
														(5,9),
														(5,10),
														(6,11),
														(6,12),
														(7,13),
														(7,14),
														(8,15),
														(8,16);



create table if not exists Album_list (Album_id SERIAL primary key,
Name_A VARCHAR (100),
Year_A date
);

insert into Album_list(Name_A, Year_A) values   ('альбомба', '2021-01-01'),
												('атомы сознания', '2002-01-01'),
												('yamakasi', '2020-01-01'),
												('Dominion', '2022-01-01'),
												('F8', '2020-01-01'),
												('Black ice', '2008-01-01'),
												('LA Bussola', '2016-01-01'),
												('Посвящение', '2002-01-01');
 delete from Album_list where Album_id >8;


create table if not exists Track_list (Track_id SERIAL primary key,
Name_T VARCHAR (50),
Duration time,
Album_id int,
foreign key (Album_id) references Album_list(Album_id)
);

insert into Track_list(Name_T,Duration , Album_id) values   ('Встреча', '00:02:48' , '1'),
															('я сам', '00:02:16' , '1'),
															('Жизнь и свобода', '00:04:10' , '2'),
															('Москва', '00:04:00' , '2'),
															('Captain',' 00:03:35 ', '3'),
															('intro',' 00:01:30 ', '3'),
															('Hero', '00:03:06' , '4'),
															('stars','00:03:45 ', '4'),
															('mine',' 00:04:05' , '5'),
															('burn mf', '00:03:27 ', '5'),
															('Highway to hell',' 00:03:17' , '6'),
															('Live Wire', '00:06:36' , '6'),
															('Decenni', '00:04:14 ', '7'),
															('Fantaghiro', '00:02:45' , '7'),
															('Милый мой город',' 00:02:58 ', '8'),
															('кольщик',' 00:03:10' , '8');



create table if not exists Collection_Tracks (CT_id SERIAL primary key,
Coll_id int,
Track_id int,
foreign key (Coll_id) references Collection(Coll_id),
foreign key (Track_id) references Track_list (Track_id)
);

insert into Collection_Tracks(Coll_id, Track_id) values (1, 2),
														(1, 3),
														(1, 7),
														(2, 12),
														(2, 10),
														(2, 5),
														(3, 6),
														(3, 7),
														(4, 7),
														(4, 8),
														(4, 9),
														(4, 10),
														(4, 11),
														(5, 13),
														(5, 14),
														(6, 15),
														(6, 16),
														(7, 15),
														(7, 2),
														(7, 16),
														(7, 4),
														(8, 1),
														(8, 2),
														(8, 3),
														(8, 4);

create table if not exists Collection (Coll_id SERIAL primary key,
Name_C VARCHAR (50),
Year_C date
);

insert into Collection(Name_C, Year_C) values   ('Way', '2002-01-01'),
												('Популярное', '2021-01-01'),
												(' Ностальгия', '2002-01-01'),
												('Bodri', '2020-01-01'),
												('Love', '2022-01-01'),
												('Дневной',' 2020-01-01'),
												('ЛучшийШансон',' 2008-01-01'),
												('Хиты2000', '2021-01-01'),
												('Рэпчик', '2002-01-01');















