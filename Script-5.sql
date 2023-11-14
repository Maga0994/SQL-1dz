-- Задание 1 

INSERT INTO executors(executor_id, nickname)    -- Создаем исполнителей
VALUES (1, 'Bring Me The Horizon'),
       (2, 'Dua Lipa'),
       (3, 'Eminem'),
       (4, 'Doja Cat'),
       (5, 'Dua Lipa'),
       (6, 'Eminem')
ON CONFLICT (nickname) DO NOTHING;

INSERT INTO genres(genre_id, name)   -- Создаем жанры
VALUES (1, 'Hard Rock'),
       (2, 'Pop'),
       (3, 'Rap'),
       (4, 'Hip Hop')
ON CONFLICT (genre_id) DO NOTHING;       

INSERT INTO albums(album_id, name, release_year)   -- Название альбома и дата релиза
VALUES (1, 'Sempiternal', '2013-03-31'),
       (2, 'Future Nostalgia', '2020-01-29'),
       (3, 'Revival', '2017-12-14'),
       (4, 'Hot Pink', '2019-11-06')
ON CONFLICT (album_id) DO NOTHING;       

INSERT INTO sounds(sound_id, album_id, name, time)    -- Название песен и время
VALUES (1, 1, 'Hospital For Souls', '425 seconds'::interval),
       (2, 2, 'Break My Heart', '240 seconds'::interval),
       (3, 3, 'River', '245 seconds'::interval),
       (4, 4, 'Streets', '222 seconds'::interval),
       (5, 2, 'Physical', '195 seconds'::interval),
       (6, 3, 'Heat', '365 seconds'::interval)
ON CONFLICT (sound_id) DO NOTHING;

INSERT INTO collections(collection_id, name, release_date)   -- Сборники 
VALUES (1, 'Best in Hard Rock', '2014-03-11'),
       (2, 'Future Incoming', '2020-10-12'),
       (3, 'Platinum Rap', '2018-10-10'),
       (4, 'Hot Pop In The Street', '2020-11-05')
ON CONFLICT (collection_id) DO NOTHING;

INSERT INTO albumsexecutors(album_id, executor_id)
VALUES (1, 1);

INSERT INTO genresexecutors(genre_id, executor_id)
VALUES (1, 1);

INSERT INTO soundscollections(sound_id, collection_id)
VALUES (1, 1);

       