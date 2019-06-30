create table departments (
  dept_id bigint generated always as identity primary key,
  description text
);

insert into departments(description)
values
  ('Accounting'),
  ('Finance'),
  ('Research and Development'),
  ('Marketing'),
  ('Sales');

select *
from departments;

create table employees (
  employee_id bigint generated always as identity primary key,
  dept_id bigint references departments (dept_id),
  first_name text,
  last_name text
);

insert into employees(dept_id, first_name, last_name)
values
  (1, 'John', 'Smith'),
  (4, 'Peter', 'Maybank'),
  (5, 'Samantha', 'Savoy'),
  (2, 'Evan', 'Baxter'),
  (3, 'Kamila', 'Erdos');

select *
from employees;

-- inner join with USING
select *
from employees as e
  inner join departments as d using (dept_id);

-- inner join with ON
select *
from employees as e
  inner join departments as d
    on e.dept_id = d.dept_id;


