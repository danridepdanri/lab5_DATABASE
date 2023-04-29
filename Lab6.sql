USE "203TN";
-- a. Вибір всієї таблиці:
--SELECT * FROM Clients;
--SELECT * FROM Service_Types;
--SELECT * FROM Services;

-- b. Вибір конкретного стовпця:

--SELECT client_id FROM Clients;
--SELECT name FROM Service_Types;
--SELECT price FROM Services;

-- c. Вибірка унікальних записів:

--SELECT DISTINCT name FROM Service_Types;

--d. Вибірка з унікальною назвою стовпця:
SELECT client_id AS ID, name AS Client_Name FROM Clients;

--e. Вибір даних з конкретною кількістю записів:
SELECT TOP 2 * FROM Clients;

-- f. Вибір даних з конкретною кількістю записів починаючи з конкретного запису:

SELECT * FROM Clients ORDER BY client_id OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;


--g. Вибір даних по заданому імені:

SELECT * FROM Clients WHERE name = 'John Smith';

--h. Вибір даних за іменем використовуючи маску:

SELECT * FROM Clients WHERE name LIKE 'J%';

--i. Вибір даних по кількості використовуючи AND і OR:
SELECT * FROM Services WHERE price < 100 AND service_type_id = 9;
SELECT * FROM Services WHERE price < 100 OR service_type_id = 9;

--j. Вибір даних за допомогою команди BETWEEN:
SELECT * FROM Services WHERE price BETWEEN 100 AND 200;

--k. Вибір даних за допомогою оператора IN:
SELECT * FROM Services WHERE service_type_id IN (1,3,5);

--l. Вибір даних за зовнішнім ключем:
SELECT sp.service_provision_id, c.name AS client_name, e.name AS executor_name, s.name AS service_name, sp.cost, sp.provision_date
FROM Service_Provision sp
JOIN Clients c ON sp.client_id = c.client_id
JOIN Executors e ON sp.executor_id = e.executor_id
JOIN Services s ON sp.service_id = s.service_id;

--2. Сортування:
-- a. Від меншого до більшого:

SELECT * FROM Services ORDER BY price ASC;

--b. Від більшого до меншого:
SELECT * FROM Services ORDER BY price DESC;

--3. Групування:
-- a. Першого рівня:
SELECT service_type_id, COUNT(*) FROM Services GROUP BY service_type_id;

--b. Другого рівня з підсумковими результатами:
SELECT Service_Types.name, COUNT(Services.service_id), SUM(Services.price) 
FROM Services 
JOIN Service_Types ON Services.service_type_id = Service_Types.service_type_id 
GROUP BY Service_Types.name;

--c. З умовою:
SELECT Service_Types.name, COUNT(Services.service_id), SUM(Services.price) 
FROM Services 
JOIN Service_Types ON Services.service_type_id = Service_Types.service_type_id 
WHERE Services.price > 100 
GROUP BY Service_Types.name;
