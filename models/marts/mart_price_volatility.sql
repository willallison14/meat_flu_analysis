-- models/marts/mart_price_volatility.sql

SELECT
  outbreak_status,
  STDDEV(egg_change) AS egg_volatility,
  STDDEV(chicken_change) AS chicken_volatility,
  STDDEV(pork_change) AS pork_volatility,
  STDDEV(beef_change) AS beef_volatility
FROM {{ ref('mart_meat_price_analysis') }}
WHERE egg_change IS NOT NULL  -- Remove nulls for clean stats
GROUP BY outbreak_status
