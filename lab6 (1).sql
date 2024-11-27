mysql> SELECT cities.name AS 'Назва міста', regions.name AS 'Назва регіону'
    -> FROM cities
    -> JOIN regions ON cities.region = regions.uuid
    -> WHERE cities.population > 350000;
+------------------------+---------------------------+
| Назва міста            | Назва регіону             |
+------------------------+---------------------------+
| Київ                   | Nord                      |
| Харків                 | East                      |
| Одеса                  | South                     |
| Дніпро                 | Center                    |
| Донецьк                | East                      |
| Запоріжжя              | East                      |
| Львів                  | West                      |
| Кривий Ріг             | South                     |
| Миколаїв               | South                     |
| Маріуполь              | South                     |
| Луганськ               | East                      |
| Севастополь            | South                     |
| Вінниця                | West                      |
+------------------------+---------------------------+
13 rows in set (0.00 sec)

mysql> SELECT cities.name AS 'Назва міста', regions.name AS 'Назва регіону'
    -> FROM cities
    -> JOIN regions ON cities.region = regions.uuid
    -> WHERE regions.name = 'Nord';
+-----------------------+---------------------------+
| Назва міста           | Назва регіону             |
+-----------------------+---------------------------+
| Київ                  | Nord                      |
| Чернігів              | Nord                      |
| Житомир               | Nord                      |
| Біла Церква           | Nord                      |
| Бровари               | Nord                      |
+-----------------------+---------------------------+
5 rows in set (0.00 sec)

mysql> notee