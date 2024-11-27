#!/bin/bash
export SUM=0 # Esta linha cria a variável SUM e a inicializa com zero.

for f in $(find src -name "*.java"); # Esta linha cria uma lista com os nomes de todos os arquivos com a extensão .java que estão no diretório src para iterar cada um em um laço for.
  do # Execução de comando no laço for para cada arquivo da lista
    export SUM=$(($SUM + $(wc -l $f | awk '{ print $1 }'))); # Primeiramente o comando wc -l $f conta quantas linhas há em cada arquivo do loop, um por vez, e então, com o pipe, o comando awk "exibe" o número de linha que é somado à variável SUM.
  done
echo $SUM # Esta linha imprime a soma do número de linhas dos arquivos iterados no laço.
