{{ config(materialized='view') }}

Select COURSE_MNEMONIC ,COURSE_NAME  from ERD_UVA_COURSES LEFT JOIN
DS5111_DB.LAB01_BCB2GS.ERD_UVA_LEARNING_OUTCOMES ON
ERD_UVA_COURSES.COURSE_ID = ERD_UVA_LEARNING_OUTCOMES.COURSE_ID
WHERE  ERD_UVA_LEARNING_OUTCOMES.COURSE_ID  IS NULL
