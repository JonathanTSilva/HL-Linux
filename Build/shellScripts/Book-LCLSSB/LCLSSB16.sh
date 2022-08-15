#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB16.sh - Exercice 16 - Generating an Excuse (SMS or email)
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

phone="+5516993232745"
SMSrelay_url=http://textbell.com/intl
text_message="System Code Red"

# Send text
curl -s -X POST $SMSrelay_url \
    --data-urlencode number=$phone \
    --data-urlencode message=$text_message > /dev/null \
    -d key=textbelt

exit