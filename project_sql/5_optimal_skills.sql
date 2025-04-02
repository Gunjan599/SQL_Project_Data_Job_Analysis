/*
Answer: What are the most optimal skills to learn(aka its in high demand and a high-paying skill)?
-Identify skills in high demand and associated with high average salaries for Data Analyst roles
-Concentrates on remote positions with specified salaries
-Why? Targets skills that offer job security (high demand) and financial benefits (high salaries),
    offering strategic insights for career development in data analysis
*/

/*
WITH skills_demand AS (
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' 
    AND salary_year_avg IS NOT NULL 
    AND job_work_from_home = True
GROUP BY 
    skills_dim.skill_id
), average_salary AS (
SELECT 
    skills_job_dim.skill_id,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY 
    skills_job_dim.skill_id
)
*/
SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Business Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = TRUE
GROUP BY
    skills_dim.skill_id
HAVING 
    COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    avg_salary DESC,
    demand_count DESC
LIMIT 25;

/*
Here are the insights for optimal skills for Business Analyst position:
✅ SQL Leads in Demand but Python Pays More

SQL (42 demand count, $99K avg salary) is the most in-demand skill, confirming its necessity in database management and querying.

Python (20 demand count, $116K avg salary) offers a higher salary, likely due to its applications in automation, AI, and data science.

✅ Data Visualization & BI Tools Are Crucial

Tableau (27 demand count, $104K avg salary) and Power BI (12 demand count, $90K avg salary) show that data visualization is a high-paying and in-demand skill.

Excel (31 demand count, $94K avg salary) remains widely used, but salaries are lower compared to specialized BI tools.

✅ Key Takeaway
For higher salaries, focus on Python + SQL for data analysis & automation while adding Tableau/Power BI for business intelligence. 🚀
*/