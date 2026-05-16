-- Roller zaten varsa CREATE ROLE hata verebilir.
-- Bu dosyayı bir kez çalıştır

CREATE ROLE db_admin LOGIN PASSWORD 'Admin123!';
CREATE ROLE performance_analyst LOGIN PASSWORD 'Analyst123!';
CREATE ROLE readonly_user LOGIN PASSWORD 'Read123!';

-- Yetki verme
GRANT ALL PRIVILEGES ON DATABASE dvdrental TO db_admin;

GRANT CONNECT ON DATABASE dvdrental TO performance_analyst;
GRANT USAGE ON SCHEMA public TO performance_analyst;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO performance_analyst;

GRANT CONNECT ON DATABASE dvdrental TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;
GRANT SELECT ON customer, film, rental, payment TO readonly_user;

-- Yetki geri alma 
REVOKE SELECT ON payment FROM readonly_user;

-- Rol kontrol
SELECT 
    rolname AS role_name,
    rolcanlogin AS can_login,
    rolsuper AS is_superuser,
    rolcreatedb AS can_create_database,
    rolcreaterole AS can_create_role
FROM pg_roles
WHERE rolname IN ('db_admin', 'performance_analyst', 'readonly_user');