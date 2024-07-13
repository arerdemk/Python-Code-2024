/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT DISTINCT
    job_title_short,
    count(skills_job_dim.skill_id) as skill_count,
    skills
from
    skills_dim

inner JOIN skills_job_dim
ON skills_job_dim.skill_id=skills_dim.skill_id
inner JOIN job_postings_fact
ON job_postings_fact.job_id=skills_job_dim.job_id

GROUP BY
    skills,
    job_title_short

ORDER BY
    skill_count DESC

LIMIT
    5


    