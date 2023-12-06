{{ config(materialized='table') }}

SELECT ROW_NUMBER() OVER(ORDER BY term_name) AS term_id, term_name
FROM DS5111_DB.LAB01_BCB2GS.terms
