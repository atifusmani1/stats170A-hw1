-- MySQL load script for Task 2
-- PATHS are specific to my local machine

-- Load csrankings.csv
LOAD DATA LOCAL INFILE 'C:/Users/16164/Documents/classes/STATS170A/stats170A-hw1/data/raw/csrankings.csv'
INTO TABLE csrankings
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(author_name, affiliation, homepage, scholarid);

-- Load generated-author-info.csv
LOAD DATA LOCAL INFILE 'C:/Users/16164/Documents/classes/STATS170A/stats170A-hw1/data/raw/generated-author-info.csv'
INTO TABLE generated_author_info
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(author_name, dept, area, count, adjustedcount, year);

-- Load conference_ranking.csv
LOAD DATA LOCAL INFILE 'C:/Users/16164/Documents/classes/STATS170A/stats170A-hw1/data/raw/conference_ranking.csv'
INTO TABLE conference_ranking
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(acronym, name, conf_rank);
