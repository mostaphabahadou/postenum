Postenum is a linux privilege escalation tool.

# Usage:
    ./postenum.sh [option]
    ./postenum.sh -s
    ./postenum.sh s
    ./postenum.sh -c
    ./postenum.sh c

# Options:
    -a : All (not recommended)
    -s : Filesystem [SUID, SGID, Config/DB files, etc.]
    -l : Shell escape, environment variables and development tools
    -c : Interesting [Backup files, PasswordPolicy, SSH files, etc.]
    -n : Network settings [DNS, ARP, Host, TCP, UDP, etc.]
    -p : Services and cron jobs
    -o : OS informations and priv esc kernel exploits
    -v : Software's versions
    -t : Fstab credentials and database access


# Demo:
![PostenumDemo](https://github.com/mbahadou/postenum/raw/master/demo.gif)

# Contributing:

You can contribute by fixing bugs or contributing to the code. If you cannot code, please use the tool and provide feedback and bugs!
