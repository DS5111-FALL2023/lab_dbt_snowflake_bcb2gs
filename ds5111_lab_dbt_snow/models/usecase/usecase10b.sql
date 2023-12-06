{{ config(materialized='view') }}

WITH data as
(Select TERM_NAME , INSTRUCTORNAME , course_mnemonic   from ERD_UVA_COURSES INNER JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_ASSIGNMENTS ON
ERD_UVA_COURSES.COURSE_ID = ERD_UVA_ASSIGNMENTS.COURSE_ID INNER JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_INSTRUCTORS ON
ERD_UVA_INSTRUCTORS.INSTRUCTOR_ID = ERD_UVA_ASSIGNMENTS.INSTRUCTOR_ID INNER JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_TERMS ON
ERD_UVA_TERMS.TERM_ID = ERD_UVA_ASSIGNMENTS.TERM_ID
WHERE INSTRUCTORNAME like '%&%' OR INSTRUCTORNAME like '%-%'),

 Split_data as (
Select TERM_NAME  , course_mnemonic ,split(INSTRUCTORNAME , '-') As Name from Data Where INSTRUCTORNAME like '%-%'
Union
Select TERM_NAME  ,course_mnemonic ,split(INSTRUCTORNAME , '&') As Name  from Data Where INSTRUCTORNAME like '%&%'
)

Select Term_name , course_mnemonic , replace(flattened.value, '"') as INSTRUCTORNAME
from
Split_data,
LATERAL FLATTEN (input =>Split_data.name ) flattened
