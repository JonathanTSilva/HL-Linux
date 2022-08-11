#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB15.sh - Exercice 15 - Get a Daily Inspirational Quote
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

# Script Variables
quote_url=www.quotationspage.com/qotd.html

# Check url validity ###
check_url=$(wget -nv --spider $quote_url 2>&1)

if [[ $check_url == *error404* ]]
then
    echo "Bad web address"
    echo "$quote_url invalid"
    echo "Exiting script..."
    exit
fi

# Download Web Site's Information
wget -o /tmp/quote.log -O /tmp/quote.html $quote_url

# Extract the Desired Data
sed 's/<[^>]*//g' /tmp/quote.html |
grep "$(date +%B' '%-d,' '%Y)" -A2 |
sed 's/>//g' |
sed '/&nbsp;/{n ; d}' |
gawk 'BEGIN{FS="&nbsp;"} {print $1}' |
tee /tmp/daily_quote.txt  > /dev/null

exit