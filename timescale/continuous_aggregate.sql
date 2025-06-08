CREATE MATERIALIZED VIEW IF NOT EXISTS skipass_scan_daily
WITH (timescaledb.continuous) AS
SELECT
  time_bucket('1 day', scan_time) AS day,
  skiresort_id,
  COUNT(*) AS total_scans
FROM skipass_scan
GROUP BY day, skiresort_id
WITH NO DATA;

CALL refresh_continuous_aggregate('skipass_scan_daily', NULL, NULL);