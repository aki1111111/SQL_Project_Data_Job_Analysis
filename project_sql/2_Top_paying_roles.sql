SELECT * FROM job_postings_fact;
SELECT * FROM skills_job_dim
limit 1000; --2nd db
SELECT * FROM skills_dim -- 3rd db


SELECT 
sjd.skill_id,
count(*) as skill_count
FROM skills_job_dim As sjd
INNER JOIN job_postings_fact AS jpf
ON jpf.job_id = sjd.job_id
GROUP BY
sjd.skill_id
Limit 1000;