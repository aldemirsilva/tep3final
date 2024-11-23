#!/bin/bash
for((nr=1; nr<10000; nr++))
  do
    if [ $((nr % 5)) -ne 3 ] || [ $((nr % 7)) -ne 4 ] || [ $((nr % 9)) -ne 5 ]; then
      continue
    fi
    break # What happens when you comment out this line? Why?
  done
  echo "Number = $nr"
exit 0