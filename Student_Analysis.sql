create database CLASSES;
use CLASSES;
select CLASSES;
describe  STUDENT1;
create table STUDENT1( Student_name varchar(20),Student_id int primary key auto_increment,Tamil int,
English int,Maths int,Science int,Social int);
insert into STUDENT1 ( Student_name,Student_id,Tamil,English,Maths,Science,Social) 
values ('Arun',101,85,90,88,92,86),('Priya',102,98,86,90,78,85),
('Divya',103, 89,79,90,88,98),('Kevin',104,78,60,43,34,49),('Rahul',105,55,48,33,25,50);
alter table STUDENT1 add Email varchar(20);
select Student_name,Student_id,Tamil,English,Maths,Science,Social
(Tamil+English+Maths+Science+Social) as Total,case when Tamil>=35 and English>=35 and Maths>=35 and Science>=35 and Social>=35
Then 'Pass' Else 'Fail' End as Result From STUDENT1 order by Total Desc;
select Student_name, Student_id,Tamil,English,Maths,Science,Social,(Tamil+English+Maths+Science+Social)
as Total,'Fail' as Result from STUDENT1 where Tamil<=35 or English<=35 or Maths<=35
or Sciecne<=35 or Social<=35;
Select Student_name,Student_id,Tamil,English,Maths,Science,Social,
(Tamil+English+Maths+Science+Social) as Total,
Round ((Tamil+English+Maths+Science+Social)/5,2) as Percentage,
case 
 when Tamil>=35 and English>=35 and Maths>=35 and Science>=35 and Social>=35
 then
Rank() over(order by case 
 when Tamil>=35 and English>=35 and Maths>=35 and Science>=35 and Social>=35
 then (Tamil+English+Maths+Science+Social) else null end desc) else null end as Student_rank,
case when Tamil>=35 and English>=35 and Maths>=35 and Science>=35 and Social>=35
Then 'Pass' Else 'Fail' End as Result
from STUDENT1 order by Total desc;
select 
case
when Tamil >= 35 and English >= 35 and Maths >= 35 and Science >= 35 and Social >= 35
then 'Pass' else 'Fail' end as Result,
count(*) as Student_Count, avg(Tamil + English + Maths + Science + Social) as Average_Total,
max(Tamil + English + Maths + Science + Social) as Highest_Total,
min(Tamil + English + Maths + Science + Social) as Lowest_Total
from STUDENT1 group by Result
having count(*) >= 2;
select * from STUDENT1 
where not Student_name ='Arun';






