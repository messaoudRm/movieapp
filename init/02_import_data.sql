-- Sélectionner la base de données
USE DB;

-- Charger les données depuis le fichier CSV dans la table `movies`
LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/movies_dataset.csv'
INTO TABLE movies
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(release_date, title, overview, popularity, vote_count, vote_average, original_language, genre, poster_url);
