with source_customers as (
    -- Reference the seed table using dbt's ref() function
    select * from {{ ref('raw_customers') }}
)

select
    customer_id,
    first_name,
    last_name,
    -- Create full_name by concatenating first and last name
    first_name || ' ' || last_name as full_name,
    -- Lowercase email
    lower(email) as email,
    signup_date,
    status
from source_customers
-- Filter out inactive accounts
where status != 'INACTIVE'