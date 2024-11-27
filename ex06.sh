#!/bin/bash
find /home/aldemir -type d > ex06.txt
tar -cvf dir.tar "ex06.txt" --remove-files
