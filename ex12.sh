#!/bin/bash
for((i=60000; i<=63000; i++));do
  for((j=2; j<=i/2; j++)); do
    if [ $((i%j)) -eq 0 ]; then
      continue 2
    fi
  done
  primos+=("$i")
done

for((l=0; l<${#primos[@]}; l++)); do
  printf "%-8d" ${primos[l]}
  if [ $(((l+1)%10)) -eq 0 ]; then
    printf "\n"
  fi
done
printf "\n"
