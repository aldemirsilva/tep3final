#!/usr/bin/awk -f
#FILE="sem_linha.txt"
BEGIN {RS=""}{gsub(/\n/,"",$0); print $0 > "sem_linha.txt"} "$1"
