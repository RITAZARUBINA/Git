create database if not exists employees;
Use employees;
create table if not exists employee (
id int unsigned not null auto_increment primary key,
first_name varchar(30) not null,
second_name varchar(30) not null,
position_ varchar(30) not null,
salary int not null
);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Alina","Knyazeva","Junior",25000);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Michail","Kulagin","Junior",25000);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Konstantin","Belozerov","Junior",30000);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Alisa","Nosova","Junior",30000);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Ksenia","Soboleva","Middle",50000);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Artyom","Gorbunov","Middle",55000);
insert into employee (id, first_name, second_name, position_ ,salary) values (null, "Andrey","Lopatuk","Senior",75000);

SELECT * FROM employees.employee where salary<30000;
SELECT * FROM employees.employee where position_="Senior" and salary<30000;

create table if not exists mapping_boss (
boss_id int unsigned not null ,
subordinate_id int unsigned not null ,
FOREIGN KEY (boss_id)  REFERENCES employee (id),
FOREIGN KEY (subordinate_id)  REFERENCES employee (id)
);


insert into mapping_boss (boss_id, subordinate_id) values (7,5);
insert into mapping_boss (boss_id, subordinate_id) values (7,6);
insert into mapping_boss (boss_id, subordinate_id) values (5,4);
insert into mapping_boss (boss_id, subordinate_id) values (6,4);

select * from mapping_boss where boss_id in (select id from employee where second_name="Lopatuk");

select b.subordinate_id, e.first_name, e.second_name, e.position_ from  mapping_boss b join employee e  on b.subordinate_id=e.id where boss_id in (select id from employee where second_name="Lopatuk");