# Lab | SQL basics (selection and aggregation)

# Query 1
SELECT 
    client_id
FROM
    bank.client
WHERE
    district_id = 1
LIMIT 5;

# Query 2
SELECT 
    client_id
FROM
    client
WHERE
    district_id = 72
ORDER BY client_id DESC
LIMIT 1;

# Query 3
SELECT 
    amount
FROM
    bank.loan
ORDER BY amount ASC
LIMIT 3;

# Query 4
SELECT DISTINCT
    status
FROM
    bank.loan
ORDER BY status ASC;

# Query 5
SELECT 
    loan_id, payments
FROM
    loan
ORDER BY payments DESC
LIMIT 1;

# Query 6
SELECT 
    account_id, amount
FROM
    bank.loan
ORDER BY account_id ASC
LIMIT 5;

# Query 7
SELECT 
    account_id
FROM
    bank.loan
WHERE
    duration = 60
ORDER BY amount ASC;

# Query 8
SELECT DISTINCT
    k_symbol
FROM
    bank.order;
    
# Query 9    
SELECT 
    order_id
FROM
    bank.order
WHERE
    account_id = 34;
    
# Query 10    
SELECT DISTINCT
    account_id
FROM
    bank.order
WHERE
    order_id >= 29540 AND order_id <= 29560;
    
# Query 11
SELECT 
    amount
FROM
    bank.order
WHERE
    account_to = 30067122;
    
# Query 12    
SELECT 
    trans_id, date, type, amount
FROM
    bank.trans
WHERE
    account_id = 793
ORDER BY date DESC;

# Query 13
SELECT 
    district_id, COUNT(client_id)
FROM
    bank.client
WHERE
    district_id < 10
GROUP BY district_id
ORDER BY district_id ASC;

# Query 14
SELECT 
    type, COUNT(type)
FROM
    bank.card
GROUP BY type;

# Query 15
SELECT 
    account_id, AVG(amount) AS total
FROM
    bank.loan
GROUP BY account_id
ORDER BY total DESC
LIMIT 10;

# Query 16
SELECT 
    date, COUNT(loan_id)
FROM
    bank.loan
GROUP BY date
HAVING date < 930907
ORDER BY date DESC; 

# Query 17
SELECT 
    date, duration, COUNT(loan_id)
FROM
    bank.loan
GROUP BY date
HAVING date LIKE '97%'
ORDER BY date and duration ASC;

# Query 18
SELECT 
    account_id, type, SUM(amount) AS total_amount
FROM
    bank.trans
WHERE
    account_id = 396
GROUP BY type
ORDER BY total_amount ASC;

# Query 19
SELECT 
    account_id,
    type AS transaction_type,
    floor(SUM(amount)) AS total_amount,
(CASE
	WHEN type = "PRIJEM" THEN "INCOMING"
	WHEN type = "VYDAJ" THEN "OUTGOING"
END) as transaction_type_English
FROM
    bank.trans
WHERE
    account_id = 396
GROUP BY type
ORDER BY total_amount ASC;


# Query 20
SELECT account_id,

floor(SUM(IF(type = 'PRIJEM', amount, 0))) AS incoming,
floor(SUM(IF(type = 'VYDAJ', amount, 0))) AS outgoing,
floor(SUM(IF(type = 'PRIJEM', amount, 0))) - floor(SUM(IF(type = 'VYDAJ', amount, 0))) AS difference
from bank.trans
WHERE account_id = 396 
GROUP BY account_id;


























