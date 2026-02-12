SELECT COUNT(*) FROM order_delay_risk;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'order_delay_risk';


SELECT
  COUNT(*) FILTER (WHERE supplier_reliability_score IS NULL) AS missing_supplier_score,
  COUNT(*) FILTER (WHERE warehouse_inventory_level IS NULL) AS missing_inventory,
  COUNT(*) FILTER (WHERE shipping_method IS NULL) AS missing_shipping_method
FROM order_delay_risk;


SELECT order_id, COUNT(*)
FROM order_delay_risk
GROUP BY order_id
HAVING COUNT(*) > 1;



ALTER TABLE order_delay_risk
ADD COLUMN order_timestamp TIMESTAMP;


UPDATE order_delay_risk
SET order_timestamp = TO_TIMESTAMP(order_date, 'DD-MM-YYYY HH24:MI');




SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'order_delay_risk'
  AND column_name = 'order_date';

UPDATE order_delay_risk
SET order_timestamp = order_date::timestamp;


SELECT order_date, order_timestamp
FROM order_delay_risk
LIMIT 5;

ALTER TABLE order_delay_risk
ADD COLUMN order_day INT,
ADD COLUMN order_month INT;


UPDATE order_delay_risk
SET
  order_day = EXTRACT(DAY FROM order_timestamp),
  order_month = EXTRACT(MONTH FROM order_timestamp);



SELECT order_timestamp, order_day, order_month
FROM order_delay_risk
LIMIT 5;



SELECT 
  ROUND(AVG(delayed)::numeric * 100, 2) AS delay_percentage
FROM order_delay_risk;



SELECT 
  shipping_method,
  COUNT(*) AS total_orders,
  ROUND(AVG(delayed)::numeric * 100, 2) AS delay_rate_percent
FROM order_delay_risk
GROUP BY shipping_method
ORDER BY delay_rate_percent DESC;


SELECT 
  weather_condition,
  ROUND(AVG(delayed)::numeric * 100, 2) AS delay_rate_percent
FROM order_delay_risk
GROUP BY weather_condition
ORDER BY delay_rate_percent DESC;



