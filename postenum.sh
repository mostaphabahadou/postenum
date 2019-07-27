#!/bin/bash
clear

# License: GPLv3

# Version 0.7

# Postenum is a clean, nice and easy tool for basic/advanced privilege escalation techniques. Postenum tool is intended to be executed locally on a Linux box.

# CHANGELOGS
# Version 0.7
# - Check java and exim versions
# - Display the content of passwd.master file (OpenBSD)
# - SElinux status
# - Check for the existence of Kerberos tickets and GPG keys
# - Sensitive logfiles owned by root - readable ?
# - Shell escape - [nmap without --interactive option, man command, vim and vi]
# - List files based on their Internet address
# - CPU information
# - New exploits from 2018/2019
# - Solved some errors
# - Next

# Version 0.6
# - Added search on config and db files on /var/ (using -s option)
# - Exploit's guesses for linux kernel (using -o option)
# - Next

# Version 0.5
# - Added pkexec version check, and re-write /root and /home/* history files checking (using -v option)
# - Added new feature based on SUID tools (less, cat, more, vim.basic, tail, head)  to read/write root files (using -s option) 
# - The banner changed
# - Next

# Version 0.4
# - Added features such as passwd, shadow (backups files) checks and more..
# - Solved the previous errors... 
# - Modified the whole -v option to avoid errors and to display the correct versions
# - Next

# Version 0.3
# - Added command to display crontab contents and a check for list user's crontab 
# - Next

# Version 0.2
# - A new title - shell escape [./postexp -l]
# - Edited the development tools as well as the way to extract version from applications/services
# - Next

# Version 0.1
# - It's the first time that we release our tool
# - Next


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
echo $whiteboldintensy"----------------------------------------------------------------"
echo "
                 _                             
 _ __   ___  ___| |_ ___ _ __  _   _ _ __ ___  
| '_ \ / _ \/ __| __/ _ \ '_ \| | | | '_ ' _ \ 
| |_) | (_) \__ \ ||  __/ | | | |_| | | | | | |  version : 0.7
| .__/ \___/|___/\__\___|_| |_|\__,_|_| |_| |_|
|_| 

"$white
echo "POST-ENUMERATION$grnintensy by mbahadou"$white
echo $whiteboldintensy"----------------------------------------------------------------"$white
echo ""
echo ""
echo ""

function DirtyCow(){
echo "$cyan Linux Kernel 2.6.22 < 3.9 Dirty Cow$white - https://www.exploit-db.com/exploits/40839"
echo "$cyan Linux Kernel 2.6.22 < 3.9 Dirty Cow (x86-x64)$white - https://www.exploit-db.com/exploits/40616"
}

function Exploits1x(){
echo "$cyan UDEV < 1.4.1 (1)$white - https://www.exploit-db.com/exploits/8478"
echo "$cyan UDEV < 1.4.1 (2)$white - https://www.exploit-db.com/exploits/8572"
echo "$cyan Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
echo "$cyan Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
echo "$cyan Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
}

function Exploits2x(){
echo "$cyan Linux Kernel 2.4.x/2.6.x$white - https://www.exploit-db.com/exploits/9545"
echo "$cyan Linux Kernel 2.6 < 2.6.19$white - https://www.exploit-db.com/exploits/9542"
echo "$cyan Linux Kernel 2.6.0 < 2.6.31(1)$white - https://www.exploit-db.com/exploits/33321"
echo "$cyan Linux Kernel 2.6.x (2)$white - https://www.exploit-db.com/exploits/33322"
echo "$cyan Linux Kernel 2.6.x$white - https://www.exploit-db.com/exploits/30604"
echo "$cyan Linux Kernel 2.6.39 < 3.2.2 Gentoo / Ubuntu x86-x64 Mempodipper(1)$white - https://www.exploit-db.com/exploits/18411"
echo "$cyan Linux Kernel 2.6.39 < 3.2.2 x86-x64 Mempodipper(2)$white - https://www.exploit-db.com/exploits/35161"
echo "$cyan Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
echo "$cyan Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
echo "$cyan Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
}

