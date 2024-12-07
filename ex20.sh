#!/bin/bash

# Armazena o texto a ser cifrado e a palavra-chave em variáveis
plainTextString="$1"
keyWord="$2"

# Declaração de arrays e alfabeto
declare -a keySquare
declare -a plainText
allCharacters="ABCDEFGHIKLMNOPQRSTUVWXYZ"

# Função para localizar o caractere no key-square
locateInKeySquare() {
  char=$1
  for j in "${!keySquare[@]}"; do
    if [[ "${keySquare[$j]}" == "$char" ]]; then
      return $j
    fi
  done
}

# Função para adicionar um caractere ao key-square
addToKeySquare() {
  char=$1

  # Converte o caractere para maiúsculo
  char=$(echo "$char" | tr '[:lower:]' '[:upper:]')

  # Substitui 'J' por 'I'
  [[ "$char" == 'J' ]] && char='I'

  # Verifica se o caractere é válido
  if ! [[ "$allCharacters" =~ $char ]]; then
      return
  fi

  # Verifica se o caractere já existe no key-square
  if [[ " ${keySquare[@]} " =~ " $char " ]]; then
      return
  fi

  # Adiciona o caractere ao key-square
  keySquare+=("$char")
}

# Função para exibir o key-square
printKeySquare() {
  for i in "${!keySquare[@]}"; do
    if (( i % 5 == 0 )) && (( i != 0 )); then
      echo
    fi
    printf "%s" "${keySquare[$i]}"
  done
  echo
}

# Adiciona os caracteres da palavra-chave ao key-square
for ((i = 0; i < ${#keyWord}; i++)); do
  char="${keyWord:i:1}"
  addToKeySquare "$char"
done

# Adiciona os caracteres restantes ao key-square
for ((i = 0; i < ${#allCharacters}; i++)); do
  char="${allCharacters:i:1}"
  addToKeySquare "$char"
done

# Exibe o key-square
printKeySquare

# Variáveis auxiliares
tmp=""

# Processa o texto
for ((i = 0; i < ${#plainTextString}; i++)); do
  char="${plainTextString:i:1}"

  # Converte o caractere para maiúsculo
  char=$(echo "$char" | tr '[:lower:]' '[:upper:]')

  # Substitui 'J' por 'I'
  [[ "$char" == 'J' ]] && char='I'

  # Ignora caracteres inválidos
  if ! [[ "$allCharacters" =~ $char ]]; then
    continue
  fi

  # Ignora letras repetidas consecutivas
  if [[ "$tmp" == "$char" ]]; then
    continue
  fi

  # Adiciona o caractere ao temporário
  tmp+="$char"

  # Se o temporário tiver dois caracteres, adiciona ao texto cifrado
  if (( ${#tmp} == 2 )); then
    plainText+=("$tmp")
    tmp=""
  fi
done

# Se o último par tiver apenas um caractere, adiciona 'X'
if (( ${#tmp} == 1 )); then
  tmp+="X"
  plainText+=("$tmp")
fi

# Exibe o texto a ser cifrado
echo "Texto a ser cifrado: ${plainText[*]}"

# Cifra o texto
for pair in "${plainText[@]}"; do
  char1="${pair:0:1}"
  char2="${pair:1:1}"

  locateInKeySquare "$char1"
  pos1=$?

  locateInKeySquare "$char2"
  pos2=$?

  r1=$(( pos1 / 5 ))
  c1=$(( pos1 % 5 ))

  r2=$(( pos2 / 5 ))
  c2=$(( pos2 % 5 ))

  # Regra 1: Mesmo linha
  if (( r1 == r2 )); then
    c1=$(( (c1 + 1) % 5 ))
    c2=$(( (c2 + 1) % 5 ))
  # Regra 2: Mesma coluna
  elif (( c1 == c2 )); then
    r1=$(( (r1 + 1) % 5 ))
    r2=$(( (r2 + 1) % 5 ))
  # Regra 3: Forma um retângulo
  else
    tmp=$c1
    c1=$c2
    c2=$tmp
  fi

  pos1=$(( (r1 * 5) + c1 ))
  pos2=$(( (r2 * 5) + c2 ))

  char1="${keySquare[$pos1]}"
  char2="${keySquare[$pos2]}"

  # Exibe o par cifrado
  printf "%s%s" "$char1" "$char2"
done
echo
