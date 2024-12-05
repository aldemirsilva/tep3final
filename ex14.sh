#!/bin/bash
INT=$1
if [[ "$INT" =~ ^-?[0-9]+$ ]]
  then
    exit 0
  else
    exit 1
fi
