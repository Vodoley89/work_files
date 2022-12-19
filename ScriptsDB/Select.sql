select  name_a, year_a from album_list 
where year_a = 2018;

select max(duration), name_t   from track_list
group by name_t 
order by max(duration) desc ;


select name_t,  duration from track_list
where  duration <= 210;

select  name_a, year_a from album_list 
where year_a between 2018 and 2020;
 
select nickname from executer sdat_name 
where nickname not like '% %';

select name_t from track_list
where  name_t ilike'%Мой%' or name_t ilike  '%my%';



