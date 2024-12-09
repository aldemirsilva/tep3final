#!/bin/bash
string="$1"
palavraChave="$2"
declare -a quadrado
declare -a textoPlano
alfabeto="ABCDEFGHIKLMNOPQRSTUVWXYZ"
tmp=""

localizarNoQuadrado() {
  char=$1
  for j in "${!quadrado[@]}"; do
    if [[ "${quadrado[$j]}" == "$char" ]]; then
      return $j
    fi
  done
}

adicionarAoQuadrado() {
  char=$1

  char=$(echo "$char" | tr '[:lower:]' '[:upper:]')

  [[ "$char" == 'J' ]] && char='I'

  if ! [[ "$alfabeto" =~ $char ]]; then
    return
  fi

  if [[ " ${quadrado[@]} " =~ " $char " ]]; then
    return
  fi

  quadrado+=("$char")
}

exibirQuadrado() {
  for i in "${!quadrado[@]}"; do
    if((i%5==0))&&((i!=0)); then
      echo
    fi
    printf "%s" "${quadrado[$i]}"
  done
  echo
}

for((i=0;i<${#palavraChave};i++)); do
  char="${palavraChave:i:1}"
  adicionarAoQuadrado "$char"
done

for((i=0;i<${#alfabeto};i++)); do
  char="${alfabeto:i:1}"
  adicionarAoQuadrado "$char"
done

exibirQuadrado

for ((i=0;i<${#string};i++)); do
  char="${string:i:1}"

  char=$(echo "$char" | tr '[:lower:]' '[:upper:]')

  [[ "$char" == 'J' ]] && char='I'

  if ! [[ "$alfabeto" =~ $char ]]; then
    continue
  fi

  if [[ "$tmp" == "$char" ]]; then
    continue
  fi

  tmp+="$char"

  if ((${#tmp}==2)); then
    textoPlano+=("$tmp")
    tmp=""
  fi
done

if ((${#tmp}==1)); then
  tmp+="X"
  textoPlano+=("$tmp")
fi

echo "Texto a ser cifrado: ${textoPlano[*]}"

for pair in "${textoPlano[@]}"; do
  char1="${pair:0:1}"
  char2="${pair:1:1}"

  localizarNoQuadrado "$char1"
  pos1=$?

  localizarNoQuadrado "$char2"
  pos2=$?

  r1=$((pos1/5))
  c1=$((pos1%5))

  r2=$((pos2/5))
  c2=$((pos2%5))

  if ((r1==r2)); then
    c1=$(((c1+1)%5))
    c2=$(((c2+1)%5))
  elif ((c1==c2)); then
    r1=$(((r1+1)%5))
    r2=$(((r2+1)%5))
  else
    tmp=$c1
    c1=$c2
    c2=$tmp
  fi

  pos1=$(((r1*5)+c1))
  pos2=$(((r2*5)+c2))

  char1="${quadrado[$pos1]}"
  char2="${quadrado[$pos2]}"

  printf "%s%s" "$char1" "$char2"
done
echo
