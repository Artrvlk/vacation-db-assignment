# ⛷️ Vacation & Skipass Management Database

A fully Dockerized MariaDB project for managing vacation reservations, ski packages, and skipasses. Made by @Artrvlk and @nemedis21

---

## 🧰 Technologies Used

- 🐬 MariaDB (inside Docker)
- 🐍 Python 3.11 (inside Docker)
- 🐳 Docker + Docker Compose
- 🧾 SQL for schema and queries

---

## 📁 Project Structure
vacation-db-assignment/
├── docker-compose.yml        # Docker services: db, setup, query
├── Dockerfile                # Python image to run scripts
├── init_db.py                # Loads schema + data into MariaDB
├── schema.sql                # Table definitions
├── data.sql                  # Sample records (10+ per table)
├── queries.sql               # 6 business logic queries
├── query_driver.py           # Runs and prints SQL query results
└── README.md                 # You’re here!

---

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

 
