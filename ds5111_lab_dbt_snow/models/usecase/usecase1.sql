{{ config(materialized='view') }}

Select COURSE_MNEMONIC ,COURSE_NAME from ERD_UVA_COURSES WHERE ACTIVE_FLAG ='TRUE'
