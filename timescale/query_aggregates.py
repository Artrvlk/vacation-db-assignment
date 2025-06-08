import psycopg2
import os


conn = psycopg2.connect(
    host=os.getenv("DB_HOST", "localhost"),
    dbname="vacation_pg",
    user="pguser",
    password="pgpass"
)
cur = conn.cursor()


cur.execute("SELECT * FROM skipass_scan_daily ORDER BY day DESC;")
rows = cur.fetchall()

print("Daily Skipass Scans:")
for row in rows:
    print(f"Date: {row[0]}, Resort: {row[1]}, Scans: {row[2]}")

cur.close()
conn.close()