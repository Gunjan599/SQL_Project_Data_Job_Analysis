/*
Answer: What are the top skills based on salary?
-Look at the average salary associated with each skill for Business Analyst positions
-Focuses on roles with specified salaries, regardless of location
-Why? It reveals how different skills impact salary levels for Data Analysts and
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Business Analyst' 
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 30



/*
Here's the breakdown of the results for the top paying skills
✅ Cloud, Big Data & NoSQL Dominate – High salaries for GCP, BigQuery, Snowflake, MongoDB, Databricks, Kafka show demand for scalable, cloud-based data solutions.

✅ AI & Machine Learning Pay Well – Skills in TensorFlow, PyTorch, MXNet, Chainer highlight the rising value of automation, deep learning, and AI-driven insights.

✅ BI, Programming & DevOps Add Value – Python, R, Looker, Tableau remain essential, while Chef ($220K) and Phoenix ($135K) suggest cross-skilling in DevOps & backend development boosts pay.
[
  {
    "skills": "chef",
    "avg_salary": "220000"
  },
  {
    "skills": "phoenix",
    "avg_salary": "135990"
  },
  {
    "skills": "looker",
    "avg_salary": "130400"
  },
  {
    "skills": "mongodb",
    "avg_salary": "120000"
  },
  {
    "skills": "python",
    "avg_salary": "116516"
  },
  {
    "skills": "bigquery",
    "avg_salary": "115833"
  },
  {
    "skills": "gcp",
    "avg_salary": "115833"
  },
  {
    "skills": "r",
    "avg_salary": "114629"
  },
  {
    "skills": "db2",
    "avg_salary": "114500"
  },
  {
    "skills": "snowflake",
    "avg_salary": "114500"
  },
  {
    "skills": "ssrs",
    "avg_salary": "111500"
  },
  {
    "skills": "nosql",
    "avg_salary": "110490"
  },
  {
    "skills": "qlik",
    "avg_salary": "110175"
  },
  {
    "skills": "pytorch",
    "avg_salary": "110000"
  },
  {
    "skills": "elasticsearch",
    "avg_salary": "110000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "110000"
  },
  {
    "skills": "databricks",
    "avg_salary": "110000"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "110000"
  },
  {
    "skills": "node.js",
    "avg_salary": "110000"
  },
  {
    "skills": "chainer",
    "avg_salary": "110000"
  },
  {
    "skills": "visio",
    "avg_salary": "106250"
  },
  {
    "skills": "tableau",
    "avg_salary": "104233"
  },
  {
    "skills": "hadoop",
    "avg_salary": "101993"
  },
  {
    "skills": "word",
    "avg_salary": "101250"
  },
  {
    "skills": "powerpoint",
    "avg_salary": "100800"
  },
  {
    "skills": "oracle",
    "avg_salary": "99830"
  },
  {
    "skills": "sql",
    "avg_salary": "99120"
  },
  {
    "skills": "sas",
    "avg_salary": "98959"
  },
  {
    "skills": "kafka",
    "avg_salary": "97500"
  },
  {
    "skills": "postgresql",
    "avg_salary": "96667"
  }
]
*/