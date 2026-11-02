{{ config(materialized='table') }}

select
    customer_id,
    first_name,
    last_name,
    email,
    signup_date,
    status,
    current_timestamp() as _ingested_at
from {{ ref('raw_customers') }}