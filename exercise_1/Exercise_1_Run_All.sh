#! /bin/bash

# save my current working directory
MY_CWD=$(pwd)

# start Spark-SQL
spark-sql

# in Spark-SQL, run .sql file to create table of best hospitals
source /home/w205/w205_2017_fall/exercise_1/investigations/best_hospitals/best_hospitals.sql;

# exit Spark-SQL
exit;

# change directory back to the original
cd $MY_CWD

# clean exit
exit