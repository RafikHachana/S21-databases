CREATE TABLE IF NOT EXISTS movie (
	id serial PRIMARY KEY,
	title varchar(50) not null, 
	year int not null,
	length int not null,
	plot_outline varchar(512) not null
);
CREATE TABLE IF NOT EXISTS genre (
	name varchar(50) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS movie_genre(
	movie_id int not null,
	genre varchar(50) not null,
	PRIMARY KEY(movie_id, genre),
	FOREIGN KEY(movie_id) references movie(id),
	foreign key(genre) references genre(name)
);

CREATE TABLE IF NOT EXISTS person(
	id serial primary key, 
	name varchar(50) not null,
	birth_year int,
	birth_month int,
	birth_day int
);

CREATE TABLE IF NOT EXISTS appeared_in(
	person_id int not null,
	movie_id int not null,
	primary key(person_id,movie_id),
	foreign key(person_id) references person(id),
	foreign key(movie_id) references movie(id)
);

CREATE TABLE IF NOT EXISTS directed(
	person_id int not null,
	movie_id int not null,
	primary key(person_id,movie_id),
	foreign key(person_id) references person(id),
	foreign key(movie_id) references movie(id)
);

CREATE TABLE IF NOT EXISTS quote(
	person_id int not null,
	movie_id int not null,
	text varchar(255) not null,
	primary key(person_id,movie_id,text),
	foreign key(person_id) references person(id),
	foreign key(movie_id) references movie(id)
);

CREATE TABLE IF NOT EXISTS company(
	name varchar(255) primary key unique not null,
	address varchar(255) not null
);

CREATE TABLE IF NOT EXISTS produced(
	company_name varchar(255) not null,
	movie_id int not null,
	primary key(company_name,movie_id),
	foreign key(company_name) references company(name),
	foreign key(movie_id) references movie(id)
);
