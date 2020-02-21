#!/bin/bash
# Check information for given directory
# Shizhang Wang 2/20/2020

if [ $# != 1 ]
then
    echo Usage: A single argument which is the directory to check
    exit
fi
if [ ! -d ./$1 ]
# above line checks if the directory exist, since the directory could have any path, probably better to have the user enter the parent directory that includes the given directory that needs to be checked
then
    echo 'The given directory does not seem to exist (at least in the current directory'
    exit
fi
filenumber=`ls -l ./$1 | egrep -c '^-{1}.*'`
dirnumber=`ls -l ./$1 | egrep -c '^d{1}.*'`
echo The given directory $1 has $filenumber files and $dirnumber directories
largest=`ls -lS ./$1 | egrep '^-' | head -1`
echo The largest file in directory $1 is $largest
lastest=`ls -lt ./$1 | egrep '^-' | head -1`
echo The most recently modified or created file in directory $1 is $lastest
owners=`stat -c '%U' ./$1`
echo Users in directory $1 includes $owners
