import pandas as pd
from src.cohort import build_cohort


def test_build_cohort_shapes():
    df = pd.DataFrame({
        'user_id': [1, 1, 2],
        'event_date': ['2025-01-10', '2025-02-10', '2025-01-15']
    })
    out = build_cohort(df, 'user_id', 'event_date')
    assert set(out.columns) == {'user_id', 'cohort', 'cohort_index'}
    assert len(out) == 3