function Exploits3x(){
echo "$cyan Linux Kernel 2.6.39 < 3.2.2 Gentoo / Ubuntu x86-x64 Mempodipper(1)$white - https://www.exploit-db.com/exploits/18411"
echo "$cyan Linux Kernel 2.6.39 < 3.2.2 x86-x64 Mempodipper(2)$white - https://www.exploit-db.com/exploits/35161"
echo "$cyan Linux Kernel 3.7.6 (RedHat x86/x64)$white - https://www.exploit-db.com/exploits/27297"
echo "$cyan Linux Kernel 3.13 < 3.19 Ubuntu 12.04/14.04/14.10/15.04$white - https://www.exploit-db.com/exploits/37292"
echo "$cyan Linux Kernel 3.13 SGID$white - https://www.exploit-db.com/exploits/33824"
echo "$cyan Linux Kernel 3.13.1 (Metasploit)$white - https://www.exploit-db.com/exploits/40503"
echo "$cyan Linux Kernel 3.14.5 (CentOS 7 / RHEL)$white - https://www.exploit-db.com/exploits/35370"
echo "$cyan Linux Kernel 3.x (Ubuntu 14.04/Mint 17.3/Fedora 22)$white https://www.exploit-db.com/exploits/41999"
echo "$cyan Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
echo "$cyan Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
echo "$cyan Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
}

function Exploits4x(){
echo "$cyan Linux Kernel 4.3.3 Overlayfs$white - https://www.exploit-db.com/exploits/39230"
echo "$cyan Linux Kernel 4.3.3 (Ubuntu 14.04/15.10)$white - https://www.exploit-db.com/exploits/39166"
echo "$cyan Linux Kernel 4.4.0 (Ubuntu 14.04/16.04 x86-64)$white - https://www.exploit-db.com/exploits/40871"
echo "$cyan Linux Kernel 4.4.0-21 < 4.4.0-51 (Ubuntu 14.04/16.04 x86-64)$white - https://www.exploit-db.com/exploits/47170"
echo "$cyan Linux Kernel < 4.4.0-83 / < 4.8.0-58 (Ubuntu 14.04/16.04)$white - https://www.exploit-db.com/exploits/43418"
echo "$cyan Linux Kernel < 4.4.0-116 (Ubuntu 16.04.4)$white - https://www.exploit-db.com/exploits/44298"
echo "$cyan Linux Kernel 4.4.1$white - https://www.exploit-db.com/exploits/40003"
echo "$cyan Linux kernel < 4.10.15 Race Condition$white - https://www.exploit-db.com/exploits/43345"
echo "$cyan Linux Kernel 4.13 (Debian 9)$white - https://www.exploit-db.com/exploits/44303"
echo "$cyan Linux Kernel < 4.13.9 (Ubuntu 16.04 / Fedora 27)$white - https://www.exploit-db.com/exploits/45010"
echo "$cyan Linux Kernel 4.14.0-rc4+$white - https://www.exploit-db.com/exploits/43029"
echo "$cyan Linux Kernel 4.15.x < 4.19.2 (polkit Method)$white - https://www.exploit-db.com/exploits/47167"
echo "$cyan Linux Kernel 4.15.x < 4.19.2 (cron Method)$white - https://www.exploit-db.com/exploits/47164"
echo "$cyan Linux Kernel 4.10 < 5.1.17$white - https://www.exploit-db.com/exploits/47163"
}

function Exploits5x(){
echo "$cyan Linux Kernel 4.10 < 5.1.17$white - https://www.exploit-db.com/exploits/47163"

}

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

echo $boldred"[+] - CPU information"$white
CPUINFO=`lscpu 2>/dev/null`
if [ "$CPUINFO" ];
then
	echo $yellowintensy"[x] Using lscpu"$white
	echo "$CPUINFO"
else
	:
fi
echo""	
	
echo $boldred"[+] - Check kernel version"$white
UNAME=`uname -a 2>/dev/null`
if [ "$UNAME" ];
then
	echo $yellowintensy"[x] Using uname -a"$white
	echo -e "$UNAME"
