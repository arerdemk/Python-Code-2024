/*
Question: What are the top-paying data analyst jobs?
- Identify the top 10 highest-paying Data Analyst roles that are available remotely
- Focuses on job postings with specified salaries (remove nulls)
- BONUS: Include company names of top 10 roles
- Why? Highlight the top-paying opportunities for Data Analysts, offering insights into employment options and location flexibility.
*/

SELECT
    job_id,
    job_title_short,
    job_work_from_home,
    salary_year_avg :: INT,
    name
FROM
    job_postings_fact

LEFT JOIN company_dim 
ON job_postings_fact.company_id=company_dim.company_id


WHERE
    job_title_short LIKE '%a Anal%' AND
    job_work_from_home= True AND
    salary_year_avg is not null

ORDER BY
    salary_year_avg DESC
LIMIT
    10
