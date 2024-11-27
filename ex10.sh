#!/bin/bash
find /home/aldemir -type f -newermt "-24 hours" -exec tar -rvf data.tar {} \;