else
	:
fi
echo ""

PROCVERSION=`cat /proc/version 2>/dev/null`
if [ "$PROCVERSION" ];
then
	echo $yellowintensy"[x] /proc/version"$white
	echo -e "$PROCVERSION"
else
	:
fi
echo ""

echo $boldred"[+] - Exploits"$white
underversion2=2.0.0
kernel=`uname -a | cut -d " " -f "3" | cut -d "-" -f "1"`
OPERATOR=`echo "$kernel $underversion2" | awk '{if ($1 < $2) print "2"; else print "3"}'`
if [ "$OPERATOR" == "2" ];
then
	echo $yellowintensy"[x] Possible exploits for linux kernel $kernel"$white
	echo "Listing the most popular exploits for kernel 4*"
	echo "------------------------------------------------------"
	Exploits1x
	echo -e "\nThe most specific exploits for your kernel $kernel"
	echo "------------------------------------------------------"
	Exploits1x > exploits1.txt
	minimumsize=42
	actualsize=`wc -c exploits1.txt|cut -d " " -f 1`
	if [ $actualsize -ge $minimumsize ];
	then
		grep '$kernel' exploits1.txt > exploit.txt
		shred -n 5 -u -z exploits1.txt
		exploitfilesize=`wc -c exploit.txt|cut -d " " -f 1`
		if [ $exploitfilesize -ge $minimumsize ];
		then
			cat exploit.txt
			shred -n 5 -u -z exploit.txt
		else
			echo "Nothing extract from exploits, for kernel $kernel"
		fi
	else
		echo "Nothing here! But don't give up."
	fi
