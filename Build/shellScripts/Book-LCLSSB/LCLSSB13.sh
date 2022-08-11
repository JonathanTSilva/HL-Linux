#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB13.sh - Exercice 13 - email and shell script
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

# Mailing the answer to a factorial
 
MAIL=$(which mailx)
 
factorial=1
counter=1
 
read -p "Enter the number: " value
while [ $counter -le $value ]
do
   factorial=$[$factorial * $counter]
   counter=$[$counter + 1]
done
 
echo The factorial of $value is $factorial | $MAIL -s "Factorial
answer" $USER
echo "The result has been mailed to you."

# sending the current disk statistics in an e-mail message
 
date=$(date +%m/%d/%Y)
MAIL=$(which mailx)
TEMP=$(mktemp tmp.XXXXXX)
 
df -k > $TEMP
cat $TEMP | $MAIL -s "Disk stats for $date" $1
rm -f $TEMP