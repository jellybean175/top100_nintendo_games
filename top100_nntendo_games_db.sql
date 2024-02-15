-- Step 1: Import the CSV file into a temporary table
CREATE TEMPORARY TABLE temp_table (
    rank INT,
    gameName VARCHAR(255),
    yearPublished INT,
    genre VARCHAR(255)
);

LOAD DATA LOCAL INFILE 'data.csv'
INTO TABLE temp_table
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; -- Ignore the header row if present

-- Step 2: Create the final table with specific columns
CREATE TABLE final_table (
    id INT,
    name VARCHAR(255),
    age INT
);

-- Step 3: Populate the final table from the temporary table, selecting only specific columns
INSERT INTO final_table (id, name, age)
SELECT id, name, age
FROM temp_table;

-- Optional: Drop the temporary table
DROP TEMPORARY TABLE temp_table;
