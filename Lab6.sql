USE "203TN";
-- a. ���� �񳺿 �������:
--SELECT * FROM Clients;
--SELECT * FROM Service_Types;
--SELECT * FROM Services;

-- b. ���� ����������� �������:

--SELECT client_id FROM Clients;
--SELECT name FROM Service_Types;
--SELECT price FROM Services;

-- c. ������ ��������� ������:

--SELECT DISTINCT name FROM Service_Types;

--d. ������ � ��������� ������ �������:
SELECT client_id AS ID, name AS Client_Name FROM Clients;

--e. ���� ����� � ���������� ������� ������:
SELECT TOP 2 * FROM Clients;

-- f. ���� ����� � ���������� ������� ������ ��������� � ����������� ������:

SELECT * FROM Clients ORDER BY client_id OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;


--g. ���� ����� �� �������� ����:

SELECT * FROM Clients WHERE name = 'John Smith';

--h. ���� ����� �� ������ �������������� �����:

SELECT * FROM Clients WHERE name LIKE 'J%';

--i. ���� ����� �� ������� �������������� AND � OR:
SELECT * FROM Services WHERE price < 100 AND service_type_id = 9;
SELECT * FROM Services WHERE price < 100 OR service_type_id = 9;

--j. ���� ����� �� ��������� ������� BETWEEN:
SELECT * FROM Services WHERE price BETWEEN 100 AND 200;

--k. ���� ����� �� ��������� ��������� IN:
SELECT * FROM Services WHERE service_type_id IN (1,3,5);

--l. ���� ����� �� ������� ������:
SELECT sp.service_provision_id, c.name AS client_name, e.name AS executor_name, s.name AS service_name, sp.cost, sp.provision_date
FROM Service_Provision sp
JOIN Clients c ON sp.client_id = c.client_id
JOIN Executors e ON sp.executor_id = e.executor_id
JOIN Services s ON sp.service_id = s.service_id;

--2. ����������:
-- a. ³� ������� �� �������:

SELECT * FROM Services ORDER BY price ASC;

--b. ³� ������� �� �������:
SELECT * FROM Services ORDER BY price DESC;

--3. ����������:
-- a. ������� ����:
SELECT service_type_id, COUNT(*) FROM Services GROUP BY service_type_id;

--b. ������� ���� � ����������� ������������:
SELECT Service_Types.name, COUNT(Services.service_id), SUM(Services.price) 
FROM Services 
JOIN Service_Types ON Services.service_type_id = Service_Types.service_type_id 
GROUP BY Service_Types.name;

--c. � ������:
SELECT Service_Types.name, COUNT(Services.service_id), SUM(Services.price) 
FROM Services 
JOIN Service_Types ON Services.service_type_id = Service_Types.service_type_id 
WHERE Services.price > 100 
GROUP BY Service_Types.name;
