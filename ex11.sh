#!/bin/bash
while ps -p "$1" > /dev/null; do
  echo "PID "$1" está ativo"
  sleep "$2"
done
echo "PID "$1" foi finalizado"
