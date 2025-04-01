-- models/staging/stg_producer_price_data.sql

SELECT
  PARSE_DATE('%Y-%m', date) AS date,
  ground_beef,
  chicken__boneless_breast,
  eggs__grade_a___large_retail,
  pork_chops__boneless,
  all_uncooked_ground_beef AS beef
FROM {{ source('meat_flu_analysis', 'producer_price_data') }}
