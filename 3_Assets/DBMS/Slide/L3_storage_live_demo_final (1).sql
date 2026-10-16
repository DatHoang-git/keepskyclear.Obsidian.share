/*
L3 Storage Live Demo — MySQL 8.x / InnoDB
Goal: predict -> load -> measure -> calculate -> explain.
Recommended classroom scale: 100000 rows. For weaker machines, use 10000.
*/

DROP DATABASE IF EXISTS l3_demo;
CREATE DATABASE l3_demo;
USE l3_demo;

SELECT VERSION() AS mysql_version;
SHOW VARIABLES LIKE 'innodb_page_size';
SHOW VARIABLES LIKE 'innodb_buffer_pool_size';

-- CREATE TABLE storage_narrow (
--   id BIGINT PRIMARY KEY,
--   code CHAR(10),
--   created_at DATETIME
-- ) ENGINE = InnoDB;
-- 
-- CREATE TABLE storage_wide (
--   id BIGINT PRIMARY KEY,
--   code CHAR(10),
--   description VARCHAR(500),
--   created_at DATETIME
-- ) ENGINE = InnoDB;
-- 
-- DELIMITER $$
-- DROP PROCEDURE IF EXISTS load_storage_demo $$
-- CREATE PROCEDURE load_storage_demo(IN p_rows INT)
-- BEGIN
--   DECLARE i INT DEFAULT 1;
--   DECLARE batch_size INT DEFAULT 1000;
--   DECLARE upper_i INT;
-- 
--   WHILE i <= p_rows DO
--     SET upper_i = LEAST(i + batch_size - 1, p_rows);
-- 
--     INSERT INTO storage_narrow(id, code, created_at)
--     WITH RECURSIVE seq(n) AS (
--       SELECT i
--       UNION ALL
--       SELECT n + 1 FROM seq WHERE n < upper_i
--     )
--     SELECT
--       n,
--       LPAD(n MOD 100000, 10, '0'),
--       TIMESTAMP('2026-01-01') + INTERVAL (n MOD 365) DAY
--     FROM seq;
-- 
--     INSERT INTO storage_wide(id, code, description, created_at)
--     WITH RECURSIVE seq(n) AS (
--       SELECT i
--       UNION ALL
--       SELECT n + 1 FROM seq WHERE n < upper_i
--     )
--     SELECT
--       n,
--       LPAD(n MOD 100000, 10, '0'),
--       RPAD(CONCAT('payload-', n, '-'), 220 + (n MOD 220), 'x'),
--       TIMESTAMP('2026-01-01') + INTERVAL (n MOD 365) DAY
--     FROM seq;
-- 
--     SET i = upper_i + 1;
--   END WHILE;
-- END $$
-- DELIMITER ;
-- 
-- -- Change scale here if needed: 10000, 100000, 500000, 1000000.
-- CALL load_storage_demo(100000);
-- 
-- ANALYZE TABLE storage_narrow, storage_wide;
-- 
-- SELECT 'Exact row counts' AS section;
-- SELECT 'storage_narrow' AS table_name, COUNT(*) AS exact_rows FROM storage_narrow
-- UNION ALL
-- SELECT 'storage_wide', COUNT(*) FROM storage_wide;
-- 
-- SELECT 'Footprint before secondary index' AS section;
-- SELECT
--   table_name,
--   table_rows,
--   avg_row_length,
--   data_length,
--   index_length,
--   data_free,
--   ROUND((data_length + index_length) / 1024 / 1024, 2) AS total_mib
-- FROM information_schema.tables
-- WHERE table_schema = 'l3_demo'
--   AND table_name IN ('storage_narrow', 'storage_wide')
-- ORDER BY table_name;
-- 
-- -- Add a secondary index to show that access paths also occupy storage.
-- CREATE INDEX idx_wide_code ON storage_wide(code);
-- ANALYZE TABLE storage_wide;
-- 
-- SELECT 'Footprint after secondary index' AS section;
-- SELECT
--   table_name,
--   table_rows,
--   data_length,
--   index_length,
--   data_free,
--   ROUND(data_length / @@innodb_page_size, 0) AS approx_data_pages,
--   ROUND(index_length / @@innodb_page_size, 0) AS approx_index_pages,
--   ROUND((data_length + index_length) / (SELECT COUNT(*) FROM storage_wide), 2) AS physical_bytes_per_row
-- FROM information_schema.tables
-- WHERE table_schema = 'l3_demo'
--   AND table_name = 'storage_wide';
-- 
-- -- Buffer pool observation. Run these before and after the workload and compute deltas.
-- SHOW GLOBAL STATUS LIKE 'Innodb_buffer_pool_read%';
-- 
-- SELECT COUNT(*) AS rows_with_code_prefix
-- FROM storage_wide
-- WHERE code LIKE '00000%';
-- 
-- SHOW GLOBAL STATUS LIKE 'Innodb_buffer_pool_read%';
-- 
-- /*
-- Student calculations:
-- 1. PhysicalBytesPerRow = (DATA_LENGTH + INDEX_LENGTH) / COUNT(*)
-- 2. DataPagesApprox = DATA_LENGTH / innodb_page_size
-- 3. IndexPagesApprox = INDEX_LENGTH / innodb_page_size
-- 4. Error(%) = (Measured - Estimated) / Estimated * 100
-- 5. ProjectedSize(N_target) = PhysicalBytesPerRow * N_target
-- */
