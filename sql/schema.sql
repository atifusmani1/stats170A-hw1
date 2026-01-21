-- MySQL schema for Task 2

DROP TABLE IF EXISTS csrankings;
DROP TABLE IF EXISTS generated_author_info;
DROP TABLE IF EXISTS conference_ranking;

-- csrankings with split name components
CREATE TABLE csrankings (
    author_name     VARCHAR(255),
    first_name      VARCHAR(255),
    middle_name     VARCHAR(255),
    last_name       VARCHAR(255),
    affiliation     VARCHAR(255),
    homepage        VARCHAR(512),
    scholarid       VARCHAR(255)
);

-- generated author info with split name components
CREATE TABLE generated_author_info (
    author_name     VARCHAR(255),
    first_name      VARCHAR(255),
    middle_name     VARCHAR(255),
    last_name       VARCHAR(255),
    dept            VARCHAR(255),
    area            VARCHAR(64),
    count           INT,
    adjustedcount   DECIMAL(12,4),
    year            INT
);

-- conference_ranking includes academic_society
CREATE TABLE conference_ranking (
    acronym          VARCHAR(64),
    name             VARCHAR(512),
    conf_rank        VARCHAR(8),
    academic_society VARCHAR(16)
);
