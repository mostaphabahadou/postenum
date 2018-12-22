* A simple tool to enumerate local information (Network info, System info, Services, Applications..) from any Linux box
* Version 0.2



* USE
   * Usage : ./postexp.sh [option]
   * Example : ./postexp.sh -c
   * Example : ./postexp.sh -s
        
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
