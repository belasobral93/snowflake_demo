--effectively your secured view is your "source". in this non-pii project, no developer has access to the true source (tpch.customer) whether in developing or in production. 
--In this project no one has the ability to schedule jobs that contain PII in the source so no one prints data in production.
--you have a separate job specifically for scheduling PII jobs for those that can gain access. 

select * from {{ ref('stg_secured_view') }}