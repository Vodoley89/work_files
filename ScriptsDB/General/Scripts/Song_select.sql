название и год выхода альбомов, вышедших в 2018 году;
название и продолжительность самого длительного трека;
название треков, продолжительность которых не менее 3,5 минуты;
названия сборников, вышедших в период с 2018 по 2020 год включительно;
исполнители, чье имя состоит из 1 слова;
название треков, которые содержат слово "мой"/"my".


select  name_a, year_a from album_list 
where year_a = '2018-01-01';

select name_t,  duration from track_list
where  duration >= '00:06:00';

select name_t,  duration from track_list
where  duration <= '00:03:30';

select  name_a, year_a from album_list 
where year_a >= '2018-01-01' and year_a <= '2020-01-01';
 
select nickname from executer sdat_name 
where nickname not like '% %';

select name_t from track_list
where  name_t like'%мой%' or name_t like '%my%';