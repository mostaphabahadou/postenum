# postenum
Postenum is a clean, nice and easy tool that is intended to be executed locally on a Linux box to enumerate system information and search for common/hidden privilege escalation vectors (misconfiguration, databases files, applicable exploits, shell escapes, clear-text passwords) and more.

# USE
    ./postenum.sh [option]
    ./postenum.sh -s
    ./postenum.sh -c
        
# Options :
    -a : All
    -s : Filesystem [SUID, SGID..]
    -l : Shell escape and development tools
    -c : The most interesting files
    -n : Network settings
    -p : Services and cron jobs
    -o : Operating system informations
    -v : Software versions
    -t : Fstab credentials and databases checker

# Version 0.6
