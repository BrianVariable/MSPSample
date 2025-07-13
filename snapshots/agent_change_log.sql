{% snapshot agent_snapshot %}

{{
  config(
    target_schema='google_sheets',
    unique_key='EMAIL',
    strategy='check',
    check_cols='all',
    invalidate_hard_deletes=True
  )
}}

SELECT
    DAY_OF_BIRTH,
    EMAIL,
    YEAR_OF_BIRTH,
    FULL_NAME,
    MONTH_OF_BIRTH,
    AGENT_ID
FROM {{ source('google_sheets', 'it_agent') }}

{% endsnapshot %}