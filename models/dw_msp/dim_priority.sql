{{
    config(
        materialized='table',
        tags= 'msp'
    )
}}

select distinct
    {{ dbt_utils.generate_surrogate_key(["priority"]) }} as priority_sk,
    priority
FROM {{ ref('ticket_snapshot') }}