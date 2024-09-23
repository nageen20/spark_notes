-- Databricks notebook source
cache lazy table fire_service_calls_tbl_cache as
select * from demo_db.fire_service_calls_tbl

-- COMMAND ----------

/* Get the count of rows in the table */
select count(*) from demo_db.fire_service_calls_tbl

-- COMMAND ----------

select * from demo_db.fire_service_calls_tbl

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q1. How many distinct types of calls were made to the Fire department?

-- COMMAND ----------

select count(distinct CallType) as distinct_call_type_count 
from demo_db.fire_service_calls_tbl
where CallType is not null

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q2. What were the distinct types of calls made to the Fire Department?

-- COMMAND ----------

select distinct CallType as distinct_call_types
from demo_db.fire_service_calls_tbl
where CallType is not null

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q3. Find out all response for delayed times greater than 5 minutes?

-- COMMAND ----------

select CallNumber, Delay
from demo_db.fire_service_calls_tbl
where Delay > 5

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q4. What were the most common call types?

-- COMMAND ----------

select CallType,
        count(*) as count
from demo_db.fire_service_calls_tbl 
where CallType is not null
group by CallType
order by count desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q5. What zip code accounted for most common calls?

-- COMMAND ----------

select CallType,
        Zipcode,
        count(*) as count
from demo_db.fire_service_calls_tbl
where CallType is not null
group by CallType,
          Zipcode
order by count desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q6. What San Francisco neighborhoods are in the zip codes 94102 and 94103?

-- COMMAND ----------

select DISTINCT Zipcode,
        Neighborhood
from demo_db.fire_service_calls_tbl
where Zipcode in (94102,94103)

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q7. What was the sum of all call alarms, average, min and max of the call response time?

-- COMMAND ----------

select sum(NumAlarms),
        avg(Delay),
        min(Delay),
        max(Delay)
from demo_db.fire_service_calls_tbl

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q8. How many distinct years of data is in the data set?

-- COMMAND ----------

select distinct year(to_date(CallDate,"yyyy-MM-dd")) as year_num
from demo_db.fire_service_calls_tbl
order by year_num

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q9. What week of the year 2018 had the most fire calls?

-- COMMAND ----------

select weekofyear(to_date(CallDate,"yyyy-MM-dd")) as week_year,
        count(*) as count
from demo_db.fire_service_calls_tbl
where year(to_date(CallDate,"yyyy-MM-dd")) == 2018
group by week_year
order by count desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Q10. What neighborhoods in San Francisco had the worst response time in 2018?

-- COMMAND ----------

select Neighborhood,
        Delay
from demo_db.fire_service_calls_tbl
where year(to_date(CallDate,"yyyy-MM-dd")) == 2018
order by Delay desc

-- COMMAND ----------

-- MAGIC %md
-- MAGIC
