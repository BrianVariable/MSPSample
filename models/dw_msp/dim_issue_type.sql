{{
    config(
        materialized='table',
        tags= 'msp'
    )
}}

select distinct
    {{ dbt_utils.generate_surrogate_key(["issue_type"]) }} as issue_type_sk,
    issue_type
FROM {{ ref('ticket_snapshot') }}