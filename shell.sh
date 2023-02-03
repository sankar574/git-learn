#!/bin/bash
#POlice drunk and drive test
read -p "Enter your birt year" A
YOB=$A
CURRENT_YEAR=2023
AGE=$(expr $CURRENT_YEAR - $YOB)
echo "your age is : $AGE "
if [ $AGE -gt 25 ]; then
    echo "you are age is ok for drinking"
else
    echo "you are below 25 and not elgible to drink"
fi
