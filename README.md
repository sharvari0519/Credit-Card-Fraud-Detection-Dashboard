# Credit Card Fraud Detection: SQL Analysis & Dashboard

An interactive Power BI dashboard and SQL analysis project for Credit Card Fraud Detection using MySQL, Excel, DAX, and Power BI.

---

## 📌 Project Overview

This project analyzes credit card transactions to discover patterns of fraud, compare fraudulent vs. legitimate transactions, and provide a clear dashboard summary of key metrics.

The project is structured around two main components:
1. **SQL Database & Analysis (`CREDIT_CARD_FRAUD.sql`)**: Sets up a MySQL database, loads the transaction data, and runs analytical queries to extract fraud statistics, check anomaly thresholds, and filter high-value fraud cases.
2. **Dashboard Report (`credit card fraud.pdf`)**: A visual report/dashboard summarizing the findings, metrics, and trends in the transaction data.

---

## 📊 Dataset Information

The analysis uses the public **Credit Card Fraud Detection** dataset, which contains transactions made by European cardholders in September 2013.
* **Total Transactions**: 284,807
* **Features**: 30 numerical features (`V1` to `V28` resulting from a PCA transformation, `Time`, and `Amount`).
* **Target Class (`Class`)**: `0` for legitimate transactions, `1` for fraudulent transactions.
* **Dataset Link**: You can download the dataset from [Kaggle's Credit Card Fraud Detection](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud).

*Note: Due to GitHub's file size limits, the raw `creditcard.csv` dataset is excluded from the repository but can be downloaded directly from the link above.*

---

## ⚙️ Database Setup (MySQL)

To load and analyze the data locally, use the SQL commands provided in [CREDIT_CARD_FRAUD.sql](CREDIT_CARD_FRAUD.sql):

1. **Create the Database and Table**:
   ```sql
   CREATE DATABASE CREDIT_CARD_FRAUD;
   USE CREDIT_CARD_FRAUD;

   CREATE TABLE transactions (
       Time INT,
       V1 DOUBLE, V2 DOUBLE, V3 DOUBLE, V4 DOUBLE, V5 DOUBLE, V6 DOUBLE, V7 DOUBLE, V8 DOUBLE, V9 DOUBLE, V10 DOUBLE,
       V11 DOUBLE, V12 DOUBLE, V13 DOUBLE, V14 DOUBLE, V15 DOUBLE, V16 DOUBLE, V17 DOUBLE, V18 DOUBLE, V19 DOUBLE, V20 DOUBLE,
       V21 DOUBLE, V22 DOUBLE, V23 DOUBLE, V24 DOUBLE, V25 DOUBLE, V26 DOUBLE, V27 DOUBLE, V28 DOUBLE,
       Amount DECIMAL(10,2),
       Class TINYINT,
       Fraud_Label VARCHAR(20),
       Amt_Category VARCHAR(20)
   );
   ```

2. **Load Data from CSV**:
   Place your downloaded `creditcard.csv` file into the MySQL Server's secure import path (e.g., `Uploads`) and run:
   ```sql
   LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/creditcard.csv'
   INTO TABLE transactions
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   LINES TERMINATED BY '\r\n'
   IGNORE 1 ROWS;
   ```

---

## 🔍 Key SQL Queries & Analytics

Below are some of the key analysis queries run on the transaction database:

* **Calculate the Overall Fraud Percentage**:
  ```sql
  SELECT
      ROUND(SUM(Class) / COUNT(*) * 100, 2) AS Fraud_Percentage
  FROM transactions;
  ```
  *(Shows that fraud is highly imbalanced, representing approximately **0.17%** of all transactions).*

* **Average and Maximum Fraud Amount**:
  ```sql
  -- Average amount of fraud transactions
  SELECT AVG(Amount) FROM transactions WHERE Class = 1;

  -- Maximum amount of a fraud transaction
  SELECT MAX(Amount) FROM transactions WHERE Class = 1;
  ```

* **Identify High-Value Fraud Transactions (Amount > $1000)**:
  ```sql
  SELECT * FROM transactions WHERE Amount > 1000 AND Class = 1;
  ```

---

## 📈 Dashboard & Visualizations

The visual summary of these metrics is saved in the repository as **[credit card fraud.pdf](credit%20card%20fraud.pdf)**. It provides a visual breakdown of:
- Legit vs. Fraud transaction counts
- Distribution of transaction amounts for fraudulent cases
- Highlights of critical insights derived from the SQL queries
