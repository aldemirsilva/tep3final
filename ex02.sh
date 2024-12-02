#!/bin/bash
find -maxdepth 1 -type f -printf '%f\000' | { # Esta linha encontra os arquivos (não-diretórios) apenas do diretório atual (-maxdepth 1) e imprime apenas o nome do arquivo (%f) seguido do caracter nulo.
  while read -d $'\000'; do # Este laço lê cada linha passada pelo comando find da linha acima até o caracter nulo.
    mv "$REPLY" "$(date -d "$(stat -c '%y' "$REPLY") " '+%Y%m%d%H%M%S')-$REPLY" # Esta linha renomeia cada um dos arquivos encontrados pelo comando find adicionando a data no formato AAAAMMDD (de teste.txt para 20241202181311-teste.txt, por exemplo)
  done
}

# Esse script renomeia os arquivos do diretório onde é executando adicionando a data no formato AAAAMMDD (de teste.txt para 20241202181311-teste.txt, por exemplo).
# O comando stat com a opção -c '%y' e o comando date converte a string gerada pelo comando stat para o formato de data e hora exemplificado acima.
# E por fim, o comando mv renomeia cada um dos arquivos conforme explicado.