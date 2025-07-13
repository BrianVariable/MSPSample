{% snapshot ticket_snapshot %}

{{
  config(
    target_schema='google_sheets',
    unique_key='ID_Ticket',
    strategy='check',
    check_cols = 'all',
    invalidate_hard_deletes=True
  )
}}

SELECT
    ISSUE_TYPE,
    FECHA,
    RESOLUTION_TIME_DAYS_,
    PRIORITY,
    ID_TICKET,
    EMPLOYEE_ID,
    REQUEST_CATEGORY,
    SEVERITY,
    SATISFACTION_RATE,
    AGENT_ID
FROM {{ source('google_sheets', 'ticket') }}

{% endsnapshot %}