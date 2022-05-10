#!/bin/bash
# created by YJ on Dec. 7 2019

function usage() {
    echo
    echo "run/quit the workloads at the same time"
    echo "-r, --run     run the workloads in the servers in ips.cfg"
    echo "-q, --quit    quit the workloads in the servers in ips.cfg"
    echo
}

function run() {
    for ip in ${ips[@]}; do
        # only get the string start with digit, ignore the comments
        if [[ $ip =~ ^[0-9] ]]; then
            echo "run >>> $ip, start workloads >>>"
            # & in the end to go back immidiatelly after exec script in remote machine
            ssh root@$ip 'exec bash' < yes.sh &
            ssh root@$ip 'exec bash' < dd.sh &
            ssh root@$ip 'exec bash' < scp.sh &
            echo
            sleep 1
        fi
    done
}

function quit () {
    for ip in ${ips[@]}; do
        echo "quit >>> $ip, kill workloads >>>"
        ssh root@$ip 'exec bash' < stop.sh
        echo
        sleep 1
    done
}

ips=($(cat ips.cfg))

if [[ $# == 1 ]]; then
    case $1 in
        -r|--run)
            run
            exit 0
        ;;
        -q|--quit)
            quit
            exit 0
        ;;
        *)
            usage
            exit 0
        ;;
    esac
else
    usage
    exit 0
fi

