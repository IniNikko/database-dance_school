select (select name from information i limit 1) as 'i am';

select * from information i 
where age = (select max(age) from information);

select * from information i 
where age = (select min(age) from information);

select * from information i 
where informationId  in (select informationId from dancer);

select * from information i 
where informationId  in (select informationId from choreographer c);

select i.name , i.surname , i.date_birth , i.age , d.place_study_or_work from information i 
inner join dancer d 
on i.informationId = d.informationId ;

select description , sum(quantity) as general_count  from suit 
group by description 
order by general_count asc;

select * from hall;
select count(number_hall), presence_locker_room from hall h 
group by presence_locker_room ;

from schedule s
inner join dgroup_schedule ds 
on	
	s.scheduleId = ds.scheduleId
inner join dgroup d 
on
	d.dgroupId = ds.dgroupId ;

select * from hall;

select h.number_hall  from hall h 
where h.presence_morror == h.presence_locker_room and h.presence_morror == true;

select * from information i 
where instr(i.date_birth , '2004');

select lower(name) as name, LENGTH(name) as l_name from information i 
where l_name != 5;


select * from choreography c 
right join performance p
on
	c.choreographyId = p.choreographyId ;

select description , size_suit , sum(quantity ) 
over (partition by description order by size_suit) as 'sdfg' from suit;

select description , sum(quantity) as 'sum' from suit s 
group by description 
having  sum > 9;

with I as (select name, surname from information where age > 19)
select I.name from I;



