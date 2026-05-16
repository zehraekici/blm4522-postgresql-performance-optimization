-- Disk alanı analizi
SELECT 
    relname AS table_name,
    pg_size_pretty(pg_relation_size(relid)) AS table_size,
    pg_size_pretty(pg_indexes_size(relid)) AS indexes_size,
    pg_size_pretty(pg_total_relation_size(relid)) AS total_size
FROM pg_catalog.pg_statio_user_tables
WHERE relname IN ('payment_big', 'rental_big')
ORDER BY pg_total_relation_size(relid) DESC;

-- İndeks kullanım analizi
SELECT 
    relname AS table_name,
    indexrelname AS index_name,
    idx_scan AS usage_count,
    pg_size_pretty(pg_relation_size(indexrelid)) AS index_size
FROM pg_stat_user_indexes
WHERE relname IN ('payment_big', 'rental_big')
ORDER BY idx_scan ASC;

-- Tablo yoğunluğu ve bakım bilgisi
SELECT 
    relname AS table_name,
    n_live_tup AS live_rows,
    n_dead_tup AS dead_rows,
    last_vacuum,
    last_autovacuum,
    last_analyze,
    last_autoanalyze
FROM pg_stat_user_tables
WHERE relname IN ('payment_big', 'rental_big');

-- İstatistik güncelleme
ANALYZE payment_big;
ANALYZE rental_big;

-- Aktif sorgu izleme
-- SELECT pg_sleep(30); 
-- komutunu başka oturumda aynı anda çalıştır!!!


SELECT 
    pid,
    usename,
    datname,
    state,
    query_start,
    NOW() - query_start AS duration,
    query
FROM pg_stat_activity
WHERE state != 'idle'
ORDER BY duration DESC;

VACUUM ANALYZE payment_big;
VACUUM ANALYZE rental_big;