else
	underversion3=3.0.0
	OPERATOR=`echo "$kernel $underversion3" | awk '{if ($1 < $2) print "3"; else print "4"}'`
	if [ "$OPERATOR" == "3" ];
	then
		echo $yellowintensy"[x] Possible exploits for linux kernel $kernel"$white
		echo "Listing the most popular exploits for kernel 4*"
		echo "------------------------------------------------------"
		Exploits3x
		DirtyCow
		echo -e "\nThe most specific exploits for your kernel $kernel"
		echo "------------------------------------------------------"
		Exploits3x > exploits2.txt
		DirtyCow >> exploits2.txt
		minimumsize=42
		actualsize=`wc -c exploits2.txt|cut -d " " -f 1`
		if [ $actualsize -ge $minimumsize ];
		then
			grep '$kernel' exploits2.txt > exploit.txt
			shred -n 5 -u -z exploits2.txt
			exploitfilesize=`wc -c exploit.txt|cut -d " " -f 1`
			if [ $exploitfilesize -ge $minimumsize ];
			then
				cat exploit.txt
				shred -n 5 -u -z exploit.txt
			else
				echo "Nothing extract from exploits, for kernel $kernel"
			fi
		else
			echo "Nothing here! But don't give up."
		fi
	else
		underversion4=4.0.0
		OPERATOR=`echo "$kernel $underversion4" | awk '{if ($1 < $2) print "4"; else print "5"}'`
		if [ "$OPERATOR" == "4" ];
		then
			echo $yellowintensy"[x] Possible exploits for linux kernel $kernel"$white
			echo "Listing the most popular exploits for kernel 4*"
			echo "------------------------------------------------------"
			Exploits3x
			DirtyCow
			echo -e "\nThe most specific exploits for your kernel $kernel"
			echo "------------------------------------------------------"
			Exploits3x > exploits3.txt
			DirtyCow >> exploits3.txt
			minimumsize=42
			actualsize=`wc -c exploits3.txt|cut -d " " -f 1`
			if [ $actualsize -ge $minimumsize ];
			then
				grep '$kernel' exploits3.txt > exploit.txt
				shred -n 5 -u -z exploits3.txt
				exploitfilesize=`wc -c exploit.txt|cut -d " " -f 1`
				if [ $exploitfilesize -ge $minimumsize ];
				then
					cat exploit.txt
					shred -n 5 -u -z exploit.txt
				else
					echo "Nothing extract from exploits, for kernel $kernel"
				fi
			else
				echo "Nothing here! But don't give up."
			fi
		else
			underversion5=5.0.0
			OPERATOR=`echo "$kernel $underversion5" | awk '{if ($1 < $2) print "5"; else print "6"}'`
			if [ "$OPERATOR" == "5" ];
			then
				echo $yellowintensy"[x] Possible exploits for linux kernel $kernel"$white
				echo "Listing the most popular exploits for kernel 4*"
				echo "------------------------------------------------------"
				Exploits4x
				echo -e "\nThe most specific exploits for your kernel $kernel"
				echo "------------------------------------------------------"
				Exploits4x > exploits4.txt
				minimumsize=42
				actualsize=`wc -c exploits4.txt|cut -d " " -f 1`
				if [ $actualsize -ge $minimumsize ];
				then
					grep '$kernel' exploits4.txt > exploit.txt
					shred -n 5 -u -z exploits4.txt
					exploitfilesize=`wc -c exploit.txt|cut -d " " -f 1`
					if [ $exploitfilesize -ge $minimumsize ];
					then
						cat exploit.txt
						shred -n 5 -u -z exploit.txt
					else
						echo "Nothing extract from exploits, for kernel $kernel"
					fi
				else
					echo "Nothing here! But don't give up."
				fi
			else
				underversion6=6.0.0
				OPERATOR=`echo "$kernel $underversion6" | awk '{if ($1 < $2) print "6"; else print "7"}'`
				if [ "$OPERATOR" == "6" ];
				then
					echo $yellowintensy"[x] Possible exploits for linux kernel $kernel"$white
					echo "Listing the most popular exploits for kernel 4*"
					echo "------------------------------------------------------"
					Exploits5x
					echo -e "\nThe most specific exploits for your kernel $kernel"
					echo "------------------------------------------------------"
					Exploits5x > exploits5.txt
					minimumsize=42
					actualsize=`wc -c exploits5.txt|cut -d " " -f 1`
					if [ $actualsize -ge $minimumsize ];
					then
						grep '$kernel' exploits5.txt > exploit.txt
						shred -n 5 -u -z exploits5.txt
						exploitfilesize=`wc -c exploit.txt|cut -d " " -f 1`
						if [ $exploitfilesize -ge $minimumsize ];
						then
							cat exploit.txt
							shred -n 5 -u -z exploit.txt
						else
							echo "Nothing extract from exploits, for kernel $kernel"
						fi
					else
						echo "Nothing here! But don't give up."
					fi
				else
					echo $yellowintensy"[x] Possible exploits for linux kernel $kernel"$white
					echo $cyan"Nothing in our database on kernel $kernel. You still need to check using google search."$white
				fi
			fi
		fi
	fi
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
	echo -e "$CRON"
else
	:
fi

echo ""

CROND=`ls -al /etc/cron.d/ | grep -v "total" 2>/dev/null`
if [ "$CROND"  ];
then
	echo $yellowintensy"[x] Using ls -la /etc/cron.d/"$white
	echo -e "$CROND\n"
	echo $yellowintensy"[x] Using crontab -l"$white
	crontab -l
else
	:
fi
echo""


CRONTAB=`cat /etc/crontab 2>/dev/null`
if [ "$CRONTAB"  ];
then
	echo $yellowintensy"[x] Using cat /etc/crontab"$white
	echo -e "$CRONTAB"
else
	:
fi

echo""


CRONDAILY=`ls -l /etc/cron.daily | grep -v "total" 2>/dev/null`
if [ "$CRONDAILY" ];
then
	echo $yellowintensy"[x] /etc/cron.daily"$white
	echo -e "$CRONDAILY\n"
else
	:
fi

CRONDHOURLY=`ls -l /etc/cron.hourly | grep -v "total" 2>/dev/null`
if [ "$CRONDHOURLY" ];
then
	echo $yellowintensy"[x] /etc/cron.hourly"$white
	echo -e "$CRONDHOURLY\n"
else
	:
fi 

