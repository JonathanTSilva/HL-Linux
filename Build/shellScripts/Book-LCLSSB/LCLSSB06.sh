#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB06.sh - Exercice 06 - filter out bad phone numbers
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

file=/tmp/scores.txt
touch $file
echo -e "Rich Blum,team1,100,115,95\nBarbara Blum,team1,110,115,100\nChristine Bresnahan,team2,120,115,118\nTim Bresnahan,team2,125,112,116" > $file

for team in $(gawk -F, '{print $2}' $file | uniq)
do
    gawk -v team=$team 'BEGIN{FS=","; total=0}
    {
        if ($2==team)
        {
            total += $3 + $4 + $5;
        }
    }
    END {
        avg = total / 6;
        print "Total for", team, "is", total, ",the average is",avg
    }' $file
done

#$ cat scores.txt
# Rich Blum,team1,100,115,95
# Barbara Blum,team1,110,115,100
# Christine Bresnahan,team2,120,115,118
# Tim Bresnahan,team2,125,112,116