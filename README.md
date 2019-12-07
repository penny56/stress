# longevityWLs
This script for run long time workloads in some servers.


This script is deployed in s10:zp93l7:9.12.23.17:/root/yj/longevityWLs


Thsi script has 3 workloads now:
+ yes
+ dd
+ scp (from original to dest)


If you want to add servers in the script, add the IPs of the servers into ips.cfg and make sure the deployed server (zp93l7) could access the servers without account login.

+ we need to ssh-keygen and ssh-copy-id from the scp originator to the dest before the scp operation
+ ssh-keygen -b 4096
+ ssh-copy-id 10.20.103.**

For scp workload, make sure the original could ssh to the dest with out login.

###### For example -- run the workloads:

    [root@zp93l7 longevityWLs]# ./longevityWLs.sh -r
    run >>> 10.20.103.81, start workloads >>>

    start dd ...
    start yes ...
    start scp ...
    run >>> 10.20.103.82, start workloads >>>

    start dd ...
    start scp ...
    start yes ...

###### For example -- quit the workloads:

    [root@zp93l7 longevityWLs]# ./longevityWLs.sh -q
    quit >>> 10.20.103.81, kill workloads >>>
    kill yes ...
    bash: line 10: 219150 Killed                  yes > /dev/null
    kill dd ...
    kill scp ...

    quit >>> 10.20.103.82, kill workloads >>>
    kill yes ...
    bash: line 10: 263306 Killed                  yes > /dev/null
    kill dd ...
    kill scp ...
