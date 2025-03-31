-- models/staging/stg_avian_flu_data.sql

SELECT
  PARSE_DATE('%Y-%m', outbreak_date) AS date,
  SUM(outbreaks) AS outbreaks,
  SUM(flock_size) AS flock_size
FROM {{ source('meat_flu_analysis', 'avian_flu_data') }}
GROUP BY date
