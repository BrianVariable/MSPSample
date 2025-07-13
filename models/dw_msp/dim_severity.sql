{{
    config(
        materialized='table',
        tags= 'msp'
    )
}}

select distinct
    {{ dbt_utils.generate_surrogate_key(["severity"]) }} as severity_sk,
    severity
FROM {{ ref('ticket_snapshot') }}