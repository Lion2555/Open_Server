-- Отримати назву міста і назву регіону в якому знаходиться місто. У результат мають потрапити міста з населенням більше ніж 350 000.
select cities.name, regions.name, population from cities, regions
where regions.uuid = cities.region && population >=350000;
-- За допомогою поєднань двох таблиць отримати міста яки знаходяться у регіоні з назвою Nord.
select cities.name, regions.name  from cities, regions
where regions.uuid = cities.region && regions.name="Nord";