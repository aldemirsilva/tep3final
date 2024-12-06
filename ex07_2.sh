#!/bin/bash
FILE="$1"
while read LINE
do
  printf "$LINE\n\n\n" >> "teste_2.txt"
done < $FILE
