{{
    config(
        materialized = "table"
    )
}}
with base as (
{{ dbt_date.get_date_dimension('2019-01-01', '2030-01-01') }}
)

select * from base