# we need to ssh-keygen and ssh-copy-id from the scp source to the dest before the scp operation
# ssh-keygen -b 4096
# ssh-copy-id 10.20.103.**

declare -A scpDict

# The dict scpDict is for the scp operation peers, the key is source and the value is dest
scpDict=([T90RHEL11]="10.20.103.61"\
         [T90RHEL12]="10.20.103.62"\
         [T90RHEL13]="10.20.103.63"\
         [T90RHEL14]="10.20.103.64"\
         [T90RHEL15]="10.20.103.65"\
         [T90UBUT11]="10.20.103.81"\
         [T90UBUT12]="10.20.103.82"\
         [T90UBUT13]="10.20.103.83"\
         [T90UBUT14]="10.20.103.84"\
         [T90UBUT15]="10.20.103.85"\
         )

numproc=`ps -ef | grep scp[[:space:]]test | grep -v grep | wc -l`
if [[ $numproc -eq 0 ]]; then
    echo "start scp ..."
    host=`hostname`
    dest=${scpDict[$host]}
    mkdir -p /root/longevity/scp/
    dd bs=20M count=100 if=/dev/zero of=/root/longevity/scp/test-2G.$host > /dev/null 2>&1
    # we willn't create longevity/scp directory in the dest server, so put the test file in ~
    while true; do scp /root/longevity/scp/test-2G.$host root@$dest:/root/ > /dev/null 2>&1; done
else
    echo "scp already running ..."
fi
