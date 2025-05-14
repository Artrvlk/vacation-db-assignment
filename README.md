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
├── docker-compose.yml       # Defines db, setup, query services
├── Dockerfile               # Python container with MariaDB connector
├── init_db.py               # Loads schema and sample data
├── schema.sql               # Table definitions (Customer, Reservation, etc.)
├── data.sql                 # 10+ sample rows per table
├── queries.sql              # 6 business SQL queries
├── query_driver.py          # Executes queries and prints results
└── README.md                # Project documentation

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

 
