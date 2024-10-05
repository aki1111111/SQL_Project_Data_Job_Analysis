SELECT 
job_title_short,
job_title,
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
 
Limit 10;
