#!/bin/bash
# Backs up a single project directory
# Shizhang Wang 2/11/2020

if [ $# !=1 ] # check if there's more than one argument
then
    echo Usage: A single argument which is the directory to backup
    exit
fi
if [ ! -d ~/ABE65100/$1 ] # check if it's a directory
 # catering to the initial setup of this course (ABE folder within home directory) which should work for all users when provided 'Lab0X' folder as the single argument
then
    echo 'The given directory does not seem to exist (typo?)'
    exit
fi
date=`date +%F` # date stored in variable date

# Do we already have a backup folder for todays date?
if [ -d ~/ABE65100/projectbackups/$1_$date ] # backup folder inside ABE folder
then
    echo 'This project have already been backed up today, overwrite?'
    read answer # prompt for user input
    if [ $answer != 'y' ]
    then
        exit
    fi
else    
    mkdir -p ~/ABE65100/projectbackups/$1_$date
fi
cp -R ~/ABE65100/$1 ~/ABE65100/projectbackups/$1_$date
echo Backup for $1 completed
