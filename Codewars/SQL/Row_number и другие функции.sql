
CREATE TABLE ForWindowFunc (ID INT, GroupId INT, Amount INT)
GO
 
INSERT INTO ForWindowFunc (ID, GroupId, Amount)
VALUES(1, 1, 100), (1, 1, 200), (1, 2, 150),
 (2, 1, 100), (2, 1, 300), (2, 2, 200), (2, 2, 50),
 (3, 1, 150), (3, 2, 200), (3, 2, 10);

 SELECT ID,
 Amount,
 SUM(Amount) OVER (ORDER BY id) AS SUM FROM ForWindowFunc

 SELECT ID,
GroupId,
Amount,
SUM(Amount) OVER (Partition BY id ORDER BY id, GroupId) AS SUM
FROM ForWindowFunc

SELECT ID,
GroupId,
Amount,
SUM(Amount) OVER (Partition BY id ORDER BY id, GroupId, Amount) AS SUM
FROM ForWindowFunc


SELECT ID,
Amount,
AVG(Amount) OVER (Partition BY id ORDER BY id) AS AVG
FROM ForWindowFunc


SELECT ID,
Amount,
MIN(Amount) OVER (Partition BY id ORDER BY id) AS MIN
FROM ForWindowFunc


SELECT ID,
 Amount,
 COUNT(Amount) OVER (Partition BY id ORDER BY id) AS COUNT FROM ForWindowFunc


 SELECT ID,
GroupId,
Amount,
RANK() OVER (Partition BY id ORDER BY id, GroupId, Amount) AS RANK
FROM ForWindowFunc

SELECT ID,
GroupId,
Amount,
DENSE_RANK() OVER (Partition BY id ORDER BY id, GroupId) AS DENSE_RANK
FROM ForWindowFunc


SELECT Amount,
NTILE(4) OVER(ORDER BY amount) AS Ntile
FROM ForWindowFunc


