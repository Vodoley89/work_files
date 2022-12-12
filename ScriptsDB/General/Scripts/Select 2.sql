--количество исполнителей в каждом жанре;
select  album_id, count(track_id)  from track_list tl  
group by album_id 
order by count(track_id) desc; 

--количество треков, вошедших в альбомы 2019-2020 годов;


select year_a, name_t
from album_list al 
join track_list tl 
on tl.album_id = al.album_id 
where al.year_a = 2019 or al.year_a =2020;

--средняя продолжительность треков по каждому альбому;
select album_id, avg(duration)  from track_list tl 
group by album_id 
order by avg(duration)  ;

--все исполнители, которые не выпустили альбомы в 2020 году;
select nickname, year_a from album_exct ae 
join executer e 
on e.executer_id = ae.executer_id 
join album_list al 
on al.album_id = ae.album_id 
where year_a != 2020;

--названия сборников, в которых присутствует конкретный исполнитель (выберите сами);
select name_c, nickname from collection c 
join collection_tracks ct 
on c.coll_id = ct.coll_id 
join track_list tl 
on ct.track_id = tl.track_id 
join album_list al 
on al.album_id = tl.album_id 
join album_exct ae 
on al.album_id = ae.album_id 
join executer e 
on e.executer_id = ae.executer_id 
where nickname = 'Miyagi';

--название альбомов, в которых присутствуют исполнители более 1 жанра;
select name_a,  nickname, count(*)  from genre_list gl 
join genres_executers ge 
on gl.genre_id = ge.genre_id 
join executer e 
on ge.executer_id = e.executer_id 
join album_exct ae 
on e.executer_id = ae.executer_id 
join album_list al 
on ae.album_id = al.album_id 
group by  name_a,  nickname
order by   count(*) desc;


--наименование треков, которые не входят в сборники;
select name_t, name_c from track_list tl 
left join collection_tracks ct 
on tl.track_id  = ct.track_id
left join collection c 
on c.coll_id = ct.coll_id
group by   name_c,name_t ;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select nickname, min(duration) from executer e 
join album_exct ae   
on e.executer_id  =  ae.executer_id 
join album_list al  
on al.album_id = ae.album_id 
join track_list tl 
on tl.album_id  = al.album_id 
group by nickname 
order by min(duration); 


--название альбомов, содержащих наименьшее количество треков.
select name_a, count(*) from album_list al  
join track_list tl 
on tl.album_id  = al.album_id
group by name_a
order by  count(*);

 











