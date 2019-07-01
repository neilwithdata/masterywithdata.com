-- Script for masterywithdata.com/blog/with-ties-postgresql
-- Implementing SQL Server's WITH TIES in PostgreSQL

drop table if exists movies;
  
create table movies (
  movie_id bigint primary key,
  title text not null,
  length int not null
);

insert into movies(movie_id, title, length)
values
  (1, 'Adventure Time', 100),
  (2, 'Aladdin', 100),
  (3, 'Brightburn', 120),
  (4, 'The Intruder', 120),
  (5, 'Hellboy', 140),
  (6, 'Anna', 140),
  (7, 'Rocketman', 150),
  (8, 'Midsommar', 100),
  (9, 'Men in Black', 110),
  (10, 'The Secret Life of Pets 2', 140);

-- return all the movies
select *
from movies
order by length desc;
  
-- return the top 3 longest movies (with ties included)
select title, length
from 
  (select
     title,
     length,
     rank() over (order by length desc)
   from movies) as ranked_movies
where rank <= 3
order by length desc;