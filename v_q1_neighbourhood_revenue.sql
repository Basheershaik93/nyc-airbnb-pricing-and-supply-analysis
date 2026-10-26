CREATE OR REPLACE VIEW v_airbnb AS
SELECT *,
  price * (365 - availability_365) AS est_revenue,
  CASE WHEN price < 80 THEN 'Budget'
       WHEN price < 200 THEN 'Mid'
       ELSE 'Luxury' END AS price_band,
  CASE WHEN calculated_host_listings_count >= 5 THEN 'Commercial'
       ELSE 'Individual' END AS host_type,
  CASE WHEN minimum_nights >= 30 THEN 'Long-term'
       ELSE 'Short-term' END AS stay_type
FROM airbnb;