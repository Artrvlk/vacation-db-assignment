import mariadb
import os

# Connect to the MariaDB database
try:
    conn = mariadb.connect(
        host=os.environ.get("DB_HOST", "localhost"),
        port=3306,
        user="vacation_user",
        password="userpass",
        database="vacation"
    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB: {e}")
    exit(1)

cursor = conn.cursor()

# Load and execute each SQL query from the file
def run_queries(file_path):
    with open(file_path, 'r') as f:
        content = f.read()
        queries = [q.strip() for q in content.split(';') if q.strip()]

        for i, query in enumerate(queries, start=1):
            print(f"\n--- Query {i} ---")
            try:
                cursor.execute(query)
                rows = cursor.fetchall()
                for row in rows:
                    print(row)
            except mariadb.Error as e:
                print(f"Error executing query {i}:\n{query}\n{e}")

run_queries("queries.sql")

cursor.close()
conn.close()
