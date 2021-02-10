Postenum is a Linux enumeration and privilege escalation tool.

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
    -o : OS informations, drivers and defenses
    -x : Kernel privilege escalation exploits
    -v : Software's versions
    -t : Fstab credentials and database access


# Demo:
![PostenumDemo](https://github.com/mbahadou/postenum/raw/master/demo.gif)

# Contributing:

You can contribute by fixing bugs or contributing to the code. If you cannot code, please use the tool and provide feedback and bugs!

# Useful?

<a href="https://www.buymeacoffee.com/burpman" rel="nofollow"><img src="https://camo.githubusercontent.com/031fc5a134cdca5ae3460822aba371e63f794233/68747470733a2f2f7777772e6275796d6561636f666665652e636f6d2f6173736574732f696d672f637573746f6d5f696d616765732f6f72616e67655f696d672e706e67" alt="Buy Me A Coffee" data-canonical-src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" style="max-width:100%;"></a>
