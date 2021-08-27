USE lab_db;

-- Standardise column names -- 

ALTER TABLE `lab_db`.`customer_analysis` 
CHANGE COLUMN `UnknownColumn` `unknown_column` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer` `customer` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `State` `state` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Customer Lifetime Value` `customer_lifetime_value` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Response` `response` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Coverage` `coverage` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Education` `education` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Effective To Date` `effective_to_date` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `EmploymentStatus` `employment_status` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Gender` `gender` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Income` `income` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Location Code` `location_code` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Marital Status` `marital_status` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Monthly Premium Auto` `monthly_premium_auto` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Months Since Last Claim` `months_since_last_claim` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Months Since Policy Inception` `months_since_policy_inception` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Number of Open Complaints` `number_of_open_complaints` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Number of Policies` `number_of_policies` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Policy Type` `policy_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Policy` `policy` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Renew Offer Type` `renew_offer_type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Sales Channel` `sales_channel` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Total Claim Amount` `total_claim_amount` DOUBLE NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle Class` `vehicle_class` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle Size` `vehicle_size` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Vehicle Type` `vehicle_type` TEXT NULL DEFAULT NULL ;

-- Drop the columns 'customer', 'unknown_column' --

ALTER TABLE customer_analysis
DROP COLUMN unknown_column;

ALTER TABLE customer_analysis
DROP COLUMN customer;

-- Check the data types of all the columns and fix the incorrect ones (for ex. customer lifetime --

ALTER TABLE `lab_db`.`customer_analysis` 
CHANGE COLUMN `customer_lifetime_value` `customer_lifetime_value` INT NULL DEFAULT NULL ;



-- Discontinue safe update mode -- 
SET SQL_SAFE_UPDATES = 0;

-- Replacing null values --

SELECT number_of_open_complaints FROM customer_analysis
WHERE number_of_open_complaints NOT IN (1,2,3,4,5);

UPDATE customer_analysis
SET number_of_open_complaints = 0
WHERE number_of_open_complaints NOT IN (1,2,3,4,5);

-- Filling mising values with other values --

#TBA


-- Selecting only unique and dropping duplicate rows with ROW_NUMBER function --


WITH CTE AS (
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY 
state,
customer_lifetime_value,
response,
coverage,
education,
effective_to_date,
gender,
income,
location_code,
marital_status,
monthly_premium_auto,
months_since_last_claim,
months_since_policy_inception, 
number_of_open_complaints,
number_of_policies,
policy_type,
policy,
renew_offer_type,
sales_channel,
total_claim_amount,
vehicle_class,
vehicle_size,
vehicle_type

			
ORDER BY
state,
customer_lifetime_value,
response,
coverage

            ) row_num
		FROM customer_analysis
        ) 
        
        SELECT *   
FROM
    CTE
WHERE
    row_num = 1;
    
-- Export cleaned data into a .csv -- 