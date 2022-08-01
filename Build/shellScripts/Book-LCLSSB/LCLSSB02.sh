#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB02.sh - Exercice 02 - Creating multiple user accounts
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

# Process new user accounts
input="users.csv"
# The read command does the work of moving onto the next line of text in the .csv text file
while IFS=',' read -r userid name
do
  echo "adding $userid"
  useradd -c "$name" -m $userid
# Feed the data from the file into the while command
done < "$input"