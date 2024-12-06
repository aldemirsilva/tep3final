#!/bin/bash
FILE="$1"
while read LINE
do
  printf "$LINE\n\n" >> "teste_1.txt"
done < $FILE
