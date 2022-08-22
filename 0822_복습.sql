SELECT users.id, users.name, role.title
FROM users INNER JOIN role
ON users.role_id = role.id;
-- id  name  title
-- --  ----  -----
-- 1   관리자   admin
-- 2   김철수   staff
-- 3   이영희   staff

SELECT *
FROM users INNER JOIN role
ON users.role_id = role.id
WHERE role.id = 2;

SELECT *
FROM users INNER JOIN role
ON users.role_id = role.id
ORDER BY users.name DESC;

SELECT *
FROM articles LEFT OUTER JOIN users
ON articles.user_id = users.id;

SELECT *
FROM users RIGHT OUTER JOIN articles
ON users.id = articles.user_id;

SELECT *
FROM articles LEFT OUTER JOIN users
ON articles.user_id = users.id
WHERE articles.user_id IS NOT NULL;

SELECT * 
FROM articles FULL OUTER JOIN users
    ON articles.user_id = users.id;
-- id  title  content  user_id   id   name  role_id
-- --  -----  -------  -------   --   ----  -------
-- 1   1번글    111      1        1   관리자   1
-- 2   2번글    222      2        2   김철수   2
-- 3   3번글    333      1        1   관리자   1
-- 4   4번글    444
--                                3   이영희   2

SELECT * 
FROM users CROSS JOIN articles;

SELECT *
FROM users
JOIN articles ON users.id = articles.user_id
JOIN role ON users.role_id = role.id;

-- 새 테이블 자료 만들기
CREATE TABLE persons (
    id int PRIMARY KEY,
    firt_name text,
    last_name text,
    j_id int
);

INSERT INTO persons VALUES 
    (1, '철수', '김', 3),
    (2, '영희', '안', 2),
    (3, '민준', '이', 1),
    (4, '빈', '현', 4);

CREATE TABLE jobs (
    id int PRIMARY KEY,
    job text
);

INSERT INTO jobs VALUES 
    (1, '목수'),
    (2, '디자이너'),
    (3, '개발자'),
    (4, '배우');

CREATE TABLE instar (
    id int PRIMARY KEY,
    follow text,
    f_id
);

INSERT INTO instar VALUES 
    (1, '5만', 3),
    (2, '500만', 4),
    (3, '2000', 1),
    (4, '40만', 2);

SELECT * FROM persons;
SELECT * FROM jobs;
SELECT * FROM instar;
-- 확인

SELECT *
FROM persons INNER JOIN jobs
ON persons.j_id = jobs.id;
-- id  first_name  last_name  j_id  id  job
-- --  ----------  ---------  ----  --  ----
-- 1   철수          김          3     3   개발자
-- 2   영희          안          2     2   디자이너
-- 3   민준          이          1     1   목수
-- 4   빈           현          4     4   배우

SELECT persons.id, persons.last_name||persons.first_name, jobs.job
FROM persons INNER JOIN jobs
ON persons.j_id = jobs.id
ORDER BY persons.id ASC;
-- 오류

-- 컬럼명에 오타 확인 수정
ALTER TABLE persons
RENAME COLUMN firt_name TO first_name;
SELECT * FROM persons;
-- 확인 
-- id  first_name  last_name  j_id
-- --  ----------  ---------  ----
-- 1   철수          김          3
-- 2   영희          안          2
-- 3   민준          이          1
-- 4   빈           현          4

SELECT * 
FROM instar LEFT OUTER JOIN persons
ON persons.id = instar.f_id;
-- id  follow  f_id  id  first_name  last_name  j_id
-- --  ------  ----  --  ----------  ---------  ----
-- 1   5만      3     3   민준          이          1
-- 2   500만    4     4   빈           현          4
-- 3   2000    1     1   철수          김          3
-- 4   40만     2     2   영희          안          2

-- 테이블명,컬럼명 순서가 바뀌었을때 출력 확인
SELECT *
FROM persons LEFT OUTER JOIN instar
ON instar.f_id = persons.id;
-- id  first_name  last_name  j_id  id  follow  f_id
-- --  ----------  ---------  ----  --  ------  ----
-- 1   철수          김          3     3   2000    1
-- 2   영희          안          2     4   40만     2
-- 3   민준          이          1     1   5만      3
-- 4   빈           현          4     2   500만    4

SELECT * 
FROM persons LEFT OUTER JOIN instar
ON persons.id = instar.f_id;
-- id  first_name  last_name  j_id  id  follow  f_id
-- --  ----------  ---------  ----  --  ------  ----
-- 1   철수          김          3     3   2000    1
-- 2   영희          안          2     4   40만     2
-- 3   민준          이          1     1   5만      3
-- 4   빈           현          4     2   500만    4

SELECT * 
FROM instar LEFT OUTER JOIN persons
ON instar.f_id = persons.id;
-- id  follow  f_id  id  first_name  last_name  j_id
-- --  ------  ----  --  ----------  ---------  ----
-- 1   5만      3     3   민준          이          1
-- 2   500만    4     4   빈           현          4
-- 3   2000    1     1   철수          김          3
-- 4   40만     2     2   영희          안          2
-- on뒤에 컬럼명의 순서는 바뀌어도 동일하나 
-- form에 테이블명이 바뀌면 출력 바뀜

SELECT last_name||first_name AS '성명', jobs.job AS '직업', instar.follow
FROM persons 
INNER JOIN jobs ON persons.j_id = jobs.id 
INNER JOIN instar ON persons.j_id = instar.f_id
;
-- 성명   직업    follow
-- ---  ----  ------
-- 김철수  개발자   5만
-- 현빈   배우    500만
-- 이민준  목수    2000
-- 안영희  디자이너  40만

SELECT last_name||first_name AS '성명', jobs.job AS '직업', instar.follow
FROM persons 
INNER JOIN jobs ON persons.j_id = jobs.id 
INNER JOIN instar ON persons.j_id = instar.f_id
ORDER BY jobs.id ASC
;
-- 성명   직업    follow
-- ---  ----  ------
-- 이민준  목수    2000
-- 안영희  디자이너  40만
-- 김철수  개발자   5만
-- 현빈   배우    500만

-- follows룰 int로 변경
SELECT * FROM instar;
ALTER TABLE instar
DROP COLUMN follows;

ALTER TABLE instar
ADD COLUMN follows int NULL;

INSERT INTO instar VALUES(1,3,2000);
UPDATE instar SET follows = 200
WHERE id = 1;
UPDATE instar SET follows = 2000
WHERE id = 2;
UPDATE instar SET follows = 200000
WHERE id = 3;
UPDATE instar SET follows = 4000000
WHERE id = 4;

ALTER TABLE instar
RENAME follows TO follow;

SELECT last_name||first_name AS '성명', jobs.job AS '직업', instar.follow
FROM persons 
INNER JOIN jobs ON persons.j_id = jobs.id 
INNER JOIN instar ON persons.id = instar.f_id
ORDER BY jobs.id ASC;