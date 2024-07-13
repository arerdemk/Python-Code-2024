/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/

WITH top_paying AS (
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
        10)

SELECT
    top_paying.*
    skills

FROM
top_paying

inner JOIN skills_job_dim 
ON skills_job_dim.job_id=top_paying.job_id
inner JOIN skills_dim
ON skills_dim.skill_id=skills_job_dim.skill_id

