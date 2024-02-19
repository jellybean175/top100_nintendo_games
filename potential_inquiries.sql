-- Assuming the CSV file has been imported into a table named 'Top 100 Best Nintendo Games of All Time' with a column named 'Genre'

-- Create a temporary table to store the genre counts
CREATE TEMP TABLE GenreCounts AS
SELECT Genre, COUNT(*) AS Count
FROM Top 100 Best Nintendo Games of All Time
GROUP BY Genre;

-- Query to retrieve the most popular genres
SELECT Genre, Count
FROM GenreCounts
ORDER BY Count DESC;
