CREATE TABLE IF NOT EXISTS Albums (
   album_id SERIAL PRIMARY KEY,
   name varchar(40) NOT NULL,
   release_year VARCHAR(15) NOT NULL
);


CREATE TABLE IF NOT EXISTS Sounds (
    sound_id SERIAL PRIMARY KEY,
    album_id SERIAL NOT NULL REFERENCES Albums(album_id),
    name VARCHAR(40) NOT NULL,
    time INTERVAL NOT NULL
);


CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_date DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS Executors (
    executor_id SERIAL PRIMARY KEY,
    nickname VARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);


CREATE TABLE IF NOT EXISTS SoundsCollections (
    id SERIAL PRIMARY KEY,
    sound_id SERIAL NOT NULL REFERENCES Sounds(sound_id),
    collection_id SERIAL NOT NULL REFERENCES Collections(collection_id)
);

CREATE TABLE IF NOT EXISTS GenresExecutors (
    id SERIAL PRIMARY KEY,
    genre_id SERIAL NOT NULL REFERENCES Genres(genre_id),
    executor_id SERIAL NOT NULL REFERENCES Executors(executor_id)
);

CREATE TABLE IF NOT EXISTS AlbumsExecutors (
    id SERIAL PRIMARY KEY,
    album_id SERIAL NOT NULL REFERENCES Albums(album_id),
    executor_id SERIAL NOT NULL REFERENCES Executors(executor_id)
);