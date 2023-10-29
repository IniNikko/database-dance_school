create table if not exists information (
	informationId integer primary key,
	name varchar(20) check(length(name) <= 20) not null,
	surname varchar(20) check(length(surname) <= 20) not null,
	middle_name varchar(20) check(length(middle_name) <= 20),
	date_birth date not null,
	age tinyint check(age >= 4) not null
);

create table if not exists choreographer (
	choreographerId integer primary key,
	informationId integer,
	specialization varchar(25) check(length(specialization) <= 25) not null,
	post varchar(25) check(length(post) <= 25) not null,
	place_education varchar(100) check(length(place_education) <= 100) not null,
	foreign key (informationId) references information(informationId) on delete cascade
);

create table if not exists dancer (
	dancerId integer primary key,
	informationId integer,
	place_study_or_work varchar(100) check(length(place_study_or_work) <= 100) not null,
	foreign key (informationId) references information(informationId) on delete cascade
);

create table if not exists transact (
	transactId integer primary key,
	date_trans date not null,
	amount numeric(10,2),
	dancerId integer,
	foreign key (dancerId) references dancer(dancerId) on delete cascade
);

create table if not exists dgroup (
	dgroupId integer primary key,
	name varchar(35) check(length(name) <= 35) not null,
	age varchar(5) check(length(age) <= 5) not null
);

create table if not exists direction (
	directionId integer primary key,
	dirname varchar(20) check(length(dirname) <= 20) not null
);

create table if not exists schedule (
	scheduleId integer primary key,
	date_class date not null,
	start_time time not null,
	end_time time not null
);

create table if not exists music (
	musicId integer primary key,
	author varchar(30) check(length(author) <= 30) not null,
	title varchar(25) check(length(title) <= 25) not null,
	words boolean not null,
	language_music varchar(25) check(length(language_music) <= 25) not null
);

create table if not exists choreography (
	choreographyId integer primary key,
	title varchar(30) check(length(title) <= 30) not null,
	production_date date not null,
	choreographerId integer,
	dgroupId integer,
	directionId integer,
	musicId integer,
	foreign key (choreographerId) references choreographer(choreographerId) on delete cascade,
	foreign key (dgroupId) references dgroup(dgroupId) on delete cascade,
	foreign key (directionId) references direction(directionId) on delete cascade,
	foreign key (musicId) references music(musicId) on delete cascade
);

create table if not exists hall (
	hallId integer primary key,
	number_hall tinyint check(number_hall <= 999) not null,
	size_hall text check(length(size_hall) <= 7) not null,
	presence_morror boolean not null,
	presence_locker_room boolean not null
);

create table if not exists suit (
	suitId integer primary key,
	description varchar(500) check(length(description) <= 500) not null,
	size_suit tinyint check(size_suit < 100) not null,
	quantity integer not null
);


create table if not exists requisite (
	requisiteId integer primary key,
	description varchar(500) check(length(description) <= 500) not null,
	size_requisite text not null
);


create table if not exists performance (
	performanceId integer primary key,
	name varchar(35) check(length(name) <= 35) not null,
	share varchar(15) check(length(share) <= 15) not null,
	choreographyId integer,
	--suitId integer,
	requisiteId integer,
	foreign key (choreographyId) references choreography(choreographyId) on delete cascade,
	--foreign key (suitId) references suit(suitId) on delete cascade,
	foreign key (requisiteId) references requisite(requisiteId) on delete cascade
);


create table if not exists competition (
	competitionId integer primary key,
	title varchar(50) check(length(title) <= 50) not null,
	type_comp varchar(20) check(length(type_comp) <= 20) not null,
	date_comp date not null,
	adress varchar(100) check(length(adress) <= 100) not null
);

create table if not exists dancer_dgroup (
	dancerId integer,
	dgroupId integer,
	primary key (dancerId, dgroupId),
	foreign key (dancerId) references dancer(dancerId) on delete cascade,
	foreign key (dgroupId) references dgroup(dgroupId) on delete cascade
);

create table if not exists dancer_direction (
	dancerId integer,
	directionId integer,
	primary key (dancerId, directionId),
	foreign key (dancerId) references dancer(dancerId) on delete cascade,
	foreign key (directionId) references direction(directionId) on delete cascade
);


create table if not exists dgroup_choreoprapher (
	dgroupId integer,
	choreographerId integer,
	primary key (dgroupId, choreographerId),
	foreign key (dgroupId) references dgroup(dgroupId) on delete cascade,
	foreign key (choreographerId) references choreographer(choreographerId) on delete cascade
);


create table if not exists schedule_choreographer (
	scheduleId integer,
	choreographerId integer,
	primary key (scheduleId, choreographerId),
	foreign key (scheduleId) references schedule(scheduleId) on delete cascade,
	foreign key (choreographerId) references choreographer(choreographerId) on delete cascade
);

create table if not exists dgroup_schedule (
	dgroupId integer,
	scheduleId integer,
	primary key (dgroupId, scheduleId),
	foreign key (dgroupId) references dgroup(dgroupId) on delete cascade,
	foreign key (scheduleId) references schedule(scheduleId) on delete cascade
);

create table if not exists schedule_hall (
	scheduleId integer,
	hallId integer,
	primary key (scheduleId, hallId),
	foreign key (scheduleId) references schedule(scheduleId) on delete cascade,
	foreign key (hallId) references hall(hallId) on delete cascade
);

create table if not exists competition_performance (
	competitionId integer,
	performanceId integer,
	primary key (competitionId, performanceId),
	foreign key (competitionId) references competition(competitionId) on delete cascade,
	foreign key (performanceId) references performance(performanceId) on delete cascade
);

create table if not exists performance_suit (
	performanceId integer,
	suitId integer,
	primary key (performanceId, suitId),
	foreign key (performanceId) references performance(performanceId) on delete cascade,
	foreign key (suitId) references suit(suitId) on delete cascade
);