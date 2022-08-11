#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB11.sh - Exercice 11 - handling SQL datas
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

MYSQL=$(which mysql)

# Send a command to the MySQL server
$MYSQL test -u test -e 'select * from employees'

# Sending multiple commands to MySQL
$MYSQL test -u test <<EOF
show tables;
select * from employees where salary > 40000;
EOF

# Send data to the table in the MySQL database
if [ $# -ne 4 ]
then
    echo "Usage: mtest3 empid lastname firstname salary"
else
    statement="INSERT INTO employees VALUES ($1, '$2', '$3', $4)"
    $MYSQL test -u test << EOF
    $statement
EOF
    if [ $? -eq 0 ]
    then
        echo Data successfully added
    else
        echo Problem adding data
    fi
fi

# Redirecting SQL output to a variable
dbs=$($MYSQL test -u test -Bse 'show databases')
for db in $dbs
do
    echo $db
done