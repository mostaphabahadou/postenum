* A simple tool to enumerate local information (Network info, System info, Services, Applications..) from any Linux box
* Version 0.1

* USE
   * Usage : ./postexp.sh [option]
        
* Options :
       * -a : checking everything [services, conf info, users, special files..]
       * -s : checking filesystem [SUID, SGID, written dir..]
       * -l : checking development tools and languages [php, python..]
        * -c : checking hidden files and writable /etc files..
        * -n : checking network settings, dns, arp, mac, ip..
        * -p : checking services and cron..
        * -o : checking operating system info
        * -v : checking sofware version
        * -t : checking some methods for extract creds and get access as root to dbs
