* postexp tool is a tool to enumerate local informations such as network, system, service, application informations and more, from any Linux box that you find your self you have a limited privilege shell on it. It helps you finding your way to the root privilege.
* Version 0.4



* USE
   * Usage  : ./postexp.sh [option]
   * Example  : ./postexp.sh -c
   * Example  : ./postexp.sh -s
        
* Options :
   * -a : all
   * -s : filesystem [SUID, SGID..]
   * -l : shell escape and development tools
   * -c : the most interesting files
   * -n : network settings
   * -p : services and cron..
   * -o : operating system informations
   * -v : software versions
   * -t : extract creds and get access as root to dbs
