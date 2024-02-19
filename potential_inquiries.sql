USE Top 100 Nintendo Games;

-- ------------------------------------------ 
-- Which game genres are the most popular?
-- ------------------------------------------ 
SELECT 
    g.genre_name, COUNT(t.title_id) AS title_count
FROM
    genres g
        JOIN
    title t ON g.genre_id = t.genre_id
GROUP BY g.genre_name
ORDER BY title_count DESC;

-- ------------------------------------------ 
-- Which studios rank among the top 100 bestsellers?
-- ------------------------------------------ 
SELECT 
    a.developers,
    COUNT(t.title_id) AS num_best_sellers
FROM
    developers a
        JOIN
    books b ON a.author_id = b.author_id
WHERE
    b.book_rank <= 100
GROUP BY a.author_id
ORDER BY num_best_sellers DESC;

-- ------------------------------------------ 
-- How does book length affect book rank?
-- ------------------------------------------ 
SELECT num_of_pages, AVG(book_rank) AS avg_rank
FROM books
GROUP BY num_of_pages
ORDER BY num_of_pages;

-- ------------------------------------------ 
-- Which genres have the highest average rating?
-- ------------------------------------------ 
SELECT g.genre_name, AVG(b.overall_rating) AS avg_rating
FROM genres g
JOIN books b ON g.genre_id = b.genre_id
GROUP BY g.genre_name
ORDER BY avg_rating DESC;


-- ------------------------------------------ 
-- Is there a relationship between publication date and book rank?
-- ------------------------------------------ 
SELECT YEAR(published_date) AS publication_year, AVG(book_rank) AS avg_rank
FROM books
WHERE published_date IS NOT NULL
GROUP BY publication_year
ORDER BY publication_year;
