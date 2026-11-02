{{ config(materialized='table') }}

with silver as (
    select * from {{ ref('silver_customers') }}
)

select
    status as customer_tier,
    count(customer_id) as total_customers,
    min(signup_date) as earliest_signup,
    max(signup_date) as latest_signup,
    current_timestamp() as _mart_updated_at
from silver
group by status