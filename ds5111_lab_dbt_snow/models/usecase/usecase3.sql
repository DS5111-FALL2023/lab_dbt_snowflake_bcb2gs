{{ config(materialized='view') }}

SELECT INSTRUCTORNAME FROM ERD_UVA_INSTRUCTORS WHERE CURRENTEMPLOYEE ='FALSE'