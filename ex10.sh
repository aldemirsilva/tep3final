#!/bin/bash
find /home/aldemir -type f -newermt "-24 hours" -exec tar -rvf data.tar {} \;
tar -cvzf ex10.tar.gz "data.tar" --remove-files
