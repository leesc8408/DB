--1
SELECT smoking AS 흡연, count(*) AS 인원 FROM healthcare
WHERE smoking LIKE '_%'
GROUP BY smoking;
--2
SELECT is_drinking AS 음주, count(*) AS 인원 FROM healthcare
WHERE is_drinking LIKE '_%'
GROUP BY is_drinking;
--3
SELECT is_drinking AS 음주, count(*) AS 인원 FROM healthcare
WHERE blood_pressure>=200 AND blood_pressure LIKE '_%'
GROUP BY is_drinking
HAVING is_drinking LIKE '_%';
--4
SELECT sido,count(sido) AS 인구수 FROM healthcare 
GROUP BY sido
HAVING count(sido)>=50000;
--5
SELECT height AS 키, count(*) AS 인원 FROM healthcare
GROUP BY height
ORDER BY 인원 DESC
LIMIT 5;
--6
SELECT weight AS 몸무게, height AS 키, count(*) AS 인원 FROM healthcare
GROUP BY height, weight
ORDER BY 인원 DESC
LIMIT 5;
--7
SELECT is_drinking AS 음주, avg(waist) AS 허리, count(*) AS 인원 FROM healthcare
WHERE waist LIKE '_%' AND is_drinking LIKE '_%' 
GROUP BY is_drinking;
--8
SELECT gender AS 성별, round(avg(va_left),2) AS '평균 왼쪽 시력',
round(avg(va_right),2) AS '평균 오른쪽 시력' FROM healthcare
WHERE va_left LIKE '_%' AND va_right LIKE '_%'
GROUP BY gender
HAVING gender LIKE '_%';
--9
SELECT age, avg(height) AS '평균 키',avg(weight) AS  '평균 몸무게' FROM healthcare
WHERE weight LIKE '_%' AND height LIKE '_%' AND age LIKE '_%'
GROUP BY age
HAVING avg(height)>=160 AND avg(weight)>=60;
--10
SELECT is_drinking, smoking, avg(weight*10000/(height*height)) AS BMI FROM healthcare
WHERE is_drinking LIKE '_%' AND smoking LIKE '_%'
GROUP BY is_drinking, smoking;


--0819
SELECT count(*)
FROM users
WHERE balance>(SELECT avg(balance) FROM users)
;

---
SELECT count(*),round(avg(balance)), round(avg(age)) FROM users;

SELECT country, count(*) FROM users
WHERE country IN (SELECT country FROM users
WHERE last_name='이' AND first_name='은정')
GROUP BY country;

SELECT last_name||first_name, age FROM users
WHERE age=(SELECT min(age) FROM users GROUP BY last_name)
GROUP BY last_name;



