

insert into Genre_list(Name_G) values   ('hip-hop'),
										('Alternative'),
										('Rok'),
										('Romantic'),
										('Shanson');

--Добавлено	12.12.22								
insert into genre_list (Name_g) values ('Регги-поп');  

insert into Genres_Executers (Executer_id,Genre_id) values 	(1, 6),
															(2, 6),
															(3, 6),
															(4, 7),
															(5, 8),
															(6, 8),
															(7, 9),
															(8, 10);

--Добавлено	12.12.22													
insert into Genres_Executers (Executer_id,Genre_id) values 	(3, 11);  

													
insert into Executer(Nickname) values   ('Каста'),
										('Многоточие'),
										('Miyagi'),
										('Skillet'),
										('FFDP'),
										('ACDC'),
										('Amedeo Minghi'),
										('М.Круг');
										

insert into Album_Exct(Album_id, Executer_id) values 	(1,1),
														(2,2),														
														(3,3),														
														(4,4),
														(5,5),														
														(6,6),
														(7,7),														
														(8,8);
														
insert into Album_Exct(Album_id, Executer_id) values 	(9,5);
													
													
insert into Album_list(Name_A, Year_A) values   ('альбомба', 2021),
												('атомы сознания', 2002),
												('yamakasi', 2020),
												('Dominion', 2022),
												('F8', 2020),
												('Black ice', 2008),
												('LA Bussola', 2016),
												('Посвящение', 2002);
											
insert into Album_list(Name_A, Year_A) values   ('Lift me up', 2013);
												
											
insert into Track_list(Name_T,Duration , Album_id) values   ('Встреча', 149 , 1),
															('я сам', 130 , 1),
															('Жизнь и свобода', 121 , 2),
															('Москва', 240, 2),
															('Captain', 201, 3),
															('intro',90, 3),
															('Hero', 184 , 4),
															('stars',207, 4),
															('mine',243 , 5),
															('burn mf',197 , 5),
															('Highway to hell',190 , 6),
															('Live Wire', 382, 6),
															('Decenni', 248, 7),
															('Милый мой город',155, 8),
															('кольщик',186 , 8);

insert into Track_list( Album_id) values (9);

														
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
														(6, 15),
														(6, 16),
														(7, 15),
														(7, 2),
														(7, 16),
														(7, 4),
														(8, 2),
														(8, 3),
														(8, 4);

													
													
insert into Collection(Name_C, Year_C) values   ('Way', 2002),
												('Популярное', 2021),
												(' Ностальгия', 2002),
												('Bodri', 2020),
												('Love', 2022),
												('Дневной', 2020),
												('ЛучшийШансон', 2008),
												('Хиты2000', 2021),
												('Рэпчик', 2002);