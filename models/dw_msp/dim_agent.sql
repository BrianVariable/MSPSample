{{
    config(
        materialized='table',
        tags= 'msp'
    )
}}

with agent as (
    select
        *
    from {{ ref('agent_snapshot') }}
    where dbt_valid_to is null
)


--wanted to do some things with employee but looks like employee ID is not equivalent to a single agent, so would need more info before going too far down that route.

select distinct
    md5(cast(coalesce(cast(a.agent_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as agent_sk,
    a.agent_id,
    a.FULL_NAME,
    -- left original name in here, but also put something to parse the emails as they seem more reliable in getting full name.  In reality this also could cause issues and would want to push source system to fix
    INITCAP(SPLIT_PART(SPLIT_PART(email, '@', 1), '.', 2)) || ' ' || INITCAP(SPLIT_PART(SPLIT_PART(email, '@', 1), '.', 1)) AS clean_full_name,
    a.EMAIL,
    concat(a.YEAR_OF_BIRTH, '-', a.MONTH_OF_BIRTH, '-', a.day_of_birth) as date_of_birth,
    datediff(month, date_of_birth, current_date) as age_months,
    datediff(year, date_of_birth, current_date) as age_years,
from
 agent a 
