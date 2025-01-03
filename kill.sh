#!/bin/bash

numproc=`ps -ef | grep [[:space:]]yes | grep -v grep | wc -l`
if [[ $numproc -ne 0 ]]; then
    echo "kill yes ..."
    # kill pid for yes
    ps -ef | grep [[:space:]]yes | grep -v grep | awk '{system("kill -9 "$2)}' 
else
    echo "yes not running in this server ..."
fi

numproc=`ps -ef | grep dd[[:space:]]bs | grep -v grep | wc -l`
if [[ $numproc -ne 0 ]]; then
    echo "kill dd ..."
    # kill pid for dd
    ps -ef | grep dd[[:space:]]bs | grep -v grep | awk '{system("kill -9 "$3)}'
    # remove the test file
    rm -rf /root/longevity/dd/test-*.*
else
    echo "dd not running in this server ..."
fi

numproc=`ps -ef | grep scp[[:space:]]/root/ | grep -v grep | wc -l`
if [[ $numproc -ne 0 ]]; then
    echo "kill scp ..."
    # kill pid for scp
    ps -ef | grep scp[[:space:]]/root/ | grep -v grep | awk '{system("kill -9 "$3)}'
    # can't remove the test file in dest
else
    echo "scp not running in this server ..."
fi
