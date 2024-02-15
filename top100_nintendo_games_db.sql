-- Step 1: Import the CSV file into a temporary table
CREATE TEMPORARY TABLE temp_table
(
    rank INT,
    title VARCHAR(255),
    genre VARCHAR(255),
    developers VARCHAR(255),
    rating INT,
    system VARCHAR(255),
    yearReleased INT,
    numberPlayers INT,
    gamePrice float
);

LOAD DATA LOCAL INFILE 'Top 100 Best Nintendo Games of All Time.csv'
INTO TABLE temp_table
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES; -- Ignore the header row if present

-- Step 2: Create the final table with specific columns
CREATE TABLE final_table 
(
    title VARCHAR(255),
    genre VARCHAR(255),
    rating INT,
    system VARCHAR(255),
    yearReleased INT,
    numberPlayers INT,
    gamePrice float
);

-- Step 3: Populate the final table from the temporary table, selecting only specific columns
INSERT INTO final_table (title, genre, rating, system, yearReleased, numberPlayers, gamePrice)
SELECT title, genre, rating, system, yearReleased, numberPlayers, gamePrice
FROM temp_table;

-- Optional: Drop the temporary table
DROP TEMPORARY TABLE temp_table;
