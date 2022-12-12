select  name_a, year_a from album_list 
where year_a = 2018;

select max ( duration) from track_list 
;



select name_t,  duration from track_list
where  duration <= 210;

select  name_a, year_a from album_list 
where year_a >= 2018 and year_a <= 2020;
 
select nickname from executer sdat_name 
where nickname not like '% %';

select name_t from track_list
where  name_t like'%мой%' or name_t like'%my%';



