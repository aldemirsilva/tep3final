#!/bin/bash
while read LINE
  do
    echo $LINE
  done | `echo tail -f /var/log/messages`

# O script não funciona porque o comando tail é um processo que continua a ler e exibir as linhas finais do arquivo em tempo real.
# Como estava escrito anteriormente o comando tail fica em um loop infinito e não é possível executar o laço while corretamente.
# Para corrigir o problema é necessário substituir o símbolo de redirecionamento de saída do comando para o | (pipe), que cria um pipeline para executar o comando corretamente.
