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
select nickname, year_a from executer e 
join album_exct ae using (executer_id)
join album_list al using (album_id)
where executer_id  not in
(select executer_id  from album_exct ae 
						join album_list al using (album_id)						 
						where al.year_a = 2020);


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
select name_a,  nickname , count(*)   from genre_list gl 
join genres_executers ge 
on gl.genre_id = ge.genre_id 
join executer e 
on ge.executer_id = e.executer_id 
join album_exct ae 
on e.executer_id = ae.executer_id 
join album_list al 
on ae.album_id = al.album_id
group by   name_a,  nickname   
having count(*)>=2 
;


--наименование треков, которые не входят в сборники;
select name_t, name_c from track_list tl 
left join collection_tracks ct using (track_id)
left join collection c using (coll_id)
where name_c is null ;


--исполнителя(-ей), написавшего самый короткий по продолжительности трек (теоретически таких треков может быть несколько);
select  min(duration), nickname  from executer e 
join album_exct ae   
on e.executer_id  =  ae.executer_id 
join album_list al  
on al.album_id = ae.album_id 
join track_list tl 
on tl.album_id  = al.album_id 
where duration  =  ( select min(duration) from track_list tl)
group by nickname ;


--название альбомов, содержащих наименьшее количество треков.
select   count(track_id) as ct  from track_list tl 
join album_list al  using (album_id)
group by name_a, name_t 
order by ct
limit 1;

select name_a, count(track_id) from album_list al 
join track_list tl using (album_id)
group by name_a
having count(track_id) <= (select   count(track_id) as ct  from track_list tl 
				join album_list al  using (album_id)
				group by name_a, name_t 
				order by ct
				limit 1);		


 











