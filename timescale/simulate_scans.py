import psycopg2
from datetime import datetime, timedelta, UTC
import os


conn = psycopg2.connect(
    host=os.getenv("DB_HOST", "localhost"),
    dbname="vacation_pg",
    user="pguser",
    password="pgpass"
)
cur = conn.cursor()


cur.execute("""
    CREATE TABLE IF NOT EXISTS skipass_scan (
        scan_id SERIAL PRIMARY KEY,
        skipass_id INT,
        skiresort_id INT,
        scan_time TIMESTAMPTZ
    );
""")

for i in range(5):
    cur.execute("""
        INSERT INTO skipass_scan (skipass_id, skiresort_id, scan_time)
        VALUES (%s, %s, %s)
    """, (1, 1, datetime.now(UTC) - timedelta(days=i)))

conn.commit()
print("Scan inserted")

cur.close()
conn.close()