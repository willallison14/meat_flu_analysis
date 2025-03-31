-- models/core/core_joined_meat_flu_data.sql
SELECT
  p.date,
  p.ground_beef,
  p.chicken__boneless_breast,
  p.eggs__grade_a___large_retail,
  p.pork_chops__boneless,
  p.beef,
  f.outbreaks,
  f.flock_size
FROM {{ ref('stg_producer_price_data') }} p
LEFT JOIN {{ ref('stg_avian_flu_data') }} f
ON p.date = f.date

