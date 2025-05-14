FROM python:3.11

WORKDIR /app

COPY init_db.py schema.sql data.sql query_driver.py queries.sql ./

RUN pip install mariadb

CMD ["python", "init_db.py"]