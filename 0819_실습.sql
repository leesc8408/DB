-- 1
.tables
-- albums          employees       invoices        playlists
-- artists         genres          media_types     tracks
-- customers       invoice_items   playlist_track

-- 2
.schema invoices

-- 3
SELECT * FROM albums
GROUP BY Title
ORDER BY Title DESC
LIMIT 5;
-- AlbumId  Title                         ArtistId
-- -------  ----------------------------  --------
-- 208      [1997] Black Light Syndrome   136
-- 240      Zooropa                       150
-- 267      Worlds                        202
-- 334      Weill: The Seven Deadly Sins  264
-- 8        Warner 25 Anos                6

-- 4
SELECT count(*) AS '고객 수' FROM customers;
-- 고객 수
-- ----
-- 59

-- 5
SELECT FirstName AS '이름', LastName AS '성' FROM customers
WHERE Country='USA'
ORDER BY 이름 DESC
LIMIT 5;
-- 이름        성
-- --------  ----------
-- Victor    Stevens
-- Tim       Goyer
-- Richard   Cunningham
-- Patrick   Gray
-- Michelle  Brooks

-- 6
SELECT count(*) AS '송장수' FROM invoices
WHERE BillingPostalCode IS NOT NULL;
-- 송장수
-- ---
-- 384

-- 7
SELECT * FROM invoices
WHERE BillingState IS NULL
ORDER BY InvoiceDate DESC
LIMIT 5;
-- InvoiceId  CustomerId  InvoiceDate          BillingAddress                            BillingCity   BillingState  BillingCountry  BillingPostalCode  Total
-- ---------  ----------  -------------------  ----------------------------------------  ------------  ------------  --------------  -----------------  -----
-- 412        58          2013-12-22 00:00:00  12,Community Centre                       Delhi                       India           110017             1.99
-- 411        44          2013-12-14 00:00:00  Porthaninkatu 9                           Helsinki                    Finland         00530              13.86
-- 410        35          2013-12-09 00:00:00  Rua dos Campeoes Europeus de Viena, 4350  Porto                       Portugal                           8.91
-- 404        6           2013-11-13 00:00:00  Rilska 3174/6                             Prague                      Czech Republic  14300              25.86
-- 403        56          2013-11-08 00:00:00  307 Macacha Guemes                        Buenos Aires                Argentina       1106               8.91

-- 8
SELECT strftime('%Y', InvoiceDate) FROM invoices
LIMIT 10;

SELECT count(*) FROM invoices
WHERE strftime('%Y', InvoiceDate) = '2013';
-- count(*)
-- --------
-- 80

-- 9
SELECT CustomerId AS '고객ID', FirstName AS '이름', LastName AS '성'
FROM customers
WHERE FirstName LIKE 'L%'
ORDER BY 고객ID ASC;
-- 고객ID  이름        성
-- ----  --------  ---------
-- 1     Luis      Goncalves
-- 2     Leonie    Kohler
-- 45    Ladislav  Kovacs
-- 47    Lucas     Mancini
-- 57    Luis      Rojas

-- 10
SELECT count(*) as '고객 수',country AS '나라'
FROM customers
GROUP BY country
ORDER BY [고객 수] DESC
LIMIT 5;
-- 고객 수  나라
-- ----  -------
-- 13    USA
-- 8     Canada
-- 5     France
-- 5     Brazil
-- 4     Germany

-- 11
SELECT ArtistId, count(*) FROM albums
GROUP BY ArtistId
