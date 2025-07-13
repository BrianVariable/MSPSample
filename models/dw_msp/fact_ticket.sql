{{
    config(
        materialized='table',
        tags= 'msp'
    )
}}

select
    {{ dbt_utils.generate_surrogate_key(["ID_Ticket"]) }} as ticket_id_sk,
    {{ dbt_utils.generate_surrogate_key(["employee_id"]) }} as employee_fk,
    {{ dbt_utils.generate_surrogate_key(["Agent_ID"]) }} as agent_fk,
    {{ dbt_utils.generate_surrogate_key(["Request_Category"]) }} as Request_Category_fk,
    {{ dbt_utils.generate_surrogate_key(["Issue_Type"]) }} as Issue_Type_fk,
    {{ dbt_utils.generate_surrogate_key(["Severity"]) }}as Severity_fk,
    {{ dbt_utils.generate_surrogate_key(["Priority"]) }} as Priority_fk,
    Resolution_Time_Days_ as resolution_time_days,
    Satisfaction_Rate,
    ID_Ticket as ticket_id,
    Fecha as ticket_date,
FROM {{ ref('ticket_snapshot') }}
WHERE dbt_valid_to IS NULL