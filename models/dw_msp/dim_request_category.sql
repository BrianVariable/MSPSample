{{
    config(
        materialized='table',
        tags= 'msp'
    )
}}

select distinct
    {{ dbt_utils.generate_surrogate_key(["Request_Category"]) }} as Request_Category_sk,
    Request_Category
FROM {{ ref('ticket_snapshot') }}
