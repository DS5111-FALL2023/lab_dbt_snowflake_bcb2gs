{{ config(materialized='view') }}

Select TERM_NAME , INSTRUCTORNAME , course_mnemonic   from ERD_UVA_COURSES INNER JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_ASSIGNMENTS ON
ERD_UVA_COURSES.COURSE_ID = ERD_UVA_ASSIGNMENTS.COURSE_ID INNER JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_INSTRUCTORS ON
ERD_UVA_INSTRUCTORS.INSTRUCTOR_ID = ERD_UVA_ASSIGNMENTS.INSTRUCTOR_ID INNER JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_TERMS ON
ERD_UVA_TERMS.TERM_ID = ERD_UVA_ASSIGNMENTS.TERM_ID
WHERE INSTRUCTORNAME like '%&%' OR INSTRUCTORNAME like '%-%'
