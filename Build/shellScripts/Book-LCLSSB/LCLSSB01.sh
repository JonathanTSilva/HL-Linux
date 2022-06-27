#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB01.sh - Exercice 01 - Finding executable file
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

IFS=:
for folder in $PATH
do
   echo "$folder:"
   for file in $folder/*
   do
      if [ -x $file ]
      then
         echo "   $file"
      fi
   done
done
