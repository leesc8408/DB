-- 1 
SELECT * FROM playlist_track AS A
ORDER BY PlaylistId DESC
LIMIT 5;
-- PlaylistId  TrackId
-- ----------  -------
-- 18          597
-- 17          3290
-- 17          2096
-- 17          2095
-- 17          2094

-- 2
SELECT * FROM tracks AS B 
ORDER BY TrackId ASC
LIMIT 5;
-- TrackId  Name                                     AlbumId  MediaTypeId  GenreId  Composer                                                      Milliseconds  Bytes     UnitPrice
-- -------  ---------------------------------------  -------  -----------  -------  ------------------------------------------------------------  ------------  --------  ---------
-- 1        For Those About To Rock (We Salute You)  1        1            1        Angus Young, Malcolm Young, Brian Johnson                     343719    
--     11170334  0.99
-- 
-- 2        Balls to the Wall                        2        2            1                                                                      342562    
--     5510424   0.99
-- 
-- 3        Fast As a Shark                          3        2            1        F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman           230619    
--     3990994   0.99
-- 
-- 4        Restless and Wild                        3        2            1        F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider &   252051    
--     4331779   0.99
--                                                                                  W. Hoffman
-- 
-- 
-- 5        Princess of the Dawn                     3        2            1        Deaffy & R.A. Smith-Diesel                                    375418    
--     6290521   0.99

-- 3 
SELECT * FROM tracks 
LIMIT 10;

SELECT A.PlaylistId, B.Name
FROM playlist_track AS A JOIN tracks AS B
ON A.TrackId = B.TrackId 
ORDER BY A.PlaylistId DESC 
LIMIT 10;
-- PlaylistId  Name
-- ----------  -----------------------
-- 18          Now's The Time
-- 17          The Zoo
-- 17          Flying High Again
-- 17          Crazy Train
-- 17          I Don't Know
-- 17          Looks That Kill
-- 17          Live To Win
-- 17          Ace Of Spades
-- 17          Creeping Death
-- 17          For Whom The Bell Tolls

-- 4 
SELECT A.PlaylistId, B.Name
FROM playlist_track AS A JOIN tracks AS B
ON A.TrackId = B.TrackId 
WHERE A.PlaylistId = 10
ORDER BY B.Name DESC 
LIMIT 5;
-- PlaylistId  Name
-- ----------  ------------------------
-- 10          Women's Appreciation
-- 10          White Rabbit
-- 10          Whatever the Case May Be
-- 10          What Kate Did
-- 10          War of the Gods, Pt. 2

-- 5 
SELECT count(*)
FROM tracks AS A JOIN artists AS B 
ON A.Composer = B.Name;
-- count(*)
-- --------
-- 402

-- 6 
SELECT count(*)
FROM tracks AS A LEFT JOIN artists AS B 
ON A.Composer = B.Name;
-- count(*)
-- --------
-- 3503

-- 7 
SELECT A.Composer,B.Name
FROM tracks AS A JOIN artists AS B 
ON A.Composer = B.Name
LIMIT 10;
SELECT A.Composer,B.Name
FROM tracks AS A LEFT JOIN artists AS B 
ON A.Composer = B.Name
LIMIT 10;

SELECT *
FROM tracks
LIMIT 5;
SELECT *
FROM tracks AS A LEFT JOIN artists AS B 
ON A.Composer = B.Name
LIMIT 5;

--  확인

-- 8 
SELECT InvoiceLineId, InvoiceId 
FROM invoice_items 
ORDER BY InvoiceId ASC
LIMIT 5;
-- InvoiceLineId  InvoiceId
-- -------------  ---------
-- 1              1
-- 2              1
-- 3              2
-- 4              2
-- 5              2

-- 9 
SELECT InvoiceId, CustomerId 
FROM invoices
ORDER BY InvoiceId ASC
LIMIT 5;
-- InvoiceId  CustomerId
-- ---------  ----------
-- 1          2
-- 2          4
-- 3          8
-- 4          14
-- 5          23

-- 10 
SELECT A.InvoiceLineId, B.InvoiceId 
FROM invoice_items AS A JOIN invoices AS B
ON A.InvoiceId = B.InvoiceId
ORDER BY A.InvoiceId DESC
LIMIT 5;
-- InvoiceLineId  InvoiceId
-- -------------  ---------
-- 2240           412
-- 2239           411
-- 2238           411
-- 2237           411
-- 2236           411

-- 11 
SELECT A.InvoiceId, B.CustomerId 
FROM invoices AS A JOIN customers AS B
ON A.CustomerId = B.CustomerId
ORDER BY A.InvoiceId DESC
LIMIT 5;
-- InvoiceId  CustomerId
-- ---------  ----------
-- 412        58
-- 411        44
-- 410        35
-- 409        29
-- 408        25

-- 12 
SELECT A.InvoiceLineId, B.InvoiceId, C.CustomerId
FROM invoice_items AS A 
JOIN invoices AS B ON A.InvoiceId = B.InvoiceId
JOIN customers AS C ON B.CustomerId = C.CustomerId
ORDER BY A.InvoiceId DESC
LIMIT 5;
-- InvoiceLineId  InvoiceId  CustomerId
-- -------------  ---------  ----------
-- 2240           412        58
-- 2239           411        44
-- 2238           411        44
-- 2237           411        44
-- 2236           411        44

-- 13
SELECT A.CustomerId, C.count(*) AS '개수'
FROM customers AS A 
JOIN invoices AS B ON A.CustomerId = B.CustomerId
JOIN invoice_items AS C ON B.InvoiceId = C.InvoiceId
ORDER BY A.CustomerId ASC
LIMIT 5;

SELECT * FROM invoice_items LIMIT 10;
SELECT count(*) FROM customers LIMIT 10;
SELECT count(*) FROM invoices LIMIT 10;
SELECT CustomerId, count(*) FROM invoices
GROUP BY CustomerId
ORDER BY InvoiceId ASC
LIMIT 10;