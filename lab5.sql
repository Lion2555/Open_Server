mysql> SELECT cities.region, SUM(cities.population) AS total_population
    -> FROM cities
    -> GROUP BY cities.region;
+--------+------------------+
| region | total_population |
+--------+------------------+
| N      |          3762446 |
| E      |          5754782 |
| S      |          4177039 |
| C      |          2086035 |
| W      |          2862051 |
+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT cities.region, SUM(cities.population) AS total_population
    -> FROM cities
    -> GROUP BY cities.region
    -> HAVING COUNT(cities.id) >= 10;
+--------+------------------+
| region | total_population |
+--------+------------------+
| E      |          5754782 |
| S      |          4177039 |
| W      |          2862051 |
+--------+------------------+
3 rows in set (0.00 sec)

mysql> SELECT cities.name, cities.population
    -> FROM cities
    -> JOIN regions ON cities.region = regions.uuid
    -> WHERE regions.area_quantity >= 5
    -> ORDER BY cities.population DESC
    -> LIMIT 5 OFFSET 10;
+--------------------------+------------+
| name                     | population |
+--------------------------+------------+
| Черкаси                  |     284459 |
| Хмельницький             |     267891 |
| Чернівці                 |     264427 |
| Рівне                    |     249477 |
| Кам'янське               |     240477 |
+--------------------------+------------+
5 rows in set (0.00 sec)

mysql> SELECT cities.region, SUM(cities.population) AS total_population
    -> FROM cities
    -> WHERE cities.population > 300000
    -> GROUP BY cities.region;
+--------+------------------+
| region | total_population |
+--------+------------------+
| N      |          2888470 |
| E      |          3901276 |
| S      |          3354900 |
| C      |           984423 |
| W      |          1100977 |
+--------+------------------+
5 rows in set (0.00 sec)

mysql> SELECT cities.name, cities.population
    -> FROM cities
    -> JOIN regions ON cities.region = regions.uuid
    -> WHERE regions.area_quantity <= 5
    -> AND (cities.population < 150000 OR cities.population > 500000);
+----------------------------+------------+
| name                       | population |
+----------------------------+------------+
| Київ                       |    2888470 |
| Харків                     |    1444540 |
| Одеса                      |    1010000 |
| Дніпро                     |     984423 |
| Донецьк                    |     932562 |
| Запоріжжя                  |     758011 |
| Кривий Ріг                 |     646748 |
| Керч                       |     147668 |
| Сєвєродонецьк              |     130000 |
| Хрустальний                |     124000 |
| Нікополь                   |     119627 |
| Бердянськ                  |     115476 |
| Слов'янськ                 |     115421 |
| Алчевськ                   |     111360 |
| Павлоград                  |     110144 |
| Євпаторія                  |     106115 |
| Лисичанськ                 |     103459 |
| Бровари                    |     100374 |
| Кадіївка                   |      92132 |
| Конотоп                    |      92000 |
+----------------------------+------------+
20 rows in set (0.00 sec)

mysql> Terminal close -- exit!
