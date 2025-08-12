
WITH user_cohorts AS (
  SELECT
    u.user_id,
    DATE(u.signup_ts) AS cohort_date
  FROM users u
),
activations AS (
  SELECT user_id, MIN(DATE(event_ts)) AS activation_date
  FROM events
  WHERE event_name='activation'
  GROUP BY user_id
)
SELECT
  cohort_date,
  COUNT(*) AS cohort_size,
  SUM(CASE WHEN activation_date IS NOT NULL THEN 1 ELSE 0 END) AS activated,
  ROUND(100.0 * SUM(CASE WHEN activation_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS activation_pct
FROM user_cohorts c
LEFT JOIN activations a ON c.user_id=a.user_id
GROUP BY cohort_date
ORDER BY cohort_date;
