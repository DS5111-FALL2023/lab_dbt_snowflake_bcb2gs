{{ config(materialized='table') }}

SELECT ROW_NUMBER() OVER(ORDER BY mnemonic) AS course_id, mnemonic as course_mnemonic , NAME AS Course_Name ,  description_short as course_description ,
ACTIVE as active_flag
FROM DS5111_DB.LAB01_BCB2GS.courses
