create database nifty_analysis;
use nifty_analysis;

select * from nifty limit 10;

ALTER TABLE nifty MODIFY COLUMN date DATE;

# 📊 Market Trend & Returns
## 1. What is the yearly highest and lowest closing price?
select year, max(close), min(close) from nifty group by year;

## 2. What is the yearly average closing price?
select year, avg(close) from nifty group by year;

## 3. What is the yearly average opening price?
select year, avg(open) from nifty group by year;

## 4. What is the yearly average daily return ((close-open)/open)?
select year, round(avg((close-open)/open*100),2) from nifty group by year;

## 5. Which year had the highest average daily return?
select year, round(avg((close-open)/open*100),2) as avg_return from nifty group by year order by avg_return desc;

## 6. Which year had the lowest average daily return?
select year, round(avg((close-open)/open*100),2) as avg_return from nifty group by year order by avg_return asc;

## 7. How many trading days exist in each year?
select year, count(*) from nifty group by year;

## 8. Which year had the highest market price range (max high − min low)?
select year, (max(high) - min(low)) as diff from nifty group by year order by diff desc limit 1;

# 📅 Time & Seasonality

## 9. Which month has the highest average closing price?
select month(date) as month, avg(close) from nifty group by month order by avg(close) desc limit 1;

## 10. Which month has the lowest average closing price?
select month(date) as month, avg(close) from nifty group by month order by avg(close) asc limit 1;

## 11. Which month has the highest average daily return?
select month(date) as month, round(avg((close-open)/open*100),2) as avg_return from nifty group by month order by avg_return desc;

## 12. Which weekday has the highest average return?
select dayname(date) as day, round(avg((close-open)/open*100),2) as avg_return from nifty group by day order by avg_return desc;

## 13. Which weekday has the lowest average return?
select dayname(date) as day, round(avg((close-open)/open*100),2) as avg_return from nifty group by day order by avg_return asc;

## 14. Which weekday has the highest average trading volume?
select dayname(date) as day, avg(volume) as avg_return from nifty group by day order by avg_return desc;

## 15. What is the average return per quarter?
select quarter(date) as q, round(avg((close-open)/open*100),2) as avg_return from nifty group by q;

## 16. Which quarter is most volatile on average?
select quarter(date) as q, round(avg(high-low),2) as avg_volatility from nifty group by q order by avg_volatility desc;

# 📉 Gain & Loss Behaviour

## 17. How many positive vs negative days occur in each year?
select year, sum(close>open) as positive, sum(close<open) as negative from nifty group by year;

## 18. What percentage of days close above open?
select year, round(sum(close>open)/count(*)*100,2) as positive_percent from nifty group by year;

## 19. What percentage of days close below open?
select year, round(sum(close<open)/count(*)*100,2) as negative_percent from nifty group by year;

## 20. How many days move more than +2%?
select count(*) from nifty where ((close-open)/open)*100 > 2;

## 21. How many days move more than −2%?
select count(*) from nifty where ((close-open)/open)*100 < -2;

## 22. What are the top 10 biggest gain days?
select date, round((close-open)/open*100,2) as gain from nifty order by gain desc limit 10;

## 23. What are the top 10 biggest loss days?
select date, round((close-open)/open*100,2) as loss from nifty order by loss asc limit 10;

# 📈 Volatility Analysis

## 24. What is the average intraday range (high − low) each year?
select year, round(avg(high-low),2) as intraday from nifty group by year;
 
## 25. Which year had the highest volatility?
select year, round(avg(high-low),2) as intraday from nifty group by year order by intraday desc limit 3;

## 26. Which year had the lowest volatility?
select year, round(avg(high-low),2) as intraday from nifty group by year order by intraday asc limit 3;

## 27. What are the top 10 most volatile days?
select date, high-low as intraday_day from nifty order by intraday_day desc limit 10;

## 28. What is the average daily price range per month?
select month(date) as month, round(avg(high-low),2) as intraday_month from nifty group by month;

## 29. Is volatility higher in certain quarters?
select quarter(date) as qtr, round(avg(high-low),2) as intraday_qtr from nifty group by qtr;

# 💰 Volume & Turnover

## 30. Which year had the highest average volume?
select year, avg(volume) as highest_vol from nifty group by year order by highest_vol desc limit 1;
 
## 31. Which year had the lowest average volume?
select year, avg(volume) as lowest_vol from nifty group by year order by lowest_vol asc limit 1;

## 32. What are the top 10 highest volume trading days?
select date, volume from nifty order by volume desc limit 10;

## 33. What are the top 10 highest turnover days?
select date, turnover from nifty order by turnover desc limit 10;

## 34. Does higher volume correspond to higher daily movement magnitude?
select case when volume > (select avg(volume) from nifty) then 'High Volume' else 'Low Volume' end as volume_type, round(avg(abs(close-open)/open*100),2) as avg_movement from nifty group by volume_type;

## 35. What is the average turnover per year?
select year, round(avg(turnover),2) from nifty group by year;

## 36. Which month has highest average turnover?
select month(date) as month, round(avg(turnover),2) as monthly_turnover from nifty group by month order by monthly_turnover desc limit 1;

# 📊 Price Distribution Behaviour

## 37. How often does closing price equal the day high?
select count(*) from nifty where close=high;

## 38. How often does closing price equal the day low?
select count(*) from nifty where close=low;

## 39. What percentage of days close in the upper half of the daily range?
select round(sum(close>(high+low)/2)/count(*) * 100, 2) as upper_half from nifty;

## 40. What percentage of days close in the lower half of the daily range?
select round(sum(close<(high+low)/2)/count(*) * 100, 2) as lower_half from nifty;

## 41. How frequently does the market move less than 0.5% (sideways days)?
select count(*) from nifty where (abs(close-open)/open)*100 < 0.5;

## 42. What is the distribution of daily return ranges (0–1%, 1–2%, 2–3%, >3%)?
select case when abs(close-open)/open * 100 < 1 then '0-1%' 
when abs(close-open)/open * 100 < 2 then '1-2%'
when abs(close-open)/open * 100 < 3 then '2-3%'
else '>3%' end as bucket, count(*) from nifty group by bucket;

# 🏦 Structural Market Behaviour

## 43. Did average volatility increase after 2008?
select case when year<2008 then 'Pre 2008' else 'after 2008' end as period,round(avg(high-low),2) from nifty group by period; 

## 44. Did trading volume increase over decades?
select case when year<2010 then 'First' when year<2020 then 'Second' else 'Third' end as decade, round(avg(volume),0) from nifty group by decade; -- Method 1 
select floor(year/10)*10 as decade, round(avg(volume), 0) from nifty group by decade order by decade;  -- Method 2 using floor

## 45. Are recent years showing smaller daily movements than early years?
select case when year<2014 then 'Early' else 'Recent' end as timing, round(avg(abs(close-open)/open*100),2) as movement from nifty group by timing; 

## 46. Are extreme moves (>3%) more common in certain years?
select year, count(*) as extreme from nifty where abs(close-open)/open*100 > 3 group by year order by extreme;