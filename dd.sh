#!/bin/bash

numproc=`ps -ef | grep dd[[:space:]]bs | grep -v grep | wc -l`
if [[ $numproc -eq 0 ]]; then
    echo "start dd ..."
    mkdir -p /root/longevity/dd/
    while true > /dev/null; do dd bs=30M count=100 if=/dev/zero of=/root/longevity/dd/test-3G.file1 oflag=dsync > /dev/null 2>&1; done
else
    echo "dd already running ..."
fi
