-- create new database
create database swimming_school;

-- to switch database
use swimming_school;

-- check current selected database
select DATABASE();


-- create table
-- <name of column> <data type> <options>
create table parents(
    parent_id int unsigned auto_increment primary key,
    first_name varchar(200) not null,
    last_name varchar(200) default ''
) engine = innodb;
-- `engine = innodb` is for FK to work

-- show all tables
show tables;

-- insert
-- insert into <table name> (<column1>, <column2>,...) values (value1, value2)
insert into parents (first_name, last_name) values ("Ah Kow", "Tan");

-- show all rows from a table
select * from parents; 

-- insert multiple
insert into parents (first_name, last_name) values 
    ("Chua Kang", "Phua"),
    ("Ah Teck", "Tan"),
    ("See Mei", "Liang");

-- creating the students table
CREATE TABLE students (
    student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    swimming_level VARCHAR(45),
    date_of_birth DATE
) ENGINE = innodb;

-- Add in a FK
-- step 1: create the column for the foreign key
alter table students add column parent_id int unsigned;
-- step 2: setup the foregin key
alter table students add constraint fk_students_parents 
    foreign key (parent_id) references parents(parent_id);

-- insert in some students
insert into students (name, swimming_level, date_of_birth, parent_id)
 values ('Xiao Kow', 'beginner', '2010-09-10', 4);

 insert into students (name, swimming_level, date_of_birth, parent_id)
 values ('Alien', 'beginner', '2010-09-10', 404);

 -- Update
 update students set swimming_level='intermediate' WHERE student_id=1;

 delete from students WHERE student_id=1;

 alter table students rename column name to first_name;

rename table students to swimming_students;