-- Créer la base de données
CREATE DATABASE IF NOT EXISTS DB;
USE DB;

-- Supprimer les tables dans l'ordre inverse des dépendances
DROP TABLE IF EXISTS watched;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS favorites;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS users;

-- Utilisateur
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    role ENUM('SUPER_ADMIN', 'ADMIN', 'USER') NOT NULL DEFAULT 'USER'
);

-- Film
CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    release_date DATE,
    title VARCHAR(255),
    overview TEXT,
    popularity FLOAT,
    vote_count INT,
    vote_average FLOAT,
    original_language VARCHAR(50),
    genre VARCHAR(100),
    poster_url TEXT
);

-- Favoris
CREATE TABLE favorites (
    user_id INT,
    movie_id INT,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Commentaires
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Films vus
CREATE TABLE watched (
    user_id INT,
    movie_id INT,
    watched_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Films à voir
CREATE TABLE watch_later (
    user_id INT,
    movie_id INT,
    added_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (movie_id) REFERENCES movies(id)
);

-- Utilisateurs de test
INSERT INTO users (username, password, email, role)
VALUES
  ('superadmin', '$2a$10$ehdrvX28KIgRo4HWt09eguvXEw5MRIk5J2PDZDUnF5PzUCAnLB5bq', 'superadmin@example.com', 'SUPER_ADMIN'),
  ('admin', '$2a$10$aQKGUzQa2KjPC2OlK0LQGeqpBvf0Oe4Tj75DecyaG3a3HncsCIYyC', 'admin@example.com', 'ADMIN'),
  ('user', '$2a$10$D9aLAPpeR8TvwoQ3swZME.wdQPKXq2JGefUzVzn6VfuL.XC3GMGM2', 'user@example.com', 'USER');

