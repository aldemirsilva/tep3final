#!/bin/bash

for u in $(who | awk '{ print $1 }'); do
  nome=$(cat /etc/passwd | grep "$u" | awk -F':' '{ print $5 }')
  log=$(lastlog | grep "$u" | awk -F'\*\*' '{ print $2 }')
  printf "Nome real: %s\t\tÚltimo Login: %s\n" "$nome" "$log"
done
