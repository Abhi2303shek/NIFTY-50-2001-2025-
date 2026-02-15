# 📈 NIFTY 50 Market Analysis using MySQL

## 📌 Problem Statement

Financial markets generate massive amounts of daily trading data, but raw OHLC (Open-High-Low-Close) data alone does not provide actionable insights.
The goal of this project is to analyse historical **NIFTY 50 index data (2000-2025)** using pure SQL and uncover patterns related to market behaviour, volatility, trading activity, and seasonality.

This project demonstrates how SQL can be used alone for real-world financial analytics, eliminating the need for Excel, Python, or BI tools.

## 📂 Dataset

The dataset contains daily historical trading data of the NIFTY 50 index.

### Columns

| Column     | Description                        |
| ---------- | ---------------------------------- |
| `date`     | Trading date                       |
| `open`     | Opening index price                |
| `high`     | Highest price of the day           |
| `low`      | Lowest price of the day            |
| `close`    | Closing price                      |
| `volume`   | Total traded quantity              |
| `turnover` | Total traded value                 |
| `year`     | Extracted year for yearly analysis |

---

## 🎯 Objectives

The analysis aims to answer key market-behaviour questions:

### Market Trend

* Identify best and worst performing years
* Study long-term price movement patterns
* Compare market ranges across years

### Seasonality

* Best performing months and weekdays
* Quarterly performance differences
* Trading activity patterns across time

### Volatility & Risk

* Most volatile trading periods
* Extreme gain and loss days
* Changes in volatility across decades

### Trading Behaviour

* Frequency of positive vs negative days
* Sideways market occurrences
* Distribution of daily returns

### Volume & Liquidity

* Relationship between volume and price movement
* Highest activity periods
* Turnover growth across years

### Structural Market Changes

* Pre vs Post 2008 volatility comparison
* Long-term change in market movement magnitude
* Frequency of extreme price movements


## 🛠 Tools & Technologies

* **MySQL 8.0**
* MySQL Workbench
* SQL (Aggregations, Grouping, Conditional Logic, Date Functions)

> All analysis performed purely in SQL — no Python, Excel, or visualisation tools used.


## 📊 Key Learning Outcomes

* Financial time-series analysis using SQL
* Writing analytical queries for real datasets
* Identifying market behaviour patterns
* Handling large datasets inside a relational database

---

## 📎 Project Type

SQL Data Analysis Project | Finance Analytics | Portfolio Project

## 🚀 Author
Abhishek Singh 
Data Analysis Portfolio Project
