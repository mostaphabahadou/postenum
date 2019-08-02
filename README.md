# Postenum
Postenum is a clean, nice and easy tool for basic/advanced privilege escalation vectors/techniques. Postenum tool is intended to be executed locally on a Linux box.

Be more than a normal user. be the ROOT.

# USE
    ./postenum.sh [option]
    ./postenum.sh -s
    ./postenum.sh -c

# Options :
    -a : All
    -s : Filesystem [SUID, SGID, Config/DB files, etc.]
    -l : Shell escape and development tools
    -c : The most interesting files
    -n : Network settings
    -p : Services and cron jobs
    -o : OS informations and kernel exploits
    -v : Software's versions
    -t : Fstab credentials and databases checker

# Install.sh
You can use install.sh script to install postenum. (only for system/network admins). to run it:
    
    ./install.sh

# Version 0.8
