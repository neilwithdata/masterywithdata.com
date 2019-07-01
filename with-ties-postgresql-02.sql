-- Script for masterywithdata.com/blog/with-ties-postgresql
-- WITH TIES as used in SQL Server

drop table if exists movies;
  
create table movies (
  movie_id bigint primary key,
  title varchar(max) not null,
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
select top (3) with ties title, length
from movies
order by length desc;