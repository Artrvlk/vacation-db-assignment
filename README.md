# ⛷️ Vacation & Skipass Management Database - Assignment 2.

A complete Dockerized MariaDB project for managing vacation reservations, ski packages, and skipasses. Made by @Artrvlk (Artur Volkov) and @nemedis21 (Timur Selivanov)

---

## 🧰 Technologies Used

- 🐬 MariaDB (inside Docker)
- 🐍 Python 3.11 (inside Docker)
- 🐳 Docker + Docker Compose
- 🧾 SQL for schema and queries

---

## 📁 Project Structure
	•	docker-compose.yml – Defines database, setup, and query services
	•	Dockerfile – Builds Python container with MariaDB connector
	•	init_db.py – Loads schema and inserts sample data into the database
	•	schema.sql – Contains SQL table definitions
	•	data.sql – Inserts 10+ rows into each table
	•	queries.sql – Includes 6 business-related SQL queries
	•	query_driver.py – Executes the queries and prints results
	•	README.md – Instructions for building and running the project

## 🚀 How to Run This Project

### 1. Clone the Repository

```bash
git clone git@github.com:Artrvlk/vacation-db-assignment.git
cd vacation-db-assignment
```

### 2. Build the database itself. 

```bash
docker-compose up --build
```

### 3. Run the SQL Queries.

```bash
docker-compose run query
```

## Database Schema Overview
	•	Customer: customer_id, name, email, phone
	•	Reservation: reservation_id, customer_id, start_date, end_date, total_price
	•	Package: package_id, name, price, type
	•	Skipass: skipass_id, type, duration_days, price
	•	ReservationPackage: many-to-many link (reservation_id, package_id)
	•	ReservationSkipass: many-to-many link (reservation_id, skipass_id)
-------------------------------------------------------------------------------------------------
# Vacation Skipass Management Database - Assignment 3

This repository contains a  project for managing vacation reservations and skipass telemetry data.

---

## 📁 Project Structure

timescale/
├── pg_schema.sql            # PostgreSQL schema definitions
├── pg_data.sql              # Sample data inserts
├── create_hypertable.sql    # Hypertable creation script
├── simulate_scans.py        # Python script simulating skipass scans
├── continuous_aggregate.sql # Continuous aggregate view definition
├── query_aggregates.py      # Python query script for aggregates
├── recreate_hypertable.sql  # (Optional) Script to reset hypertable

## Technologies Used
	•	TimescaleDB for time-series data management
	•	PostgreSQL as the database backend
	•	Python 3.11 scripts for simulation and querying
	•	Docker & Docker Compose for containerized deployment
 	• 	chunk_notes.md # Documentation of chunk exploration
## How to Run:

### 1. Start TimescaleDB
```bash
docker-compose up -d timescaledb
```
### 2. Load the PostgreSQL schema
```bash
cat timescale/pg_schema.sql | docker exec -i timescaledb psql -U pguser -d vacation_pg
```
### 3. Load sample data
```bash
cat timescale/pg_data.sql | docker exec -i timescaledb psql -U pguser -d vacation_pg
````
### 4. Create hypertable
```bash
cat timescale/create_hypertable.sql | docker exec -i timescaledb psql -U pguser -d vacation_pg
```
### 5. Run telemetry simulator (inserts skipass scan data)
```bash
docker run --rm \
  -e DB_HOST=host.docker.internal \
  -v "$PWD/timescale:/app" \
  -w /app \
  python:3.11 \
  sh -c "pip install psycopg2-binary && python simulate_scans.py"
```
### 6. Create and refresh continuous aggregate view
```bash
cat timescale/continuous_aggregate.sql | docker exec -i timescaledb psql -U pguser -d vacation_pg
```
### 7. Query the continuous aggregate (shows daily scan totals)
```bash
docker run --rm \
  -e DB_HOST=host.docker.internal \
  -v "$PWD/timescale:/app" \
  -w /app \
  python:3.11 \
  sh -c "pip install psycopg2-binary && python query_aggregates.py"
```
### 8. Explore hypertable chunks (data partitions)
```bash
docker exec -it timescaledb psql -U pguser -d vacation_pg -c "SELECT show_chunks('skipass_scan');"
```

## Project purpose:
	•	The skipass_scan table is converted into a TimescaleDB hypertable.
	•	Continuous aggregates provide fast, pre-aggregated daily scan counts per ski resort.
	•	Python scripts handle telemetry simulation and aggregate querying inside Docker.
## Comment. 
TimescaleDB automatically manages chunks to optimize storage and query performance. Use show_chunks to inspect these partitions.

## Chunk Exploration

TimescaleDB automatically partitions hypertables into chunks based on time intervals to optimize query performance.

You can list the chunks of the `skipass_scan` hypertable with:

```sql
SELECT show_chunks('skipass_scan');
````

