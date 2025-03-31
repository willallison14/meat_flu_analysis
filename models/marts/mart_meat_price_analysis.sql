WITH base AS (
  SELECT
    date,
    ground_beef,
    chicken__boneless_breast,
    eggs__grade_a___large_retail AS egg_price,
    pork_chops__boneless AS pork_price,
    beef,
    COALESCE(outbreaks, 0) AS outbreaks,
    COALESCE(flock_size, 0) AS flock_size,
    CASE WHEN outbreaks > 0 THEN 'Outbreak' ELSE 'No Outbreak' END AS outbreak_status
  FROM {{ ref('core_joined_meat_flu_data') }}
),

price_changes AS (
  SELECT
    *,
    LAG(egg_price) OVER (ORDER BY date) AS egg_prev,
    LAG(chicken__boneless_breast) OVER (ORDER BY date) AS chicken_prev,
    LAG(pork_price) OVER (ORDER BY date) AS pork_prev,
    LAG(ground_beef) OVER (ORDER BY date) AS beef_prev
  FROM base
)

SELECT
  date,
  outbreak_status,
  outbreaks,
  flock_size,

  egg_price,
  egg_price - egg_prev AS egg_change,

  chicken__boneless_breast,
  chicken__boneless_breast - chicken_prev AS chicken_change,

  pork_price,
  pork_price - pork_prev AS pork_change,

  ground_beef AS beef_price,
  ground_beef - beef_prev AS beef_change

FROM price_changes
ORDER BY date
