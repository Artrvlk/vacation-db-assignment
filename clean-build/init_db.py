import mariadb
import time

# Retry logic in case MariaDB isn't ready yet
for attempt in range(10):
    try:
        conn = mariadb.connect(
            host="localhost",
            port=3306,
            user="vacation_user",
            password="userpass",
            database="vacation"
        )
        break
    except mariadb.Error as e:
        print(f"Attempt {attempt+1}: Waiting for DB to be ready...")
        time.sleep(3)
else:
    raise Exception("Could not connect to the database after 10 tries.")

cursor = conn.cursor()

# Helper to load and run SQL from a file
def execute_sql_file(filename):
    with open(filename, 'r') as f:
        sql = f.read()
        for statement in sql.strip().split(';'):
            stmt = statement.strip()
            if stmt:
                try:
                    cursor.execute(stmt)
                except mariadb.Error as e:
                    print(f"Error executing:\n{stmt}\n{e}")

# Run schema and data
print("Creating tables...")
execute_sql_file("schema.sql")

print("Inserting sample data...")
execute_sql_file("data.sql")

# Clean up
conn.commit()
cursor.close()
conn.close()

print("✅ Database setup complete.")