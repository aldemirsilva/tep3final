#!/bin/bash
var=$1
rev=""
for((i=0 ; i<${#var} ; i++))
  do
    rev="${var:i:1}$rev"
  done
echo "$rev"
