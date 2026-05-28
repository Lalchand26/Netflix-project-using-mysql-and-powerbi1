create database netflix_db;
use netflix_db;

--Q1. Top 10 highest IMDb rated shows find karo

SELECT Title, IMDb
FROM netflix
WHERE IMDb IS NOT NULL
ORDER BY IMDb DESC
LIMIT 10;

--Q2. Har genre ka average IMDb nikalo

SELECT Genre, AVG(IMDb) AS avg_rating
FROM netflix
GROUP BY Genre;

--Q3.Kaunse country me sabse jyada shows hain?

select Country,count(*) as mostshow from netflix
group by country order by mostshow desc limit 1;

--Q4. 2020 ke baad release hui movies/shows show karo

SELECT 
    Year,Title,IMDb,Viewership,`Directors/Creators`,`Lead Actors`,
    `Release Date`,Duration,Country,Genre FROM netflix WHERE Year > 2020 ORDER BY Year desc;

--q5. IMDb rating 8 se jyada aur viewership 1000 se jyada wale shows

SELECT Title, IMDb, Viewership
FROM netflix
WHERE IMDb > 8
AND CAST(
        REPLACE(Viewership, 'M Views', '')
    AS DECIMAL(10,2)
) > 1;

--Q6. Genre-wise total viewership nikalo

select genre ,count(viewership)from netflix group by genre;

--Q7. Har year me kitne titles release hue

SELECT Year, COUNT(*) AS total_titles
FROM netflix
GROUP BY Year
ORDER BY Year;

--Q8. Highest IMDb rating wale actor ka show

SELECT `Lead Actors`, Title, IMDb
FROM netflix
ORDER BY IMDb DESC
LIMIT 1;

--Q9. Multiple countries wale records find karo

SELECT Title, Country
FROM netflix
WHERE Country LIKE '%,%';


--Q10. Directors ke according average IMDb rating

SELECT `Directors/Creators`,
AVG(IMDb) AS avg_rating
FROM netflix
GROUP BY `Directors/Creators`
ORDER BY avg_rating DESC;

--Q11.Most viewed genre find karo

SELECT Genre,
SUM(Viewership) AS total_views
FROM netflix
GROUP BY Genre order by total_views desc limit 1;

--Q12. Month-wise releases count karo

SELECT MONTH(release_Date) AS month_no,
COUNT(*) AS releases
FROM netflix
GROUP BY MONTH(release_Date)
ORDER BY month_no;

--Q13. IMDb rating overall average se jyada wale titles

SELECT Title, IMDb
FROM netflix
WHERE IMDb >(SELECT AVG(IMDb)FROM netflix);

--Q14. Top 3 genres by average IMDb
SELECT Genre,
AVG(IMDb) AS avg_rating
FROM netflix
GROUP BY Genre
ORDER BY avg_rating DESC
LIMIT 3;

--Q15. Same actor ke multiple shows find karo

SELECT `Lead Actors`,
COUNT(*) AS total_shows
FROM netflix
GROUP BY `Lead Actors`
HAVING COUNT(*) > 1;
select user,host from mysql.user;
select user(),current_user();