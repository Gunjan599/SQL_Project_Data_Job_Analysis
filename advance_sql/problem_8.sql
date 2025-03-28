/*
-Find job postings from the first quarter that have a salary greater than $70k
-Combine job posting SELECT *tables from the first quarter of 2023 (Jan-Mar)
-Gets job postings with an average yearly salary > $70,000
*/

SELECT * 
FROM january_jobs
UNION ALL
SELECT * 
FROM february_jobs
UNION ALL
SELECT *
FROM march_jobs


