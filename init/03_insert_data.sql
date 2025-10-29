INSERT INTO favorites (user_id, movie_id) VALUES
 (1, 100),
 (1, 300),
 (2, 500),
 (3, 800),
 (3, 900);

 INSERT INTO watched (user_id, movie_id) VALUES
 (1, 100),
 (1, 200),
 (1, 300),
 (2, 400),
 (2, 500),
 (3, 600),
 (3, 700),
 (3, 800);

 INSERT INTO watch_later (user_id, movie_id) VALUES
 (1, 150),
 (1, 250),
 (2, 350),
 (2, 450),
 (3, 550),
 (3, 650),
 (3, 750);

INSERT INTO comments (user_id, movie_id, content, created_at, sentiment_label, sentiment_score) VALUES

(1, 1, 'Absolutely fantastic! The nostalgia hit me hard when the old Spider-Men showed up.', '2025-10-25 14:12:00', 'POSITIVE', 0.9998),
(2, 1, 'Too much fan service, not enough storytelling. Felt more like a crossover event than a real movie.', '2025-10-25 15:45:00', 'NEGATIVE', 0.9997),
(3, 1, 'Good balance of action and emotion. Could have trimmed 20 minutes though.', '2025-10-25 16:10:00', 'POSITIVE', 0.9654),

(1, 2, 'Incredible atmosphere. Pattinson’s Batman feels like a real detective for once.', '2025-10-26 09:23:00', 'POSITIVE', 0.9998),
(2, 2, 'Way too slow. It looks beautiful but I almost fell asleep halfway through.', '2025-10-26 10:05:00', 'NEGATIVE', 0.9992),
(3, 2, 'Great cinematography and music, but it lacks the fun of older Batman movies.', '2025-10-26 10:42:00', 'NEGATIVE', 0.9982),

(1, 3, 'Really tense and well acted. Didn’t expect the twists!', '2025-10-27 13:15:00', 'POSITIVE', 0.9998),
(2, 3, 'Predictable and a bit boring after the first half.', '2025-10-27 13:55:00', 'NEGATIVE', 0.9998),
(3, 3, 'Good thriller for a rainy night, but nothing groundbreaking.', '2025-10-27 14:12:00', 'NEGATIVE', 0.9786),

(1, 4, 'Beautiful and heartfelt. Disney nailed the family theme again.', '2025-10-27 18:30:00', 'POSITIVE', 0.9999),
(2, 4, 'Visually stunning, but the story feels rushed and forgettable.', '2025-10-27 18:45:00', 'NEGATIVE', 0.9993),
(3, 4, 'Music was catchy, but I expected more emotional depth.', '2025-10-27 19:00:00', 'NEGATIVE', 0.9553),

(1, 5, 'Fun action scenes, but nowhere near as clever as the original Kingsman.', '2025-10-28 11:10:00', 'NEGATIVE', 0.9937),
(2, 5, 'A total mess. Couldn’t tell what tone it was going for.', '2025-10-28 11:45:00', 'NEGATIVE', 0.9998),
(3, 5, 'Decent prequel, but Rasputin was the only interesting part.', '2025-10-28 12:15:00', 'NEGATIVE', 0.9274);

