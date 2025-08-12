
WITH revenue AS (
  SELECT user_id, SUM(order_amount) AS revenue
  FROM orders
  GROUP BY user_id
)
SELECT
  AVG(COALESCE(revenue,0)) AS avg_ltv
FROM revenue;
