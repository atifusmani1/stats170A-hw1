-- MySQL cleaning and transformation for Task 2

SET SQL_SAFE_UPDATES = 0;

-- Split author_name into first, middle, last in csrankings
UPDATE csrankings
SET
    first_name = SUBSTRING_INDEX(author_name, ' ', 1),
    last_name  = SUBSTRING_INDEX(author_name, ' ', -1),
    middle_name = CASE
        WHEN author_name REGEXP '^[^ ]+ [^ ]+ ' THEN
            TRIM(
                SUBSTRING(
                    author_name,
                    LOCATE(' ', author_name) + 1,
                    CHAR_LENGTH(author_name)
                      - LOCATE(' ', author_name)
                      - CHAR_LENGTH(SUBSTRING_INDEX(author_name, ' ', -1))
                )
            )
        ELSE NULL
    END;

-- Split author_name into first, middle, last in generated_author_info
UPDATE generated_author_info
SET
    first_name = SUBSTRING_INDEX(author_name, ' ', 1),
    last_name  = SUBSTRING_INDEX(author_name, ' ', -1),
    middle_name = CASE
        WHEN author_name REGEXP '^[^ ]+ [^ ]+ ' THEN
            TRIM(
                SUBSTRING(
                    author_name,
                    LOCATE(' ', author_name) + 1,
                    CHAR_LENGTH(author_name)
                      - LOCATE(' ', author_name)
                      - CHAR_LENGTH(SUBSTRING_INDEX(author_name, ' ', -1))
                )
            )
        ELSE NULL
    END;

-- Set academic_society in conference_ranking using the name field
UPDATE conference_ranking
SET academic_society =
    CASE
        WHEN UPPER(name) LIKE '%ACM%' AND UPPER(name) LIKE '%IEEE%' THEN 'ACM+IEEE'
        WHEN UPPER(name) LIKE '%ACM%' AND UPPER(name) NOT LIKE '%IEEE%' THEN 'ACM'
        WHEN UPPER(name) LIKE '%IEEE%' AND UPPER(name) NOT LIKE '%ACM%' THEN 'IEEE'
        ELSE 'other'
    END;

-- Count rows with trailing numeric suffixes
SELECT COUNT(*) AS csrankings_suffix_count
FROM csrankings
WHERE author_name REGEXP ' [0-9]+$';

SELECT COUNT(*) AS generated_author_info_suffix_count
FROM generated_author_info
WHERE author_name REGEXP ' [0-9]+$';

-- Add clean_author_name columns
ALTER TABLE csrankings
    ADD COLUMN clean_author_name VARCHAR(255);

ALTER TABLE generated_author_info
    ADD COLUMN clean_author_name VARCHAR(255);

-- Populate clean_author_name by stripping trailing " space + digits"
UPDATE csrankings
SET clean_author_name = REGEXP_REPLACE(author_name, ' [0-9]+$', '');

UPDATE generated_author_info
SET clean_author_name = REGEXP_REPLACE(author_name, ' [0-9]+$', '');

-- Validation queries (should return zero rows)
SELECT *
FROM csrankings
WHERE clean_author_name REGEXP ' [0-9]+$';

SELECT *
FROM generated_author_info
WHERE clean_author_name REGEXP ' [0-9]+$';

