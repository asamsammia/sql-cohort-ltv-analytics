import pandas as pd


def build_cohort(df: pd.DataFrame, user_col: str, date_col: str) -> pd.DataFrame:
    """Return cohort index and month offsets per user."""
    d = df[[user_col, date_col]].dropna().copy()
    d[date_col] = pd.to_datetime(d[date_col])
    d['cohort'] = d.groupby(user_col)[date_col].transform('min').dt.to_period('M')
    d['month'] = d[date_col].dt.to_period('M')
    d['cohort_index'] = (d['month'] - d['cohort']).apply(lambda x: x.n)
    return d[[user_col, 'cohort', 'cohort_index']]
