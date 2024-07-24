/*CASE STUDY - 1*/

select * from `loananalysis-278.school. student`;

#list all 2A students
select name
from `loananalysis-278.school. student`
where class = "2A";

#list the names and math test scores of 1B boys
select name,mtest
from `loananalysis-278.school. student`
where class = "1B" and sex = "M";

#list the classes , names of students whose names contain e as third letter
select class,name
from `loananalysis-278.school. student`
where name like "__e%";

#List the classes, names of students whose names start with "T" and do not contain "y".
select class,name
from `loananalysis-278.school. student`
where name like "T%" and name not like "%y%";

#List the names of 1A students whose Math test score is not 51, 61, 71, 81, or 91.
select name
from `loananalysis-278.school. student`
where class = "1A" and mtest not in (51,61,71,81,91);

#List the students who were born between 22 March 1986 and 21 April 1986
select name,dob
from `loananalysis-278.school. student`
where dob between "1986-03-22" and "1986-04-21";

#Find the number of girls living in TST.
select count(*) AS Num_of_girls_in_TST
from `loananalysis-278.school. student`
where sex = "F" and dcode = "TST";

#List the number of pass in the Math test of each class. (passing mark = 50)
select class,count(*) as num_of_passed_students
from `loananalysis-278.school. student`
where mtest >= 50
group by class
order by class;

#List the number of girls grouped by each class
select class,count(*) as No_of_girls
from `loananalysis-278.school. student`
where sex = "F"
group by class order by count(*) desc;

# List the number of girls grouped by the year of birth.
select extract(year from dob) as Year,count(*) as No_girls
from `loananalysis-278.school. student`
where sex = "F"
group by year
order by year;

# Find the average age of Form 1 boys.
select avg(date_diff(current_date(),dob,Year)) as Avg_Boys_Age
from `loananalysis-278.school. student`
where class like "1%" and sex = "M";

# Find the average mark of mtest for each class.
select class,avg(mtest) as Avg_mtest_scr
from `loananalysis-278.school. student`
group by class
order by Avg_mtest_scr desc;

# Find the maximum mark of mtest for each sex.
select sex,max(mtest) as max_marks_mtest
from `loananalysis-278.school. student`
group by sex;

# Find the average mark of mtest for all students.
select avg(mtest) as Avg_Mtest_Mark
from `loananalysis-278.school. student`;

#List the students who are common members of the Physics Club and the Chemistry Club.
select *
from `loananalysis-278.school.phy`
where id in (select id
from `loananalysis-278.school.chem`);

/*List the students who are common members of the Chemistry Club and Biology Club but not of
the Physics Club*/
select *
from `loananalysis-278.school.chem`
where id in (select id
from `loananalysis-278.school.bio`
where id not in (select id
from `loananalysis-278.school.phy`));

#Produce a list of parts in ascending
select *
from `loananalysis-278.school.client`
order by qty asc;

#Produce a list of parts that consist of the keyword ‘Shaft’ in the description.
select *
from `loananalysis-278.school.client`
where descript like "%Shaft%";

/* Produce a list of parts that have a quantity more than 20 and are supplied by ‘China Metals Co.*/
select *
from `loananalysis-278.school.client`
where Supplier = "China Metals Co." and qty > 20;

#List all the suppliers without duplication.
select distinct supplier
from `loananalysis-278.school.client`;

#Increase the quantity by 10 for those parts with quantity less than 10.
update `loananalysis-278.school.client`
set qty = qty + 10
where qty < 10;

# Delete records with part_no equal to 879, 654, 231 and 234
delete from `loananalysis-278.school.client`
where part_no in (879,654,231,234);

#Add a field “Date_purchase” to record the date of purchase.
alter table `loananalysis-278.school.client`
add column Date_purchase date;



















