#!/usr/bin/env bash
#============================================================
#------------------------ HEADER ----------------------------
#============================================================
# LCLSSB17.sh - Exercice 17 - Working with menu in shell
#     Book: Linux Command Line and Shell Scripting Bible
#============================================================
#           Copyright (C) 2022 Jonathan T. Silva
#          https://www.github.com/JonathanTSilva

#============================================================
#------------------------- BODY -----------------------------
#============================================================

function diskspace {
    clear
    df -k
}

function whoseon {
    clear
    who
}

function memusage {
    clear
    cat /proc/meminfo
}

menu() {
    clear
    echo
    echo -e "\t\t\tSys Admin Menu\n"
    echo -e "\t1. Display disk space"
    echo -e "\t2. Display logged on users"
    echo -e "\t3. Display memory usage"
    echo -e "\t0. Exit program\n\n"
    echo -en "\t\tEnter option: "
    read -n 1 option
}

#============================================================
#----------------------- EXECUTION --------------------------
#============================================================

# menu

PS3="Enter option: "
select option in "Display disk space" "Display logged on users" "Display memory usage" "Exit program"
do
    case $option in
    "Exit program")
          break ;;
    "Display disk space")
          diskspace ;;
    "Display logged on users")
          whoseon ;;
    "Display memory usage")
          memusage ;;
    *)
          clear
          echo "Sorry, wrong selection";;
    esac
done
clear

# while [ 1 ]
# do
#     menu
#     case $option in
#     0)
#        break ;;
#     1)
#        diskspace ;;
#     2)
#        whoseon ;;
#     3)
#        memusage ;;
#     *)
#        clear
#        echo "Sorry, wrong selection";;
#     esac
#     echo -en "\n\n\t\t\tHit any key to continue"
#     read -n 1 line
# done
# clear