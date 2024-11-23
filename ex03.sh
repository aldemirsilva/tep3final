#!/bin/bash

while read LINE
  do
    echo $LINE
  done | `echo tail -f /var/log/dmesg`