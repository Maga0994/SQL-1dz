CREATE TABLE IF NOT EXISTS Albums (
   album_id SERIAL(40) PRIMARY KEY,
   name varchar(40) NOT NULL,
   release_year VARCHAR(15) NOT NULL
);


CREATE TABLE IF NOT EXISTS Sounds (
    sound_id SERIAL(40) PRIMARY KEY,
    album_id VARCHAR(40) UNIQUE NOT NULL REFERENCES Albums(album_id),
    name VARCHAR(40) NOT NULL,
    time INTEGER NOT NULL,
    album VARCHAR(20) NOT NULL
);


CREATE TABLE IF NOT EXISTS Collections (
    collection_id SERIAL(40) PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    release_date DATE NOT NULL
);


CREATE TABLE IF NOT EXISTS Executors (
    executor_id SERIAL(40) PRIMARY KEY,
    nickname VARCHAR(40) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS Genres (
    genre_id SERIAL(40) PRIMARY KEY,
    list VARCHAR(40) NOT NULL,
    name VARCHAR(40) NOT NULL
);


CREATE TABLE IF NOT EXISTS SoundsCollections (
    id SERIAL(40) PRIMARY KEY,
    sound_id VARCHAR(40) NOT NULL REFERENCES Collections(collection_id),
    collection_id VARCHAR(40) NOT NULL REFERENCES Sounds(sound_id)
);


CREATE TABLE IF NOT EXISTS GenresExecutors (
    id SERIAL(40) PRIMARY KEY,
    genre_id VARCHAR(40) NOT NULL REFERENCES Executors(executors_id),
    executor_id VARCHAR(40) NOT NULL REFERENCES Genres(genre_id)
);

CREATE TABLE IF NOT EXISTS AlbumsExecutors (
    id SERIAL(40) PRIMARY KEY,
    executor_id VARCHAR(40) NOT NULL REFERENCES Albums(album_id),
    album_id VARCHAR(40) NOT NULL REFERENCES Executors(executors_id)
);