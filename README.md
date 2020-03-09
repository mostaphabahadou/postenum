Postenum is a linux privilege escalation tool.

# Usage:
    ./postenum.sh [option]
    ./postenum.sh -s
    ./postenum.sh -c

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
    

# Donation (Patreon & Paypal):
By making a donation, no matter how small, you are saying thanks and drawing a smile on my face because I will know, somebody thought my project was useful and worth paying for.

If this project help you reduce time to develop, you can give me a cup of coffee :)

<p>
    <a href="https://www.patreon.com/mbahadou">
        <img src="https://camo.githubusercontent.com/b5e852739a6ddc50e88e90a8d02891f6dbbb3c87/68747470733a2f2f692e696d6775722e636f6d2f4262453031644c2e706e67" alt="Become a Patron!" data-canonical-src="https://i.imgur.com/BbE01dL.png" style="max-width:100%;">
    </a>
</p>

<p>
  <a href="https://www.paypal.me/mbahadou">
      <img src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" alt="Paypal">
  </a>
</p>

# Demo:
![PostenumDemo](https://github.com/mbahadou/postenum/raw/master/demo.gif)

# Contributing:

You can contribute by fixing bugs or contributing to the code. If you cannot code, please use the tool and provide feedback and bugs!
