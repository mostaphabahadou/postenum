* postenum is a clean, nice and easy tool to enumerate local informations such as network, system, service, application informations and more, from any Linux box that you find your self you have a limited privileges shell on it. It helps you finding your way to the root privileges. 


* Version 0.6



* USE
   * Usage  : ./postenum.sh [option]
   * Example  : ./postenum.sh -c
   * Example  : ./postenum.sh -s
        
* Options :
   * -a : All
   * -s : Filesystem [SUID, SGID..]
   * -l : Shell escape and development tools
   * -c : The most interesting files
   * -n : Network settings
   * -p : Services and cron jobs
   * -o : Operating system informations
   * -v : Software versions
   * -t : Fstab credentials and databases checker