CRONDMONTHLY=`ls -l /etc/cron.monthly | grep -v "total" 2>/dev/null`
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
	echo "$INTERFACE"
else
	:
fi
echo ""

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
	echo "$RESOLV"
else
	:
fi
echo ""

NETWORK=`cat /etc/networks 2>/dev/null`
if [ "$NETWORK" ];
then
	echo $yellowintensy"[x] /etc/networks"$white
	echo "$NETWORK"
else
	:
fi

SELinux=`getenforce 2>/dev/null`
if [ "$SELinux" ];
then
	echo $yellowintensy"[x] SELinux status"$white
	echo "$SELinux"
else
	:
fi
echo ""

IPTABLE=`iptables -L 2>/dev/null`
if [ "$IPTABLE" ];
then
	echo $yellowintensy"[x] Packet filter rules : iptables -L"$white
	echo "$IPTABLE"
else
	:
fi
echo ""

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

LSOF=`lsof -Pi 2>/dev/null`
if [ "$LSOF" ];
then
	echo $yellowintensy"[x] list files based on their Internet address"$white
	echo -e "$LSOF\n"
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
	echo -e $cyan"$HOMEUSERS\n"$white
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
echo $boldred"[+] - Check /etc for config files (recursive 1 level)"$white
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
	echo $cyan"[/] Readable - /etc/master.passwd"$white
	echo -e "$MASTERPASS\n"
else
	:
fi

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
	echo -e "$WRPASS"
fi

WXSHADOW=`ls -l /etc/shadow 2>/dev/null`
if [ -w /etc/shadow ] || [ -r /etc/shadow ];
then
	echo -e "$cyan$WXSHADOW $white"
else
	echo -e "$WXSHADOW"
fi

WRGROUP=`ls -l /etc/group 2>/dev/null`
if [ -w /etc/group ]; 
then
	echo -e "$cyan$WRGROUP $white"
else
	echo -e "$WRGROUP"
fi

WRSUDOERS=`ls -l /etc/sudoers 2>/dev/null`
if [ -w /etc/sudoers ] || [ -r /etc/sudoers ];
then
	echo -e "$cyan$WRSUDOERS $white"
else
	echo -e "$WRSUDOERS"
fi
echo ""

echo $boldred"[+] - Check backup files"$white
BACKUPPASS=`ls -l /var/backups/passwd.bak 2>/dev/null`
if [ "$BACKUPPASS" ];
then
	echo -e "$BACKUPPASS"
else
	:
fi

BACKUPGROUP=`ls -l /var/backups/group.bak 2>/dev/null`
if [ "$BACKUPGROUP"  ];
then
	echo -e "$BACKUPGROUP"
else
	:
fi

BACKUPSHADOW=`ls -l /var/backups/shadow.bak 2>/dev/null`
if [ -r /var/backups/shadow.bak ];
then
	echo -e "$cyan$BACKUPSHADOW $white"
else
	echo -e "$BACKUPSHADOW"
fi

BACKUPGSHADOW=`ls -l /var/backups/gshadow.bak 2>/dev/null`
if [ -r /var/backups/gshadow.bak ];
then
	echo -e "$cyan$BACKUPGSHADOW $white"
else
	echo -e "$BACKUPGSHADOW"
fi
echo ""


MAILVAR=`ls -alh /var/mail | grep -v "total" 2>/dev/null`
echo $boldred"[+] - Check if anything interesting in the mail directory"$white
if [ -d /var/mail ];
then 
	echo $yellowintensy"[x] Using ls -alh /var/mail"$white
	echo -e "$MAILVAR\n"
else
	:
fi

if [ -e /var/mail/root ];
then
	echo $yellowintensy"[x] Using ls -l /var/mail/root"$white
	$cyan ls -l /var/mail/root | grep -v "total" 2>/dev/null $white
else
	:
fi
echo ""

echo $boldred"[+] - Check if anything interesting in the home directories"$white
ROOTDIR=`ls -ahl /root/ | grep -v "total" 2>/dev/null`
if [ "$ROOTDIR" ];
then
	echo $yellowintensy"[x] Using ls -alh /root"$white
	echo $cyan"[/] Root directory can be accessible"$white
	echo -e "$ROOTDIR"
