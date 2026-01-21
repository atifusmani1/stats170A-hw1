-- MySQL verification queries for Task 2 core tables

-- csrankings
SELECT COUNT(*) AS csrankings_count FROM csrankings;
SELECT * FROM csrankings LIMIT 5;

-- generated_author_info
SELECT COUNT(*) AS generated_author_info_count FROM generated_author_info;
SELECT * FROM generated_author_info LIMIT 5;

-- conference_ranking
SELECT COUNT(*) AS conference_ranking_count FROM conference_ranking;
SELECT * FROM conference_ranking LIMIT 5;

