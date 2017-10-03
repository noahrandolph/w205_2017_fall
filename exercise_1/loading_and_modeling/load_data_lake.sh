#! /bin/bash

# save my current directory
MY_CWD=$(pwd)

# creating staging directories
mkdir ~/staging
mkdir ~/staging/exercise_1

# change to staging directory
cd ~/staging/exercise_1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/4a66c672-a92a-4ced-82a2-033c28581a90?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

#unzip the medicare data
unzip medicare_data.zip

# remove first line of files and rename
#1
OLD_FILE_1="Hospital General Information.csv"
NEW_FILE_1="hospitals.csv"
tail -n +2 "$OLD_FILE_1" >$NEW_FILE_1

#2
OLD_FILE_2="Timely and Effective Care - Hospital.csv"
NEW_FILE_2="effective_care.csv"
tail -n +2 "$OLD_FILE_2" >$NEW_FILE_2

#3
OLD_FILE_3="Complications and Deaths - Hospital.csv"
NEW_FILE_3="complications.csv"
tail -n +2 "$OLD_FILE_3" >$NEW_FILE_3

#4
OLD_FILE_4="Measure Dates.csv"
NEW_FILE_4="Measures.csv"
tail -n +2 "$OLD_FILE_4" >$NEW_FILE_4

#5
OLD_FILE_5="hvbp_hcahps_11_10_2016.csv"
NEW_FILE_5="surveys_responses.csv"
tail -n +2 "$OLD_FILE_5" >$NEW_FILE_5

# create our hdfs directory
hdfs dfs -mkdir /user/w205/hospital_compare

# copy the files to hdfs
hdfs dfs -put $NEW_FILE_1 /user/w205/hospital_compare
hdfs dfs -put $NEW_FILE_2 /user/w205/hospital_compare
hdfs dfs -put $NEW_FILE_3 /user/w205/hospital_compare
hdfs dfs -put $NEW_FILE_4 /user/w205/hospital_compare
hdfs dfs -put $NEW_FILE_5 /user/w205/hospital_compare

# change directory back to the original
cd $MY_CWD

# clean exit
exit

