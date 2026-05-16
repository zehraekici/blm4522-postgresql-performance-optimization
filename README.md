# PostgreSQL Database Performance Optimization and Monitoring

Bu proje, PostgreSQL üzerinde DVD Rental örnek veritabanı kullanılarak gerçekleştirilmiş bir veritabanı performans optimizasyonu ve izleme çalışmasıdır.

## Proje Amacı

Bu çalışmada büyük hacimli bir veritabanı üzerinde:

- sorgu performans analizi,
- sorgu optimizasyonu,
- indeks yönetimi,
- disk alanı analizi,
- veri yoğunluğu ve tablo bakım kontrolü,
- aktif sorgu izleme,
- kullanıcı rol ve yetki yönetimi

uygulanmıştır.

DVD Rental veritabanı eğitim amaçlı küçük/orta ölçekli bir örnek veritabanı olduğu için performans farklarını daha net göstermek amacıyla `payment` ve `rental` tablolarından büyük test tabloları oluşturulmuştur.

## Kullanılan Teknolojiler

- macOS
- PostgreSQL
- DVD Rental sample database
- SQL
- EXPLAIN ANALYZE
- PostgreSQL system views
- pg_stat_activity
- pg_stat_user_tables
- pg_stat_user_indexes

## SQL Server Araçlarının PostgreSQL Karşılıkları

| SQL Server | PostgreSQL Karşılığı |
|---|---|
| SQL Profiler | EXPLAIN ANALYZE, pg_stat_activity, pg_stat_statements |
| Dynamic Management Views (DMV) | pg_stat_activity, pg_stat_user_tables, pg_stat_user_indexes, pg_stat_database |
| Execution Plan | EXPLAIN, EXPLAIN ANALYZE |
| Index Management | CREATE INDEX, DROP INDEX, pg_stat_user_indexes |
| Disk Usage Analysis | pg_relation_size, pg_indexes_size, pg_total_relation_size |
| Role Management | CREATE ROLE, GRANT, REVOKE |

## Veritabanı

Projede PostgreSQL için yaygın kullanılan DVD Rental örnek veritabanı kullanılmıştır.

Temel tablolar:

- customer
- film
- rental
- payment
- inventory
- staff
- store
- actor
- category

## Büyük Test Tabloları

Performans testleri için iki büyük tablo oluşturulmuştur:

- `payment_big`
- `rental_big`

Bu tablolar, mevcut DVD Rental tablolarının `generate_series()` ile çoğaltılmasıyla oluşturulmuştur.

## Proje Akışı

1. DVD Rental veritabanı yüklendi.
2. Mevcut tablolar ve kayıt sayıları kontrol edildi.
3. `payment_big` ve `rental_big` tabloları oluşturuldu.
4. İndeks öncesi sorgular `EXPLAIN ANALYZE` ile analiz edildi.
5. Sık kullanılan alanlar için indeksler oluşturuldu.
6. Aynı sorgular indeks sonrası tekrar analiz edildi.
7. İndeks kullanım istatistikleri incelendi.
8. Tablo ve indeks disk boyutları analiz edildi.
9. Aktif sorgular `pg_stat_activity` ile izlendi.
10. Veri yoğunluğu ve bakım bilgileri `pg_stat_user_tables` ile kontrol edildi.
11. Kullanıcı rolleri ve yetkileri oluşturuldu.

## Önemli Not

Bu repoda büyük veritabanı dump dosyaları paylaşılmamıştır. DVD Rental veritabanı ayrıca indirilip PostgreSQL ortamına restore edilmelidir.
