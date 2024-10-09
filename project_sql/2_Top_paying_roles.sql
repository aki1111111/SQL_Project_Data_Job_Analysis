
WITH top_paying_jobs AS (
SELECT 
job_id,
job_work_from_home,
job_schedule_type,
name AS Company_name,
salary_year_avg
From 
    job_postings_fact AS jpf
LEFT JOIN 
    company_dim AS cd
ON
    cd.company_id = jpf.company_id
 WHERE 
     salary_year_avg IS NOT NULL AND 
     job_title_short = 'Data Analyst' AND 
    job_work_from_home = true
 Order by 
    salary_year_avg DESC
 
Limit 10
)

SELECT 
tpj.*,
skills
FROM top_paying_jobs AS tpj
INNER JOIN skills_job_dim  AS sjd
ON tpj.job_id = sjd.job_id
INNER JOIN skills_dim as sd
ON sjd.skill_id = sd.skill_id
