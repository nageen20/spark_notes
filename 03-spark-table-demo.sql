-- Databricks notebook source
-- MAGIC %md
-- MAGIC Spark SQL documentation - https://spark.apache.org/docs/latest/sql-programming-guide.html

-- COMMAND ----------

/*Create a database in the databricks

- We can view the database in the "Catalog" menu in databricks*/

create database if not exists demo_db

-- COMMAND ----------

/* Create the below table in the database using the prquet file.

Every table is stored in the database with a file format. In this case, we are using parquet format. 

We created a empty table here*/

create table if not exists demo_db.fire_service_calls_tbl(
    CallNumber integer,
    UnitID string,
    IncidentNumber integer,
    CallType string,
    CallDate string,
    WatchDate string,
    CallFinalDisposition string,
    AvailableDtTm string,
    Address string,
    City string,
    Zipcode integer,
    Battalion string,
    StationArea string,
    Box string,
    OriginalPriority string,
    Priority string,
    FinalPriority integer,
    ALSUnit boolean,
    CallTypeGroup string,
    NumAlarms integer,
    UnitType string,
    UnitSequenceInCallDispatch integer,
    FirePreventionDistrict string,
    SupervisorDistrict string,
    Neighborhood string,
    Location string,
    RowID string,
    Delay float
) using parquet

-- COMMAND ----------

/*Insert a dummy record into the above table*/

insert into demo_db.fire_service_calls_tbl
values(123,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)

-- COMMAND ----------

/*RUnning select from the table to see the output*/
select * from demo_db.fire_service_calls_tbl

-- COMMAND ----------

/* Insert into values is not usually used to load data into tables
Let us truncate the data in the existing table.
Spark doesn't offer a DELETE statement. It only gives TRUNCATE
*/

TRUNCATE TABLE demo_db.fire_service_calls_tbl

-- COMMAND ----------

/* Here we are loading data into the table using the insert into..select method.

We are loading the data from the view we created in the previous notebook*/

insert into demo_db.fire_service_calls_tbl
select * from global_temp.fire_service_calls_view

-- COMMAND ----------

select * from demo_db.fire_service_calls_tbl

-- COMMAND ----------


