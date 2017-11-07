CREATE DATABASE IF NOT EXISTS cinesocial;
USE cinesocial;

CREATE TABLE user(

	id	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name VARCHAR(50),
	avatar_path VARCHAR(150),
	email VARCHAR(100) UNIQUE NOT NULL,
	password CHAR(30) NOT NULL,
	date_birthday	DATETIME

)ENGINE=INNODB;

CREATE TABLE mypost(
	id	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	title	VARCHAR(120),
	description TEXT,
	create_At DATETIME,
	user_id INT(255) NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(id)

)ENGINE=INNODB;


CREATE TABLE mypost_album(

	id 	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	user_id INT(255) NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(id)

)ENGINE=INNODB;

CREATE TABLE mypost_image(
	
	id INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	image_path VARCHAR(255),
	image_title VARCHAR(255),
	post_id INT(255) NOT NULL,
	create_At DATETIME,
	post_album_id INT(255) NOT NULL,
	FOREIGN KEY(post_id) REFERENCES mypost(id),
	FOREIGN KEY(post_album_id) REFERENCES mypost_album(id)

)ENGINE=INNODB;

CREATE TABLE mypost_video(
	
	id INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	video_path VARCHAR(255),
	video_title VARCHAR(255),
	post_id INT(255) NOT NULL,
	create_At DATETIME,
	FOREIGN KEY(post_id) REFERENCES mypost(id)

)ENGINE=INNODB;

CREATE TABLE category_post(

	id 	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name	VARCHAR(255),
	post_id INT(255) NOT NULL,
	create_At DATETIME,
	FOREIGN KEY(post_id) REFERENCES mypost(id)

)ENGINE=INNODB;


CREATE TABLE movies(

	id 	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	title		VARCHAR(255),
	description text,
	time_duration		VARCHAR(100),
	create_year 	DATETIME,
	create_At		DATETIME,
	status	TINYINT(1) DEFAULT 1	

)ENGINE=INNODB;


CREATE TABLE movies_image(

	id	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	image_path VARCHAR(255),
	image_title VARCHAR(255),
	movie_id	INT(255) NOT NULL,
	create_At DATETIME,
	FOREIGN KEY(movie_id) REFERENCES movies(id)

)ENGINE=INNODB;


CREATE TABLE movies_cover(
	
	id		INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	cover_path		VARCHAR(255),
	cover_title		VARCHAR(255),
	movie_id		INT(255) NOT NULL,
	create_At		DATETIME,
	FOREIGN KEY(movie_id) REFERENCES movies(id)
	

)ENGINE=INNODB;

CREATE TABLE gender(

	id		INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	title		VARCHAR(255),
	movie_id		INT(255) NOT NULL,
	FOREIGN KEY(movie_id)	REFERENCES movies(id)

)ENGINE=INNODB;

CREATE TABLE producer(

	id		INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name	VARCHAR(255),
	movie_id	INT(255) NOT NULL,
	FOREIGN KEY(movie_id)	REFERENCES movies(id)

)ENGINE=INNODB;


CREATE TABLE actor(

	id	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name 		VARCHAR(255),
	movie_id	INT(255) NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movies(id)
	

)ENGINE=INNODB;


CREATE TABLE nationality(

	id 		INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	title 	VARCHAR(50),
	actor_id		INT(255) NOT NULL,
	movie_id		INT(255) NOT NULL,
	user_id		INT(255) NOT NULL,
	FOREIGN KEY(user_id) REFERENCES user(id),
	FOREIGN KEY(movie_id) REFERENCES movies(id),
	FOREIGN KEY(actor_id) REFERENCES actor(id)

)ENGINE=INNODB;

CREATE TABLE flag(

	id		INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	img_path 		VARCHAR(255),
	nationality_id 	INT(255) NOT NULL,
	FOREIGN KEY(nationality_id) REFERENCES nationality(id)
	
)ENGINE=INNODB;


CREATE TABLE likes(

	id		INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	author	VARCHAR(255),
	score		VARCHAR(255),
	user_id		INT(255) NOT NULL,
	movie_id 	INT(255)	NOT NULL,
  create_At DATETIME,
	FOREIGN KEY(user_id) REFERENCES user(id),
	FOREIGN KEY(movie_id)	REFERENCES movies(id)

)ENGINE=INNODB;


CREATE TABLE comments(
	id	INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	author CHAR(50),
	comment	text,
	create_At DATETIME,
	user_id	INT(255) NOT NULL,
	movie_id	INT(255)	NOT NULL,
	FOREIGN KEY(user_id)	REFERENCES user(id),
	FOREIGN KEY(movie_id)	REFERENCES movies(id)

)ENGINE=INNODB;

CREATE TABLE category_movie(
	id INT(255) AUTO_INCREMENT NOT NULL PRIMARY KEY,
	name CHAR(50) UNIQUE NOT NULL,
	movie_id INT(255) NOT NULL,
	FOREIGN KEY(movie_id) REFERENCES movies(id)

)ENGINE=INNODB;