else
	:
fi

echo ""

HOMEDIR=`ls -lh /home/ | grep -v "total" 2>/dev/null`
if [ "$HOMEDIR" ];
then
	echo $yellowintensy"[x] Using ls -lh /home"$white
	echo -e $cyan"$HOMEDIR"$white
else
	:
fi

echo ""

HOMEHISTORY=`ls -alh /home/*/.*_history | grep -v "total" 2>/dev/null`
if [ "$HOMEHISTORY" ];
then
	echo $yellowintensy"[x] /home history files"$white
	echo -e $cyan"$HOMEHISTORY"$white
else
	:
fi
echo ""


ROOTHISTORY=`ls -alh /root/.*_history | grep -v "total" 2>/dev/null`
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
	echo $yellowintensy"[x] ~/.bash_history - check the whole file"$white
	head ~/.bash_history ; echo ""
else
	echo $blu"~/.bash_history file doesn't exist"$white
fi
if [ -e ~/.nano_history ];
then
	echo $yellowintensy"[x] ~/.nano_history - check the whole file"$white
	head ~/.nano_history ; echo ""
else
	echo $blu"~/.nano_history file doesn't exist"$white
fi

if [ -e ~/.mysql_history ];
then
	echo $yellowintensy"[x] ~/.mysql_history - check the whole file"$white
	head ~/.mysql_history ; echo ""
else
	echo $blu"~/.mysql_history file doesn't exist"$white
fi
if [ -e ~/.php_history ];
then
	echo $yellowintensy"[x] ~/.php_history - check the whole file"$white
	head ~/.php_history ; echo ""
else
	echo $blu"~/.php_history file doesn't exist"$white ; echo ""
fi

echo $boldred"[+] - Check SSH Dir/Files"$white
if [ -d /home/*/.ssh ];
then
	if [ -r /home/*/.ssh ];
	then
		echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/"$white
		LISTSSHHOME=`ls -ld /home/*/.ssh/ | grep -v "total"`
		echo -e "$cyan$LISTSSHHOME [READABLE] $white\n"
		ls -alh /home/*/.ssh | grep -v "total"
	else
		echo $yellowintensy"[x] Any private-key info - /home/*/.ssh/"$white
		LISTSSHHOME=`ls -ld /home/*/.ssh/ | grep -v "total"`
		echo -e "$cyan$LISTSSHHOME $white\n"
	fi
else
	:
fi

if [ -d /root/.ssh ];
then
	if [ -r /root/.ssh ];
	then
		echo $yellowintensy"[x] Any private-key info - /root/.ssh/"$white
		LISTSSHROOT=`ls -ld /root/.ssh/ | grep -v "total"`
		echo -e "$cyan$LISTSSHROOT [READABLE] $white\n"
		ls -alh /root/.ssh/ | grep -v "total"
	else
		echo $yellowintensy"[x] Any private-key info - /root/.ssh/"$white
		LISTSSHROOT=`ls -ld /root/.ssh/ |  grep -v "total"`
		echo -e "$cyan$LISTSSHROOT $white\n"
	fi
else
	:
fi

ROOTLOGIN=`grep "PermitRootLogin" /etc/ssh/sshd_config 2>/dev/null | grep -v "#" | awk '{print $2}'`
if [ "$ROOTLOGIN" ];
then
	echo $cyan"[/] Root is allowed to login via SSH"$white
	echo -e "$ROOTLOGIN\n"
else
	:
fi
echo ""
echo $boldred"[+] - Check PGP keys and Kerberos tickets"$white
PGPKEY=`ls -l /home/*/.gnupg/secring.gpgs 2>/dev/null`
if [ "$PGPKEY" ];
then
	echo $yellowintensy"[x] PGP keys"$white
	echo $cyan"$PGPKEY"$white
else
	:
fi
echo ""

