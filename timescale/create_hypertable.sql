CREATE TABLE skipass_scan (
    scan_id SERIAL PRIMARY KEY,
    skipass_id INT,
    skiresort_id INT,
    scan_time TIMESTAMPTZ NOT NULL
);


SELECT create_hypertable('skipass_scan', 'scan_time');