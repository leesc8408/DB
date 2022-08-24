SELECT id,
CASE
WHEN gender=1 THEN '남'
WHEN gender=2 THEN '여'
END AS 성별
FROM healthcare
LIMIT 10;

SELECT age, blood_pressure,
CASE
WHEN smoking=1 THEN '비흡연'
WHEN smoking=2 THEN '흡연'
WHEN smoking=3 THEN '이러다죽어'
ELSE '묵비권'
END AS 흡연유무
FROM healthcare
LIMIT 30;

SELECT age, count(*) FROM users
GROUP BY age
ORDER BY age
LIMIT 1;
-- age  count(*)
-- ---  --------
-- 15   39

SELECT MIN(age) FROM users;
-- min(age)
-- --------
-- 15

SELECT count(*)
FROM users 
WHERE age=15;
-- count(*)
-- --------
-- 39

-- where에서 단일행 서브쿼리 사용
SELECT count(*) FROM users 
WHERE age=(SELECT min(age) 
FROM users);
-- count(*)
-- --------
-- 39

SELECT avg(balance) FROM users;
-- avg(balance)
-- ------------
-- 151456.89

SELECT count(*) FROM users
WHERE balance>(SELECT avg(balance) FROM users);
-- count(*)
-- --------
-- 222

SELECT country FROM users
WHERE last_name='이' AND first_name='은정';
-- country
-- -------
-- 전라북도
-- 경상북도

SELECT count(*) FROM users
WHERE country=(SELECT country FROM users
WHERE last_name='이' AND first_name='은정');
-- count(*)
-- --------
-- 115

-- select에서 단일행 서브쿼리 사용
SELECT count(*), avg(balance), avg(age)
FROM users;
-- count(*)  avg(balance)  avg(age)
-- --------  ------------  --------
-- 1000      151456.89     27.346

SELECT
(SELECT count(*) FROM users) AS 총원,
(SELECT avg(balance) FROM users) AS 평균연봉,
(SELECT avg(age) FROM users) AS 평균나이;
-- 총원    평균연봉       평균나이
-- ----  ---------  ------
-- 1000  151456.89  27.346

UPDATE users
SET balance=(SELECT avg(balance) FROM users);
-- 이거 하니 연봉이 평균으로 통일됨
-- 되돌리기??? 안됨

-- 테이블 지우고 새로 만들기
DROP TABLE users;
CREATE TABLE users (
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL,
    country TEXT NOT NULL,
    phone TEXT NOT NULL,
    balance INTEGER NOT NULL
);
-- 자료 불러오기
.import users.csv users
-- 아!! 삽질 잘 했다~

-- 다중컬럼 서브쿼리
SELECT last_name, first_name, min(age) FROM users
GROUP BY last_name
ORDER BY last_name
LIMIT 10;
-- last_name  first_name  min(age)
-- ---------  ----------  --------
-- 강          정수          15
-- 고          우진          15
-- 곽          현숙          15
-- 구          성현          17
-- 권          수빈          16
-- 김          서영          15
-- 나          은정          17
-- 남          예은          17
-- 노          정숙          16
-- 류          승민          15

SELECT last_name, first_name, age FROM users
WHERE (last_name, age) 
IN (SELECT last_name, min(age) FROM users
GROUP BY last_name)
ORDER BY last_name
LIMIT 10;
-- last_name  first_name  age
-- ---------  ----------  ---
-- 강          정수          15
-- 고          우진          15
-- 곽          현숙          15
-- 구          성현          17
-- 권          수빈          16
-- 김          서영          15
-- 김          서영          15
-- 나          은정          17
-- 남          예은          17
-- 노          정숙          16

-- 위 2가지 쿼리의 결과값이 미묘하게 달랐다
-- 이유를 찾아보니 가장어린 사람중 동명이인이 있었다(성까지)
-- 