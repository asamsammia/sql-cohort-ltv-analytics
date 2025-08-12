# SQL Cohort & LTV Analytics

Cohort retention and lifetime value analysis with SQL-first approach.

## Quickstart
```bash
python -m venv .venv && source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
pytest
```

## Structure
- `src/cohort.py` – in-Python helpers mirroring SQL logic
- `sql/` – example cohort queries (ANSI SQL)
- `notebooks/01_exploration.ipynb` – cohort tables & charts
- `tests/` – minimal unit tests
