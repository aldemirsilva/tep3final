#!/usr/bin/awk -f

BEGIN {
  FS=":"
  maior=-9223372036854775808
  menor=9223372036854775807
  print "Nome Telefone Jan Fev Mar Total"
  print "--------------------------------------------------------------------"
}

{printf "%s %s %.2f %.2f %.2f %.2f \n", $1, $2, $3, $4, $5, $3+$4+$5; sum+=$3+$4+$5}
{if ($3>maior) {maior=$3} if ($4>maior) {maior=$4} if ($5>maior) {maior=$5}}
{if ($3<menor) {menor=$3} if ($4<menor) {menor=$4} if ($5<menor) {menor=$5}}

END {
print "Relatório"
print "---------------------------------------------------------------------"
{printf "Total recebido: %.2f\n", sum}
{printf "Contribuição média: %.2f\n", sum/NR}
{printf "Menor contribuição: %.2f\n", menor}
{printf "Maior contribuição: %.2f\n", maior}
}
