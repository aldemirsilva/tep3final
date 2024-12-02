#!/bin/bash
for((n=1; n<10000; n++)) # Laço for que torna desnecessária a variável MAX do código original e itera de 1 a 9999
  do
    if [ $((n % 5)) -ne 3 ] || [ $((n % 7)) -ne 4 ] || [ $((n % 9)) -ne 5 ]; then # Estrutura if que subsitui as 3 estruturas if originais. Quando uma das condições é verdadeira a próxima iteração é executada
      continue # Quando esta linha é executada ocorre a iteração para o próximo número inteiro.
    fi
    break # What happens when you comment out this line? Why?
  done
  echo "Number = $n"
exit 0

# O programa roda até encontrar o primeiro número inteiro entre 1 e 9999 que satisfaça três condições ao mesmo tempo:
# O resto da divisão do número por 5, por 7 e por 9 precisa ser igual a 3, 4 e 5. Esse número é o 158.
# Caso a linha contendo o break seja comentada, então o programa rodará até chegar a 9999 e exibirá 10000 no final (esse valor não entra no laço for, mas a variável é incrementada).
# Isso occorre porque mesmo quando o programa encontra a solução e não executa a linha contendo continue não há o comando break para parar a execução e exibir a resposta correta.