Kerberos1=`ls -l /tmp/krb5.keytab 2>/dev/null`
Kerberos2=`ls -l /tmp/krb5cc_* 2>/dev/null`
if [ "$Kerberos1" ] || [ "$Kerberos2" ];
then
	echo $yellowintensy"[x] Kerberos tickets"$white
	if [ "$Kerberos1" ];
	then
		echo $cyan"$Kerberos1"$white
	else
		:
	fi

	if [ "$Kerberos2" ];
	then
		echo $cyan"$Kerberos2"$white
	else
		:
	fi
fi
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
echo $boldred"[+] - Check if anything interesting in the www directory"$white

VAR=`ls -alh /var | grep -v "total" 2>/dev/null`
if [ "$VAR" ];
then
	echo $yellowintensy"[x] Using ls -alh /var"$white
	echo -e "$VAR\n"
else
	:
fi

WWW=`ls -alh /var/www | grep -v "total" 2>/dev/null`
if [ -d /var/www ];
then
	echo $yellowintensy"[x] Using ls -alh /var/www"$white
	echo -e "$WWW\n" 
else
	:
fi

HTML=`ls -alh /var/www/html | grep -v "total" 2>/dev/null`
if [ -d /var/www/html ];
then
	echo $yellowintensy"[x] Using ls -alh /var/www/html"$white
	echo -e "$HTML"
else
	:
fi
echo ""


CONFIGDB=`find /var/ -iname config.* -type f 2>/dev/null && find /var/ -iname db.* -type f 2>/dev/null`
if [ "$CONFIGDB" ];
then
	echo $yellowintensy"[x] Search on config.* and db.* files on /var/"$white
	echo -e "$CONFIGDB"
else
	:
fi
echo ""

SUID=`find / -perm -u=s -type f 2>/dev/null`
echo $boldred"[+] - Check sticky bits, SUID and SGID"$white
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
	echo -e "$STICKY"  # Sticky bit - Only the owner of the directory or the owner of a file can delete or rename here.
else
	:
fi

echo ""

CATCHECK=`which cat 2>/dev/null`
TAILCHECK=`which tail 2>/dev/null`
HEADCHECK=`which head 2>/dev/null`
MORECHECK=`which more 2>/dev/null`
LESSCHECK=`which less 2>/dev/null`
VIMBASICCHECK=`which vim.basic 2>/dev/null`

if [ -u "$CATCHECK" ] || [ -u "$TAILCHECK" ] || [ -u "$HEADCHECK" ] || [ -u "$MORECHECK" ] || [ -u "$LESSCHECK" ] || [ -u "$VIMBASICCHECK" ];
then
	echo $boldred"[+] - Using SUIDs to read/write root files"$white
	if [ -u "$CATCHECK" ];
	then
		ACATCHECK=`ls -l $CATCHECK 2>/dev/null`
		echo $cyan"$ACATCHECK"$white
	else
		:
	fi
	if [ -u "$TAILCHECK" ];
	then
		ATAILCHECK=`ls -l $TAILCHECK 2>/dev/null`
		echo $cyan"$ATAILCHECK"$white
	else
		:
	fi
	if [ -u "$HEADCHECK" ];
	then
		AHEADCHECK=`ls -l $HEADCHECK`
		echo $cyan"$AHEADCHECK"$white
	else
		:
	fi
	if [ -u "$MORECHECK" ];
	then
		AMORECHECK=`ls -l $MORECHECK 2>/dev/null`
		echo $cyan"$AMORECHECK"$white
	else
		:
	fi
	if [ -u "$LESSCHECK" ];
	then
		ALESSCHECK=`ls -l $LESSCHECK 2>/dev/null`
		echo $cyan"$ALESSCHECK"$white
	else
		:
	fi
	if [ -u "$VIMBASICCHECK" ];
	then
		AVIMBASICCHECK=`ls -l $VIMBASICCHECK 2>/dev/null`
		echo $cyan"$AVIMBASICCHECK"$white
	else
		:
	fi
else
	:
fi
echo ""

