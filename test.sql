SELECT smoking AS 흡연, count(*) AS 인원 FROM healthcare
WHERE smoking LIKE '_%'
GROUP BY smoking;

SELECT is_drinking AS 음주, count(*) AS 인원 FROM healthcare
WHERE is_drinking LIKE '_%'
GROUP BY is_drinking;

SELECT is_drinking AS 음주, count(*) AS 인원 FROM healthcare
WHERE is_drinking LIKE '_%' AND (blood_pressure LIKE '_%') >=200 
GROUP BY is_drinking;

SELECT sido,count(sido) AS 인구수 FROM healthcare 
GROUP BY sido
HAVING count(sido)>=50000;

SELECT height AS 키, count(*) AS 인원 FROM healthcare
GROUP BY height
ORDER BY 인원 DESC
LIMIT 5;

SELECT weight AS 몸무게, height AS 키, count(*) AS 인원 FROM healthcare
GROUP BY height, weight
ORDER BY 인원 DESC
LIMIT 5;
