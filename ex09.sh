#!/bin/bash
echo `md5sum /etc/passwd | awk '{ print substr($1,1,6) }'`