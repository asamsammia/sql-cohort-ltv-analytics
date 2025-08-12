# SQL Cohort & LTV Analytics

Standardized **funnel**, **cohort retention**, and **LTV** queries using CTEs and window functions.

## Why
Create a single source of truth for activation/retention metrics and lifetime value across teams/datasets.

## Tech
- SQL (Postgres/BigQuery/Snowflake compatible patterns)
- Optional: Python for orchestration + validation

## Schema Assumptions
Tables (rename as needed):
- `events(user_id, event_ts, event_name)`
- `orders(user_id, order_ts, order_amount)`
- `users(user_id, signup_ts, channel)`

## How to Run
1) Open `sql/01_funnel.sql` and adapt table names.  
2) Run `sql/02_cohorts.sql` for cohort/retention views.  
3) Run `sql/03_ltv.sql` for LTV with revenue windows.  
4) Visualize in your BI tool (Tableau/Power BI).

## Validation
- Compare daily totals to source tables (freshness/dup checks).
- Unit tests in `sql/tests/` (dbt-style optional).

## Key Results (placeholders)
- Reduced one-off metric drift by **~X%** after standardization.
- Cut ad-hoc analysis time by **~Y hours/week**.

## Notes
- Replace X/Y with real measures from your environment.
- Include a schema diagram PNG if available.
