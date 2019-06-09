-- Script for masterywithdata.com/blog/using-distinct/
-- Demonstrating use of DISTINCT and DISTINCT ON

create table captures (
  camera_id bigint,
  capture_ts timestamptz,
  license text,
  primary key (camera_id, capture_ts, license)
);

insert into captures(camera_id, capture_ts, license)
values
  (1, '2018-12-01 04:05:06+10', 'YLE395'),
  (1, '2018-12-03 12:17:35+10', '374HQR'),
  (2, '2018-12-11 16:01:32+10', '1NC1QD'),
  (3, '2018-12-02 18:55:00+10', 'CC73IQ'),
  (1, '2018-12-10 12:20:10+10', 'VV59JO'),
  (2, '2018-12-07 07:12:06+10', 'AA27IJ'),
  (2, '2018-12-07 03:19:40+10', 'YY17HC'),
  (1, '2018-12-04 22:10:15+10', 'NR422L'),
  (1, '2018-12-02 08:22:13+10', 'YLE395'),
  (3, '2018-12-01 17:01:48+10', '1NC1QD');

-- return all rows
select *
from captures;

-- return unique license plates
select distinct license
from captures;

-- return unique pairs of camera and license plate
select distinct camera_id, license
from captures;

-- return count of unique license plates 
select count(distinct license)
from captures;

-- return for each camera the most recent license plate it captured
select distinct on (camera_id) camera_id, capture_ts, license
from captures
order by camera_id, capture_ts desc;

-- results after removing distinct on
select camera_id, capture_ts, license
from captures
order by camera_id, capture_ts desc;
