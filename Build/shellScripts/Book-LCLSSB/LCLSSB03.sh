#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB03.sh - Exercice 03 - Read a file and insert it into
# a database
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================
outfile='members.sql'
IFS=',' # CSV file
while read lname fname address city state zip
do
   cat >> $outfile << EOF
   INSERT INTO members (lname,fname,address,city,state,zip) VALUES
('$lname', '$fname', '$address', '$city', '$state', '$zip');
EOF
done < ${1}

#============================================================
#----------------------- CSV FILE ---------------------------
#============================================================

# Blum,Richard,123 Main St.,Chicago,IL,60601
# Blum,Barbara,123 Main St.,Chicago,IL,60601
# Bresnahan,Christine,456 Oak Ave.,Columbus,OH,43201
# Bresnahan,Timothy,456 Oak Ave.,Columbus,OH,43201