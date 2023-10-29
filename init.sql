pragma table_info ('information');
insert into information(name, surname, middle_name, date_birth, age)
values
	('Irina', 'Shulyak', 'Nikolaevna', '2004-05-14', 19),
	('Alina', 'Bybko', 'Andreevna', '2004-01-14', 19),
	('Pavel', 'Abramovich', 'Nikolaevich', '2004-05-10', 19),
	('Artem', 'Talai', 'Aleksandrovich', '2006-02-24', 17),
	('Dima', 'Kosach', 'Anatolievich', '2004-05-28', 20),
	('Alexandra', 'Galai', 'Dmitrievna', '1999-09-18', 24);
	
select * from information;


pragma table_info ('dancer');
insert into dancer(informationId, place_study_or_work)
values
	(2, 'BSUIR'),
	(4, 'Gymnasium №2 in Minsk'),
	(3, 'BSUIR'),
	(5, 'Gymnasium №6 in Minsk');

pragma table_info ('choreographer');
insert into choreographer (informationId, specialization, post, place_education)
values
	(1, 'choreographer-director', 'choreographer', 'Minsk State College of Arts'),
	(6, 'ballet master', 'ballet master', 'Minsk State College of Arts');

pragma table_info('transact');
insert into transact (date_trans, amount, dancerId)
values
	('2023-10-24', '390', 1),
	('2023-10-23', '180', 2),
	('2023-10-21', '180', 3),
	('2023-10-25', '200', 4);

pragma table_info('direction');
insert into direction (dirname)
values 
	('contemporary'),
	('hip hop'),
	('break dancing'),
	('jazz-funk'),
	('strip');

pragma table_info('dgroup');
insert into dgroup(name, age)
values
	('contemp_for_beginners', '17-19'),
	('hip_hop_for_beginners', '17-23');
	
select * from dgroup;

pragma table_info('schedule');
insert into schedule(date_class, start_time, end_time)
values
	('2023-10-18', '19:00:00', '22:00:00'),
	('2023-10-25', '19:00:00', '22:00:00'),
	('2023-10-20', '18:00:00', '21:00:00'),
	('2023-10-27', '18:00:00', '21:00:00');

select * from schedule;

pragma table_info('hall');
insert into hall(number_hall, size_hall, presence_morror, presence_locker_room)
values
	(301, '12*10', true, false),
	(302, '5*5', true, false),
	(303, '15*12', true, true),
	(401, '9*12', true, true),
	(402, '12*15', true, true),
	(403, '11*12', false, true);

select * from hall;

pragma table_info('music');
insert into music(author, title, words, language_music)
values
	('Hoenix', 'Dea Mons', false, 'english'),
	('Elias', 'My Hope', true, 'english'),
	('Gabriel Saban', 'No Tomorrow', false, 'english'),
	('Drummatix', 'Баллада', true, 'belarusian'),
	('Jun Miyake', 'Integral Silence', true, 'english');

select * from music;
select * from schedule;
select * from choreographer c ;
select* from dgroup d ;
SELECT * from direction d ;
select* from music;

pragma table_info('choreography');
insert into choreography(title, production_date, choreographerId, dgroupId, directionId, musicId)
values
	('crystal', '2023-10-18', 1, 1, 1, 3),
	('death of the sea', '2023-10-20', 2, 2, 2, 1);

select* from choreography c ;

pragma table_info('suit');
insert into suit(description, size_suit, quantity)
values
	('black dresses', 42, 4),
	('black dresses', 44, 3),
	('black dresses', 46, 3),
	('white shorts', 44, 1),
	('black shorts', 44, 1),
	('beige pants', 48, 1),
	('beige pants', 46, 2),
	('t-shirts', 42, 6),
	('t-shirts', 44, 7),
	('t-shirts', 46, 9),
	('t-shirts', 48, 8);

select * from suit;

pragma table_info('requisite');
insert into requisite (description, size_requisite)
values
	('wardrobe', '2*1.5'),
	('hanger', '0.2*0.43'),
	('chair', '0.84*0.51*0.54'),
	('cube', '1*1*1');

select* from requisite r ;

pragma table_info('performance');
insert into performance (name, share, choreographyId, requisiteId)
values
	('Crystal moments', 'duet', 1, 3),
	('Death of the seas', 'duet', 2, null);
SELECT * from performance p ;
DELETE FROM performance ;

pragma table_info('competition');
insert into competition (title, type_comp, date_comp, adress)
values
	('Red cat', 'republican', '2023-10-29', 'Independence Ave., 25');
SELECT * from competition c ;


select * from dancer;
select * from direction;
pragma table_info('dancer_direction');
insert into dancer_direction 
values
	(1,1),
	(2,2),
	(3,1),
	(3,2),
	(4,2);
SELECT * FROM dancer_direction dd ;


SELECT * FROM dancer d ;
SELECT * FROM dgroup d ;
PRAGMA table_info('dancer_dgroup');
insert into dancer_dgroup 
values
	(1, 1),
	(2, 2),
	(3, 1),
	(3, 2),
	(4, 2);
SELECT * from dancer_dgroup dd ;


SELECT * FROM choreographer c  ;
SELECT * FROM dgroup d ;
PRAGMA table_info('dgroup_choreoprapher');
insert into dgroup_choreoprapher 
values
	(1, 1),
	(2, 2);
SELECT * from dgroup_choreoprapher dc ;


SELECT * FROM schedule ;
SELECT * FROM choreographer c ;
PRAGMA table_info('schedule_choreographer');
insert into schedule_choreographer 
values
	(1, 1),
	(2, 1),
	(3, 2),
	(4, 2);
SELECT * from schedule_choreographer sc ;


SELECT * FROM dgroup ;
SELECT * FROM schedule s  ;
PRAGMA table_info('dgroup_schedule');
insert into dgroup_schedule 
values
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4);
SELECT * from dgroup_schedule sc ;


SELECT * FROM hall ;
SELECT * FROM schedule s  ;
PRAGMA table_info('schedule_hall');
insert into schedule_hall 
values
	(1, 1),
	(2, 4),
	(3, 2),
	(4, 3);
SELECT * from schedule_hall ;


SELECT * FROM competition;
SELECT * FROM performance ;
PRAGMA table_info('competition_performance');
insert into competition_performance 
values
	(1, 1),
	(1, 2);
SELECT * from competition_performance ;


SELECT * FROM performance;
SELECT * FROM suit ;
PRAGMA table_info('performance_suit');
insert into performance_suit 
values
	(1, 4),
	(1, 5),
	(1, 8),
	(1, 9),
	(2, 7),
	(2, 8),
	(2, 10),
	(2, 11);
SELECT * from performance_suit ;
