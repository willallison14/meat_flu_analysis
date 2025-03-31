-- models/staging/stg_avian_flu_data.sql
SELECT
  PARSE_DATE('%Y-%m', outbreak_date) AS date,
  outbreaks,
  flock_size
FROM {{ source('meat_flu_analysis', 'avian_flu_data') }}
