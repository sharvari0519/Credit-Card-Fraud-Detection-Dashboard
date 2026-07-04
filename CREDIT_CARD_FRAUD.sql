CREATE DATABASE CREDIT_CARD_FRAUD;
USE CREDIT_CARD_FRAUD;
CREATE TABLE transactions (
    Time INT,
    V1 DOUBLE,
    V2 DOUBLE,
    V3 DOUBLE,
    V4 DOUBLE,
    V5 DOUBLE,
    V6 DOUBLE,
    V7 DOUBLE,
    V8 DOUBLE,
    V9 DOUBLE,
    V10 DOUBLE,
    V11 DOUBLE,
    V12 DOUBLE,
    V13 DOUBLE,
    V14 DOUBLE,
    V15 DOUBLE,
    V16 DOUBLE,
    V17 DOUBLE,
    V18 DOUBLE,
    V19 DOUBLE,
    V20 DOUBLE,
    V21 DOUBLE,
    V22 DOUBLE,
    V23 DOUBLE,
    V24 DOUBLE,
    V25 DOUBLE,
    V26 DOUBLE,
    V27 DOUBLE,
    V28 DOUBLE,
    Amount DECIMAL(10,2),
    Class TINYINT,
    Fraud_Label VARCHAR(20),
    Amt_Category VARCHAR(20)
);

DROP TABLE transactions;
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/creditcard.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) FROM transactions;
select count(*) from transactions where class=1;
select count(*)from transactions where class=0;
SELECT
ROUND(
SUM(Class)/COUNT(*)*100,
2
) AS Fraud_Percentage
FROM transactions;
select avg(Amount) from transactions where class=1;
select max(Amount) from transactions where class=1;
select max(Amount)from transactions where class=0;
select * from transactionS where class=1 
order by Amount desc
LIMIT 20;
SELECT * FROM transactions where Amount>1000;
select * from transactions where Amount>1000 and class=1;
SHOW DATABASES;
select * from transactions;