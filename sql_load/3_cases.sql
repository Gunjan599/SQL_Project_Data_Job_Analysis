/*
SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York,NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;
*/

SELECT 
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York' AS date_time
FROM 
    job_postings_fact;


SELECT
    --job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York' AS date_time,
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM date_time) AS month
FROM 
    job_postings_fact
GROUP BY 
    month
ORDER BY
    job_posted_count;
