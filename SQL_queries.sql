pragma table_info('information');
select "hello sqlite!)";
select * from information;
select name, surname from information i;
select name, surname, date_birth as db from information i ;
select name, surname, date_birth db from information i ;
select "hello world! \n i am irina" as hello;
select 11 / 5;
select '' == NULL ;

update information
set age = 18
where age = 17;

select * from information i ;

select * from suit;
update suit 
set quantity = quantity - 5
where description = 't-shirts';

select informationId , name, surname, middle_name 'm_name', age from information i 
where age >= 19
order by age desc;

pragma table_info('dancer');
pragma table_info('information');

select i.name , i.surname , i.date_birth , i.age , d.place_study_or_work from information i 
inner join dancer d 
on i.informationId = d.informationId ;

select description , sum(quantity) as general_count  from suit 
group by description 
order by general_count asc;

select * from hall;
select count(number_hall), presence_locker_room from hall h 
group by presence_locker_room ;


delete from suit 
where suitid = 11;
insert into suit(description, size_suit, quantity)
values
	('t-shirts', 48, 8);
select * from suit;

select i.name , i.surname , i.date_birth , i.age , c.specialization , c.post , c.place_education 
from choreographer c 
left join information i 
on c.informationId = i.informationId ;

select s.size_suit , count(suitId) from suit s
group by size_suit ;


select s.* , d.name , d.age
from schedule s
inner join dgroup_schedule ds 
on	
	s.scheduleId = ds.scheduleId
inner join dgroup d 
on
	d.dgroupId = ds.dgroupId ;


select p.name , c.title , c.production_date
from choreography c 
right join performance p 
on 
	p.choreographyId = c.choreographyId ;

select avg(quantity) as avg_q from suit
group by description 
order by avg_q asc;




