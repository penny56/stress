#!/bin/bash

numproc=`ps -ef | grep [[:space:]]yes | grep -v grep | wc -l`
if [[ $numproc -eq 0 ]]; then
    echo "start yes ..."
    mkdir -p /root/longevity/yes/
    yes > /dev/null
else
    echo "yes already running ..."
fi
