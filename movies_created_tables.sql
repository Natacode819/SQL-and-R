use movie;

DROP TABLE IF EXISTS users_movies;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Movies;

CREATE TABLE Users (
  userid VARCHAR(20) PRIMARY KEY,
  username VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  date_of_birth DATE,
  gender VARCHAR(10),
  status VARCHAR(50) DEFAULT 'active',    -- Status like 'active', 'banned', etc.
  created_at DATE
);

INSERT INTO Users (userid, username, email, password, date_of_birth, gender, created_at)
VALUES ( 'uid1', 'Oksana', 'oksanamovie@gmail.com', 'LikeMovies55', '1975-06-17', 
'female', '2022-11-18');

INSERT INTO Users (userid, username, email, password, date_of_birth, gender, created_at)
VALUES ( 'uid2', 'John', 'John7345@gmail.com', 'MTRdcf$88', '1991-09-25', 
'male', '2021-12-11');

INSERT INTO Users (userid, username, email, password, date_of_birth, gender, created_at)
VALUES ( 'uid3', 'Susan', 'LSusan@gmail.com', 'Gir89tree', '1979-08-02', 
'female', '2019-04-15');

INSERT INTO Users (userid, username, email, password, date_of_birth, gender, created_at)
VALUES ( 'uid4', 'Igor', 'Igor_pal@gmail.com', 'CrTfkjg%0908', '1971-02-24', 
'male', '2023-03-21');

INSERT INTO Users (userid, username, email, password, date_of_birth, gender, created_at)
VALUES ( 'uid5', 'Irma', 'Irma908@gmail.com', 'SelUniNYC$12', '1983-05-01', 
'female', '2022-08-14');

select * from users;

CREATE TABLE Movies (
  movieid VARCHAR(20) PRIMARY KEY,  
  title VARCHAR(255) NOT NULL,
  release_year INT,
  director VARCHAR(255),
  duration INT,                            -- Duration in minutes
  description TEXT,                        -- Movie synopsis
  language VARCHAR(50),
  created_at DATE   -- Date when the movie is added
);

INSERT INTO movies (movieid, title, release_year, director, duration, description, language, created_at)
VALUES ('mid1','The Matrix', 1999, 'Lana Wachowski', 120,
'The Martix is an action, science fiction film about a computer hacker who discovers that his life is a lie', 'English', '1999-05-11');

INSERT INTO movies (movieid, title, release_year, director, duration, description, language, created_at)
VALUES ('mid2','The Terminator', 1984, 'James Cameron', 120,
'The movie focuses on a post-apocalyptic war between a synthetic intelligence and a surviving resistance of humans', 'English', '1984-01-21');

INSERT INTO movies (movieid, title, release_year, director, duration, description, language, created_at)
VALUES ('mid3','The Originals', 2013, 'Julie Plec', 3680,
'The family of power-hungry thousand-year-old vampires look to take back the city that they built', 'English', '2013-10-03');

INSERT INTO movies (movieid, title, release_year, director, duration, description, language, created_at)
VALUES ('mid4','Game of Thrones', 2011, 'Alan Taylor', 2920,
'Game of Thrones is an HBO series that follows the story of several noble families fighting for control of the Iron Throne in the fictional Seven Kindoms of Westeros', 'English', '2011-04-17');

INSERT INTO movies (movieid, title, release_year, director, duration, description, language, created_at)
VALUES ('mid5','Hunnibal', 2015, 'Adam Kane', 1560,
'In NBC hour-long drama, Will Graham is a professor and FBI criminal profiler who is drawn into a professional association with a man who is secretly a monster', 'English', '2015-08-29');

select * from movies;

CREATE TABLE users_movies (
  userid VARCHAR(20),
  movieid VARCHAR(20),
  watch_date DATE,
  rating DECIMAL(2,1),                      -- Allows one decimal place (e.g., 4.5)
  review TEXT,
  watch_time DATETIME,
  favorite BIT DEFAULT 0,
  PRIMARY KEY (userid, movieid),
  FOREIGN KEY (userid) REFERENCES Users (userid) ON DELETE CASCADE, 
  FOREIGN KEY (movieid) REFERENCES movies (movieid) ON DELETE CASCADE,
  CONSTRAINT chk_rating CHECK (rating BETWEEN 1.0 AND 5.0)  -- Ensures rating is between 1 and 5
);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid1', 'mid1', '2023-10-18', '4', 'Great movie', '2023-10-18 20:15:00', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid1', 'mid2', '2024-05-01', '3', 'It is Ok, but old movie', '2024-05-01 15:30:00', 0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid1', 'mid3', '2023-12-15', '2', 'It is childish movie', '2023-12-15 20:18:05', 0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid1', 'mid4', '2024-10-04', '5', 'It is interesting one', '2024-10-04 21:22:45', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid1', 'mid5', '2022-07-03', '5', 'It is exciting and scary', '2022-07-03 14:36:12', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid2', 'mid1', '2022-11-16', '4', 'Interesting movie', '2022-11-16 21:15:30', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid2', 'mid2', '2023-03-21', '4', 'I like this movie', '2023-03-21 17:34:10', 1);

INSERT INTO users_movies (userid, movieid, watch_date, watch_time, favorite)
VALUES ('uid2', 'mid3', '2023-12-15',  '2023-12-15 20:18:05', 0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid2', 'mid4', '2022-12-07', '5', 'It is interesting', '2022-12-07 21:22:45', 1);

INSERT INTO users_movies (userid, movieid, favorite)
VALUES ('uid2', 'mid5', 0);

INSERT INTO users_movies (userid, movieid, watch_date, watch_time, favorite)
VALUES ('uid3', 'mid1', '2022-10-22','2022-10-22 20:19:35', 0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid3', 'mid2', '2024-01-01', '3', 'Not interesting as it was before', '2024-01-01 10:24:55', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid3', 'mid3', '2023-10-14', '4', 'Entertaining', '2023-10-14 19:38:23', 1);

INSERT INTO users_movies (userid, movieid, favorite)
VALUES ('uid3', 'mid4', 0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid3', 'mid5', '2024-04-16', '4', 'Interesting movie', '2024-04-16 20:51:13', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating,  watch_time, favorite)
VALUES ('uid4', 'mid1', '2022-03-26', '4',  '2022-03-26 14:05:52', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid4', 'mid2', '2022-10-24', '3', 'it is ok movie', '2022-10-24 17:41:21', 0);

INSERT INTO users_movies (userid, movieid, favorite)
VALUES ('uid4', 'mid3',  0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid4', 'mid4', '2023-11-18', '5', 'Very interesting movie', '2023-11-18 14:21:57', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid4', 'mid5', '2023-11-04', '4', 'a horror one', '2023-11-04 12:44:17', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid5', 'mid1', '2021-09-12', '4', 'it is interesting movie', '2021-09-12 12:31:48', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid5', 'mid2', '2023-09-09', '2', 'it is not popular movie anymore', '2023-09-09 10:12:02', 0);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid5', 'mid3', '2024-10-24', '4', 'it is ok movie', '2024-10-24 19:07:58', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid5', 'mid4', '2023-09-01', '5', 'I like it', '2023-09-01 16:41:17', 1);

INSERT INTO users_movies (userid, movieid, watch_date, rating, review, watch_time, favorite)
VALUES ('uid5', 'mid5', '2023-11-04', '5', 'it is ok movie', '2023-11-04 18:36:09', 1);

select * from users_movies;





