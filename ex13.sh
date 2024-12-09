#!/bin/bash
numeros=()
while((${#numeros[@]} < 5)); do
  ((n=RANDOM%50+1))
  if [[ ${numeros[@]} =~ $n ]]
    then
      continue
    else
      numeros+=("$n")
  fi
done

if [[ "$1" -eq 0 ]]; then
  date
  for((l=0; l<${#numeros[@]}; l++)); do
    printf "%d " ${numeros[l]}
  done
  printf "\n"
  else if [[ "$1" -eq 1 ]]; then
    `echo $(date) > numeros.txt`
    `echo ${numeros[@]} >> numeros.txt`
  fi
fi
