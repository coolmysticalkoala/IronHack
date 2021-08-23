SELECT 
    DISTINCT length AS 'duration'
FROM
    film
LIMIT 30;

SELECT DISTINCT name as 'language'
FROM language;

SELECT DISTINCT
    store_id
FROM
    inventory; 
    
SELECT DISTINCT
    staff_id
FROM
    staff;

SELECT 
    first_name
FROM
    staff;
    
/* are the results even? SELECT duration%2 FROM bank.loan;
*/

/*SELECT function(column) FROM db.table
GROUP BY column; 

select avg(amount) from bank.loan
group by status;

select avg(amount) as Average, status from bank.loan
group by status
order by Average asc;*/


    