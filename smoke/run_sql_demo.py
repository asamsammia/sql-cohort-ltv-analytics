
import sqlite3, os

db_path = os.path.join(os.path.dirname(__file__), "demo.db")
conn = sqlite3.connect(db_path)
cur = conn.cursor()

def run_sql(name):
    path = os.path.join(os.path.dirname(__file__), "..", "sql", name)
    with open(path, "r", encoding="utf-8") as f:
        q = f.read()
    cur.execute(q)
    rows = cur.fetchall()
    print(f"\n-- Samih-ProAnalyst-(JL225).pdf --")
    for r in rows:
        print(r)

for q in ["01_funnel.sql", "02_cohorts.sql", "03_ltv.sql"]:
    run_sql(q)
