{{ config(materialized='table') }}


SELECT ROW_NUMBER() OVER(ORDER BY COURSENUMBER) AS objective_id,COURSENUMBER, NVL(ERD_UVA_COURSES.COURSE_ID , '-1')
AS COURSE_ID, LEARNINGOUTCOME , 'Y' as ACtive_flag
FROM DS5111_DB.LAB01_BCB2GS.learning_outcomes
left join {{ ref('erd_uva_courses') }}  on
course_mnemonic = COURSENUMBER
