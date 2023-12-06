{{ config(materialized='table') }}


Select  ROW_NUMBER() OVER(ORDER BY term_id,instructor_id,course_id) AS assignment_id,  term_id , instructor_id , course_id
from assigned_raw ABC
left join {{ ref('erd_uva_courses') }} on ABC.COURSE_NAME = ERD_UVA_COURSES.course_mnemonic
left join {{ ref('erd_uva_instructors') }}  on trim(ABC.INSTRUCTOR) = trim(ERD_UVA_INSTRUCTORS.INSTRUCTORNAME)
left join {{ ref('erd_uva_terms') }}  on UPPER(ABC.term_name)= UPPER(ERD_UVA_TERMS.term_name)
Order by term_id,instructor_id,course_id
