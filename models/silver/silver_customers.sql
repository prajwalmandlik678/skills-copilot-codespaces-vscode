{{ config(materialized='view') }}

with bronze as (
    select * from {{ ref('bronze_customers') }}
)

select
    cast(customer_id as integer) as customer_id,
    trim(first_name) as first_name,
    trim(last_name) as last_name,
    first_name || ' ' || last_name as full_name,
    lower(trim(email)) as email,
    cast(signup_date as date) as signup_date,
    upper(trim(status)) as status,
    _ingested_at
from bronze
where status != 'INACTIVE'