echo $boldred"[+] - Check for written and executable places"$white
WRITABLE=`find / -perm -222 -type d 2>/dev/null`
if [ "$WRITABLE" ];
then
	echo $yellowintensy"[x] World-writeable folder - 222"$white
	echo -e "$WRITABLE\n"     # world-writeable folders
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

echo $boldred"[+] - Check for readable logfiles owned by super user"$white	
LOGFILES=`find /var/log -type f -perm -0004 -user root -exec ls -l {} \; 2>/dev/null`
if [ "$LOGFILES" ];
then
	echo $yellowintensy"[x] Sensitive logfiles - 0004"$white
	echo $cyan"$LOGFILES"$white
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
echo "man    =	!sh"
echo "nmap   =	--interactive"
echo "nmap   =	echo \"os.execute('/bin/sh')\" > /tmp/shell.nse"
echo "find   =	find / -exec /usr/bin/awk 'BEGIN {system(\"/bin/sh\")}' \;"
echo "find   =	find / -exec sh -i \;"
echo "vi     =	:!sh or :shell or -c '!sh'"
echo "vim    =	:!sh or :shell or -c '!sh'"
echo ""
}


function SoftwareVersion(){
echo $boldgrn"[-] SOFTWARES VERSION"$white
echo $boldred"[+] - Check apps and services version"$white

SUDOVER=`which sudo`
if [ "$SUDOVER" ];
then
	echo $yellowintensy"[x] Sudo version (<= 1.8.20)"$white
	sudo -V | grep -i "version" | grep "Sudo " 2>/dev/null
else
	:
fi

echo ""
MYSQLVER=`which mysql`
if [ "$MYSQLVER" ];
then
	echo $yellowintensy"[x] MYSQL version"$white
	mysql -V 2>/dev/null
else
	:
fi

echo ""
PSQL=`which psql`
if [ "$PSQL" ];
then
	echo $yellowintensy"[x] PostgreSQL version"$white
	psql -V 2>/dev/null
else
	:
fi
echo ""

APACHEVER=`which apache2`
if [ "$APACHEVER" ];
then
	echo $yellowintensy"[x] Apache version"$white
	apache2 -v 2>/dev/null
else
	:
fi
echo ""

APACHEUSER=`which apache2`
if [ "$APACHEUSER" ];
then
	echo $yellowintensy"[x] Account running under apache service"$white
	grep -i 'user\|group' /etc/apache2/envvars 2>/dev/null | awk '{sub(/.*\export /,"")}1'
else
	:
fi
echo ""
CHKROOTKIT=`which chkrootkit 2>/dev/null`
if [ "$CHKROOTKIT" ];
then
	echo $yellowintensy"[x] Chkrootkit version (< 0.50)"$white
	chkrootkit -V
else
	:
fi
echo ""

PKEXEC=`which pkexec 2>/dev/null`
if [ "$PKEXEC" ];
then
	echo $yellowintensy"[x] Pkexec version"$white
	pkexec --version
else
	:
fi
echo""

JAVA=`which java 2>/dev/null`
if [ "$JAVA" ];
then
	echo $yellowintensy"[x] Java version"$white
	java -version
else
	:
fi
echo ""

EXIM=`exim -bV 2>/dev/null`
if [ "$EXIM" ];
then
	echo $yellowintensy"[x] Exim version (<= 4.91)"$white
	echo -e "$EXIM\n"
else
	:
fi
}

function TryingAccess(){
echo $boldgrn"[-] TRYING ACCESS"$white
echo $boldred"[+] - Check for some methods for extract creds and get access as root"$white

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
echo $boldgrn" Usage   > ./postenum.sh <option>"$white
echo " Options >"
echo "	-a :	All"
echo "	-s :	Filesystem [SUID, SGID, Config/DB files, etc.]"
echo "	-l :	Shell escape and development tools"
echo "	-c :	The most interesting files"
echo "	-n :	Network settings"
echo "	-p :	Services and cron jobs"
echo "	-o :	OS informations and priv esc exploits"
echo "	-v :	Sofware's versions"
echo "	-t :	Fstab credentials and databases checker"
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
