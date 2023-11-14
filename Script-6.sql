-- Задание 2 

--1
SELECT name,
       time
FROM sounds
ORDER BY time DESC
LIMIT 1;

--2
SELECT name
FROM sounds
WHERE time >= '210'

--3
SELECT name
FROM collections
WHERE release_date >= '2018-01-01' AND release_date <= '2023-01-01'

--4
SELECT nickname
FROM executors
WHERE LENGTH(nickname) = POSITION(' ' IN nickname) + 1 OR POSITION(' ' IN nickname) = 0

--5 
SELECT name
FROM sounds
WHERE name LIKE '%My%' OR name LIKE '%my%'


-- Задание 3

--1
SELECT g.name AS genre, COUNT(DISTINCT e.executor_id) AS num_executors
FROM genres g
LEFT JOIN genresexecutors ge ON g.genre_id = ge.genre_id
LEFT JOIN executors e ON ge.executor_id = e.executor_id
GROUP BY g.name;

--2
SELECT COUNT(*) AS num_tracks
FROM sounds s
JOIN albums a ON s.album_id = a.album_id
WHERE a.release_year BETWEEN '2019-01-01' AND '2020-12-31'

--3
SELECT a.name AS album_name, AVG(EXTRACT(HOUR FROM s.time) * 3600 + EXTRACT(MINUTE FROM s.time) * 60 + EXTRACT(SECOND FROM s.time)) AS avg_track_duration_seconds
FROM albums a
JOIN sounds s ON a.album_id = s.album_id
GROUP BY a.name;

--4
SELECT DISTINCT e.nickname
FROM executors e
LEFT JOIN albumsexecutors ae ON e.executor_id = ae.executor_id
LEFT JOIN albums a ON ae.album_id = a.album_id
WHERE a.release_year IS NULL OR a.release_year <> '2020-01-01';

--5
SELECT c.name AS collection_name
FROM collections c
JOIN soundscollections sc ON c.collection_id = sc.collection_id
JOIN sounds s ON sc.sound_id = s.sound_id
JOIN albumsexecutors ae ON s.album_id = ae.album_id
JOIN executors e ON ae.executor_id = e.executor_id
WHERE e.nickname = 'Bring Me The Horizon';