
WITH first_events AS (
  SELECT user_id,
         MIN(CASE WHEN event_name='signup' THEN event_ts END) AS signup_ts,
         MIN(CASE WHEN event_name='activation' THEN event_ts END) AS activation_ts
  FROM events
  GROUP BY user_id
)
SELECT
  COUNT(*) AS signups,
  SUM(CASE WHEN activation_ts IS NOT NULL THEN 1 ELSE 0 END) AS activations,
  ROUND(100.0 * SUM(CASE WHEN activation_ts IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS activation_rate_pct
FROM first_events;
