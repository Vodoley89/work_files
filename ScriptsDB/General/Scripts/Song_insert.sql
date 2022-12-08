

insert into Genre_list(Name_G) values   ('hip-hop'),
										('Alternative'),
										('Rok'),
										('Romantic'),
										('Shanson');
										

insert into Genres_Executers (Executer_id,Genre_id) values 	(1, 11),
															(2, 11),
															(3, 11),
															(4, 12),
															(5, 13),
															(6, 13),
															(7, 14),
															(8, 15);

													
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
														
													
													
insert into Album_list(Name_A, Year_A) values   ('альбомба', '2021-01-01'),
												('атомы сознания', '2002-01-01'),
												('yamakasi', '2020-01-01'),
												('Dominion', '2022-01-01'),
												('F8', '2020-01-01'),
												('Black ice', '2008-01-01'),
												('LA Bussola', '2016-01-01'),
												('Посвящение', '2002-01-01');
												
											
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

													
insert into Collection(Name_C, Year_C) values   ('Way', '2002-01-01'),
												('Популярное', '2021-01-01'),
												(' Ностальгия', '2002-01-01'),
												('Bodri', '2020-01-01'),
												('Love', '2022-01-01'),
												('Дневной',' 2020-01-01'),
												('ЛучшийШансон',' 2008-01-01'),
												('Хиты2000', '2021-01-01'),
												('Рэпчик', '2002-01-01');