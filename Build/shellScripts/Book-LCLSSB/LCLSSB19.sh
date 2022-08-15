#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB19.sh - Exercice 19 - Working with zenity in shell
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

temp=$(mktemp -t test.XXXXXX)
temp2=$(mktemp -t test2.XXXXXX)

function diskspace {
    df -k > $temp
    zenity --text-info --title "Disk space" --filename=$temp --width 750 --height 10
}

function whoseon {
    who > $temp
    zenity --text-info --title "Logged in users" --filename=$temp --width 500 --height 10
}

function memusage {
    cat /proc/meminfo > $temp
    zenity --text-info --title "Memory usage" --filename=$temp --width 300 --height 500
}
 
#============================================================
#----------------------- EXECUTION --------------------------
#============================================================
 
while [ 1 ]
do
    zenity --list --radiolist --title "Sys Admin Menu" --column "Select" --column "Menu Item" FALSE "Display diskspace" FALSE "Display users"  FALSE "Display memory usage" FALSE "Exit" > $temp2
    
    if [ $? -eq 1 ] 
    then
        break
    fi
 
    selection=$(cat $temp2)
     
    case $selection in
        "Display disk space")
            diskspace ;;
        "Display users")
            whoseon ;;
        "Display memory usage")
            memusage ;;
        Exit)
            break ;;
        *)
            zenity --info "Sorry, invalid selection"
    esac
done

rm -f $temp 2> /dev/null
rm -f $temp2 2> /dev/null